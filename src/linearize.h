#ifndef DMR_C_LINEARIZE_H
#define DMR_C_LINEARIZE_H

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

#include <dmr_c.h>
#include <allocate.h>
#include <token.h>
#include <parse.h>
#include <symbol.h>

struct instruction;

struct pseudo_user {
	struct instruction *insn;
	pseudo_t *userp;
};

enum pseudo_type {
	PSEUDO_VOID,
	PSEUDO_REG,
	PSEUDO_SYM,
	PSEUDO_VAL,
	PSEUDO_ARG,
	PSEUDO_PHI,
};

struct pseudo {
	int nr;
	enum pseudo_type type;
	struct ptr_list *users; /* pseudo_user list */
	struct ident *ident;
	union {
		struct symbol *sym;
		struct instruction *def;
		long long value;
	};
	void *priv;
};

struct linearizer_state_t {
	struct allocator pseudo_allocator;
	struct allocator pseudo_user_allocator;
	struct allocator asm_constraint_allocator;
	struct allocator asm_rules_allocator;
	struct allocator multijmp_allocator;
	struct allocator basic_block_allocator;
	struct allocator entrypoint_allocator;
	struct allocator instruction_allocator;

	struct pseudo void_pseudo;
	struct position current_pos;

	int repeat_phase;
	unsigned long bb_generation;
	int liveness_changed;

	struct ptr_list **live_list;
	struct ptr_list *dead_list;


#define MAX_VAL_HASH 64
	struct ptr_list *prev[MAX_VAL_HASH];
	int nr;
	char buffer[4096];
	int n;
	char pseudo_buffer[4][64];
#define INSN_HASH_SIZE 256
	struct instruction_list *insn_hash_table[INSN_HASH_SIZE];
};

#define VOID(C) (&C->L->void_pseudo)

struct multijmp {
	struct basic_block *target;
	int begin, end;
};

struct asm_constraint {
	pseudo_t pseudo;
	const char *constraint;
	const struct ident *ident;
};

struct asm_rules {
	struct ptr_list *inputs; /* list of asm_constraint */
	struct ptr_list *outputs; /* list of asm_constraint */
	struct ptr_list *clobbers; /* list of asm_constraint */
};

struct instruction {
	unsigned opcode:8,
		 size:24;
	struct basic_block *bb;
	struct position pos;
	struct symbol *type;
	union {
		pseudo_t target;
		pseudo_t cond;		/* for branch and switch */
	};
	union {
		struct /* entrypoint */ {
			struct ptr_list *arg_list; /* pseudo list */
		};
		struct /* branch */ {
			struct basic_block *bb_true, *bb_false;
		};
		struct /* switch */ {
			struct ptr_list *multijmp_list;
		};
		struct /* phi_node */ {
			struct ptr_list *phi_list; /* pseudo list */
		};
		struct /* phi source */ {
			pseudo_t phi_src;
			struct ptr_list *phi_users; /* instruction list */
		};
		struct /* unops */ {
			pseudo_t src;
			struct symbol *orig_type;	/* casts */
			unsigned int offset;		/* memops */
		};
		struct /* binops and sel */ {
			pseudo_t src1, src2, src3;
		};
		struct /* slice */ {
			pseudo_t base;
			unsigned from, len;
		};
		struct /* multijump */ {
			int begin, end;
		};
		struct /* setval */ {
			pseudo_t symbol;		/* Subtle: same offset as "src" !! */
			struct expression *val;
		};
		struct /* call */ {
			pseudo_t func;
			struct ptr_list *arguments; /* pseudo list */
			struct symbol *fntype;
		};
		struct /* context */ {
			int increment;
			int check;
			struct expression *context_expr;
		};
		struct /* asm */ {
			const char *string;
			struct asm_rules *asm_rules;
		};
	};
};

enum opcode {
	OP_BADOP,

	/* Entry */
	OP_ENTRY,

	/* Terminator */
	OP_TERMINATOR,
	OP_RET = OP_TERMINATOR,
	OP_BR,
	OP_SWITCH,
	OP_INVOKE,
	OP_COMPUTEDGOTO,
	OP_UNWIND,
	OP_TERMINATOR_END = OP_UNWIND,
	
	/* Binary */
	OP_BINARY,
	OP_ADD = OP_BINARY,
	OP_SUB,
	OP_MULU, OP_MULS,
	OP_DIVU, OP_DIVS,
	OP_MODU, OP_MODS,
	OP_SHL,
	OP_LSR, OP_ASR,
	
