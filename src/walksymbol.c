#include <ctype.h>
#include <fcntl.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <walksymbol.h>

void dmrC_walk_symbol_list(struct dmr_C *C, struct symbol_list *list, struct symbol_visitor *visitor)
{
	struct symbol *sym;

	FOR_EACH_PTR(list, sym) {
		dmrC_walk_symbol(C, sym, visitor);
	} END_FOR_EACH_PTR(sym);
}

void dmrC_walk_symbol(struct dmr_C *C, struct symbol *sym, struct symbol_visitor *visitor)
{
	if (!sym)
		return;
	if (sym->type != SYM_BASETYPE) {
		if (sym->aux) {
			/* already visited */
			visitor->reference_symbol(visitor->data, (uint64_t)sym);
			return;
		}
		visitor->id++;
		sym->aux = (void *)visitor->id;
	}
	char name[80] = { 0 };
	if (sym->ident)
		snprintf(name, sizeof name, "%s", dmrC_show_ident(C, sym->ident));
	else if (sym->type == SYM_BASETYPE)
		snprintf(name, sizeof name, "%s", dmrC_builtin_typename(C, sym));
	struct symbol_info syminfo = {
		.id = (uint64_t)sym->aux,
		.name = name,
		.symbol_namespace = sym->ns,
		.symbol_type = sym->type,
		.alignment = sym->ctype.alignment,
		.pos = sym->pos,
		.bit_size = sym->bit_size,
		.offset = sym->offset 
	};
	if (dmrC_is_bitfield_type(sym)) {
		syminfo.bit_offset =  sym->bit_offset;
	}
	if (sym->array_size) {
		syminfo.array_size = dmrC_get_expression_value(C, sym->array_size);
	}

	visitor->begin_symbol(visitor->data, &syminfo);

	if (sym->type == SYM_STRUCT || sym->type == SYM_UNION) {
		struct symbol *member;
		visitor->begin_members(visitor->data, &syminfo);
		FOR_EACH_PTR(sym->symbol_list, member) {
			dmrC_walk_symbol(C, member, visitor);
		} END_FOR_EACH_PTR(member);
		visitor->end_members(visitor->data, &syminfo);
	}

	if (sym->type == SYM_FN) {
		struct symbol *arg;
		visitor->begin_arguments(visitor->data, &syminfo);
		FOR_EACH_PTR(sym->arguments, arg) {
			dmrC_walk_symbol(C, arg, visitor);
		} END_FOR_EACH_PTR(member);
		visitor->end_arguments(visitor->data, &syminfo);
	}

	// Is there a base type?
	if (sym->type != SYM_BASETYPE && sym->ctype.base_type) {
		dmrC_walk_symbol(C, sym->ctype.base_type, visitor);

#if 0
		dmrC_show_type(C, sym);
		/*
		* Show actual implementation information
		*/
		switch (type->type) {
			struct symbol *member;

		case SYM_FN: {
			struct statement *stmt = type->stmt;
			printf("\n");
			if (stmt) {
				int val;
				val = dmrC_show_statement(C, stmt);
				if (val)
					printf("\tmov.%d\t\tretval,%d\n", stmt->ret->bit_size, val);
				printf("\tret\n");
			}
			break;
		}

		default:
			printf("\n");
			break;
		}

		if (sym->initializer) {
			printf(" = \n");
			dmrC_show_expression(C, sym->initializer);
		}
#endif
	}

	if (sym->type == SYM_FN) {
		if (sym->stmt) {
			visitor->begin_body(visitor->data, &syminfo);
			visitor->end_body(visitor->data, &syminfo);
		}
	}
	visitor->end_symbol(visitor->data, &syminfo);
}
