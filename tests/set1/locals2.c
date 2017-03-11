/* Purpose of this test is to validate that locally scoped 
   variables are correctly handled. Two locals are named 'x' but
   have different sizes. */

struct mytype {
	int a, b;
	double c;
};

static void init(struct mytype *v) {
	v->a = 5;
	v->b = 5;
}

int main(int argc, const char *argv[]) {
	
	int n = 0;

	{
		struct mytype x[5];
		init((struct mytype *)x);
		n += x[0].b;
	}

	{ 
		struct mytype x[6];
		init((struct mytype *)x);
		n += x[0].a;
	}

	return n == 10 ? 0 : 1;
}
