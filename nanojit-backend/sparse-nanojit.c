/**
 * This is a backend code generator for dmr_C that uses
 * the JIT engine NanoJIT (https://github.com/dibyendumajumdar/nanojit).
 *
 * Copyright (C) 2017 Dibyendu Majumdar
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
 * The maximum number of jumps we can handle in a single
 * function. This is just a memory allocation issue.
 */
#define MAX_JMP_INSTRUCTIONS 100
#define MAX_LOCAL_VARS 255

struct jmp_target {
	struct basic_block *bb;
	NJXLInsRef jmp_instruction;
};

enum NanoTypeKind {
	RT_UNSUPPORTED = 0,
	RT_VOID = 1,
	RT_INT = 2,
	RT_INT32 = 3,
	RT_INT64 = 4,
	RT_FLOAT = 5,
	RT_DOUBLE = 6,
	RT_PTR = 7,
	RT_AGGREGATE = 8,
	RT_FUNCTION = 9,
};

struct NanoType {
	enum NanoTypeKind type;
	struct NanoType *return_type;
	uint32_t bit_size;
};

static struct NanoType VoidType = {
    .type = RT_VOID, .return_type = NULL, .bit_size = 0};
static struct NanoType Int32Type = {
    .type = RT_INT32, .return_type = NULL, .bit_size = sizeof(int32_t) * 8};
static struct NanoType Int64Type = {
    .type = RT_INT64, .return_type = NULL, .bit_size = sizeof(int64_t) * 8};
static struct NanoType FloatType = {
    .type = RT_FLOAT, .return_type = NULL, .bit_size = sizeof(float) * 8};
static struct NanoType DoubleType = {
    .type = RT_DOUBLE, .return_type = NULL, .bit_size = sizeof(double) * 8};
static struct NanoType PtrType = {
    .type = RT_PTR, .return_type = NULL, .bit_size = sizeof(void *) * 8};
static struct NanoType BadType = {
    .type = RT_UNSUPPORTED, .return_type = NULL, .bit_size = 0};

struct function {
	NJXFunctionBuilderRef builder;
	NJXContextRef context;
	struct allocator type_allocator;
	NJXLInsRef args[NJXMaxArgs];
	struct NanoType *return_type;
	struct jmp_target jumps[MAX_JMP_INSTRUCTIONS];
	NJXLInsRef locals[MAX_LOCAL_VARS]; // We need a list of locals to be
					   // able to set liveness
};

/*
 * We need to note any jump instructions we get as we do not yet have the label
 * instruction to set the target of the jump. The labels are created as each
 * basic block is processed. At the end of code generation, the resolve_jump()
 * function below is called to set the target for each jump.
 */
static bool add_jump_instruction(struct function *fn, struct basic_block *bb,
				 NJXLInsRef ins)
{
	assert(ins);
	for (int i = 0; i < MAX_JMP_INSTRUCTIONS; i++) {
		if (fn->jumps[i].bb == NULL) {
			fn->jumps[i].bb = bb;
			fn->jumps[i].jmp_instruction = ins;
			return true;
		}
	}
	return false;
}

static bool resolve_jumps(struct function *fn)
{
	for (int i = 0; i < MAX_JMP_INSTRUCTIONS; i++) {
		if (fn->jumps[i].bb != NULL) {
			NJXLInsRef target = fn->jumps[i].bb->priv;
			if (!target)
				return false;
			NJXLInsRef insn = fn->jumps[i].jmp_instruction;
			assert(insn);
			NJX_set_jmp_target(insn, target);
		}
	}
	return true;
}

static bool add_local_var(struct function *fn, NJXLInsRef ins)
{
	assert(ins);
	for (int i = 0; i < MAX_LOCAL_VARS; i++) {
		if (fn->locals[i] == NULL) {
			fn->locals[i] = ins;
			return true;
		}
	}
	return false;
}

static struct NanoType *alloc_nanotype(struct function *fn,
				       enum NanoTypeKind kind,
				       unsigned int bit_size)
{
	struct NanoType *type = dmrC_allocator_allocate(&fn->type_allocator, 0);
	type->type = kind;
	type->bit_size = bit_size;
	type->return_type = NULL;
	return type;
}

