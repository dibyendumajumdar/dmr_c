/*
 * Stupid C parser, version 1e-6.
 *
 * Let's see how hard this is to do.
 *
 * Copyright (C) 2003 Transmeta Corp.
 *               2003-2004 Linus Torvalds
 * Copyright (C) 2004 Christopher Li
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

#include <stdarg.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <fcntl.h>
#include <limits.h>

#include <port.h>
#include <dmr_c.h>
#include <allocate.h>
#include <token.h>
#include <parse.h>
#include <symbol.h>
#include <scope.h>
#include <expression.h>
#include <target.h>

static struct token *statement(struct dmr_C *C, struct token *token, struct statement **tree);
static struct token *handle_attributes(struct dmr_C *C, struct token *token, struct decl_state *ctx, unsigned int keywords);
struct token *compound_statement(struct dmr_C *C, struct token *token, struct statement *stmt);
struct token *initializer(struct dmr_C *C, struct expression **tree, struct token *token);

typedef struct token *declarator_t(struct dmr_C *C, struct token *, struct decl_state *);
static declarator_t
	struct_specifier, union_specifier, enum_specifier,
	attribute_specifier, typeof_specifier, parse_asm_declarator,
	typedef_specifier, inline_specifier, auto_specifier,
	register_specifier, static_specifier, extern_specifier,
	thread_specifier, const_qualifier, volatile_qualifier;

static struct token *parse_if_statement(struct dmr_C *C, struct token *token, struct statement *stmt);
static struct token *parse_return_statement(struct dmr_C *C, struct token *token, struct statement *stmt);
static struct token *parse_loop_iterator(struct dmr_C *C, struct token *token, struct statement *stmt);
static struct token *parse_default_statement(struct dmr_C *C, struct token *token, struct statement *stmt);
static struct token *parse_case_statement(struct dmr_C *C, struct token *token, struct statement *stmt);
static struct token *parse_switch_statement(struct dmr_C *C, struct token *token, struct statement *stmt);
static struct token *parse_for_statement(struct dmr_C *C, struct token *token, struct statement *stmt);
static struct token *parse_while_statement(struct dmr_C *C, struct token *token, struct statement *stmt);
static struct token *parse_do_statement(struct dmr_C *C, struct token *token, struct statement *stmt);
static struct token *parse_goto_statement(struct dmr_C *C, struct token *token, struct statement *stmt);
static struct token *parse_context_statement(struct dmr_C *C, struct token *token, struct statement *stmt);
static struct token *parse_range_statement(struct dmr_C *C, struct token *token, struct statement *stmt);
static struct token *parse_asm_statement(struct dmr_C *C, struct token *token, struct statement *stmt);
static struct token *toplevel_asm_declaration(struct dmr_C *C, struct token *token, struct ptr_list **list);

static struct token *parameter_type_list(struct dmr_C *C, struct token *, struct symbol *);
static struct token *identifier_list(struct dmr_C *C, struct token *, struct symbol *);
static struct token *declarator(struct dmr_C *C, struct token *token, struct decl_state *ctx);

typedef struct token *attr_t(struct dmr_C *C, struct token *, struct symbol *,
			     struct decl_state *);

static attr_t
	attribute_packed, attribute_aligned, attribute_modifier,
	attribute_address_space, attribute_context,
	attribute_designated_init,
	attribute_transparent_union, ignore_attribute,
	attribute_mode, attribute_force;

typedef struct symbol *to_mode_t(struct dmr_C *C, struct symbol *);

static to_mode_t
	to_QI_mode, to_HI_mode, to_SI_mode, to_DI_mode, to_TI_mode, to_word_mode;

enum {
	Set_T = 1,
	Set_S = 2,
	Set_Char = 4,
	Set_Int = 8,
	Set_Double = 16,
	Set_Float = 32,
	Set_Signed = 64,
	Set_Unsigned = 128,
	Set_Short = 256,
	Set_Long = 512,
	Set_Vlong = 1024,
	Set_Any = Set_T | Set_Short | Set_Long | Set_Signed | Set_Unsigned
};

enum {
	CInt = 0, CSInt, CUInt, CReal, CChar, CSChar, CUChar
};

enum {
	SNone = 0, STypedef, SAuto, SRegister, SExtern, SStatic, SForced
};

static struct symbol_op typedef_op = {
	.type = KW_MODIFIER,
	.declarator = typedef_specifier,
};

static struct symbol_op inline_op = {
	.type = KW_MODIFIER,
	.declarator = inline_specifier,
};

static struct symbol_op auto_op = {
	.type = KW_MODIFIER,
	.declarator = auto_specifier,
};

static struct symbol_op register_op = {
	.type = KW_MODIFIER,
	.declarator = register_specifier,
};

static struct symbol_op static_op = {
	.type = KW_MODIFIER,
	.declarator = static_specifier,
};

static struct symbol_op extern_op = {
	.type = KW_MODIFIER,
	.declarator = extern_specifier,
};

static struct symbol_op thread_op = {
	.type = KW_MODIFIER,
	.declarator = thread_specifier,
};

static struct symbol_op const_op = {
	.type = KW_QUALIFIER,
	.declarator = const_qualifier,
};

static struct symbol_op volatile_op = {
	.type = KW_QUALIFIER,
	.declarator = volatile_qualifier,
};

static struct symbol_op restrict_op = {
	.type = KW_QUALIFIER,
};

static struct symbol_op typeof_op = {
	.type = KW_SPECIFIER,
	.declarator = typeof_specifier,
	.test = Set_Any,
	.set = Set_S|Set_T,
};

static struct symbol_op attribute_op = {
	.type = KW_ATTRIBUTE,
	.declarator = attribute_specifier,
};

static struct symbol_op struct_op = {
	.type = KW_SPECIFIER,
	.declarator = struct_specifier,
	.test = Set_Any,
	.set = Set_S|Set_T,
};

static struct symbol_op union_op = {
	.type = KW_SPECIFIER,
	.declarator = union_specifier,
	.test = Set_Any,
	.set = Set_S|Set_T,
};

static struct symbol_op enum_op = {
	.type = KW_SPECIFIER,
	.declarator = enum_specifier,
	.test = Set_Any,
	.set = Set_S|Set_T,
};

static struct symbol_op spec_op = {
	.type = KW_SPECIFIER | KW_EXACT,
	.test = Set_Any,
	.set = Set_S|Set_T,
};

static struct symbol_op char_op = {
	.type = KW_SPECIFIER,
	.test = Set_T|Set_Long|Set_Short,
	.set = Set_T|Set_Char,
	.cls = CChar,
};

static struct symbol_op int_op = {
	.type = KW_SPECIFIER,
	.test = Set_T,
	.set = Set_T|Set_Int,
};

static struct symbol_op double_op = {
	.type = KW_SPECIFIER,
	.test = Set_T|Set_Signed|Set_Unsigned|Set_Short|Set_Vlong,
	.set = Set_T|Set_Double,
	.cls = CReal,
};

static struct symbol_op float_op = {
	.type = KW_SPECIFIER | KW_SHORT,
	.test = Set_T|Set_Signed|Set_Unsigned|Set_Short|Set_Long,
	.set = Set_T|Set_Float,
	.cls = CReal,
};

static struct symbol_op short_op = {
	.type = KW_SPECIFIER | KW_SHORT,
	.test = Set_S|Set_Char|Set_Float|Set_Double|Set_Long|Set_Short,
	.set = Set_Short,
};

static struct symbol_op signed_op = {
	.type = KW_SPECIFIER,
	.test = Set_S|Set_Float|Set_Double|Set_Signed|Set_Unsigned,
	.set = Set_Signed,
	.cls = CSInt,
};

static struct symbol_op unsigned_op = {
	.type = KW_SPECIFIER,
	.test = Set_S|Set_Float|Set_Double|Set_Signed|Set_Unsigned,
	.set = Set_Unsigned,
	.cls = CUInt,
};

static struct symbol_op long_op = {
	.type = KW_SPECIFIER | KW_LONG,
	.test = Set_S|Set_Char|Set_Float|Set_Short|Set_Vlong,
	.set = Set_Long,
};

static struct symbol_op if_op = {
	.statement = parse_if_statement,
};

static struct symbol_op return_op = {
	.statement = parse_return_statement,
};

static struct symbol_op loop_iter_op = {
	.statement = parse_loop_iterator,
};

static struct symbol_op default_op = {
	.statement = parse_default_statement,
};

static struct symbol_op case_op = {
	.statement = parse_case_statement,
};

static struct symbol_op switch_op = {
	.statement = parse_switch_statement,
};

static struct symbol_op for_op = {
	.statement = parse_for_statement,
};

static struct symbol_op while_op = {
	.statement = parse_while_statement,
};

static struct symbol_op do_op = {
	.statement = parse_do_statement,
};

static struct symbol_op goto_op = {
	.statement = parse_goto_statement,
};

static struct symbol_op __context___op = {
	.statement = parse_context_statement,
};

static struct symbol_op range_op = {
	.statement = parse_range_statement,
};

static struct symbol_op asm_op = {
	.type = KW_ASM,
	.declarator = parse_asm_declarator,
	.statement = parse_asm_statement,
	.toplevel = toplevel_asm_declaration,
};

static struct symbol_op packed_op = {
	.attribute = attribute_packed,
};

static struct symbol_op aligned_op = {
	.attribute = attribute_aligned,
};

static struct symbol_op attr_mod_op = {
	.attribute = attribute_modifier,
};

static struct symbol_op attr_force_op = {
	.attribute = attribute_force,
};

static struct symbol_op address_space_op = {
	.attribute = attribute_address_space,
};

static struct symbol_op mode_op = {
	.attribute = attribute_mode,
};

static struct symbol_op context_op = {
	.attribute = attribute_context,
};

static struct symbol_op designated_init_op = {
	.attribute = attribute_designated_init,
};

static struct symbol_op transparent_union_op = {
	.attribute = attribute_transparent_union,
};

static struct symbol_op ignore_attr_op = {
	.attribute = ignore_attribute,
};

static struct symbol_op mode_QI_op = {
	.type = KW_MODE,
	.to_mode = to_QI_mode
};

static struct symbol_op mode_HI_op = {
	.type = KW_MODE,
	.to_mode = to_HI_mode
};

static struct symbol_op mode_SI_op = {
	.type = KW_MODE,
	.to_mode = to_SI_mode
};

static struct symbol_op mode_DI_op = {
	.type = KW_MODE,
	.to_mode = to_DI_mode
};

static struct symbol_op mode_TI_op = {
	.type = KW_MODE,
	.to_mode = to_TI_mode
};

static struct symbol_op mode_word_op = {
	.type = KW_MODE,
	.to_mode = to_word_mode
};


const char *ignored_attributes[] = {
	"alias",
	"__alias__",
	"alloc_size",
	"__alloc_size__",
	"always_inline",
	"__always_inline__",
	"artificial",
	"__artificial__",
	"bounded",
	"__bounded__",
	"cdecl",
	"__cdecl__",
	"cold",
	"__cold__",
	"constructor",
	"__constructor__",
	"deprecated",
	"__deprecated__",
	"destructor",
	"__destructor__",
	"dllexport",
	"__dllexport__",
	"dllimport",
	"__dllimport__",
	"error",
	"__error__",
	"externally_visible",
	"__externally_visible__",
	"fastcall",
	"__fastcall__",
	"format",
	"__format__",
	"format_arg",
	"__format_arg__",
	"hot",
	"__hot__",
        "leaf",
        "__leaf__",
	"l1_text",
	"__l1_text__",
	"l1_data",
	"__l1_data__",
	"l2",
	"__l2__",
	"may_alias",
	"__may_alias__",
	"malloc",
	"__malloc__",
	"may_alias",
	"__may_alias__",
	"model",
	"__model__",
	"ms_abi",
	"__ms_abi__",
	"ms_hook_prologue",
	"__ms_hook_prologue__",
	"naked",
	"__naked__",
	"no_instrument_function",
	"__no_instrument_function__",
	"noclone",
	"__noclone",
	"__noclone__",
	"noinline",
	"__noinline__",
	"nonnull",
	"__nonnull",
	"__nonnull__",
	"nothrow",
	"__nothrow",
	"__nothrow__",
	"regparm",
	"__regparm__",
	"section",
	"__section__",
	"sentinel",
	"__sentinel__",
	"signal",
	"__signal__",
	"stdcall",
	"__stdcall__",
	"syscall_linkage",
	"__syscall_linkage__",
	"sysv_abi",
	"__sysv_abi__",
	"unused",
	"__unused__",
	"used",
	"__used__",
	"vector_size",
	"__vector_size__",
	"visibility",
	"__visibility__",
	"warn_unused_result",
	"__warn_unused_result__",
	"warning",
	"__warning__",
	"weak",
	"__weak__",
};


void init_parser(struct dmr_C *C, int stream)
{
	struct init_keyword {
		const char *name;
		enum namespace_type ns;
		unsigned long modifiers;
		struct symbol_op *op;
		struct symbol *type;
	} keyword_table[] = {
		/* Type qualifiers */
		{ "const",	NS_TYPEDEF,.op = &const_op },
		{ "__const",	NS_TYPEDEF,.op = &const_op },
		{ "__const__",	NS_TYPEDEF,.op = &const_op },
		{ "volatile",	NS_TYPEDEF,.op = &volatile_op },
		{ "__volatile",		NS_TYPEDEF,.op = &volatile_op },
		{ "__volatile__", 	NS_TYPEDEF,.op = &volatile_op },

		/* Typedef.. */
		{ "typedef",	NS_TYPEDEF,.op = &typedef_op },

		/* Type specifiers */
		{ "void",	NS_TYPEDEF,.type = &C->S->void_ctype,.op = &spec_op },
		{ "char",	NS_TYPEDEF,.op = &char_op },
		{ "short",	NS_TYPEDEF,.op = &short_op },
		{ "int",	NS_TYPEDEF,.op = &int_op },
		{ "long",	NS_TYPEDEF,.op = &long_op },
		{ "float",	NS_TYPEDEF,.op = &float_op },
		{ "double",	NS_TYPEDEF,.op = &double_op },
		{ "signed",	NS_TYPEDEF,.op = &signed_op },
		{ "__signed",	NS_TYPEDEF,.op = &signed_op },
		{ "__signed__",	NS_TYPEDEF,.op = &signed_op },
		{ "unsigned",	NS_TYPEDEF,.op = &unsigned_op },
		{ "_Bool",	NS_TYPEDEF,.type = &C->S->bool_ctype,.op = &spec_op },

		/* Predeclared types */
		{ "__builtin_va_list", NS_TYPEDEF,.type = &C->S->ptr_ctype,.op = &spec_op },
		{ "__builtin_ms_va_list", NS_TYPEDEF,.type = &C->S->ptr_ctype,.op = &spec_op },
		{ "__int128_t",	NS_TYPEDEF,.type = &C->S->lllong_ctype,.op = &spec_op },
		{ "__uint128_t",NS_TYPEDEF,.type = &C->S->ulllong_ctype,.op = &spec_op },

		/* Extended types */
		{ "typeof", 	NS_TYPEDEF,.op = &typeof_op },
		{ "__typeof", 	NS_TYPEDEF,.op = &typeof_op },
		{ "__typeof__",	NS_TYPEDEF,.op = &typeof_op },

		{ "__attribute",   NS_TYPEDEF,.op = &attribute_op },
		{ "__attribute__", NS_TYPEDEF,.op = &attribute_op },

		{ "struct",	NS_TYPEDEF,.op = &struct_op },
		{ "union", 	NS_TYPEDEF,.op = &union_op },
		{ "enum", 	NS_TYPEDEF,.op = &enum_op },

		{ "inline",	NS_TYPEDEF,.op = &inline_op },
		{ "__inline",	NS_TYPEDEF,.op = &inline_op },
		{ "__inline__",	NS_TYPEDEF,.op = &inline_op },

		/* Ignored for now.. */
		{ "restrict",	NS_TYPEDEF,.op = &restrict_op },
		{ "__restrict",	NS_TYPEDEF,.op = &restrict_op },

		/* Storage class */
		{ "auto",	NS_TYPEDEF,.op = &auto_op },
		{ "register",	NS_TYPEDEF,.op = &register_op },
		{ "static",	NS_TYPEDEF,.op = &static_op },
		{ "extern",	NS_TYPEDEF,.op = &extern_op },
		{ "__thread",	NS_TYPEDEF,.op = &thread_op },

		/* Statement */
		{ "if",		NS_KEYWORD,.op = &if_op },
		{ "return",	NS_KEYWORD,.op = &return_op },
		{ "break",	NS_KEYWORD,.op = &loop_iter_op },
		{ "continue",	NS_KEYWORD,.op = &loop_iter_op },
		{ "default",	NS_KEYWORD,.op = &default_op },
		{ "case",	NS_KEYWORD,.op = &case_op },
		{ "switch",	NS_KEYWORD,.op = &switch_op },
		{ "for",	NS_KEYWORD,.op = &for_op },
		{ "while",	NS_KEYWORD,.op = &while_op },
		{ "do",		NS_KEYWORD,.op = &do_op },
		{ "goto",	NS_KEYWORD,.op = &goto_op },
		{ "__context__",NS_KEYWORD,.op = &__context___op },
		{ "__range__",	NS_KEYWORD,.op = &range_op },
		{ "asm",	NS_KEYWORD,.op = &asm_op },
		{ "__asm",	NS_KEYWORD,.op = &asm_op },
		{ "__asm__",	NS_KEYWORD,.op = &asm_op },

		/* Attribute */
		{ "packed",	NS_KEYWORD,.op = &packed_op },
		{ "__packed__",	NS_KEYWORD,.op = &packed_op },
		{ "aligned",	NS_KEYWORD,.op = &aligned_op },
		{ "__aligned__",NS_KEYWORD,.op = &aligned_op },
		{ "nocast",	NS_KEYWORD,	MOD_NOCAST,.op = &attr_mod_op },
		{ "noderef",	NS_KEYWORD,	MOD_NODEREF,.op = &attr_mod_op },
		{ "safe",	NS_KEYWORD,	MOD_SAFE,.op = &attr_mod_op },
		{ "force",	NS_KEYWORD,.op = &attr_force_op },
		{ "bitwise",	NS_KEYWORD,	MOD_BITWISE,.op = &attr_mod_op },
		{ "__bitwise__",NS_KEYWORD,	MOD_BITWISE,.op = &attr_mod_op },
		{ "address_space",NS_KEYWORD,.op = &address_space_op },
		{ "mode",	NS_KEYWORD,.op = &mode_op },
		{ "context",	NS_KEYWORD,.op = &context_op },
		{ "designated_init",	NS_KEYWORD,.op = &designated_init_op },
		{ "__transparent_union__",	NS_KEYWORD,.op = &transparent_union_op },
		{ "noreturn",	NS_KEYWORD,	MOD_NORETURN,.op = &attr_mod_op },
		{ "__noreturn__",	NS_KEYWORD,	MOD_NORETURN,.op = &attr_mod_op },
		{ "pure",	NS_KEYWORD,	MOD_PURE,.op = &attr_mod_op },
		{ "__pure__",	NS_KEYWORD,	MOD_PURE,.op = &attr_mod_op },
		{ "const",	NS_KEYWORD,	MOD_PURE,.op = &attr_mod_op },
		{ "__const",	NS_KEYWORD,	MOD_PURE,.op = &attr_mod_op },
		{ "__const__",	NS_KEYWORD,	MOD_PURE,.op = &attr_mod_op },

		{ "__mode__",	NS_KEYWORD,.op = &mode_op },
		{ "QI",		NS_KEYWORD,	MOD_CHAR,.op = &mode_QI_op },
		{ "__QI__",	NS_KEYWORD,	MOD_CHAR,.op = &mode_QI_op },
		{ "HI",		NS_KEYWORD,	MOD_SHORT,.op = &mode_HI_op },
		{ "__HI__",	NS_KEYWORD,	MOD_SHORT,.op = &mode_HI_op },
		{ "SI",		NS_KEYWORD,.op = &mode_SI_op },
		{ "__SI__",	NS_KEYWORD,.op = &mode_SI_op },
		{ "DI",		NS_KEYWORD,	MOD_LONGLONG,.op = &mode_DI_op },
		{ "__DI__",	NS_KEYWORD,	MOD_LONGLONG,.op = &mode_DI_op },
		{ "TI",		NS_KEYWORD,	MOD_LONGLONGLONG,.op = &mode_TI_op },
		{ "__TI__",	NS_KEYWORD,	MOD_LONGLONGLONG,.op = &mode_TI_op },
		{ "word",	NS_KEYWORD,	MOD_LONG,.op = &mode_word_op },
		{ "__word__",	NS_KEYWORD,	MOD_LONG,.op = &mode_word_op },
	};

	C->P = (struct parse_state_t *) calloc(1, sizeof(struct parse_state_t));

	int i;
	for (i = 0; i < ARRAY_SIZE(keyword_table); i++) {
		struct init_keyword *ptr = keyword_table + i;
		struct symbol *sym = create_symbol(C->S, stream, ptr->name, SYM_KEYWORD, ptr->ns);
		sym->ident->keyword = 1;
		if (ptr->ns == NS_TYPEDEF)
			sym->ident->reserved = 1;
		sym->ctype.modifiers = ptr->modifiers;
		sym->ctype.base_type = ptr->type;
		sym->op = ptr->op;
	}

	for (i = 0; i < ARRAY_SIZE(ignored_attributes); i++) {
		const char * name = ignored_attributes[i];
		struct symbol *sym = create_symbol(C->S, stream, name, SYM_KEYWORD,
						   NS_KEYWORD);
		sym->ident->keyword = 1;
		sym->op = &ignore_attr_op;
	}

	C->P->int_types[0] = &C->S->short_ctype;
	C->P->int_types[1] = &C->S->int_ctype;
	C->P->int_types[2] = &C->S->long_ctype;
	C->P->int_types[3] = &C->S->llong_ctype;
	C->P->signed_types[0] = &C->S->sshort_ctype;
	C->P->signed_types[1] = &C->S->sint_ctype;
	C->P->signed_types[2] = &C->S->slong_ctype;
	C->P->signed_types[3] = &C->S->sllong_ctype;
	C->P->signed_types[4] = &C->S->slllong_ctype;
	C->P->unsigned_types[0] = &C->S->ushort_ctype;
	C->P->unsigned_types[1] = &C->S->uint_ctype;
	C->P->unsigned_types[2] = &C->S->ulong_ctype;
	C->P->unsigned_types[3] = &C->S->ullong_ctype;
	C->P->unsigned_types[4] = &C->S->ulllong_ctype;
	C->P->real_types[0] = &C->S->float_ctype;
	C->P->real_types[1] = &C->S->double_ctype;
	C->P->real_types[2] = &C->S->ldouble_ctype;
	C->P->char_types[0] = &C->S->char_ctype;
	C->P->char_types[1] = &C->S->schar_ctype;
	C->P->char_types[2] = &C->S->uchar_ctype;
	C->P->types[0] = C->P->int_types + 1;
	C->P->types[1] = C->P->signed_types + 1;
	C->P->types[2] = C->P->unsigned_types + 1;
	C->P->types[3] = C->P->real_types + 1;
	C->P->types[4] = C->P->char_types;
	C->P->types[5] = C->P->char_types + 1;
	C->P->types[6] = C->P->char_types + 2;
}

