#ifndef _MSC_VER

#if defined(__OMR_BACKEND__) || defined(__NANOJIT_BACKEND__)

#define NULL ((void *)0)
extern void printd(double d);
extern void printi(int i);
extern void printll(long long i);
extern void exit(int);

typedef __SIZE_TYPE__ size_t;

extern void* malloc(size_t);

#else

extern void exit(int);
extern int printf(const char *, ...);
#define NULL ((void *)0)

static void printd(double d) { printf("%.12f\n", d); }
static void printi(int i) { printf("%d\n", i); }
static void printll(long long i) { printf("%lld\n", i); }

#endif

#else

#include <stdio.h>
#include <stdlib.h>

static void printd(double d) { printf("%.12f\n", d); }
static void printi(int i) { printf("%d\n", i); }
static void printll(long long i) { printf("%lld\n", i); }

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

//static char *randomletters = "agqwewbxklpfgytuorz";

#if defined(__OMR_BACKEND__) || defined(__NANOJIT_BACKEND__)
int TestNano(void)
#else
int main(void)
#endif
{
#if !defined(__OMR_BACKEND__) && defined(__NANOJIT_BACKEND__)
	once = 0;
#endif

	int testdata[20];
	testdata[0] = 'a';
	testdata[1] = 'g';
	testdata[2] = 'q';
	testdata[3] = 'w';
	testdata[4] = 'e';
	testdata[5] = 'f';
	testdata[6] = 'b';
	testdata[7] = 'x';
	testdata[8] = 'k';
	testdata[9] = 'l';
	testdata[10] = 'p';
	testdata[11] = 'm';
	testdata[12] = 's';
	testdata[13] = 'y';
	testdata[14] = 't';
	testdata[15] = 'u';
	testdata[16] = 'o';
	testdata[17] = 'r';
	testdata[18] = 'j';
	testdata[19] = '0';	

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
		/* key = randomletters[i]; BUG crashes */
		key = testdata[i];
		AVLTree_Insert(&tree, &key);
	}

	struct record *rec;
	rec = (struct record *)AVLTree_FindFirst(&tree);
	while (rec != NULL) {
		printi(rec->key);
		rec = AVLTree_FindNext(&tree, rec);
	}

	AVLTree_Destroy(&tree);
	return 0;
}

