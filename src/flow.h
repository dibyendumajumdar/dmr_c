#ifndef DMR_C_FLOW_H
#define DMR_C_FLOW_H

/*
* Flow - walk the linearized flowgraph, simplifying it as we
* go along.
*
* Copyright (C) 2004 Linus Torvalds
*/

#include <dmr_c.h>

#define REPEAT_CSE		1
#define REPEAT_SYMBOL_CLEANUP	2

struct entrypoint;
struct instruction;

extern int simplify_flow(struct dmr_C *C, struct entrypoint *ep);

extern void simplify_symbol_usage(struct dmr_C *C, struct entrypoint *ep);
extern void simplify_memops(struct dmr_C *C, struct entrypoint *ep);
extern void pack_basic_blocks(struct dmr_C *C, struct entrypoint *ep);

extern void convert_instruction_target(struct dmr_C *C, struct instruction *insn, pseudo_t src);
extern void cleanup_and_cse(struct dmr_C *C, struct entrypoint *ep);
extern int simplify_instruction(struct dmr_C *C, struct instruction *);

extern void kill_bb(struct dmr_C *C, struct basic_block *);
extern void kill_use(pseudo_t *);
extern void kill_instruction(struct dmr_C *C, struct instruction *);
extern void kill_unreachable_bbs(struct dmr_C *C, struct entrypoint *ep);

void check_access(struct dmr_C *C, struct instruction *insn);
void convert_load_instruction(struct dmr_C *C, struct instruction *, pseudo_t);
void rewrite_load_instruction(struct dmr_C *C, struct instruction *, struct ptr_list *);
int dominates(struct dmr_C *C, pseudo_t pseudo, struct instruction *insn, struct instruction *dom, int local);

extern void clear_liveness(struct entrypoint *ep);
extern void track_pseudo_liveness(struct dmr_C *C, struct entrypoint *ep);
extern void track_pseudo_death(struct dmr_C *C, struct entrypoint *ep);
extern void track_phi_uses(struct dmr_C *C, struct instruction *insn);

extern void vrfy_flow(struct entrypoint *ep);
extern int pseudo_in_list(struct ptr_list *list, pseudo_t pseudo);

#endif
