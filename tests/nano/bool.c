static int adder(int a)
{
	if (a+1)
		return 1;
	return 0;
}

static int booland(int a)
{
	return a > 0 && 0 <= 0;
}

static int boolor(int a)
{
	return a > 0 || 0 <= 0;
}

int TestNano(void)
{
	int rc = 0;
	rc += adder(-1);
	rc += (booland(1) == 1 ? 0 : 1);
	rc += (boolor(-1) == 1 ? 0 : 1);
	return rc;
}
