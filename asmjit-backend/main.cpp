#include <port.h>
#include <dmr_c.h>
#include <symbol.h>
#include <expression.h>
#include <linearize.h>
#include <flow.h>

#include <asmjit/asmjit.h>

#include <stdio.h>

using namespace asmjit;


static int unsupported(const char *feature) {
	fprintf(stderr, "Sorry: currently compilation of %s is unsupported\n", feature);
	exit(1);
	return 1;
}

static int compile_instruction(struct dmr_C *C, struct instruction *insn) {
	int opcode = insn->opcode;

	switch (opcode) {
	case OP_ENTRY:
	case OP_RET:
		break;
	default:
		unsupported(show_instruction(C, insn));
	}
	return 0;
}

static int compile_basic_block(struct dmr_C *C, struct basic_block *bb) {
	struct instruction *insn;
	FOR_EACH_PTR_TYPE(bb->insns, insn, struct instruction *) {
		//if (!insn->bb && C->verbose < 2)
		//	continue;
		//printf("\t%s\n", show_instruction(C, insn));
		compile_instruction(C, insn);
	} END_FOR_EACH_PTR(insn);
	//if (!bb_terminated(bb))
	//	printf("\tEND\n");
	return 0;
}

static int compile_function(struct dmr_C *C, struct entrypoint *ep) {
	struct symbol *sym = ep->name;
	struct symbol *base_type = sym->ctype.base_type;
	struct symbol *ret_type = sym->ctype.base_type->ctype.base_type;

	if (ptrlist_size(base_type->arguments) > 0) {
		unsupported("function arguments");
	}

	char function_name[256];
	snprintf(function_name, sizeof function_name, show_ident(C, sym->ident));

	if (!is_void_type(C->S, ret_type)) {
		return unsupported("non void return types");
	}

	show_symbol(C, ret_type);
	struct basic_block *bb;

	FOR_EACH_PTR_TYPE(ep->bbs, bb, struct basic_block *) {
		if (!bb)
			continue;
		compile_basic_block(C, bb);
	} END_FOR_EACH_PTR(bb);


	return unsupported("function");
}

static int is_prototype(struct symbol *sym)
{
	if (sym->type == SYM_NODE)
		sym = sym->ctype.base_type;
	return sym && sym->type == SYM_FN && !sym->stmt;
}

static int compile(struct dmr_C *C, struct ptr_list *list)
{
	struct symbol *sym;

	FOR_EACH_PTR_TYPE(list, sym, struct symbol *) {
		struct entrypoint *ep;
		expand_symbol(C, sym);

		if (is_prototype(sym))
			continue;

		ep = linearize_symbol(C, sym);
		if (ep) {
			//output_fn(C, module, ep);
			show_entry(C, ep);
			compile_function(C, ep);
		}
		else
			//output_data(C, module, sym);
			unsupported("data");
	}
	END_FOR_EACH_PTR(sym);

	return 0;
}

int main(int argc, char* argv[]) {

	struct ptr_list *filelist = NULL;
	struct ptr_list *symlist;
	char *file;

	struct dmr_C *C = new_dmr_C();

	symlist = sparse_initialize(C, argc, argv, &filelist);

	compile(C, symlist);

	/* need ->phi_users */
	C->dbg_dead = 1;
	FOR_EACH_PTR_TYPE(filelist, file, char *) {
		symlist = sparse(C, file);
		if (C->die_if_error)
			return 1;
		compile(C, symlist);
	} END_FOR_EACH_PTR(file);
	destroy_dmr_C(C);
}