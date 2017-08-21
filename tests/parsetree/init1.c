struct S {
	int a;
	int b;
} s = { .b = 1, .a = 2 };

char hello[] = { 'a', 'b', [5] = 'c'};

void foo(void)
{
	struct S s2 = (struct S) { .a = s.b, .b = s.a };
}