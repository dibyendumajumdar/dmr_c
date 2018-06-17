/**
 * This is a backend code generator for dmr_C that uses
 * the JIT engine OMRJIT (https://github.com/dibyendumajumdar/nj).
 *
 * Copyright (C) 2018 Dibyendu Majumdar
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#include <assert.h>
#include <stdbool.h>
#include <stdio.h>
#include <string.h>

#include <allocate.h>
#include <dmr_c.h>
#include <expression.h>
#include <flow.h>
#include <linearize.h>
#include <port.h>
#include <symbol.h>

/*

Some Implementation Notes
=========================

1. Local variables are modelled as byte strings - the load/store ops
   take care of extracting / storing the right type of value

2. The rest are all scalar values

3. We use stack variables to simulate phi (load) and phisrc (store) op codes.
   These are also created as byte arrays but typically these are always 
   scalars - I tried using the OMR Temporary var type but this created confusion
   when trying to load/store values correctly

4. We create the blocks at the beginning based upon the blocks in
   Sparse IR - but we have to add an extra block for every CBR instruction
   as conditional branches in OMR fall through to the next block

*/


enum OMRTypeKind {
	RT_UNSUPPORTED = 0,
	RT_VOID = 1,
	RT_INT = 2,
	RT_INT8 = 3,
	RT_INT16 = 4,
	RT_INT32 = 5,
	RT_INT64 = 6,
	RT_FLOAT = 7,
	RT_DOUBLE = 8,
	RT_PTR = 9,
	RT_AGGREGATE = 10,
	RT_FUNCTION = 11
};

struct OMRType {
	enum OMRTypeKind type;
	struct OMRType *return_type;
	uint32_t bit_size;
};

static struct OMRType VoidType = {
    .type = RT_VOID, .return_type = NULL, .bit_size = 0};
static struct OMRType Int8Type = {
    .type = RT_INT8, .return_type = NULL, .bit_size = sizeof(int8_t) * 8};
static struct OMRType Int16Type = {
    .type = RT_INT16, .return_type = NULL, .bit_size = sizeof(int16_t) * 8};
static struct OMRType Int32Type = {
    .type = RT_INT32, .return_type = NULL, .bit_size = sizeof(int32_t) * 8};
static struct OMRType Int64Type = {
    .type = RT_INT64, .return_type = NULL, .bit_size = sizeof(int64_t) * 8};
static struct OMRType FloatType = {
    .type = RT_FLOAT, .return_type = NULL, .bit_size = sizeof(float) * 8};
static struct OMRType DoubleType = {
    .type = RT_DOUBLE, .return_type = NULL, .bit_size = sizeof(double) * 8};
static struct OMRType PtrType = {
    .type = RT_PTR, .return_type = NULL, .bit_size = sizeof(void *) * 8};
static struct OMRType BadType = {
    .type = RT_UNSUPPORTED, .return_type = NULL, .bit_size = 0};

struct function {
	struct dmr_C *C;
	JIT_ILInjectorRef injector;
	JIT_FunctionBuilderRef builder;
	JIT_ContextRef context;
	struct entrypoint *ep;
	struct allocator type_allocator;
	struct OMRType *return_type;
};

/* Arbitrary limit ... FIXME */
#define JIT_MaxArgs 16

static struct OMRType *alloc_OMRtype(struct function *fn,
				       enum OMRTypeKind kind,
				       unsigned int bit_size)
{
	struct OMRType *type = dmrC_allocator_allocate(&fn->type_allocator, 0);
	type->type = kind;
	type->bit_size = bit_size;
	type->return_type = NULL;
	return type;
}

static struct OMRType *int_type_by_size(struct function *fn, int size)
{
	switch (size) {
	case -1:
		return NULL;
	case 8:
		return &Int8Type;
	case 16:
		return &Int16Type;
	case 32:
		return &Int32Type;
	case 64:
		return &Int64Type;
	default:
		return alloc_OMRtype(fn, RT_INT, size);
	}
}

static struct OMRType *sym_basetype_type(struct dmr_C *C, struct function *fn,
					  struct symbol *sym,
					  struct symbol *sym_node)
{
	if (dmrC_is_float_type(C->S, sym)) {
		switch (sym->bit_size) {
		case 32:
			return &FloatType;
		case 64:
			return &DoubleType;
		default:
			fprintf(stderr, "invalid bit size %d for type %d\n",
				sym->bit_size, sym->type);
			return &BadType;
		}
	} else {
		switch (sym->bit_size) {
		case -1:
			return &VoidType;
		case 8:
			return &Int8Type;
		case 16:
			return &Int16Type;
		case 32:
			return &Int32Type;
		case 64:
			return &Int64Type;
		default:
			return alloc_OMRtype(fn, RT_INT, sym->bit_size);
		}
	}
}

static int is_aggregate_type(struct symbol *sym)
{
	if (sym->type == SYM_NODE)
		return is_aggregate_type(sym->ctype.base_type);
	switch (sym->type) {
	case SYM_UNION:
	case SYM_STRUCT:
	case SYM_ARRAY:
		return true;
	default:
		return false;
	}
}

static struct OMRType *type_to_OMRtype(struct dmr_C *C, struct function *fn,
					 struct symbol *sym,
					 struct symbol *sym_node);

static struct OMRType *get_symnode_type(struct dmr_C *C, struct function *fn,
					 struct symbol *sym)
{
	assert(sym->type == SYM_NODE);
	return type_to_OMRtype(C, fn, sym->ctype.base_type, sym);
}

static struct OMRType *get_symnode_or_basetype(struct dmr_C *C,
						struct function *fn,
						struct symbol *sym)
{
	if (sym->type == SYM_NODE) {
		assert(sym->ctype.base_type->type != SYM_NODE);
		return type_to_OMRtype(C, fn, sym->ctype.base_type, sym);
	}
	return type_to_OMRtype(C, fn, sym, NULL);
}

static struct OMRType *func_return_type(struct dmr_C *C, struct function *fn,
					 struct symbol *sym,
					 struct symbol *sym_node)
{
	return type_to_OMRtype(C, fn, sym->ctype.base_type, sym_node);
}

static struct OMRType *sym_func_type(struct dmr_C *C, struct function *fn,
				      struct symbol *sym,
				      struct symbol *sym_node)
{
	struct OMRType *ret_type;

	// TODO we probably need a better way to encode function type

	ret_type = func_return_type(C, fn, sym, sym_node);
	struct OMRType *type = alloc_OMRtype(fn, RT_FUNCTION, 0);
	type->return_type = ret_type;
	return type;
}

static struct OMRType *sym_array_type(struct dmr_C *C, struct function *fn,
				       struct symbol *sym,
				       struct symbol *sym_node)
{
	struct symbol *base_type;
	base_type = sym->ctype.base_type;
	/* empty struct is undefined [6.7.2.1(8)] */
	unsigned int array_bit_size = sym->bit_size;
	if (array_bit_size == 0 || array_bit_size == -1) {
		if (sym_node != NULL)
			array_bit_size = sym_node->bit_size;
	}
	if (base_type->bit_size == 0 || base_type->bit_size == -1 ||
	    array_bit_size == 0 || array_bit_size == -1) {
		fprintf(stderr, "array size can not be determined\n");
		return &BadType;
	}
	return alloc_OMRtype(fn, RT_AGGREGATE, array_bit_size);
}

static struct OMRType *sym_struct_type(struct dmr_C *C, struct function *fn,
					struct symbol *sym,
					struct symbol *sym_node)
{
	unsigned int bit_size = 0;
	if (sym->bit_size > 0 && sym->bit_size != -1) {
		bit_size = sym->bit_size;
	}
	return alloc_OMRtype(fn, RT_AGGREGATE, bit_size);
}

static struct OMRType *sym_ptr_type(struct dmr_C *C, struct function *fn,
				     struct symbol *sym,
				     struct symbol *sym_node)
{
	return &PtrType;
}

static struct OMRType *type_to_OMRtype(struct dmr_C *C, struct function *fn,
					 struct symbol *sym,
					 struct symbol *sym_node)
{
	assert(sym->type != SYM_NODE);
	assert(sym_node == NULL || sym_node->type == SYM_NODE);
	switch (sym->type) {
	case SYM_BITFIELD: {
		return alloc_OMRtype(fn, RT_INT, sym->bit_size);
	}
	case SYM_RESTRICT:
	case SYM_ENUM:
		return type_to_OMRtype(C, fn, sym->ctype.base_type, sym_node);
	case SYM_BASETYPE:
		return sym_basetype_type(C, fn, sym, sym_node);
	case SYM_PTR:
		return sym_ptr_type(C, fn, sym, sym_node);
	case SYM_UNION:
	case SYM_STRUCT:
		return sym_struct_type(C, fn, sym, sym_node);
	case SYM_ARRAY:
		return sym_array_type(C, fn, sym, sym_node);
	case SYM_FN:
		return sym_func_type(C, fn, sym, sym_node);
	default:
		return &BadType;
	}
}

