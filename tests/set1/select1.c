typedef union GCObject GCObject;
typedef union {
	GCObject *gc;
	void *p;
	int b;
} Value;
typedef struct lua_TValue {
	Value value;
	int tt;
} TValue;

typedef struct CClosure {
	GCObject *next;
	TValue upvalue[1];
} CClosure;
typedef struct LClosure {
	GCObject *next;
	GCObject *gclist;
} LClosure;
typedef union Closure {
	CClosure c;
	LClosure l;
} Closure;

static TValue luaO_nilobject_;

static TValue *select(Closure *closure, int op)
{
	return op == 1 ? &closure->c.upvalue[0] : (TValue *) &luaO_nilobject_;
}

int main(void)
{
	Closure cl;

	return select(&cl, 0) == &luaO_nilobject_ && select(&cl, 1) != &luaO_nilobject_ ? 0 : 1;
}