	/* Logical */
	OP_AND,
	OP_OR,
	OP_XOR,
	OP_AND_BOOL,
	OP_OR_BOOL,
	OP_BINARY_END = OP_OR_BOOL,

	/* Binary comparison */
	OP_BINCMP,
	OP_SET_EQ = OP_BINCMP,
	OP_SET_NE,
	OP_SET_LE,
	OP_SET_GE,
	OP_SET_LT,
	OP_SET_GT,
	OP_SET_B,
	OP_SET_A,
	OP_SET_BE,
	OP_SET_AE,
	OP_BINCMP_END = OP_SET_AE,

	/* Uni */
	OP_NOT,
	OP_NEG,

	/* Select - three input values */
	OP_SEL,
	
	/* Memory */
	OP_MALLOC,
	OP_FREE,
	OP_ALLOCA,
	OP_LOAD,
	OP_STORE,
	OP_SETVAL,
	OP_SYMADDR,
	OP_GET_ELEMENT_PTR,

	/* Other */
	OP_PHI,
	OP_PHISOURCE,
	OP_CAST,
	OP_SCAST,
	OP_FPCAST,
	OP_PTRCAST,
	OP_INLINED_CALL,
	OP_CALL,
	OP_VANEXT,
	OP_VAARG,
	OP_SLICE,
	OP_SNOP,
	OP_LNOP,
	OP_NOP,
	OP_DEATHNOTE,
	OP_ASM,

	/* Sparse tagging (line numbers, context, whatever) */
	OP_CONTEXT,
	OP_RANGE,

	/* Needed to translate SSA back to normal form */
	OP_COPY,
};

struct basic_block {
	struct position pos;
	unsigned long generation;
	int context;
	struct entrypoint *ep;
	struct ptr_list *parents; /* basic_block sources */
	struct ptr_list *children; /* basic_block destinations */
	struct ptr_list *insns;	/* Linear list of instructions */
	struct ptr_list *needs, *defines; /* pseudo lists */
	void *priv;
};

static inline int instruction_list_size(struct ptr_list *list)
{
	return ptrlist_size(list);
}

static inline int pseudo_list_size(struct ptr_list *list)
{
	return ptrlist_size(list);
}

static inline int bb_list_size(struct ptr_list *list)
{
	return ptrlist_size(list);
}

static inline void free_instruction_list(struct ptr_list **head)
{
	ptrlist_remove_all(head);
}

static inline struct instruction * delete_last_instruction(struct ptr_list **head)
{
	return (struct instruction *) ptrlist_undo_last(head);
}

static inline struct basic_block * delete_last_basic_block(struct ptr_list **head)
{
	return (struct basic_block *) ptrlist_delete_last(head);
}

static inline struct basic_block *first_basic_block(struct ptr_list *head)
{
	return (struct basic_block *) ptrlist_first(head);
}
static inline struct instruction *last_instruction(struct ptr_list *head)
{
	return (struct instruction *) ptrlist_last(head);
}

static inline struct instruction *first_instruction(struct ptr_list *head)
{
	return (struct instruction *) ptrlist_first(head);
}

static inline pseudo_t first_pseudo(struct ptr_list *head)
{
	return (pseudo_t) ptrlist_first(head);
}

static inline void concat_basic_block_list(struct ptr_list *from, struct ptr_list **to)
{
	ptrlist_concat(from, to);
}

static inline void concat_instruction_list(struct ptr_list *from, struct ptr_list **to)
{
	ptrlist_concat(from, to);
}

static inline int is_branch_goto(struct instruction *br)
{
	return br && br->opcode==OP_BR && (!br->bb_true || !br->bb_false);
}

static inline void add_bb(struct ptr_list **list, struct basic_block *bb)
{
	ptrlist_add(list, bb);
}

static inline void add_instruction(struct ptr_list **list, struct instruction *insn)
{
	ptrlist_add(list, insn);
}

static inline void add_multijmp(struct ptr_list **list, struct multijmp *multijmp)
{
	ptrlist_add(list, multijmp);
}

static inline pseudo_t *add_pseudo(struct ptr_list **list, pseudo_t pseudo)
{
	return (pseudo_t *) ptrlist_add(list, pseudo);
}

static inline int remove_pseudo(struct ptr_list **list, pseudo_t pseudo)
{
	return ptrlist_remove(list, pseudo, 0) != 0;
}