static struct OMRType *insn_symbol_type(struct dmr_C *C, struct function *fn,
					 struct instruction *insn)
{
	if (insn->type) {
		return get_symnode_or_basetype(C, fn, insn->type);
	}
	switch (insn->size) {
	case 8:
		return &Int8Type;
	case 16:
		return &Int16Type;
	case 32:
		return &Int32Type;
	case 64:
		return &Int64Type;
	default:
		return alloc_OMRtype(fn, RT_INT, insn->size);
	}
}

static JIT_Type check_supported_argtype(struct dmr_C *C, struct symbol *sym)
{
	if (dmrC_is_ptr_type(sym))
		return JIT_Address;
	if (dmrC_is_int_type(C->S, sym)) {
		switch (sym->bit_size) {
		case 8:
			return JIT_Int8;
		case 16:
			return JIT_Int16;
		case 32:
			return JIT_Int32;
		case 64:
			return JIT_Int64;
		default:
			fprintf(stderr,
				"Unsupported type in function argument\n");
			return JIT_NoType;
		}
	} else {
		// TODO assert float type
		switch (sym->bit_size) {
		case 32:
			return JIT_Float;
		case 64:
			return JIT_Double;
		default:
			fprintf(stderr,
				"Unsupported type in function argument\n");
			return JIT_NoType;
		}
	}
	return 0;
}

static struct OMRType *check_supported_returntype(struct dmr_C *C,
						   struct OMRType *type)
{
	if (type->type == RT_AGGREGATE || type->type == RT_FUNCTION ||
	    type->type == RT_INT || type->type == RT_UNSUPPORTED ||
	    type->type == RT_VOID)
		return &BadType;
	return type;
}

static int32_t instruction_size_in_bytes(struct dmr_C *C,
					 struct instruction *insn)
{
	return insn->size / C->target->bits_in_char;
}

static JIT_Type map_OMRtype(struct OMRType *type)
{
	switch (type->type) {
	case RT_DOUBLE:
		return JIT_Double;
	case RT_FLOAT:
		return JIT_Float;
	case RT_INT8:
		return JIT_Int8;
	case RT_INT16:
		return JIT_Int16;
	case RT_INT32:
		return JIT_Int32;
	case RT_INT64:
		return JIT_Int64;
	case RT_PTR:
		return JIT_Address;
	default:
		return JIT_NoType;
	}
}

static JIT_SymbolRef OMR_alloca(struct function *fn, struct OMRType *type,
				int32_t size)
{
	// In OMR there is no explicit alloca IL I believe
	// Instead we create a local symbol of appropriate size
	// We treat all locals as byte arrays - the load/store 
	// is done at specific offsets as required
	return JIT_CreateLocalByteArray(fn->injector, (uint32_t)size);
}

static JIT_NodeRef constant_value(struct dmr_C *C, struct function *fn,
				  unsigned long long val,
				  struct OMRType *dtype)
{
	JIT_NodeRef result = NULL;

	if (dtype->type == RT_INT8) {
		result = JIT_ConstInt8((int8_t)val);
	} else if (dtype->type == RT_INT16) {
		result = JIT_ConstInt16((int16_t)val);
	} else if (dtype->type == RT_INT || dtype->type == RT_INT32) {
		result = JIT_ConstInt32((int32_t)val);
	} else if (dtype->type == RT_INT64) {
		result = JIT_ConstInt64(val);
	} else if (dtype->type == RT_PTR) {
		result = JIT_ConstAddress((void *)val);
	} else if (dtype->type == RT_DOUBLE) {
		result = JIT_ConstDouble((double)(long long)val);
	} else if (dtype->type == RT_FLOAT) {
		result = JIT_ConstFloat((float)(long long)val);
	} else {
		fprintf(stderr, "unsupported pseudo value kind %d\n",
			dtype->type);
		return NULL;
	}
	return result;
}

static JIT_NodeRef constant_fvalue(struct dmr_C *C, struct function *fn,
				   double val, struct OMRType *dtype)
{
	JIT_NodeRef result = NULL;

	if (dtype->type == RT_DOUBLE) {
		result = JIT_ConstDouble(val);
	} else if (dtype->type == RT_FLOAT) {
		result = JIT_ConstFloat((float)val);
	} else {
		fprintf(stderr, "unsupported pseudo value kind %d\n",
			dtype->type);
		return NULL;
	}
	return result;
}

/*
 * We do not support globals or aggregate locals with initializers
 */
static JIT_SymbolRef build_local(struct dmr_C *C, struct function *fn,
				 struct symbol *sym)
{
	const char *name = dmrC_show_ident(C, sym->ident);
	struct OMRType *type = get_symnode_type(C, fn, sym);
	char localname[256] = {0};
	snprintf(localname, sizeof localname, "%s_%p.", name, sym);
	if (dmrC_is_static(sym) || dmrC_is_extern(sym) ||
	    dmrC_is_toplevel(sym)) {
		return NULL;
	} else {
		if (sym->initialized && is_aggregate_type(sym)) {
			return NULL;
		}
		JIT_SymbolRef result = OMR_alloca(
		    fn, type, type->bit_size / C->target->bits_in_char);
		sym->priv = result;
		return result;
	}
}

static void build_store(struct dmr_C *C, struct function *fn, JIT_NodeRef v,
			JIT_SymbolRef symbol)
{
	JIT_ArrayStore(fn->injector, JIT_LoadAddress(fn->injector, symbol),
		       JIT_ConstInt64(0), v);
}

static JIT_SymbolRef get_sym_value(struct dmr_C *C, struct function *fn,
				   pseudo_t pseudo, bool do_init)
{
	JIT_SymbolRef result = NULL;
	struct symbol *sym = pseudo->sym;
	struct expression *expr;

	result = (JIT_SymbolRef)sym->priv;
	if (result)
		return result;

	assert(sym->bb_target == NULL);

	expr = sym->initializer;
	if (expr &&
	    (!sym->ident || (sym->ident && (expr->type == EXPR_VALUE ||
					    expr->type == EXPR_FVALUE)))) {
		switch (expr->type) {
		case EXPR_STRING: {
			dmrC_sparse_error(
			    C, expr->pos,
			    "unsupported string reference in initializer\n");
			dmrC_show_expression(C, expr);
			return NULL;
			break;
		}
		case EXPR_SYMBOL: {
			dmrC_sparse_error(
			    C, expr->pos,
			    "unresolved symbol reference in initializer\n");
			dmrC_show_expression(C, expr);
			return NULL;
			break;
		}
		case EXPR_VALUE: {
			if (dmrC_is_static(sym)) {
				dmrC_sparse_error(
				    C, expr->pos,
				    "unsupported symbol reference\n");
				dmrC_show_expression(C, expr);
				return NULL;
			}
			struct OMRType *symtype = get_symnode_type(C, fn, sym);
			if (symtype == NULL) {
				dmrC_sparse_error(C, expr->pos,
						  "invalid symbol type\n");
				dmrC_show_expression(C, expr);
				return NULL;
			}
			result = build_local(C, fn, sym);
			if (!result)
				return result;
			if (do_init) {
				JIT_NodeRef value =
				    constant_value(C, fn, expr->value, symtype);
				build_store(C, fn, value, result);
			}
			sym->priv = result;
			break;
		}
		case EXPR_FVALUE: {
			if (dmrC_is_static(sym)) {
				dmrC_sparse_error(
				    C, expr->pos,
				    "unsupported symbol reference\n");
				dmrC_show_expression(C, expr);
				return NULL;
			}
			struct OMRType *symtype = get_symnode_type(C, fn, sym);
			if (symtype == NULL) {
				dmrC_sparse_error(C, expr->pos,
						  "invalid symbol type\n");
				dmrC_show_expression(C, expr);
				return NULL;
			}
			result = build_local(C, fn, sym);
			if (!result)
				return result;
			if (do_init) {
				JIT_NodeRef value = constant_fvalue(
				    C, fn, expr->fvalue, symtype);
				build_store(C, fn, value, result);
			}
			sym->priv = result;
			break;
		}
		default:
			dmrC_sparse_error(
			    C, expr->pos,
			    "unsupported expr type in initializer: %d\n",
			    expr->type);
			dmrC_show_expression(C, expr);
			return NULL;
		}
	} else {
		const char *name = dmrC_show_ident(C, sym->ident);
		struct OMRType *type = get_symnode_type(C, fn, sym);
		if (type->type == RT_FUNCTION) {
			dmrC_sparse_error(
			    C, sym->pos,
			    "unsupported symbol reference for '%s'\n", name);
			dmrC_debug_symbol(C, sym);
			return NULL;
		} else if (dmrC_is_extern(sym) || dmrC_is_toplevel(sym)) {
			dmrC_sparse_error(
			    C, sym->pos,
			    "unsupported symbol reference for '%s'\n", name);
			dmrC_debug_symbol(C, sym);
			return NULL;
		} else {
			if (dmrC_is_static(sym)) {
				dmrC_sparse_error(
				    C, sym->pos,
				    "unsupported symbol reference for '%s'\n",
				    name);
				dmrC_debug_symbol(C, sym);
				return NULL;
			}
			if (dmrC_is_static(sym) && sym->initializer) {
				dmrC_sparse_error(C, sym->initializer->pos,
						  "unsupported initializer for "
						  "local static variable\n");
				dmrC_show_expression(C, sym->initializer);
				return NULL;
			}
			result = build_local(C, fn, sym);
			if (!result)
				return result;
			sym->priv = result;
		}
	}
	return result;
}

