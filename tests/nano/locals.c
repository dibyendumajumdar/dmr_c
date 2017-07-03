/*
struct S {
	char name[30];
	char surname[30];
	int age_in_years;
	double weight;
};


extern void initS(struct S *s);

int getage(void)
{
	struct S s;
	initS(&s);
	return s.age_in_years;
}
*/

int simplelocals(void (*fp)(int*, long long*)) 
{
	int a = 5;
	long long b = 42;
	fp(&a, &b);
	return a+(int)b;
} 
