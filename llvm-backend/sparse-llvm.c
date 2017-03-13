/*
 * Example usage:
 *	./sparse-llvm hello.c | llc | as -o hello.o
 */

#include <llvm-c/Core.h>
#include <llvm-c/BitWriter.h>
#include <llvm-c/Analysis.h>
#include <llvm-c/Target.h>

#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <assert.h>

#include <port.h>
#include <dmr_c.h>
#include <symbol.h>
#include <expression.h>
#include <linearize.h>
#include <flow.h>

struct function {
	LLVMBuilderRef			builder;
	LLVMTypeRef			type;
	LLVMValueRef			fn;
	LLVMModuleRef			module;
};

static inline bool symbol_is_fp_type(struct dmr_C *C, struct symbol *sym)
{
	if (!sym)
		return false;

	return sym->ctype.base_type == &C->S->fp_type;
}

static LLVMTypeRef symbol_type(struct dmr_C *C, LLVMModuleRef module, struct symbol *sym);

static LLVMTypeRef func_return_type(struct dmr_C *C, LLVMModuleRef module, struct symbol *sym)
{
	return symbol_type(C, module, sym->ctype.base_type);
}

static LLVMTypeRef sym_func_type(struct dmr_C *C, LLVMModuleRef module, struct symbol *sym)
{
	LLVMTypeRef *arg_type;
	LLVMTypeRef func_type;
	LLVMTypeRef ret_type;
	struct symbol *arg;
	int n_arg = 0;

	/* to avoid strangeness with varargs [for now], we build
	 * the function and type anew, for each call.  This
	 * is probably wrong.  We should look up the
	 * symbol declaration info.
	 */

	ret_type = func_return_type(C, module, sym);

	/* count args, build argument type information */
	FOR_EACH_PTR(sym->arguments, arg) {
		n_arg++;
	} END_FOR_EACH_PTR(arg);

	arg_type = alloca(n_arg * sizeof(LLVMTypeRef));

	int idx = 0;
	FOR_EACH_PTR(sym->arguments, arg) {
		struct symbol *arg_sym = arg->ctype.base_type;

		arg_type[idx++] = symbol_type(C, module, arg_sym);
	} END_FOR_EACH_PTR(arg);
	func_type = LLVMFunctionType(ret_type, arg_type, n_arg,
				     sym->variadic);

	return func_type;
}

static LLVMTypeRef sym_array_type(struct dmr_C *C, LLVMModuleRef module, struct symbol *sym)
{
	LLVMTypeRef elem_type;
	struct symbol *base_type;

	base_type = sym->ctype.base_type;
	/* empty struct is undefined [6.7.2.1(8)] */
	assert(base_type->bit_size > 0);

	elem_type = symbol_type(C, module, base_type);
	if (!elem_type)
		return NULL;

	return LLVMArrayType(elem_type, sym->bit_size / base_type->bit_size);
}

#define MAX_STRUCT_MEMBERS 64

static LLVMTypeRef sym_struct_type(struct dmr_C *C, LLVMModuleRef module, struct symbol *sym)
{
	LLVMTypeRef elem_types[MAX_STRUCT_MEMBERS];
	struct symbol *member;
	char buffer[256];
	LLVMTypeRef ret;
	unsigned nr = 0;

	snprintf(buffer, sizeof(buffer), "struct.%s", sym->ident ? sym->ident->name : "anno");
	ret = LLVMStructCreateNamed(LLVMGetGlobalContext(), buffer);
	/* set ->aux to avoid recursion */
	sym->aux = ret;

	FOR_EACH_PTR(sym->symbol_list, member) {
		LLVMTypeRef member_type;

		assert(nr < MAX_STRUCT_MEMBERS);

		member_type = symbol_type(C, module, member);

		elem_types[nr++] = member_type; 
	} END_FOR_EACH_PTR(member);

	LLVMStructSetBody(ret, elem_types, nr, 0 /* packed? */); 
	return ret;
}

static LLVMTypeRef sym_union_type(struct dmr_C *C, LLVMModuleRef module, struct symbol *sym)
{
	LLVMTypeRef elements;
	unsigned union_size;

	/*
	 * There's no union support in the LLVM API so we treat unions as
	 * opaque structs. The downside is that we lose type information on the
	 * members but as LLVM doesn't care, neither do we.
	 */
	union_size = sym->bit_size / 8;

	elements = LLVMArrayType(LLVMInt8Type(), union_size);

	return LLVMStructType(&elements, 1, 0 /* packed? */);
}

static LLVMTypeRef sym_ptr_type(struct dmr_C *C, LLVMModuleRef module, struct symbol *sym)
{
	LLVMTypeRef type;

	/* 'void *' is treated like 'char *' */
	if (is_void_type(C->S, sym->ctype.base_type))
		type = LLVMInt8Type();
	else
		type = symbol_type(C, module, sym->ctype.base_type);

	return LLVMPointerType(type, 0);
}

static LLVMTypeRef sym_basetype_type(struct dmr_C *C, struct symbol *sym)
{
	LLVMTypeRef ret = NULL;

	if (symbol_is_fp_type(C, sym)) {
		switch (sym->bit_size) {
		case 32:
			ret = LLVMFloatType();
			break;
		case 64:
			ret = LLVMDoubleType();
			break;
		case 80:
			ret = LLVMX86FP80Type();
			break;
		default:
			die(C, "invalid bit size %d for type %d", sym->bit_size, sym->type);
			break;
		}
	} else {
		switch (sym->bit_size) {
		case -1:
			ret = LLVMVoidType();
			break;
		case 1:
			ret = LLVMInt1Type();
			break;
		case 8:
			ret = LLVMInt8Type();
			break;
		case 16:
			ret = LLVMInt16Type();
			break;
		case 32:
			ret = LLVMInt32Type();
			break;
		case 64:
			ret = LLVMInt64Type();
			break;
		default:
			die(C, "invalid bit size %d for type %d", sym->bit_size, sym->type);
			break;
		}
	}

	return ret;
}

