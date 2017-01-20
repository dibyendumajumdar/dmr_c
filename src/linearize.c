/*
 * Linearize - walk the statement tree (but _not_ the expressions)
 * to generate a linear version of it and the basic blocks. 
 *
 * NOTE! We're not interested in the actual sub-expressions yet,
 * even though they can generate conditional branches and
 * subroutine calls. That's all "local" behaviour.
 *
 * Copyright (C) 2004 Linus Torvalds
 * Copyright (C) 2004 Christopher Li
 */

#include <string.h>
#include <stdarg.h>
#include <stdlib.h>
#include <stdio.h>
#include <assert.h>

#include <port.h>
#include <parse.h>
#include <expression.h>
#include <linearize.h>
#include <flow.h>
#include <target.h>

pseudo_t linearize_statement(struct dmr_C *C, struct entrypoint *ep, struct statement *stmt);
pseudo_t linearize_expression(struct dmr_C *C, struct entrypoint *ep, struct expression *expr);

static pseudo_t add_binary_op(struct dmr_C *C, struct entrypoint *ep, struct symbol *ctype, int op, pseudo_t left, pseudo_t right);
static pseudo_t add_setval(struct dmr_C *C, struct entrypoint *ep, struct symbol *ctype, struct expression *val);
static pseudo_t linearize_one_symbol(struct dmr_C *C, struct entrypoint *ep, struct symbol *sym);

struct access_data;
static pseudo_t add_load(struct dmr_C *C, struct entrypoint *ep, struct access_data *);
static pseudo_t linearize_initializer(struct dmr_C *C, struct entrypoint *ep, struct expression *initializer, struct access_data *);


static struct instruction *alloc_instruction(struct dmr_C *C, int opcode, int size)
{
	struct instruction * insn = (struct instruction *) allocator_allocate(&C->L->instruction_allocator, 0);
	insn->opcode = opcode;
	insn->size = size;
	insn->pos = C->L->current_pos;
	return insn;
}

static inline int type_size(struct symbol *type)
{
	return type ? type->bit_size > 0 ? type->bit_size : 0 : 0;
}

static struct instruction *alloc_typed_instruction(struct dmr_C *C, int opcode, struct symbol *type)
{
	struct instruction *insn = alloc_instruction(C, opcode, type_size(type));
	insn->type = type;
	return insn;
}

static struct entrypoint *alloc_entrypoint(struct dmr_C *C)
{
	return (struct entrypoint *) allocator_allocate(&C->L->entrypoint_allocator, 0);
}

static struct basic_block *alloc_basic_block(struct dmr_C *C, struct entrypoint *ep, struct position pos)
{
	struct basic_block *bb = (struct basic_block *) allocator_allocate(&C->L->basic_block_allocator, 0);
	bb->context = -1;
	bb->pos = pos;
	bb->ep = ep;
	return bb;
}

static struct multijmp *alloc_multijmp(struct dmr_C *C, struct basic_block *target, int begin, int end)
{
	struct multijmp *multijmp = (struct multijmp *)allocator_allocate(&C->L->multijmp_allocator, 0);
	multijmp->target = target;
	multijmp->begin = begin;
	multijmp->end = end;
	return multijmp;
}

static inline int regno(pseudo_t n)
{
	int retval = -1;
	if (n && n->type == PSEUDO_REG)
		retval = n->nr;
	return retval;
}

const char *show_pseudo(struct dmr_C *C, pseudo_t pseudo)
{
	char *buf;
	int i;

	if (!pseudo)
		return "no pseudo";
	if (pseudo == VOID(C))
		return "VOID";
	buf = C->L->pseudo_buffer[3 & ++C->L->n];
	switch(pseudo->type) {
	case PSEUDO_SYM: {
		struct symbol *sym = pseudo->sym;
		struct expression *expr;

		if (sym->bb_target) {
			snprintf(buf, 64, ".L%p", sym->bb_target);
			break;
		}
		if (sym->ident) {
			snprintf(buf, 64, "%s", show_ident(C, sym->ident));
			break;
		}
		expr = sym->initializer;
		snprintf(buf, 64, "<anon symbol:%p>", sym);
		if (expr) {
			switch (expr->type) {
			case EXPR_VALUE:
				snprintf(buf, 64, "<symbol value: %lld>", expr->value);
				break;
			case EXPR_STRING:
				return show_string(C, expr->string);
			default:
				break;
			}
		}
		break;
	}
	case PSEUDO_REG:
		i = snprintf(buf, 64, "%%r%d", pseudo->nr);
		if (pseudo->ident)
			sprintf(buf+i, "(%s)", show_ident(C, pseudo->ident));
		break;
	case PSEUDO_VAL: {
		long long value = pseudo->value;
		if (value > 1000 || value < -1000)
			snprintf(buf, 64, "$%#llx", value);
		else
			snprintf(buf, 64, "$%lld", value);
		break;
	}
	case PSEUDO_ARG:
		snprintf(buf, 64, "%%arg%d", pseudo->nr);
		break;
	case PSEUDO_PHI:
		i = snprintf(buf, 64, "%%phi%d", pseudo->nr);
		if (pseudo->ident)
			sprintf(buf+i, "(%s)", show_ident(C, pseudo->ident));
		break;
	default:
		snprintf(buf, 64, "<bad pseudo type %d>", pseudo->type);
	}
	return buf;
}

static const char *opcodes[] = {
	[OP_BADOP] = "bad_op",

	/* Fn entrypoint */
	[OP_ENTRY] = "<entry-point>",

	/* Terminator */
	[OP_RET] = "ret",
	[OP_BR] = "br",
	[OP_SWITCH] = "switch",
	[OP_INVOKE] = "invoke",
	[OP_COMPUTEDGOTO] = "jmp *",
	[OP_UNWIND] = "unwind",
	
	/* Binary */
	[OP_ADD] = "add",
	[OP_SUB] = "sub",
	[OP_MULU] = "mulu",
	[OP_MULS] = "muls",
	[OP_DIVU] = "divu",
	[OP_DIVS] = "divs",
	[OP_MODU] = "modu",
	[OP_MODS] = "mods",
	[OP_SHL] = "shl",
	[OP_LSR] = "lsr",
	[OP_ASR] = "asr",
	
	/* Logical */
	[OP_AND] = "and",
	[OP_OR] = "or",
	[OP_XOR] = "xor",
	[OP_AND_BOOL] = "and-bool",
	[OP_OR_BOOL] = "or-bool",

	/* Binary comparison */
	[OP_SET_EQ] = "seteq",
	[OP_SET_NE] = "setne",
	[OP_SET_LE] = "setle",
	[OP_SET_GE] = "setge",
	[OP_SET_LT] = "setlt",
	[OP_SET_GT] = "setgt",
	[OP_SET_B] = "setb",
	[OP_SET_A] = "seta",
	[OP_SET_BE] = "setbe",
	[OP_SET_AE] = "setae",

	/* Uni */
	[OP_NOT] = "not",
	[OP_NEG] = "neg",

	/* Special three-input */
	[OP_SEL] = "select",
	
	/* Memory */
	[OP_MALLOC] = "malloc",
	[OP_FREE] = "free",
	[OP_ALLOCA] = "alloca",
	[OP_LOAD] = "load",
	[OP_STORE] = "store",
	[OP_SETVAL] = "set",
	[OP_SYMADDR] = "symaddr",
	[OP_GET_ELEMENT_PTR] = "getelem",

	/* Other */
	[OP_PHI] = "phi",
	[OP_PHISOURCE] = "phisrc",
	[OP_CAST] = "cast",
	[OP_SCAST] = "scast",
	[OP_FPCAST] = "fpcast",
	[OP_PTRCAST] = "ptrcast",
	[OP_INLINED_CALL] = "# call",
	[OP_CALL] = "call",
	[OP_VANEXT] = "va_next",
	[OP_VAARG] = "va_arg",
	[OP_SLICE] = "slice",
	[OP_SNOP] = "snop",
	[OP_LNOP] = "lnop",
	[OP_NOP] = "nop",
	[OP_DEATHNOTE] = "dead",
	[OP_ASM] = "asm",

	/* Sparse tagging (line numbers, context, whatever) */
	[OP_CONTEXT] = "context",
	[OP_RANGE] = "range-check",

	[OP_COPY] = "copy",
};

static char *show_asm_constraints(struct dmr_C *C, char *buf, const char *sep, struct asm_constraint_list *list)
{
	struct asm_constraint *entry;

	FOR_EACH_PTR(list, entry) {
		buf += sprintf(buf, "%s\"%s\"", sep, entry->constraint);
		if (entry->pseudo)
			buf += sprintf(buf, " (%s)", show_pseudo(C, entry->pseudo));
		if (entry->ident)
			buf += sprintf(buf, " [%s]", show_ident(C, entry->ident));
		sep = ", ";		
	} END_FOR_EACH_PTR(entry);
	return buf;
}

static char *show_asm(struct dmr_C *C, char *buf, struct instruction *insn)
{
	struct asm_rules *rules = insn->asm_rules;

	buf += sprintf(buf, "\"%s\"", insn->string);
	buf = show_asm_constraints(C, buf, "\n\t\tout: ", rules->outputs);
	buf = show_asm_constraints(C, buf, "\n\t\tin: ", rules->inputs);
	buf = show_asm_constraints(C, buf, "\n\t\tclobber: ", rules->clobbers);
	return buf;
}