static JIT_NodeRef val_to_value(struct dmr_C *C, struct function *fn,
				long long value, struct symbol *ctype)
{
	switch (ctype->bit_size) {
	case 8:
		return JIT_ConstInt8((int8_t)value);
	case 16:
		return JIT_ConstInt16((int16_t)value);
	case 32:
		return JIT_ConstInt32((int32_t)value);
	case 64:
		return JIT_ConstInt64((int64_t)value);
	}
	return NULL;
}

static JIT_NodeRef pseudo_to_value(struct dmr_C *C, struct function *fn,
				   struct symbol *ctype, pseudo_t pseudo)
{
	JIT_NodeRef result = NULL;

	switch (pseudo->type) {
	case PSEUDO_REG:
		result = pseudo->priv;
		break;
	case PSEUDO_SYM: {
		JIT_SymbolRef sym = get_sym_value(C, fn, pseudo, true);
		if (!sym)
			return NULL;
		return JIT_LoadAddress(fn->injector, sym);
	}
	case PSEUDO_VAL:
		result = val_to_value(C, fn, pseudo->value, ctype);
		break;
	case PSEUDO_ARG:
		result = JIT_LoadParameter(fn->injector, pseudo->nr - 1);
		break;
	case PSEUDO_PHI:
		result = pseudo->priv;
		break;
	case PSEUDO_VOID:
		result = NULL;
		break;
	}
	if (!result) {
		fprintf(stderr, "error: no result for pseudo\n");
		return NULL;
	}
	return result;
}

static JIT_NodeRef build_cast(struct dmr_C *C, struct function *fn,
			      JIT_NodeRef val, struct OMRType *dtype,
			      int unsigned_cast)
{
	JIT_Type target_type = map_OMRtype(dtype);
	if (target_type == JIT_NoType)
		return NULL;
	if (JIT_GetNodeType(val) == target_type)
		return val;
	return JIT_ConvertTo(fn->injector, val, target_type, unsigned_cast);
}

static JIT_NodeRef output_op_phi(struct dmr_C *C, struct function *fn,
				 struct instruction *insn)
{
	JIT_SymbolRef ptr = insn->target->priv2;

	if (!ptr)
		return NULL;

	// Unlike LLVM version which creates the Load instruction
	// early on and inserts it into the IR stream here, we
	// create the Load instruction here.
	JIT_NodeRef load = NULL;
	switch (insn->size) {
	case 8:
		// TODO do we need to do unsigned here?
		// load = NJX_load_c2i(fn->builder, ptr, 0);
		load = JIT_ArrayLoad(fn->injector,
				     JIT_LoadAddress(fn->injector, ptr),
				     JIT_ConstInt64(0), JIT_Int8);
		break;
	case 16:
		// TODO do we need to do unsigned here?
		load = JIT_ArrayLoad(fn->injector,
				     JIT_LoadAddress(fn->injector, ptr),
				     JIT_ConstInt64(0), JIT_Int16);
		break;
	case 32:
		if (dmrC_is_float_type(C->S, insn->type))
			load = JIT_ArrayLoad(fn->injector,
					     JIT_LoadAddress(fn->injector, ptr),
					     JIT_ConstInt64(0), JIT_Float);
		else
			load = JIT_ArrayLoad(fn->injector,
					     JIT_LoadAddress(fn->injector, ptr),
					     JIT_ConstInt64(0), JIT_Int32);
		break;
	case 64:
		if (dmrC_is_float_type(C->S, insn->type))
			load = JIT_ArrayLoad(fn->injector,
					     JIT_LoadAddress(fn->injector, ptr),
					     JIT_ConstInt64(0), JIT_Double);
		else if (dmrC_is_ptr_type(insn->type))
			load = JIT_ArrayLoad(fn->injector,
					     JIT_LoadAddress(fn->injector, ptr),
					     JIT_ConstInt64(0), JIT_Address);
		else
			load = JIT_ArrayLoad(fn->injector,
					     JIT_LoadAddress(fn->injector, ptr),
					     JIT_ConstInt64(0), JIT_Int64);
		break;
	}
	if (load == NULL)
		return NULL;
	// JIT_GenerateTreeTop(fn->injector, load);
	insn->target->priv = load;
	return load;
}

static JIT_NodeRef output_op_load(struct dmr_C *C, struct function *fn,
				  struct instruction *insn)
{
	JIT_NodeRef ptr = pseudo_to_value(C, fn, insn->type, insn->src);

	if (!ptr)
		return NULL;
	// if (JIT_GetNodeType(ptr) == JIT_Int64)
	//	ptr = JIT_ConvertTo(fn->injector, ptr, JIT_Address, false);

	JIT_NodeRef index = JIT_ConstInt64((int64_t)insn->offset);
	JIT_NodeRef load = NULL;
	switch (insn->size) {
	case 8:
		// TODO do we need to do unsigned here?
		load = JIT_ArrayLoad(fn->injector, ptr, index, JIT_Int8);
		break;
	case 16:
		// TODO do we need to do unsigned here?
		load = JIT_ArrayLoad(fn->injector, ptr, index, JIT_Int16);
		break;
	case 32:
		if (dmrC_is_float_type(C->S, insn->type))
			load =
			    JIT_ArrayLoad(fn->injector, ptr, index, JIT_Float);
		else
			load =
			    JIT_ArrayLoad(fn->injector, ptr, index, JIT_Int32);
		break;
	case 64:
		if (dmrC_is_float_type(C->S, insn->type))
			load =
			    JIT_ArrayLoad(fn->injector, ptr, index, JIT_Double);
		else if (dmrC_is_ptr_type(insn->type))
			load = JIT_ArrayLoad(fn->injector, ptr, index,
					     JIT_Address);
		else
			load =
			    JIT_ArrayLoad(fn->injector, ptr, index, JIT_Int64);
		break;
	}
	if (load == NULL)
		return NULL;
	// JIT_GenerateTreeTop(fn->injector, load);
	insn->target->priv = load;
	return load;
}

static JIT_NodeRef output_op_store(struct dmr_C *C, struct function *fn,
				   struct instruction *insn)
{
	JIT_NodeRef ptr, target_in;
	int32_t off;

	/* int type large enough to hold a pointer */
	off = (int32_t)insn->offset;

	if (is_aggregate_type(insn->type)) {
		dmrC_sparse_error(C, insn->pos,
				  "store to aggregate type is "
				  "not yet supported, failure at "
				  "insn %s\n",
				  dmrC_show_instruction(C, insn));
		return NULL;
	}

	ptr = pseudo_to_value(C, fn, insn->type, insn->src);
	if (!ptr)
		return NULL;
	ptr = build_cast(C, fn, ptr, &PtrType, 0);

	target_in = pseudo_to_value(C, fn, insn->type, insn->target);
	if (!target_in)
		return NULL;

	JIT_NodeRef index = JIT_ConstInt64((int64_t)insn->offset);
	JIT_ArrayStore(fn->injector, ptr, index, target_in);
	return ptr;
}

static JIT_NodeRef output_op_phisrc(struct dmr_C *C, struct function *fn,
				    struct instruction *insn)
{
	JIT_NodeRef v;
	struct instruction *phi;

	assert(insn->target->priv == NULL);

	/* target = src */
	v = pseudo_to_value(C, fn, insn->type, insn->phi_src);
	if (!v)
		return NULL;

	FOR_EACH_PTR(insn->phi_users, phi)
	{
		JIT_SymbolRef ptr;

		assert(phi->opcode == OP_PHI);
		/* phi must be load from alloca */
		ptr = phi->target->priv2;
		if (!ptr)
			return NULL;
		JIT_ArrayStore(fn->injector, JIT_LoadAddress(fn->injector, ptr),
			       JIT_ConstInt64(0), v);
	}
	END_FOR_EACH_PTR(phi);
	return v;
}

/**
 * Convert the pseudo to a case_value, and cast it to the expected type of the
 * instruction. If ptrtoint is true then convert pointer values to integers.
 */
static JIT_NodeRef get_operand(struct dmr_C *C, struct function *fn,
			       struct symbol *ctype, pseudo_t pseudo,
			       bool ptrtoint, bool unsigned_cast)
{
	JIT_NodeRef target;

	struct OMRType *instruction_type =
	    get_symnode_or_basetype(C, fn, ctype);
	if (instruction_type == NULL)
		return NULL;
	target = pseudo_to_value(C, fn, ctype, pseudo);
	if (!target)
		return NULL;
	// if (ptrtoint && dmrC_is_ptr_type(ctype))
	//	target = build_cast(C, fn, target, instruction_type, 0);
	// else
	//	target =
	//	build_cast(C, fn, target, instruction_type, unsigned_cast);
	return target;
}

static struct symbol *pseudo_type(struct dmr_C *C, pseudo_t pseudo)
{
	switch (pseudo->type) {
	case PSEUDO_SYM:
	case PSEUDO_ARG:
		return pseudo->sym;
	case PSEUDO_REG:
	case PSEUDO_PHI:
		return pseudo->def->type;
	case PSEUDO_VAL:
		return C->target->size_t_ctype;
	case PSEUDO_VOID:
	default:
		return &C->S->void_ctype;
	}
}

