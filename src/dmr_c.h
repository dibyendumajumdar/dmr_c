#ifndef DMR_C_H
#define DMR_C_H

/* This file is derived from lib.h in sparse */

#include <stddef.h>
#include <stdlib.h>
#include <time.h>

/*
* Basic helper routine descriptions for 'sparse'.
*
* Copyright (C) 2003 Transmeta Corp.
*               2003 Linus Torvalds
*               2004 Christopher Li
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

#include <allocate.h>
#include <ptrlist.h>

#define DO_STRINGIFY(x) #x
#define STRINGIFY(x) DO_STRINGIFY(x)

#ifndef ARRAY_SIZE
#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
#endif

#define MAX_STRING 8191

extern unsigned int hexval(unsigned int c);

struct position {
	unsigned int type : 6, stream : 14, newline : 1, whitespace : 1,
	    pos : 10;
	unsigned int line : 31, noexpand : 1;
};

struct ident;
struct token;
struct symbol;
struct statement;
struct expression;
struct basic_block;
struct entrypoint;
struct instruction;
struct multijmp;
struct pseudo;
struct string;
typedef struct pseudo *pseudo_t;

struct target_t;
struct global_symbols_t;
struct tokenizer_state_t;
struct linearizer_state_t;

struct dmr_C {
	struct target_t *target;
	struct global_symbols_t *S;
	struct tokenizer_state_t *T;
	struct parse_state_t *P;
	struct linearizer_state_t *L;

	// memory allocators
	struct allocator token_allocator;
	struct allocator byte_allocator;
	struct allocator string_allocator;
	struct allocator ident_allocator;
	struct allocator scope_allocator;
	struct allocator expression_allocator;
	struct allocator statement_allocator;

	int max_warnings;
	int show_info;
	int errors;
	int die_if_error;
	int once;

	int preprocess_only;

	int Waddress_space;
	int Wbitwise;
	int Wcast_to_as;
	int Wcast_truncate;
	int Wcontext;
	int Wdecl;
	int Wdeclarationafterstatement;
	int Wdefault_bitfield_sign;
	int Wdesignated_init;
	int Wdo_while;
	int Wenum_mismatch;
	int Winit_cstring;
	int Wnon_pointer_null;
	int Wold_initializer;
	int Wone_bit_signed_bitfield;
	int Wparen_string;
	int Wptr_subtraction_blows;
	int Wreturn_void;
	int Wshadow;
	int Wtransparent_union;
	int Wtypesign;
	int Wundef;
	int Wuninitialized;
	int Wvla;

	int dbg_entry;
	int dbg_dead;

	int arch_m64;

	/* TODO is this the right place? */
	struct scope *block_scope, *function_scope, *file_scope, *global_scope;
	struct scope *builtin_scope;

	/* Current parsing/evaluation function */
	struct symbol *current_fn;

	char modifier_string_buffer[100];
	char typename_array[200];

	int false_nesting;

#define INCLUDEPATHS 300
	const char *includepath[INCLUDEPATHS + 1];

	const char **quote_includepath;
	const char **angle_includepath;
	const char **isys_includepath;
	const char **sys_includepath;
	const char **dirafter_includepath;

	char date_buffer[12]; /* __DATE__: 3 + ' ' + 2 + ' ' + 4 + '\0' */
	char preprocessor_buffer[MAX_STRING];
	char preprocessor_mergebuffer[512];
	char preprocessor_tokenseqbuffer[256];
	int preprocessing;
	time_t t;
	char fullname[1024];
};

extern struct dmr_C *new_dmr_C();
extern void destroy_dmr_C(struct dmr_C *C);

struct token *skip_to(struct token *, int);
struct token *expect(struct dmr_C *C, struct token *token, int op, const char *where);

extern void die(const char *, ...) FORMAT_ATTR(1) NORETURN_ATTR;
extern void info(struct dmr_C *, struct position, const char *, ...)
    FORMAT_ATTR(3);
extern void warning(struct dmr_C *, struct position, const char *, ...)
    FORMAT_ATTR(3);
extern void sparse_error(struct dmr_C *, struct position, const char *, ...)
    FORMAT_ATTR(3);
extern void error_die(struct dmr_C *, struct position, const char *, ...)
    FORMAT_ATTR(3) NORETURN_ATTR;
extern void expression_error(struct dmr_C *, struct expression *, const char *,
			     ...) FORMAT_ATTR(3);

extern void add_pre_buffer(struct dmr_C *, const char *fmt, ...) FORMAT_ATTR(2);

#endif