const char *show_instruction(struct dmr_C *C, struct instruction *insn)
{
	int opcode = insn->opcode;
	char *buf;

	buf = C->L->buffer;
	if (!insn->bb)
		buf += sprintf(buf, "# ");

	if (opcode < ARRAY_SIZE(opcodes)) {
		const char *op = opcodes[opcode];
		if (!op)
			buf += sprintf(buf, "opcode:%d", opcode);
		else
			buf += sprintf(buf, "%s", op);
		if (insn->size)
			buf += sprintf(buf, ".%d", insn->size);
		memset(buf, ' ', 20);
		buf++;
	}

	if (buf < C->L->buffer + 12)
		buf = C->L->buffer + 12;
	switch (opcode) {
	case OP_RET:
		if (insn->src && insn->src != VOID(C))
			buf += sprintf(buf, "%s", show_pseudo(C, insn->src));
		break;
	case OP_BR:
		if (insn->bb_true && insn->bb_false) {
			buf += sprintf(buf, "%s, .L%p, .L%p", show_pseudo(C, insn->cond), insn->bb_true, insn->bb_false);
			break;
		}
		buf += sprintf(buf, ".L%p", insn->bb_true ? insn->bb_true : insn->bb_false);
		break;

	case OP_SYMADDR: {
		struct symbol *sym = insn->symbol->sym;
		buf += sprintf(buf, "%s <- ", show_pseudo(C, insn->target));

		if (sym->bb_target) {
			buf += sprintf(buf, ".L%p", sym->bb_target);
			break;
		}
		if (sym->ident) {
			buf += sprintf(buf, "%s", show_ident(C, sym->ident));
			break;
		}
		buf += sprintf(buf, "<anon symbol:%p>", sym);
		break;
	}
		
	case OP_SETVAL: {
		struct expression *expr = insn->val;
		buf += sprintf(buf, "%s <- ", show_pseudo(C, insn->target));

		if (!expr) {
			buf += sprintf(buf, "%s", "<none>");
			break;
		}
			
		switch (expr->type) {
		case EXPR_VALUE:
			buf += sprintf(buf, "%lld", expr->value);
			break;
		case EXPR_FVALUE:
			buf += sprintf(buf, "%Lf", expr->fvalue);
			break;
		case EXPR_STRING:
			buf += sprintf(buf, "%.40s", show_string(C, expr->string));
			break;
		case EXPR_SYMBOL:
			buf += sprintf(buf, "%s", show_ident(C, expr->symbol->ident));
			break;
		case EXPR_LABEL:
			buf += sprintf(buf, ".L%p", expr->symbol->bb_target);
			break;
		default:
			buf += sprintf(buf, "SETVAL EXPR TYPE %d", expr->type);
		}
		break;
	}
	case OP_SWITCH: {
		struct multijmp *jmp;
		buf += sprintf(buf, "%s", show_pseudo(C, insn->target));
		FOR_EACH_PTR(insn->multijmp_list, jmp) {
			if (jmp->begin == jmp->end)
				buf += sprintf(buf, ", %d -> .L%p", jmp->begin, jmp->target);
			else if (jmp->begin < jmp->end)
				buf += sprintf(buf, ", %d ... %d -> .L%p", jmp->begin, jmp->end, jmp->target);
			else
				buf += sprintf(buf, ", default -> .L%p", jmp->target);
		} END_FOR_EACH_PTR(jmp);
		break;
	}
	case OP_COMPUTEDGOTO: {
		struct multijmp *jmp;
		buf += sprintf(buf, "%s", show_pseudo(C, insn->target));
		FOR_EACH_PTR(insn->multijmp_list, jmp) {
			buf += sprintf(buf, ", .L%p", jmp->target);
		} END_FOR_EACH_PTR(jmp);
		break;
	}

	case OP_PHISOURCE: {
		struct instruction *phi;
		buf += sprintf(buf, "%s <- %s    ", show_pseudo(C, insn->target), show_pseudo(C, insn->phi_src));
		FOR_EACH_PTR(insn->phi_users, phi) {
			buf += sprintf(buf, " (%s)", show_pseudo(C, phi->target));
		} END_FOR_EACH_PTR(phi);
		break;
	}

	case OP_PHI: {
		pseudo_t phi;
		const char *s = " <-";
		buf += sprintf(buf, "%s", show_pseudo(C, insn->target));
		FOR_EACH_PTR(insn->phi_list, phi) {
			buf += sprintf(buf, "%s %s", s, C, show_pseudo(C, phi));
			s = ",";
		} END_FOR_EACH_PTR(phi);
		break;
	}	
	case OP_LOAD: case OP_LNOP:
		buf += sprintf(buf, "%s <- %d[%s]", show_pseudo(C, insn->target), insn->offset, show_pseudo(C, insn->src));
		break;
	case OP_STORE: case OP_SNOP:
		buf += sprintf(buf, "%s -> %d[%s]", show_pseudo(C, insn->target), insn->offset, show_pseudo(C, insn->src));
		break;
	case OP_INLINED_CALL:
	case OP_CALL: {
		struct pseudo *arg;
		if (insn->target && insn->target != VOID(C))
			buf += sprintf(buf, "%s <- ", show_pseudo(C, insn->target));
		buf += sprintf(buf, "%s", show_pseudo(C, insn->func));
		FOR_EACH_PTR(insn->arguments, arg) {
			buf += sprintf(buf, ", %s", show_pseudo(C, arg));
		} END_FOR_EACH_PTR(arg);
		break;
	}
	case OP_CAST:
	case OP_SCAST:
	case OP_FPCAST:
	case OP_PTRCAST:
		buf += sprintf(buf, "%s <- (%d) %s",
			show_pseudo(C, insn->target),
			type_size(insn->orig_type),
			show_pseudo(C, insn->src));
		break;
  case OP_ADD:
  case OP_SUB:
  case OP_MULU:
  case OP_MULS:
  case OP_DIVU:
  case OP_DIVS:
  case OP_MODU: 
  case OP_MODS:
  case OP_SHL:
  case OP_LSR: 
  case OP_ASR:
  case OP_AND:
  case OP_OR:      
  case OP_XOR:
  case OP_AND_BOOL:
  case OP_OR_BOOL:
  case OP_SET_EQ:
  case OP_SET_NE:
  case OP_SET_LE:
  case OP_SET_GE:
  case OP_SET_LT:
  case OP_SET_GT:
  case OP_SET_B:
  case OP_SET_A:
  case OP_SET_BE:
  case OP_SET_AE:

		buf += sprintf(buf, "%s <- %s, %s", show_pseudo(C, insn->target), show_pseudo(C, insn->src1), show_pseudo(C, insn->src2));
		break;

	case OP_SEL:
		buf += sprintf(buf, "%s <- %s, %s, %s", show_pseudo(C, insn->target),
			show_pseudo(C, insn->src1), show_pseudo(C, insn->src2), show_pseudo(C, insn->src3));
		break;

	case OP_SLICE:
		buf += sprintf(buf, "%s <- %s, %d, %d", show_pseudo(C, insn->target), show_pseudo(C, insn->base), insn->from, insn->len);
		break;

	case OP_NOT: case OP_NEG:
		buf += sprintf(buf, "%s <- %s", show_pseudo(C, insn->target), show_pseudo(C, insn->src1));
		break;

	case OP_CONTEXT:
		buf += sprintf(buf, "%s%d", insn->check ? "check: " : "", insn->increment);
		break;
	case OP_RANGE:
		buf += sprintf(buf, "%s between %s..%s", show_pseudo(C, insn->src1), show_pseudo(C, insn->src2), show_pseudo(C, insn->src3));
		break;
	case OP_NOP:
		buf += sprintf(buf, "%s <- %s", show_pseudo(C, insn->target), show_pseudo(C, insn->src1));
		break;
	case OP_DEATHNOTE:
		buf += sprintf(buf, "%s", show_pseudo(C, insn->target));
		break;
	case OP_ASM:
		buf = show_asm(C, buf, insn);
		break;
	case OP_COPY:
		buf += sprintf(buf, "%s <- %s", show_pseudo(C, insn->target), show_pseudo(C, insn->src));
		break;
	default:
		break;
	}

	if (buf >= C->L->buffer + sizeof(C->L->buffer))
		die("instruction buffer overflowed %td\n", buf - C->L->buffer);
	do { --buf; } while (*buf == ' ');
	*++buf = 0;
	return C->L->buffer;
}

void show_bb(struct dmr_C *C, struct basic_block *bb)
{
	struct instruction *insn;

	printf(".L%p:\n", bb);
	if (C->verbose) {
		pseudo_t needs, defines;
		printf("%s:%d\n", stream_name(C, bb->pos.stream), bb->pos.line);

		FOR_EACH_PTR(bb->needs, needs) {
			struct instruction *def = needs->def;
			if (def->opcode != OP_PHI) {
				printf("  **uses %s (from .L%p)**\n", show_pseudo(C, needs), def->bb);
			} else {
				pseudo_t phi;
				const char *sep = " ";
				printf("  **uses %s (from", show_pseudo(C, needs));
				FOR_EACH_PTR(def->phi_list, phi) {
					if (phi == VOID(C))
						continue;
					printf("%s(%s:.L%p)", sep, show_pseudo(C, phi), phi->def->bb);
					sep = ", ";
				} END_FOR_EACH_PTR(phi);		
				printf(")**\n");
			}
		} END_FOR_EACH_PTR(needs);

		FOR_EACH_PTR(bb->defines, defines) {
			printf("  **defines %s **\n", show_pseudo(C, defines));
		} END_FOR_EACH_PTR(defines);

		if (bb->parents) {
			struct basic_block *from;
			FOR_EACH_PTR(bb->parents, from) {
				printf("  **from %p (%s:%d:%d)**\n", from,
					stream_name(C, from->pos.stream), from->pos.line, from->pos.pos);
			} END_FOR_EACH_PTR(from);
		}

		if (bb->children) {
			struct basic_block *to;
			FOR_EACH_PTR(bb->children, to) {
				printf("  **to %p (%s:%d:%d)**\n", to,
					stream_name(C, to->pos.stream), to->pos.line, to->pos.pos);
			} END_FOR_EACH_PTR(to);
		}
	}

	FOR_EACH_PTR(bb->insns, insn) {
		if (!insn->bb && C->verbose < 2)
			continue;
		printf("\t%s\n", show_instruction(C, insn));
	} END_FOR_EACH_PTR(insn);
	if (!bb_terminated(bb))
		printf("\tEND\n");
}

