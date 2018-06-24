#include <dmr_c.h>

#include <stdbool.h>
#include <stdio.h>
#include <string.h>

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
	JIT_ContextRef module = JIT_CreateContext();

	int rc = 0;
	if (!dmrC_omrcompile(argc, argv, module, code))
		rc = 1;
	long long (*fp)(long long, long long *) = NULL;
	if (rc == 0) {
		fp = JIT_GetFunction(module, "sumq");
		if (!fp)
			rc = 1;
	}
	if (rc == 0 && fp) {
		long long data[5] = {100, 200, 300, 400, 500};
		long long result = fp(5, data);
		if (result != (100 + 200 + 300 + 400 + 500))
			rc = 1;
	}
	JIT_DestroyContext(module);
	printf("Test1 %s\n", rc == 0 ? "Okay": "Failed");
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
	JIT_ContextRef module = JIT_CreateContext();

	int rc = 0;
	if (!dmrC_omrcompile(argc, argv, module, code))
		rc = 1;
	long long (*fp)(const char *) = NULL;
	if (rc == 0) {
		fp = JIT_GetFunction(module, "strlen");
		if (!fp)
			rc = 1;
	}
	if (rc == 0 && fp) {
		const char *data = "This is a string!";
		long long result = fp(data);
		if (result != strlen(data))
			rc = 1;
	}
	JIT_DestroyContext(module);
	printf("Test2 %s\n", rc == 0 ? "Okay": "Failed");
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
			   "p->d = 300.42; "
			   "return (int)p->d; "
			   "}\n";

	struct mystruct {
		double d;
		int a, b;
		char array[10];
	};

	JIT_ContextRef module = JIT_CreateContext();
	int rc = 0;
	if (!dmrC_omrcompile(argc, argv, module, code))
		rc = 1;
	int (*fp)(struct mystruct *) = NULL;
	if (rc == 0) {
		fp = JIT_GetFunction(module, "storeint");
		if (!fp)
			rc = 1;
	}
	if (rc == 0 && fp) {
		struct mystruct T;
		int result = fp(&T);
		if (result != 300 || strcmp(T.array, "hello") != 0 ||
		    T.a != 42 || T.b != 96 || T.d != 300.42)
			rc = 1;
	}
	JIT_DestroyContext(module);
	printf("Test3 %s\n", rc == 0 ? "Okay" : "Failed");
	return rc;
}


int test4(int argc, char **argv)
{
	const char *code = "int doif(int a, int b) "
			   "{"
			   "if (a < b) "
			   "return a + 5;"
			   "else if (b < a) "
			   "return a - 5;"
			   "else if (a * b >= 10) "
			   "return 15; "
			   "else {"
			   "int c = a / b;"
			   "int d = a%b;"
			   "if (c <= 1)"
			   "return d;"
			   "else if (d != 0)"
			   "return d;"
			   "else "
			   "return c + 1;"
			   "}"
			   "}\n";

	JIT_ContextRef module = JIT_CreateContext();
	int rc = 0;
	if (!dmrC_omrcompile(argc, argv, module, code))
		rc = 1;
	int (*fp)(int, int) = NULL;
	if (rc == 0) {
		fp = JIT_GetFunction(module, "doif");
		if (!fp)
			rc = 1;
	}
	if (rc == 0 && fp) {
		if (fp(1, 5) != 6)
			rc = 1;
		if (rc == 0 && fp(5, 1) != 0)
			rc = 1;
		if (rc == 0 && fp(5, 5) != 15)
			rc = 1;
		if (rc == 0 && fp(3, 3) != 0)
			rc = 1;
	}
	JIT_DestroyContext(module);
	printf("Test4 %s\n", rc == 0 ? "Okay" : "Failed");
	return rc;
}

int test5(int argc, char **argv)
{
	const char *code = "struct S { "
			   "char name[30];"
			   "char surname[30];"
			   "int age_in_years;"
			   "double weight;"
			   "};\n"
			   "int initS(struct S *s)"
			   "{"
			   "s->age_in_years = 99;"
			   "return 0;"
			   "}\n"

			   "int getage(void)"
			   "{"
			   "struct S s; "
			   "initS(&s); "
			   "return s.age_in_years; "
			   "}\n"
			   "int foo(int*i, long long*l) "
			   "{ "
			   "*i = (int)*l; "
			   "return 0; "
			   "}\n"

			   "int simplelocals(void) "
			   "{ "
			   "int a = 5; "
			   "long long b = 42; "
			   "foo(&a, &b); "
			   "return a + (int)b; "
			   "}\n";
	JIT_ContextRef module = JIT_CreateContext();
	int rc = 0;
	if (!dmrC_omrcompile(argc, argv, module, code))
		rc = 1;
	int (*fp)(void) = NULL;
	if (rc == 0) {
		fp = JIT_GetFunction(module, "simplelocals");
		if (!fp)
			rc = 1;
	}
	if (rc == 0 && fp) {
		int rc1 = fp();
		if (rc1 != 84)
			rc = 1;
	}
	if (rc == 0) {
		fp = JIT_GetFunction(module, "getage");
		if (!fp)
			rc = 1;
	} 
	if (rc == 0 && fp) {
		if (fp() != 99)
			rc = 1;
	}
	JIT_DestroyContext(module);
	printf("Test5 %s\n", rc == 0 ? "Okay" : "Failed");
	return rc;
}

