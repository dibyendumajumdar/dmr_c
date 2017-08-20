#include <ctype.h>
#include <fcntl.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <walksymbol.h>

static void walk_expression(struct dmr_C *C, struct expression *expr, struct symbol_visitor *visitor);
static void walk_statement(struct dmr_C *C, struct statement *stmt, struct symbol_visitor *visitor);

void walk_statement(struct dmr_C *C, struct statement *stmt, struct symbol_visitor *visitor)
{
}

void walk_expression(struct dmr_C *C, struct expression *expr, struct symbol_visitor *visitor)
{
}

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
		if (sym->type == SYM_FN)
			visitor->begin_func_returntype(visitor->data, &syminfo);
		else
			visitor->begin_basetype(visitor->data, &syminfo);
		dmrC_walk_symbol(C, sym->ctype.base_type, visitor);
		if (sym->type == SYM_FN)
			visitor->end_func_returntype(visitor->data, &syminfo);
		else
			visitor->end_basetype(visitor->data, &syminfo);
	}

	if (sym->type == SYM_FN) {
		if (sym->stmt) {
			visitor->begin_body(visitor->data, &syminfo);
			walk_statement(C, sym->stmt, visitor);
			visitor->end_body(visitor->data, &syminfo);
		}
	}
	if (sym->initializer) {
		visitor->begin_initializer(visitor->data, &syminfo);
		walk_expression(C, sym->initializer, visitor);
		visitor->end_initializer(visitor->data, &syminfo);
	}
	visitor->end_symbol(visitor->data, &syminfo);
}


static void begin_symbol_default(void *data, struct symbol_info *syminfo) {}
static void end_symbol_default(void *data, struct symbol_info *syminfo) {}
static void begin_members_default(void *data, struct symbol_info *syminfo) {}
static void end_members_default(void *data, struct symbol_info *syminfo) {}
static void begin_arguments_default(void *data, struct symbol_info *syminfo) {}
static void end_arguments_default(void *data, struct symbol_info *syminfo) {}
static void reference_symbol_default(void *data, uint64_t id) {}
static void begin_body_default(void *data, struct symbol_info *syminfo) {}
static void end_body_default(void *data, struct symbol_info *syminfo) {}
static void begin_func_returntype_default(void *data, struct symbol_info *syminfo) {}
static void end_func_returntype_default(void *data, struct symbol_info *syminfo) {}
static void begin_basetype_default(void *data, struct symbol_info *syminfo) {}
static void end_basetype_default(void *data, struct symbol_info *syminfo) {}
static void begin_initializer_default(void *data, struct symbol_info *syminfo) {}
static void end_initializer_default(void *data, struct symbol_info *syminfo) {}


void dmrC_init_symbol_visitor(struct symbol_visitor *visitor)
{
	visitor->data = NULL;
	visitor->id = 0;
	visitor->begin_symbol = begin_symbol_default;
	visitor->end_symbol = end_symbol_default;
	visitor->begin_members = begin_members_default;
	visitor->end_members = end_members_default;
	visitor->begin_arguments = begin_arguments_default;
	visitor->end_arguments = end_arguments_default;
	visitor->reference_symbol = reference_symbol_default;
	visitor->begin_body = begin_body_default;
	visitor->end_body = end_body_default;
	visitor->begin_func_returntype = begin_func_returntype_default;
	visitor->end_func_returntype = end_func_returntype_default;
	visitor->begin_basetype = begin_basetype_default;
	visitor->end_basetype = end_basetype_default;
	visitor->begin_initializer = begin_initializer_default;
	visitor->end_initializer = end_initializer_default;
}