static void show_symbol_usage(struct dmr_C *C, pseudo_t pseudo)
{
	struct pseudo_user *pu;

	if (pseudo) {
		FOR_EACH_PTR(pseudo->users, pu) {
			printf("\t%s\n", show_instruction(C, pu->insn));
		} END_FOR_EACH_PTR(pu);
	}
}

void show_entry(struct dmr_C *C, struct entrypoint *ep)
{
	struct symbol *sym;
	struct basic_block *bb;

	printf("%s:\n", show_ident(C, ep->name->ident));

	if (C->verbose) {
		printf("ep %p: %s\n", ep, show_ident(C, ep->name->ident));

		FOR_EACH_PTR(ep->syms, sym) {
			if (!sym->pseudo)
				continue;
			if (!sym->pseudo->users)
				continue;
			printf("   sym: %p %s\n", sym, show_ident(C, sym->ident));
			if (sym->ctype.modifiers & (MOD_EXTERN | MOD_STATIC | MOD_ADDRESSABLE))
				printf("\texternal visibility\n");
			show_symbol_usage(C, sym->pseudo);
		} END_FOR_EACH_PTR(sym);

		printf("\n");
	}

	FOR_EACH_PTR(ep->bbs, bb) {
		if (!bb)
			continue;
		if (!bb->parents && !bb->children && !bb->insns && C->verbose < 2)
			continue;
		show_bb(C, bb);
		printf("\n");
	} END_FOR_EACH_PTR(bb);

	printf("\n");
}

static void bind_label(struct dmr_C *C, struct symbol *label, struct basic_block *bb, struct position pos)
{
	if (label->bb_target)
		warning(C, pos, "label '%s' already bound", show_ident(C, label->ident));
	label->bb_target = bb;
}

static struct basic_block * get_bound_block(struct dmr_C *C, struct entrypoint *ep, struct symbol *label)
{
	struct basic_block *bb = label->bb_target;

	if (!bb) {
		bb = alloc_basic_block(C, ep, label->pos);
		label->bb_target = bb;
	}
	return bb;
}

static void finish_block(struct entrypoint *ep)
{
	struct basic_block *src = ep->active;
	if (bb_reachable(src))
		ep->active = NULL;
}

static void add_goto(struct dmr_C *C, struct entrypoint *ep, struct basic_block *dst)
{
	struct basic_block *src = ep->active;
	if (bb_reachable(src)) {
		struct instruction *br = alloc_instruction(C, OP_BR, 0);
		br->bb_true = dst;
		add_bb(&dst->parents, src);
		add_bb(&src->children, dst);
		br->bb = src;
		add_instruction(&src->insns, br);
		ep->active = NULL;
	}
}

static void add_one_insn(struct dmr_C *C, struct entrypoint *ep, struct instruction *insn)
{
	struct basic_block *bb = ep->active;    

	if (bb_reachable(bb)) {
		insn->bb = bb;
		add_instruction(&bb->insns, insn);
	}
}

static void set_activeblock(struct dmr_C *C, struct entrypoint *ep, struct basic_block *bb)
{
	if (!bb_terminated(ep->active))
		add_goto(C, ep, bb);

	ep->active = bb;
	if (bb_reachable(bb))
		add_bb(&ep->bbs, bb);
}

static void remove_parent(struct dmr_C *C, struct basic_block *child, struct basic_block *parent)
{
	remove_bb_from_list(&child->parents, parent, 1);
	if (!child->parents)
		kill_bb(C, child);
}

/* Change a "switch" into a branch */
void insert_branch(struct dmr_C *C, struct basic_block *bb, struct instruction *jmp, struct basic_block *target)
{
	struct instruction *br, *old;
	struct basic_block *child;

	/* Remove the switch */
	old = delete_last_instruction(&bb->insns);
	assert(old == jmp);

	br = alloc_instruction(C, OP_BR, 0);
	br->bb = bb;
	br->bb_true = target;
	add_instruction(&bb->insns, br);

	FOR_EACH_PTR(bb->children, child) {
		if (child == target) {
			target = NULL;	/* Trigger just once */
			continue;
		}
		DELETE_CURRENT_PTR(child);
		remove_parent(C, child, bb);
	} END_FOR_EACH_PTR(child);
	ptrlist_pack(&bb->children);
}
	

void insert_select(struct dmr_C *C, struct basic_block *bb, struct instruction *br, struct instruction *phi_node, pseudo_t if_true, pseudo_t if_false)
{
	pseudo_t target;
	struct instruction *select;

	/* Remove the 'br' */
	delete_last_instruction(&bb->insns);

	select = alloc_instruction(C, OP_SEL, phi_node->size);
	select->bb = bb;

	assert(br->cond);
	use_pseudo(C, select, br->cond, &select->src1);

	target = phi_node->target;
	assert(target->def == phi_node);
	select->target = target;
	target->def = select;

	use_pseudo(C, select, if_true, &select->src2);
	use_pseudo(C, select, if_false, &select->src3);

	add_instruction(&bb->insns, select);
	add_instruction(&bb->insns, br);
}

static inline int bb_empty(struct basic_block *bb)
{
	return !bb->insns;
}

/* Add a label to the currently active block, return new active block */
static struct basic_block * add_label(struct dmr_C *C, struct entrypoint *ep, struct symbol *label)
{
	struct basic_block *bb = label->bb_target;

	if (bb) {
		set_activeblock(C, ep, bb);
		return bb;
	}
	bb = ep->active;
	if (!bb_reachable(bb) || !bb_empty(bb)) {
		bb = alloc_basic_block(C, ep, label->pos);
		set_activeblock(C, ep, bb);
	}
	label->bb_target = bb;
	return bb;
}

static void add_branch(struct dmr_C *C, struct entrypoint *ep, struct expression *expr, pseudo_t cond, struct basic_block *bb_true, struct basic_block *bb_false)
{
	struct basic_block *bb = ep->active;
	struct instruction *br;

	if (bb_reachable(bb)) {
       		br = alloc_instruction(C, OP_BR, 0);
		use_pseudo(C, br, cond, &br->cond);
		br->bb_true = bb_true;
		br->bb_false = bb_false;
		add_bb(&bb_true->parents, bb);
		add_bb(&bb_false->parents, bb);
		add_bb(&bb->children, bb_true);
		add_bb(&bb->children, bb_false);
		add_one_insn(C, ep, br);
	}
}

/* Dummy pseudo allocator */
pseudo_t alloc_pseudo(struct dmr_C *C, struct instruction *def)
{
	struct pseudo * pseudo = (pseudo_t)allocator_allocate(&C->L->pseudo_allocator, 0);
	pseudo->type = PSEUDO_REG;
	pseudo->nr = ++C->L->nr;
	pseudo->def = def;
	return pseudo;
}

static void clear_symbol_pseudos(struct entrypoint *ep)
{
	pseudo_t pseudo;

	FOR_EACH_PTR(ep->accesses, pseudo) {
		pseudo->sym->pseudo = NULL;
	} END_FOR_EACH_PTR(pseudo);
}

static pseudo_t symbol_pseudo(struct dmr_C *C, struct entrypoint *ep, struct symbol *sym)
{
	pseudo_t pseudo;

	if (!sym)
		return VOID(C);

	pseudo = sym->pseudo;
	if (!pseudo) {
		pseudo = (pseudo_t)allocator_allocate(&C->L->pseudo_allocator, 0);
		pseudo->nr = -1;
		pseudo->type = PSEUDO_SYM;
		pseudo->sym = sym;
		pseudo->ident = sym->ident;
		sym->pseudo = pseudo;
		add_pseudo(&ep->accesses, pseudo);
	}
	/* Symbol pseudos have neither nr, usage nor def */
	return pseudo;
}

pseudo_t value_pseudo(struct dmr_C *C, long long val)
{
	int hash = val & (MAX_VAL_HASH-1);
	struct ptr_list **list = C->L->prev + hash;
	pseudo_t pseudo;

	FOR_EACH_PTR(*list, pseudo) {
		if (pseudo->value == val)
			return pseudo;
	} END_FOR_EACH_PTR(pseudo);

	pseudo = (pseudo_t)allocator_allocate(&C->L->pseudo_allocator, 0);
	pseudo->type = PSEUDO_VAL;
	pseudo->value = val;
	add_pseudo(list, pseudo);

	/* Value pseudos have neither nr, usage nor def */
	return pseudo;
}

static pseudo_t argument_pseudo(struct dmr_C *C, struct entrypoint *ep, int nr)
{
	pseudo_t pseudo = (pseudo_t)allocator_allocate(&C->L->pseudo_allocator, 0);
	struct instruction *entry = ep->entry;

	pseudo->type = PSEUDO_ARG;
	pseudo->nr = nr;
	pseudo->def = entry;
	add_pseudo(&entry->arg_list, pseudo);

	/* Argument pseudos have neither usage nor def */
	return pseudo;
}

pseudo_t alloc_phi(struct dmr_C *C, struct basic_block *source, pseudo_t pseudo, int size)
{
	struct instruction *insn = alloc_instruction(C, OP_PHISOURCE, size);
	pseudo_t phi = (pseudo_t ) allocator_allocate(&C->L->pseudo_allocator, 0);
	static int nr = 0;

	phi->type = PSEUDO_PHI;
	phi->nr = ++nr;
	phi->def = insn;

	use_pseudo(C, insn, pseudo, &insn->phi_src);
	insn->bb = source;
	insn->target = phi;
	add_instruction(C, &source->insns, insn);
	return phi;
}

/*
 * We carry the "access_data" structure around for any accesses,
 * which simplifies things a lot. It contains all the access
 * information in one place.
 */
struct access_data {
	struct symbol *result_type;	// result ctype
	struct symbol *source_type;	// source ctype
	pseudo_t address;		// pseudo containing address ..
	pseudo_t origval;		// pseudo for original value ..
	unsigned int offset, alignment;	// byte offset
	unsigned int bit_size, bit_offset; // which bits
	struct position pos;
};

static void finish_address_gen(struct entrypoint *ep, struct access_data *ad)
{
}

