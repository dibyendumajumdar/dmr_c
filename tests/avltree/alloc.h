/* alloc.h - fast memory allocator      */
/* dibyendu majumdar                    */
/* adapted from code in C++ STL library */

#ifndef alloc_h
#define alloc_h

struct buffer_type_st {
	struct buffer_type_st    *next_buffer;
	char           *buffer;
};
typedef struct buffer_type_st buffer_type_t;

struct link_st {
	struct link_st           *next;
};
typedef struct link_st link_t;

struct allocator_st {
	buffer_type_t    *buffer_list;
	link_t           *free_list;
	char           *next_avail;
	char           *last;
	int          size;
	int          n;
};
typedef struct allocator_st allocator;

extern allocator      *
new_allocator(int size, int n);

extern void 
grow_allocator(allocator * a);

extern void           *
alloc_node(allocator * a);

extern void 
dealloc_node(allocator * a, void *n);

extern void 
destroy_allocator(allocator * a);

#endif
