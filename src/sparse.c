/*
 * Example trivial client program that uses the sparse library
 * to tokenize, preprocess and parse a C file, and prints out
 * the results.
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
#include <linearize.h>

static int context_increase(struct dmr_C *C, struct basic_block *bb, int entry)
{
	int sum = 0;
	struct instruction *insn;

	FOR_EACH_PTR(bb->insns, insn) {
		int val;
		if (insn->opcode != OP_CONTEXT)
			continue;
		val = insn->increment;
		if (insn->check) {
			int current = sum + entry;
			if (!val) {
				if (!current)
					continue;
			} else if (current >= val)
				continue;
			warning(C, insn->pos, "context check failure");
			continue;
		}
		sum += val;
	} END_FOR_EACH_PTR(insn);
	return sum;
}

static int imbalance(struct dmr_C *C, struct entrypoint *ep, struct basic_block *bb, int entry, int exit, const char *why)
{
	if (C->Wcontext) {
		struct symbol *sym = ep->name;
		warning(C, bb->pos, "context imbalance in '%s' - %s", show_ident(C, sym->ident), why);
	}
	return -1;
}

static int check_bb_context(struct dmr_C *C, struct entrypoint *ep, struct basic_block *bb, int entry, int exit);

static int check_children(struct dmr_C *C, struct entrypoint *ep, struct basic_block *bb, int entry, int exit)
{
	struct instruction *insn;
	struct basic_block *child;

	insn = last_instruction(bb->insns);
	if (!insn)
		return 0;
	if (insn->opcode == OP_RET)
		return entry != exit ? imbalance(C, ep, bb, entry, exit, "wrong count at exit") : 0;

	FOR_EACH_PTR(bb->children, child) {
		if (check_bb_context(C, ep, child, entry, exit))
			return -1;
	} END_FOR_EACH_PTR(child);
	return 0;
}

static int check_bb_context(struct dmr_C *C, struct entrypoint *ep, struct basic_block *bb, int entry, int exit)
{
	if (!bb)
		return 0;
	if (bb->context == entry)
		return 0;

	/* Now that's not good.. */
	if (bb->context >= 0)
		return imbalance(C, ep, bb, entry, bb->context, "different lock contexts for basic block");

	bb->context = entry;
	entry += context_increase(C, bb, entry);
	if (entry < 0)
		return imbalance(C, ep, bb, entry, exit, "unexpected unlock");

	return check_children(C, ep, bb, entry, exit);
}

static void check_cast_instruction(struct dmr_C *C, struct instruction *insn)
{
	struct symbol *orig_type = insn->orig_type;
	if (orig_type) {
		int old = orig_type->bit_size;
		int new = insn->size;
		int oldsigned = (orig_type->ctype.modifiers & MOD_SIGNED) != 0;
		int newsigned = insn->opcode == OP_SCAST;

		if (new > old) {
			if (oldsigned == newsigned)
				return;
			if (newsigned)
				return;
			warning(C, insn->pos, "cast loses sign");
			return;
		}
		if (new < old) {
			warning(C, insn->pos, "cast drops bits");
			return;
		}
		if (oldsigned == newsigned) {
			warning(C, insn->pos, "cast wasn't removed");
			return;
		}
		warning(C, insn->pos, "cast changes sign");
	}
}

static void check_range_instruction(struct dmr_C *C, struct instruction *insn)
{
	warning(C, insn->pos, "value out of range");
}

static void check_byte_count(struct dmr_C *C, struct instruction *insn, pseudo_t count)
{
	if (!count)
		return;
	if (count->type == PSEUDO_VAL) {
		long long val = count->value;
		if (val <= 0 || val > 100000)
			warning(C, insn->pos, "%s with byte count of %lld",
				show_ident(C, insn->func->sym->ident), val);
		return;
	}
	/* OK, we could try to do the range analysis here */
}

static pseudo_t argument(struct dmr_C *C, struct instruction *call, unsigned int argno)
{
	pseudo_t args[8];
	struct ptr_list *arg_list = (struct ptr_list *) call->arguments;

	argno--;
	if (ptrlist_linearize(arg_list, (void *)args, 8) > argno)
		return args[argno];
	return NULL;
}