static int linearize_simple_address(struct dmr_C *C, struct entrypoint *ep,
	struct expression *addr,
	struct access_data *ad)
{
	if (addr->type == EXPR_SYMBOL) {
		linearize_one_symbol(C, ep, addr->symbol);
		ad->address = symbol_pseudo(C, ep, addr->symbol);
		return 1;
	}
	if (addr->type == EXPR_BINOP) {
		if (addr->right->type == EXPR_VALUE) {
			if (addr->op == '+') {
				ad->offset += (unsigned int) get_expression_value(C, addr->right);
				return linearize_simple_address(C, ep, addr->left, ad);
			}
		}
	}
	ad->address = linearize_expression(C, ep, addr);
	return 1;
}

static struct symbol *base_type(struct dmr_C *C, struct symbol *sym)
{
	struct symbol *base = sym;

	if (sym) {
		if (sym->type == SYM_NODE)
			base = base->ctype.base_type;
		if (base->type == SYM_BITFIELD)
			return base->ctype.base_type;
	}
	return sym;
}

static int linearize_address_gen(struct dmr_C *C, struct entrypoint *ep,
	struct expression *expr,
	struct access_data *ad)
{
	struct symbol *ctype = expr->ctype;

	if (!ctype)
		return 0;
	ad->pos = expr->pos;
	ad->result_type = ctype;
	ad->source_type = base_type(C, ctype);
	ad->bit_size = ctype->bit_size;
	ad->alignment = ctype->ctype.alignment;
	ad->bit_offset = ctype->bit_offset;
	if (expr->type == EXPR_PREOP && expr->op == '*')
		return linearize_simple_address(C, ep, expr->unop, ad);

	warning(C, expr->pos, "generating address of non-lvalue (%d)", expr->type);
	return 0;
}

static pseudo_t add_load(struct dmr_C *C, struct entrypoint *ep, struct access_data *ad)
{
	struct instruction *insn;
	pseudo_t new;

	new = ad->origval;
	if (0 && new)
		return new;

	insn = alloc_typed_instruction(C, OP_LOAD, ad->source_type);
	new = alloc_pseudo(C, insn);
	ad->origval = new;

	insn->target = new;
	insn->offset = ad->offset;
	use_pseudo(C, insn, ad->address, &insn->src);
	add_one_insn(C, ep, insn);
	return new;
}

static void add_store(struct dmr_C *C, struct entrypoint *ep, struct access_data *ad, pseudo_t value)
{
	struct basic_block *bb = ep->active;

	if (bb_reachable(bb)) {
		struct instruction *store = alloc_typed_instruction(C, OP_STORE, ad->source_type);
		store->offset = ad->offset;
		use_pseudo(C, store, value, &store->target);
		use_pseudo(C, store, ad->address, &store->src);
		add_one_insn(C, ep, store);
	}
}

static pseudo_t linearize_store_gen(struct dmr_C *C, struct entrypoint *ep,
		pseudo_t value,
		struct access_data *ad)
{
	pseudo_t store = value;

	if (type_size(ad->source_type) != type_size(ad->result_type)) {
		pseudo_t orig = add_load(C, ep, ad);
		int shift = ad->bit_offset;
		unsigned long long mask = (1ULL << ad->bit_size)-1;

		if (shift) {
			store = add_binary_op(C, ep, ad->source_type, OP_SHL, value, value_pseudo(C, shift));
			mask <<= shift;
		}
		orig = add_binary_op(C, ep, ad->source_type, OP_AND, orig, value_pseudo(C, ~mask));
		store = add_binary_op(C, ep, ad->source_type, OP_OR, orig, store);
	}
	add_store(C, ep, ad, store);
	return value;
}

static pseudo_t add_binary_op(struct dmr_C *C, struct entrypoint *ep, struct symbol *ctype, int op, pseudo_t left, pseudo_t right)
{
	struct instruction *insn = alloc_typed_instruction(C, op, ctype);
	pseudo_t target = alloc_pseudo(C, insn);
	insn->target = target;
	use_pseudo(C, insn, left, &insn->src1);
	use_pseudo(C, insn, right, &insn->src2);
	add_one_insn(C, ep, insn);
	return target;
}

static pseudo_t add_setval(struct dmr_C *C, struct entrypoint *ep, struct symbol *ctype, struct expression *val)
{
	struct instruction *insn = alloc_typed_instruction(C, OP_SETVAL, ctype);
	pseudo_t target = alloc_pseudo(C, insn);
	insn->target = target;
	insn->val = val;
	add_one_insn(C, ep, insn);
	return target;
}

static pseudo_t add_symbol_address(struct dmr_C *C, struct entrypoint *ep, struct symbol *sym)
{
	struct instruction *insn = alloc_instruction(C, OP_SYMADDR, C->target->bits_in_pointer);
	pseudo_t target = alloc_pseudo(C, insn);

	insn->target = target;
	use_pseudo(C, insn, symbol_pseudo(C, ep, sym), &insn->symbol);
	add_one_insn(C, ep, insn);
	return target;
}

static pseudo_t linearize_load_gen(struct dmr_C *C, struct entrypoint *ep, struct access_data *ad)
{
	pseudo_t new = add_load(C, ep, ad);

	if (ad->bit_offset) {
		pseudo_t shift = value_pseudo(C, ad->bit_offset);
		pseudo_t newval = add_binary_op(C, ep, ad->source_type, OP_LSR, new, shift);
		new = newval;
	}
		
	return new;
}

static pseudo_t linearize_access(struct dmr_C *C, struct entrypoint *ep, struct expression *expr)
{
	struct access_data ad = { NULL, };
	pseudo_t value;

	if (!linearize_address_gen(C, ep, expr, &ad))
		return VOID(C);
	value = linearize_load_gen(C, ep, &ad);
	finish_address_gen(ep, &ad);
	return value;
}

/* FIXME: FP */
static pseudo_t linearize_inc_dec(struct dmr_C *C, struct entrypoint *ep, struct expression *expr, int postop)
{
	struct access_data ad = { NULL, };
		pseudo_t old, new, one;
	int op = expr->op == SPECIAL_INCREMENT ? OP_ADD : OP_SUB;

	if (!linearize_address_gen(C, ep, expr->unop, &ad))
		return VOID(C);

	old = linearize_load_gen(C, ep, &ad);
	one = value_pseudo(C, expr->op_value);
	new = add_binary_op(C, ep, expr->ctype, op, old, one);
	linearize_store_gen(C, ep, new, &ad);
	finish_address_gen(ep, &ad);
	return postop ? old : new;
}

static pseudo_t add_uniop(struct dmr_C *C, struct entrypoint *ep, struct expression *expr, int op, pseudo_t src)
{
	struct instruction *insn = alloc_typed_instruction(C, op, expr->ctype);
	pseudo_t new = alloc_pseudo(C, insn);

	insn->target = new;
	use_pseudo(C, insn, src, &insn->src1);
	add_one_insn(C, ep, insn);
	return new;
}

static pseudo_t linearize_slice(struct dmr_C *C, struct entrypoint *ep, struct expression *expr)
{
	pseudo_t pre = linearize_expression(C, ep, expr->base);
	struct instruction *insn = alloc_typed_instruction(C, OP_SLICE, expr->ctype);
	pseudo_t new = alloc_pseudo(C, insn);

	insn->target = new;
	insn->from = expr->r_bitpos;
	insn->len = expr->r_nrbits;
	use_pseudo(C, insn, pre, &insn->base);
	add_one_insn(C, ep, insn);
	return new;
}

static pseudo_t linearize_regular_preop(struct dmr_C *C, struct entrypoint *ep, struct expression *expr)
{
	pseudo_t pre = linearize_expression(C, ep, expr->unop);
	switch (expr->op) {
	case '+':
		return pre;
	case '!': {
		pseudo_t zero = value_pseudo(C, 0);
		return add_binary_op(C, ep, expr->ctype, OP_SET_EQ, pre, zero);
	}
	case '~':
		return add_uniop(C, ep, expr, OP_NOT, pre);
	case '-':
		return add_uniop(C, ep, expr, OP_NEG, pre);
	}
	return VOID(C);
}

static pseudo_t linearize_preop(struct dmr_C *C, struct entrypoint *ep, struct expression *expr)
{
	/*
	 * '*' is an lvalue access, and is fundamentally different
	 * from an arithmetic operation. Maybe it should have an
	 * expression type of its own..
	 */
	if (expr->op == '*')
		return linearize_access(C, ep, expr);
	if (expr->op == SPECIAL_INCREMENT || expr->op == SPECIAL_DECREMENT)
		return linearize_inc_dec(C, ep, expr, 0);
	return linearize_regular_preop(C, ep, expr);
}

static pseudo_t linearize_postop(struct dmr_C *C, struct entrypoint *ep, struct expression *expr)
{
	return linearize_inc_dec(C, ep, expr, 1);
}	

/*
 * Casts to pointers are "less safe" than other casts, since
 * they imply type-unsafe accesses. "void *" is a special
 * case, since you can't access through it anyway without another
 * cast.
 */
static struct instruction *alloc_cast_instruction(struct dmr_C *C, struct symbol *src, struct symbol *ctype)
{
	int opcode = OP_CAST;
	struct symbol *base = src;

	if (base->ctype.modifiers & MOD_SIGNED)
		opcode = OP_SCAST;
	if (base->type == SYM_NODE)
		base = base->ctype.base_type;
	if (base->type == SYM_PTR) {
		base = base->ctype.base_type;
		if (base != &C->S->void_ctype)
			opcode = OP_PTRCAST;
	}
	if (base->ctype.base_type == &C->S->fp_type)
		opcode = OP_FPCAST;
	return alloc_typed_instruction(C, opcode, ctype);
}

