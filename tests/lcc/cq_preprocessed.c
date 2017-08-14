
extern int printf(const char *, ...);
static int McCarthy(int x);
static void clobber(int x, int *y);
static void zerofill(char *x);
static int sumof(char *x);
static int svtest(int n);
static void setev(void );
static int testev(void);
static long pow2(long n);
static int zero(void);
struct defs {
			int cbits;
			int ibits;
			int sbits;
			int lbits;
			int ubits;
			int fbits;
			int dbits;
			float fprec;
			float dprec;
			int flgs;
			int flgm;
			int flgd;
			int flgl;
			int rrc;
			int crc;
			char rfs[8];
			};
static int s22(struct defs *);
static int s241(struct defs *);
static int s243(struct defs *);
static int s244(struct defs *);
static int s25(struct defs *);
static int s26(struct defs *);
static int s4(struct defs *);
static int s61(struct defs *);
static int s626(struct defs *);
static int s71(struct defs *);
static int s72(struct defs *);
static int s757(struct defs *);
static int s7813(struct defs *);
static int s714(struct defs *);
static int s715(struct defs *);
static int s81(struct defs *);
static int s84(struct defs *);
static int s85(struct defs *);
static int s86(struct defs *);
static int s88(struct defs *);
static int s9(struct defs *);
static int s715f(int x, int y, int z);
static int regc(void);
static int regi(void);
static int regp(void);
static int *fip(int x);
static int glork(int x);
static int one(void);
static char *type[7];
static long g[39];
int main(int n, const char *args[])
{
			type[0] = "char";
			type[1] = "short";
			type[2] = "int";
			type[4] = "long";
			type[5] = "unsigned";
			type[6] = "float";
			type[7] = "double";
		g[0] = 0;
		g[1] = 0;
		g[2] = 0;
		g[3] = 0;
		g[4] = 0;
		g[5] = 0;
		g[6] = 0;
		g[7] = 0;
		g[8] = 0;
		g[9] = 0;
		g[10] = 0;
		g[11] = 0;
		g[12] = 0;
		g[13] = 0;
		g[14] = 0;
		g[15] = 0;
		g[16] = 0;
		g[17] = 0;
		g[18] = 6;
		g[19] = 0;
		g[20] = 8;
		g[21] = 0;
		g[22] = 12;
		g[23] = 0;
		g[24] = 16;
		g[25] = 0;
		g[26] = 18;
		g[27] = 0;
		g[28] = 20;
		g[29] = 0;
		g[30] = 24;
		g[31] = 0;
		g[32] = 28;
		g[33] = 0;
		g[34] = 30;
		g[35] = 0;
		g[36] = 32;
		g[37] = 0;
		g[38] = 36;
			int j;
			int (*sec[21])(struct defs *);
			sec[0] = s22;
			sec[1] = s241;
			sec[2] = s243;
			sec[3] = s244;
			sec[4] = s25;
			sec[5] = s26;
			sec[6] = s4;
			sec[7] = s61;
			sec[8] = s626;
			sec[9] = s71;
			sec[10] = s72;
			sec[11] = s757;
			sec[12] = s7813;
			sec[13] = s714;
			sec[14] = s715;
			sec[15] = s81;
			sec[16] = s84;
			sec[17] = s85;
			sec[18] = s86;
			sec[19] = s88;
			sec[20] = s9;
			static struct defs d0, *pd0;
			d0.flgs = 1;
			d0.flgm = 1;
			d0.flgd = 1;
			d0.flgl = 1;
			pd0 = &d0;
			for (j=0; j<sizeof(sec) / sizeof(sec[0]); j++) {
			d0.rrc = sec[j](pd0);
			d0.crc = d0.crc+d0.rrc;
			if(d0.flgs != 0) printf("Section %s returned %d.\n",d0.rfs,d0.rrc);
			}
			if(d0.crc == 0) printf("\nNo errors detected.\n");
			else printf("\nFailed %d errors.\n", d0.crc);
			return 0;
}
static const char *s22er = "s22,er%d\n";
static const char *qs22 = "s22    ";
static int s22(struct defs *pd0)
{
			int a234, a;
			int _, _234, A, rc;
			char *ps, *pt;
			rc = 0;
			ps = qs22;
			pt = pd0 -> rfs;
			while (*pt++ = *ps++);
			a=1;
			_=2;
			_234=3;
			a234=4;
			if(a+_+_234+a234 != 10) {
			rc = rc+1;
			if(pd0->flgd != 0) printf(s22er,1);
			}
			A = 2;
			if (A == a) {
			rc = rc+4;
			if (pd0->flgd != 0) printf(s22er,4);
			}
			return(rc);
}
static const char *s241er = "s241,er%d\n";
static const char *qs241 = "s241   ";
static int s241(struct defs *pd0)
{
			char *ps, *pt;
			int rc, j, lrc;
			long d[39], o[39], x[39];
			rc = 0;
			lrc = 0;
			ps = qs241;
			pt = pd0 -> rfs;
			while (*pt++ = *ps++);
			if ( 8 != 010
			|| 16 != 020
			|| 24 != 030
			|| 32 != 040
			|| 40 != 050
			|| 48 != 060
			|| 56 != 070
			|| 64 != 0100
			|| 72 != 0110
			|| 80 != 0120
			|| 9 != 0011
			|| 17 != 0021
			|| 25 != 0031
			|| 33 != 0041
			|| 41 != 0051
			|| 49 != 0061
			|| 57 != 0071
			|| 65 != 0101
			|| 73 != 0111
			|| 81 != 0121 ){
			rc = rc+1;
			if( pd0->flgd != 0 ) printf(s241er,1);
			}
			if ( 0x00abcdef != 0xabcdef
			|| 0xabcdef != 0Xabcdef || 0Xabcdef != 0XAbcdef
			|| 0XAbcdef != 0XABcdef || 0XABcdef != 0XABCdef
			|| 0XABCdef != 0XABCDef || 0XABCDef != 0XABCDEf
			|| 0XABCDEf != 0XABCDEF || 0xABCDEF != 11259375 ){
			rc = rc+2;
			if( pd0->flgd != 0 ) printf(s241er,2);
			}
			if ( sizeof 010000000000 != sizeof(long)
			|| sizeof 1073741824 != sizeof(long)
			|| sizeof 0x40000000 != sizeof(long) ){
			rc = rc+4;
			if( pd0->flgd != 0 ) printf(s241er,4);
			}
			if ( sizeof 67l != sizeof(long)
			|| sizeof 67L != sizeof(long)
			|| sizeof 067l != sizeof(long)
			|| sizeof 067L != sizeof(long)
			|| sizeof 0X67l != sizeof(long)
			|| sizeof 0x67L != sizeof(long) ){
			rc = rc+8;
			if( pd0 -> flgd != 0 ) printf(s241er,8);
			}
			for ( j=0; j<17; j++ ) g[j] = j;
			for ( j=18; j<39; ) {
			g[j] = pow2(g[j]);
			g[j-1] = g[j] - 1;
			j = j+2;
			}
			d[0] = 0; o[0] = 00; x[0] = 0x0;
			d[1] = 1; o[1] = 01; x[1] = 0x1;
			d[2] = 2; o[2] = 02; x[2] = 0x2;
			d[3] = 3; o[3] = 03; x[3] = 0x3;
			d[4] = 4; o[4] = 04; x[4] = 0x4;
			d[5] = 5; o[5] = 05; x[5] = 0x5;
			d[6] = 6; o[6] = 06; x[6] = 0x6;
			d[7] = 7; o[7] = 07; x[7] = 0x7;
			d[8] = 8; o[8] = 010; x[8] = 0x8;
			d[9] = 9; o[9] = 011; x[9] = 0x9;
			d[10] = 10; o[10] = 012; x[10] = 0xa;
			d[11] = 11; o[11] = 013; x[11] = 0xb;
			d[12] = 12; o[12] = 014; x[12] = 0xc;
			d[13] = 13; o[13] = 015; x[13] = 0xd;
			d[14] = 14; o[14] = 016; x[14] = 0xe;
			d[15] = 15; o[15] = 017; x[15] = 0xf;
			d[16] = 16; o[16] = 020; x[16] = 0x10;
			d[17] = 63; o[17] = 077; x[17] = 0x3f;
			d[18] = 64; o[18] = 0100; x[18] = 0x40;
			d[19] = 255; o[19] = 0377; x[19] = 0xff;
			d[20] = 256; o[20] = 0400; x[20] = 0x100;
			d[21] = 4095; o[21] = 07777; x[21] = 0xfff;
			d[22] = 4096; o[22] = 010000; x[22] = 0x1000;
			d[23] = 65535; o[23] = 0177777; x[23] = 0xffff;
			d[24] = 65536; o[24] = 0200000; x[24] = 0x10000;
			d[25] = 262143; o[25] = 0777777; x[25] = 0x3ffff;
			d[26] = 262144; o[26] = 01000000; x[26] = 0x40000;
			d[27] = 1048575; o[27] = 03777777; x[27] = 0xfffff;
			d[28] = 1048576; o[28] = 04000000; x[28] = 0x100000;
			d[29] = 16777215; o[29] = 077777777; x[29] = 0xffffff;
			d[30] = 16777216; o[30] = 0100000000; x[30] = 0x1000000;
			d[31] = 268435455; o[31] = 01777777777; x[31] = 0xfffffff;
			d[32] = 268435456; o[32] = 02000000000; x[32] = 0x10000000;
			d[33] = 1073741823; o[33] = 07777777777; x[33] = 0x3fffffff;
			d[34] = 1073741824; o[34] = 010000000000; x[34] = 0x40000000;
			d[35] = 4294967295; o[35] = 037777777777; x[35] = 0xffffffff;
			d[36] = 4294967296; o[36] = 040000000000; x[36] = 0x100000000;
			d[37] = 68719476735; o[37] = 0777777777777; x[37] = 0xfffffffff;
			d[38] = 68719476736; o[38] = 01000000000000; x[38] = 0x1000000000;
			for (j=0; j<39; j++){
			if ( g[j] != d[j]
			|| d[j] != o[j]
			|| o[j] != x[j]) {
			if( pd0 -> flgm != 0 ) {
			printf("Decimal and octal/hex constants sometimes give\n");
			printf("   different results when assigned to longs.\n");
			}
			}
			}
			if (lrc != 0) rc =16;
			return rc;
}
static long pow2(long n)
{
			long s;
			s = 1;
			while(n--) s = s*2;
			return s;
}
static const char *s243er = "s243,er%d\n";
static const char *qs243 = "s243   ";
static int s243(struct defs *pd0)
{
			char *ps, *pt;
			int rc;
			char chars[256];
			rc = 0;
			ps = qs243;
			pt = pd0->rfs;
			while(*pt++ = *ps++);
			zerofill(chars);
			chars['a'] = 1; chars['A'] = 1; chars['~'] = 1; chars['0'] = 1;
			chars['b'] = 1; chars['B'] = 1; chars['!'] = 1; chars['1'] = 1;
			chars['c'] = 1; chars['C'] = 1; chars['"'] = 1; chars['2'] = 1;
			chars['d'] = 1; chars['D'] = 1; chars['#'] = 1; chars['3'] = 1;
			chars['e'] = 1; chars['E'] = 1; chars['%'] = 1; chars['4'] = 1;
			chars['f'] = 1; chars['F'] = 1; chars['&'] = 1; chars['5'] = 1;
			chars['g'] = 1; chars['G'] = 1; chars['('] = 1; chars['6'] = 1;
			chars['h'] = 1; chars['H'] = 1; chars[')'] = 1; chars['7'] = 1;
			chars['i'] = 1; chars['I'] = 1; chars['_'] = 1; chars['8'] = 1;
			chars['j'] = 1; chars['J'] = 1; chars['='] = 1; chars['9'] = 1;
			chars['k'] = 1; chars['K'] = 1; chars['-'] = 1;
			chars['l'] = 1; chars['L'] = 1; chars['^'] = 1;
			chars['m'] = 1; chars['M'] = 1; chars['|'] = 1; chars['\n'] = 1;
			chars['n'] = 1; chars['N'] = 1; chars['\t'] = 1;
			chars['o'] = 1; chars['O'] = 1; chars['{'] = 1; chars['\b'] = 1;
			chars['p'] = 1; chars['P'] = 1; chars['}'] = 1; chars['\r'] = 1;
			chars['q'] = 1; chars['Q'] = 1; chars['['] = 1; chars['\f'] = 1;
			chars['r'] = 1; chars['R'] = 1; chars[']'] = 1;
			chars['s'] = 1; chars['S'] = 1; chars['+'] = 1; chars['\\'] = 1;
			chars['t'] = 1; chars['T'] = 1; chars[';'] = 1; chars['\''] = 1;
			chars['u'] = 1; chars['U'] = 1; chars['*'] = 1;
			chars['v'] = 1; chars['V'] = 1; chars[':'] = 1; chars['\0'] = 1;
			chars['w'] = 1; chars['W'] = 1; chars['<'] = 1; chars[' '] = 1;
			chars['x'] = 1; chars['X'] = 1; chars['>'] = 1;
			chars['y'] = 1; chars['Y'] = 1; chars[','] = 1;
			chars['z'] = 1; chars['Z'] = 1; chars['.'] = 1;
			chars['?'] = 1;
			chars['/'] = 1;
			if(sumof(chars) != 98){
			rc = rc+1;
			if(pd0->flgd != 0) printf(s243er,1);
			}
			if( '\0' != 0 || '\01' != 1 || '\02' != 2
			|| '\03' != 3 || '\04' != 4 || '\05' != 5
			|| '\06' != 6 || '\07' != 7 || '\10' != 8
			|| '\17' != 15 || '\20' != 16 || '\77' != 63
			|| '\100' != 64 || '\177' != 127 ){
			rc = rc+8;
			if(pd0->flgd != 0) printf(s243er,8);
			}
			return rc;
}
static void zerofill(char *x)
{
			int j;
			for (j=0; j<256; j++) *x++ = 0;
}
static int sumof(char *x)
{
			char *p;
			int total, j;
			p = x;
			total = 0;
			for(j=0; j<256; j++) total = total+ *p++;
			return total;
}
static const char *s244er = "s244,er%d\n";
static const char *qs244 = "s244   ";
static int s244(struct defs *pd0)
{
			double a[8];
			int rc, lrc, j;
			char *ps, *pt;
			ps = qs244;
			pt = pd0->rfs;
			while(*pt++ = *ps++);
			rc = 0;
			lrc = 0;
			a[0] = .1250E+04;
			a[1] = 1.250E3;
			a[2] = 12.50E02;
			a[3] = 125.0e+1;
			a[4] = 1250e00;
			a[5] = 12500.e-01;
			a[6] = 125000e-2;
			a[7] = 1250.;
			lrc = 0;
			for (j=0; j<7; j++) if(a[j] != a[j+1]) lrc = 1;
			if(lrc != 0) {
			if(pd0->flgd != 0) printf(s244er,1);
			rc = rc+1;
			}
			if ( (sizeof .1250E+04 ) != sizeof(double)
			|| (sizeof 1.250E3 ) != sizeof(double)
			|| (sizeof 12.50E02 ) != sizeof(double)
			|| (sizeof 1.250e+1 ) != sizeof(double)
			|| (sizeof 1250e00 ) != sizeof(double)
			|| (sizeof 12500.e-01) != sizeof(double)
			|| (sizeof 125000e-2 ) != sizeof(double)
			|| (sizeof 1250. ) != sizeof(double)){
			if(pd0->flgd != 0) printf(s244er,2);
			rc = rc+2;
			}
			return rc;
}
static const char *s25er = "s25,er%d\n";
static const char *qs25 = "s25    ";
static int s25(struct defs *pd0)
{
			char *s, *s2;
			int rc, lrc, j;
			char *ps, *pt;
			ps = qs25;
			pt = pd0->rfs;
			while(*pt++ = *ps++);
			rc = 0;
			s = "...";
			if ( s[0] != s[1] || s[1] != s[2]
			|| s[2] != '.' ) {
			rc = rc+1;
			if(pd0->flgd != 0) printf(s25er,1);
			}
			if( s[3] != '\0' ){
			rc = rc+4;
			if(pd0->flgd != 0) printf(s25er,4);
			}
			if( ".\"."[1] != '"' ){
			rc = rc+8;
			if(pd0->flgd != 0) printf(s25er,8);
			}
			s = "\n\t\b\r\f\\\'";
			if( s[0] != '\n'
			|| s[1] != '\t'
			|| s[2] != '\b'
			|| s[3] != '\r'
			|| s[4] != '\f'
			|| s[5] != '\\'
			|| s[6] != '\'' ){
			rc = rc+16;
			if( pd0->flgd != 0) printf(s25er,16);
			}
			s2 = "queep!";
			s = "queep!";
			lrc = 0;
			for (j=0; j<sizeof "queep!"; j++) if(s[j] != s2[j]) lrc = 1;
			if (lrc != 0){
			rc = rc+32;
			if(pd0->flgd != 0) printf(s25er,32);
			}
			return rc;
}
static const char *qs26 = "s26    ";
static const char *s = "%3d bits in %ss.\n";
static const char *s2 = "%e is the least number that can be added to 1. (%s).\n";
static int s26(struct defs *pd0)
{
			char *ps, *pt;
			char c0, c1;
			float temp, one, delta;
			double tempd, oned;
			ps = qs26;
			pt = pd0->rfs;
			while(*pt++ = *ps++);
			pd0->cbits = 0;
			c0 = 0;
			c1 = 1;
			while(c0 != c1) {
			c1 = c1<<1;
			pd0->cbits = pd0->cbits+1;
			}
			pd0->ibits = pd0->cbits * sizeof(int);
			pd0->sbits = pd0->cbits * sizeof(short);
			pd0->lbits = pd0->cbits * sizeof(long);
			pd0->ubits = pd0->cbits * sizeof(unsigned);
			pd0->fbits = pd0->cbits * sizeof(float);
			pd0->dbits = pd0->cbits * sizeof(double);
			one = 1.;
			delta = 1.;
			temp = 0.;
			while(temp != one) {
			temp = one+delta;
			delta = delta/2.;
			}
			pd0->fprec = delta * 4.;
			oned = 1.;
			delta = 1.;
			tempd = 0.;
			while(tempd != oned) {
			tempd = oned+delta;
			delta = delta/2.;
			}
			pd0->dprec = delta * 4.;
			if(pd0->flgm != 0) {
			printf(s,pd0->cbits,"char");
			printf(s,pd0->ibits,"int");
			printf(s,pd0->sbits,"short");
			printf(s,pd0->lbits,"long");
			printf(s,pd0->ubits,"unsigned");
			printf(s,pd0->fbits,"float");
			printf(s,pd0->dbits,"double");
			printf(s2,pd0->fprec,"float");
			printf(s2,pd0->dprec,"double");
			}
			return 0;
}
			static const char *s4er = "s4,er%d\n";
			static const char *qs4 = "s4     ";