static void check_memset(struct dmr_C *C, struct instruction *insn)
{
	check_byte_count(C, insn, argument(C, insn, 3));
}

#define check_memcpy check_memset
#define check_ctu check_memset
#define check_cfu check_memset

struct checkfn {
	struct ident *id;
	void (*check)(struct dmr_C *, struct instruction *insn);
};

static void check_call_instruction(struct dmr_C *C, struct instruction *insn)
{
	pseudo_t fn = insn->func;
	struct ident *ident;
	const struct checkfn check_fn[] = {
		{ C->S->memset_ident, check_memset },
		{ C->S->memcpy_ident, check_memcpy },
		{ C->S->copy_to_user_ident, check_ctu },
		{ C->S->copy_from_user_ident, check_cfu },
	};
	int i;

	if (fn->type != PSEUDO_SYM)
		return;
	ident = fn->sym->ident;
	if (!ident)
		return;
	for (i = 0; i < ARRAY_SIZE(check_fn); i++) {
		if (check_fn[i].id != ident)
			continue;
		check_fn[i].check(C, insn);
		break;
	}
}

static void check_one_instruction(struct dmr_C *C, struct instruction *insn)
{
	switch (insn->opcode) {
	case OP_CAST: case OP_SCAST:
		if (C->verbose)
			check_cast_instruction(C, insn);
		break;
	case OP_RANGE:
		check_range_instruction(C, insn);
		break;
	case OP_CALL:
		check_call_instruction(C, insn);
		break;
	default:
		break;
	}
}

static void check_bb_instructions(struct dmr_C *C, struct basic_block *bb)
{
	struct instruction *insn;
	FOR_EACH_PTR(bb->insns, insn) {
		if (!insn->bb)
			continue;
		check_one_instruction(C, insn);
	} END_FOR_EACH_PTR(insn);
}

static void check_instructions(struct dmr_C *C, struct entrypoint *ep)
{
	struct basic_block *bb;
	FOR_EACH_PTR(ep->bbs, bb) {
		check_bb_instructions(C, bb);
	} END_FOR_EACH_PTR(bb);
}

static void check_context(struct dmr_C *C, struct entrypoint *ep)
{
	struct symbol *sym = ep->name;
	struct context *context;
	unsigned int in_context = 0, out_context = 0;

	if (C->Wuninitialized && C->verbose && ep->entry->bb->needs) {
		pseudo_t pseudo;
		FOR_EACH_PTR(ep->entry->bb->needs, pseudo) {
			if (pseudo->type != PSEUDO_ARG)
				warning(C, sym->pos, "%s: possible uninitialized variable (%s)",
					show_ident(C, sym->ident), show_pseudo(C, pseudo));
		} END_FOR_EACH_PTR(pseudo);
	}

	check_instructions(C, ep);

	FOR_EACH_PTR(sym->ctype.contexts, context) {
		in_context += context->in;
		out_context += context->out;
	} END_FOR_EACH_PTR(context);
	check_bb_context(C, ep, ep->entry->bb, in_context, out_context);
}

static void check_symbols(struct dmr_C *C, struct ptr_list *list)
{
	struct symbol *sym;

	FOR_EACH_PTR(list, sym) {
		struct entrypoint *ep;

		expand_symbol(C, sym);
		ep = linearize_symbol(C, sym);
		if (ep) {
			if (C->dbg_entry)
				show_entry(C, ep);

			check_context(C, ep);
		}
	} END_FOR_EACH_PTR(sym);
	if (C->Wsparse_error && C->die_if_error)
		exit(1);
}

int main(int argc, char **argv)
{
	struct ptr_list *filelist = NULL;
	char *file;

	struct dmr_C *C = new_dmr_C();
	// Expand, linearize and show it.
	check_symbols(C, sparse_initialize(C, argc, argv, &filelist));
	FOR_EACH_PTR(filelist, file) {
		check_symbols(C, sparse(C, file));
	} END_FOR_EACH_PTR(file);

	destroy_dmr_C(C);
	return 0;
}
