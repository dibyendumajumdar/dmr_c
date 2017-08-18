#ifndef PTRMAP_H
#define PTRMAP_H

#include <allocate.h>

#include <assert.h>
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

#define MAP_NR 7

struct ptrpair {
	void *key;
	void *val;
};
struct ptrmap {
	struct ptrmap *next;
	int nr;
	struct ptrpair pairs[MAP_NR];
};

#define DECLARE_PTRMAP(name, ktype, vtype)                                     \
	struct name##_pair {                                                   \
		ktype key;                                                     \
		vtype val;                                                     \
	};                                                                     \
	struct name {                                                          \
		struct name##_pair block[1];                                   \
	};                                                                     \
	static inline void name##_add(struct name **map, ktype k, vtype v,     \
				      struct allocator *A)                     \
	{                                                                      \
		__ptrmap_add((struct ptrmap **)map, k, v, A);                  \
	}                                                                      \
	static inline void name##_update(struct name **map, ktype k, vtype v,  \
					 struct allocator *A)                  \
	{                                                                      \
		__ptrmap_update((struct ptrmap **)map, k, v, A);               \
	}                                                                      \
	static inline vtype name##_lookup(struct name *map, ktype k)           \
	{                                                                      \
		vtype val = __ptrmap_lookup((struct ptrmap *)map, k);          \
		return val;                                                    \
	}

/* ptrmap.c */
void __ptrmap_add(struct ptrmap **mapp, void *key, void *val,
		  struct allocator *A);
void __ptrmap_update(struct ptrmap **mapp, void *key, void *val,
		     struct allocator *A);
void *__ptrmap_lookup(struct ptrmap *map, void *key);

#ifdef __cplusplus
}
#endif

#endif
