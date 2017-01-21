/*
 * Example trivial client program that uses the sparse library
 * to tokenize, preprocess and parse a C file, and prints out
 * the results.
 *
 * Copyright (C) 2003 Transmeta Corp.
 *               2003 Linus Torvalds
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
#include <stdarg.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <fcntl.h>

#include <port.h>
#include <dmr_c.h>
#include <allocate.h>
#include <token.h>
#include <parse.h>
#include <symbol.h>
#include <expression.h>


static void clean_up_symbols(struct dmr_C *C, struct ptr_list *list)
{
	struct symbol *sym;

	FOR_EACH_PTR(list, sym) {
		expand_symbol(C, sym);
	} END_FOR_EACH_PTR(sym);
}

int main(int argc, char **argv)
{
	struct ptr_list * list;
	struct ptr_list * filelist = NULL;
	char *file;
  
  struct dmr_C *C = new_dmr_C();

	list = sparse_initialize(C, argc, argv, &filelist);

	// Simplification
	clean_up_symbols(C, list);
	show_symbol_list(C, list, "\n\n");
	printf("\n\n");

	FOR_EACH_PTR(filelist, file) {
		list = sparse(C, file);

		// Simplification
		clean_up_symbols(C, list);

		// Show the end result.
		show_symbol_list(C, list, "\n\n");
		printf("\n\n");
	} END_FOR_EACH_PTR(file);

	return 0;
}
