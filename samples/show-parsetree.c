/*
 * Dumps the parse tree
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
#include <ctype.h>
#include <fcntl.h>
#include <stdarg.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <walksymbol.h>

/*
Issues:
	1) display of labels - the sym display repeats the identifier
	2) Symbols should display name when available
	3) if statements should probably use then and else sub sections.
	4) Better way to show iterator statements
*/

struct tree_visitor {
	struct dmr_C *C;
	int nesting_level;
};

static const char spaces[] = "                                           ";
static void nestedprint(struct tree_visitor *visitor, const char *fmt,
			va_list args)
{
	printf("%.*s", visitor->nesting_level, spaces);
	vfprintf(stdout, fmt, args);
}

static void output(struct tree_visitor *visitor, const char *fmt, ...)
{
	va_list args;
	va_start(args, fmt);
	nestedprint(visitor, fmt, args);
	va_end(args);
}

static void begin_symbol_impl(void *data, struct symbol_info *syminfo)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	const char spaces[] = "                                           ";

	if (syminfo->symbol_type == SYM_NODE) {
		if (syminfo->name && syminfo->name[0])
			output(treevisitor, "%s id:%llu\t\t\t\tSYM_NODE\n",
			       syminfo->name, syminfo->id);
		else
			output(treevisitor, "id:%llu\t\t\t\tSYM_NODE\n",
			       syminfo->id);
	} else if (syminfo->symbol_type == SYM_BASETYPE ||
		   syminfo->symbol_type == SYM_LABEL) {
		output(treevisitor, "%s\n", syminfo->name);
	} else if (syminfo->symbol_type == SYM_STRUCT ||
		   syminfo->symbol_type == SYM_UNION ||
		   syminfo->symbol_type == SYM_ENUM) {
		output(treevisitor, "%s %s\n",
		       dmrC_get_type_name(syminfo->symbol_type), syminfo->name);
	} else {
		output(treevisitor, "%s\n",
		       dmrC_get_type_name(syminfo->symbol_type));
	}
	treevisitor->nesting_level++;
}

static void decrement_nesting(void *data)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	treevisitor->nesting_level--;
}

static void increment_nesting_openbrace(void *data, const char *tag)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	output(treevisitor, "%s {\n", tag);
	treevisitor->nesting_level++;
}

static void decrement_nesting_closebrace(void *data)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	treevisitor->nesting_level--;
	output(treevisitor, "}\n");
}

static void end_symbol_impl(void *data) { decrement_nesting(data); }

static void begin_members_impl(void *data, struct symbol_info *syminfo)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	output(treevisitor, "{\n");
}
static void end_members_impl(void *data)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	output(treevisitor, "}\n");
}
static void begin_arguments_impl(void *data, struct symbol_info *syminfo)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	output(treevisitor, "(\n");
}
static void end_arguments_impl(void *data)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	output(treevisitor, ")\n");
}

static const char *statement_type_name(enum statement_type type)
{
	static const char *stmt_names[] = {
	    [STMT_NONE] = "",		[STMT_DECLARATION] = "decl",
	    [STMT_EXPRESSION] = "expr", [STMT_COMPOUND] = "",
	    [STMT_IF] = "if",		[STMT_RETURN] = "ret",
	    [STMT_CASE] = "case",       [STMT_SWITCH] = "switch",
	    [STMT_ITERATOR] = "iter",   [STMT_LABEL] = "",
	    [STMT_GOTO] = "goto",       [STMT_ASM] = "asm",
	    [STMT_CONTEXT] = "context", [STMT_RANGE] = "range",
	};
	return stmt_names[type];
}

static void begin_statement_impl(void *data, enum statement_type stmt_type)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	const char *s = statement_type_name(stmt_type);
	if (s && *s)
		output(treevisitor, "%s {\n", s);
	else
		output(treevisitor, "{\n");
	treevisitor->nesting_level++;
}
static void end_statement_impl(void *data)
{
	decrement_nesting_closebrace(data);
}

