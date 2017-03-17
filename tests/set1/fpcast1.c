extern int printf(const char *, ...);
double f1(void) { return -1; }
  double f2(void) { return (double)-1; }
  double f3(void) { return -1.0; }
  
int main(void)
{
	float a = 'a';
	printf("%f\n", (double)a);

	return 0;
}
