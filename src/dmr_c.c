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
#include <linearize.h>

#define SPARSE_VERSION "" 
#ifndef __GNUC__
# define __GNUC__ 2
# define __GNUC_MINOR__ 95
# define __GNUC_PATCHLEVEL__ 0
#endif

int gcc_major = __GNUC__;
int gcc_minor = __GNUC_MINOR__;
int gcc_patchlevel = __GNUC_PATCHLEVEL__;

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

void die(struct dmr_C *C, const char *fmt, ...)
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


#ifdef __x86_64__
#define ARCH_M64_DEFAULT 1
#else
#define ARCH_M64_DEFAULT 0
#endif

struct dmr_C *new_dmr_C()
{
	struct dmr_C *C = (struct dmr_C *)calloc(1, sizeof(struct dmr_C));
	C->standard = STANDARD_GNU89;
	C->arch_m64 = ARCH_M64_DEFAULT;
	C->arch_msize_long = 0;

#ifdef GCC_BASE
	C->gcc_base_dir = GCC_BASE;
#else
	C->gcc_base_dir = NULL;
#endif

	C->Waddress_space = 1;
	C->Wcast_truncate = 1;
	C->Wcontext = 1;
	C->Wdecl = 1;
	C->Wdeclarationafterstatement = -1;
	C->Wdesignated_init = 1;
	C->Wenum_mismatch = 1;
	C->Wnon_pointer_null = 1;
	C->Wold_initializer = 1;
	C->Wone_bit_signed_bitfield = 1;
	C->Wuninitialized = 1;
	C->Wvla = 1;

	C->max_warnings = 100;
	C->show_info = 1;

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

	C->warnings[0].name = "address-space"; C->warnings[0].flag = &C->Waddress_space;
	C->warnings[1].name = "bitwise"; C->warnings[1].flag = &C->Wbitwise;
	C->warnings[2].name = "cast-to-as"; C->warnings[2].flag = &C->Wcast_to_as;
	C->warnings[3].name = "cast-truncate"; C->warnings[3].flag = &C->Wcast_truncate;
	C->warnings[4].name = "context"; C->warnings[4].flag = &C->Wcontext;
	C->warnings[5].name = "decl"; C->warnings[5].flag = &C->Wdecl;
	C->warnings[6].name = "declaration-after-statement"; C->warnings[6].flag = &C->Wdeclarationafterstatement;
	C->warnings[7].name = "default-bitfield-sign"; C->warnings[7].flag = &C->Wdefault_bitfield_sign;
	C->warnings[8].name = "designated-init"; C->warnings[8].flag = &C->Wdesignated_init;
	C->warnings[9].name = "do-while"; C->warnings[9].flag = &C->Wdo_while;
	C->warnings[10].name = "enum-mismatch"; C->warnings[10].flag = &C->Wenum_mismatch;
	C->warnings[11].name = "init-cstring"; C->warnings[11].flag = &C->Winit_cstring;
	C->warnings[12].name = "non-pointer-null"; C->warnings[12].flag = &C->Wnon_pointer_null;
	C->warnings[13].name = "old-initializer"; C->warnings[13].flag = &C->Wold_initializer;
	C->warnings[14].name = "one-bit-signed-bitfield"; C->warnings[14].flag = &C->Wone_bit_signed_bitfield;
	C->warnings[15].name = "paren-string"; C->warnings[15].flag = &C->Wparen_string;
	C->warnings[16].name = "ptr-subtraction-blows"; C->warnings[16].flag = &C->Wptr_subtraction_blows;
	C->warnings[17].name = "return-void"; C->warnings[17].flag = &C->Wreturn_void;
	C->warnings[18].name = "shadow"; C->warnings[18].flag = &C->Wshadow;
	C->warnings[19].name = "transparent-union"; C->warnings[19].flag = &C->Wtransparent_union;
	C->warnings[20].name = "typesign"; C->warnings[20].flag = &C->Wtypesign;
	C->warnings[21].name = "undef"; C->warnings[21].flag = &C->Wundef;
	C->warnings[22].name = "uninitialized"; C->warnings[22].flag = &C->Wuninitialized;
	C->warnings[23].name = "vla"; C->warnings[23].flag = &C->Wvla;

	C->debugs[0].name = "entry"; C->debugs[0].flag = &C->dbg_entry;
	C->debugs[1].name = "dead";  C->debugs[1].flag = &C->dbg_dead;

	init_target(C);
	init_tokenizer(C);
	init_scope(C);
	init_symbols(C);
	init_ctype(C);
	init_linearizer(C);
	return C;
}