static void reference_symbol_impl(void *data, uint64_t sym, const char *name)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	if (*name)
		output(treevisitor, "%s sym(%llu)\n", name, sym);
	else
		output(treevisitor, "sym(%llu)\n", sym);
}
static void int_literal_impl(void *data, long long value, int bit_size,
			     bool is_unsigned)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	output(treevisitor, "(%d)%lld\n", bit_size, value);
}
static void float_literal_impl(void *data, long double fvalue, int bit_size)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	output(treevisitor, "(%d)%f\n", bit_size, fvalue);
}
static void string_literal_impl(void *data, const char *str)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	output(treevisitor, "%s\n", str);
}
static void begin_assignment_expression_impl(void *data,
					     enum expression_type expr_type,
					     int op)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	char oper[4] = {0};
	const char *opname = dmrC_show_special(treevisitor->C, op);
	if (op < 125)
		oper[0] = (char)op;
	else {
		strcpy(oper, opname);
	}
	output(treevisitor, "%s\t\t\t\t(EXPR_ASSIGNMENT)\n", oper);
	treevisitor->nesting_level++;
}

static void end_assignment_expression_impl(void *data)
{
	decrement_nesting(data);
}

static void begin_binop_expression_impl(void *data,
					enum expression_type expr_type, int op)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	char oper[4] = {0};
	const char *opname = dmrC_show_special(treevisitor->C, op);
	if (op < 125)
		oper[0] = (char)op;
	else {
		strcpy(oper, opname);
	}
	output(treevisitor, "%s\t\t\t\t(EXPR_BINOP)\n", oper);
	treevisitor->nesting_level++;
}

static void end_binop_expression_impl(void *data) { decrement_nesting(data); }

static void begin_preop_expression_impl(void *data,
					enum expression_type expr_type, int op)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	const char spaces[] = "                                           ";
	char oper[6] = {0};
	const char *opname = dmrC_show_special(treevisitor->C, op);
	if (op == '*')
		strcpy(oper, "deref");
	else if (op < 125)
		oper[0] = (char)op;
	else {
		strcpy(oper, opname);
	}
	output(treevisitor, "%s\t\t\t\t(EXPR_PREOP)\n", oper);
	treevisitor->nesting_level++;
}

static void end_preop_expression_impl(void *data) { decrement_nesting(data); }

static void begin_postop_expression_impl(void *data,
					 enum expression_type expr_type, int op)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	const char spaces[] = "                                           ";
	char oper[6] = {0};
	const char *opname = dmrC_show_special(treevisitor->C, op);
	strcpy(oper, opname);
	output(treevisitor, "%s\t\t\t\t(EXPR_POSTOP)\n", oper);
	treevisitor->nesting_level++;
}

static void end_postop_expression_impl(void *data) { decrement_nesting(data); }

static void begin_direct_call_expression_impl(void *data,
					      enum expression_type expr_type,
					      const char *name)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	output(treevisitor, "direct call %s\n", name);
	treevisitor->nesting_level++;
}
static void begin_indirect_call_expression_impl(void *data,
						enum expression_type expr_type)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	output(treevisitor, "indirect call\n");
	treevisitor->nesting_level++;
}
static void end_call_expression_impl(void *data) { decrement_nesting(data); }