static int extvar;
static int s4(struct defs *pd0)
{
			char *ps, *pt;
			int j, rc;
			short sint;
			int pint;
			long lint;
			unsigned target;
			unsigned int mask;
			rc = 0;
			ps = qs4;
			pt = pd0->rfs;
			while(*pt++ = *ps++);
			for (j=0; j<3; j++)
			if(svtest(j) != zero()){
			rc = 1;
			if(pd0->flgd != 0) printf(s4er,1);
			}
			;
			setev();
			if(testev() != 0){
			rc=rc+2;
			if(pd0->flgd != 0) printf(s4er,2);
			}
			if(sizeof lint < sizeof pint || sizeof pint < sizeof sint){
			rc = rc+4;
			if(pd0->flgd != 0) printf(s4er,4);
			}
			target = ~0U;
			mask = 1;
			for(j=0; j<(sizeof target)*pd0->cbits; j++){
			mask = mask&target;
			target = target>>1;
			}
			if(mask != 1 || target != 0){
			rc = rc+8;
			if(pd0->flgd != 0) printf(s4er,8);
			}
			return rc;
}
static int svtest(int n)
{
			static int k;
			int rc;
			switch (n) {
			case 0: k = 1978;
			rc = 0;
			break;
			case 1: if(k != 1978) rc = 1;
			else{
			k = 1929;
			rc = 0;
			}
			break;
			case 2: if(k != 1929) rc = 1;
			else rc = 0;
			break;
			}
			return rc;
}
static int zero(void){
			static int k;
			int rc;
			k = 2;
			rc = 0;
			return rc;
}
static int testev(void){
			if(extvar != 1066) return 1;
			else return 0;
}
			static const char *s61er = "s61,er%d\n";
			static const char *qs61 = "s61    ";
			static const char *upper_alpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
			static const char *lower_alpha = "abcdefghijklmnopqrstuvwxyz";
			static const char *numbers = "0123456789";
			static const char *special_characters = "~!\"#%&()_=-^|{}[]+;*:<>,.?/";
			static const char *extra_special_characters = "\n\t\b\r\f\\\'";
			static const char *blank_and_NUL = " \0";
static int s61(struct defs *pd0)
{
			short from, shortint;
			long int to, longint;
			int rc, lrc;
			int j;
			char fromc, charint;
			char *wd, *pc[6];
			char *ps, *pt;
			ps = qs61;
			pt = pd0->rfs;
			rc = 0;
			while (*pt++ = *ps++);
			from = -19;
			to = from;
			if(to != -19){
			rc = rc+1;
			if(pd0->flgd != 0) printf(s61er,1);
			}
			pc[0] = upper_alpha;
			pc[1] = lower_alpha;
			pc[2] = numbers;
			pc[3] = special_characters;
			pc[4] = extra_special_characters;
			pc[5] = blank_and_NUL;
			lrc = 0;
			for (j=0; j<6; j++)
			while(*pc[j]) if(*pc[j]++ < 0) lrc =1;
			if(lrc != 0){
			rc=rc+2;
			if(pd0->flgd != 0) printf(s61er,2);
			}
			longint = 1048579;
			shortint = longint;
			charint = longint;
			if((shortint != longint && shortint != 3) ||
			(charint != longint && charint != 3)) {
			rc = rc+8;
			if(pd0->flgd != 0) printf(s61er,8);
			}
			return rc;
}
			static const char *s626er = "s626,er%d\n";
			static const char *qs626 = "s626   ";
static int s626(struct defs *pd0)
{
			int rc;
			char *ps, *pt;
			float eps, f1, f2, f3, f4, f;
			long lint1, lint2, l, ls;
			char c, t[28], t0;
			short s;
			int is, i, j;
			unsigned u, us;
			double d, ds;
			ps = qs626;
			pt = pd0->rfs;
			rc = 0;
			while (*pt++ = *ps++);
			f1 = 1.;
			lint1 = 1.;
			lint2 = 1.;
			for(j=0;j<pd0->lbits-2;j++){
			f1 = f1*2;
			lint2 = (lint2<<1)|lint1;
			}
			f2 = lint2;
			f1 = (f1-f2)/f1;
			if(f1>2.*pd0->fprec){
			rc = rc+2;
			if(pd0->flgd != 0) printf(s626er,2);
			}
			c = 125;
			s = 125;
			i = 125; is = 15625;
			u = 125; us = 15625;
			l = 125; ls = 15625;
			f = 125.;
			d = 125.; ds = 15625.;
			for(j=0;j<28;j++) t[j] = 0;
			if(c*c != is) t[ 0] = 1;
			if(s*c != is) t[ 1] = 1;
			if(s*s != is) t[ 2] = 1;
			if(i*c != is) t[ 3] = 1;
			if(i*s != is) t[ 4] = 1;
			if(i*i != is) t[ 5] = 1;
			if(u*c != us) t[ 6] = 1;
			if(u*s != us) t[ 7] = 1;
			if(u*i != us) t[ 8] = 1;
			if(u*u != us) t[ 9] = 1;
			if(l*c != ls) t[10] = 1;
			if(l*s != ls) t[11] = 1;
			if(l*i != ls) t[12] = 1;
			if(l*u != us) t[13] = 1;
			if(l*l != ls) t[14] = 1;
			if(f*c != ds) t[15] = 1;
			if(f*s != ds) t[16] = 1;
			if(f*i != ds) t[17] = 1;
			if(f*u != ds) t[18] = 1;
			if(f*l != ds) t[19] = 1;
			if(f*f != ds) t[20] = 1;
			if(d*c != ds) t[21] = 1;
			if(d*s != ds) t[22] = 1;
			if(d*i != ds) t[23] = 1;
			if(d*u != ds) t[24] = 1;
			if(d*l != ds) t[25] = 1;
			if(d*f != ds) t[26] = 1;
			if(d*d != ds) t[27] = 1;
			t0 = 0;
			for(j=0; j<28; j++) t0 = t0+t[j];
			if(t0 != 0){
			rc = rc+4;
			if(pd0->flgd != 0){
			printf(s626er,4);
			printf("   key=");
			for(j=0;j<28;j++) printf("%d",t[j]);
			printf("\n");
			}
			}
			l = (unsigned)0100000;
			if((long)l > (unsigned)0100000){
			rc = rc+8;
			if(pd0->flgd != 0) printf(s626er,8);
			}
			return rc;
}
			static const char *s71er = "s71,er%d\n";
			static const char *qs71 = "s71    ";
static int s71(struct defs *pd0)
{
			int rc;
			char *ps, *pt;
			static char q = 'q';
			int x[10], a, b, *p;
			ps = qs71;
			pt = pd0->rfs;
			rc = 0;
			while (*pt++ = *ps++);
			if(*"queep" != q){
			rc = rc+1;
			if(pd0->flgd != 0) printf(s71er,1);
			}
			if((2+3) != 2+3) {
			rc = rc+2;
			if(pd0->flgd != 0) printf(s71er,2);
			}
			x[5] = 1942;
			if(x[5] != 1942 || x[5] != *((x)+(5))){
			rc = rc+4;
			if(pd0->flgd != 0) printf(s71er,4);
			}
			if ( McCarthy(-5) != 91){
			rc = rc+8;
			if(pd0->flgd != 0) printf(s71er,8);
			}
			a = 2;
			b = 3;
			p = &b;
			clobber(a,p);
			if(a != 2 || b != 2){
			rc = rc+16;
			if(pd0->flgd != 0) printf(s71er,16);
			}
			if(pd0->dprec != (*pd0).dprec){
			rc = rc+32;
			if(pd0->flgd != 0) printf(s71er,32);
			}
			return rc;
}
static int McCarthy(int x)
{
			if(x>100) return x-10;
			else return McCarthy( McCarthy(x+11));
}
static void clobber(int x, int *y)
{
			x = 3;
			*y = 2;
}
			static const char *f = "Local error %d.\n";
			static const char *s714er = "s714,er%d\n";
			static const char *qs714 = "s714   ";
