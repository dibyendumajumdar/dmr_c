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
