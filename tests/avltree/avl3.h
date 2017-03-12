#ifndef avl_h
#define avl_h

/* avl tree manager */
/* dibyendu majumdar */
/* version 3.0 */
/* oct 21 1995 */
/* revised oct 24 1995 */
/* revised jan 27 1997 */
/* revised feb 17 1997 */

typedef int       (*pfn_comparekeys)  (void *key, void *object) ;
typedef void      (*pfn_createobject) (void *object, void *key) ;
typedef void      (*pfn_destroyobject)(void *object) ;
typedef void      (*pfn_assignobject) (void *dstobj, void *srcobj) ;

typedef struct avl_vtbl
{
	 pfn_comparekeys        comparekeys ;
	 pfn_createobject       createobject ;
	 pfn_assignobject       assignobject ;
	 pfn_destroyobject      destroyobject ;
} AVL_vtbl ;

typedef struct avltree
{
	AVL_vtbl *vptr ;
	void *root ;
	int n ;
	int size ;
	allocator *a;
} AVLTree ;

AVLTree * AVLTree_New(AVLTree *tree, AVL_vtbl * vtbl, int objsize, int growby);

void *    AVLTree_Search            (AVLTree *tree, void *key) ;
void *    AVLTree_Insert            (AVLTree *tree, void *key) ;
int       AVLTree_Delete            (AVLTree *tree, void *key) ;
int       AVLTree_DeleteObject      (AVLTree *tree, void *object) ;

void *    AVLTree_FindFirst         (AVLTree *tree) ;
void *    AVLTree_FindLast          (AVLTree *tree) ;
void *    AVLTree_FindNext          (AVLTree *tree, void *currentobject) ;
void *    AVLTree_FindPrevious      (AVLTree *tree, void *currentobject) ;

int       AVLTree_Height            (AVLTree *tree) ;

void      AVLTree_Foreach           (AVLTree *tree, void (*funcptr)(void *));
void      AVLTree_Backeach          (AVLTree *tree, void (*funcptr)(void *));

void      AVLTree_Destroy           (AVLTree *tree) ;

#endif

