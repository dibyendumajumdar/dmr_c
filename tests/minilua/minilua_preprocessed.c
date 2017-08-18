
typedef unsigned long long U64;
static int _CRT_glob = 0;
typedef unsigned char __u_char;
typedef unsigned short int __u_short;
typedef unsigned int __u_int;
typedef unsigned long int __u_long;
typedef signed char __int8_t;
typedef unsigned char __uint8_t;
typedef signed short int __int16_t;
typedef unsigned short int __uint16_t;
typedef signed int __int32_t;
typedef unsigned int __uint32_t;
typedef signed long int __int64_t;
typedef unsigned long int __uint64_t;
typedef long int __quad_t;
typedef unsigned long int __u_quad_t;
typedef unsigned long int __dev_t;
typedef unsigned int __uid_t;
typedef unsigned int __gid_t;
typedef unsigned long int __ino_t;
typedef unsigned long int __ino64_t;
typedef unsigned int __mode_t;
typedef unsigned long int __nlink_t;
typedef long int __off_t;
typedef long int __off64_t;
typedef int __pid_t;
typedef struct { int __val[2]; } __fsid_t;
typedef long int __clock_t;
typedef unsigned long int __rlim_t;
typedef unsigned long int __rlim64_t;
typedef unsigned int __id_t;
typedef long int __time_t;
typedef unsigned int __useconds_t;
typedef long int __suseconds_t;
typedef int __daddr_t;
typedef int __key_t;
typedef int __clockid_t;
typedef void * __timer_t;
typedef long int __blksize_t;
typedef long int __blkcnt_t;
typedef long int __blkcnt64_t;
typedef unsigned long int __fsblkcnt_t;
typedef unsigned long int __fsblkcnt64_t;
typedef unsigned long int __fsfilcnt_t;
typedef unsigned long int __fsfilcnt64_t;
typedef long int __fsword_t;
typedef long int __ssize_t;
typedef long int __syscall_slong_t;
typedef unsigned long int __syscall_ulong_t;
typedef __off64_t __loff_t;
typedef __quad_t *__qaddr_t;
typedef char *__caddr_t;
typedef long int __intptr_t;
typedef unsigned int __socklen_t;
static __inline unsigned int
__bswap_32 (unsigned int __bsx)
{
		return __builtin_bswap32 (__bsx);
}
static __inline __uint64_t
__bswap_64 (__uint64_t __bsx)
{
		return __builtin_bswap64 (__bsx);
}
enum
{
		_ISupper = ((0) < 8 ? ((1 << (0)) << 8) : ((1 << (0)) >> 8)),
		_ISlower = ((1) < 8 ? ((1 << (1)) << 8) : ((1 << (1)) >> 8)),
		_ISalpha = ((2) < 8 ? ((1 << (2)) << 8) : ((1 << (2)) >> 8)),
		_ISdigit = ((3) < 8 ? ((1 << (3)) << 8) : ((1 << (3)) >> 8)),
		_ISxdigit = ((4) < 8 ? ((1 << (4)) << 8) : ((1 << (4)) >> 8)),
		_ISspace = ((5) < 8 ? ((1 << (5)) << 8) : ((1 << (5)) >> 8)),
		_ISprint = ((6) < 8 ? ((1 << (6)) << 8) : ((1 << (6)) >> 8)),
		_ISgraph = ((7) < 8 ? ((1 << (7)) << 8) : ((1 << (7)) >> 8)),
		_ISblank = ((8) < 8 ? ((1 << (8)) << 8) : ((1 << (8)) >> 8)),
		_IScntrl = ((9) < 8 ? ((1 << (9)) << 8) : ((1 << (9)) >> 8)),
		_ISpunct = ((10) < 8 ? ((1 << (10)) << 8) : ((1 << (10)) >> 8)),
		_ISalnum = ((11) < 8 ? ((1 << (11)) << 8) : ((1 << (11)) >> 8))
};
extern const unsigned short int **__ctype_b_loc (void)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern const __int32_t **__ctype_tolower_loc (void)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern const __int32_t **__ctype_toupper_loc (void)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int isalnum (int) __attribute__ ((__nothrow__ , __leaf__));
extern int isalpha (int) __attribute__ ((__nothrow__ , __leaf__));
extern int iscntrl (int) __attribute__ ((__nothrow__ , __leaf__));
extern int isdigit (int) __attribute__ ((__nothrow__ , __leaf__));
extern int islower (int) __attribute__ ((__nothrow__ , __leaf__));
extern int isgraph (int) __attribute__ ((__nothrow__ , __leaf__));
extern int isprint (int) __attribute__ ((__nothrow__ , __leaf__));
extern int ispunct (int) __attribute__ ((__nothrow__ , __leaf__));
extern int isspace (int) __attribute__ ((__nothrow__ , __leaf__));
extern int isupper (int) __attribute__ ((__nothrow__ , __leaf__));
extern int isxdigit (int) __attribute__ ((__nothrow__ , __leaf__));
extern int tolower (int __c) __attribute__ ((__nothrow__ , __leaf__));
extern int toupper (int __c) __attribute__ ((__nothrow__ , __leaf__));
extern int isblank (int) __attribute__ ((__nothrow__ , __leaf__));
extern int isascii (int __c) __attribute__ ((__nothrow__ , __leaf__));
extern int toascii (int __c) __attribute__ ((__nothrow__ , __leaf__));
extern int _toupper (int) __attribute__ ((__nothrow__ , __leaf__));
extern int _tolower (int) __attribute__ ((__nothrow__ , __leaf__));
typedef struct __locale_struct
{
		struct __locale_data *__locales[13];
		const unsigned short int *__ctype_b;
		const int *__ctype_tolower;
		const int *__ctype_toupper;
		const char *__names[13];
} *__locale_t;
typedef __locale_t locale_t;
extern int isalnum_l (int, __locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int isalpha_l (int, __locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int iscntrl_l (int, __locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int isdigit_l (int, __locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int islower_l (int, __locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int isgraph_l (int, __locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int isprint_l (int, __locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int ispunct_l (int, __locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int isspace_l (int, __locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int isupper_l (int, __locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int isxdigit_l (int, __locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int isblank_l (int, __locale_t) __attribute__ ((__nothrow__ , __leaf__));
extern int __tolower_l (int __c, __locale_t __l) __attribute__ ((__nothrow__ , __leaf__));
extern int tolower_l (int __c, __locale_t __l) __attribute__ ((__nothrow__ , __leaf__));
extern int __toupper_l (int __c, __locale_t __l) __attribute__ ((__nothrow__ , __leaf__));
extern int toupper_l (int __c, __locale_t __l) __attribute__ ((__nothrow__ , __leaf__));
extern int *__errno_location (void) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
typedef float float_t;
typedef double double_t;
extern double acos (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __acos (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double asin (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __asin (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double atan (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __atan (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double atan2 (double __y, double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __atan2 (double __y, double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double cos (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __cos (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double sin (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __sin (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double tan (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __tan (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double cosh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __cosh (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double sinh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __sinh (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double tanh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __tanh (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double acosh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __acosh (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double asinh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __asinh (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double atanh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __atanh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double exp (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __exp (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double frexp (double __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__)); extern double __frexp (double __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__));
extern double ldexp (double __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__)); extern double __ldexp (double __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__)); extern double log (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __log (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double log10 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __log10 (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double modf (double __x, double *__iptr) __attribute__ ((__nothrow__ , __leaf__)); extern double __modf (double __x, double *__iptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
extern double expm1 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __expm1 (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double log1p (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __log1p (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double logb (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __logb (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double exp2 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __exp2 (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double log2 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __log2 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double pow (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __pow (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));
extern double sqrt (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __sqrt (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double hypot (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __hypot (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));
extern double cbrt (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __cbrt (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double ceil (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __ceil (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern double fabs (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __fabs (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern double floor (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __floor (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern double fmod (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __fmod (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));
extern int __isinf (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int __finite (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int isinf (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int finite (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern double drem (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __drem (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));
extern double significand (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __significand (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double copysign (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __copysign (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern double nan (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __nan (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int __isnan (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int isnan (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern double j0 (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __j0 (double) __attribute__ ((__nothrow__ , __leaf__));
extern double j1 (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __j1 (double) __attribute__ ((__nothrow__ , __leaf__));
extern double jn (int, double) __attribute__ ((__nothrow__ , __leaf__)); extern double __jn (int, double) __attribute__ ((__nothrow__ , __leaf__));
extern double y0 (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __y0 (double) __attribute__ ((__nothrow__ , __leaf__));
extern double y1 (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __y1 (double) __attribute__ ((__nothrow__ , __leaf__));
extern double yn (int, double) __attribute__ ((__nothrow__ , __leaf__)); extern double __yn (int, double) __attribute__ ((__nothrow__ , __leaf__));
extern double erf (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __erf (double) __attribute__ ((__nothrow__ , __leaf__));
extern double erfc (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __erfc (double) __attribute__ ((__nothrow__ , __leaf__));
extern double lgamma (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __lgamma (double) __attribute__ ((__nothrow__ , __leaf__));
extern double tgamma (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __tgamma (double) __attribute__ ((__nothrow__ , __leaf__));
extern double gamma (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __gamma (double) __attribute__ ((__nothrow__ , __leaf__));
extern double lgamma_r (double, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__)); extern double __lgamma_r (double, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__));
extern double rint (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __rint (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double nextafter (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __nextafter (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern double nexttoward (double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __nexttoward (double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern double remainder (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __remainder (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));
extern double scalbn (double __x, int __n) __attribute__ ((__nothrow__ , __leaf__)); extern double __scalbn (double __x, int __n) __attribute__ ((__nothrow__ , __leaf__));
extern int ilogb (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern int __ilogb (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double scalbln (double __x, long int __n) __attribute__ ((__nothrow__ , __leaf__)); extern double __scalbln (double __x, long int __n) __attribute__ ((__nothrow__ , __leaf__));
extern double nearbyint (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __nearbyint (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double round (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __round (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern double trunc (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __trunc (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern double remquo (double __x, double __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__)); extern double __remquo (double __x, double __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__));
extern long int lrint (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lrint (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long long int llrint (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llrint (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long int lround (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lround (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long long int llround (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llround (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern double fdim (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __fdim (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));
extern double fmax (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __fmax (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern double fmin (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __fmin (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int __fpclassify (double __value) __attribute__ ((__nothrow__ , __leaf__))
			__attribute__ ((__const__));
extern int __signbit (double __value) __attribute__ ((__nothrow__ , __leaf__))
			__attribute__ ((__const__));
extern double fma (double __x, double __y, double __z) __attribute__ ((__nothrow__ , __leaf__)); extern double __fma (double __x, double __y, double __z) __attribute__ ((__nothrow__ , __leaf__));
extern double scalb (double __x, double __n) __attribute__ ((__nothrow__ , __leaf__)); extern double __scalb (double __x, double __n) __attribute__ ((__nothrow__ , __leaf__));
extern float acosf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __acosf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float asinf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __asinf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float atanf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __atanf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float atan2f (float __y, float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __atan2f (float __y, float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float cosf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __cosf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float sinf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __sinf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float tanf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __tanf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float coshf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __coshf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float sinhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __sinhf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float tanhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __tanhf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float acoshf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __acoshf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float asinhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __asinhf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float atanhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __atanhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float expf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __expf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float frexpf (float __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__)); extern float __frexpf (float __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__));
extern float ldexpf (float __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__)); extern float __ldexpf (float __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__)); extern float logf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __logf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float log10f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __log10f (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float modff (float __x, float *__iptr) __attribute__ ((__nothrow__ , __leaf__)); extern float __modff (float __x, float *__iptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
extern float expm1f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __expm1f (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float log1pf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __log1pf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float logbf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __logbf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float exp2f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __exp2f (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float log2f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __log2f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float powf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __powf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));
extern float sqrtf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __sqrtf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float hypotf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __hypotf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));
extern float cbrtf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __cbrtf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float ceilf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __ceilf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern float fabsf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __fabsf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern float floorf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __floorf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern float fmodf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __fmodf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));
extern int __isinff (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int __finitef (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int isinff (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int finitef (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern float dremf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __dremf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));
extern float significandf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __significandf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float copysignf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __copysignf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern float nanf (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __nanf (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int __isnanf (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int isnanf (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern float j0f (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __j0f (float) __attribute__ ((__nothrow__ , __leaf__));
extern float j1f (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __j1f (float) __attribute__ ((__nothrow__ , __leaf__));
extern float jnf (int, float) __attribute__ ((__nothrow__ , __leaf__)); extern float __jnf (int, float) __attribute__ ((__nothrow__ , __leaf__));
extern float y0f (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __y0f (float) __attribute__ ((__nothrow__ , __leaf__));
extern float y1f (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __y1f (float) __attribute__ ((__nothrow__ , __leaf__));
extern float ynf (int, float) __attribute__ ((__nothrow__ , __leaf__)); extern float __ynf (int, float) __attribute__ ((__nothrow__ , __leaf__));
extern float erff (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __erff (float) __attribute__ ((__nothrow__ , __leaf__));
extern float erfcf (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __erfcf (float) __attribute__ ((__nothrow__ , __leaf__));
extern float lgammaf (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __lgammaf (float) __attribute__ ((__nothrow__ , __leaf__));
extern float tgammaf (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __tgammaf (float) __attribute__ ((__nothrow__ , __leaf__));
extern float gammaf (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __gammaf (float) __attribute__ ((__nothrow__ , __leaf__));
extern float lgammaf_r (float, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__)); extern float __lgammaf_r (float, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__));
extern float rintf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __rintf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float nextafterf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __nextafterf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern float nexttowardf (float __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __nexttowardf (float __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern float remainderf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __remainderf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));
extern float scalbnf (float __x, int __n) __attribute__ ((__nothrow__ , __leaf__)); extern float __scalbnf (float __x, int __n) __attribute__ ((__nothrow__ , __leaf__));
extern int ilogbf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern int __ilogbf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float scalblnf (float __x, long int __n) __attribute__ ((__nothrow__ , __leaf__)); extern float __scalblnf (float __x, long int __n) __attribute__ ((__nothrow__ , __leaf__));
extern float nearbyintf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __nearbyintf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float roundf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __roundf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern float truncf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __truncf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern float remquof (float __x, float __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__)); extern float __remquof (float __x, float __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__));
extern long int lrintf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lrintf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern long long int llrintf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llrintf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern long int lroundf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lroundf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern long long int llroundf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llroundf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern float fdimf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __fdimf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));
extern float fmaxf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __fmaxf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern float fminf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __fminf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int __fpclassifyf (float __value) __attribute__ ((__nothrow__ , __leaf__))
			__attribute__ ((__const__));
extern int __signbitf (float __value) __attribute__ ((__nothrow__ , __leaf__))
			__attribute__ ((__const__));
extern float fmaf (float __x, float __y, float __z) __attribute__ ((__nothrow__ , __leaf__)); extern float __fmaf (float __x, float __y, float __z) __attribute__ ((__nothrow__ , __leaf__));
extern float scalbf (float __x, float __n) __attribute__ ((__nothrow__ , __leaf__)); extern float __scalbf (float __x, float __n) __attribute__ ((__nothrow__ , __leaf__));
extern long double acosl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __acosl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double asinl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __asinl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double atanl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __atanl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double atan2l (long double __y, long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __atan2l (long double __y, long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double cosl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __cosl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double sinl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __sinl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double tanl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __tanl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double coshl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __coshl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double sinhl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __sinhl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double tanhl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __tanhl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double acoshl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __acoshl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double asinhl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __asinhl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double atanhl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __atanhl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double expl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __expl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double frexpl (long double __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__)); extern long double __frexpl (long double __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__));
extern long double ldexpl (long double __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__)); extern long double __ldexpl (long double __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__)); extern long double logl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __logl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double log10l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __log10l (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double modfl (long double __x, long double *__iptr) __attribute__ ((__nothrow__ , __leaf__)); extern long double __modfl (long double __x, long double *__iptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
extern long double expm1l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __expm1l (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double log1pl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __log1pl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double logbl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __logbl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double exp2l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __exp2l (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double log2l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __log2l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double powl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __powl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));
extern long double sqrtl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __sqrtl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double hypotl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __hypotl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));
extern long double cbrtl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __cbrtl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double ceill (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __ceill (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern long double fabsl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __fabsl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern long double floorl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __floorl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern long double fmodl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __fmodl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));
extern int __isinfl (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int __finitel (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int isinfl (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int finitel (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern long double dreml (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __dreml (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));
extern long double significandl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __significandl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double copysignl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __copysignl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern long double nanl (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __nanl (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int __isnanl (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int isnanl (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern long double j0l (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __j0l (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double j1l (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __j1l (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double jnl (int, long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __jnl (int, long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double y0l (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __y0l (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double y1l (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __y1l (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double ynl (int, long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __ynl (int, long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double erfl (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __erfl (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double erfcl (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __erfcl (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double lgammal (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __lgammal (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double tgammal (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __tgammal (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double gammal (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __gammal (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double lgammal_r (long double, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__)); extern long double __lgammal_r (long double, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__));
extern long double rintl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __rintl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double nextafterl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __nextafterl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern long double nexttowardl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __nexttowardl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern long double remainderl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __remainderl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));
extern long double scalbnl (long double __x, int __n) __attribute__ ((__nothrow__ , __leaf__)); extern long double __scalbnl (long double __x, int __n) __attribute__ ((__nothrow__ , __leaf__));
extern int ilogbl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern int __ilogbl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double scalblnl (long double __x, long int __n) __attribute__ ((__nothrow__ , __leaf__)); extern long double __scalblnl (long double __x, long int __n) __attribute__ ((__nothrow__ , __leaf__));
extern long double nearbyintl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __nearbyintl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double roundl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __roundl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern long double truncl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __truncl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern long double remquol (long double __x, long double __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__)); extern long double __remquol (long double __x, long double __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__));
extern long int lrintl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lrintl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long long int llrintl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llrintl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long int lroundl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lroundl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long long int llroundl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llroundl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long double fdiml (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __fdiml (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));
extern long double fmaxl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __fmaxl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern long double fminl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __fminl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int __fpclassifyl (long double __value) __attribute__ ((__nothrow__ , __leaf__))
			__attribute__ ((__const__));
extern int __signbitl (long double __value) __attribute__ ((__nothrow__ , __leaf__))
			__attribute__ ((__const__));
extern long double fmal (long double __x, long double __y, long double __z) __attribute__ ((__nothrow__ , __leaf__)); extern long double __fmal (long double __x, long double __y, long double __z) __attribute__ ((__nothrow__ , __leaf__));
extern long double scalbl (long double __x, long double __n) __attribute__ ((__nothrow__ , __leaf__)); extern long double __scalbl (long double __x, long double __n) __attribute__ ((__nothrow__ , __leaf__));
extern int signgam;
enum
		{
			FP_NAN =
			0,
			FP_INFINITE =
			1,
			FP_ZERO =
			2,
			FP_SUBNORMAL =
			3,
			FP_NORMAL =
			4
		};
typedef enum
{
		_IEEE_ = -1,
		_SVID_,
		_XOPEN_,
		_POSIX_,
		_ISOC_
} _LIB_VERSION_TYPE;
extern _LIB_VERSION_TYPE _LIB_VERSION;
struct exception
		{
			int type;
			char *name;
			double arg1;
			double arg2;
			double retval;
		};
extern int matherr (struct exception *__exc);
typedef long int __jmp_buf[8];
typedef int __sig_atomic_t;
typedef struct
		{
			unsigned long int __val[(1024 / (8 * sizeof (unsigned long int)))];
		} __sigset_t;
struct __jmp_buf_tag
		{
			__jmp_buf __jmpbuf;
			int __mask_was_saved;
			__sigset_t __saved_mask;
		};
typedef struct __jmp_buf_tag jmp_buf[1];
extern int setjmp (jmp_buf __env) __attribute__ ((__nothrow__));
extern int __sigsetjmp (struct __jmp_buf_tag __env[1], int __savemask) __attribute__ ((__nothrow__));
extern int _setjmp (struct __jmp_buf_tag __env[1]) __attribute__ ((__nothrow__));
extern void longjmp (struct __jmp_buf_tag __env[1], int __val)
			__attribute__ ((__nothrow__)) __attribute__ ((__noreturn__));
extern void _longjmp (struct __jmp_buf_tag __env[1], int __val)
			__attribute__ ((__nothrow__)) __attribute__ ((__noreturn__));
typedef struct __jmp_buf_tag sigjmp_buf[1];
extern void siglongjmp (sigjmp_buf __env, int __val)
			__attribute__ ((__nothrow__)) __attribute__ ((__noreturn__));
typedef __builtin_va_list __gnuc_va_list;
typedef __gnuc_va_list va_list;
typedef long int ptrdiff_t;
typedef unsigned long int size_t;
typedef int wchar_t;
struct _IO_FILE;
typedef struct _IO_FILE FILE;
typedef struct _IO_FILE __FILE;
typedef unsigned int wint_t;
typedef struct
{
		int __count;
		union
		{
			unsigned int __wch;
			char __wchb[4];
		} __value;
} __mbstate_t;
typedef struct
{
		__off_t __pos;
		__mbstate_t __state;
} _G_fpos_t;
typedef struct
{
		__off64_t __pos;
		__mbstate_t __state;
} _G_fpos64_t;
struct _IO_jump_t; struct _IO_FILE;
typedef void _IO_lock_t;
struct _IO_marker {
		struct _IO_marker *_next;
		struct _IO_FILE *_sbuf;
		int _pos;
};
enum __codecvt_result
{
		__codecvt_ok,
		__codecvt_partial,
		__codecvt_error,
		__codecvt_noconv
};
struct _IO_FILE {
		int _flags;
		char* _IO_read_ptr;
		char* _IO_read_end;
		char* _IO_read_base;
		char* _IO_write_base;
		char* _IO_write_ptr;
		char* _IO_write_end;
		char* _IO_buf_base;
		char* _IO_buf_end;
		char *_IO_save_base;
		char *_IO_backup_base;
		char *_IO_save_end;
		struct _IO_marker *_markers;
		struct _IO_FILE *_chain;
		int _fileno;
		int _flags2;
		__off_t _old_offset;
		unsigned short _cur_column;
		signed char _vtable_offset;
		char _shortbuf[1];
		_IO_lock_t *_lock;
		__off64_t _offset;
		void *__pad1;
		void *__pad2;
		void *__pad3;
		void *__pad4;
		size_t __pad5;
		int _mode;
		char _unused2[15 * sizeof (int) - 4 * sizeof (void *) - sizeof (size_t)];
};
typedef struct _IO_FILE _IO_FILE;
struct _IO_FILE_plus;
extern struct _IO_FILE_plus _IO_2_1_stdin_;
extern struct _IO_FILE_plus _IO_2_1_stdout_;
extern struct _IO_FILE_plus _IO_2_1_stderr_;
typedef __ssize_t __io_read_fn (void *__cookie, char *__buf, size_t __nbytes);
typedef __ssize_t __io_write_fn (void *__cookie, const char *__buf,
			size_t __n);
typedef int __io_seek_fn (void *__cookie, __off64_t *__pos, int __w);
typedef int __io_close_fn (void *__cookie);
extern int __underflow (_IO_FILE *);
extern int __uflow (_IO_FILE *);
extern int __overflow (_IO_FILE *, int);
extern int _IO_getc (_IO_FILE *__fp);
extern int _IO_putc (int __c, _IO_FILE *__fp);
extern int _IO_feof (_IO_FILE *__fp) __attribute__ ((__nothrow__ , __leaf__));
extern int _IO_ferror (_IO_FILE *__fp) __attribute__ ((__nothrow__ , __leaf__));
extern int _IO_peekc_locked (_IO_FILE *__fp);
extern void _IO_flockfile (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
extern void _IO_funlockfile (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
extern int _IO_ftrylockfile (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
extern int _IO_vfscanf (_IO_FILE * __restrict, const char * __restrict,
			__gnuc_va_list, int *__restrict);
extern int _IO_vfprintf (_IO_FILE *__restrict, const char *__restrict,
			__gnuc_va_list);
extern __ssize_t _IO_padn (_IO_FILE *, int, __ssize_t);
extern size_t _IO_sgetn (_IO_FILE *, void *, size_t);
extern __off64_t _IO_seekoff (_IO_FILE *, __off64_t, int, int);
extern __off64_t _IO_seekpos (_IO_FILE *, __off64_t, int);
extern void _IO_free_backup_area (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
typedef __off_t off_t;
typedef __ssize_t ssize_t;
typedef _G_fpos_t fpos_t;
extern struct _IO_FILE *stdin;
extern struct _IO_FILE *stdout;
extern struct _IO_FILE *stderr;
extern int remove (const char *__filename) __attribute__ ((__nothrow__ , __leaf__));
extern int rename (const char *__old, const char *__new) __attribute__ ((__nothrow__ , __leaf__));
extern int renameat (int __oldfd, const char *__old, int __newfd,
			const char *__new) __attribute__ ((__nothrow__ , __leaf__));
extern FILE *tmpfile (void);
extern char *tmpnam (char *__s) __attribute__ ((__nothrow__ , __leaf__));
extern char *tmpnam_r (char *__s) __attribute__ ((__nothrow__ , __leaf__));
extern char *tempnam (const char *__dir, const char *__pfx)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__));
extern int fclose (FILE *__stream);
extern int fflush (FILE *__stream);
extern int fflush_unlocked (FILE *__stream);
extern FILE *fopen (const char *__restrict __filename,
			const char *__restrict __modes);
extern FILE *freopen (const char *__restrict __filename,
			const char *__restrict __modes,
			FILE *__restrict __stream);
extern FILE *fdopen (int __fd, const char *__modes) __attribute__ ((__nothrow__ , __leaf__));
extern FILE *fmemopen (void *__s, size_t __len, const char *__modes)
		__attribute__ ((__nothrow__ , __leaf__));
extern FILE *open_memstream (char **__bufloc, size_t *__sizeloc) __attribute__ ((__nothrow__ , __leaf__));
extern void setbuf (FILE *__restrict __stream, char *__restrict __buf) __attribute__ ((__nothrow__ , __leaf__));
extern int setvbuf (FILE *__restrict __stream, char *__restrict __buf,
			int __modes, size_t __n) __attribute__ ((__nothrow__ , __leaf__));
extern void setbuffer (FILE *__restrict __stream, char *__restrict __buf,
			size_t __size) __attribute__ ((__nothrow__ , __leaf__));
extern void setlinebuf (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));
extern int fprintf (FILE *__restrict __stream,
			const char *__restrict __format, ...);
extern int printf (const char *__restrict __format, ...);
extern int sprintf (char *__restrict __s,
			const char *__restrict __format, ...) __attribute__ ((__nothrow__));
extern int vfprintf (FILE *__restrict __s, const char *__restrict __format,
			__gnuc_va_list __arg);
extern int vprintf (const char *__restrict __format, __gnuc_va_list __arg);
extern int vsprintf (char *__restrict __s, const char *__restrict __format,
			__gnuc_va_list __arg) __attribute__ ((__nothrow__));
extern int snprintf (char *__restrict __s, size_t __maxlen,
			const char *__restrict __format, ...)
			__attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 4)));
extern int vsnprintf (char *__restrict __s, size_t __maxlen,
			const char *__restrict __format, __gnuc_va_list __arg)
			__attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 0)));
extern int vdprintf (int __fd, const char *__restrict __fmt,
			__gnuc_va_list __arg)
			__attribute__ ((__format__ (__printf__, 2, 0)));
extern int dprintf (int __fd, const char *__restrict __fmt, ...)
			__attribute__ ((__format__ (__printf__, 2, 3)));
extern int fscanf (FILE *__restrict __stream,
			const char *__restrict __format, ...);
extern int scanf (const char *__restrict __format, ...);
extern int sscanf (const char *__restrict __s,
			const char *__restrict __format, ...) __attribute__ ((__nothrow__ , __leaf__));
extern int fscanf (FILE *__restrict __stream,
			const char *__restrict __format, ...) __asm__ ("__USER_LABEL_PREFIX__" "__isoc99_fscanf");
extern int scanf (const char *__restrict __format, ...) __asm__ ("__USER_LABEL_PREFIX__" "__isoc99_scanf");
extern int sscanf (const char *__restrict __s,
			const char *__restrict __format, ...) __asm__ ("__USER_LABEL_PREFIX__" "__isoc99_sscanf") __attribute__ ((__nothrow__ , __leaf__));
extern int vfscanf (FILE *__restrict __s, const char *__restrict __format,
			__gnuc_va_list __arg)
			__attribute__ ((__format__ (__scanf__, 2, 0)));
extern int vscanf (const char *__restrict __format, __gnuc_va_list __arg)
			__attribute__ ((__format__ (__scanf__, 1, 0)));
extern int vsscanf (const char *__restrict __s,
			const char *__restrict __format, __gnuc_va_list __arg)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__format__ (__scanf__, 2, 0)));
extern int vfscanf (FILE *__restrict __s,
			const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("__USER_LABEL_PREFIX__" "__isoc99_vfscanf")
			__attribute__ ((__format__ (__scanf__, 2, 0)));
extern int vscanf (const char *__restrict __format,
			__gnuc_va_list __arg) __asm__ ("__USER_LABEL_PREFIX__" "__isoc99_vscanf")
			__attribute__ ((__format__ (__scanf__, 1, 0)));
extern int vsscanf (const char *__restrict __s,
			const char *__restrict __format,
			__gnuc_va_list __arg) __asm__ ("__USER_LABEL_PREFIX__" "__isoc99_vsscanf") __attribute__ ((__nothrow__ , __leaf__))
			__attribute__ ((__format__ (__scanf__, 2, 0)));
extern int fgetc (FILE *__stream);
extern int getc (FILE *__stream);
extern int getchar (void);
extern int getc_unlocked (FILE *__stream);
extern int getchar_unlocked (void);
extern int fgetc_unlocked (FILE *__stream);
extern int fputc (int __c, FILE *__stream);
extern int putc (int __c, FILE *__stream);
extern int putchar (int __c);
extern int fputc_unlocked (int __c, FILE *__stream);
extern int putc_unlocked (int __c, FILE *__stream);
extern int putchar_unlocked (int __c);
extern int getw (FILE *__stream);
extern int putw (int __w, FILE *__stream);
extern char *fgets (char *__restrict __s, int __n, FILE *__restrict __stream);
extern char *gets (char *__s) __attribute__ ((__deprecated__));
extern __ssize_t __getdelim (char **__restrict __lineptr,
			size_t *__restrict __n, int __delimiter,
			FILE *__restrict __stream);
extern __ssize_t getdelim (char **__restrict __lineptr,
			size_t *__restrict __n, int __delimiter,
			FILE *__restrict __stream);
extern __ssize_t getline (char **__restrict __lineptr,
			size_t *__restrict __n,
			FILE *__restrict __stream);
extern int fputs (const char *__restrict __s, FILE *__restrict __stream);
extern int puts (const char *__s);
extern int ungetc (int __c, FILE *__stream);
extern size_t fread (void *__restrict __ptr, size_t __size,
			size_t __n, FILE *__restrict __stream);
extern size_t fwrite (const void *__restrict __ptr, size_t __size,
			size_t __n, FILE *__restrict __s);
extern size_t fread_unlocked (void *__restrict __ptr, size_t __size,
			size_t __n, FILE *__restrict __stream);
extern size_t fwrite_unlocked (const void *__restrict __ptr, size_t __size,
			size_t __n, FILE *__restrict __stream);
extern int fseek (FILE *__stream, long int __off, int __whence);
extern long int ftell (FILE *__stream);
extern void rewind (FILE *__stream);
extern int fseeko (FILE *__stream, __off_t __off, int __whence);
extern __off_t ftello (FILE *__stream);
extern int fgetpos (FILE *__restrict __stream, fpos_t *__restrict __pos);
extern int fsetpos (FILE *__stream, const fpos_t *__pos);
extern void clearerr (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));
extern int feof (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));
extern int ferror (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));
extern void clearerr_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));
extern int feof_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));
extern int ferror_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));
extern void perror (const char *__s);
extern int sys_nerr;
extern const char *const sys_errlist[];
extern int fileno (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));
extern int fileno_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));
extern FILE *popen (const char *__command, const char *__modes);
extern int pclose (FILE *__stream);
extern char *ctermid (char *__s) __attribute__ ((__nothrow__ , __leaf__));
extern void flockfile (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));
extern int ftrylockfile (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));
extern void funlockfile (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));
typedef enum
{
		P_ALL,
		P_PID,
		P_PGID
} idtype_t;
union wait
		{
			int w_status;
			struct
			{
			unsigned int __w_termsig:7;
			unsigned int __w_coredump:1;
			unsigned int __w_retcode:8;
			unsigned int:16;
			} __wait_terminated;
			struct
			{
			unsigned int __w_stopval:8;
			unsigned int __w_stopsig:8;
			unsigned int:16;
			} __wait_stopped;
		};
typedef union
		{
			union wait *__uptr;
			int *__iptr;
		} __WAIT_STATUS __attribute__ ((__transparent_union__));
typedef struct
		{
			int quot;
			int rem;
		} div_t;
typedef struct
		{
			long int quot;
			long int rem;
		} ldiv_t; typedef struct
		{
			long long int quot;
			long long int rem;
		} lldiv_t;
extern size_t __ctype_get_mb_cur_max (void) __attribute__ ((__nothrow__ , __leaf__));
extern double atof (const char *__nptr)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern int atoi (const char *__nptr)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern long int atol (const char *__nptr)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))); extern long long int atoll (const char *__nptr)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern double strtod (const char *__restrict __nptr,
			char **__restrict __endptr)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern float strtof (const char *__restrict __nptr,
			char **__restrict __endptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern long double strtold (const char *__restrict __nptr,
			char **__restrict __endptr)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern long int strtol (const char *__restrict __nptr,
			char **__restrict __endptr, int __base)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern unsigned long int strtoul (const char *__restrict __nptr,
			char **__restrict __endptr, int __base)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern long long int strtoq (const char *__restrict __nptr,
			char **__restrict __endptr, int __base)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern unsigned long long int strtouq (const char *__restrict __nptr,
			char **__restrict __endptr, int __base)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern long long int strtoll (const char *__restrict __nptr,
			char **__restrict __endptr, int __base)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern unsigned long long int strtoull (const char *__restrict __nptr,
			char **__restrict __endptr, int __base)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern char *l64a (long int __n) __attribute__ ((__nothrow__ , __leaf__));
extern long int a64l (const char *__s)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
typedef __u_char u_char;
typedef __u_short u_short;
typedef __u_int u_int;
typedef __u_long u_long;
typedef __quad_t quad_t;
typedef __u_quad_t u_quad_t;
typedef __fsid_t fsid_t;
typedef __loff_t loff_t;
typedef __ino_t ino_t;
typedef __dev_t dev_t;
typedef __gid_t gid_t;
typedef __mode_t mode_t;
typedef __nlink_t nlink_t;
typedef __uid_t uid_t;
typedef __pid_t pid_t;
typedef __id_t id_t;
typedef __daddr_t daddr_t;
typedef __caddr_t caddr_t;
typedef __key_t key_t;
typedef __clock_t clock_t;
typedef __time_t time_t;
typedef __clockid_t clockid_t;
typedef __timer_t timer_t;
typedef unsigned long int ulong;
typedef unsigned short int ushort;
typedef unsigned int uint;
typedef int int8_t __attribute__ ((__mode__ (__QI__)));
typedef int int16_t __attribute__ ((__mode__ (__HI__)));
typedef int int32_t __attribute__ ((__mode__ (__SI__)));
typedef int int64_t __attribute__ ((__mode__ (__DI__)));
typedef unsigned int u_int8_t __attribute__ ((__mode__ (__QI__)));
typedef unsigned int u_int16_t __attribute__ ((__mode__ (__HI__)));
typedef unsigned int u_int32_t __attribute__ ((__mode__ (__SI__)));
typedef unsigned int u_int64_t __attribute__ ((__mode__ (__DI__)));
typedef int register_t __attribute__ ((__mode__ (__word__)));
typedef __sigset_t sigset_t;
struct timespec
		{
			__time_t tv_sec;
			__syscall_slong_t tv_nsec;
		};
struct timeval
		{
			__time_t tv_sec;
			__suseconds_t tv_usec;
		};
typedef __suseconds_t suseconds_t;
typedef long int __fd_mask;
typedef struct
		{
			__fd_mask __fds_bits[1024 / (8 * (int) sizeof (__fd_mask))];
		} fd_set;
typedef __fd_mask fd_mask;
extern int select (int __nfds, fd_set *__restrict __readfds,
			fd_set *__restrict __writefds,
			fd_set *__restrict __exceptfds,
			struct timeval *__restrict __timeout);
extern int pselect (int __nfds, fd_set *__restrict __readfds,
			fd_set *__restrict __writefds,
			fd_set *__restrict __exceptfds,
			const struct timespec *__restrict __timeout,
			const __sigset_t *__restrict __sigmask);
extern unsigned int gnu_dev_major (unsigned long long int __dev)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern unsigned int gnu_dev_minor (unsigned long long int __dev)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern unsigned long long int gnu_dev_makedev (unsigned int __major,
			unsigned int __minor)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
typedef __blksize_t blksize_t;
typedef __blkcnt_t blkcnt_t;
typedef __fsblkcnt_t fsblkcnt_t;
typedef __fsfilcnt_t fsfilcnt_t;
typedef unsigned long int pthread_t;
union pthread_attr_t
{
		char __size[56];
		long int __align;
};
typedef union pthread_attr_t pthread_attr_t;
typedef struct __pthread_internal_list
{
		struct __pthread_internal_list *__prev;
		struct __pthread_internal_list *__next;
} __pthread_list_t;
typedef union
{
		struct __pthread_mutex_s
		{
			int __lock;
			unsigned int __count;
			int __owner;
			unsigned int __nusers;
			int __kind;
			short __spins;
			short __elision;
			__pthread_list_t __list;
		} __data;
		char __size[40];
		long int __align;
} pthread_mutex_t;
typedef union
{
		char __size[4];
		int __align;
} pthread_mutexattr_t;
typedef union
{
		struct
		{
			int __lock;
			unsigned int __futex; unsigned long long int __total_seq; unsigned long long int __wakeup_seq; unsigned long long int __woken_seq;
			void *__mutex;
			unsigned int __nwaiters;
			unsigned int __broadcast_seq;
		} __data;
		char __size[48]; long long int __align;
} pthread_cond_t;
typedef union
{
		char __size[4];
		int __align;
} pthread_condattr_t;
typedef unsigned int pthread_key_t;
typedef int pthread_once_t;
typedef union
{
		struct
		{
			int __lock;
			unsigned int __nr_readers;
			unsigned int __readers_wakeup;
			unsigned int __writer_wakeup;
			unsigned int __nr_readers_queued;
			unsigned int __nr_writers_queued;
			int __writer;
			int __shared;
			signed char __rwelision;
			unsigned char __pad1[7];
			unsigned long int __pad2;
			unsigned int __flags;
		} __data;
		char __size[56];
		long int __align;
} pthread_rwlock_t;
typedef union
{
		char __size[8];
		long int __align;
} pthread_rwlockattr_t;
typedef volatile int pthread_spinlock_t;
typedef union
{
		char __size[32];
		long int __align;
} pthread_barrier_t;
typedef union
{
		char __size[4];
		int __align;
} pthread_barrierattr_t;
extern long int random (void) __attribute__ ((__nothrow__ , __leaf__));
extern void srandom (unsigned int __seed) __attribute__ ((__nothrow__ , __leaf__));
extern char *initstate (unsigned int __seed, char *__statebuf,
			size_t __statelen) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
extern char *setstate (char *__statebuf) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
struct random_data
		{
			int32_t *fptr;
			int32_t *rptr;
			int32_t *state;
			int rand_type;
			int rand_deg;
			int rand_sep;
			int32_t *end_ptr;
		};
extern int random_r (struct random_data *__restrict __buf,
			int32_t *__restrict __result) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int srandom_r (unsigned int __seed, struct random_data *__buf)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
extern int initstate_r (unsigned int __seed, char *__restrict __statebuf,
			size_t __statelen,
			struct random_data *__restrict __buf)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 4)));
extern int setstate_r (char *__restrict __statebuf,
			struct random_data *__restrict __buf)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int rand (void) __attribute__ ((__nothrow__ , __leaf__));
extern void srand (unsigned int __seed) __attribute__ ((__nothrow__ , __leaf__));
extern int rand_r (unsigned int *__seed) __attribute__ ((__nothrow__ , __leaf__));
extern double drand48 (void) __attribute__ ((__nothrow__ , __leaf__));
extern double erand48 (unsigned short int __xsubi[3]) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern long int lrand48 (void) __attribute__ ((__nothrow__ , __leaf__));
extern long int nrand48 (unsigned short int __xsubi[3])
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern long int mrand48 (void) __attribute__ ((__nothrow__ , __leaf__));
extern long int jrand48 (unsigned short int __xsubi[3])
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern void srand48 (long int __seedval) __attribute__ ((__nothrow__ , __leaf__));
extern unsigned short int *seed48 (unsigned short int __seed16v[3])
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern void lcong48 (unsigned short int __param[7]) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
struct drand48_data
		{
			unsigned short int __x[3];
			unsigned short int __old_x[3];
			unsigned short int __c;
			unsigned short int __init; unsigned long long int __a;
		};
extern int drand48_r (struct drand48_data *__restrict __buffer,
			double *__restrict __result) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int erand48_r (unsigned short int __xsubi[3],
			struct drand48_data *__restrict __buffer,
			double *__restrict __result) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int lrand48_r (struct drand48_data *__restrict __buffer,
			long int *__restrict __result)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int nrand48_r (unsigned short int __xsubi[3],
			struct drand48_data *__restrict __buffer,
			long int *__restrict __result)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int mrand48_r (struct drand48_data *__restrict __buffer,
			long int *__restrict __result)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int jrand48_r (unsigned short int __xsubi[3],
			struct drand48_data *__restrict __buffer,
			long int *__restrict __result)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int srand48_r (long int __seedval, struct drand48_data *__buffer)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
extern int seed48_r (unsigned short int __seed16v[3],
			struct drand48_data *__buffer) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int lcong48_r (unsigned short int __param[7],
			struct drand48_data *__buffer)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern void *malloc (size_t __size) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__));
extern void *calloc (size_t __nmemb, size_t __size)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__));
extern void *realloc (void *__ptr, size_t __size)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));
extern void free (void *__ptr) __attribute__ ((__nothrow__ , __leaf__));
extern void cfree (void *__ptr) __attribute__ ((__nothrow__ , __leaf__));
extern void *alloca (size_t __size) __attribute__ ((__nothrow__ , __leaf__));
extern void *valloc (size_t __size) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__));
extern int posix_memalign (void **__memptr, size_t __alignment, size_t __size)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern void abort (void) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));
extern int atexit (void (*__func) (void)) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern int on_exit (void (*__func) (int __status, void *__arg), void *__arg)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern void exit (int __status) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));
extern void _Exit (int __status) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));
extern char *getenv (const char *__name) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern int putenv (char *__string) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern int setenv (const char *__name, const char *__value, int __replace)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
extern int unsetenv (const char *__name) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern int clearenv (void) __attribute__ ((__nothrow__ , __leaf__));
extern char *mktemp (char *__template) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern int mkstemp (char *__template) __attribute__ ((__nonnull__ (1)));
extern int mkstemps (char *__template, int __suffixlen) __attribute__ ((__nonnull__ (1)));
extern char *mkdtemp (char *__template) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern int system (const char *__command);
extern char *realpath (const char *__restrict __name,
			char *__restrict __resolved) __attribute__ ((__nothrow__ , __leaf__));
typedef int (*__compar_fn_t) (const void *, const void *);
extern void *bsearch (const void *__key, const void *__base,
			size_t __nmemb, size_t __size, __compar_fn_t __compar)
			__attribute__ ((__nonnull__ (1, 2, 5)));
extern void qsort (void *__base, size_t __nmemb, size_t __size,
			__compar_fn_t __compar) __attribute__ ((__nonnull__ (1, 4)));
extern int abs (int __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern long int labs (long int __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long long int llabs (long long int __x)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern div_t div (int __numer, int __denom)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern ldiv_t ldiv (long int __numer, long int __denom)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern lldiv_t lldiv (long long int __numer,
			long long int __denom)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern char *ecvt (double __value, int __ndigit, int *__restrict __decpt,
			int *__restrict __sign) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4)));
extern char *fcvt (double __value, int __ndigit, int *__restrict __decpt,
			int *__restrict __sign) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4)));
extern char *gcvt (double __value, int __ndigit, char *__buf)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3)));
extern char *qecvt (long double __value, int __ndigit,
			int *__restrict __decpt, int *__restrict __sign)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4)));
extern char *qfcvt (long double __value, int __ndigit,
			int *__restrict __decpt, int *__restrict __sign)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4)));
extern char *qgcvt (long double __value, int __ndigit, char *__buf)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3)));
extern int ecvt_r (double __value, int __ndigit, int *__restrict __decpt,
			int *__restrict __sign, char *__restrict __buf,
			size_t __len) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4, 5)));
extern int fcvt_r (double __value, int __ndigit, int *__restrict __decpt,
			int *__restrict __sign, char *__restrict __buf,
			size_t __len) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4, 5)));
extern int qecvt_r (long double __value, int __ndigit,
			int *__restrict __decpt, int *__restrict __sign,
			char *__restrict __buf, size_t __len)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4, 5)));
extern int qfcvt_r (long double __value, int __ndigit,
			int *__restrict __decpt, int *__restrict __sign,
			char *__restrict __buf, size_t __len)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4, 5)));
extern int mblen (const char *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__));
extern int mbtowc (wchar_t *__restrict __pwc,
			const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__ , __leaf__));
extern int wctomb (char *__s, wchar_t __wchar) __attribute__ ((__nothrow__ , __leaf__));
extern size_t mbstowcs (wchar_t *__restrict __pwcs,
			const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__ , __leaf__));
extern size_t wcstombs (char *__restrict __s,
			const wchar_t *__restrict __pwcs, size_t __n)
			__attribute__ ((__nothrow__ , __leaf__));
extern int rpmatch (const char *__response) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern int getsubopt (char **__restrict __optionp,
			char *const *__restrict __tokens,
			char **__restrict __valuep)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2, 3)));
extern int getloadavg (double __loadavg[], int __nelem)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern void *memcpy (void *__restrict __dest, const void *__restrict __src,
			size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern void *memmove (void *__dest, const void *__src, size_t __n)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern void *memccpy (void *__restrict __dest, const void *__restrict __src,
			int __c, size_t __n)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern void *memset (void *__s, int __c, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern int memcmp (const void *__s1, const void *__s2, size_t __n)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern void *memchr (const void *__s, int __c, size_t __n)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern char *strcpy (char *__restrict __dest, const char *__restrict __src)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *strncpy (char *__restrict __dest,
			const char *__restrict __src, size_t __n)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *strcat (char *__restrict __dest, const char *__restrict __src)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *strncat (char *__restrict __dest, const char *__restrict __src,
			size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int strcmp (const char *__s1, const char *__s2)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern int strncmp (const char *__s1, const char *__s2, size_t __n)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern int strcoll (const char *__s1, const char *__s2)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern size_t strxfrm (char *__restrict __dest,
			const char *__restrict __src, size_t __n)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
extern int strcoll_l (const char *__s1, const char *__s2, __locale_t __l)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 3)));
extern size_t strxfrm_l (char *__dest, const char *__src, size_t __n,
			__locale_t __l) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 4)));
extern char *strdup (const char *__s)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));
extern char *strndup (const char *__string, size_t __n)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));
extern char *strchr (const char *__s, int __c)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern char *strrchr (const char *__s, int __c)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern size_t strcspn (const char *__s, const char *__reject)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern size_t strspn (const char *__s, const char *__accept)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *strpbrk (const char *__s, const char *__accept)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *strstr (const char *__haystack, const char *__needle)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *strtok (char *__restrict __s, const char *__restrict __delim)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
extern char *__strtok_r (char *__restrict __s,
			const char *__restrict __delim,
			char **__restrict __save_ptr)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));
extern char *strtok_r (char *__restrict __s, const char *__restrict __delim,
			char **__restrict __save_ptr)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));
extern size_t strlen (const char *__s)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern size_t strnlen (const char *__string, size_t __maxlen)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern char *strerror (int __errnum) __attribute__ ((__nothrow__ , __leaf__));
extern int strerror_r (int __errnum, char *__buf, size_t __buflen) __asm__ ("__USER_LABEL_PREFIX__" "__xpg_strerror_r") __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));
extern char *strerror_l (int __errnum, __locale_t __l) __attribute__ ((__nothrow__ , __leaf__));
extern void __bzero (void *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern void bcopy (const void *__src, void *__dest, size_t __n)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern void bzero (void *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern int bcmp (const void *__s1, const void *__s2, size_t __n)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *index (const char *__s, int __c)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern char *rindex (const char *__s, int __c)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern int ffs (int __i) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int strcasecmp (const char *__s1, const char *__s2)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern int strncasecmp (const char *__s1, const char *__s2, size_t __n)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *strsep (char **__restrict __stringp,
			const char *__restrict __delim)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *strsignal (int __sig) __attribute__ ((__nothrow__ , __leaf__));
extern char *__stpcpy (char *__restrict __dest, const char *__restrict __src)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *stpcpy (char *__restrict __dest, const char *__restrict __src)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *__stpncpy (char *__restrict __dest,
			const char *__restrict __src, size_t __n)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *stpncpy (char *__restrict __dest,
			const char *__restrict __src, size_t __n)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
struct tm
{
		int tm_sec;
		int tm_min;
		int tm_hour;
		int tm_mday;
		int tm_mon;
		int tm_year;
		int tm_wday;
		int tm_yday;
		int tm_isdst;
		long int tm_gmtoff;
		const char *tm_zone;
};
struct itimerspec
		{
			struct timespec it_interval;
			struct timespec it_value;
		};
struct sigevent;
extern clock_t clock (void) __attribute__ ((__nothrow__ , __leaf__));
extern time_t time (time_t *__timer) __attribute__ ((__nothrow__ , __leaf__));
extern double difftime (time_t __time1, time_t __time0)
			__attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern time_t mktime (struct tm *__tp) __attribute__ ((__nothrow__ , __leaf__));
extern size_t strftime (char *__restrict __s, size_t __maxsize,
			const char *__restrict __format,
			const struct tm *__restrict __tp) __attribute__ ((__nothrow__ , __leaf__));
extern size_t strftime_l (char *__restrict __s, size_t __maxsize,
			const char *__restrict __format,
			const struct tm *__restrict __tp,
			__locale_t __loc) __attribute__ ((__nothrow__ , __leaf__));
extern struct tm *gmtime (const time_t *__timer) __attribute__ ((__nothrow__ , __leaf__));
extern struct tm *localtime (const time_t *__timer) __attribute__ ((__nothrow__ , __leaf__));
extern struct tm *gmtime_r (const time_t *__restrict __timer,
			struct tm *__restrict __tp) __attribute__ ((__nothrow__ , __leaf__));
extern struct tm *localtime_r (const time_t *__restrict __timer,
			struct tm *__restrict __tp) __attribute__ ((__nothrow__ , __leaf__));
extern char *asctime (const struct tm *__tp) __attribute__ ((__nothrow__ , __leaf__));
extern char *ctime (const time_t *__timer) __attribute__ ((__nothrow__ , __leaf__));
extern char *asctime_r (const struct tm *__restrict __tp,
			char *__restrict __buf) __attribute__ ((__nothrow__ , __leaf__));
extern char *ctime_r (const time_t *__restrict __timer,
			char *__restrict __buf) __attribute__ ((__nothrow__ , __leaf__));
extern char *__tzname[2];
extern int __daylight;
extern long int __timezone;
extern char *tzname[2];
extern void tzset (void) __attribute__ ((__nothrow__ , __leaf__));
extern int daylight;
extern long int timezone;
extern int stime (const time_t *__when) __attribute__ ((__nothrow__ , __leaf__));
extern time_t timegm (struct tm *__tp) __attribute__ ((__nothrow__ , __leaf__));
extern time_t timelocal (struct tm *__tp) __attribute__ ((__nothrow__ , __leaf__));
extern int dysize (int __year) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int nanosleep (const struct timespec *__requested_time,
			struct timespec *__remaining);
extern int clock_getres (clockid_t __clock_id, struct timespec *__res) __attribute__ ((__nothrow__ , __leaf__));
extern int clock_gettime (clockid_t __clock_id, struct timespec *__tp) __attribute__ ((__nothrow__ , __leaf__));
extern int clock_settime (clockid_t __clock_id, const struct timespec *__tp)
			__attribute__ ((__nothrow__ , __leaf__));
extern int clock_nanosleep (clockid_t __clock_id, int __flags,
			const struct timespec *__req,
			struct timespec *__rem);
extern int clock_getcpuclockid (pid_t __pid, clockid_t *__clock_id) __attribute__ ((__nothrow__ , __leaf__));
extern int timer_create (clockid_t __clock_id,
			struct sigevent *__restrict __evp,
			timer_t *__restrict __timerid) __attribute__ ((__nothrow__ , __leaf__));
extern int timer_delete (timer_t __timerid) __attribute__ ((__nothrow__ , __leaf__));
extern int timer_settime (timer_t __timerid, int __flags,
			const struct itimerspec *__restrict __value,
			struct itimerspec *__restrict __ovalue) __attribute__ ((__nothrow__ , __leaf__));
extern int timer_gettime (timer_t __timerid, struct itimerspec *__value)
			__attribute__ ((__nothrow__ , __leaf__));
extern int timer_getoverrun (timer_t __timerid) __attribute__ ((__nothrow__ , __leaf__));
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
typedef union {
			double u;
			void *s;
			long l;
} L_Umaxalign;
typedef double l_uacNumber;
typedef lu_int32 Instruction;
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
extern void pushstr(lua_State *L, const char *str);
extern void luaV_concat(lua_State *L, int total, int last);
extern TString *luaS_newlstr(lua_State *L, const char *str, size_t l);
extern void luaD_reallocstack(lua_State *L, int newsize);
extern void luaD_growstack(lua_State *L, int n);
extern void addinfo(lua_State *L, const char *msg);
extern void luaG_errormsg(lua_State *L);
extern void luaC_step(lua_State *L);
extern void luaL_where(lua_State *L, int level);
extern int lua_error(lua_State *L);
extern void lua_concat(lua_State *L, int n);
extern int luaL_error(lua_State *L, const char *fmt, ...);
extern const char *lua_pushfstring(lua_State *L, const char *fmt, ...);
static void lua_settop(lua_State *L, int idx);
static int lua_type(lua_State *L, int idx);
static const char *lua_tolstring(lua_State *L, int idx, size_t *len);
static size_t lua_objlen(lua_State *L, int idx);
static void lua_pushlstring(lua_State *L, const char *s, size_t l);
static void lua_pushcclosure(lua_State *L, lua_CFunction fn, int n);
static void lua_createtable(lua_State *L, int narr, int nrec);
static void lua_setfield(lua_State *L, int idx, const char *k);
static TValue luaO_nilobject_;
static int luaO_log2(unsigned int x);
static const TValue *luaT_gettm(Table *events, TMS event, TString *ename);
static void *luaM_realloc_(lua_State *L, void *block, size_t oldsize,
			size_t size);
static void *luaM_toobig(lua_State *L);
static void *luaM_growaux_(lua_State *L, void *block, int *size,
			size_t size_elem, int limit, const char *errormsg);
static int luaZ_fill(ZIO *z);
static void luaE_freethread(lua_State *L, lua_State *L1);
static void luaG_typeerror(lua_State *L, const TValue *o, const char *opname);
extern void luaG_runerror(lua_State *L, const char *fmt, ...);
typedef void (*Pfunc)(lua_State *L, void *ud);
static int luaD_poscall(lua_State *L, StkId firstResult);
static void luaD_reallocCI(lua_State *L, int newsize);
static void luaD_throw(lua_State *L, int errcode);
static void luaC_link(lua_State *L, GCObject *o, lu_byte tt);
static void luaC_linkupval(lua_State *L, UpVal *uv);
static void luaC_barrierf(lua_State *L, GCObject *o, GCObject *v);
static void luaC_barrierback(lua_State *L, Table *t);
static int luaV_equalval(lua_State *L, const TValue *t1, const TValue *t2);
static const TValue *luaV_tonumber(const TValue *obj, TValue *n);
static int luaV_tostring(lua_State *L, StkId obj);
static void luaV_execute(lua_State *L, int nexeccalls);
extern const char *luaO_pushfstring(lua_State *L, const char *fmt, ...);
extern const char *lua_pushfstring(lua_State *L, const char *fmt, ...);
static TValue luaO_nilobject_;
static void *luaM_growaux_(lua_State *L, void *block, int *size,
			size_t size_elems, int limit, const char *errormsg)
{
			void *newblock;
			int newsize;
			if (*size >= limit / 2) {
			if (*size >= limit)
			luaG_runerror(L, errormsg);
			newsize = limit;
			} else {
			newsize = (*size) * 2;
			if (newsize < 4)
			newsize = 4;
			}
			newblock = ((((size_t)((newsize) + 1)) <= ((size_t)(~(size_t)0) - 2) / (size_elems)) ? luaM_realloc_(L, (block), (*size) * (size_elems), (newsize) * (size_elems)) : luaM_toobig(L));
			*size = newsize;
			return newblock;
}
static void *luaM_toobig(lua_State *L)
{
			luaG_runerror(L, "memory allocation error: block too big");
			return ((void *)0);
}
static void *luaM_realloc_(lua_State *L, void *block, size_t osize,
			size_t nsize)
{
			global_State *g = (L->l_G);
			block = g->frealloc(g->ud, block, osize, nsize);
			if (block == ((void *)0) && nsize > 0)
			luaD_throw(L, 4);
			g->totalbytes = (g->totalbytes - osize) + nsize;
			return block;
}
static int luaO_int2fb(unsigned int x)
{
			int e = 0;
			while (x >= 16) {
			x = (x + 1) >> 1;
			e++;
			}
			if (x < 8)
			return x;
			else
			return ((e + 1) << 3) | (((int)((x))) - 8);
}
static int luaO_fb2int(int x)
{
			int e = (x >> 3) & 31;
			if (e == 0)
			return x;
			else
			return ((x & 7) + 8) << (e - 1);
}
static lu_byte log_2[256];
static int luaO_log2(unsigned int x)
{
			int l = -1;
			while (x >= 256) {
			l += 8;
			x >>= 8;
			}
			return l + log_2[x];
}
static int luaO_rawequalObj(const TValue *t1, const TValue *t2)
{
			if (((t1)->tt) != ((t2)->tt))
			return 0;
			else
			switch (((t1)->tt)) {
			case 0:
			return 1;
			case 3:
			return ((((t1)->value.n)) == (((t2)->value.n)));
			case 1:
			return ((t1)->value.b) == ((t2)->value.b);
			case 2:
			return ((t1)->value.p) == ((t2)->value.p);
			default:
			return ((t1)->value.gc) == ((t2)->value.gc);
			}
}
static int luaO_str2d(const char *s, lua_Number *result)
{
			char *endptr;
			*result = strtod((s), (&endptr));
			if (endptr == s)
			return 0;
			if (*endptr == 'x' || *endptr == 'X')
			*result = ((lua_Number)((strtoul(s, &endptr, 16))));
			if (*endptr == '\0')
			return 1;
			while (((*__ctype_b_loc ())[(int) ((((unsigned char)(*endptr))))] & (unsigned short int) _ISspace))
			endptr++;
			if (*endptr != '\0')
			return 0;
			return 1;
}
void pushstr(lua_State *L, const char *str)
{
			{ TValue *i_o = (L->top); i_o->value.gc = ((GCObject *)(((luaS_newlstr(L, str, strlen(str)))))); i_o->tt = 4;; };
			{ if ((char *)L->stack_last - (char *)L->top <= (1) * (int)sizeof(TValue)) luaD_growstack(L, 1); else ((void)0);; L->top++; };
}
static void luaO_chunkid(char *out, const char *source, size_t bufflen)
{
			if (*source == '=') {
			strncpy(out, source + 1, bufflen);
			out[bufflen - 1] = '\0';
			} else {
			if (*source == '@') {
			size_t l;
			source++;
			bufflen -= sizeof(" '...' ");
			l = strlen(source);
			strcpy(out, "");
			if (l > bufflen) {
			source += (l - bufflen);
			strcat(out, "...");
			}
			strcat(out, source);
			} else {
			size_t len = strcspn(source, "\n\r");
			bufflen -= sizeof(" [string \"...\"] ");
			if (len > bufflen)
			len = bufflen;
			strcpy(out, "[string \"");
			if (source[len] != '\0') {
			strncat(out, source, len);
			strcat(out, "...");
			} else
			strcat(out, source);
			strcat(out, "\"]");
			}
			}
}
static TValue *luaH_setnum(lua_State *L, Table *t, int key);
static const TValue *luaH_getstr(Table *t, TString *key);
static TValue *luaH_set(lua_State *L, Table *t, const TValue *key);
static const char *luaT_typenames[11];
static const char *luaT_eventname[17];
static void luaT_init(lua_State *L)
{
			int i;
			for (i = 0; i < TM_N; i++) {
			(L->l_G)->tmname[i] = (luaS_newlstr(L, luaT_eventname[i], strlen(luaT_eventname[i])));
			((((L->l_G)->tmname[i])->tsv.marked) |= ((1 << (5))));
			}
}
static const TValue *luaT_gettm(Table *events, TMS event, TString *ename)
{
			const TValue *tm = luaH_getstr(events, ename);
			if ((((tm)->tt) == 0)) {
			events->flags |= ((lu_byte)((1u << event)));
			return ((void *)0);
			} else
			return tm;
}
static const TValue *luaT_gettmbyobj(lua_State *L, const TValue *o, TMS event)
{
			Table *mt;
			switch (((o)->tt)) {
			case 5:
			mt = (&(o)->value.gc->h)->metatable;
			break;
			case 7:
			mt = (&(&(o)->value.gc->u)->uv)->metatable;
			break;
			default:
			mt = (L->l_G)->mt[((o)->tt)];
			}
			return (mt ? luaH_getstr(mt, (L->l_G)->tmname[event]) : (&luaO_nilobject_));
}
static Closure *luaF_newCclosure(lua_State *L, int nelems, Table *e)
{
			Closure *c = ((Closure *)(luaM_realloc_(L, ((void *)0), 0, ((((int)(sizeof(CClosure))) + ((int)(sizeof(TValue) * ((nelems)-1))))))));
			luaC_link(L, (((GCObject *)((c)))), 6);
			c->c.isC = 1;
			c->c.env = e;
			c->c.nupvalues = ((lu_byte)((nelems)));
			return c;
}
static Closure *luaF_newLclosure(lua_State *L, int nelems, Table *e)
{
			Closure *c = ((Closure *)(luaM_realloc_(L, ((void *)0), 0, ((((int)(sizeof(LClosure))) + ((int)(sizeof(TValue *) * ((nelems)-1))))))));
			luaC_link(L, (((GCObject *)((c)))), 6);
			c->l.isC = 0;
			c->l.env = e;
			c->l.nupvalues = ((lu_byte)((nelems)));
			while (nelems--)
			c->l.upvals[nelems] = ((void *)0);
			return c;
}
static UpVal *luaF_newupval(lua_State *L)
{
			UpVal *uv = ((UpVal *)(luaM_realloc_(L, ((void *)0), 0, (sizeof(UpVal)))));
			luaC_link(L, (((GCObject *)((uv)))), (8 + 2));
			uv->v = &uv->u.value;
			((uv->v)->tt = 0);
			return uv;
}
static UpVal *luaF_findupval(lua_State *L, StkId level)
{
			global_State *g = (L->l_G);
			GCObject **pp = &L->openupval;
			UpVal *p;
			UpVal *uv;
			while (*pp != ((void *)0) && (p = (&((*pp)->uv)))->v >= level) {
			if (p->v == level) {
			if ((((((GCObject *)((p)))))->gch.marked & (g->currentwhite ^ ((1 << (0)) | (1 << (1)))) & ((1 << (0)) | (1 << (1)))))
			(((((GCObject *)((p)))))->gch.marked ^= ((1 << (0)) | (1 << (1))));
			return p;
			}
			pp = &p->next;
			}
			uv = ((UpVal *)(luaM_realloc_(L, ((void *)0), 0, (sizeof(UpVal)))));
			uv->tt = (8 + 2);
			uv->marked = ((lu_byte)((g)->currentwhite &((1 << (0)) | (1 << (1)))));
			uv->v = level;
			uv->next = *pp;
			*pp = (((GCObject *)((uv))));
			uv->u.l.prev = &g->uvhead;
			uv->u.l.next = g->uvhead.u.l.next;
			uv->u.l.next->u.l.prev = uv;
			g->uvhead.u.l.next = uv;
			return uv;
}
static void unlinkupval(UpVal *uv)
{
			uv->u.l.next->u.l.prev = uv->u.l.prev;
			uv->u.l.prev->u.l.next = uv->u.l.next;
}
static void luaF_freeupval(lua_State *L, UpVal *uv)
{
			if (uv->v != &uv->u.value)
			unlinkupval(uv);
			luaM_realloc_(L, (uv), sizeof(*(uv)), 0);
}
static void luaF_close(lua_State *L, StkId level)
{
			UpVal *uv;
			global_State *g = (L->l_G);
			while (L->openupval != ((void *)0) &&
			(uv = (&((L->openupval)->uv)))->v >= level) {
			GCObject *o = (((GCObject *)((uv))));
			L->openupval = uv->next;
			if (((o)->gch.marked & (g->currentwhite ^ ((1 << (0)) | (1 << (1)))) & ((1 << (0)) | (1 << (1)))))
			luaF_freeupval(L, uv);
			else {
			unlinkupval(uv);
			{ const TValue *o2 = (uv->v); TValue *o1 = (&uv->u.value); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
			uv->v = &uv->u.value;
			luaC_linkupval(L, uv);
			}
			}
}
static Proto *luaF_newproto(lua_State *L)
{
			Proto *f = ((Proto *)(luaM_realloc_(L, ((void *)0), 0, (sizeof(Proto)))));
			luaC_link(L, (((GCObject *)((f)))), (8 + 1));
			f->k = ((void *)0);
			f->sizek = 0;
			f->p = ((void *)0);
			f->sizep = 0;
			f->code = ((void *)0);
			f->sizecode = 0;
			f->sizelineinfo = 0;
			f->sizeupvalues = 0;
			f->nups = 0;
			f->upvalues = ((void *)0);
			f->numparams = 0;
			f->is_vararg = 0;
			f->maxstacksize = 0;
			f->lineinfo = ((void *)0);
			f->sizelocvars = 0;
			f->locvars = ((void *)0);
			f->linedefined = 0;
			f->lastlinedefined = 0;
			f->source = ((void *)0);
			return f;
}
static void luaF_freeproto(lua_State *L, Proto *f)
{
			((((size_t)((0) + 1)) <= ((size_t)(~(size_t)0) - 2) / (sizeof(Instruction))) ? luaM_realloc_(L, ((f->code)), (f->sizecode) * (sizeof(Instruction)), (0) * (sizeof(Instruction))) : luaM_toobig(L));
			((((size_t)((0) + 1)) <= ((size_t)(~(size_t)0) - 2) / (sizeof(Proto *))) ? luaM_realloc_(L, ((f->p)), (f->sizep) * (sizeof(Proto *)), (0) * (sizeof(Proto *))) : luaM_toobig(L));
			((((size_t)((0) + 1)) <= ((size_t)(~(size_t)0) - 2) / (sizeof(TValue))) ? luaM_realloc_(L, ((f->k)), (f->sizek) * (sizeof(TValue)), (0) * (sizeof(TValue))) : luaM_toobig(L));
			((((size_t)((0) + 1)) <= ((size_t)(~(size_t)0) - 2) / (sizeof(int))) ? luaM_realloc_(L, ((f->lineinfo)), (f->sizelineinfo) * (sizeof(int)), (0) * (sizeof(int))) : luaM_toobig(L));
			((((size_t)((0) + 1)) <= ((size_t)(~(size_t)0) - 2) / (sizeof(struct LocVar))) ? luaM_realloc_(L, ((f->locvars)), (f->sizelocvars) * (sizeof(struct LocVar)), (0) * (sizeof(struct LocVar))) : luaM_toobig(L));
			((((size_t)((0) + 1)) <= ((size_t)(~(size_t)0) - 2) / (sizeof(TString *))) ? luaM_realloc_(L, ((f->upvalues)), (f->sizeupvalues) * (sizeof(TString *)), (0) * (sizeof(TString *))) : luaM_toobig(L));
			luaM_realloc_(L, (f), sizeof(*(f)), 0);
}
static void luaF_freeclosure(lua_State *L, Closure *c)
{
			int size = (c->c.isC) ? (((int)(sizeof(CClosure))) + ((int)(sizeof(TValue) * ((c->c.nupvalues)-1))))
			: (((int)(sizeof(LClosure))) + ((int)(sizeof(TValue *) * ((c->l.nupvalues)-1))));
			luaM_realloc_(L, (c), (size), 0);
}
static lu_byte luaP_opmodes[(((int)(OP_VARARG)) + 1)];
typedef struct expdesc {
			expkind k;
			union {
			struct {
			int info, aux;
			} s;
			lua_Number nval;
			} u;
			int t;
			int f;
} expdesc;
typedef struct upvaldesc {
			lu_byte k;
			lu_byte info;
} upvaldesc;
struct BlockCnt;
typedef struct FuncState {
			Proto *f;
			Table *h;
			struct FuncState *prev;
			struct LexState *ls;
			struct lua_State *L;
			struct BlockCnt *bl;
			int pc;
			int lasttarget;
			int jpc;
			int freereg;
			int nk;
			int np;
			short nlocvars;
			lu_byte nactvar;
			upvaldesc upvalues[60];
			unsigned short actvar[200];
} FuncState;
static Proto *luaY_parser(lua_State *L, ZIO *z, Mbuffer *buff,
			const char *name);
struct lua_longjmp {
			struct lua_longjmp *previous;
			jmp_buf b;
			volatile int status;
};
static void luaD_seterrorobj(lua_State *L, int errcode, StkId oldtop)
{
			switch (errcode) {
			case 4: {
			{ TValue *i_o = (oldtop); i_o->value.gc = ((GCObject *)(((luaS_newlstr(L, """not enough memory", (sizeof("not enough memory") / sizeof(char)) - 1))))); i_o->tt = 4;; };
			break;
			}
			case 5: {
			{ TValue *i_o = (oldtop); i_o->value.gc = ((GCObject *)(((luaS_newlstr(L, """error in error handling", (sizeof("error in error handling") / sizeof(char)) - 1))))); i_o->tt = 4;; };
			break;
			}
			case 3:
			case 2: {
			{ const TValue *o2 = (L->top - 1); TValue *o1 = (oldtop); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
			break;
			}
			}
			L->top = oldtop + 1;
}
static void restore_stack_limit(lua_State *L)
{
			if (L->size_ci > 20000) {
			int inuse = ((int)((L->ci - L->base_ci)));
			if (inuse + 1 < 20000)
			luaD_reallocCI(L, 20000);
			}
}
static void resetstack(lua_State *L, int status)
{
			L->ci = L->base_ci;
			L->base = L->ci->base;
			luaF_close(L, L->base);
			luaD_seterrorobj(L, status, L->base);
			L->nCcalls = L->baseCcalls;
			L->allowhook = 1;
			restore_stack_limit(L);
			L->errfunc = 0;
			L->errorJmp = ((void *)0);
}
static void luaD_throw(lua_State *L, int errcode)
{
			if (L->errorJmp) {
			L->errorJmp->status = errcode;
			longjmp((L->errorJmp)->b, 1);
			} else {
			L->status = ((lu_byte)((errcode)));
			if ((L->l_G)->panic) {
			resetstack(L, errcode);
			(L->l_G)->panic(L);
			}
			exit(1);
			}
}
static int luaD_rawrunprotected(lua_State *L, Pfunc f, void *ud)
{
			struct lua_longjmp lj;
			lj.status = 0;
			lj.previous = L->errorJmp;
			L->errorJmp = &lj;
			if (_setjmp ((&lj)->b) == 0) { f(L, ud); };
			L->errorJmp = lj.previous;
			return lj.status;
}
static void correctstack(lua_State *L, TValue *oldstack)
{
			CallInfo *ci;
			GCObject *up;
			L->top = (L->top - oldstack) + L->stack;
			for (up = L->openupval; up != ((void *)0); up = up->gch.next)
			(&((up)->uv))->v = ((&((up)->uv))->v - oldstack) + L->stack;
			for (ci = L->base_ci; ci <= L->ci; ci++) {
			ci->top = (ci->top - oldstack) + L->stack;
			ci->base = (ci->base - oldstack) + L->stack;
			ci->func = (ci->func - oldstack) + L->stack;
			}
			L->base = (L->base - oldstack) + L->stack;
}
void luaD_reallocstack(lua_State *L, int newsize)
{
			TValue *oldstack = L->stack;
			int realsize = newsize + 1 + 5;
			((L->stack) = ((TValue *)(((((size_t)((realsize) + 1)) <= ((size_t)(~(size_t)0) - 2) / (sizeof(TValue))) ? luaM_realloc_(L, (L->stack), (L->stacksize) * (sizeof(TValue)), (realsize) * (sizeof(TValue))) : luaM_toobig(L)))));
			L->stacksize = realsize;
			L->stack_last = L->stack + newsize;
			correctstack(L, oldstack);
}
static void luaD_reallocCI(lua_State *L, int newsize)
{
			CallInfo *oldci = L->base_ci;
			((L->base_ci) = ((CallInfo *)(((((size_t)((newsize) + 1)) <= ((size_t)(~(size_t)0) - 2) / (sizeof(CallInfo))) ? luaM_realloc_(L, (L->base_ci), (L->size_ci) * (sizeof(CallInfo)), (newsize) * (sizeof(CallInfo))) : luaM_toobig(L)))));
			L->size_ci = newsize;
			L->ci = (L->ci - oldci) + L->base_ci;
			L->end_ci = L->base_ci + L->size_ci - 1;
}
void luaD_growstack(lua_State *L, int n)
{
			if (n <= L->stacksize)
			luaD_reallocstack(L, 2 * L->stacksize);
			else
			luaD_reallocstack(L, L->stacksize + n);
}
static CallInfo *growCI(lua_State *L)
{
			if (L->size_ci > 20000)
			luaD_throw(L, 5);
			else {
			luaD_reallocCI(L, 2 * L->size_ci);
			if (L->size_ci > 20000)
			luaG_runerror(L, "stack overflow");
			}
			return ++L->ci;
}
static StkId adjust_varargs(lua_State *L, Proto *p, int actual)
{
			int i;
			int nfixargs = p->numparams;
			Table *htab = ((void *)0);
			StkId base, fixed;
			for (; actual < nfixargs; ++actual)
			((L->top++)->tt = 0);
			fixed = L->top - actual;
			base = L->top;
			for (i = 0; i < nfixargs; i++) {
			{ const TValue *o2 = (fixed + i); TValue *o1 = (L->top++); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
			((fixed + i)->tt = 0);
			}
			if (htab) {
			{ TValue *i_o = (L->top++); i_o->value.gc = ((GCObject *)((htab))); i_o->tt = 5;; };
			}
			return base;
}
static StkId tryfuncTM(lua_State *L, StkId func)
{
			const TValue *tm = luaT_gettmbyobj(L, func, TM_CALL);
			StkId p;
			ptrdiff_t funcr = ((char *)(func) - (char *)L->stack);
			if (!(((tm)->tt) == 6))
			luaG_typeerror(L, func, "call");
			for (p = L->top; p > func; p--)
			{ const TValue *o2 = (p - 1); TValue *o1 = (p); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
			{ if ((char *)L->stack_last - (char *)L->top <= (1) * (int)sizeof(TValue)) luaD_growstack(L, 1); else ((void)0);; L->top++; };
			func = ((TValue *)((char *)L->stack + (funcr)));
			{ const TValue *o2 = (tm); TValue *o1 = (func); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
			return func;
}
static int luaD_precall(lua_State *L, StkId func, int nresults)
{
			LClosure *cl;
			ptrdiff_t funcr;
			if (!(((func)->tt) == 6))
			func = tryfuncTM(L, func);
			funcr = ((char *)(func) - (char *)L->stack);
			cl = &(&(func)->value.gc->cl)->l;
			L->ci->savedpc = L->savedpc;
			if (!cl->isC) {
			CallInfo *ci;
			StkId st, base;
			Proto *p = cl->p;
			if ((char *)L->stack_last - (char *)L->top <= (p->maxstacksize) * (int)sizeof(TValue)) luaD_growstack(L, p->maxstacksize); else ((void)0);;
			func = ((TValue *)((char *)L->stack + (funcr)));
			if (!p->is_vararg) {
			base = func + 1;
			if (L->top > base + p->numparams)
			L->top = base + p->numparams;
			} else {
			int nargs = ((int)((L->top - func))) - 1;
			base = adjust_varargs(L, p, nargs);
			func = ((TValue *)((char *)L->stack + (funcr)));
			}
			ci = ((L->ci == L->end_ci) ? growCI(L) : (((void)0), ++L->ci));
			ci->func = func;
			L->base = ci->base = base;
			ci->top = L->base + p->maxstacksize;
			L->savedpc = p->code;
			ci->tailcalls = 0;
			ci->nresults = nresults;
			for (st = L->top; st < ci->top; st++)
			((st)->tt = 0);
			L->top = ci->top;
			return 0;
			} else {
			CallInfo *ci;
			int n;
			if ((char *)L->stack_last - (char *)L->top <= (20) * (int)sizeof(TValue)) luaD_growstack(L, 20); else ((void)0);;
			ci = ((L->ci == L->end_ci) ? growCI(L) : (((void)0), ++L->ci));
			ci->func = ((TValue *)((char *)L->stack + (funcr)));
			L->base = ci->base = ci->func + 1;
			ci->top = L->top + 20;
			ci->nresults = nresults;
			n = ((&(L->ci->func)->value.gc->cl))->c.f(L);
			if (n < 0)
			return 2;
			else {
			luaD_poscall(L, L->top - n);
			return 1;
			}
			}
}
static int luaD_poscall(lua_State *L, StkId firstResult)
{
			StkId res;
			int wanted, i;
			CallInfo *ci;
			ci = L->ci--;
			res = ci->func;
			wanted = ci->nresults;
			L->base = (ci - 1)->base;
			L->savedpc = (ci - 1)->savedpc;
			for (i = wanted; i != 0 && firstResult < L->top; i--)
			{ const TValue *o2 = (firstResult++); TValue *o1 = (res++); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
			while (i-- > 0)
			((res++)->tt = 0);
			L->top = res;
			return (wanted - (-1));
}
static void luaD_call(lua_State *L, StkId func, int nResults)
{
			if (++L->nCcalls >= 200) {
			if (L->nCcalls == 200)
			luaG_runerror(L, "C stack overflow");
			else if (L->nCcalls >= (200 + (200 >> 3)))
			luaD_throw(L, 5);
			}
			if (luaD_precall(L, func, nResults) == 0)
			luaV_execute(L, 1);
			L->nCcalls--;
			{ ((void)0); if ((L->l_G)->totalbytes >= (L->l_G)->GCthreshold) luaC_step(L); };
}
static int luaD_pcall(lua_State *L, Pfunc func, void *u, ptrdiff_t old_top,
			ptrdiff_t ef)
{
			int status;
			unsigned short oldnCcalls = L->nCcalls;
			ptrdiff_t old_ci = ((char *)(L->ci) - (char *)L->base_ci);
			lu_byte old_allowhooks = L->allowhook;
			ptrdiff_t old_errfunc = L->errfunc;
			L->errfunc = ef;
			status = luaD_rawrunprotected(L, func, u);
			if (status != 0) {
			StkId oldtop = ((TValue *)((char *)L->stack + (old_top)));
			luaF_close(L, oldtop);
			luaD_seterrorobj(L, status, oldtop);
			L->nCcalls = oldnCcalls;
			L->ci = ((CallInfo *)((char *)L->base_ci + (old_ci)));
			L->base = L->ci->base;
			L->savedpc = L->ci->savedpc;
			L->allowhook = old_allowhooks;
			restore_stack_limit(L);
			}
			L->errfunc = old_errfunc;
			return status;
}
struct SParser {
			ZIO *z;
			Mbuffer buff;
			const char *name;
};
static void f_parser(lua_State *L, void *ud)
{
			int i;
			Proto *tf;
			Closure *cl;
			struct SParser *p = ((struct SParser *)(ud));
			{ ((void)0); if ((L->l_G)->totalbytes >= (L->l_G)->GCthreshold) luaC_step(L); };
			tf = luaY_parser(L, p->z, &p->buff, p->name);
			cl = luaF_newLclosure(L, tf->nups, (&((&L->l_gt))->value.gc->h));
			cl->l.p = tf;
			for (i = 0; i < tf->nups; i++)
			cl->l.upvals[i] = luaF_newupval(L);
			{ TValue *i_o = (L->top); i_o->value.gc = ((GCObject *)((cl))); i_o->tt = 6;; };
			{ if ((char *)L->stack_last - (char *)L->top <= (1) * (int)sizeof(TValue)) luaD_growstack(L, 1); else ((void)0);; L->top++; };
}
static int luaD_protectedparser(lua_State *L, ZIO *z, const char *name)
{
			struct SParser p;
			int status;
			p.z = z;
			p.name = name;
			((&p.buff)->buffer = ((void *)0), (&p.buff)->buffsize = 0);
			status = luaD_pcall(L, f_parser, &p, ((char *)(L->top) - (char *)L->stack), L->errfunc);
			((((&p.buff)->buffer) = ((char *)(((((size_t)((0) + 1)) <= ((size_t)(~(size_t)0) - 2) / (sizeof(char))) ? luaM_realloc_(L, ((&p.buff)->buffer), ((&p.buff)->buffsize) * (sizeof(char)), (0) * (sizeof(char))) : luaM_toobig(L))))), (&p.buff)->buffsize = 0);
			return status;
}
static void luaS_resize(lua_State *L, int newsize)
{
			GCObject **newhash;
			stringtable *tb;
			int i;
			if ((L->l_G)->gcstate == 2)
			return;
			newhash = ((GCObject * *)(((((size_t)((newsize) + 1)) <= ((size_t)(~(size_t)0) - 2) / (sizeof(GCObject *))) ? luaM_realloc_(L, (((void *)0)), (0) * (sizeof(GCObject *)), (newsize) * (sizeof(GCObject *))) : luaM_toobig(L))));
			tb = &(L->l_G)->strt;
			for (i = 0; i < newsize; i++)
			newhash[i] = ((void *)0);
			for (i = 0; i < tb->size; i++) {
			GCObject *p = tb->hash[i];
			while (p) {
			GCObject *next = p->gch.next;
			unsigned int h = (&(&((p)->ts))->tsv)->hash;
			int h1 = (((((int)((h) & ((newsize)-1))))));
			p->gch.next = newhash[h1];
			newhash[h1] = p;
			p = next;
			}
			}
			((((size_t)((0) + 1)) <= ((size_t)(~(size_t)0) - 2) / (sizeof(TString *))) ? luaM_realloc_(L, ((tb->hash)), (tb->size) * (sizeof(TString *)), (0) * (sizeof(TString *))) : luaM_toobig(L));
			tb->size = newsize;
			tb->hash = newhash;
}
static TString *newlstr(lua_State *L, const char *str, size_t l, unsigned int h)
{
			TString *ts;
			stringtable *tb;
			if (l + 1 >
			(((size_t)(~(size_t)0) - 2) - sizeof(TString)) / sizeof(char))
			luaM_toobig(L);
			ts = ((TString *)(luaM_realloc_(L, ((void *)0), 0, ((l + 1) * sizeof(char) + sizeof(TString)))));
			ts->tsv.len = l;
			ts->tsv.hash = h;
			ts->tsv.marked = ((lu_byte)(((L->l_G))->currentwhite &((1 << (0)) | (1 << (1)))));
			ts->tsv.tt = 4;
			ts->tsv.reserved = 0;
			memcpy(ts + 1, str, l * sizeof(char));
			((char *)(ts + 1))[l] = '\0';
			tb = &(L->l_G)->strt;
			h = (((((int)((h) & ((tb->size)-1))))));
			ts->tsv.next = tb->hash[h];
			tb->hash[h] = (((GCObject *)((ts))));
			tb->nuse++;
			if (tb->nuse > ((lu_int32)(tb->size)) &&
			tb->size <= (0x7fffffff - 2) / 2)
			luaS_resize(L, tb->size * 2);
			return ts;
}
TString *luaS_newlstr(lua_State *L, const char *str, size_t l)
{
			GCObject *o;
			unsigned int h = ((unsigned int)(l));
			size_t step = (l >> 5) + 1;
			size_t l1;
			for (l1 = l; l1 >= step; l1 -= step)
			h = h ^
			((h << 5) + (h >> 2) + ((unsigned char)(str[l1 - 1])));
			for (o = (L->l_G)->strt.hash[(((((int)((h) & (((L->l_G)->strt.size)-1))))))]; o != ((void *)0);
			o = o->gch.next) {
			TString *ts = (&((o)->ts));
			if (ts->tsv.len == l && (memcmp(str, ((const char *)((ts) + 1)), l) == 0)) {
			if (((o)->gch.marked & ((L->l_G)->currentwhite ^ ((1 << (0)) | (1 << (1)))) & ((1 << (0)) | (1 << (1)))))
			((o)->gch.marked ^= ((1 << (0)) | (1 << (1))));
			return ts;
			}
			}
			return newlstr(L, str, l, h);
}
static Udata *luaS_newudata(lua_State *L, size_t s, Table *e)
{
			Udata *u;
			if (s > ((size_t)(~(size_t)0) - 2) - sizeof(Udata))
			luaM_toobig(L);
			u = ((Udata *)(luaM_realloc_(L, ((void *)0), 0, (s + sizeof(Udata)))));
			u->uv.marked = ((lu_byte)(((L->l_G))->currentwhite &((1 << (0)) | (1 << (1)))));
			u->uv.tt = 7;
			u->uv.len = s;
			u->uv.metatable = ((void *)0);
			u->uv.env = e;
			u->uv.next = (L->l_G)->mainthread->next;
			(L->l_G)->mainthread->next = (((GCObject *)((u))));
			return u;
}
static Node dummynode_;
static Node *hashnum(const Table *t, lua_Number n)
{
			unsigned int a[((int)((sizeof(lua_Number) / sizeof(int))))];
			int i;
			if (((n) == (0)))
			return (&(t)->node[0]);
			memcpy(a, &n, sizeof(a));
			for (i = 1; i < ((int)((sizeof(lua_Number) / sizeof(int)))); i++)
			a[0] += a[i];
			return ((&(t)->node[((a[0]) % (((((size_t)1 << ((t)->lsizenode))) - 1) | 1))]));
}
static Node *mainposition(const Table *t, const TValue *key)
{
			switch (((key)->tt)) {
			case 3:
			return hashnum(t, ((key)->value.n));
			case 4:
			return ((&(t)->node[(((((int)(((((&(key)->value.gc->ts))->tsv.hash)) & (((((size_t)1 << ((t)->lsizenode))))-1))))))]));
			case 1:
			return ((&(t)->node[(((((int)(((((key)->value.b))) & (((((size_t)1 << ((t)->lsizenode))))-1))))))]));
			case 2:
			return ((&(t)->node[((((unsigned int)(lu_mem)(((key)->value.p)))) % (((((size_t)1 << ((t)->lsizenode))) - 1) | 1))]));
			default:
			return ((&(t)->node[((((unsigned int)(lu_mem)(((key)->value.gc)))) % (((((size_t)1 << ((t)->lsizenode))) - 1) | 1))]));
			}
}
static int arrayindex(const TValue *key)
{
			if ((((key)->tt) == 3)) {
			lua_Number n = ((key)->value.n);
			int k;
			((k) = (int)(n));
			if (((((lua_Number)((k)))) == (n)))
			return k;
			}
			return -1;
}
static int findindex(lua_State *L, Table *t, StkId key)
{
			int i;
			if ((((key)->tt) == 0))
			return -1;
			i = arrayindex(key);
			if (0 < i && i <= t->sizearray)
			return i - 1;
			else {
			Node *n = mainposition(t, key);
			do {
			if (luaO_rawequalObj((&(n)->i_key.tvk), key) ||
			((((&(n)->i_key.nk))->tt) == (8 + 3) && (((key)->tt) >= 4) &&
			(((&(n)->i_key.nk))->value.gc) == ((key)->value.gc))) {
			i = ((int)((n - (&(t)->node[0]))));
			return i + t->sizearray;
			} else
			n = ((n)->i_key.nk.next);
			} while (n);
			luaG_runerror(L, "invalid key to " "'" "next" "'");
			return 0;
			}
}
static int luaH_next(lua_State *L, Table *t, StkId key)
{
			int i = findindex(L, t, key);
			for (i++; i < t->sizearray; i++) {
			if (!(((&t->array[i])->tt) == 0)) {
			{ TValue *i_o = (key); i_o->value.n = (((lua_Number)((i + 1)))); i_o->tt = 3; };
			{ const TValue *o2 = (&t->array[i]); TValue *o1 = (key + 1); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
			return 1;
			}
			}
			for (i -= t->sizearray; i < (int)(((size_t)1 << ((t)->lsizenode))); i++) {
			if (!((((&((&(t)->node[i]))->i_val))->tt) == 0)) {
			{ const TValue *o2 = ((&((&(t)->node[i]))->i_key.tvk)); TValue *o1 = (key); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
			{ const TValue *o2 = ((&((&(t)->node[i]))->i_val)); TValue *o1 = (key + 1); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
			return 1;
			}
			}
			return 0;
}
static int computesizes(int nums[], int *narray)
{
			int i;
			int twotoi;
			int a = 0;
			int na = 0;
			int n = 0;
			for (i = 0, twotoi = 1; twotoi / 2 < *narray; i++, twotoi *= 2) {
			if (nums[i] > 0) {
			a += nums[i];
			if (a > twotoi / 2) {
			n = twotoi;
			na = a;
			}
			}
			if (a == *narray)
			break;
			}
			*narray = n;
			return na;
}
static int countint(const TValue *key, int *nums)
{
			int k = arrayindex(key);
			if (0 < k && k <= (1 << (32 - 2))) {
			nums[(luaO_log2((k)-1) + 1)]++;
			return 1;
			} else
			return 0;
}
static int numusearray(const Table *t, int *nums)
{
			int lg;
			int ttlg;
			int ause = 0;
			int i = 1;
			for (lg = 0, ttlg = 1; lg <= (32 - 2); lg++, ttlg *= 2) {
			int lc = 0;
			int lim = ttlg;
			if (lim > t->sizearray) {
			lim = t->sizearray;
			if (i > lim)
			break;
			}
			for (; i <= lim; i++) {
			if (!(((&t->array[i - 1])->tt) == 0))
			lc++;
			}
			nums[lg] += lc;
			ause += lc;
			}
			return ause;
}
static int numusehash(const Table *t, int *nums, int *pnasize)
{
			int totaluse = 0;
			int ause = 0;
			int i = (((size_t)1 << ((t)->lsizenode)));
			while (i--) {
			Node *n = &t->node[i];
			if (!((((&(n)->i_val))->tt) == 0)) {
			ause += countint((&(n)->i_key.tvk), nums);
			totaluse++;
			}
			}
			*pnasize += ause;
			return totaluse;
}
static void setarrayvector(lua_State *L, Table *t, int size)
{
			int i;
			((t->array) = ((TValue *)(((((size_t)((size) + 1)) <= ((size_t)(~(size_t)0) - 2) / (sizeof(TValue))) ? luaM_realloc_(L, (t->array), (t->sizearray) * (sizeof(TValue)), (size) * (sizeof(TValue))) : luaM_toobig(L)))));
			for (i = t->sizearray; i < size; i++)
			((&t->array[i])->tt = 0);
			t->sizearray = size;
}
static void setnodevector(lua_State *L, Table *t, int size)
{
			int lsize;
			if (size == 0) {
			t->node = ((Node *)((&dummynode_)));
			lsize = 0;
			} else {
			int i;
			lsize = (luaO_log2((size)-1) + 1);
			if (lsize > (32 - 2))
			luaG_runerror(L, "table overflow");
			size = ((size_t)1 << (lsize));
			t->node = ((Node *)(((((size_t)((size) + 1)) <= ((size_t)(~(size_t)0) - 2) / (sizeof(Node))) ? luaM_realloc_(L, (((void *)0)), (0) * (sizeof(Node)), (size) * (sizeof(Node))) : luaM_toobig(L))));
			for (i = 0; i < size; i++) {
			Node *n = (&(t)->node[i]);
			((n)->i_key.nk.next) = ((void *)0);
			(((&(n)->i_key.nk))->tt = 0);
			(((&(n)->i_val))->tt = 0);
			}
			}
			t->lsizenode = ((lu_byte)((lsize)));
			t->lastfree = (&(t)->node[size]);
}
static void resize(lua_State *L, Table *t, int nasize, int nhsize)
{
			int i;
			int oldasize = t->sizearray;
			int oldhsize = t->lsizenode;
			Node *nold = t->node;
			if (nasize > oldasize)
			setarrayvector(L, t, nasize);
			setnodevector(L, t, nhsize);
			if (nasize < oldasize) {
			t->sizearray = nasize;
			for (i = nasize; i < oldasize; i++) {
			if (!(((&t->array[i])->tt) == 0))
			{ const TValue *o2 = (&t->array[i]); TValue *o1 = (luaH_setnum(L, t, i + 1)); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
			}
			((t->array) = ((TValue *)(((((size_t)((nasize) + 1)) <= ((size_t)(~(size_t)0) - 2) / (sizeof(TValue))) ? luaM_realloc_(L, (t->array), (oldasize) * (sizeof(TValue)), (nasize) * (sizeof(TValue))) : luaM_toobig(L)))));
			}
			for (i = ((size_t)1 << (oldhsize)) - 1; i >= 0; i--) {
			Node *old = nold + i;
			if (!((((&(old)->i_val))->tt) == 0))
			{ const TValue *o2 = ((&(old)->i_val)); TValue *o1 = (luaH_set(L, t, (&(old)->i_key.tvk))); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
			}
			if (nold != (&dummynode_))
			((((size_t)((0) + 1)) <= ((size_t)(~(size_t)0) - 2) / (sizeof(Node))) ? luaM_realloc_(L, ((nold)), (((size_t)1 << (oldhsize))) * (sizeof(Node)), (0) * (sizeof(Node))) : luaM_toobig(L));
}
static void luaH_resizearray(lua_State *L, Table *t, int nasize)
{
			int nsize = (t->node == (&dummynode_)) ? 0 : (((size_t)1 << ((t)->lsizenode)));
			resize(L, t, nasize, nsize);
}
static void rehash(lua_State *L, Table *t, const TValue *ek)
{
			int nasize, na;
			int nums[(32 - 2) + 1];
			int i;
			int totaluse;
			for (i = 0; i <= (32 - 2); i++)
			nums[i] = 0;
			nasize = numusearray(t, nums);
			totaluse = nasize;
			totaluse += numusehash(t, nums, &nasize);
			nasize += countint(ek, nums);
			totaluse++;
			na = computesizes(nums, &nasize);
			resize(L, t, nasize, totaluse - na);
}
static Table *luaH_new(lua_State *L, int narray, int nhash)
{
			Table *t = ((Table *)(luaM_realloc_(L, ((void *)0), 0, (sizeof(Table)))));
			luaC_link(L, (((GCObject *)((t)))), 5);
			t->metatable = ((void *)0);
			t->flags = ((lu_byte)((~0)));
			t->array = ((void *)0);
			t->sizearray = 0;
			t->lsizenode = 0;
			t->node = ((Node *)((&dummynode_)));
			setarrayvector(L, t, narray);
			setnodevector(L, t, nhash);
			return t;
}
static void luaH_free(lua_State *L, Table *t)
{
			if (t->node != (&dummynode_))
			((((size_t)((0) + 1)) <= ((size_t)(~(size_t)0) - 2) / (sizeof(Node))) ? luaM_realloc_(L, ((t->node)), ((((size_t)1 << ((t)->lsizenode)))) * (sizeof(Node)), (0) * (sizeof(Node))) : luaM_toobig(L));
			((((size_t)((0) + 1)) <= ((size_t)(~(size_t)0) - 2) / (sizeof(TValue))) ? luaM_realloc_(L, ((t->array)), (t->sizearray) * (sizeof(TValue)), (0) * (sizeof(TValue))) : luaM_toobig(L));
			luaM_realloc_(L, (t), sizeof(*(t)), 0);
}
static Node *getfreepos(Table *t)
{
			while (t->lastfree-- > t->node) {
			if (((((&(t->lastfree)->i_key.nk))->tt) == 0))
			return t->lastfree;
			}
			return ((void *)0);
}
static TValue *newkey(lua_State *L, Table *t, const TValue *key)
{
			Node *mp = mainposition(t, key);
			if (!((((&(mp)->i_val))->tt) == 0) || mp == (&dummynode_)) {
			Node *othern;
			Node *n = getfreepos(t);
			if (n == ((void *)0)) {
			rehash(L, t, key);
			return luaH_set(L, t, key);
			}
			othern = mainposition(t, (&(mp)->i_key.tvk));
			if (othern != mp) {
			while (((othern)->i_key.nk.next) != mp)
			othern = ((othern)->i_key.nk.next);
			((othern)->i_key.nk.next) = n;
			memcpy(n, mp, sizeof *n);
			((mp)->i_key.nk.next) = ((void *)0);
			(((&(mp)->i_val))->tt = 0);
			} else {
			((n)->i_key.nk.next) = ((mp)->i_key.nk.next);
			((mp)->i_key.nk.next) = n;
			mp = n;
			}
			}
			(&(mp)->i_key.nk)->value.n = key->value.n;
			(&(mp)->i_key.nk)->tt = key->tt;
			{ if (((((key)->tt) >= 4) && (((((key)->value.gc))->gch.marked) & ((((1 << (0)) | (1 << (1))))))) && ((((((GCObject *)((t)))))->gch.marked) & ((1 << (2))))) luaC_barrierback(L, t); };
			return (&(mp)->i_val);
}
static const TValue *luaH_getnum(Table *t, int key)
{
			if (((unsigned int)(key)) - 1 < ((unsigned int)(t->sizearray)))
			return &t->array[key - 1];
			else {
			lua_Number nk = ((lua_Number)((key)));
			Node *n = hashnum(t, nk);
			do {
			if (((((&(n)->i_key.nk))->tt) == 3) &&
			(((((&(n)->i_key.nk))->value.n)) == (nk)))
			return (&(n)->i_val);
			else
			n = ((n)->i_key.nk.next);
			} while (n);
			return (&luaO_nilobject_);
			}
}
static const TValue *luaH_getstr(Table *t, TString *key)
{
			Node *n = ((&(t)->node[(((((int)((((key)->tsv.hash)) & (((((size_t)1 << ((t)->lsizenode))))-1))))))]));
			do {
			if (((((&(n)->i_key.nk))->tt) == 4) && (&((&(n)->i_key.nk))->value.gc->ts) == key)
			return (&(n)->i_val);
			else
			n = ((n)->i_key.nk.next);
			} while (n);
			return (&luaO_nilobject_);
}
static const TValue *luaH_get(Table *t, const TValue *key)
{
			switch (((key)->tt)) {
			case 0:
			return (&luaO_nilobject_);
			case 4:
			return luaH_getstr(t, (&(key)->value.gc->ts));
			case 3: {
			int k;
			lua_Number n = ((key)->value.n);
			((k) = (int)(n));
			if (((((lua_Number)((k)))) == (((key)->value.n))))
			return luaH_getnum(t, k);
			}
			default: {
			Node *n = mainposition(t, key);
			do {
			if (luaO_rawequalObj((&(n)->i_key.tvk), key))
			return (&(n)->i_val);
			else
			n = ((n)->i_key.nk.next);
			} while (n);
			return (&luaO_nilobject_);
			}
			}
}
static TValue *luaH_set(lua_State *L, Table *t, const TValue *key)
{
			const TValue *p = luaH_get(t, key);
			t->flags = 0;
			if (p != (&luaO_nilobject_))
			return ((TValue *)(p));
			else {
			if ((((key)->tt) == 0))
			luaG_runerror(L, "table index is nil");
			else if ((((key)->tt) == 3) && (!(((((key)->value.n))) == ((((key)->value.n))))))
			luaG_runerror(L, "table index is NaN");
			return newkey(L, t, key);
			}
}
static TValue *luaH_setnum(lua_State *L, Table *t, int key)
{
			const TValue *p = luaH_getnum(t, key);
			if (p != (&luaO_nilobject_))
			return ((TValue *)(p));
			else {
			TValue k;
			{ TValue *i_o = (&k); i_o->value.n = (((lua_Number)((key)))); i_o->tt = 3; };
			return newkey(L, t, &k);
			}
}
static TValue *luaH_setstr(lua_State *L, Table *t, TString *key)
{
			const TValue *p = luaH_getstr(t, key);
			if (p != (&luaO_nilobject_))
			return ((TValue *)(p));
			else {
			TValue k;
			{ TValue *i_o = (&k); i_o->value.gc = ((GCObject *)((key))); i_o->tt = 4;; };
			return newkey(L, t, &k);
			}
}
static int unbound_search(Table *t, unsigned int j)
{
			unsigned int i = j;
			j++;
			while (!(((luaH_getnum(t, j))->tt) == 0)) {
			i = j;
			j *= 2;
			if (j > ((unsigned int)((0x7fffffff - 2)))) {
			i = 1;
			while (!(((luaH_getnum(t, i))->tt) == 0))
			i++;
			return i - 1;
			}
			}
			while (j - i > 1) {
			unsigned int m = (i + j) / 2;
			if ((((luaH_getnum(t, m))->tt) == 0))
			j = m;
			else
			i = m;
			}
			return i;
}
static int luaH_getn(Table *t)
{
			unsigned int j = t->sizearray;
			if (j > 0 && (((&t->array[j - 1])->tt) == 0)) {
			unsigned int i = 0;
			while (j - i > 1) {
			unsigned int m = (i + j) / 2;
			if ((((&t->array[m - 1])->tt) == 0))
			j = m;
			else
			i = m;
			}
			return i;
			} else if (t->node == (&dummynode_))
			return j;
			else
			return unbound_search(t, j);
}
static void removeentry(Node *n)
{
			if (((((&(n)->i_key.nk))->tt) >= 4))
			((((&(n)->i_key.nk))->tt) = ((8 + 3)));
}
static void reallymarkobject(global_State *g, GCObject *o)
{
			(((o)->gch.marked) &= ((lu_byte)(~((((1 << (0)) | (1 << (1))))))));
			switch (o->gch.tt) {
			case 4: {
			return;
			}
			case 7: {
			Table *mt = (&(&((o)->u))->uv)->metatable;
			(((o)->gch.marked) |= ((1 << (2))));
			if (mt)
			{ if (((((((GCObject *)((mt)))))->gch.marked) & ((((1 << (0)) | (1 << (1))))))) reallymarkobject(g, (((GCObject *)((mt))))); };
			{ if (((((((GCObject *)(((&(&((o)->u))->uv)->env)))))->gch.marked) & ((((1 << (0)) | (1 << (1))))))) reallymarkobject(g, (((GCObject *)(((&(&((o)->u))->uv)->env))))); };
			return;
			}
			case (8 + 2): {
			UpVal *uv = (&((o)->uv));
			{; if ((((uv->v)->tt) >= 4) && (((((uv->v)->value.gc))->gch.marked) & ((((1 << (0)) | (1 << (1))))))) reallymarkobject(g, ((uv->v)->value.gc)); };
			if (uv->v == &uv->u.value)
			(((o)->gch.marked) |= ((1 << (2))));
			return;
			}
			case 6: {
			(&((o)->cl))->c.gclist = g->gray;
			g->gray = o;
			break;
			}
			case 5: {
			(&((o)->h))->gclist = g->gray;
			g->gray = o;
			break;
			}
			case 8: {
			(&((o)->th))->gclist = g->gray;
			g->gray = o;
			break;
			}
			case (8 + 1): {
			(&((o)->p))->gclist = g->gray;
			g->gray = o;
			break;
			}
			default:;
			}
}
static void marktmu(global_State *g)
{
			GCObject *u = g->tmudata;
			if (u) {
			do {
			u = u->gch.next;
			((u)->gch.marked = ((lu_byte)((((u)->gch.marked & ((lu_byte)((~((1 << (2)) | ((1 << (0)) | (1 << (1)))))))) | ((lu_byte)((g)->currentwhite &((1 << (0)) | (1 << (1)))))))));
			reallymarkobject(g, u);
			} while (u != g->tmudata);
			}
}
static size_t luaC_separateudata(lua_State *L, int all)
{
			global_State *g = (L->l_G);
			size_t deadmem = 0;
			GCObject **p = &g->mainthread->next;
			GCObject *curr;
			while ((curr = *p) != ((void *)0)) {
			if (!((((curr)->gch.marked) & ((((1 << (0)) | (1 << (1)))))) || all) || ((((&(&((curr)->u))->uv))->marked) & ((1 << (3)))))
			p = &curr->gch.next;
			else if ((((&(&((curr)->u))->uv)->metatable) == ((void *)0) ? ((void *)0) : (((&(&((curr)->u))->uv)->metatable)->flags & (1u << (TM_GC))) ? ((void *)0) : luaT_gettm((&(&((curr)->u))->uv)->metatable, TM_GC, ((L->l_G))->tmname[TM_GC])) == ((void *)0)) {
			((((&(&((curr)->u))->uv))->marked) |= ((1 << (3))));
			p = &curr->gch.next;
			} else {
			deadmem += (sizeof(union Udata) + ((&(&((curr)->u))->uv))->len);
			((((&(&((curr)->u))->uv))->marked) |= ((1 << (3))));
			*p = curr->gch.next;
			if (g->tmudata == ((void *)0))
			g->tmudata = curr->gch.next = curr;
			else {
			curr->gch.next = g->tmudata->gch.next;
			g->tmudata->gch.next = curr;
			g->tmudata = curr;
			}
			}
			}
			return deadmem;
}
static int traversetable(global_State *g, Table *h)
{
			int i;
			int weakkey = 0;
			int weakvalue = 0;
			const TValue *mode;
			if (h->metatable)
			{ if (((((((GCObject *)((h->metatable)))))->gch.marked) & ((((1 << (0)) | (1 << (1))))))) reallymarkobject(g, (((GCObject *)((h->metatable))))); };
			mode = ((h->metatable) == ((void *)0) ? ((void *)0) : ((h->metatable)->flags & (1u << (TM_MODE))) ? ((void *)0) : luaT_gettm(h->metatable, TM_MODE, (g)->tmname[TM_MODE]));
			if (mode && (((mode)->tt) == 4)) {
			weakkey = (strchr(((const char *)(((&(mode)->value.gc->ts)) + 1)), 'k') != ((void *)0));
			weakvalue = (strchr(((const char *)(((&(mode)->value.gc->ts)) + 1)), 'v') != ((void *)0));
			if (weakkey || weakvalue) {
			h->marked &= ~((1 << (3)) | (1 << (4)));
			h->marked |=
			((lu_byte)(((weakkey << 3) | (weakvalue << 4))));
			h->gclist = g->weak;
			g->weak = (((GCObject *)((h))));
			}
			}
			if (weakkey && weakvalue)
			return 1;
			if (!weakvalue) {
			i = h->sizearray;
			while (i--)
			{; if ((((&h->array[i])->tt) >= 4) && (((((&h->array[i])->value.gc))->gch.marked) & ((((1 << (0)) | (1 << (1))))))) reallymarkobject(g, ((&h->array[i])->value.gc)); };
			}
			i = (((size_t)1 << ((h)->lsizenode)));
			while (i--) {
			Node *n = (&(h)->node[i]);
			if (((((&(n)->i_val))->tt) == 0))
			removeentry(n);
			else {
			if (!weakkey)
			{; if (((((&(n)->i_key.nk))->tt) >= 4) && ((((((&(n)->i_key.nk))->value.gc))->gch.marked) & ((((1 << (0)) | (1 << (1))))))) reallymarkobject(g, (((&(n)->i_key.nk))->value.gc)); };
			if (!weakvalue)
			{; if (((((&(n)->i_val))->tt) >= 4) && ((((((&(n)->i_val))->value.gc))->gch.marked) & ((((1 << (0)) | (1 << (1))))))) reallymarkobject(g, (((&(n)->i_val))->value.gc)); };
			}
			}
			return weakkey || weakvalue;
}
static void traverseproto(global_State *g, Proto *f)
{
			int i;
			if (f->source)
			(((f->source)->tsv.marked) &= ((lu_byte)(~((((1 << (0)) | (1 << (1))))))));
			for (i = 0; i < f->sizek; i++)
			{; if ((((&f->k[i])->tt) >= 4) && (((((&f->k[i])->value.gc))->gch.marked) & ((((1 << (0)) | (1 << (1))))))) reallymarkobject(g, ((&f->k[i])->value.gc)); };
			for (i = 0; i < f->sizeupvalues; i++) {
			if (f->upvalues[i])
			(((f->upvalues[i])->tsv.marked) &= ((lu_byte)(~((((1 << (0)) | (1 << (1))))))));
			}
			for (i = 0; i < f->sizep; i++) {
			if (f->p[i])
			{ if (((((((GCObject *)((f->p[i])))))->gch.marked) & ((((1 << (0)) | (1 << (1))))))) reallymarkobject(g, (((GCObject *)((f->p[i]))))); };
			}
			for (i = 0; i < f->sizelocvars; i++) {
			if (f->locvars[i].varname)
			(((f->locvars[i].varname)->tsv.marked) &= ((lu_byte)(~((((1 << (0)) | (1 << (1))))))));
			}
}
static void traverseclosure(global_State *g, Closure *cl)
{
			{ if (((((((GCObject *)((cl->c.env)))))->gch.marked) & ((((1 << (0)) | (1 << (1))))))) reallymarkobject(g, (((GCObject *)((cl->c.env))))); };
			if (cl->c.isC) {
			int i;
			for (i = 0; i < cl->c.nupvalues; i++)
			{; if ((((&cl->c.upvalue[i])->tt) >= 4) && (((((&cl->c.upvalue[i])->value.gc))->gch.marked) & ((((1 << (0)) | (1 << (1))))))) reallymarkobject(g, ((&cl->c.upvalue[i])->value.gc)); };
			} else {
			int i;
			{ if (((((((GCObject *)((cl->l.p)))))->gch.marked) & ((((1 << (0)) | (1 << (1))))))) reallymarkobject(g, (((GCObject *)((cl->l.p))))); };
			for (i = 0; i < cl->l.nupvalues; i++)
			{ if (((((((GCObject *)((cl->l.upvals[i])))))->gch.marked) & ((((1 << (0)) | (1 << (1))))))) reallymarkobject(g, (((GCObject *)((cl->l.upvals[i]))))); };
			}
}
static void checkstacksizes(lua_State *L, StkId max)
{
			int ci_used = ((int)((L->ci - L->base_ci)));
			int s_used = ((int)((max - L->stack)));
			if (L->size_ci > 20000)
			return;
			if (4 * ci_used < L->size_ci && 2 * 8 < L->size_ci)
			luaD_reallocCI(L, L->size_ci / 2);
			((void)0);
			if (4 * s_used < L->stacksize && 2 * ((2 * 20) + 5) < L->stacksize)
			luaD_reallocstack(L, L->stacksize / 2);
			((void)0);
}
static void traversestack(global_State *g, lua_State *l)
{
			StkId o, lim;
			CallInfo *ci;
			{; if (((((&l->l_gt))->tt) >= 4) && ((((((&l->l_gt))->value.gc))->gch.marked) & ((((1 << (0)) | (1 << (1))))))) reallymarkobject(g, (((&l->l_gt))->value.gc)); };
			lim = l->top;
			for (ci = l->base_ci; ci <= l->ci; ci++) {
			if (lim < ci->top)
			lim = ci->top;
			}
			for (o = l->stack; o < l->top; o++)
			{; if ((((o)->tt) >= 4) && (((((o)->value.gc))->gch.marked) & ((((1 << (0)) | (1 << (1))))))) reallymarkobject(g, ((o)->value.gc)); };
			for (; o <= lim; o++)
			((o)->tt = 0);
			checkstacksizes(l, lim);
}
static l_mem propagatemark(global_State *g)
{
			GCObject *o = g->gray;
			(((o)->gch.marked) |= ((1 << (2))));
			switch (o->gch.tt) {
			case 5: {
			Table *h = (&((o)->h));
			g->gray = h->gclist;
			if (traversetable(g, h))
			(((o)->gch.marked) &= ((lu_byte)(~((1 << (2))))));
			return sizeof(Table) + sizeof(TValue) * h->sizearray +
			sizeof(Node) * (((size_t)1 << ((h)->lsizenode)));
			}
			case 6: {
			Closure *cl = (&((o)->cl));
			g->gray = cl->c.gclist;
			traverseclosure(g, cl);
			return (cl->c.isC) ? (((int)(sizeof(CClosure))) + ((int)(sizeof(TValue) * ((cl->c.nupvalues)-1))))
			: (((int)(sizeof(LClosure))) + ((int)(sizeof(TValue *) * ((cl->l.nupvalues)-1))));
			}
			case 8: {
			lua_State *th = (&((o)->th));
			g->gray = th->gclist;
			th->gclist = g->grayagain;
			g->grayagain = o;
			(((o)->gch.marked) &= ((lu_byte)(~((1 << (2))))));
			traversestack(g, th);
			return sizeof(lua_State) + sizeof(TValue) * th->stacksize +
			sizeof(CallInfo) * th->size_ci;
			}
			case (8 + 1): {
			Proto *p = (&((o)->p));
			g->gray = p->gclist;
			traverseproto(g, p);
			return sizeof(Proto) + sizeof(Instruction) * p->sizecode +
			sizeof(Proto *) * p->sizep + sizeof(TValue) * p->sizek +
			sizeof(int) * p->sizelineinfo +
			sizeof(LocVar) * p->sizelocvars +
			sizeof(TString *) * p->sizeupvalues;
			}
			default:
			return 0;
			}
}
static size_t propagateall(global_State *g)
{
			size_t m = 0;
			while (g->gray)
			m += propagatemark(g);
			return m;
}
static int iscleared(const TValue *o, int iskey)
{
			if (!(((o)->tt) >= 4))
			return 0;
			if ((((o)->tt) == 4)) {
			((((&(o)->value.gc->ts))->tsv.marked) &= ((lu_byte)(~((((1 << (0)) | (1 << (1))))))));
			return 0;
			}
			return (((((o)->value.gc))->gch.marked) & ((((1 << (0)) | (1 << (1)))))) ||
			((((o)->tt) == 7) && (!iskey && ((((&(&(o)->value.gc->u)->uv))->marked) & ((1 << (3))))));
}
static void cleartable(GCObject *l)
{
			while (l) {
			Table *h = (&((l)->h));
			int i = h->sizearray;
			if (((h->marked) & ((1 << (4))))) {
			while (i--) {
			TValue *o = &h->array[i];
			if (iscleared(o, 0))
			((o)->tt = 0);
			}
			}
			i = (((size_t)1 << ((h)->lsizenode)));
			while (i--) {
			Node *n = (&(h)->node[i]);
			if (!((((&(n)->i_val))->tt) == 0) && (iscleared((&(n)->i_key.tvk), 1) ||
			iscleared((&(n)->i_val), 0))) {
			(((&(n)->i_val))->tt = 0);
			removeentry(n);
			}
			}
			l = h->gclist;
			}
}
static void freeobj(lua_State *L, GCObject *o)
{
			switch (o->gch.tt) {
			case (8 + 1):
			luaF_freeproto(L, (&((o)->p)));
			break;
			case 6:
			luaF_freeclosure(L, (&((o)->cl)));
			break;
			case (8 + 2):
			luaF_freeupval(L, (&((o)->uv)));
			break;
			case 5:
			luaH_free(L, (&((o)->h)));
			break;
			case 8: {
			luaE_freethread(L, (&((o)->th)));
			break;
			}
			case 4: {
			(L->l_G)->strt.nuse--;
			luaM_realloc_(L, (o), ((sizeof(union TString) + (((&(&((o)->ts))->tsv))->len + 1) * sizeof(char))), 0);
			break;
			}
			case 7: {
			luaM_realloc_(L, (o), ((sizeof(union Udata) + ((&(&((o)->u))->uv))->len)), 0);
			break;
			}
			default:;
			}
}
static GCObject **sweeplist(lua_State *L, GCObject **p, lu_mem count)
{
			GCObject *curr;
			global_State *g = (L->l_G);
			int deadmask = (g->currentwhite ^ ((1 << (0)) | (1 << (1))));
			while ((curr = *p) != ((void *)0) && count-- > 0) {
			if (curr->gch.tt == 8)
			sweeplist(L, &(&((curr)->th))->openupval, ((lu_mem)(~(lu_mem)0) - 2));
			if ((curr->gch.marked ^ ((1 << (0)) | (1 << (1)))) & deadmask) {
			((curr)->gch.marked = ((lu_byte)((((curr)->gch.marked & ((lu_byte)((~((1 << (2)) | ((1 << (0)) | (1 << (1)))))))) | ((lu_byte)((g)->currentwhite &((1 << (0)) | (1 << (1)))))))));
			p = &curr->gch.next;
			} else {
			*p = curr->gch.next;
			if (curr == g->rootgc)
			g->rootgc = curr->gch.next;
			freeobj(L, curr);
			}
			}
			return p;
}
static void checkSizes(lua_State *L)
{
			global_State *g = (L->l_G);
			if (g->strt.nuse < ((lu_int32)(g->strt.size / 4)) &&
			g->strt.size > 32 * 2)
			luaS_resize(L, g->strt.size / 2);
			if (((&g->buff)->buffsize) > 32 * 2) {
			size_t newsize = ((&g->buff)->buffsize) / 2;
			((((&g->buff)->buffer) = ((char *)(((((size_t)((newsize) + 1)) <= ((size_t)(~(size_t)0) - 2) / (sizeof(char))) ? luaM_realloc_(L, ((&g->buff)->buffer), ((&g->buff)->buffsize) * (sizeof(char)), (newsize) * (sizeof(char))) : luaM_toobig(L))))), (&g->buff)->buffsize = newsize);
			}
}
static void GCTM(lua_State *L)
{
			global_State *g = (L->l_G);
			GCObject *o = g->tmudata->gch.next;
			Udata *udata = (&((o)->u));
			const TValue *tm;
			if (o == g->tmudata)
			g->tmudata = ((void *)0);
			else
			g->tmudata->gch.next = udata->uv.next;
			udata->uv.next = g->mainthread->next;
			g->mainthread->next = o;
			((o)->gch.marked = ((lu_byte)((((o)->gch.marked & ((lu_byte)((~((1 << (2)) | ((1 << (0)) | (1 << (1)))))))) | ((lu_byte)((g)->currentwhite &((1 << (0)) | (1 << (1)))))))));
			tm = ((udata->uv.metatable) == ((void *)0) ? ((void *)0) : ((udata->uv.metatable)->flags & (1u << (TM_GC))) ? ((void *)0) : luaT_gettm(udata->uv.metatable, TM_GC, ((L->l_G))->tmname[TM_GC]));
			if (tm != ((void *)0)) {
			lu_byte oldah = L->allowhook;
			lu_mem oldt = g->GCthreshold;
			L->allowhook = 0;
			g->GCthreshold = 2 * g->totalbytes;
			{ const TValue *o2 = (tm); TValue *o1 = (L->top); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
			{ TValue *i_o = (L->top + 1); i_o->value.gc = ((GCObject *)((udata))); i_o->tt = 7;; };
			L->top += 2;
			luaD_call(L, L->top - 2, 0);
			L->allowhook = oldah;
			g->GCthreshold = oldt;
			}
}
static void luaC_callGCTM(lua_State *L)
{
			while ((L->l_G)->tmudata)
			GCTM(L);
}
static void luaC_freeall(lua_State *L)
{
			global_State *g = (L->l_G);
			int i;
			g->currentwhite = ((1 << (0)) | (1 << (1))) | (1 << (6));
			sweeplist(L, &g->rootgc, ((lu_mem)(~(lu_mem)0) - 2));
			for (i = 0; i < g->strt.size; i++)
			sweeplist(L, &g->strt.hash[i], ((lu_mem)(~(lu_mem)0) - 2));
}
static void markmt(global_State *g)
{
			int i;
			for (i = 0; i < (8 + 1); i++)
			if (g->mt[i])
			{ if (((((((GCObject *)((g->mt[i])))))->gch.marked) & ((((1 << (0)) | (1 << (1))))))) reallymarkobject(g, (((GCObject *)((g->mt[i]))))); };
}
static void markroot(lua_State *L)
{
			global_State *g = (L->l_G);
			g->gray = ((void *)0);
			g->grayagain = ((void *)0);
			g->weak = ((void *)0);
			{ if (((((((GCObject *)((g->mainthread)))))->gch.marked) & ((((1 << (0)) | (1 << (1))))))) reallymarkobject(g, (((GCObject *)((g->mainthread))))); };
			{; if (((((&g->mainthread->l_gt))->tt) >= 4) && ((((((&g->mainthread->l_gt))->value.gc))->gch.marked) & ((((1 << (0)) | (1 << (1))))))) reallymarkobject(g, (((&g->mainthread->l_gt))->value.gc)); };
			{; if (((((&(L->l_G)->l_registry))->tt) >= 4) && ((((((&(L->l_G)->l_registry))->value.gc))->gch.marked) & ((((1 << (0)) | (1 << (1))))))) reallymarkobject(g, (((&(L->l_G)->l_registry))->value.gc)); };
			markmt(g);
			g->gcstate = 1;
}
static void remarkupvals(global_State *g)
{
			UpVal *uv;
			for (uv = g->uvhead.u.l.next; uv != &g->uvhead; uv = uv->u.l.next) {
			if ((!((((((GCObject *)((uv)))))->gch.marked) & ((1 << (2)))) && !((((((GCObject *)((uv)))))->gch.marked) & ((((1 << (0)) | (1 << (1))))))))
			{; if ((((uv->v)->tt) >= 4) && (((((uv->v)->value.gc))->gch.marked) & ((((1 << (0)) | (1 << (1))))))) reallymarkobject(g, ((uv->v)->value.gc)); };
			}
}
static void atomic(lua_State *L)
{
			global_State *g = (L->l_G);
			size_t udsize;
			remarkupvals(g);
			propagateall(g);
			g->gray = g->weak;
			g->weak = ((void *)0);
			{ if (((((((GCObject *)((L)))))->gch.marked) & ((((1 << (0)) | (1 << (1))))))) reallymarkobject(g, (((GCObject *)((L))))); };
			markmt(g);
			propagateall(g);
			g->gray = g->grayagain;
			g->grayagain = ((void *)0);
			propagateall(g);
			udsize = luaC_separateudata(L, 0);
			marktmu(g);
			udsize += propagateall(g);
			cleartable(g->weak);
			g->currentwhite = ((lu_byte)(((g->currentwhite ^ ((1 << (0)) | (1 << (1)))))));
			g->sweepstrgc = 0;
			g->sweepgc = &g->rootgc;
			g->gcstate = 2;
			g->estimate = g->totalbytes - udsize;
}
static l_mem singlestep(lua_State *L)
{
			global_State *g = (L->l_G);
			switch (g->gcstate) {
			case 0: {
			markroot(L);
			return 0;
			}
			case 1: {
			if (g->gray)
			return propagatemark(g);
			else {
			atomic(L);
			return 0;
			}
			}
			case 2: {
			lu_mem old = g->totalbytes;
			sweeplist(L, &g->strt.hash[g->sweepstrgc++], ((lu_mem)(~(lu_mem)0) - 2));
			if (g->sweepstrgc >= g->strt.size)
			g->gcstate = 3;
			g->estimate -= old - g->totalbytes;
			return 10;
			}
			case 3: {
			lu_mem old = g->totalbytes;
			g->sweepgc = sweeplist(L, g->sweepgc, 40);
			if (*g->sweepgc == ((void *)0)) {
			checkSizes(L);
			g->gcstate = 4;
			}
			g->estimate -= old - g->totalbytes;
			return 40 * 10;
			}
			case 4: {
			if (g->tmudata) {
			GCTM(L);
			if (g->estimate > 100)
			g->estimate -= 100;
			return 100;
			} else {
			g->gcstate = 0;
			g->gcdept = 0;
			return 0;
			}
			}
			default:
			return 0;
			}
}
void luaC_step(lua_State *L)
{
			global_State *g = (L->l_G);
			l_mem lim = (1024u / 100) * g->gcstepmul;
			if (lim == 0)
			lim = (((lu_mem)(~(lu_mem)0) - 2) - 1) / 2;
			g->gcdept += g->totalbytes - g->GCthreshold;
			do {
			lim -= singlestep(L);
			if (g->gcstate == 0)
			break;
			} while (lim > 0);
			if (g->gcstate != 0) {
			if (g->gcdept < 1024u)
			g->GCthreshold = g->totalbytes + 1024u;
			else {
			g->gcdept -= 1024u;
			g->GCthreshold = g->totalbytes;
			}
			} else {
			(g->GCthreshold = (g->estimate / 100) * g->gcpause);
			}
}
static void luaC_barrierf(lua_State *L, GCObject *o, GCObject *v)
{
			global_State *g = (L->l_G);
			if (g->gcstate == 1)
			reallymarkobject(g, v);
			else
			((o)->gch.marked = ((lu_byte)((((o)->gch.marked & ((lu_byte)((~((1 << (2)) | ((1 << (0)) | (1 << (1)))))))) | ((lu_byte)((g)->currentwhite &((1 << (0)) | (1 << (1)))))))));
}
static void luaC_barrierback(lua_State *L, Table *t)
{
			global_State *g = (L->l_G);
			GCObject *o = (((GCObject *)((t))));
			(((o)->gch.marked) &= ((lu_byte)(~((1 << (2))))));
			t->gclist = g->grayagain;
			g->grayagain = o;
}
static void luaC_link(lua_State *L, GCObject *o, lu_byte tt)
{
			global_State *g = (L->l_G);
			o->gch.next = g->rootgc;
			g->rootgc = o;
			o->gch.marked = ((lu_byte)((g)->currentwhite &((1 << (0)) | (1 << (1)))));
			o->gch.tt = tt;
}
static void luaC_linkupval(lua_State *L, UpVal *uv)
{
			global_State *g = (L->l_G);
			GCObject *o = (((GCObject *)((uv))));
			o->gch.next = g->rootgc;
			g->rootgc = o;
			if ((!(((o)->gch.marked) & ((1 << (2)))) && !(((o)->gch.marked) & ((((1 << (0)) | (1 << (1)))))))) {
			if (g->gcstate == 1) {
			(((o)->gch.marked) |= ((1 << (2))));
			{ if (((((uv->v)->tt) >= 4) && (((((uv->v)->value.gc))->gch.marked) & ((((1 << (0)) | (1 << (1))))))) && ((((((GCObject *)((uv)))))->gch.marked) & ((1 << (2))))) luaC_barrierf(L, (((GCObject *)((uv)))), ((uv->v)->value.gc)); };
			} else {
			((o)->gch.marked = ((lu_byte)((((o)->gch.marked & ((lu_byte)((~((1 << (2)) | ((1 << (0)) | (1 << (1)))))))) | ((lu_byte)((g)->currentwhite &((1 << (0)) | (1 << (1)))))))));
			}
			}
}
typedef union {
			lua_Number r;
			TString *ts;
} SemInfo;
typedef struct Token {
			int token;
			SemInfo seminfo;
} Token;
typedef struct LexState {
			int current;
			int linenumber;
			int lastline;
			Token t;
			Token lookahead;
			struct FuncState *fs;
			struct lua_State *L;
			ZIO *z;
			Mbuffer *buff;
			TString *source;
			char decpoint;
} LexState;
static void luaX_init(lua_State *L);
static void luaX_lexerror(LexState *ls, const char *msg, int token);
typedef struct LG {
			lua_State l;
			global_State g;
} LG;
static void stack_init(lua_State *L1, lua_State *L)
{
			L1->base_ci = ((CallInfo *)(((((size_t)((8) + 1)) <= ((size_t)(~(size_t)0) - 2) / (sizeof(CallInfo))) ? luaM_realloc_(L, (((void *)0)), (0) * (sizeof(CallInfo)), (8) * (sizeof(CallInfo))) : luaM_toobig(L))));
			L1->ci = L1->base_ci;
			L1->size_ci = 8;
			L1->end_ci = L1->base_ci + L1->size_ci - 1;
			L1->stack = ((TValue *)(((((size_t)(((2 * 20) + 5) + 1)) <= ((size_t)(~(size_t)0) - 2) / (sizeof(TValue))) ? luaM_realloc_(L, (((void *)0)), (0) * (sizeof(TValue)), ((2 * 20) + 5) * (sizeof(TValue))) : luaM_toobig(L))));
			L1->stacksize = (2 * 20) + 5;
			L1->top = L1->stack;
			L1->stack_last = L1->stack + (L1->stacksize - 5) - 1;
			L1->ci->func = L1->top;
			((L1->top++)->tt = 0);
			L1->base = L1->ci->base = L1->top;
			L1->ci->top = L1->top + 20;
}
static void freestack(lua_State *L, lua_State *L1)
{
			((((size_t)((0) + 1)) <= ((size_t)(~(size_t)0) - 2) / (sizeof(CallInfo))) ? luaM_realloc_(L, ((L1->base_ci)), (L1->size_ci) * (sizeof(CallInfo)), (0) * (sizeof(CallInfo))) : luaM_toobig(L));
			((((size_t)((0) + 1)) <= ((size_t)(~(size_t)0) - 2) / (sizeof(TValue))) ? luaM_realloc_(L, ((L1->stack)), (L1->stacksize) * (sizeof(TValue)), (0) * (sizeof(TValue))) : luaM_toobig(L));
}
static void f_luaopen(lua_State *L, void *ud)
{
			global_State *g = (L->l_G);
			((void)(ud));
			stack_init(L, L);
			{ TValue *i_o = ((&L->l_gt)); i_o->value.gc = ((GCObject *)((luaH_new(L, 0, 2)))); i_o->tt = 5;; };
			{ TValue *i_o = ((&(L->l_G)->l_registry)); i_o->value.gc = ((GCObject *)((luaH_new(L, 0, 2)))); i_o->tt = 5;; };
			luaS_resize(L, 32);
			luaT_init(L);
			luaX_init(L);
			((((luaS_newlstr(L, """not enough memory", (sizeof("not enough memory") / sizeof(char)) - 1)))->tsv.marked) |= ((1 << (5))));
			g->GCthreshold = 4 * g->totalbytes;
}
static void preinit_state(lua_State *L, global_State *g)
{
			(L->l_G) = g;
			L->stack = ((void *)0);
			L->stacksize = 0;
			L->errorJmp = ((void *)0);
			L->hook = ((void *)0);
			L->hookmask = 0;
			L->basehookcount = 0;
			L->allowhook = 1;
			(L->hookcount = L->basehookcount);
			L->openupval = ((void *)0);
			L->size_ci = 0;
			L->nCcalls = L->baseCcalls = 0;
			L->status = 0;
			L->base_ci = L->ci = ((void *)0);
			L->savedpc = ((void *)0);
			L->errfunc = 0;
			(((&L->l_gt))->tt = 0);
}
static void close_state(lua_State *L)
{
			global_State *g = (L->l_G);
			luaF_close(L, L->stack);
			luaC_freeall(L);
			((((size_t)((0) + 1)) <= ((size_t)(~(size_t)0) - 2) / (sizeof(TString *))) ? luaM_realloc_(L, (((L->l_G)->strt.hash)), ((L->l_G)->strt.size) * (sizeof(TString *)), (0) * (sizeof(TString *))) : luaM_toobig(L));
			((((&g->buff)->buffer) = ((char *)(((((size_t)((0) + 1)) <= ((size_t)(~(size_t)0) - 2) / (sizeof(char))) ? luaM_realloc_(L, ((&g->buff)->buffer), ((&g->buff)->buffsize) * (sizeof(char)), (0) * (sizeof(char))) : luaM_toobig(L))))), (&g->buff)->buffsize = 0);
			freestack(L, L);
			g->frealloc(g->ud, (((lu_byte *)((L))) - 0), (sizeof(LG) + 0), 0);
}
static void luaE_freethread(lua_State *L, lua_State *L1)
{
			luaF_close(L1, L1->stack);
			freestack(L, L1);
			luaM_realloc_(L, ((((lu_byte *)((L1))) - 0)), ((sizeof(lua_State) + 0)), 0);
}
static lua_State *lua_newstate(lua_Alloc f, void *ud)
{
			int i;
			lua_State *L;
			global_State *g;
			void *l = f(ud, ((void *)0), 0, (sizeof(LG) + 0));
			if (l == ((void *)0))
			return ((void *)0);
			L = (((lua_State *)(((lu_byte *)(l)) + 0)));
			g = &((LG *)L)->g;
			L->next = ((void *)0);
			L->tt = 8;
			g->currentwhite = ((1 << (0)) | (1 << (5)));
			L->marked = ((lu_byte)((g)->currentwhite &((1 << (0)) | (1 << (1)))));
			((L->marked) |= ((((1 << (5)) | (1 << (6))))));
			preinit_state(L, g);
			g->frealloc = f;
			g->ud = ud;
			g->mainthread = L;
			g->uvhead.u.l.prev = &g->uvhead;
			g->uvhead.u.l.next = &g->uvhead;
			g->GCthreshold = 0;
			g->strt.size = 0;
			g->strt.nuse = 0;
			g->strt.hash = ((void *)0);
			(((&(L->l_G)->l_registry))->tt = 0);
			((&g->buff)->buffer = ((void *)0), (&g->buff)->buffsize = 0);
			g->panic = ((void *)0);
			g->gcstate = 0;
			g->rootgc = (((GCObject *)((L))));
			g->sweepstrgc = 0;
			g->sweepgc = &g->rootgc;
			g->gray = ((void *)0);
			g->grayagain = ((void *)0);
			g->weak = ((void *)0);
			g->tmudata = ((void *)0);
			g->totalbytes = sizeof(LG);
			g->gcpause = 200;
			g->gcstepmul = 200;
			g->gcdept = 0;
			for (i = 0; i < (8 + 1); i++)
			g->mt[i] = ((void *)0);
			if (luaD_rawrunprotected(L, f_luaopen, ((void *)0)) != 0) {
			close_state(L);
			L = ((void *)0);
			} else {
			}
			return L;
}
static void callallgcTM(lua_State *L, void *ud)
{
			((void)(ud));
			luaC_callGCTM(L);
}
static void lua_close(lua_State *L)
{
			L = (L->l_G)->mainthread;
			luaF_close(L, L->stack);
			luaC_separateudata(L, 1);
			L->errfunc = 0;
			do {
			L->ci = L->base_ci;
			L->base = L->top = L->ci->base;
			L->nCcalls = L->baseCcalls = 0;
			} while (luaD_rawrunprotected(L, callallgcTM, ((void *)0)) != 0);
			close_state(L);
}
static int luaK_codeABx(FuncState *fs, OpCode o, int A, unsigned int Bx);
static int luaK_codeABC(FuncState *fs, OpCode o, int A, int B, int C);
static void luaK_setreturns(FuncState *fs, expdesc *e, int nresults);
static void luaK_patchtohere(FuncState *fs, int list);
static void luaK_concat(FuncState *fs, int *l1, int l2);
static int currentpc(lua_State *L, CallInfo *ci)
{
			if (!(((((ci)->func)->tt) == 6) && (!((&((ci)->func)->value.gc->cl))->c.isC)))
			return -1;
			if (ci == L->ci)
			ci->savedpc = L->savedpc;
			return (((int)((ci->savedpc) - (((&((ci)->func)->value.gc->cl))->l.p)->code)) - 1);
}
static int currentline(lua_State *L, CallInfo *ci)
{
			int pc = currentpc(L, ci);
			if (pc < 0)
			return -1;
			else
			return (((((&((ci)->func)->value.gc->cl))->l.p)->lineinfo) ? (((&((ci)->func)->value.gc->cl))->l.p)->lineinfo[pc] : 0);
}
static int lua_getstack(lua_State *L, int level, lua_Debug *ar)
{
			int status;
			CallInfo *ci;
			for (ci = L->ci; level > 0 && ci > L->base_ci; ci--) {
			level--;
			if ((!((&((ci)->func)->value.gc->cl))->c.isC))
			level -= ci->tailcalls;
			}
			if (level == 0 && ci > L->base_ci) {
			status = 1;
			ar->i_ci = ((int)((ci - L->base_ci)));
			} else if (level < 0) {
			status = 1;
			ar->i_ci = 0;
			} else
			status = 0;
			return status;
}
static Proto *getluaproto(CallInfo *ci)
{
			return ((((((ci)->func)->tt) == 6) && (!((&((ci)->func)->value.gc->cl))->c.isC)) ? ((&((ci)->func)->value.gc->cl))->l.p : ((void *)0));
}
static void funcinfo(lua_Debug *ar, Closure *cl)
{
			if (cl->c.isC) {
			ar->source = "=[C]";
			ar->linedefined = -1;
			ar->lastlinedefined = -1;
			ar->what = "C";
			} else {
			ar->source = ((const char *)((cl->l.p->source) + 1));
			ar->linedefined = cl->l.p->linedefined;
			ar->lastlinedefined = cl->l.p->lastlinedefined;
			ar->what = (ar->linedefined == 0) ? "main" : "Lua";
			}
			luaO_chunkid(ar->short_src, ar->source, 60);
}
static void info_tailcall(lua_Debug *ar)
{
			ar->name = ar->namewhat = "";
			ar->what = "tail";
			ar->lastlinedefined = ar->linedefined = ar->currentline = -1;
			ar->source = "=(tail call)";
			luaO_chunkid(ar->short_src, ar->source, 60);
			ar->nups = 0;
}
static void collectvalidlines(lua_State *L, Closure *f)
{
			if (f == ((void *)0) || f->c.isC) {
			((L->top)->tt = 0);
			} else {
			Table *t = luaH_new(L, 0, 0);
			int *lineinfo = f->l.p->lineinfo;
			int i;
			for (i = 0; i < f->l.p->sizelineinfo; i++)
			{ TValue *i_o = (luaH_setnum(L, t, lineinfo[i])); i_o->value.b = (1); i_o->tt = 1; };
			{ TValue *i_o = (L->top); i_o->value.gc = ((GCObject *)((t))); i_o->tt = 5;; };
			}
			{ if ((char *)L->stack_last - (char *)L->top <= (1) * (int)sizeof(TValue)) luaD_growstack(L, 1); else ((void)0);; L->top++; };
}
static int auxgetinfo(lua_State *L, const char *what, lua_Debug *ar, Closure *f,
			CallInfo *ci)
{
			int status = 1;
			if (f == ((void *)0)) {
			info_tailcall(ar);
			return status;
			}
			for (; *what; what++) {
			switch (*what) {
			case 'S': {
			funcinfo(ar, f);
			break;
			}
			case 'l': {
			ar->currentline = (ci) ? currentline(L, ci) : -1;
			break;
			}
			case 'u': {
			ar->nups = f->c.nupvalues;
			break;
			}
			case 'n': {
			ar->namewhat = (ci) ? ((void *)0) : ((void *)0);
			if (ar->namewhat == ((void *)0)) {
			ar->namewhat = "";
			ar->name = ((void *)0);
			}
			break;
			}
			case 'L':
			case 'f':
			break;
			default:
			status = 0;
			}
			}
			return status;
}
static int lua_getinfo(lua_State *L, const char *what, lua_Debug *ar)
{
			int status;
			Closure *f = ((void *)0);
			CallInfo *ci = ((void *)0);
			if (*what == '>') {
			StkId func = L->top - 1;
			{ (void)L; };
			what++;
			f = (&(func)->value.gc->cl);
			L->top--;
			} else if (ar->i_ci != 0) {
			ci = L->base_ci + ar->i_ci;
			f = (&(ci->func)->value.gc->cl);
			}
			status = auxgetinfo(L, what, ar, f, ci);
			if (strchr(what, 'f')) {
			if (f == ((void *)0))
			((L->top)->tt = 0);
			else
			{ TValue *i_o = (L->top); i_o->value.gc = ((GCObject *)((f))); i_o->tt = 6;; };
			{ if ((char *)L->stack_last - (char *)L->top <= (1) * (int)sizeof(TValue)) luaD_growstack(L, 1); else ((void)0);; L->top++; };
			}
			if (strchr(what, 'L'))
			collectvalidlines(L, f);
			return status;
}
static int isinstack(CallInfo *ci, const TValue *o)
{
			StkId p;
			for (p = ci->base; p < ci->top; p++)
			if (o == p)
			return 1;
			return 0;
}
static void luaG_typeerror(lua_State *L, const TValue *o, const char *op)
{
			const char *name = ((void *)0);
			const char *t = luaT_typenames[((o)->tt)];
			const char *kind = (isinstack(L->ci, o)) ? ((void *)0) : ((void *)0);
			if (kind)
			luaG_runerror(L,
			"attempt to %s %s " "'" "%s" "'" " (a %s value)",
			op, kind, name, t);
			else
			luaG_runerror(L, "attempt to %s a %s value", op, t);
}
static void luaG_concaterror(lua_State *L, StkId p1, StkId p2)
{
			if ((((p1)->tt) == 4) || (((p1)->tt) == 3))
			p1 = p2;
			luaG_typeerror(L, p1, "concatenate");
}
static void luaG_aritherror(lua_State *L, const TValue *p1, const TValue *p2)
{
			TValue temp;
			if (luaV_tonumber(p1, &temp) == ((void *)0))
			p2 = p1;
			luaG_typeerror(L, p2, "perform arithmetic on");
}
static int luaG_ordererror(lua_State *L, const TValue *p1, const TValue *p2)
{
			const char *t1 = luaT_typenames[((p1)->tt)];
			const char *t2 = luaT_typenames[((p2)->tt)];
			if (t1[2] == t2[2])
			luaG_runerror(L, "attempt to compare two %s values", t1);
			else
			luaG_runerror(L, "attempt to compare %s with %s", t1, t2);
			return 0;
}
void addinfo(lua_State *L, const char *msg)
{
			CallInfo *ci = L->ci;
			if ((((((ci)->func)->tt) == 6) && (!((&((ci)->func)->value.gc->cl))->c.isC))) {
			char buff[60];
			int line = currentline(L, ci);
			luaO_chunkid(buff, ((const char *)((getluaproto(ci)->source) + 1)), 60);
			luaO_pushfstring(L, "%s:%d: %s", buff, line, msg);
			}
}
void luaG_errormsg(lua_State *L)
{
			if (L->errfunc != 0) {
			StkId errfunc = ((TValue *)((char *)L->stack + (L->errfunc)));
			if (!(((errfunc)->tt) == 6))
			luaD_throw(L, 5);
			{ const TValue *o2 = (L->top - 1); TValue *o1 = (L->top); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
			{ const TValue *o2 = (errfunc); TValue *o1 = (L->top - 1); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
			{ if ((char *)L->stack_last - (char *)L->top <= (1) * (int)sizeof(TValue)) luaD_growstack(L, 1); else ((void)0);; L->top++; };
			luaD_call(L, L->top - 2, 1);
			}
			luaD_throw(L, 2);
}
static int luaZ_fill(ZIO *z)
{
			size_t size;
			lua_State *L = z->L;
			const char *buff;
			buff = z->reader(L, z->data, &size);
			if (buff == ((void *)0) || size == 0)
			return (-1);
			z->n = size - 1;
			z->p = buff;
			return ((int)(((unsigned char)((*(z->p++))))));
}
static void luaZ_init(lua_State *L, ZIO *z, lua_Reader reader, void *data)
{
			z->L = L;
			z->reader = reader;
			z->data = data;
			z->n = 0;
			z->p = ((void *)0);
}
static char *luaZ_openspace(lua_State *L, Mbuffer *buff, size_t n)
{
			if (n > buff->buffsize) {
			if (n < 32)
			n = 32;
			((((buff)->buffer) = ((char *)(((((size_t)((n) + 1)) <= ((size_t)(~(size_t)0) - 2) / (sizeof(char))) ? luaM_realloc_(L, ((buff)->buffer), ((buff)->buffsize) * (sizeof(char)), (n) * (sizeof(char))) : luaM_toobig(L))))), (buff)->buffsize = n);
			}
			return buff->buffer;
}
static lu_byte luaP_opmodes[(((int)(OP_VARARG)) + 1)];
static const char *luaX_tokens[32];
static void save(LexState *ls, int c)
{
			Mbuffer *b = ls->buff;
			if (b->n + 1 > b->buffsize) {
			size_t newsize;
			if (b->buffsize >= ((size_t)(~(size_t)0) - 2) / 2)
			luaX_lexerror(ls, "lexical element too long", 0);
			newsize = b->buffsize * 2;
			((((b)->buffer) = ((char *)(((((size_t)((newsize) + 1)) <= ((size_t)(~(size_t)0) - 2) / (sizeof(char))) ? luaM_realloc_(ls->L, ((b)->buffer), ((b)->buffsize) * (sizeof(char)), (newsize) * (sizeof(char))) : luaM_toobig(ls->L))))), (b)->buffsize = newsize);
			}
			b->buffer[b->n++] = ((char)(c));
}
static void luaX_init(lua_State *L)
{
			int i;
			for (i = 0; i < (((int)(TK_WHILE - 257 + 1))); i++) {
			TString *ts = (luaS_newlstr(L, luaX_tokens[i], strlen(luaX_tokens[i])));
			(((ts)->tsv.marked) |= ((1 << (5))));
			ts->tsv.reserved = ((lu_byte)((i + 1)));
			}
}
static const char *luaX_token2str(LexState *ls, int token)
{
			if (token < 257) {
			return (((*__ctype_b_loc ())[(int) ((token))] & (unsigned short int) _IScntrl))
			? luaO_pushfstring(ls->L, "char(%d)", token)
			: luaO_pushfstring(ls->L, "%c", token);
			} else
			return luaX_tokens[token - 257];
}
static const char *txtToken(LexState *ls, int token)
{
			switch (token) {
			case TK_NAME:
			case TK_STRING:
			case TK_NUMBER:
			save(ls, '\0');
			return ((ls->buff)->buffer);
			default:
			return luaX_token2str(ls, token);
			}
}
static void luaX_lexerror(LexState *ls, const char *msg, int token)
{
			char buff[80];
			luaO_chunkid(buff, ((const char *)((ls->source) + 1)), 80);
			msg = luaO_pushfstring(ls->L, "%s:%d: %s", buff, ls->linenumber, msg);
			if (token)
			luaO_pushfstring(ls->L, "%s near " "'" "%s" "'", msg,
			txtToken(ls, token));
			luaD_throw(ls->L, 3);
}
static void luaX_syntaxerror(LexState *ls, const char *msg)
{
			luaX_lexerror(ls, msg, ls->t.token);
}
static TString *luaX_newstring(LexState *ls, const char *str, size_t l)
{
			lua_State *L = ls->L;
			TString *ts = luaS_newlstr(L, str, l);
			TValue *o = luaH_setstr(L, ls->fs->h, ts);
			if ((((o)->tt) == 0)) {
			{ TValue *i_o = (o); i_o->value.b = (1); i_o->tt = 1; };
			{ ((void)0); if ((L->l_G)->totalbytes >= (L->l_G)->GCthreshold) luaC_step(L); };
			}
			return ts;
}
static void inclinenumber(LexState *ls)
{
			int old = ls->current;
			(ls->current = (((ls->z)->n--) > 0 ? ((int)(((unsigned char)((*(ls->z)->p++))))) : luaZ_fill(ls->z)));
			if ((ls->current == '\n' || ls->current == '\r') && ls->current != old)
			(ls->current = (((ls->z)->n--) > 0 ? ((int)(((unsigned char)((*(ls->z)->p++))))) : luaZ_fill(ls->z)));
			if (++ls->linenumber >= (0x7fffffff - 2))
			luaX_syntaxerror(ls, "chunk has too many lines");
}
static void luaX_setinput(lua_State *L, LexState *ls, ZIO *z, TString *source)
{
			ls->decpoint = '.';
			ls->L = L;
			ls->lookahead.token = TK_EOS;
			ls->z = z;
			ls->fs = ((void *)0);
			ls->linenumber = 1;
			ls->lastline = 1;
			ls->source = source;
			((((ls->buff)->buffer) = ((char *)(((((size_t)((32) + 1)) <= ((size_t)(~(size_t)0) - 2) / (sizeof(char))) ? luaM_realloc_(ls->L, ((ls->buff)->buffer), ((ls->buff)->buffsize) * (sizeof(char)), (32) * (sizeof(char))) : luaM_toobig(ls->L))))), (ls->buff)->buffsize = 32);
			(ls->current = (((ls->z)->n--) > 0 ? ((int)(((unsigned char)((*(ls->z)->p++))))) : luaZ_fill(ls->z)));
}
static int check_next(LexState *ls, const char *set)
{
			if (!strchr(set, ls->current))
			return 0;
			(save(ls, ls->current), (ls->current = (((ls->z)->n--) > 0 ? ((int)(((unsigned char)((*(ls->z)->p++))))) : luaZ_fill(ls->z))));
			return 1;
}
static void buffreplace(LexState *ls, char from, char to)
{
			size_t n = ((ls->buff)->n);
			char *p = ((ls->buff)->buffer);
			while (n--)
			if (p[n] == from)
			p[n] = to;
}
static void read_numeral(LexState *ls, SemInfo *seminfo)
{
			do {
			(save(ls, ls->current), (ls->current = (((ls->z)->n--) > 0 ? ((int)(((unsigned char)((*(ls->z)->p++))))) : luaZ_fill(ls->z))));
			} while (((*__ctype_b_loc ())[(int) ((ls->current))] & (unsigned short int) _ISdigit) || ls->current == '.');
			if (check_next(ls, "Ee"))
			check_next(ls, "+-");
			while (((*__ctype_b_loc ())[(int) ((ls->current))] & (unsigned short int) _ISalnum) || ls->current == '_')
			(save(ls, ls->current), (ls->current = (((ls->z)->n--) > 0 ? ((int)(((unsigned char)((*(ls->z)->p++))))) : luaZ_fill(ls->z))));
			save(ls, '\0');
			buffreplace(ls, '.', ls->decpoint);
			if (!luaO_str2d(((ls->buff)->buffer), &seminfo->r))
			luaX_lexerror(ls, "malformed number", TK_NUMBER);
}
static int skip_sep(LexState *ls)
{
			int count = 0;
			int s = ls->current;
			(save(ls, ls->current), (ls->current = (((ls->z)->n--) > 0 ? ((int)(((unsigned char)((*(ls->z)->p++))))) : luaZ_fill(ls->z))));
			while (ls->current == '=') {
			(save(ls, ls->current), (ls->current = (((ls->z)->n--) > 0 ? ((int)(((unsigned char)((*(ls->z)->p++))))) : luaZ_fill(ls->z))));
			count++;
			}
			return (ls->current == s) ? count : (-count) - 1;
}
static void read_long_string(LexState *ls, SemInfo *seminfo, int sep)
{
			int cont = 0;
			(void)(cont);
			(save(ls, ls->current), (ls->current = (((ls->z)->n--) > 0 ? ((int)(((unsigned char)((*(ls->z)->p++))))) : luaZ_fill(ls->z))));
			if ((ls->current == '\n' || ls->current == '\r'))
			inclinenumber(ls);
			for (;;) {
			switch (ls->current) {
			case (-1):
			luaX_lexerror(ls, (seminfo) ? "unfinished long string"
			: "unfinished long comment",
			TK_EOS);
			break;
			case ']': {
			if (skip_sep(ls) == sep) {
			(save(ls, ls->current), (ls->current = (((ls->z)->n--) > 0 ? ((int)(((unsigned char)((*(ls->z)->p++))))) : luaZ_fill(ls->z))));
			goto endloop;
			}
			break;
			}
			case '\n':
			case '\r': {
			save(ls, '\n');
			inclinenumber(ls);
			if (!seminfo)
			((ls->buff)->n = 0);
			break;
			}
			default: {
			if (seminfo)
			(save(ls, ls->current), (ls->current = (((ls->z)->n--) > 0 ? ((int)(((unsigned char)((*(ls->z)->p++))))) : luaZ_fill(ls->z))));
			else
			(ls->current = (((ls->z)->n--) > 0 ? ((int)(((unsigned char)((*(ls->z)->p++))))) : luaZ_fill(ls->z)));
			}
			}
			}
endloop:
			if (seminfo)
			seminfo->ts =
			luaX_newstring(ls, ((ls->buff)->buffer) + (2 + sep),
			((ls->buff)->n) - 2 * (2 + sep));
}
static void read_string(LexState *ls, int del, SemInfo *seminfo)
{
			(save(ls, ls->current), (ls->current = (((ls->z)->n--) > 0 ? ((int)(((unsigned char)((*(ls->z)->p++))))) : luaZ_fill(ls->z))));
			while (ls->current != del) {
			switch (ls->current) {
			case (-1):
			luaX_lexerror(ls, "unfinished string", TK_EOS);
			continue;
			case '\n':
			case '\r':
			luaX_lexerror(ls, "unfinished string", TK_STRING);
			continue;
			case '\\': {
			int c;
			(ls->current = (((ls->z)->n--) > 0 ? ((int)(((unsigned char)((*(ls->z)->p++))))) : luaZ_fill(ls->z)));
			switch (ls->current) {
			case 'a':
			c = '\a';
			break;
			case 'b':
			c = '\b';
			break;
			case 'f':
			c = '\f';
			break;
			case 'n':
			c = '\n';
			break;
			case 'r':
			c = '\r';
			break;
			case 't':
			c = '\t';
			break;
			case 'v':
			c = '\v';
			break;
			case '\n':
			case '\r':
			save(ls, '\n');
			inclinenumber(ls);
			continue;
			case (-1):
			continue;
			default: {
			if (!((*__ctype_b_loc ())[(int) ((ls->current))] & (unsigned short int) _ISdigit))
			(save(ls, ls->current), (ls->current = (((ls->z)->n--) > 0 ? ((int)(((unsigned char)((*(ls->z)->p++))))) : luaZ_fill(ls->z))));
			else {
			int i = 0;
			c = 0;
			do {
			c = 10 * c +
			(ls->current - '0');
			(ls->current = (((ls->z)->n--) > 0 ? ((int)(((unsigned char)((*(ls->z)->p++))))) : luaZ_fill(ls->z)));
			} while (++i < 3 &&
			((*__ctype_b_loc ())[(int) ((ls->current))] & (unsigned short int) _ISdigit));
			if (c > (0x7f * 2 + 1))
			luaX_lexerror(
			ls,
			"escape sequence too large",
			TK_STRING);
			save(ls, c);
			}
			continue;
			}
			}
			save(ls, c);
			(ls->current = (((ls->z)->n--) > 0 ? ((int)(((unsigned char)((*(ls->z)->p++))))) : luaZ_fill(ls->z)));
			continue;
			}
			default:
			(save(ls, ls->current), (ls->current = (((ls->z)->n--) > 0 ? ((int)(((unsigned char)((*(ls->z)->p++))))) : luaZ_fill(ls->z))));
			}
			}
			(save(ls, ls->current), (ls->current = (((ls->z)->n--) > 0 ? ((int)(((unsigned char)((*(ls->z)->p++))))) : luaZ_fill(ls->z))));
			seminfo->ts = luaX_newstring(ls, ((ls->buff)->buffer) + 1,
			((ls->buff)->n) - 2);
}
static int llex(LexState *ls, SemInfo *seminfo)
{
			((ls->buff)->n = 0);
			for (;;) {
			switch (ls->current) {
			case '\n':
			case '\r': {
			inclinenumber(ls);
			continue;
			}
			case '-': {
			(ls->current = (((ls->z)->n--) > 0 ? ((int)(((unsigned char)((*(ls->z)->p++))))) : luaZ_fill(ls->z)));
			if (ls->current != '-')
			return '-';
			(ls->current = (((ls->z)->n--) > 0 ? ((int)(((unsigned char)((*(ls->z)->p++))))) : luaZ_fill(ls->z)));
			if (ls->current == '[') {
			int sep = skip_sep(ls);
			((ls->buff)->n = 0);
			if (sep >= 0) {
			read_long_string(ls, ((void *)0), sep);
			((ls->buff)->n = 0);
			continue;
			}
			}
			while (!(ls->current == '\n' || ls->current == '\r') && ls->current != (-1))
			(ls->current = (((ls->z)->n--) > 0 ? ((int)(((unsigned char)((*(ls->z)->p++))))) : luaZ_fill(ls->z)));
			continue;
			}
			case '[': {
			int sep = skip_sep(ls);
			if (sep >= 0) {
			read_long_string(ls, seminfo, sep);
			return TK_STRING;
			} else if (sep == -1)
			return '[';
			else
			luaX_lexerror(ls,
			"invalid long string delimiter",
			TK_STRING);
			}
			case '=': {
			(ls->current = (((ls->z)->n--) > 0 ? ((int)(((unsigned char)((*(ls->z)->p++))))) : luaZ_fill(ls->z)));
			if (ls->current != '=')
			return '=';
			else {
			(ls->current = (((ls->z)->n--) > 0 ? ((int)(((unsigned char)((*(ls->z)->p++))))) : luaZ_fill(ls->z)));
			return TK_EQ;
			}
			}
			case '<': {
			(ls->current = (((ls->z)->n--) > 0 ? ((int)(((unsigned char)((*(ls->z)->p++))))) : luaZ_fill(ls->z)));
			if (ls->current != '=')
			return '<';
			else {
			(ls->current = (((ls->z)->n--) > 0 ? ((int)(((unsigned char)((*(ls->z)->p++))))) : luaZ_fill(ls->z)));
			return TK_LE;
			}
			}
			case '>': {
			(ls->current = (((ls->z)->n--) > 0 ? ((int)(((unsigned char)((*(ls->z)->p++))))) : luaZ_fill(ls->z)));
			if (ls->current != '=')
			return '>';
			else {
			(ls->current = (((ls->z)->n--) > 0 ? ((int)(((unsigned char)((*(ls->z)->p++))))) : luaZ_fill(ls->z)));
			return TK_GE;
			}
			}
			case '~': {
			(ls->current = (((ls->z)->n--) > 0 ? ((int)(((unsigned char)((*(ls->z)->p++))))) : luaZ_fill(ls->z)));
			if (ls->current != '=')
			return '~';
			else {
			(ls->current = (((ls->z)->n--) > 0 ? ((int)(((unsigned char)((*(ls->z)->p++))))) : luaZ_fill(ls->z)));
			return TK_NE;
			}
			}
			case '"':
			case '\'': {
			read_string(ls, ls->current, seminfo);
			return TK_STRING;
			}
			case '.': {
			(save(ls, ls->current), (ls->current = (((ls->z)->n--) > 0 ? ((int)(((unsigned char)((*(ls->z)->p++))))) : luaZ_fill(ls->z))));
			if (check_next(ls, ".")) {
			if (check_next(ls, "."))
			return TK_DOTS;
			else
			return TK_CONCAT;
			} else if (!((*__ctype_b_loc ())[(int) ((ls->current))] & (unsigned short int) _ISdigit))
			return '.';
			else {
			read_numeral(ls, seminfo);
			return TK_NUMBER;
			}
			}
			case (-1): {
			return TK_EOS;
			}
			default: {
			if (((*__ctype_b_loc ())[(int) ((ls->current))] & (unsigned short int) _ISspace)) {
			(ls->current = (((ls->z)->n--) > 0 ? ((int)(((unsigned char)((*(ls->z)->p++))))) : luaZ_fill(ls->z)));
			continue;
			} else if (((*__ctype_b_loc ())[(int) ((ls->current))] & (unsigned short int) _ISdigit)) {
			read_numeral(ls, seminfo);
			return TK_NUMBER;
			} else if (((*__ctype_b_loc ())[(int) ((ls->current))] & (unsigned short int) _ISalpha) || ls->current == '_') {
			TString *ts;
			do {
			(save(ls, ls->current), (ls->current = (((ls->z)->n--) > 0 ? ((int)(((unsigned char)((*(ls->z)->p++))))) : luaZ_fill(ls->z))));
			} while (((*__ctype_b_loc ())[(int) ((ls->current))] & (unsigned short int) _ISalnum) ||
			ls->current == '_');
			ts = luaX_newstring(ls, ((ls->buff)->buffer),
			((ls->buff)->n));
			if (ts->tsv.reserved > 0)
			return ts->tsv.reserved - 1 + 257;
			else {
			seminfo->ts = ts;
			return TK_NAME;
			}
			} else {
			int c = ls->current;
			(ls->current = (((ls->z)->n--) > 0 ? ((int)(((unsigned char)((*(ls->z)->p++))))) : luaZ_fill(ls->z)));
			return c;
			}
			}
			}
			}
}
static void luaX_next(LexState *ls)
{
			ls->lastline = ls->linenumber;
			if (ls->lookahead.token != TK_EOS) {
			memcpy(&ls->t, &ls->lookahead, sizeof ls->t);
			ls->lookahead.token = TK_EOS;
			} else
			ls->t.token = llex(ls, &ls->t.seminfo);
}
static void luaX_lookahead(LexState *ls)
{
			ls->lookahead.token = llex(ls, &ls->lookahead.seminfo);
}
static int isnumeral(expdesc *e)
{
			return (e->k == VKNUM && e->t == (-1) && e->f == (-1));
}
static void luaK_nil(FuncState *fs, int from, int n)
{
			Instruction *previous;
			if (fs->pc > fs->lasttarget) {
			if (fs->pc == 0) {
			if (from >= fs->nactvar)
			return;
			} else {
			previous = &fs->f->code[fs->pc - 1];
			if ((((OpCode)(((*previous) >> 0) & ((~((~(Instruction)0) << 6)) << 0)))) == OP_LOADNIL) {
			int pfrom = (((int)(((*previous) >> (0 + 6)) & ((~((~(Instruction)0) << 8)) << 0))));
			int pto = (((int)(((*previous) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0))));
			if (pfrom <= from && from <= pto + 1) {
			if (from + n - 1 > pto)
			((*previous) = (((*previous)&(~((~((~(Instruction)0) << 9)) << (((0 + 6) + 8) + 9)))) | ((((Instruction)(from + n - 1)) << (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << (((0 + 6) + 8) + 9)))));
			return;
			}
			}
			}
			}
			luaK_codeABC(fs, OP_LOADNIL, from, from + n - 1, 0);
}
static int luaK_jump(FuncState *fs)
{
			int jpc = fs->jpc;
			int j;
			fs->jpc = (-1);
			j = luaK_codeABx(fs, OP_JMP, 0, ((-1)) + (((1 << (9 + 9)) - 1) >> 1));
			luaK_concat(fs, &j, jpc);
			return j;
}
static void luaK_ret(FuncState *fs, int first, int nret)
{
			luaK_codeABC(fs, OP_RETURN, first, nret + 1, 0);
}
static int condjump(FuncState *fs, OpCode op, int A, int B, int C)
{
			luaK_codeABC(fs, op, A, B, C);
			return luaK_jump(fs);
}
static void fixjump(FuncState *fs, int pc, int dest)
{
			Instruction *jmp = &fs->f->code[pc];
			int offset = dest - (pc + 1);
			if (abs(offset) > (((1 << (9 + 9)) - 1) >> 1))
			luaX_syntaxerror(fs->ls, "control structure too long");
			(((*jmp)) = ((((*jmp))&(~((~((~(Instruction)0) << (9 + 9))) << ((0 + 6) + 8)))) | ((((Instruction)(((unsigned int)((offset) + (((1 << (9 + 9)) - 1) >> 1))))) << ((0 + 6) + 8)) & ((~((~(Instruction)0) << (9 + 9))) << ((0 + 6) + 8)))));
}
static int luaK_getlabel(FuncState *fs)
{
			fs->lasttarget = fs->pc;
			return fs->pc;
}
static int getjump(FuncState *fs, int pc)
{
			int offset = ((((int)(((fs->f->code[pc]) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << (9 + 9))) << 0)))) - (((1 << (9 + 9)) - 1) >> 1));
			if (offset == (-1))
			return (-1);
			else
			return (pc + 1) + offset;
}
static Instruction *getjumpcontrol(FuncState *fs, int pc)
{
			Instruction *pi = &fs->f->code[pc];
			if (pc >= 1 && (luaP_opmodes[(((OpCode)(((*(pi - 1)) >> 0) & ((~((~(Instruction)0) << 6)) << 0))))] & (1 << 7)))
			return pi - 1;
			else
			return pi;
}
static int need_value(FuncState *fs, int list)
{
			for (; list != (-1); list = getjump(fs, list)) {
			Instruction i = *getjumpcontrol(fs, list);
			if ((((OpCode)(((i) >> 0) & ((~((~(Instruction)0) << 6)) << 0)))) != OP_TESTSET)
			return 1;
			}
			return 0;
}
static int patchtestreg(FuncState *fs, int node, int reg)
{
			Instruction *i = getjumpcontrol(fs, node);
			if ((((OpCode)(((*i) >> 0) & ((~((~(Instruction)0) << 6)) << 0)))) != OP_TESTSET)
			return 0;
			if (reg != ((1 << 8) - 1) && reg != (((int)(((*i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0)))))
			((*i) = (((*i)&(~((~((~(Instruction)0) << 8)) << (0 + 6)))) | ((((Instruction)(reg)) << (0 + 6)) & ((~((~(Instruction)0) << 8)) << (0 + 6)))));
			else
			*i = ((((Instruction)(OP_TEST)) << 0) | (((Instruction)((((int)(((*i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0)))))) << (0 + 6)) | (((Instruction)(0)) << (((0 + 6) + 8) + 9)) | (((Instruction)((((int)(((*i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << 9)) << 0)))))) << ((0 + 6) + 8)));
			return 1;
}
static void removevalues(FuncState *fs, int list)
{
			for (; list != (-1); list = getjump(fs, list))
			patchtestreg(fs, list, ((1 << 8) - 1));
}
static void patchlistaux(FuncState *fs, int list, int vtarget, int reg,
			int dtarget)
{
			while (list != (-1)) {
			int next = getjump(fs, list);
			if (patchtestreg(fs, list, reg))
			fixjump(fs, list, vtarget);
			else
			fixjump(fs, list, dtarget);
			list = next;
			}
}
static void dischargejpc(FuncState *fs)
{
			patchlistaux(fs, fs->jpc, fs->pc, ((1 << 8) - 1), fs->pc);
			fs->jpc = (-1);
}
static void luaK_patchlist(FuncState *fs, int list, int target)
{
			if (target == fs->pc)
			luaK_patchtohere(fs, list);
			else {
			patchlistaux(fs, list, target, ((1 << 8) - 1), target);
			}
}
static void luaK_patchtohere(FuncState *fs, int list)
{
			luaK_getlabel(fs);
			luaK_concat(fs, &fs->jpc, list);
}
static void luaK_concat(FuncState *fs, int *l1, int l2)
{
			if (l2 == (-1))
			return;
			else if (*l1 == (-1))
			*l1 = l2;
			else {
			int list = *l1;
			int next;
			while ((next = getjump(fs, list)) != (-1))
			list = next;
			fixjump(fs, list, l2);
			}
}
static void luaK_checkstack(FuncState *fs, int n)
{
			int newstack = fs->freereg + n;
			if (newstack > fs->f->maxstacksize) {
			if (newstack >= 250)
			luaX_syntaxerror(fs->ls,
			"function or expression too complex");
			fs->f->maxstacksize = ((lu_byte)((newstack)));
			}
}
static void luaK_reserveregs(FuncState *fs, int n)
{
			luaK_checkstack(fs, n);
			fs->freereg += n;
}
static void freereg(FuncState *fs, int reg)
{
			if (!((reg) & (1 << (9 - 1))) && reg >= fs->nactvar) {
			fs->freereg--;
			}
}
static void freeexp(FuncState *fs, expdesc *e)
{
			if (e->k == VNONRELOC)
			freereg(fs, e->u.s.info);
}
static int addk(FuncState *fs, TValue *k, TValue *v)
{
			lua_State *L = fs->L;
			TValue *idx = luaH_set(L, fs->h, k);
			Proto *f = fs->f;
			int oldsize = f->sizek;
			if ((((idx)->tt) == 3)) {
			return ((int)((((idx)->value.n))));
			} else {
			{ TValue *i_o = (idx); i_o->value.n = (((lua_Number)((fs->nk)))); i_o->tt = 3; };
			if ((fs->nk) + 1 > (f->sizek)) ((f->k) = ((TValue *)(luaM_growaux_(L, f->k, &(f->sizek), sizeof(TValue), ((1 << (9 + 9)) - 1), "constant table overflow"))));
			while (oldsize < f->sizek)
			((&f->k[oldsize++])->tt = 0);
			{ const TValue *o2 = (v); TValue *o1 = (&f->k[fs->nk]); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
			{ if (((((v)->tt) >= 4) && (((((v)->value.gc))->gch.marked) & ((((1 << (0)) | (1 << (1))))))) && ((((((GCObject *)((f)))))->gch.marked) & ((1 << (2))))) luaC_barrierf(L, (((GCObject *)((f)))), ((v)->value.gc)); };
			return fs->nk++;
			}
}
static int luaK_stringK(FuncState *fs, TString *s)
{
			TValue o;
			{ TValue *i_o = (&o); i_o->value.gc = ((GCObject *)((s))); i_o->tt = 4;; };
			return addk(fs, &o, &o);
}
static int luaK_numberK(FuncState *fs, lua_Number r)
{
			TValue o;
			{ TValue *i_o = (&o); i_o->value.n = (r); i_o->tt = 3; };
			return addk(fs, &o, &o);
}
static int boolK(FuncState *fs, int b)
{
			TValue o;
			{ TValue *i_o = (&o); i_o->value.b = (b); i_o->tt = 1; };
			return addk(fs, &o, &o);
}
static int nilK(FuncState *fs)
{
			TValue k, v;
			((&v)->tt = 0);
			{ TValue *i_o = (&k); i_o->value.gc = ((GCObject *)((fs->h))); i_o->tt = 5;; };
			return addk(fs, &k, &v);
}
static void luaK_setreturns(FuncState *fs, expdesc *e, int nresults)
{
			if (e->k == VCALL) {
			((((fs)->f->code[(e)->u.s.info])) = (((((fs)->f->code[(e)->u.s.info]))&(~((~((~(Instruction)0) << 9)) << ((0 + 6) + 8)))) | ((((Instruction)(nresults + 1)) << ((0 + 6) + 8)) & ((~((~(Instruction)0) << 9)) << ((0 + 6) + 8)))));
			} else if (e->k == VVARARG) {
			((((fs)->f->code[(e)->u.s.info])) = (((((fs)->f->code[(e)->u.s.info]))&(~((~((~(Instruction)0) << 9)) << (((0 + 6) + 8) + 9)))) | ((((Instruction)(nresults + 1)) << (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << (((0 + 6) + 8) + 9)))));
			((((fs)->f->code[(e)->u.s.info])) = (((((fs)->f->code[(e)->u.s.info]))&(~((~((~(Instruction)0) << 8)) << (0 + 6)))) | ((((Instruction)(fs->freereg)) << (0 + 6)) & ((~((~(Instruction)0) << 8)) << (0 + 6)))));
			luaK_reserveregs(fs, 1);
			}
}
static void luaK_setoneret(FuncState *fs, expdesc *e)
{
			if (e->k == VCALL) {
			e->k = VNONRELOC;
			e->u.s.info = (((int)(((((fs)->f->code[(e)->u.s.info])) >> (0 + 6)) & ((~((~(Instruction)0) << 8)) << 0))));
			} else if (e->k == VVARARG) {
			((((fs)->f->code[(e)->u.s.info])) = (((((fs)->f->code[(e)->u.s.info]))&(~((~((~(Instruction)0) << 9)) << (((0 + 6) + 8) + 9)))) | ((((Instruction)(2)) << (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << (((0 + 6) + 8) + 9)))));
			e->k = VRELOCABLE;
			}
}
static void luaK_dischargevars(FuncState *fs, expdesc *e)
{
			switch (e->k) {
			case VLOCAL: {
			e->k = VNONRELOC;
			break;
			}
			case VUPVAL: {
			e->u.s.info = luaK_codeABC(fs, OP_GETUPVAL, 0, e->u.s.info, 0);
			e->k = VRELOCABLE;
			break;
			}
			case VGLOBAL: {
			e->u.s.info = luaK_codeABx(fs, OP_GETGLOBAL, 0, e->u.s.info);
			e->k = VRELOCABLE;
			break;
			}
			case VINDEXED: {
			freereg(fs, e->u.s.aux);
			freereg(fs, e->u.s.info);
			e->u.s.info =
			luaK_codeABC(fs, OP_GETTABLE, 0, e->u.s.info, e->u.s.aux);
			e->k = VRELOCABLE;
			break;
			}
			case VVARARG:
			case VCALL: {
			luaK_setoneret(fs, e);
			break;
			}
			default:
			break;
			}
}
static int code_label(FuncState *fs, int A, int b, int jump)
{
			luaK_getlabel(fs);
			return luaK_codeABC(fs, OP_LOADBOOL, A, b, jump);
}
static void discharge2reg(FuncState *fs, expdesc *e, int reg)
{
			luaK_dischargevars(fs, e);
			switch (e->k) {
			case VNIL: {
			luaK_nil(fs, reg, 1);
			break;
			}
			case VFALSE:
			case VTRUE: {
			luaK_codeABC(fs, OP_LOADBOOL, reg, e->k == VTRUE, 0);
			break;
			}
			case VK: {
			luaK_codeABx(fs, OP_LOADK, reg, e->u.s.info);
			break;
			}
			case VKNUM: {
			luaK_codeABx(fs, OP_LOADK, reg, luaK_numberK(fs, e->u.nval));
			break;
			}
			case VRELOCABLE: {
			Instruction *pc = &((fs)->f->code[(e)->u.s.info]);
			((*pc) = (((*pc)&(~((~((~(Instruction)0) << 8)) << (0 + 6)))) | ((((Instruction)(reg)) << (0 + 6)) & ((~((~(Instruction)0) << 8)) << (0 + 6)))));
			break;
			}
			case VNONRELOC: {
			if (reg != e->u.s.info)
			luaK_codeABC(fs, OP_MOVE, reg, e->u.s.info, 0);
			break;
			}
			default: {
			return;
			}
			}
			e->u.s.info = reg;
			e->k = VNONRELOC;
}
static void discharge2anyreg(FuncState *fs, expdesc *e)
{
			if (e->k != VNONRELOC) {
			luaK_reserveregs(fs, 1);
			discharge2reg(fs, e, fs->freereg - 1);
			}
}
static void exp2reg(FuncState *fs, expdesc *e, int reg)
{
			discharge2reg(fs, e, reg);
			if (e->k == VJMP)
			luaK_concat(fs, &e->t, e->u.s.info);
			if (((e)->t != (e)->f)) {
			int final;
			int p_f = (-1);
			int p_t = (-1);
			if (need_value(fs, e->t) || need_value(fs, e->f)) {
			int fj = (e->k == VJMP) ? (-1) : luaK_jump(fs);
			p_f = code_label(fs, reg, 0, 1);
			p_t = code_label(fs, reg, 1, 0);
			luaK_patchtohere(fs, fj);
			}
			final = luaK_getlabel(fs);
			patchlistaux(fs, e->f, final, reg, p_f);
			patchlistaux(fs, e->t, final, reg, p_t);
			}
			e->f = e->t = (-1);
			e->u.s.info = reg;
			e->k = VNONRELOC;
}
static void luaK_exp2nextreg(FuncState *fs, expdesc *e)
{
			luaK_dischargevars(fs, e);
			freeexp(fs, e);
			luaK_reserveregs(fs, 1);
			exp2reg(fs, e, fs->freereg - 1);
}
static int luaK_exp2anyreg(FuncState *fs, expdesc *e)
{
			luaK_dischargevars(fs, e);
			if (e->k == VNONRELOC) {
			if (!((e)->t != (e)->f))
			return e->u.s.info;
			if (e->u.s.info >= fs->nactvar) {
			exp2reg(fs, e, e->u.s.info);
			return e->u.s.info;
			}
			}
			luaK_exp2nextreg(fs, e);
			return e->u.s.info;
}
static void luaK_exp2val(FuncState *fs, expdesc *e)
{
			if (((e)->t != (e)->f))
			luaK_exp2anyreg(fs, e);
			else
			luaK_dischargevars(fs, e);
}
static int luaK_exp2RK(FuncState *fs, expdesc *e)
{
			luaK_exp2val(fs, e);
			switch (e->k) {
			case VKNUM:
			case VTRUE:
			case VFALSE:
			case VNIL: {
			if (fs->nk <= ((1 << (9 - 1)) - 1)) {
			e->u.s.info = (e->k == VNIL)
			? nilK(fs)
			: (e->k == VKNUM)
			? luaK_numberK(fs, e->u.nval)
			: boolK(fs, (e->k == VTRUE));
			e->k = VK;
			return ((e->u.s.info) | (1 << (9 - 1)));
			} else
			break;
			}
			case VK: {
			if (e->u.s.info <= ((1 << (9 - 1)) - 1))
			return ((e->u.s.info) | (1 << (9 - 1)));
			else
			break;
			}
			default:
			break;
			}
			return luaK_exp2anyreg(fs, e);
}
static void luaK_storevar(FuncState *fs, expdesc *var, expdesc *ex)
{
			switch (var->k) {
			case VLOCAL: {
			freeexp(fs, ex);
			exp2reg(fs, ex, var->u.s.info);
			return;
			}
			case VUPVAL: {
			int e = luaK_exp2anyreg(fs, ex);
			luaK_codeABC(fs, OP_SETUPVAL, e, var->u.s.info, 0);
			break;
			}
			case VGLOBAL: {
			int e = luaK_exp2anyreg(fs, ex);
			luaK_codeABx(fs, OP_SETGLOBAL, e, var->u.s.info);
			break;
			}
			case VINDEXED: {
			int e = luaK_exp2RK(fs, ex);
			luaK_codeABC(fs, OP_SETTABLE, var->u.s.info, var->u.s.aux, e);
			break;
			}
			default: {
			break;
			}
			}
			freeexp(fs, ex);
}
static void luaK_self(FuncState *fs, expdesc *e, expdesc *key)
{
			int func;
			luaK_exp2anyreg(fs, e);
			freeexp(fs, e);
			func = fs->freereg;
			luaK_reserveregs(fs, 2);
			luaK_codeABC(fs, OP_SELF, func, e->u.s.info, luaK_exp2RK(fs, key));
			freeexp(fs, key);
			e->u.s.info = func;
			e->k = VNONRELOC;
}
static void invertjump(FuncState *fs, expdesc *e)
{
			Instruction *pc = getjumpcontrol(fs, e->u.s.info);
			((*pc) = (((*pc)&(~((~((~(Instruction)0) << 8)) << (0 + 6)))) | ((((Instruction)(!((((int)(((*pc) >> (0 + 6)) & ((~((~(Instruction)0) << 8)) << 0))))))) << (0 + 6)) & ((~((~(Instruction)0) << 8)) << (0 + 6)))));
}
static int jumponcond(FuncState *fs, expdesc *e, int cond)
{
			if (e->k == VRELOCABLE) {
			Instruction ie = ((fs)->f->code[(e)->u.s.info]);
			if ((((OpCode)(((ie) >> 0) & ((~((~(Instruction)0) << 6)) << 0)))) == OP_NOT) {
			fs->pc--;
			return condjump(fs, OP_TEST, (((int)(((ie) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0)))), 0, !cond);
			}
			}
			discharge2anyreg(fs, e);
			freeexp(fs, e);
			return condjump(fs, OP_TESTSET, ((1 << 8) - 1), e->u.s.info, cond);
}
static void luaK_goiftrue(FuncState *fs, expdesc *e)
{
			int pc;
			luaK_dischargevars(fs, e);
			switch (e->k) {
			case VK:
			case VKNUM:
			case VTRUE: {
			pc = (-1);
			break;
			}
			case VJMP: {
			invertjump(fs, e);
			pc = e->u.s.info;
			break;
			}
			default: {
			pc = jumponcond(fs, e, 0);
			break;
			}
			}
			luaK_concat(fs, &e->f, pc);
			luaK_patchtohere(fs, e->t);
			e->t = (-1);
}
static void luaK_goiffalse(FuncState *fs, expdesc *e)
{
			int pc;
			luaK_dischargevars(fs, e);
			switch (e->k) {
			case VNIL:
			case VFALSE: {
			pc = (-1);
			break;
			}
			case VJMP: {
			pc = e->u.s.info;
			break;
			}
			default: {
			pc = jumponcond(fs, e, 1);
			break;
			}
			}
			luaK_concat(fs, &e->t, pc);
			luaK_patchtohere(fs, e->f);
			e->f = (-1);
}
static void codenot(FuncState *fs, expdesc *e)
{
			luaK_dischargevars(fs, e);
			switch (e->k) {
			case VNIL:
			case VFALSE: {
			e->k = VTRUE;
			break;
			}
			case VK:
			case VKNUM:
			case VTRUE: {
			e->k = VFALSE;
			break;
			}
			case VJMP: {
			invertjump(fs, e);
			break;
			}
			case VRELOCABLE:
			case VNONRELOC: {
			discharge2anyreg(fs, e);
			freeexp(fs, e);
			e->u.s.info = luaK_codeABC(fs, OP_NOT, 0, e->u.s.info, 0);
			e->k = VRELOCABLE;
			break;
			}
			default: {
			break;
			}
			}
			{
			int temp = e->f;
			e->f = e->t;
			e->t = temp;
			}
			removevalues(fs, e->f);
			removevalues(fs, e->t);
}
static void luaK_indexed(FuncState *fs, expdesc *t, expdesc *k)
{
			t->u.s.aux = luaK_exp2RK(fs, k);
			t->k = VINDEXED;
}
static int constfolding(OpCode op, expdesc *e1, expdesc *e2)
{
			lua_Number v1, v2, r;
			if (!isnumeral(e1) || !isnumeral(e2))
			return 0;
			v1 = e1->u.nval;
			v2 = e2->u.nval;
			switch (op) {
			case OP_ADD:
			r = ((v1) + (v2));
			break;
			case OP_SUB:
			r = ((v1) - (v2));
			break;
			case OP_MUL:
			r = ((v1) * (v2));
			break;
			case OP_DIV:
			if (v2 == 0)
			return 0;
			r = ((v1) / (v2));
			break;
			case OP_MOD:
			if (v2 == 0)
			return 0;
			r = ((v1)-floor((v1) / (v2)) * (v2));
			break;
			case OP_POW:
			r = (pow(v1, v2));
			break;
			case OP_UNM:
			r = (-(v1));
			break;
			case OP_LEN:
			return 0;
			default:
			r = 0;
			break;
			}
			if ((!(((r)) == ((r)))))
			return 0;
			e1->u.nval = r;
			return 1;
}
static void codearith(FuncState *fs, OpCode op, expdesc *e1, expdesc *e2)
{
			if (constfolding(op, e1, e2))
			return;
			else {
			int o2 =
			(op != OP_UNM && op != OP_LEN) ? luaK_exp2RK(fs, e2) : 0;
			int o1 = luaK_exp2RK(fs, e1);
			if (o1 > o2) {
			freeexp(fs, e1);
			freeexp(fs, e2);
			} else {
			freeexp(fs, e2);
			freeexp(fs, e1);
			}
			e1->u.s.info = luaK_codeABC(fs, op, 0, o1, o2);
			e1->k = VRELOCABLE;
			}
}
static void codecomp(FuncState *fs, OpCode op, int cond, expdesc *e1,
			expdesc *e2)
{
			int o1 = luaK_exp2RK(fs, e1);
			int o2 = luaK_exp2RK(fs, e2);
			freeexp(fs, e2);
			freeexp(fs, e1);
			if (cond == 0 && op != OP_EQ) {
			int temp;
			temp = o1;
			o1 = o2;
			o2 = temp;
			cond = 1;
			}
			e1->u.s.info = condjump(fs, op, cond, o1, o2);
			e1->k = VJMP;
}
static void luaK_prefix(FuncState *fs, UnOpr op, expdesc *e)
{
			expdesc e2;
			e2.t = e2.f = (-1);
			e2.k = VKNUM;
			e2.u.nval = 0;
			switch (op) {
			case OPR_MINUS: {
			if (!isnumeral(e))
			luaK_exp2anyreg(fs, e);
			codearith(fs, OP_UNM, e, &e2);
			break;
			}
			case OPR_NOT:
			codenot(fs, e);
			break;
			case OPR_LEN: {
			luaK_exp2anyreg(fs, e);
			codearith(fs, OP_LEN, e, &e2);
			break;
			}
			default:;
			}
}
static void luaK_infix(FuncState *fs, BinOpr op, expdesc *v)
{
			switch (op) {
			case OPR_AND: {
			luaK_goiftrue(fs, v);
			break;
			}
			case OPR_OR: {
			luaK_goiffalse(fs, v);
			break;
			}
			case OPR_CONCAT: {
			luaK_exp2nextreg(fs, v);
			break;
			}
			case OPR_ADD:
			case OPR_SUB:
			case OPR_MUL:
			case OPR_DIV:
			case OPR_MOD:
			case OPR_POW: {
			if (!isnumeral(v))
			luaK_exp2RK(fs, v);
			break;
			}
			default: {
			luaK_exp2RK(fs, v);
			break;
			}
			}
}
static void luaK_posfix(FuncState *fs, BinOpr op, expdesc *e1, expdesc *e2)
{
			switch (op) {
			case OPR_AND: {
			luaK_dischargevars(fs, e2);
			luaK_concat(fs, &e2->f, e1->f);
			memcpy(e1, e2, sizeof *e1);
			break;
			}
			case OPR_OR: {
			luaK_dischargevars(fs, e2);
			luaK_concat(fs, &e2->t, e1->t);
			memcpy(e1, e2, sizeof *e1);
			break;
			}
			case OPR_CONCAT: {
			luaK_exp2val(fs, e2);
			if (e2->k == VRELOCABLE &&
			(((OpCode)(((((fs)->f->code[(e2)->u.s.info])) >> 0) & ((~((~(Instruction)0) << 6)) << 0)))) == OP_CONCAT) {
			freeexp(fs, e1);
			((((fs)->f->code[(e2)->u.s.info])) = (((((fs)->f->code[(e2)->u.s.info]))&(~((~((~(Instruction)0) << 9)) << (((0 + 6) + 8) + 9)))) | ((((Instruction)(e1->u.s.info)) << (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << (((0 + 6) + 8) + 9)))));
			e1->k = VRELOCABLE;
			e1->u.s.info = e2->u.s.info;
			} else {
			luaK_exp2nextreg(fs, e2);
			codearith(fs, OP_CONCAT, e1, e2);
			}
			break;
			}
			case OPR_ADD:
			codearith(fs, OP_ADD, e1, e2);
			break;
			case OPR_SUB:
			codearith(fs, OP_SUB, e1, e2);
			break;
			case OPR_MUL:
			codearith(fs, OP_MUL, e1, e2);
			break;
			case OPR_DIV:
			codearith(fs, OP_DIV, e1, e2);
			break;
			case OPR_MOD:
			codearith(fs, OP_MOD, e1, e2);
			break;
			case OPR_POW:
			codearith(fs, OP_POW, e1, e2);
			break;
			case OPR_EQ:
			codecomp(fs, OP_EQ, 1, e1, e2);
			break;
			case OPR_NE:
			codecomp(fs, OP_EQ, 0, e1, e2);
			break;
			case OPR_LT:
			codecomp(fs, OP_LT, 1, e1, e2);
			break;
			case OPR_LE:
			codecomp(fs, OP_LE, 1, e1, e2);
			break;
			case OPR_GT:
			codecomp(fs, OP_LT, 0, e1, e2);
			break;
			case OPR_GE:
			codecomp(fs, OP_LE, 0, e1, e2);
			break;
			default:;
			}
}
static void luaK_fixline(FuncState *fs, int line)
{
			fs->f->lineinfo[fs->pc - 1] = line;
}
static int luaK_code(FuncState *fs, Instruction i, int line)
{
			Proto *f = fs->f;
			dischargejpc(fs);
			if ((fs->pc) + 1 > (f->sizecode)) ((f->code) = ((Instruction *)(luaM_growaux_(fs->L, f->code, &(f->sizecode), sizeof(Instruction), (0x7fffffff - 2), "code size overflow"))));
			f->code[fs->pc] = i;
			if ((fs->pc) + 1 > (f->sizelineinfo)) ((f->lineinfo) = ((int *)(luaM_growaux_(fs->L, f->lineinfo, &(f->sizelineinfo), sizeof(int), (0x7fffffff - 2), "code size overflow"))));
			f->lineinfo[fs->pc] = line;
			return fs->pc++;
}
static int luaK_codeABC(FuncState *fs, OpCode o, int a, int b, int c)
{
			return luaK_code(fs, ((((Instruction)(o)) << 0) | (((Instruction)(a)) << (0 + 6)) | (((Instruction)(b)) << (((0 + 6) + 8) + 9)) | (((Instruction)(c)) << ((0 + 6) + 8))), fs->ls->lastline);
}
static int luaK_codeABx(FuncState *fs, OpCode o, int a, unsigned int bc)
{
			return luaK_code(fs, ((((Instruction)(o)) << 0) | (((Instruction)(a)) << (0 + 6)) | (((Instruction)(bc)) << ((0 + 6) + 8))), fs->ls->lastline);
}
static void luaK_setlist(FuncState *fs, int base, int nelems, int tostore)
{
			int c = (nelems - 1) / 50 + 1;
			int b = (tostore == (-1)) ? 0 : tostore;
			if (c <= ((1 << 9) - 1))
			luaK_codeABC(fs, OP_SETLIST, base, b, c);
			else {
			luaK_codeABC(fs, OP_SETLIST, base, b, 0);
			luaK_code(fs, ((Instruction)(c)), fs->ls->lastline);
			}
			fs->freereg = base + 1;
}
typedef struct BlockCnt {
			struct BlockCnt *previous;
			int breaklist;
			lu_byte nactvar;
			lu_byte upval;
			lu_byte isbreakable;
} BlockCnt;
static void chunk(LexState *ls);
static void expr(LexState *ls, expdesc *v);
static void anchor_token(LexState *ls)
{
			if (ls->t.token == TK_NAME || ls->t.token == TK_STRING) {
			TString *ts = ls->t.seminfo.ts;
			luaX_newstring(ls, ((const char *)((ts) + 1)), ts->tsv.len);
			}
}
static void error_expected(LexState *ls, int token)
{
			luaX_syntaxerror(ls, luaO_pushfstring(ls->L, "'" "%s" "'" " expected",
			luaX_token2str(ls, token)));
}
static void errorlimit(FuncState *fs, int limit, const char *what)
{
			const char *msg =
			(fs->f->linedefined == 0)
			? luaO_pushfstring(fs->L, "main function has more than %d %s",
			limit, what)
			: luaO_pushfstring(fs->L,
			"function at line %d has more than %d %s",
			fs->f->linedefined, limit, what);
			luaX_lexerror(fs->ls, msg, 0);
}
static int testnext(LexState *ls, int c)
{
			if (ls->t.token == c) {
			luaX_next(ls);
			return 1;
			} else
			return 0;
}
static void check(LexState *ls, int c)
{
			if (ls->t.token != c)
			error_expected(ls, c);
}
static void checknext(LexState *ls, int c)
{
			check(ls, c);
			luaX_next(ls);
}
static void check_match(LexState *ls, int what, int who, int where)
{
			if (!testnext(ls, what)) {
			if (where == ls->linenumber)
			error_expected(ls, what);
			else {
			luaX_syntaxerror(
			ls, luaO_pushfstring(
			ls->L,
			"'" "%s" "'" " expected (to close " "'" "%s" "'" " at line %d)",
			luaX_token2str(ls, what),
			luaX_token2str(ls, who), where));
			}
			}
}
static TString *str_checkname(LexState *ls)
{
			TString *ts;
			check(ls, TK_NAME);
			ts = ls->t.seminfo.ts;
			luaX_next(ls);
			return ts;
}
static void init_exp(expdesc *e, expkind k, int i)
{
			e->f = e->t = (-1);
			e->k = k;
			e->u.s.info = i;
}
static void codestring(LexState *ls, expdesc *e, TString *s)
{
			init_exp(e, VK, luaK_stringK(ls->fs, s));
}
static void checkname(LexState *ls, expdesc *e)
{
			codestring(ls, e, str_checkname(ls));
}
static int registerlocalvar(LexState *ls, TString *varname)
{
			FuncState *fs = ls->fs;
			Proto *f = fs->f;
			int oldsize = f->sizelocvars;
			if ((fs->nlocvars) + 1 > (f->sizelocvars)) ((f->locvars) = ((LocVar *)(luaM_growaux_(ls->L, f->locvars, &(f->sizelocvars), sizeof(LocVar), 0x7fff, "too many local variables"))));
			while (oldsize < f->sizelocvars)
			f->locvars[oldsize++].varname = ((void *)0);
			f->locvars[fs->nlocvars].varname = varname;
			{ if (((((((GCObject *)((varname)))))->gch.marked) & ((((1 << (0)) | (1 << (1)))))) && ((((((GCObject *)((f)))))->gch.marked) & ((1 << (2))))) luaC_barrierf(ls->L, (((GCObject *)((f)))), (((GCObject *)((varname))))); };
			return fs->nlocvars++;
}
static void new_localvar(LexState *ls, TString *name, int n)
{
			FuncState *fs = ls->fs;
			if ((fs->nactvar + n + 1) > (200)) errorlimit(fs, 200, "local variables");
			fs->actvar[fs->nactvar + n] =
			((unsigned short)(registerlocalvar(ls, name)));
}
static void adjustlocalvars(LexState *ls, int nvars)
{
			FuncState *fs = ls->fs;
			fs->nactvar = ((lu_byte)((fs->nactvar + nvars)));
			for (; nvars; nvars--) {
			((fs)->f->locvars[(fs)->actvar[fs->nactvar - nvars]]).startpc = fs->pc;
			}
}
static void removevars(LexState *ls, int tolevel)
{
			FuncState *fs = ls->fs;
			while (fs->nactvar > tolevel)
			((fs)->f->locvars[(fs)->actvar[--fs->nactvar]]).endpc = fs->pc;
}
static int indexupvalue(FuncState *fs, TString *name, expdesc *v)
{
			int i;
			Proto *f = fs->f;
			int oldsize = f->sizeupvalues;
			for (i = 0; i < f->nups; i++) {
			if (fs->upvalues[i].k == v->k &&
			fs->upvalues[i].info == v->u.s.info) {
			return i;
			}
			}
			if ((f->nups + 1) > (60)) errorlimit(fs, 60, "upvalues");
			if ((f->nups) + 1 > (f->sizeupvalues)) ((f->upvalues) = ((TString * *)(luaM_growaux_(fs->L, f->upvalues, &(f->sizeupvalues), sizeof(TString *), (0x7fffffff - 2), ""))));
			while (oldsize < f->sizeupvalues)
			f->upvalues[oldsize++] = ((void *)0);
			f->upvalues[f->nups] = name;
			{ if (((((((GCObject *)((name)))))->gch.marked) & ((((1 << (0)) | (1 << (1)))))) && ((((((GCObject *)((f)))))->gch.marked) & ((1 << (2))))) luaC_barrierf(fs->L, (((GCObject *)((f)))), (((GCObject *)((name))))); };
			fs->upvalues[f->nups].k = ((lu_byte)((v->k)));
			fs->upvalues[f->nups].info = ((lu_byte)((v->u.s.info)));
			return f->nups++;
}
static int searchvar(FuncState *fs, TString *n)
{
			int i;
			for (i = fs->nactvar - 1; i >= 0; i--) {
			if (n == ((fs)->f->locvars[(fs)->actvar[i]]).varname)
			return i;
			}
			return -1;
}
static void markupval(FuncState *fs, int level)
{
			BlockCnt *bl = fs->bl;
			while (bl && bl->nactvar > level)
			bl = bl->previous;
			if (bl)
			bl->upval = 1;
}
static int singlevaraux(FuncState *fs, TString *n, expdesc *var, int base)
{
			if (fs == ((void *)0)) {
			init_exp(var, VGLOBAL, ((1 << 8) - 1));
			return VGLOBAL;
			} else {
			int v = searchvar(fs, n);
			if (v >= 0) {
			init_exp(var, VLOCAL, v);
			if (!base)
			markupval(fs, v);
			return VLOCAL;
			} else {
			if (singlevaraux(fs->prev, n, var, 0) == VGLOBAL)
			return VGLOBAL;
			var->u.s.info = indexupvalue(fs, n, var);
			var->k = VUPVAL;
			return VUPVAL;
			}
			}
}
static void singlevar(LexState *ls, expdesc *var)
{
			TString *varname = str_checkname(ls);
			FuncState *fs = ls->fs;
			if (singlevaraux(fs, varname, var, 1) == VGLOBAL)
			var->u.s.info = luaK_stringK(fs, varname);
}
static void adjust_assign(LexState *ls, int nvars, int nexps, expdesc *e)
{
			FuncState *fs = ls->fs;
			int extra = nvars - nexps;
			if (((e->k) == VCALL || (e->k) == VVARARG)) {
			extra++;
			if (extra < 0)
			extra = 0;
			luaK_setreturns(fs, e, extra);
			if (extra > 1)
			luaK_reserveregs(fs, extra - 1);
			} else {
			if (e->k != VVOID)
			luaK_exp2nextreg(fs, e);
			if (extra > 0) {
			int reg = fs->freereg;
			luaK_reserveregs(fs, extra);
			luaK_nil(fs, reg, extra);
			}
			}
}
static void enterlevel(LexState *ls)
{
			if (++ls->L->nCcalls > 200)
			luaX_lexerror(ls, "chunk has too many syntax levels", 0);
}
static void enterblock(FuncState *fs, BlockCnt *bl, lu_byte isbreakable)
{
			bl->breaklist = (-1);
			bl->isbreakable = isbreakable;
			bl->nactvar = fs->nactvar;
			bl->upval = 0;
			bl->previous = fs->bl;
			fs->bl = bl;
}
static void leaveblock(FuncState *fs)
{
			BlockCnt *bl = fs->bl;
			fs->bl = bl->previous;
			removevars(fs->ls, bl->nactvar);
			if (bl->upval)
			luaK_codeABC(fs, OP_CLOSE, bl->nactvar, 0, 0);
			fs->freereg = fs->nactvar;
			luaK_patchtohere(fs, bl->breaklist);
}
static void pushclosure(LexState *ls, FuncState *func, expdesc *v)
{
			FuncState *fs = ls->fs;
			Proto *f = fs->f;
			int oldsize = f->sizep;
			int i;
			if ((fs->np) + 1 > (f->sizep)) ((f->p) = ((Proto * *)(luaM_growaux_(ls->L, f->p, &(f->sizep), sizeof(Proto *), ((1 << (9 + 9)) - 1), "constant table overflow"))));
			while (oldsize < f->sizep)
			f->p[oldsize++] = ((void *)0);
			f->p[fs->np++] = func->f;
			{ if (((((((GCObject *)((func->f)))))->gch.marked) & ((((1 << (0)) | (1 << (1)))))) && ((((((GCObject *)((f)))))->gch.marked) & ((1 << (2))))) luaC_barrierf(ls->L, (((GCObject *)((f)))), (((GCObject *)((func->f))))); };
			init_exp(v, VRELOCABLE, luaK_codeABx(fs, OP_CLOSURE, 0, fs->np - 1));
			for (i = 0; i < func->f->nups; i++) {
			OpCode o =
			(func->upvalues[i].k == VLOCAL) ? OP_MOVE : OP_GETUPVAL;
			luaK_codeABC(fs, o, 0, func->upvalues[i].info, 0);
			}
}
static void open_func(LexState *ls, FuncState *fs)
{
			lua_State *L = ls->L;
			Proto *f = luaF_newproto(L);
			fs->f = f;
			fs->prev = ls->fs;
			fs->ls = ls;
			fs->L = L;
			ls->fs = fs;
			fs->pc = 0;
			fs->lasttarget = -1;
			fs->jpc = (-1);
			fs->freereg = 0;
			fs->nk = 0;
			fs->np = 0;
			fs->nlocvars = 0;
			fs->nactvar = 0;
			fs->bl = ((void *)0);
			f->source = ls->source;
			f->maxstacksize = 2;
			fs->h = luaH_new(L, 0, 0);
			{ TValue *i_o = (L->top); i_o->value.gc = ((GCObject *)((fs->h))); i_o->tt = 5;; };
			{ if ((char *)L->stack_last - (char *)L->top <= (1) * (int)sizeof(TValue)) luaD_growstack(L, 1); else ((void)0);; L->top++; };
			{ TValue *i_o = (L->top); i_o->value.gc = ((GCObject *)((f))); i_o->tt = (8 + 1);; };
			{ if ((char *)L->stack_last - (char *)L->top <= (1) * (int)sizeof(TValue)) luaD_growstack(L, 1); else ((void)0);; L->top++; };
}
static void close_func(LexState *ls)
{
			lua_State *L = ls->L;
			FuncState *fs = ls->fs;
			Proto *f = fs->f;
			removevars(ls, 0);
			luaK_ret(fs, 0, 0);
			((f->code) = ((Instruction *)(((((size_t)((fs->pc) + 1)) <= ((size_t)(~(size_t)0) - 2) / (sizeof(Instruction))) ? luaM_realloc_(L, (f->code), (f->sizecode) * (sizeof(Instruction)), (fs->pc) * (sizeof(Instruction))) : luaM_toobig(L)))));
			f->sizecode = fs->pc;
			((f->lineinfo) = ((int *)(((((size_t)((fs->pc) + 1)) <= ((size_t)(~(size_t)0) - 2) / (sizeof(int))) ? luaM_realloc_(L, (f->lineinfo), (f->sizelineinfo) * (sizeof(int)), (fs->pc) * (sizeof(int))) : luaM_toobig(L)))));
			f->sizelineinfo = fs->pc;
			((f->k) = ((TValue *)(((((size_t)((fs->nk) + 1)) <= ((size_t)(~(size_t)0) - 2) / (sizeof(TValue))) ? luaM_realloc_(L, (f->k), (f->sizek) * (sizeof(TValue)), (fs->nk) * (sizeof(TValue))) : luaM_toobig(L)))));
			f->sizek = fs->nk;
			((f->p) = ((Proto * *)(((((size_t)((fs->np) + 1)) <= ((size_t)(~(size_t)0) - 2) / (sizeof(Proto *))) ? luaM_realloc_(L, (f->p), (f->sizep) * (sizeof(Proto *)), (fs->np) * (sizeof(Proto *))) : luaM_toobig(L)))));
			f->sizep = fs->np;
			((f->locvars) = ((LocVar *)(((((size_t)((fs->nlocvars) + 1)) <= ((size_t)(~(size_t)0) - 2) / (sizeof(LocVar))) ? luaM_realloc_(L, (f->locvars), (f->sizelocvars) * (sizeof(LocVar)), (fs->nlocvars) * (sizeof(LocVar))) : luaM_toobig(L)))));
			f->sizelocvars = fs->nlocvars;
			((f->upvalues) = ((TString * *)(((((size_t)((f->nups) + 1)) <= ((size_t)(~(size_t)0) - 2) / (sizeof(TString *))) ? luaM_realloc_(L, (f->upvalues), (f->sizeupvalues) * (sizeof(TString *)), (f->nups) * (sizeof(TString *))) : luaM_toobig(L)))));
			f->sizeupvalues = f->nups;
			ls->fs = fs->prev;
			if (fs)
			anchor_token(ls);
			L->top -= 2;
}
static Proto *luaY_parser(lua_State *L, ZIO *z, Mbuffer *buff, const char *name)
{
			struct LexState lexstate;
			struct FuncState funcstate;
			lexstate.buff = buff;
			luaX_setinput(L, &lexstate, z, (luaS_newlstr(L, name, strlen(name))));
			open_func(&lexstate, &funcstate);
			funcstate.f->is_vararg = 2;
			luaX_next(&lexstate);
			chunk(&lexstate);
			check(&lexstate, TK_EOS);
			close_func(&lexstate);
			return funcstate.f;
}
static void field(LexState *ls, expdesc *v)
{
			FuncState *fs = ls->fs;
			expdesc key;
			luaK_exp2anyreg(fs, v);
			luaX_next(ls);
			checkname(ls, &key);
			luaK_indexed(fs, v, &key);
}
static void yindex(LexState *ls, expdesc *v)
{
			luaX_next(ls);
			expr(ls, v);
			luaK_exp2val(ls->fs, v);
			checknext(ls, ']');
}
struct ConsControl {
			expdesc v;
			expdesc *t;
			int nh;
			int na;
			int tostore;
};
static void recfield(LexState *ls, struct ConsControl *cc)
{
			FuncState *fs = ls->fs;
			int reg = ls->fs->freereg;
			expdesc key, val;
			int rkkey;
			if (ls->t.token == TK_NAME) {
			if ((cc->nh) > ((0x7fffffff - 2))) errorlimit(fs, (0x7fffffff - 2), "items in a constructor");
			checkname(ls, &key);
			} else
			yindex(ls, &key);
			cc->nh++;
			checknext(ls, '=');
			rkkey = luaK_exp2RK(fs, &key);
			expr(ls, &val);
			luaK_codeABC(fs, OP_SETTABLE, cc->t->u.s.info, rkkey,
			luaK_exp2RK(fs, &val));
			fs->freereg = reg;
}
static void closelistfield(FuncState *fs, struct ConsControl *cc)
{
			if (cc->v.k == VVOID)
			return;
			luaK_exp2nextreg(fs, &cc->v);
			cc->v.k = VVOID;
			if (cc->tostore == 50) {
			luaK_setlist(fs, cc->t->u.s.info, cc->na, cc->tostore);
			cc->tostore = 0;
			}
}
static void lastlistfield(FuncState *fs, struct ConsControl *cc)
{
			if (cc->tostore == 0)
			return;
			if (((cc->v.k) == VCALL || (cc->v.k) == VVARARG)) {
			luaK_setreturns(fs, &cc->v, (-1));
			luaK_setlist(fs, cc->t->u.s.info, cc->na, (-1));
			cc->na--;
			} else {
			if (cc->v.k != VVOID)
			luaK_exp2nextreg(fs, &cc->v);
			luaK_setlist(fs, cc->t->u.s.info, cc->na, cc->tostore);
			}
}
static void listfield(LexState *ls, struct ConsControl *cc)
{
			expr(ls, &cc->v);
			if ((cc->na) > ((0x7fffffff - 2))) errorlimit(ls->fs, (0x7fffffff - 2), "items in a constructor");
			cc->na++;
			cc->tostore++;
}
static void constructor(LexState *ls, expdesc *t)
{
			FuncState *fs = ls->fs;
			int line = ls->linenumber;
			int pc = luaK_codeABC(fs, OP_NEWTABLE, 0, 0, 0);
			struct ConsControl cc;
			cc.na = cc.nh = cc.tostore = 0;
			cc.t = t;
			init_exp(t, VRELOCABLE, pc);
			init_exp(&cc.v, VVOID, 0);
			luaK_exp2nextreg(ls->fs, t);
			checknext(ls, '{');
			do {
			if (ls->t.token == '}')
			break;
			closelistfield(fs, &cc);
			switch (ls->t.token) {
			case TK_NAME: {
			luaX_lookahead(ls);
			if (ls->lookahead.token != '=')
			listfield(ls, &cc);
			else
			recfield(ls, &cc);
			break;
			}
			case '[': {
			recfield(ls, &cc);
			break;
			}
			default: {
			listfield(ls, &cc);
			break;
			}
			}
			} while (testnext(ls, ',') || testnext(ls, ';'));
			check_match(ls, '}', '{', line);
			lastlistfield(fs, &cc);
			((fs->f->code[pc]) = (((fs->f->code[pc])&(~((~((~(Instruction)0) << 9)) << (((0 + 6) + 8) + 9)))) | ((((Instruction)(luaO_int2fb(cc.na))) << (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << (((0 + 6) + 8) + 9)))));
			((fs->f->code[pc]) = (((fs->f->code[pc])&(~((~((~(Instruction)0) << 9)) << ((0 + 6) + 8)))) | ((((Instruction)(luaO_int2fb(cc.nh))) << ((0 + 6) + 8)) & ((~((~(Instruction)0) << 9)) << ((0 + 6) + 8)))));
}
static void parlist(LexState *ls)
{
			FuncState *fs = ls->fs;
			Proto *f = fs->f;
			int nparams = 0;
			f->is_vararg = 0;
			if (ls->t.token != ')') {
			do {
			switch (ls->t.token) {
			case TK_NAME: {
			new_localvar(ls, str_checkname(ls), nparams++);
			break;
			}
			case TK_DOTS: {
			luaX_next(ls);
			f->is_vararg |= 2;
			break;
			}
			default:
			luaX_syntaxerror(
			ls, "<name> or " "'" "..." "'" " expected");
			}
			} while (!f->is_vararg && testnext(ls, ','));
			}
			adjustlocalvars(ls, nparams);
			f->numparams = ((lu_byte)((fs->nactvar - (f->is_vararg & 1))));
			luaK_reserveregs(fs, fs->nactvar);
}
static void body(LexState *ls, expdesc *e, int needself, int line)
{
			FuncState new_fs;
			open_func(ls, &new_fs);
			new_fs.f->linedefined = line;
			checknext(ls, '(');
			if (needself) {
			new_localvar( ls, luaX_newstring(ls, "" "self", (sizeof("self") / sizeof(char)) - 1), 0);
			adjustlocalvars(ls, 1);
			}
			parlist(ls);
			checknext(ls, ')');
			chunk(ls);
			new_fs.f->lastlinedefined = ls->linenumber;
			check_match(ls, TK_END, TK_FUNCTION, line);
			close_func(ls);
			pushclosure(ls, &new_fs, e);
}
static int explist1(LexState *ls, expdesc *v)
{
			int n = 1;
			expr(ls, v);
			while (testnext(ls, ',')) {
			luaK_exp2nextreg(ls->fs, v);
			expr(ls, v);
			n++;
			}
			return n;
}
static void funcargs(LexState *ls, expdesc *f)
{
			FuncState *fs = ls->fs;
			expdesc args;
			int base, nparams;
			int line = ls->linenumber;
			switch (ls->t.token) {
			case '(': {
			if (line != ls->lastline)
			luaX_syntaxerror(
			ls,
			"ambiguous syntax (function call x new statement)");
			luaX_next(ls);
			if (ls->t.token == ')')
			args.k = VVOID;
			else {
			explist1(ls, &args);
			luaK_setreturns(fs, &args, (-1));
			}
			check_match(ls, ')', '(', line);
			break;
			}
			case '{': {
			constructor(ls, &args);
			break;
			}
			case TK_STRING: {
			codestring(ls, &args, ls->t.seminfo.ts);
			luaX_next(ls);
			break;
			}
			default: {
			luaX_syntaxerror(ls, "function arguments expected");
			return;
			}
			}
			base = f->u.s.info;
			if (((args.k) == VCALL || (args.k) == VVARARG))
			nparams = (-1);
			else {
			if (args.k != VVOID)
			luaK_exp2nextreg(fs, &args);
			nparams = fs->freereg - (base + 1);
			}
			init_exp(f, VCALL, luaK_codeABC(fs, OP_CALL, base, nparams + 1, 2));
			luaK_fixline(fs, line);
			fs->freereg = base + 1;
}
static void prefixexp(LexState *ls, expdesc *v)
{
			switch (ls->t.token) {
			case '(': {
			int line = ls->linenumber;
			luaX_next(ls);
			expr(ls, v);
			check_match(ls, ')', '(', line);
			luaK_dischargevars(ls->fs, v);
			return;
			}
			case TK_NAME: {
			singlevar(ls, v);
			return;
			}
			default: {
			luaX_syntaxerror(ls, "unexpected symbol");
			return;
			}
			}
}
static void primaryexp(LexState *ls, expdesc *v)
{
			FuncState *fs = ls->fs;
			prefixexp(ls, v);
			for (;;) {
			switch (ls->t.token) {
			case '.': {
			field(ls, v);
			break;
			}
			case '[': {
			expdesc key;
			luaK_exp2anyreg(fs, v);
			yindex(ls, &key);
			luaK_indexed(fs, v, &key);
			break;
			}
			case ':': {
			expdesc key;
			luaX_next(ls);
			checkname(ls, &key);
			luaK_self(fs, v, &key);
			funcargs(ls, v);
			break;
			}
			case '(':
			case TK_STRING:
			case '{': {
			luaK_exp2nextreg(fs, v);
			funcargs(ls, v);
			break;
			}
			default:
			return;
			}
			}
}
static void simpleexp(LexState *ls, expdesc *v)
{
			switch (ls->t.token) {
			case TK_NUMBER: {
			init_exp(v, VKNUM, 0);
			v->u.nval = ls->t.seminfo.r;
			break;
			}
			case TK_STRING: {
			codestring(ls, v, ls->t.seminfo.ts);
			break;
			}
			case TK_NIL: {
			init_exp(v, VNIL, 0);
			break;
			}
			case TK_TRUE: {
			init_exp(v, VTRUE, 0);
			break;
			}
			case TK_FALSE: {
			init_exp(v, VFALSE, 0);
			break;
			}
			case TK_DOTS: {
			FuncState *fs = ls->fs;
			{ if (!(fs->f->is_vararg)) luaX_syntaxerror(ls, "cannot use " "'" "..." "'" " outside a vararg function"); };
			fs->f->is_vararg &= ~4;
			init_exp(v, VVARARG, luaK_codeABC(fs, OP_VARARG, 0, 1, 0));
			break;
			}
			case '{': {
			constructor(ls, v);
			return;
			}
			case TK_FUNCTION: {
			luaX_next(ls);
			body(ls, v, 0, ls->linenumber);
			return;
			}
			default: {
			primaryexp(ls, v);
			return;
			}
			}
			luaX_next(ls);
}
static UnOpr getunopr(int op)
{
			switch (op) {
			case TK_NOT:
			return OPR_NOT;
			case '-':
			return OPR_MINUS;
			case '#':
			return OPR_LEN;
			default:
			return OPR_NOUNOPR;
			}
}
static BinOpr getbinopr(int op)
{
			switch (op) {
			case '+':
			return OPR_ADD;
			case '-':
			return OPR_SUB;
			case '*':
			return OPR_MUL;
			case '/':
			return OPR_DIV;
			case '%':
			return OPR_MOD;
			case '^':
			return OPR_POW;
			case TK_CONCAT:
			return OPR_CONCAT;
			case TK_NE:
			return OPR_NE;
			case TK_EQ:
			return OPR_EQ;
			case '<':
			return OPR_LT;
			case TK_LE:
			return OPR_LE;
			case '>':
			return OPR_GT;
			case TK_GE:
			return OPR_GE;
			case TK_AND:
			return OPR_AND;
			case TK_OR:
			return OPR_OR;
			default:
			return OPR_NOBINOPR;
			}
}
static struct {
			lu_byte left;
			lu_byte right;
} priority[15];
static BinOpr subexpr(LexState *ls, expdesc *v, unsigned int limit)
{
			BinOpr op;
			UnOpr uop;
			enterlevel(ls);
			uop = getunopr(ls->t.token);
			if (uop != OPR_NOUNOPR) {
			luaX_next(ls);
			subexpr(ls, v, 8);
			luaK_prefix(ls->fs, uop, v);
			} else
			simpleexp(ls, v);
			op = getbinopr(ls->t.token);
			while (op != OPR_NOBINOPR && priority[op].left > limit) {
			expdesc v2;
			BinOpr nextop;
			luaX_next(ls);
			luaK_infix(ls->fs, op, v);
			nextop = subexpr(ls, &v2, priority[op].right);
			luaK_posfix(ls->fs, op, v, &v2);
			op = nextop;
			}
			((ls)->L->nCcalls--);
			return op;
}
static void expr(LexState *ls, expdesc *v) { subexpr(ls, v, 0); }
static int block_follow(int token)
{
			switch (token) {
			case TK_ELSE:
			case TK_ELSEIF:
			case TK_END:
			case TK_UNTIL:
			case TK_EOS:
			return 1;
			default:
			return 0;
			}
}
static void block(LexState *ls)
{
			FuncState *fs = ls->fs;
			BlockCnt bl;
			enterblock(fs, &bl, 0);
			chunk(ls);
			leaveblock(fs);
}
struct LHS_assign {
			struct LHS_assign *prev;
			expdesc v;
};
static void check_conflict(LexState *ls, struct LHS_assign *lh, expdesc *v)
{
			FuncState *fs = ls->fs;
			int extra = fs->freereg;
			int conflict = 0;
			for (; lh; lh = lh->prev) {
			if (lh->v.k == VINDEXED) {
			if (lh->v.u.s.info == v->u.s.info) {
			conflict = 1;
			lh->v.u.s.info = extra;
			}
			if (lh->v.u.s.aux == v->u.s.info) {
			conflict = 1;
			lh->v.u.s.aux = extra;
			}
			}
			}
			if (conflict) {
			luaK_codeABC(fs, OP_MOVE, fs->freereg, v->u.s.info, 0);
			luaK_reserveregs(fs, 1);
			}
}
static void assignment(LexState *ls, struct LHS_assign *lh, int nvars)
{
			expdesc e;
			{ if (!(VLOCAL <= lh->v.k && lh->v.k <= VINDEXED)) luaX_syntaxerror(ls, "syntax error"); };
			if (testnext(ls, ',')) {
			struct LHS_assign nv;
			nv.prev = lh;
			primaryexp(ls, &nv.v);
			if (nv.v.k == VLOCAL)
			check_conflict(ls, lh, &nv.v);
			if ((nvars) > (200 - ls->L->nCcalls)) errorlimit(ls->fs, 200 - ls->L->nCcalls, "variables in assignment");
			assignment(ls, &nv, nvars + 1);
			} else {
			int nexps;
			checknext(ls, '=');
			nexps = explist1(ls, &e);
			if (nexps != nvars) {
			adjust_assign(ls, nvars, nexps, &e);
			if (nexps > nvars)
			ls->fs->freereg -= nexps - nvars;
			} else {
			luaK_setoneret(ls->fs, &e);
			luaK_storevar(ls->fs, &lh->v, &e);
			return;
			}
			}
			init_exp(&e, VNONRELOC, ls->fs->freereg - 1);
			luaK_storevar(ls->fs, &lh->v, &e);
}
static int cond(LexState *ls)
{
			expdesc v;
			expr(ls, &v);
			if (v.k == VNIL)
			v.k = VFALSE;
			luaK_goiftrue(ls->fs, &v);
			return v.f;
}
static void breakstat(LexState *ls)
{
			FuncState *fs = ls->fs;
			BlockCnt *bl = fs->bl;
			int upval = 0;
			while (bl && !bl->isbreakable) {
			upval |= bl->upval;
			bl = bl->previous;
			}
			if (!bl)
			luaX_syntaxerror(ls, "no loop to break");
			if (upval)
			luaK_codeABC(fs, OP_CLOSE, bl->nactvar, 0, 0);
			luaK_concat(fs, &bl->breaklist, luaK_jump(fs));
}
static void whilestat(LexState *ls, int line)
{
			FuncState *fs = ls->fs;
			int whileinit;
			int condexit;
			BlockCnt bl;
			luaX_next(ls);
			whileinit = luaK_getlabel(fs);
			condexit = cond(ls);
			enterblock(fs, &bl, 1);
			checknext(ls, TK_DO);
			block(ls);
			luaK_patchlist(fs, luaK_jump(fs), whileinit);
			check_match(ls, TK_END, TK_WHILE, line);
			leaveblock(fs);
			luaK_patchtohere(fs, condexit);
}
static void repeatstat(LexState *ls, int line)
{
			int condexit;
			FuncState *fs = ls->fs;
			int repeat_init = luaK_getlabel(fs);
			BlockCnt bl1, bl2;
			enterblock(fs, &bl1, 1);
			enterblock(fs, &bl2, 0);
			luaX_next(ls);
			chunk(ls);
			check_match(ls, TK_UNTIL, TK_REPEAT, line);
			condexit = cond(ls);
			if (!bl2.upval) {
			leaveblock(fs);
			luaK_patchlist(ls->fs, condexit, repeat_init);
			} else {
			breakstat(ls);
			luaK_patchtohere(ls->fs, condexit);
			leaveblock(fs);
			luaK_patchlist(ls->fs, luaK_jump(fs), repeat_init);
			}
			leaveblock(fs);
}
static int exp1(LexState *ls)
{
			expdesc e;
			int k;
			expr(ls, &e);
			k = e.k;
			luaK_exp2nextreg(ls->fs, &e);
			return k;
}
static void forbody(LexState *ls, int base, int line, int nvars, int isnum)
{
			BlockCnt bl;
			FuncState *fs = ls->fs;
			int prep, endfor;
			adjustlocalvars(ls, 3);
			checknext(ls, TK_DO);
			prep =
			isnum ? luaK_codeABx(fs, OP_FORPREP, base, ((-1)) + (((1 << (9 + 9)) - 1) >> 1)) : luaK_jump(fs);
			enterblock(fs, &bl, 0);
			adjustlocalvars(ls, nvars);
			luaK_reserveregs(fs, nvars);
			block(ls);
			leaveblock(fs);
			luaK_patchtohere(fs, prep);
			endfor = (isnum) ? luaK_codeABx(fs, OP_FORLOOP, base, ((-1)) + (((1 << (9 + 9)) - 1) >> 1))
			: luaK_codeABC(fs, OP_TFORLOOP, base, 0, nvars);
			luaK_fixline(fs, line);
			luaK_patchlist(fs, (isnum ? endfor : luaK_jump(fs)), prep + 1);
}
static void fornum(LexState *ls, TString *varname, int line)
{
			FuncState *fs = ls->fs;
			int base = fs->freereg;
			new_localvar( ls, luaX_newstring(ls, "" "(for index)", (sizeof("(for index)") / sizeof(char)) - 1), 0);
			new_localvar( ls, luaX_newstring(ls, "" "(for limit)", (sizeof("(for limit)") / sizeof(char)) - 1), 1);
			new_localvar( ls, luaX_newstring(ls, "" "(for step)", (sizeof("(for step)") / sizeof(char)) - 1), 2);
			new_localvar(ls, varname, 3);
			checknext(ls, '=');
			exp1(ls);
			checknext(ls, ',');
			exp1(ls);
			if (testnext(ls, ','))
			exp1(ls);
			else {
			luaK_codeABx(fs, OP_LOADK, fs->freereg, luaK_numberK(fs, 1));
			luaK_reserveregs(fs, 1);
			}
			forbody(ls, base, line, 1, 1);
}
static void forlist(LexState *ls, TString *indexname)
{
			FuncState *fs = ls->fs;
			expdesc e;
			int nvars = 0;
			int line;
			int base = fs->freereg;
			new_localvar( ls, luaX_newstring(ls, "" "(for generator)", (sizeof("(for generator)") / sizeof(char)) - 1), nvars++);
			new_localvar( ls, luaX_newstring(ls, "" "(for state)", (sizeof("(for state)") / sizeof(char)) - 1), nvars++);
			new_localvar( ls, luaX_newstring(ls, "" "(for control)", (sizeof("(for control)") / sizeof(char)) - 1), nvars++);
			new_localvar(ls, indexname, nvars++);
			while (testnext(ls, ','))
			new_localvar(ls, str_checkname(ls), nvars++);
			checknext(ls, TK_IN);
			line = ls->linenumber;
			adjust_assign(ls, 3, explist1(ls, &e), &e);
			luaK_checkstack(fs, 3);
			forbody(ls, base, line, nvars - 3, 0);
}
static void forstat(LexState *ls, int line)
{
			FuncState *fs = ls->fs;
			TString *varname;
			BlockCnt bl;
			enterblock(fs, &bl, 1);
			luaX_next(ls);
			varname = str_checkname(ls);
			switch (ls->t.token) {
			case '=':
			fornum(ls, varname, line);
			break;
			case ',':
			case TK_IN:
			forlist(ls, varname);
			break;
			default:
			luaX_syntaxerror(ls,
			"'" "=" "'" " or " "'" "in" "'" " expected");
			}
			check_match(ls, TK_END, TK_FOR, line);
			leaveblock(fs);
}
static int test_then_block(LexState *ls)
{
			int condexit;
			luaX_next(ls);
			condexit = cond(ls);
			checknext(ls, TK_THEN);
			block(ls);
			return condexit;
}
static void ifstat(LexState *ls, int line)
{
			FuncState *fs = ls->fs;
			int flist;
			int escapelist = (-1);
			flist = test_then_block(ls);
			while (ls->t.token == TK_ELSEIF) {
			luaK_concat(fs, &escapelist, luaK_jump(fs));
			luaK_patchtohere(fs, flist);
			flist = test_then_block(ls);
			}
			if (ls->t.token == TK_ELSE) {
			luaK_concat(fs, &escapelist, luaK_jump(fs));
			luaK_patchtohere(fs, flist);
			luaX_next(ls);
			block(ls);
			} else
			luaK_concat(fs, &escapelist, flist);
			luaK_patchtohere(fs, escapelist);
			check_match(ls, TK_END, TK_IF, line);
}
static void localfunc(LexState *ls)
{
			expdesc v, b;
			FuncState *fs = ls->fs;
			new_localvar(ls, str_checkname(ls), 0);
			init_exp(&v, VLOCAL, fs->freereg);
			luaK_reserveregs(fs, 1);
			adjustlocalvars(ls, 1);
			body(ls, &b, 0, ls->linenumber);
			luaK_storevar(fs, &v, &b);
			((fs)->f->locvars[(fs)->actvar[fs->nactvar - 1]]).startpc = fs->pc;
}
static void localstat(LexState *ls)
{
			int nvars = 0;
			int nexps;
			expdesc e;
			do {
			new_localvar(ls, str_checkname(ls), nvars++);
			} while (testnext(ls, ','));
			if (testnext(ls, '='))
			nexps = explist1(ls, &e);
			else {
			e.k = VVOID;
			nexps = 0;
			}
			adjust_assign(ls, nvars, nexps, &e);
			adjustlocalvars(ls, nvars);
}
static int funcname(LexState *ls, expdesc *v)
{
			int needself = 0;
			singlevar(ls, v);
			while (ls->t.token == '.')
			field(ls, v);
			if (ls->t.token == ':') {
			needself = 1;
			field(ls, v);
			}
			return needself;
}
static void funcstat(LexState *ls, int line)
{
			int needself;
			expdesc v, b;
			luaX_next(ls);
			needself = funcname(ls, &v);
			body(ls, &b, needself, line);
			luaK_storevar(ls->fs, &v, &b);
			luaK_fixline(ls->fs, line);
}
static void exprstat(LexState *ls)
{
			FuncState *fs = ls->fs;
			struct LHS_assign v;
			primaryexp(ls, &v.v);
			if (v.v.k == VCALL)
			((((fs)->f->code[(&v.v)->u.s.info])) = (((((fs)->f->code[(&v.v)->u.s.info]))&(~((~((~(Instruction)0) << 9)) << ((0 + 6) + 8)))) | ((((Instruction)(1)) << ((0 + 6) + 8)) & ((~((~(Instruction)0) << 9)) << ((0 + 6) + 8)))));
			else {
			v.prev = ((void *)0);
			assignment(ls, &v, 1);
			}
}
static void retstat(LexState *ls)
{
			FuncState *fs = ls->fs;
			expdesc e;
			int first, nret;
			luaX_next(ls);
			if (block_follow(ls->t.token) || ls->t.token == ';')
			first = nret = 0;
			else {
			nret = explist1(ls, &e);
			if (((e.k) == VCALL || (e.k) == VVARARG)) {
			luaK_setreturns(fs, &e, (-1));
			if (e.k == VCALL && nret == 1) {
			((((fs)->f->code[(&e)->u.s.info])) = (((((fs)->f->code[(&e)->u.s.info]))&(~((~((~(Instruction)0) << 6)) << 0))) | ((((Instruction)(OP_TAILCALL)) << 0) & ((~((~(Instruction)0) << 6)) << 0))));
			}
			first = fs->nactvar;
			nret = (-1);
			} else {
			if (nret == 1)
			first = luaK_exp2anyreg(fs, &e);
			else {
			luaK_exp2nextreg(fs, &e);
			first = fs->nactvar;
			}
			}
			}
			luaK_ret(fs, first, nret);
}
static int statement(LexState *ls)
{
			int line = ls->linenumber;
			switch (ls->t.token) {
			case TK_IF: {
			ifstat(ls, line);
			return 0;
			}
			case TK_WHILE: {
			whilestat(ls, line);
			return 0;
			}
			case TK_DO: {
			luaX_next(ls);
			block(ls);
			check_match(ls, TK_END, TK_DO, line);
			return 0;
			}
			case TK_FOR: {
			forstat(ls, line);
			return 0;
			}
			case TK_REPEAT: {
			repeatstat(ls, line);
			return 0;
			}
			case TK_FUNCTION: {
			funcstat(ls, line);
			return 0;
			}
			case TK_LOCAL: {
			luaX_next(ls);
			if (testnext(ls, TK_FUNCTION))
			localfunc(ls);
			else
			localstat(ls);
			return 0;
			}
			case TK_RETURN: {
			retstat(ls);
			return 1;
			}
			case TK_BREAK: {
			luaX_next(ls);
			breakstat(ls);
			return 1;
			}
			default: {
			exprstat(ls);
			return 0;
			}
			}
}
static void chunk(LexState *ls)
{
			int islast = 0;
			enterlevel(ls);
			while (!islast && !block_follow(ls->t.token)) {
			islast = statement(ls);
			testnext(ls, ';');
			ls->fs->freereg = ls->fs->nactvar;
			}
			((ls)->L->nCcalls--);
}
static const TValue *luaV_tonumber(const TValue *obj, TValue *n)
{
			lua_Number num;
			if ((((obj)->tt) == 3))
			return obj;
			if ((((obj)->tt) == 4) && luaO_str2d(((const char *)(((&(obj)->value.gc->ts)) + 1)), &num)) {
			{ TValue *i_o = (n); i_o->value.n = (num); i_o->tt = 3; };
			return n;
			} else
			return ((void *)0);
}
static int luaV_tostring(lua_State *L, StkId obj)
{
			if (!(((obj)->tt) == 3))
			return 0;
			else {
			char s[32];
			lua_Number n = ((obj)->value.n);
			sprintf((s), "%.14g", (n));
			{ TValue *i_o = (obj); i_o->value.gc = ((GCObject *)(((luaS_newlstr(L, s, strlen(s)))))); i_o->tt = 4;; };
			return 1;
			}
}
static void callTMres(lua_State *L, StkId res, const TValue *f,
			const TValue *p1, const TValue *p2)
{
			ptrdiff_t result = ((char *)(res) - (char *)L->stack);
			{ const TValue *o2 = (f); TValue *o1 = (L->top); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
			{ const TValue *o2 = (p1); TValue *o1 = (L->top + 1); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
			{ const TValue *o2 = (p2); TValue *o1 = (L->top + 2); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
			if ((char *)L->stack_last - (char *)L->top <= (3) * (int)sizeof(TValue)) luaD_growstack(L, 3); else ((void)0);;
			L->top += 3;
			luaD_call(L, L->top - 3, 1);
			res = ((TValue *)((char *)L->stack + (result)));
			L->top--;
			{ const TValue *o2 = (L->top); TValue *o1 = (res); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
}
static void callTM(lua_State *L, const TValue *f, const TValue *p1,
			const TValue *p2, const TValue *p3)
{
			{ const TValue *o2 = (f); TValue *o1 = (L->top); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
			{ const TValue *o2 = (p1); TValue *o1 = (L->top + 1); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
			{ const TValue *o2 = (p2); TValue *o1 = (L->top + 2); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
			{ const TValue *o2 = (p3); TValue *o1 = (L->top + 3); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
			if ((char *)L->stack_last - (char *)L->top <= (4) * (int)sizeof(TValue)) luaD_growstack(L, 4); else ((void)0);;
			L->top += 4;
			luaD_call(L, L->top - 4, 0);
}
static void luaV_gettable(lua_State *L, const TValue *t, TValue *key, StkId val)
{
			int loop;
			for (loop = 0; loop < 100; loop++) {
			const TValue *tm;
			if ((((t)->tt) == 5)) {
			Table *h = (&(t)->value.gc->h);
			const TValue *res = luaH_get(h, key);
			if (!(((res)->tt) == 0) ||
			(tm = ((h->metatable) == ((void *)0) ? ((void *)0) : ((h->metatable)->flags & (1u << (TM_INDEX))) ? ((void *)0) : luaT_gettm(h->metatable, TM_INDEX, ((L->l_G))->tmname[TM_INDEX]))) == ((void *)0)) {
			{ const TValue *o2 = (res); TValue *o1 = (val); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
			return;
			}
			} else if ((((tm = luaT_gettmbyobj(L, t, TM_INDEX))->tt) == 0))
			luaG_typeerror(L, t, "index");
			if ((((tm)->tt) == 6)) {
			callTMres(L, val, tm, t, key);
			return;
			}
			t = tm;
			}
			luaG_runerror(L, "loop in gettable");
}
static void luaV_settable(lua_State *L, const TValue *t, TValue *key, StkId val)
{
			int loop;
			TValue temp;
			for (loop = 0; loop < 100; loop++) {
			const TValue *tm;
			if ((((t)->tt) == 5)) {
			Table *h = (&(t)->value.gc->h);
			TValue *oldval = luaH_set(L, h, key);
			if (!(((oldval)->tt) == 0) ||
			(tm = ((h->metatable) == ((void *)0) ? ((void *)0) : ((h->metatable)->flags & (1u << (TM_NEWINDEX))) ? ((void *)0) : luaT_gettm(h->metatable, TM_NEWINDEX, ((L->l_G))->tmname[TM_NEWINDEX]))) ==
			((void *)0)) {
			{ const TValue *o2 = (val); TValue *o1 = (oldval); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
			h->flags = 0;
			{ if (((((val)->tt) >= 4) && (((((val)->value.gc))->gch.marked) & ((((1 << (0)) | (1 << (1))))))) && ((((((GCObject *)((h)))))->gch.marked) & ((1 << (2))))) luaC_barrierback(L, h); };
			return;
			}
			} else if ((((tm = luaT_gettmbyobj(L, t, TM_NEWINDEX))->tt) == 0))
			luaG_typeerror(L, t, "index");
			if ((((tm)->tt) == 6)) {
			callTM(L, tm, t, key, val);
			return;
			}
			{ const TValue *o2 = (tm); TValue *o1 = (&temp); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
			t = &temp;
			}
			luaG_runerror(L, "loop in settable");
}
static int call_binTM(lua_State *L, const TValue *p1, const TValue *p2,
			StkId res, TMS event)
{
			const TValue *tm = luaT_gettmbyobj(L, p1, event);
			if ((((tm)->tt) == 0))
			tm = luaT_gettmbyobj(L, p2, event);
			if ((((tm)->tt) == 0))
			return 0;
			callTMres(L, res, tm, p1, p2);
			return 1;
}
static const TValue *get_compTM(lua_State *L, Table *mt1, Table *mt2, TMS event)
{
			const TValue *tm1 = ((mt1) == ((void *)0) ? ((void *)0) : ((mt1)->flags & (1u << (event))) ? ((void *)0) : luaT_gettm(mt1, event, ((L->l_G))->tmname[event]));
			const TValue *tm2;
			if (tm1 == ((void *)0))
			return ((void *)0);
			if (mt1 == mt2)
			return tm1;
			tm2 = ((mt2) == ((void *)0) ? ((void *)0) : ((mt2)->flags & (1u << (event))) ? ((void *)0) : luaT_gettm(mt2, event, ((L->l_G))->tmname[event]));
			if (tm2 == ((void *)0))
			return ((void *)0);
			if (luaO_rawequalObj(tm1, tm2))
			return tm1;
			return ((void *)0);
}
static int call_orderTM(lua_State *L, const TValue *p1, const TValue *p2,
			TMS event)
{
			const TValue *tm1 = luaT_gettmbyobj(L, p1, event);
			const TValue *tm2;
			if ((((tm1)->tt) == 0))
			return -1;
			tm2 = luaT_gettmbyobj(L, p2, event);
			if (!luaO_rawequalObj(tm1, tm2))
			return -1;
			callTMres(L, L->top, tm1, p1, p2);
			return !((((L->top)->tt) == 0) || ((((L->top)->tt) == 1) && ((L->top)->value.b) == 0));
}
static int l_strcmp(const TString *ls, const TString *rs)
{
			const char *l = ((const char *)((ls) + 1));
			size_t ll = ls->tsv.len;
			const char *r = ((const char *)((rs) + 1));
			size_t lr = rs->tsv.len;
			for (;;) {
			int temp = strcoll(l, r);
			if (temp != 0)
			return temp;
			else {
			size_t len = strlen(l);
			if (len == lr)
			return (len == ll) ? 0 : 1;
			else if (len == ll)
			return -1;
			len++;
			l += len;
			ll -= len;
			r += len;
			lr -= len;
			}
			}
}
static int luaV_lessthan(lua_State *L, const TValue *l, const TValue *r)
{
			int res;
			if (((l)->tt) != ((r)->tt))
			return luaG_ordererror(L, l, r);
			else if ((((l)->tt) == 3))
			return ((((l)->value.n)) < (((r)->value.n)));
			else if ((((l)->tt) == 4))
			return l_strcmp((&(l)->value.gc->ts), (&(r)->value.gc->ts)) < 0;
			else if ((res = call_orderTM(L, l, r, TM_LT)) != -1)
			return res;
			return luaG_ordererror(L, l, r);
}
static int lessequal(lua_State *L, const TValue *l, const TValue *r)
{
			int res;
			if (((l)->tt) != ((r)->tt))
			return luaG_ordererror(L, l, r);
			else if ((((l)->tt) == 3))
			return ((((l)->value.n)) <= (((r)->value.n)));
			else if ((((l)->tt) == 4))
			return l_strcmp((&(l)->value.gc->ts), (&(r)->value.gc->ts)) <= 0;
			else if ((res = call_orderTM(L, l, r, TM_LE)) != -1)
			return res;
			else if ((res = call_orderTM(L, r, l, TM_LT)) != -1)
			return !res;
			return luaG_ordererror(L, l, r);
}
static int luaV_equalval(lua_State *L, const TValue *t1, const TValue *t2)
{
			const TValue *tm;
			switch (((t1)->tt)) {
			case 0:
			return 1;
			case 3:
			return ((((t1)->value.n)) == (((t2)->value.n)));
			case 1:
			return ((t1)->value.b) == ((t2)->value.b);
			case 2:
			return ((t1)->value.p) == ((t2)->value.p);
			case 7: {
			if ((&(&(t1)->value.gc->u)->uv) == (&(&(t2)->value.gc->u)->uv))
			return 1;
			tm = get_compTM(L, (&(&(t1)->value.gc->u)->uv)->metatable, (&(&(t2)->value.gc->u)->uv)->metatable,
			TM_EQ);
			break;
			}
			case 5: {
			if ((&(t1)->value.gc->h) == (&(t2)->value.gc->h))
			return 1;
			tm = get_compTM(L, (&(t1)->value.gc->h)->metatable, (&(t2)->value.gc->h)->metatable,
			TM_EQ);
			break;
			}
			default:
			return ((t1)->value.gc) == ((t2)->value.gc);
			}
			if (tm == ((void *)0))
			return 0;
			callTMres(L, L->top, tm, t1, t2);
			return !((((L->top)->tt) == 0) || ((((L->top)->tt) == 1) && ((L->top)->value.b) == 0));
}
void luaV_concat(lua_State *L, int total, int last)
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
static void Arith(lua_State *L, StkId ra, const TValue *rb, const TValue *rc,
			TMS op)
{
			TValue tempb, tempc;
			const TValue *b, *c;
			if ((b = luaV_tonumber(rb, &tempb)) != ((void *)0) &&
			(c = luaV_tonumber(rc, &tempc)) != ((void *)0)) {
			lua_Number nb = ((b)->value.n), nc = ((c)->value.n);
			switch (op) {
			case TM_ADD:
			{ TValue *i_o = (ra); i_o->value.n = (((nb) + (nc))); i_o->tt = 3; };
			break;
			case TM_SUB:
			{ TValue *i_o = (ra); i_o->value.n = (((nb) - (nc))); i_o->tt = 3; };
			break;
			case TM_MUL:
			{ TValue *i_o = (ra); i_o->value.n = (((nb) * (nc))); i_o->tt = 3; };
			break;
			case TM_DIV:
			{ TValue *i_o = (ra); i_o->value.n = (((nb) / (nc))); i_o->tt = 3; };
			break;
			case TM_MOD:
			{ TValue *i_o = (ra); i_o->value.n = (((nb)-floor((nb) / (nc)) * (nc))); i_o->tt = 3; };
			break;
			case TM_POW:
			{ TValue *i_o = (ra); i_o->value.n = ((pow(nb, nc))); i_o->tt = 3; };
			break;
			case TM_UNM:
			{ TValue *i_o = (ra); i_o->value.n = ((-(nb))); i_o->tt = 3; };
			break;
			default:
			break;
			}
			} else if (!call_binTM(L, rb, rc, ra, op))
			luaG_aritherror(L, rb, rc);
}
static void luaV_execute(lua_State *L, int nexeccalls)
{
			LClosure *cl;
			StkId base;
			TValue *k;
			const Instruction *pc;
reentry:
			pc = L->savedpc;
			cl = &(&(L->ci->func)->value.gc->cl)->l;
			base = L->base;
			k = cl->p->k;
			for (;;) {
			const Instruction i = *pc++;
			StkId ra;
			ra = (base + (((int)(((i) >> (0 + 6)) & ((~((~(Instruction)0) << 8)) << 0)))));
			switch ((((OpCode)(((i) >> 0) & ((~((~(Instruction)0) << 6)) << 0))))) {
			case OP_MOVE: {
			{ const TValue *o2 = ((base + (((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0)))))); TValue *o1 = (ra); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
			continue;
			}
			case OP_LOADK: {
			{ const TValue *o2 = ((k + (((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << (9 + 9))) << 0)))))); TValue *o1 = (ra); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
			continue;
			}
			case OP_LOADBOOL: {
			{ TValue *i_o = (ra); i_o->value.b = ((((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0))))); i_o->tt = 1; };
			if ((((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << 9)) << 0)))))
			pc++;
			continue;
			}
			case OP_LOADNIL: {
			TValue *rb = (base + (((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0)))));
			do {
			((rb--)->tt = 0);
			} while (rb >= ra);
			continue;
			}
			case OP_GETUPVAL: {
			int b = (((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0))));
			{ const TValue *o2 = (cl->upvals[b]->v); TValue *o1 = (ra); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
			continue;
			}
			case OP_GETGLOBAL: {
			TValue g;
			TValue *rb = (k + (((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << (9 + 9))) << 0)))));
			{ TValue *i_o = (&g); i_o->value.gc = ((GCObject *)((cl->env))); i_o->tt = 5;; };
			{ L->savedpc = pc; { luaV_gettable(L, &g, rb, ra); }; base = L->base; };
			continue;
			}
			case OP_GETTABLE: {
			{ L->savedpc = pc; { luaV_gettable(L, (base + (((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0))))), ((((((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << 9)) << 0))))) & (1 << (9 - 1))) ? k + ((int)((((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << 9)) << 0))))) & ~(1 << (9 - 1))) : base + (((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << 9)) << 0))))), ra); }; base = L->base; };
			continue;
			}
			case OP_SETGLOBAL: {
			TValue g;
			{ TValue *i_o = (&g); i_o->value.gc = ((GCObject *)((cl->env))); i_o->tt = 5;; };
			{ L->savedpc = pc; { luaV_settable(L, &g, (k + (((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << (9 + 9))) << 0))))), ra); }; base = L->base; };
			continue;
			}
			case OP_SETUPVAL: {
			UpVal *uv = cl->upvals[(((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0))))];
			{ const TValue *o2 = (ra); TValue *o1 = (uv->v); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
			{ if (((((ra)->tt) >= 4) && (((((ra)->value.gc))->gch.marked) & ((((1 << (0)) | (1 << (1))))))) && ((((((GCObject *)((uv)))))->gch.marked) & ((1 << (2))))) luaC_barrierf(L, (((GCObject *)((uv)))), ((ra)->value.gc)); };
			continue;
			}
			case OP_SETTABLE: {
			{ L->savedpc = pc; { luaV_settable(L, ra, ((((((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0))))) & (1 << (9 - 1))) ? k + ((int)((((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0))))) & ~(1 << (9 - 1))) : base + (((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0))))), ((((((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << 9)) << 0))))) & (1 << (9 - 1))) ? k + ((int)((((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << 9)) << 0))))) & ~(1 << (9 - 1))) : base + (((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << 9)) << 0)))))); }; base = L->base; };
			continue;
			}
			case OP_NEWTABLE: {
			int b = (((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0))));
			int c = (((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << 9)) << 0))));
			{ TValue *i_o = (ra); i_o->value.gc = ((GCObject *)((luaH_new(L, luaO_fb2int(b), luaO_fb2int(c))))); i_o->tt = 5;; };
			{ L->savedpc = pc; { { ((void)0); if ((L->l_G)->totalbytes >= (L->l_G)->GCthreshold) luaC_step(L); }; }; base = L->base; };
			continue;
			}
			case OP_SELF: {
			StkId rb = (base + (((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0)))));
			{ const TValue *o2 = (rb); TValue *o1 = (ra + 1); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
			{ L->savedpc = pc; { luaV_gettable(L, rb, ((((((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << 9)) << 0))))) & (1 << (9 - 1))) ? k + ((int)((((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << 9)) << 0))))) & ~(1 << (9 - 1))) : base + (((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << 9)) << 0))))), ra); }; base = L->base; };
			continue;
			}
			case OP_ADD: {
			{ TValue *rb = ((((((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0))))) & (1 << (9 - 1))) ? k + ((int)((((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0))))) & ~(1 << (9 - 1))) : base + (((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0))))); TValue *rc = ((((((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << 9)) << 0))))) & (1 << (9 - 1))) ? k + ((int)((((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << 9)) << 0))))) & ~(1 << (9 - 1))) : base + (((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << 9)) << 0))))); if ((((rb)->tt) == 3) && (((rc)->tt) == 3)) { lua_Number nb = ((rb)->value.n), nc = ((rc)->value.n); { TValue *i_o = (ra); i_o->value.n = (((nb) + (nc))); i_o->tt = 3; }; } else { L->savedpc = pc; { Arith(L, ra, rb, rc, TM_ADD); }; base = L->base; }; };
			continue;
			}
			case OP_SUB: {
			{ TValue *rb = ((((((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0))))) & (1 << (9 - 1))) ? k + ((int)((((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0))))) & ~(1 << (9 - 1))) : base + (((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0))))); TValue *rc = ((((((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << 9)) << 0))))) & (1 << (9 - 1))) ? k + ((int)((((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << 9)) << 0))))) & ~(1 << (9 - 1))) : base + (((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << 9)) << 0))))); if ((((rb)->tt) == 3) && (((rc)->tt) == 3)) { lua_Number nb = ((rb)->value.n), nc = ((rc)->value.n); { TValue *i_o = (ra); i_o->value.n = (((nb) - (nc))); i_o->tt = 3; }; } else { L->savedpc = pc; { Arith(L, ra, rb, rc, TM_SUB); }; base = L->base; }; };
			continue;
			}
			case OP_MUL: {
			{ TValue *rb = ((((((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0))))) & (1 << (9 - 1))) ? k + ((int)((((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0))))) & ~(1 << (9 - 1))) : base + (((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0))))); TValue *rc = ((((((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << 9)) << 0))))) & (1 << (9 - 1))) ? k + ((int)((((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << 9)) << 0))))) & ~(1 << (9 - 1))) : base + (((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << 9)) << 0))))); if ((((rb)->tt) == 3) && (((rc)->tt) == 3)) { lua_Number nb = ((rb)->value.n), nc = ((rc)->value.n); { TValue *i_o = (ra); i_o->value.n = (((nb) * (nc))); i_o->tt = 3; }; } else { L->savedpc = pc; { Arith(L, ra, rb, rc, TM_MUL); }; base = L->base; }; };
			continue;
			}
			case OP_DIV: {
			{ TValue *rb = ((((((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0))))) & (1 << (9 - 1))) ? k + ((int)((((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0))))) & ~(1 << (9 - 1))) : base + (((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0))))); TValue *rc = ((((((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << 9)) << 0))))) & (1 << (9 - 1))) ? k + ((int)((((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << 9)) << 0))))) & ~(1 << (9 - 1))) : base + (((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << 9)) << 0))))); if ((((rb)->tt) == 3) && (((rc)->tt) == 3)) { lua_Number nb = ((rb)->value.n), nc = ((rc)->value.n); { TValue *i_o = (ra); i_o->value.n = (((nb) / (nc))); i_o->tt = 3; }; } else { L->savedpc = pc; { Arith(L, ra, rb, rc, TM_DIV); }; base = L->base; }; };
			continue;
			}
			case OP_MOD: {
			{ TValue *rb = ((((((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0))))) & (1 << (9 - 1))) ? k + ((int)((((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0))))) & ~(1 << (9 - 1))) : base + (((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0))))); TValue *rc = ((((((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << 9)) << 0))))) & (1 << (9 - 1))) ? k + ((int)((((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << 9)) << 0))))) & ~(1 << (9 - 1))) : base + (((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << 9)) << 0))))); if ((((rb)->tt) == 3) && (((rc)->tt) == 3)) { lua_Number nb = ((rb)->value.n), nc = ((rc)->value.n); { TValue *i_o = (ra); i_o->value.n = (((nb)-floor((nb) / (nc)) * (nc))); i_o->tt = 3; }; } else { L->savedpc = pc; { Arith(L, ra, rb, rc, TM_MOD); }; base = L->base; }; };
			continue;
			}
			case OP_POW: {
			{ TValue *rb = ((((((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0))))) & (1 << (9 - 1))) ? k + ((int)((((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0))))) & ~(1 << (9 - 1))) : base + (((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0))))); TValue *rc = ((((((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << 9)) << 0))))) & (1 << (9 - 1))) ? k + ((int)((((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << 9)) << 0))))) & ~(1 << (9 - 1))) : base + (((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << 9)) << 0))))); if ((((rb)->tt) == 3) && (((rc)->tt) == 3)) { lua_Number nb = ((rb)->value.n), nc = ((rc)->value.n); { TValue *i_o = (ra); i_o->value.n = ((pow(nb, nc))); i_o->tt = 3; }; } else { L->savedpc = pc; { Arith(L, ra, rb, rc, TM_POW); }; base = L->base; }; };
			continue;
			}
			case OP_UNM: {
			TValue *rb = (base + (((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0)))));
			if ((((rb)->tt) == 3)) {
			lua_Number nb = ((rb)->value.n);
			{ TValue *i_o = (ra); i_o->value.n = ((-(nb))); i_o->tt = 3; };
			} else {
			{ L->savedpc = pc; { Arith(L, ra, rb, rb, TM_UNM); }; base = L->base; };
			}
			continue;
			}
			case OP_NOT: {
			int res = (((((base + (((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0))))))->tt) == 0) || (((((base + (((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0))))))->tt) == 1) && (((base + (((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0))))))->value.b) == 0));
			{ TValue *i_o = (ra); i_o->value.b = (res); i_o->tt = 1; };
			continue;
			}
			case OP_LEN: {
			const TValue *rb = (base + (((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0)))));
			switch (((rb)->tt)) {
			case 5: {
			{ TValue *i_o = (ra); i_o->value.n = (((lua_Number)((luaH_getn((&(rb)->value.gc->h)))))); i_o->tt = 3; };
			break;
			}
			case 4: {
			{ TValue *i_o = (ra); i_o->value.n = (((lua_Number)(((&(&(rb)->value.gc->ts)->tsv)->len)))); i_o->tt = 3; };
			break;
			}
			default: {
			{ L->savedpc = pc; { if (!call_binTM(L, rb, (&luaO_nilobject_),
			ra, TM_LEN))
			luaG_typeerror(L, rb, "get length of");; }; base = L->base; }
			}
			}
			continue;
			}
			case OP_CONCAT: {
			int b = (((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0))));
			int c = (((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << 9)) << 0))));
			{ L->savedpc = pc; { luaV_concat(L, c - b + 1, c); { ((void)0); if ((L->l_G)->totalbytes >= (L->l_G)->GCthreshold) luaC_step(L); }; }; base = L->base; };
			{ const TValue *o2 = (base + b); TValue *o1 = ((base + (((int)(((i) >> (0 + 6)) & ((~((~(Instruction)0) << 8)) << 0)))))); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
			continue;
			}
			case OP_JMP: {
			{ (pc) += (((((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << (9 + 9))) << 0)))) - (((1 << (9 + 9)) - 1) >> 1))); };
			continue;
			}
			case OP_EQ: {
			TValue *rb = ((((((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0))))) & (1 << (9 - 1))) ? k + ((int)((((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0))))) & ~(1 << (9 - 1))) : base + (((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0)))));
			TValue *rc = ((((((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << 9)) << 0))))) & (1 << (9 - 1))) ? k + ((int)((((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << 9)) << 0))))) & ~(1 << (9 - 1))) : base + (((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << 9)) << 0)))));
			{ L->savedpc = pc; { if ((((rb)->tt) == ((rc)->tt) && luaV_equalval(L, rb, rc)) == (((int)(((i) >> (0 + 6)) & ((~((~(Instruction)0) << 8)) << 0)))))
			{ (pc) += (((((int)(((*pc) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << (9 + 9))) << 0)))) - (((1 << (9 + 9)) - 1) >> 1))); };; }; base = L->base; } pc++;
			continue;
			}
			case OP_LT: {
			{ L->savedpc = pc; { if (luaV_lessthan(L, ((((((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0))))) & (1 << (9 - 1))) ? k + ((int)((((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0))))) & ~(1 << (9 - 1))) : base + (((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0))))), ((((((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << 9)) << 0))))) & (1 << (9 - 1))) ? k + ((int)((((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << 9)) << 0))))) & ~(1 << (9 - 1))) : base + (((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << 9)) << 0)))))) == (((int)(((i) >> (0 + 6)) & ((~((~(Instruction)0) << 8)) << 0)))))
			{ (pc) += (((((int)(((*pc) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << (9 + 9))) << 0)))) - (((1 << (9 + 9)) - 1) >> 1))); };; }; base = L->base; } pc++;
			continue;
			}
			case OP_LE: {
			{ L->savedpc = pc; { if (lessequal(L, ((((((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0))))) & (1 << (9 - 1))) ? k + ((int)((((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0))))) & ~(1 << (9 - 1))) : base + (((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0))))), ((((((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << 9)) << 0))))) & (1 << (9 - 1))) ? k + ((int)((((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << 9)) << 0))))) & ~(1 << (9 - 1))) : base + (((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << 9)) << 0)))))) == (((int)(((i) >> (0 + 6)) & ((~((~(Instruction)0) << 8)) << 0)))))
			{ (pc) += (((((int)(((*pc) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << (9 + 9))) << 0)))) - (((1 << (9 + 9)) - 1) >> 1))); };; }; base = L->base; } pc++;
			continue;
			}
			case OP_TEST: {
			if (((((ra)->tt) == 0) || ((((ra)->tt) == 1) && ((ra)->value.b) == 0)) != (((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << 9)) << 0)))))
			{ (pc) += (((((int)(((*pc) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << (9 + 9))) << 0)))) - (((1 << (9 + 9)) - 1) >> 1))); };
			pc++;
			continue;
			}
			case OP_TESTSET: {
			TValue *rb = (base + (((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0)))));
			if (((((rb)->tt) == 0) || ((((rb)->tt) == 1) && ((rb)->value.b) == 0)) != (((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << 9)) << 0))))) {
			{ const TValue *o2 = (rb); TValue *o1 = (ra); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
			{ (pc) += (((((int)(((*pc) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << (9 + 9))) << 0)))) - (((1 << (9 + 9)) - 1) >> 1))); };
			}
			pc++;
			continue;
			}
			case OP_CALL: {
			int b = (((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0))));
			int nresults = (((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << 9)) << 0)))) - 1;
			if (b != 0)
			L->top = ra + b;
			L->savedpc = pc;
			switch (luaD_precall(L, ra, nresults)) {
			case 0: {
			nexeccalls++;
			goto reentry;
			}
			case 1: {
			if (nresults >= 0)
			L->top = L->ci->top;
			base = L->base;
			continue;
			}
			default: {
			return;
			}
			}
			}
			case OP_TAILCALL: {
			int b = (((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0))));
			if (b != 0)
			L->top = ra + b;
			L->savedpc = pc;
			switch (luaD_precall(L, ra, (-1))) {
			case 0: {
			CallInfo *ci = L->ci - 1;
			int aux;
			StkId func = ci->func;
			StkId pfunc = (ci + 1)->func;
			if (L->openupval)
			luaF_close(L, ci->base);
			L->base = ci->base =
			ci->func + ((ci + 1)->base - pfunc);
			for (aux = 0; pfunc + aux < L->top; aux++)
			{ const TValue *o2 = (pfunc + aux); TValue *o1 = (func + aux); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
			ci->top = L->top = func + aux;
			ci->savedpc = L->savedpc;
			ci->tailcalls++;
			L->ci--;
			goto reentry;
			}
			case 1: {
			base = L->base;
			continue;
			}
			default: {
			return;
			}
			}
			}
			case OP_RETURN: {
			int b = (((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0))));
			if (b != 0)
			L->top = ra + b - 1;
			if (L->openupval)
			luaF_close(L, base);
			L->savedpc = pc;
			b = luaD_poscall(L, ra);
			if (--nexeccalls == 0)
			return;
			else {
			if (b)
			L->top = L->ci->top;
			goto reentry;
			}
			}
			case OP_FORLOOP: {
			lua_Number step = ((ra + 2)->value.n);
			lua_Number idx = ((((ra)->value.n)) + (step));
			lua_Number limit = ((ra + 1)->value.n);
			if (((0) < (step)) ? ((idx) <= (limit))
			: ((limit) <= (idx))) {
			{ (pc) += (((((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << (9 + 9))) << 0)))) - (((1 << (9 + 9)) - 1) >> 1))); };
			{ TValue *i_o = (ra); i_o->value.n = (idx); i_o->tt = 3; };
			{ TValue *i_o = (ra + 3); i_o->value.n = (idx); i_o->tt = 3; };
			}
			continue;
			}
			case OP_FORPREP: {
			const TValue *init = ra;
			const TValue *plimit = ra + 1;
			const TValue *pstep = ra + 2;
			L->savedpc = pc;
			if (!(((init)->tt) == 3 || (((init) = luaV_tonumber(init, ra)) != ((void *)0))))
			luaG_runerror(L, "'" "for" "'" " initial value "
			"must be a "
			"number");
			else if (!(((plimit)->tt) == 3 || (((plimit) = luaV_tonumber(plimit, ra + 1)) != ((void *)0))))
			luaG_runerror(
			L, "'" "for" "'" " limit must be a number");
			else if (!(((pstep)->tt) == 3 || (((pstep) = luaV_tonumber(pstep, ra + 2)) != ((void *)0))))
			luaG_runerror(
			L, "'" "for" "'" " step must be a number");
			{ TValue *i_o = (ra); i_o->value.n = (((((ra)->value.n)) - (((pstep)->value.n)))); i_o->tt = 3; };
			{ (pc) += (((((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << (9 + 9))) << 0)))) - (((1 << (9 + 9)) - 1) >> 1))); };
			continue;
			}
			case OP_TFORLOOP: {
			StkId cb = ra + 3;
			{ const TValue *o2 = (ra + 2); TValue *o1 = (cb + 2); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
			{ const TValue *o2 = (ra + 1); TValue *o1 = (cb + 1); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
			{ const TValue *o2 = (ra); TValue *o1 = (cb); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
			L->top = cb + 3;
			{ L->savedpc = pc; { luaD_call(L, cb, (((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << 9)) << 0))))); }; base = L->base; };
			L->top = L->ci->top;
			cb = (base + (((int)(((i) >> (0 + 6)) & ((~((~(Instruction)0) << 8)) << 0))))) + 3;
			if (!(((cb)->tt) == 0)) {
			{ const TValue *o2 = (cb); TValue *o1 = (cb - 1); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
			{ (pc) += (((((int)(((*pc) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << (9 + 9))) << 0)))) - (((1 << (9 + 9)) - 1) >> 1))); };
			}
			pc++;
			continue;
			}
			case OP_SETLIST: {
			int n = (((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0))));
			int c = (((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << 9)) << 0))));
			int last;
			Table *h;
			if (n == 0) {
			n = ((int)((L->top - ra))) - 1;
			L->top = L->ci->top;
			}
			if (c == 0)
			c = ((int)((*pc++)));
			{ if (!((((ra)->tt) == 5))) break; };
			h = (&(ra)->value.gc->h);
			last = ((c - 1) * 50) + n;
			if (last > h->sizearray)
			luaH_resizearray(L, h, last);
			for (; n > 0; n--) {
			TValue *val = ra + n;
			{ const TValue *o2 = (val); TValue *o1 = (luaH_setnum(L, h, last--)); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
			{ if (((((val)->tt) >= 4) && (((((val)->value.gc))->gch.marked) & ((((1 << (0)) | (1 << (1))))))) && ((((((GCObject *)((h)))))->gch.marked) & ((1 << (2))))) luaC_barrierback(L, h); };
			}
			continue;
			}
			case OP_CLOSE: {
			luaF_close(L, ra);
			continue;
			}
			case OP_CLOSURE: {
			Proto *p;
			Closure *ncl;
			int nup, j;
			p = cl->p->p[(((int)(((i) >> ((0 + 6) + 8)) & ((~((~(Instruction)0) << (9 + 9))) << 0))))];
			nup = p->nups;
			ncl = luaF_newLclosure(L, nup, cl->env);
			ncl->l.p = p;
			for (j = 0; j < nup; j++, pc++) {
			if ((((OpCode)(((*pc) >> 0) & ((~((~(Instruction)0) << 6)) << 0)))) == OP_GETUPVAL)
			ncl->l.upvals[j] =
			cl->upvals[(((int)(((*pc) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0))))];
			else {
			ncl->l.upvals[j] = luaF_findupval(
			L, base + (((int)(((*pc) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0)))));
			}
			}
			{ TValue *i_o = (ra); i_o->value.gc = ((GCObject *)((ncl))); i_o->tt = 6;; };
			{ L->savedpc = pc; { { ((void)0); if ((L->l_G)->totalbytes >= (L->l_G)->GCthreshold) luaC_step(L); }; }; base = L->base; };
			continue;
			}
			case OP_VARARG: {
			int b = (((int)(((i) >> (((0 + 6) + 8) + 9)) & ((~((~(Instruction)0) << 9)) << 0)))) - 1;
			int j;
			CallInfo *ci = L->ci;
			int n = ((int)((ci->base - ci->func))) -
			cl->p->numparams - 1;
			if (b == (-1)) {
			{ L->savedpc = pc; { if ((char *)L->stack_last - (char *)L->top <= (n) * (int)sizeof(TValue)) luaD_growstack(L, n); else ((void)0);; }; base = L->base; };
			ra = (base + (((int)(((i) >> (0 + 6)) & ((~((~(Instruction)0) << 8)) << 0)))));
			b = n;
			L->top = ra + n;
			}
			for (j = 0; j < b; j++) {
			if (j < n) {
			{ const TValue *o2 = (ci->base - n + j); TValue *o1 = (ra + j); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
			} else {
			((ra + j)->tt = 0);
			}
			}
			continue;
			}
			}
			}
}
static TValue *index2adr(lua_State *L, int idx)
{
			if (idx > 0) {
			TValue *o = L->base + (idx - 1);
			{ (void)L; };
			if (o >= L->top)
			return ((TValue *)((&luaO_nilobject_)));
			else
			return o;
			} else if (idx > (-10000)) {
			{ (void)L; };
			return L->top + idx;
			} else
			switch (idx) {
			case (-10000):
			return (&(L->l_G)->l_registry);
			case (-10001): {
			Closure *func = ((&(L->ci->func)->value.gc->cl));
			{ TValue *i_o = (&L->env); i_o->value.gc = ((GCObject *)((func->c.env))); i_o->tt = 5;; };
			return &L->env;
			}
			case (-10002):
			return (&L->l_gt);
			default: {
			Closure *func = ((&(L->ci->func)->value.gc->cl));
			idx = (-10002) - idx;
			return (idx <= func->c.nupvalues)
			? &func->c.upvalue[idx - 1]
			: ((TValue *)((&luaO_nilobject_)));
			}
			}
}
static Table *getcurrenv(lua_State *L)
{
			if (L->ci == L->base_ci)
			return (&((&L->l_gt))->value.gc->h);
			else {
			Closure *func = ((&(L->ci->func)->value.gc->cl));
			return func->c.env;
			}
}
static int lua_checkstack(lua_State *L, int size)
{
			int res = 1;
			if (size > 8000 || (L->top - L->base + size) > 8000)
			res = 0;
			else if (size > 0) {
			if ((char *)L->stack_last - (char *)L->top <= (size) * (int)sizeof(TValue)) luaD_growstack(L, size); else ((void)0);;
			if (L->ci->top < L->top + size)
			L->ci->top = L->top + size;
			}
			return res;
}
static lua_CFunction lua_atpanic(lua_State *L, lua_CFunction panicf)
{
			lua_CFunction old;
			old = (L->l_G)->panic;
			(L->l_G)->panic = panicf;
			return old;
}
static int lua_gettop(lua_State *L) { return ((int)((L->top - L->base))); }
static void lua_settop(lua_State *L, int idx)
{
			if (idx >= 0) {
			{ (void)L; };
			while (L->top < L->base + idx)
			((L->top++)->tt = 0);
			L->top = L->base + idx;
			} else {
			{ (void)L; };
			L->top += idx + 1;
			}
}
static void lua_remove(lua_State *L, int idx)
{
			StkId p;
			p = index2adr(L, idx);
			{ (void)L; };
			while (++p < L->top)
			{ const TValue *o2 = (p); TValue *o1 = (p - 1); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
			L->top--;
}
static void lua_insert(lua_State *L, int idx)
{
			StkId p;
			StkId q;
			p = index2adr(L, idx);
			{ (void)L; };
			for (q = L->top; q > p; q--)
			{ const TValue *o2 = (q - 1); TValue *o1 = (q); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
			{ const TValue *o2 = (L->top); TValue *o1 = (p); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
}
static void lua_replace(lua_State *L, int idx)
{
			StkId o;
			if (idx == (-10001) && L->ci == L->base_ci)
			luaG_runerror(L, "no calling environment");
			{ (void)L; };
			o = index2adr(L, idx);
			{ (void)L; };
			if (idx == (-10001)) {
			Closure *func = ((&(L->ci->func)->value.gc->cl));
			{ (void)L; };
			func->c.env = (&(L->top - 1)->value.gc->h);
			{ if (((((L->top - 1)->tt) >= 4) && (((((L->top - 1)->value.gc))->gch.marked) & ((((1 << (0)) | (1 << (1))))))) && ((((((GCObject *)((func)))))->gch.marked) & ((1 << (2))))) luaC_barrierf(L, (((GCObject *)((func)))), ((L->top - 1)->value.gc)); };
			} else {
			{ const TValue *o2 = (L->top - 1); TValue *o1 = (o); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
			if (idx < (-10002))
			{ if (((((L->top - 1)->tt) >= 4) && (((((L->top - 1)->value.gc))->gch.marked) & ((((1 << (0)) | (1 << (1))))))) && ((((((GCObject *)((((&(L->ci->func)->value.gc->cl)))))))->gch.marked) & ((1 << (2))))) luaC_barrierf(L, (((GCObject *)((((&(L->ci->func)->value.gc->cl)))))), ((L->top - 1)->value.gc)); };
			}
			L->top--;
}
static void lua_pushvalue(lua_State *L, int idx)
{
			{ const TValue *o2 = (index2adr(L, idx)); TValue *o1 = (L->top); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
			{ { (void)L; }; L->top++; };
}
static int lua_type(lua_State *L, int idx)
{
			StkId o = index2adr(L, idx);
			return (o == (&luaO_nilobject_)) ? (-1) : ((o)->tt);
}
static const char *lua_typename(lua_State *L, int t)
{
			((void)(L));
			return (t == (-1)) ? "no value" : luaT_typenames[t];
}
static int lua_iscfunction(lua_State *L, int idx)
{
			StkId o = index2adr(L, idx);
			return (((o)->tt) == 6 && (&(o)->value.gc->cl)->c.isC);
}
static int lua_isnumber(lua_State *L, int idx)
{
			TValue n;
			const TValue *o = index2adr(L, idx);
			return (((o)->tt) == 3 || (((o) = luaV_tonumber(o, &n)) != ((void *)0)));
}
static int lua_isstring(lua_State *L, int idx)
{
			int t = lua_type(L, idx);
			return (t == 4 || t == 3);
}
static int lua_rawequal(lua_State *L, int index1, int index2)
{
			StkId o1 = index2adr(L, index1);
			StkId o2 = index2adr(L, index2);
			return (o1 == (&luaO_nilobject_) || o2 == (&luaO_nilobject_))
			? 0
			: luaO_rawequalObj(o1, o2);
}
static int lua_lessthan(lua_State *L, int index1, int index2)
{
			StkId o1, o2;
			int i;
			o1 = index2adr(L, index1);
			o2 = index2adr(L, index2);
			i = (o1 == (&luaO_nilobject_) || o2 == (&luaO_nilobject_))
			? 0
			: luaV_lessthan(L, o1, o2);
			return i;
}
static lua_Number lua_tonumber(lua_State *L, int idx)
{
			TValue n;
			const TValue *o = index2adr(L, idx);
			if ((((o)->tt) == 3 || (((o) = luaV_tonumber(o, &n)) != ((void *)0))))
			return ((o)->value.n);
			else
			return 0;
}
static lua_Integer lua_tointeger(lua_State *L, int idx)
{
			TValue n;
			const TValue *o = index2adr(L, idx);
			if ((((o)->tt) == 3 || (((o) = luaV_tonumber(o, &n)) != ((void *)0)))) {
			lua_Integer res;
			lua_Number num = ((o)->value.n);
			((res) = (lua_Integer)(num));
			return res;
			} else
			return 0;
}
static int lua_toboolean(lua_State *L, int idx)
{
			const TValue *o = index2adr(L, idx);
			return !((((o)->tt) == 0) || ((((o)->tt) == 1) && ((o)->value.b) == 0));
}
static const char *lua_tolstring(lua_State *L, int idx, size_t *len)
{
			StkId o = index2adr(L, idx);
			if (!(((o)->tt) == 4)) {
			if (!luaV_tostring(L, o)) {
			if (len != ((void *)0))
			*len = 0;
			return ((void *)0);
			}
			{ ((void)0); if ((L->l_G)->totalbytes >= (L->l_G)->GCthreshold) luaC_step(L); };
			o = index2adr(L, idx);
			}
			if (len != ((void *)0))
			*len = (&(&(o)->value.gc->ts)->tsv)->len;
			return ((const char *)(((&(o)->value.gc->ts)) + 1));
}
static size_t lua_objlen(lua_State *L, int idx)
{
			StkId o = index2adr(L, idx);
			switch (((o)->tt)) {
			case 4:
			return (&(&(o)->value.gc->ts)->tsv)->len;
			case 7:
			return (&(&(o)->value.gc->u)->uv)->len;
			case 5:
			return luaH_getn((&(o)->value.gc->h));
			case 3: {
			size_t l;
			l = (luaV_tostring(L, o) ? (&(&(o)->value.gc->ts)->tsv)->len : 0);
			return l;
			}
			default:
			return 0;
			}
}
static lua_CFunction lua_tocfunction(lua_State *L, int idx)
{
			StkId o = index2adr(L, idx);
			return (!(((o)->tt) == 6 && (&(o)->value.gc->cl)->c.isC)) ? ((void *)0) : (&(o)->value.gc->cl)->c.f;
}
static void *lua_touserdata(lua_State *L, int idx)
{
			StkId o = index2adr(L, idx);
			switch (((o)->tt)) {
			case 7:
			return ((&(o)->value.gc->u) + 1);
			case 2:
			return ((o)->value.p);
			default:
			return ((void *)0);
			}
}
static void lua_pushnil(lua_State *L)
{
			((L->top)->tt = 0);
			{ { (void)L; }; L->top++; };
}
static void lua_pushnumber(lua_State *L, lua_Number n)
{
			{ TValue *i_o = (L->top); i_o->value.n = (n); i_o->tt = 3; };
			{ { (void)L; }; L->top++; };
}
static void lua_pushinteger(lua_State *L, lua_Integer n)
{
			{ TValue *i_o = (L->top); i_o->value.n = (((lua_Number)((n)))); i_o->tt = 3; };
			{ { (void)L; }; L->top++; };
}
static void lua_pushlstring(lua_State *L, const char *s, size_t len)
{
			{ ((void)0); if ((L->l_G)->totalbytes >= (L->l_G)->GCthreshold) luaC_step(L); };
			{ TValue *i_o = (L->top); i_o->value.gc = ((GCObject *)((luaS_newlstr(L, s, len)))); i_o->tt = 4;; };
			{ { (void)L; }; L->top++; };
}
static void lua_pushstring(lua_State *L, const char *s)
{
			if (s == ((void *)0))
			lua_pushnil(L);
			else
			lua_pushlstring(L, s, strlen(s));
}
static void lua_pushcclosure(lua_State *L, lua_CFunction fn, int n)
{
			Closure *cl;
			{ ((void)0); if ((L->l_G)->totalbytes >= (L->l_G)->GCthreshold) luaC_step(L); };
			{ (void)L; };
			cl = luaF_newCclosure(L, n, getcurrenv(L));
			cl->c.f = fn;
			L->top -= n;
			while (n--)
			{ const TValue *o2 = (L->top + n); TValue *o1 = (&cl->c.upvalue[n]); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
			{ TValue *i_o = (L->top); i_o->value.gc = ((GCObject *)((cl))); i_o->tt = 6;; };
			{ { (void)L; }; L->top++; };
}
static void lua_pushboolean(lua_State *L, int b)
{
			{ TValue *i_o = (L->top); i_o->value.b = ((b != 0)); i_o->tt = 1; };
			{ { (void)L; }; L->top++; };
}
static int lua_pushthread(lua_State *L)
{
			{ TValue *i_o = (L->top); i_o->value.gc = ((GCObject *)((L))); i_o->tt = 8;; };
			{ { (void)L; }; L->top++; };
			return ((L->l_G)->mainthread == L);
}
static void lua_gettable(lua_State *L, int idx)
{
			StkId t;
			t = index2adr(L, idx);
			{ (void)L; };
			luaV_gettable(L, t, L->top - 1, L->top - 1);
}
static void lua_getfield(lua_State *L, int idx, const char *k)
{
			StkId t;
			TValue key;
			t = index2adr(L, idx);
			{ (void)L; };
			{ TValue *i_o = (&key); i_o->value.gc = ((GCObject *)(((luaS_newlstr(L, k, strlen(k)))))); i_o->tt = 4;; };
			luaV_gettable(L, t, &key, L->top);
			{ { (void)L; }; L->top++; };
}
static void lua_rawget(lua_State *L, int idx)
{
			StkId t;
			t = index2adr(L, idx);
			{ (void)L; };
			{ const TValue *o2 = (luaH_get((&(t)->value.gc->h), L->top - 1)); TValue *o1 = (L->top - 1); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
}
static void lua_rawgeti(lua_State *L, int idx, int n)
{
			StkId o;
			o = index2adr(L, idx);
			{ (void)L; };
			{ const TValue *o2 = (luaH_getnum((&(o)->value.gc->h), n)); TValue *o1 = (L->top); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
			{ { (void)L; }; L->top++; };
}
static void lua_createtable(lua_State *L, int narray, int nrec)
{
			{ ((void)0); if ((L->l_G)->totalbytes >= (L->l_G)->GCthreshold) luaC_step(L); };
			{ TValue *i_o = (L->top); i_o->value.gc = ((GCObject *)((luaH_new(L, narray, nrec)))); i_o->tt = 5;; };
			{ { (void)L; }; L->top++; };
}
static int lua_getmetatable(lua_State *L, int objindex)
{
			const TValue *obj;
			Table *mt = ((void *)0);
			int res;
			obj = index2adr(L, objindex);
			switch (((obj)->tt)) {
			case 5:
			mt = (&(obj)->value.gc->h)->metatable;
			break;
			case 7:
			mt = (&(&(obj)->value.gc->u)->uv)->metatable;
			break;
			default:
			mt = (L->l_G)->mt[((obj)->tt)];
			break;
			}
			if (mt == ((void *)0))
			res = 0;
			else {
			{ TValue *i_o = (L->top); i_o->value.gc = ((GCObject *)((mt))); i_o->tt = 5;; };
			{ { (void)L; }; L->top++; };
			res = 1;
			}
			return res;
}
static void lua_getfenv(lua_State *L, int idx)
{
			StkId o;
			o = index2adr(L, idx);
			{ (void)L; };
			switch (((o)->tt)) {
			case 6:
			{ TValue *i_o = (L->top); i_o->value.gc = ((GCObject *)(((&(o)->value.gc->cl)->c.env))); i_o->tt = 5;; };
			break;
			case 7:
			{ TValue *i_o = (L->top); i_o->value.gc = ((GCObject *)(((&(&(o)->value.gc->u)->uv)->env))); i_o->tt = 5;; };
			break;
			case 8:
			{ const TValue *o2 = ((&(&(o)->value.gc->th)->l_gt)); TValue *o1 = (L->top); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
			break;
			default:
			((L->top)->tt = 0);
			break;
			}
			{ { (void)L; }; L->top++; };
}
static void lua_settable(lua_State *L, int idx)
{
			StkId t;
			{ (void)L; };
			t = index2adr(L, idx);
			{ (void)L; };
			luaV_settable(L, t, L->top - 2, L->top - 1);
			L->top -= 2;
}
static void lua_setfield(lua_State *L, int idx, const char *k)
{
			StkId t;
			TValue key;
			{ (void)L; };
			t = index2adr(L, idx);
			{ (void)L; };
			{ TValue *i_o = (&key); i_o->value.gc = ((GCObject *)(((luaS_newlstr(L, k, strlen(k)))))); i_o->tt = 4;; };
			luaV_settable(L, t, &key, L->top - 1);
			L->top--;
}
static void lua_rawset(lua_State *L, int idx)
{
			StkId t;
			{ (void)L; };
			t = index2adr(L, idx);
			{ (void)L; };
			{ const TValue *o2 = (L->top - 1); TValue *o1 = (luaH_set(L, (&(t)->value.gc->h), L->top - 2)); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
			{ if (((((L->top - 1)->tt) >= 4) && (((((L->top - 1)->value.gc))->gch.marked) & ((((1 << (0)) | (1 << (1))))))) && ((((((GCObject *)(((&(t)->value.gc->h))))))->gch.marked) & ((1 << (2))))) luaC_barrierback(L, (&(t)->value.gc->h)); };
			L->top -= 2;
}
static void lua_rawseti(lua_State *L, int idx, int n)
{
			StkId o;
			{ (void)L; };
			o = index2adr(L, idx);
			{ (void)L; };
			{ const TValue *o2 = (L->top - 1); TValue *o1 = (luaH_setnum(L, (&(o)->value.gc->h), n)); o1->value.n = o2->value.n; o1->tt = o2->tt;; };
			{ if (((((L->top - 1)->tt) >= 4) && (((((L->top - 1)->value.gc))->gch.marked) & ((((1 << (0)) | (1 << (1))))))) && ((((((GCObject *)(((&(o)->value.gc->h))))))->gch.marked) & ((1 << (2))))) luaC_barrierback(L, (&(o)->value.gc->h)); };
			L->top--;
}
static int lua_setmetatable(lua_State *L, int objindex)
{
			TValue *obj;
			Table *mt;
			{ (void)L; };
			obj = index2adr(L, objindex);
			{ (void)L; };
			if ((((L->top - 1)->tt) == 0))
			mt = ((void *)0);
			else {
			{ (void)L; };
			mt = (&(L->top - 1)->value.gc->h);
			}
			switch (((obj)->tt)) {
			case 5: {
			(&(obj)->value.gc->h)->metatable = mt;
			if (mt)
			{ if (((((((GCObject *)((mt)))))->gch.marked) & ((((1 << (0)) | (1 << (1)))))) && ((((((GCObject *)(((&(obj)->value.gc->h))))))->gch.marked) & ((1 << (2))))) luaC_barrierback(L, (&(obj)->value.gc->h)); };
			break;
			}
			case 7: {
			(&(&(obj)->value.gc->u)->uv)->metatable = mt;
			if (mt)
			{ if (((((((GCObject *)((mt)))))->gch.marked) & ((((1 << (0)) | (1 << (1)))))) && ((((((GCObject *)(((&(obj)->value.gc->u))))))->gch.marked) & ((1 << (2))))) luaC_barrierf(L, (((GCObject *)(((&(obj)->value.gc->u))))), (((GCObject *)((mt))))); };
			break;
			}
			default: {
			(L->l_G)->mt[((obj)->tt)] = mt;
			break;
			}
			}
			L->top--;
			return 1;
}
static int lua_setfenv(lua_State *L, int idx)
{
			StkId o;
			int res = 1;
			{ (void)L; };
			o = index2adr(L, idx);
			{ (void)L; };
			{ (void)L; };
			switch (((o)->tt)) {
			case 6:
			(&(o)->value.gc->cl)->c.env = (&(L->top - 1)->value.gc->h);
			break;
			case 7:
			(&(&(o)->value.gc->u)->uv)->env = (&(L->top - 1)->value.gc->h);
			break;
			case 8:
			{ TValue *i_o = ((&(&(o)->value.gc->th)->l_gt)); i_o->value.gc = ((GCObject *)(((&(L->top - 1)->value.gc->h)))); i_o->tt = 5;; };
			break;
			default:
			res = 0;
			break;
			}
			if (res)
			{ if (((((((GCObject *)(((&(L->top - 1)->value.gc->h))))))->gch.marked) & ((((1 << (0)) | (1 << (1)))))) && ((((((GCObject *)((((o)->value.gc))))))->gch.marked) & ((1 << (2))))) luaC_barrierf(L, (((GCObject *)((((o)->value.gc))))), (((GCObject *)(((&(L->top - 1)->value.gc->h)))))); };
			L->top--;
			return res;
}
static void lua_call(lua_State *L, int nargs, int nresults)
{
			StkId func;
			{ (void)L; };
			{ (void)L; };
			func = L->top - (nargs + 1);
			luaD_call(L, func, nresults);
			{ if (nresults == (-1) && L->top >= L->ci->top) L->ci->top = L->top; };
}
struct CallS {
			StkId func;
			int nresults;
};
static void f_call(lua_State *L, void *ud)
{
			struct CallS *c = ((struct CallS *)(ud));
			luaD_call(L, c->func, c->nresults);
}
static int lua_pcall(lua_State *L, int nargs, int nresults, int errfunc)
{
			struct CallS c;
			int status;
			ptrdiff_t func;
			{ (void)L; };
			{ (void)L; };
			if (errfunc == 0)
			func = 0;
			else {
			StkId o = index2adr(L, errfunc);
			{ (void)L; };
			func = ((char *)(o) - (char *)L->stack);
			}
			c.func = L->top - (nargs + 1);
			c.nresults = nresults;
			status = luaD_pcall(L, f_call, &c, ((char *)(c.func) - (char *)L->stack), func);
			{ if (nresults == (-1) && L->top >= L->ci->top) L->ci->top = L->top; };
			return status;
}
static int lua_load(lua_State *L, lua_Reader reader, void *data,
			const char *chunkname)
{
			ZIO z;
			int status;
			if (!chunkname)
			chunkname = "?";
			luaZ_init(L, &z, reader, data);
			status = luaD_protectedparser(L, &z, chunkname);
			return status;
}
int lua_error(lua_State *L)
{
			{ (void)L; };
			luaG_errormsg(L);
			return 0;
}
static int lua_next(lua_State *L, int idx)
{
			StkId t;
			int more;
			t = index2adr(L, idx);
			{ (void)L; };
			more = luaH_next(L, (&(t)->value.gc->h), L->top - 1);
			if (more) {
			{ { (void)L; }; L->top++; };
			} else
			L->top -= 1;
			return more;
}
void lua_concat(lua_State *L, int n)
{
			{ (void)L; };
			if (n >= 2) {
			{ ((void)0); if ((L->l_G)->totalbytes >= (L->l_G)->GCthreshold) luaC_step(L); };
			luaV_concat(L, n, ((int)((L->top - L->base))) - 1);
			L->top -= (n - 1);
			} else if (n == 0) {
			{ TValue *i_o = (L->top); i_o->value.gc = ((GCObject *)((luaS_newlstr(L, "", 0)))); i_o->tt = 4;; };
			{ { (void)L; }; L->top++; };
			}
}
static void *lua_newuserdata(lua_State *L, size_t size)
{
			Udata *u;
			{ ((void)0); if ((L->l_G)->totalbytes >= (L->l_G)->GCthreshold) luaC_step(L); };
			u = luaS_newudata(L, size, getcurrenv(L));
			{ TValue *i_o = (L->top); i_o->value.gc = ((GCObject *)((u))); i_o->tt = 7;; };
			{ { (void)L; }; L->top++; };
			return u + 1;
}
typedef struct luaL_Reg {
			const char *name;
			lua_CFunction func;
} luaL_Reg;
static void luaI_openlib(lua_State *L, const char *libname, const luaL_Reg *l,
			int nup);
static int luaL_argerror(lua_State *L, int numarg, const char *extramsg);
static const char *luaL_checklstring(lua_State *L, int numArg, size_t *l);
static const char *luaL_optlstring(lua_State *L, int numArg, const char *def,
			size_t *l);
static lua_Integer luaL_checkinteger(lua_State *L, int numArg);
static lua_Integer luaL_optinteger(lua_State *L, int nArg, lua_Integer def);
static const char *luaL_findtable(lua_State *L, int idx, const char *fname,
			int szhint);
typedef struct luaL_Buffer {
			char *p;
			int lvl;
			lua_State *L;
			char buffer[8192];
} luaL_Buffer;
static char *luaL_prepbuffer(luaL_Buffer *B);
static int luaL_argerror(lua_State *L, int narg, const char *extramsg)
{
			lua_Debug ar;
			if (!lua_getstack(L, 0, &ar))
			return luaL_error(L, "bad argument #%d (%s)", narg, extramsg);
			lua_getinfo(L, "n", &ar);
			if (strcmp(ar.namewhat, "method") == 0) {
			narg--;
			if (narg == 0)
			return luaL_error(
			L, "calling " "'" "%s" "'" " on bad self (%s)",
			ar.name, extramsg);
			}
			if (ar.name == ((void *)0))
			ar.name = "?";
			return luaL_error(L, "bad argument #%d to " "'" "%s" "'" " (%s)", narg,
			ar.name, extramsg);
}
static int luaL_typerror(lua_State *L, int narg, const char *tname)
{
			const char *msg = lua_pushfstring(L, "%s expected, got %s", tname,
			lua_typename(L, lua_type(L, (narg))));
			return luaL_argerror(L, narg, msg);
}
static void tag_error(lua_State *L, int narg, int tag)
{
			luaL_typerror(L, narg, lua_typename(L, tag));
}
void luaL_where(lua_State *L, int level)
{
			lua_Debug ar;
			if (lua_getstack(L, level, &ar)) {
			lua_getinfo(L, "Sl", &ar);
			if (ar.currentline > 0) {
			lua_pushfstring(L, "%s:%d: ", ar.short_src,
			ar.currentline);
			return;
			}
			}
			lua_pushlstring(L, """", (sizeof("") / sizeof(char)) - 1);
}
static int luaL_newmetatable(lua_State *L, const char *tname)
{
			lua_getfield(L, (-10000), tname);
			if (!(lua_type(L, (-1)) == 0))
			return 0;
			lua_settop(L, -(1)-1);
			lua_createtable(L, 0, 0);
			lua_pushvalue(L, -1);
			lua_setfield(L, (-10000), tname);
			return 1;
}
static void *luaL_checkudata(lua_State *L, int ud, const char *tname)
{
			void *p = lua_touserdata(L, ud);
			if (p != ((void *)0)) {
			if (lua_getmetatable(L, ud)) {
			lua_getfield(L, (-10000), tname);
			if (lua_rawequal(L, -1, -2)) {
			lua_settop(L, -(2)-1);
			return p;
			}
			}
			}
			luaL_typerror(L, ud, tname);
			return ((void *)0);
}
static void luaL_checkstack(lua_State *L, int space, const char *mes)
{
			if (!lua_checkstack(L, space))
			luaL_error(L, "stack overflow (%s)", mes);
}
static void luaL_checktype(lua_State *L, int narg, int t)
{
			if (lua_type(L, narg) != t)
			tag_error(L, narg, t);
}
static void luaL_checkany(lua_State *L, int narg)
{
			if (lua_type(L, narg) == (-1))
			luaL_argerror(L, narg, "value expected");
}
static const char *luaL_checklstring(lua_State *L, int narg, size_t *len)
{
			const char *s = lua_tolstring(L, narg, len);
			if (!s)
			tag_error(L, narg, 4);
			return s;
}
static const char *luaL_optlstring(lua_State *L, int narg, const char *def,
			size_t *len)
{
			if ((lua_type(L, (narg)) <= 0)) {
			if (len)
			*len = (def ? strlen(def) : 0);
			return def;
			} else
			return luaL_checklstring(L, narg, len);
}
static lua_Number luaL_checknumber(lua_State *L, int narg)
{
			lua_Number d = lua_tonumber(L, narg);
			if (d == 0 && !lua_isnumber(L, narg))
			tag_error(L, narg, 3);
			return d;
}
static lua_Integer luaL_checkinteger(lua_State *L, int narg)
{
			lua_Integer d = lua_tointeger(L, narg);
			if (d == 0 && !lua_isnumber(L, narg))
			tag_error(L, narg, 3);
			return d;
}
static lua_Integer luaL_optinteger(lua_State *L, int narg, lua_Integer def)
{
			return ((lua_type(L, ((narg))) <= 0) ? (def) : luaL_checkinteger(L, (narg)));
}
static int luaL_getmetafield(lua_State *L, int obj, const char *event)
{
			if (!lua_getmetatable(L, obj))
			return 0;
			lua_pushstring(L, event);
			lua_rawget(L, -2);
			if ((lua_type(L, (-1)) == 0)) {
			lua_settop(L, -(2)-1);
			return 0;
			} else {
			lua_remove(L, -2);
			return 1;
			}
}
static void luaL_register(lua_State *L, const char *libname, const luaL_Reg *l)
{
			luaI_openlib(L, libname, l, 0);
}
static int libsize(const luaL_Reg *l)
{
			int size = 0;
			for (; l->name; l++)
			size++;
			return size;
}
static void luaI_openlib(lua_State *L, const char *libname, const luaL_Reg *l,
			int nup)
{
			if (libname) {
			int size = libsize(l);
			luaL_findtable(L, (-10000), "_LOADED", 1);
			lua_getfield(L, -1, libname);
			if (!(lua_type(L, (-1)) == 5)) {
			lua_settop(L, -(1)-1);
			if (luaL_findtable(L, (-10002), libname, size) != ((void *)0))
			luaL_error(
			L, "name conflict for module " "'" "%s" "'",
			libname);
			lua_pushvalue(L, -1);
			lua_setfield(L, -3, libname);
			}
			lua_remove(L, -2);
			lua_insert(L, -(nup + 1));
			}
			for (; l->name; l++) {
			int i;
			for (i = 0; i < nup; i++)
			lua_pushvalue(L, -nup);
			lua_pushcclosure(L, l->func, nup);
			lua_setfield(L, -(nup + 2), l->name);
			}
			lua_settop(L, -(nup)-1);
}
static const char *luaL_findtable(lua_State *L, int idx, const char *fname,
			int szhint)
{
			const char *e;
			lua_pushvalue(L, idx);
			do {
			e = strchr(fname, '.');
			if (e == ((void *)0))
			e = fname + strlen(fname);
			lua_pushlstring(L, fname, e - fname);
			lua_rawget(L, -2);
			if ((lua_type(L, (-1)) == 0)) {
			lua_settop(L, -(1)-1);
			lua_createtable(L, 0, (*e == '.' ? 1 : szhint));
			lua_pushlstring(L, fname, e - fname);
			lua_pushvalue(L, -2);
			lua_settable(L, -4);
			} else if (!(lua_type(L, (-1)) == 5)) {
			lua_settop(L, -(2)-1);
			return fname;
			}
			lua_remove(L, -2);
			fname = e + 1;
			} while (*e == '.');
			return ((void *)0);
}
static int emptybuffer(luaL_Buffer *B)
{
			size_t l = ((B)->p - (B)->buffer);
			if (l == 0)
			return 0;
			else {
			lua_pushlstring(B->L, B->buffer, l);
			B->p = B->buffer;
			B->lvl++;
			return 1;
			}
}
static void adjuststack(luaL_Buffer *B)
{
			if (B->lvl > 1) {
			lua_State *L = B->L;
			int toget = 1;
			size_t toplen = lua_objlen(L, (-1));
			do {
			size_t l = lua_objlen(L, (-(toget + 1)));
			if (B->lvl - toget + 1 >= (20 / 2) || toplen > l) {
			toplen += l;
			toget++;
			} else
			break;
			} while (toget < B->lvl);
			lua_concat(L, toget);
			B->lvl = B->lvl - toget + 1;
			}
}
static char *luaL_prepbuffer(luaL_Buffer *B)
{
			if (emptybuffer(B))
			adjuststack(B);
			return B->buffer;
}
static void luaL_addlstring(luaL_Buffer *B, const char *s, size_t l)
{
			while (l--)
			((void)((B)->p < ((B)->buffer + 8192) || luaL_prepbuffer(B)), (*(B)->p++ = (char)(*s++)));
}
static void luaL_pushresult(luaL_Buffer *B)
{
			emptybuffer(B);
			lua_concat(B->L, B->lvl);
			B->lvl = 1;
}
static void luaL_addvalue(luaL_Buffer *B)
{
			lua_State *L = B->L;
			size_t vl;
			const char *s = lua_tolstring(L, -1, &vl);
			if (vl <= ((size_t)(8192 - ((B)->p - (B)->buffer)))) {
			memcpy(B->p, s, vl);
			B->p += vl;
			lua_settop(L, -(1)-1);
			} else {
			if (emptybuffer(B))
			lua_insert(L, -2);
			B->lvl++;
			adjuststack(B);
			}
}
static void luaL_buffinit(lua_State *L, luaL_Buffer *B)
{
			B->L = L;
			B->p = B->buffer;
			B->lvl = 0;
}
typedef struct LoadF {
			int extraline;
			FILE *f;
			char buff[8192];
} LoadF;
static const char *getF(lua_State *L, void *ud, size_t *size)
{
			LoadF *lf = (LoadF *)ud;
			(void)L;
			if (lf->extraline) {
			lf->extraline = 0;
			*size = 1;
			return "\n";
			}
			if (feof(lf->f))
			return ((void *)0);
			*size = fread(lf->buff, 1, sizeof(lf->buff), lf->f);
			return (*size > 0) ? lf->buff : ((void *)0);
}
static int errfile(lua_State *L, const char *what, int fnameindex)
{
			const char *serr = strerror((*__errno_location ()));
			const char *filename = lua_tolstring(L, (fnameindex), ((void *)0)) + 1;
			lua_pushfstring(L, "cannot %s %s: %s", what, filename, serr);
			lua_remove(L, fnameindex);
			return (5 + 1);
}
static int luaL_loadfile(lua_State *L, const char *filename)
{
			LoadF lf;
			int status, readstatus;
			int c;
			int fnameindex = lua_gettop(L) + 1;
			lf.extraline = 0;
			if (filename == ((void *)0)) {
			lua_pushlstring(L, """=stdin", (sizeof("=stdin") / sizeof(char)) - 1);
			lf.f = stdin;
			} else {
			lua_pushfstring(L, "@%s", filename);
			lf.f = fopen(filename, "r");
			if (lf.f == ((void *)0))
			return errfile(L, "open", fnameindex);
			}
			c = _IO_getc (lf.f);
			if (c == '#') {
			lf.extraline = 1;
			while ((c = _IO_getc (lf.f)) != (-1) && c != '\n')
			;
			if (c == '\n')
			c = _IO_getc (lf.f);
			}
			if (c == "\033Lua"[0] && filename) {
			lf.f = freopen(filename, "rb", lf.f);
			if (lf.f == ((void *)0))
			return errfile(L, "reopen", fnameindex);
			while ((c = _IO_getc (lf.f)) != (-1) && c != "\033Lua"[0])
			;
			lf.extraline = 0;
			}
			ungetc(c, lf.f);
			status = lua_load(L, getF, &lf, lua_tolstring(L, (-1), ((void *)0)));
			readstatus = ferror(lf.f);
			if (filename)
			fclose(lf.f);
			if (readstatus) {
			lua_settop(L, fnameindex);
			return errfile(L, "read", fnameindex);
			}
			lua_remove(L, fnameindex);
			return status;
}
typedef struct LoadS {
			const char *s;
			size_t size;
} LoadS;
static const char *getS(lua_State *L, void *ud, size_t *size)
{
			LoadS *ls = (LoadS *)ud;
			(void)L;
			if (ls->size == 0)
			return ((void *)0);
			*size = ls->size;
			ls->size = 0;
			return ls->s;
}
static int luaL_loadbuffer(lua_State *L, const char *buff, size_t size,
			const char *name)
{
			LoadS ls;
			ls.s = buff;
			ls.size = size;
			return lua_load(L, getS, &ls, name);
}
static void *l_alloc(void *ud, void *ptr, size_t osize, size_t nsize)
{
			(void)ud;
			(void)osize;
			if (nsize == 0) {
			free(ptr);
			return ((void *)0);
			} else
			return realloc(ptr, nsize);
}
static int panic(lua_State *L)
{
			(void)L;
			fprintf(stderr, "PANIC: unprotected error in call to Lua API (%s)\n",
			lua_tolstring(L, (-1), ((void *)0)));
			return 0;
}
static lua_State *luaL_newstate(void)
{
			lua_State *L = lua_newstate(l_alloc, ((void *)0));
			if (L)
			lua_atpanic(L, &panic);
			return L;
}
static int luaB_tonumber(lua_State *L)
{
			int base = ((int)luaL_optinteger(L, (2), (10)));
			if (base == 10) {
			luaL_checkany(L, 1);
			if (lua_isnumber(L, 1)) {
			lua_pushnumber(L, lua_tonumber(L, 1));
			return 1;
			}
			} else {
			const char *s1 = (luaL_checklstring(L, (1), ((void *)0)));
			char *s2;
			unsigned long n;
			((void)((2 <= base && base <= 36) || luaL_argerror(L, (2), ("base out of range"))));
			n = strtoul(s1, &s2, base);
			if (s1 != s2) {
			while (((*__ctype_b_loc ())[(int) (((unsigned char)(*s2)))] & (unsigned short int) _ISspace))
			s2++;
			if (*s2 == '\0') {
			lua_pushnumber(L, (lua_Number)n);
			return 1;
			}
			}
			}
			lua_pushnil(L);
			return 1;
}
static int luaB_error(lua_State *L)
{
			int level = ((int)luaL_optinteger(L, (2), (1)));
			lua_settop(L, 1);
			if (lua_isstring(L, 1) && level > 0) {
			luaL_where(L, level);
			lua_pushvalue(L, 1);
			lua_concat(L, 2);
			}
			return lua_error(L);
}
static int luaB_setmetatable(lua_State *L)
{
			int t = lua_type(L, 2);
			luaL_checktype(L, 1, 5);
			((void)((t == 0 || t == 5) || luaL_argerror(L, (2), ("nil or table expected"))));
			if (luaL_getmetafield(L, 1, "__metatable"))
			luaL_error(L, "cannot change a protected metatable");
			lua_settop(L, 2);
			lua_setmetatable(L, 1);
			return 1;
}
static void getfunc(lua_State *L, int opt)
{
			if ((lua_type(L, (1)) == 6))
			lua_pushvalue(L, 1);
			else {
			lua_Debug ar;
			int level = opt ? ((int)luaL_optinteger(L, (1), (1))) : ((int)luaL_checkinteger(L, (1)));
			((void)((level >= 0) || luaL_argerror(L, (1), ("level must be non-negative"))));
			if (lua_getstack(L, level, &ar) == 0)
			luaL_argerror(L, 1, "invalid level");
			lua_getinfo(L, "f", &ar);
			if ((lua_type(L, (-1)) == 0))
			luaL_error(
			L,
			"no function environment for tail call at level %d",
			level);
			}
}
static int luaB_setfenv(lua_State *L)
{
			luaL_checktype(L, 2, 5);
			getfunc(L, 0);
			lua_pushvalue(L, 2);
			if (lua_isnumber(L, 1) && lua_tonumber(L, 1) == 0) {
			lua_pushthread(L);
			lua_insert(L, -2);
			lua_setfenv(L, -2);
			return 0;
			} else if (lua_iscfunction(L, -2) || lua_setfenv(L, -2) == 0)
			luaL_error(L, "'" "setfenv" "'" " cannot change environment of "
			"given object");
			return 1;
}
static int luaB_rawget(lua_State *L)
{
			luaL_checktype(L, 1, 5);
			luaL_checkany(L, 2);
			lua_settop(L, 2);
			lua_rawget(L, 1);
			return 1;
}
static int luaB_type(lua_State *L)
{
			luaL_checkany(L, 1);
			lua_pushstring(L, lua_typename(L, lua_type(L, (1))));
			return 1;
}
static int luaB_next(lua_State *L)
{
			luaL_checktype(L, 1, 5);
			lua_settop(L, 2);
			if (lua_next(L, 1))
			return 2;
			else {
			lua_pushnil(L);
			return 1;
			}
}
static int luaB_pairs(lua_State *L)
{
			luaL_checktype(L, 1, 5);
			lua_pushvalue(L, ((-10002) - (1)));
			lua_pushvalue(L, 1);
			lua_pushnil(L);
			return 3;
}
static int ipairsaux(lua_State *L)
{
			int i = ((int)luaL_checkinteger(L, (2)));
			luaL_checktype(L, 1, 5);
			i++;
			lua_pushinteger(L, i);
			lua_rawgeti(L, 1, i);
			return ((lua_type(L, (-1)) == 0)) ? 0 : 2;
}
static int luaB_ipairs(lua_State *L)
{
			luaL_checktype(L, 1, 5);
			lua_pushvalue(L, ((-10002) - (1)));
			lua_pushvalue(L, 1);
			lua_pushinteger(L, 0);
			return 3;
}
static int load_aux(lua_State *L, int status)
{
			if (status == 0)
			return 1;
			else {
			lua_pushnil(L);
			lua_insert(L, -2);
			return 2;
			}
}
static int luaB_loadstring(lua_State *L)
{
			size_t l;
			const char *s = luaL_checklstring(L, 1, &l);
			const char *chunkname = (luaL_optlstring(L, (2), (s), ((void *)0)));
			return load_aux(L, luaL_loadbuffer(L, s, l, chunkname));
}
static int luaB_loadfile(lua_State *L)
{
			const char *fname = (luaL_optlstring(L, (1), (((void *)0)), ((void *)0)));
			return load_aux(L, luaL_loadfile(L, fname));
}
static int luaB_assert(lua_State *L)
{
			luaL_checkany(L, 1);
			if (!lua_toboolean(L, 1))
			return luaL_error(L, "%s",
			(luaL_optlstring(L, (2), ("assertion failed!"), ((void *)0))));
			return lua_gettop(L);
}
static int luaB_unpack(lua_State *L)
{
			int i, e, n;
			luaL_checktype(L, 1, 5);
			i = ((int)luaL_optinteger(L, (2), (1)));
			e = ((lua_type(L, ((3))) <= 0) ? (((int)lua_objlen(L, 1))) : ((int)luaL_checkinteger(L, ((3)))));
			if (i > e)
			return 0;
			n = e - i + 1;
			if (n <= 0 || !lua_checkstack(L, n))
			return luaL_error(L, "too many results to unpack");
			lua_rawgeti(L, 1, i);
			while (i++ < e)
			lua_rawgeti(L, 1, i);
			return n;
}
static int luaB_pcall(lua_State *L)
{
			int status;
			luaL_checkany(L, 1);
			status = lua_pcall(L, lua_gettop(L) - 1, (-1), 0);
			lua_pushboolean(L, (status == 0));
			lua_insert(L, 1);
			return lua_gettop(L);
}
static int luaB_newproxy(lua_State *L)
{
			lua_settop(L, 1);
			lua_newuserdata(L, 0);
			if (lua_toboolean(L, 1) == 0)
			return 1;
			else if ((lua_type(L, (1)) == 1)) {
			lua_createtable(L, 0, 0);
			lua_pushvalue(L, -1);
			lua_pushboolean(L, 1);
			lua_rawset(L, ((-10002) - (1)));
			} else {
			int validproxy = 0;
			if (lua_getmetatable(L, 1)) {
			lua_rawget(L, ((-10002) - (1)));
			validproxy = lua_toboolean(L, -1);
			lua_settop(L, -(1)-1);
			}
			((void)((validproxy) || luaL_argerror(L, (1), ("boolean or proxy expected"))));
			lua_getmetatable(L, 1);
			}
			lua_setmetatable(L, 2);
			return 1;
}
static luaL_Reg base_funcs[13];
static void auxopen(lua_State *L, const char *name, lua_CFunction f,
			lua_CFunction u)
{
			lua_pushcclosure(L, (u), 0);
			lua_pushcclosure(L, f, 1);
			lua_setfield(L, -2, name);
}
static void base_open(lua_State *L)
{
			lua_pushvalue(L, (-10002));
			lua_setfield(L, (-10002), ("_G"));
			luaL_register(L, "_G", base_funcs);
			lua_pushlstring(L, """Lua 5.1", (sizeof("Lua 5.1") / sizeof(char)) - 1);
			lua_setfield(L, (-10002), ("_VERSION"));
			auxopen(L, "ipairs", luaB_ipairs, ipairsaux);
			auxopen(L, "pairs", luaB_pairs, luaB_next);
			lua_createtable(L, 0, 1);
			lua_pushvalue(L, -1);
			lua_setmetatable(L, -2);
			lua_pushlstring(L, """kv", (sizeof("kv") / sizeof(char)) - 1);
			lua_setfield(L, -2, "__mode");
			lua_pushcclosure(L, luaB_newproxy, 1);
			lua_setfield(L, (-10002), ("newproxy"));
}
static int luaopen_base(lua_State *L)
{
			base_open(L);
			return 1;
}
static int tinsert(lua_State *L)
{
			int e = (luaL_checktype(L, 1, 5), ((int)lua_objlen(L, 1))) + 1;
			int pos;
			switch (lua_gettop(L)) {
			case 2: {
			pos = e;
			break;
			}
			case 3: {
			int i;
			pos = ((int)luaL_checkinteger(L, (2)));
			if (pos > e)
			e = pos;
			for (i = e; i > pos; i--) {
			lua_rawgeti(L, 1, i - 1);
			lua_rawseti(L, 1, i);
			}
			break;
			}
			default: {
			return luaL_error(
			L, "wrong number of arguments to " "'" "insert" "'");
			}
			}
			((void)0);
			lua_rawseti(L, 1, pos);
			return 0;
}
static int tremove(lua_State *L)
{
			int e = (luaL_checktype(L, 1, 5), ((int)lua_objlen(L, 1)));
			int pos = ((int)luaL_optinteger(L, (2), (e)));
			if (!(1 <= pos && pos <= e))
			return 0;
			((void)0);
			lua_rawgeti(L, 1, pos);
			for (; pos < e; pos++) {
			lua_rawgeti(L, 1, pos + 1);
			lua_rawseti(L, 1, pos);
			}
			lua_pushnil(L);
			lua_rawseti(L, 1, e);
			return 1;
}
static void addfield(lua_State *L, luaL_Buffer *b, int i)
{
			lua_rawgeti(L, 1, i);
			if (!lua_isstring(L, -1))
			luaL_error(
			L, "invalid value (%s) at index %d in table for " "'" "concat" "'",
			lua_typename(L, lua_type(L, (-1))), i);
			luaL_addvalue(b);
}
static int tconcat(lua_State *L)
{
			luaL_Buffer b;
			size_t lsep;
			int i, last;
			const char *sep = luaL_optlstring(L, 2, "", &lsep);
			luaL_checktype(L, 1, 5);
			i = ((int)luaL_optinteger(L, (3), (1)));
			last = ((lua_type(L, ((4))) <= 0) ? (((int)lua_objlen(L, 1))) : ((int)luaL_checkinteger(L, ((4)))));
			luaL_buffinit(L, &b);
			for (; i < last; i++) {
			addfield(L, &b, i);
			luaL_addlstring(&b, sep, lsep);
			}
			if (i == last)
			addfield(L, &b, i);
			luaL_pushresult(&b);
			return 1;
}
static void set2(lua_State *L, int i, int j)
{
			lua_rawseti(L, 1, i);
			lua_rawseti(L, 1, j);
}
static int sort_comp(lua_State *L, int a, int b)
{
			if (!(lua_type(L, (2)) == 0)) {
			int res;
			lua_pushvalue(L, 2);
			lua_pushvalue(L, a - 1);
			lua_pushvalue(L, b - 2);
			lua_call(L, 2, 1);
			res = lua_toboolean(L, -1);
			lua_settop(L, -(1)-1);
			return res;
			} else
			return lua_lessthan(L, a, b);
}
static void auxsort(lua_State *L, int l, int u)
{
			while (l < u) {
			int i, j;
			lua_rawgeti(L, 1, l);
			lua_rawgeti(L, 1, u);
			if (sort_comp(L, -1, -2))
			set2(L, l, u);
			else
			lua_settop(L, -(2)-1);
			if (u - l == 1)
			break;
			i = (l + u) / 2;
			lua_rawgeti(L, 1, i);
			lua_rawgeti(L, 1, l);
			if (sort_comp(L, -2, -1))
			set2(L, i, l);
			else {
			lua_settop(L, -(1)-1);
			lua_rawgeti(L, 1, u);
			if (sort_comp(L, -1, -2))
			set2(L, i, u);
			else
			lua_settop(L, -(2)-1);
			}
			if (u - l == 2)
			break;
			lua_rawgeti(L, 1, i);
			lua_pushvalue(L, -1);
			lua_rawgeti(L, 1, u - 1);
			set2(L, i, u - 1);
			i = l;
			j = u - 1;
			for (;;) {
			while (lua_rawgeti(L, 1, ++i), sort_comp(L, -1, -2)) {
			if (i > u)
			luaL_error(L, "invalid order function "
			"for sorting");
			lua_settop(L, -(1)-1);
			}
			while (lua_rawgeti(L, 1, --j), sort_comp(L, -3, -1)) {
			if (j < l)
			luaL_error(L, "invalid order function "
			"for sorting");
			lua_settop(L, -(1)-1);
			}
			if (j < i) {
			lua_settop(L, -(3)-1);
			break;
			}
			set2(L, i, j);
			}
			lua_rawgeti(L, 1, u - 1);
			lua_rawgeti(L, 1, i);
			set2(L, u - 1, i);
			if (i - l < u - i) {
			j = l;
			i = i - 1;
			l = i + 2;
			} else {
			j = i + 1;
			i = u;
			u = j - 2;
			}
			auxsort(L, j, i);
			}
}
static int sort(lua_State *L)
{
			int n = (luaL_checktype(L, 1, 5), ((int)lua_objlen(L, 1)));
			luaL_checkstack(L, 40, "");
			if (!(lua_type(L, (2)) <= 0))
			luaL_checktype(L, 2, 6);
			lua_settop(L, 2);
			auxsort(L, 1, n);
			return 0;
}
static luaL_Reg tab_funcs[5];
static int luaopen_table(lua_State *L)
{
			luaL_register(L, "table", tab_funcs);
			return 1;
}
static const char *fnames[2];
static int pushresult(lua_State *L, int i, const char *filename)
{
			int en = (*__errno_location ());
			if (i) {
			lua_pushboolean(L, 1);
			return 1;
			} else {
			lua_pushnil(L);
			if (filename)
			lua_pushfstring(L, "%s: %s", filename, strerror(en));
			else
			lua_pushfstring(L, "%s", strerror(en));
			lua_pushinteger(L, en);
			return 3;
			}
}
static void fileerror(lua_State *L, int arg, const char *filename)
{
			lua_pushfstring(L, "%s: %s", filename, strerror((*__errno_location ())));
			luaL_argerror(L, arg, lua_tolstring(L, (-1), ((void *)0)));
}
static int io_type(lua_State *L)
{
			void *ud;
			luaL_checkany(L, 1);
			ud = lua_touserdata(L, 1);
			lua_getfield(L, (-10000), "FILE*");
			if (ud == ((void *)0) || !lua_getmetatable(L, 1) || !lua_rawequal(L, -2, -1))
			lua_pushnil(L);
			else if (*((FILE **)ud) == ((void *)0))
			lua_pushlstring(L, """closed file", (sizeof("closed file") / sizeof(char)) - 1);
			else
			lua_pushlstring(L, """file", (sizeof("file") / sizeof(char)) - 1);
			return 1;
}
static FILE *tofile(lua_State *L)
{
			FILE **f = ((FILE **)luaL_checkudata(L, 1, "FILE*"));
			if (*f == ((void *)0))
			luaL_error(L, "attempt to use a closed file");
			return *f;
}
static FILE **newfile(lua_State *L)
{
			FILE **pf = (FILE **)lua_newuserdata(L, sizeof(FILE *));
			*pf = ((void *)0);
			(lua_getfield(L, (-10000), ("FILE*")));
			lua_setmetatable(L, -2);
			return pf;
}
static int io_noclose(lua_State *L)
{
			lua_pushnil(L);
			lua_pushlstring(L, """cannot close standard file", (sizeof("cannot close standard file") / sizeof(char)) - 1);
			return 2;
}
static int io_pclose(lua_State *L)
{
			FILE **p = ((FILE **)luaL_checkudata(L, 1, "FILE*"));
			int ok = ((void)((void)L, *p), 0);
			*p = ((void *)0);
			return pushresult(L, ok, ((void *)0));
}
static int io_fclose(lua_State *L)
{
			FILE **p = ((FILE **)luaL_checkudata(L, 1, "FILE*"));
			int ok = (fclose(*p) == 0);
			*p = ((void *)0);
			return pushresult(L, ok, ((void *)0));
}
static int aux_close(lua_State *L)
{
			lua_getfenv(L, 1);
			lua_getfield(L, -1, "__close");
			return (lua_tocfunction(L, -1))(L);
}
static int io_close(lua_State *L)
{
			if ((lua_type(L, (1)) == (-1)))
			lua_rawgeti(L, (-10001), 2);
			tofile(L);
			return aux_close(L);
}
static int io_gc(lua_State *L)
{
			FILE *f = *((FILE **)luaL_checkudata(L, 1, "FILE*"));
			if (f != ((void *)0))
			aux_close(L);
			return 0;
}
static int io_open(lua_State *L)
{
			const char *filename = (luaL_checklstring(L, (1), ((void *)0)));
			const char *mode = (luaL_optlstring(L, (2), ("r"), ((void *)0)));
			FILE **pf = newfile(L);
			*pf = fopen(filename, mode);
			return (*pf == ((void *)0)) ? pushresult(L, 0, filename) : 1;
}
static FILE *getiofile(lua_State *L, int findex)
{
			FILE *f;
			lua_rawgeti(L, (-10001), findex);
			f = *(FILE **)lua_touserdata(L, -1);
			if (f == ((void *)0))
			luaL_error(L, "standard %s file is closed", fnames[findex - 1]);
			return f;
}
static int g_iofile(lua_State *L, int f, const char *mode)
{
			if (!(lua_type(L, (1)) <= 0)) {
			const char *filename = lua_tolstring(L, (1), ((void *)0));
			if (filename) {
			FILE **pf = newfile(L);
			*pf = fopen(filename, mode);
			if (*pf == ((void *)0))
			fileerror(L, 1, filename);
			} else {
			tofile(L);
			lua_pushvalue(L, 1);
			}
			lua_rawseti(L, (-10001), f);
			}
			lua_rawgeti(L, (-10001), f);
			return 1;
}
static int io_input(lua_State *L) { return g_iofile(L, 1, "r"); }
static int io_output(lua_State *L) { return g_iofile(L, 2, "w"); }
static int io_readline(lua_State *L);
static void aux_lines(lua_State *L, int idx, int toclose)
{
			lua_pushvalue(L, idx);
			lua_pushboolean(L, toclose);
			lua_pushcclosure(L, io_readline, 2);
}
static int f_lines(lua_State *L)
{
			tofile(L);
			aux_lines(L, 1, 0);
			return 1;
}
static int io_lines(lua_State *L)
{
			if ((lua_type(L, (1)) <= 0)) {
			lua_rawgeti(L, (-10001), 1);
			return f_lines(L);
			} else {
			const char *filename = (luaL_checklstring(L, (1), ((void *)0)));
			FILE **pf = newfile(L);
			*pf = fopen(filename, "r");
			if (*pf == ((void *)0))
			fileerror(L, 1, filename);
			aux_lines(L, lua_gettop(L), 1);
			return 1;
			}
}
static int read_number(lua_State *L, FILE *f)
{
			lua_Number d;
			if (fscanf(f, "%lf", &d) == 1) {
			lua_pushnumber(L, d);
			return 1;
			} else {
			lua_pushnil(L);
			return 0;
			}
}
static int test_eof(lua_State *L, FILE *f)
{
			int c = _IO_getc (f);
			ungetc(c, f);
			lua_pushlstring(L, ((void *)0), 0);
			return (c != (-1));
}
static int read_line(lua_State *L, FILE *f)
{
			luaL_Buffer b;
			luaL_buffinit(L, &b);
			for (;;) {
			size_t l;
			char *p = luaL_prepbuffer(&b);
			if (fgets(p, 8192, f) == ((void *)0)) {
			luaL_pushresult(&b);
			return (lua_objlen(L, -1) > 0);
			}
			l = strlen(p);
			if (l == 0 || p[l - 1] != '\n')
			((&b)->p += (l));
			else {
			((&b)->p += (l - 1));
			luaL_pushresult(&b);
			return 1;
			}
			}
}
static int read_chars(lua_State *L, FILE *f, size_t n)
{
			size_t rlen;
			size_t nr;
			luaL_Buffer b;
			luaL_buffinit(L, &b);
			rlen = 8192;
			do {
			char *p = luaL_prepbuffer(&b);
			if (rlen > n)
			rlen = n;
			nr = fread(p, sizeof(char), rlen, f);
			((&b)->p += (nr));
			n -= nr;
			} while (n > 0 && nr == rlen);
			luaL_pushresult(&b);
			return (n == 0 || lua_objlen(L, -1) > 0);
}
static int g_read(lua_State *L, FILE *f, int first)
{
			int nargs = lua_gettop(L) - 1;
			int success;
			int n;
			clearerr(f);
			if (nargs == 0) {
			success = read_line(L, f);
			n = first + 1;
			} else {
			luaL_checkstack(L, nargs + 20, "too many arguments");
			success = 1;
			for (n = first; nargs-- && success; n++) {
			if (lua_type(L, n) == 3) {
			size_t l = (size_t)lua_tointeger(L, n);
			success = (l == 0) ? test_eof(L, f)
			: read_chars(L, f, l);
			} else {
			const char *p = lua_tolstring(L, (n), ((void *)0));
			((void)((p && p[0] == '*') || luaL_argerror(L, (n), ("invalid option"))));
			switch (p[1]) {
			case 'n':
			success = read_number(L, f);
			break;
			case 'l':
			success = read_line(L, f);
			break;
			case 'a':
			read_chars(L, f, ~((size_t)0));
			success = 1;
			break;
			default:
			return luaL_argerror(L, n,
			"invalid format");
			}
			}
			}
			}
			if (ferror(f))
			return pushresult(L, 0, ((void *)0));
			if (!success) {
			lua_settop(L, -(1)-1);
			lua_pushnil(L);
			}
			return n - first;
}
static int io_read(lua_State *L) { return g_read(L, getiofile(L, 1), 1); }
static int f_read(lua_State *L) { return g_read(L, tofile(L), 2); }
static int io_readline(lua_State *L)
{
			FILE *f = *(FILE **)lua_touserdata(L, ((-10002) - (1)));
			int sucess;
			if (f == ((void *)0))
			luaL_error(L, "file is already closed");
			sucess = read_line(L, f);
			if (ferror(f))
			return luaL_error(L, "%s", strerror((*__errno_location ())));
			if (sucess)
			return 1;
			else {
			if (lua_toboolean(L, ((-10002) - (2)))) {
			lua_settop(L, 0);
			lua_pushvalue(L, ((-10002) - (1)));
			aux_close(L);
			}
			return 0;
			}
}
static int g_write(lua_State *L, FILE *f, int arg)
{
			int nargs = lua_gettop(L) - 1;
			int status = 1;
			for (; nargs--; arg++) {
			if (lua_type(L, arg) == 3) {
			status = status &&
			fprintf(f, "%.14g", lua_tonumber(L, arg)) > 0;
			} else {
			size_t l;
			const char *s = luaL_checklstring(L, arg, &l);
			status = status && (fwrite(s, sizeof(char), l, f) == l);
			}
			}
			return pushresult(L, status, ((void *)0));
}
static int io_write(lua_State *L) { return g_write(L, getiofile(L, 2), 1); }
static int f_write(lua_State *L) { return g_write(L, tofile(L), 2); }
static int io_flush(lua_State *L)
{
			return pushresult(L, fflush(getiofile(L, 2)) == 0, ((void *)0));
}
static int f_flush(lua_State *L)
{
			return pushresult(L, fflush(tofile(L)) == 0, ((void *)0));
}
static luaL_Reg iolib[10];
static luaL_Reg flib[7];
static void createmeta(lua_State *L)
{
			luaL_newmetatable(L, "FILE*");
			lua_pushvalue(L, -1);
			lua_setfield(L, -2, "__index");
			luaL_register(L, ((void *)0), flib);
}
static void createstdfile(lua_State *L, FILE *f, int k, const char *fname)
{
			*newfile(L) = f;
			if (k > 0) {
			lua_pushvalue(L, -1);
			lua_rawseti(L, (-10001), k);
			}
			lua_pushvalue(L, -2);
			lua_setfenv(L, -2);
			lua_setfield(L, -3, fname);
}
static void newfenv(lua_State *L, lua_CFunction cls)
{
			lua_createtable(L, 0, 1);
			lua_pushcclosure(L, (cls), 0);
			lua_setfield(L, -2, "__close");
}
static int luaopen_io(lua_State *L)
{
			createmeta(L);
			newfenv(L, io_fclose);
			lua_replace(L, (-10001));
			luaL_register(L, "io", iolib);
			newfenv(L, io_noclose);
			createstdfile(L, stdin, 1, "stdin");
			createstdfile(L, stdout, 2, "stdout");
			createstdfile(L, stderr, 0, "stderr");
			lua_settop(L, -(1)-1);
			lua_getfield(L, -1, "popen");
			newfenv(L, io_pclose);
			lua_setfenv(L, -2);
			lua_settop(L, -(1)-1);
			return 1;
}
static int os_pushresult(lua_State *L, int i, const char *filename)
{
			int en = (*__errno_location ());
			if (i) {
			lua_pushboolean(L, 1);
			return 1;
			} else {
			lua_pushnil(L);
			lua_pushfstring(L, "%s: %s", filename, strerror(en));
			lua_pushinteger(L, en);
			return 3;
			}
}
static int os_remove(lua_State *L)
{
			const char *filename = (luaL_checklstring(L, (1), ((void *)0)));
			return os_pushresult(L, remove(filename) == 0, filename);
}
static int os_exit(lua_State *L) { exit(((int)luaL_optinteger(L, (1), (0)))); return 0; }
static luaL_Reg syslib[3];
static int luaopen_os(lua_State *L)
{
			luaL_register(L, "os", syslib);
			return 1;
}
static ptrdiff_t posrelat(ptrdiff_t pos, size_t len)
{
			if (pos < 0)
			pos += (ptrdiff_t)len + 1;
			return (pos >= 0) ? pos : 0;
}
static int str_sub(lua_State *L)
{
			size_t l;
			const char *s = luaL_checklstring(L, 1, &l);
			ptrdiff_t start = posrelat(luaL_checkinteger(L, 2), l);
			ptrdiff_t end = posrelat(luaL_optinteger(L, 3, -1), l);
			if (start < 1)
			start = 1;
			if (end > (ptrdiff_t)l)
			end = (ptrdiff_t)l;
			if (start <= end)
			lua_pushlstring(L, s + start - 1, end - start + 1);
			else
			lua_pushlstring(L, """", (sizeof("") / sizeof(char)) - 1);
			return 1;
}
static int str_lower(lua_State *L)
{
			size_t l;
			size_t i;
			luaL_Buffer b;
			const char *s = luaL_checklstring(L, 1, &l);
			luaL_buffinit(L, &b);
			for (i = 0; i < l; i++)
			((void)((&b)->p < ((&b)->buffer + 8192) || luaL_prepbuffer(&b)), (*(&b)->p++ = (char)(tolower(((unsigned char)(s[i]))))));
			luaL_pushresult(&b);
			return 1;
}
static int str_upper(lua_State *L)
{
			size_t l;
			size_t i;
			luaL_Buffer b;
			const char *s = luaL_checklstring(L, 1, &l);
			luaL_buffinit(L, &b);
			for (i = 0; i < l; i++)
			((void)((&b)->p < ((&b)->buffer + 8192) || luaL_prepbuffer(&b)), (*(&b)->p++ = (char)(toupper(((unsigned char)(s[i]))))));
			luaL_pushresult(&b);
			return 1;
}
static int str_rep(lua_State *L)
{
			size_t l;
			luaL_Buffer b;
			const char *s = luaL_checklstring(L, 1, &l);
			int n = ((int)luaL_checkinteger(L, (2)));
			luaL_buffinit(L, &b);
			while (n-- > 0)
			luaL_addlstring(&b, s, l);
			luaL_pushresult(&b);
			return 1;
}
static int str_byte(lua_State *L)
{
			size_t l;
			const char *s = luaL_checklstring(L, 1, &l);
			ptrdiff_t posi = posrelat(luaL_optinteger(L, 2, 1), l);
			ptrdiff_t pose = posrelat(luaL_optinteger(L, 3, posi), l);
			int n, i;
			if (posi <= 0)
			posi = 1;
			if ((size_t)pose > l)
			pose = l;
			if (posi > pose)
			return 0;
			n = (int)(pose - posi + 1);
			if (posi + n <= pose)
			luaL_error(L, "string slice too long");
			luaL_checkstack(L, n, "string slice too long");
			for (i = 0; i < n; i++)
			lua_pushinteger(L, ((unsigned char)(s[posi + i - 1])));
			return n;
}
static int str_char(lua_State *L)
{
			int n = lua_gettop(L);
			int i;
			luaL_Buffer b;
			luaL_buffinit(L, &b);
			for (i = 1; i <= n; i++) {
			int c = ((int)luaL_checkinteger(L, (i)));
			((void)((((unsigned char)(c)) == c) || luaL_argerror(L, (i), ("invalid value"))));
			((void)((&b)->p < ((&b)->buffer + 8192) || luaL_prepbuffer(&b)), (*(&b)->p++ = (char)(((unsigned char)(c)))));
			}
			luaL_pushresult(&b);
			return 1;
}
typedef struct MatchState {
			const char *src_init;
			const char *src_end;
			lua_State *L;
			int level;
			struct {
			const char *init;
			ptrdiff_t len;
			} capture[32];
} MatchState;
static int check_capture(MatchState *ms, int l)
{
			l -= '1';
			if (l < 0 || l >= ms->level || ms->capture[l].len == (-1))
			return luaL_error(ms->L, "invalid capture index");
			return l;
}
static int capture_to_close(MatchState *ms)
{
			int level = ms->level;
			for (level--; level >= 0; level--)
			if (ms->capture[level].len == (-1))
			return level;
			return luaL_error(ms->L, "invalid pattern capture");
}
static const char *classend(MatchState *ms, const char *p)
{
			switch (*p++) {
			case '%': {
			if (*p == '\0')
			luaL_error(
			ms->L,
			"malformed pattern (ends with " "'" "%%" "'" ")");
			return p + 1;
			}
			case '[': {
			if (*p == '^')
			p++;
			do {
			if (*p == '\0')
			luaL_error(ms->L,
			"malformed pattern (missing " "'" "]" "'" ")");
			if (*(p++) == '%' && *p != '\0')
			p++;
			} while (*p != ']');
			return p + 1;
			}
			default: {
			return p;
			}
			}
}
static int match_class(int c, int cl)
{
			int res;
			switch (tolower(cl)) {
			case 'a':
			res = ((*__ctype_b_loc ())[(int) ((c))] & (unsigned short int) _ISalpha);
			break;
			case 'c':
			res = ((*__ctype_b_loc ())[(int) ((c))] & (unsigned short int) _IScntrl);
			break;
			case 'd':
			res = ((*__ctype_b_loc ())[(int) ((c))] & (unsigned short int) _ISdigit);
			break;
			case 'l':
			res = ((*__ctype_b_loc ())[(int) ((c))] & (unsigned short int) _ISlower);
			break;
			case 'p':
			res = ((*__ctype_b_loc ())[(int) ((c))] & (unsigned short int) _ISpunct);
			break;
			case 's':
			res = ((*__ctype_b_loc ())[(int) ((c))] & (unsigned short int) _ISspace);
			break;
			case 'u':
			res = ((*__ctype_b_loc ())[(int) ((c))] & (unsigned short int) _ISupper);
			break;
			case 'w':
			res = ((*__ctype_b_loc ())[(int) ((c))] & (unsigned short int) _ISalnum);
			break;
			case 'x':
			res = ((*__ctype_b_loc ())[(int) ((c))] & (unsigned short int) _ISxdigit);
			break;
			case 'z':
			res = (c == 0);
			break;
			default:
			return (cl == c);
			}
			return (((*__ctype_b_loc ())[(int) ((cl))] & (unsigned short int) _ISlower) ? res : !res);
}
static int matchbracketclass(int c, const char *p, const char *ec)
{
			int sig = 1;
			if (*(p + 1) == '^') {
			sig = 0;
			p++;
			}
			while (++p < ec) {
			if (*p == '%') {
			p++;
			if (match_class(c, ((unsigned char)(*p))))
			return sig;
			} else if ((*(p + 1) == '-') && (p + 2 < ec)) {
			p += 2;
			if (((unsigned char)(*(p - 2))) <= c && c <= ((unsigned char)(*p)))
			return sig;
			} else if (((unsigned char)(*p)) == c)
			return sig;
			}
			return !sig;
}
static int singlematch(int c, const char *p, const char *ep)
{
			switch (*p) {
			case '.':
			return 1;
			case '%':
			return match_class(c, ((unsigned char)(*(p + 1))));
			case '[':
			return matchbracketclass(c, p, ep - 1);
			default:
			return (((unsigned char)(*p)) == c);
			}
}
static const char *match(MatchState *ms, const char *s, const char *p);
static const char *matchbalance(MatchState *ms, const char *s, const char *p)
{
			if (*p == 0 || *(p + 1) == 0)
			luaL_error(ms->L, "unbalanced pattern");
			if (*s != *p)
			return ((void *)0);
			else {
			int b = *p;
			int e = *(p + 1);
			int cont = 1;
			while (++s < ms->src_end) {
			if (*s == e) {
			if (--cont == 0)
			return s + 1;
			} else if (*s == b)
			cont++;
			}
			}
			return ((void *)0);
}
static const char *max_expand(MatchState *ms, const char *s, const char *p,
			const char *ep)
{
			ptrdiff_t i = 0;
			while ((s + i) < ms->src_end && singlematch(((unsigned char)(*(s + i))), p, ep))
			i++;
			while (i >= 0) {
			const char *res = match(ms, (s + i), ep + 1);
			if (res)
			return res;
			i--;
			}
			return ((void *)0);
}
static const char *min_expand(MatchState *ms, const char *s, const char *p,
			const char *ep)
{
			for (;;) {
			const char *res = match(ms, s, ep + 1);
			if (res != ((void *)0))
			return res;
			else if (s < ms->src_end && singlematch(((unsigned char)(*s)), p, ep))
			s++;
			else
			return ((void *)0);
			}
}
static const char *start_capture(MatchState *ms, const char *s, const char *p,
			int what)
{
			const char *res;
			int level = ms->level;
			if (level >= 32)
			luaL_error(ms->L, "too many captures");
			ms->capture[level].init = s;
			ms->capture[level].len = what;
			ms->level = level + 1;
			if ((res = match(ms, s, p)) == ((void *)0))
			ms->level--;
			return res;
}
static const char *end_capture(MatchState *ms, const char *s, const char *p)
{
			int l = capture_to_close(ms);
			const char *res;
			ms->capture[l].len = s - ms->capture[l].init;
			if ((res = match(ms, s, p)) == ((void *)0))
			ms->capture[l].len = (-1);
			return res;
}
static const char *match_capture(MatchState *ms, const char *s, int l)
{
			size_t len;
			l = check_capture(ms, l);
			len = ms->capture[l].len;
			if ((size_t)(ms->src_end - s) >= len &&
			memcmp(ms->capture[l].init, s, len) == 0)
			return s + len;
			else
			return ((void *)0);
}
static const char *match(MatchState *ms, const char *s, const char *p)
{
init:
			switch (*p) {
			case '(': {
			if (*(p + 1) == ')')
			return start_capture(ms, s, p + 2, (-2));
			else
			return start_capture(ms, s, p + 1, (-1));
			}
			case ')': {
			return end_capture(ms, s, p + 1);
			}
			case '%': {
			switch (*(p + 1)) {
			case 'b': {
			s = matchbalance(ms, s, p + 2);
			if (s == ((void *)0))
			return ((void *)0);
			p += 4;
			goto init;
			}
			case 'f': {
			const char *ep;
			char previous;
			p += 2;
			if (*p != '[')
			luaL_error(
			ms->L,
			"missing " "'" "[" "'" " after " "'" "%%f" "'" " in pattern");
			ep = classend(ms, p);
			previous = (s == ms->src_init) ? '\0' : *(s - 1);
			if (matchbracketclass(((unsigned char)(previous)), p, ep - 1) ||
			!matchbracketclass(((unsigned char)(*s)), p, ep - 1))
			return ((void *)0);
			p = ep;
			goto init;
			}
			default: {
			if (((*__ctype_b_loc ())[(int) ((((unsigned char)(*(p + 1)))))] & (unsigned short int) _ISdigit)) {
			s = match_capture(ms, s, ((unsigned char)(*(p + 1))));
			if (s == ((void *)0))
			return ((void *)0);
			p += 2;
			goto init;
			}
			goto dflt;
			}
			}
			}
			case '\0': {
			return s;
			}
			case '$': {
			if (*(p + 1) == '\0')
			return (s == ms->src_end) ? s : ((void *)0);
			else
			goto dflt;
			}
			default:
			dflt : {
			const char *ep = classend(ms, p);
			int m = s < ms->src_end && singlematch(((unsigned char)(*s)), p, ep);
			switch (*ep) {
			case '?': {
			const char *res;
			if (m && ((res = match(ms, s + 1, ep + 1)) != ((void *)0)))
			return res;
			p = ep + 1;
			goto init;
			}
			case '*': {
			return max_expand(ms, s, p, ep);
			}
			case '+': {
			return (m ? max_expand(ms, s + 1, p, ep) : ((void *)0));
			}
			case '-': {
			return min_expand(ms, s, p, ep);
			}
			default: {
			if (!m)
			return ((void *)0);
			s++;
			p = ep;
			goto init;
			}
			}
			}
			}
}
static const char *lmemfind(const char *s1, size_t l1, const char *s2,
			size_t l2)
{
			if (l2 == 0)
			return s1;
			else if (l2 > l1)
			return ((void *)0);
			else {
			const char *init;
			l2--;
			l1 = l1 - l2;
			while (l1 > 0 &&
			(init = (const char *)memchr(s1, *s2, l1)) != ((void *)0)) {
			init++;
			if (memcmp(init, s2 + 1, l2) == 0)
			return init - 1;
			else {
			l1 -= init - s1;
			s1 = init;
			}
			}
			return ((void *)0);
			}
}
static void push_onecapture(MatchState *ms, int i, const char *s, const char *e)
{
			if (i >= ms->level) {
			if (i == 0)
			lua_pushlstring(ms->L, s, e - s);
			else
			luaL_error(ms->L, "invalid capture index");
			} else {
			ptrdiff_t l = ms->capture[i].len;
			if (l == (-1))
			luaL_error(ms->L, "unfinished capture");
			if (l == (-2))
			lua_pushinteger(ms->L,
			ms->capture[i].init - ms->src_init + 1);
			else
			lua_pushlstring(ms->L, ms->capture[i].init, l);
			}
}
static int push_captures(MatchState *ms, const char *s, const char *e)
{
			int i;
			int nlevels = (ms->level == 0 && s) ? 1 : ms->level;
			luaL_checkstack(ms->L, nlevels, "too many captures");
			for (i = 0; i < nlevels; i++)
			push_onecapture(ms, i, s, e);
			return nlevels;
}
static int str_find_aux(lua_State *L, int find)
{
			size_t l1, l2;
			const char *s = luaL_checklstring(L, 1, &l1);
			const char *p = luaL_checklstring(L, 2, &l2);
			ptrdiff_t init = posrelat(luaL_optinteger(L, 3, 1), l1) - 1;
			if (init < 0)
			init = 0;
			else if ((size_t)(init) > l1)
			init = (ptrdiff_t)l1;
			if (find && (lua_toboolean(L, 4) || strpbrk(p, "^$*+?.([%-") == ((void *)0))) {
			const char *s2 = lmemfind(s + init, l1 - init, p, l2);
			if (s2) {
			lua_pushinteger(L, s2 - s + 1);
			lua_pushinteger(L, s2 - s + l2);
			return 2;
			}
			} else {
			MatchState ms;
			int anchor = (*p == '^') ? (p++, 1) : 0;
			const char *s1 = s + init;
			ms.L = L;
			ms.src_init = s;
			ms.src_end = s + l1;
			do {
			const char *res;
			ms.level = 0;
			if ((res = match(&ms, s1, p)) != ((void *)0)) {
			if (find) {
			lua_pushinteger(L, s1 - s + 1);
			lua_pushinteger(L, res - s);
			return push_captures(&ms, ((void *)0), ((void *)0)) +
			2;
			} else
			return push_captures(&ms, s1, res);
			}
			} while (s1++ < ms.src_end && !anchor);
			}
			lua_pushnil(L);
			return 1;
}
static int str_find(lua_State *L) { return str_find_aux(L, 1); }
static int str_match(lua_State *L) { return str_find_aux(L, 0); }
static int gmatch_aux(lua_State *L)
{
			MatchState ms;
			size_t ls;
			const char *s = lua_tolstring(L, ((-10002) - (1)), &ls);
			const char *p = lua_tolstring(L, (((-10002) - (2))), ((void *)0));
			const char *src;
			ms.L = L;
			ms.src_init = s;
			ms.src_end = s + ls;
			for (src = s + (size_t)lua_tointeger(L, ((-10002) - (3)));
			src <= ms.src_end; src++) {
			const char *e;
			ms.level = 0;
			if ((e = match(&ms, src, p)) != ((void *)0)) {
			lua_Integer newstart = e - s;
			if (e == src)
			newstart++;
			lua_pushinteger(L, newstart);
			lua_replace(L, ((-10002) - (3)));
			return push_captures(&ms, src, e);
			}
			}
			return 0;
}
static int gmatch(lua_State *L)
{
			(luaL_checklstring(L, (1), ((void *)0)));
			(luaL_checklstring(L, (2), ((void *)0)));
			lua_settop(L, 2);
			lua_pushinteger(L, 0);
			lua_pushcclosure(L, gmatch_aux, 3);
			return 1;
}
static void add_s(MatchState *ms, luaL_Buffer *b, const char *s, const char *e)
{
			size_t l, i;
			const char *news = lua_tolstring(ms->L, 3, &l);
			for (i = 0; i < l; i++) {
			if (news[i] != '%')
			((void)((b)->p < ((b)->buffer + 8192) || luaL_prepbuffer(b)), (*(b)->p++ = (char)(news[i])));
			else {
			i++;
			if (!((*__ctype_b_loc ())[(int) ((((unsigned char)(news[i]))))] & (unsigned short int) _ISdigit))
			((void)((b)->p < ((b)->buffer + 8192) || luaL_prepbuffer(b)), (*(b)->p++ = (char)(news[i])));
			else if (news[i] == '0')
			luaL_addlstring(b, s, e - s);
			else {
			push_onecapture(ms, news[i] - '1', s, e);
			luaL_addvalue(b);
			}
			}
			}
}
static void add_value(MatchState *ms, luaL_Buffer *b, const char *s,
			const char *e)
{
			lua_State *L = ms->L;
			switch (lua_type(L, 3)) {
			case 3:
			case 4: {
			add_s(ms, b, s, e);
			return;
			}
			case 6: {
			int n;
			lua_pushvalue(L, 3);
			n = push_captures(ms, s, e);
			lua_call(L, n, 1);
			break;
			}
			case 5: {
			push_onecapture(ms, 0, s, e);
			lua_gettable(L, 3);
			break;
			}
			}
			if (!lua_toboolean(L, -1)) {
			lua_settop(L, -(1)-1);
			lua_pushlstring(L, s, e - s);
			} else if (!lua_isstring(L, -1))
			luaL_error(L, "invalid replacement value (a %s)",
			lua_typename(L, lua_type(L, (-1))));
			luaL_addvalue(b);
}
static int str_gsub(lua_State *L)
{
			size_t srcl;
			const char *src = luaL_checklstring(L, 1, &srcl);
			const char *p = (luaL_checklstring(L, (2), ((void *)0)));
			int tr = lua_type(L, 3);
			int max_s = ((int)luaL_optinteger(L, (4), (srcl + 1)));
			int anchor = (*p == '^') ? (p++, 1) : 0;
			int n = 0;
			MatchState ms;
			luaL_Buffer b;
			((void)((tr == 3 || tr == 4 || tr == 6 || tr == 5) || luaL_argerror(L, (3), ("string/function/table expected"))));
			luaL_buffinit(L, &b);
			ms.L = L;
			ms.src_init = src;
			ms.src_end = src + srcl;
			while (n < max_s) {
			const char *e;
			ms.level = 0;
			e = match(&ms, src, p);
			if (e) {
			n++;
			add_value(&ms, &b, src, e);
			}
			if (e && e > src)
			src = e;
			else if (src < ms.src_end)
			((void)((&b)->p < ((&b)->buffer + 8192) || luaL_prepbuffer(&b)), (*(&b)->p++ = (char)(*src++)));
			else
			break;
			if (anchor)
			break;
			}
			luaL_addlstring(&b, src, ms.src_end - src);
			luaL_pushresult(&b);
			lua_pushinteger(L, n);
			return 2;
}
static void addquoted(lua_State *L, luaL_Buffer *b, int arg)
{
			size_t l;
			const char *s = luaL_checklstring(L, arg, &l);
			((void)((b)->p < ((b)->buffer + 8192) || luaL_prepbuffer(b)), (*(b)->p++ = (char)('"')));
			while (l--) {
			switch (*s) {
			case '"':
			case '\\':
			case '\n': {
			((void)((b)->p < ((b)->buffer + 8192) || luaL_prepbuffer(b)), (*(b)->p++ = (char)('\\')));
			((void)((b)->p < ((b)->buffer + 8192) || luaL_prepbuffer(b)), (*(b)->p++ = (char)(*s)));
			break;
			}
			case '\r': {
			luaL_addlstring(b, "\\r", 2);
			break;
			}
			case '\0': {
			luaL_addlstring(b, "\\000", 4);
			break;
			}
			default: {
			((void)((b)->p < ((b)->buffer + 8192) || luaL_prepbuffer(b)), (*(b)->p++ = (char)(*s)));
			break;
			}
			}
			s++;
			}
			((void)((b)->p < ((b)->buffer + 8192) || luaL_prepbuffer(b)), (*(b)->p++ = (char)('"')));
}
static const char *scanformat(lua_State *L, const char *strfrmt, char *form)
{
			const char *p = strfrmt;
			while (*p != '\0' && strchr("-+ #0", *p) != ((void *)0))
			p++;
			if ((size_t)(p - strfrmt) >= sizeof("-+ #0"))
			luaL_error(L, "invalid format (repeated flags)");
			if (((*__ctype_b_loc ())[(int) ((((unsigned char)(*p))))] & (unsigned short int) _ISdigit))
			p++;
			if (((*__ctype_b_loc ())[(int) ((((unsigned char)(*p))))] & (unsigned short int) _ISdigit))
			p++;
			if (*p == '.') {
			p++;
			if (((*__ctype_b_loc ())[(int) ((((unsigned char)(*p))))] & (unsigned short int) _ISdigit))
			p++;
			if (((*__ctype_b_loc ())[(int) ((((unsigned char)(*p))))] & (unsigned short int) _ISdigit))
			p++;
			}
			if (((*__ctype_b_loc ())[(int) ((((unsigned char)(*p))))] & (unsigned short int) _ISdigit))
			luaL_error(L, "invalid format (width or precision too long)");
			*(form++) = '%';
			strncpy(form, strfrmt, p - strfrmt + 1);
			form += p - strfrmt + 1;
			*form = '\0';
			return p;
}
static void addintlen(char *form)
{
			size_t l = strlen(form);
			char spec = form[l - 1];
			strcpy(form + l - 1, "l");
			form[l + sizeof("l") - 2] = spec;
			form[l + sizeof("l") - 1] = '\0';
}
static int str_format(lua_State *L)
{
			int top = lua_gettop(L);
			int arg = 1;
			size_t sfl;
			const char *strfrmt = luaL_checklstring(L, arg, &sfl);
			const char *strfrmt_end = strfrmt + sfl;
			luaL_Buffer b;
			luaL_buffinit(L, &b);
			while (strfrmt < strfrmt_end) {
			if (*strfrmt != '%')
			((void)((&b)->p < ((&b)->buffer + 8192) || luaL_prepbuffer(&b)), (*(&b)->p++ = (char)(*strfrmt++)));
			else if (*++strfrmt == '%')
			((void)((&b)->p < ((&b)->buffer + 8192) || luaL_prepbuffer(&b)), (*(&b)->p++ = (char)(*strfrmt++)));
			else {
			char form[(sizeof("-+ #0") + sizeof("l") + 10)];
			char buff[512];
			if (++arg > top)
			luaL_argerror(L, arg, "no value");
			strfrmt = scanformat(L, strfrmt, form);
			switch (*strfrmt++) {
			case 'c': {
			sprintf(buff, form,
			(int)luaL_checknumber(L, arg));
			break;
			}
			case 'd':
			case 'i': {
			addintlen(form);
			sprintf(buff, form,
			(long)luaL_checknumber(L, arg));
			break;
			}
			case 'o':
			case 'u':
			case 'x':
			case 'X': {
			addintlen(form);
			sprintf(
			buff, form,
			(unsigned long)luaL_checknumber(L, arg));
			break;
			}
			case 'e':
			case 'E':
			case 'f':
			case 'g':
			case 'G': {
			sprintf(buff, form,
			(double)luaL_checknumber(L, arg));
			break;
			}
			case 'q': {
			addquoted(L, &b, arg);
			continue;
			}
			case 's': {
			size_t l;
			const char *s = luaL_checklstring(L, arg, &l);
			if (!strchr(form, '.') && l >= 100) {
			lua_pushvalue(L, arg);
			luaL_addvalue(&b);
			continue;
			} else {
			sprintf(buff, form, s);
			break;
			}
			}
			default: {
			return luaL_error(
			L, "invalid option " "'" "%%%c" "'" " to " "'" "format" "'",
			*(strfrmt - 1));
			}
			}
			luaL_addlstring(&b, buff, strlen(buff));
			}
			}
			luaL_pushresult(&b);
			return 1;
}
static luaL_Reg strlib[12];
static void createmetatable(lua_State *L)
{
			lua_createtable(L, 0, 1);
			lua_pushlstring(L, """", (sizeof("") / sizeof(char)) - 1);
			lua_pushvalue(L, -2);
			lua_setmetatable(L, -2);
			lua_settop(L, -(1)-1);
			lua_pushvalue(L, -2);
			lua_setfield(L, -2, "__index");
			lua_settop(L, -(1)-1);
}
static int luaopen_string(lua_State *L)
{
			luaL_register(L, "string", strlib);
			createmetatable(L);
			return 1;
}
static luaL_Reg lualibs[6];
static void luaL_openlibs(lua_State *L)
{
			const luaL_Reg *lib = lualibs;
			for (; lib->func; lib++) {
			lua_pushcclosure(L, (lib->func), 0);
			lua_pushstring(L, lib->name);
			lua_call(L, 1, 0);
			}
}
typedef unsigned int UB;
static UB barg(lua_State *L, int idx)
{
			union {
			lua_Number n;
			U64 b;
			} bn;
			bn.n = lua_tonumber(L, idx) + 6755399441055744.0;
			if (bn.n == 0.0 && !lua_isnumber(L, idx))
			luaL_typerror(L, idx, "number");
			return (UB)bn.b;
}
static int tobit(lua_State *L) { lua_pushnumber(L, (lua_Number)(int)(barg(L, 1))); return 1; }
static int bnot(lua_State *L) { lua_pushnumber(L, (lua_Number)(int)(~barg(L, 1))); return 1; }
static int band(lua_State *L)
{
			int i;
			UB b = barg(L, 1);
			for (i = lua_gettop(L); i > 1; i--)
			b &= barg(L, i);
			lua_pushnumber(L, (lua_Number)(int)(b)); return 1;
}
static int bor(lua_State *L)
{
			int i;
			UB b = barg(L, 1);
			for (i = lua_gettop(L); i > 1; i--)
			b |= barg(L, i);
			lua_pushnumber(L, (lua_Number)(int)(b)); return 1;
}
static int bxor(lua_State *L)
{
			int i;
			UB b = barg(L, 1);
			for (i = lua_gettop(L); i > 1; i--)
			b ^= barg(L, i);
			lua_pushnumber(L, (lua_Number)(int)(b)); return 1;
}
static int lshift(lua_State *L)
{
			UB b = barg(L, 1), n = barg(L, 2) & 31;
			lua_pushnumber(L, (lua_Number)(int)(b << n)); return 1;
}
static int rshift(lua_State *L)
{
			UB b = barg(L, 1), n = barg(L, 2) & 31;
			lua_pushnumber(L, (lua_Number)(int)(b >> n)); return 1;
}
static int arshift(lua_State *L)
{
			UB b = barg(L, 1), n = barg(L, 2) & 31;
			lua_pushnumber(L, (lua_Number)(int)((int)b >> n)); return 1;
}
static int rol(lua_State *L)
{
			UB b = barg(L, 1), n = barg(L, 2) & 31;
			lua_pushnumber(L, (lua_Number)(int)((b << n) | (b >> (32 - n)))); return 1;
}
static int ror(lua_State *L)
{
			UB b = barg(L, 1), n = barg(L, 2) & 31;
			lua_pushnumber(L, (lua_Number)(int)((b >> n) | (b << (32 - n)))); return 1;
}
static int bswap(lua_State *L)
{
			UB b = barg(L, 1);
			b = (b >> 24) | ((b >> 8) & 0xff00) | ((b & 0xff00) << 8) | (b << 24);
			lua_pushnumber(L, (lua_Number)(int)(b)); return 1;
}
static int tohex(lua_State *L)
{
			UB b = barg(L, 1);
			int n = (lua_type(L, (2)) == (-1)) ? 8 : (int)barg(L, 2);
			const char *hexdigits = "0123456789abcdef";
			char buf[8];
			int i;
			if (n < 0) {
			n = -n;
			hexdigits = "0123456789ABCDEF";
			}
			if (n > 8)
			n = 8;
			for (i = (int)n; --i >= 0;) {
			buf[i] = hexdigits[b & 15];
			b >>= 4;
			}
			lua_pushlstring(L, buf, (size_t)n);
			return 1;
}
static struct luaL_Reg bitlib[13];
static void init_globals(void)
{
			luaO_nilobject_.value.p = ((void *)0);
			luaO_nilobject_.tt = 0;
			int i = 0;
			log_2[i++] = 0;
			log_2[i++] = 1;
			log_2[i++] = 2;
			log_2[i++] = 2;
			log_2[i++] = 3;
			log_2[i++] = 3;
			log_2[i++] = 3;
			log_2[i++] = 3;
			log_2[i++] = 4;
			log_2[i++] = 4;
			log_2[i++] = 4;
			log_2[i++] = 4;
			log_2[i++] = 4;
			log_2[i++] = 4;
			log_2[i++] = 4;
			log_2[i++] = 4;
			log_2[i++] = 5;
			log_2[i++] = 5;
			log_2[i++] = 5;
			log_2[i++] = 5;
			log_2[i++] = 5;
			log_2[i++] = 5;
			log_2[i++] = 5;
			log_2[i++] = 5;
			log_2[i++] = 5;
			log_2[i++] = 5;
			log_2[i++] = 5;
			log_2[i++] = 5;
			log_2[i++] = 5;
			log_2[i++] = 5;
			log_2[i++] = 5;
			log_2[i++] = 5;
			log_2[i++] = 6;
			log_2[i++] = 6;
			log_2[i++] = 6;
			log_2[i++] = 6;
			log_2[i++] = 6;
			log_2[i++] = 6;
			log_2[i++] = 6;
			log_2[i++] = 6;
			log_2[i++] = 6;
			log_2[i++] = 6;
			log_2[i++] = 6;
			log_2[i++] = 6;
			log_2[i++] = 6;
			log_2[i++] = 6;
			log_2[i++] = 6;
			log_2[i++] = 6;
			log_2[i++] = 6;
			log_2[i++] = 6;
			log_2[i++] = 6;
			log_2[i++] = 6;
			log_2[i++] = 6;
			log_2[i++] = 6;
			log_2[i++] = 6;
			log_2[i++] = 6;
			log_2[i++] = 6;
			log_2[i++] = 6;
			log_2[i++] = 6;
			log_2[i++] = 6;
			log_2[i++] = 6;
			log_2[i++] = 6;
			log_2[i++] = 6;
			log_2[i++] = 6;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 7;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			log_2[i++] = 8;
			i = 0;
			luaT_typenames[i++] = "nil";
			luaT_typenames[i++] = "boolean";
			luaT_typenames[i++] = "userdata";
			luaT_typenames[i++] = "number";
			luaT_typenames[i++] = "string";
			luaT_typenames[i++] = "table";
			luaT_typenames[i++] = "function";
			luaT_typenames[i++] = "userdata";
			luaT_typenames[i++] = "thread";
			luaT_typenames[i++] = "proto";
			luaT_typenames[i++] = "upval";
			i = 0;
			luaT_eventname[i++] = "__index";
			luaT_eventname[i++] = "__newindex";
			luaT_eventname[i++] = "__gc";
			luaT_eventname[i++] = "__mode";
			luaT_eventname[i++] = "__eq";
			luaT_eventname[i++] = "__add";
			luaT_eventname[i++] = "__sub";
			luaT_eventname[i++] = "__mul";
			luaT_eventname[i++] = "__div";
			luaT_eventname[i++] = "__mod";
			luaT_eventname[i++] = "__pow";
			luaT_eventname[i++] = "__unm";
			luaT_eventname[i++] = "__len";
			luaT_eventname[i++] = "__lt";
			luaT_eventname[i++] = "__le";
			luaT_eventname[i++] = "__concat";
			luaT_eventname[i++] = "__call";
			dummynode_.i_key.nk.next = ((void *)0);
			dummynode_.i_key.nk.tt = 0;
			dummynode_.i_key.nk.value.p = ((void *)0);
			dummynode_.i_val.value.p = ((void *)0);
			dummynode_.i_val.tt = 0;
			i = 0;
			luaP_opmodes[i++] = (((0) << 7) | ((1) << 6) | ((OpArgR) << 4) | ((OpArgN) << 2) | (iABC));
			luaP_opmodes[i++] = (((0) << 7) | ((1) << 6) | ((OpArgK) << 4) | ((OpArgN) << 2) | (iABx));
			luaP_opmodes[i++] = (((0) << 7) | ((1) << 6) | ((OpArgU) << 4) | ((OpArgU) << 2) | (iABC));
			luaP_opmodes[i++] = (((0) << 7) | ((1) << 6) | ((OpArgR) << 4) | ((OpArgN) << 2) | (iABC));
			luaP_opmodes[i++] = (((0) << 7) | ((1) << 6) | ((OpArgU) << 4) | ((OpArgN) << 2) | (iABC));
			luaP_opmodes[i++] = (((0) << 7) | ((1) << 6) | ((OpArgK) << 4) | ((OpArgN) << 2) | (iABx));
			luaP_opmodes[i++] = (((0) << 7) | ((1) << 6) | ((OpArgR) << 4) | ((OpArgK) << 2) | (iABC));
			luaP_opmodes[i++] = (((0) << 7) | ((0) << 6) | ((OpArgK) << 4) | ((OpArgN) << 2) | (iABx));
			luaP_opmodes[i++] = (((0) << 7) | ((0) << 6) | ((OpArgU) << 4) | ((OpArgN) << 2) | (iABC));
			luaP_opmodes[i++] = (((0) << 7) | ((0) << 6) | ((OpArgK) << 4) | ((OpArgK) << 2) | (iABC));
			luaP_opmodes[i++] = (((0) << 7) | ((1) << 6) | ((OpArgU) << 4) | ((OpArgU) << 2) | (iABC));
			luaP_opmodes[i++] = (((0) << 7) | ((1) << 6) | ((OpArgR) << 4) | ((OpArgK) << 2) | (iABC));
			luaP_opmodes[i++] = (((0) << 7) | ((1) << 6) | ((OpArgK) << 4) | ((OpArgK) << 2) | (iABC));
			luaP_opmodes[i++] = (((0) << 7) | ((1) << 6) | ((OpArgK) << 4) | ((OpArgK) << 2) | (iABC));
			luaP_opmodes[i++] = (((0) << 7) | ((1) << 6) | ((OpArgK) << 4) | ((OpArgK) << 2) | (iABC));
			luaP_opmodes[i++] = (((0) << 7) | ((1) << 6) | ((OpArgK) << 4) | ((OpArgK) << 2) | (iABC));
			luaP_opmodes[i++] = (((0) << 7) | ((1) << 6) | ((OpArgK) << 4) | ((OpArgK) << 2) | (iABC));
			luaP_opmodes[i++] = (((0) << 7) | ((1) << 6) | ((OpArgK) << 4) | ((OpArgK) << 2) | (iABC));
			luaP_opmodes[i++] = (((0) << 7) | ((1) << 6) | ((OpArgR) << 4) | ((OpArgN) << 2) | (iABC));
			luaP_opmodes[i++] = (((0) << 7) | ((1) << 6) | ((OpArgR) << 4) | ((OpArgN) << 2) | (iABC));
			luaP_opmodes[i++] = (((0) << 7) | ((1) << 6) | ((OpArgR) << 4) | ((OpArgN) << 2) | (iABC));
			luaP_opmodes[i++] = (((0) << 7) | ((1) << 6) | ((OpArgR) << 4) | ((OpArgR) << 2) | (iABC));
			luaP_opmodes[i++] = (((0) << 7) | ((0) << 6) | ((OpArgR) << 4) | ((OpArgN) << 2) | (iAsBx));
			luaP_opmodes[i++] = (((1) << 7) | ((0) << 6) | ((OpArgK) << 4) | ((OpArgK) << 2) | (iABC));
			luaP_opmodes[i++] = (((1) << 7) | ((0) << 6) | ((OpArgK) << 4) | ((OpArgK) << 2) | (iABC));
			luaP_opmodes[i++] = (((1) << 7) | ((0) << 6) | ((OpArgK) << 4) | ((OpArgK) << 2) | (iABC));
			luaP_opmodes[i++] = (((1) << 7) | ((1) << 6) | ((OpArgR) << 4) | ((OpArgU) << 2) | (iABC));
			luaP_opmodes[i++] = (((1) << 7) | ((1) << 6) | ((OpArgR) << 4) | ((OpArgU) << 2) | (iABC));
			luaP_opmodes[i++] = (((0) << 7) | ((1) << 6) | ((OpArgU) << 4) | ((OpArgU) << 2) | (iABC));
			luaP_opmodes[i++] = (((0) << 7) | ((1) << 6) | ((OpArgU) << 4) | ((OpArgU) << 2) | (iABC));
			luaP_opmodes[i++] = (((0) << 7) | ((0) << 6) | ((OpArgU) << 4) | ((OpArgN) << 2) | (iABC));
			luaP_opmodes[i++] = (((0) << 7) | ((1) << 6) | ((OpArgR) << 4) | ((OpArgN) << 2) | (iAsBx));
			luaP_opmodes[i++] = (((0) << 7) | ((1) << 6) | ((OpArgR) << 4) | ((OpArgN) << 2) | (iAsBx));
			luaP_opmodes[i++] = (((1) << 7) | ((0) << 6) | ((OpArgN) << 4) | ((OpArgU) << 2) | (iABC));
			luaP_opmodes[i++] = (((0) << 7) | ((0) << 6) | ((OpArgU) << 4) | ((OpArgU) << 2) | (iABC));
			luaP_opmodes[i++] = (((0) << 7) | ((0) << 6) | ((OpArgN) << 4) | ((OpArgN) << 2) | (iABC));
			luaP_opmodes[i++] = (((0) << 7) | ((1) << 6) | ((OpArgU) << 4) | ((OpArgN) << 2) | (iABx));
			luaP_opmodes[i++] = (((0) << 7) | ((1) << 6) | ((OpArgU) << 4) | ((OpArgN) << 2) | (iABC));
			i = 0;
			luaX_tokens[i++] = "and";
			luaX_tokens[i++] = "break";
			luaX_tokens[i++] = "do";
			luaX_tokens[i++] = "else";
			luaX_tokens[i++] = "elseif";
			luaX_tokens[i++] = "end";
			luaX_tokens[i++] = "false";
			luaX_tokens[i++] = "for";
			luaX_tokens[i++] = "function";
			luaX_tokens[i++] = "if";
			luaX_tokens[i++] = "in";
			luaX_tokens[i++] = "local";
			luaX_tokens[i++] = "nil";
			luaX_tokens[i++] = "not";
			luaX_tokens[i++] = "or";
			luaX_tokens[i++] = "repeat";
			luaX_tokens[i++] = "return";
			luaX_tokens[i++] = "then";
			luaX_tokens[i++] = "true";
			luaX_tokens[i++] = "until";
			luaX_tokens[i++] = "while";
			luaX_tokens[i++] = "..";
			luaX_tokens[i++] = "...";
			luaX_tokens[i++] = "==";
			luaX_tokens[i++] = ">=";
			luaX_tokens[i++] = "<=";
			luaX_tokens[i++] = "~=";
			luaX_tokens[i++] = "<number>";
			luaX_tokens[i++] = "<name>";
			luaX_tokens[i++] = "<string>";
			luaX_tokens[i++] = "<eof>";
			luaX_tokens[i++] = ((void *)0);
			i = 0;
			priority[i].left = 6;
			priority[i++].right = 6;
			priority[i].left = 6;
			priority[i++].right = 6;
			priority[i].left = 7;
			priority[i++].right = 7;
			priority[i].left = 7;
			priority[i++].right = 7;
			priority[i].left = 7;
			priority[i++].right = 7;
			priority[i].left = 10;
			priority[i++].right = 9;
			priority[i].left = 5;
			priority[i++].right = 4;
			priority[i].left = 3;
			priority[i++].right = 3;
			priority[i].left = 3;
			priority[i++].right = 3;
			priority[i].left = 3;
			priority[i++].right = 3;
			priority[i].left = 3;
			priority[i++].right = 3;
			priority[i].left = 3;
			priority[i++].right = 3;
			priority[i].left = 3;
			priority[i++].right = 3;
			priority[i].left = 2;
			priority[i++].right = 2;
			priority[i].left = 1;
			priority[i++].right = 1;
			i = 0;
			base_funcs[i].name = "assert";
			base_funcs[i].func = luaB_assert;
			i++;
			base_funcs[i].name = "error";
			base_funcs[i].func = luaB_error;
			i++;
			base_funcs[i].name = "loadfile";
			base_funcs[i].func = luaB_loadfile;
			i++;
			base_funcs[i].name = "loadstring";
			base_funcs[i].func = luaB_loadstring;
			i++;
			base_funcs[i].name = "next";
			base_funcs[i].func = luaB_next;
			i++;
			base_funcs[i].name = "pcall";
			base_funcs[i].func = luaB_pcall;
			i++;
			base_funcs[i].name = "rawget";
			base_funcs[i].func = luaB_rawget;
			i++;
			base_funcs[i].name = "setfenv";
			base_funcs[i].func = luaB_setfenv;
			i++;
			base_funcs[i].name = "setmetatable";
			base_funcs[i].func = luaB_setmetatable;
			i++;
			base_funcs[i].name = "tonumber";
			base_funcs[i].func = luaB_tonumber;
			i++;
			base_funcs[i].name = "type";
			base_funcs[i].func = luaB_type;
			i++;
			base_funcs[i].name = "unpack";
			base_funcs[i].func = luaB_unpack;
			i++;
			base_funcs[i].name = ((void *)0);
			base_funcs[i].func = ((void *)0);
			i = 0;
			tab_funcs[i].name = "concat";
			tab_funcs[i].func = tconcat;
			i++;
			tab_funcs[i].name = "insert";
			tab_funcs[i].func = tinsert;
			i++;
			tab_funcs[i].name = "remove";
			tab_funcs[i].func = tremove;
			i++;
			tab_funcs[i].name = "sort";
			tab_funcs[i].func = sort;
			i++;
			tab_funcs[i].name = ((void *)0);
			tab_funcs[i].func = ((void *)0);
			fnames[0] = "input";
			fnames[1] = "output";
			i = 0;
			iolib[i].name = "close";
			iolib[i].func = io_close;
			i++;
			iolib[i].name = "flush";
			iolib[i].func = io_flush;
			i++;
			iolib[i].name = "input";
			iolib[i].func = io_input;
			i++;
			iolib[i].name = "lines";
			iolib[i].func = io_lines;
			i++;
			iolib[i].name = "open";
			iolib[i].func = io_open;
			i++;
			iolib[i].name = "output";
			iolib[i].func = io_output;
			i++;
			iolib[i].name = "read";
			iolib[i].func = io_read;
			i++;
			iolib[i].name = "type";
			iolib[i].func = io_type;
			i++;
			iolib[i].name = "write";
			iolib[i].func = io_write;
			i++;
			iolib[i].name = ((void *)0);
			iolib[i].func = ((void *)0);
			i = 0;
			flib[i].name = "close";
			flib[i].func = io_close;
			i++;
			flib[i].name = "flush";
			flib[i].func = f_flush;
			i++;
			flib[i].name = "lines";
			flib[i].func = f_lines;
			i++;
			flib[i].name = "read";
			flib[i].func = f_read;
			i++;
			flib[i].name = "write";
			flib[i].func = f_write;
			i++;
			flib[i].name = "__gc";
			flib[i].func = io_gc;
			i++;
			flib[i].name = ((void *)0);
			flib[i].func = ((void *)0);
			i = 0;
			syslib[i].name = "exit";
			syslib[i].func = os_exit;
			i++;
			syslib[i].name = "remove";
			syslib[i].func = os_remove;
			i++;
			syslib[i].name = ((void *)0);
			syslib[i].func = ((void *)0);
			i = 0;
			strlib[i].name = "byte";
			strlib[i].func = str_byte;
			i++;
			strlib[i].name = "char";
			strlib[i].func = str_char;
			i++;
			strlib[i].name = "find";
			strlib[i].func = str_find;
			i++;
			strlib[i].name = "format";
			strlib[i].func = str_format;
			i++;
			strlib[i].name = "gmatch";
			strlib[i].func = gmatch;
			i++;
			strlib[i].name = "gsub";
			strlib[i].func = str_gsub;
			i++;
			strlib[i].name = "lower";
			strlib[i].func = str_lower;
			i++;
			strlib[i].name = "match";
			strlib[i].func = str_match;
			i++;
			strlib[i].name = "rep";
			strlib[i].func = str_rep;
			i++;
			strlib[i].name = "sub";
			strlib[i].func = str_sub;
			i++;
			strlib[i].name = "upper";
			strlib[i].func = str_upper;
			i++;
			strlib[i].name = ((void *)0);
			strlib[i].func = ((void *)0);
			i = 0;
			lualibs[i].name = "";
			lualibs[i].func = luaopen_base;
			i++;
			lualibs[i].name = "table";
			lualibs[i].func = luaopen_table;
			i++;
			lualibs[i].name = "io";
			lualibs[i].func = luaopen_io;
			i++;
			lualibs[i].name = "os";
			lualibs[i].func = luaopen_os;
			i++;
			lualibs[i].name = "string";
			lualibs[i].func = luaopen_string;
			i++;
			lualibs[i].name = ((void *)0);
			lualibs[i].func = ((void *)0);
			i = 0;
			bitlib[i].name = "tobit";
			bitlib[i].func = tobit;
			i++;
			bitlib[i].name = "bnot";
			bitlib[i].func = bnot;
			i++;
			bitlib[i].name = "band";
			bitlib[i].func = band;
			i++;
			bitlib[i].name = "bor";
			bitlib[i].func = bor;
			i++;
			bitlib[i].name = "bxor";
			bitlib[i].func = bxor;
			i++;
			bitlib[i].name = "lshift";
			bitlib[i].func = lshift;
			i++;
			bitlib[i].name = "rshift";
			bitlib[i].func = rshift;
			i++;
			bitlib[i].name = "arshift";
			bitlib[i].func = arshift;
			i++;
			bitlib[i].name = "rol";
			bitlib[i].func = rol;
			i++;
			bitlib[i].name = "ror";
			bitlib[i].func = ror;
			i++;
			bitlib[i].name = "bswap";
			bitlib[i].func = bswap;
			i++;
			bitlib[i].name = "tohex";
			bitlib[i].func = tohex;
			i++;
			bitlib[i].name = ((void *)0);
			bitlib[i].func = ((void *)0);
}
int main(int argc, char **argv)
{
			init_globals();
			lua_State *L = luaL_newstate();
			int i;
			luaL_openlibs(L);
			luaL_register(L, "bit", bitlib);
			if (argc < 2)
			return sizeof(void *);
			lua_createtable(L, 0, 1);
			lua_pushstring(L, argv[1]);
			lua_rawseti(L, -2, 0);
			lua_setfield(L, (-10002), ("arg"));
			if (luaL_loadfile(L, argv[1]))
			goto err;
			for (i = 2; i < argc; i++)
			lua_pushstring(L, argv[i]);
			if (lua_pcall(L, argc - 2, 0, 0)) {
			err:
			fprintf(stderr, "Error: %s\n", lua_tolstring(L, (-1), ((void *)0)));
			return 1;
			}
			lua_close(L);
			return 0;
}
