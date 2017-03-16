static double test(double *p)
{
	double x;

	x = *p;

	return x;
}

int main(void)
{
	
	double u,v;
	v = 42.0;
	u = test(&v);
	return v == 42.0 ? 0 : 1;
}
