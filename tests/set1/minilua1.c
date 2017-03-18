#define INITIALIZER_SUPPORTED 0
#ifdef _MSC_VER
typedef unsigned __int64 U64;
#else
typedef unsigned long long U64;
#endif
static int _CRT_glob = 0;
#include <ctype.h>
#include <errno.h>
#include <limits.h>
#include <math.h>
#include <setjmp.h>
#include <stdarg.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
typedef enum {
	TM_INDEX,
	TM_NEWINDEX,
	TM_GC,
	TM_MODE,
	TM_EQ,
	TM_ADD,
	TM_SUB,
	TM_MUL,
	TM_DIV,
	TM_MOD,
	TM_POW,
	TM_UNM,
	TM_LEN,
	TM_LT,
	TM_LE,
	TM_CONCAT,
	TM_CALL,
	TM_N
} TMS;
enum OpMode { iABC, iABx, iAsBx };
typedef enum {
	OP_MOVE,
	OP_LOADK,
	OP_LOADBOOL,
	OP_LOADNIL,
	OP_GETUPVAL,
	OP_GETGLOBAL,
	OP_GETTABLE,
	OP_SETGLOBAL,
	OP_SETUPVAL,
	OP_SETTABLE,
	OP_NEWTABLE,
	OP_SELF,
	OP_ADD,
	OP_SUB,
	OP_MUL,
	OP_DIV,
	OP_MOD,
	OP_POW,
	OP_UNM,
	OP_NOT,
	OP_LEN,
	OP_CONCAT,
	OP_JMP,
	OP_EQ,
	OP_LT,
	OP_LE,
	OP_TEST,
	OP_TESTSET,
	OP_CALL,
	OP_TAILCALL,
	OP_RETURN,
	OP_FORLOOP,
	OP_FORPREP,
	OP_TFORLOOP,
	OP_SETLIST,
	OP_CLOSE,
	OP_CLOSURE,
	OP_VARARG
} OpCode;
enum OpArgMask { OpArgN, OpArgU, OpArgR, OpArgK };
typedef enum {
	VVOID,
	VNIL,
	VTRUE,
	VFALSE,
	VK,
	VKNUM,
	VLOCAL,
	VUPVAL,
	VGLOBAL,
	VINDEXED,
	VJMP,
	VRELOCABLE,
	VNONRELOC,
	VCALL,
	VVARARG
} expkind;
enum RESERVED {
	TK_AND = 257,
	TK_BREAK,
	TK_DO,
	TK_ELSE,
	TK_ELSEIF,
	TK_END,
	TK_FALSE,
	TK_FOR,
	TK_FUNCTION,
	TK_IF,
	TK_IN,
	TK_LOCAL,
	TK_NIL,
	TK_NOT,
	TK_OR,
	TK_REPEAT,
	TK_RETURN,
	TK_THEN,
	TK_TRUE,
	TK_UNTIL,
	TK_WHILE,
	TK_CONCAT,
	TK_DOTS,
	TK_EQ,
	TK_GE,
	TK_LE,
	TK_NE,
	TK_NUMBER,
	TK_NAME,
	TK_STRING,
	TK_EOS
};
typedef enum BinOpr {
	OPR_ADD,
	OPR_SUB,
	OPR_MUL,
	OPR_DIV,
	OPR_MOD,
	OPR_POW,
	OPR_CONCAT,
	OPR_NE,
	OPR_EQ,
	OPR_LT,
	OPR_LE,
	OPR_GT,
	OPR_GE,
	OPR_AND,
	OPR_OR,
	OPR_NOBINOPR
} BinOpr;
typedef enum UnOpr { OPR_MINUS, OPR_NOT, OPR_LEN, OPR_NOUNOPR } UnOpr;
#define LUA_QL(x) "'" x "'"
#define luai_apicheck(L, o)                                                    \
	{                                                                      \
		(void)L;                                                       \
	}
