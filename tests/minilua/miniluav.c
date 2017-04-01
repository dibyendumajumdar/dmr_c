

const char *luaO_pushvfstring(lua_State *L, const char *fmt,
				     va_list argp)
{
	int n = 1;
	pushstr(L, "");
	for (;;) {
		const char *e = strchr(fmt, '%');
		if (e == NULL)
			break;
		setsvalue(L, L->top, luaS_newlstr(L, fmt, e - fmt));
		incr_top(L);
		switch (*(e + 1)) {
		case 's': {
			const char *s = va_arg(argp, char *);
			if (s == NULL)
				s = "(null)";
			pushstr(L, s);
			break;
		}
		case 'c': {
			char buff[2];
			buff[0] = cast(char, va_arg(argp, int));
			buff[1] = '\0';
			pushstr(L, buff);
			break;
		}
		case 'd': {
			setnvalue(L->top, cast_num(va_arg(argp, int)));
			incr_top(L);
			break;
		}
		case 'f': {
			setnvalue(L->top, cast_num(va_arg(argp, l_uacNumber)));
			incr_top(L);
			break;
		}
		case 'p': {
			char buff[4 * sizeof(void *) + 8];
			sprintf(buff, "%p", va_arg(argp, void *));
			pushstr(L, buff);
			break;
		}
		case '%': {
			pushstr(L, "%");
			break;
		}
		default: {
			char buff[3];
			buff[0] = '%';
			buff[1] = *(e + 1);
			buff[2] = '\0';
			pushstr(L, buff);
			break;
		}
		}
		n += 2;
		fmt = e + 2;
	}
	pushstr(L, fmt);
	luaV_concat(L, n + 1, cast_int(L->top - L->base) - 1);
	L->top -= n;
	return svalue(L->top - 1);
}

const char *luaO_pushfstring(lua_State *L, const char *fmt, ...)
{
	const char *msg;
	va_list argp;
	va_start(argp, fmt);
	msg = luaO_pushvfstring(L, fmt, argp);
	va_end(argp);
	return msg;
}

void luaG_runerror(lua_State *L, const char *fmt, ...)
{
	va_list argp;
	va_start(argp, fmt);
	addinfo(L, luaO_pushvfstring(L, fmt, argp));
	va_end(argp);
	luaG_errormsg(L);
}

static const char *lua_pushvfstring(lua_State *L, const char *fmt, va_list argp)
{
	const char *ret;
	luaC_checkGC(L);
	ret = luaO_pushvfstring(L, fmt, argp);
	return ret;
}

const char *lua_pushfstring(lua_State *L, const char *fmt, ...)
{
	const char *ret;
	va_list argp;
	luaC_checkGC(L);
	va_start(argp, fmt);
	ret = luaO_pushvfstring(L, fmt, argp);
	va_end(argp);
	return ret;
}

int luaL_error(lua_State *L, const char *fmt, ...)
{
	va_list argp;
	va_start(argp, fmt);
	luaL_where(L, 1);
	lua_pushvfstring(L, fmt, argp);
	va_end(argp);
	lua_concat(L, 2);
	return lua_error(L);
}

