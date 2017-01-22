#include <allocate.h>
#include <ptrlist.h>
#include <token.h>
#include <parse.h>
#include <stdio.h>

int main()
{
	int failure_count = 0;
	failure_count += test_allocator();
	failure_count += test_ptrlist();
	//failure_count += test_tokenizer();
	//failure_count += test_parse();
	ptrlist_destroy_all_allocated_nodes();

	if (failure_count == 0)
		printf("Tests OK\n");
	else
		printf("Tests FAILED\n");
	return failure_count == 0 ? 0 : 1;
}