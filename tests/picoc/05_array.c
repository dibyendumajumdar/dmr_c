extern int printf(const char *fmt, ...);

int main(void) {

	int Count;
	int Array[10];

	for (Count = 1; Count <= 10; Count++)
	{
    	Array[Count-1] = Count * Count;
	}

	for (Count = 0; Count < 10; Count++)
	{
    	printf("%d\n", Array[Count]);
	}

	return 0;
}
