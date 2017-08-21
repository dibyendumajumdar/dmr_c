#include <ctype.h>
#include <fcntl.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <walksymbol.h>

static void walk_expression(struct dmr_C *C, struct expression *expr,
	struct symbol_visitor *visitor);
static void walk_statement(struct dmr_C *C, struct statement *stmt,
	struct symbol_visitor *visitor);
static void walk_symbol_expression(struct dmr_C *C, struct expression *expr,
	struct symbol_visitor *visitor);
static void walk_assignment_expression(struct dmr_C *C, struct expression *expr,
	struct symbol_visitor *visitor);
static void walk_binary_expression(struct dmr_C *C, struct expression *expr,
	struct symbol_visitor *visitor);
static void walk_preop_expression(struct dmr_C *C, struct expression *expr,
	struct symbol_visitor *visitor);
static void walk_call_expression(struct dmr_C *C, struct expression *expr,
	struct symbol_visitor *visitor);

void walk_statement(struct dmr_C *C, struct statement *stmt,
	struct symbol_visitor *visitor)
{
	if (!stmt)
		return;

	visitor->begin_statement(visitor->data, stmt->type);
	switch (stmt->type) {
	case STMT_DECLARATION:
		dmrC_walk_symbol_list(C, stmt->declaration, visitor);
		break;
	case STMT_RETURN:
		//return show_return_stmt(C, stmt);
		break;
	case STMT_COMPOUND: {
		struct statement *s;
		//int last = 0;

		//if (stmt->inline_fn) {
		//	dmrC_show_statement(C, stmt->args);
		//	printf("\tbegin_inline \t%s\n", dmrC_show_ident(C, stmt->inline_fn->ident));
		//}
		FOR_EACH_PTR(stmt->stmts, s) {
			walk_statement(C, s, visitor);
		} END_FOR_EACH_PTR(s);
		//if (stmt->ret) {
		//	int addr, bits;
		//	printf(".L%p:\n", stmt->ret);
		//	addr = show_symbol_expr(C, stmt->ret);
		//	bits = stmt->ret->bit_size;
		//	last = new_pseudo();
		//	printf("\tld.%d\t\tv%d,[v%d]\n", bits, last, addr);
		//}
		//if (stmt->inline_fn)
		//	printf("\tend_inlined\t%s\n", dmrC_show_ident(C, stmt->inline_fn->ident));
		//return last;
		break;
	}

	case STMT_EXPRESSION:
		walk_expression(C, stmt->expression, visitor);
		break;
	case STMT_IF: {
		//int val, target;
		//struct expression *cond = stmt->if_conditional;

		///* This is only valid if nobody can jump into the "dead" statement */
		//val = dmrC_show_expression(C, cond);
		//target = new_label();
		//printf("\tje\t\tv%d,.L%d\n", val, target);
		//dmrC_show_statement(C, stmt->if_true);
		//if (stmt->if_false) {
		//	int last = new_label();
		//	printf("\tjmp\t\t.L%d\n", last);
		//	printf(".L%d:\n", target);
		//	target = last;
		//	dmrC_show_statement(C, stmt->if_false);
		//}
		//printf(".L%d:\n", target);
		break;
	}
	case STMT_SWITCH:
		//show_switch_statement(C, stmt);
		break;

	case STMT_CASE:
		//printf(".L%p:\n", stmt->case_label);
		//dmrC_show_statement(C, stmt->case_statement);
		break;

	case STMT_ITERATOR: {
		//struct statement  *pre_statement = stmt->iterator_pre_statement;
		//struct expression *pre_condition = stmt->iterator_pre_condition;
		//struct statement  *statement = stmt->iterator_statement;
		//struct statement  *post_statement = stmt->iterator_post_statement;
		//struct expression *post_condition = stmt->iterator_post_condition;
		//int val, loop_top = 0, loop_bottom = 0;

		//show_symbol_decl(C, stmt->iterator_syms);
		//dmrC_show_statement(C, pre_statement);
		//if (pre_condition) {
		//	if (pre_condition->type == EXPR_VALUE) {
		//		if (!pre_condition->value) {
		//			loop_bottom = new_label();
		//			printf("\tjmp\t\t.L%d\n", loop_bottom);
		//		}
		//	}
		//	else {
		//		loop_bottom = new_label();
		//		val = dmrC_show_expression(C, pre_condition);
		//		printf("\tje\t\tv%d, .L%d\n", val, loop_bottom);
		//	}
		//}
		//if (!post_condition || post_condition->type != EXPR_VALUE || post_condition->value) {
		//	loop_top = new_label();
		//	printf(".L%d:\n", loop_top);
		//}
		//dmrC_show_statement(C, statement);
		//if (stmt->iterator_continue->used)
		//	printf(".L%p:\n", stmt->iterator_continue);
		//dmrC_show_statement(C, post_statement);
		//if (!post_condition) {
		//	printf("\tjmp\t\t.L%d\n", loop_top);
		//}
		//else if (post_condition->type == EXPR_VALUE) {
		//	if (post_condition->value)
		//		printf("\tjmp\t\t.L%d\n", loop_top);
		//}
		//else {
		//	val = dmrC_show_expression(C, post_condition);
		//	printf("\tjne\t\tv%d, .L%d\n", val, loop_top);
		//}
		//if (stmt->iterator_break->used)
		//	printf(".L%p:\n", stmt->iterator_break);
		//if (loop_bottom)
		//	printf(".L%d:\n", loop_bottom);
		break;
	}
	case STMT_NONE:
		break;

	case STMT_LABEL:
		//printf(".L%p:\n", stmt->label_identifier);
		//dmrC_show_statement(C, stmt->label_statement);
		break;

	case STMT_GOTO:
		//if (stmt->goto_expression) {
		//	int val = dmrC_show_expression(C, stmt->goto_expression);
		//	printf("\tgoto\t\t*v%d\n", val);
		//}
		//else {
		//	printf("\tgoto\t\t.L%p\n", stmt->goto_label);
		//}
		break;
	case STMT_ASM:
		//printf("\tasm( .... )\n");
		break;
	case STMT_CONTEXT: {
		//int val = dmrC_show_expression(C, stmt->expression);
		//printf("\tcontext( %d )\n", val);
		break;
	}
	case STMT_RANGE: {
		//int val = dmrC_show_expression(C, stmt->range_expression);
		//int low = dmrC_show_expression(C, stmt->range_low);
		//int high = dmrC_show_expression(C, stmt->range_high);
		//printf("\trange( %d %d-%d)\n", val, low, high);
		break;
	}
	}
	visitor->end_statement(visitor->data, stmt->type);
}

