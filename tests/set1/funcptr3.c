typedef unsigned int (*binop_t)(int, int);
typedef unsigned int (*unop_t)(int);

#define BINOP 0
#define UNOP 1
static unsigned int execute(int type, void *fn, int arg1, int arg2)
{
	if (type == BINOP)
		return ((binop_t)fn)(arg1,arg2);
	return ((unop_t)fn)(arg1);
}

static unsigned int unary(int arg1)
{
	return arg1+3;
}

#if defined(__OMR_BACKEND__) || defined(__NANOJIT_BACKEND__)
int TestNano(void)
#else
int main(void)
#endif
{
	return execute(UNOP, unary, 3, 10) == 6 ? 0 : 1;  
}
