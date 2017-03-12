/*
 * --- avl3a.c (version 3.0) 
 * --- started oct 21 1995 
 * --- revised oct 24 1995
 * --- revised jul 6 1996 
 * --- revised jan 27 1997
 * --- revised jan 17 1997
 * --- author : dibyendu majumdar 
 */

/* allocate a new node */
AVLNode        *
AVL_new(AVLTree * tree, void * key)
{
	AVL_vtbl       *vtbl;
	AVLNode        *n;

	vtbl = tree->vptr;
	n = (AVLNode *) alloc_node(tree->a);

	if (n == NULL) {
		//fprintf(stderr, "Error [AVL_new]: Out of memory\n");
		exit(-1);
	}
	n->left = n->right = n->parent = NULL;
	n->balance = Equal;

	CONSTRUCT_NODE(n, key);

	return n;
}


/* insert a key into an AVL tree and return new object inserted */
void           *
AVLTree_Insert(AVLTree * tree, void * k)
{
	AVLNode        *root;
	AVLNode        *found;
	AVL_vtbl       *vtbl;

	root = (AVLNode *) tree->root;
	found = NULL;
	vtbl = tree->vptr;

	/* is the tree empty ? */
	if (root == NULL) {
		found = root = AVL_new(tree, k);
	} else {
		/* find insertion point */
		int             height_changed;
		AVLNode        *p, *n;

		height_changed = 0;
		p = NULL, n = NULL;

		n = root;
		do {
			int             compresult;
			compresult = 0;

			p = n;
			compresult = COMP(k, n);
			if (compresult < 0)
				n = p->left;
			else if (compresult > 0)
				n = p->right;
			else
				return (void *) (n + 1);
		} while (n != NULL);
		found = n = AVL_new(tree, k);

		/* insert */
		if (COMP(k, p) < 0)
			AVL_SetLeft(p, n);
		else
			AVL_SetRight(p, n);

		/* rebalance */
		height_changed = 1;
		while (p != NULL && height_changed) {
			if (n == p->left)
				p = AVL_RebalanceHeavierLeft(p, 
							&height_changed);
			else
				p = AVL_RebalanceHeavierRight(p, 
							&height_changed);
			n = p;
			p = p->parent;
		}
		if (p == NULL)
			root = n;
	}
	tree->root = root;
	return (void *) (found + 1);
}

/* delete an object from an AVL tree */
int 
AVLTree_DeleteObject(AVLTree * tree, void *obj)
{
	AVLNode        *root;
	AVLNode        *discard, *p, *n;
	int             height_changed;
	AVL_vtbl       *vtbl;
	int             flag;

	root = (AVLNode *) tree->root;
	discard = NULL, p = NULL, n = (AVLNode *)obj;
	height_changed = 0;
	vtbl = tree->vptr;
	flag = 0;

	if (n == NULL) 
		return -1;
	--n;
	
	if (n->left != NULL) {
		/* find predecessor */
		p = n;
		for (n = n->left; n->right != NULL; n = n->right);

		COPY_NODE(p, n, tree->size);

		p = n->parent;
		if (n == p->left) {
			flag = 1;
			AVL_SetLeft(p, n->left);
		} else
			AVL_SetRight(p, n->left);
		discard = n;
	} else {
		/* no predecessor, left subtree is guaranteed to be NULL */
		p = n->parent;
		if (p != NULL) {
			if (n == p->left) {
				AVL_SetLeft(p, n->right);
				flag = 1;
			} else
				AVL_SetRight(p, n->right);
			DESTRUCT_NODE(n);
			discard = n;
		} else {
			/* root is being deleted */
			p = n->right;
			if (p != NULL)
				p->parent = NULL;
			DESTRUCT_NODE(n);
			dealloc_node(tree->a, n);
			tree->root = p;
			return 0;
		}
	}

	/* rebalance */
	height_changed = 1;
	while (p != NULL && height_changed) {
		if (flag || n == p->left) {
			flag = 0;
			p = AVL_RebalanceShorterLeft(p, &height_changed);
		} else
			p = AVL_RebalanceShorterRight(p, &height_changed);
		n = p;
		p = p->parent;
	}
	if (p == NULL)
		tree->root = n;
	dealloc_node(tree->a, discard);
	return 0;
}

/* delete a key from an AVL tree */
int 
AVLTree_Delete(AVLTree * tree, void * k)
{
	AVLNode        *root;
	AVLNode        *n;
	AVL_vtbl       *vtbl;

	root = (AVLNode *) tree->root;
	n = NULL;
	vtbl = tree->vptr;

	if (root == NULL)
		return -1;

	/* search */
	n = root;
	while (n != NULL) {
		int             compresult;

		compresult = COMP(k, n);
		if (compresult < 0)
			n = n->left;
		else if (compresult > 0)
			n = n->right;
		else
			break;
	}
	if (n == NULL)
		return -1;
	AVLTree_DeleteObject(tree, n+1);
	return 0;
}


/* search for an object */
void           *
AVLTree_Search(AVLTree * tree, void * k)
{
	AVLNode        *root;
	AVL_vtbl       *vtbl;

	root = (AVLNode *) tree->root;
	vtbl = tree->vptr;

	if (root) {
		register AVLNode *current;
		current = root;

		while (current) {
			int             compresult;
			compresult = COMP(k, current);
			if (compresult == 0)
				return (void *) (current + 1);
			else if (compresult < 0)
				current = current->left;
			else
				current = current->right;
		}
	}
	return NULL;
}

/* create a new tree */
AVLTree        *
AVLTree_New(AVLTree *tree, AVL_vtbl * vtbl, int objsize, int growby)
{
	tree->root = NULL;
	tree->vptr = vtbl;
	tree->size = objsize;
	tree->n = 0;
	tree->a = new_allocator(objsize + sizeof(AVLNode), growby);
	return tree;
}

void 
AVLTree_Destroy(AVLTree * tree)
{
	if (tree->vptr->destroyobject != NULL) {
		AVLTree_ForwardApply(tree->root, tree->vptr->destroyobject);
	}
	destroy_allocator(tree->a);
}

