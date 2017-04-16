struct mystruct {
	double d;
	int a, b;
	char array[10];
};

int storeint(struct mystruct *p)
{
	p->array[0] = 'h';
	p->array[1] = 'e';
	p->array[2] = 'l';
	p->array[3] = 'l';
	p->array[4] = 'o';
	p->array[5] = 0;
	p->a = 42;
	p->b = 96;
	//p->d = 300.42;

	return 0;
}