void destroy_parser(struct dmr_C *C) {
	free(C->P);
	C->P = NULL;
}


// Add a symbol to the list of function-local symbols
static void fn_local_symbol(struct dmr_C *C, struct symbol *sym)
{
	if (C->P->function_symbol_list)
		ptrlist_add(C->P->function_symbol_list, sym);
}

static int SENTINEL_ATTR match_idents(struct dmr_C *C, struct token *token, ...)
{
	va_list args;
	struct ident * next;

	if (token_type(token) != TOKEN_IDENT)
		return 0;

	va_start(args, token);
	do {
		next = va_arg(args, struct ident *);
	} while (next && token->ident != next);
	va_end(args);

	return next && token->ident == next;
}


struct statement *alloc_statement(struct dmr_C *C, struct position pos, int type)
{
	struct statement *stmt = (struct statement *)allocator_allocate(&C->statement_allocator, 0);
	stmt->type = type;
	stmt->pos = pos;
	return stmt;
}

static struct token *struct_declaration_list(struct dmr_C *C, struct token *token, struct ptr_list **list);

static void apply_modifiers(struct dmr_C *C, struct position pos, struct decl_state *ctx)
{
	struct symbol *ctype;
	if (!ctx->mode)
		return;
	ctype = ctx->mode->to_mode(C, ctx->ctype.base_type);
	if (!ctype)
		sparse_error(C, pos, "don't know how to apply mode to %s",
				show_typename(C, ctx->ctype.base_type));
	else
		ctx->ctype.base_type = ctype;
	
}