static pseudo_t cast_pseudo(struct dmr_C *C, struct entrypoint *ep, pseudo_t src, struct symbol *from, struct symbol *to)
{
	pseudo_t result;
	struct instruction *insn;

	if (src == VOID(C))
		return VOID(C);
	if (!from || !to)
		return VOID(C);
	if (from->bit_size < 0 || to->bit_size < 0)
		return VOID(C);
	insn = alloc_cast_instruction(C, from, to);
	result = alloc_pseudo(C, insn);
	insn->target = result;
	insn->orig_type = from;
	use_pseudo(C, insn, src, &insn->src);
	add_one_insn(C, ep, insn);
	return result;
}

static int opcode_sign(struct dmr_C *C, int opcode, struct symbol *ctype)
{
	if (ctype && (ctype->ctype.modifiers & MOD_SIGNED)) {
		switch(opcode) {
		case OP_MULU: case OP_DIVU: case OP_MODU: case OP_LSR:
			opcode++;
		}
	}
	return opcode;
}

static pseudo_t linearize_assignment(struct dmr_C *C, struct entrypoint *ep, struct expression *expr)
{
	struct access_data ad = { NULL, };
	struct expression *target = expr->left;
	struct expression *src = expr->right;
	pseudo_t value;

	value = linearize_expression(C, ep, src);
	if (!target || !linearize_address_gen(C, ep, target, &ad))
		return value;
	if (expr->op != '=') {
		pseudo_t oldvalue = linearize_load_gen(C, ep, &ad);
		pseudo_t dst;
		static const int op_trans[] = {
			[SPECIAL_ADD_ASSIGN - SPECIAL_BASE] = OP_ADD,
			[SPECIAL_SUB_ASSIGN - SPECIAL_BASE] = OP_SUB,
			[SPECIAL_MUL_ASSIGN - SPECIAL_BASE] = OP_MULU,
			[SPECIAL_DIV_ASSIGN - SPECIAL_BASE] = OP_DIVU,
			[SPECIAL_MOD_ASSIGN - SPECIAL_BASE] = OP_MODU,
			[SPECIAL_SHL_ASSIGN - SPECIAL_BASE] = OP_SHL,
			[SPECIAL_SHR_ASSIGN - SPECIAL_BASE] = OP_LSR,
			[SPECIAL_AND_ASSIGN - SPECIAL_BASE] = OP_AND,
			[SPECIAL_OR_ASSIGN  - SPECIAL_BASE] = OP_OR,
			[SPECIAL_XOR_ASSIGN - SPECIAL_BASE] = OP_XOR
		};
		int opcode;

		if (!src)
			return VOID(C);

		oldvalue = cast_pseudo(C, ep, oldvalue, src->ctype, expr->ctype);
		opcode = opcode_sign(C, op_trans[expr->op - SPECIAL_BASE], src->ctype);
		dst = add_binary_op(C, ep, src->ctype, opcode, oldvalue, value);
		value = cast_pseudo(C, ep, dst, expr->ctype, src->ctype);
	}
	value = linearize_store_gen(C, ep, value, &ad);
	finish_address_gen(ep, &ad);
	return value;
}

static pseudo_t linearize_call_expression(struct dmr_C *C, struct entrypoint *ep, struct expression *expr)
{
	struct expression *arg, *fn;
	struct instruction *insn = alloc_typed_instruction(C, OP_CALL, expr->ctype);
	pseudo_t retval, call;
	struct ctype *ctype = NULL;
	struct symbol *fntype;
	struct context *context;

	if (!expr->ctype) {
		warning(C, expr->pos, "call with no type!");
		return VOID(C);
	}

	FOR_EACH_PTR(expr->args, arg) {
		pseudo_t new = linearize_expression(C, ep, arg);
		use_pseudo(C, insn, new, add_pseudo(&insn->arguments, new));
	} END_FOR_EACH_PTR(arg);

	fn = expr->fn;

	if (fn->ctype)
		ctype = &fn->ctype->ctype;

	fntype = fn->ctype;
	if (fntype) {
		if (fntype->type == SYM_NODE)
			fntype = fntype->ctype.base_type;
	}
	insn->fntype = fntype;

	if (fn->type == EXPR_PREOP) {
		if (fn->unop->type == EXPR_SYMBOL) {
			struct symbol *sym = fn->unop->symbol;
			if (sym->ctype.base_type->type == SYM_FN)
				fn = fn->unop;
		}
	}
	if (fn->type == EXPR_SYMBOL) {
		call = symbol_pseudo(C, ep, fn->symbol);
	} else {
		call = linearize_expression(C, ep, fn);
	}
	use_pseudo(C, insn, call, &insn->func);
	retval = VOID(C);
	if (expr->ctype != &C->S->void_ctype)
		retval = alloc_pseudo(C, insn);
	insn->target = retval;
	add_one_insn(C, ep, insn);

	if (ctype) {
		FOR_EACH_PTR(ctype->contexts, context) {
			int in = context->in;
			int out = context->out;
			int check = 0;
			int context_diff;
			if (in < 0) {
				check = 1;
				in = 0;
			}
			if (out < 0) {
				check = 0;
				out = 0;
			}
			context_diff = out - in;
			if (check || context_diff) {
				insn = alloc_instruction(C, OP_CONTEXT, 0);
				insn->increment = context_diff;
				insn->check = check;
				insn->context_expr = context->context_expr;
				add_one_insn(C, ep, insn);
			}
		} END_FOR_EACH_PTR(context);
	}

	return retval;
}

static pseudo_t linearize_binop(struct dmr_C *C, struct entrypoint *ep, struct expression *expr)
{
	pseudo_t src1, src2, dst;
	static const int opcode[] = {
		['+'] = OP_ADD, ['-'] = OP_SUB,
		['*'] = OP_MULU, ['/'] = OP_DIVU,
		['%'] = OP_MODU, ['&'] = OP_AND,
		['|'] = OP_OR,  ['^'] = OP_XOR,
		[SPECIAL_LEFTSHIFT] = OP_SHL,
		[SPECIAL_RIGHTSHIFT] = OP_LSR,
		[SPECIAL_LOGICAL_AND] = OP_AND_BOOL,
		[SPECIAL_LOGICAL_OR] = OP_OR_BOOL,
	};
	int op;

	src1 = linearize_expression(C, ep, expr->left);
	src2 = linearize_expression(C, ep, expr->right);
	op = opcode_sign(C, opcode[expr->op], expr->ctype);
	dst = add_binary_op(C, ep, expr->ctype, op, src1, src2);
	return dst;
}

static pseudo_t linearize_logical_branch(struct dmr_C *C, struct entrypoint *ep, struct expression *expr, struct basic_block *bb_true, struct basic_block *bb_false);

pseudo_t linearize_cond_branch(struct dmr_C *C, struct entrypoint *ep, struct expression *expr, struct basic_block *bb_true, struct basic_block *bb_false);

static pseudo_t linearize_select(struct dmr_C *C, struct entrypoint *ep, struct expression *expr)
{
	pseudo_t cond, true, false, res;
	struct instruction *insn;

	true = linearize_expression(C, ep, expr->cond_true);
	false = linearize_expression(C, ep, expr->cond_false);
	cond = linearize_expression(C, ep, expr->conditional);

	insn = alloc_typed_instruction(C, OP_SEL, expr->ctype);
	if (!expr->cond_true)
		true = cond;
	use_pseudo(C, insn, cond, &insn->src1);
	use_pseudo(C, insn, true, &insn->src2);
	use_pseudo(C, insn, false, &insn->src3);

	res = alloc_pseudo(C, insn);
	insn->target = res;
	add_one_insn(C, ep, insn);
	return res;
}

static pseudo_t add_join_conditional(struct dmr_C *C, struct entrypoint *ep, struct expression *expr,
				     pseudo_t phi1, pseudo_t phi2)
{
	pseudo_t target;
	struct instruction *phi_node;

	if (phi1 == VOID(C))
		return phi2;
	if (phi2 == VOID(C))
		return phi1;

	phi_node = alloc_typed_instruction(C, OP_PHI, expr->ctype);
	use_pseudo(C, phi_node, phi1, add_pseudo(&phi_node->phi_list, phi1));
	use_pseudo(C, phi_node, phi2, add_pseudo(&phi_node->phi_list, phi2));
	phi_node->target = target = alloc_pseudo(C, phi_node);
	add_one_insn(C, ep, phi_node);
	return target;
}	

static pseudo_t linearize_short_conditional(struct dmr_C *C, struct entrypoint *ep, struct expression *expr,
					    struct expression *cond,
					    struct expression *expr_false)
{
	pseudo_t src1, src2;
	struct basic_block *bb_false;
	struct basic_block *merge = alloc_basic_block(C, ep, expr->pos);
	pseudo_t phi1, phi2;
	int size = type_size(expr->ctype);

	if (!expr_false || !ep->active)
		return VOID(C);

	bb_false = alloc_basic_block(C, ep, expr_false->pos);
	src1 = linearize_expression(C, ep, cond);
	phi1 = alloc_phi(C, ep->active, src1, size);
	add_branch(C, ep, expr, src1, merge, bb_false);

	set_activeblock(C, ep, bb_false);
	src2 = linearize_expression(C, ep, expr_false);
	phi2 = alloc_phi(C, ep->active, src2, size);
	set_activeblock(C, ep, merge);

	return add_join_conditional(C, ep, expr, phi1, phi2);
}

static pseudo_t linearize_conditional(struct dmr_C *C, struct entrypoint *ep, struct expression *expr,
				      struct expression *cond,
				      struct expression *expr_true,
				      struct expression *expr_false)
{
	pseudo_t src1, src2;
	pseudo_t phi1, phi2;
	struct basic_block *bb_true, *bb_false, *merge;
	int size = type_size(expr->ctype);

	if (!cond || !expr_true || !expr_false || !ep->active)
		return VOID(C);
	bb_true = alloc_basic_block(C, ep, expr_true->pos);
	bb_false = alloc_basic_block(C, ep, expr_false->pos);
	merge = alloc_basic_block(C, ep, expr->pos);

	linearize_cond_branch(C, ep, cond, bb_true, bb_false);

	set_activeblock(C, ep, bb_true);
	src1 = linearize_expression(C, ep, expr_true);
	phi1 = alloc_phi(C, ep->active, src1, size);
	add_goto(C, ep, merge); 