void destroy_dmr_C(struct dmr_C *C)
{
	destroy_all_scopes(C);
	destroy_tokenizer(C);
	destroy_target(C);
	destroy_symbols(C);
	destroy_linearizer(C);
	allocator_destroy(&C->token_allocator);
	allocator_destroy(&C->protected_token_allocator);
	allocator_destroy(&C->string_allocator);
	allocator_destroy(&C->ident_allocator);
	allocator_destroy(&C->byte_allocator);
	allocator_destroy(&C->scope_allocator);
	allocator_destroy(&C->expression_allocator);
	allocator_destroy(&C->statement_allocator);
	free(C);
}

void add_pre_buffer(struct dmr_C *C, const char *fmt, ...)
{
	va_list args;
	unsigned int size;
	struct token *begin, *end;
	char buffer[4096];

	va_start(args, fmt);
	size = vsnprintf(buffer, sizeof(buffer), fmt, args);
	va_end(args);
	begin = tokenize_buffer(C, buffer, size, &end);
	if (!C->pre_buffer_begin)
		C->pre_buffer_begin = begin;
	if (C->pre_buffer_end)
		C->pre_buffer_end->next = begin;
	C->pre_buffer_end = end;
}

static char **handle_switch_D(struct dmr_C *C, char *arg, char **next)
{
	const char *name = arg + 1;
	const char *value = "1";

	if (!*name || isspace(*name))
		die(C, "argument to `-D' is missing");

	for (;;) {
		char c;
		c = *++arg;
		if (!c)
			break;
		if (isspace((unsigned char)c) || c == '=') {
			*arg = '\0';
			value = arg + 1;
			break;
		}
	}
	add_pre_buffer(C, "#define %s %s\n", name, value);
	return next;
}

static char **handle_switch_E(struct dmr_C *C, char *arg, char **next)
{
	if (arg[1] == '\0')
		C->preprocess_only = 1;
	return next;
}

static char **handle_switch_I(struct dmr_C *C, char *arg, char **next)
{
	char *path = arg + 1;

	switch (arg[1]) {
	case '-':
		add_pre_buffer(C, "#split_include\n");
		break;

	case '\0':	/* Plain "-I" */
		path = *++next;
		if (!path)
			die(C, "missing argument for -I option");
		/* Fall through */
	default:
		add_pre_buffer(C, "#add_include \"%s/\"\n", path);
	}
	return next;
}

static void add_cmdline_include(struct dmr_C *C, char *filename)
{
	if (C->cmdline_include_nr >= CMDLINE_INCLUDE)
		die(C, "too many include files for %s\n", filename);
	C->cmdline_include[C->cmdline_include_nr++] = filename;
}

static char **handle_switch_i(struct dmr_C *C, char *arg, char **next)
{
	if (*next && !strcmp(arg, "include"))
		add_cmdline_include(C, *++next);
	else if (*next && !strcmp(arg, "imacros"))
		add_cmdline_include(C, *++next);
	else if (*next && !strcmp(arg, "isystem")) {
		char *path = *++next;
		if (!path)
			die(C, "missing argument for -isystem option");
		add_pre_buffer(C, "#add_isystem \"%s/\"\n", path);
	}
	else if (*next && !strcmp(arg, "idirafter")) {
		char *path = *++next;
		if (!path)
			die(C, "missing argument for -idirafter option");
		add_pre_buffer(C, "#add_dirafter \"%s/\"\n", path);
	}
	return next;
}

static char **handle_switch_M(struct dmr_C *C, char *arg, char **next)
{
	if (!strcmp(arg, "MF") || !strcmp(arg, "MQ") || !strcmp(arg, "MT")) {
		if (!*next)
			die(C, "missing argument for -%s option", arg);
		return next + 1;
	}
	return next;
}

static char **handle_switch_m(struct dmr_C *C, char *arg, char **next)
{
	if (!strcmp(arg, "m64")) {
		C->arch_m64 = 1;
	}
	else if (!strcmp(arg, "m32")) {
		C->arch_m64 = 0;
	}
	else if (!strcmp(arg, "msize-long")) {
		C->arch_msize_long = 1;
	}
	return next;
}

static void handle_arch_m64_finalize(struct dmr_C *C)
{
	if (C->arch_m64) {
		C->target->bits_in_long = 64;
		C->target->max_int_alignment = 8;
		C->target->bits_in_pointer = 64;
		C->target->pointer_alignment = 8;
		C->target->size_t_ctype = &C->S->ulong_ctype;
		C->target->ssize_t_ctype = &C->S->long_ctype;
#ifdef __x86_64__
		add_pre_buffer(C, "#weak_define __x86_64__ 1\n");
#endif
	}
}