static struct symbol * alloc_indirect_symbol(struct dmr_C *C, struct position pos, struct ctype *ctype, int type)
{
	struct symbol *sym = alloc_symbol(C->S, pos, type);

	sym->ctype.base_type = ctype->base_type;
	sym->ctype.modifiers = ctype->modifiers;

	ctype->base_type = sym;
	ctype->modifiers = 0;
	return sym;
}

/*
 * NOTE! NS_LABEL is not just a different namespace,
 * it also ends up using function scope instead of the
 * regular symbol scope.
 */
struct symbol *label_symbol(struct dmr_C *C, struct token *token)
{
	struct symbol *sym = lookup_symbol(token->ident, NS_LABEL);
	if (!sym) {
		sym = alloc_symbol(C->S, token->pos, SYM_LABEL);
		bind_symbol(C->S, sym, token->ident, NS_LABEL);
		fn_local_symbol(C, sym);
	}
	return sym;
}

static struct token *struct_union_enum_specifier(struct dmr_C *C, enum type type,
	struct token *token, struct decl_state *ctx,
	struct token *(*parse)(struct dmr_C *C, struct token *, struct symbol *))
{
	struct symbol *sym;
	struct position *repos;

	token = handle_attributes(C, token, ctx, KW_ATTRIBUTE);
	if (token_type(token) == TOKEN_IDENT) {
		sym = lookup_symbol(token->ident, NS_STRUCT);
		if (!sym ||
		    (is_outer_scope(C, sym->scope) &&
		     (match_op(token->next,';') || match_op(token->next,'{')))) {
			// Either a new symbol, or else an out-of-scope
			// symbol being redefined.
			sym = alloc_symbol(C->S, token->pos, type);
			bind_symbol(C->S, sym, token->ident, NS_STRUCT);
		}
		if (sym->type != type)
			error_die(C, token->pos, "invalid tag applied to %s", show_typename (C, sym));
		ctx->ctype.base_type = sym;
		repos = &token->pos;
		token = token->next;
		if (match_op(token, '{')) {
			// The following test is actually wrong for empty
			// structs, but (1) they are not C99, (2) gcc does
			// the same thing, and (3) it's easier.
			if (sym->symbol_list)
				error_die(C, token->pos, "redefinition of %s", show_typename (C, sym));
			sym->pos = *repos;
			token = parse(C, token->next, sym);
			token = expect(C, token, '}', "at end of struct-union-enum-specifier");

			// Mark the structure as needing re-examination
			sym->examined = 0;
			sym->endpos = token->pos;
		}
		return token;
	}

	// private struct/union/enum type
	if (!match_op(token, '{')) {
		sparse_error(C, token->pos, "expected declaration");
		ctx->ctype.base_type = &C->S->bad_ctype;
		return token;
	}

	sym = alloc_symbol(C->S, token->pos, type);
	token = parse(C, token->next, sym);
	ctx->ctype.base_type = sym;
	token =  expect(C, token, '}', "at end of specifier");
	sym->endpos = token->pos;

	return token;
}

static struct token *parse_struct_declaration(struct dmr_C *C, struct token *token, struct symbol *sym)
{
	struct symbol *field, *last = NULL;
	struct token *res;
	res = struct_declaration_list(C, token, &sym->symbol_list);
	FOR_EACH_PTR(sym->symbol_list, field) {
		if (!field->ident) {
			struct symbol *base = field->ctype.base_type;
			if (base && base->type == SYM_BITFIELD)
				continue;
		}
		if (last)
			last->next_subobject = field;
		last = field;
	} END_FOR_EACH_PTR(field);
	return res;
}

static struct token *parse_union_declaration(struct dmr_C *C, struct token *token, struct symbol *sym)
{
	return struct_declaration_list(C, token, &sym->symbol_list);
}

static struct token *struct_specifier(struct dmr_C *C, struct token *token, struct decl_state *ctx)
{
	return struct_union_enum_specifier(C, SYM_STRUCT, token, ctx, parse_struct_declaration);
}

static struct token *union_specifier(struct dmr_C *C, struct token *token, struct decl_state *ctx)
{
	return struct_union_enum_specifier(C, SYM_UNION, token, ctx, parse_union_declaration);
}


typedef struct {
	int x;
	unsigned long long y;
} Num;

static void upper_boundary(Num *n, Num *v)
{
	if (n->x > v->x)
		return;
	if (n->x < v->x) {
		*n = *v;
		return;
	}
	if (n->y < v->y)
		n->y = v->y;
}

static void lower_boundary(Num *n, Num *v)
{
	if (n->x < v->x)
		return;
	if (n->x > v->x) {
		*n = *v;
		return;
	}
	if (n->y > v->y)
		n->y = v->y;
}

static int type_is_ok(struct dmr_C *C, struct symbol *type, Num *upper, Num *lower)
{
	int shift = type->bit_size;
	int is_unsigned = type->ctype.modifiers & MOD_UNSIGNED;

	if (!is_unsigned)
		shift--;
	if (upper->x == 0 && upper->y >> shift)
		return 0;
	if (lower->x == 0 || (!is_unsigned && (~lower->y >> shift) == 0))
		return 1;
	return 0;
}

static struct symbol *bigger_enum_type(struct dmr_C *C, struct symbol *s1, struct symbol *s2)
{
	if (s1->bit_size < s2->bit_size) {
		s1 = s2;
	} else if (s1->bit_size == s2->bit_size) {
		if (s2->ctype.modifiers & MOD_UNSIGNED)
			s1 = s2;
	}
	if (s1->bit_size < C->target->bits_in_int)
		return &C->S->int_ctype;
	return s1;
}

static void cast_enum_list(struct dmr_C *C, struct ptr_list *list, struct symbol *base_type)
{
	struct symbol *sym;

	FOR_EACH_PTR(list, sym) {
		struct expression *expr = sym->initializer;
		struct symbol *ctype;
		if (expr->type != EXPR_VALUE)
			continue;
		ctype = expr->ctype;
		if (ctype->bit_size == base_type->bit_size)
			continue;
		cast_value(C, expr, base_type, expr, ctype);
	} END_FOR_EACH_PTR(sym);
}

static struct token *parse_enum_declaration(struct dmr_C *C, struct token *token, struct symbol *parent)
{
	unsigned long long lastval = 0;
	struct symbol *ctype = NULL, *base_type = NULL;
	Num upper = {-1, 0}, lower = {1, 0};

	parent->examined = 1;
	parent->ctype.base_type = &C->S->int_ctype;
	while (token_type(token) == TOKEN_IDENT) {
		struct expression *expr = NULL;
		struct token *next = token->next;
		struct symbol *sym;

		if (match_op(next, '=')) {
			next = constant_expression(C, next->next, &expr);
			lastval = get_expression_value(C, expr);
			ctype = &C->S->void_ctype;
			if (expr && expr->ctype)
				ctype = expr->ctype;
		} else if (!ctype) {
			ctype = &C->S->int_ctype;
		} else if (is_int_type(C->S, ctype)) {
			lastval++;
		} else {
			error_die(C, token->pos, "can't increment the last enum member");
		}

		if (!expr) {
			expr = alloc_expression(C, token->pos, EXPR_VALUE);
			expr->value = lastval;
			expr->ctype = ctype;
		}

		sym = alloc_symbol(C->S, token->pos, SYM_NODE);
		bind_symbol(C->S, sym, token->ident, NS_SYMBOL);
		sym->ctype.modifiers &= ~MOD_ADDRESSABLE;
		sym->initializer = expr;
		sym->enum_member = 1;
		sym->ctype.base_type = parent;
		ptrlist_add(&parent->symbol_list, sym);

		if (base_type != &C->S->bad_ctype) {
			if (ctype->type == SYM_NODE)
				ctype = ctype->ctype.base_type;
			if (ctype->type == SYM_ENUM) {
				if (ctype == parent)
					ctype = base_type;
				else 
					ctype = ctype->ctype.base_type;
			}
			/*
			 * base_type rules:
			 *  - if all enums are of the same type, then
			 *    the base_type is that type (two first
			 *    cases)
			 *  - if enums are of different types, they
			 *    all have to be integer types, and the
			 *    base type is at least "int_ctype".
			 *  - otherwise the base_type is "bad_ctype".
			 */
			if (!base_type) {
				base_type = ctype;
			} else if (ctype == base_type) {
				/* nothing */
			} else if (is_int_type(C->S, base_type) && is_int_type(C->S, ctype)) {
				base_type = bigger_enum_type(C, base_type, ctype);
			} else
				base_type = &C->S->bad_ctype;
			parent->ctype.base_type = base_type;
		}
		if (is_int_type(C->S, base_type)) {
			Num v = {.y = lastval};
			if (ctype->ctype.modifiers & MOD_UNSIGNED)
				v.x = 0;
			else if ((long long)lastval >= 0)
				v.x = 0;
			else
				v.x = -1;
			upper_boundary(&upper, &v);
			lower_boundary(&lower, &v);
		}
		token = next;

		sym->endpos = token->pos;

		if (!match_op(token, ','))
			break;
		token = token->next;
	}
	if (!base_type) {
		sparse_error(C, token->pos, "bad enum definition");
		base_type = &C->S->bad_ctype;
	}
	else if (!is_int_type(C->S, base_type))
		base_type = base_type;
	else if (type_is_ok(C, base_type, &upper, &lower))
		base_type = base_type;
	else if (type_is_ok(C, &C->S->int_ctype, &upper, &lower))
		base_type = &C->S->int_ctype;
	else if (type_is_ok(C, &C->S->uint_ctype, &upper, &lower))
		base_type = &C->S->uint_ctype;
	else if (type_is_ok(C, &C->S->long_ctype, &upper, &lower))
		base_type = &C->S->long_ctype;
	else if (type_is_ok(C, &C->S->ulong_ctype, &upper, &lower))
		base_type = &C->S->ulong_ctype;
	else if (type_is_ok(C, &C->S->llong_ctype, &upper, &lower))
		base_type = &C->S->llong_ctype;
	else if (type_is_ok(C, &C->S->ullong_ctype, &upper, &lower))
		base_type = &C->S->ullong_ctype;
	else
		base_type = &C->S->bad_ctype;
	parent->ctype.base_type = base_type;
	parent->ctype.modifiers |= (base_type->ctype.modifiers & MOD_UNSIGNED);
	parent->examined = 0;

	cast_enum_list(C, parent->symbol_list, base_type);

	return token;
}

static struct token *enum_specifier(struct dmr_C *C, struct token *token, struct decl_state *ctx)
{
	struct token *ret = struct_union_enum_specifier(C, SYM_ENUM, token, ctx, parse_enum_declaration);
	struct ctype *ctype = &ctx->ctype.base_type->ctype;

	if (!ctype->base_type)
		ctype->base_type = &C->S->incomplete_ctype;

	return ret;
}

static void apply_ctype(struct dmr_C *C, struct position pos, struct ctype *thistype, struct ctype *ctype);
struct token *typname(struct dmr_C *C, struct token *token, struct symbol **p, int *forced);

static struct token *typeof_specifier(struct dmr_C *C, struct token *token, struct decl_state *ctx)
{
	struct symbol *sym;

	if (!match_op(token, '(')) {
		sparse_error(C, token->pos, "expected '(' after typeof");
		return token;
	}
	if (lookup_type(token->next)) {
		token = typname(C, token->next, &sym, NULL);
		ctx->ctype.base_type = sym->ctype.base_type;
		apply_ctype(C, token->pos, &sym->ctype, &ctx->ctype);
	} else {
		struct symbol *typeof_sym = alloc_symbol(C->S, token->pos, SYM_TYPEOF);
		token = parse_expression(C, token->next, &typeof_sym->initializer);

		typeof_sym->endpos = token->pos;
		if (!typeof_sym->initializer) {
			sparse_error(C, token->pos, "expected expression after the '(' token");
			typeof_sym = &C->S->bad_ctype;
		}
		ctx->ctype.base_type = typeof_sym;
	}
	return expect(C, token, ')', "after typeof");
}