static LLVMTypeRef symbol_type(struct dmr_C *C, LLVMModuleRef module, struct symbol *sym)
{
	LLVMTypeRef ret = NULL;

	/* don't cache the result for SYM_NODE */
	if (sym->type == SYM_NODE)
		return symbol_type(C, module, sym->ctype.base_type);

	if (sym->aux)
		return sym->aux;

	switch (sym->type) {
	case SYM_BITFIELD:
	case SYM_ENUM:
		ret = symbol_type(C, module, sym->ctype.base_type);
		break;
	case SYM_BASETYPE:
		ret = sym_basetype_type(C, sym);
		break;
	case SYM_PTR:
		ret = sym_ptr_type(C, module, sym);
		break;
	case SYM_UNION:
		ret = sym_union_type(C, module, sym);
		break;
	case SYM_STRUCT:
		ret = sym_struct_type(C, module, sym);
		break;
	case SYM_ARRAY:
		ret = sym_array_type(C, module, sym);
		break;
	case SYM_FN:
		ret = sym_func_type(C, module, sym);
		break;
	default:
		assert(0);
	}

	/* cache the result */
	sym->aux = ret;
	return ret;
}

static LLVMTypeRef insn_symbol_type(struct dmr_C *C, LLVMModuleRef module, struct instruction *insn)
{
	if (insn->type)
		return symbol_type(C, module, insn->type);

	switch (insn->size) {
		case 8:		return LLVMInt8Type();
		case 16:	return LLVMInt16Type();
		case 32:	return LLVMInt32Type();
		case 64:	return LLVMInt64Type();

		default:
			die(C, "invalid bit size %d", insn->size);
			break;
	}

	return NULL;	/* not reached */
}

static LLVMLinkage data_linkage(struct dmr_C *C, struct symbol *sym)
{
	if (sym->ctype.modifiers & MOD_STATIC)
		return LLVMPrivateLinkage;

	return LLVMExternalLinkage;
}

static LLVMLinkage function_linkage(struct dmr_C *C, struct symbol *sym)
{
	if (sym->ctype.modifiers & MOD_STATIC)
		return LLVMInternalLinkage;

	return LLVMExternalLinkage;
}

#define MAX_PSEUDO_NAME 64

static void pseudo_name(struct dmr_C *C, pseudo_t pseudo, char *buf)
{
	switch (pseudo->type) {
	case PSEUDO_REG:
		snprintf(buf, MAX_PSEUDO_NAME, "R%d", pseudo->nr);
		break;
	case PSEUDO_SYM:
		assert(0);
		break;
	case PSEUDO_VAL:
		assert(0);
		break;
	case PSEUDO_ARG: {
		assert(0);
		break;
	}
	case PSEUDO_PHI:
		snprintf(buf, MAX_PSEUDO_NAME, "PHI%d", pseudo->nr);
		break;
	case PSEUDO_VOID:
		buf[0] = '\0';
		break;
	default:
		assert(0);
	}
}

static LLVMValueRef val_to_value(struct dmr_C *C, struct function *fn, unsigned long long val, struct symbol *ctype)
{
	LLVMTypeRef dtype;
	LLVMTypeRef itype;
	LLVMValueRef result;

	assert(ctype);
	dtype = symbol_type(C, fn->module, ctype);
	LLVMTypeKind kind = LLVMGetTypeKind(dtype);
	switch (kind) {
	case LLVMPointerTypeKind:
		itype = LLVMIntType(C->target->bits_in_pointer);
		result = LLVMConstInt(itype, val, 1);
		result = LLVMConstIntToPtr(result, dtype);
		break;
	case LLVMIntegerTypeKind:
		result = LLVMConstInt(dtype, val, 1);
		break;
	case LLVMFloatTypeKind:
	case LLVMDoubleTypeKind:
		result = LLVMConstReal(dtype, (double)val);
		break;
	default:
		printf("unsupported kind %d\n", kind);
		assert(0);
	}
	return result;
}