void walk_symbol_expression(struct dmr_C *C, struct expression *expr,
	struct symbol_visitor *visitor)
{
	assert(expr->type == EXPR_SYMBOL);
	struct symbol *sym = expr->symbol;
	if (!sym)
		return;
	dmrC_walk_symbol(C, sym, visitor);
}

void walk_assignment_expression(struct dmr_C *C, struct expression *expr,
	struct symbol_visitor *visitor)
{
	assert(expr->type == EXPR_ASSIGNMENT);
	if (!expr->ctype)
		return;

	int op = expr->op;
	visitor->begin_assignment_expression(visitor->data, expr->type, op);
	walk_expression(C, expr->left, visitor);
	walk_expression(C, expr->right, visitor);
	visitor->end_assignment_expression(visitor->data, expr->type);
}

void walk_binary_expression(struct dmr_C *C, struct expression *expr,
	struct symbol_visitor *visitor)
{
	assert(expr->type == EXPR_BINOP || expr->type == EXPR_COMPARE || expr->type == EXPR_LOGICAL);
	if (!expr->ctype)
		return;

	int op = expr->op;
	visitor->begin_binop_expression(visitor->data, expr->type, op);
	walk_expression(C, expr->left, visitor);
	walk_expression(C, expr->right, visitor);
	visitor->end_binop_expression(visitor->data, expr->type);
}