static struct token *ignore_attribute(struct dmr_C *C, struct token *token, struct symbol *attr, struct decl_state *ctx)
{
	struct expression *expr = NULL;
	if (match_op(token, '('))
		token = parens_expression(C, token, &expr, "in attribute");
	return token;
}

static struct token *attribute_packed(struct dmr_C *C, struct token *token, struct symbol *attr, struct decl_state *ctx)
{
	if (!ctx->ctype.alignment)
		ctx->ctype.alignment = 1;
	return token;
}

static struct token *attribute_aligned(struct dmr_C *C, struct token *token, struct symbol *attr, struct decl_state *ctx)
{
	int alignment = C->target->max_alignment;
	struct expression *expr = NULL;

	if (match_op(token, '(')) {
		token = parens_expression(C, token, &expr, "in attribute");
		if (expr)
			alignment = (int) const_expression_value(C, expr);
	}
	if (alignment & (alignment-1)) {
		warning(C, token->pos, "I don't like non-power-of-2 alignments");
		return token;
	} else if (alignment > ctx->ctype.alignment)
		ctx->ctype.alignment = alignment;
	return token;
}

static void apply_qualifier(struct dmr_C *C, struct position *pos, struct ctype *ctx, unsigned long qual)
{
	if (ctx->modifiers & qual)
		warning(C, *pos, "duplicate %s", modifier_string(C, qual));
	ctx->modifiers |= qual;
}

static struct token *attribute_modifier(struct dmr_C *C, struct token *token, struct symbol *attr, struct decl_state *ctx)
{
	apply_qualifier(C, &token->pos, &ctx->ctype, attr->ctype.modifiers);
	return token;
}

static struct token *attribute_address_space(struct dmr_C *C, struct token *token, struct symbol *attr, struct decl_state *ctx)
{
	struct expression *expr = NULL;
	int as;
	token = expect(C, token, '(', "after address_space attribute");
	token = conditional_expression(C, token, &expr);
	if (expr) {
		as = (int) const_expression_value(C, expr);
		if (C->Waddress_space && as)
			ctx->ctype.as = as;
	}
	token = expect(C, token, ')', "after address_space attribute");
	return token;
}

static struct symbol *to_QI_mode(struct dmr_C *C, struct symbol *ctype)
{
	if (ctype->ctype.base_type != &C->S->int_type)
		return NULL;
	if (ctype == &C->S->char_ctype)
		return ctype;
	return ctype->ctype.modifiers & MOD_UNSIGNED ? &C->S->uchar_ctype
						     : &C->S->schar_ctype;
}

static struct symbol *to_HI_mode(struct dmr_C *C, struct symbol *ctype)
{
	if (ctype->ctype.base_type != &C->S->int_type)
		return NULL;
	return ctype->ctype.modifiers & MOD_UNSIGNED ? &C->S->ushort_ctype
						     : &C->S->sshort_ctype;
}

static struct symbol *to_SI_mode(struct dmr_C *C, struct symbol *ctype)
{
	if (ctype->ctype.base_type != &C->S->int_type)
		return NULL;
	return ctype->ctype.modifiers & MOD_UNSIGNED ? &C->S->uint_ctype
						     : &C->S->sint_ctype;
}

static struct symbol *to_DI_mode(struct dmr_C *C, struct symbol *ctype)
{
	if (ctype->ctype.base_type != &C->S->int_type)
		return NULL;
	return ctype->ctype.modifiers & MOD_UNSIGNED ? &C->S->ullong_ctype
						     : &C->S->sllong_ctype;
}

static struct symbol *to_TI_mode(struct dmr_C *C, struct symbol *ctype)
{
	if (ctype->ctype.base_type != &C->S->int_type)
		return NULL;
	return ctype->ctype.modifiers & MOD_UNSIGNED ? &C->S->ulllong_ctype
						     : &C->S->slllong_ctype;
}

static struct symbol *to_word_mode(struct dmr_C *C, struct symbol *ctype)
{
	if (ctype->ctype.base_type != &C->S->int_type)
		return NULL;
	return ctype->ctype.modifiers & MOD_UNSIGNED ? &C->S->ulong_ctype
						     : &C->S->slong_ctype;
}

static struct token *attribute_mode(struct dmr_C *C, struct token *token, struct symbol *attr, struct decl_state *ctx)
{
	token = expect(C, token, '(', "after mode attribute");
	if (token_type(token) == TOKEN_IDENT) {
		struct symbol *mode = lookup_keyword(token->ident, NS_KEYWORD);
		if (mode && mode->op->type == KW_MODE)
			ctx->mode = mode->op;
		else
			sparse_error(C, token->pos, "unknown mode attribute %s\n", show_ident(C, token->ident));
		token = token->next;
	} else
		sparse_error(C, token->pos, "expect attribute mode symbol\n");
	token = expect(C, token, ')', "after mode attribute");
	return token;
}

static struct token *attribute_context(struct dmr_C *C, struct token *token, struct symbol *attr, struct decl_state *ctx)
{
	struct context *context = (struct context *)allocator_allocate(&C->S->context_allocator, 0);  // FIXME alloc_context()?
	struct expression *args[3];
	int argc = 0;

	token = expect(C, token, '(', "after context attribute");
	while (!match_op(token, ')')) {
		struct expression *expr = NULL;
		token = conditional_expression(C, token, &expr);
		if (!expr)
			break;
		if (argc < 3)
			args[argc++] = expr;
		if (!match_op(token, ','))
			break;
		token = token->next;
	}

	switch(argc) {
	case 0:
		sparse_error(C, token->pos, "expected context input/output values");
		break;
	case 1:
		context->in = (unsigned int) get_expression_value(C, args[0]);
		break;
	case 2:
		context->in = (unsigned int) get_expression_value(C, args[0]);
		context->out = (unsigned int) get_expression_value(C, args[1]);
		break;
	case 3:
		context->context_expr = args[0];
		context->in = (unsigned int) get_expression_value(C, args[1]);
		context->out = (unsigned int) get_expression_value(C, args[2]);
		break;
	}

	if (argc)
		ptrlist_add(&ctx->ctype.contexts, context);

	token = expect(C, token, ')', "after context attribute");
	return token;
}

static struct token *attribute_designated_init(struct dmr_C *C, struct token *token, struct symbol *attr, struct decl_state *ctx)
{
	if (ctx->ctype.base_type && ctx->ctype.base_type->type == SYM_STRUCT)
		ctx->ctype.base_type->designated_init = 1;
	else
		warning(C, token->pos, "attribute designated_init applied to non-structure type");
	return token;
}

static struct token *attribute_transparent_union(struct dmr_C *C, struct token *token, struct symbol *attr, struct decl_state *ctx)
{
	if (C->Wtransparent_union)
		warning(C, token->pos, "ignoring attribute __transparent_union__");
	return token;
}

static struct token *recover_unknown_attribute(struct dmr_C *C, struct token *token)
{
	struct expression *expr = NULL;

	sparse_error(C, token->pos, "attribute '%s': unknown attribute", show_ident(C, token->ident));
	token = token->next;
	if (match_op(token, '('))
		token = parens_expression(C, token, &expr, "in attribute");
	return token;
}

static struct token *attribute_specifier(struct dmr_C *C, struct token *token, struct decl_state *ctx)
{
	token = expect(C, token, '(', "after attribute");
	token = expect(C, token, '(', "after attribute");

	for (;;) {
		struct ident *attribute_name;
		struct symbol *attr;

		if (eof_token(token))
			break;
		if (match_op(token, ';'))
			break;
		if (token_type(token) != TOKEN_IDENT)
			break;
		attribute_name = token->ident;
		attr = lookup_keyword(attribute_name, NS_KEYWORD);
		if (attr && attr->op->attribute)
			token = attr->op->attribute(C, token->next, attr, ctx);
		else
			token = recover_unknown_attribute(C, token);

		if (!match_op(token, ','))
			break;
		token = token->next;
	}

	token = expect(C, token, ')', "after attribute");
	token = expect(C, token, ')', "after attribute");
	return token;
}

static const char *storage_class[] = 
{
	[STypedef] = "typedef",
	[SAuto] = "auto",
	[SExtern] = "extern",
	[SStatic] = "static",
	[SRegister] = "register",
	[SForced] = "[force]"
};

static unsigned long storage_modifiers(struct dmr_C *C, struct decl_state *ctx)
{
	static unsigned long mod[7] = 
	{
		[SAuto] = MOD_AUTO,
		[SExtern] = MOD_EXTERN,
		[SStatic] = MOD_STATIC,
		[SRegister] = MOD_REGISTER
	};
	return mod[ctx->storage_class] | (ctx->is_inline ? MOD_INLINE : 0)
		| (ctx->is_tls ? MOD_TLS : 0);
}

static void set_storage_class(struct dmr_C *C, struct position *pos, struct decl_state *ctx, int klass)
{
	/* __thread can be used alone, or with extern or static */
	if (ctx->is_tls && (klass != SStatic && klass != SExtern)) {
		sparse_error(C, *pos, "__thread can only be used alone, or with "
				"extern or static");
		return;
	}

	if (!ctx->storage_class) {
		ctx->storage_class = klass;
		return;
	}
	if (ctx->storage_class == klass)
		sparse_error(C, *pos, "duplicate %s", storage_class[klass]);
	else
		sparse_error(C, *pos, "multiple storage classes");
}

static struct token *typedef_specifier(struct dmr_C *C, struct token *next, struct decl_state *ctx)
{
	set_storage_class(C, &next->pos, ctx, STypedef);
	return next;
}

static struct token *auto_specifier(struct dmr_C *C, struct token *next, struct decl_state *ctx)
{
	set_storage_class(C, &next->pos, ctx, SAuto);
	return next;
}

static struct token *register_specifier(struct dmr_C *C, struct token *next, struct decl_state *ctx)
{
	set_storage_class(C, &next->pos, ctx, SRegister);
	return next;
}

static struct token *static_specifier(struct dmr_C *C, struct token *next, struct decl_state *ctx)
{
	set_storage_class(C, &next->pos, ctx, SStatic);
	return next;
}

static struct token *extern_specifier(struct dmr_C *C, struct token *next, struct decl_state *ctx)
{
	set_storage_class(C, &next->pos, ctx, SExtern);
	return next;
}

static struct token *thread_specifier(struct dmr_C *C, struct token *next, struct decl_state *ctx)
{
	/* This GCC extension can be used alone, or with extern or static */
	if (!ctx->storage_class || ctx->storage_class == SStatic
			|| ctx->storage_class == SExtern) {
		ctx->is_tls = 1;
	} else {
		sparse_error(C, next->pos, "__thread can only be used alone, or "
				"with extern or static");
	}

	return next;
}

static struct token *attribute_force(struct dmr_C *C, struct token *token, struct symbol *attr, struct decl_state *ctx)
{
	set_storage_class(C, &token->pos, ctx, SForced);
	return token;
}

static struct token *inline_specifier(struct dmr_C *C, struct token *next, struct decl_state *ctx)
{
	ctx->is_inline = 1;
	return next;
}

static struct token *const_qualifier(struct dmr_C *C, struct token *next, struct decl_state *ctx)
{
	apply_qualifier(C, &next->pos, &ctx->ctype, MOD_CONST);
	return next;
}

static struct token *volatile_qualifier(struct dmr_C *C, struct token *next, struct decl_state *ctx)
{
	apply_qualifier(C, &next->pos, &ctx->ctype, MOD_VOLATILE);
	return next;
}

static void apply_ctype(struct dmr_C *C, struct position pos, struct ctype *thistype, struct ctype *ctype)
{
	unsigned long mod = thistype->modifiers;

	if (mod)
		apply_qualifier(C, &pos, ctype, mod);

	/* Context */
	ptrlist_concat((struct ptr_list *)thistype->contexts,
	                (struct ptr_list **)&ctype->contexts);

	/* Alignment */
	if (thistype->alignment > ctype->alignment)
		ctype->alignment = thistype->alignment;

	/* Address space */
	if (thistype->as)
		ctype->as = thistype->as;
}