static LLVMValueRef pseudo_to_value(struct dmr_C *C, struct function *fn, struct instruction *insn, pseudo_t pseudo)
{
	LLVMValueRef result = NULL;

	switch (pseudo->type) {
	case PSEUDO_REG:
		result = pseudo->priv;
		if (!result) {
			fprintf(stderr, "pseudo uninitialized, please check if variable has been initialized: insn %s\n", show_instruction(C, insn));
			abort();
		}
		break;
	case PSEUDO_SYM: {
		struct symbol *sym = pseudo->sym;
		struct expression *expr;

		result = (LLVMValueRef)sym->priv;
		if (result)
			return result;

		assert(sym->bb_target == NULL);

		expr = sym->initializer;
		if (expr) {
			switch (expr->type) {
			case EXPR_STRING: {
				const char *s = expr->string->data;
				LLVMValueRef indices[] = { LLVMConstInt(LLVMInt64Type(), 0, 0), LLVMConstInt(LLVMInt64Type(), 0, 0) };
				LLVMValueRef data;

				data = LLVMAddGlobal(fn->module, LLVMArrayType(LLVMInt8Type(), strlen(s) + 1), ".str");
				LLVMSetLinkage(data, LLVMPrivateLinkage);
				LLVMSetGlobalConstant(data, 1);
				char *scopy = allocator_allocate(&C->byte_allocator, strlen(s) + 1);
				strcpy(scopy, s);
				LLVMSetInitializer(data, LLVMConstString(scopy, strlen(scopy) + 1, true));

				result = LLVMConstGEP(data, indices, ARRAY_SIZE(indices));
				sym->priv = result;
				break;
			}
			case EXPR_SYMBOL: {
				assert(0 && "unresolved symbol reference");
				struct symbol *sym = expr->symbol;
				result = LLVMGetNamedGlobal(fn->module, show_ident(C, sym->ident));
				assert(result != NULL);
				break;
			}
			case EXPR_VALUE:
				result = LLVMConstInt(symbol_type(C, fn->module, sym), expr->value, 1);
				sym->priv = result;
				break;
			case EXPR_FVALUE:
				result = LLVMConstReal(symbol_type(C, fn->module, sym), expr->fvalue);
				sym->priv = result;
				break;
			default:
				fprintf(stderr, "Unsupported expr type in initializer: %d\n", expr->type);
				show_expression(C, expr);
				exit(1);
			}
		}
		else {
			const char *name = show_ident(C, sym->ident);
			LLVMTypeRef type = symbol_type(C, fn->module, sym);
			if (LLVMGetTypeKind(type) == LLVMFunctionTypeKind) {
				result = LLVMGetNamedFunction(fn->module, name);
				if (!result)
					result = LLVMAddFunction(fn->module, name, type);
				sym->priv = result;
			}
			else if (is_extern(sym) || is_toplevel(sym)) {
				result = LLVMGetNamedGlobal(fn->module, name);
				if (!result)
					result = LLVMAddGlobal(fn->module, type, name);
				sym->priv = result;
			}
			else {
				char localname[256] = { 0 };
				/* insert alloca into entry block */
				/* LLVM requires allocas to be at the start */
				LLVMBasicBlockRef entrybbr = LLVMGetEntryBasicBlock(fn->fn);
				/* Use temporary Builder as we don't want to mess the function builder */
				LLVMBuilderRef tmp_builder = LLVMCreateBuilder();
				LLVMValueRef firstins = LLVMGetFirstInstruction(entrybbr);
				if (firstins)
					LLVMPositionBuilderBefore(tmp_builder, firstins);
				else
					LLVMPositionBuilderAtEnd(tmp_builder, entrybbr);
				/* Since multiple locals may have same name but in different scopes we
				   append the symbol's address to make each variable unique */
				snprintf(localname, sizeof localname, "%s_%p", name, sym);
				result = LLVMBuildAlloca(tmp_builder, type, localname);
				LLVMDisposeBuilder(tmp_builder);
				/* Store the alloca instruction for references to the value later on.
				   TODO - should we convert this to pointer here? */
				sym->priv = result;
			}
		}
		break;
	}
	case PSEUDO_VAL: {
		result = val_to_value(C, fn, pseudo->value, pseudo->sym);
		break;
	}
	case PSEUDO_ARG: {
		result = LLVMGetParam(fn->fn, pseudo->nr - 1);
		break;
	}
	case PSEUDO_PHI:
		result = pseudo->priv;
		break;
	case PSEUDO_VOID:
		result = NULL;
		break;
	default:
		assert(0);
	}

	return result;
}

static LLVMValueRef calc_gep(struct dmr_C *C, LLVMBuilderRef builder, LLVMValueRef base, LLVMValueRef off)
{
	LLVMTypeRef type = LLVMTypeOf(base);
	unsigned int as = LLVMGetPointerAddressSpace(type);
	LLVMTypeRef bytep = LLVMPointerType(LLVMInt8Type(), as);
	LLVMValueRef addr;

	/* convert base to char* type */
	base = LLVMBuildPointerCast(builder, base, bytep, "");
	/* addr = base + off */
	addr = LLVMBuildInBoundsGEP(builder, base, &off, 1, "");
	/* convert back to the actual pointer type */
	addr = LLVMBuildPointerCast(builder, addr, type, "");
	return addr;
}

static LLVMRealPredicate translate_fop(int opcode)
{
	static const LLVMRealPredicate trans_tbl[] = {
		[OP_SET_EQ]	= LLVMRealOEQ,
		[OP_SET_NE]	= LLVMRealUNE,
		[OP_SET_LE]	= LLVMRealOLE,
		[OP_SET_GE]	= LLVMRealOGE,
		[OP_SET_LT]	= LLVMRealOLT,
		[OP_SET_GT]	= LLVMRealOGT,
		/* Are these used with FP? */
		[OP_SET_B]	= LLVMRealOLT,
		[OP_SET_A]	= LLVMRealOGT,
		[OP_SET_BE]	= LLVMRealOLE,
		[OP_SET_AE]	= LLVMRealOGE,
	};

	return trans_tbl[opcode];
}

static LLVMIntPredicate translate_op(int opcode)
{
	static const LLVMIntPredicate trans_tbl[] = {
		[OP_SET_EQ]	= LLVMIntEQ,
		[OP_SET_NE]	= LLVMIntNE,
		[OP_SET_LE]	= LLVMIntSLE,
		[OP_SET_GE]	= LLVMIntSGE,
		[OP_SET_LT]	= LLVMIntSLT,
		[OP_SET_GT]	= LLVMIntSGT,
		[OP_SET_B]	= LLVMIntULT,
		[OP_SET_A]	= LLVMIntUGT,
		[OP_SET_BE]	= LLVMIntULE,
		[OP_SET_AE]	= LLVMIntUGE,
	};

	return trans_tbl[opcode];
}