static void begin_callarg_expression_impl(void *data,
					  enum expression_type expr_type,
					  int argpos)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	output(treevisitor, "arg[%d]\n", argpos);
	treevisitor->nesting_level++;
}
static void end_callarg_expression_impl(void *data) { decrement_nesting(data); }
static void begin_initializer_impl(void *data, struct symbol_info *syminfo)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	output(treevisitor, "=\n");
}
static void begin_cast_expression_impl(void *data,
				       enum expression_type expr_type,
				       int oldbits, int newbits,
				       bool is_unsigned)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	output(treevisitor, "cast %s\n", (is_unsigned ? "[unsigned]" : ""));
	treevisitor->nesting_level++;
}
static void end_cast_expression_impl(void *data) { decrement_nesting(data); }
static void begin_conditional_expression_impl(void *data,
					      enum expression_type expr_type)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	output(treevisitor, "select\n");
	treevisitor->nesting_level++;
}
static void end_conditional_expression_impl(void *data)
{
	decrement_nesting(data);
}
static void begin_label_expression_impl(void *data,
					enum expression_type expr_type)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	output(treevisitor, "label\n");
	treevisitor->nesting_level++;
}
static void end_label_expression_impl(void *data) { decrement_nesting(data); }
static void do_expression_identifier_impl(void *data,
					  enum expression_type expr_type,
					  const char *ident)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	output(treevisitor, "set %s\n", ident);
}
static void do_expression_index_impl(void *data, enum expression_type expr_type,
				     unsigned from, unsigned to)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	output(treevisitor, "set %u..%u\n", from, to);
}
static void begin_expression_position_impl(void *data,
					   enum expression_type expr_type,
					   unsigned init_offset, int bit_offset,
					   const char *ident)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	output(treevisitor, "set [%d:%d] of %s\n", init_offset, bit_offset,
	       ident);
	treevisitor->nesting_level++;
}
static void end_expression_position_impl(void *data)
{
	decrement_nesting(data);
}
static void begin_label_impl(void *data, const char *name)
{
	printf("%s:", name);
}

static void end_label_impl(void *data) {}

static void begin_iterator_prestatement_impl(void *data)
{
	increment_nesting_openbrace(data, "prestatement");
}
static void end_iterator_prestatement_impl(void *data)
{
	decrement_nesting_closebrace(data);
}
static void begin_iterator_precondition_impl(void *data)
{
	increment_nesting_openbrace(data, "precondition");
}
static void end_iterator_precondition_impl(void *data)
{
	decrement_nesting_closebrace(data);
}
static void begin_iterator_statement_impl(void *data)
{
	increment_nesting_openbrace(data, "statement");
}
static void end_iterator_statement_impl(void *data)
{
	decrement_nesting_closebrace(data);
}
static void begin_iterator_postcondition_impl(void *data)
{
	increment_nesting_openbrace(data, "postcondition");
}
static void end_iterator_postcondition_impl(void *data)
{
	decrement_nesting_closebrace(data);
}
static void begin_iterator_poststatement_impl(void *data)
{
	increment_nesting_openbrace(data, "poststatement");
}
static void end_iterator_poststatement_impl(void *data)
{
	decrement_nesting_closebrace(data);
}

static void begin_case_value_impl(void *data, long long value)
{
	char temp[100];
	snprintf(temp, sizeof temp, "on %lld goto", value);
	increment_nesting_openbrace(data, temp);
}
static void begin_case_range_impl(void *data, long long from, long long to)
{
	char temp[100];
	snprintf(temp, sizeof temp, "on %lld ... %lld goto", from, to);
	increment_nesting_openbrace(data, temp);
}
static void begin_default_case_impl(void *data)
{
	increment_nesting_openbrace(data, "by default goto");
}
static void end_case_impl(void *data) { decrement_nesting_closebrace(data); }

static void begin_if_then_impl(void *data)
{
	increment_nesting_openbrace(data, "then");
}
static void end_if_then_impl(void *data) { decrement_nesting_closebrace(data); }
static void begin_if_else_impl(void *data)
{
	increment_nesting_openbrace(data, "else");
}
static void end_if_else_impl(void *data) { decrement_nesting_closebrace(data); }

static void clean_up_symbols(struct dmr_C *C, struct symbol_list *list)
{
	struct symbol *sym;

	FOR_EACH_PTR(list, sym) { dmrC_expand_symbol(C, sym); }
	END_FOR_EACH_PTR(sym);
}