	set_activeblock(C, ep, bb_false);
	src2 = linearize_expression(C, ep, expr_false);
	phi2 = alloc_phi(C, ep->active, src2, size);
	set_activeblock(C, ep, merge);

	return add_join_conditional(C, ep, expr, phi1, phi2);
}

static pseudo_t linearize_logical(struct dmr_C *C, struct entrypoint *ep, struct expression *expr)
{
	struct expression *shortcut;

	shortcut = alloc_const_expression(C, expr->pos, expr->op == SPECIAL_LOGICAL_OR);
	shortcut->ctype = expr->ctype;
	if (expr->op == SPECIAL_LOGICAL_OR)
		return linearize_conditional(C, ep, expr, expr->left, shortcut, expr->right);
	return linearize_conditional(C, ep, expr, expr->left, expr->right, shortcut);
}

static pseudo_t linearize_compare(struct dmr_C *C, struct entrypoint *ep, struct expression *expr)
{
	static const int cmpop[] = {
		['>'] = OP_SET_GT, ['<'] = OP_SET_LT,
		[SPECIAL_EQUAL] = OP_SET_EQ,
		[SPECIAL_NOTEQUAL] = OP_SET_NE,
		[SPECIAL_GTE] = OP_SET_GE,
		[SPECIAL_LTE] = OP_SET_LE,
		[SPECIAL_UNSIGNED_LT] = OP_SET_B,
		[SPECIAL_UNSIGNED_GT] = OP_SET_A,
		[SPECIAL_UNSIGNED_LTE] = OP_SET_BE,
		[SPECIAL_UNSIGNED_GTE] = OP_SET_AE,
	};

	pseudo_t src1 = linearize_expression(C, ep, expr->left);
	pseudo_t src2 = linearize_expression(C, ep, expr->right);
	pseudo_t dst = add_binary_op(C, ep, expr->ctype, cmpop[expr->op], src1, src2);
	return dst;
}


pseudo_t linearize_cond_branch(struct dmr_C *C, struct entrypoint *ep, struct expression *expr, struct basic_block *bb_true, struct basic_block *bb_false)
{
	pseudo_t cond;

	if (!expr || !bb_reachable(ep->active))
		return VOID(C);

	switch (expr->type) {

	case EXPR_STRING:
	case EXPR_VALUE:
		add_goto(C, ep, expr->value ? bb_true : bb_false);
		return VOID(C);

	case EXPR_FVALUE:
		add_goto(C, ep, expr->fvalue ? bb_true : bb_false);
		return VOID(C);
		
	case EXPR_LOGICAL:
		linearize_logical_branch(C, ep, expr, bb_true, bb_false);
		return VOID(C);

	case EXPR_COMPARE:
		cond = linearize_compare(C, ep, expr);
		add_branch(C, ep, expr, cond, bb_true, bb_false);
		break;
		
	case EXPR_PREOP:
		if (expr->op == '!')
			return linearize_cond_branch(C, ep, expr->unop, bb_false, bb_true);
		/* fall through */
	default: {
		cond = linearize_expression(C, ep, expr);
		add_branch(C, ep, expr, cond, bb_true, bb_false);

		return VOID(C);
	}
	}
	return VOID(C);
}


	
static pseudo_t linearize_logical_branch(struct dmr_C *C, struct entrypoint *ep, struct expression *expr, struct basic_block *bb_true, struct basic_block *bb_false)
{
	struct basic_block *next = alloc_basic_block(C, ep, expr->pos);

	if (expr->op == SPECIAL_LOGICAL_OR)
		linearize_cond_branch(C, ep, expr->left, bb_true, next);
	else
		linearize_cond_branch(C, ep, expr->left, next, bb_false);
	set_activeblock(C, ep, next);
	linearize_cond_branch(C, ep, expr->right, bb_true, bb_false);
	return VOID(C);
}

static pseudo_t linearize_cast(struct dmr_C *C, struct entrypoint *ep, struct expression *expr)
{
	pseudo_t src;
	struct expression *orig = expr->cast_expression;

	if (!orig)
		return VOID(C);

	src = linearize_expression(C, ep, orig);
	return cast_pseudo(C, ep, src, orig->ctype, expr->ctype);
}

static pseudo_t linearize_position(struct dmr_C *C, struct entrypoint *ep, struct expression *pos, struct access_data *ad)
{
	struct expression *init_expr = pos->init_expr;

	ad->offset = pos->init_offset;
	ad->source_type = base_type(C, init_expr->ctype);
	ad->result_type = init_expr->ctype;
	return linearize_initializer(C, ep, init_expr, ad);
}

static pseudo_t linearize_initializer(struct dmr_C *C, struct entrypoint *ep, struct expression *initializer, struct access_data *ad)
{
	switch (initializer->type) {
	case EXPR_INITIALIZER: {
		struct expression *expr;
		FOR_EACH_PTR(initializer->expr_list, expr) {
			linearize_initializer(C, ep, expr, ad);
		} END_FOR_EACH_PTR(expr);
		break;
	}
	case EXPR_POS:
		linearize_position(C, ep, initializer, ad);
		break;
	default: {
		pseudo_t value = linearize_expression(C, ep, initializer);
		ad->source_type = base_type(C, initializer->ctype);
		ad->result_type = initializer->ctype;
		linearize_store_gen(C, ep, value, ad);
		return value;
	}
	}

	return VOID(C);
}

static void linearize_argument(struct dmr_C *C, struct entrypoint *ep, struct symbol *arg, int nr)
{
	struct access_data ad = { NULL, };

	ad.source_type = arg;
	ad.result_type = arg;
	ad.address = symbol_pseudo(C, ep, arg);
	linearize_store_gen(C, ep, argument_pseudo(C, ep, nr), &ad);
	finish_address_gen(ep, &ad);
}

pseudo_t linearize_expression(struct dmr_C *C, struct entrypoint *ep, struct expression *expr)
{
	if (!expr)
		return VOID(C);

	C->L->current_pos = expr->pos;
	switch (expr->type) {
	case EXPR_SYMBOL:
		linearize_one_symbol(C, ep, expr->symbol);
		return add_symbol_address(C, ep, expr->symbol);

	case EXPR_VALUE:
		return value_pseudo(C, expr->value);

	case EXPR_STRING: case EXPR_FVALUE: case EXPR_LABEL:
		return add_setval(C, ep, expr->ctype, expr);

	case EXPR_STATEMENT:
		return linearize_statement(C, ep, expr->statement);

	case EXPR_CALL:
		return linearize_call_expression(C, ep, expr);

	case EXPR_BINOP:
		return linearize_binop(C, ep, expr);

	case EXPR_LOGICAL:
		return linearize_logical(C, ep, expr);

	case EXPR_COMPARE:
		return  linearize_compare(C, ep, expr);

	case EXPR_SELECT:
		return	linearize_select(C, ep, expr);

	case EXPR_CONDITIONAL:
		if (!expr->cond_true)
			return linearize_short_conditional(C, ep, expr, expr->conditional, expr->cond_false);

		return  linearize_conditional(C, ep, expr, expr->conditional,
					      expr->cond_true, expr->cond_false);

	case EXPR_COMMA:
		linearize_expression(C, ep, expr->left);
		return linearize_expression(C, ep, expr->right);

	case EXPR_ASSIGNMENT:
		return linearize_assignment(C, ep, expr);

	case EXPR_PREOP:
		return linearize_preop(C, ep, expr);

	case EXPR_POSTOP:
		return linearize_postop(C, ep, expr);

	case EXPR_CAST:
	case EXPR_FORCE_CAST:
	case EXPR_IMPLIED_CAST:
		return linearize_cast(C, ep, expr);
	
	case EXPR_SLICE:
		return linearize_slice(C, ep, expr);

	case EXPR_INITIALIZER:
	case EXPR_POS:
		warning(C, expr->pos, "unexpected initializer expression (%d %d)", expr->type, expr->op);
		return VOID(C);
	default: 
		warning(C, expr->pos, "unknown expression (%d %d)", expr->type, expr->op);
		return VOID(C);
	}
	return VOID(C);
}

static pseudo_t linearize_one_symbol(struct dmr_C *C, struct entrypoint *ep, struct symbol *sym)
{
	struct access_data ad = { NULL, };
	pseudo_t value;

	if (!sym || !sym->initializer || sym->initialized)
		return VOID(C);

	/* We need to output these puppies some day too.. */
	if (sym->ctype.modifiers & (MOD_STATIC | MOD_TOPLEVEL))
		return VOID(C);

	sym->initialized = 1;
	ad.address = symbol_pseudo(C, ep, sym);
	value = linearize_initializer(C, ep, sym->initializer, &ad);
	finish_address_gen(C, ep, &ad);
	return value;
}

static pseudo_t linearize_compound_statement(struct dmr_C *C, struct entrypoint *ep, struct statement *stmt)
{
	pseudo_t pseudo;
	struct statement *s;
	struct symbol *ret = stmt->ret;

	pseudo = VOID(C);
	FOR_EACH_PTR(stmt->stmts, s) {
		pseudo = linearize_statement(C, ep, s);
	} END_FOR_EACH_PTR(s);

	if (ret) {
		struct basic_block *bb = add_label(C, ep, ret);
		struct instruction *phi_node = first_instruction(bb->insns);

		if (!phi_node)
			return pseudo;

		if (pseudo_list_size(phi_node->phi_list)==1) {
			pseudo = first_pseudo(phi_node->phi_list);
			assert(pseudo->type == PSEUDO_PHI);
			return pseudo->def->src1;
		}
		return phi_node->target;
	}

	return pseudo;
}