static void output_op_binary(struct dmr_C *C, struct function *fn, struct instruction *insn)
{
	LLVMValueRef lhs, rhs, target;
	char target_name[64];

	lhs = pseudo_to_value(C, fn, insn, insn->src1);

	rhs = pseudo_to_value(C, fn, insn, insn->src2);

	pseudo_name(C, insn->target, target_name);

	switch (insn->opcode) {
	/* Binary */
	case OP_ADD:
		if (symbol_is_fp_type(C, insn->type))
			target = LLVMBuildFAdd(fn->builder, lhs, rhs, target_name);
		else if (LLVMGetTypeKind(LLVMTypeOf(lhs)) == LLVMPointerTypeKind)
			target = calc_gep(C, fn->builder, lhs, rhs);
		else if (LLVMGetTypeKind(LLVMTypeOf(rhs)) == LLVMPointerTypeKind) 
			target = calc_gep(C, fn->builder, rhs, lhs);
		else 
			target = LLVMBuildAdd(fn->builder, lhs, rhs, target_name);
		break;
	case OP_SUB:
		if (symbol_is_fp_type(C, insn->type))
			target = LLVMBuildFSub(fn->builder, lhs, rhs, target_name);
		else
			target = LLVMBuildSub(fn->builder, lhs, rhs, target_name);
		break;
	case OP_MULU:
		if (symbol_is_fp_type(C, insn->type))
			target = LLVMBuildFMul(fn->builder, lhs, rhs, target_name);
		else
			target = LLVMBuildMul(fn->builder, lhs, rhs, target_name);
		break;
	case OP_MULS:
		assert(!symbol_is_fp_type(C, insn->type));
		target = LLVMBuildMul(fn->builder, lhs, rhs, target_name);
		break;
	case OP_DIVU:
		if (symbol_is_fp_type(C, insn->type))
			target = LLVMBuildFDiv(fn->builder, lhs, rhs, target_name);
		else
			target = LLVMBuildUDiv(fn->builder, lhs, rhs, target_name);
		break;
	case OP_DIVS:
		assert(!symbol_is_fp_type(C, insn->type));
		target = LLVMBuildSDiv(fn->builder, lhs, rhs, target_name);
		break;
	case OP_MODU:
		assert(!symbol_is_fp_type(C, insn->type));
		target = LLVMBuildURem(fn->builder, lhs, rhs, target_name);
		break;
	case OP_MODS:
		assert(!symbol_is_fp_type(C, insn->type));
		target = LLVMBuildSRem(fn->builder, lhs, rhs, target_name);
		break;
	case OP_SHL:
		assert(!symbol_is_fp_type(C, insn->type));
		target = LLVMBuildShl(fn->builder, lhs, rhs, target_name);
		break;
	case OP_LSR:
		assert(!symbol_is_fp_type(C, insn->type));
		target = LLVMBuildLShr(fn->builder, lhs, rhs, target_name);
		break;
	case OP_ASR:
		assert(!symbol_is_fp_type(C, insn->type));
		target = LLVMBuildAShr(fn->builder, lhs, rhs, target_name);
		break;
	
	/* Logical */
	case OP_AND:
		assert(!symbol_is_fp_type(C, insn->type));
		target = LLVMBuildAnd(fn->builder, lhs, rhs, target_name);
		break;
	case OP_OR:
		assert(!symbol_is_fp_type(C, insn->type));
		target = LLVMBuildOr(fn->builder, lhs, rhs, target_name);
		break;
	case OP_XOR:
		assert(!symbol_is_fp_type(C, insn->type));
		target = LLVMBuildXor(fn->builder, lhs, rhs, target_name);
		break;
	case OP_AND_BOOL: {
		LLVMValueRef lhs_nz, rhs_nz;
		LLVMTypeRef dst_type;

		lhs_nz = LLVMBuildIsNotNull(fn->builder, lhs, "");
		rhs_nz = LLVMBuildIsNotNull(fn->builder, rhs, "");
		target = LLVMBuildAnd(fn->builder, lhs_nz, rhs_nz, target_name);

		dst_type = insn_symbol_type(C, fn->module, insn);
		target = LLVMBuildZExt(fn->builder, target, dst_type, target_name);
		break;
	}
	case OP_OR_BOOL: {
		LLVMValueRef lhs_nz, rhs_nz;
		LLVMTypeRef dst_type;

		lhs_nz = LLVMBuildIsNotNull(fn->builder, lhs, "");
		rhs_nz = LLVMBuildIsNotNull(fn->builder, rhs, "");
		target = LLVMBuildOr(fn->builder, lhs_nz, rhs_nz, target_name);

		dst_type = insn_symbol_type(C, fn->module, insn);
		target = LLVMBuildZExt(fn->builder, target, dst_type, target_name);
		break;
	}

	default:
		assert(0);
		break;
	}
	insn->target->priv = target;
}

static void output_op_compare(struct dmr_C *C, struct function *fn, struct instruction *insn)
{
	LLVMValueRef lhs, rhs, target;
	char target_name[64];

	if (insn->src1->type == PSEUDO_VAL)
		lhs = val_to_value(C, fn, insn->src1->value, pseudo_type(C, insn->src2));
	else
		lhs = pseudo_to_value(C, fn, insn, insn->src1);
	if (insn->src2->type == PSEUDO_VAL)
		rhs = val_to_value(C, fn, insn->src2->value, pseudo_type(C, insn->src1));
	else
		rhs = pseudo_to_value(C, fn, insn, insn->src2);

	pseudo_name(C, insn->target, target_name);

	LLVMTypeRef dst_type = insn_symbol_type(C, fn->module, insn);

	switch  (LLVMGetTypeKind(LLVMTypeOf(lhs))) {
	case LLVMPointerTypeKind:
	case LLVMIntegerTypeKind: {
		LLVMIntPredicate op = translate_op(insn->opcode);

		target = LLVMBuildICmp(fn->builder, op, lhs, rhs, target_name);
		break;
	}
	case LLVMHalfTypeKind:
	case LLVMFloatTypeKind:
	case LLVMDoubleTypeKind:
	case LLVMX86_FP80TypeKind:
	case LLVMFP128TypeKind:
	case LLVMPPC_FP128TypeKind: {
		LLVMRealPredicate op = translate_fop(insn->opcode);

		target = LLVMBuildFCmp(fn->builder, op, lhs, rhs, target_name);
		break;
	}
	default:
		assert(0);
	}

	target = LLVMBuildZExt(fn->builder, target, dst_type, target_name);

	insn->target->priv = target;
}
static void output_op_ret(struct dmr_C *C, struct function *fn, struct instruction *insn)
{
	pseudo_t pseudo = insn->src;

	if (pseudo && pseudo != VOID_PSEUDO(C)) {
		LLVMValueRef result = pseudo_to_value(C, fn, insn, pseudo);

		LLVMBuildRet(fn->builder, result);
	} else
		LLVMBuildRetVoid(fn->builder);
}