static JIT_NodeRef output_op_cbr(struct dmr_C *C, struct function *fn,
				 struct instruction *br)
{
	JIT_NodeRef value = pseudo_to_value(C, fn, br->type, br->cond);
	if (!value)
		return NULL;
	// JIT_GenerateTreeTop(fn->injector, value);
	JIT_BlockRef true_block = JIT_GetBlock(fn->injector, br->bb_true->nr);
	JIT_BlockRef false_block = JIT_GetBlock(fn->injector, br->bb_false->nr);
	JIT_NodeRef if_node =
	    JIT_IfNotZeroValue(fn->injector, value, true_block);
	// OMR expects the code to fall through to next block here
	// which is assumed to be the else block
	// But we want to handle false block explicitly
	// During the initial scan we already accounted for extra block here
	int fallthrough_blocknum =
	    br->bb->nr + 1; // Next block is meant to be a fallthrough block
	JIT_BlockRef fallthrough_block =
	    JIT_GetBlock(fn->injector, fallthrough_blocknum);
	// Add an edge from current block to fallthrough block
	JIT_CFGAddEdge(fn->injector,
		       JIT_BlockAsCFGNode(JIT_GetCurrentBlock(fn->injector)),
		       JIT_BlockAsCFGNode(fallthrough_block));
	// Switch to fallthrough block
	JIT_SetCurrentBlock(fn->injector, fallthrough_blocknum);
	// In the fallthrough block we only need a goto
	JIT_NodeRef goto_node = JIT_Goto(fn->injector, false_block);
	return if_node;
}

static JIT_NodeRef output_op_compare(struct dmr_C *C, struct function *fn,
				     struct instruction *insn)
{
	JIT_NodeRef lhs, rhs, target = NULL;

	if (insn->src1->type == PSEUDO_VAL)
		lhs = val_to_value(C, fn, insn->src1->value,
				   pseudo_type(C, insn->src2));
	else
		lhs = pseudo_to_value(C, fn, insn->type, insn->src1);
	if (!lhs)
		return NULL;
	if (insn->src2->type == PSEUDO_VAL)
		rhs = val_to_value(C, fn, insn->src2->value,
				   pseudo_type(C, insn->src1));
	else
		rhs = pseudo_to_value(C, fn, insn->type, insn->src2);
	if (!rhs)
		return NULL;

	struct OMRType *dst_type = insn_symbol_type(C, fn, insn);
	if (!dst_type)
		return NULL;

	JIT_Type op_type = JIT_GetNodeType(lhs);

	switch (insn->opcode) {
	case OP_SET_LT:
		if (op_type == JIT_Double)
			target = JIT_CreateNode2C(OP_dcmplt, lhs, rhs);
		else if (op_type == JIT_Float)
			target = JIT_CreateNode2C(OP_fcmplt, lhs, rhs);
		else if (op_type == JIT_Int64)
			target = JIT_CreateNode2C(OP_lcmplt, lhs, rhs);
		else if (op_type == JIT_Int32)
			target = JIT_CreateNode2C(OP_icmplt, lhs, rhs);
		else if (op_type == JIT_Int16)
			target = JIT_CreateNode2C(OP_scmplt, lhs, rhs);
		else if (op_type == JIT_Int8)
			target = JIT_CreateNode2C(OP_bcmplt, lhs, rhs);
		else if (op_type == JIT_Address)
			target = JIT_CreateNode2C(OP_acmplt, lhs, rhs);
		break;
	case OP_SET_B:
		if (op_type == JIT_Double)
			target = JIT_CreateNode2C(OP_dcmplt, lhs, rhs);
		else if (op_type == JIT_Float)
			target = JIT_CreateNode2C(OP_fcmplt, lhs, rhs);
		else if (op_type == JIT_Int64)
			target = JIT_CreateNode2C(OP_lucmplt, lhs, rhs);
		else if (op_type == JIT_Int32)
			target = JIT_CreateNode2C(OP_iucmplt, lhs, rhs);
		else if (op_type == JIT_Int16)
			target = JIT_CreateNode2C(OP_sucmplt, lhs, rhs);
		else if (op_type == JIT_Int8)
			target = JIT_CreateNode2C(OP_bucmplt, lhs, rhs);
		else if (op_type == JIT_Address)
			target = JIT_CreateNode2C(OP_acmplt, lhs, rhs);
		break;
	case OP_SET_LE:
		if (op_type == JIT_Double)
			target = JIT_CreateNode2C(OP_dcmple, lhs, rhs);
		else if (op_type == JIT_Float)
			target = JIT_CreateNode2C(OP_fcmple, lhs, rhs);
		else if (op_type == JIT_Int64)
			target = JIT_CreateNode2C(OP_lcmple, lhs, rhs);
		else if (op_type == JIT_Int32)
			target = JIT_CreateNode2C(OP_icmple, lhs, rhs);
		else if (op_type == JIT_Int16)
			target = JIT_CreateNode2C(OP_scmple, lhs, rhs);
		else if (op_type == JIT_Int8)
			target = JIT_CreateNode2C(OP_bcmple, lhs, rhs);
		else if (op_type == JIT_Address)
			target = JIT_CreateNode2C(OP_acmple, lhs, rhs);
		break;
	case OP_SET_BE:
		if (op_type == JIT_Double)
			target = JIT_CreateNode2C(OP_dcmple, lhs, rhs);
		else if (op_type == JIT_Int64)
			target = JIT_CreateNode2C(OP_fcmple, lhs, rhs);
		else if (op_type == JIT_Int64)
			target = JIT_CreateNode2C(OP_lucmple, lhs, rhs);
		else if (op_type == JIT_Int32)
			target = JIT_CreateNode2C(OP_iucmple, lhs, rhs);
		else if (op_type == JIT_Int16)
			target = JIT_CreateNode2C(OP_sucmple, lhs, rhs);
		else if (op_type == JIT_Int8)
			target = JIT_CreateNode2C(OP_bucmple, lhs, rhs);
		else if (op_type == JIT_Address)
			target = JIT_CreateNode2C(OP_acmple, lhs, rhs);
		break;
	case OP_SET_GT:
		if (op_type == JIT_Double)
			target = JIT_CreateNode2C(OP_dcmpgt, lhs, rhs);
		else if (op_type == JIT_Float)
			target = JIT_CreateNode2C(OP_fcmpgt, lhs, rhs);
		else if (op_type == JIT_Int64)
			target = JIT_CreateNode2C(OP_lcmpgt, lhs, rhs);
		else if (op_type == JIT_Int32)
			target = JIT_CreateNode2C(OP_icmpgt, lhs, rhs);
		else if (op_type == JIT_Int16)
			target = JIT_CreateNode2C(OP_scmpgt, lhs, rhs);
		else if (op_type == JIT_Int8)
			target = JIT_CreateNode2C(OP_bcmpgt, lhs, rhs);
		else if (op_type == JIT_Address)
			target = JIT_CreateNode2C(OP_acmpgt, lhs, rhs);
		break;
	case OP_SET_A:
		if (op_type == JIT_Double)
			target = JIT_CreateNode2C(OP_dcmpgt, lhs, rhs);
		else if (op_type == JIT_Float)
			target = JIT_CreateNode2C(OP_fcmpgt, lhs, rhs);
		else if (op_type == JIT_Int64)
			target = JIT_CreateNode2C(OP_lucmpgt, lhs, rhs);
		else if (op_type == JIT_Int32)
			target = JIT_CreateNode2C(OP_iucmpgt, lhs, rhs);
		else if (op_type == JIT_Int16)
			target = JIT_CreateNode2C(OP_sucmpgt, lhs, rhs);
		else if (op_type == JIT_Int8)
			target = JIT_CreateNode2C(OP_bucmpgt, lhs, rhs);
		else if (op_type == JIT_Address)
			target = JIT_CreateNode2C(OP_acmpgt, lhs, rhs);
		break;
	case OP_SET_GE:
		if (op_type == JIT_Double)
			target = JIT_CreateNode2C(OP_dcmpge, lhs, rhs);
		else if (op_type == JIT_Float)
			target = JIT_CreateNode2C(OP_fcmpge, lhs, rhs);
		else if (op_type == JIT_Int64)
			target = JIT_CreateNode2C(OP_lcmpge, lhs, rhs);
		else if (op_type == JIT_Int32)
			target = JIT_CreateNode2C(OP_icmpge, lhs, rhs);
		else if (op_type == JIT_Int16)
			target = JIT_CreateNode2C(OP_scmpge, lhs, rhs);
		else if (op_type == JIT_Int8)
			target = JIT_CreateNode2C(OP_bcmpge, lhs, rhs);
		else if (op_type == JIT_Address)
			target = JIT_CreateNode2C(OP_acmpge, lhs, rhs);
		break;
	case OP_SET_AE:
		if (op_type == JIT_Double)
			target = JIT_CreateNode2C(OP_dcmpge, lhs, rhs);
		else if (op_type == JIT_Int64)
			target = JIT_CreateNode2C(OP_fcmpge, lhs, rhs);
		else if (op_type == JIT_Int64)
			target = JIT_CreateNode2C(OP_lucmpge, lhs, rhs);
		else if (op_type == JIT_Int32)
			target = JIT_CreateNode2C(OP_iucmpge, lhs, rhs);
		else if (op_type == JIT_Int16)
			target = JIT_CreateNode2C(OP_sucmpge, lhs, rhs);
		else if (op_type == JIT_Int8)
			target = JIT_CreateNode2C(OP_bucmpge, lhs, rhs);
		else if (op_type == JIT_Address)
			target = JIT_CreateNode2C(OP_acmpge, lhs, rhs);
		break;
	case OP_SET_EQ:
		if (op_type == JIT_Double)
			target = JIT_CreateNode2C(OP_dcmpeq, lhs, rhs);
		else if (op_type == JIT_Float)
			target = JIT_CreateNode2C(OP_fcmpeq, lhs, rhs);
		else if (op_type == JIT_Int64)
			target = JIT_CreateNode2C(OP_lcmpeq, lhs, rhs);
		else if (op_type == JIT_Int32)
			target = JIT_CreateNode2C(OP_icmpeq, lhs, rhs);
		else if (op_type == JIT_Int16)
			target = JIT_CreateNode2C(OP_scmpeq, lhs, rhs);
		else if (op_type == JIT_Int8)
			target = JIT_CreateNode2C(OP_bcmpeq, lhs, rhs);
		else if (op_type == JIT_Address)
			target = JIT_CreateNode2C(OP_acmpeq, lhs, rhs);
	case OP_SET_NE:
		if (op_type == JIT_Double)
			target = JIT_CreateNode2C(OP_dcmpne, lhs, rhs);
		else if (op_type == JIT_Float)
			target = JIT_CreateNode2C(OP_fcmpne, lhs, rhs);
		else if (op_type == JIT_Int64)
			target = JIT_CreateNode2C(OP_lcmpne, lhs, rhs);
		else if (op_type == JIT_Int32)
			target = JIT_CreateNode2C(OP_icmpne, lhs, rhs);
		else if (op_type == JIT_Int16)
			target = JIT_CreateNode2C(OP_scmpne, lhs, rhs);
		else if (op_type == JIT_Int8)
			target = JIT_CreateNode2C(OP_bcmpne, lhs, rhs);
		else if (op_type == JIT_Address)
			target = JIT_CreateNode2C(OP_acmpne, lhs, rhs);
		break;
	default:
		break;
	}

