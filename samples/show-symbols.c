/*
 * Sparse c2xml
 *
 * Dumps the parse tree as an xml document
 *
 * Copyright (C) 2007 Rob Taylor
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
#include <parse.h>
#include <port.h>
#include <symbol.h>
#include <token.h>
#include <scope.h>

static int idcount = 0;

static void *visited(int id) {
	int *p = (int *)malloc(sizeof(int));
	*p = id;
	return p;
}

static void examine_symbol(struct dmr_C *C, struct symbol *sym);

static void newProp(const char *name, const char *value)
{
	printf("<%s>%s</%s>", name, value, name);
}

static void newNumProp(const char *name, int value)
{
	char buf[256];
	snprintf(buf, 256, "%d", value);
	newProp(name, buf);
}

static void newIdProp(const char *name, unsigned int id)
{
	char buf[256];
	snprintf(buf, 256, "_%d", id);
	newProp(name, buf);
}

static void new_sym_node(struct dmr_C *C, struct symbol *sym, const char *name)
{
	const char *ident = dmrC_show_ident(C, sym->ident);

	assert(name != NULL);
	assert(sym != NULL);

	printf("<symbol id=\"%d\" type=\"%s\">", idcount, name);
	
	//newProp("type", name);

	//newIdProp("id", idcount);

	if (sym->ident && ident)
		newProp("ident", ident);
	newProp("file", dmrC_stream_name(C, sym->pos.stream));

	newNumProp("start-line", sym->pos.line);
	newNumProp("start-col", sym->pos.pos);

	if (sym->endpos.type) {
		newNumProp("end-line", sym->endpos.line);
		newNumProp("end-col", sym->endpos.pos);
		if (sym->pos.stream != sym->endpos.stream)
			newProp("end-file", dmrC_stream_name(C, sym->endpos.stream));
        }
	sym->aux = visited(idcount);

	idcount++;
}

static void examine_members(struct dmr_C *C, struct ptr_list *list)
{
	struct symbol *sym;

	FOR_EACH_PTR(list, sym) {
		examine_symbol(C, sym);
	} END_FOR_EACH_PTR(sym);
}

static void examine_modifiers(struct dmr_C *C, struct symbol *sym)
{
	const char *modifiers[] = {
			"auto",
			"register",
			"static",
			"extern",
			"const",
			"volatile",
			"signed",
			"unsigned",
			"char",
			"short",
			"long",
			"long-long",
			"typedef",
			NULL,
			NULL,
			NULL,
			NULL,
			NULL,
			"inline",
			"addressable",
			"nocast",
			"noderef",
			"accessed",
			"toplevel",
			"label",
			"assigned",
			"type-type",
			"safe",
			"user-type",
			"force",
			"explicitly-signed",
			"bitwise"};

	int i;

	if (sym->ns != NS_SYMBOL)
		return;

	/*iterate over the 32 bit bitfield*/
	for (i=0; i < 32; i++) {
		if ((sym->ctype.modifiers & 1<<i) && modifiers[i])
			printf("<%s/>", modifiers[i]);
	}
}

static void
examine_layout(struct dmr_C *C, struct symbol *sym)
{
	dmrC_examine_symbol_type(C->S, sym);

	newNumProp("bit-size", sym->bit_size);
	newNumProp("alignment", sym->ctype.alignment);
	newNumProp("offset", sym->offset);
	if (dmrC_is_bitfield_type(sym)) {
		newNumProp("bit-offset", sym->bit_offset);
	}
}

static void examine_symbol(struct dmr_C *C, struct symbol *sym)
{
	const char *base;
	int array_size;

	if (!sym)
		return;
	if (sym->aux)		/*already visited */
		return;

	if (sym->ident && sym->ident->reserved)
		return;

	new_sym_node(C, sym, dmrC_get_type_name(sym->type));
	examine_modifiers(C, sym);
	examine_layout(C, sym);

	if (sym->ctype.base_type) {
		if ((base = dmrC_builtin_typename(C, sym->ctype.base_type)) == NULL) {
			if (!sym->ctype.base_type->aux) {
				examine_symbol(C, sym->ctype.base_type);
			}
			printf("<base-type>%d</base-type>", *((int *)sym->ctype.base_type->aux));
		} else {
			newProp("base-type-builtin", base);
		}
	}
	if (sym->array_size) {
		/* TODO: modify dmrC_get_expression_value to give error return */
		array_size = dmrC_get_expression_value(C, sym->array_size);
		newNumProp("array-size", array_size);
	}


	switch (sym->type) {
	case SYM_STRUCT:
	case SYM_UNION:
		examine_members(C, sym->symbol_list);
		break;
	case SYM_FN:
		printf("<arguments>");
		examine_members(C, sym->arguments);
		printf("</arguments>");
		//examine_members(C, sym->symbol_list);
		break;
	case SYM_UNINITIALIZED:
		newProp("base-type-builtin", dmrC_builtin_typename(C, sym));
		break;
	default:
		break;
	}
	printf("</symbol>");
	return;
}

static struct position *get_expansion_end (struct token *token)
{
	struct token *p1, *p2;

	for (p1=NULL, p2=NULL;
	     !dmrC_eof_token(token);
	     p2 = p1, p1 = token, token = token->next);

	if (p2)
		return &(p2->pos);
	else
		return NULL;
}

static void examine_macro(struct dmr_C *C, struct symbol *sym)
{
	struct position *pos;

	/* this should probably go in the main codebase*/
	pos = get_expansion_end(sym->expansion);
	if (pos)
		sym->endpos = *pos;
	else
		sym->endpos = sym->pos;

	new_sym_node(C, sym, "macro");
}

static void examine_namespace(struct dmr_C *C, struct symbol *sym)
{
	if (sym->ident && sym->ident->reserved)
		return;

	switch(sym->ns) {
	case NS_MACRO:
		examine_macro(C, sym);
		break;
	case NS_TYPEDEF:
	case NS_STRUCT:
	case NS_SYMBOL:
		examine_symbol(C, sym);
		break;
	case NS_NONE:
	case NS_LABEL:
	case NS_ITERATOR:
	case NS_UNDEF:
	case NS_PREPROCESSOR:
	case NS_KEYWORD:
		break;
	default:
		dmrC_die(C, "Unrecognised namespace type %d",sym->ns);
	}

}

static int get_stream_id (struct dmr_C *C, const char *name)
{
	int i;
	for (i=0; i<C->T->input_stream_nr; i++) {
		if (strcmp(name, dmrC_stream_name(C, i))==0)
			return i;
	}
	return -1;
}

static void examine_symbol_list(struct dmr_C *C, const char *file, struct ptr_list *list)
{
	struct symbol *sym;
	int stream_id = get_stream_id (C, file);

	if (!list)
		return;
	FOR_EACH_PTR(list, sym) {
		if (sym->pos.stream == stream_id)
			examine_namespace(C, sym);
	} END_FOR_EACH_PTR(sym);
}

int main(int argc, char **argv)
{
	struct ptr_list *symlist;
	struct ptr_list *filelist = NULL;
	char *file;

	struct dmr_C *C = new_dmr_C();

	symlist = dmrC_sparse_initialize(C, argc, argv, &filelist);

	FOR_EACH_PTR(filelist, file) {
		examine_symbol_list(C, file, symlist);
		dmrC_sparse_keep_tokens(C, file);
		examine_symbol_list(C, file, C->file_scope->symbols);
		examine_symbol_list(C, file, C->global_scope->symbols);
	} END_FOR_EACH_PTR(file);

	destroy_dmr_C(C);

	return 0;
}
