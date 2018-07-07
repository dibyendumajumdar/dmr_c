int foo(int*i, long long*l)
{
	*i = (int) *l;
	return 0;
}

int simplelocals(void) 
{
	int a = 5;
	long long b = 42;
	foo(&a, &b);	// Just to fool the optimiser
	return a+(int)b;
}

int TestNano(void) {
	return simplelocals() == 84 ? 0 : 1;
}