static void specifier_conflict(struct dmr_C *C, struct position pos, int what, struct ident *news)
{
	const char *old;
	if (what & (Set_S | Set_T))
		goto Catch_all;
	if (what & Set_Char)
		old = "char";
	else if (what & Set_Double)
		old = "double";
	else if (what & Set_Float)
		old = "float";
	else if (what & Set_Signed)
		old = "signed";
	else if (what & Set_Unsigned)
		old = "unsigned";
	else if (what & Set_Short)
		old = "short";
	else if (what & Set_Long)
		old = "long";
	else
		old = "long long";
	sparse_error(C, pos, "impossible combination of type specifiers: %s %s",
			old, show_ident(C, news));
	return;

Catch_all:
	sparse_error(C, pos, "two or more data types in declaration specifiers");
}

struct symbol *ctype_integer(struct dmr_C *C, int size, int want_unsigned)
{
	return C->P->types[want_unsigned ? CUInt : CInt][size];
}

static struct token *handle_qualifiers(struct dmr_C *C, struct token *t, struct decl_state *ctx)
{
	while (token_type(t) == TOKEN_IDENT) {
		struct symbol *s = lookup_symbol(t->ident, NS_TYPEDEF);
		if (!s)
			break;
		if (s->type != SYM_KEYWORD)
			break;
		if (!(s->op->type & (KW_ATTRIBUTE | KW_QUALIFIER)))
			break;
		t = t->next;
		if (s->op->declarator)
			t = s->op->declarator(C, t, ctx);
	}
	return t;
}

static struct token *declaration_specifiers(struct dmr_C *C, struct token *token, struct decl_state *ctx)
{
	int seen = 0;
	int cls = CInt;
	int size = 0;

	while (token_type(token) == TOKEN_IDENT) {
		struct symbol *s = lookup_symbol(token->ident,
						 NS_TYPEDEF | NS_SYMBOL);
		if (!s || !(s->ns & NS_TYPEDEF))
			break;
		if (s->type != SYM_KEYWORD) {
			if (seen & Set_Any)
				break;
			seen |= Set_S | Set_T;
			ctx->ctype.base_type = s->ctype.base_type;
			apply_ctype(C, token->pos, &s->ctype, &ctx->ctype);
			token = token->next;
			continue;
		}
		if (s->op->type & KW_SPECIFIER) {
			if (seen & s->op->test) {
				specifier_conflict(C, token->pos,
						   seen & s->op->test,
						   token->ident);
				break;
			}
			seen |= s->op->set;
			cls += s->op->cls;
			if (s->op->type & KW_SHORT) {
				size = -1;
			} else if (s->op->type & KW_LONG && size++) {
				if (cls == CReal) {
					specifier_conflict(C, token->pos,
							   Set_Vlong,
							   C->S->double_ident);
					break;
				}
				seen |= Set_Vlong;
			}
		}
		token = token->next;
		if (s->op->declarator)
			token = s->op->declarator(C, token, ctx);
		if (s->op->type & KW_EXACT) {
			ctx->ctype.base_type = s->ctype.base_type;
			ctx->ctype.modifiers |= s->ctype.modifiers;
		}
	}

	if (!(seen & Set_S)) {	/* not set explicitly? */
		struct symbol *base = &C->S->incomplete_ctype;
		if (seen & Set_Any)
			base = C->P->types[cls][size];
		ctx->ctype.base_type = base;
	}

	if (ctx->ctype.modifiers & MOD_BITWISE) {
		struct symbol *type;
		ctx->ctype.modifiers &= ~MOD_BITWISE;
		if (!is_int_type(C->S, ctx->ctype.base_type)) {
			sparse_error(C, token->pos, "invalid modifier");
			return token;
		}
		type = alloc_symbol(C->S, token->pos, SYM_BASETYPE);
		*type = *ctx->ctype.base_type;
		type->ctype.modifiers &= ~MOD_SPECIFIER;
		type->ctype.base_type = ctx->ctype.base_type;
		type->type = SYM_RESTRICT;
		ctx->ctype.base_type = type;
		create_fouled(C->S, type);
	}
	return token;
}

static struct token *abstract_array_declarator(struct dmr_C *C, struct token *token, struct symbol *sym)
{
	struct expression *expr = NULL;

	if (match_idents(C, token, C->S->restrict_ident, C->S->__restrict_ident, NULL))
		token = token->next;
	token = parse_expression(C, token, &expr);
	sym->array_size = expr;
	return token;
}

static struct token *skip_attribute(struct dmr_C *C, struct token *token)
{
	token = token->next;
	if (match_op(token, '(')) {
		int depth = 1;
		token = token->next;
		while (depth && !eof_token(token)) {
			if (token_type(token) == TOKEN_SPECIAL) {
				if (token->special == '(')
					depth++;
				else if (token->special == ')')
					depth--;
			}
			token = token->next;
		}
	}
	return token;
}

static struct token *skip_attributes(struct dmr_C *C, struct token *token)
{
	struct symbol *keyword;
	for (;;) {
		if (token_type(token) != TOKEN_IDENT)
			break;
		keyword = lookup_keyword(token->ident, NS_KEYWORD | NS_TYPEDEF);
		if (!keyword || keyword->type != SYM_KEYWORD)
			break;
		if (!(keyword->op->type & KW_ATTRIBUTE))
			break;
		token = expect(C, token->next, '(', "after attribute");
		token = expect(C, token, '(', "after attribute");
		for (;;) {
			if (eof_token(token))
				break;
			if (match_op(token, ';'))
				break;
			if (token_type(token) != TOKEN_IDENT)
				break;
			token = skip_attribute(C, token);
			if (!match_op(token, ','))
				break;
			token = token->next;
		}
		token = expect(C, token, ')', "after attribute");
		token = expect(C, token, ')', "after attribute");
	}
	return token;
}

static struct token *handle_attributes(struct dmr_C *C, struct token *token, struct decl_state *ctx, unsigned int keywords)
{
	struct symbol *keyword;
	for (;;) {
		if (token_type(token) != TOKEN_IDENT)
			break;
		keyword = lookup_keyword(token->ident, NS_KEYWORD | NS_TYPEDEF);
		if (!keyword || keyword->type != SYM_KEYWORD)
			break;
		if (!(keyword->op->type & keywords))
			break;
		token = keyword->op->declarator(C, token->next, ctx);
		keywords &= KW_ATTRIBUTE;
	}
	return token;
}

static int is_nested(struct dmr_C *C, struct token *token, struct token **p,
		    int prefer_abstract)
{
	/*
	 * This can be either a parameter list or a grouping.
	 * For the direct (non-abstract) case, we know if must be
	 * a parameter list if we already saw the identifier.
	 * For the abstract case, we know if must be a parameter
	 * list if it is empty or starts with a type.
	 */
	struct token *next = token->next;

	*p = next = skip_attributes(C, next);

	if (token_type(next) == TOKEN_IDENT) {
		if (lookup_type(next))
			return !prefer_abstract;
		return 1;
	}

	if (match_op(next, ')') || match_op(next, SPECIAL_ELLIPSIS))
		return 0;

	return 1;
}

enum kind {
	Empty, K_R, Proto, Bad_Func,
};

static enum kind which_func(struct dmr_C *C, struct token *token,
			    struct ident **n,
			    int prefer_abstract)
{
	struct token *next = token->next;

	if (token_type(next) == TOKEN_IDENT) {
		if (lookup_type(next))
			return Proto;
		/* identifier list not in definition; complain */
		if (prefer_abstract)
			warning(C, token->pos,
				"identifier list not in definition");
		return K_R;
	}

	if (token_type(next) != TOKEN_SPECIAL)
		return Bad_Func;

	if (next->special == ')') {
		/* don't complain about those */
		if (!n || match_op(next->next, ';'))
			return Empty;
		warning(C, next->pos,
			"non-ANSI function declaration of function '%s'",
			show_ident(C, *n));
		return Empty;
	}

	if (next->special == SPECIAL_ELLIPSIS) {
		warning(C, next->pos,
			"variadic functions must have one named argument");
		return Proto;
	}

	return Bad_Func;
}

static struct token *direct_declarator(struct dmr_C *C, struct token *token, struct decl_state *ctx)
{
	struct ctype *ctype = &ctx->ctype;
	struct token *next;
	struct ident **p = ctx->ident;

	if (ctx->ident && token_type(token) == TOKEN_IDENT) {
		*ctx->ident = token->ident;
		token = token->next;
	} else if (match_op(token, '(') &&
	    is_nested(C, token, &next, ctx->prefer_abstract)) {
		struct symbol *base_type = ctype->base_type;
		if (token->next != next)
			next = handle_attributes(C, token->next, ctx,
						  KW_ATTRIBUTE);
		token = declarator(C, next, ctx);
		token = expect(C, token, ')', "in nested declarator");
		while (ctype->base_type != base_type)
			ctype = &ctype->base_type->ctype;
		p = NULL;
	}

	if (match_op(token, '(')) {
		enum kind kind = which_func(C, token, p, ctx->prefer_abstract);
		struct symbol *fn;
		fn = alloc_indirect_symbol(C, token->pos, ctype, SYM_FN);
		token = token->next;
		if (kind == K_R)
			token = identifier_list(C, token, fn);
		else if (kind == Proto)
			token = parameter_type_list(C, token, fn);
		token = expect(C, token, ')', "in function declarator");
		fn->endpos = token->pos;
		return token;
	}

	while (match_op(token, '[')) {
		struct symbol *array;
		array = alloc_indirect_symbol(C, token->pos, ctype, SYM_ARRAY);
		token = abstract_array_declarator(C, token->next, array);
		token = expect(C, token, ']', "in abstract_array_declarator");
		array->endpos = token->pos;
		ctype = &array->ctype;
	}
	return token;
}

static struct token *pointer(struct dmr_C *C, struct token *token, struct decl_state *ctx)
{
	while (match_op(token,'*')) {
		struct symbol *ptr = alloc_symbol(C->S, token->pos, SYM_PTR);
		ptr->ctype.modifiers = ctx->ctype.modifiers;
		ptr->ctype.base_type = ctx->ctype.base_type;
		ptr->ctype.as = ctx->ctype.as;
		ptr->ctype.contexts = ctx->ctype.contexts;
		ctx->ctype.modifiers = 0;
		ctx->ctype.base_type = ptr;
		ctx->ctype.as = 0;
		ctx->ctype.contexts = NULL;
		ctx->ctype.alignment = 0;

		token = handle_qualifiers(C, token->next, ctx);
		ctx->ctype.base_type->endpos = token->pos;
	}
	return token;
}

static struct token *declarator(struct dmr_C *C, struct token *token, struct decl_state *ctx)
{
	token = pointer(C, token, ctx);
	return direct_declarator(C, token, ctx);
}

static struct token *handle_bitfield(struct dmr_C *C, struct token *token, struct decl_state *ctx)
{
	struct ctype *ctype = &ctx->ctype;
	struct expression *expr;
	struct symbol *bitfield;
	long long width;

	if (ctype->base_type != &C->S->int_type && !is_int_type(C->S, ctype->base_type)) {
		sparse_error(C, token->pos, "invalid bitfield specifier for type %s.",
			show_typename(C, ctype->base_type));
		// Parse this to recover gracefully.
		return conditional_expression(C, token->next, &expr);
	}

	bitfield = alloc_indirect_symbol(C, token->pos, ctype, SYM_BITFIELD);
	token = conditional_expression(C, token->next, &expr);
	width = const_expression_value(C, expr);
	bitfield->bit_size = (int) width;