static LLVMValueRef calc_memop_addr(struct dmr_C *C, struct function *fn, struct instruction *insn)
{
	LLVMTypeRef int_type, addr_type;
	LLVMValueRef src, off, addr;
	unsigned int as;

	/* int type large enough to hold a pointer */
	int_type = LLVMIntType(C->target->bits_in_pointer);

	off = LLVMConstInt(int_type, (int) insn->offset, 0);

	/* convert src to the effective pointer type */
	src = pseudo_to_value(C, fn, insn, insn->src);
	as = LLVMGetPointerAddressSpace(LLVMTypeOf(src));
	addr_type = LLVMPointerType(insn_symbol_type(C, fn->module, insn), as);
	src = LLVMBuildPointerCast(fn->builder, src, addr_type, "");

	/* addr = src + off */
	addr = calc_gep(C, fn->builder, src, off);
	return addr;
}


static void output_op_load(struct dmr_C *C, struct function *fn, struct instruction *insn)
{
	LLVMValueRef addr, target;

	addr = calc_memop_addr(C, fn, insn);
		
	/* perform load */
	target = LLVMBuildLoad(fn->builder, addr, "load_target");

	insn->target->priv = target;
}

static void output_op_store(struct dmr_C *C, struct function *fn, struct instruction *insn)
{
	LLVMValueRef addr, target_in;

	addr = calc_memop_addr(C, fn, insn);

	target_in = pseudo_to_value(C, fn, insn, insn->target);

	/* perform store */
	LLVMBuildStore(fn->builder, target_in, addr);
}

static LLVMValueRef bool_value(struct dmr_C *C, struct function *fn, LLVMValueRef value)
{
	if (LLVMTypeOf(value) != LLVMInt1Type())
		value = LLVMBuildIsNotNull(fn->builder, value, "cond");

	return value;
}

static void output_op_br(struct dmr_C *C, struct function *fn, struct instruction *br)
{
	if (br->cond) {
		LLVMValueRef cond = bool_value(C, fn,
				pseudo_to_value(C, fn, br, br->cond));

		LLVMBuildCondBr(fn->builder, cond,
				br->bb_true->priv,
				br->bb_false->priv);
	} else
		LLVMBuildBr(fn->builder,
			    br->bb_true ? br->bb_true->priv :
			    br->bb_false->priv);
}

static void output_op_sel(struct dmr_C *C, struct function *fn, struct instruction *insn)
{
	LLVMValueRef target, src1, src2, src3;

	src1 = bool_value(C, fn, pseudo_to_value(C, fn, insn, insn->src1));
	src2 = pseudo_to_value(C, fn, insn, insn->src2);
	src3 = pseudo_to_value(C, fn, insn, insn->src3);

	target = LLVMBuildSelect(fn->builder, src1, src2, src3, "select");

	insn->target->priv = target;
}

static void output_op_switch(struct dmr_C *C, struct function *fn, struct instruction *insn)
{
	LLVMValueRef sw_val, target;
	struct basic_block *def = NULL;
	struct multijmp *jmp;
	int n_jmp = 0;

	FOR_EACH_PTR(insn->multijmp_list, jmp) {
		if (jmp->begin == jmp->end) {		/* case N */
			n_jmp++;
		} else if (jmp->begin < jmp->end) {	/* case M..N */
			assert(0);
		} else					/* default case */
			def = jmp->target;
	} END_FOR_EACH_PTR(jmp);

	sw_val = pseudo_to_value(C, fn, insn, insn->target);
	target = LLVMBuildSwitch(fn->builder, sw_val,
				 def ? def->priv : NULL, n_jmp);

	FOR_EACH_PTR(insn->multijmp_list, jmp) {
		if (jmp->begin == jmp->end) {		/* case N */
			LLVMAddCase(target,
				LLVMConstInt(LLVMInt32Type(), jmp->begin, 0),
				jmp->target->priv);
		} else if (jmp->begin < jmp->end) {	/* case M..N */
			assert(0);
		}
	} END_FOR_EACH_PTR(jmp);

	//insn->target->priv = target;
}

static struct symbol *get_function_basetype(struct symbol *type)
{
	if (type->type == SYM_PTR)
		type = type->ctype.base_type;
	assert(type->type == SYM_FN);
	return type;
}

static void output_op_call(struct dmr_C *C, struct function *fn, struct instruction *insn)
{
	LLVMValueRef target, func;
	int n_arg = 0, i;
	struct pseudo *arg;
	LLVMValueRef *args;
	char name[64];

	n_arg = ptrlist_size(insn->arguments);
	args = alloca(n_arg * sizeof(LLVMValueRef));

	i = 0;
	FOR_EACH_PTR(insn->arguments, arg) {
		struct symbol *ftype = get_function_basetype(insn->fntype);
		LLVMValueRef value;
		if (arg->type == PSEUDO_VAL) {
			struct symbol *atype;
			atype = get_nth_symbol(ftype->arguments, i);
			/* Value pseudos do not have type information. */
			/* Use the function prototype to get the type. */
			if (atype)
				value = val_to_value(C, fn, arg->value, atype);
			else
				value = val_to_value(C, fn, arg->value, arg->sym);
		}
		else {
			value = pseudo_to_value(C, fn, insn, arg);
		}
		args[i++] = value;
	} END_FOR_EACH_PTR(arg);

	func = pseudo_to_value(C, fn, insn, insn->func);
	pseudo_name(C, insn->target, name);
	target = LLVMBuildCall(fn->builder, func, args, n_arg, name);

	insn->target->priv = target;
}

static void output_op_phisrc(struct dmr_C *C, struct function *fn, struct instruction *insn)
{
	LLVMValueRef v;
	struct instruction *phi;

	assert(insn->target->priv == NULL);

	/* target = src */
	v = pseudo_to_value(C, fn, insn, insn->phi_src);

	FOR_EACH_PTR(insn->phi_users, phi) {
		LLVMValueRef load, ptr;

		assert(phi->opcode == OP_PHI);
		/* phi must be load from alloca */
		load = phi->target->priv;
		assert(LLVMGetInstructionOpcode(load) == LLVMLoad);
		ptr = LLVMGetOperand(load, 0);
		/* store v to alloca */
		LLVMBuildStore(fn->builder, v, ptr);
	} END_FOR_EACH_PTR(phi);
}