static int s714(struct defs *pd0)
{
			register int prlc, lrc;
			int rc;
			char cl, cr;
			short sl, sr;
			int il, ir;
			long ll, lr;
			unsigned ul, ur;
			float fl, fr;
			double dl, dr;
			char *ps, *pt;
			ps = qs714;
			pt = pd0->rfs;
			rc = 0;
			lrc = 0;
			prlc = pd0->flgl;
			while (*pt++ = *ps++);
			cl = 5; cr = 2;
			cl = cr;
			if(cl != 2){
			lrc = 1;
			if(prlc) printf(f,lrc);
			}
			cl = 5; sr = 2;
			cl = sr;
			if(cl != 2){
			lrc = 2;
			if(prlc) printf(f,lrc);
			}
			cl = 5; ir = 2;
			cl = ir;
			if(cl != 2){
			lrc = 3;
			if(prlc) printf(f,lrc);
			}
			cl = 5; lr = 2;
			cl = lr;
			if(cl != 2){
			lrc = 4;
			if(prlc) printf(f,lrc);
			}
			cl = 5; ur = 2;
			cl = ur;
			if(cl != 2){
			lrc = 5;
			if(prlc) printf(f,lrc);
			}
			cl = 5; fr = 2;
			cl = fr;
			if(cl != 2){
			lrc = 6;
			if(prlc) printf(f,lrc);
			}
			cl = 5; dr = 2;
			cl = dr;
			if(cl != 2){
			lrc = 7;
			if(prlc) printf(f,lrc);
			}
			sl = 5; cr = 2;
			sl = cr;
			if(sl != 2){
			lrc = 8;
			if(prlc) printf(f,lrc);
			}
			sl = 5; sr = 2;
			sl = sr;
			if(sl != 2){
			lrc = 9;
			if(prlc) printf(f,lrc);
			}
			sl = 5; ir = 2;
			sl = ir;
			if(sl != 2){
			lrc = 10;
			if(prlc) printf(f,lrc);
			}
			sl = 5; lr = 2;
			sl = lr;
			if(sl != 2){
			lrc = 11;
			if(prlc) printf(f,lrc);
			}
			sl = 5; ur = 2;
			sl = ur;
			if(sl != 2){
			lrc = 12;
			if(prlc) printf(f,lrc);
			}
			sl = 5; fr = 2;
			sl = fr;
			if(sl != 2){
			lrc = 13;
			if(prlc) printf(f,lrc);
			}
			sl = 5; dr = 2;
			sl = dr;
			if(sl != 2){
			lrc = 14;
			if(prlc) printf(f,lrc);
			}
			il = 5; cr = 2;
			il = cr;
			if(il != 2){
			lrc = 15;
			if(prlc) printf(f,lrc);
			}
			il = 5; sr = 2;
			il = sr;
			if(il != 2){
			lrc = 16;
			if(prlc) printf(f,lrc);
			}
			il = 5; ir = 2;
			il = ir;
			if(il != 2){
			lrc = 17;
			if(prlc) printf(f,lrc);
			}
			il = 5; lr = 2;
			il = lr;
			if(il != 2){
			lrc = 18;
			if(prlc) printf(f,lrc);
			}
			il = 5; ur = 2;
			il = ur;
			if(il != 2){
			lrc = 19;
			if(prlc) printf(f,lrc);
			}
			il = 5; fr = 2;
			il = fr;
			if(il != 2){
			lrc = 20;
			if(prlc) printf(f,lrc);
			}
			il = 5; dr = 2;
			il = dr;
			if(il != 2){
			lrc = 21;
			if(prlc) printf(f,lrc);
			}
			ll = 5; cr = 2;
			ll = cr;
			if(ll != 2){
			lrc = 22;
			if(prlc) printf(f,lrc);
			}
			ll = 5; sr = 2;
			ll = sr;
			if(ll != 2){
			lrc = 23;
			if(prlc) printf(f,lrc);
			}
			ll = 5; ir = 2;
			ll = ir;
			if(ll != 2){
			lrc = 24;
			if(prlc) printf(f,lrc);
			}
			ll = 5; lr = 2;
			ll = lr;
			if(ll != 2){
			lrc = 25;
			if(prlc) printf(f,lrc);
			}
			ll = 5; ur = 2;
			ll = ur;
			if(ll != 2){
			lrc = 26;
			if(prlc) printf(f,lrc);
			}
			ll = 5; fr = 2;
			ll = fr;
			if(ll != 2){
			lrc = 27;
			if(prlc) printf(f,lrc);
			}
			ll = 5; dr = 2;
			ll = dr;
			if(ll != 2){
			lrc = 28;
			if(prlc) printf(f,lrc);
			}
			ul = 5; cr = 2;
			ul = cr;
			if(ul != 2){
			lrc = 29;
			if(prlc) printf(f,lrc);
			}
			ul = 5; sr = 2;
			ul = sr;
			if(ul != 2){
			lrc = 30;
			if(prlc) printf(f,lrc);
			}
			ul = 5; ir = 2;
			ul = ir;
			if(ul != 2){
			lrc = 31;
			if(prlc) printf(f,lrc);
			}
			ul = 5; lr = 2;
			ul = lr;
			if(ul != 2){
			lrc = 32;
			if(prlc) printf(f,lrc);
			}
			ul = 5; ur = 2;
			ul = ur;
			if(ul != 2){
			lrc = 33;
			if(prlc) printf(f,lrc);
			}
			ul = 5; fr = 2;
			ul = fr;
			if(ul != 2){
			lrc = 34;
			if(prlc) printf(f,lrc);
			}
			ul = 5; dr = 2;
			ul = dr;
			if(ul != 2){
			lrc = 35;
			if(prlc) printf(f,lrc);
			}
			fl = 5; cr = 2;
			fl = cr;
			if(fl != 2){
			lrc = 36;
			if(prlc) printf(f,lrc);
			}
			fl = 5; sr = 2;
			fl = sr;
			if(fl != 2){
			lrc = 37;
			if(prlc) printf(f,lrc);
			}
			fl = 5; ir = 2;
			fl = ir;
			if(fl != 2){
			lrc = 38;
			if(prlc) printf(f,lrc);
			}
			fl = 5; lr = 2;
			fl = lr;
			if(fl != 2){
			lrc = 39;
			if(prlc) printf(f,lrc);
			}
			fl = 5; ur = 2;
			fl = ur;
			if(fl != 2){
			lrc = 40;
			if(prlc) printf(f,lrc);
			}
			fl = 5; fr = 2;
			fl = fr;
			if(fl != 2){
			lrc = 41;
			if(prlc) printf(f,lrc);
			}
			fl = 5; dr = 2;
			fl = dr;
			if(fl != 2){
			lrc = 42;
			if(prlc) printf(f,lrc);
			}
			dl = 5; cr = 2;
			dl = cr;
			if(dl != 2){
			lrc = 43;
			if(prlc) printf(f,lrc);
			}
			dl = 5; sr = 2;
			dl = sr;
			if(dl != 2){
			lrc = 44;
			if(prlc) printf(f,lrc);
			}
			dl = 5; ir = 2;
			dl = ir;
			if(dl != 2){
			lrc = 45;
			if(prlc) printf(f,lrc);
			}
			dl = 5; lr = 2;
			dl = lr;
			if(dl != 2){
			lrc = 46;
			if(prlc) printf(f,lrc);
			}
			dl = 5; ur = 2;
			dl = ur;
			if(dl != 2){
			lrc = 47;
			if(prlc) printf(f,lrc);
			}
			dl = 5; fr = 2;
			dl = fr;
			if(dl != 2){
			lrc = 48;
			if(prlc) printf(f,lrc);
			}
			dl = 5; dr = 2;
			dl = dr;
			if(dl != 2){
			lrc = 49;
			if(prlc) printf(f,lrc);
			}
			cl = 5; cr = 2;
			cl += cr;
			if(cl != 7){
			lrc = 50;
			if(prlc) printf(f,lrc);
			}
			cl = 5; sr = 2;
			cl += sr;
			if(cl != 7){
			lrc = 51;
			if(prlc) printf(f,lrc);
			}
			cl = 5; ir = 2;
			cl += ir;
			if(cl != 7){
			lrc = 52;
			if(prlc) printf(f,lrc);
			}
			cl = 5; lr = 2;
			cl += lr;
			if(cl != 7){
			lrc = 53;
			if(prlc) printf(f,lrc);
			}
			cl = 5; ur = 2;
			cl += ur;
			if(cl != 7){
			lrc = 54;
			if(prlc) printf(f,lrc);
			}
			cl = 5; fr = 2;
			cl += fr;
			if(cl != 7){
			lrc = 55;
			if(prlc) printf(f,lrc);
			}
			cl = 5; dr = 2;
			cl += dr;
			if(cl != 7){
			lrc = 56;
			if(prlc) printf(f,lrc);
			}
			sl = 5; cr = 2;
			sl += cr;
			if(sl != 7){
			lrc = 57;
			if(prlc) printf(f,lrc);
			}
			sl = 5; sr = 2;
			sl += sr;
			if(sl != 7){
			lrc = 58;
			if(prlc) printf(f,lrc);
			}
			sl = 5; ir = 2;
			sl += ir;
			if(sl != 7){
			lrc = 59;
			if(prlc) printf(f,lrc);
			}
			sl = 5; lr = 2;
			sl += lr;
			if(sl != 7){
			lrc = 60;
			if(prlc) printf(f,lrc);
			}
			sl = 5; ur = 2;
			sl += ur;
			if(sl != 7){
			lrc = 61;
			if(prlc) printf(f,lrc);
			}
			sl = 5; fr = 2;
			sl += fr;
			if(sl != 7){
			lrc = 62;
			if(prlc) printf(f,lrc);
			}
			sl = 5; dr = 2;
			sl += dr;
			if(sl != 7){
			lrc = 63;
			if(prlc) printf(f,lrc);
			}
			il = 5; cr = 2;
			il += cr;
			if(il != 7){
			lrc = 64;
			if(prlc) printf(f,lrc);
			}
			il = 5; sr = 2;
			il += sr;
			if(il != 7){
			lrc = 65;
			if(prlc) printf(f,lrc);
			}
			il = 5; ir = 2;
			il += ir;
			if(il != 7){
			lrc = 66;
			if(prlc) printf(f,lrc);
			}
			il = 5; lr = 2;
			il += lr;
			if(il != 7){
			lrc = 67;
			if(prlc) printf(f,lrc);
			}
			il = 5; ur = 2;
			il += ur;
			if(il != 7){
			lrc = 68;
			if(prlc) printf(f,lrc);
			}
			il = 5; fr = 2;
			il += fr;
			if(il != 7){
			lrc = 69;
			if(prlc) printf(f,lrc);
			}
			il = 5; dr = 2;
			il += dr;
			if(il != 7){
			lrc = 70;
			if(prlc) printf(f,lrc);
			}
			ll = 5; cr = 2;
			ll += cr;
			if(ll != 7){
			lrc = 71;
			if(prlc) printf(f,lrc);
			}
			ll = 5; sr = 2;
			ll += sr;
			if(ll != 7){
			lrc = 72;
			if(prlc) printf(f,lrc);
			}
			ll = 5; ir = 2;
			ll += ir;
			if(ll != 7){
			lrc = 73;
			if(prlc) printf(f,lrc);
			}
			ll = 5; lr = 2;
			ll += lr;
			if(ll != 7){
			lrc = 74;
			if(prlc) printf(f,lrc);
			}
			ll = 5; ur = 2;
			ll += ur;
			if(ll != 7){
			lrc = 75;
			if(prlc) printf(f,lrc);
			}
			ll = 5; fr = 2;
			ll += fr;
			if(ll != 7){
			lrc = 76;
			if(prlc) printf(f,lrc);
			}
			ll = 5; dr = 2;
			ll += dr;
			if(ll != 7){
			lrc = 77;
			if(prlc) printf(f,lrc);
			}
			ul = 5; cr = 2;
			ul += cr;
			if(ul != 7){
			lrc = 78;
			if(prlc) printf(f,lrc);
			}
			ul = 5; sr = 2;
			ul += sr;
			if(ul != 7){
			lrc = 79;
			if(prlc) printf(f,lrc);
			}
			ul = 5; ir = 2;
			ul += ir;
			if(ul != 7){
			lrc = 80;
			if(prlc) printf(f,lrc);
			}
			ul = 5; lr = 2;
			ul += lr;
			if(ul != 7){
			lrc = 81;
			if(prlc) printf(f,lrc);
			}
			ul = 5; ur = 2;
			ul += ur;
			if(ul != 7){
			lrc = 82;
			if(prlc) printf(f,lrc);
			}
			ul = 5; fr = 2;
			ul += fr;
			if(ul != 7){
			lrc = 83;
			if(prlc) printf(f,lrc);
			}
			ul = 5; dr = 2;
			ul += dr;
			if(ul != 7){
			lrc = 84;
			if(prlc) printf(f,lrc);
			}
			fl = 5; cr = 2;
			fl += cr;
			if(fl != 7){
			lrc = 85;
			if(prlc) printf(f,lrc);
			}
			fl = 5; sr = 2;
			fl += sr;
			if(fl != 7){
			lrc = 86;
			if(prlc) printf(f,lrc);
			}
			fl = 5; ir = 2;
			fl += ir;
			if(fl != 7){
			lrc = 87;
			if(prlc) printf(f,lrc);
			}
			fl = 5; lr = 2;
			fl += lr;
			if(fl != 7){
			lrc = 88;
			if(prlc) printf(f,lrc);
			}
			fl = 5; ur = 2;
			fl += ur;
			if(fl != 7){
			lrc = 89;
			if(prlc) printf(f,lrc);
			}
			fl = 5; fr = 2;
			fl += fr;
			if(fl != 7){
			lrc = 90;
			if(prlc) printf(f,lrc);
			}
			fl = 5; dr = 2;
			fl += dr;
			if(fl != 7){
			lrc = 91;
			if(prlc) printf(f,lrc);
			}
			dl = 5; cr = 2;
			dl += cr;
			if(dl != 7){
			lrc = 92;
			if(prlc) printf(f,lrc);
			}
			dl = 5; sr = 2;
			dl += sr;
			if(dl != 7){
			lrc = 93;
			if(prlc) printf(f,lrc);
			}
			dl = 5; ir = 2;
			dl += ir;
			if(dl != 7){
			lrc = 94;
			if(prlc) printf(f,lrc);
			}
			dl = 5; lr = 2;
			dl += lr;
			if(dl != 7){
			lrc = 95;
			if(prlc) printf(f,lrc);
			}
			dl = 5; ur = 2;
			dl += ur;
			if(dl != 7){
			lrc = 96;
			if(prlc) printf(f,lrc);
			}
			dl = 5; fr = 2;
			dl += fr;
			if(dl != 7){
			lrc = 97;
			if(prlc) printf(f,lrc);
			}
			dl = 5; dr = 2;
			dl += dr;
			if(dl != 7){
			lrc = 98;
			if(prlc) printf(f,lrc);
			}
			cl = 5; cr = 2;
			cl -= cr;
			if(cl != 3){
			lrc = 99;
			if(prlc) printf(f,lrc);
			}
			cl = 5; sr = 2;
			cl -= sr;
			if(cl != 3){
			lrc = 100;
			if(prlc) printf(f,lrc);
			}
			cl = 5; ir = 2;
			cl -= ir;
			if(cl != 3){
			lrc = 101;
			if(prlc) printf(f,lrc);
			}
			cl = 5; lr = 2;
			cl -= lr;
			if(cl != 3){
			lrc = 102;
			if(prlc) printf(f,lrc);
			}
			cl = 5; ur = 2;
			cl -= ur;
			if(cl != 3){
			lrc = 103;
			if(prlc) printf(f,lrc);
			}
			cl = 5; fr = 2;
			cl -= fr;
			if(cl != 3){
			lrc = 104;
			if(prlc) printf(f,lrc);
			}
			cl = 5; dr = 2;
			cl -= dr;
			if(cl != 3){
			lrc = 105;
			if(prlc) printf(f,lrc);
			}
			sl = 5; cr = 2;
			sl -= cr;
			if(sl != 3){
			lrc = 106;
			if(prlc) printf(f,lrc);
			}
			sl = 5; sr = 2;
			sl -= sr;
			if(sl != 3){
			lrc = 107;
			if(prlc) printf(f,lrc);
			}
			sl = 5; ir = 2;
			sl -= ir;
			if(sl != 3){
			lrc = 108;
			if(prlc) printf(f,lrc);
			}
			sl = 5; lr = 2;
			sl -= lr;
			if(sl != 3){
			lrc = 109;
			if(prlc) printf(f,lrc);
			}
			sl = 5; ur = 2;
			sl -= ur;
			if(sl != 3){
			lrc = 110;
			if(prlc) printf(f,lrc);
			}
			sl = 5; fr = 2;
			sl -= fr;
			if(sl != 3){
			lrc = 111;
			if(prlc) printf(f,lrc);
			}
			sl = 5; dr = 2;
			sl -= dr;
			if(sl != 3){
			lrc = 112;
			if(prlc) printf(f,lrc);
			}
			il = 5; cr = 2;
			il -= cr;
			if(il != 3){
			lrc = 113;
			if(prlc) printf(f,lrc);
			}
			il = 5; sr = 2;
			il -= sr;
			if(il != 3){
			lrc = 114;
			if(prlc) printf(f,lrc);
			}
			il = 5; ir = 2;
			il -= ir;
			if(il != 3){
			lrc = 115;
			if(prlc) printf(f,lrc);
			}
			il = 5; lr = 2;
			il -= lr;
			if(il != 3){
			lrc = 116;
			if(prlc) printf(f,lrc);
			}
			il = 5; ur = 2;
			il -= ur;
			if(il != 3){
			lrc = 117;
			if(prlc) printf(f,lrc);
			}
			il = 5; fr = 2;
			il -= fr;
			if(il != 3){
			lrc = 118;
			if(prlc) printf(f,lrc);
			}
			il = 5; dr = 2;
			il -= dr;
			if(il != 3){
			lrc = 119;
			if(prlc) printf(f,lrc);
			}
			ll = 5; cr = 2;
			ll -= cr;
			if(ll != 3){
			lrc = 120;
			if(prlc) printf(f,lrc);
			}
			ll = 5; sr = 2;
			ll -= sr;
			if(ll != 3){
			lrc = 121;
			if(prlc) printf(f,lrc);
			}
			ll = 5; ir = 2;
			ll -= ir;
			if(ll != 3){
			lrc = 122;
			if(prlc) printf(f,lrc);
			}
			ll = 5; lr = 2;
			ll -= lr;
			if(ll != 3){
			lrc = 123;
			if(prlc) printf(f,lrc);
			}
			ll = 5; ur = 2;
			ll -= ur;
			if(ll != 3){
			lrc = 124;
			if(prlc) printf(f,lrc);
			}
			ll = 5; fr = 2;
			ll -= fr;
			if(ll != 3){
			lrc = 125;
			if(prlc) printf(f,lrc);
			}
			ll = 5; dr = 2;
			ll -= dr;
			if(ll != 3){
			lrc = 126;
			if(prlc) printf(f,lrc);
			}
			ul = 5; cr = 2;
			ul -= cr;
			if(ul != 3){
			lrc = 127;
			if(prlc) printf(f,lrc);
			}
			ul = 5; sr = 2;
			ul -= sr;
			if(ul != 3){
			lrc = 128;
			if(prlc) printf(f,lrc);
			}
			ul = 5; ir = 2;
			ul -= ir;
			if(ul != 3){
			lrc = 129;
			if(prlc) printf(f,lrc);
			}
			ul = 5; lr = 2;
			ul -= lr;
			if(ul != 3){
			lrc = 130;
			if(prlc) printf(f,lrc);
			}
			ul = 5; ur = 2;
			ul -= ur;
			if(ul != 3){
			lrc = 131;
			if(prlc) printf(f,lrc);
			}
			ul = 5; fr = 2;
			ul -= fr;
			if(ul != 3){
			lrc = 132;
			if(prlc) printf(f,lrc);
			}
			ul = 5; dr = 2;
			ul -= dr;
			if(ul != 3){
			lrc = 133;
			if(prlc) printf(f,lrc);
			}
			fl = 5; cr = 2;
			fl -= cr;
			if(fl != 3){
			lrc = 134;
			if(prlc) printf(f,lrc);
			}
			fl = 5; sr = 2;
			fl -= sr;
			if(fl != 3){
			lrc = 135;
			if(prlc) printf(f,lrc);
			}
			fl = 5; ir = 2;
			fl -= ir;
			if(fl != 3){
			lrc = 136;
			if(prlc) printf(f,lrc);
			}
			fl = 5; lr = 2;
			fl -= lr;
			if(fl != 3){
			lrc = 137;
			if(prlc) printf(f,lrc);
			}
			fl = 5; ur = 2;
			fl -= ur;
			if(fl != 3){
			lrc = 138;
			if(prlc) printf(f,lrc);
			}
			fl = 5; fr = 2;
			fl -= fr;
			if(fl != 3){
			lrc = 139;
			if(prlc) printf(f,lrc);
			}
			fl = 5; dr = 2;
			fl -= dr;
			if(fl != 3){
			lrc = 140;
			if(prlc) printf(f,lrc);
			}
			dl = 5; cr = 2;
			dl -= cr;
			if(dl != 3){
			lrc = 141;
			if(prlc) printf(f,lrc);
			}
			dl = 5; sr = 2;
			dl -= sr;
			if(dl != 3){
			lrc = 142;
			if(prlc) printf(f,lrc);
			}
			dl = 5; ir = 2;
			dl -= ir;
			if(dl != 3){
			lrc = 143;
			if(prlc) printf(f,lrc);
			}
			dl = 5; lr = 2;
			dl -= lr;
			if(dl != 3){
			lrc = 144;
			if(prlc) printf(f,lrc);
			}
			dl = 5; ur = 2;
			dl -= ur;
			if(dl != 3){
			lrc = 145;
			if(prlc) printf(f,lrc);
			}
			dl = 5; fr = 2;
			dl -= fr;
			if(dl != 3){
			lrc = 146;
			if(prlc) printf(f,lrc);
			}
			dl = 5; dr = 2;
			dl -= dr;
			if(dl != 3){
			lrc = 147;
			if(prlc) printf(f,lrc);
			}
			cl = 5; cr = 2;
			cl *= cr;
			if(cl != 10){
			lrc = 148;
			if(prlc) printf(f,lrc);
			}
			cl = 5; sr = 2;
			cl *= sr;
			if(cl != 10){
			lrc = 149;
			if(prlc) printf(f,lrc);
			}
			cl = 5; ir = 2;
			cl *= ir;
			if(cl != 10){
			lrc = 150;
			if(prlc) printf(f,lrc);
			}
			cl = 5; lr = 2;
			cl *= lr;
			if(cl != 10){
			lrc = 151;
			if(prlc) printf(f,lrc);
			}
			cl = 5; ur = 2;
			cl *= ur;
			if(cl != 10){
			lrc = 152;
			if(prlc) printf(f,lrc);
			}
			cl = 5; fr = 2;
			cl *= fr;
			if(cl != 10){
			lrc = 153;
			if(prlc) printf(f,lrc);
			}
			cl = 5; dr = 2;
			cl *= dr;
			if(cl != 10){
			lrc = 154;
			if(prlc) printf(f,lrc);
			}
			sl = 5; cr = 2;
			sl *= cr;
			if(sl != 10){
			lrc = 155;
			if(prlc) printf(f,lrc);
			}
			sl = 5; sr = 2;
			sl *= sr;
			if(sl != 10){
			lrc = 156;
			if(prlc) printf(f,lrc);
			}
			sl = 5; ir = 2;
			sl *= ir;
			if(sl != 10){
			lrc = 157;
			if(prlc) printf(f,lrc);
			}
			sl = 5; lr = 2;
			sl *= lr;
			if(sl != 10){
			lrc = 158;
			if(prlc) printf(f,lrc);
			}
			sl = 5; ur = 2;
			sl *= ur;
			if(sl != 10){
			lrc = 159;
			if(prlc) printf(f,lrc);
			}
			sl = 5; fr = 2;
			sl *= fr;
			if(sl != 10){
			lrc = 160;
			if(prlc) printf(f,lrc);
			}
			sl = 5; dr = 2;
			sl *= dr;
			if(sl != 10){
			lrc = 161;
			if(prlc) printf(f,lrc);
			}
			il = 5; cr = 2;
			il *= cr;
			if(il != 10){
			lrc = 162;
			if(prlc) printf(f,lrc);
			}
			il = 5; sr = 2;
			il *= sr;
			if(il != 10){
			lrc = 163;
			if(prlc) printf(f,lrc);
			}
			il = 5; ir = 2;
			il *= ir;
			if(il != 10){
			lrc = 164;
			if(prlc) printf(f,lrc);
			}
			il = 5; lr = 2;
			il *= lr;
			if(il != 10){
			lrc = 165;
			if(prlc) printf(f,lrc);
			}
			il = 5; ur = 2;
			il *= ur;
			if(il != 10){
			lrc = 166;
			if(prlc) printf(f,lrc);
			}
			il = 5; fr = 2;
			il *= fr;
			if(il != 10){
			lrc = 167;
			if(prlc) printf(f,lrc);
			}
			il = 5; dr = 2;
			il *= dr;
			if(il != 10){
			lrc = 168;
			if(prlc) printf(f,lrc);
			}
			ll = 5; cr = 2;
			ll *= cr;
			if(ll != 10){
			lrc = 169;
			if(prlc) printf(f,lrc);
			}
			ll = 5; sr = 2;
			ll *= sr;
			if(ll != 10){
			lrc = 170;
			if(prlc) printf(f,lrc);
			}
			ll = 5; ir = 2;
			ll *= ir;
			if(ll != 10){
			lrc = 171;
			if(prlc) printf(f,lrc);
			}
			ll = 5; lr = 2;
			ll *= lr;
			if(ll != 10){
			lrc = 172;
			if(prlc) printf(f,lrc);
			}
			ll = 5; ur = 2;
			ll *= ur;
			if(ll != 10){
			lrc = 173;
			if(prlc) printf(f,lrc);
			}
			ll = 5; fr = 2;
			ll *= fr;
			if(ll != 10){
			lrc = 174;
			if(prlc) printf(f,lrc);
			}
			ll = 5; dr = 2;
			ll *= dr;
			if(ll != 10){
			lrc = 175;
			if(prlc) printf(f,lrc);
			}
			ul = 5; cr = 2;
			ul *= cr;
			if(ul != 10){
			lrc = 176;
			if(prlc) printf(f,lrc);
			}
			ul = 5; sr = 2;
			ul *= sr;
			if(ul != 10){
			lrc = 177;
			if(prlc) printf(f,lrc);
			}
			ul = 5; ir = 2;
			ul *= ir;
			if(ul != 10){
			lrc = 178;
			if(prlc) printf(f,lrc);
			}
			ul = 5; lr = 2;
			ul *= lr;
			if(ul != 10){
			lrc = 179;
			if(prlc) printf(f,lrc);
			}
			ul = 5; ur = 2;
			ul *= ur;
			if(ul != 10){
			lrc = 180;
			if(prlc) printf(f,lrc);
			}
			ul = 5; fr = 2;
			ul *= fr;
			if(ul != 10){
			lrc = 181;
			if(prlc) printf(f,lrc);
			}
			ul = 5; dr = 2;
			ul *= dr;
			if(ul != 10){
			lrc = 182;
			if(prlc) printf(f,lrc);
			}
			fl = 5; cr = 2;
			fl *= cr;
			if(fl != 10){
			lrc = 183;
			if(prlc) printf(f,lrc);
			}
			fl = 5; sr = 2;
			fl *= sr;
			if(fl != 10){
			lrc = 184;
			if(prlc) printf(f,lrc);
			}
			fl = 5; ir = 2;
			fl *= ir;
			if(fl != 10){
			lrc = 185;
			if(prlc) printf(f,lrc);
			}
			fl = 5; lr = 2;
			fl *= lr;
			if(fl != 10){
			lrc = 186;
			if(prlc) printf(f,lrc);
			}
			fl = 5; ur = 2;
			fl *= ur;
			if(fl != 10){
			lrc = 187;
			if(prlc) printf(f,lrc);
			}
			fl = 5; fr = 2;
			fl *= fr;
			if(fl != 10){
			lrc = 188;
			if(prlc) printf(f,lrc);
			}
			fl = 5; dr = 2;
			fl *= dr;
			if(fl != 10){
			lrc = 189;
			if(prlc) printf(f,lrc);
			}
			dl = 5; cr = 2;
			dl *= cr;
			if(dl != 10){
			lrc = 190;
			if(prlc) printf(f,lrc);
			}
			dl = 5; sr = 2;
			dl *= sr;
			if(dl != 10){
			lrc = 191;
			if(prlc) printf(f,lrc);
			}
			dl = 5; ir = 2;
			dl *= ir;
			if(dl != 10){
			lrc = 192;
			if(prlc) printf(f,lrc);
			}
			dl = 5; lr = 2;
			dl *= lr;
			if(dl != 10){
			lrc = 193;
			if(prlc) printf(f,lrc);
			}
			dl = 5; ur = 2;
			dl *= ur;
			if(dl != 10){
			lrc = 194;
			if(prlc) printf(f,lrc);
			}
			dl = 5; fr = 2;
			dl *= fr;
			if(dl != 10){
			lrc = 195;
			if(prlc) printf(f,lrc);
			}
			dl = 5; dr = 2;
			dl *= dr;
			if(dl != 10){
			lrc = 196;
			if(prlc) printf(f,lrc);
			}
			cl = 5; cr = 2;
			cl /= cr;
			if(cl != 2){
			lrc = 197;
			if(prlc) printf(f,lrc);
			}
			cl = 5; sr = 2;
			cl /= sr;
			if(cl != 2){
			lrc = 198;
			if(prlc) printf(f,lrc);
			}
			cl = 5; ir = 2;
			cl /= ir;
			if(cl != 2){
			lrc = 199;
			if(prlc) printf(f,lrc);
			}
			cl = 5; lr = 2;
			cl /= lr;
			if(cl != 2){
			lrc = 200;
			if(prlc) printf(f,lrc);
			}
			cl = 5; ur = 2;
			cl /= ur;
			if(cl != 2){
			lrc = 201;
			if(prlc) printf(f,lrc);
			}
			cl = 5; fr = 2;
			cl /= fr;
			if(cl != 2){
			lrc = 202;
			if(prlc) printf(f,lrc);
			}
			cl = 5; dr = 2;
			cl /= dr;
			if(cl != 2){
			lrc = 203;
			if(prlc) printf(f,lrc);
			}
			sl = 5; cr = 2;
			sl /= cr;
			if(sl != 2){
			lrc = 204;
			if(prlc) printf(f,lrc);
			}
			sl = 5; sr = 2;
			sl /= sr;
			if(sl != 2){
			lrc = 205;
			if(prlc) printf(f,lrc);
			}
			sl = 5; ir = 2;
			sl /= ir;
			if(sl != 2){
			lrc = 206;
			if(prlc) printf(f,lrc);
			}
			sl = 5; lr = 2;
			sl /= lr;
			if(sl != 2){
			lrc = 207;
			if(prlc) printf(f,lrc);
			}
			sl = 5; ur = 2;
			sl /= ur;
			if(sl != 2){
			lrc = 208;
			if(prlc) printf(f,lrc);
			}
			sl = 5; fr = 2;
			sl /= fr;
			if(sl != 2){
			lrc = 209;
			if(prlc) printf(f,lrc);
			}
			sl = 5; dr = 2;
			sl /= dr;
			if(sl != 2){
			lrc = 210;
			if(prlc) printf(f,lrc);
			}
			il = 5; cr = 2;
			il /= cr;
			if(il != 2){
			lrc = 211;
			if(prlc) printf(f,lrc);
			}
			il = 5; sr = 2;
			il /= sr;
			if(il != 2){
			lrc = 212;
			if(prlc) printf(f,lrc);
			}
			il = 5; ir = 2;
			il /= ir;
			if(il != 2){
			lrc = 213;
			if(prlc) printf(f,lrc);
			}
			il = 5; lr = 2;
			il /= lr;
			if(il != 2){
			lrc = 214;
			if(prlc) printf(f,lrc);
			}
			il = 5; ur = 2;
			il /= ur;
			if(il != 2){
			lrc = 215;
			if(prlc) printf(f,lrc);
			}
			il = 5; fr = 2;
			il /= fr;
			if(il != 2){
			lrc = 216;
			if(prlc) printf(f,lrc);
			}
			il = 5; dr = 2;
			il /= dr;
			if(il != 2){
			lrc = 217;
			if(prlc) printf(f,lrc);
			}
			ll = 5; cr = 2;
			ll /= cr;
			if(ll != 2){
			lrc = 218;
			if(prlc) printf(f,lrc);
			}
			ll = 5; sr = 2;
			ll /= sr;
			if(ll != 2){
			lrc = 219;
			if(prlc) printf(f,lrc);
			}
			ll = 5; ir = 2;
			ll /= ir;
			if(ll != 2){
			lrc = 220;
			if(prlc) printf(f,lrc);
			}
			ll = 5; lr = 2;
			ll /= lr;
			if(ll != 2){
			lrc = 221;
			if(prlc) printf(f,lrc);
			}
			ll = 5; ur = 2;
			ll /= ur;
			if(ll != 2){
			lrc = 222;
			if(prlc) printf(f,lrc);
			}
			ll = 5; fr = 2;
			ll /= fr;
			if(ll != 2){
			lrc = 223;
			if(prlc) printf(f,lrc);
			}
			ll = 5; dr = 2;
			ll /= dr;
			if(ll != 2){
			lrc = 224;
			if(prlc) printf(f,lrc);
			}
			ul = 5; cr = 2;
			ul /= cr;
			if(ul != 2){
			lrc = 225;
			if(prlc) printf(f,lrc);
			}
			ul = 5; sr = 2;
			ul /= sr;
			if(ul != 2){
			lrc = 226;
			if(prlc) printf(f,lrc);
			}
			ul = 5; ir = 2;
			ul /= ir;
			if(ul != 2){
			lrc = 227;
			if(prlc) printf(f,lrc);
			}
			ul = 5; lr = 2;
			ul /= lr;
			if(ul != 2){
			lrc = 228;
			if(prlc) printf(f,lrc);
			}
			ul = 5; ur = 2;
			ul /= ur;
			if(ul != 2){
			lrc = 229;
			if(prlc) printf(f,lrc);
			}
			ul = 5; fr = 2;
			ul /= fr;
			if(ul != 2){
			lrc = 230;
			if(prlc) printf(f,lrc);
			}
			ul = 5; dr = 2;
			ul /= dr;
			if(ul != 2){
			lrc = 231;
			if(prlc) printf(f,lrc);
			}
			fl = 5; cr = 2;
			fl /= cr;
			if(fl != 2.5){
			lrc = 232;
			if(prlc) printf(f,lrc);
			}
			fl = 5; sr = 2;
			fl /= sr;
			if(fl != 2.5){
			lrc = 233;
			if(prlc) printf(f,lrc);
			}
			fl = 5; ir = 2;
			fl /= ir;
			if(fl != 2.5){
			lrc = 234;
			if(prlc) printf(f,lrc);
			}
			fl = 5; lr = 2;
			fl /= lr;
			if(fl != 2.5){
			lrc = 235;
			if(prlc) printf(f,lrc);
			}
			fl = 5; ur = 2;
			fl /= ur;
			if(fl != 2.5){
			lrc = 236;
			if(prlc) printf(f,lrc);
			}
			fl = 5; fr = 2;
			fl /= fr;
			if(fl != 2.5){
			lrc = 237;
			if(prlc) printf(f,lrc);
			}
			fl = 5; dr = 2;
			fl /= dr;
			if(fl != 2.5){
			lrc = 238;
			if(prlc) printf(f,lrc);
			}
			dl = 5; cr = 2;
			dl /= cr;
			if(dl != 2.5){
			lrc = 239;
			if(prlc) printf(f,lrc);
			}
			dl = 5; sr = 2;
			dl /= sr;
			if(dl != 2.5){
			lrc = 240;
			if(prlc) printf(f,lrc);
			}
			dl = 5; ir = 2;
			dl /= ir;
			if(dl != 2.5){
			lrc = 241;
			if(prlc) printf(f,lrc);
			}
			dl = 5; lr = 2;
			dl /= lr;
			if(dl != 2.5){
			lrc = 242;
			if(prlc) printf(f,lrc);
			}
			dl = 5; ur = 2;
			dl /= ur;
			if(dl != 2.5){
			lrc = 243;
			if(prlc) printf(f,lrc);
			}
			dl = 5; fr = 2;
			dl /= fr;
			if(dl != 2.5){
			lrc = 244;
			if(prlc) printf(f,lrc);
			}
			dl = 5; dr = 2;
			dl /= dr;
			if(dl != 2.5){
			lrc = 245;
			if(prlc) printf(f,lrc);
			}
			cl = 5; cr = 2;
			cl %= cr;
			if(cl != 1){
			lrc = 246;
			if(prlc) printf(f,lrc);
			}
			cl = 5; sr = 2;
			cl %= sr;
			if(cl != 1){
			lrc = 247;
			if(prlc) printf(f,lrc);
			}
			cl = 5; ir = 2;
			cl %= ir;
			if(cl != 1){
			lrc = 248;
			if(prlc) printf(f,lrc);
			}
			cl = 5; lr = 2;
			cl %= lr;
			if(cl != 1){
			lrc = 249;
			if(prlc) printf(f,lrc);
			}
			cl = 5; ur = 2;
			cl %= ur;
			if(cl != 1){
			lrc = 250;
			if(prlc) printf(f,lrc);
			}
			sl = 5; cr = 2;
			sl %= cr;
			if(sl != 1){
			lrc = 251;
			if(prlc) printf(f,lrc);
			}
			sl = 5; sr = 2;
			sl %= sr;
			if(sl != 1){
			lrc = 252;
			if(prlc) printf(f,lrc);
			}
			sl = 5; ir = 2;
			sl %= ir;
			if(sl != 1){
			lrc = 253;
			if(prlc) printf(f,lrc);
			}
			sl = 5; lr = 2;
			sl %= lr;
			if(sl != 1){
			lrc = 254;
			if(prlc) printf(f,lrc);
			}
			sl = 5; ur = 2;
			sl %= ur;
			if(sl != 1){
			lrc = 255;
			if(prlc) printf(f,lrc);
			}
			il = 5; cr = 2;
			il %= cr;
			if(il != 1){
			lrc = 256;
			if(prlc) printf(f,lrc);
			}
			il = 5; sr = 2;
			il %= sr;
			if(il != 1){
			lrc = 257;
			if(prlc) printf(f,lrc);
			}
			il = 5; ir = 2;
			il %= ir;
			if(il != 1){
			lrc = 258;
			if(prlc) printf(f,lrc);
			}
			il = 5; lr = 2;
			il %= lr;
			if(il != 1){
			lrc = 259;
			if(prlc) printf(f,lrc);
			}
			il = 5; ur = 2;
			il %= ur;
			if(il != 1){
			lrc = 260;
			if(prlc) printf(f,lrc);
			}
			ll = 5; cr = 2;
			ll %= cr;
			if(ll != 1){
			lrc = 261;
			if(prlc) printf(f,lrc);
			}
			ll = 5; sr = 2;
			ll %= sr;
			if(ll != 1){
			lrc = 262;
			if(prlc) printf(f,lrc);
			}
			ll = 5; ir = 2;
			ll %= ir;
			if(ll != 1){
			lrc = 263;
			if(prlc) printf(f,lrc);
			}
			ll = 5; lr = 2;
			ll %= lr;
			if(ll != 1){
			lrc = 264;
			if(prlc) printf(f,lrc);
			}
			ll = 5; ur = 2;
			ll %= ur;
			if(ll != 1){
			lrc = 265;
			if(prlc) printf(f,lrc);
			}
			ul = 5; cr = 2;
			ul %= cr;
			if(ul != 1){
			lrc = 266;
			if(prlc) printf(f,lrc);
			}
			ul = 5; sr = 2;
			ul %= sr;
			if(ul != 1){
			lrc = 267;
			if(prlc) printf(f,lrc);
			}
			ul = 5; ir = 2;
			ul %= ir;
			if(ul != 1){
			lrc = 268;
			if(prlc) printf(f,lrc);
			}
			ul = 5; lr = 2;
			ul %= lr;
			if(ul != 1){
			lrc = 269;
			if(prlc) printf(f,lrc);
			}
			ul = 5; ur = 2;
			ul %= ur;
			if(ul != 1){
			lrc = 270;
			if(prlc) printf(f,lrc);
			}
			cl = 5; cr = 2;
			cl >>= cr;
			if(cl != 1){
			lrc = 271;
			if(prlc) printf(f,lrc);
			}
			cl = 5; sr = 2;
			cl >>= sr;
			if(cl != 1){
			lrc = 272;
			if(prlc) printf(f,lrc);
			}
			cl = 5; ir = 2;
			cl >>= ir;
			if(cl != 1){
			lrc = 273;
			if(prlc) printf(f,lrc);
			}
			cl = 5; lr = 2;
			cl >>= lr;
			if(cl != 1){
			lrc = 274;
			if(prlc) printf(f,lrc);
			}
			cl = 5; ur = 2;
			cl >>= ur;
			if(cl != 1){
			lrc = 275;
			if(prlc) printf(f,lrc);
			}
			sl = 5; cr = 2;
			sl >>= cr;
			if(sl != 1){
			lrc = 276;
			if(prlc) printf(f,lrc);
			}
			sl = 5; sr = 2;
			sl >>= sr;
			if(sl != 1){
			lrc = 277;
			if(prlc) printf(f,lrc);
			}
			sl = 5; ir = 2;
			sl >>= ir;
			if(sl != 1){
			lrc = 278;
			if(prlc) printf(f,lrc);
			}
			sl = 5; lr = 2;
			sl >>= lr;
			if(sl != 1){
			lrc = 279;
			if(prlc) printf(f,lrc);
			}
			sl = 5; ur = 2;
			sl >>= ur;
			if(sl != 1){
			lrc = 280;
			if(prlc) printf(f,lrc);
			}
			il = 5; cr = 2;
			il >>= cr;
			if(il != 1){
			lrc = 281;
			if(prlc) printf(f,lrc);
			}
			il = 5; sr = 2;
			il >>= sr;
			if(il != 1){
			lrc = 282;
			if(prlc) printf(f,lrc);
			}
			il = 5; ir = 2;
			il >>= ir;
			if(il != 1){
			lrc = 283;
			if(prlc) printf(f,lrc);
			}
			il = 5; lr = 2;
			il >>= lr;
			if(il != 1){
			lrc = 284;
			if(prlc) printf(f,lrc);
			}
			il = 5; ur = 2;
			il >>= ur;
			if(il != 1){
			lrc = 285;
			if(prlc) printf(f,lrc);
			}
			ll = 5; cr = 2;
			ll >>= cr;
			if(ll != 1){
			lrc = 286;
			if(prlc) printf(f,lrc);
			}
			ll = 5; sr = 2;
			ll >>= sr;
			if(ll != 1){
			lrc = 287;
			if(prlc) printf(f,lrc);
			}
			ll = 5; ir = 2;
			ll >>= ir;
			if(ll != 1){
			lrc = 288;
			if(prlc) printf(f,lrc);
			}
			ll = 5; lr = 2;
			ll >>= lr;
			if(ll != 1){
			lrc = 289;
			if(prlc) printf(f,lrc);
			}
			ll = 5; ur = 2;
			ll >>= ur;
			if(ll != 1){
			lrc = 290;
			if(prlc) printf(f,lrc);
			}
			ul = 5; cr = 2;
			ul >>= cr;
			if(ul != 1){
			lrc = 291;
			if(prlc) printf(f,lrc);
			}
			ul = 5; sr = 2;
			ul >>= sr;
			if(ul != 1){
			lrc = 292;
			if(prlc) printf(f,lrc);
			}
			ul = 5; ir = 2;
			ul >>= ir;
			if(ul != 1){
			lrc = 293;
			if(prlc) printf(f,lrc);
			}
			ul = 5; lr = 2;
			ul >>= lr;
			if(ul != 1){
			lrc = 294;
			if(prlc) printf(f,lrc);
			}
			ul = 5; ur = 2;
			ul >>= ur;
			if(ul != 1){
			lrc = 295;
			if(prlc) printf(f,lrc);
			}
			cl = 5; cr = 2;
			cl <<= cr;
			if(cl != 20){
			lrc = 296;
			if(prlc) printf(f,lrc);
			}
			cl = 5; sr = 2;
			cl <<= sr;
			if(cl != 20){
			lrc = 297;
			if(prlc) printf(f,lrc);
			}
			cl = 5; ir = 2;
			cl <<= ir;
			if(cl != 20){
			lrc = 298;
			if(prlc) printf(f,lrc);
			}
			cl = 5; lr = 2;
			cl <<= lr;
			if(cl != 20){
			lrc = 299;
			if(prlc) printf(f,lrc);
			}
			cl = 5; ur = 2;
			cl <<= ur;
			if(cl != 20){
			lrc = 300;
			if(prlc) printf(f,lrc);
			}
			sl = 5; cr = 2;
			sl <<= cr;
			if(sl != 20){
			lrc = 301;
			if(prlc) printf(f,lrc);
			}
			sl = 5; sr = 2;
			sl <<= sr;
			if(sl != 20){
			lrc = 302;
			if(prlc) printf(f,lrc);
			}
			sl = 5; ir = 2;
			sl <<= ir;
			if(sl != 20){
			lrc = 303;
			if(prlc) printf(f,lrc);
			}
			sl = 5; lr = 2;
			sl <<= lr;
			if(sl != 20){
			lrc = 304;
			if(prlc) printf(f,lrc);
			}
			sl = 5; ur = 2;
			sl <<= ur;
			if(sl != 20){
			lrc = 305;
			if(prlc) printf(f,lrc);
			}
			il = 5; cr = 2;
			il <<= cr;
			if(il != 20){
			lrc = 306;
			if(prlc) printf(f,lrc);
			}
			il = 5; sr = 2;
			il <<= sr;
			if(il != 20){
			lrc = 307;
			if(prlc) printf(f,lrc);
			}
			il = 5; ir = 2;
			il <<= ir;
			if(il != 20){
			lrc = 308;
			if(prlc) printf(f,lrc);
			}
			il = 5; lr = 2;
			il <<= lr;
			if(il != 20){
			lrc = 309;
			if(prlc) printf(f,lrc);
			}
			il = 5; ur = 2;
			il <<= ur;
			if(il != 20){
			lrc = 310;
			if(prlc) printf(f,lrc);
			}
			ll = 5; cr = 2;
			ll <<= cr;
			if(ll != 20){
			lrc = 311;
			if(prlc) printf(f,lrc);
			}
			ll = 5; sr = 2;
			ll <<= sr;
			if(ll != 20){
			lrc = 312;
			if(prlc) printf(f,lrc);
			}
			ll = 5; ir = 2;
			ll <<= ir;
			if(ll != 20){
			lrc = 313;
			if(prlc) printf(f,lrc);
			}
			ll = 5; lr = 2;
			ll <<= lr;
			if(ll != 20){
			lrc = 314;
			if(prlc) printf(f,lrc);
			}
			ll = 5; ur = 2;
			ll <<= ur;
			if(ll != 20){
			lrc = 315;
			if(prlc) printf(f,lrc);
			}
			ul = 5; cr = 2;
			ul <<= cr;
			if(ul != 20){
			lrc = 316;
			if(prlc) printf(f,lrc);
			}
			ul = 5; sr = 2;
			ul <<= sr;
			if(ul != 20){
			lrc = 317;
			if(prlc) printf(f,lrc);
			}
			ul = 5; ir = 2;
			ul <<= ir;
			if(ul != 20){
			lrc = 318;
			if(prlc) printf(f,lrc);
			}
			ul = 5; lr = 2;
			ul <<= lr;
			if(ul != 20){
			lrc = 319;
			if(prlc) printf(f,lrc);
			}
			ul = 5; ur = 2;
			ul <<= ur;
			if(ul != 20){
			lrc = 320;
			if(prlc) printf(f,lrc);
			}
			cl = 12; cr = 10;
			cl &= cr;
			if(cl != 8){
			lrc = 321;
			if(prlc) printf(f,lrc);
			}
			cl = 12; sr = 10;
			cl &= sr;
			if(cl != 8){
			lrc = 322;
			if(prlc) printf(f,lrc);
			}
			cl = 12; ir = 10;
			cl &= ir;
			if(cl != 8){
			lrc = 323;
			if(prlc) printf(f,lrc);
			}
			cl = 12; lr = 10;
			cl &= lr;
			if(cl != 8){
			lrc = 324;
			if(prlc) printf(f,lrc);
			}
			cl = 12; ur = 10;
			cl &= ur;
			if(cl != 8){
			lrc = 325;
			if(prlc) printf(f,lrc);
			}
			sl = 12; cr = 10;
			sl &= cr;
			if(sl != 8){
			lrc = 326;
			if(prlc) printf(f,lrc);
			}
			sl = 12; sr = 10;
			sl &= sr;
			if(sl != 8){
			lrc = 327;
			if(prlc) printf(f,lrc);
			}
			sl = 12; ir = 10;
			sl &= ir;
			if(sl != 8){
			lrc = 328;
			if(prlc) printf(f,lrc);
			}
			sl = 12; lr = 10;
			sl &= lr;
			if(sl != 8){
			lrc = 329;
			if(prlc) printf(f,lrc);
			}
			sl = 12; ur = 10;
			sl &= ur;
			if(sl != 8){
			lrc = 330;
			if(prlc) printf(f,lrc);
			}
			il = 12; cr = 10;
			il &= cr;
			if(il != 8){
			lrc = 331;
			if(prlc) printf(f,lrc);
			}
			il = 12; sr = 10;
			il &= sr;
			if(il != 8){
			lrc = 332;
			if(prlc) printf(f,lrc);
			}
			il = 12; ir = 10;
			il &= ir;
			if(il != 8){
			lrc = 333;
			if(prlc) printf(f,lrc);
			}
			il = 12; lr = 10;
			il &= lr;
			if(il != 8){
			lrc = 334;
			if(prlc) printf(f,lrc);
			}
			il = 12; ur = 10;
			il &= ur;
			if(il != 8){
			lrc = 335;
			if(prlc) printf(f,lrc);
			}
			ll = 12; cr = 10;
			ll &= cr;
			if(ll != 8){
			lrc = 336;
			if(prlc) printf(f,lrc);
			}
			ll = 12; sr = 10;
			ll &= sr;
			if(ll != 8){
			lrc = 337;
			if(prlc) printf(f,lrc);
			}
			ll = 12; ir = 10;
			ll &= ir;
			if(ll != 8){
			lrc = 338;
			if(prlc) printf(f,lrc);
			}
			ll = 12; lr = 10;
			ll &= lr;
			if(ll != 8){
			lrc = 339;
			if(prlc) printf(f,lrc);
			}
			ll = 12; ur = 10;
			ll &= ur;
			if(ll != 8){
			lrc = 340;
			if(prlc) printf(f,lrc);
			}
			ul = 12; cr = 10;
			ul &= cr;
			if(ul != 8){
			lrc = 341;
			if(prlc) printf(f,lrc);
			}
			ul = 12; sr = 10;
			ul &= sr;
			if(ul != 8){
			lrc = 342;
			if(prlc) printf(f,lrc);
			}
			ul = 12; ir = 10;
			ul &= ir;
			if(ul != 8){
			lrc = 343;
			if(prlc) printf(f,lrc);
			}
			ul = 12; lr = 10;
			ul &= lr;
			if(ul != 8){
			lrc = 344;
			if(prlc) printf(f,lrc);
			}
			ul = 12; ur = 10;
			ul &= ur;
			if(ul != 8){
			lrc = 345;
			if(prlc) printf(f,lrc);
			}
			cl = 12; cr = 10;
			cl ^= cr;
			if(cl != 6){
			lrc = 346;
			if(prlc) printf(f,lrc);
			}
			cl = 12; sr = 10;
			cl ^= sr;
			if(cl != 6){
			lrc = 347;
			if(prlc) printf(f,lrc);
			}
			cl = 12; ir = 10;
			cl ^= ir;
			if(cl != 6){
			lrc = 348;
			if(prlc) printf(f,lrc);
			}
			cl = 12; lr = 10;
			cl ^= lr;
			if(cl != 6){
			lrc = 349;
			if(prlc) printf(f,lrc);
			}
			cl = 12; ur = 10;
			cl ^= ur;
			if(cl != 6){
			lrc = 350;
			if(prlc) printf(f,lrc);
			}
			sl = 12; cr = 10;
			sl ^= cr;
			if(sl != 6){
			lrc = 351;
			if(prlc) printf(f,lrc);
			}
			sl = 12; sr = 10;
			sl ^= sr;
			if(sl != 6){
			lrc = 352;
			if(prlc) printf(f,lrc);
			}
			sl = 12; ir = 10;
			sl ^= ir;
			if(sl != 6){
			lrc = 353;
			if(prlc) printf(f,lrc);
			}
			sl = 12; lr = 10;
			sl ^= lr;
			if(sl != 6){
			lrc = 354;
			if(prlc) printf(f,lrc);
			}
			sl = 12; ur = 10;
			sl ^= ur;
			if(sl != 6){
			lrc = 355;
			if(prlc) printf(f,lrc);
			}
			il = 12; cr = 10;
			il ^= cr;
			if(il != 6){
			lrc = 356;
			if(prlc) printf(f,lrc);
			}
			il = 12; sr = 10;
			il ^= sr;
			if(il != 6){
			lrc = 357;
			if(prlc) printf(f,lrc);
			}
			il = 12; ir = 10;
			il ^= ir;
			if(il != 6){
			lrc = 358;
			if(prlc) printf(f,lrc);
			}
			il = 12; lr = 10;
			il ^= lr;
			if(il != 6){
			lrc = 359;
			if(prlc) printf(f,lrc);
			}
			il = 12; ur = 10;
			il ^= ur;
			if(il != 6){
			lrc = 360;
			if(prlc) printf(f,lrc);
			}
			ll = 12; cr = 10;
			ll ^= cr;
			if(ll != 6){
			lrc = 361;
			if(prlc) printf(f,lrc);
			}
			ll = 12; sr = 10;
			ll ^= sr;
			if(ll != 6){
			lrc = 362;
			if(prlc) printf(f,lrc);
			}
			ll = 12; ir = 10;
			ll ^= ir;
			if(ll != 6){
			lrc = 363;
			if(prlc) printf(f,lrc);
			}
			ll = 12; lr = 10;
			ll ^= lr;
			if(ll != 6){
			lrc = 364;
			if(prlc) printf(f,lrc);
			}
			ll = 12; ur = 10;
			ll ^= ur;
			if(ll != 6){
			lrc = 365;
			if(prlc) printf(f,lrc);
			}
			ul = 12; cr = 10;
			ul ^= cr;
			if(ul != 6){
			lrc = 366;
			if(prlc) printf(f,lrc);
			}
			ul = 12; sr = 10;
			ul ^= sr;
			if(ul != 6){
			lrc = 367;
			if(prlc) printf(f,lrc);
			}
			ul = 12; ir = 10;
			ul ^= ir;
			if(ul != 6){
			lrc = 368;
			if(prlc) printf(f,lrc);
			}
			ul = 12; lr = 10;
			ul ^= lr;
			if(ul != 6){
			lrc = 369;
			if(prlc) printf(f,lrc);
			}
			ul = 12; ur = 10;
			ul ^= ur;
			if(ul != 6){
			lrc = 370;
			if(prlc) printf(f,lrc);
			}
			cl = 12; cr = 10;
			cl |= cr;
			if(cl != 14){
			lrc = 371;
			if(prlc) printf(f,lrc);
			}
			cl = 12; sr = 10;
			cl |= sr;
			if(cl != 14){
			lrc = 372;
			if(prlc) printf(f,lrc);
			}
			cl = 12; ir = 10;
			cl |= ir;
			if(cl != 14){
			lrc = 373;
			if(prlc) printf(f,lrc);
			}
			cl = 12; lr = 10;
			cl |= lr;
			if(cl != 14){
			lrc = 374;
			if(prlc) printf(f,lrc);
			}
			cl = 12; ur = 10;
			cl |= ur;
			if(cl != 14){
			lrc = 375;
			if(prlc) printf(f,lrc);
			}
			sl = 12; cr = 10;
			sl |= cr;
			if(sl != 14){
			lrc = 376;
			if(prlc) printf(f,lrc);
			}
			sl = 12; sr = 10;
			sl |= sr;
			if(sl != 14){
			lrc = 377;
			if(prlc) printf(f,lrc);
			}
			sl = 12; ir = 10;
			sl |= ir;
			if(sl != 14){
			lrc = 378;
			if(prlc) printf(f,lrc);
			}
			sl = 12; lr = 10;
			sl |= lr;
			if(sl != 14){
			lrc = 379;
			if(prlc) printf(f,lrc);
			}
			sl = 12; ur = 10;
			sl |= ur;
			if(sl != 14){
			lrc = 380;
			if(prlc) printf(f,lrc);
			}
			il = 12; cr = 10;
			il |= cr;
			if(il != 14){
			lrc = 381;
			if(prlc) printf(f,lrc);
			}
			il = 12; sr = 10;
			il |= sr;
			if(il != 14){
			lrc = 382;
			if(prlc) printf(f,lrc);
			}
			il = 12; ir = 10;
			il |= ir;
			if(il != 14){
			lrc = 383;
			if(prlc) printf(f,lrc);
			}
			il = 12; lr = 10;
			il |= lr;
			if(il != 14){
			lrc = 384;
			if(prlc) printf(f,lrc);
			}
			il = 12; ur = 10;
			il |= ur;
			if(il != 14){
			lrc = 385;
			if(prlc) printf(f,lrc);
			}
			ll = 12; cr = 10;
			ll |= cr;
			if(ll != 14){
			lrc = 386;
			if(prlc) printf(f,lrc);
			}
			ll = 12; sr = 10;
			ll |= sr;
			if(ll != 14){
			lrc = 387;
			if(prlc) printf(f,lrc);
			}
			ll = 12; ir = 10;
			ll |= ir;
			if(ll != 14){
			lrc = 388;
			if(prlc) printf(f,lrc);
			}
			ll = 12; lr = 10;
			ll |= lr;
			if(ll != 14){
			lrc = 389;
			if(prlc) printf(f,lrc);
			}
			ll = 12; ur = 10;
			ll |= ur;
			if(ll != 14){
			lrc = 390;
			if(prlc) printf(f,lrc);
			}
			ul = 12; cr = 10;
			ul |= cr;
			if(ul != 14){
			lrc = 391;
			if(prlc) printf(f,lrc);
			}
			ul = 12; sr = 10;
			ul |= sr;
			if(ul != 14){
			lrc = 392;
			if(prlc) printf(f,lrc);
			}
			ul = 12; ir = 10;
			ul |= ir;
			if(ul != 14){
			lrc = 393;
			if(prlc) printf(f,lrc);
			}
			ul = 12; lr = 10;
			ul |= lr;
			if(ul != 14){
			lrc = 394;
			if(prlc) printf(f,lrc);
			}
			ul = 12; ur = 10;
			ul |= ur;
			if(ul != 14){
			lrc = 395;
			if(prlc) printf(f,lrc);
			}
			if(lrc != 0) {
			rc = 1;
			if(pd0->flgd != 0) printf(s714er,1);
			}
			return rc;
		return 0;
}
			static const char *s715er = "s715,er%d\n";
			static const char *qs715 = "s715   ";
