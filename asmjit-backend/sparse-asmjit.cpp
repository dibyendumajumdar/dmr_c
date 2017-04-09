#include <assert.h>
#include <stdbool.h>
#include <stdio.h>
#include <string.h>

#include <expression.h>
#include <flow.h>
#include <linearize.h>
#include <port.h>
#include <symbol.h>

#include <asmjit/asmjit.h>

using namespace asmjit;

struct AsmJitContext {
	// Runtime specialized for JIT code execution.
	JitRuntime rt;
	// Holds code and relocation information.
	CodeHolder code;
	FileLogger logger;

	AsmJitContext() {
		// Initialize to the same arch as JIT runtime.
		code.init(rt.getCodeInfo());
		code.setLogger(&logger);
	}
};

typedef struct ASMJITContext* ASMJITContextRef;

struct backend_data wrap(Operand& op) {
	struct backend_data d;
	static_assert(sizeof(struct backend_data) == sizeof(Operand), "mismatch in operand and backend data type size");
	memcpy(&d, &op, sizeof d);
	return d;
}

X86Gp unwrap_register(struct backend_data &d) {
	X86Gp op;
	memcpy(&op, &d, sizeof op);
	return op;
}

Label unwrap_label(struct backend_data &d) {
	Label op;
	memcpy(&op, &d, sizeof op);
	return op;
}

X86Mem unwrap_ptr(struct backend_data &d) {
	X86Mem op;
	memcpy(&op, &d, sizeof op);
	return op;
}

/*
* Only upto 4 arguments are supported as Nanojit only supports
* parameters passed via registers
*/
#define MAX_ARGS 4

enum ReturnType {
	RT_UNSUPPORTED = 0,
	RT_INT32 = 1,
	RT_INT64 = 2,
	RT_DOUBLE = 3,
	RT_PTR = 4
};

struct function {
	CCFunc *builder;
	AsmJitContext *module;
	X86Compiler *cc;
	FuncSignatureX sig;
	TypeId::Id return_type;
	X86Gp args[MAX_ARGS];

	function(AsmJitContext *module) {
		this->module = module;
		// Create and attach X86Compiler to `code`.
		cc = new X86Compiler(&module->code);
	}

	~function() {
		delete cc;
	}
};

bool get_type(struct dmr_C *C, struct symbol *type, TypeId::Id &id) {
	if (type->type == SYM_NODE)
		type = type->ctype.base_type;
	if (dmrC_is_void_type(C->S, type))
		id = TypeId::kVoid;
	else if (dmrC_is_ptr_type(type)) {
		id = TypeId::kIntPtr;
	}
	else if (dmrC_is_int_type(C->S, type)) {
		switch (type->bit_size) {
		case 1:
		case 8:
			id = TypeId::kI8;
		case 16:
			id = TypeId::kI16;
		case 32:
			id = TypeId::kI32;
		case 64:
			id = TypeId::kI64;
		default:
			return false;
		}
	}
	else if (dmrC_is_float_type(C->S, type)) {
		switch (type->bit_size) {
		case 32:
			id = TypeId::kF32;
		case 64:
			id = TypeId::kF64;
		default:
			return false;
		}
	}
	else {
		return false;
	}
}

