/* 
* alloc.c - a fast memory allocator 
*
* dibyendu majumdar                 
* adapted from code in C++ STL lib 
*
* This file implements a fast fixed size  memory allocator. It is very useful
* for situations where you need to allocate and free fixed size memory chunks
* fairly frequently.
*
*/

/**
 * DUMMY allocator for testing
 */

static allocator A;
static char Memory[64*1024];
static buffer_type_t Node;
static int once;

/***
*	FUNCTION	: new_allocator
*
*	DESCRIPTION	: create a new allocator object
*
*	ARGS		: size_t [IN] - object size
*			: size_t [IN] - no of objects to be allocated initially
*
*	RETURNS		: ptr to newly created object
*/
allocator      *
new_allocator(int size, int n)
{
	allocator      *a;

	if (size * n > sizeof Memory) {
		printf("out of memory\n");
		exit(1);
	}

	a = &A;
	a->buffer_list = NULL;
	a->free_list = NULL;
	a->next_avail = NULL;
	a->last = NULL;
	a->size = size;
	a->n = n;
	return a;
}

/***
*
*	FUNCTION	: grow_allocator
*
*	DESCRIPTION	: grows an allocator object 
*
*	ARGS		: allocator * - ptr to allocator object
*
*	RETTURNS	:
*/
void 
grow_allocator(allocator * a)
{
	buffer_type_t    *tmp;
	if (once) {
		printf("out of memory\n");
		exit(1);
	}
	else
		once = 1;

	tmp = &Node;
	tmp->buffer = Memory;
	tmp->next_buffer = a->buffer_list;
	a->buffer_list = tmp;
	a->next_avail = a->buffer_list->buffer;
	a->last = a->next_avail + (a->size * a->n);
}

/***
*
*	FUNCTION	: alloc_node
*
*	DESCRIPTION	: allocates memory using an allocator
*
*	ARGS		: allocator *
*
*	RETURNS		: void * - ptr to memory allocated
*/
void           *
alloc_node(allocator * a)
{
	link_t           *tmp;
	tmp = a->free_list;

	if (a->free_list) {
		a->free_list = (link_t *) (a->free_list->next);
		return (void *) tmp;
	} else {
		if (a->next_avail == a->last) {
			grow_allocator(a);
		} 
		{
			void *tmp;
			tmp = (void *) a->next_avail;
			a->next_avail += a->size;
			return tmp;
		}
	}
}



/***
*
*	FUNCTION	: dealloc_node
*
*	DESCRIPTION	: free memory allocated by alloc_node
*
*	ARGS		: allocator *
*			: void * - ptr to memory to be freed
*
*	RETURNS		: 
*/
void 
dealloc_node(allocator * a, void *n)
{
	((link_t *) n)->next = a->free_list;
	a->free_list = (link_t *) n;
}

/***
*	FUNCTION	: destroy_allocator
*
*	DESCRIPTION	: free memory associated with an allocator
*
*	ARGS		: allocator *
*
*	RETURNS		:
*/
void 
destroy_allocator(allocator * a)
{
}