	if (width < 0 || width > INT_MAX) {
		sparse_error(C, token->pos, "invalid bitfield width, %lld.", width);
		width = -1;
	} else if (*ctx->ident && width == 0) {
		sparse_error(C, token->pos, "invalid named zero-width bitfield `%s'",
		     show_ident(C, *ctx->ident));
		width = -1;
	} else if (*ctx->ident) {
		struct symbol *base_type = bitfield->ctype.base_type;
		struct symbol *bitfield_type = base_type == &C->S->int_type ? bitfield : base_type;
		int is_signed = !(bitfield_type->ctype.modifiers & MOD_UNSIGNED);
		if (C->Wone_bit_signed_bitfield && width == 1 && is_signed) {
			// Valid values are either {-1;0} or {0}, depending on integer
			// representation.  The latter makes for very efficient code...
			sparse_error(C, token->pos, "dubious one-bit signed bitfield");
		}
		if (C->Wdefault_bitfield_sign &&
		    bitfield_type->type != SYM_ENUM &&
		    !(bitfield_type->ctype.modifiers & MOD_EXPLICITLY_SIGNED) &&
		    is_signed) {
			// The sign of bitfields is unspecified by default.
			warning(C, token->pos, "dubious bitfield without explicit `signed' or `unsigned'");
		}
	}
	bitfield->bit_size = (int) width;
	bitfield->endpos = token->pos;
	return token;
}

static struct token *declaration_list(struct dmr_C *C, struct token *token, struct ptr_list **list)
{
	struct decl_state ctx = {.prefer_abstract = 0};
	struct ctype saved;
	unsigned long mod;

	token = declaration_specifiers(C, token, &ctx);
	mod = storage_modifiers(C, &ctx);
	saved = ctx.ctype;
	for (;;) {
		struct symbol *decl = alloc_symbol(C->S, token->pos, SYM_NODE);
		ctx.ident = &decl->ident;

		token = declarator(C, token, &ctx);
		if (match_op(token, ':'))
			token = handle_bitfield(C, token, &ctx);

		token = handle_attributes(C, token, &ctx, KW_ATTRIBUTE);
		apply_modifiers(C, token->pos, &ctx);

		decl->ctype = ctx.ctype;
		decl->ctype.modifiers |= mod;
		decl->endpos = token->pos;
		ptrlist_add(list, decl);
		if (!match_op(token, ','))
			break;
		token = token->next;
		ctx.ctype = saved;
	}
	return token;
}

static struct token *struct_declaration_list(struct dmr_C *C, struct token *token, struct ptr_list **list)
{
	while (!match_op(token, '}')) {
		if (!match_op(token, ';'))
			token = declaration_list(C, token, list);
		if (!match_op(token, ';')) {
			sparse_error(C, token->pos, "expected ; at end of declaration");
			break;
		}
		token = token->next;
	}
	return token;
}

static struct token *parameter_declaration(struct dmr_C *C, struct token *token, struct symbol *sym)
{
	struct decl_state ctx = {.prefer_abstract = 1};

	token = declaration_specifiers(C, token, &ctx);
	ctx.ident = &sym->ident;
	token = declarator(C, token, &ctx);
	token = handle_attributes(C, token, &ctx, KW_ATTRIBUTE);
	apply_modifiers(C, token->pos, &ctx);
	sym->ctype = ctx.ctype;
	sym->ctype.modifiers |= storage_modifiers(C, &ctx);
	sym->endpos = token->pos;
	sym->forced_arg = ctx.storage_class == SForced;
	return token;
}

struct token *typname(struct dmr_C *C, struct token *token, struct symbol **p, int *forced)
{
	struct decl_state ctx = {.prefer_abstract = 1};
	int klass;
	struct symbol *sym = alloc_symbol(C->S, token->pos, SYM_NODE);
	*p = sym;
	token = declaration_specifiers(C, token, &ctx);
	token = declarator(C, token, &ctx);
	apply_modifiers(C, token->pos, &ctx);
	sym->ctype = ctx.ctype;
	sym->endpos = token->pos;
	klass = ctx.storage_class;
	if (forced) {
		*forced = 0;
		if (klass == SForced) {
			*forced = 1;
			klass = 0;
		}
	}
	if (klass)
		warning(C, sym->pos, "storage class in typename (%s %s)",
			storage_class[klass], show_typename(C, sym));
	return token;
}

static struct token *expression_statement(struct dmr_C *C, struct token *token, struct expression **tree)
{
	token = parse_expression(C, token, tree);
	return expect(C, token, ';', "at end of statement");
}

static struct token *parse_asm_operands(struct dmr_C *C, struct token *token, struct statement *stmt,
	struct ptr_list **inout)
{
	struct expression *expr;

	/* Allow empty operands */
	if (match_op(token->next, ':') || match_op(token->next, ')'))
		return token->next;
	do {
		struct ident *ident = NULL;
		if (match_op(token->next, '[') &&
		    token_type(token->next->next) == TOKEN_IDENT &&
		    match_op(token->next->next->next, ']')) {
			ident = token->next->next->ident;
			token = token->next->next->next;
		}
		ptrlist_add(inout, (struct expression *)ident); /* UGGLEE!!! */
		token = primary_expression(C, token->next, &expr);
		ptrlist_add(inout, expr);
		token = parens_expression(C, token, &expr, "in asm parameter");
		ptrlist_add(inout, expr);
	} while (match_op(token, ','));
	return token;
}

static struct token *parse_asm_clobbers(struct dmr_C *C, struct token *token, struct statement *stmt,
	struct ptr_list **clobbers)
{
	struct expression *expr;

	do {
		token = primary_expression(C, token->next, &expr);
		if (expr)
			ptrlist_add(clobbers, expr);
	} while (match_op(token, ','));
	return token;
}

static struct token *parse_asm_labels(struct dmr_C *C, struct token *token, struct statement *stmt,
		        struct ptr_list **labels)
{
	struct symbol *label;

	do {
		token = token->next; /* skip ':' and ',' */
		if (token_type(token) != TOKEN_IDENT)
			return token;
		label = label_symbol(C, token);
		ptrlist_add(labels, label);
		token = token->next;
	} while (match_op(token, ','));
	return token;
}

static struct token *parse_asm_statement(struct dmr_C *C, struct token *token, struct statement *stmt)
{
	int is_goto = 0;

	token = token->next;
	stmt->type = STMT_ASM;
	if (match_idents(C, token, C->S->__volatile___ident, C->S->__volatile_ident, C->S->volatile_ident, NULL)) {
		token = token->next;
	}
	if (token_type(token) == TOKEN_IDENT && token->ident == C->S->goto_ident) {
		is_goto = 1;
		token = token->next;
	}
	token = expect(C, token, '(', "after asm");
	token = parse_expression(C, token, &stmt->asm_string);
	if (match_op(token, ':'))
		token = parse_asm_operands(C, token, stmt, &stmt->asm_outputs);
	if (match_op(token, ':'))
		token = parse_asm_operands(C, token, stmt, &stmt->asm_inputs);
	if (match_op(token, ':'))
		token = parse_asm_clobbers(C, token, stmt, &stmt->asm_clobbers);
	if (is_goto && match_op(token, ':'))
		token = parse_asm_labels(C, token, stmt, &stmt->asm_labels);
	token = expect(C, token, ')', "after asm");
	return expect(C, token, ';', "at end of asm-statement");
}

static struct token *parse_asm_declarator(struct dmr_C *C, struct token *token, struct decl_state *ctx)
{
	struct expression *expr;
	token = expect(C, token, '(', "after asm");
	token = parse_expression(C, token->next, &expr);
	token = expect(C, token, ')', "after asm");
	return token;
}

/* Make a statement out of an expression */
static struct statement *make_statement(struct dmr_C *C, struct expression *expr)
{
	struct statement *stmt;

	if (!expr)
		return NULL;
	stmt = alloc_statement(C, expr->pos, STMT_EXPRESSION);
	stmt->expression = expr;
	return stmt;
}

/*
 * All iterators have two symbols associated with them:
 * the "continue" and "break" symbols, which are targets
 * for continue and break statements respectively.
 *
 * They are in a special name-space, but they follow
 * all the normal visibility rules, so nested iterators
 * automatically work right.
 */
static void start_iterator(struct dmr_C *C, struct statement *stmt)
{
	struct symbol *cont, *brk;

	start_symbol_scope(C);
	cont = alloc_symbol(C->S, stmt->pos, SYM_NODE);
	bind_symbol(C->S, cont, C->S->continue_ident, NS_ITERATOR);
	brk = alloc_symbol(C->S, stmt->pos, SYM_NODE);
	bind_symbol(C->S, brk, C->S->break_ident, NS_ITERATOR);

	stmt->type = STMT_ITERATOR;
	stmt->iterator_break = brk;
	stmt->iterator_continue = cont;
	fn_local_symbol(C, brk);
	fn_local_symbol(C, cont);
}

static void end_iterator(struct dmr_C *C, struct statement *stmt)
{
	end_symbol_scope(C);
}

static struct statement *start_function(struct dmr_C *C, struct symbol *sym)
{
	struct symbol *ret;
	struct statement *stmt = alloc_statement(C, sym->pos, STMT_COMPOUND);

	start_function_scope(C);
	ret = alloc_symbol(C->S, sym->pos, SYM_NODE);
	ret->ctype = sym->ctype.base_type->ctype;
	ret->ctype.modifiers &= ~(MOD_STORAGE | MOD_CONST | MOD_VOLATILE | MOD_TLS | MOD_INLINE | MOD_ADDRESSABLE | MOD_NOCAST | MOD_NODEREF | MOD_ACCESSED | MOD_TOPLEVEL);
	ret->ctype.modifiers |= (MOD_AUTO | MOD_REGISTER);
	bind_symbol(C->S, ret, C->S->return_ident, NS_ITERATOR);
	stmt->ret = ret;
	fn_local_symbol(C, ret);

	// Currently parsed symbol for __func__/__FUNCTION__/__PRETTY_FUNCTION__
	C->current_fn = sym;

	return stmt;
}

static void end_function(struct dmr_C *C, struct symbol *sym)
{
	C->current_fn = NULL;
	end_function_scope(C);
}

/*
 * A "switch()" statement, like an iterator, has a
 * the "break" symbol associated with it. It works
 * exactly like the iterator break - it's the target
 * for any break-statements in scope, and means that
 * "break" handling doesn't even need to know whether
 * it's breaking out of an iterator or a switch.
 *
 * In addition, the "case" symbol is a marker for the
 * case/default statements to find the switch statement
 * that they are associated with.
 */
static void start_switch(struct dmr_C *C, struct statement *stmt)
{
	struct symbol *brk, *switch_case;

	start_symbol_scope(C);
	brk = alloc_symbol(C->S, stmt->pos, SYM_NODE);
	bind_symbol(C->S, brk, C->S->break_ident, NS_ITERATOR);

	switch_case = alloc_symbol(C->S, stmt->pos, SYM_NODE);
	bind_symbol(C->S, switch_case, C->S->case_ident, NS_ITERATOR);
	switch_case->stmt = stmt;

	stmt->type = STMT_SWITCH;
	stmt->switch_break = brk;
	stmt->switch_case = switch_case;

	fn_local_symbol(C, brk);
	fn_local_symbol(C, switch_case);
}

static void end_switch(struct dmr_C *C, struct statement *stmt)
{
	if (!stmt->switch_case->symbol_list)
		warning(C, stmt->pos, "switch with no cases");
	end_symbol_scope(C);
}

static void add_case_statement(struct dmr_C *C, struct statement *stmt)
{
	struct symbol *target = lookup_symbol(C->S->case_ident, NS_ITERATOR);
	struct symbol *sym;

	if (!target) {
		sparse_error(C, stmt->pos, "not in switch scope");
		stmt->type = STMT_NONE;
		return;
	}
	sym = alloc_symbol(C->S, stmt->pos, SYM_NODE);
	ptrlist_add(&target->symbol_list, sym);
	sym->stmt = stmt;
	stmt->case_label = sym;
	fn_local_symbol(C, sym);
}

static struct token *parse_return_statement(struct dmr_C *C, struct token *token, struct statement *stmt)
{
	struct symbol *target = lookup_symbol(C->S->return_ident, NS_ITERATOR);

	if (!target)
		error_die(C, token->pos, "internal error: return without a function target");
	stmt->type = STMT_RETURN;
	stmt->ret_target = target;
	return expression_statement(C, token->next, &stmt->ret_value);
}

static struct token *parse_for_statement(struct dmr_C *C, struct token *token, struct statement *stmt)
{
	struct ptr_list *syms;
	struct expression *e1, *e2, *e3;
	struct statement *iterator;

	start_iterator(C, stmt);
	token = expect(C, token->next, '(', "after 'for'");

