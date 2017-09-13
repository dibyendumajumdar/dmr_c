extern int printf(const char *, ...);

int test(int a)
{
	int b = a;
	a++;
	return b+a;
}

int main(int argc, const char *argv[])
{

	if (test(5) == 11)
		return 0;

	printf("Test failed\n");
	return 1;
}