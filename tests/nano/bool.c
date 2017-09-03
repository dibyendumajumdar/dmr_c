static int adder(int a)
{
	if (a+1)
		return 1;
	return 0;
}

int TestNano(void)
{
	int rc = 0;
	rc += adder(-1);
	return rc;
}
