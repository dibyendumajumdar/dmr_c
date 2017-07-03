#include <nanojitextra.h>

#include <stdbool.h>
#include <stdio.h>
#include <string.h>

extern bool dmrC_nanocompile(int argc, char **argv, NJXContextRef module,
			     const char *inputbuffer);

static int test1(int argc, char **argv)
{
	const char *code = "long long sumq(long long len, long long *array) "
			   "{"
			   "long long n = 0;"
			   "int i = 0; "
			   "for (i = 0; i < len; i++) "
			   "n += array[i]; "
			   "return n; "
			   "}\n";
	NJXContextRef module = NJX_create_context(true);

	int rc = 0;
	if (!dmrC_nanocompile(argc, argv, module, code))
		rc = 1;
	long long (*fp)(long long, long long *) = NULL;
	if (rc == 0) {
		fp = NJX_get_function_by_name(module, "sumq");
		if (!fp)
			rc = 1;
	}
	if (rc == 0 && fp) {
		long long data[5] = {100, 200, 300, 400, 500};
		long long result = fp(5, data);
		if (result != (100 + 200 + 300 + 400 + 500))
			rc = 1;
	}
	NJX_destroy_context(module);
	return rc;
}

static int test2(int argc, char **argv)
{
	const char *code = "long long strlen(const char *s)"
			   "{"
			   "long long n = 0;"
			   "while (s[n] != 0) "
			   "n++;"
			   "return n;"
			   "}\n";
	NJXContextRef module = NJX_create_context(true);

	int rc = 0;
	if (!dmrC_nanocompile(argc, argv, module, code))
		rc = 1;
	long long (*fp)(const char *) = NULL;
	if (rc == 0) {
		fp = NJX_get_function_by_name(module, "strlen");
		if (!fp)
			rc = 1;
	}
	if (rc == 0 && fp) {
		const char *data = "This is a string!";
		long long result = fp(data);
		if (result != strlen(data))
			rc = 1;
	}
	NJX_destroy_context(module);
	return rc;
}

static int test3(int argc, char **argv)
{
	const char *code = "struct mystruct { "
			   "double d; "
			   "int a, b; "
			   "char array[10]; "
			   "};\n"

			   "int storeint(struct mystruct *p) "
			   "{ "
			   "p->array[0] = 'h'; "
			   "p->array[1] = 'e'; "
			   "p->array[2] = 'l'; "
			   "p->array[3] = 'l'; "
			   "p->array[4] = 'o'; "
			   "p->array[5] = 0; "
			   "p->a = 42; "
			   "p->b = 96; "
			   // p->d = 300.42;
			   "return 0; "
			   "}\n";

	struct mystruct {
		double d;
		int a, b;
		char array[10];
	};

	NJXContextRef module = NJX_create_context(true);
	int rc = 0;
	if (!dmrC_nanocompile(argc, argv, module, code))
		rc = 1;
	int (*fp)(struct mystruct *) = NULL;
	if (rc == 0) {
		fp = NJX_get_function_by_name(module, "storeint");
		if (!fp)
			rc = 1;
	}
	if (rc == 0 && fp) {
		struct mystruct T;
		int result = fp(&T);
		if (result != 0 || strcmp(T.array, "hello") != 0 || T.a != 42 ||
		    T.b != 96)
			rc = 1;
	}
	NJX_destroy_context(module);
	return rc;
}

int main(int argc, char **argv)
{
	int rc = 0;
	rc += test1(argc, argv);
	rc += test2(argc, argv);
	rc += test3(argc, argv);

	if (rc == 0)
		printf("Test OK\n");
	else
		printf("Test FAILED\n");
	return rc;
}
