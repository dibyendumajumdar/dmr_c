#define FLOAT double
#define INT int
#define FP FLOAT
#define CHARP char *
#define CHARPP char **

/*Small floating point constants.*/
static FLOAT Zero = 0.0;
static FLOAT Half = 0.5;
static FLOAT One = 1.0;
static FLOAT Two = 2.0;
static FLOAT Three = 3.0;
static FLOAT Four = 4.0;
static FLOAT Five = 5.0;
static FLOAT Eight = 8.0;
static FLOAT Nine = 9.0;
static FLOAT TwentySeven = 27.0;
static FLOAT ThirtyTwo = 32.0;
static FLOAT TwoForty = 240.0;
static FLOAT MinusOne = -1.0;
static FLOAT OneAndHalf = 1.5;

extern int printf(const char *, ...);

static char *msg2[4];
static int ErrCnt[4];

#define Flaw    3
#define Defect  2
#define Serious 1
#define Failure 0

#define FABS(x) fabs(x)

extern double fabs(double);

static void
BadCond(INT K, CHARP T)
{
	ErrCnt [K] = ErrCnt [K] + 1;
	printf("%s:  %s", msg2[K], T);
}


static void
TstCond (INT K, INT Valid, CHARP T)
{ 
	if (! Valid) 
	{ 
		BadCond(K,T); 
		printf(".\n"); 
	} 
}

int main(void)
{

	msg2[0] = "FAILURE";
	msg2[1] = "SERIOUS DEFECT";
	msg2[2] = "DEFECT";
	msg2[3] = "FLAW";

	/* First two assignments use integer right-hand sides. */
	Zero = 0;
	One = 1;
	Two = One + One;
	Three = Two + One;
	Four = Three + One;
	Five = Four + One;
	Eight = Four + Four;
	Nine = Three * Three;
	TwentySeven = Nine * Three;
	ThirtyTwo = Four * Eight;
	TwoForty = Four * Five * Three * Four;
	MinusOne = -One;
	Half = One / Two;
	OneAndHalf = One + Half;

	TstCond (Failure, (MinusOne == (0 - One))
		   && (MinusOne + One == Zero ) && (One + MinusOne == Zero)
		   && (MinusOne + FABS(One) == Zero)
		   && (MinusOne + MinusOne * MinusOne == Zero),
		   "-1+1 != 0, (-1)+abs(1) != 0, or -1+(-1)*(-1) != 0");
	TstCond (Failure, Half + MinusOne + Half == Zero,
		  "1/2 + (-1) + 1/2 != 0");

	return 0;
}

