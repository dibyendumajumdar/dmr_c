#ifndef _MSC_VER

extern void exit(int);
extern int printf(const char *, ...);
#define NULL ((void *)0)

#else

#include <stdio.h>
#include <stdlib.h>

#endif

static void* memcpy(void* dest, const void* src, int count) 
{
	char* dst8;
	char* src8;
	
	dst8 = (char*)dest;
	src8 = (char*)src;
	while (count-- > 0) {
		*dst8++ = *src8++;
	}
	return dest;
}

#include "alloc.h"
#include "alloc.c"
#include "avl3.h"
#include "avl3int.h"
#include "avl3b.c"
#include "avl3a.c"

struct record {
	int key;
};

static int comparekeys (void *key, void *object) 
{
	int *ikey;
	struct record *rec;

	ikey = (int *) key;
	rec = (struct record *)object;
	return *ikey - rec->key;
}

static void createobject (void *object, void *key)
{
	int *ikey;
	struct record *rec;

	ikey = (int *) key;
	rec = (struct record *)object;
	rec->key = *ikey;
}


static void destroyobject(void *object) 
{
}
static void assignobject(void *dstobj, void *srcobj) 
{
	struct record *rec1;
	struct record *rec2;

	rec1 = (struct record *)dstobj;
	rec2 = (struct record *)srcobj;
	rec1->key = rec2->key;
}


static char *randomletters = "agqwewbxklpfgytuorz";

int main(void)
{
	once = 0;

	AVLTree tree;
	AVL_vtbl vtable;
	
	vtable.comparekeys = comparekeys;
	vtable.createobject = createobject;
	vtable.destroyobject = destroyobject;
	vtable.assignobject = assignobject;

	AVLTree_New(&tree, &vtable, sizeof(struct record), 1000);

	int i;
	for (i = 0; i < 20; i++) {
		int key;
		key = randomletters[i];
		AVLTree_Insert(&tree, &key);
	}

	struct record *rec;
	rec = (struct record *)AVLTree_FindFirst(&tree);
	while (rec != NULL) {
		printf("%d\n", rec->key);
		rec = AVLTree_FindNext(&tree, rec);
	}

	AVLTree_Destroy(&tree);
	return 0;
}

