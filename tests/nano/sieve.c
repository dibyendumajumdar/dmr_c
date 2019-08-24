/* // Copyright vnmakarov see https://github.com/vnmakarov/mir/issues/2 */
#define SieveSize 8190
int sieve (void) {
	int i, k, prime, count, iter;
	char flags[SieveSize];

	for (iter = 0; iter < 100000; iter++) {
		count = 0;
		for (i = 0; i < SieveSize; i++)
			flags[i] = 1;
		for (i = 0; i < SieveSize; i++)
		if (flags[i]) {
			prime = i + i + 3;
			for (k = i + prime; k < SieveSize; k += prime)
				flags[k] = 0;
			count++;
		}
	}
	return count;
}

#if defined(__OMR_BACKEND__) || defined(__NANOJIT_BACKEND__)
extern void printi(int);
int TestNano(void) {
	int count = sieve();
	printi(count);	
	return 0;
}	
#else
extern int printf(const char *s, ...);
int main(void) {
	int count = sieve();
	printf("%d\n", count);
	return 0;
}
#endif