void walk_preop_expression(struct dmr_C *C, struct expression *expr,
	struct symbol_visitor *visitor)
{
	assert(expr->type == EXPR_PREOP);
	visitor->begin_preop_expression(visitor->data, expr->type, expr->op);
	walk_expression(C, expr->unop, visitor);
	visitor->end_preop_expression(visitor->data, expr->type);
}

void walk_call_expression(struct dmr_C *C, struct expression *expr,
	struct symbol_visitor *visitor)
{
	assert(expr->type == EXPR_CALL);
	if (!expr->ctype) {
		return;
	}
	struct symbol *direct;
	struct expression *arg, *fn;
	fn = expr->fn;

	/* Remove dereference, if any */
	direct = NULL;
	if (fn->type == EXPR_PREOP) {
		if (fn->unop->type == EXPR_SYMBOL) {
			struct symbol *sym = fn->unop->symbol;
			if (sym->ctype.base_type->type == SYM_FN)
				direct = sym;
		}
	}
	if (direct && !direct->aux) {
		dmrC_walk_symbol(C, direct, visitor);
	}
	if (direct) {
		visitor->begin_direct_call_expression(visitor->data, expr->type, dmrC_show_ident(C, direct->ident));
	}
	else {
		visitor->begin_indirect_call_expression(visitor->data, expr->type);
		walk_expression(C, fn, visitor);
	}
	int n = 0;
	FOR_EACH_PTR(expr->args, arg) {
		visitor->begin_callarg_expression(visitor->data, expr->type, ++n);
		walk_expression(C, arg, visitor);
		visitor->end_callarg_expression(visitor->data, expr->type);
	} END_FOR_EACH_PTR(arg);
	visitor->end_call_expression(visitor->data, expr->type);
}

void walk_cast_expression(struct dmr_C *C, struct expression *expr, struct symbol_visitor *visitor)
{
	struct symbol *old_type, *new_type;
	int oldbits, newbits;
	int news, is_signed;

	old_type = expr->cast_expression->ctype;
	new_type = expr->cast_type;

	oldbits = old_type->bit_size;
	newbits = new_type->bit_size;
	is_signed = dmrC_is_signed_type(old_type);
	visitor->begin_cast_expression(visitor->data, expr->type, oldbits, newbits, !is_signed);
	walk_expression(C, expr->cast_expression, visitor);
	dmrC_walk_symbol(C, new_type, visitor);
	visitor->end_cast_expression(visitor->data, expr->type);
}


void walk_expression(struct dmr_C *C, struct expression *expr,
	struct symbol_visitor *visitor)
{
	if (!expr)
		return;
	if (!expr->ctype)
		return;

	visitor->begin_expression(visitor->data, expr->type);
	switch (expr->type) {
	case EXPR_CALL:
		walk_call_expression(C, expr, visitor);
		break;

	case EXPR_ASSIGNMENT:
		walk_assignment_expression(C, expr, visitor);
		break;

	case EXPR_COMMA:
		// return show_comma(C, expr);
		break;
	case EXPR_BINOP:
	case EXPR_COMPARE:
	case EXPR_LOGICAL:
		walk_binary_expression(C, expr, visitor);
		break;
	case EXPR_PREOP:
		walk_preop_expression(C, expr, visitor);
		break;
	case EXPR_POSTOP:
		// return show_postop(C, expr);
		break;
	case EXPR_SYMBOL:
		walk_symbol_expression(C, expr, visitor);
		break;
	case EXPR_DEREF:
	case EXPR_SIZEOF:
	case EXPR_PTRSIZEOF:
	case EXPR_ALIGNOF:
	case EXPR_OFFSETOF:
		break;
	case EXPR_CAST:
	case EXPR_FORCE_CAST:
	case EXPR_IMPLIED_CAST:
		walk_cast_expression(C, expr, visitor);
		break;
	case EXPR_VALUE:
		visitor->int_literal(visitor->data, expr->value, expr->ctype->bit_size, expr->ctype->ctype.modifiers & MOD_UNSIGNED);
		break;
	case EXPR_FVALUE:
		visitor->float_literal(visitor->data, expr->fvalue, expr->ctype->bit_size);
		break;
	case EXPR_STRING:
		visitor->string_literal(visitor->data, dmrC_show_string(C, expr->string));
		break;
	case EXPR_INITIALIZER:
		// return show_initializer_expr(C, expr, expr->ctype);
		break;
	case EXPR_SELECT:
	case EXPR_CONDITIONAL:
		// return show_conditional_expr(C, expr);
		break;
	case EXPR_STATEMENT:
		// return show_statement_expr(C, expr);
		break;
	case EXPR_LABEL:
		// return show_label_expr(C, expr);
		break;
	case EXPR_SLICE:
		// return show_slice(C, expr);
		break;

		// None of these should exist as direct expressions: they are
		// only valid as sub-expressions of initializers.
	case EXPR_POS:
	case EXPR_IDENTIFIER:
	case EXPR_INDEX:
	case EXPR_TYPE:
		break;
	}
	visitor->end_expression(visitor->data, expr->type);
}