static void handle_arch_msize_long_finalize(struct dmr_C *C)
{
	if (C->arch_msize_long) {
		C->target->size_t_ctype = &C->S->ulong_ctype;
		C->target->ssize_t_ctype = &C->S->long_ctype;
	}
}

static void handle_arch_finalize(struct dmr_C *C)
{
	handle_arch_m64_finalize(C);
	handle_arch_msize_long_finalize(C);
}


static char **handle_switch_o(struct dmr_C *C, char *arg, char **next)
{
	if (!strcmp(arg, "o")) {       // "-o foo"
		if (!*++next)
			die(C, "argument to '-o' is missing");
	}
	// else "-ofoo"

	return next;
}


static char **handle_onoff_switch(struct dmr_C *C, char *arg, char **next, const struct warning warnings[], int n)
{
	int flag = WARNING_ON;
	char *p = arg + 1;
	unsigned i;

	if (!strcmp(p, "sparse-all")) {
		for (i = 0; i < n; i++) {
			if (*warnings[i].flag != WARNING_FORCE_OFF)
				*warnings[i].flag = WARNING_ON;
		}
	}

	// Prefixes "no" and "no-" mean to turn warning off.
	if (p[0] == 'n' && p[1] == 'o') {
		p += 2;
		if (p[0] == '-')
			p++;
		flag = WARNING_FORCE_OFF;
	}

	for (i = 0; i < n; i++) {
		if (!strcmp(p, warnings[i].name)) {
			*warnings[i].flag = flag;
			return next;
		}
	}

	// Unknown.
	return NULL;
}

static char **handle_switch_W(struct dmr_C *C, char *arg, char **next)
{
	char ** ret = handle_onoff_switch(C, arg, next, C->warnings, 24);
	if (ret)
		return ret;

	// Unknown.
	return next;
}

static char **handle_switch_v(struct dmr_C *C, char *arg, char **next)
{
	char ** ret = handle_onoff_switch(C, arg, next, C->debugs, 2);
	if (ret)
		return ret;

	// Unknown.
	do {
		C->verbose++;
	} while (*++arg == 'v');
	return next;
}


static void handle_onoff_switch_finalize(const struct warning warnings[], int n)
{
	unsigned i;

	for (i = 0; i < n; i++) {
		if (*warnings[i].flag == WARNING_FORCE_OFF)
			*warnings[i].flag = WARNING_OFF;
	}
}

static void handle_switch_W_finalize(struct dmr_C *C)
{
	handle_onoff_switch_finalize(C->warnings, 24);

	/* default Wdeclarationafterstatement based on the C dialect */
	if (-1 == C->Wdeclarationafterstatement)
	{
		switch (C->standard)
		{
		case STANDARD_C89:
		case STANDARD_C94:
			C->Wdeclarationafterstatement = 1;
			break;

		case STANDARD_C99:
		case STANDARD_GNU89:
		case STANDARD_GNU99:
			C->Wdeclarationafterstatement = 0;
			break;

		default:
			assert(0);
		}

	}
}

static void handle_switch_v_finalize(struct dmr_C *C)
{
	handle_onoff_switch_finalize(C->debugs, 2);
}

static char **handle_switch_U(struct dmr_C *C, char *arg, char **next)
{
	const char *name = arg + 1;
	add_pre_buffer(C, "#undef %s\n", name);
	return next;
}

static char **handle_switch_O(struct dmr_C *C, char *arg, char **next)
{
	int level = 1;
	if (arg[1] >= '0' && arg[1] <= '9')
		level = arg[1] - '0';
	C->optimize = level;
	C->optimize_size = arg[1] == 's';
	return next;
}

static char **handle_switch_ftabstop(struct dmr_C *C, char *arg, char **next)
{
	char *end;
	unsigned long val;

	if (*arg == '\0')
		die(C, "error: missing argument to \"-ftabstop=\"");

	/* we silently ignore silly values */
	val = strtoul(arg, &end, 10);
	if (*end == '\0' && 1 <= val && val <= 100)
		C->T->tabstop = val;

	return next;
}

static char **handle_switch_f(struct dmr_C *C, char *arg, char **next)
{
	arg++;

	if (!strncmp(arg, "tabstop=", 8))
		return handle_switch_ftabstop(C, arg + 8, next);

	/* handle switches w/ arguments above, boolean and only boolean below */

	if (!strncmp(arg, "no-", 3)) {
		arg += 3;
	}
	/* handle switch here.. */
	return next;
}

