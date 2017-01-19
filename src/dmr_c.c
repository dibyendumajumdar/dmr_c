/*
* 'sparse' library helper routines.
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

#include <assert.h>
#include <ctype.h>
#include <fcntl.h>
#include <stdarg.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <sys/types.h>

#include <allocate.h>
#include <dmr_c.h>
#include <port.h>
#include <target.h>
#include <token.h>
#include <scope.h>
#include <expression.h>
#include <parse.h>

long double string_to_ld(const char *nptr, char **endptr)
{
	return strtod(nptr, endptr);
}

struct token *skip_to(struct token *token, int op)
{
	while (!match_op(token, op) && !eof_token(token))
		token = token->next;
	return token;
}

struct token *expect(struct dmr_C *C, struct token *token, int op, const char *where)
{
	if (!match_op(token, op)) {
		static struct token bad_token;
		if (token != &bad_token) {
			bad_token.next = token;
			sparse_error(C, token->pos, "Expected %s %s", show_special(C, op), where);
			sparse_error(C, token->pos, "got %s", show_token(C, token));
		}
		if (op == ';')
			return skip_to(token, op);
		return &bad_token;
	}
	return token->next;
}

unsigned int hexval(unsigned int c)
{
	int retval = 256;
	switch (c) {
	case '0':
	case '1':
	case '2':
	case '3':
	case '4':
	case '5':
	case '6':
	case '7':
	case '8':
	case '9':
		retval = c - '0';
		break;
	case 'a':
	case 'b':
	case 'c':
	case 'd':
	case 'e':
	case 'f':
		retval = c - 'a' + 10;
		break;
	case 'A':
	case 'B':
	case 'C':
	case 'D':
	case 'E':
	case 'F':
		retval = c - 'A' + 10;
		break;
	}
	return retval;
}

void die(const char *fmt, ...)
{
	va_list args;
	static char buffer[512];

	va_start(args, fmt);
	vsnprintf(buffer, sizeof(buffer), fmt, args);
	va_end(args);

	fprintf(stderr, "%s\n", buffer);
	exit(1);
}

static void do_warn(struct dmr_C *C, const char *type, struct position pos,
		    const char *fmt, va_list args)
{
	static char buffer[512];
	const char *name;

	vsprintf(buffer, fmt, args);
	name = stream_name(C, pos.stream);

	fprintf(stderr, "%s:%d:%d: %s%s\n", name, pos.line, pos.pos, type,
		buffer);
}

void info(struct dmr_C *C, struct position pos, const char *fmt, ...)
{
	va_list args;

	if (!C->show_info)
		return;
	va_start(args, fmt);
	do_warn(C, "", pos, fmt, args);
	va_end(args);
}

void warning(struct dmr_C *C, struct position pos, const char *fmt, ...)
{
	va_list args;

	if (!C->max_warnings) {
		C->show_info = 0;
		return;
	}

	if (!--C->max_warnings) {
		C->show_info = 0;
		fmt = "too many warnings";
	}

	va_start(args, fmt);
	do_warn(C, "warning: ", pos, fmt, args);
	va_end(args);
}

static void do_error(struct dmr_C *C, struct position pos, const char *fmt,
		     va_list args)
{
	C->die_if_error = 1;
	C->show_info = 1;
	/* Shut up warnings after an error */
	C->max_warnings = 0;
	if (C->errors > 100) {
		C->show_info = 0;
		if (C->once)
			return;
		fmt = "too many errors";
		C->once = 1;
	}

	do_warn(C, "error: ", pos, fmt, args);
	C->errors++;
}

void sparse_error(struct dmr_C *C, struct position pos, const char *fmt, ...)
{
	va_list args;
	va_start(args, fmt);
	do_error(C, pos, fmt, args);
	va_end(args);
}

void expression_error(struct dmr_C *C, struct expression *expr, const char *fmt, ...)
{
	va_list args;
	va_start(args, fmt);
	do_error(C, expr->pos, fmt, args);
	va_end(args);
	expr->ctype = &C->S->bad_ctype;
}

void error_die(struct dmr_C *C, struct position pos, const char *fmt, ...)
{
	va_list args;
	va_start(args, fmt);
	do_warn(C, "error: ", pos, fmt, args);
	va_end(args);
	exit(1);
}

struct dmr_C *new_dmr_C()
{
	struct dmr_C *C = (struct dmr_C *)calloc(1, sizeof(struct dmr_C));
	allocator_init(&C->byte_allocator, "bytes", sizeof(char),
		       __alignof__(char), CHUNK);
	allocator_init(&C->ident_allocator, "identifiers", sizeof(struct ident),
		       __alignof__(struct ident), CHUNK);
	allocator_init(&C->string_allocator, "strings", sizeof(struct string),
		       __alignof__(struct string), CHUNK);
	allocator_init(&C->token_allocator, "tokens", sizeof(struct token),
		       __alignof__(struct token), CHUNK);
	allocator_init(&C->scope_allocator, "scopes", sizeof(struct scope),
		__alignof__(struct scope), CHUNK);
	allocator_init(&C->expression_allocator, "expressions", sizeof(struct expression),
		__alignof__(struct expression), CHUNK);
	allocator_init(&C->statement_allocator, "statements", sizeof(struct statement),
		__alignof__(struct statement), CHUNK);

	init_target(C);
	init_tokenizer(C);
	init_scope(C);
	init_symbols(C);
	init_ctype(C);
	return C;
}

void destroy_dmr_C(struct dmr_C *C)
{
	destroy_all_scopes(C);
	destroy_tokenizer(C);
	destroy_target(C);
	destroy_symbols(C);
	allocator_destroy(&C->token_allocator);
	allocator_destroy(&C->string_allocator);
	allocator_destroy(&C->ident_allocator);
	allocator_destroy(&C->byte_allocator);
	allocator_destroy(&C->scope_allocator);
	allocator_destroy(&C->expression_allocator);
	allocator_destroy(&C->statement_allocator);
	free(C);
}