static void output_op_phi(struct dmr_C *C, struct function *fn, struct instruction *insn)
{
	LLVMValueRef load = insn->target->priv;

	/* forward load */
	assert(LLVMGetInstructionOpcode(load) == LLVMLoad);
	/* forward load has no parent block */
	assert(!LLVMGetInstructionParent(load));
	/* finalize load in current block  */
	LLVMInsertIntoBuilder(fn->builder, load);
}

static void output_op_ptrcast(struct dmr_C *C, struct function *fn, struct instruction *insn)
{
	LLVMValueRef src, target;
	char target_name[64];
	LLVMTypeRef dtype;
	LLVMOpcode op;

	src = insn->src->priv;
	if (!src)
		src = pseudo_to_value(C, fn, insn, insn->src);

	pseudo_name(C, insn->target, target_name);

	assert(!symbol_is_fp_type(C, insn->type));

	dtype = insn_symbol_type(C, fn->module, insn);
	switch (LLVMGetTypeKind(LLVMTypeOf(src))) {
		case LLVMPointerTypeKind:
			op = LLVMBitCast;
			break;
		case LLVMIntegerTypeKind:
			op = LLVMIntToPtr;
			break;
		default:
			assert(0);
	}

	target = LLVMBuildCast(fn->builder, op, src, dtype, target_name);
	insn->target->priv = target;
}

static void output_op_cast(struct dmr_C *C, struct function *fn, struct instruction *insn, LLVMOpcode op)
{
	LLVMValueRef src, target;
	LLVMTypeRef dtype;
	char target_name[64];
	unsigned int width;

	if (is_ptr_type(insn->type)) {
		output_op_ptrcast(C, fn, insn);
		return;
	}

	src = insn->src->priv;
	if (!src)
		src = pseudo_to_value(C, fn, insn, insn->src);

	pseudo_name(C, insn->target, target_name);

	assert(!symbol_is_fp_type(C, insn->type));

	dtype = insn_symbol_type(C, fn->module, insn);
	switch (LLVMGetTypeKind(LLVMTypeOf(src))) {
		case LLVMPointerTypeKind:
			op = LLVMPtrToInt;
			break;
		case LLVMIntegerTypeKind:
			width = LLVMGetIntTypeWidth(LLVMTypeOf(src));
			if (insn->size < width)
				op = LLVMTrunc;
			else if (insn->size == width)
				op = LLVMBitCast;
			break;
		default:
			assert(0);
	}

	target = LLVMBuildCast(fn->builder, op, src, dtype, target_name);
	insn->target->priv = target;
}

static void output_op_fpcast(struct dmr_C *C, struct function *fn, struct instruction *insn)
{
	LLVMValueRef src, target;
	char target_name[64];
	LLVMTypeRef dtype;
	LLVMOpcode op;

	src = insn->src->priv;
	if (!src)
		src = pseudo_to_value(C, fn, insn, insn->src);

	pseudo_name(C, insn->target, target_name);

	dtype = insn_symbol_type(C, fn->module, insn);
	switch (LLVMGetTypeKind(LLVMTypeOf(src))) {
	case LLVMIntegerTypeKind:
		op = LLVMSIToFP;
		break;
	case LLVMFloatTypeKind: {
		if (insn->size == 32)
			op = LLVMBitCast;
		else if (insn->size == 64)
			op = LLVMFPExt;
		else
			assert(0 && "Unsupported source float type in fpcast");
		break;
	}
	case LLVMDoubleTypeKind: {
		if (insn->size == 32)
			op = LLVMFPTrunc;
		else if (insn->size == 64)
			op = LLVMBitCast;
		else
			assert(0 && "unsupported source double type in fpcast");
		break;
	}
	default:
		assert(0 && "unsupported source type in fpcast");
	}

	target = LLVMBuildCast(fn->builder, op, src, dtype, target_name);
	insn->target->priv = target;
}


static void output_op_copy(struct dmr_C *C, struct function *fn, struct instruction *insn,
			   pseudo_t pseudo)
{
	LLVMValueRef src, target;
	LLVMTypeRef const_type;
	char target_name[64];

	pseudo_name(C, insn->target, target_name);
	src = pseudo_to_value(C, fn, insn, pseudo);
	const_type = insn_symbol_type(C, fn->module, insn);

	/*
	 * This is nothing more than 'target = src'
	 *
	 * TODO: find a better way to provide an identity function,
	 * than using "X + 0" simply to produce a new LLVM pseudo
	 */

	if (symbol_is_fp_type(C, insn->type))
		target = LLVMBuildFAdd(fn->builder, src,
			LLVMConstReal(const_type, 0.0), target_name);
	else
		target = LLVMBuildAdd(fn->builder, src,
			LLVMConstInt(const_type, 0, 0), target_name);

	insn->target->priv = target;
}

static void output_op_setval(struct dmr_C *C, struct function *fn, struct instruction *insn) 
{
	struct expression *expr = insn->val;
	pseudo_t pseudo = insn->target;
	char target_name[64];
	LLVMTypeRef const_type;
	LLVMValueRef target = NULL;

	if (!expr)
		return;

	pseudo_name(C, insn->target, target_name);
	const_type = insn_symbol_type(C, fn->module, insn);

	switch (expr->type) {
	case EXPR_FVALUE:
		target = LLVMConstReal(const_type, expr->fvalue);
		break;
	default:
		assert(0 && "unsupported expression type in setval");
	}

	insn->target->priv = target;
}

static void output_op_symaddr(struct dmr_C *C, struct function *fn, struct instruction *insn)
{
	LLVMValueRef res, src;
	LLVMTypeRef dtype;
	char name[64];

	src = pseudo_to_value(C, fn, insn, insn->symbol);
	dtype = symbol_type(C, fn->module, insn->type);
	pseudo_name(C, insn->target, name);
	res = LLVMBuildBitCast(fn->builder, src, dtype, name);
	insn->target->priv = res;
}

