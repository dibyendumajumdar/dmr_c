extern int printf(const char *, ...);

int main(void)
{
	int x = 6;
	const char txt[] = "local string %d %f %f\n";
	float g = 4.2;
	double e = 42.34;

	printf(txt, x, g, e);		

	return 0;
}
