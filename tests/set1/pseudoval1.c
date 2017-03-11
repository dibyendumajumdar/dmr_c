struct avl_node {
	struct avl_node *right;
	struct avl_node *left;
};

#define NULL ((void *)0)

static int test_null_comp(int height_changed, struct avl_node *node) {
	return node != NULL && height_changed;
}

int main(int argc, const char *argv[]) {
	return test_null_comp(1, NULL);
}