static int s715(struct defs *pd0)
{
			int rc;
			char *ps, *pt;
			int a, t, c, i;
			a = c = 0;
			ps = qs715;
			pt = pd0->rfs;
			rc = 0;
			while (*pt++ = *ps++);
			i = 1;
			if( i++,i++,i++,i++,++i != 6 ){
			if(pd0->flgd != 0) printf(s715er,1);
			rc = rc+1;
			}
			if(s715f(a, (t=3, t+2), c) != 5){
			if(pd0->flgd != 0) printf(s715er,2);
			rc = rc+2;
			}
			return rc;
}
static int s715f(int x, int y, int z)
{
			return y;
}
			static const char *s72er = "s72,er%d\n";
			static const char *qs72 = "s72    ";
static int s72(struct defs *pd0)
{
			int rc;
			char *ps, *pt;
			int k, j, i, lrc;
			char c;
			short s;
			long l;
			unsigned u;
			double d;
			float f;
			ps = qs72;
			pt = pd0->rfs;
			rc = 0;
			while (*pt++ = *ps++);
			k = 2;
			if(*&*&k != 2){
			rc = rc+1;
			printf(s72er,1);
			}
			if(k+(-k) != 0){
			rc = rc+2;
			printf(s72er,2);
			}
			k = 0;
			for(j=0;j<pd0->ibits;j++) k = (k<<1)|1;
			if(~k != 0){
			rc = rc+4;
			printf(s72er,4);
			}
			k = 5;
			if( ++k != 6 || --k != 5
			|| k++ != 5 || k-- != 6
			|| k != 5 ){
			rc = rc+8;
			printf(s72er,8);
			}
			c = 26; l = 26; d = 26.;
			s = 26; u = 26;
			i = 26; f = 26.;
			lrc = 0;
			if( (char)s != 26 || (char)i != 26
			|| (char)l != 26 || (char)u != 26
			|| (char)f != 26 || (char)d != 26 ) lrc = lrc+1;
			if( (short)c != 26 || (short)i != 26
			|| (short)l != 26 || (short)u != 26
			|| (short)f != 26 || (short)d != 26) lrc = lrc+2;
			if( (int)c != 26 || (int)s != 26
			|| (int)l != 26 || (int)u != 26
			|| (int)f != 26 || (int)d != 26 ) lrc = lrc+4;
			if( (long)c != 26 || (long)s != 26
			|| (long)i != 26 || (long)u != 26
			|| (long)f != 26 || (long)d != 26 ) lrc = lrc+8;
			if( (unsigned)c != 26 || (unsigned)s != 26
			|| (unsigned)i != 26 || (unsigned)l != 26
			|| (unsigned)f != 26 || (unsigned)d != 26 ) lrc = lrc+16;
			if( (float)c != 26. || (float)s != 26.
			|| (float)i != 26. || (float)l != 26.
			|| (float)u != 26. || (float)d != 26. ) lrc = lrc+32;
			if( (double)c != 26. || (double)s != 26.
			|| (double)i != 26. || (double)l != 26.
			|| (double)u != 26. || (double)f != 26. ) lrc = lrc+64;
			if(lrc != 0){
			rc = rc+16;
			printf(s72er,16);
			}
			return rc;
}
			static const char *s757er = "s757,er%d\n";
			static const char *qs757 = "s757   ";
