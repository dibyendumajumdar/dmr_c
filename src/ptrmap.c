#include <ptrmap.h>

#include <stddef.h>

void __ptrmap_add(struct ptrmap **mapp, void *key, void *val, struct allocator *A)
{
	struct ptrmap *head = *mapp;
	struct ptrmap *newmap;
	struct ptrmap *map;
	struct ptrpair *pair;
	int nr;

	if ((map = head)) {
		struct ptrmap *next = map->next;
		if (next)		// head is full
			map = next;
		if ((nr = map->nr) < MAP_NR)
			goto oldmap;
	}

	// need a new block
	newmap = dmrC_allocator_allocate(A, 0);
	if (!head) {
		*mapp = newmap;
	} else {
		newmap->next = head->next;
		head->next = newmap;
	}
	map = newmap;
	nr = 0;

oldmap:
	pair = &map->pairs[nr];
	pair->key = key;
	pair->val = val;
	map->nr = ++nr;
}

void *__ptrmap_lookup(struct ptrmap *map, void *key)
{
	for (; map; map = map->next) {
		int i, n = map->nr;
		for (i = 0; i < n; i++) {
			struct ptrpair *pair = &map->pairs[i];
			if (pair->key == key)
				return pair->val;
		}
	}
	return NULL;
}

void __ptrmap_update(struct ptrmap **mapp, void *key, void *val, struct allocator *A)
{
	struct ptrmap *map = *mapp;

	for (; map; map = map->next) {
		int i, n = map->nr;
		for (i = 0; i < n; i++) {
			struct ptrpair *pair = &map->pairs[i];
			if (pair->key == key) {
				if (pair->val != val)
					pair->val = val;
				return;
			}
		}
	}

	__ptrmap_add(mapp, key, val, A);
}
