#ifndef DMR_C_PARSETREE_H
#define DMR_C_PARSETREE_H

#include <allocate.h>
#include <dmr_c.h>
#include <expression.h>
#include <parse.h>
#include <port.h>
#include <symbol.h>
#include <token.h>

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

struct symbol_info {
	uint64_t id;
	enum namespace_type symbol_namespace;
	enum type symbol_type;
	const char *name;
	int bit_size;
	unsigned long alignment;
	unsigned int offset;
	int bit_offset;
	long long array_size;
	struct position pos;
};

struct symbol_visitor {
	void *data;
	uint64_t id;
	void (*begin_symbol)(void *data, struct symbol_info *syminfo);
	void (*end_symbol)(void *data, struct symbol_info *syminfo);
	void (*begin_members)(void *data, struct symbol_info *syminfo);
	void (*end_members)(void *data, struct symbol_info *syminfo);
	void (*begin_arguments)(void *data, struct symbol_info *syminfo);
	void (*end_arguments)(void *data, struct symbol_info *syminfo);
	void (*reference_symbol)(void *data, uint64_t id);
	void (*begin_body)(void *data, struct symbol_info *syminfo);
	void (*end_body)(void *data, struct symbol_info *syminfo);
	void (*begin_func_returntype)(void *data, struct symbol_info *syminfo);
	void (*end_func_returntype)(void *data, struct symbol_info *syminfo);
	void (*begin_basetype)(void *data, struct symbol_info *syminfo);
	void (*end_basetype)(void *data, struct symbol_info *syminfo);
	void (*begin_initializer)(void *data, struct symbol_info *syminfo);
	void (*end_initializer)(void *data, struct symbol_info *syminfo);
};

extern void dmrC_init_symbol_visitor(struct symbol_visitor *visitor);
extern void dmrC_walk_symbol_list(struct dmr_C *C, struct symbol_list *list,
				  struct symbol_visitor *visitor);
extern void dmrC_walk_symbol(struct dmr_C *C, struct symbol *sym,
			     struct symbol_visitor *visitor);

#ifdef __cplusplus
}
#endif

#endif
