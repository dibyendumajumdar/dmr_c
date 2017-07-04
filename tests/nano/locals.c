struct S {
	char name[30];
	char surname[30];
	int age_in_years;
	double weight;
};

int initS(struct S *s)
{
	s->age_in_years = 99;
	return 0;
}

int getage(void)
{
	struct S s;
	initS(&s);
	return s.age_in_years;
}

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