static char **handle_switch_G(struct dmr_C *C, char *arg, char **next)
{
	if (!strcmp(arg, "G") && *next)
		return next + 1; // "-G 0"
	else
		return next;     // "-G0" or (bogus) terminal "-G"
}

static char **handle_switch_a(struct dmr_C *C, char *arg, char **next)
{
	if (!strcmp(arg, "ansi"))
		C->standard = STANDARD_C89;

	return next;
}

static char **handle_switch_s(struct dmr_C *C, char *arg, char **next)
{
	if (!strncmp(arg, "std=", 4))
	{
		arg += 4;

		if (!strcmp(arg, "c89") ||
			!strcmp(arg, "iso9899:1990"))
			C->standard = STANDARD_C89;

		else if (!strcmp(arg, "iso9899:199409"))
			C->standard = STANDARD_C94;

		else if (!strcmp(arg, "c99") ||
			!strcmp(arg, "c9x") ||
			!strcmp(arg, "iso9899:1999") ||
			!strcmp(arg, "iso9899:199x"))
			C->standard = STANDARD_C99;

		else if (!strcmp(arg, "gnu89"))
			C->standard = STANDARD_GNU89;

		else if (!strcmp(arg, "gnu99") || !strcmp(arg, "gnu9x"))
			C->standard = STANDARD_GNU99;

		else
			die(C, "Unsupported C dialect");
	}

	return next;
}

static char **handle_nostdinc(struct dmr_C *C, char *arg, char **next)
{
	add_pre_buffer(C, "#nostdinc\n");
	return next;
}

static char **handle_base_dir(struct dmr_C *C, char *arg, char **next)
{
	C->gcc_base_dir = *++next;
	if (!C->gcc_base_dir)
		die(C, "missing argument for -gcc-base-dir option");
	return next;
}

static char **handle_version(struct dmr_C *C, char *arg, char **next)
{
	printf("%s\n", SPARSE_VERSION);
	exit(0);
}

struct switches {
	const char *name;
	char **(*fn)(struct dmr_C *, char *, char **);
};

static char **handle_long_options(struct dmr_C *C, char *arg, char **next)
{
	static struct switches cmd[] = {
		{ "version", handle_version },
		{ NULL, NULL }
	};
	struct switches *s = cmd;

	while (s->name) {
		if (!strcmp(s->name, arg))
			return s->fn(C, arg, next);
		s++;
	}
	return next;

}

static char **handle_switch(struct dmr_C *C, char *arg, char **next)
{
	static struct switches cmd[] = {
		{ "nostdinc", handle_nostdinc },
		{ "gcc-base-dir", handle_base_dir },
		{ NULL, NULL }
	};
	struct switches *s;

	switch (*arg) {
	case 'D': return handle_switch_D(C, arg, next);
	case 'E': return handle_switch_E(C, arg, next);
	case 'I': return handle_switch_I(C, arg, next);
	case 'i': return handle_switch_i(C, arg, next);
	case 'M': return handle_switch_M(C, arg, next);
	case 'm': return handle_switch_m(C, arg, next);
	case 'o': return handle_switch_o(C, arg, next);
	case 'U': return handle_switch_U(C, arg, next);
	case 'v': return handle_switch_v(C, arg, next);
	case 'W': return handle_switch_W(C, arg, next);
	case 'O': return handle_switch_O(C, arg, next);
	case 'f': return handle_switch_f(C, arg, next);
	case 'G': return handle_switch_G(C, arg, next);
	case 'a': return handle_switch_a(C, arg, next);
	case 's': return handle_switch_s(C, arg, next);
	case '-': return handle_long_options(C, arg + 1, next);
	default:
		break;
	}

	s = cmd;
	while (s->name) {
		if (!strcmp(s->name, arg))
			return s->fn(C, arg, next);
		s++;
	}

	/*
	* Ignore unknown command line options:
	* they're probably gcc switches
	*/
	return next;
}

