#include <nanojitextra.h>

#include <assert.h>
#include <stdbool.h>
#include <stdio.h>
#include <string.h>

#include <expression.h>
#include <flow.h>
#include <linearize.h>
#include <port.h>
#include <symbol.h>

#define MAX_ARGS 6
#define MAX_JMP_INSTRUCTIONS 50

struct jmp_target {
	struct basic_block *bb;
	NJXLInsRef jmp_instruction;
};

enum ReturnType {
	RT_UNSUPPORTED = 0,
	RT_INT32 = 1,
	RT_INT64 = 2,
	RT_DOUBLE = 3,
	RT_PTR = 4
};

struct function {
	NJXFunctionBuilderRef builder;
	NJXContextRef module;
	NJXLInsRef args[MAX_ARGS];
	enum ReturnType return_type;
	struct jmp_target jumps[MAX_JMP_INSTRUCTIONS];
};

static bool add_jump_instruction(struct function *fn, struct basic_block *bb,
				 NJXLInsRef ins)
{
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
			NJX_set_jmp_target(insn, target);
		}
	}
	return true;
}

static bool check_supported_argtype(struct dmr_C *C, struct symbol *sym)
{
	if (dmrC_is_ptr_type(sym))
		return true;
	if (dmrC_is_int_type(C->S, sym)) {
		if (sym->bit_size == C->target->bits_in_pointer)
			return true;
	}
	fprintf(stderr, "Unsupported type in function argument\n");
	return false;
}

static enum ReturnType check_supported_returntype(struct dmr_C *C,
						  struct symbol *sym)
{
	if (dmrC_is_ptr_type(sym))
		return RT_PTR;
	if (dmrC_is_int_type(C->S, sym)) {
		if (sym->bit_size == C->target->bits_in_longlong)
			return RT_INT64;
		else if (sym->bit_size == C->target->bits_in_int)
			return RT_INT32;
	} else if (dmrC_is_float_type(C->S, sym)) {
		if (sym->bit_size == C->target->bits_in_double)
			return RT_DOUBLE;
	}
	fprintf(stderr, "Unsupported function return type\n");
	return RT_UNSUPPORTED;
}

static int32_t instruction_size(struct dmr_C *C, struct instruction *insn)
{
	return insn->size / C->target->bits_in_char;
}

static int32_t sym_size(struct dmr_C *C, struct symbol *sym)
{
	return sym->bit_size / C->target->bits_in_char;
}

static NJXLInsRef output_op_phi(struct dmr_C *C, struct function *fn,
				struct instruction *insn)
{
	NJXLInsRef ptr = insn->target->priv2;

	assert(ptr);
	if (!ptr)
		return NULL;

	NJXLInsRef load = NULL;
	switch (insn->size) {
	case 8:
		load = NJX_load_c2i(fn->builder, ptr, 0);
		break;
	case 16:
		load = NJX_load_s2i(fn->builder, ptr, 0);
		break;
	case 32:
		load = NJX_load_i(fn->builder, ptr, 0);
		break;
	case 64:
		load = NJX_load_q(fn->builder, ptr, 0);
		break;
	}
	insn->target->priv = load;
	return load;
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

static NJXLInsRef pseudo_to_value(struct dmr_C *C, struct function *fn,
				  struct symbol *ctype, pseudo_t pseudo)
{
	NJXLInsRef result = NULL;

	switch (pseudo->type) {
	case PSEUDO_REG:
		result = pseudo->priv;
		break;
	case PSEUDO_SYM:
		// result = get_sym_value(C, fn, pseudo);
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
	default:
		assert(0);
	}
	if (!result) {
		fprintf(stderr, "error: no result for pseudo\n");
		return NULL;
	}
	return result;
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
		assert(ptr);
		if (!ptr)
			return NULL;

