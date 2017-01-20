/*
 * Symbol scoping.
 *
 * This is pretty trivial.
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
 /*
 * This version is part of the dmr_c project.
 * Copyright (C) 2017 Dibyendu Majumdar
 */

#include <stdlib.h>
#include <string.h>
#include <stdio.h>

#include <port.h>
#include <dmr_c.h>
#include <allocate.h>
#include <symbol.h>
#include <scope.h>

void init_scope(struct dmr_C *C) {
	struct scope *scope = (struct scope *)allocator_allocate(&C->scope_allocator, 0);
	memset(scope, 0, sizeof(*scope));
	scope->next = scope;
	C->builtin_scope = scope;
	C->block_scope = C->builtin_scope;		// regular automatic variables etc
	C->function_scope = C->builtin_scope;	// labels, arguments etc
	C->file_scope = C->builtin_scope;		// static
	C->global_scope = C->builtin_scope;		// externally visible
}

void destroy_all_scopes(struct dmr_C *C) {
}

void bind_scope(struct dmr_C *C, struct symbol *sym, struct scope *scope)
{
	sym->scope = scope;
	ptrlist_add(&scope->symbols, sym);
}

static void start_scope(struct dmr_C *C, struct scope **s)
{
	struct scope *scope = (struct scope *)allocator_allocate(&C->scope_allocator, 0);
	memset(scope, 0, sizeof(*scope));
	scope->next = *s;
	*s = scope;
}

void start_file_scope(struct dmr_C *C)
{
	struct scope *scope = (struct scope *)allocator_allocate(&C->scope_allocator, 0);

	memset(scope, 0, sizeof(*scope));
	scope->next = C->builtin_scope;
	C->file_scope = scope;

	/* top-level stuff defaults to file scope, "extern" etc will choose global scope */
	C->function_scope = scope;
	C->block_scope = scope;
}

void start_symbol_scope(struct dmr_C *C)
{
	start_scope(C, &C->block_scope);
}

void start_function_scope(struct dmr_C *C)
{
	start_scope(C, &C->function_scope);
	start_scope(C, &C->block_scope);
}

static void remove_symbol_scope(struct dmr_C *C, struct symbol *sym)
{
	struct symbol **ptr = &sym->ident->symbols;

	while (*ptr != sym)
		ptr = &(*ptr)->next_id;
	*ptr = sym->next_id;
}

static void end_scope(struct dmr_C *C, struct scope **s)
{
	struct scope *scope = *s;
	struct ptr_list *symbols = scope->symbols;
	struct symbol *sym;

	*s = scope->next;
	scope->symbols = NULL;
	FOR_EACH_PTR(symbols, sym) {
		remove_symbol_scope(C, sym);
	} END_FOR_EACH_PTR(sym);
}

void end_file_scope(struct dmr_C *C)
{
	end_scope(C, &C->file_scope);
}

void new_file_scope(struct dmr_C *C)
{
	if (C->file_scope != C->builtin_scope)
		end_file_scope(C);
	start_file_scope(C);
}

void end_symbol_scope(struct dmr_C *C)
{
	end_scope(C, &C->block_scope);
}

void end_function_scope(struct dmr_C *C)
{
	end_scope(C, &C->block_scope);
	end_scope(C, &C->function_scope);
}

int is_outer_scope(struct dmr_C *C, struct scope *scope)
{
	if (scope == C->block_scope)
		return 0;
	if (scope == C->builtin_scope && C->block_scope->next == C->builtin_scope)
		return 0;
	return 1;
}