	syms = NULL;
	e1 = NULL;
	/* C99 variable declaration? */
	if (lookup_type(token)) {
		token = external_declaration(C, token, &syms);
	} else {
		token = parse_expression(C, token, &e1);
		token = expect(C, token, ';', "in 'for'");
	}
	token = parse_expression(C, token, &e2);
	token = expect(C, token, ';', "in 'for'");
	token = parse_expression(C, token, &e3);
	token = expect(C, token, ')', "in 'for'");
	token = statement(C, token, &iterator);

	stmt->iterator_syms = syms;
	stmt->iterator_pre_statement = make_statement(C, e1);
	stmt->iterator_pre_condition = e2;
	stmt->iterator_post_statement = make_statement(C, e3);
	stmt->iterator_post_condition = NULL;
	stmt->iterator_statement = iterator;
	end_iterator(C, stmt);

	return token;
}

static struct token *parse_while_statement(struct dmr_C *C, struct token *token, struct statement *stmt)
{
	struct expression *expr;
	struct statement *iterator;

	start_iterator(C, stmt);
	token = parens_expression(C, token->next, &expr, "after 'while'");
	token = statement(C, token, &iterator);

	stmt->iterator_pre_condition = expr;
	stmt->iterator_post_condition = NULL;
	stmt->iterator_statement = iterator;
	end_iterator(C, stmt);

	return token;
}

static struct token *parse_do_statement(struct dmr_C *C, struct token *token, struct statement *stmt)
{
	struct expression *expr;
	struct statement *iterator;

	start_iterator(C, stmt);
	token = statement(C, token->next, &iterator);
	if (token_type(token) == TOKEN_IDENT && token->ident == C->S->while_ident)
		token = token->next;
	else
		sparse_error(C, token->pos, "expected 'while' after 'do'");
	token = parens_expression(C, token, &expr, "after 'do-while'");

	stmt->iterator_post_condition = expr;
	stmt->iterator_statement = iterator;
	end_iterator(C, stmt);

	if (iterator && iterator->type != STMT_COMPOUND && C->Wdo_while)
		warning(C, iterator->pos, "do-while statement is not a compound statement");

	return expect(C, token, ';', "after statement");
}

static struct token *parse_if_statement(struct dmr_C *C, struct token *token, struct statement *stmt)
{
	stmt->type = STMT_IF;
	token = parens_expression(C, token->next, &stmt->if_conditional, "after if");
	token = statement(C, token, &stmt->if_true);
	if (token_type(token) != TOKEN_IDENT)
		return token;
	if (token->ident != C->S->else_ident)
		return token;
	return statement(C, token->next, &stmt->if_false);
}

static inline struct token *case_statement(struct dmr_C *C, struct token *token, struct statement *stmt)
{
	stmt->type = STMT_CASE;
	token = expect(C, token, ':', "after default/case");
	add_case_statement(C, stmt);
	return statement(C, token, &stmt->case_statement);
}

static struct token *parse_case_statement(struct dmr_C *C, struct token *token, struct statement *stmt)
{
	token = parse_expression(C, token->next, &stmt->case_expression);
	if (match_op(token, SPECIAL_ELLIPSIS))
		token = parse_expression(C, token->next, &stmt->case_to);
	return case_statement(C, token, stmt);
}

static struct token *parse_default_statement(struct dmr_C *C, struct token *token, struct statement *stmt)
{
	return case_statement(C, token->next, stmt);
}

static struct token *parse_loop_iterator(struct dmr_C *C, struct token *token, struct statement *stmt)
{
	struct symbol *target = lookup_symbol(token->ident, NS_ITERATOR);
	stmt->type = STMT_GOTO;
	stmt->goto_label = target;
	if (!target)
		sparse_error(C, stmt->pos, "break/continue not in iterator scope");
	return expect(C, token->next, ';', "at end of statement");
}

static struct token *parse_switch_statement(struct dmr_C *C, struct token *token, struct statement *stmt)
{
	stmt->type = STMT_SWITCH;
	start_switch(C, stmt);
	token = parens_expression(C, token->next, &stmt->switch_expression, "after 'switch'");
	token = statement(C, token, &stmt->switch_statement);
	end_switch(C, stmt);
	return token;
}

static struct token *parse_goto_statement(struct dmr_C *C, struct token *token, struct statement *stmt)
{
	stmt->type = STMT_GOTO;
	token = token->next;
	if (match_op(token, '*')) {
		token = parse_expression(C, token->next, &stmt->goto_expression);
		ptrlist_add(&C->P->function_computed_goto_list, stmt);
	} else if (token_type(token) == TOKEN_IDENT) {
		stmt->goto_label = label_symbol(C, token);
		token = token->next;
	} else {
		sparse_error(C, token->pos, "Expected identifier or goto expression");
	}
	return expect(C, token, ';', "at end of statement");
}

static struct token *parse_context_statement(struct dmr_C *C, struct token *token, struct statement *stmt)
{
	stmt->type = STMT_CONTEXT;
	token = parse_expression(C, token->next, &stmt->expression);
	if (stmt->expression->type == EXPR_PREOP
	    && stmt->expression->op == '('
	    && stmt->expression->unop->type == EXPR_COMMA) {
		struct expression *expr;
		expr = stmt->expression->unop;
		stmt->context = expr->left;
		stmt->expression = expr->right;
	}
	return expect(C, token, ';', "at end of statement");
}

static struct token *parse_range_statement(struct dmr_C *C, struct token *token, struct statement *stmt)
{
	stmt->type = STMT_RANGE;
	token = assignment_expression(C, token->next, &stmt->range_expression);
	token = expect(C, token, ',', "after range expression");
	token = assignment_expression(C, token, &stmt->range_low);
	token = expect(C, token, ',', "after low range");
	token = assignment_expression(C, token, &stmt->range_high);
	return expect(C, token, ';', "after range statement");
}

static struct token *statement(struct dmr_C *C, struct token *token, struct statement **tree)
{
	struct statement *stmt = alloc_statement(C, token->pos, STMT_NONE);

	*tree = stmt;
	if (token_type(token) == TOKEN_IDENT) {
		struct symbol *s = lookup_keyword(token->ident, NS_KEYWORD);
		if (s && s->op->statement)
			return s->op->statement(C, token, stmt);

		if (match_op(token->next, ':')) {
			struct symbol *s = label_symbol(C, token);
			stmt->type = STMT_LABEL;
			stmt->label_identifier = s;
			if (s->stmt)
				sparse_error(C, stmt->pos, "label '%s' redefined", show_ident(C, token->ident));
			s->stmt = stmt;
			token = skip_attributes(C, token->next->next);
			return statement(C, token, &stmt->label_statement);
		}
	}

	if (match_op(token, '{')) {
		stmt->type = STMT_COMPOUND;
		start_symbol_scope(C);
		token = compound_statement(C, token->next, stmt);
		end_symbol_scope(C);
		
		return expect(C, token, '}', "at end of compound statement");
	}
			
	stmt->type = STMT_EXPRESSION;
	return expression_statement(C, token, &stmt->expression);
}

/* gcc extension - __label__ ident-list; in the beginning of compound stmt */
static struct token *label_statement(struct dmr_C *C, struct token *token)
{
	while (token_type(token) == TOKEN_IDENT) {
		struct symbol *sym = alloc_symbol(C->S, token->pos, SYM_LABEL);
		/* it's block-scope, but we want label namespace */
		bind_symbol(C->S, sym, token->ident, NS_SYMBOL);
		sym->ns = NS_LABEL;
		fn_local_symbol(C, sym);
		token = token->next;
		if (!match_op(token, ','))
			break;
		token = token->next;
	}
	return expect(C, token, ';', "at end of label declaration");
}

static struct token * statement_list(struct dmr_C *C, struct token *token, struct ptr_list **list)
{
	int seen_statement = 0;
	while (token_type(token) == TOKEN_IDENT &&
	       token->ident == C->S->__label___ident)
		token = label_statement(C, token->next);
	for (;;) {
		struct statement * stmt;
		if (eof_token(token))
			break;
		if (match_op(token, '}'))
			break;
		if (lookup_type(token)) {
			if (seen_statement) {
				warning(C, token->pos, "mixing declarations and code");
				seen_statement = 0;
			}
			stmt = alloc_statement(C, token->pos, STMT_DECLARATION);
			token = external_declaration(C, token, &stmt->declaration);
		} else {
			seen_statement = C->Wdeclarationafterstatement;
			token = statement(C, token, &stmt);
		}
		ptrlist_add(list, stmt);
	}
	return token;
}

static struct token *identifier_list(struct dmr_C *C, struct token *token, struct symbol *fn)
{
	struct ptr_list **list = &fn->arguments;
	for (;;) {
		struct symbol *sym = alloc_symbol(C->S, token->pos, SYM_NODE);
		sym->ident = token->ident;
		token = token->next;
		sym->endpos = token->pos;
		sym->ctype.base_type = &C->S->incomplete_ctype;
		ptrlist_add(list, sym);
		if (!match_op(token, ',') ||
		    token_type(token->next) != TOKEN_IDENT ||
		    lookup_type(token->next))
			break;
		token = token->next;
	}
	return token;
}

static struct token *parameter_type_list(struct dmr_C *C, struct token *token, struct symbol *fn)
{
	struct ptr_list **list = &fn->arguments;

	for (;;) {
		struct symbol *sym;

		if (match_op(token, SPECIAL_ELLIPSIS)) {
			fn->variadic = 1;
			token = token->next;
			break;
		}

		sym = alloc_symbol(C->S, token->pos, SYM_NODE);
		token = parameter_declaration(C, token, sym);
		if (sym->ctype.base_type == &C->S->void_ctype) {
			/* Special case: (void) */
			if (!*list && !sym->ident)
				break;
			warning(C, token->pos, "void parameter");
		}
		ptrlist_add(list, sym);
		if (!match_op(token, ','))
			break;
		token = token->next;
	}
	return token;
}

struct token *compound_statement(struct dmr_C *C, struct token *token, struct statement *stmt)
{
	token = statement_list(C, token, &stmt->stmts);
	return token;
}

static struct expression *identifier_expression(struct dmr_C *C, struct token *token)
{
	struct expression *expr = alloc_expression(C, token->pos, EXPR_IDENTIFIER);
	expr->expr_ident = token->ident;
	return expr;
}

static struct expression *index_expression(struct dmr_C *C, struct expression *from, struct expression *to)
{
	int idx_from, idx_to;
	struct expression *expr = alloc_expression(C, from->pos, EXPR_INDEX);

	idx_from = (int) const_expression_value(C, from);
	idx_to = idx_from;
	if (to) {
		idx_to = (int) const_expression_value(C, to);
		if (idx_to < idx_from || idx_from < 0)
			warning(C, from->pos, "nonsense array initializer index range");
	}
	expr->idx_from = idx_from;
	expr->idx_to = idx_to;
	return expr;
}

static struct token *single_initializer(struct dmr_C *C, struct expression **ep, struct token *token)
{
	int expect_equal = 0;
	struct token *next = token->next;
	struct expression **tail = ep;
	int nested;

	*ep = NULL; 

	if ((token_type(token) == TOKEN_IDENT) && match_op(next, ':')) {
		struct expression *expr = identifier_expression(C, token);
		if (C->Wold_initializer)
			warning(C, token->pos, "obsolete struct initializer, use C99 syntax");
		token = initializer(C, &expr->ident_expression, next->next);
		if (expr->ident_expression)
			*ep = expr;
		return token;
	}

	for (tail = ep, nested = 0; ; nested++, next = token->next) {
		if (match_op(token, '.') && (token_type(next) == TOKEN_IDENT)) {
			struct expression *expr = identifier_expression(C, next);
			*tail = expr;
			tail = &expr->ident_expression;
			expect_equal = 1;
			token = next->next;
		} else if (match_op(token, '[')) {
			struct expression *from = NULL, *to = NULL, *expr;
			token = constant_expression(C, token->next, &from);
			if (!from) {
				sparse_error(C, token->pos, "Expected constant expression");
				break;
			}
			if (match_op(token, SPECIAL_ELLIPSIS))
				token = constant_expression(C, token->next, &to);
			expr = index_expression(C, from, to);
			*tail = expr;
			tail = &expr->idx_expression;
			token = expect(C, token, ']', "at end of initializer index");
			if (nested)
				expect_equal = 1;
		} else {
			break;
		}
	}
	if (nested && !expect_equal) {
		if (!match_op(token, '='))
			warning(C, token->pos, "obsolete array initializer, use C99 syntax");
		else
			expect_equal = 1;
	}
	if (expect_equal)
		token = expect(C, token, '=', "at end of initializer index");