void declare_builtin_functions(struct dmr_C *C)
{
	/* Gaah. gcc knows tons of builtin <string.h> functions */
	add_pre_buffer(C, "extern void *__builtin_memcpy(void *, const void *, __SIZE_TYPE__);\n");
	add_pre_buffer(C, "extern void *__builtin_mempcpy(void *, const void *, __SIZE_TYPE__);\n");
	add_pre_buffer(C, "extern void *__builtin_memset(void *, int, __SIZE_TYPE__);\n");
	add_pre_buffer(C, "extern int __builtin_memcmp(const void *, const void *, __SIZE_TYPE__);\n");
	add_pre_buffer(C, "extern char *__builtin_strcat(char *, const char *);\n");
	add_pre_buffer(C, "extern char *__builtin_strncat(char *, const char *, __SIZE_TYPE__);\n");
	add_pre_buffer(C, "extern int __builtin_strcmp(const char *, const char *);\n");
	add_pre_buffer(C, "extern char *__builtin_strchr(const char *, int);\n");
	add_pre_buffer(C, "extern char *__builtin_strcpy(char *, const char *);\n");
	add_pre_buffer(C, "extern char *__builtin_strncpy(char *, const char *, __SIZE_TYPE__);\n");
	add_pre_buffer(C, "extern __SIZE_TYPE__ __builtin_strspn(const char *, const char *);\n");
	add_pre_buffer(C, "extern __SIZE_TYPE__ __builtin_strcspn(const char *, const char *);\n");
	add_pre_buffer(C, "extern char * __builtin_strpbrk(const char *, const char *);\n");
	add_pre_buffer(C, "extern char* __builtin_stpcpy(const char *, const char*);\n");
	add_pre_buffer(C, "extern __SIZE_TYPE__ __builtin_strlen(const char *);\n");

	/* And bitwise operations.. */
	add_pre_buffer(C, "extern int __builtin_clz(int);\n");
	add_pre_buffer(C, "extern int __builtin_clzl(long);\n");
	add_pre_buffer(C, "extern int __builtin_clzll(long long);\n");
	add_pre_buffer(C, "extern int __builtin_ctz(int);\n");
	add_pre_buffer(C, "extern int __builtin_ctzl(long);\n");
	add_pre_buffer(C, "extern int __builtin_ctzll(long long);\n");
	add_pre_buffer(C, "extern int __builtin_ffs(int);\n");
	add_pre_buffer(C, "extern int __builtin_ffsl(long);\n");
	add_pre_buffer(C, "extern int __builtin_ffsll(long long);\n");
	add_pre_buffer(C, "extern int __builtin_popcount(unsigned int);\n");
	add_pre_buffer(C, "extern int __builtin_popcountl(unsigned long);\n");
	add_pre_buffer(C, "extern int __builtin_popcountll(unsigned long long);\n");

	/* And byte swaps.. */
	add_pre_buffer(C, "extern unsigned short __builtin_bswap16(unsigned short);\n");
	add_pre_buffer(C, "extern unsigned int __builtin_bswap32(unsigned int);\n");
	add_pre_buffer(C, "extern unsigned long long __builtin_bswap64(unsigned long long);\n");

	/* And atomic memory access functions.. */
	add_pre_buffer(C, "extern int __sync_fetch_and_add(void *, ...);\n");
	add_pre_buffer(C, "extern int __sync_fetch_and_sub(void *, ...);\n");
	add_pre_buffer(C, "extern int __sync_fetch_and_or(void *, ...);\n");
	add_pre_buffer(C, "extern int __sync_fetch_and_and(void *, ...);\n");
	add_pre_buffer(C, "extern int __sync_fetch_and_xor(void *, ...);\n");
	add_pre_buffer(C, "extern int __sync_fetch_and_nand(void *, ...);\n");
	add_pre_buffer(C, "extern int __sync_add_and_fetch(void *, ...);\n");
	add_pre_buffer(C, "extern int __sync_sub_and_fetch(void *, ...);\n");
	add_pre_buffer(C, "extern int __sync_or_and_fetch(void *, ...);\n");
	add_pre_buffer(C, "extern int __sync_and_and_fetch(void *, ...);\n");
	add_pre_buffer(C, "extern int __sync_xor_and_fetch(void *, ...);\n");
	add_pre_buffer(C, "extern int __sync_nand_and_fetch(void *, ...);\n");
	add_pre_buffer(C, "extern int __sync_bool_compare_and_swap(void *, ...);\n");
	add_pre_buffer(C, "extern int __sync_val_compare_and_swap(void *, ...);\n");
	add_pre_buffer(C, "extern void __sync_synchronize();\n");
	add_pre_buffer(C, "extern int __sync_lock_test_and_set(void *, ...);\n");
	add_pre_buffer(C, "extern void __sync_lock_release(void *, ...);\n");

	/* And some random ones.. */
	add_pre_buffer(C, "extern void *__builtin_return_address(unsigned int);\n");
	add_pre_buffer(C, "extern void *__builtin_extract_return_addr(void *);\n");
	add_pre_buffer(C, "extern void *__builtin_frame_address(unsigned int);\n");
	add_pre_buffer(C, "extern void __builtin_trap(void);\n");
	add_pre_buffer(C, "extern void *__builtin_alloca(__SIZE_TYPE__);\n");
	add_pre_buffer(C, "extern void __builtin_prefetch (const void *, ...);\n");
	add_pre_buffer(C, "extern long __builtin_alpha_extbl(long, long);\n");
	add_pre_buffer(C, "extern long __builtin_alpha_extwl(long, long);\n");
	add_pre_buffer(C, "extern long __builtin_alpha_insbl(long, long);\n");
	add_pre_buffer(C, "extern long __builtin_alpha_inswl(long, long);\n");
	add_pre_buffer(C, "extern long __builtin_alpha_insql(long, long);\n");
	add_pre_buffer(C, "extern long __builtin_alpha_inslh(long, long);\n");
	add_pre_buffer(C, "extern long __builtin_alpha_cmpbge(long, long);\n");
	add_pre_buffer(C, "extern long __builtin_labs(long);\n");
	add_pre_buffer(C, "extern double __builtin_fabs(double);\n");
	add_pre_buffer(C, "extern __SIZE_TYPE__ __builtin_va_arg_pack_len(void);\n");

	/* Add Blackfin-specific stuff */
	add_pre_buffer(C, 
		"#ifdef __bfin__\n"
		"extern void __builtin_bfin_csync(void);\n"
		"extern void __builtin_bfin_ssync(void);\n"
		"extern int __builtin_bfin_norm_fr1x32(int);\n"
		"#endif\n"
	);

	/* And some floating point stuff.. */
	add_pre_buffer(C, "extern int __builtin_isgreater(float, float);\n");
	add_pre_buffer(C, "extern int __builtin_isgreaterequal(float, float);\n");
	add_pre_buffer(C, "extern int __builtin_isless(float, float);\n");
	add_pre_buffer(C, "extern int __builtin_islessequal(float, float);\n");
	add_pre_buffer(C, "extern int __builtin_islessgreater(float, float);\n");
	add_pre_buffer(C, "extern int __builtin_isunordered(float, float);\n");

	/* And some __FORTIFY_SOURCE ones.. */
	add_pre_buffer(C, "extern __SIZE_TYPE__ __builtin_object_size(void *, int);\n");
	add_pre_buffer(C, "extern void * __builtin___memcpy_chk(void *, const void *, __SIZE_TYPE__, __SIZE_TYPE__);\n");
	add_pre_buffer(C, "extern void * __builtin___memmove_chk(void *, const void *, __SIZE_TYPE__, __SIZE_TYPE__);\n");
	add_pre_buffer(C, "extern void * __builtin___mempcpy_chk(void *, const void *, __SIZE_TYPE__, __SIZE_TYPE__);\n");
	add_pre_buffer(C, "extern void * __builtin___memset_chk(void *, int, __SIZE_TYPE__, __SIZE_TYPE__);\n");
	add_pre_buffer(C, "extern int __builtin___sprintf_chk(char *, int, __SIZE_TYPE__, const char *, ...);\n");
	add_pre_buffer(C, "extern int __builtin___snprintf_chk(char *, __SIZE_TYPE__, int , __SIZE_TYPE__, const char *, ...);\n");
	add_pre_buffer(C, "extern char * __builtin___stpcpy_chk(char *, const char *, __SIZE_TYPE__);\n");
	add_pre_buffer(C, "extern char * __builtin___strcat_chk(char *, const char *, __SIZE_TYPE__);\n");
	add_pre_buffer(C, "extern char * __builtin___strcpy_chk(char *, const char *, __SIZE_TYPE__);\n");
	add_pre_buffer(C, "extern char * __builtin___strncat_chk(char *, const char *, __SIZE_TYPE__, __SIZE_TYPE__);\n");
	add_pre_buffer(C, "extern char * __builtin___strncpy_chk(char *, const char *, __SIZE_TYPE__, __SIZE_TYPE__);\n");
	add_pre_buffer(C, "extern int __builtin___vsprintf_chk(char *, int, __SIZE_TYPE__, const char *, __builtin_va_list);\n");
	add_pre_buffer(C, "extern int __builtin___vsnprintf_chk(char *, __SIZE_TYPE__, int, __SIZE_TYPE__, const char *, __builtin_va_list ap);\n");
	add_pre_buffer(C, "extern void __builtin_unreachable(void);\n");
}