static struct NanoType *sym_basetype_type(struct dmr_C *C, struct function *fn,
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
		case 32:
			return &Int32Type;
		case 64:
			return &Int64Type;
		default:
			return alloc_nanotype(fn, RT_INT, sym->bit_size);
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

static struct NanoType *type_to_nanotype(struct dmr_C *C, struct function *fn,
					 struct symbol *sym,
					 struct symbol *sym_node);

static struct NanoType *get_symnode_type(struct dmr_C *C, struct function *fn,
					 struct symbol *sym)
{
	assert(sym->type == SYM_NODE);
	return type_to_nanotype(C, fn, sym->ctype.base_type, sym);
}

static struct NanoType *get_symnode_or_basetype(struct dmr_C *C,
						struct function *fn,
						struct symbol *sym)
{
	if (sym->type == SYM_NODE) {
		assert(sym->ctype.base_type->type != SYM_NODE);
		return type_to_nanotype(C, fn, sym->ctype.base_type, sym);
	}
	return type_to_nanotype(C, fn, sym, NULL);
}

static struct NanoType *func_return_type(struct dmr_C *C, struct function *fn,
					 struct symbol *sym,
					 struct symbol *sym_node)
{
	return type_to_nanotype(C, fn, sym->ctype.base_type, sym_node);
}

static struct NanoType *sym_func_type(struct dmr_C *C, struct function *fn,
				      struct symbol *sym,
				      struct symbol *sym_node)
{
	struct NanoType *ret_type;
	int n_arg = 0;

	// TODO we probably need a better way to encode function type

	ret_type = func_return_type(C, fn, sym, sym_node);
	struct NanoType *type = alloc_nanotype(fn, RT_FUNCTION, 0);
	type->return_type = ret_type;
	return type;
}

static struct NanoType *sym_array_type(struct dmr_C *C, struct function *fn,
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
	return alloc_nanotype(fn, RT_AGGREGATE, array_bit_size);
}

static struct NanoType *sym_struct_type(struct dmr_C *C, struct function *fn,
					struct symbol *sym,
					struct symbol *sym_node)
{
	unsigned int bit_size = 0;
	if (sym->bit_size > 0 && sym->bit_size != -1) {
		bit_size = sym->bit_size;
	}
	return alloc_nanotype(fn, RT_AGGREGATE, bit_size);
}

static struct NanoType *sym_ptr_type(struct dmr_C *C, struct function *fn,
				     struct symbol *sym,
				     struct symbol *sym_node)
{
	return &PtrType;
}

static struct NanoType *type_to_nanotype(struct dmr_C *C, struct function *fn,
					 struct symbol *sym,
					 struct symbol *sym_node)
{
	assert(sym->type != SYM_NODE);
	assert(sym_node == NULL || sym_node->type == SYM_NODE);
	switch (sym->type) {
	case SYM_BITFIELD: {
		return alloc_nanotype(fn, RT_INT, sym->bit_size);
	}
	case SYM_RESTRICT:
	case SYM_ENUM:
		return type_to_nanotype(C, fn, sym->ctype.base_type, sym_node);
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

static struct NanoType *insn_symbol_type(struct dmr_C *C, struct function *fn,
					 struct instruction *insn)
{
	if (insn->type) {
		return get_symnode_or_basetype(C, fn, insn->type);
	}
	switch (insn->size) {
	case 32:
		return &Int32Type;
	case 64:
		return &Int64Type;
	default:
		return alloc_nanotype(fn, RT_INT, insn->size);
	}
}

static enum NJXValueKind check_supported_argtype(struct dmr_C *C,
						 struct symbol *sym)
{
	if (dmrC_is_ptr_type(sym))
		return NJXValueKind_P;
	if (dmrC_is_int_type(C->S, sym)) {
		if (sym->bit_size == C->target->bits_in_pointer)
			return NJXValueKind_Q;
		else if (sym->bit_size == C->target->bits_in_int)
			return NJXValueKind_I;
	}
	fprintf(stderr, "Unsupported type in function argument, only pointers "
			"and 64-bit integers are supported\n");
	return 0;
}

static struct NanoType *check_supported_returntype(struct dmr_C *C,
						   struct NanoType *type)
{
	if (type->type == RT_AGGREGATE || type->type == RT_FUNCTION ||
	    type->type == RT_INT || type->type == RT_UNSUPPORTED ||
	    type->type == RT_VOID)
		return &BadType;
	return type;
}

static NJXLInsRef truncate_intvalue(struct dmr_C *C, struct function *fn,
				    NJXLInsRef val, struct NanoType *dtype,
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

static NJXLInsRef build_cast(struct dmr_C *C, struct function *fn,
			     NJXLInsRef val, struct NanoType *dtype,
			     int unsigned_cast)
{
	switch (dtype->type) {
	case RT_INT:
		return truncate_intvalue(C, fn, val, dtype, unsigned_cast);

	case RT_INT32:
		if (NJX_is_q(val)) {
			return NJX_q2i(fn->builder, val);
		} else if (NJX_is_f(val)) {
			return NJX_f2i(fn->builder, val);
		} else if (NJX_is_d(val)) {
			return NJX_d2i(fn->builder, val);
		} else if (NJX_is_i(val)) {
			return val;
		}
		break;

	case RT_INT64:
		if (NJX_is_i(val)) {
			if (unsigned_cast)
				return NJX_ui2uq(fn->builder, val);
			else
				return NJX_i2q(fn->builder, val);
		} else if (NJX_is_f(val)) {
			if (unsigned_cast)
				return NJX_ui2uq(fn->builder,
						 NJX_f2i(fn->builder, val));
			else
				return NJX_i2q(fn->builder,
					       NJX_f2i(fn->builder, val));
		} else if (NJX_is_d(val)) {
			return NJX_d2q(fn->builder, val);
		} else if (NJX_is_q(val)) {
			return val;
		}
		break;

	case RT_PTR:
		if (NJX_is_i(val)) {
			return NJX_i2q(fn->builder, val);
		} else if (NJX_is_q(val)) {
			return val;
		} else {
			return NULL;
		}
		break;

	case RT_FLOAT:
		if (NJX_is_i(val)) {
			return NJX_i2f(fn->builder, val);
		} else if (NJX_is_q(val)) {
			return NJX_d2f(fn->builder, NJX_q2d(fn->builder, val));
		} else if (NJX_is_d(val)) {
			return NJX_d2f(fn->builder, val);
		} else if (NJX_is_f(val))
			return val;
		break;

	case RT_DOUBLE:
		if (NJX_is_i(val)) {
			return NJX_i2d(fn->builder, val);
		} else if (NJX_is_q(val)) {
			return NJX_q2d(fn->builder, val);
		} else if (NJX_is_f(val)) {
			return NJX_f2d(fn->builder, val);
		} else if (NJX_is_d(val)) {
			return val;
		}
		break;
	default:
		break;
	}
	return NULL;
}

static int32_t instruction_size_in_bytes(struct dmr_C *C,
					 struct instruction *insn)
{
	return insn->size / C->target->bits_in_char;
}

static int32_t symbol_size_in_bytes(struct dmr_C *C, struct symbol *sym)
{
	return sym->bit_size / C->target->bits_in_char;
}

static NJXLInsRef val_to_value(struct dmr_C *C, struct function *fn,
			       long long value, struct symbol *ctype)
{
	switch (ctype->bit_size) {
	case 8:
	case 16:
	case 32:
		return NJX_immi(fn->builder, (int)value);
	case 64:
		return NJX_immq(fn->builder, value);
	}
	return NULL;
}

/*
 * We do not support globals or aggregate locals with initializers
 */
static NJXLInsRef build_local(struct dmr_C *C, struct function *fn,
			      struct symbol *sym)
{
	const char *name = dmrC_show_ident(C, sym->ident);
	struct NanoType *type = get_symnode_type(C, fn, sym);
	char localname[256] = {0};
	snprintf(localname, sizeof localname, "%s_%p.", name, sym);
	if (dmrC_is_static(sym) || dmrC_is_extern(sym) ||
	    dmrC_is_toplevel(sym)) {
		return NULL;
	} else {
		if (sym->initialized && is_aggregate_type(sym)) {
			return NULL;
		}
		NJXLInsRef result = NJX_alloca(
		    fn->builder, type->bit_size / C->target->bits_in_char);
		if (!add_local_var(fn, result)) {
			fprintf(stderr, "Number of local vars exceeded %d\n",
				MAX_LOCAL_VARS);
			return NULL;
		}
		sym->priv = result;
		return result;
	}
}

static NJXLInsRef constant_value(struct dmr_C *C, struct function *fn,
				 unsigned long long val, struct NanoType *dtype)
{
	NJXLInsRef result = NULL;

	if (dtype->type == RT_INT || dtype->type == RT_INT32) {
		result = NJX_immi(fn->builder, (int)val);
	} else if (dtype->type == RT_INT64 || dtype->type == RT_PTR) {
		result = NJX_immq(fn->builder, val);
	} else if (dtype->type == RT_DOUBLE) {
		result = NJX_immd(fn->builder, (double)(long long)val);
	} else if (dtype->type == RT_FLOAT) {
		result = NJX_immf(fn->builder, (float)(long long)val);
	} else {
		fprintf(stderr, "unsupported pseudo value kind %d\n",
			dtype->type);
		return NULL;
	}
	return result;
}

static NJXLInsRef constant_fvalue(struct dmr_C *C, struct function *fn,
				  double val, struct NanoType *dtype)
{
	NJXLInsRef result = NULL;

	if (dtype->type == RT_DOUBLE) {
		result = NJX_immd(fn->builder, val);
	} else if (dtype->type == RT_FLOAT) {
		result = NJX_immf(fn->builder, (float)val);
	} else {
		fprintf(stderr, "unsupported pseudo value kind %d\n",
			dtype->type);
		return NULL;
	}
	return result;
}

static NJXLInsRef build_store(struct dmr_C *C, struct function *fn,
			      NJXLInsRef v, NJXLInsRef ptr,
			      struct NanoType *type)
{
	switch (type->type) {
	case RT_INT32:
	case RT_INT:
		return NJX_store_i(fn->builder, v, ptr, 0);
	case RT_FLOAT:
		return NJX_store_f(fn->builder, v, ptr, 0);
	case RT_DOUBLE:
		return NJX_store_d(fn->builder, v, ptr, 0);
	case RT_INT64:
	case RT_PTR:
		return NJX_store_q(fn->builder, v, ptr, 0);
	default:
		return NULL;
	}
}

static NJXLInsRef get_sym_value(struct dmr_C *C, struct function *fn,
				pseudo_t pseudo)
{
	NJXLInsRef result = NULL;
	struct symbol *sym = pseudo->sym;
	struct expression *expr;

	result = (NJXLInsRef)sym->priv;
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
			struct NanoType *symtype = get_symnode_type(C, fn, sym);
			if (symtype == NULL) {
				dmrC_sparse_error(C, expr->pos,
						  "invalid symbol type\n");
				dmrC_show_expression(C, expr);
				return NULL;
			}
			result = build_local(C, fn, sym);
			if (!result)
				return result;
			NJXLInsRef value =
			    constant_value(C, fn, expr->value, symtype);
			build_store(C, fn, value, result, symtype);
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
			struct NanoType *symtype = get_symnode_type(C, fn, sym);
			if (symtype == NULL) {
				dmrC_sparse_error(C, expr->pos,
						  "invalid symbol type\n");
				dmrC_show_expression(C, expr);
				return NULL;
			}
			result = build_local(C, fn, sym);
			if (!result)
				return result;
			NJXLInsRef value =
			    constant_fvalue(C, fn, expr->fvalue, symtype);
			build_store(C, fn, value, result, symtype);
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
		struct NanoType *type = get_symnode_type(C, fn, sym);
		if (type->type == RT_FUNCTION) {
			dmrC_sparse_error(
			    C, expr->pos,
			    "unsupported expr type: %d, symbol = %s\n",
			    expr->type, name);
			dmrC_show_expression(C, expr);
			return NULL;
		} else if (dmrC_is_extern(sym) || dmrC_is_toplevel(sym)) {
			dmrC_sparse_error(C, expr->pos,
					  "unsupported expr type: %d\n",
					  expr->type);
			dmrC_show_expression(C, expr);
			return NULL;
		} else {
			if (dmrC_is_static(sym)) {
				dmrC_sparse_error(C, expr->pos,
						  "unsupported expr type: %d\n",
						  expr->type);
				dmrC_show_expression(C, expr);
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

static NJXLInsRef pseudo_to_value(struct dmr_C *C, struct function *fn,
				  struct symbol *ctype, pseudo_t pseudo)
{
	NJXLInsRef result = NULL;

	switch (pseudo->type) {
	case PSEUDO_REG:
		result = pseudo->priv;
		break;
	case PSEUDO_SYM:
		result = get_sym_value(C, fn, pseudo);
		break;
	case PSEUDO_VAL:
		result = val_to_value(C, fn, pseudo->value, ctype);
		break;
	case PSEUDO_ARG:
		result = fn->args[pseudo->nr - 1];
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

static NJXLInsRef output_op_phi(struct dmr_C *C, struct function *fn,
				struct instruction *insn)
{
	NJXLInsRef ptr = insn->target->priv2;

	if (!ptr)
		return NULL;

	// Unlike LLVM version which creates the Load instruction
	// early on and inserts it into the IR stream here, we
	// create the Load instruction here.
	NJXLInsRef load = NULL;
	switch (insn->size) {
	case 8:
		// TODO do we need to do unsigned here?
		// load = NJX_load_c2i(fn->builder, ptr, 0);
		load = NJX_load_uc2ui(fn->builder, ptr, 0);
		break;
	case 16:
		// TODO do we need to do unsigned here?
		// load = NJX_load_s2i(fn->builder, ptr, 0);
		load = NJX_load_us2ui(fn->builder, ptr, 0);
		break;
	case 32:
		if (dmrC_is_float_type(C->S, insn->type))
			load = NJX_load_f(fn->builder, ptr, 0);
		else
			load = NJX_load_i(fn->builder, ptr, 0);
		break;
	case 64:
		if (dmrC_is_float_type(C->S, insn->type))
			load = NJX_load_d(fn->builder, ptr, 0);
		else
			load = NJX_load_q(fn->builder, ptr, 0);
		break;
	}
	insn->target->priv = load;
	return load;
}

static NJXLInsRef output_op_load(struct dmr_C *C, struct function *fn,
				 struct instruction *insn)
{
	NJXLInsRef ptr = pseudo_to_value(C, fn, insn->type, insn->src);

	if (!ptr)
		return NULL;

	NJXLInsRef value = NULL;
	switch (insn->size) {
	case 8:
		value = NJX_load_c2i(fn->builder, ptr, (int)insn->offset);
		break;
	case 16:
		value = NJX_load_s2i(fn->builder, ptr, (int)insn->offset);
		break;
	case 32:
		if (dmrC_is_float_type(C->S, insn->type))
			value = NJX_load_f(fn->builder, ptr, (int)insn->offset);
		else
			value = NJX_load_i(fn->builder, ptr, (int)insn->offset);
		break;
	case 64:
		if (dmrC_is_float_type(C->S, insn->type))
			value = NJX_load_d(fn->builder, ptr, (int)insn->offset);
		else
			value = NJX_load_q(fn->builder, ptr, (int)insn->offset);
		break;
	}
	insn->target->priv = value;
	return value;
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
	struct instruction *arg;
	NJXLInsRef *args;

	n_arg = dmrC_instruction_list_size(insn->arguments);
	args = alloca(n_arg * sizeof(NJXLInsRef));
	struct symbol *ftype = get_function_basetype(insn->fntype);

	i = 0;
	FOR_EACH_PTR(insn->arguments, arg)
	{
		NJXLInsRef value;
		struct symbol *atype;

		atype = dmrC_get_nth_symbol(ftype->arguments, i);
		value = pseudo_to_value(C, fn, arg->type, arg->src);
		if (!value)
			return NULL;
		if (atype) {
			struct NanoType *argtype =
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
	struct NanoType *type = get_symnode_type(C, fn, sym);
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

static NJXLInsRef output_op_phisrc(struct dmr_C *C, struct function *fn,
				   struct instruction *insn)
{
	NJXLInsRef v;
	struct instruction *phi;

	assert(insn->target->priv == NULL);

	/* target = src */
	v = pseudo_to_value(C, fn, insn->type, insn->phi_src);
	if (!v)
		return NULL;

	FOR_EACH_PTR(insn->phi_users, phi)
	{
		NJXLInsRef ptr;

		assert(phi->opcode == OP_PHI);
		/* phi must be load from alloca */
		ptr = phi->target->priv2;
		if (!ptr)
			return NULL;

		switch (phi->size) {
		case 8:
			NJX_store_i2c(fn->builder, v, ptr, 0);
			break;
		case 16:
			NJX_store_i2s(fn->builder, v, ptr, 0);
			break;
		case 32:
			if (dmrC_is_float_type(C->S, insn->type))
				NJX_store_f(fn->builder, v, ptr, 0);
			else
				NJX_store_i(fn->builder, v, ptr, 0);
			break;
		case 64:
			if (dmrC_is_float_type(C->S, insn->type))
				NJX_store_d(fn->builder, v, ptr, 0);
			else
				NJX_store_q(fn->builder, v, ptr, 0);
			break;
		default:
			return NULL;
		}
	}
	END_FOR_EACH_PTR(phi);
	return v;
}

/**
 * Convert the pseudo to a case_value, and cast it to the expected type of the
 * instruction. If ptrtoint is true then convert pointer values to integers.
 */
static NJXLInsRef get_operand(struct dmr_C *C, struct function *fn,
			      struct symbol *ctype, pseudo_t pseudo,
			      bool ptrtoint, bool unsigned_cast)
{
	NJXLInsRef target;

	struct NanoType *instruction_type =
	    get_symnode_or_basetype(C, fn, ctype);
	if (instruction_type == NULL)
		return NULL;
	target = pseudo_to_value(C, fn, ctype, pseudo);
	if (!target)
		return NULL;
	if (ptrtoint && dmrC_is_ptr_type(ctype))
		target = build_cast(C, fn, target, instruction_type, 0);
	else
		target =
		    build_cast(C, fn, target, instruction_type, unsigned_cast);
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

static NJXLInsRef output_op_compare(struct dmr_C *C, struct function *fn,
				    struct instruction *insn)
{
	NJXLInsRef lhs, rhs, target = NULL;

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

	struct NanoType *dst_type = insn_symbol_type(C, fn, insn);
	if (!dst_type)
		return NULL;

	switch (insn->opcode) {
	case OP_SET_LT:
		if (NJX_is_d(lhs))
			target = NJX_ltd(fn->builder, lhs, rhs);
		else if (NJX_is_f(lhs))
			target = NJX_ltf(fn->builder, lhs, rhs);
		else if (NJX_is_q(lhs))
			target = NJX_ltq(fn->builder, lhs, rhs);
		else if (NJX_is_i(lhs))
			target = NJX_lti(fn->builder, lhs, rhs);
		break;
	case OP_SET_B:
		if (NJX_is_d(lhs))
			target = NJX_ltd(fn->builder, lhs, rhs);
		else if (NJX_is_f(lhs))
			target = NJX_ltf(fn->builder, lhs, rhs);
		else if (NJX_is_q(lhs))
			target = NJX_ltuq(fn->builder, lhs, rhs);
		else if (NJX_is_i(lhs))
			target = NJX_ltui(fn->builder, lhs, rhs);
		break;
	case OP_SET_LE:
		if (NJX_is_d(lhs))
			target = NJX_led(fn->builder, lhs, rhs);
		else if (NJX_is_f(lhs))
			target = NJX_lef(fn->builder, lhs, rhs);
		else if (NJX_is_q(lhs))
			target = NJX_leq(fn->builder, lhs, rhs);
		else if (NJX_is_i(lhs))
			target = NJX_lei(fn->builder, lhs, rhs);
		break;
	case OP_SET_BE:
		if (NJX_is_d(lhs))
			target = NJX_led(fn->builder, lhs, rhs);
		else if (NJX_is_f(lhs))
			target = NJX_lef(fn->builder, lhs, rhs);
		else if (NJX_is_q(lhs))
			target = NJX_leuq(fn->builder, lhs, rhs);
		else if (NJX_is_i(lhs))
			target = NJX_leui(fn->builder, lhs, rhs);
		break;
	case OP_SET_GT:
		if (NJX_is_d(lhs))
			target = NJX_gtd(fn->builder, lhs, rhs);
		else if (NJX_is_f(lhs))
			target = NJX_gtf(fn->builder, lhs, rhs);
		else if (NJX_is_q(lhs))
			target = NJX_gtq(fn->builder, lhs, rhs);
		else if (NJX_is_i(lhs))
			target = NJX_gti(fn->builder, lhs, rhs);
		break;
	case OP_SET_A:
		if (NJX_is_d(lhs))
			target = NJX_gtd(fn->builder, lhs, rhs);
		else if (NJX_is_f(lhs))
			target = NJX_gtf(fn->builder, lhs, rhs);
		else if (NJX_is_q(lhs))
			target = NJX_gtuq(fn->builder, lhs, rhs);
		else if (NJX_is_i(lhs))
			target = NJX_gtui(fn->builder, lhs, rhs);
		break;
	case OP_SET_GE:
		if (NJX_is_d(lhs))
			target = NJX_ged(fn->builder, lhs, rhs);
		else if (NJX_is_f(lhs))
			target = NJX_gef(fn->builder, lhs, rhs);
		else if (NJX_is_q(lhs))
			target = NJX_geq(fn->builder, lhs, rhs);
		else if (NJX_is_i(lhs))
			target = NJX_gei(fn->builder, lhs, rhs);
		break;
	case OP_SET_AE:
		if (NJX_is_d(lhs))
			target = NJX_ged(fn->builder, lhs, rhs);
		else if (NJX_is_f(lhs))
			target = NJX_gef(fn->builder, lhs, rhs);
		else if (NJX_is_q(lhs))
			target = NJX_geuq(fn->builder, lhs, rhs);
		else if (NJX_is_i(lhs))
			target = NJX_geui(fn->builder, lhs, rhs);
		break;
	case OP_SET_EQ:
	case OP_SET_NE:
		if (NJX_is_d(lhs))
			target = NJX_eqd(fn->builder, lhs, rhs);
		else if (NJX_is_f(lhs))
			target = NJX_eqf(fn->builder, lhs, rhs);
		else if (NJX_is_q(lhs))
			target = NJX_eqq(fn->builder, lhs, rhs);
		else if (NJX_is_i(lhs))
			target = NJX_eqi(fn->builder, lhs, rhs);
		if (insn->opcode == OP_SET_NE && target)
			target = is_eq_zero(C, fn, target);
		break;
	default:
		break;
	}

	insn->target->priv = target;
	return target;
}

static NJXLInsRef output_op_binary(struct dmr_C *C, struct function *fn,
				   struct instruction *insn)
{
	NJXLInsRef lhs, rhs, target = NULL;

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
				target = NJX_addd(fn->builder, lhs, rhs);
			else
				target = NJX_addq(fn->builder, lhs, rhs);
			break;
		case 32:
			if (dmrC_is_float_type(C->S, insn->type))
				target = NJX_addf(fn->builder, lhs, rhs);
			else
				target = NJX_addi(fn->builder, lhs, rhs);
			break;
		}
		break;
	case OP_SUB:
		switch (insn->size) {
		case 64:
			if (dmrC_is_float_type(C->S, insn->type))
				target = NJX_subd(fn->builder, lhs, rhs);
			else
				target = NJX_subq(fn->builder, lhs, rhs);
			break;
		case 32:
			if (dmrC_is_float_type(C->S, insn->type))
				target = NJX_subf(fn->builder, lhs, rhs);
			else
				target = NJX_subi(fn->builder, lhs, rhs);
			break;
		}
		break;
	case OP_MULU:
		switch (insn->size) {
		case 64:
			if (dmrC_is_float_type(C->S, insn->type))
				target = NJX_muld(fn->builder, lhs, rhs);
			else
				target = NJX_mulq(fn->builder, lhs, rhs);
			break;
		case 32:
			if (dmrC_is_float_type(C->S, insn->type))
				target = NJX_mulf(fn->builder, lhs, rhs);
			else
				target = NJX_muli(fn->builder, lhs, rhs);
			break;
		}
		break;
	case OP_MULS:
		switch (insn->size) {
		case 64:
			target = NJX_mulq(fn->builder, lhs, rhs);
			break;
		case 32:
			target = NJX_muli(fn->builder, lhs, rhs);
			break;
		}
		break;
	case OP_DIVU:
		switch (insn->size) {
		case 64:
			if (dmrC_is_float_type(C->S, insn->type))
				target = NJX_divd(fn->builder, lhs, rhs);
			else
				target = NJX_divq(fn->builder, lhs, rhs);
			break;
		case 32:
			if (dmrC_is_float_type(C->S, insn->type))
				target = NJX_divf(fn->builder, lhs, rhs);
			else
				target = NJX_divi(fn->builder, lhs, rhs);
			break;
		}
		break;
	case OP_DIVS:
		switch (insn->size) {
		case 64:
			target = NJX_divq(fn->builder, lhs, rhs);
			break;
		case 32:
			target = NJX_divi(fn->builder, lhs, rhs);
			break;
		}
		break;

	case OP_MODS:
	case OP_MODU:
		assert(!dmrC_is_float_type(C->S, insn->type));
		switch (insn->size) {
		case 64:
			target = NJX_modq(fn->builder, lhs, rhs);
			break;
		case 32:
			target = NJX_modi(fn->builder, lhs, rhs);
			break;
		}
		break;
	case OP_SHL:
		assert(!dmrC_is_float_type(C->S, insn->type));
		switch (insn->size) {
		case 64:
			target = NJX_lshq(fn->builder, lhs, rhs);
			break;
		case 32:
			target = NJX_lshi(fn->builder, lhs, rhs);
			break;
		}
		break;
	case OP_LSR:
		assert(!dmrC_is_float_type(C->S, insn->type));
		switch (insn->size) {
		case 64:
			target = NJX_rshuq(fn->builder, lhs, rhs);
			break;
		case 32:
			target = NJX_rshui(fn->builder, lhs, rhs);
			break;
		}
		break;
	case OP_ASR:
		assert(!dmrC_is_float_type(C->S, insn->type));
		switch (insn->size) {
		case 64:
			target = NJX_rshq(fn->builder, lhs, rhs);
			break;
		case 32:
			target = NJX_rshi(fn->builder, lhs, rhs);
			break;
		}
		break;

	/* Logical */
	case OP_AND:
		assert(!dmrC_is_float_type(C->S, insn->type));
		switch (insn->size) {
		case 64:
			target = NJX_andq(fn->builder, lhs, rhs);
			break;
		case 32:
			target = NJX_andi(fn->builder, lhs, rhs);
			break;
		}
		break;
	case OP_OR:
		assert(!dmrC_is_float_type(C->S, insn->type));
		switch (insn->size) {
		case 64:
			target = NJX_orq(fn->builder, lhs, rhs);
			break;
		case 32:
			target = NJX_ori(fn->builder, lhs, rhs);
			break;
		}
		break;
	case OP_XOR:
		assert(!dmrC_is_float_type(C->S, insn->type));
		switch (insn->size) {
		case 64:
			target = NJX_xorq(fn->builder, lhs, rhs);
			break;
		case 32:
			target = NJX_xori(fn->builder, lhs, rhs);
			break;
		}
		break;
	case OP_AND_BOOL: {
		NJXLInsRef lhs_nz, rhs_nz;
		struct NanoType *dst_type;

		lhs_nz = is_neq_zero(C, fn, lhs);
		rhs_nz = is_neq_zero(C, fn, rhs);
		switch (insn->size) {
		case 64:
			target = NJX_andq(fn->builder, lhs_nz, rhs_nz);
			break;
		case 32:
			target = NJX_andi(fn->builder, lhs_nz, rhs_nz);
			break;
		}
		if (!target)
			return NULL;
		dst_type = insn_symbol_type(C, fn, insn);
		if (!dst_type)
			return NULL;
		target = build_cast(C, fn, target, dst_type, 1);
		break;
	}
	case OP_OR_BOOL: {
		NJXLInsRef lhs_nz, rhs_nz;
		struct NanoType *dst_type;

		lhs_nz = is_neq_zero(C, fn, lhs);
		rhs_nz = is_neq_zero(C, fn, rhs);
		switch (insn->size) {
		case 64:
			target = NJX_orq(fn->builder, lhs_nz, rhs_nz);
			break;
		case 32:
			target = NJX_ori(fn->builder, lhs_nz, rhs_nz);
			break;
		}
		if (!target)
			return NULL;
		dst_type = insn_symbol_type(C, fn, insn);
		if (!dst_type)
			return NULL;
		target = build_cast(C, fn, target, dst_type, 1);
		break;
	}
	}
	insn->target->priv = target;

	return target;
}

static NJXLInsRef output_op_setval(struct dmr_C *C, struct function *fn,
				   struct instruction *insn)
{
	struct expression *expr = insn->val;
	struct NanoType *const_type;
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
	struct NanoType *dtype;

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

static NJXLInsRef output_op_store(struct dmr_C *C, struct function *fn,
				  struct instruction *insn)
{
	NJXLInsRef ptr, target_in;
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

	NJXLInsRef value = NULL;
	switch (insn->size) {
	case 8:
		value = NJX_store_i2c(fn->builder, target_in, ptr, off);
		break;
	case 16:
		value = NJX_store_i2s(fn->builder, target_in, ptr, off);
		break;
	case 32:
		if (NJX_is_f(target_in))
			value = NJX_store_f(fn->builder, target_in, ptr, off);
		else
			value = NJX_store_i(fn->builder, target_in, ptr, off);
		break;
	case 64:
		if (NJX_is_d(target_in))
			value = NJX_store_d(fn->builder, target_in, ptr, off);
		else
			value = NJX_store_q(fn->builder, target_in, ptr, off);
		break;
	}
	return value;
}

static NJXLInsRef pseudo_ins(struct dmr_C *C, struct function *fn,
			     pseudo_t pseudo)
{
	NJXLInsRef result = NULL;
	switch (pseudo->type) {
	case PSEUDO_REG:
		result = pseudo->priv;
		break;
	case PSEUDO_ARG:
		result = fn->args[pseudo->nr - 1];
		break;
	case PSEUDO_PHI:
		result = pseudo->priv2;
		break;
	}
	return result;
}

/*
 * Add liveness data to help Nanojit's
 * register allocator, which does a scan of the Nanojit instructions
 * from bottom up and can miss the fact that some registers and stack slots are
 * needed.
 */
static void output_liveness(struct dmr_C *C, struct function *fn,
			    struct basic_block *bb)
{
#if 0
	pseudo_t need;
	FOR_EACH_PTR(bb->needs, need)
	{
		NJXLInsRef value = pseudo_ins(C, fn, need);
		if (value) {
			if (NJX_is_d(value))
				NJX_lived(fn->builder, value);
			else if (NJX_is_f(value))
				NJX_livef(fn->builder, value);
			else if (NJX_is_i(value))
				NJX_livei(fn->builder, value);
			else
				NJX_liveq(fn->builder, value);
		}
	}
	END_FOR_EACH_PTR(need);
#endif
	// Mark required stack slots arising from
	// phi instructions
	struct instruction *insn;
	FOR_EACH_PTR(bb->insns, insn)
	{
		if (!insn->bb || insn->opcode != OP_PHI)
			continue;
		NJXLInsRef ptr = insn->target->priv2;
		if (ptr)
			NJX_liveq(fn->builder, ptr);
	}
	END_FOR_EACH_PTR(insn);
}

static void output_liveness_localvars(struct dmr_C *C, struct function *fn)
{
	// Mark stack slots arising from
	// local var declarations
	for (int i = 0; i < MAX_LOCAL_VARS; i++) {
		if (fn->locals[i] == NULL)
			break;
		NJXLInsRef ptr = fn->locals[i];
		NJX_liveq(fn->builder, ptr);
	}
}

/*
 * For now we emit a switch statement as if it is a bunch
 * of if/elseif/else branches. NanoJIT supports a simple jump table
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
			struct NanoType *symtype =
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
			// Mark registers needed by destination BB as live
			// we should only output if dest bb precedes current bb
			if (insn->bb->nr > jmp->target->nr)
				output_liveness(C, fn, jmp->target);
			NJXLInsRef br1 = NJX_cbr_true(fn->builder, cond,
						      NULL); // jmp->target
			// It appears that NanoJIT may decide jump isn't
			// necessary
			if (br1 != NULL) {
				if (!add_jump_instruction(fn, jmp->target, br1))
					return NULL;
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
		if (!add_jump_instruction(fn, default_bb, default_br))
			return NULL;
	}
	// We need to return some non NULL value
	// So here we return the switch_value
	return switch_value;
}

static NJXLInsRef output_op_cbr(struct dmr_C *C, struct function *fn,
				struct instruction *br)
{
	NJXLInsRef value = pseudo_to_value(C, fn, br->type, br->cond);
	if (!value)
		return NULL;
	NJXLInsRef cond = is_eq_zero(C, fn, value);
	if (cond == NULL)
		return NULL;
	// Mark registers needed by destination BB as live
	// we should only output if bb_false precedes current bb
	if (br->bb->nr > br->bb_false->nr)
		output_liveness(C, fn, br->bb_false);
	// As we tested for the value being zero above,
	// then if this is true, the condition is false, so
	// we must take the false branch
	NJXLInsRef br1 =
	    NJX_cbr_true(fn->builder, cond, NULL); // br->bb_false->priv
	if (!add_jump_instruction(fn, br->bb_false, br1))
		return NULL;
	// Mark registers needed by destination BB as live
	// we should only output if bb_false precedes current bb
	if (br->bb->nr > br->bb_true->nr)
		output_liveness(C, fn, br->bb_true);
	// If condition is not zero then
	// we take the true branch.
	NJXLInsRef br2 =
	    NJX_cbr_false(fn->builder, cond, NULL); // br->bb_true->priv
	if (!add_jump_instruction(fn, br->bb_true, br2))
		return NULL;
	return br1;
}

static NJXLInsRef output_op_br(struct dmr_C *C, struct function *fn,
			       struct instruction *br)
{
	// Mark registers needed by destination BB as live
	// we should only output if bb_true precedes
	// current bb
	if (br->bb->nr > br->bb_true->nr)
		output_liveness(C, fn, br->bb_true);
	NJXLInsRef br1 = NJX_br(fn->builder, NULL);
	if (!add_jump_instruction(fn, br->bb_true, br1))
		return NULL;
	return br1;
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

static NJXLInsRef output_op_ret(struct dmr_C *C, struct function *fn,
				struct instruction *insn)
{
	pseudo_t pseudo = insn->src;

	if (pseudo && pseudo != VOID_PSEUDO(C)) {
		NJXLInsRef result = pseudo_to_value(C, fn, insn->type, pseudo);
		if (!result)
			return NULL;
		if (NJX_is_i(result))
			return NJX_reti(fn->builder, result);
		else if (NJX_is_q(result))
			return NJX_retq(fn->builder, result);
		else if (NJX_is_f(result))
			return NJX_retf(fn->builder, result);
		else if (NJX_is_d(result))
			return NJX_retd(fn->builder, result);
		else
			return NULL;
	} else
		// TODO How to support void return in NanoJIT is not clear
		return NULL;
}

static NJXLInsRef output_op_ptrcast(struct dmr_C *C, struct function *fn,
				    struct instruction *insn)
{
	NJXLInsRef src, target;
	struct NanoType *dtype;
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

static NJXLInsRef output_op_cast(struct dmr_C *C, struct function *fn,
				 struct instruction *insn, bool unsignedcast)
{
	NJXLInsRef src, target;
	struct NanoType *dtype;
	struct symbol *otype = insn->orig_type;

	if (dmrC_is_ptr_type(insn->type)) {
		return output_op_ptrcast(C, fn, insn);
	}

	src = insn->src->priv;
	if (!src)
		src = pseudo_to_value(C, fn, insn->type, insn->src);
	if (dmrC_is_int_type(C->S, otype)) {
		struct NanoType *stype = get_symnode_or_basetype(C, fn, otype);
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

static NJXLInsRef output_op_fpcast(struct dmr_C *C, struct function *fn,
				   struct instruction *insn)
{
	NJXLInsRef src, target;
	struct NanoType *dtype;
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

const char *make_comment(struct dmr_C *C, struct instruction *insn)
{
	const char *comment = dmrC_show_instruction(C, insn);
	char *copy =
	    dmrC_allocator_allocate(&C->byte_allocator, strlen(comment) + 1);
	strcpy(copy, comment);
	return copy;
}

/* return 1 on success, 0 on failure */
static int output_insn(struct dmr_C *C, struct function *fn,
		       struct instruction *insn)
{
	NJXLInsRef v = NULL;
	switch (insn->opcode) {
	case OP_RET:
		NJX_comment(fn->builder, make_comment(C, insn));
		v = output_op_ret(C, fn, insn);
		break;
	case OP_BR:
		NJX_comment(fn->builder, make_comment(C, insn));
		v = output_op_br(C, fn, insn);
		break;
	case OP_CBR:
		NJX_comment(fn->builder, make_comment(C, insn));
		v = output_op_cbr(C, fn, insn);
		break;
	case OP_PHISOURCE:
		NJX_comment(fn->builder, make_comment(C, insn));
		v = output_op_phisrc(C, fn, insn);
		break;
	case OP_PHI:
		NJX_comment(fn->builder, make_comment(C, insn));
		v = output_op_phi(C, fn, insn);
		break;
	case OP_LOAD:
		NJX_comment(fn->builder, make_comment(C, insn));
		v = output_op_load(C, fn, insn);
		break;
	case OP_SYMADDR:
		NJX_comment(fn->builder, make_comment(C, insn));
		v = output_op_symaddr(C, fn, insn);
		break;
	case OP_SETVAL:
		NJX_comment(fn->builder, make_comment(C, insn));
		v = output_op_setval(C, fn, insn);
		break;

	case OP_SWITCH:
		NJX_comment(fn->builder, make_comment(C, insn));
		v = output_op_switch(C, fn, insn);
		break;

	case OP_COMPUTEDGOTO:
		dmrC_sparse_error(C, insn->pos,
				  "computed goto is not supported\n");
		return 0;

	case OP_LNOP:
		return 0;

	case OP_STORE:
		NJX_comment(fn->builder, make_comment(C, insn));
		v = output_op_store(C, fn, insn);
		break;

	case OP_SNOP:
		return 0;

	case OP_CALL:
		NJX_comment(fn->builder, make_comment(C, insn));
		v = output_op_call(C, fn, insn);
		break;
	case OP_CAST:
		NJX_comment(fn->builder, make_comment(C, insn));
		v = output_op_cast(C, fn, insn, true);
		break;
	case OP_SCAST:
		NJX_comment(fn->builder, make_comment(C, insn));
		v = output_op_cast(C, fn, insn, false);
		break;
	case OP_FPCAST:
		NJX_comment(fn->builder, make_comment(C, insn));
		v = output_op_fpcast(C, fn, insn);
		break;
	case OP_PTRCAST:
		NJX_comment(fn->builder, make_comment(C, insn));
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
		NJX_comment(fn->builder, make_comment(C, insn));
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
		NJX_comment(fn->builder, make_comment(C, insn));
		v = output_op_compare(C, fn, insn);
		break;

	case OP_SEL:
		NJX_comment(fn->builder, make_comment(C, insn));
		v = output_op_sel(C, fn, insn);
		break;

	case OP_SLICE:
		return 0;

	case OP_NOT:
		NJX_comment(fn->builder, make_comment(C, insn));
		v = output_op_not(C, fn, insn);
		break;

	case OP_NEG:
		NJX_comment(fn->builder, make_comment(C, insn));
		v = output_op_neg(C, fn, insn);
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

/*
 * Add liveness data to help Nanojit's
 * register allocator, which does a scan of the Nanojit instructions
 * from bottom up and can miss the fact that some registers are
 * needed. It is not yet clear the implementation below is correct.
 */
static void output_parameter_liveness(struct dmr_C *C, struct function *fn)
{
	for (int i = 0; fn->args[i]; i++) {
		NJX_liveq(fn->builder, fn->args[i]);
	}
}

/* return 1 on success, 0 on failure */
static int output_bb(struct dmr_C *C, struct function *fn,
		     struct basic_block *bb)
{
	struct instruction *insn;

	bb->priv = NJX_add_label(fn->builder);
	FOR_EACH_PTR(bb->insns, insn)
	{
		if (!insn->bb)
			continue;

		if (!output_insn(C, fn, insn)) {
			dmrC_sparse_error(C, insn->pos, "failed to output %s\n",
					  dmrC_show_instruction(C, insn));
			return 0;
		}
	}
	END_FOR_EACH_PTR(insn);

	return 1;
}

static enum NJXValueKind map_nanotype(struct NanoType *type)
{
	switch (type->type) {
	case RT_DOUBLE:
		return NJXValueKind_D;
	case RT_FLOAT:
		return NJXValueKind_F;
	case RT_INT32:
		return NJXValueKind_I;
	case RT_INT64:
		return NJXValueKind_Q;
	case RT_PTR:
		return NJXValueKind_P;
	default:
		return 0;
	}
}

static bool output_fn(struct dmr_C *C, NJXContextRef module,
		      struct entrypoint *ep)
{
	struct symbol *sym = ep->name;
	struct symbol *base_type = sym->ctype.base_type;
	struct symbol *ret_type = sym->ctype.base_type->ctype.base_type;
	struct function function;
	struct basic_block *bb;
	struct symbol *arg;
	const char *name;
	int nr_args = 0;
	bool success = false;

	memset(&function, 0, sizeof function);
	function.context = module;
	if (base_type->variadic) {
		fprintf(stderr, "Variadic functions are not supported\n");
		return false;
	}

	dmrC_allocator_init(&function.type_allocator, "nanotypes",
			    sizeof(struct NanoType),
			    __alignof__(struct NanoType), CHUNK);

	enum NJXValueKind argtypes[NJXMaxArgs];

	FOR_EACH_PTR(base_type->arguments, arg)
	{
		struct symbol *arg_base_type = arg->ctype.base_type;
		if (nr_args >= NJXMaxArgs) {
			fprintf(stderr, "Only upto %d arguments supported\n",
				NJXMaxArgs);
			goto Ereturn;
		}
		argtypes[nr_args] = check_supported_argtype(C, arg_base_type);
		if (!argtypes[nr_args])
			goto Ereturn;
		nr_args++;
	}
	END_FOR_EACH_PTR(arg);

	name = dmrC_show_ident(C, sym->ident);

	struct NanoType *function_type =
	    type_to_nanotype(C, &function, ret_type, NULL);
	function.return_type = check_supported_returntype(C, function_type);
	if (function.return_type == &BadType) {
		fprintf(stderr, "Function '%s' has unsupported return type\n",
			name);
		goto Ereturn;
	}

	enum NJXValueKind freturn = map_nanotype(function.return_type);

	function.builder = NJX_create_function_builder(module, name, freturn,
						       argtypes, nr_args, true);
	for (int i = 0; i < nr_args; i++) {
		function.args[i] = NJX_get_parameter(function.builder, i);
	}

	unsigned int bbnr = 0;
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

			NJXLInsRef ptr =
			    NJX_alloca(function.builder,
				       instruction_size_in_bytes(C, insn));
			// Unlike the Sparse LLVM version we
			// save the pointer here and perform the load
			// when we encounter the PHI instruction
			// The LLVM version generates the Load instruction
			// but doesn't insert it into the IR at this point.
			// But in Nanojit it seems we cannot do that - i.e.
			// the instruction gets inserted into the IR stream
			insn->target->priv2 = ptr;
			insn->target->priv = NULL;
		}
		END_FOR_EACH_PTR(insn);
		/* The bb->nr field is not used by the
		   frontend anymore so we can use it to
		   decide which the order of basic blocks. This
		   is used to decide when to emit liveness instructions
		*/
		bb->nr = bbnr++;
	}
	END_FOR_EACH_PTR(bb);

	FOR_EACH_PTR(ep->bbs, bb)
	{
		if (!output_bb(C, &function, bb)) {
			goto Efailed;
		}
	}
	END_FOR_EACH_PTR(bb);

	output_liveness_localvars(C, &function);
	if (resolve_jumps(&function))
		success = true;

	// Not needed anymore as Nanojit does it
	// But if we convert from long long to int then?
	// TODO check
	// output_parameter_liveness(C, &function);

	if (success) {
		void *p = NJX_finalize(function.builder);
		if (!p)
			success = false;
	}

Efailed:
	NJX_destroy_function_builder(function.builder);

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
static int compile(struct dmr_C *C, NJXContextRef module,
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

bool dmrC_nanocompile(int argc, char **argv, NJXContextRef module,
		      const char *inputbuffer)
{
	struct string_list *filelist = NULL;
	struct symbol_list *symlist;
	char *file;

	struct dmr_C *C = new_dmr_C();
	C->optimize = 1; /* We need the liveness data for NanoJIT */
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