int main(int argc, char **argv)
{
	struct symbol_list *list;
	struct string_list *filelist = NULL;
	char *file;

	struct dmr_C *C = new_dmr_C();

	struct tree_visitor treevisitor = {.C = C, .nesting_level = 0};

	struct symbol_visitor visitor;
	dmrC_init_symbol_visitor(&visitor);

	visitor.data = &treevisitor;
	visitor.begin_symbol = begin_symbol_impl;
	visitor.end_symbol = end_symbol_impl;
	visitor.reference_symbol = reference_symbol_impl;
	visitor.begin_struct_members = begin_members_impl;
	visitor.end_struct_members = end_members_impl;
	visitor.begin_func_arguments = begin_arguments_impl;
	visitor.end_func_arguments = end_arguments_impl;
	visitor.string_literal = string_literal_impl;
	visitor.int_literal = int_literal_impl;
	visitor.float_literal = float_literal_impl;
	visitor.string_literal = string_literal_impl;
	visitor.begin_statement = begin_statement_impl;
	visitor.end_statement = end_statement_impl;
	visitor.begin_assignment_expression = begin_assignment_expression_impl;
	visitor.end_assignment_expression = end_assignment_expression_impl;
	visitor.begin_binop_expression = begin_binop_expression_impl;
	visitor.end_binop_expression = end_binop_expression_impl;
	visitor.begin_preop_expression = begin_preop_expression_impl;
	visitor.end_preop_expression = end_preop_expression_impl;
	visitor.begin_postop_expression = begin_postop_expression_impl;
	visitor.end_postop_expression = end_postop_expression_impl;
	visitor.begin_direct_call_expression =
	    begin_direct_call_expression_impl;
	visitor.begin_indirect_call_expression =
	    begin_indirect_call_expression_impl;
	visitor.end_call_expression = end_call_expression_impl;
	visitor.begin_callarg_expression = begin_callarg_expression_impl;
	visitor.end_callarg_expression = end_callarg_expression_impl;
	visitor.begin_initializer = begin_initializer_impl;
	visitor.begin_cast_expression = begin_cast_expression_impl;
	visitor.end_cast_expression = end_cast_expression_impl;
	visitor.begin_conditional_expression =
	    begin_conditional_expression_impl;
	visitor.end_conditional_expression = end_conditional_expression_impl;
	visitor.begin_label_expression = begin_label_expression_impl;
	visitor.end_label_expression = end_label_expression_impl;
	visitor.do_expression_identifier = do_expression_identifier_impl;
	visitor.do_expression_index = do_expression_index_impl;
	visitor.begin_expression_position = begin_expression_position_impl;
	visitor.end_expression_position = end_expression_position_impl;
	visitor.begin_label = begin_label_impl;
	visitor.end_label = end_label_impl;
	visitor.begin_iterator_prestatement = begin_iterator_prestatement_impl;
	visitor.end_iterator_prestatement = end_iterator_prestatement_impl;
	visitor.begin_iterator_precondition = begin_iterator_precondition_impl;
	visitor.end_iterator_precondition = end_iterator_precondition_impl;
	visitor.begin_iterator_statement = begin_iterator_statement_impl;
	visitor.end_iterator_statement = end_iterator_statement_impl;
	visitor.begin_iterator_postcondition =
	    begin_iterator_postcondition_impl;
	visitor.end_iterator_postcondition = end_iterator_postcondition_impl;
	visitor.begin_iterator_poststatement =
	    begin_iterator_poststatement_impl;
	visitor.end_iterator_poststatement = end_iterator_poststatement_impl;
	visitor.begin_case_value = begin_case_value_impl;
	visitor.begin_case_range = begin_case_range_impl;
	visitor.begin_default_case = begin_default_case_impl;
	visitor.end_case = end_case_impl;
	visitor.begin_if_then = begin_if_then_impl;
	visitor.end_if_then = end_if_then_impl;
	visitor.begin_if_else = begin_if_else_impl;
	visitor.end_if_else = end_if_else_impl;

	list = dmrC_sparse_initialize(C, argc, argv, &filelist);

	// Simplification
	clean_up_symbols(C, list);
	dmrC_walk_symbol_list(C, list, &visitor);

	FOR_EACH_PTR(filelist, file)
	{
		list = dmrC_sparse(C, file);

		// Simplification
		clean_up_symbols(C, list);

		// Show the end result.
		dmrC_walk_symbol_list(C, list, &visitor);
	}
	END_FOR_EACH_PTR(file);

	destroy_dmr_C(C);

	return 0;
}