	insn->target->priv = target;
	return target;
}

static JIT_NodeRef output_op_binary(struct dmr_C *C, struct function *fn,
				    struct instruction *insn)
{
	JIT_NodeRef lhs, rhs, target = NULL;

	// TODO is this enough or do we need special unsigned opcodes?
	bool unsigned_op = insn->opcode == OP_MULU || insn->opcode == OP_DIVU ||
			   insn->opcode == OP_MODU;

	lhs = get_operand(C, fn, insn->type, insn->src1, 1, unsigned_op);
	if (!lhs)
		return NULL;

	rhs = get_operand(C, fn, insn->type, insn->src2, 1, unsigned_op);
	if (!rhs)
		return NULL;

	switch (insn->opcode) {
		/* Binary */
	case OP_ADD:
		switch (insn->size) {
		case 64:
			if (dmrC_is_float_type(C->S, insn->type))
				target = JIT_CreateNode2C(OP_dadd, lhs, rhs);
			else {
				if (JIT_GetNodeType(lhs) == JIT_Address)
					target = JIT_CreateNode2C(OP_aladd, lhs,
								  rhs);
				else if (JIT_GetNodeType(rhs) == JIT_Address)
					target = JIT_CreateNode2C(OP_aladd, rhs,
								  lhs);
				else
					target =
					    JIT_CreateNode2C(OP_ladd, lhs, rhs);
			}
			break;
		case 32:
			if (dmrC_is_float_type(C->S, insn->type))
				target = JIT_CreateNode2C(OP_fadd, lhs, rhs);
			else
				target = JIT_CreateNode2C(OP_iadd, lhs, rhs);
			break;
		}
		break;
	case OP_SUB:
		switch (insn->size) {
		case 64:
			if (dmrC_is_float_type(C->S, insn->type))
				target = JIT_CreateNode2C(OP_dsub, lhs, rhs);
			// FIXME handle pointer substractions
			else
				target = JIT_CreateNode2C(OP_lsub, lhs, rhs);
			break;
		case 32:
			if (dmrC_is_float_type(C->S, insn->type))
				target = JIT_CreateNode2C(OP_fsub, lhs, rhs);
			else
				target = JIT_CreateNode2C(OP_isub, lhs, rhs);
			break;
		}
		break;
	case OP_MULU:
		switch (insn->size) {
		case 64:
			if (dmrC_is_float_type(C->S, insn->type))
				target = JIT_CreateNode2C(OP_dmul, lhs, rhs);
			else
				target = JIT_CreateNode2C(OP_lumulh, lhs, rhs);
			break;
		case 32:
			if (dmrC_is_float_type(C->S, insn->type))
				target = JIT_CreateNode2C(OP_fmul, lhs, rhs);
			else
				target = JIT_CreateNode2C(OP_iumul, lhs, rhs);
			break;
		}
		break;
	case OP_MULS:
		switch (insn->size) {
		case 64:
			target = JIT_CreateNode2C(OP_lmul, lhs, rhs);
			break;
		case 32:
			target = JIT_CreateNode2C(OP_imul, lhs, rhs);
			break;
		}
		break;
	case OP_DIVU:
		switch (insn->size) {
		case 64:
			if (dmrC_is_float_type(C->S, insn->type))
				target = JIT_CreateNode2C(OP_ddiv, lhs, rhs);
			else
				target = JIT_CreateNode2C(OP_ludiv, lhs, rhs);
			break;
		case 32:
			if (dmrC_is_float_type(C->S, insn->type))
				target = JIT_CreateNode2C(OP_fdiv, lhs, rhs);
			else
				target = JIT_CreateNode2C(OP_iudiv, lhs, rhs);
			break;
		}
		break;
	case OP_DIVS:
		switch (insn->size) {
		case 64:
			target = JIT_CreateNode2C(OP_ldiv, lhs, rhs);
			break;
		case 32:
			target = JIT_CreateNode2C(OP_idiv, lhs, rhs);
			break;
		}
		break;

	case OP_MODS:
	case OP_MODU:
		assert(!dmrC_is_float_type(C->S, insn->type));
		switch (insn->size) {
		case 64:
			target = JIT_CreateNode2C(OP_lrem, lhs, rhs);
			break;
		case 32:
			target = JIT_CreateNode2C(OP_irem, lhs, rhs);
			break;
		}
		break;
	case OP_SHL:
		assert(!dmrC_is_float_type(C->S, insn->type));
		switch (insn->size) {
		case 64:
			target = JIT_CreateNode2C(OP_lshl, lhs, rhs);
			break;
		case 32:
			target = JIT_CreateNode2C(OP_ishl, lhs, rhs);
			break;
		}
		break;
	case OP_LSR:
		assert(!dmrC_is_float_type(C->S, insn->type));
		switch (insn->size) {
		case 64:
			target = JIT_CreateNode2C(OP_lshr, lhs, rhs);
			break;
		case 32:
			target = JIT_CreateNode2C(OP_ishr, lhs, rhs);
			break;
		}
		break;
	case OP_ASR:
		assert(!dmrC_is_float_type(C->S, insn->type));
		switch (insn->size) {
		case 64:
			target = JIT_CreateNode2C(OP_lshr, lhs, rhs);
			break;
		case 32:
			target = JIT_CreateNode2C(OP_ishr, lhs, rhs);
			break;
		}
		break;

		/* Logical */
	case OP_AND:
		assert(!dmrC_is_float_type(C->S, insn->type));
		switch (insn->size) {
		case 64:
			target = JIT_CreateNode2C(OP_land, lhs, rhs);
			break;
		case 32:
			target = JIT_CreateNode2C(OP_iand, lhs, rhs);
			break;
		}
		break;
	case OP_OR:
		assert(!dmrC_is_float_type(C->S, insn->type));
		switch (insn->size) {
		case 64:
			target = JIT_CreateNode2C(OP_lor, lhs, rhs);
			break;
		case 32:
			target = JIT_CreateNode2C(OP_ior, lhs, rhs);
			break;
		}
		break;
	case OP_XOR:
		assert(!dmrC_is_float_type(C->S, insn->type));
		switch (insn->size) {
		case 64:
			target = JIT_CreateNode2C(OP_lxor, lhs, rhs);
			break;
		case 32:
			target = JIT_CreateNode2C(OP_ixor, lhs, rhs);
			break;
		}
		break;
	case OP_AND_BOOL: {
		// NJXLInsRef lhs_nz, rhs_nz;
		// struct OMRType *dst_type;

		// lhs_nz = is_neq_zero(C, fn, lhs);
		// rhs_nz = is_neq_zero(C, fn, rhs);
		// switch (insn->size) {
		// case 64:
		//	target = NJX_andq(fn->builder, lhs_nz, rhs_nz);
		//	break;
		// case 1:
		// case 32:
		//	target = NJX_andi(fn->builder, lhs_nz, rhs_nz);
		//	break;
		//}
		// if (!target)
		//	return NULL;
		// dst_type = insn_symbol_type(C, fn, insn);
		// if (!dst_type)
		//	return NULL;
		// target = build_cast(C, fn, target, dst_type, 1);
		break;
	}
	case OP_OR_BOOL: {
		// NJXLInsRef lhs_nz, rhs_nz;
		// struct OMRType *dst_type;

		// lhs_nz = is_neq_zero(C, fn, lhs);
		// rhs_nz = is_neq_zero(C, fn, rhs);
		// switch (insn->size) {
		// case 64:
		//	target = NJX_orq(fn->builder, lhs_nz, rhs_nz);
		//	break;
		// case 1:
		// case 32:
		//	target = NJX_ori(fn->builder, lhs_nz, rhs_nz);
		//	break;
		//}
		// if (!target)
		//	return NULL;
		// dst_type = insn_symbol_type(C, fn, insn);
		// if (!dst_type)
		//	return NULL;
		// target = build_cast(C, fn, target, dst_type, 1);
		break;
	}
	}
	insn->target->priv = target;

