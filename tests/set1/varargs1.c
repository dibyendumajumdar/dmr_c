extern int printf(const char *, ...);

int main(int argc, const char *argv[]) 
{	
	int n = printf("Hello world!, from %s%c", "Sparse", '\n');
	n += printf("A very long value %lld\n", 918181788818181LL);
	n += printf("A int value %d\n", (int) 1000000);
	return n == 80 ? 0 : 1;
}