static void output_op_not(struct dmr_C *C, struct function *fn, struct instruction *insn)
{
	LLVMValueRef src, target;
	char target_name[64];

	src = pseudo_to_value(C, fn, insn, insn->src);

	pseudo_name(C, insn->target, target_name);

	target = LLVMBuildNot(fn->builder, src, target_name);

	insn->target->priv = target;
}

static void output_op_neg(struct dmr_C *C, struct function *fn, struct instruction *insn)
{
	LLVMValueRef src, target;
	char target_name[64];

	src = pseudo_to_value(C, fn, insn, insn->src);

	pseudo_name(C, insn->target, target_name);

	if (symbol_is_fp_type(C, insn->type))
		target = LLVMBuildFNeg(fn->builder, src, target_name);
	else
		target = LLVMBuildNeg(fn->builder, src, target_name);

	insn->target->priv = target;
}

static void output_insn(struct dmr_C *C, struct function *fn, struct instruction *insn)
{
	switch (insn->opcode) {
	case OP_RET:
		output_op_ret(C, fn, insn);
		break;
	case OP_BR:
		output_op_br(C, fn, insn);
		break;
	case OP_SYMADDR:
		output_op_symaddr(C, fn, insn);
		break;
	case OP_SETVAL:
		output_op_setval(C, fn, insn);
		break;
	case OP_SWITCH:
		output_op_switch(C, fn, insn);
		break;
	case OP_COMPUTEDGOTO:
		assert(0);
		break;
	case OP_PHISOURCE:
		output_op_phisrc(C, fn, insn);
		break;
	case OP_PHI:
		output_op_phi(C, fn, insn);
		break;
	case OP_LOAD:
		output_op_load(C, fn, insn);
		break;
	case OP_LNOP:
		assert(0);
		break;
	case OP_STORE:
		output_op_store(C, fn, insn);
		break;
	case OP_SNOP:
		assert(0);
		break;
	case OP_INLINED_CALL:
		assert(0);
		break;
	case OP_CALL:
		output_op_call(C, fn, insn);
		break;
	case OP_CAST:
		output_op_cast(C, fn, insn, LLVMZExt);
		break;
	case OP_SCAST:
		output_op_cast(C, fn, insn, LLVMSExt);
		break;
	case OP_FPCAST:
		output_op_fpcast(C, fn, insn);
		break;
	case OP_PTRCAST:
		output_op_ptrcast(C, fn, insn);
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
		output_op_binary(C, fn, insn);
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
		output_op_compare(C, fn, insn);
		break;
	case OP_SEL:
		output_op_sel(C, fn, insn);
		break;
	case OP_SLICE:
		assert(0);
		break;
	case OP_NOT:
		output_op_not(C, fn, insn);
		break;	
	case OP_NEG:
		output_op_neg(C, fn, insn);
		break;
	case OP_CONTEXT:
		assert(0);
		break;
	case OP_RANGE:
		assert(0);
		break;
	case OP_NOP:
		assert(0);
		break;
	case OP_DEATHNOTE:
		break;
	case OP_ASM:
		assert(0);
		break;
	case OP_COPY:
		output_op_copy(C, fn, insn, insn->src);
		break;
	default:
		break;
	}
}

static void output_bb(struct dmr_C *C, struct function *fn, struct basic_block *bb)
{
	struct instruction *insn;

	FOR_EACH_PTR(bb->insns, insn) {
		if (!insn->bb)
			continue;

		output_insn(C, fn, insn);
	}
	END_FOR_EACH_PTR(insn);
}

#define MAX_ARGS	64

static void output_fn(struct dmr_C *C, LLVMModuleRef module, struct entrypoint *ep)
{
	struct symbol *sym = ep->name;
	struct symbol *base_type = sym->ctype.base_type;
	struct symbol *ret_type = sym->ctype.base_type->ctype.base_type;
	LLVMTypeRef arg_types[MAX_ARGS];
	LLVMTypeRef return_type;
	struct function function = { .module = module };
	struct basic_block *bb;
	struct symbol *arg;
	const char *name;
	int nr_args = 0;

	FOR_EACH_PTR(base_type->arguments, arg) {
		struct symbol *arg_base_type = arg->ctype.base_type;

		arg_types[nr_args++] = symbol_type(C, module, arg_base_type);
	} END_FOR_EACH_PTR(arg);

	name = show_ident(C, sym->ident);

	return_type = symbol_type(C, module, ret_type);

	function.type = LLVMFunctionType(return_type, arg_types, nr_args, 0);

	function.fn = LLVMAddFunction(module, name, function.type);
	LLVMSetFunctionCallConv(function.fn, LLVMCCallConv);

	LLVMSetLinkage(function.fn, function_linkage(C, sym));

	function.builder = LLVMCreateBuilder();

	/* give a name to each argument */
	for (int i = 0; i < nr_args; i++) {
		char name[MAX_PSEUDO_NAME];
		LLVMValueRef arg;

		arg = LLVMGetParam(function.fn, i);
		snprintf(name, sizeof(name), "ARG%d", i+1);
		LLVMSetValueName(arg, name);
	}

	/* create the BBs */
	FOR_EACH_PTR(ep->bbs, bb) {
		static int nr_bb;
		LLVMBasicBlockRef bbr;
		char bbname[32];
		struct instruction *insn;

		sprintf(bbname, "L%d", nr_bb++);
		bbr = LLVMAppendBasicBlock(function.fn, bbname);

		bb->priv = bbr;

		/* allocate alloca for each phi */
		FOR_EACH_PTR(bb->insns, insn) {
			LLVMBasicBlockRef entrybbr;
			LLVMTypeRef phi_type;
			LLVMValueRef ptr;

			if (!insn->bb || insn->opcode != OP_PHI)
				continue;
			/* insert alloca into entry block */
			entrybbr = LLVMGetEntryBasicBlock(function.fn);
			LLVMPositionBuilderAtEnd(function.builder, entrybbr);
			phi_type = insn_symbol_type(C, module, insn);
			ptr = LLVMBuildAlloca(function.builder, phi_type, "");
			/* emit forward load for phi */
			LLVMClearInsertionPosition(function.builder);
			insn->target->priv = LLVMBuildLoad(function.builder, ptr, "phi");
		} END_FOR_EACH_PTR(insn);
	}
	END_FOR_EACH_PTR(bb);

	FOR_EACH_PTR(ep->bbs, bb) {
		LLVMPositionBuilderAtEnd(function.builder, bb->priv);

		output_bb(C, &function, bb);
	}
	END_FOR_EACH_PTR(bb);

	LLVMDisposeBuilder(function.builder);
}