	return target;
}

#if 0


static NJXLInsRef truncate_intvalue(struct dmr_C *C, struct function *fn,
				    NJXLInsRef val, struct OMRType *dtype,
				    int unsigned_cast)
{
	if (NJX_is_q(val) && dtype->bit_size <= 64) {
		if (dtype->bit_size == 64)
			return val;
		uint64_t mask = (1ULL << dtype->bit_size) - 1;
		return NJX_andq(fn->builder, val, NJX_immq(fn->builder, mask));
	} else if (NJX_is_i(val) && dtype->bit_size <= 32) {
		if (dtype->bit_size == 32)
			return val;
		uint32_t mask = (1U << dtype->bit_size) - 1;
		return NJX_andi(fn->builder, val, NJX_immi(fn->builder, mask));
	} else {
		return NULL;
	}
}


static struct symbol *get_function_basetype(struct symbol *type)
{
	if (type->type == SYM_PTR)
		type = type->ctype.base_type;
	assert(type->type == SYM_FN);
	return type;
}

static NJXLInsRef output_op_call(struct dmr_C *C, struct function *fn,
				 struct instruction *insn)
{
	NJXLInsRef target;
	int n_arg = 0, i;
	struct pseudo *arg;
	NJXLInsRef *args;

	n_arg = ptrlist_size((struct ptr_list *)insn->arguments);
	args = alloca(n_arg * sizeof(NJXLInsRef));
	struct symbol *ftype = get_function_basetype(insn->fntype);

	i = 0;
	FOR_EACH_PTR(insn->arguments, arg)
	{
		NJXLInsRef value;
		struct symbol *atype;

		atype = dmrC_get_nth_symbol(ftype->arguments, i);
		value = NULL;
		if (arg->type == PSEUDO_VAL) {
			/* Value pseudos do not have type information. */
			/* Use the function prototype to get the type. */
			if (atype)
				value = val_to_value(C, fn, arg->value, atype);
			else {
				struct OMRType *type = int_type_by_size(fn, arg->size);
				if (!type) {
					dmrC_sparse_error(C, insn->pos, "pseudo value argument[%d] = %lld has invalid size %d\n", i + 1, arg->value, arg->size);
				}
				else {
					value = constant_value(C, fn, arg->value, type);
				}
			}
		}
		else {
			value = pseudo_to_value(C, fn, atype, arg);
		}
		if (!value)
			return NULL;
		if (atype) {
			struct OMRType *argtype =
			    get_symnode_type(C, fn, atype);
			if (!argtype)
				return NULL;
			value = build_cast(C, fn, value, argtype, 0);
			if (!value)
				return NULL;
		}
		args[i++] = value;
	}
	END_FOR_EACH_PTR(arg);

	if (insn->func->type != PSEUDO_SYM) {
		return NULL;
	}

	struct symbol *sym = insn->func->sym;
	const char *name = dmrC_show_ident(C, sym->ident);
	struct OMRType *type = get_symnode_type(C, fn, sym);
	if (type->type != RT_FUNCTION) {
		return NULL;
	}
	switch (type->return_type->type) {
	case RT_INT:
	case RT_INT32:
		target =
		    NJX_calli(fn->builder, name, NJX_CALLABI_CDECL, i, args);
		break;
	case RT_DOUBLE:
		target =
		    NJX_calld(fn->builder, name, NJX_CALLABI_CDECL, i, args);
		break;
	case RT_FLOAT:
		target =
		    NJX_callf(fn->builder, name, NJX_CALLABI_CDECL, i, args);
		break;
	case RT_INT64:
	case RT_PTR:
		target =
		    NJX_callq(fn->builder, name, NJX_CALLABI_CDECL, i, args);
		break;
	case RT_VOID:
		target =
		    NJX_callv(fn->builder, name, NJX_CALLABI_CDECL, i, args);
		break;
	default:
		return NULL;
	}

	insn->target->priv = target;

	return target;
}


static NJXLInsRef is_eq_zero(struct dmr_C *C, struct function *fn,
			     NJXLInsRef value)
{
	NJXLInsRef cond = NULL;
	if (NJX_is_i(value)) {
		cond = NJX_eqi(fn->builder, value, NJX_immi(fn->builder, 0));
	} else if (NJX_is_q(value)) {
		cond = NJX_eqq(fn->builder, value, NJX_immq(fn->builder, 0));
	} else if (NJX_is_d(value)) {
		cond = NJX_eqd(fn->builder, value, NJX_immd(fn->builder, 0));
	} else if (NJX_is_f(value)) {
		cond = NJX_eqf(fn->builder, value, NJX_immf(fn->builder, 0));
	}
	if (cond == NULL)
		return NULL;
	return cond;
}

static NJXLInsRef is_neq_zero(struct dmr_C *C, struct function *fn,
			      NJXLInsRef value)
{
	NJXLInsRef cond = is_eq_zero(C, fn, value);
	if (cond == NULL)
		return NULL;
	return is_eq_zero(C, fn, cond);
}



static NJXLInsRef output_op_setval(struct dmr_C *C, struct function *fn,
				   struct instruction *insn)
{
	struct expression *expr = insn->val;
	struct OMRType *const_type;
	NJXLInsRef target = NULL;

	if (!expr)
		return NULL;

	const_type = insn_symbol_type(C, fn, insn);
	if (!const_type)
		return NULL;

	switch (expr->type) {
	case EXPR_FVALUE:
		target = constant_fvalue(C, fn, expr->fvalue, const_type);
		break;
	default:
		dmrC_sparse_error(C, insn->pos,
				  "unsupported expression type %d in setval\n",
				  expr->type);
		dmrC_show_expression(C, expr);
		return NULL;
	}

	insn->target->priv = target;

	return target;
}

static NJXLInsRef output_op_symaddr(struct dmr_C *C, struct function *fn,
				    struct instruction *insn)
{
	NJXLInsRef res, src;
	struct OMRType *dtype;

	src = pseudo_to_value(C, fn, insn->type, insn->symbol);
	if (!src)
		return NULL;

	dtype = get_symnode_or_basetype(C, fn, insn->type);
	if (!dtype)
		return NULL;

	res = build_cast(C, fn, src, dtype, 0);
	insn->target->priv = res;

	return res;
}

static NJXLInsRef output_op_not(struct dmr_C *C, struct function *fn,
				struct instruction *insn)
{
	NJXLInsRef src, target;

	src = pseudo_to_value(C, fn, insn->type, insn->src);
	if (!src)
		return NULL;

	target = NULL;
	switch (insn->size) {
	case 64:
		target = NJX_notq(fn->builder, src);
		break;
	case 32:
		target = NJX_noti(fn->builder, src);
		break;
	}
	insn->target->priv = target;

	return target;
}

static NJXLInsRef output_op_neg(struct dmr_C *C, struct function *fn,
				struct instruction *insn)
{
	NJXLInsRef src, target;

	src = pseudo_to_value(C, fn, insn->type, insn->src);
	if (!src)
		return NULL;

	target = NULL;
	if (dmrC_is_float_type(C->S, insn->type)) {
		switch (insn->size) {
		case 64:
			target = NJX_negd(fn->builder, src);
			break;
		case 32:
			target = NJX_negf(fn->builder, src);
			break;
		}
	} else {
		switch (insn->size) {
		case 64:
			target = NJX_negq(fn->builder, src);
			break;
		case 32:
			target = NJX_negi(fn->builder, src);
			break;
		}
	}
	insn->target->priv = target;

	return target;
}



/*
 * For now we emit a switch statement as if it is a bunch
 * of if/elseif/else branches. OMRJIT supports a simple jump table
 * instruction but this is not yet used as a) it requires case values
 * to be consecutive, starting from 0, and b) default case has to
 * be handled separately. In future we should emit a jump table when
 * possible as the current approach penalises case values that appear
 * later.
 */