static pseudo_t linearize_inlined_call(struct dmr_C *C, struct entrypoint *ep, struct statement *stmt)
{
	struct instruction *insn = alloc_instruction(C, OP_INLINED_CALL, 0);
	struct statement *args = stmt->args;
	struct basic_block *bb;
	pseudo_t pseudo;

	if (args) {
		struct symbol *sym;

		concat_symbol_list(args->declaration, &ep->syms);
		FOR_EACH_PTR(args->declaration, sym) {
			pseudo_t value = linearize_one_symbol(C, ep, sym);
			use_pseudo(C, insn, value, add_pseudo(&insn->arguments, value));
		} END_FOR_EACH_PTR(sym);
	}

	insn->target = pseudo = linearize_compound_statement(C, ep, stmt);
	use_pseudo(C, insn, symbol_pseudo(C, ep, stmt->inline_fn), &insn->func);
	bb = ep->active;
	if (bb && !bb->insns)
		bb->pos = stmt->pos;
	add_one_insn(C, ep, insn);
	return pseudo;
}

static pseudo_t linearize_context(struct dmr_C *C, struct entrypoint *ep, struct statement *stmt)
{
	struct instruction *insn = alloc_instruction(C, OP_CONTEXT, 0);
	struct expression *expr = stmt->expression;
	int value = 0;

	if (expr->type == EXPR_VALUE)
		value = (int) expr->value;

	insn->increment = value;
	insn->context_expr = stmt->context;
	add_one_insn(C, ep, insn);
	return VOID(C);
}

static pseudo_t linearize_range(struct dmr_C *C, struct entrypoint *ep, struct statement *stmt)
{
	struct instruction *insn = alloc_instruction(C, OP_RANGE, 0);

	use_pseudo(C, insn, linearize_expression(C, ep, stmt->range_expression), &insn->src1);
	use_pseudo(C, insn, linearize_expression(C, ep, stmt->range_low), &insn->src2);
	use_pseudo(C, insn, linearize_expression(C, ep, stmt->range_high), &insn->src3);
	add_one_insn(C, ep, insn);
	return VOID(C);
}

static void add_asm_input(struct dmr_C *C, struct entrypoint *ep, struct instruction *insn, struct expression *expr,
	const char *constraint, const struct ident *ident)
{
	pseudo_t pseudo = linearize_expression(C, ep, expr);
	struct asm_constraint *rule = (struct asm_constraint *)allocator_allocate(&C->L->asm_constraint_allocator, 0);

	rule->ident = ident;
	rule->constraint = constraint;
	use_pseudo(C, insn, pseudo, &rule->pseudo);
	ptrlist_add(&insn->asm_rules->inputs, rule);
}

static void add_asm_output(struct dmr_C *C, struct entrypoint *ep, struct instruction *insn, struct expression *expr,
	const char *constraint, const struct ident *ident)
{
	struct access_data ad = { NULL, };
	pseudo_t pseudo = alloc_pseudo(C, insn);
	struct asm_constraint *rule;

	if (!expr || !linearize_address_gen(C, ep, expr, &ad))
		return;
	linearize_store_gen(C, ep, pseudo, &ad);
	finish_address_gen(C, ep, &ad);
	rule = (struct asm_constraint *) allocator_allocate(&C->L->asm_constraint_allocator, 0);
	rule->ident = ident;
	rule->constraint = constraint;
	use_pseudo(C, insn, pseudo, &rule->pseudo);
	ptrlist_add(&insn->asm_rules->outputs, rule);
}

static pseudo_t linearize_asm_statement(struct dmr_C *C, struct entrypoint *ep, struct statement *stmt)
{
	int state;
	struct expression *expr;
	struct instruction *insn;
	struct asm_rules *rules;
	const char *constraint;
	struct ident *ident;

	insn = alloc_instruction(C, OP_ASM, 0);
	expr = stmt->asm_string;
	if (!expr || expr->type != EXPR_STRING) {
		warning(C, stmt->pos, "expected string in inline asm");
		return VOID(C);
	}
	insn->string = expr->string->data;

	rules = (struct asm_rules *) allocator_allocate(&C->L->asm_rules_allocator, 0);
	insn->asm_rules = rules;

	/* Gather the inputs.. */
	state = 0;
	ident = NULL;
	constraint = NULL;
	FOR_EACH_PTR(stmt->asm_inputs, expr) {
		switch (state) {
		case 0:	/* Identifier */
			state = 1;
			ident = (struct ident *)expr;
			continue;

		case 1:	/* Constraint */
			state = 2;
			constraint = expr ? expr->string->data : "";
			continue;

		case 2:	/* Expression */
			state = 0;
			add_asm_input(C, ep, insn, expr, constraint, ident);
		}
	} END_FOR_EACH_PTR(expr);

	add_one_insn(C, ep, insn);

	/* Assign the outputs */
	state = 0;
	ident = NULL;
	constraint = NULL;
	FOR_EACH_PTR(stmt->asm_outputs, expr) {
		switch (state) {
		case 0:	/* Identifier */
			state = 1;
			ident = (struct ident *)expr;
			continue;

		case 1:	/* Constraint */
			state = 2;
			constraint = expr ? expr->string->data : "";
			continue;

		case 2:
			state = 0;
			add_asm_output(C, ep, insn, expr, constraint, ident);
		}
	} END_FOR_EACH_PTR(expr);

	return VOID(C);
}

static int multijmp_cmp(void *ud, const void *_a, const void *_b)
{
	const struct multijmp *a = (const struct multijmp *)_a;
	const struct multijmp *b = (const struct multijmp *)_b;

	// "default" case?
	if (a->begin > a->end) {
		if (b->begin > b->end)
			return 0;
		return 1;
	}
	if (b->begin > b->end)
		return -1;
	if (a->begin == b->begin) {
		if (a->end == b->end)
			return 0;
		return (a->end < b->end) ? -1 : 1;
	}
	return a->begin < b->begin ? -1 : 1;
}

static void sort_switch_cases(struct dmr_C *C, struct instruction *insn)
{
	ptrlist_sort(&insn->multijmp_list, C, multijmp_cmp);
}

static pseudo_t linearize_declaration(struct dmr_C *C, struct entrypoint *ep, struct statement *stmt)
{
	struct symbol *sym;

	concat_symbol_list(stmt->declaration, &ep->syms);

	FOR_EACH_PTR(stmt->declaration, sym) {
		linearize_one_symbol(C, ep, sym);
	} END_FOR_EACH_PTR(sym);
	return VOID(C);
}

static pseudo_t linearize_return(struct dmr_C *C, struct entrypoint *ep, struct statement *stmt)
{
	struct expression *expr = stmt->expression;
	struct basic_block *bb_return = get_bound_block(C, ep, stmt->ret_target);
	struct basic_block *active;
	pseudo_t src = linearize_expression(C, ep, expr);
	active = ep->active;
	if (active && src != VOID(C)) {
		struct instruction *phi_node = first_instruction(bb_return->insns);
		pseudo_t phi;
		if (!phi_node) {
			phi_node = alloc_typed_instruction(C, OP_PHI, expr->ctype);
			phi_node->target = alloc_pseudo(C, phi_node);
			phi_node->bb = bb_return;
			add_instruction(&bb_return->insns, phi_node);
		}
		phi = alloc_phi(C, active, src, type_size(expr->ctype));
		phi->ident = C->S->return_ident;
		use_pseudo(C, phi_node, phi, add_pseudo(&phi_node->phi_list, phi));
	}
	add_goto(C, ep, bb_return);
	return VOID(C);
}

static pseudo_t linearize_switch(struct dmr_C *C, struct entrypoint *ep, struct statement *stmt)
{
	struct symbol *sym;
	struct instruction *switch_ins;
	struct basic_block *switch_end = alloc_basic_block(C, ep, stmt->pos);
	struct basic_block *active, *default_case;
	struct multijmp *jmp;
	pseudo_t pseudo;

	pseudo = linearize_expression(C, ep, stmt->switch_expression);

	active = ep->active;
	if (!bb_reachable(active))
		return VOID(C);

	switch_ins = alloc_instruction(C, OP_SWITCH, 0);
	use_pseudo(C, switch_ins, pseudo, &switch_ins->cond);
	add_one_insn(C, ep, switch_ins);
	finish_block(ep);

	default_case = NULL;
	FOR_EACH_PTR(stmt->switch_case->symbol_list, sym) {
		struct statement *case_stmt = sym->stmt;
		struct basic_block *bb_case = get_bound_block(C, ep, sym);

		if (!case_stmt->case_expression) {
			default_case = bb_case;
			continue;
		} else {
			int begin, end;

			begin = end = (int) case_stmt->case_expression->value;
			if (case_stmt->case_to)
				end = (int) case_stmt->case_to->value;
			if (begin > end)
				jmp = alloc_multijmp(C, bb_case, end, begin);
			else
				jmp = alloc_multijmp(C, bb_case, begin, end);

		}
		add_multijmp(&switch_ins->multijmp_list, jmp);
		add_bb(&bb_case->parents, active);
		add_bb(&active->children, bb_case);
	} END_FOR_EACH_PTR(sym);

	bind_label(C, stmt->switch_break, switch_end, stmt->pos);

	/* And linearize the actual statement */
	linearize_statement(C, ep, stmt->switch_statement);
	set_activeblock(C, ep, switch_end);

	if (!default_case)
		default_case = switch_end;

	jmp = alloc_multijmp(C, default_case, 1, 0);
	add_multijmp(&switch_ins->multijmp_list, jmp);
	add_bb(&default_case->parents, active);
	add_bb(&active->children, default_case);
	sort_switch_cases(C, switch_ins);

	return VOID(C);
}