static X86Gp get_register(struct function *fn, TypeId::Id id)
{
	switch(id) {
	case TypeId::kI8:
		return fn->cc->newGpb();
	case TypeId::kI16:
		return fn->cc->newGpw();
	case TypeId::kI32:
		return fn->cc->newGpd();
	case TypeId::kI64:
		return fn->cc->newGpq();
	case TypeId::kIntPtr:
		return fn->cc->newIntPtr();
	case TypeId::kF32:
	case TypeId::kF64:
		break;
	}
	return X86Gp();
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

static X86Reg output_op_phi(struct dmr_C *C, struct function *fn,
				struct instruction *insn)
{
	X86Mem ptr = unwrap_ptr(insn->target->priv2);

	if (ptr.isNone())
		return X86Reg();

	// Unlike LLVM version which creates the Load instruction
	// early on and inserts it into the IR stream here, we
	// create the Load instruction here.
	X86Gp load;
	switch (insn->size) {
	case 8:
		// TODO do we need to do unsigned here?
		load = fn->cc->newGpb();
		fn->cc->mov(load, ptr);
		break;
	case 16:
		// TODO do we need to do unsigned here?
		load = fn->cc->newGpw();
		fn->cc->mov(load, ptr);
		break;
	case 32:
		load = fn->cc->newGpd();
		fn->cc->mov(load, ptr);
		break;
	case 64:
		load = fn->cc->newGpq();
		fn->cc->mov(load, ptr);
		break;
	}
	insn->target->priv = wrap(load);
	return load;
}

static X86Gp val_to_value(struct dmr_C *C, struct function *fn,
			       long long value, struct symbol *ctype)
{
	switch (ctype->bit_size) {
	case 8: {
		auto v = fn->cc->newI8();
		fn->cc->mov(v, value);
		return v;
	}
	case 16: {
		auto v = fn->cc->newI16();
		fn->cc->mov(v, value);
		return v;
	}
	case 32: {
		auto v = fn->cc->newI32();
		fn->cc->mov(v, value);
		return v;
	}
	case 64: {
		auto v = fn->cc->newI64();
		fn->cc->mov(v, value);
		return v;
	}
	}
	return X86Gp();
}

static X86Gp pseudo_to_value(struct dmr_C *C, struct function *fn,
				  struct symbol *ctype, pseudo_t pseudo)
{
	X86Gp result;

	switch (pseudo->type) {
	case PSEUDO_REG:
		result = unwrap_register(pseudo->priv);
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
		break;
	case PSEUDO_PHI:
		result = unwrap_register(pseudo->priv);
		break;
	case PSEUDO_VOID:
		break;
	}
	if (result.isNone()) {
		fprintf(stderr, "error: no result for pseudo\n");
	}
	return result;
}

static X86Gp output_op_phisrc(struct dmr_C *C, struct function *fn,
				   struct instruction *insn)
{
	X86Gp v;
	struct instruction *phi;

	/* target = src */
	v = pseudo_to_value(C, fn, insn->type, insn->phi_src);
	if (v.isNone())
		return v;

	FOR_EACH_PTR_TYPED(insn->phi_users, struct instruction *, phi)
	{
		X86Mem ptr;

		assert(phi->opcode == OP_PHI);
		/* phi must be load from alloca */
		ptr = unwrap_ptr(phi->target->priv2);
		if (ptr.isNone())
			return X86Gp();

		fn->cc->mov(ptr, v);
	}
	END_FOR_EACH_PTR(phi);
	return v;
}

static X86Gp output_op_load(struct dmr_C *C, struct function *fn,
				 struct instruction *insn)
{
	X86Gp ptr = pseudo_to_value(C, fn, insn->type, insn->src);

	if (ptr.isNone())
		return ptr;

	X86Gp value;
	switch (insn->size) {
	case 8:
		value = fn->cc->newGpb();
		fn->cc->mov(value, X86Mem(ptr, (int)insn->offset));
		break;
	case 16:
		value = fn->cc->newGpb();
		fn->cc->mov(value, X86Mem(ptr, (int)insn->offset));
		break;
	case 32:
		value = fn->cc->newGpb();
		if (dmrC_is_float_type(C->S, insn->type))
			fn->cc->mov(value, X86Mem(ptr, (int)insn->offset));
		else
			fn->cc->mov(value, X86Mem(ptr, (int)insn->offset));
		break;
	case 64: 
		value = fn->cc->newGpb();
		if (dmrC_is_float_type(C->S, insn->type))
			fn->cc->mov(value, X86Mem(ptr, (int)insn->offset));
		else
			fn->cc->mov(value, X86Mem(ptr, (int)insn->offset));
		break;
	}
	insn->target->priv = wrap(value);
	return value;
}

static X86Gp output_op_binary(struct dmr_C *C, struct function *fn,
				   struct instruction *insn)
{
	X86Gp lhs, rhs, target;

	lhs = pseudo_to_value(C, fn, insn->type, insn->src1);
	if (lhs.isNone())
		return lhs;

	rhs = pseudo_to_value(C, fn, insn->type, insn->src2);
	if (rhs.isNone())
		return rhs;

	switch (insn->opcode) {
	/* Binary */
	case OP_ADD:
		switch (insn->size) {
		case 64:
			if (dmrC_is_float_type(C->S, insn->type)) {
				//target = fn->cc->add(lhs, rhs);
			}
			else {
				target = fn->cc->newGpq();
				fn->cc->mov(target, lhs);
				fn->cc->add(target, rhs);
			}
			break;
		case 32:
			if (dmrC_is_float_type(C->S, insn->type)) {
				//target = NJX_addf(fn->builder, lhs, rhs);
			}
			else {
				target = fn->cc->newGpd();
				fn->cc->mov(target, lhs);
				fn->cc->add(target, rhs);
			}
			break;
		}
		break;
	}

	insn->target->priv = wrap(target);

	return target;
}

static bool output_op_br(struct dmr_C *C, struct function *fn,
			       struct instruction *br)
{
	if (br->cond) {
		X86Gp value = pseudo_to_value(C, fn, br->type, br->cond);
		if (value.isNone())
			return false;
		fn->cc->cmp(value, 0);
		fn->cc->je(unwrap_label(br->bb_false->priv));
		fn->cc->jne(unwrap_label(br->bb_true->priv));
		return true;
	} else {
		if (br->bb_true) {
			fn->cc->jmp(unwrap_label(br->bb_true->priv));
		} else {
			fn->cc->jmp(unwrap_label(br->bb_false->priv));
		}
	}
	return true;
}

static bool output_op_ret(struct dmr_C *C, struct function *fn,
				struct instruction *insn)
{
	pseudo_t pseudo = insn->src;

	if (pseudo && pseudo != VOID_PSEUDO(C)) {
		X86Gp result = pseudo_to_value(C, fn, insn->type, pseudo);
		if (result.isNone())
			return false;
		fn->cc->ret(result);
	}
	else
		fn->cc->ret();
	return true;
}

/* return 1 on success, 0 on failure */
static int output_insn(struct dmr_C *C, struct function *fn,
		       struct instruction *insn)
{
	Operand v;
	switch (insn->opcode) {
	case OP_RET:
		if (!output_op_ret(C, fn, insn))
			return 0;
		break;
	case OP_BR:
		if (!output_op_br(C, fn, insn))
			return 0;
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

	if (v.isNone())
		dmrC_sparse_error(C, insn->pos,
				  "failed to output instruction %s\n",
				  dmrC_show_instruction(C, insn));
	return v.isNone();
}

/* return 1 on success, 0 on failure */
static int output_bb(struct dmr_C *C, struct function *fn,
		     struct basic_block *bb)
{
	struct instruction *insn;

	FOR_EACH_PTR_TYPED(bb->insns, struct instruction *, insn)
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

static bool output_fn(struct dmr_C *C, AsmJitContext *module,
		      struct entrypoint *ep)
{
	struct symbol *sym = ep->name;
	struct symbol *base_type = sym->ctype.base_type;
	struct symbol *ret_type = sym->ctype.base_type->ctype.base_type;
	struct function fn(module);
	struct basic_block *bb;
	struct symbol *arg;
	const char *name;
	int nr_args = 0;

	if (base_type->variadic) {
		fprintf(stderr, "Variadic functions are not supported\n");
		return false;
	}
	name = dmrC_show_ident(C, sym->ident);

	if (!get_type(C, ret_type, fn.return_type))
		return false;
	fn.sig.setRet(fn.return_type);

	FOR_EACH_PTR_TYPED(base_type->arguments, struct symbol *, arg)
	{
		struct symbol *arg_base_type = arg->ctype.base_type;
		if (nr_args >= MAX_ARGS) {
			fprintf(stderr, "Only upto 6 arguments supported");
			return false;
		}
		TypeId::Id arg_type_id;
		if (!get_type(C, arg_base_type, arg_type_id))
			return false;
		fn.sig.addArg(arg_type_id);
		fn.cc->setArg(nr_args, get_register(&fn, arg_type_id));
		nr_args++;
	}
	END_FOR_EACH_PTR(arg);

	fn.builder = fn.cc->addFunc(fn.sig);

	/* create the BBs */
	FOR_EACH_PTR_TYPED(ep->bbs, struct basic_block *, bb)
	{
		struct instruction *insn;

		bb->priv = wrap(fn.cc->newLabel());

		/* allocate alloca for each phi */
		FOR_EACH_PTR_TYPED(bb->insns, struct instruction *, insn)
		{

			if (!insn->bb || insn->opcode != OP_PHI)
				continue;
			/* insert alloca into entry block */

			X86Mem ptr = fn.cc->newStack(instruction_size_in_bytes(C, insn), C->target->pointer_alignment);
			// Unlike the Sparse LLVM version we
			// save the pointer here and perform the load
			// when we encounter the PHI instruction
			// The LLVM version generates the Load instruction
			// but doesn't insert it into the IR at this point.
			// But in Nanojit it seems we cannot do that - i.e.
			// the instruction gets inserted into the IR stream
			insn->target->priv2 = wrap(ptr);
		}
		END_FOR_EACH_PTR(insn);
	}
	END_FOR_EACH_PTR(bb);

	FOR_EACH_PTR_TYPED(ep->bbs, struct basic_block *, bb)
	{
		if (!output_bb(C, &fn, bb)) {
			return false;
		}
	}
	END_FOR_EACH_PTR(bb);

	bool success = false;

	fn.cc->endFunc();

//	if (success && !NJX_finalize(function.builder))
//		success = false;

	return success;
}

static int is_prototype(struct symbol *sym)
{
	if (sym->type == SYM_NODE)
		sym = sym->ctype.base_type;
	return sym && sym->type == SYM_FN && !sym->stmt;
}

/* returns 1 on success, 0 on failure */
static int compile(struct dmr_C *C, AsmJitContext *module, struct ptr_list *list)
{
	struct symbol *sym;

	FOR_EACH_PTR_TYPED(list, struct symbol *, sym)
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

extern "C" bool dmrC_asmjitcompile(int argc, char **argv, ASMJITContextRef jit,
		      const char *inputbuffer)
{
	struct ptr_list *filelist = NULL;
	struct ptr_list *symlist;
	char *file;
	//AsmJitContext *module = reinterpret_cast<AsmJitContext *>(jit);
	AsmJitContext *module = new AsmJitContext();

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
		FOR_EACH_PTR_TYPED(filelist, char *, file)
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