void create_builtin_stream(struct dmr_C *C)
{
	add_pre_buffer(C, "#weak_define __GNUC__ %d\n", gcc_major);
	add_pre_buffer(C, "#weak_define __GNUC_MINOR__ %d\n", gcc_minor);
	add_pre_buffer(C, "#weak_define __GNUC_PATCHLEVEL__ %d\n", gcc_patchlevel);

	/* We add compiler headers path here because we have to parse
	* the arguments to get it, falling back to default. */
	add_pre_buffer(C, "#add_system \"%s/include\"\n", C->gcc_base_dir);
	add_pre_buffer(C, "#add_system \"%s/include-fixed\"\n", C->gcc_base_dir);

	add_pre_buffer(C, "#define __extension__\n");
	add_pre_buffer(C, "#define __pragma__\n");

	// gcc defines __SIZE_TYPE__ to be size_t.  For linux/i86 and
	// solaris/sparc that is really "unsigned int" and for linux/x86_64
	// it is "long unsigned int".  In either case we can probably
	// get away with this.  We need the #weak_define as cgcc will define
	// the right __SIZE_TYPE__.
	if (C->target->size_t_ctype == &C->S->ulong_ctype)
		add_pre_buffer(C, "#weak_define __SIZE_TYPE__ long unsigned int\n");
	else
		add_pre_buffer(C, "#weak_define __SIZE_TYPE__ unsigned int\n");
	add_pre_buffer(C, "#weak_define __STDC__ 1\n");

	switch (C->standard)
	{
	case STANDARD_C89:
		add_pre_buffer(C, "#weak_define __STRICT_ANSI__\n");
		break;

	case STANDARD_C94:
		add_pre_buffer(C, "#weak_define __STDC_VERSION__ 199409L\n");
		add_pre_buffer(C, "#weak_define __STRICT_ANSI__\n");
		break;

	case STANDARD_C99:
		add_pre_buffer(C, "#weak_define __STDC_VERSION__ 199901L\n");
		add_pre_buffer(C, "#weak_define __STRICT_ANSI__\n");
		break;

	case STANDARD_GNU89:
		break;

	case STANDARD_GNU99:
		add_pre_buffer(C, "#weak_define __STDC_VERSION__ 199901L\n");
		break;

	default:
		assert(0);
	}

	add_pre_buffer(C, "#define __builtin_stdarg_start(a,b) ((a) = (__builtin_va_list)(&(b)))\n");
	add_pre_buffer(C, "#define __builtin_va_start(a,b) ((a) = (__builtin_va_list)(&(b)))\n");
	add_pre_buffer(C, "#define __builtin_ms_va_start(a,b) ((a) = (__builtin_ms_va_list)(&(b)))\n");
	add_pre_buffer(C, "#define __builtin_va_arg(arg,type)  ({ type __va_arg_ret = *(type *)(arg); arg += sizeof(type); __va_arg_ret; })\n");
	add_pre_buffer(C, "#define __builtin_va_alist (*(void *)0)\n");
	add_pre_buffer(C, "#define __builtin_va_arg_incr(x) ((x) + 1)\n");
	add_pre_buffer(C, "#define __builtin_va_copy(dest, src) ({ dest = src; (void)0; })\n");
	add_pre_buffer(C, "#define __builtin_va_end(arg)\n");
	add_pre_buffer(C, "#define __builtin_ms_va_end(arg)\n");
	add_pre_buffer(C, "#define __builtin_va_arg_pack()\n");

	/* FIXME! We need to do these as special magic macros at expansion time! */
	add_pre_buffer(C, "#define __BASE_FILE__ \"base_file.c\"\n");

	if (C->optimize)
		add_pre_buffer(C, "#define __OPTIMIZE__ 1\n");
	if (C->optimize_size)
		add_pre_buffer(C, "#define __OPTIMIZE_SIZE__ 1\n");

	/* GCC defines these for limits.h */
	add_pre_buffer(C, "#weak_define __SHRT_MAX__ " STRINGIFY(__SHRT_MAX__) "\n");
	add_pre_buffer(C, "#weak_define __SCHAR_MAX__ " STRINGIFY(__SCHAR_MAX__) "\n");
	add_pre_buffer(C, "#weak_define __INT_MAX__ " STRINGIFY(__INT_MAX__) "\n");
	add_pre_buffer(C, "#weak_define __LONG_MAX__ " STRINGIFY(__LONG_MAX__) "\n");
	add_pre_buffer(C, "#weak_define __LONG_LONG_MAX__ " STRINGIFY(__LONG_LONG_MAX__) "\n");
	add_pre_buffer(C, "#weak_define __WCHAR_MAX__ " STRINGIFY(__WCHAR_MAX__) "\n");
	add_pre_buffer(C, "#weak_define __SIZEOF_POINTER__ " STRINGIFY(__SIZEOF_POINTER__) "\n");
}

