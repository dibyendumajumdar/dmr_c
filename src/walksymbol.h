#ifndef DMR_C_PARSETREE_H
#define DMR_C_PARSETREE_H

#include <allocate.h>
#include <dmr_c.h>
#include <expression.h>
#include <parse.h>
#include <port.h>
#include <symbol.h>
#include <token.h>

#include <stdbool.h>
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
	void (*begin_struct_members)(void *data, struct symbol_info *syminfo);
	void (*end_struct_members)(void *data, struct symbol_info *syminfo);
	void (*begin_func_arguments)(void *data, struct symbol_info *syminfo);
	void (*end_func_arguments)(void *data, struct symbol_info *syminfo);
	void (*reference_symbol)(void *data, uint64_t id);
	void (*begin_func_body)(void *data, struct symbol_info *syminfo);
	void (*end_func_body)(void *data, struct symbol_info *syminfo);
	void (*begin_func_returntype)(void *data, struct symbol_info *syminfo);
	void (*end_func_returntype)(void *data, struct symbol_info *syminfo);
	void (*begin_basetype)(void *data, struct symbol_info *syminfo);
	void (*end_basetype)(void *data, struct symbol_info *syminfo);
	void (*begin_initializer)(void *data, struct symbol_info *syminfo);
	void (*end_initializer)(void *data, struct symbol_info *syminfo);
	void (*string_literal)(void *data, const char *str);
	void (*int_literal)(void *data, long long value, int bit_size,
			    bool is_unsigned);
	void (*float_literal)(void *data, long double fvalue, int bit_size);
	void (*begin_statement)(void *data, enum statement_type statement_type);
	void (*end_statement)(void *data, enum statement_type statement_type);
	void (*begin_expression)(void *data, enum expression_type expr_type);
	void (*end_expression)(void *data, enum expression_type expr_type);
	void (*begin_assignment_expression)(void *data,
					    enum expression_type expr_type,
					    int op);
	void (*end_assignment_expression)(void *data,
					  enum expression_type expr_type);
	void (*begin_binop_expression)(void *data,
				       enum expression_type expr_type, int op);
	void (*end_binop_expression)(void *data,
				     enum expression_type expr_type);
	void (*begin_preop_expression)(void *data,
				       enum expression_type expr_type, int op);
	void (*end_preop_expression)(void *data,
				     enum expression_type expr_type);
	void (*begin_direct_call_expression)(void *data,
					     enum expression_type expr_type,
					     const char *name);
	void (*begin_indirect_call_expression)(void *data,
					       enum expression_type expr_type);
	void (*end_call_expression)(void *data, enum expression_type expr_type);
	void (*begin_callarg_expression)(void *data,
					 enum expression_type expr_type,
					 int argpos);
	void (*end_callarg_expression)(void *data,
				       enum expression_type expr_type);
	void (*begin_cast_expression)(void *data,
				      enum expression_type expr_type,
				      int oldbits, int newbits,
				      bool is_unsigned);
	void (*end_cast_expression)(void *data, enum expression_type expr_type);
	void (*begin_conditional_expression)(void *data,
					     enum expression_type expr_type);
	void (*end_conditional_expression)(void *data,
					   enum expression_type expr_type);
	void (*begin_label_expression)(void *data,
				       enum expression_type expr_type);
	void (*end_label_expression)(void *data,
				     enum expression_type expr_type);
	void (*do_expression_identifier)(void *data,
					 enum expression_type expr_type,
					 const char *ident);
	void (*do_expression_index)(void *data, enum expression_type expr_type,
				    unsigned from, unsigned to);
	void (*begin_expression_position)(void *data,
					  enum expression_type expr_type,
					  unsigned init_offset, int bit_offset, const char *ident);
	void (*end_expression_position)(void *data,
					enum expression_type expr_type);
	void (*begin_initialization)(void *data,
				     enum expression_type expr_type);
	void (*end_initialization)(void *data, enum expression_type expr_type);
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