static int test6(int argc, char **argv)
{
	const char *code = "struct S3 { "
			   "	int twobit : 2; "
			   "	int : 1; "
			   "	int threebit : 3; "
			   "	unsigned int onebit : 1; "
			   "	int ninebit : 9; "
			   "}; "
			   "int sets3(struct S3 *s3, int v) { "
			   "	int rc = 0; "
			   "	s3->threebit = 7; "
			   "	s3->twobit = s3->threebit; "
			   "	s3->threebit = s3->twobit; "
			   "	s3->ninebit = v; "
			   "	if (s3->threebit != 3) { "
			   "		if (s3->threebit == -1) { "
			   "			rc = 1; "
			   "		} "
			   "	} "
			   "	s3->onebit = 1; "
			   "	if (s3->onebit != 1) { "
			   "		rc = 2; "
			   "	} "
			   "	return rc; "
			   "}\n";

	struct S3 {
		int twobit : 2;
		int : 1;
		int threebit : 3;
		unsigned int onebit : 1;
		int ninebit : 9;
	};
	struct S3 s3;
	int (*fp)(struct S3 * s3, int v) = NULL;
	JIT_ContextRef module = JIT_CreateContext();
	int rc = 0;
	if (!dmrC_omrcompile(argc, argv, module, code))
		rc = 1;
	if (rc == 0) {
		fp = JIT_GetFunction(module, "sets3");
		if (!fp)
			rc = 1;
	}
	if (rc == 0 && fp) {
		int rc1 = fp(&s3, 129);
		if (rc1 != 0)
			printf("In Test 6 JITed sets3() returned %d; this is a "
			       "known issue\n",
			       rc1);
		if (rc == 0 && s3.ninebit != 129)
			rc = 1;
		if (rc == 0 && s3.threebit != 3)
			rc = 1;
		if (rc == 0 && s3.twobit != -1)
			rc = 1;
		if (rc == 0 && s3.onebit != 1)
			rc = 1;
	}
	JIT_DestroyContext(module);
	printf("Test6 %s\n", rc == 0 ? "Okay" : "Failed");
	return rc;
}

static int test7(int argc, char **argv)
{
	const char *code = "int testswitch(int i) "
			   "{ "
			   "	switch (i) { "
			   "	case 0: i = i + 1; break; "
			   "	case 1: i = i - 4; break; "
			   "	case 2: i = i + 5; break; "
			   "	default: i++; break; "
			   "	} "
			   "	return i; "
			   "}\n";

	int (*fp)(int v) = NULL;
	JIT_ContextRef module = JIT_CreateContext();
	int rc = 0;
	if (!dmrC_omrcompile(argc, argv, module, code))
		rc = 1;
	if (rc == 0) {
		fp = JIT_GetFunction(module, "testswitch");
		if (!fp)
			rc = 1;
	}
	if (rc == 0 && fp) {
		int rc1 = fp(7);
		if (rc1 != 8)
			rc = 1;
		if (rc == 0 && fp(0) != 1)
			rc = 1;
		if (rc == 0 && fp(1) != -3)
			rc = 1;
		if (rc == 0 && fp(2) != 7)
			rc = 1;
	}
	JIT_DestroyContext(module);
	printf("Test7 %s\n", rc == 0 ? "Okay" : "Failed");
	return rc;
}

static int test8_cvtb2i(unsigned char s) { return s; }

static int test8(int argc, char **argv)
{
	const char *code = "int cvtb2i(unsigned char s) { return s; }\n";
	unsigned char input[] = { 'a', -1, -127 };

	int(*fp)(unsigned char v) = NULL;
	JIT_ContextRef module = JIT_CreateContext();
	int rc = 0;
	if (!dmrC_omrcompile(argc, argv, module, code))
		rc = 1;
	if (rc == 0) {
		fp = JIT_GetFunction(module, "cvtb2i");
		if (!fp)
			rc = 1;
	}
	if (rc == 0 && fp) {
		for (int i = 0; i < sizeof input/sizeof input[0]; i++) {
			int rc1 = fp(input[i]);
			//printf("Got %d expected %d\n", rc1, test8_cvtb2i(input[i]));
			if (rc1 != test8_cvtb2i(input[i]))
				rc = 1;
		}
	}
	JIT_DestroyContext(module);
	printf("Test8 %s\n", rc == 0 ? "Okay" : "Failed");
	return rc;
}

static int test9_cvtb2i(char s) { return s; }