static NJXLInsRef output_op_switch(struct dmr_C *C, struct function *fn,
				   struct instruction *insn)
{
	NJXLInsRef switch_value;
	struct basic_block *default_bb = NULL;
	struct multijmp *jmp;
	int n_jmp = 0;

	FOR_EACH_PTR(insn->multijmp_list, jmp)
	{
		if (jmp->begin <= jmp->end) { /* case M..N */
			n_jmp += (int)(jmp->end - jmp->begin) + 1;
		} else /* default case */
			default_bb = jmp->target;
	}
	END_FOR_EACH_PTR(jmp);

	switch_value = pseudo_to_value(C, fn, insn->type, insn->target);
	if (!switch_value)
		return NULL;

	FOR_EACH_PTR(insn->multijmp_list, jmp)
	{
		long long val;
		for (val = jmp->begin; val <= jmp->end; val++) {
			/*
			 * For each case case_value emit
			 * if (switch_value == case_value) goto case_block;
			 */
			struct OMRType *symtype =
			    get_symnode_or_basetype(C, fn, insn->type);
			NJXLInsRef case_value =
			    constant_value(C, fn, val, symtype);
			NJXLInsRef cond = NULL;
			if (NJX_is_i(case_value)) {
				cond = NJX_eqi(fn->builder, case_value,
					       switch_value);
			} else if (NJX_is_q(case_value)) {
				cond = NJX_eqq(fn->builder, case_value,
					       switch_value);
			}
			if (cond == NULL)
				return NULL;
			// Mark phi allocas needed by destination BB as live
			// we should only output if dest bb precedes current bb
			if (insn->bb->nr > jmp->target->nr)
				output_liveness(C, fn, jmp->target);
			NJXLInsRef br1 = NJX_cbr_true(fn->builder, cond,
						      NULL); // jmp->target
			// It appears that OMRJIT may decide jump isn't
			// necessary
			if (br1 != NULL) {
				add_jump_instruction(C, fn, jmp->target, br1);
			}
		}
	}
	END_FOR_EACH_PTR(jmp);

	if (default_bb) {
		// Handle default case
		// Mark registers needed by destination BB as live
		// we should only output if dest bb precedes
		// current bb
		if (insn->bb->nr > default_bb->nr)
			output_liveness(C, fn, default_bb);
		NJXLInsRef default_br = NJX_br(fn->builder, NULL);
		add_jump_instruction(C, fn, default_bb, default_br);
	}
	// We need to return some non NULL value
	// So here we return the switch_value
	return switch_value;
}



static NJXLInsRef output_op_sel(struct dmr_C *C, struct function *fn,
				struct instruction *insn)
{
	NJXLInsRef target, src1, src2, src3;

	src1 = pseudo_to_value(C, fn, insn->type, insn->src1);
	if (!src1)
		return NULL;
	src1 = is_eq_zero(C, fn, src1);
	if (!src1)
		return NULL;

	src2 = get_operand(C, fn, insn->type, insn->src2, 0, 0);
	if (!src2)
		return NULL;
	src3 = get_operand(C, fn, insn->type, insn->src3, 0, 0);
	if (!src3)
		return NULL;

	// As we compare to 0 above we have to flip the branches
	target = NJX_choose(fn->builder, src1, src3, src2, true);

	insn->target->priv = target;
	return target;
}


static NJXLInsRef output_op_fpcast(struct dmr_C *C, struct function *fn,
				   struct instruction *insn)
{
	NJXLInsRef src, target;
	struct OMRType *dtype;
	struct symbol *otype = insn->orig_type;

	src = insn->src->priv;
	if (!src)
		src = pseudo_to_value(C, fn, insn->type, insn->src);
	if (!src)
		return NULL;

	dtype = insn_symbol_type(C, fn, insn);
	if (!dtype)
		return NULL;

	target = build_cast(C, fn, src, dtype, !dmrC_is_signed_type(otype));
	insn->target->priv = target;

	return target;
}

#endif

static JIT_NodeRef output_op_ptrcast(struct dmr_C *C, struct function *fn,
				     struct instruction *insn)
{
	JIT_NodeRef src, target;
	struct OMRType *dtype;
	struct symbol *otype = insn->orig_type;

	assert(dmrC_is_ptr_type(insn->type));

	src = insn->src->priv;
	if (!src)
		src = get_operand(C, fn, otype, insn->src, 1, 0);
	if (!src)
		return NULL;

	dtype = insn_symbol_type(C, fn, insn);
	if (!dtype)
		return NULL;

	target = build_cast(C, fn, src, dtype, false);
	insn->target->priv = target;

	return target;
}

static JIT_NodeRef output_op_cast(struct dmr_C *C, struct function *fn,
				  struct instruction *insn, bool unsignedcast)
{
	JIT_NodeRef src, target;
	struct OMRType *dtype;
	struct symbol *otype = insn->orig_type;

	if (dmrC_is_ptr_type(insn->type)) {
		return output_op_ptrcast(C, fn, insn);
	}

	src = insn->src->priv;
	if (!src)
		src = pseudo_to_value(C, fn, insn->type, insn->src);
	if (dmrC_is_int_type(C->S, otype)) {
		struct OMRType *stype = get_symnode_or_basetype(C, fn, otype);
		src = build_cast(C, fn, src, stype, unsignedcast);
	}
	if (!src)
		return NULL;

	assert(!dmrC_is_float_type(C->S, insn->type));

	dtype = insn_symbol_type(C, fn, insn);
	if (!dtype)
		return NULL;
	target = build_cast(C, fn, src, dtype, unsignedcast);
	insn->target->priv = target;

	return target;
}

static JIT_NodeRef output_op_ret(struct dmr_C *C, struct function *fn,
				 struct instruction *insn)
{
	pseudo_t pseudo = insn->src;

	if (pseudo && pseudo != VOID_PSEUDO(C)) {
		JIT_NodeRef result = pseudo_to_value(C, fn, insn->type, pseudo);
		if (!result)
			return NULL;
		return JIT_ReturnValue(fn->injector, result);
	} else
		return JIT_ReturnNoValue(fn->injector);
}

static JIT_NodeRef output_op_br(struct dmr_C *C, struct function *fn,
				struct instruction *br)
{
	JIT_BlockRef target_block = JIT_GetBlock(fn->injector, br->bb_true->nr);
	return JIT_Goto(fn->injector, target_block);
}

/* return 1 on success, 0 on failure */
static int output_insn(struct dmr_C *C, struct function *fn,
		       struct instruction *insn)
{
	JIT_NodeRef v = NULL;
	switch (insn->opcode) {
	case OP_RET:
		v = output_op_ret(C, fn, insn);
		break;
	case OP_BR:
		v = output_op_br(C, fn, insn);
		break;
	case OP_CBR:
		v = output_op_cbr(C, fn, insn);
		break;
	case OP_PHISOURCE:
		v = output_op_phisrc(C, fn, insn);
		break;
	case OP_PHI:
		v = output_op_phi(C, fn, insn);
		break;
	case OP_LOAD:
		v = output_op_load(C, fn, insn);
		break;
	case OP_SYMADDR:
		// v = output_op_symaddr(C, fn, insn);
		return 0;
		break;
	case OP_SETVAL:
		// v = output_op_setval(C, fn, insn);
		return 0;
		break;

	case OP_SWITCH:
		// v = output_op_switch(C, fn, insn);
		return 0;
		break;

	case OP_COMPUTEDGOTO:
		dmrC_sparse_error(C, insn->pos,
				  "computed goto is not supported\n");
		return 0;

	case OP_LNOP:
		return 0;

	case OP_STORE:
		v = output_op_store(C, fn, insn);
		break;

	case OP_SNOP:
		return 0;

	case OP_CALL:
		// v = output_op_call(C, fn, insn);
		return 0;
		break;
	case OP_CAST:
		v = output_op_cast(C, fn, insn, true);
		break;
	case OP_SCAST:
		v = output_op_cast(C, fn, insn, false);
		break;
	case OP_FPCAST:
		// v = output_op_fpcast(C, fn, insn);
		return 0;
		break;
	case OP_PTRCAST:
		v = output_op_ptrcast(C, fn, insn);
		break;

	case OP_ADD:
	case OP_SUB:
	case OP_MULU:
	case OP_MULS:
	case OP_DIVU:
	case OP_DIVS:
	case OP_MODU:
	case OP_MODS:
	case OP_SHL:
	case OP_LSR:
	case OP_ASR:
	case OP_AND:
	case OP_OR:
	case OP_XOR:
	case OP_AND_BOOL:
	case OP_OR_BOOL:
		v = output_op_binary(C, fn, insn);
		break;

	case OP_SET_EQ:
	case OP_SET_NE:
	case OP_SET_LE:
	case OP_SET_GE:
	case OP_SET_LT:
	case OP_SET_GT:
	case OP_SET_B:
	case OP_SET_A:
	case OP_SET_BE:
	case OP_SET_AE:
		v = output_op_compare(C, fn, insn);
		break;

	case OP_SEL:
		// v = output_op_sel(C, fn, insn);
		return 0;
		break;

	case OP_SLICE:
		return 0;

	case OP_NOT:
		// v = output_op_not(C, fn, insn);
		return 0;
		break;

	case OP_NEG:
		// v = output_op_neg(C, fn, insn);
		return 0;
		break;

	case OP_CONTEXT:
	case OP_RANGE:
	case OP_NOP:
	case OP_ASM:
		return 0;

	default:
		return 1;
	}