	token = initializer(C, tail, token);
	if (!*tail)
		*ep = NULL;
	return token;
}

static struct token *initializer_list(struct dmr_C *C, struct ptr_list **list, struct token *token)
{
	struct expression *expr;

	for (;;) {
		token = single_initializer(C, &expr, token);
		if (!expr)
			break;
		ptrlist_add(list, expr);
		if (!match_op(token, ','))
			break;
		token = token->next;
	}
	return token;
}

struct token *initializer(struct dmr_C *C, struct expression **tree, struct token *token)
{
	if (match_op(token, '{')) {
		struct expression *expr = alloc_expression(C, token->pos, EXPR_INITIALIZER);
		*tree = expr;
		token = initializer_list(C, &expr->expr_list, token->next);
		return expect(C, token, '}', "at end of initializer");
	}
	return assignment_expression(C, token, tree);
}

static void declare_argument(struct dmr_C *C, struct symbol *sym, struct symbol *fn)
{
	if (!sym->ident) {
		sparse_error(C, sym->pos, "no identifier for function argument");
		return;
	}
	bind_symbol(C->S, sym, sym->ident, NS_SYMBOL);
}

static struct token *parse_function_body(struct dmr_C *C, struct token *token, struct symbol *decl,
	struct ptr_list **list)
{
	struct ptr_list **old_symbol_list;
	struct symbol *base_type = decl->ctype.base_type;
	struct statement *stmt, **p;
	struct symbol *prev;
	struct symbol *arg;

	old_symbol_list = C->P->function_symbol_list;
	if (decl->ctype.modifiers & MOD_INLINE) {
		C->P->function_symbol_list = &decl->inline_symbol_list;
		p = &base_type->inline_stmt;
	} else {
		C->P->function_symbol_list = &decl->symbol_list;
		p = &base_type->stmt;
	}
	C->P->function_computed_target_list = NULL;
	C->P->function_computed_goto_list = NULL;

	if (decl->ctype.modifiers & MOD_EXTERN) {
		if (!(decl->ctype.modifiers & MOD_INLINE))
			warning(C, decl->pos, "function '%s' with external linkage has definition", show_ident(C, decl->ident));
	}
	if (!(decl->ctype.modifiers & MOD_STATIC))
		decl->ctype.modifiers |= MOD_EXTERN;

	stmt = start_function(C, decl);

	*p = stmt;
	FOR_EACH_PTR (base_type->arguments, arg) {
		declare_argument(C, arg, base_type);
	} END_FOR_EACH_PTR(arg);

	token = compound_statement(C, token->next, stmt);

	end_function(C, decl);
	if (!(decl->ctype.modifiers & MOD_INLINE))
		ptrlist_add(list, decl);
	check_declaration(C->S, decl);
	decl->definition = decl;
	prev = decl->same_symbol;
	if (prev && prev->definition) {
		warning(C, decl->pos, "multiple definitions for function '%s'",
			show_ident(C, decl->ident));
		info(C, prev->definition->pos, " the previous one is here");
	} else {
		while (prev) {
			prev->definition = decl;
			prev = prev->same_symbol;
		}
	}
	C->P->function_symbol_list = old_symbol_list;
	if (C->P->function_computed_goto_list) {
		if (!C->P->function_computed_target_list)
			warning(C, decl->pos, "function '%s' has computed goto but no targets?", show_ident(C, decl->ident));
		else {
			FOR_EACH_PTR(C->P->function_computed_target_list, stmt) {
				stmt->target_list = C->P->function_computed_target_list;
			} END_FOR_EACH_PTR(stmt);
		}
	}
	return expect(C, token, '}', "at end of function");
}

static void promote_k_r_types(struct dmr_C *C, struct symbol *arg)
{
	struct symbol *base = arg->ctype.base_type;
	if (base && base->ctype.base_type == &C->S->int_type && (base->ctype.modifiers & (MOD_CHAR | MOD_SHORT))) {
		arg->ctype.base_type = &C->S->int_ctype;
	}
}

static void apply_k_r_types(struct dmr_C *C, struct ptr_list *argtypes, struct symbol *fn)
{
	struct ptr_list *real_args = fn->ctype.base_type->arguments;
	struct symbol *arg;

	FOR_EACH_PTR(real_args, arg) {
		struct symbol *type;

		/* This is quadratic in the number of arguments. We _really_ don't care */
		FOR_EACH_PTR(argtypes, type) {
			if (type->ident == arg->ident)
				goto match;
		} END_FOR_EACH_PTR(type);
		sparse_error(C, arg->pos, "missing type declaration for parameter '%s'", show_ident(C, arg->ident));
		continue;
match:
		type->used = 1;
		/* "char" and "short" promote to "int" */
		promote_k_r_types(C, type);

		arg->ctype = type->ctype;
	} END_FOR_EACH_PTR(arg);

	FOR_EACH_PTR(argtypes, arg) {
		if (!arg->used)
			warning(C, arg->pos, "nonsensical parameter declaration '%s'", show_ident(C, arg->ident));
	} END_FOR_EACH_PTR(arg);
}

static struct token *parse_k_r_arguments(struct dmr_C *C, struct token *token, struct symbol *decl,
	struct ptr_list **list)
{
	struct ptr_list *args = NULL;

	warning(C, token->pos, "non-ANSI definition of function '%s'", show_ident(C, decl->ident));
	do {
		token = declaration_list(C, token, &args);
		if (!match_op(token, ';')) {
			sparse_error(C, token->pos, "expected ';' at end of parameter declaration");
			break;
		}
		token = token->next;
	} while (lookup_type(token));

	apply_k_r_types(C, args, decl);

	if (!match_op(token, '{')) {
		sparse_error(C, token->pos, "expected function body");
		return token;
	}
	return parse_function_body(C, token, decl, list);
}

static struct token *toplevel_asm_declaration(struct dmr_C *C, struct token *token, struct ptr_list **list)
{
	struct symbol *anon = alloc_symbol(C->S, token->pos, SYM_NODE);
	struct symbol *fn = alloc_symbol(C->S, token->pos, SYM_FN);
	struct statement *stmt;

	anon->ctype.base_type = fn;
	stmt = alloc_statement(C, token->pos, STMT_NONE);
	fn->stmt = stmt;

	token = parse_asm_statement(C, token, stmt);

	ptrlist_add(list, anon);
	return token;
}

struct token *external_declaration(struct dmr_C *C, struct token *token, struct ptr_list **list)
{
	struct ident *ident = NULL;
	struct symbol *decl;
	struct decl_state ctx = { .ident = &ident };
	struct ctype saved;
	struct symbol *base_type;
	unsigned long mod;
	int is_typedef;

	/* Top-level inline asm? */
	if (token_type(token) == TOKEN_IDENT) {
		struct symbol *s = lookup_keyword(token->ident, NS_KEYWORD);
		if (s && s->op->toplevel)
			return s->op->toplevel(C, token, list);
	}

	/* Parse declaration-specifiers, if any */
	token = declaration_specifiers(C, token, &ctx);
	mod = storage_modifiers(C, &ctx);
	decl = alloc_symbol(C->S, token->pos, SYM_NODE);
	/* Just a type declaration? */
	if (match_op(token, ';')) {
		apply_modifiers(C, token->pos, &ctx);
		return token->next;
	}

	saved = ctx.ctype;
	token = declarator(C, token, &ctx);
	token = handle_attributes(C, token, &ctx, KW_ATTRIBUTE | KW_ASM);
	apply_modifiers(C, token->pos, &ctx);

	decl->ctype = ctx.ctype;
	decl->ctype.modifiers |= mod;
	decl->endpos = token->pos;

	/* Just a type declaration? */
	if (!ident) {
		warning(C, token->pos, "missing identifier in declaration");
		return expect(C, token, ';', "at the end of type declaration");
	}

	/* type define declaration? */
	is_typedef = ctx.storage_class == STypedef;

	/* Typedefs don't have meaningful storage */
	if (is_typedef)
		decl->ctype.modifiers |= MOD_USERTYPE;

	bind_symbol(C->S, decl, ident, is_typedef ? NS_TYPEDEF: NS_SYMBOL);

	base_type = decl->ctype.base_type;

	if (is_typedef) {
		if (base_type && !base_type->ident) {
			switch (base_type->type) {
			case SYM_STRUCT:
			case SYM_UNION:
			case SYM_ENUM:
			case SYM_RESTRICT:
				base_type->ident = ident;
			}
		}
	} else if (base_type && base_type->type == SYM_FN) {
		/* K&R argument declaration? */
		if (lookup_type(token))
			return parse_k_r_arguments(C, token, decl, list);
		if (match_op(token, '{'))
			return parse_function_body(C, token, decl, list);

		if (!(decl->ctype.modifiers & MOD_STATIC))
			decl->ctype.modifiers |= MOD_EXTERN;
	} else if (base_type == &C->S->void_ctype && !(decl->ctype.modifiers & MOD_EXTERN)) {
		sparse_error(C, token->pos, "void declaration");
	}

	for (;;) {
		if (!is_typedef && match_op(token, '=')) {
			if (decl->ctype.modifiers & MOD_EXTERN) {
				warning(C, decl->pos, "symbol with external linkage has initializer");
				decl->ctype.modifiers &= ~MOD_EXTERN;
			}
			token = initializer(C, &decl->initializer, token->next);
		}
		if (!is_typedef) {
			if (!(decl->ctype.modifiers & (MOD_EXTERN | MOD_INLINE))) {
				ptrlist_add(list, decl);
				fn_local_symbol(C, decl);
			}
		}
		check_declaration(C->S, decl);
		if (decl->same_symbol)
			decl->definition = decl->same_symbol->definition;

		if (!match_op(token, ','))
			break;

		token = token->next;
		ident = NULL;
		decl = alloc_symbol(C->S, token->pos, SYM_NODE);
		ctx.ctype = saved;
		token = handle_attributes(C, token, &ctx, KW_ATTRIBUTE);
		token = declarator(C, token, &ctx);
		token = handle_attributes(C, token, &ctx, KW_ATTRIBUTE | KW_ASM);
		apply_modifiers(C, token->pos, &ctx);
		decl->ctype = ctx.ctype;
		decl->ctype.modifiers |= mod;
		decl->endpos = token->pos;
		if (!ident) {
			sparse_error(C, token->pos, "expected identifier name in type definition");
			return token;
		}

		if (is_typedef)
			decl->ctype.modifiers |= MOD_USERTYPE;

		bind_symbol(C->S, decl, ident, is_typedef ? NS_TYPEDEF: NS_SYMBOL);

		/* Function declarations are automatically extern unless specifically static */
		base_type = decl->ctype.base_type;
		if (!is_typedef && base_type && base_type->type == SYM_FN) {
			if (!(decl->ctype.modifiers & MOD_STATIC))
				decl->ctype.modifiers |= MOD_EXTERN;
		}
	}
	return expect(C, token, ';', "at end of declaration");
}

int test_parse() {
	struct dmr_C *C = new_dmr_C();
	char test1[100] = "int main() { if (1 == 2) printf(\"hello world!\\n\"); return 0; }";
	struct token *start;
	struct token *end;
	start = tokenize_buffer(C, (unsigned char *)test1,
		(unsigned long)strlen(test1), &end);
	for (struct token *p = start; !eof_token(p); p = p->next) {
		printf("%s\n", show_token(C, p));
	}
	printf("\n");
	start = preprocess(C, start);
	for (struct token *p = start; !eof_token(p); p = p->next) {
		printf("%s\n", show_token(C, p));
	}
	struct ptr_list *symbols = NULL;
	while (!eof_token(start))
		start = external_declaration(C, start, &C->S->translation_unit_used_list);
	show_symbol_list(C, C->S->translation_unit_used_list, "\n\n");
	destroy_dmr_C(C);
	return 0;
}