static int s757(struct defs *pd0)
{
			int rc;
			char *ps, *pt;
			int t,lrc,k,j,a,b,c,d,x[16],*p;
			unsigned rs, ls, rt, lt;
			ps = qs757;
			pt = pd0->rfs;
			rc = 0;
			while (*pt++ = *ps++);
			t = 40;
			if(t<<3<<2 != 1280 || t>>3>>2 != 1){
			rc = rc+1;
			if(pd0->flgd != 0) printf(s757er,1);
			}
			lrc = 0;
			for(k=0; k<pd0->ubits; k++){
			rs = 1;
			ls = rs<<(pd0->ubits-1);
			rt = 0;
			lt = ~rt>>k;
			rt = ~rt<<k;
			for(j=0; j<pd0->ubits;j++){
			if((j<k) != ((rs&rt) == 0) || (j<k) != ((ls&lt) == 0)) lrc = 1;
			rs = rs<<1;
			ls = ls>>1;
			}
			}
			if(lrc != 0){
			rc = rc+2;
			if(pd0->flgd != 0) printf(s757er,2);
			}
			a = 3;
			b = 2;
			c = 1;
			if((a<b<c) != 1){
			rc = rc+4;
			if(pd0->flgd != 0) printf(s757er,4);
			}
			if( &x[1] == &x[0] ){
			rc = rc+8;
			if(pd0->flgd != 0) printf(s757er,8);
			}
			if( &x[1] < &x[0] ) if(pd0->flgm != 0)
			printf("Increasing array elements assigned to decreasing locations\n");
			lrc = 0;
			for(j=0;j<16;j++) x[j] = 1;
			x[1] = 0;
			x[4] = 0;
			x[6] = 0;
			x[7] = 0;
			x[9] = 0;
			x[13] = 0;
			for(a=0;a<2;a++)
			for(b=0;b<2;b++)
			for(c=0;c<2;c++)
			for(d=0;d<2;d++)
			if((a<b==c<d) != x[8*a+4*b+2*c+d] ) lrc = 1;
			if(lrc != 0){
			rc = rc+16;
			if(pd0->flgd != 0) printf(s757er,16);
			}
			p = ((void *)0);
			if(p != ((void *)0)){
			rc = rc+32;
			if(pd0->flgd != 0) printf(s757er,32);
			}
			return rc;
}
			static const char *fl = "Local error %d.\n";
			static const char *s7813er = "s7813,er%d\n";
			static const char *qs7813 = "s7813  ";
