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
	} else if (syminfo->symbol_type == SYM_BASETYPE)
		output(treevisitor, "%s\n", syminfo->name);
	else
		output(treevisitor, "%s\n",
		       dmrC_get_type_name(syminfo->symbol_type));
	treevisitor->nesting_level++;
}

static void end_symbol_impl(void *data, struct symbol_info *syminfo)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	treevisitor->nesting_level--;
}

static void begin_members_impl(void *data, struct symbol_info *syminfo)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	output(treevisitor, "{\n");
}
static void end_members_impl(void *data, struct symbol_info *syminfo)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	output(treevisitor, "}\n");
}
static void begin_arguments_impl(void *data, struct symbol_info *syminfo)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	output(treevisitor, "(\n");
}
static void end_arguments_impl(void *data, struct symbol_info *syminfo)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	output(treevisitor, ")\n");
}
static void begin_statement_impl(void *data, enum statement_type stmt_type)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	output(treevisitor, "{\n");
	treevisitor->nesting_level++;
}
static void end_statement_impl(void *data, enum statement_type stmt_type)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	treevisitor->nesting_level--;
	output(treevisitor, "}\n");
}

static void reference_symbol_impl(void *data, uint64_t sym)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
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

static void end_assignment_expression_impl(void *data,
					   enum expression_type expr_type)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	treevisitor->nesting_level--;
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

static void end_binop_expression_impl(void *data,
				      enum expression_type expr_type)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	treevisitor->nesting_level--;
}

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

static void end_preop_expression_impl(void *data,
				      enum expression_type expr_type)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	treevisitor->nesting_level--;
}

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
static void end_call_expression_impl(void *data, enum expression_type expr_type)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	treevisitor->nesting_level--;
}

static void begin_callarg_expression_impl(void *data,
					  enum expression_type expr_type,
					  int argpos)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	output(treevisitor, "arg[%d]\n", argpos);
	treevisitor->nesting_level++;
}
static void end_callarg_expression_impl(void *data,
					enum expression_type expr_type)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	treevisitor->nesting_level--;
}
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
static void end_cast_expression_impl(void *data, enum expression_type expr_type)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	treevisitor->nesting_level--;
}
static void begin_conditional_expression_impl(void *data,
					      enum expression_type expr_type)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	output(treevisitor, "select\n");
	treevisitor->nesting_level++;
}
static void end_conditional_expression_impl(void *data,
					    enum expression_type expr_type)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	treevisitor->nesting_level--;
}
static void begin_label_expression_impl(void *data,
					enum expression_type expr_type)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	output(treevisitor, "label\n");
	treevisitor->nesting_level++;
}
static void end_label_expression_impl(void *data,
				      enum expression_type expr_type)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	treevisitor->nesting_level--;
}
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
					   unsigned init_offset, int bit_offset, const char *ident)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	output(treevisitor, "set [%d:%d] of %s\n", init_offset, bit_offset, ident);
	treevisitor->nesting_level++;
}
static void end_expression_position_impl(void *data,
					 enum expression_type expr_type)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	treevisitor->nesting_level--;
}
static void begin_initialization_impl(void *data,
				      enum expression_type expr_type)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
}
static void end_initialization_impl(void *data, enum expression_type expr_type)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
}

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
	visitor.begin_initialization = begin_initialization_impl;
	visitor.end_initialization = end_initialization_impl;

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
