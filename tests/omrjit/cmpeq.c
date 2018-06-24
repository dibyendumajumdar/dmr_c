extern int comp(long long a);
int comp(long long a) { return a == 4; }

int TestNano(void)
{
	return !comp(5) && comp(4) ? 0 : 1;
}