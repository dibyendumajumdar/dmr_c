extern int printf(const char *fmt, ...);
#define NULL ((void *)0)

int main(void)
{
	int a;
	int *b;
	int *c;

	a = 42;
	b = &a;
	c = NULL;

	printf("%d\n", *b);

	if (b == NULL)
	    printf("b is NULL\n");
	else
	    printf("b is not NULL\n");

	if (c == NULL)
	    printf("c is NULL\n");
	else
	    printf("c is not NULL\n");


	return 0;
}
