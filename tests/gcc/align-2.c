
int TestNano(void)
{

/* Simple alignment checks;
   looking for compiler/assembler alignment disagreements,
   agreement between struct initialization and access.  */
#if 0   
struct a_short { char c; short s; } s_c_s = { 'a', 13 };
struct a_int { char c ; int i; } s_c_i = { 'b', 14 };
struct b_int { short s; int i; } s_s_i  = { 15, 16 };
struct a_float { char c; float f; } s_c_f = { 'c', 17.0 };
struct b_float { short s; float f; } s_s_f = { 18, 19.0 };
struct a_double { char c; double d; } s_c_d = { 'd', 20.0 };
struct b_double { short s; double d; } s_s_d = { 21, 22.0 };
struct c_double { int i; double d; } s_i_d = { 23, 24.0 };
struct d_double { float f; double d; } s_f_d = { 25.0, 26.0 };
#else
struct a_short { char c; short s; } s_c_s;
s_c_s.c = 'a'; s_c_s.s = 13 ;
struct a_int { char c ; int i; } s_c_i;
s_c_i.c = 'b'; s_c_i.i = 14 ;
struct b_int { short s; int i; } s_s_i;
s_s_i.s = 15; s_s_i.i = 16 ;
struct a_float { char c; float f; } s_c_f;
s_c_f.c = 'c'; s_c_f.f = 17.0 ;
struct b_float { short s; float f; } s_s_f;
s_s_f.s = 18; s_s_f.f = 19.0 ;
struct a_double { char c; double d; } s_c_d;
s_c_d.c = 'd'; s_c_d.d = 20.0 ;
struct b_double { short s; double d; } s_s_d;
s_s_d.s = 21; s_s_d.d = 22.0 ;
struct c_double { int i; double d; } s_i_d;
s_i_d.i = 23; s_i_d.d = 24.0 ;
struct d_double { float f; double d; } s_f_d;
s_f_d.f = 25.0; s_f_d.d = 26.0 ;
#endif
// struct a_ldouble { char c; long double ld; } s_c_ld = { 'e', 27.0 };
// struct b_ldouble { short s; long double ld; } s_s_ld = { 28, 29.0 };
// struct c_ldouble { int i; long double ld; } s_i_ld = { 30, 31.0 };
// struct d_ldouble { float f; long double ld; } s_f_ld = { 32.0, 33.0 };
// struct e_ldouble { double d; long double ld; } s_d_ld = { 34.0, 35.0 };

  if (s_c_s.c != 'a') return 1;
  if (s_c_s.s != 13) return 1;
  if (s_c_i.c != 'b') return 1;
  if (s_c_i.i != 14) return 1;
  if (s_s_i.s != 15) return 1;
  if (s_s_i.i != 16) return 1;
  if (s_c_f.c != 'c') return 1;
  if (s_c_f.f != 17.0) return 1;
  if (s_s_f.s != 18) return 1;
  if (s_s_f.f != 19.0) return 1;
  if (s_c_d.c != 'd') return 1;
  if (s_c_d.d != 20.0) return 1;
  if (s_s_d.s != 21) return 1;
  if (s_s_d.d != 22.0) return 1;
  if (s_i_d.i != 23) return 1;
  if (s_i_d.d != 24.0) return 1;
  if (s_f_d.f != 25.0) return 1;
  if (s_f_d.d != 26.0) return 1;
  // if (s_c_ld.c != 'e') return 1;
  // if (s_c_ld.ld != 27.0) return 1;
  // if (s_s_ld.s != 28) return 1;
  // if (s_s_ld.ld != 29.0) return 1;
  // if (s_i_ld.i != 30) return 1;
  // if (s_i_ld.ld != 31.0) return 1;
  // if (s_f_ld.f != 32.0) return 1;
  // if (s_f_ld.ld != 33.0) return 1;
  // if (s_d_ld.d != 34.0) return 1;
  // if (s_d_ld.ld != 35.0) return 1;
  return 0;
}