static struct ptr_list *sparse_tokenstream(struct dmr_C *C, struct token *token)
{
	// Preprocess the stream
	token = preprocess(C, token);

	if (C->preprocess_only) {
		while (!eof_token(token)) {
			int prec = 1;
			struct token *next = token->next;
			const char *separator = "";
			if (next->pos.whitespace)
				separator = " ";
			if (next->pos.newline) {
				separator = "\n\t\t\t\t\t";
				prec = next->pos.pos;
				if (prec > 4)
					prec = 4;
			}
			printf("%s%.*s", show_token(C, token), prec, separator);
			token = next;
		}
		putchar('\n');

		return NULL;
	}

	// Parse the resulting C code
	while (!eof_token(token))
		token = external_declaration(C, token, &C->S->translation_unit_used_list);
	return C->S->translation_unit_used_list;
}

static struct ptr_list *sparse_file(struct dmr_C *C, const char *filename)
{
	int fd;
	struct token *token;

	if (strcmp(filename, "-") == 0) {
		fd = 0;
	}
	else {
		fd = open(filename, O_RDONLY);
		if (fd < 0)
			die(C, "No such file: %s", filename);
	}

	// Tokenize the input stream
	token = tokenize(C, filename, fd, NULL, C->T->includepath);
	close(fd);

