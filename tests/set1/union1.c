typedef union GCObject GCObject;
typedef unsigned char lu_byte;
typedef double lua_Number;

typedef union {
	GCObject *gc;
	void *p;
	lua_Number n;
	int b;
} Value;
typedef struct lua_TValue {
	Value value;
	int tt;
} TValue;
typedef struct UpVal {
	GCObject *next;
	lu_byte tt;
	lu_byte marked;
	TValue *v;
	union {
		TValue value;
		struct {
			struct UpVal *prev;
			struct UpVal *next;
		} l;
	} u;
} UpVal;

static int close(UpVal *uv) 
{
	uv->v = &uv->u.value;
	return uv->u.value.tt;
}

int main(void)
{
	UpVal uv;
	uv.u.value.tt = 5;
	int tt = close(&uv);
	return uv.v == &uv.u.value && tt == 5 ? 0 : 1;
}
