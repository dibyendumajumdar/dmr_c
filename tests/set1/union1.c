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

static void close(UpVal *uv) 
{
	uv->v = &uv->u.value;
}

int main(void)
{
	UpVal uv;
	close(&uv);
	return uv.v == &uv.u.value ? 0 : 1;
}