static int s7813(struct defs *pd0)
{
			register int prlc, lrc;
			int i, j, r, zero, one;
			int rc;
			char *ps, *pt;
			ps = qs7813;
			pt = pd0->rfs;
			lrc = 0;
			rc = 0;
			prlc = pd0->flgl;
			while (*pt++ = *ps++);
			if(((char)12 & (char)10) != 8) {lrc = 1;
			if(prlc) printf(fl,lrc);}
			if(((char)12 | (char)10) != 14) {lrc = 2;
			if(prlc) printf(fl,lrc);}
			if(((char)12 ^ (char)10) != 6) {lrc = 3;
			if(prlc) printf(fl,lrc);}
			if(((char)12 & (short)10) != 8) {lrc = 4;
			if(prlc) printf(fl,lrc);}
			if(((char)12 | (short)10) != 14) {lrc = 5;
			if(prlc) printf(fl,lrc);}
			if(((char)12 ^ (short)10) != 6) {lrc = 6;
			if(prlc) printf(fl,lrc);}
			if(((char)12 & (long)10) != 8) {lrc = 7;
			if(prlc) printf(fl,lrc);}
			if(((char)12 | (long)10) != 14) {lrc = 8;
			if(prlc) printf(fl,lrc);}
			if(((char)12 ^ (long)10) != 6) {lrc = 9;
			if(prlc) printf(fl,lrc);}
			if(((char)12 & (unsigned)10) != 8) {lrc = 10;
			if(prlc) printf(fl,lrc);}
			if(((char)12 | (unsigned)10) != 14) {lrc = 11;
			if(prlc) printf(fl,lrc);}
			if(((char)12 ^ (unsigned)10) != 6) {lrc = 12;
			if(prlc) printf(fl,lrc);}
			if(((char)12 & (int)10) != 8) {lrc = 13;
			if(prlc) printf(fl,lrc);}
			if(((char)12 | (int)10) != 14) {lrc = 14;
			if(prlc) printf(fl,lrc);}
			if(((char)12 ^ (int)10) != 6) {lrc = 15;
			if(prlc) printf(fl,lrc);}
			if(((short)12 & (char)10) != 8) {lrc = 16;
			if(prlc) printf(fl,lrc);}
			if(((short)12 | (char)10) != 14) {lrc = 17;
			if(prlc) printf(fl,lrc);}
			if(((short)12 ^ (char)10) != 6) {lrc = 18;
			if(prlc) printf(fl,lrc);}
			if(((short)12 & (short)10) != 8) {lrc = 16;
			if(prlc) printf(fl,lrc);}
			if(((short)12 | (short)10) != 14) {lrc = 20;
			if(prlc) printf(fl,lrc);}
			if(((short)12 ^ (short)10) != 6) {lrc = 21;
			if(prlc) printf(fl,lrc);}
			if(((short)12 & (long)10) != 8) {lrc = 22;
			if(prlc) printf(fl,lrc);}
			if(((short)12 | (long)10) != 14) {lrc = 23;
			if(prlc) printf(fl,lrc);}
			if(((short)12 ^ (long)10) != 6) {lrc = 24;
			if(prlc) printf(fl,lrc);}
			if(((short)12 & (unsigned)10) != 8) {lrc = 25;
			if(prlc) printf(fl,lrc);}
			if(((short)12 | (unsigned)10) != 14) {lrc = 26;
			if(prlc) printf(fl,lrc);}
			if(((short)12 ^ (unsigned)10) != 6) {lrc = 27;
			if(prlc) printf(fl,lrc);}
			if(((short)12 & (int)10) != 8) {lrc = 28;
			if(prlc) printf(fl,lrc);}
			if(((short)12 | (int)10) != 14) {lrc = 26;
			if(prlc) printf(fl,lrc);}
			if(((short)12 ^ (int)10) != 6) {lrc = 30;
			if(prlc) printf(fl,lrc);}
			if(((long)12 & (char)10) != 8) {lrc = 31;
			if(prlc) printf(fl,lrc);}
			if(((long)12 | (char)10) != 14) {lrc = 32;
			if(prlc) printf(fl,lrc);}
			if(((long)12 ^ (char)10) != 6) {lrc = 33;
			if(prlc) printf(fl,lrc);}
			if(((long)12 & (short)10) != 8) {lrc = 34;
			if(prlc) printf(fl,lrc);}
			if(((long)12 | (short)10) != 14) {lrc = 35;
			if(prlc) printf(fl,lrc);}
			if(((long)12 ^ (short)10) != 6) {lrc = 36;
			if(prlc) printf(fl,lrc);}
			if(((long)12 & (long)10) != 8) {lrc = 37;
			if(prlc) printf(fl,lrc);}
			if(((long)12 | (long)10) != 14) {lrc = 38;
			if(prlc) printf(fl,lrc);}
			if(((long)12 ^ (long)10) != 6) {lrc = 39;
			if(prlc) printf(fl,lrc);}
			if(((long)12 & (unsigned)10) != 8) {lrc = 40;
			if(prlc) printf(fl,lrc);}
			if(((long)12 | (unsigned)10) != 14) {lrc = 41;
			if(prlc) printf(fl,lrc);}
			if(((long)12 ^ (unsigned)10) != 6) {lrc = 42;
			if(prlc) printf(fl,lrc);}
			if(((long)12 & (int)10) != 8) {lrc = 43;
			if(prlc) printf(fl,lrc);}
			if(((long)12 | (int)10) != 14) {lrc = 44;
			if(prlc) printf(fl,lrc);}
			if(((long)12 ^ (int)10) != 6) {lrc = 45;
			if(prlc) printf(fl,lrc);}
			if(((unsigned)12 & (char)10) != 8) {lrc = 46;
			if(prlc) printf(fl,lrc);}
			if(((unsigned)12 | (char)10) != 14) {lrc = 47;
			if(prlc) printf(fl,lrc);}
			if(((unsigned)12 ^ (char)10) != 6) {lrc = 48;
			if(prlc) printf(fl,lrc);}
			if(((unsigned)12 & (short)10) != 8) {lrc = 49;
			if(prlc) printf(fl,lrc);}
			if(((unsigned)12 | (short)10) != 14) {lrc = 50;
			if(prlc) printf(fl,lrc);}
			if(((unsigned)12 ^ (short)10) != 6) {lrc = 51;
			if(prlc) printf(fl,lrc);}
			if(((unsigned)12 & (long)10) != 8) {lrc = 52;
			if(prlc) printf(fl,lrc);}
			if(((unsigned)12 | (long)10) != 14) {lrc = 53;
			if(prlc) printf(fl,lrc);}
			if(((unsigned)12 ^ (long)10) != 6) {lrc = 54;
			if(prlc) printf(fl,lrc);}
			if(((unsigned)12 & (unsigned)10) != 8) {lrc = 55;
			if(prlc) printf(fl,lrc);}
			if(((unsigned)12 | (unsigned)10) != 14) {lrc = 56;
			if(prlc) printf(fl,lrc);}
			if(((unsigned)12 ^ (unsigned)10) != 6) {lrc = 57;
			if(prlc) printf(fl,lrc);}
			if(((unsigned)12 & (int)10) != 8) {lrc = 58;
			if(prlc) printf(fl,lrc);}
			if(((unsigned)12 | (int)10) != 14) {lrc = 56;
			if(prlc) printf(fl,lrc);}
			if(((unsigned)12 ^ (int)10) != 6) {lrc = 60;
			if(prlc) printf(fl,lrc);}
			if(((int)12 & (char)10) != 8) {lrc = 61;
			if(prlc) printf(fl,lrc);}
			if(((int)12 | (char)10) != 14) {lrc = 62;
			if(prlc) printf(fl,lrc);}
			if(((int)12 ^ (char)10) != 6) {lrc = 63;
			if(prlc) printf(fl,lrc);}
			if(((int)12 & (short)10) != 8) {lrc = 64;
			if(prlc) printf(fl,lrc);}
			if(((int)12 | (short)10) != 14) {lrc = 65;
			if(prlc) printf(fl,lrc);}
			if(((int)12 ^ (short)10) != 6) {lrc = 66;
			if(prlc) printf(fl,lrc);}
			if(((int)12 & (long)10) != 8) {lrc = 67;
			if(prlc) printf(fl,lrc);}
			if(((int)12 | (long)10) != 14) {lrc = 68;
			if(prlc) printf(fl,lrc);}
			if(((int)12 ^ (long)10) != 6) {lrc = 69;
			if(prlc) printf(fl,lrc);}
			if(((int)12 & (unsigned)10) != 8) {lrc = 70;
			if(prlc) printf(fl,lrc);}
			if(((int)12 | (unsigned)10) != 14) {lrc = 71;
			if(prlc) printf(fl,lrc);}
			if(((int)12 ^ (unsigned)10) != 6) {lrc = 72;
			if(prlc) printf(fl,lrc);}
			if(((int)12 & (int)10) != 8) {lrc = 73; if(prlc) printf(fl,lrc);}
			if(((int)12 | (int)10) != 14) {lrc = 74; if(prlc) printf(fl,lrc);}
			if(((int)12 ^ (int)10) != 6) {lrc = 75; if(prlc) printf(fl,lrc);}
			if(lrc != 0){
			if(pd0->flgd != 0) printf(s7813er,1);
			rc = rc+1;
			}
			lrc = 0;
			i = j = 0;
			r = i++ && j++;
			if(i!=1) {lrc = 1; if(prlc) printf(fl,lrc);}
			if(j!=0) {lrc = 2; if(prlc) printf(fl,lrc);}
			if(r!=0) {lrc = 3; if(prlc) printf(fl,lrc);}
			r = i && j++;
			if(i!=1) {lrc = 4; if(prlc) printf(fl,lrc);}
			if(j!=1) {lrc = 5; if(prlc) printf(fl,lrc);}
			if(r!=0) {lrc = 6; if(prlc) printf(fl,lrc);}
			r = i-- && j;
			if(i!=0) {lrc = 7; if(prlc) printf(fl,lrc);}
			if(j!=1) {lrc = 8; if(prlc) printf(fl,lrc);}
			if(r!=1) {lrc = 9; if(prlc) printf(fl,lrc);}
			r = i && j--;
			if(i!=0) {lrc = 10; if(prlc) printf(fl,lrc);}
			if(j!=1) {lrc = 11; if(prlc) printf(fl,lrc);}
			if(r!=0) {lrc = 12; if(prlc) printf(fl,lrc);}
			if(lrc!=0){
			if(pd0->flgd != 0) printf(s7813er,2);
			rc = rc+2;
			}
			lrc = 0;
			i = j = 0;
			r = i++ || j;
			if(i!=1) {lrc = 1; if(prlc) printf(fl,lrc);}
			if(j!=0) {lrc = 2; if(prlc) printf(fl,lrc);}
			if(r!=0) {lrc = 3; if(prlc) printf(fl,lrc);}
			r = j++ || i;
			if(i!=1) {lrc = 4; if(prlc) printf(fl,lrc);}
			if(j!=1) {lrc = 5; if(prlc) printf(fl,lrc);}
			if(r!=1) {lrc = 6; if(prlc) printf(fl,lrc);}
			r = i-- || j--;
			if(i!=0) {lrc = 7; if(prlc) printf(fl,lrc);}
			if(j!=1) {lrc = 8; if(prlc) printf(fl,lrc);}
			if(r!=1) {lrc = 9; if(prlc) printf(fl,lrc);}
			r = i || j--;
			if(i!=0) {lrc = 10; if(prlc) printf(fl,lrc);}
			if(j!=0) {lrc = 11; if(prlc) printf(fl,lrc);}
			if(r!=1) {lrc = 12; if(prlc) printf(fl,lrc);}
			if(lrc!=0){
			if(pd0->flgd != 0) printf(s7813er,4);
			rc = rc+4;
			}
			i = j = 0;
			zero = 0;
			one = 1;
			r = one?zero:one?i++:j++;
			if(r!=0 || i!=0 || j!=0){
			if(pd0->flgd != 0) printf(s7813er,8);
			rc = rc+8;
			}
			if((one?zero:1) != 0 || (zero?1:zero) != 0){
			if(pd0->flgd != 0) printf(s7813er,16);
			rc = rc+16;
			}
			return rc;
		return 0;
}
			static const char *s81er = "s81,er%d\n";
			static const char *qs81 = "s81    ";
			static const char *badtest = "Register count for %s is unreliable.\n";
			static const char *goodtest = "%d registers assigned to %s variables.\n";