#define lua_number2str(s, n) sprintf((s), "%.14g", (n))
#define lua_str2number(s, p) strtod((s), (p))
#define luai_numadd(a, b) ((a) + (b))
#define luai_numsub(a, b) ((a) - (b))
#define luai_nummul(a, b) ((a) * (b))
#define luai_numdiv(a, b) ((a) / (b))
#define luai_nummod(a, b) ((a)-floor((a) / (b)) * (b))
#define luai_numpow(a, b) (pow(a, b))
#define luai_numunm(a) (-(a))
#define luai_numeq(a, b) ((a) == (b))
#define luai_numlt(a, b) ((a) < (b))
#define luai_numle(a, b) ((a) <= (b))
#define luai_numisnan(a) (!luai_numeq((a), (a)))
#define lua_number2int(i, d) ((i) = (int)(d))
#define lua_number2integer(i, d) ((i) = (lua_Integer)(d))
#define LUAI_THROW(L, c) longjmp((c)->b, 1)
#define LUAI_TRY(L, c, a)                                                      \
	if (setjmp((c)->b) == 0) {                                             \
		a                                                              \
	}
#define lua_pclose(L, file) ((void)((void)L, file), 0)
#define lua_upvalueindex(i) ((-10002) - (i))
typedef struct lua_State lua_State;
typedef int (*lua_CFunction)(lua_State *L);
typedef const char *(*lua_Reader)(lua_State *L, void *ud, size_t *sz);
typedef void *(*lua_Alloc)(void *ud, void *ptr, size_t osize, size_t nsize);
typedef double lua_Number;
typedef ptrdiff_t lua_Integer;
static void lua_settop(lua_State *L, int idx);
static int lua_type(lua_State *L, int idx);
static const char *lua_tolstring(lua_State *L, int idx, size_t *len);
static size_t lua_objlen(lua_State *L, int idx);
static void lua_pushlstring(lua_State *L, const char *s, size_t l);
static void lua_pushcclosure(lua_State *L, lua_CFunction fn, int n);
static void lua_createtable(lua_State *L, int narr, int nrec);
static void lua_setfield(lua_State *L, int idx, const char *k);
#define lua_pop(L, n) lua_settop(L, -(n)-1)
#define lua_newtable(L) lua_createtable(L, 0, 0)
#define lua_pushcfunction(L, f) lua_pushcclosure(L, (f), 0)
#define lua_strlen(L, i) lua_objlen(L, (i))
#define lua_isfunction(L, n) (lua_type(L, (n)) == 6)
#define lua_istable(L, n) (lua_type(L, (n)) == 5)
#define lua_isnil(L, n) (lua_type(L, (n)) == 0)
#define lua_isboolean(L, n) (lua_type(L, (n)) == 1)
#define lua_isnone(L, n) (lua_type(L, (n)) == (-1))
#define lua_isnoneornil(L, n) (lua_type(L, (n)) <= 0)
#define lua_pushliteral(L, s)                                                  \
	lua_pushlstring(L, ""s, (sizeof(s) / sizeof(char)) - 1)
#define lua_setglobal(L, s) lua_setfield(L, (-10002), (s))
#define lua_tostring(L, i) lua_tolstring(L, (i), NULL)
typedef struct lua_Debug lua_Debug;
typedef void (*lua_Hook)(lua_State *L, lua_Debug *ar);
struct lua_Debug {
	int event;
	const char *name;
	const char *namewhat;
	const char *what;
	const char *source;
	int currentline;
	int nups;
	int linedefined;
	int lastlinedefined;
	char short_src[60];
	int i_ci;
};
typedef unsigned int lu_int32;
typedef size_t lu_mem;
typedef ptrdiff_t l_mem;
typedef unsigned char lu_byte;
#define IntPoint(p) ((unsigned int)(lu_mem)(p))
typedef union {
	double u;
	void *s;
	long l;
} L_Umaxalign;
typedef double l_uacNumber;
#define check_exp(c, e) (e)
#define UNUSED(x) ((void)(x))
#define cast(t, exp) ((t)(exp))
#define cast_byte(i) cast(lu_byte, (i))
#define cast_num(i) cast(lua_Number, (i))
#define cast_int(i) cast(int, (i))
typedef lu_int32 Instruction;
#define condhardstacktests(x) ((void)0)
typedef union GCObject GCObject;
typedef struct GCheader {
	GCObject *next;
	lu_byte tt;
	lu_byte marked;
} GCheader;
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
#define ttisnil(o) (ttype(o) == 0)
#define ttisnumber(o) (ttype(o) == 3)
#define ttisstring(o) (ttype(o) == 4)
#define ttistable(o) (ttype(o) == 5)
#define ttisfunction(o) (ttype(o) == 6)
#define ttisboolean(o) (ttype(o) == 1)
#define ttisuserdata(o) (ttype(o) == 7)
#define ttisthread(o) (ttype(o) == 8)
#define ttislightuserdata(o) (ttype(o) == 2)
#define ttype(o) ((o)->tt)
#define gcvalue(o) check_exp(iscollectable(o), (o)->value.gc)
#define pvalue(o) check_exp(ttislightuserdata(o), (o)->value.p)
#define nvalue(o) check_exp(ttisnumber(o), (o)->value.n)
#define rawtsvalue(o) check_exp(ttisstring(o), &(o)->value.gc->ts)
#define tsvalue(o) (&rawtsvalue(o)->tsv)
#define rawuvalue(o) check_exp(ttisuserdata(o), &(o)->value.gc->u)
#define uvalue(o) (&rawuvalue(o)->uv)
#define clvalue(o) check_exp(ttisfunction(o), &(o)->value.gc->cl)
#define hvalue(o) check_exp(ttistable(o), &(o)->value.gc->h)
#define bvalue(o) check_exp(ttisboolean(o), (o)->value.b)
#define thvalue(o) check_exp(ttisthread(o), &(o)->value.gc->th)
#define l_isfalse(o) (ttisnil(o) || (ttisboolean(o) && bvalue(o) == 0))
#define checkconsistency(obj)
#define checkliveness(g, obj)
#define setnilvalue(obj) ((obj)->tt = 0)
#define setnvalue(obj, x)                                                      \
	{                                                                      \
		TValue *i_o = (obj);                                           \
		i_o->value.n = (x);                                            \
		i_o->tt = 3;                                                   \
	}
