extern void dosomething(const char **);
#define NULL ((void *)0)
int main(void)
{
	const char *names[] = {
		"dibyendu",
		"majumdar",
		NULL,
	};

	dosomething(names);
	return 0;
}