	if (v == NULL)
		dmrC_sparse_error(C, insn->pos,
				  "failed to output instruction %s\n",
				  dmrC_show_instruction(C, insn));
	return v != NULL;
}

/* return 1 on success, 0 on failure */
static int output_bb(struct dmr_C *C, struct function *fn,
		     struct basic_block *bb)
{
	struct instruction *insn;

	JIT_SetCurrentBlock(fn->injector, bb->nr);
	FOR_EACH_PTR(bb->insns, insn)
	{
		if (!insn->bb)
			continue;

		// Useful for debugging
		//fprintf(stderr, "Instruction %s\n",
		//	dmrC_show_instruction(C, insn));

		if (!output_insn(C, fn, insn)) {
			dmrC_sparse_error(C, insn->pos, "failed to output %s\n",
					  dmrC_show_instruction(C, insn));
			return 0;
		}
	}
	END_FOR_EACH_PTR(insn);

	return 1;
}

static bool JIT_ILBuilderImpl(JIT_ILInjectorRef injector, void *userdata)
{
	struct function *fn = (struct function *)userdata;
	struct entrypoint *ep = fn->ep;
	struct dmr_C *C = fn->C;
	struct basic_block *bb;
	pseudo_t pseudo;

	fn->injector = injector;

	unsigned int bbnr = 0;
	/* create the BBs */
	FOR_EACH_PTR(ep->bbs, bb)
	{
		bool saw_cbr = false;
		struct instruction *insn;
		/* allocate alloca for each phi */
		FOR_EACH_PTR(bb->insns, insn)
		{
			if (!insn->bb || insn->opcode != OP_CBR)
				continue;
			saw_cbr = true;
			break;
		}
		END_FOR_EACH_PTR(insn);
		/* The bb->nr field is not used by the
		frontend anymore so we can use it to
		decide which the order of basic blocks.
		*/
		bb->nr = bbnr++;
		if (saw_cbr)
			bbnr++; /* Allow an extra block here because of the way
				   OMR does conditional branching (see cbr gen) */
	}
	END_FOR_EACH_PTR(bb);

	/* Number of basic blocks we need - complicated by how OMRJIT handles
	 * branching */
	JIT_CreateBlocks(fn->injector, bbnr);
	/* create the BBs */
	FOR_EACH_PTR(ep->bbs, bb)
	{
		struct instruction *insn;
		/* allocate alloca for each phi */
		FOR_EACH_PTR(bb->insns, insn)
		{
			if (!insn->bb || insn->opcode != OP_PHI)
				continue;
			/* insert alloca into entry block */

			JIT_SymbolRef ptr =
			    OMR_alloca(fn, insn_symbol_type(fn->C, fn, insn),
				       instruction_size_in_bytes(fn->C, insn));
			if (!ptr)
				goto Efailed;

			// Unlike the Sparse LLVM version we
			// save the pointer here and perform the load
			// when we encounter the PHI instruction
			// The LLVM version generates the Load instruction
			// but doesn't insert it into the IR at this point.
			// But in OMRjit it seems we cannot do that - i.e.
			// the instruction gets inserted into the IR stream
			insn->target->priv2 = ptr;
			insn->target->priv = NULL;
		}
		END_FOR_EACH_PTR(insn);
	}
	END_FOR_EACH_PTR(bb);

	/* Try to do allocas for all the symbols up front */
	FOR_EACH_PTR(ep->accesses, pseudo)
	{
		if (pseudo->type == PSEUDO_SYM) {
			if (dmrC_is_extern(pseudo->sym) ||
			    dmrC_is_static(pseudo->sym) ||
			    dmrC_is_toplevel(pseudo->sym))
				continue;
			if (!get_sym_value(C, fn, pseudo, false))
				goto Efailed;
		}
	}
	END_FOR_EACH_PTR(arg);

	FOR_EACH_PTR(ep->bbs, bb)
	{
		if (!output_bb(C, fn, bb)) {
			goto Efailed;
		}
	}
	END_FOR_EACH_PTR(bb);
	return true;

Efailed:
	return false;
}

static bool output_fn(struct dmr_C *C, JIT_ContextRef module,
		      struct entrypoint *ep)
{
	bool success = false;
	struct symbol *sym = ep->name;
	struct symbol *base_type = sym->ctype.base_type;
	struct symbol *ret_type = sym->ctype.base_type->ctype.base_type;
	struct function function;
	const char *name;
	struct symbol *arg;
	int nr_args = 0;

	memset(&function, 0, sizeof function);
	function.C = C;
	function.context = module;
	function.ep = ep;
	if (base_type->variadic) {
		fprintf(stderr, "Variadic functions are not supported\n");
		return false;
	}

	dmrC_allocator_init(&function.type_allocator, "OMRtypes",
			    sizeof(struct OMRType),
			    __alignof__(struct OMRType), CHUNK);

	JIT_FunctionParameter argtypes[JIT_MaxArgs];

	FOR_EACH_PTR(base_type->arguments, arg)
	{
		struct symbol *arg_base_type = arg->ctype.base_type;
		if (nr_args >= JIT_MaxArgs) {
			fprintf(stderr, "Only upto %d arguments supported\n",
				JIT_MaxArgs);
			goto Ereturn;
		}
		argtypes[nr_args].name = "";
		argtypes[nr_args].type =
		    check_supported_argtype(C, arg_base_type);
		if (argtypes[nr_args].type == JIT_NoType) // Unsupported
			goto Ereturn;
		nr_args++;
	}
	END_FOR_EACH_PTR(arg);

	name = dmrC_show_ident(C, sym->ident);

	struct OMRType *function_type =
	    type_to_OMRtype(C, &function, ret_type, NULL);
	function.return_type = check_supported_returntype(C, function_type);
	if (function.return_type == &BadType) {
		fprintf(stderr, "Function '%s' has unsupported return type\n",
			name);
		goto Ereturn;
	}

	JIT_Type freturn = map_OMRtype(function.return_type);

	function.builder =
	    JIT_CreateFunctionBuilder(module, name, freturn, nr_args, argtypes,
				      JIT_ILBuilderImpl, &function);

	void *p = JIT_Compile(function.builder);
	if (p)
		success = true;

	JIT_DestroyFunctionBuilder(function.builder);

Ereturn:
	dmrC_allocator_destroy(&function.type_allocator);

	return success;
}

static int is_prototype(struct symbol *sym)
{
	if (sym->type == SYM_NODE)
		sym = sym->ctype.base_type;
	return sym && sym->type == SYM_FN && !sym->stmt;
}

/* returns 1 on success, 0 on failure */
static int compile(struct dmr_C *C, JIT_ContextRef module,
		   struct symbol_list *list)
{
	struct symbol *sym;

	FOR_EACH_PTR(list, sym)
	{
		struct entrypoint *ep;
		dmrC_expand_symbol(C, sym);

		if (is_prototype(sym)) {
			continue;
		}

		ep = dmrC_linearize_symbol(C, sym);
		if (ep) {
			if (!output_fn(C, module, ep))
				return 0;
		} else {
			fprintf(stderr, "Global data is not supported\n");
			return 0;
		}
	}
	END_FOR_EACH_PTR(sym);

	return 1;
}

bool dmrC_omrcompile(int argc, char **argv, JIT_ContextRef module,
		     const char *inputbuffer)
{
	struct string_list *filelist = NULL;
	struct symbol_list *symlist;
	char *file;

	struct dmr_C *C = new_dmr_C();
	C->optimize = 0; /* Sparse simplifications result in incorrect IR */
	C->codegen = 1;  /* Disables macros related to vararg processing */

	symlist = dmrC_sparse_initialize(C, argc, argv, &filelist);

	int rc = 0;
	if (compile(C, module, symlist)) {
		/* We need ->phi_users */
		/* This flag enables call to dmrC_track_pseudo_death() in
		linearize.c which sets
		phi_users list on PHISOURCE instructions  */
		C->dbg_dead = 1;
		FOR_EACH_PTR(filelist, file)
		{
			symlist = dmrC_sparse(C, file);
			if (C->die_if_error) {
				rc = 1;
				break;
			}
			if (!compile(C, module, symlist)) {
				rc = 1;
				break;
			}
		}
		END_FOR_EACH_PTR(file);
		if (inputbuffer && rc == 0) {
			char *buffer = strdup(inputbuffer);
			if (!buffer)
				rc = 1;
			else {
				symlist =
				    dmrC_sparse_buffer(C, "buffer", buffer, 0);
				free(buffer);
				if (C->die_if_error) {
					rc = 1;
				} else if (!compile(C, module, symlist)) {
					rc = 1;
				}
			}
		}
	} else
		rc = 1;

	if (rc == 1) {
		fprintf(stderr, "Failed to compile given inputs\n");
	}
	destroy_dmr_C(C);

	return rc == 0;
}