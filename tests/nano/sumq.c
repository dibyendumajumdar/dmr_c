long long sumq(long long len, long long *array)
{
	long long n = 0;
	long long i = 0;
	for (i = 0; i < len; i++)
		n += array[i];
	return n;
}