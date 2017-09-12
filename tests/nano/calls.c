extern long long printlllii(long long a, long long b, long long c, int d, int e);

int TestNano()
{
	long long j = printlllii(1,1,1,1,1);
	return j == 5 ? 0 : 1;
}