		if (dmrC_is_int_type(C->S, insn->type)) {
			switch (phi->size) {
			case 8:
				NJX_store_i2c(fn->builder, v, ptr, 0);
				break;
			case 16:
				NJX_store_i2s(fn->builder, v, ptr, 0);
				break;
			case 32:
				NJX_store_i(fn->builder, v, ptr, 0);
				break;
			case 64:
				NJX_store_q(fn->builder, v, ptr, 0);
				break;
			}
		} else if (dmrC_is_ptr_type(insn->type)) {
			NJX_store_q(fn->builder, v, ptr, 0);
		} else if (dmrC_is_float_type(C->S, insn->type)) {
			if (insn->size == 64)
				NJX_store_d(fn->builder, v, ptr, 0);
			else
				NJX_store_f(fn->builder, v, ptr, 0);
		}
	}
	END_FOR_EACH_PTR(phi);
	return v;
}

static NJXLInsRef output_op_load(struct dmr_C *C, struct function *fn,
				 struct instruction *insn)
{
	NJXLInsRef ptr = pseudo_to_value(C, fn, insn->type, insn->src);

	assert(ptr);
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
		value = NJX_load_i(fn->builder, ptr, (int)insn->offset);
		break;
	case 64:
		value = NJX_load_q(fn->builder, ptr, (int)insn->offset);
		break;
	}
	insn->target->priv = value;
	return value;
}

static NJXLInsRef output_op_binary(struct dmr_C *C, struct function *fn,
				   struct instruction *insn)
{
	NJXLInsRef lhs, rhs, target;

	lhs = pseudo_to_value(C, fn, insn->type, insn->src1);
	if (!lhs)
		return NULL;

	rhs = pseudo_to_value(C, fn, insn->type, insn->src2);
	if (!rhs)
		return NULL;

	switch (insn->opcode) {
	/* Binary */
	case OP_ADD:
		if (dmrC_is_float_type(C->S, insn->type)) {
			if (insn->size == 64)
				target = NJX_addd(fn->builder, lhs, rhs);
			else
				target = NJX_addf(fn->builder, lhs, rhs);
		} else if (dmrC_is_ptr_type(insn->type)) {
			target = NJX_addq(fn->builder, lhs, rhs);
		} else {
			switch (insn->size) {
			case 64:
				target = NJX_addq(fn->builder, lhs, rhs);
				break;
			case 32:
				target = NJX_addi(fn->builder, lhs, rhs);
				break;
			default:
				return NULL;
			}
		}
		break;

	default:
		assert(0);
		return NULL;
	}

	insn->target->priv = target;

	return target;
}

static NJXLInsRef output_op_br(struct dmr_C *C, struct function *fn,
			       struct instruction *br)
{
	if (br->cond) {
		NJXLInsRef value = pseudo_to_value(C, fn, br->type, br->cond);
		if (!value)
			return NULL;
		NJXLInsRef cond = NULL;
		if (NJX_is_i(value)) {
			cond = NJX_eqi(fn->builder, value,
				       NJX_immi(fn->builder, 0));
		} else if (NJX_is_q(value)) {
			cond = NJX_eqq(fn->builder, value,
				       NJX_immq(fn->builder, 0));
		} else if (NJX_is_d(value)) {
			cond = NJX_eqd(fn->builder, value,
				       NJX_immd(fn->builder, 0));
		} else if (NJX_is_f(value)) {
			// cond = NJX_eqf(fn->builder, value,
			// NJX_immf(fn->builder, 0));
		}
		if (cond == NULL)
			return NULL;
		NJXLInsRef br1 =
		    NJX_cbr_true(fn->builder, cond, NULL); // br->bb_false->priv
		if (!add_jump_instruction(fn, br->bb_false, br1))
			return NULL;
		NJXLInsRef br2 =
		    NJX_cbr_false(fn->builder, cond, NULL); // br->bb_true->priv
		if (!add_jump_instruction(fn, br->bb_true, br2))
			return NULL;
		return br1;
	} else {
		NJXLInsRef br1 =
		    NJX_br(fn->builder, NULL); // br->bb_true ?
					       // br->bb_true->priv :
					       // br->bb_false->priv;
		if (br->bb_true) {
			if (!add_jump_instruction(fn, br->bb_true, br1))
				return NULL;
		} else {
			if (!add_jump_instruction(fn, br->bb_false, br1))
				return NULL;
		}
	}
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
		else if (NJX_is_d(result))
			return NJX_retd(fn->builder, result);
		else
			return NULL;
	} else
		return NJX_ret(
		    fn->builder); // return LLVMBuildRetVoid(fn->builder);
}

