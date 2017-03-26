extern int printf(const char *s, ...);

struct foo {	
	long long int i,j;
};

static void dosomething(struct foo *foo)
{
	printf("foo->i = %lld, foo->j = %lld\n", foo->i, foo->j);
}

int main(void)
{
	struct foo foo = { 1, 2 };
	struct foo bar = { 99 };
	dosomething(&foo);
	dosomething(&bar);
	return 0;
}