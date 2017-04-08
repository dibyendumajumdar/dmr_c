long long strlen(const char *s)
{
	long long n = 0;
	while (s[n] != 0)
		n++;
	return n;
}