static int s81(struct defs *pd0)
{
			char *ps, *pt;
			int k, rc, j, crc, prc, irc;
			register char rchar;
			char nrchar;
			register int *rptr;
			int *nrptr;
			register int rint;
			int nrint;
			rc = 0;
			crc = 0;
			prc = 0;
			irc = 0;
			ps = qs81;
			pt = pd0->rfs;
			while(*pt++ = *ps++);
			k = 1;
			for (j=0; j<50; j++){
			rchar = k;
			nrchar = k;
			rptr = &k;
			nrptr = &k;
			rint = k;
			nrint = k;
			if ( rchar != nrchar ) crc = 1;
			if ( rptr != nrptr ) prc = 1;
			if ( rint != nrint ) irc = 1;
			k = k<<1;
			}
			if ( crc != 0 ) {
			rc = rc+1;
			if( pd0 -> flgd != 0 ) printf(s81er,1);
			}
			if ( prc != 0 ) {
			rc = rc+2;
			if( pd0 -> flgd != 0 ) printf(s81er,2);
			}
			if ( irc != 0 ) {
			rc = rc+4;
			if( pd0 -> flgd != 0 ) printf(s81er,4);
			}
			k = regc();
			if ( pd0->flgm != 0 ) {
			if ( k < 0 ) printf(badtest,"char");
			else printf(goodtest,k,"char");
			}
			k = regp();
			if ( pd0->flgm != 0 ) {
			if ( k<0 ) printf(badtest,"pointer");
			else printf(goodtest,k,"pointer");
			}
			k = regi();
			if ( pd0->flgm != 0 ) {
			if ( k<0 ) printf(badtest,"int");
			else printf(goodtest,k,"int");
			}
			return rc;
}
static int regc(void) {
			char r00;
			char r01;
			char r02;
			char r03;
			register char r04;
			char r05;
			register char r06;
			char r07;
			register char r08;
			char r09;
			register char r10;
			char r11;
			register char r12;
			char r13;
			register char r14;
			char r15;
			register char r16;
			char r17;
			register char r18;
			char r19;
			register char r20;
			char r21;
			register char r22;
			char r23;
			register char r24;
			char r25;
			register char r26;
			char r27;
			register char r28;
			char r29;
			register char r30;
			char r31;
			register char r32;
			char r33;
			register char r34;
			char r35;
			char r36;
			char r37;
			char r38;
			int s, n1, n2, nr, j, d[22];
			r00 = 0;
			r01 = 1;
			r02 = 2;
			r03 = 3;
			r04 = 4;
			r05 = 5;
			r06 = 6;
			r07 = 7;
			r08 = 8;
			r09 = 9;
			r10 = 10;
			r11 = 11;
			r12 = 12;
			r13 = 13;
			r14 = 14;
			r15 = 15;
			r16 = 16;
			r17 = 17;
			r18 = 18;
			r19 = 19;
			r20 = 20;
			r21 = 21;
			r22 = 22;
			r23 = 23;
			r24 = 24;
			r25 = 25;
			r26 = 26;
			r27 = 27;
			r28 = 28;
			r29 = 29;
			r30 = 30;
			r31 = 31;
			r32 = 32;
			r33 = 33;
			r34 = 34;
			r35 = 35;
			r36 = 36;
			r37 = 37;
			r38 = 38;
			d[0] = &r01 - &r00;
			d[1] = &r02 - &r01;
			d[2] = &r03 - &r02;
			d[3] = &r05 - &r03;
			d[4] = &r07 - &r05;
			d[5] = &r09 - &r07;
			d[6] = &r11 - &r09;
			d[7] = &r13 - &r11;
			d[8] = &r15 - &r13;
			d[9] = &r17 - &r15;
			d[10] = &r19 - &r17;
			d[11] = &r21 - &r19;
			d[12] = &r23 - &r21;
			d[13] = &r25 - &r23;
			d[14] = &r27 - &r25;
			d[15] = &r29 - &r27;
			d[16] = &r31 - &r29;
			d[17] = &r33 - &r31;
			d[18] = &r35 - &r33;
			d[19] = &r36 - &r35;
			d[20] = &r37 - &r36;
			d[21] = &r38 - &r37;
			n1 = d[0];
			s = 1;
			for (j=0; j<22; j++)
			switch (s) {
			case 1: if (d[j] != n1) {
			n2 = d[j];
			s = 2;
			nr = 1;
			}
			break;
			case 2: if (d[j] == n1) {
			s = 3;
			break;
			}
			if (d[j] == n2) {
			nr = nr+1;
			break;
			}
			s = 4;
			break;
			case 3: if (d[j] != n1) s = 4;
			break;
			}
			;
			if (s == 3) return 16-nr;
			else return -1;
}
static int regi(void) {
			int r00;
			int r01;
			int r02;
			int r03;
			register int r04;
			int r05;
			register int r06;
			int r07;
			register int r08;
			int r09;
			register int r10;
			int r11;
			register int r12;
			int r13;
			register int r14;
			int r15;
			register int r16;
			int r17;
			register int r18;
			int r19;
			register int r20;
			int r21;
			register int r22;
			int r23;
			register int r24;
			int r25;
			register int r26;
			int r27;
			register int r28;
			int r29;
			register int r30;
			int r31;
			register int r32;
			int r33;
			register int r34;
			int r35;
			int r36;
			int r37;
			int r38;
			int s, n1, n2, nr, j, d[22];
			r00 = 0;
			r01 = 1;
			r02 = 2;
			r03 = 3;
			r04 = 4;
			r05 = 5;
			r06 = 6;
			r07 = 7;
			r08 = 8;
			r09 = 9;
			r10 = 10;
			r11 = 11;
			r12 = 12;
			r13 = 13;
			r14 = 14;
			r15 = 15;
			r16 = 16;
			r17 = 17;
			r18 = 18;
			r19 = 19;
			r20 = 20;
			r21 = 21;
			r22 = 22;
			r23 = 23;
			r24 = 24;
			r25 = 25;
			r26 = 26;
			r27 = 27;
			r28 = 28;
			r29 = 29;
			r30 = 30;
			r31 = 31;
			r32 = 32;
			r33 = 33;
			r34 = 34;
			r35 = 35;
			r36 = 36;
			r37 = 37;
			r38 = 38;
			d[0] = &r01 - &r00;
			d[1] = &r02 - &r01;
			d[2] = &r03 - &r02;
			d[3] = &r05 - &r03;
			d[4] = &r07 - &r05;
			d[5] = &r09 - &r07;
			d[6] = &r11 - &r09;
			d[7] = &r13 - &r11;
			d[8] = &r15 - &r13;
			d[9] = &r17 - &r15;
			d[10] = &r19 - &r17;
			d[11] = &r21 - &r19;
			d[12] = &r23 - &r21;
			d[13] = &r25 - &r23;
			d[14] = &r27 - &r25;
			d[15] = &r29 - &r27;
			d[16] = &r31 - &r29;
			d[17] = &r33 - &r31;
			d[18] = &r35 - &r33;
			d[19] = &r36 - &r35;
			d[20] = &r37 - &r36;
			d[21] = &r38 - &r37;
			n1 = d[0];
			s = 1;
			for (j=0; j<22; j++)
			switch (s) {
			case 1: if (d[j] != n1) {
			n2 = d[j];
			s = 2;
			nr = 1;
			}
			break;
			case 2: if (d[j] == n1) {
			s = 3;
			break;
			}
			if (d[j] == n2) {
			nr = nr+1;
			break;
			}
			s = 4;
			break;
			case 3: if (d[j] != n1) s = 4;
			break;
			}
			;
			if (s == 3) return 16-nr;
			else return -1;
}
static int regp(void) {
			int *r00;
			int *r01;
			int *r02;
			int *r03;
			register int *r04;
			int *r05;
			register int *r06;
			int *r07;
			register int *r08;
			int *r09;
			register int *r10;
			int *r11;
			register int *r12;
			int *r13;
			register int *r14;
			int *r15;
			register int *r16;
			int *r17;
			register int *r18;
			int *r19;
			register int *r20;
			int *r21;
			register int *r22;
			int *r23;
			register int *r24;
			int *r25;
			register int *r26;
			int *r27;
			register int *r28;
			int *r29;
			register int *r30;
			int *r31;
			register int *r32;
			int *r33;
			register int *r34;
			int *r35;
			int *r36;
			int *r37;
			int *r38;
			int s, n1, n2, nr, j, d[22];
			r00 = (int *)&r00;
			r01 = (int *)&r01;
			r02 = (int *)&r02;
			r03 = (int *)&r03;
			r04 = (int *)&r05;
			r05 = (int *)&r05;
			r06 = (int *)&r07;
			r07 = (int *)&r07;
			r08 = (int *)&r09;
			r09 = (int *)&r09;
			r10 = (int *)&r11;
			r11 = (int *)&r11;
			r12 = (int *)&r13;
			r13 = (int *)&r13;
			r14 = (int *)&r15;
			r15 = (int *)&r15;
			r16 = (int *)&r17;
			r17 = (int *)&r17;
			r18 = (int *)&r19;
			r19 = (int *)&r19;
			r20 = (int *)&r21;
			r21 = (int *)&r21;
			r22 = (int *)&r23;
			r23 = (int *)&r23;
			r24 = (int *)&r25;
			r25 = (int *)&r25;
			r26 = (int *)&r27;
			r27 = (int *)&r27;
			r28 = (int *)&r29;
			r29 = (int *)&r29;
			r30 = (int *)&r31;
			r31 = (int *)&r31;
			r32 = (int *)&r33;
			r33 = (int *)&r33;
			r34 = (int *)&r35;
			r35 = (int *)&r35;
			r36 = (int *)&r36;
			r37 = (int *)&r37;
			r38 = (int *)&r38;
			d[0] = &r01 - &r00;
			d[1] = &r02 - &r01;
			d[2] = &r03 - &r02;
			d[3] = &r05 - &r03;
			d[4] = &r07 - &r05;
			d[5] = &r09 - &r07;
			d[6] = &r11 - &r09;
			d[7] = &r13 - &r11;
			d[8] = &r15 - &r13;
			d[9] = &r17 - &r15;
			d[10] = &r19 - &r17;
			d[11] = &r21 - &r19;
			d[12] = &r23 - &r21;
			d[13] = &r25 - &r23;
			d[14] = &r27 - &r25;
			d[15] = &r29 - &r27;
			d[16] = &r31 - &r29;
			d[17] = &r33 - &r31;
			d[18] = &r35 - &r33;
			d[19] = &r36 - &r35;
			d[20] = &r37 - &r36;
			d[21] = &r38 - &r37;
			n1 = d[0];
			s = 1;
			for (j=0; j<22; j++)
			switch (s) {
			case 1: if (d[j] != n1) {
			n2 = d[j];
			s = 2;
			nr = 1;
			}
			break;
			case 2: if (d[j] == n1) {
			s = 3;
			break;
			}
			if (d[j] == n2) {
			nr = nr+1;
			break;
			}
			s = 4;
			break;
			case 3: if (d[j] != n1) s = 4;
			break;
			}
			;
			if (s == 3) return 16-nr;
			else return -1;
}
			static const char *s84er = "s84,er%d\n";
			static const char *qs84 = "s84    ";
