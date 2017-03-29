extern int printf(const char *, ...);

#define NULL ((void *)0)
static int dosomething(const char **strings) 
{
	const char **s = strings;
	int i = 0;
	for (; *s != NULL; s++) {
		printf("%s\n", *s);
		i++;
	}
	return i; 
}
int main(void)
{
	const char *names[] = {
		"dibyendu",
		"majumdar",
		NULL,
	};
	return dosomething(names) == 2 ? 0 : 1;
}