void dmrC_walk_symbol_list(struct dmr_C *C, struct symbol_list *list,
	struct symbol_visitor *visitor)
{
	struct symbol *sym;

	FOR_EACH_PTR(list, sym) { dmrC_walk_symbol(C, sym, visitor); }
	END_FOR_EACH_PTR(sym);
}

void dmrC_walk_symbol(struct dmr_C *C, struct symbol *sym,
	struct symbol_visitor *visitor)
{
	if (!sym)
		return;
	if (sym->type != SYM_BASETYPE) {
		if (sym->aux) {
			/* already visited */
			visitor->reference_symbol(visitor->data, (uint64_t)sym->aux);
			return;
		}
		visitor->id++;
		sym->aux = (void *)visitor->id;
	}
	char name[80] = { 0 };
	if (sym->ident)
		snprintf(name, sizeof name, "%s",
			dmrC_show_ident(C, sym->ident));
	else if (sym->type == SYM_BASETYPE)
		snprintf(name, sizeof name, "%s",
			dmrC_builtin_typename(C, sym));
	struct symbol_info syminfo = { .id = (uint64_t)sym->aux,
				      .name = name,
				      .symbol_namespace = sym->ns,
				      .symbol_type = sym->type,
				      .alignment = sym->ctype.alignment,
				      .pos = sym->pos,
				      .bit_size = sym->bit_size,
				      .offset = sym->offset };
	if (dmrC_is_bitfield_type(sym)) {
		syminfo.bit_offset = sym->bit_offset;
	}
	if (sym->array_size) {
		syminfo.array_size =
			dmrC_get_expression_value(C, sym->array_size);
	}

	visitor->begin_symbol(visitor->data, &syminfo);

	if (sym->type == SYM_STRUCT || sym->type == SYM_UNION) {
		struct symbol *member;
		visitor->begin_struct_members(visitor->data, &syminfo);
		FOR_EACH_PTR(sym->symbol_list, member)
		{
			dmrC_walk_symbol(C, member, visitor);
		}
		END_FOR_EACH_PTR(member);
		visitor->end_struct_members(visitor->data, &syminfo);
	}