	return sparse_tokenstream(C, token);
}

/*
* This handles the "-include" directive etc: we're in global
* scope, and all types/macros etc will affect all the following
* files.
*
* NOTE NOTE NOTE! "#undef" of anything in this stage will
* affect all subsequent files too, i.e. we can have non-local
* behaviour between files!
*/
static struct ptr_list *sparse_initial(struct dmr_C *C)
{
	int i;

	// Prepend any "include" file to the stream.
	// We're in global scope, it will affect all files!
	for (i = 0; i < C->cmdline_include_nr; i++)
		add_pre_buffer(C, "#argv_include \"%s\"\n", C->cmdline_include[i]);

	return sparse_tokenstream(C, C->pre_buffer_begin);
}

void protect_token_alloc(struct dmr_C *C) {
	/* prevent tokens from being deallocated ? */
	allocator_transfer(&C->token_allocator, &C->protected_token_allocator);
}

void clear_token_alloc(struct dmr_C *C) {
	/* prevent tokens from being deallocated ? */
	allocator_drop_all_allocations(&C->token_allocator);
}

struct ptr_list *sparse_initialize(struct dmr_C *C, int argc, char **argv, struct ptr_list **filelist)
{
	char **args;
	struct ptr_list *list;

	args = argv;
	for (;;) {
		char *arg = *++args;
		if (!arg)
			break;

		if (arg[0] == '-' && arg[1]) {
			args = handle_switch(C, arg + 1, args);
			continue;
		}
		ptrlist_add(filelist, arg);
	}
	handle_switch_W_finalize(C);
	handle_switch_v_finalize(C);

	handle_arch_finalize(C);

	list = NULL;
	if (!ptr_list_empty(filelist)) {

		create_builtin_stream(C);
		add_pre_buffer(C, "#define __CHECKER__ 1\n");
		if (!C->preprocess_only)
			declare_builtin_functions(C);

		list = sparse_initial(C);

		/*
		* Protect the initial token allocations, since
		* they need to survive all the others
		*/
		protect_token_alloc(C);
	}
	return list;
}

struct ptr_list * sparse_keep_tokens(struct dmr_C *C, char *filename)
{
	struct ptr_list *res;

	/* Clear previous symbol list */
	C->S->translation_unit_used_list = NULL;

	new_file_scope(C);
	res = sparse_file(C, filename);

	/* And return it */
	return res;
}


struct ptr_list * __sparse(struct dmr_C *C, char *filename)
{
	struct ptr_list *res;

	res = sparse_keep_tokens(C, filename);

	/* Drop the tokens for this file after parsing */
	clear_token_alloc(C);

	/* And return it */
	return res;
}

struct ptr_list * sparse(struct dmr_C *C, char *filename)
{
	struct ptr_list *res = __sparse(C, filename);

	/* Evaluate the complete symbol list */
	evaluate_symbol_list(C, res);

	return res;
}
