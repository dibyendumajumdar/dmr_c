#ifndef __minilua_h__
#define __minilua_h__

/* This is a heavily customized and minimized copy of Lua 5.1.5. */
/* It's only used to build LuaJIT. It does NOT have all standard functions! */
/******************************************************************************
* Copyright (C) 1994-2012 Lua.org, PUC-Rio.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining
* a copy of this software and associated documentation files (the
* "Software"), to deal in the Software without restriction, including
* without limitation the rights to use, copy, modify, merge, publish,
* distribute, sublicense, and/or sell copies of the Software, and to
* permit persons to whom the Software is furnished to do so, subject to
* the following conditions:
*
* The above copyright notice and this permission notice shall be
* included in all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
* EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
* MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
* IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
* CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
* TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
* SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
******************************************************************************/
#ifndef __DMR_C__
#define INITIALIZER_SUPPORTED 1
#endif
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
typedef struct lua_State lua_State;
typedef int (*lua_CFunction)(lua_State *L);
typedef const char *(*lua_Reader)(lua_State *L, void *ud, size_t *sz);
typedef void *(*lua_Alloc)(void *ud, void *ptr, size_t osize, size_t nsize);
typedef double lua_Number;
typedef ptrdiff_t lua_Integer;
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
#if __DMR_C__
#define setobj(L, obj1, obj2)                                                  \
	{                                                                      \
		const TValue *o2 = (obj2);                                     \
		TValue *o1 = (obj1);                                           \
		o1->value.n = o2->value.n;                                         \
		o1->tt = o2->tt;                                               \
		checkliveness(G(L), o1);                                       \
	}
#else
#define setobj(L, obj1, obj2)                                                  \
	{                                                                      \
		const TValue *o2 = (obj2);                                     \
		TValue *o1 = (obj1);                                           \
		o1->value = o2->value;                                         \
		o1->tt = o2->tt;                                               \
		checkliveness(G(L), o1);                                       \
	}
#endif
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
typedef struct Mbuffer {
	char *buffer;
	size_t n;
	size_t buffsize;
} Mbuffer;
struct Zio {
	size_t n;
	const char *p;
	lua_Reader reader;
	void *data;
	lua_State *L;
};
typedef struct Zio ZIO;
struct lua_longjmp;
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


extern void pushstr(lua_State *L, const char *str);
extern void luaV_concat(lua_State *L, int total, int last);
extern TString *luaS_newlstr(lua_State *L, const char *str, size_t l);
extern void luaD_reallocstack(lua_State *L, int newsize);
extern void luaD_growstack(lua_State *L, int n);
extern void addinfo(lua_State *L, const char *msg);
extern void luaG_errormsg(lua_State *L);
extern void luaC_step(lua_State *L);
#define luaC_checkGC(L)                                                        \
	{                                                                      \
		condhardstacktests(                                            \
		    luaD_reallocstack(L, L->stacksize - 5 - 1));               \
		if (G(L)->totalbytes >= G(L)->GCthreshold)                     \
			luaC_step(L);                                          \
	}
extern void luaL_where(lua_State *L, int level);
extern int lua_error(lua_State *L);
extern void lua_concat(lua_State *L, int n);
extern int luaL_error(lua_State *L, const char *fmt, ...);
extern const char *lua_pushfstring(lua_State *L, const char *fmt, ...);

#endif
