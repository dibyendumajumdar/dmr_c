extern int printf(const char *, ...);

static int print(int *p)
{
	printf("value %d\n", *p);
	return *p;	
}

int main(void)
{
	int escapelist = (-1);
	return print(&escapelist) == -1 ? 0 : 1;
}
