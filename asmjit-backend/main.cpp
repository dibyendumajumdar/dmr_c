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

	// Small helper function to print the current content of `cb`.
	//void dumpCode(X86Compiler& cb, const char* phase) {
	//	StringBuilder sb;
	//	
	//	printf("%s:\n%s\n", phase, sb.getData());
	//}

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
				return unsupported("return value");
			}
			cc->endFunc();
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
			// if (!insn->bb && C->verbose < 2)
			//	continue;
			printf("\t%s\n", show_instruction(C, insn));
			compile_instruction(insn);
		}
		END_FOR_EACH_PTR(insn);
		// if (!bb_terminated(bb))
		//	printf("\tEND\n");
		return 0;
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

		if (!is_void_type(C->S, ret_type)) {
			return unsupported("non void return types");
		}

		show_symbol(C, ret_type);
		struct basic_block *bb;

		FuncSignatureX sig;
		cc->addFunc(sig);

		FOR_EACH_PTR_TYPE(ep->bbs, bb, struct basic_block *)
		{
			if (!bb)
				continue;
			compile_basic_block(bb);
		}
		END_FOR_EACH_PTR(bb);

		return unsupported("function");
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

	MyJIT() : logger(stdout)
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

		return 0;
	}

	~MyJIT()
	{
		delete cc;
		destroy_dmr_C(C);
	}

	struct dmr_C *C;
	JitRuntime rt;   // Runtime specialized for JIT code execution.
	CodeHolder code; // Holds code and relocation information.
	X86Compiler *cc;
	FileLogger logger;
};

int main(int argc, char *argv[])
{
	MyJIT jit;

	jit.compile(argc, argv);

	return 0;
}