static int test9(int argc, char **argv)
{
	const char *code = "int cvtb2i(char s) {return (int)s; }\n";
	unsigned char input[] = { 'a', 128, 255 };

	int(*fp)(char v) = NULL;
	JIT_ContextRef module = JIT_CreateContext();
	int rc = 0;
	if (!dmrC_omrcompile(argc, argv, module, code))
		rc = 1;
	if (rc == 0) {
		fp = JIT_GetFunction(module, "cvtb2i");
		if (!fp)
			rc = 1;
	}
	if (rc == 0 && fp) {
		for (int i = 0; i < sizeof input / sizeof input[0]; i++) {
			int rc1 = fp(input[i]);
			//printf("Got %d expected %d\n", rc1, test9_cvtb2i(input[i]));
			if (rc1 != test9_cvtb2i(input[i])) {
				rc = 1;
			}
		}
	}
	JIT_DestroyContext(module);
	printf("Test9 %s\n", rc == 0 ? "Okay" : "Failed");
	return rc;
}

static int test10_not(int v) {
	return ~v;
}

static int test10(int argc, char **argv)
{
	const char *code = "int not(int v) {return ~v; }\n";
	int input[] = { 1, 0, 42, -84, 0xFF1011 };

	int(*fp)(int v) = NULL;
	JIT_ContextRef module = JIT_CreateContext();
	int rc = 0;
	if (!dmrC_omrcompile(argc, argv, module, code))
		rc = 1;
	if (rc == 0) {
		fp = JIT_GetFunction(module, "not");
		if (!fp)
			rc = 1;
	}
	if (rc == 0 && fp) {
		for (int i = 0; i < sizeof input / sizeof input[0]; i++) {
			int rc1 = fp(input[i]);
			//printf("Got %d expected %d\n", rc1, test10_not(input[i]));
			if (rc1 != test10_not(input[i])) {
				rc = 1;
			}
		}
	}
	JIT_DestroyContext(module);
	printf("Test10 %s\n", rc == 0 ? "Okay" : "Failed");
	return rc;
}

static int test11(int argc, char **argv)
{
	const char *code = "int tern(int v) {return v > 0 ? 5 : 4; }\n";
	int input[] = { 1, 0, 42, -84, 0xFF1011 };
	int expected[] = { 5, 4, 5, 4, 5 };

	int(*fp)(int v) = NULL;
	JIT_ContextRef module = JIT_CreateContext();
	int rc = 0;
	if (!dmrC_omrcompile(argc, argv, module, code))
		rc = 1;
	if (rc == 0) {
		fp = JIT_GetFunction(module, "tern");
		if (!fp)
			rc = 1;
	}
	if (rc == 0 && fp) {
		for (int i = 0; i < sizeof input / sizeof input[0]; i++) {
			int rc1 = fp(input[i]);
			//printf("Got %d expected %d\n", rc1, test10_not(input[i]));
			if (rc1 != expected[i]) {
				rc = 1;
			}
		}
	}
	JIT_DestroyContext(module);
	printf("Test11 %s\n", rc == 0 ? "Okay" : "Failed");
	return rc;
}

static int test12(int argc, char **argv)
{
	const char *code[] = 
		{ 
		"int cmpeq(int v) {return v == 4; }\n",
		"int cmpeq2(int v) {return v == 4; }\n",
		"int cmpne(int v) {return v != 4; }\n",
		"int cmple(int v) {return v <= 4; }\n",
		"int cmplt(int v) {return v < 4; }\n",
		"int cmpge(int v) {return v >= 4; }\n",
		"int cmpgt(int v) {return v > 4; }\n"
		};
	const char *names[] = {
		"cmpeq",
		"cmpeq2",
		"cmpne",
		"cmple",
		"cmplt",
		"cmpge",
		"cmpgt"
	};
	int input[] = { 4, 3, 3, 5, 3, 3, 9 };
	int expected[] = { 1, 0, 1, 0, 1, 0, 1 };

	int(*fp)(int v) = NULL;
	JIT_ContextRef module = JIT_CreateContext();
	int rc = 0;
	
	for (int i = 0; i < sizeof input / sizeof input[0]; i++) {
		if (!dmrC_omrcompile(argc, argv, module, code[i])) {
			printf("Test12: %s failed to compile\n", names[i]);
			rc = 1;
			continue;
		}
		fp = JIT_GetFunction(module, names[i]);
		if (rc == 0 && fp) {
			int rc1 = fp(input[i]);
			if (rc1 != expected[i]) {
				printf("Test12: %s failed: Got %d expected %d\n", names[i], rc1, expected[i]);
				rc = 1;
			}
		}
	}
	JIT_DestroyContext(module);
	printf("Test12 %s\n", rc == 0 ? "Okay" : "Failed");
	return rc;
}


int main(int argc, char **argv)
{
	int rc = 0;
	rc += test1(argc, argv);
	rc += test2(argc, argv);
	rc += test3(argc, argv);
	rc += test4(argc, argv);
	rc += test5(argc, argv);
	rc += test6(argc, argv);
	rc += test7(argc, argv);
	rc += test8(argc, argv);
	rc += test9(argc, argv);
	rc += test10(argc, argv);
	rc += test11(argc, argv);
	rc += test12(argc, argv);
	if (rc == 0)
		printf("Test OK\n");
	else
		printf("Test FAILED\n");
	return rc;
}
