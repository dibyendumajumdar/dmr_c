#include <dmr_c.h>
#include <expression.h>
#include <flow.h>
#include <linearize.h>
#include <port.h>
#include <symbol.h>

#include <asmjit/asmjit.h>

#include <stdio.h>

using namespace asmjit;

struct MyJIT {

	int unsupported(const char *feature)
	{
		fprintf(stderr,
			"Sorry: currently compilation of %s is unsupported\n",
			feature);
		exit(1);
		return 1;
	}

	int compile_instruction(struct instruction *insn)
	{
		int opcode = insn->opcode;

		switch (opcode) {
		case OP_ENTRY:
			break;
		case OP_RET:
			if (insn->src) {
				if (insn->src->type == PSEUDO_VAL) {
					if (current_function_rettype_ == TypeId::Id::kI32) {
						X86Gp vReg = cc->newGpd();
						cc->mov(vReg, (int)insn->src->value);
						cc->ret(vReg);
					}
					else {
						return unsupported("return type");
					}
				}
				else {
					return unsupported("return type");
				}
			}
			else {
				cc->ret();
			}
			break;
		default:
			unsupported(show_instruction(C, insn));
		}
		return 0;
	}

	int compile_basic_block(struct basic_block *bb)
	{
		struct instruction *insn;
		FOR_EACH_PTR_TYPE(bb->insns, insn, struct instruction *)
		{
			if (!insn->bb)
				continue;
			printf("\t%s\n", show_instruction(C, insn));
			compile_instruction(insn);
		}
		END_FOR_EACH_PTR(insn);
		// if (!bb_terminated(bb))
		//	printf("\tEND\n");
		return 0;
	}

	TypeId::Id get_type(struct symbol *type) {
		if (type->type == SYM_NODE)
			type = type->ctype.base_type;
		if (is_void_type(C->S, type))
			return TypeId::kVoid;
		else if (is_int_type(C->S, type)) {
			switch (type->bit_size) {
				case 1:
				case 8:
					return TypeId::kI8;
				case 16:
					return TypeId::kI16;
				case 32:
					return TypeId::kI32;
				case 64:
					return TypeId::kI64;
				default:
					unsupported("integer type");
					return TypeId::kVoid;
			}
		}
		else {
			unsupported("type");
			return TypeId::kVoid;
		}
	}

	int compile_function(struct dmr_C *C, struct entrypoint *ep)
	{
		struct symbol *sym = ep->name;
		struct symbol *base_type = sym->ctype.base_type;
		struct symbol *ret_type = sym->ctype.base_type->ctype.base_type;

		if (ptrlist_size(base_type->arguments) > 0) {
			unsupported("function arguments");
		}

		char function_name[256];
		snprintf(function_name, sizeof function_name,
			 show_ident(C, sym->ident));

		FuncSignatureX sig;
		current_function_rettype_ = get_type(ret_type);
		sig.setRet(current_function_rettype_);

		show_symbol(C, ret_type);

		current_function_ = cc->addFunc(sig);

		struct basic_block *bb;
		FOR_EACH_PTR_TYPE(ep->bbs, bb, struct basic_block *)
		{
			if (!bb)
				continue;
			compile_basic_block(bb);
		}
		END_FOR_EACH_PTR(bb);

		cc->endFunc();
		current_function_ = NULL;

		return 0;
	}

	int is_prototype(struct symbol *sym)
	{
		if (sym->type == SYM_NODE)
			sym = sym->ctype.base_type;
		return sym && sym->type == SYM_FN && !sym->stmt;
	}

	int compile(struct ptr_list *list)
	{
		struct symbol *sym;

		FOR_EACH_PTR_TYPE(list, sym, struct symbol *)
		{
			struct entrypoint *ep;
			expand_symbol(C, sym);

			if (is_prototype(sym))
				continue;

			ep = linearize_symbol(C, sym);
			if (ep) {
				// output_fn(C, module, ep);
				show_entry(C, ep);
				compile_function(C, ep);
			} else
				// output_data(C, module, sym);
				unsupported("data");
		}
		END_FOR_EACH_PTR(sym);

		return 0;
	}

	MyJIT() : logger(stderr)
	{
		C = new_dmr_C();
		// Initialize to the same arch as JIT runtime.
		code.init(rt.getCodeInfo());
		code.setLogger(&logger);
		// Create and attach X86Compiler to `code`.
		cc = new X86Compiler(&code);
	}

	int compile(int argc, char *argv[])
	{
		struct ptr_list *filelist = NULL;
		struct ptr_list *symlist;
		char *file;

		symlist = sparse_initialize(C, argc, argv, &filelist);

		compile(symlist);

		C->dbg_dead = 1;
		FOR_EACH_PTR_TYPE(filelist, file, char *)
		{
			symlist = sparse(C, file);
			if (C->die_if_error)
				return 1;
			compile(symlist);
		}
		END_FOR_EACH_PTR(file);

		cc->finalize();

		return 0;
	}

	~MyJIT()
	{
		delete cc;
		destroy_dmr_C(C);
	}

	struct dmr_C *C;
	// Runtime specialized for JIT code execution.
	JitRuntime rt;
	// Holds code and relocation information.
	CodeHolder code;
	X86Compiler *cc;
	FileLogger logger;
	CCFunc *current_function_;
	TypeId::Id current_function_rettype_;
};

int main(int argc, char *argv[])
{
	MyJIT jit;

	jit.compile(argc, argv);

	return 0;
}