#define setbvalue(obj, x)                                                      \
	{                                                                      \
		TValue *i_o = (obj);                                           \
		i_o->value.b = (x);                                            \
		i_o->tt = 1;                                                   \
	}
#define setsvalue(L, obj, x)                                                   \
	{                                                                      \
		TValue *i_o = (obj);                                           \
		i_o->value.gc = cast(GCObject *, (x));                         \
		i_o->tt = 4;                                                   \
		checkliveness(G(L), i_o);                                      \
	}
#define setuvalue(L, obj, x)                                                   \
	{                                                                      \
		TValue *i_o = (obj);                                           \
		i_o->value.gc = cast(GCObject *, (x));                         \
		i_o->tt = 7;                                                   \
		checkliveness(G(L), i_o);                                      \
	}
#define setthvalue(L, obj, x)                                                  \
	{                                                                      \
		TValue *i_o = (obj);                                           \
		i_o->value.gc = cast(GCObject *, (x));                         \
		i_o->tt = 8;                                                   \
		checkliveness(G(L), i_o);                                      \
	}
#define setclvalue(L, obj, x)                                                  \
	{                                                                      \
		TValue *i_o = (obj);                                           \
		i_o->value.gc = cast(GCObject *, (x));                         \
		i_o->tt = 6;                                                   \
		checkliveness(G(L), i_o);                                      \
	}
#define sethvalue(L, obj, x)                                                   \
	{                                                                      \
		TValue *i_o = (obj);                                           \
		i_o->value.gc = cast(GCObject *, (x));                         \
		i_o->tt = 5;                                                   \
		checkliveness(G(L), i_o);                                      \
	}
#define setptvalue(L, obj, x)                                                  \
	{                                                                      \
		TValue *i_o = (obj);                                           \
		i_o->value.gc = cast(GCObject *, (x));                         \
		i_o->tt = (8 + 1);                                             \
		checkliveness(G(L), i_o);                                      \
	}
#define setobj(L, obj1, obj2)                                                  \
	{                                                                      \
		const TValue *o2 = (obj2);                                     \
		TValue *o1 = (obj1);                                           \
		o1->value = o2->value;                                         \
		o1->tt = o2->tt;                                               \
		checkliveness(G(L), o1);                                       \
	}
