typedef int (*lua_CFunction)(const char *,int);

typedef struct luaL_Reg {
	const char *name;
	lua_CFunction func;
} luaL_Reg;

static luaL_Reg base_funcs[1];

extern int printf(const char *, ...);

static int myfunc(const char *name, int p)
{
	printf("%s called with %d\n", name, p);
	return p;
}

static int calling(int p) 
{
	return base_funcs[0].func(base_funcs[0].name, p);
}

int main(void)
{
	base_funcs[0].name = "myfunc";
	base_funcs[0].func = myfunc;

	return calling(42) == 42 ? 0 : 1;	
}
