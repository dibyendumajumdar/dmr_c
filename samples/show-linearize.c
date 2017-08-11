/*
 * Parse and linearize the tree for testing.
 *
 * Copyright (C) 2003 Transmeta Corp.
 *               2003-2004 Linus Torvalds
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
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <allocate.h>
#include <dmr_c.h>
#include <expression.h>
#include <linearize.h>
#include <parse.h>
#include <port.h>
#include <symbol.h>
#include <token.h>

static void clean_up_symbols(struct dmr_C *C, struct symbol_list *list)
{
	struct symbol *sym;

	FOR_EACH_PTR(list, sym)
	{
		struct entrypoint *ep;

		dmrC_expand_symbol(C, sym);
		ep = dmrC_linearize_symbol(C, sym);
		if (ep)
			dmrC_show_entry(C, ep);
	}
	END_FOR_EACH_PTR(sym);
}

int main(int argc, char **argv)
{
	struct string_list *filelist = NULL;
	char *file;

	struct dmr_C *C = new_dmr_C();
	clean_up_symbols(C, dmrC_sparse_initialize(C, argc, argv, &filelist));
	FOR_EACH_PTR(filelist, file)
	{
		clean_up_symbols(C, dmrC_sparse(C, file));
	}
	END_FOR_EACH_PTR(file);

	destroy_dmr_C(C);

	return 0;
}