#define setttype(obj, tt) (ttype(obj) = (tt))
#define iscollectable(o) (ttype(o) >= 4)
typedef TValue *StkId;
typedef union TString {
	L_Umaxalign dummy;
	struct {
		GCObject *next;
		lu_byte tt;
		lu_byte marked;
		lu_byte reserved;
		unsigned int hash;
		size_t len;
	} tsv;
} TString;
#define getstr(ts) cast(const char *, (ts) + 1)
#define svalue(o) getstr(rawtsvalue(o))
typedef union Udata {
	L_Umaxalign dummy;
	struct {
		GCObject *next;
		lu_byte tt;
		lu_byte marked;
		struct Table *metatable;
		struct Table *env;
		size_t len;
	} uv;
} Udata;
typedef struct Proto {
	GCObject *next;
	lu_byte tt;
	lu_byte marked;
	TValue *k;
	Instruction *code;
	struct Proto **p;
	int *lineinfo;
	struct LocVar *locvars;
	TString **upvalues;
	TString *source;
	int sizeupvalues;
	int sizek;
	int sizecode;
	int sizelineinfo;
	int sizep;
	int sizelocvars;
	int linedefined;
	int lastlinedefined;
	GCObject *gclist;
	lu_byte nups;
	lu_byte numparams;
	lu_byte is_vararg;
	lu_byte maxstacksize;
} Proto;
typedef struct LocVar {
	TString *varname;
	int startpc;
	int endpc;
} LocVar;
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
typedef struct CClosure {
	GCObject *next;
	lu_byte tt;
	lu_byte marked;
	lu_byte isC;
	lu_byte nupvalues;
	GCObject *gclist;
	struct Table *env;
	lua_CFunction f;
	TValue upvalue[1];
} CClosure;
typedef struct LClosure {
	GCObject *next;
	lu_byte tt;
	lu_byte marked;
	lu_byte isC;
	lu_byte nupvalues;
	GCObject *gclist;
	struct Table *env;
	struct Proto *p;
	UpVal *upvals[1];
} LClosure;
typedef union Closure {
	CClosure c;
	LClosure l;
} Closure;
#define iscfunction(o) (ttype(o) == 6 && clvalue(o)->c.isC)
typedef union TKey {
	struct {
		Value value;
		int tt;
		struct Node *next;
	} nk;
	TValue tvk;
} TKey;
typedef struct Node {
	TValue i_val;
	TKey i_key;
} Node;
typedef struct Table {
	GCObject *next;
	lu_byte tt;
	lu_byte marked;
	lu_byte flags;
	lu_byte lsizenode;
	struct Table *metatable;
	TValue *array;
	Node *node;
	Node *lastfree;
	GCObject *gclist;
	int sizearray;
} Table;
#define lmod(s, size)                                                          \
	(check_exp((size & (size - 1)) == 0, (cast(int, (s) & ((size)-1)))))
#define twoto(x) ((size_t)1 << (x))
#define sizenode(t) (twoto((t)->lsizenode))
#if INITIALIZER_SUPPORTED
static const TValue luaO_nilobject_;
#else
static TValue luaO_nilobject_;
#endif
#define ceillog2(x) (luaO_log2((x)-1) + 1)
static int luaO_log2(unsigned int x);
#define gfasttm(g, et, e)                                                      \
	((et) == NULL ? NULL                                                   \
		      : ((et)->flags & (1u << (e)))                            \
			    ? NULL                                             \
			    : luaT_gettm(et, e, (g)->tmname[e]))
#define fasttm(l, et, e) gfasttm(G(l), et, e)
static const TValue *luaT_gettm(Table *events, TMS event, TString *ename);
#define luaM_reallocv(L, b, on, n, e)                                          \
	((cast(size_t, (n) + 1) <= ((size_t)(~(size_t)0) - 2) / (e))           \
	     ? luaM_realloc_(L, (b), (on) * (e), (n) * (e))                    \
	     : luaM_toobig(L))
#define luaM_freemem(L, b, s) luaM_realloc_(L, (b), (s), 0)
#define luaM_free(L, b) luaM_realloc_(L, (b), sizeof(*(b)), 0)
#define luaM_freearray(L, b, n, t) luaM_reallocv(L, (b), n, 0, sizeof(t))
#define luaM_malloc(L, t) luaM_realloc_(L, NULL, 0, (t))
#define luaM_new(L, t) cast(t *, luaM_malloc(L, sizeof(t)))
#define luaM_newvector(L, n, t)                                                \
	cast(t *, luaM_reallocv(L, NULL, 0, n, sizeof(t)))
#define luaM_growvector(L, v, nelems, size, t, limit, e)                       \
	if ((nelems) + 1 > (size))                                             \
	((v) = cast(t *, luaM_growaux_(L, v, &(size), sizeof(t), limit, e)))