static int s84(struct defs *pd0)
{
			int *ip, i, (*pfi)(int), j, k, array(int[], int, int);
			static int x3d[3][5][7];
			float fa[17], *afp[17], sum;
			int rc;
			char *ps, *pt;
			ps = qs84;
			pt = pd0->rfs;
			rc = 0;
			while (*pt++ = *ps++);
			ip = fip(3);
			if(*ip != 3){
			if(pd0->flgd != 0) printf(s84er,1);
			rc = rc+1;
			}
			pfi = glork;
			if(pfi(4) != 4){
			if(pd0->flgd != 0) printf(s84er,2);
			rc = rc+2;
			}
			for(j=0; j<17; j++){
			fa[j] = j;
			afp[j] = &fa[j];
			}
			sum = 0.;
			for(j=0; j<17; j++) sum += *afp[j];
			if(sum != 136){
			if(pd0->flgd != 0) printf(s84er,4);
			rc = rc+4;
			}
			for (i=0; i<3; i++)
			for (j=0; j<5; j++)
			for (k=0; k<7; k++)
			x3d[i][j][k] = i*35+j*7+k;
			i = 1; j = 2; k = 3;
			if( array(x3d,105,0)
			+array(x3d[i],35,35)
			+array(x3d[i][j],7,49)
			+ x3d[i][j][k]-52){
			if(pd0->flgd != 0) printf(s84er,8);
			rc = rc+8;
			}
			return rc;
}
int array(int a[], int size, int start)
{
			int i;
			for(i=0; i<size; i++)
			if(a[i] != i+start) return 1;
			return 0;
}
static int *fip(int x)
{
			static int y;
			y = x;
			return &y;
}
static int glork(int x)
{return x;}
			static const char *s85er = "s85,er%d\n";
			static const char *qs85 = "s85    ";
			static const char *aln = " alignment: ";
static int s85(struct defs *pd0)
{
			int rc;
			char *ps, *pt;
			struct tnode {
			char tword[20];
			int count;
			struct tnode *left;
			struct tnode *right;
			};
			struct tnode s1, s2, *sp;
			struct{
			char cdummy;
			char c;
			} sc;
			struct{
			char cdummy;
			short s;
			} ss;
			struct{
			char cdummy;
			int i;
			} si;
			struct{
			char cdummy;
			long l;
			} sl;
			struct{
			char cdummy;
			unsigned u;
			} su;
			struct{
			char cdummy;
			float f;
			} sf;
			struct{
			char cdummy;
			double d;
			} sd;
			int diff[7], j;
			struct{
			int twobit:2;
			int :1;
			int threebit:3;
			unsigned int onebit:1;
			} s3;
			union{
			char u1[30];
			short u2[30];
			int u3[30];
			long u4[30];
			unsigned u5[30];
			float u6[30];
			double u7[30];
			} u0;
			ps = qs85;
			pt = pd0->rfs;
			rc = 0;
			while (*pt++ = *ps++);
			if( (char *)&s1.count - &s1.tword[0] <= 0
			||(char *)&s1.left - (char *)&s1.count <= 0
			||(char *)&s1.right - (char *)&s1.left <= 0){
			if(pd0->flgd != 0) printf(s85er,1);
			rc = rc+1;
			}
			diff[0] = &sc.c - &sc.cdummy;
			diff[1] = (char *)&ss.s - &ss.cdummy;
			diff[2] = (char *)&si.i - &si.cdummy;
			diff[3] = (char *)&sl.l - &sl.cdummy;
			diff[4] = (char *)&su.u - &su.cdummy;
			diff[5] = (char *)&sf.f - &sf.cdummy;
			diff[6] = (char *)&sd.d - &sd.cdummy;
			if(pd0->flgm != 0)
			for(j=0; j<7; j++)
			printf("%s%s%d\n",type[j],aln,diff[j]);
			s3.threebit = 7;
			s3.twobit = s3.threebit;
			s3.threebit = s3.twobit;
			if(s3.threebit != 3){
			if(s3.threebit == -1){
			if(pd0->flgm != 0) printf("Sign extension in fields\n");
			}
			else{
			if(pd0->flgd != 0) printf(s85er,2);
			rc = rc+2;
			}
			}
			s3.onebit = 1;
			if(s3.onebit != 1){
			if(pd0->flgm != 0)
			printf("Be especially careful with 1-bit fields!\n");
			}
			if( (char *)u0.u1 - (char *)&u0 != 0
			||(char *)u0.u2 - (char *)&u0 != 0
			||(char *)u0.u3 - (char *)&u0 != 0
			||(char *)u0.u4 - (char *)&u0 != 0
			||(char *)u0.u5 - (char *)&u0 != 0
			||(char *)u0.u6 - (char *)&u0 != 0
			||(char *)u0.u7 - (char *)&u0 != 0){
			if(pd0->flgd != 0) printf(s85er,4);
			rc = rc+4;
			}
			if( sizeof u0 < sizeof u0.u1
			||sizeof u0 < sizeof u0.u2
			||sizeof u0 < sizeof u0.u3
			||sizeof u0 < sizeof u0.u4
			||sizeof u0 < sizeof u0.u5
			||sizeof u0 < sizeof u0.u6
			||sizeof u0 < sizeof u0.u7){
			if(pd0->flgd != 0) printf(s85er,8);
			rc = rc+8;
			}
			s1.right = &s2;
			s2.tword[0] = 2;
			s1.right->tword[0] += 1;
			if(s2.tword[0] != 3){
			if(pd0->flgd != 0) printf(s85er,16);
			rc = rc+16;
			}
			return rc;
}
			static const char *s86er = "s86,er%d\n";
			static const char *qs86 = "s86    ";
static int s86(struct defs *pd0)
{
		return 0;
}
static int one(void){
			return 1;
}
static int *metricp;
			static const char *s88er = "s88,er%d\n";
			static const char *qs88 = "s88    ";
static int s88(struct defs *pd0)
{
			int rc;
			char *ps, *pt;
			typedef int MILES, *KLICKSP;
			typedef struct {double re, im;} complex;
			MILES distance;
			extern KLICKSP metricp;
			complex z, *zp;
			ps = qs88;
			pt = pd0->rfs;
			rc = 0;
			while(*pt++ = *ps++);
			if(sizeof distance != sizeof(int)){
			if(pd0->flgd != 0) printf(s88er,1);
			rc = rc+1;
			}
			metricp = &distance;
			distance = 2;
			*metricp = 3;
			if(distance != 3){
			if(pd0->flgd != 0) printf(s88er,2);
			rc = rc+2;
			}
			z.re = 0.;
			z.im = 0.;
			zp = &z;
			zp->re = 1.;
			zp->im = 1.;
			if(z.re+z.im != 2.){
			if(pd0->flgd != 0) printf(s88er,4);
			rc = rc+4;
			}
			return rc;
}
			static const char *s9er = "s9,er%d\n";
			static const char *qs9 = "s9     ";
static int s9(struct defs *pd0)
{
			int rc;
			char *ps, *pt;
			int lrc, i;
			ps = qs9;
			pt = pd0->rfs;
			rc = 0;
			while (*pt++ = *ps++);
			lrc = 0;
			for(i=0; i<2; i++){
			int j;
			register int k;
			j = k = 2;
			{
			int j;
			register int k;
			j = k = 3;
			if((j != 3) || (k != 3)) lrc = 1;
			}
			if((j != 2) || (k != 2)) lrc = 1;
			}
			if(lrc != 0){
			if(pd0->flgd != 0) printf(s9er,1);
			rc = rc+1;
			}
			goto nobarf;
			if(pd0->flgd != 0) printf(s9er,2);
			rc = rc+2;
			nobarf:;
			return rc;
}
static void setev(void ){
			extern int extvar;
			extvar = 1066;
}
			int lbits;
			int ubits;
			int fbits;
			int dbits;
			float fprec;
			float dprec;
			int flgs;
			int flgm;
			int flgd;
			int flgl;
			int rrc;
			int crc;
			char rfs[8];