static LLVMValueRef output_data(struct dmr_C *C, LLVMModuleRef module, struct symbol *sym)
{
	struct expression *initializer = sym->initializer;
	LLVMValueRef initial_value;
	LLVMValueRef data;
	const char *name;

	if (initializer) {
		switch (initializer->type) {
		case EXPR_VALUE:
			initial_value = LLVMConstInt(symbol_type(C, module, sym), initializer->value, 1);
			break;
		case EXPR_FVALUE:
			initial_value = LLVMConstReal(symbol_type(C, module, sym), initializer->fvalue);
			break;
		case EXPR_SYMBOL: {
			struct symbol *sym = initializer->symbol;
			initial_value = LLVMGetNamedGlobal(module, show_ident(C, sym->ident));
			if (!initial_value)
				initial_value = output_data(C, module, sym);
			break;
		}
		case EXPR_STRING: {
			const char *s = initializer->string->data;
			char *scopy = allocator_allocate(&C->byte_allocator, strlen(s) + 1);
			strcpy(scopy, s);
			initial_value = LLVMConstString(scopy, strlen(scopy) + 1, true);
			break;
		}
		default:
			fprintf(stderr, "Unsupported expr type in global data initializer: %d\n", initializer->type);
			show_expression(C, initializer);
			assert(0);
		}
	} else {
		LLVMTypeRef type = symbol_type(C, module, sym);
		initial_value = LLVMConstNull(type);
	}

	name = show_ident(C, sym->ident);

	data = LLVMAddGlobal(module, LLVMTypeOf(initial_value), name);

	LLVMSetLinkage(data, data_linkage(C, sym));
	if (sym->ctype.modifiers & MOD_CONST)
		LLVMSetGlobalConstant(data, 1);
	if (sym->ctype.modifiers & MOD_TLS)
		LLVMSetThreadLocal(data, 1);
	if (sym->ctype.alignment)
		LLVMSetAlignment(data, sym->ctype.alignment);

	if (!(sym->ctype.modifiers & MOD_EXTERN))
		LLVMSetInitializer(data, initial_value);

	sym->priv = data;

	return data;
}

static int is_prototype(struct symbol *sym)
{
	if (sym->type == SYM_NODE)
		sym = sym->ctype.base_type;
	return sym && sym->type == SYM_FN && !sym->stmt;
}

static int compile(struct dmr_C *C, LLVMModuleRef module, struct ptr_list *list)
{
	struct symbol *sym;

	FOR_EACH_PTR(list, sym) {
		struct entrypoint *ep;
		expand_symbol(C, sym);

		if (is_prototype(sym))
			continue;

		ep = linearize_symbol(C, sym);
		if (ep)
			output_fn(C, module, ep);
		else
			output_data(C, module, sym);
	}
	END_FOR_EACH_PTR(sym);

	return 0;
}

#ifndef LLVM_DEFAULT_TARGET_TRIPLE
#define LLVM_DEFAULT_TARGET_TRIPLE LLVM_HOSTTRIPLE
#endif

#define X86_LINUX_LAYOUT \
	"e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-" \
	"i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-" \
	"a0:0:64-f80:32:32-n8:16:32-S128"

#define X86_64_LINUX_LAYOUT \
	"e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-" \
	"i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-" \
	"a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"

static void set_target(struct dmr_C *C, LLVMModuleRef module)
{
	char target[] = LLVM_DEFAULT_TARGET_TRIPLE;
	const char *arch, *vendor, *os, *env, *layout = NULL;
	char triple[256];

	arch = strtok(target, "-");
	vendor = strtok(NULL, "-");
	os = strtok(NULL, "-");
	env = strtok(NULL, "-");

	if (!os)
		return;
	if (!env)
		env = "unknown";

	if (!strcmp(arch, "x86_64") && !strcmp(os, "linux")) {
		if (C->arch_m64) {
			layout = X86_64_LINUX_LAYOUT;
		} else {
			arch = "i386";
			layout = X86_LINUX_LAYOUT;
		}
	}

	/* unsupported target */
	if (!layout)
		return;

	snprintf(triple, sizeof(triple), "%s-%s-%s-%s", arch, vendor, os, env);
	// FIXME - what do we do here?
	//LLVMSetTarget(module, triple);
	//LLVMSetDataLayout(module, layout);
}

int main(int argc, char **argv)
{
	struct ptr_list *filelist = NULL;
	struct ptr_list *symlist;
	LLVMModuleRef module;
	char *file;

	struct dmr_C *C = new_dmr_C();

	symlist = sparse_initialize(C, argc, argv, &filelist);

	module = LLVMModuleCreateWithName("sparse");
	set_target(C, module);

	compile(C, module, symlist);

	/* need ->phi_users */
	C->dbg_dead = 1;
	FOR_EACH_PTR(filelist, file) {
		symlist = sparse(C, file);
		if (C->die_if_error)
			return 1;
		compile(C, module, symlist);
	} END_FOR_EACH_PTR(file);

	char *error_message = NULL;
	if (!LLVMVerifyModule(module, LLVMPrintMessageAction, &error_message)) {
		LLVMWriteBitcodeToFile(module, "out.bc");
	}
	if (error_message) {
		fprintf(stderr, "%s\n", error_message);
		LLVMDisposeMessage(error_message);
	}
	LLVMDisposeModule(module);

	destroy_dmr_C(C);

	return 0;
}