#define luaM_reallocvector(L, v, oldn, n, t)                                   \
	((v) = cast(t *, luaM_reallocv(L, v, oldn, n, sizeof(t))))
static void *luaM_realloc_(lua_State *L, void *block, size_t oldsize,
			   size_t size);
static void *luaM_toobig(lua_State *L);
static void *luaM_growaux_(lua_State *L, void *block, int *size,
			   size_t size_elem, int limit, const char *errormsg);
typedef struct Zio ZIO;
#define char2int(c) cast(int, cast(unsigned char, (c)))
#define zgetc(z) (((z)->n--) > 0 ? char2int(*(z)->p++) : luaZ_fill(z))
typedef struct Mbuffer {
	char *buffer;
	size_t n;
	size_t buffsize;
} Mbuffer;
#define luaZ_initbuffer(L, buff) ((buff)->buffer = NULL, (buff)->buffsize = 0)
#define luaZ_buffer(buff) ((buff)->buffer)
#define luaZ_sizebuffer(buff) ((buff)->buffsize)
#define luaZ_bufflen(buff) ((buff)->n)
#define luaZ_resetbuffer(buff) ((buff)->n = 0)
#define luaZ_resizebuffer(L, buff, size)                                       \
	(luaM_reallocvector(L, (buff)->buffer, (buff)->buffsize, size, char),  \
	 (buff)->buffsize = size)
#define luaZ_freebuffer(L, buff) luaZ_resizebuffer(L, buff, 0)
struct Zio {
	size_t n;
	const char *p;
	lua_Reader reader;
	void *data;
	lua_State *L;
};
static int luaZ_fill(ZIO *z);
struct lua_longjmp;
#define gt(L) (&L->l_gt)
#define registry(L) (&G(L)->l_registry)
typedef struct stringtable {
	GCObject **hash;
	lu_int32 nuse;
	int size;
} stringtable;
typedef struct CallInfo {
	StkId base;
	StkId func;
	StkId top;
	const Instruction *savedpc;
	int nresults;
	int tailcalls;
} CallInfo;
#define curr_func(L) (clvalue(L->ci->func))
#define ci_func(ci) (clvalue((ci)->func))
#define f_isLua(ci) (!ci_func(ci)->c.isC)
#define isLua(ci) (ttisfunction((ci)->func) && f_isLua(ci))
typedef struct global_State {
	stringtable strt;
	lua_Alloc frealloc;
	void *ud;
	lu_byte currentwhite;
	lu_byte gcstate;
	int sweepstrgc;
	GCObject *rootgc;
	GCObject **sweepgc;
	GCObject *gray;
	GCObject *grayagain;
	GCObject *weak;
	GCObject *tmudata;
	Mbuffer buff;
	lu_mem GCthreshold;
	lu_mem totalbytes;
	lu_mem estimate;
	lu_mem gcdept;
	int gcpause;
	int gcstepmul;
	lua_CFunction panic;
	TValue l_registry;
	struct lua_State *mainthread;
	UpVal uvhead;
	struct Table *mt[(8 + 1)];
	TString *tmname[TM_N];
} global_State;
struct lua_State {
	GCObject *next;
	lu_byte tt;
	lu_byte marked;
	lu_byte status;
	StkId top;
	StkId base;
	global_State *l_G;
	CallInfo *ci;
	const Instruction *savedpc;
	StkId stack_last;
	StkId stack;
	CallInfo *end_ci;
	CallInfo *base_ci;
	int stacksize;
	int size_ci;
	unsigned short nCcalls;
	unsigned short baseCcalls;
	lu_byte hookmask;
	lu_byte allowhook;
	int basehookcount;
	int hookcount;
	lua_Hook hook;
	TValue l_gt;
	TValue env;
	GCObject *openupval;
	GCObject *gclist;
	struct lua_longjmp *errorJmp;
	ptrdiff_t errfunc;
};
#define G(L) (L->l_G)
union GCObject {
	GCheader gch;
	union TString ts;
	union Udata u;
	union Closure cl;
	struct Table h;
	struct Proto p;
	struct UpVal uv;
	struct lua_State th;
};
#define rawgco2ts(o) check_exp((o)->gch.tt == 4, &((o)->ts))
#define gco2ts(o) (&rawgco2ts(o)->tsv)
#define rawgco2u(o) check_exp((o)->gch.tt == 7, &((o)->u))
#define gco2u(o) (&rawgco2u(o)->uv)
#define gco2cl(o) check_exp((o)->gch.tt == 6, &((o)->cl))
#define gco2h(o) check_exp((o)->gch.tt == 5, &((o)->h))
#define gco2p(o) check_exp((o)->gch.tt == (8 + 1), &((o)->p))
#define gco2uv(o) check_exp((o)->gch.tt == (8 + 2), &((o)->uv))
#define ngcotouv(o) check_exp((o) == NULL || (o)->gch.tt == (8 + 2), &((o)->uv))
#define gco2th(o) check_exp((o)->gch.tt == 8, &((o)->th))
#define obj2gco(v) (cast(GCObject *, (v)))
static void luaE_freethread(lua_State *L, lua_State *L1);
#define pcRel(pc, p) (cast(int, (pc) - (p)->code) - 1)
#define getline_(f, pc) (((f)->lineinfo) ? (f)->lineinfo[pc] : 0)
#define resethookcount(L) (L->hookcount = L->basehookcount)
static void luaG_typeerror(lua_State *L, const TValue *o, const char *opname);
static void luaG_runerror(lua_State *L, const char *fmt, ...);
#define luaD_checkstack(L, n)                                                  \
	if ((char *)L->stack_last - (char *)L->top <=                          \
	    (n) * (int)sizeof(TValue))                                         \
		luaD_growstack(L, n);                                          \
	else                                                                   \
		condhardstacktests(luaD_reallocstack(L, L->stacksize - 5 - 1));
