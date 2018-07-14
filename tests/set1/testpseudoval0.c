struct A {
	long x,y;
};
struct B {
	char buf[100];
	union {
		int j;
		long long k;
	} u;
};

extern int printf(const char *, ...);
void bar(int j) {
	printf("got %d\n", j);
}

void foo() 
{
	struct A a = { 0 };
	struct B b = { { 0 } };

	a.y == 0 ? bar(1) : bar(0);
	b.u.j == 0 ? bar(1) : bar(0);
	b.u.k == 0 ? bar(1) : bar(0);
}

int main(void)
{
	foo();
	return 0;
}