static pseudo_t linearize_iterator(struct dmr_C *C, struct entrypoint *ep, struct statement *stmt)
{
	struct statement  *pre_statement = stmt->iterator_pre_statement;
	struct expression *pre_condition = stmt->iterator_pre_condition;
	struct statement  *statement = stmt->iterator_statement;
	struct statement  *post_statement = stmt->iterator_post_statement;
	struct expression *post_condition = stmt->iterator_post_condition;
	struct basic_block *loop_top, *loop_body, *loop_continue, *loop_end;

	concat_symbol_list(stmt->iterator_syms, &ep->syms);
	linearize_statement(C, ep, pre_statement);

	loop_body = loop_top = alloc_basic_block(C, ep, stmt->pos);
	loop_continue = alloc_basic_block(C, ep, stmt->pos);
	loop_end = alloc_basic_block(C, ep, stmt->pos);

	/* An empty post-condition means that it's the same as the pre-condition */
	if (!post_condition) {
		loop_top = alloc_basic_block(C, ep, stmt->pos);
		set_activeblock(C, ep, loop_top);
	}

	if (pre_condition)
			linearize_cond_branch(C, ep, pre_condition, loop_body, loop_end);

	bind_label(C, stmt->iterator_continue, loop_continue, stmt->pos);
	bind_label(C, stmt->iterator_break, loop_end, stmt->pos);

	set_activeblock(C, ep, loop_body);
	linearize_statement(C, ep, statement);
	add_goto(C, ep, loop_continue);

	set_activeblock(C, ep, loop_continue);
	linearize_statement(C, ep, post_statement);
	if (!post_condition)
		add_goto(C, ep, loop_top);
	else
		linearize_cond_branch(C, ep, post_condition, loop_top, loop_end);
	set_activeblock(C, ep, loop_end);

	return VOID(C);
}

pseudo_t linearize_statement(struct dmr_C *C, struct entrypoint *ep, struct statement *stmt)
{
	struct basic_block *bb;

	if (!stmt)
		return VOID(C);

	bb = ep->active;
	if (bb && !bb->insns)
		bb->pos = stmt->pos;
	C->L->current_pos = stmt->pos;

	switch (stmt->type) {
	case STMT_NONE:
		break;

	case STMT_DECLARATION:
		return linearize_declaration(C, ep, stmt);

	case STMT_CONTEXT:
		return linearize_context(C, ep, stmt);

	case STMT_RANGE:
		return linearize_range(C, ep, stmt);

	case STMT_EXPRESSION:
		return linearize_expression(C, ep, stmt->expression);

	case STMT_ASM:
		return linearize_asm_statement(C, ep, stmt);

	case STMT_RETURN:
		return linearize_return(C, ep, stmt);

	case STMT_CASE: {
		add_label(C, ep, stmt->case_label);
		linearize_statement(C, ep, stmt->case_statement);
		break;
	}

	case STMT_LABEL: {
		struct symbol *label = stmt->label_identifier;

		if (label->used) {
			add_label(C, ep, label);
			linearize_statement(C, ep, stmt->label_statement);
		}
		break;
	}

	case STMT_GOTO: {
		struct symbol *sym;
		struct expression *expr;
		struct instruction *goto_ins;
		struct basic_block *active;
		pseudo_t pseudo;

		active = ep->active;
		if (!bb_reachable(active))
			break;

		if (stmt->goto_label) {
			add_goto(C, ep, get_bound_block(C, ep, stmt->goto_label));
			break;
		}

		expr = stmt->goto_expression;
		if (!expr)
			break;

		/* This can happen as part of simplification */
		if (expr->type == EXPR_LABEL) {
			add_goto(C, ep, get_bound_block(C, ep, expr->label_symbol));
			break;
		}

		pseudo = linearize_expression(C, ep, expr);
		goto_ins = alloc_instruction(C, OP_COMPUTEDGOTO, 0);
		use_pseudo(C, goto_ins, pseudo, &goto_ins->target);
		add_one_insn(C, ep, goto_ins);

		FOR_EACH_PTR(stmt->target_list, sym) {
			struct basic_block *bb_computed = get_bound_block(C, ep, sym);
			struct multijmp *jmp = alloc_multijmp(C, bb_computed, 1, 0);
			add_multijmp(&goto_ins->multijmp_list, jmp);
			add_bb(&bb_computed->parents, ep->active);
			add_bb(&active->children, bb_computed);
		} END_FOR_EACH_PTR(sym);

		finish_block(ep);
		break;
	}

	case STMT_COMPOUND:
		if (stmt->inline_fn)
			return linearize_inlined_call(C, ep, stmt);
		return linearize_compound_statement(C, ep, stmt);

	/*
	 * This could take 'likely/unlikely' into account, and
	 * switch the arms around appropriately..
	 */
	case STMT_IF: {
		struct basic_block *bb_true, *bb_false, *endif;
 		struct expression *cond = stmt->if_conditional;

		bb_true = alloc_basic_block(C, ep, stmt->pos);
		bb_false = endif = alloc_basic_block(C, ep, stmt->pos);

 		linearize_cond_branch(C, ep, cond, bb_true, bb_false);

		set_activeblock(C, ep, bb_true);
 		linearize_statement(C, ep, stmt->if_true);
 
 		if (stmt->if_false) {
			endif = alloc_basic_block(C, ep, stmt->pos);
			add_goto(C, ep, endif);
			set_activeblock(C, ep, bb_false);
 			linearize_statement(C, ep, stmt->if_false);
		}
		set_activeblock(C, ep, endif);
		break;
	}

	case STMT_SWITCH:
		return linearize_switch(C, ep, stmt);

	case STMT_ITERATOR:
		return linearize_iterator(C, ep, stmt);

	default:
		break;
	}
	return VOID(C);
}

static struct entrypoint *linearize_fn(struct dmr_C *C, struct symbol *sym, struct symbol *base_type)
{
	struct entrypoint *ep;
	struct basic_block *bb;
	struct symbol *arg;
	struct instruction *entry;
	pseudo_t result;
	int i;

	if (!base_type->stmt)
		return NULL;

	ep = alloc_entrypoint(C);
	bb = alloc_basic_block(C, ep, sym->pos);
	
	ep->name = sym;
	sym->ep = ep;
	set_activeblock(C, ep, bb);

	entry = alloc_instruction(C, OP_ENTRY, 0);
	add_one_insn(C, ep, entry);
	ep->entry = entry;

	concat_symbol_list(base_type->arguments, &ep->syms);

	/* FIXME!! We should do something else about varargs.. */
	i = 0;
	FOR_EACH_PTR(base_type->arguments, arg) {
		linearize_argument(C, ep, arg, ++i);
	} END_FOR_EACH_PTR(arg);

	result = linearize_statement(C, ep, base_type->stmt);
	if (bb_reachable(ep->active) && !bb_terminated(ep->active)) {
		struct symbol *ret_type = base_type->ctype.base_type;
		struct instruction *insn = alloc_typed_instruction(C, OP_RET, ret_type);

		if (type_size(ret_type) > 0)
			use_pseudo(C, insn, result, &insn->src);
		add_one_insn(C, ep, insn);
	}

	/*
	 * Do trivial flow simplification - branches to
	 * branches, kill dead basicblocks etc
	 */
	kill_unreachable_bbs(C, ep);

	/*
	 * Turn symbols into pseudos
	 */
	simplify_symbol_usage(C, ep);

repeat:
	/*
	 * Remove trivial instructions, and try to CSE
	 * the rest.
	 */
	do {
		cleanup_and_cse(ep);
		pack_basic_blocks(C, ep);
	} while (C->L->repeat_phase & REPEAT_CSE);

	kill_unreachable_bbs(C, ep);
	vrfy_flow(ep);

	/* Cleanup */
	clear_symbol_pseudos(ep);

	/* And track pseudo register usage */
	track_pseudo_liveness(ep);

	/*
	 * Some flow optimizations can only effectively
	 * be done when we've done liveness analysis. But
	 * if they trigger, we need to start all over
	 * again
	 */
	if (simplify_flow(C, ep)) {
		clear_liveness(ep);
		goto repeat;
	}

	/* Finally, add deathnotes to pseudos now that we have them */
	if (C->dbg_dead)
		track_pseudo_death(ep);

	return ep;
}

struct entrypoint *linearize_symbol(struct dmr_C *C, struct symbol *sym)
{
	struct symbol *base_type;

	if (!sym)
		return NULL;
	C->L->current_pos = sym->pos;
	base_type = sym->ctype.base_type;
	if (!base_type)
		return NULL;
	if (base_type->type == SYM_FN)
		return linearize_fn(C, sym, base_type);
	return NULL;
}


void init_linearizer(struct dmr_C *C) {
	struct linearizer_state_t *L = (struct linearizer_state_t *)calloc(1, sizeof(struct linearizer_state_t));
	allocator_init(&L->asm_rules_allocator, "asm rules", sizeof(struct asm_rules),
		__alignof__(struct asm_rules), CHUNK);
	allocator_init(&L->pseudo_allocator, "pseudos", sizeof(struct pseudo),
		__alignof__(struct pseudo), CHUNK);
	allocator_init(&L->pseudo_user_allocator, "pseudo_users", sizeof(struct pseudo_user),
		__alignof__(struct pseudo_user), CHUNK);
	allocator_init(&L->asm_constraint_allocator, "asm_constraints", sizeof(struct asm_constraint),
		__alignof__(struct asm_constraint), CHUNK);
	allocator_init(&L->multijmp_allocator, "multijmps", sizeof(struct multijmp),
		__alignof__(struct multijmp), CHUNK);
	allocator_init(&L->basic_block_allocator, "basic_blocks", sizeof(struct basic_block),
		__alignof__(struct basic_block), CHUNK);
	allocator_init(&L->entrypoint_allocator, "entrypoints", sizeof(struct entrypoint),
		__alignof__(struct entrypoint), CHUNK);
	allocator_init(&L->instruction_allocator, "instructions", sizeof(struct instruction),
		__alignof__(struct instruction), CHUNK);
	C->L = L;
}

void destroy_linearizer(struct dmr_C *C) {
	struct linearizer_state_t *L = C->L;
	assert(L);
	allocator_destroy(&L->asm_rules_allocator);
	allocator_destroy(&L->pseudo_allocator);
	allocator_destroy(&L->pseudo_user_allocator);
	allocator_destroy(&L->asm_constraint_allocator);
	allocator_destroy(&L->multijmp_allocator);
	allocator_destroy(&L->basic_block_allocator);
	allocator_destroy(&L->entrypoint_allocator);
	allocator_destroy(&L->instruction_allocator);
	free(L);
	C->L = NULL;
}