	if (sym->type == SYM_FN) {
		struct symbol *arg;
		visitor->begin_func_arguments(visitor->data, &syminfo);
		FOR_EACH_PTR(sym->arguments, arg)
		{
			dmrC_walk_symbol(C, arg, visitor);
		}
		END_FOR_EACH_PTR(member);
		visitor->end_func_arguments(visitor->data, &syminfo);
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
			visitor->begin_func_body(visitor->data, &syminfo);
			walk_statement(C, sym->stmt, visitor);
			visitor->end_func_body(visitor->data, &syminfo);
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
static void begin_func_returntype_default(void *data,
	struct symbol_info *syminfo)
{
}
static void end_func_returntype_default(void *data, struct symbol_info *syminfo)
{
}
static void begin_basetype_default(void *data, struct symbol_info *syminfo) {}
static void end_basetype_default(void *data, struct symbol_info *syminfo) {}
static void begin_initializer_default(void *data, struct symbol_info *syminfo)
{
}
static void end_initializer_default(void *data, struct symbol_info *syminfo) {}
static void string_expression_default(void *data, const char *str) {}
static void int_literal_default(void *data, long long value, int bit_size, bool is_unsigned) {}
static void float_literal_default(void *data, long double fvalue, int bit_size) {}
static void begin_statement_default(void *data, enum statement_type statement_type) {}
static void end_statement_default(void *data, enum statement_type statement_type) {}
static void begin_expression_default(void *data, enum expression_type expr_type) {}
static void end_expression_default(void *data, enum expression_type expr_type) {}
static void begin_assignment_expression_default(void *data, enum expression_type expr_type, int op) {}
static void end_assignment_expression_default(void *data, enum expression_type expr_type) {}
static void begin_binop_expression_default(void *data, enum expression_type expr_type, int op) {}
static void end_binop_expression_default(void *data, enum expression_type expr_type) {}
static void begin_preop_expression_default(void *data,
	enum expression_type expr_type, int op) {}
static void end_preop_expression_default(void *data,
	enum expression_type expr_type) {}
static void begin_direct_call_expression_default(void *data,
	enum expression_type expr_type, const char *name) {}
static void begin_indirect_call_expression_default(void *data,
	enum expression_type expr_type) {}
static void end_call_expression_default(void *data, enum expression_type expr_type) {}

static void begin_callarg_expression_default(void *data,
	enum expression_type expr_type,
	int argpos) {}
static void end_callarg_expression_default(void *data,
	enum expression_type expr_type) {}

static void begin_cast_expression_default(void *data,
	enum expression_type expr_type,
	int oldbits, int newbits,
	bool is_unsigned) {}
static void end_cast_expression_default(void *data, enum expression_type expr_type) {}


void dmrC_init_symbol_visitor(struct symbol_visitor *visitor)
{
	visitor->data = NULL;
	visitor->id = 0;
	visitor->begin_symbol = begin_symbol_default;
	visitor->end_symbol = end_symbol_default;
	visitor->begin_struct_members = begin_members_default;
	visitor->end_struct_members = end_members_default;
	visitor->begin_func_arguments = begin_arguments_default;
	visitor->end_func_arguments = end_arguments_default;
	visitor->reference_symbol = reference_symbol_default;
	visitor->begin_func_body = begin_body_default;
	visitor->end_func_body = end_body_default;
	visitor->begin_func_returntype = begin_func_returntype_default;
	visitor->end_func_returntype = end_func_returntype_default;
	visitor->begin_basetype = begin_basetype_default;
	visitor->end_basetype = end_basetype_default;
	visitor->begin_initializer = begin_initializer_default;
	visitor->end_initializer = end_initializer_default;
	visitor->string_literal = string_expression_default;
	visitor->float_literal = float_literal_default;
	visitor->int_literal = int_literal_default;
	visitor->begin_statement = begin_statement_default;
	visitor->end_statement = end_statement_default;
	visitor->begin_expression = begin_expression_default;
	visitor->end_expression = end_expression_default;
	visitor->begin_assignment_expression = begin_assignment_expression_default;
	visitor->end_assignment_expression = end_assignment_expression_default;
	visitor->begin_binop_expression = begin_binop_expression_default;
	visitor->end_binop_expression = end_binop_expression_default;
	visitor->begin_preop_expression = begin_preop_expression_default;
	visitor->end_preop_expression = end_preop_expression_default;
	visitor->begin_direct_call_expression = begin_direct_call_expression_default;
	visitor->begin_indirect_call_expression = begin_indirect_call_expression_default;
	visitor->end_call_expression = end_call_expression_default;
	visitor->begin_callarg_expression = begin_callarg_expression_default;
	visitor->end_callarg_expression = end_callarg_expression_default;
	visitor->begin_cast_expression = begin_cast_expression_default;
	visitor->end_cast_expression = end_cast_expression_default;

}