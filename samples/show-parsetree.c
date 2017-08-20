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

static void begin_symbol_impl(void *data, struct symbol_info *syminfo)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	const char spaces[] = "                                           ";

	if (syminfo->symbol_type == SYM_NODE) {
		if (syminfo->name && syminfo->name[0])
			printf("%.*s%s id:%llu\n", treevisitor->nesting_level,
			       spaces, syminfo->name, syminfo->id);
		else
			printf("%.*sid:%llu\n", treevisitor->nesting_level,
			       spaces, syminfo->id);
	} else if (syminfo->symbol_type == SYM_BASETYPE)
		printf("%.*s%s\n", treevisitor->nesting_level, spaces,
		       syminfo->name);
	else
		printf("%.*s%s\n", treevisitor->nesting_level, spaces,
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
	const char spaces[] = "                                           ";
	printf("%.*s{\n", treevisitor->nesting_level, spaces);
}
static void end_members_impl(void *data, struct symbol_info *syminfo)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	const char spaces[] = "                                           ";
	printf("%.*s}\n", treevisitor->nesting_level, spaces);
}
static void begin_arguments_impl(void *data, struct symbol_info *syminfo)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	const char spaces[] = "                                           ";
	printf("%.*s(\n", treevisitor->nesting_level, spaces);
}
static void end_arguments_impl(void *data, struct symbol_info *syminfo)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	const char spaces[] = "                                           ";
	printf("%.*s)\n", treevisitor->nesting_level, spaces);
}
static void begin_statement_impl(void *data, enum statement_type stmt_type)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	const char spaces[] = "                                           ";
	treevisitor->nesting_level++;
	printf("%.*s{\n", treevisitor->nesting_level, spaces);
}
static void end_statement_impl(void *data, enum statement_type stmt_type)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	const char spaces[] = "                                           ";
	printf("%.*s}\n", treevisitor->nesting_level, spaces);
	treevisitor->nesting_level--;
}

static void reference_symbol_impl(void *data, uint64_t sym)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	const char spaces[] = "                                           ";
	printf("%.*ssym(%llu)\n", treevisitor->nesting_level, spaces, sym);
}
static void int_literal_impl(void *data, long long value, int bit_size,
			     bool is_unsigned)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	const char spaces[] = "                                           ";
	printf("%.*s", treevisitor->nesting_level, spaces);
	printf("(%d)%lld\n", bit_size, value);
}
static void float_literal_impl(void *data, long double fvalue, int bit_size)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	const char spaces[] = "                                           ";
	printf("%.*s", treevisitor->nesting_level, spaces);
	printf("(%d)%f\n", bit_size, fvalue);
}
static void string_literal_impl(void *data, const char *str)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	const char spaces[] = "                                           ";
	printf("%.*s", treevisitor->nesting_level, spaces);
	printf("%s\n", str);
}
static void begin_assignment_expression_impl(void *data,
					     enum expression_type expr_type,
					     int op)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	const char spaces[] = "                                           ";
	const char *oper = "=";
	switch (op) {
	case SPECIAL_ADD_ASSIGN:
		oper = "+=";
		break;
	case SPECIAL_SUB_ASSIGN:
		oper = "-=";
		break;
	case SPECIAL_MUL_ASSIGN:
		oper = "*=";
		break;
	case SPECIAL_DIV_ASSIGN:
		oper = "/=";
		break;
	case SPECIAL_MOD_ASSIGN:
		oper = "%=";
		break;
	case SPECIAL_SHL_ASSIGN:
		oper = "<<=";
		break;
	case SPECIAL_SHR_ASSIGN:
		oper = ">>=";
		break;
	case SPECIAL_AND_ASSIGN:
		oper = "&=";
		break;
	case SPECIAL_OR_ASSIGN:
		oper = "|=";
		break;
	case SPECIAL_XOR_ASSIGN:
		oper = "^=";
		break;
	}
	printf("%.*s%s\t\t\t\t(EXPR_ASSIGNMENT)\n", treevisitor->nesting_level, spaces, oper);
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
	const char spaces[] = "                                           ";
	printf("%.*s%c\t\t\t\t(EXPR_BINOP)\n", treevisitor->nesting_level, spaces, (char)op);
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
	char oper[3] = { 0 };
	if (op == SPECIAL_INCREMENT) {
		oper[0] = '+';
		oper[1] = '+';
	}
	else if (op == SPECIAL_DECREMENT) {
		oper[0] = '-';
		oper[1] = '-';
	}
	else {
		oper[0] = (char)op;
	}
	printf("%.*s%s\t\t\t\t(EXPR_PREOP)\n", treevisitor->nesting_level, spaces, oper);
	treevisitor->nesting_level++;
}

static void end_preop_expression_impl(void *data,
	enum expression_type expr_type)
{
	struct tree_visitor *treevisitor = (struct tree_visitor *)data;
	treevisitor->nesting_level--;
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

	struct tree_visitor treevisitor = {
	    .C = C, .nesting_level = 0};

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
