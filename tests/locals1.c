/* Purpose of this test is to validate that locally scoped 
   variables are correctly handled. Two locals are named 'x' but
   have different sizes. */

static void init(int *v) {
	*v = 5;
}

int main(int argc, const char *argv[]) {
	
	int n = 0;

	{
		int x[5];
		init((int *)x);
		n += x[0];
	}

	{ 
		int x[6];
		init((int *)x);
		n += x[0];
	}

	return n == 10 ? 0 : 1;
}
