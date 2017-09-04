#ifndef	SSA_H
#define	SSA_H


#include <lib.h>
#include <linearize.h>

#ifdef __cplusplus
extern "C" {
#endif

/* ssa.c */
extern pseudo_t dmrC_load_var(struct dmr_C *C, struct basic_block *bb, struct symbol *var);
extern void dmrC_store_var(struct dmr_C *C, struct basic_block *bb, struct symbol *var, pseudo_t val);
extern void dmrC_seal_bb(struct dmr_C *C, struct basic_block *bb);
extern void dmrC_seal_gotos(struct dmr_C *C, struct entrypoint *ep);

#ifdef __cplusplus
}
#endif

#endif
