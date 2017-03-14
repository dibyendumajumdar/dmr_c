struct foo {	
	int i,j;
};

extern void dosomething(struct foo *);

int main(void)
{
	struct foo foo = { 1, 2 };
	dosomething(&foo);
	return 0;
}