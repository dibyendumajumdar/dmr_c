#include <nanojitextra.h>

#include <assert.h>
#include <stdbool.h>
#include <stdio.h>
#include <string.h>

#include <allocate.h>
#include <expression.h>
#include <flow.h>
#include <linearize.h>
#include <port.h>
#include <symbol.h>

/*
* Only upto 4 arguments are supported as Nanojit only supports
* parameters passed via registers
*/
#define MAX_ARGS 4
/*
* The maximum number of jumps we can handle in a single
* function. This is just a memory allocation issue.
*/
#define MAX_JMP_INSTRUCTIONS 100

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
	NJXContextRef module;
	struct allocator type_allocator;
	NJXLInsRef args[MAX_ARGS];
	struct NanoType *return_type;
	struct jmp_target jumps[MAX_JMP_INSTRUCTIONS];
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

static struct NanoType *alloc_nanotype(struct function *fn,
				       enum NanoTypeKind kind,
				       unsigned int bit_size)
{
	struct NanoType *type = dmrC_allocator_allocate(&fn->type_allocator, 0);
	type->type = kind;
	type->bit_size = bit_size;
	type->return_type = RT_UNSUPPORTED;
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
	struct symbol *arg;
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

static bool check_supported_argtype(struct dmr_C *C, struct symbol *sym)
{
	if (dmrC_is_ptr_type(sym))
		return true;
	if (dmrC_is_int_type(C->S, sym)) {
		if (sym->bit_size == C->target->bits_in_pointer)
			return true;
	}
	fprintf(stderr, "Unsupported type in function argument, only pointers "
			"and 64-bit integers are supported\n");
	return false;
}

static struct NanoType *check_supported_returntype(struct dmr_C *C,
						   struct NanoType *type)
{

	if (type->type == RT_AGGREGATE || type->type == RT_FUNCTION ||
	    type->type == RT_INT || type->type == RT_UNSUPPORTED)
		return &BadType;
	return type;
}

static NJXLInsRef build_cast(struct dmr_C *C, struct function *fn,
			     NJXLInsRef val, struct NanoType *dtype,
			     int unsigned_cast)
{
	switch (dtype->type) {
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
			/// FIXME this doesn't look right
			if (unsigned_cast)
				return NJX_ui2uq(fn->builder,
						 NJX_d2i(fn->builder, val));
			else
				return NJX_i2q(fn->builder,
					       NJX_d2i(fn->builder, val));
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
		load = NJX_load_c2i(fn->builder, ptr, 0);
		break;
	case 16:
		// TODO do we need to do unsigned here?
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
		fprintf(stderr, "pseudo from symbol not supported\n");
		break;
	case PSEUDO_VAL:
		result = val_to_value(C, fn, pseudo->value, ctype);
		break;
	case PSEUDO_ARG:
		result = fn->args[pseudo->nr - 1];
#if 0
		// See function definition for reasons for copying the
		// parameters; so we need to load the parameter being accessed
		result = NJX_load_q(fn->builder, result, 0);
#endif
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

static NJXLInsRef pseudo_ins(struct dmr_C *C, struct function *fn, pseudo_t pseudo)
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
		result = pseudo->priv;
		break;
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

/**
* Convert the pseudo to a value, and cast it to the expected type of the
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

static NJXLInsRef output_op_binary(struct dmr_C *C, struct function *fn,
				   struct instruction *insn)
{
	NJXLInsRef lhs, rhs, target = NULL;

	lhs = get_operand(C, fn, insn->type, insn->src1, 1, 0);
	if (!lhs)
		return NULL;

	rhs = get_operand(C, fn, insn->type, insn->src2, 1, 0);
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
	}

	insn->target->priv = target;

	return target;
}

/*
* Add liveness data to help Nanojit's
* register allocator, which does a scan of the Nanojit instructions
* from bottom up and can miss the fact that some registers are
* needed.
*/
static void output_liveness(struct dmr_C *C, struct function *fn,
			    struct basic_block *bb)
{
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
			cond = NJX_eqf(fn->builder, value,
				       NJX_immf(fn->builder, 0));
		}
		if (cond == NULL)
			return NULL;
		// Mark registers needed by destination BB as live
		// TODO we should only output if bb_false precedes current bb
		output_liveness(C, fn, br->bb_false);
		NJXLInsRef br1 =
		    NJX_cbr_true(fn->builder, cond, NULL); // br->bb_false->priv
		if (!add_jump_instruction(fn, br->bb_false, br1))
			return NULL;
		// Mark registers needed by destination BB as live
		// TODO we should only output if bb_false precedes current bb
		output_liveness(C, fn, br->bb_true);
		NJXLInsRef br2 =
		    NJX_cbr_false(fn->builder, cond, NULL); // br->bb_true->priv
		if (!add_jump_instruction(fn, br->bb_true, br2))
			return NULL;
		return br1;
	} else {
		if (br->bb_true) {
			// Mark registers needed by destination BB as live
			// TODO we should only output if bb_true precedes current bb
			output_liveness(C, fn, br->bb_true);
		}
		else if (br->bb_false) {
			// Mark registers needed by destination BB as live
			// TODO we should only output if bb_false precedes current bb
			output_liveness(C, fn, br->bb_false);
		}
		NJXLInsRef br1 = NJX_br(fn->builder, NULL);
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
		return 0;

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
static void output_parameter_liveness(struct dmr_C *C, struct function *fn) {
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
	bool success = false;

	if (base_type->variadic) {
		fprintf(stderr, "Variadic functions are not supported\n");
		return false;
	}

	dmrC_allocator_init(&function.type_allocator, "nanotypes",
			    sizeof(struct NanoType),
			    __alignof__(struct NanoType), CHUNK);

	FOR_EACH_PTR(base_type->arguments, arg)
	{
		struct symbol *arg_base_type = arg->ctype.base_type;
		if (nr_args >= MAX_ARGS) {
			fprintf(stderr, "Only upto %d arguments supported\n",
				MAX_ARGS);
			goto Ereturn;
		}
		if (!check_supported_argtype(C, arg_base_type))
			goto Ereturn;
		nr_args++;
	}
	END_FOR_EACH_PTR(arg);

	name = dmrC_show_ident(C, sym->ident);

	struct NanoType *function_type =
	    type_to_nanotype(C, &function, ret_type, NULL);
	function.return_type = check_supported_returntype(C, function_type);
	if (function.return_type == &BadType)
		goto Ereturn;

	function.builder = NJX_create_function_builder(module, name, true);
	for (int i = 0; i < nr_args; i++) {
#if 1
		function.args[i] = NJX_insert_parameter(function.builder);
#else
		// It is unclear what the LIR_paramp instruction does.
		// It seems that we need to copy the parameters as the
		// code generator does not preserve the parameter values.
		// For now we allocate stack space and copy the parameters.
		NJXLInsRef p = NJX_insert_parameter(function.builder);
		NJXLInsRef ptr = NJX_alloca(function.builder, sizeof(int64_t));
		NJXLInsRef arg = NJX_store_q(function.builder, p, ptr, 0);
		function.args[i] = ptr;
#endif
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
	}
	END_FOR_EACH_PTR(bb);

	FOR_EACH_PTR(ep->bbs, bb)
	{
		if (!output_bb(C, &function, bb)) {
			goto Efailed;
		}
	}
	END_FOR_EACH_PTR(bb);

	if (resolve_jumps(&function))
		success = true;

	output_parameter_liveness(C, &function);

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