#define incr_top(L)                                                            \
	{                                                                      \
		luaD_checkstack(L, 1);                                         \
		L->top++;                                                      \
	}
#define savestack(L, p) ((char *)(p) - (char *)L->stack)
#define restorestack(L, n) ((TValue *)((char *)L->stack + (n)))
#define saveci(L, p) ((char *)(p) - (char *)L->base_ci)
#define restoreci(L, n) ((CallInfo *)((char *)L->base_ci + (n)))
typedef void (*Pfunc)(lua_State *L, void *ud);
static int luaD_poscall(lua_State *L, StkId firstResult);
static void luaD_reallocCI(lua_State *L, int newsize);
static void luaD_reallocstack(lua_State *L, int newsize);
static void luaD_growstack(lua_State *L, int n);
static void luaD_throw(lua_State *L, int errcode);

static void luaV_concat(lua_State *L, int total, int last)
{
			do {
			StkId top = L->base + last + 1;
			int n = 2;
			if (!((((top - 2)->tt) == 4) || (((top - 2)->tt) == 3)) ||
			!((((top - 1)->tt) == 4) || (luaV_tostring(L, top - 1)))) {
			if (!call_binTM(L, top - 2, top - 1, top - 2,
			TM_CONCAT))
			luaG_concaterror(L, top - 2, top - 1);
			} else if ((&(&(top - 1)->value.gc->ts)->tsv)->len == 0)
			(void)((((top - 2)->tt) == 4) || (luaV_tostring(L, top - 2)));
			else {
			size_t tl = (&(&(top - 1)->value.gc->ts)->tsv)->len;
			char *buffer;
			int i;
			for (n = 1; n < total && ((((top - n - 1)->tt) == 4) || (luaV_tostring(L, top - n - 1)));
			n++) {
			size_t l = (&(&(top - n - 1)->value.gc->ts)->tsv)->len;
			if (l >= ((size_t)(~(size_t)0) - 2) - tl)
			luaG_runerror(L,
			"string length overflow");
			tl += l;
			}
			buffer = luaZ_openspace(L, &(L->l_G)->buff, tl);
			tl = 0;
			for (i = n; i > 0; i--) {
			size_t l = (&(&(top - i)->value.gc->ts)->tsv)->len;
			memcpy(buffer + tl, ((const char *)(((&(top - i)->value.gc->ts)) + 1)), l);
			tl += l;
			}
			{ TValue *i_o = (top - n); i_o->value.gc = ((GCObject *)((luaS_newlstr(L, buffer, tl)))); i_o->tt = 4;; };
			}
			total -= n - 1;
			last -= n - 1;
			} while (total > 1);
}