static inline int bb_terminated(struct basic_block *bb)
{
	struct instruction *insn;
	if (!bb)
		return 0;
	insn = last_instruction(bb->insns);
	return insn && insn->opcode >= OP_TERMINATOR
	            && insn->opcode <= OP_TERMINATOR_END;
}

static inline int bb_reachable(struct basic_block *bb)
{
	return bb != NULL;
}

static inline void add_pseudo_ptr(pseudo_t *ptr, struct ptr_list **list)
{
	ptrlist_add(list, ptr);
}

static inline void add_pseudo_user_ptr(struct pseudo_user *user, struct ptr_list **list)
{
	ptrlist_add(list, user);
}

static inline int has_use_list(pseudo_t p)
{
	return (p && p->type != PSEUDO_VOID && p->type != PSEUDO_VAL);
}

static inline struct pseudo_user *alloc_pseudo_user(struct dmr_C *C, struct instruction *insn, pseudo_t *pp)
{
	struct pseudo_user *user = (struct pseudo_user *) allocator_allocate(&C->L->pseudo_user_allocator, 0);
	user->userp = pp;
	user->insn = insn;
	return user;
}

static inline void use_pseudo(struct dmr_C *C, struct instruction *insn, pseudo_t p, pseudo_t *pp)
{
	*pp = p;
	if (has_use_list(p))
		add_pseudo_user_ptr(alloc_pseudo_user(C, insn, pp), &p->users);
}

static inline void remove_bb_from_list(struct ptr_list **list, struct basic_block *entry, int count)
{
	ptrlist_remove(list, entry, count);
}

static inline void replace_bb_in_list(struct ptr_list **list,
	struct basic_block *old, struct basic_block *new, int count)
{
	ptrlist_replace(list, old, new, count);
}

//static inline int instruction_list_size(struct ptr_list *list)
//{
//	return ptrlist_size(list);
//}

//static inline int pseudo_list_size(struct ptr_list *list)
//{
//	return ptrlist_size(list);
//}

//static inline int bb_list_size(struct ptr_list *list)
//{
//	return ptrlist_size(list);
//}

//static inline void free_instruction_list(struct ptr_list **head)
//{
//	ptrlist_remove_all(head);
//}

//static inline struct instruction * delete_last_instruction(struct ptr_list **head)
//{
//	return (struct instruction *) ptrlist_undo_last(head);
//}

//static inline struct basic_block * delete_last_basic_block(struct ptr_list **head)
//{
//	return (struct basic_block *) ptrlist_delete_last(head);
//}

//static inline struct basic_block *first_basic_block(struct ptr_list *head)
//{
//	return (struct basic_block *) ptrlist_first(head);
//}
//static inline struct instruction *last_instruction(struct ptr_list *head)
//{
//	return (struct instruction *) ptrlist_last(head);
//}

//static inline struct instruction *first_instruction(struct ptr_list *head)
//{
//	return (struct instruction *) ptrlist_first(head);
//}

//static inline pseudo_t first_pseudo(struct ptr_list *head)
//{
//	return (pseudo_t) ptrlist_first(head);
//}



struct entrypoint {
	struct symbol *name;
	struct ptr_list *syms; /* symbol list */
	struct ptr_list *accesses; /* pseudo list */
	struct ptr_list *bbs; /* basic_block list */
	struct basic_block *active;
	struct instruction *entry;
};

extern void insert_select(struct dmr_C *C, struct basic_block *bb, struct instruction *br, struct instruction *phi, pseudo_t if_true, pseudo_t if_false);
extern void insert_branch(struct dmr_C *C, struct basic_block *bb, struct instruction *br, struct basic_block *target);

pseudo_t alloc_phi(struct dmr_C *C, struct basic_block *source, pseudo_t pseudo, int size);
pseudo_t alloc_pseudo(struct dmr_C *C, struct instruction *def);
pseudo_t value_pseudo(struct dmr_C *C, long long val);

struct entrypoint *linearize_symbol(struct dmr_C *C, struct symbol *sym);
int unssa(struct dmr_C *C, struct entrypoint *ep);
void show_entry(struct dmr_C *C, struct entrypoint *ep);
const char *show_pseudo(struct dmr_C *C, pseudo_t pseudo);
void show_bb(struct dmr_C *C, struct basic_block *bb);
const char *show_instruction(struct dmr_C *C, struct instruction *insn);

void init_linearizer(struct dmr_C *C);
void destroy_linearizer(struct dmr_C *C);

#endif /* LINEARIZE_H */