/* return 1 on success, 0 on failure */
static int output_insn(struct dmr_C *C, struct function *fn,
		       struct instruction *insn)
{
	NJXLInsRef v = NULL;
	switch (insn->opcode) {
	case OP_RET:
		v = output_op_ret(C, fn, insn);
		break;
	case OP_BR:
		v = output_op_br(C, fn, insn);
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
	case OP_SETVAL:
	case OP_SWITCH:
	case OP_COMPUTEDGOTO:
	case OP_LNOP:
	case OP_STORE:
	case OP_SNOP:
	case OP_CALL:
	case OP_CAST:
	case OP_SCAST:
	case OP_FPCAST:
	case OP_PTRCAST:
		return 1;

	case OP_ADD:
		v = output_op_binary(C, fn, insn);
		break;

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
	case OP_SEL:
	case OP_SLICE:
	case OP_NOT:
	case OP_NEG:
	case OP_CONTEXT:
	case OP_RANGE:
	case OP_NOP:
	case OP_ASM:
		return 1;

	default:
		return 1;
	}

	if (v == NULL)
		dmrC_sparse_error(C, insn->pos,
				  "failed to output instruction %s\n",
				  dmrC_show_instruction(C, insn));
	return 1; //  v != NULL;
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

static bool output_fn(struct dmr_C *C, NJXContextRef module,
		      struct entrypoint *ep)
{
	struct symbol *sym = ep->name;
	struct symbol *base_type = sym->ctype.base_type;
	struct symbol *ret_type = sym->ctype.base_type->ctype.base_type;
	struct function function = {.module = module};
	struct basic_block *bb;
	struct symbol *arg;
	const char *name;
	int nr_args = 0;

	if (base_type->variadic) {
		fprintf(stderr, "Variadic functions are not supported\n");
		return false;
	}

	FOR_EACH_PTR(base_type->arguments, arg)
	{
		struct symbol *arg_base_type = arg->ctype.base_type;
		if (nr_args >= MAX_ARGS) {
			fprintf(stderr, "Only upto 6 arguments supported");
			return false;
		}
		if (!check_supported_argtype(C, arg_base_type))
			return false;
		nr_args++;
	}
	END_FOR_EACH_PTR(arg);

	name = dmrC_show_ident(C, sym->ident);

	function.return_type = check_supported_returntype(C, ret_type);
	if (function.return_type == RT_UNSUPPORTED)
		return false;

	function.builder = NJX_create_function_builder(module, name, true);
	for (int i = 0; i < nr_args; i++) {
		function.args[i] = NJX_insert_parameter(function.builder);
	}

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

			NJXLInsRef ptr = NJX_alloca(function.builder,
						    instruction_size(C, insn));
			insn->target->priv2 = ptr;
			insn->target->priv = NULL;
		}
		END_FOR_EACH_PTR(insn);
	}
	END_FOR_EACH_PTR(bb);

	FOR_EACH_PTR(ep->bbs, bb)
	{
		if (!output_bb(C, &function, bb)) {
			NJX_destroy_function_builder(function.builder);
			return false;
		}
	}
	END_FOR_EACH_PTR(bb);

	bool success = false;
	if (resolve_jumps(&function))
		success = true;

	NJX_finalize(function.builder);

	NJX_destroy_function_builder(function.builder);

	return success;
}

static int is_prototype(struct symbol *sym)
{
	if (sym->type == SYM_NODE)
		sym = sym->ctype.base_type;
	return sym && sym->type == SYM_FN && !sym->stmt;
}

/* returns 1 on success, 0 on failure */
static int compile(struct dmr_C *C, NJXContextRef module, struct ptr_list *list)
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
	struct ptr_list *filelist = NULL;
	struct ptr_list *symlist;
	char *file;

	struct dmr_C *C = new_dmr_C();
	C->codegen = 1; /* disables macros related to vararg processing */

	symlist = dmrC_sparse_initialize(C, argc, argv, &filelist);

	int rc = 0;
	if (compile(C, module, symlist)) {
		/* need ->phi_users */
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
	} else
		rc = 1;

	if (rc == 1) {
		fprintf(stderr, "Failed to compile given inputs\n");
	}
	destroy_dmr_C(C);

	return rc == 0;
}
