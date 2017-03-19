; ModuleID = 'out.bc'
source_filename = "sparse"

%struct.__jmp_buf_tag = type { [8 x i64], i32, %struct.__sigset_t }
%struct.__sigset_t = type { [16 x i64] }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@ovfl_buf = global [1 x %struct.__jmp_buf_tag] zeroinitializer, align 8
@sigsave = global void (i32)* null, align 8
@Radix = private global double 0.000000e+00, align 8
@BInvrse = private global double 0.000000e+00, align 8
@RadixD2 = private global double 0.000000e+00, align 8
@BMinusU2 = private global double 0.000000e+00, align 8
@Zero = private global double 0.000000e+00, align 8
@Half = private global double 5.000000e-01, align 8
@One = private global double 1.000000e+00, align 8
@Two = private global double 2.000000e+00, align 8
@Three = private global double 3.000000e+00, align 8
@Four = private global double 4.000000e+00, align 8
@Five = private global double 5.000000e+00, align 8
@Eight = private global double 8.000000e+00, align 8
@Nine = private global double 9.000000e+00, align 8
@TwentySeven = private global double 2.700000e+01, align 8
@ThirtyTwo = private global double 3.200000e+01, align 8
@TwoForty = private global double 2.400000e+02, align 8
@MinusOne = private global double -1.000000e+00, align 8
@OneAndHalf = private global double 1.500000e+00, align 8
@NoTrials = private global i32 20, align 4
@Indx = private global i32 0, align 4
@ch = private global [8 x i8] zeroinitializer, align 1
@AInvrse = private global double 0.000000e+00, align 8
@A1 = private global double 0.000000e+00, align 8
@C = private global double 0.000000e+00, align 8
@CInvrse = private global double 0.000000e+00, align 8
@D = private global double 0.000000e+00, align 8
@FourD = private global double 0.000000e+00, align 8
@E0 = private global double 0.000000e+00, align 8
@E1 = private global double 0.000000e+00, align 8
@Exp2 = private global double 0.000000e+00, align 8
@E3 = private global double 0.000000e+00, align 8
@MinSqEr = private global double 0.000000e+00, align 8
@SqEr = private global double 0.000000e+00, align 8
@MaxSqEr = private global double 0.000000e+00, align 8
@E9 = private global double 0.000000e+00, align 8
@Third = private global double 0.000000e+00, align 8
@F6 = private global double 0.000000e+00, align 8
@F9 = private global double 0.000000e+00, align 8
@H = private global double 0.000000e+00, align 8
@HInvrse = private global double 0.000000e+00, align 8
@I = private global i32 0, align 4
@StickyBit = private global double 0.000000e+00, align 8
@J = private global double 0.000000e+00, align 8
@MyZero = private global double 0.000000e+00, align 8
@Precision = private global double 0.000000e+00, align 8
@Q = private global double 0.000000e+00, align 8
@Q9 = private global double 0.000000e+00, align 8
@R = private global double 0.000000e+00, align 8
@Random9 = private global double 0.000000e+00, align 8
@T = private global double 0.000000e+00, align 8
@Underflow = private global double 0.000000e+00, align 8
@S = private global double 0.000000e+00, align 8
@OneUlp = private global double 0.000000e+00, align 8
@UfThold = private global double 0.000000e+00, align 8
@U1 = private global double 0.000000e+00, align 8
@U2 = private global double 0.000000e+00, align 8
@V = private global double 0.000000e+00, align 8
@V0 = private global double 0.000000e+00, align 8
@V9 = private global double 0.000000e+00, align 8
@W = private global double 0.000000e+00, align 8
@X = private global double 0.000000e+00, align 8
@X1 = private global double 0.000000e+00, align 8
@X2 = private global double 0.000000e+00, align 8
@X8 = private global double 0.000000e+00, align 8
@Random1 = private global double 0.000000e+00, align 8
@Y = private global double 0.000000e+00, align 8
@Y1 = private global double 0.000000e+00, align 8
@Y2 = private global double 0.000000e+00, align 8
@Random2 = private global double 0.000000e+00, align 8
@Z = private global double 0.000000e+00, align 8
@PseudoZero = private global double 0.000000e+00, align 8
@Z1 = private global double 0.000000e+00, align 8
@Z2 = private global double 0.000000e+00, align 8
@Z9 = private global double 0.000000e+00, align 8
@ErrCnt = private global [4 x i32] zeroinitializer, align 4
@fpecount = private global i32 0, align 4
@Milestone = private global i32 0, align 4
@PageNo = private global i32 0, align 4
@M = private global i32 0, align 4
@N = private global i32 0, align 4
@N1 = private global i32 0, align 4
@GMult = private global i32 0, align 4
@GDiv = private global i32 0, align 4
@GAddSub = private global i32 0, align 4
@RMult = private global i32 0, align 4
@RDiv = private global i32 0, align 4
@RAddSub = private global i32 0, align 4
@RSqrt = private global i32 0, align 4
@Break = private global i32 0, align 4
@Done = private global i32 0, align 4
@NotMonot = private global i32 0, align 4
@Monot = private global i32 0, align 4
@Anomaly = private global i32 0, align 4
@IEEE = private global i32 0, align 4
@SqRWrng = private global i32 0, align 4
@UfNGrad = private global i32 0, align 4
@msg = private global [4 x i8*] zeroinitializer, align 8
@msg2 = private global [4 x i8*] zeroinitializer, align 8
@.str = private constant [38 x i8] c"\0A* * * FLOATING-POINT ERROR %d * * *\0A\00"
@stdout = external global %struct._IO_FILE*
@.str.1 = private constant [24 x i8] c"FAILUREs  encountered =\00"
@.str.2 = private constant [30 x i8] c"SERIOUS DEFECTs  discovered =\00"
@.str.3 = private constant [22 x i8] c"DEFECTs  discovered =\00"
@.str.4 = private constant [20 x i8] c"FLAWs  discovered =\00"
@.str.5 = private constant [8 x i8] c"FAILURE\00"
@.str.6 = private constant [15 x i8] c"SERIOUS DEFECT\00"
@.str.7 = private constant [7 x i8] c"DEFECT\00"
@.str.8 = private constant [5 x i8] c"FLAW\00"
@.str.9 = private constant [49 x i8] c"Program is now RUNNING tests on small integers:\0A\00"
@.str.10 = private constant [40 x i8] c"0+0 != 0, 1-1 != 0, 1 <= 0, or 1+1 != 2\00"
@.str.11 = private constant [43 x i8] c"Comparison alleges that -0.0 is Non-zero!\0A\00"
@.str.12 = private constant [49 x i8] c"3 != 2+1, 4 != 3+1, 4+2*(-2) != 0, or 4-3-1 != 0\00"
@.str.13 = private constant [50 x i8] c"-1+1 != 0, (-1)+abs(1) != 0, or -1+(-1)*(-1) != 0\00"
@.str.14 = private constant [22 x i8] c"1/2 + (-1) + 1/2 != 0\00"
@.str.15 = private constant [50 x i8] c"9 != 3*3, 27 != 9*3, 32 != 8*4, or 32-27-4-1 != 0\00"
@.str.16 = private constant [51 x i8] c"5 != 4+1, 240/3 != 80, 240/4 != 60, or 240/5 != 48\00"
@.str.17 = private constant [53 x i8] c"-1, 0, 1/2, 1, 2, 3, 4, 5, 9, 27, 32 & 240 are O.K.\0A\00"
@.str.18 = private constant [2 x i8] c"\0A\00"
@.str.19 = private constant [36 x i8] c"Searching for Radix and Precision.\0A\00"
@.str.20 = private constant [14 x i8] c"Radix = %f .\0A\00"
@.str.21 = private constant [51 x i8] c"Closest relative separation found is U1 = %.7e .\0A\0A\00"
@.str.22 = private constant [36 x i8] c"Recalculating radix and precision\0A \00"
@.str.23 = private constant [43 x i8] c"confirms closest relative separation U1 .\0A\00"
@.str.24 = private constant [53 x i8] c"gets better closest relative separation U1 = %.7e .\0A\00"
@.str.25 = private constant [18 x i8] c"Radix confirmed.\0A\00"
@.str.26 = private constant [38 x i8] c"MYSTERY: recalculated Radix = %.7e .\0A\00"
@.str.27 = private constant [36 x i8] c"Radix is too big: roundoff problems\00"
@.str.28 = private constant [32 x i8] c"Radix is not as good as 2 or 10\00"
@.str.29 = private constant [40 x i8] c"(1-U1)-1/2 < 1/2 is FALSE, prog. fails?\00"
@.str.30 = private constant [43 x i8] c"Comparison is fuzzy,X=1 but X-1/2-1/2 != 0\00"
@.str.31 = private constant [56 x i8] c"Precision cannot be characterized by an Integer number\0A\00"
@.str.32 = private constant [61 x i8] c"of significant digits but, by itself, this is a minor flaw.\0A\00"
@.str.33 = private constant [64 x i8] c"logarithmic encoding has precision characterized solely by U1.\0A\00"
@.str.34 = private constant [55 x i8] c"The number of significant digits of the Radix is %f .\0A\00"
@.str.35 = private constant [41 x i8] c"Precision worse than 5 decimal figures  \00"
@.str.36 = private constant [44 x i8] c"Disagreements among the values X1, Y1, Z1,\0A\00"
@.str.37 = private constant [35 x i8] c"respectively  %.7e,  %.7e,  %.7e,\0A\00"
@.str.38 = private constant [44 x i8] c"are symptoms of inconsistencies introduced\0A\00"
@.str.39 = private constant [59 x i8] c"by extra-precise evaluation of arithmetic subexpressions.\0A\00"
@.str.40 = private constant [27 x i8] c"Possibly some part of this\00"
@.str.41 = private constant [53 x i8] c"That feature is not tested further by this program.\0A\00"
@.str.42 = private constant [1 x i8] zeroinitializer
@.str.43 = private constant [10 x i8] c"Precision\00"
@.str.44 = private constant [28 x i8] c"\09U1 = %.7e, Z1 - U1 = %.7e\0A\00"
@.str.45 = private constant [28 x i8] c"\09U2 = %.7e, Z2 - U2 = %.7e\0A\00"
@.str.46 = private constant [30 x i8] c"Because of unusual Radix = %f\00"
@.str.47 = private constant [41 x i8] c", or exact rational arithmetic a result\0A\00"
@.str.48 = private constant [25 x i8] c"Z1 = %.7e, or Z2 = %.7e \00"
@.str.49 = private constant [22 x i8] c"of an\0Aextra-precision\00"
@.str.50 = private constant [51 x i8] c"Some subexpressions appear to be calculated extra\0A\00"
@.str.51 = private constant [46 x i8] c"precisely with about %g extra B-digits, i.e.\0A\00"
@.str.52 = private constant [40 x i8] c"roughly %g extra significant decimals.\0A\00"
@.str.53 = private constant [53 x i8] c"That feature is not tested further by this program.\0A\00"
@.str.54 = private constant [46 x i8] c"Subtraction is not normalized X=Y,X+Z != Y+Z!\00"
@.str.55 = private constant [55 x i8] c"Subtraction appears to be normalized, as it should be.\00"
@.str.56 = private constant [43 x i8] c"\0AChecking for guard digit in *, /, and -.\0A\00"
@.str.57 = private constant [35 x i8] c"* lacks a Guard Digit, so 1*X != X\00"
@.str.58 = private constant [37 x i8] c"* gets too many final digits wrong.\0A\00"
@.str.59 = private constant [98 x i8] c"Division lacks a Guard Digit, so error can exceed 1 ulp\0Aor  1/3  and  3/9  and  9/27 may disagree\00"
@.str.60 = private constant [42 x i8] c"Division lacks a Guard Digit, so X/1 != X\00"
@.str.61 = private constant [34 x i8] c"Computed value of 1/1.000..1 >= 1\00"
@.str.62 = private constant [43 x i8] c"* and/or / gets too many last digits wrong\00"
@.str.63 = private constant [49 x i8] c"- lacks Guard Digit, so cancellation is obscured\00"
@.str.64 = private constant [42 x i8] c"comparison alleges  (1-U1) < 1  although\0A\00"
@.str.65 = private constant [58 x i8] c"  subtraction yields  (1-U1) - 1 = 0 , thereby vitiating\0A\00"
@.str.66 = private constant [48 x i8] c"  such precautions against division by zero as\0A\00"
@.str.67 = private constant [52 x i8] c"  ...  if (X == 1.0) {.....} else {.../(X-1.0)...}\0A\00"
@.str.68 = private constant [63 x i8] c"     *, /, and - appear to have guard digits, as they should.\0A\00"
@.str.69 = private constant [57 x i8] c"Checking rounding on multiply, divide and add/subtract.\0A\00"
@.str.70 = private constant [25 x i8] c"X * (1/X) differs from 1\00"
@.str.71 = private constant [44 x i8] c"Multiplication appears to round correctly.\0A\00"
@.str.72 = private constant [33 x i8] c"Multiplication appears to chop.\0A\00"
@.str.73 = private constant [45 x i8] c"* is neither chopped nor correctly rounded.\0A\00"
@.str.74 = private constant [15 x i8] c"Multiplication\00"
@.str.75 = private constant [45 x i8] c"* is neither chopped nor correctly rounded.\0A\00"
@.str.76 = private constant [38 x i8] c"Division appears to round correctly.\0A\00"
@.str.77 = private constant [9 x i8] c"Division\00"
@.str.78 = private constant [27 x i8] c"Division appears to chop.\0A\00"
@.str.79 = private constant [45 x i8] c"/ is neither chopped nor correctly rounded.\0A\00"
@.str.80 = private constant [37 x i8] c"Radix * ( 1 / Radix ) differs from 1\00"
@.str.81 = private constant [41 x i8] c"Incomplete carry-propagation in Addition\00"
@.str.82 = private constant [37 x i8] c"Add/Subtract appears to be chopped.\0A\00"
@.str.83 = private constant [50 x i8] c"Addition/Subtraction appears to round correctly.\0A\00"
@.str.84 = private constant [13 x i8] c"Add/Subtract\00"
@.str.85 = private constant [48 x i8] c"Addition/Subtraction neither rounds nor chops.\0A\00"
@.str.86 = private constant [48 x i8] c"Addition/Subtraction neither rounds nor chops.\0A\00"
@.str.87 = private constant [48 x i8] c"Addition/Subtraction neither rounds nor chops.\0A\00"
@.str.88 = private constant [32 x i8] c"(X - Y) + (Y - X) is non zero!\0A\00"
@.str.89 = private constant [26 x i8] c"Checking for sticky bit.\0A\00"
@.str.90 = private constant [39 x i8] c"Sticky bit apparently used correctly.\0A\00"
@.str.91 = private constant [44 x i8] c"Sticky bit used incorrectly or not at all.\0A\00"
@.str.92 = private constant [122 x i8] c"lack(s) of guard digits or failure(s) to correctly round or chop\0A(noted above) count as one flaw in the final tally below\00"
@.str.93 = private constant [2 x i8] c"\0A\00"
@.str.94 = private constant [31 x i8] c"Does Multiplication commute?  \00"
@.str.95 = private constant [29 x i8] c"Testing on %d random pairs.\0A\00"
@.str.96 = private constant [29 x i8] c"X * Y == Y * X trial fails.\0A\00"
@.str.97 = private constant [45 x i8] c"     No failures found in %d integer pairs.\0A\00"
@.str.98 = private constant [34 x i8] c"\0ARunning test of square root(x).\0A\00"
@.str.99 = private constant [38 x i8] c"Square root of 0.0, -0.0 or 1.0 wrong\00"
@.str.100 = private constant [48 x i8] c"Testing if sqrt(X * X) == X for %d Integers X.\0A\00"
@.str.101 = private constant [29 x i8] c"Test for sqrt monotonicity.\0A\00"
@.str.102 = private constant [42 x i8] c"sqrt has passed a test for Monotonicity.\0A\00"
@.str.103 = private constant [1 x i8] zeroinitializer
@.str.104 = private constant [44 x i8] c"sqrt(X) is non-monotonic for X near %.7e .\0A\00"
@.str.105 = private constant [45 x i8] c"Testing whether sqrt is rounded or chopped.\0A\00"
@.str.106 = private constant [37 x i8] c"Anomalous arithmetic with Integer < \00"
@.str.107 = private constant [24 x i8] c"Radix^Precision = %.7e\0A\00"
@.str.108 = private constant [43 x i8] c" fails test whether sqrt rounds or chops.\0A\00"
@.str.109 = private constant [46 x i8] c"Square root appears to be correctly rounded.\0A\00"
@.str.110 = private constant [36 x i8] c"Square root appears to be chopped.\0A\00"
@.str.111 = private constant [55 x i8] c"Square root is neither chopped nor correctly rounded.\0A\00"
@.str.112 = private constant [31 x i8] c"Observed errors run from %.7e \00"
@.str.113 = private constant [15 x i8] c"to %.7e ulps.\0A\00"
@.str.114 = private constant [37 x i8] c"sqrt gets too many last digits wrong\00"
@.str.115 = private constant [48 x i8] c"Testing powers Z^i for small Integers Z and i.\0A\00"
@.str.116 = private constant [56 x i8] c"Errors like this may invalidate financial calculations\0A\00"
@.str.117 = private constant [28 x i8] c"\09involving interest rates.\0A\00"
@.str.118 = private constant [29 x i8] c"... no discrepancies found.\0A\00"
@.str.119 = private constant [2 x i8] c"\0A\00"
@.str.120 = private constant [46 x i8] c"Seeking Underflow thresholds UfThold and E0.\0A\00"
@.str.121 = private constant [49 x i8] c"multiplication gets too many last digits wrong.\0A\00"
@.str.122 = private constant [2 x i8] c"\0A\00"
@.str.123 = private constant [42 x i8] c"Positive expressions can underflow to an\0A\00"
@.str.124 = private constant [26 x i8] c"allegedly negative value\0A\00"
@.str.125 = private constant [37 x i8] c"PseudoZero that prints out as: %g .\0A\00"
@.str.126 = private constant [34 x i8] c"But -PseudoZero, which should be\0A\00"
@.str.127 = private constant [41 x i8] c"positive, isn't; it prints out as  %g .\0A\00"
@.str.128 = private constant [46 x i8] c"Underflow can stick at an allegedly positive\0A\00"
@.str.129 = private constant [42 x i8] c"value PseudoZero that prints out as %g .\0A\00"
@.str.130 = private constant [1 x i8] zeroinitializer
@.str.131 = private constant [31 x i8] c"Products underflow at a higher\00"
@.str.132 = private constant [30 x i8] c" threshold than differences.\0A\00"
@.str.133 = private constant [34 x i8] c"Difference underflows at a higher\00"
@.str.134 = private constant [27 x i8] c" threshold than products.\0A\00"
@.str.135 = private constant [54 x i8] c"Smallest strictly positive number found is E0 = %g .\0A\00"
@.str.136 = private constant [41 x i8] c"Either accuracy deteriorates as numbers\0A\00"
@.str.137 = private constant [30 x i8] c"approach a threshold = %.17e\0A\00"
@.str.138 = private constant [25 x i8] c" coming down from %.17e\0A\00"
@.str.139 = private constant [58 x i8] c" or else multiplication gets too many last digits wrong.\0A\00"
@.str.140 = private constant [51 x i8] c"Underflow confuses Comparison, which alleges that\0A\00"
@.str.141 = private constant [54 x i8] c"Q == Y while denying that |Q - Y| == 0; these values\0A\00"
@.str.142 = private constant [37 x i8] c"print out as Q = %.17e, Y = %.17e .\0A\00"
@.str.143 = private constant [19 x i8] c"|Q - Y| = %.17e .\0A\00"
@.str.144 = private constant [50 x i8] c"Underflow is gradual; it incurs Absolute Error =\0A\00"
@.str.145 = private constant [29 x i8] c"(roundoff in UfThold) < E0.\0A\00"
@.str.146 = private constant [2 x i8] c"\0A\00"
@.str.147 = private constant [29 x i8] c"Underflow / UfThold failed!\0A\00"
@.str.148 = private constant [1 x i8] zeroinitializer
@.str.149 = private constant [40 x i8] c"X = %.17e\0A\09is not equal to Z = %.17e .\0A\00"
@.str.150 = private constant [26 x i8] c"yet X - Z yields %.17e .\0A\00"
@.str.151 = private constant [39 x i8] c"    Should this NOT signal Underflow, \00"
@.str.152 = private constant [38 x i8] c"this is a SERIOUS DEFECT\0Athat causes \00"
@.str.153 = private constant [41 x i8] c"confusion when innocent statements like\0A\00"
@.str.154 = private constant [27 x i8] c"    if (X == Z)  ...  else\00"
@.str.155 = private constant [35 x i8] c"  ... (f(X) - f(Z)) / (X - Z) ...\0A\00"
@.str.156 = private constant [46 x i8] c"encounter Division by Zero although actually\0A\00"
@.str.157 = private constant [14 x i8] c"X / Z fails!\0A\00"
@.str.158 = private constant [18 x i8] c"X / Z = 1 + %g .\0A\00"
@.str.159 = private constant [38 x i8] c"The Underflow threshold is %.17e, %s\0A\00"
@.str.160 = private constant [13 x i8] c" below which\00"
@.str.161 = private constant [51 x i8] c"calculation may suffer larger Relative error than \00"
@.str.162 = private constant [18 x i8] c"merely roundoff.\0A\00"
@.str.163 = private constant [1 x i8] zeroinitializer
@.str.164 = private constant [1 x i8] zeroinitializer
@.str.165 = private constant [40 x i8] c"Range is too narrow; U1^%d Underflows.\0A\00"
@.str.166 = private constant [44 x i8] c"Since underflow occurs below the threshold\0A\00"
@.str.167 = private constant [44 x i8] c"UfThold = (%.17e) ^ (%.17e)\0Aonly underflow \00"
@.str.168 = private constant [51 x i8] c"should afflict the expression\0A\09(%.17e) ^ (%.17e);\0A\00"
@.str.169 = private constant [29 x i8] c"actually calculating yields:\00"
@.str.170 = private constant [20 x i8] c"trap on underflow.\0A\00"
@.str.171 = private constant [10 x i8] c" %.17e .\0A\00"
@.str.172 = private constant [37 x i8] c"this is not between 0 and underflow\0A\00"
@.str.173 = private constant [24 x i8] c"   threshold = %.17e .\0A\00"
@.str.174 = private constant [29 x i8] c"This computed value is O.K.\0A\00"
@.str.175 = private constant [37 x i8] c"this is not between 0 and underflow\0A\00"
@.str.176 = private constant [24 x i8] c"   threshold = %.17e .\0A\00"
@.str.177 = private constant [2 x i8] c"\0A\00"
@.str.178 = private constant [61 x i8] c"Testing X^((X + 1) / (X - 1)) vs. exp(2) = %.17e as X -> 1.\0A\00"
@.str.179 = private constant [11 x i8] c"Calculated\00"
@.str.180 = private constant [12 x i8] c" %.17e for\0A\00"
@.str.181 = private constant [26 x i8] c"\09(1 + (%.17e) ^ (%.17e);\0A\00"
@.str.182 = private constant [40 x i8] c"\09differs from correct value by %.17e .\0A\00"
@.str.183 = private constant [38 x i8] c"\09This much error may spoil financial\0A\00"
@.str.184 = private constant [46 x i8] c"\09calculations involving tiny interest rates.\0A\00"
@.str.185 = private constant [26 x i8] c"Accuracy seems adequate.\0A\00"
@.str.186 = private constant [51 x i8] c"Testing powers Z^Q at four nearly extreme values.\0A\00"
@.str.187 = private constant [30 x i8] c" ... no discrepancies found.\0A\00"
@.str.188 = private constant [2 x i8] c"\0A\00"
@.str.189 = private constant [35 x i8] c"Searching for Overflow threshold:\0A\00"
@.str.190 = private constant [29 x i8] c"This may generate an error.\0A\00"
@.str.191 = private constant [24 x i8] c"Can `Z = -Y' overflow?\0A\00"
@.str.192 = private constant [26 x i8] c"Trying it on Y = %.17e .\0A\00"
@.str.193 = private constant [12 x i8] c"Seems O.K.\0A\00"
@.str.194 = private constant [9 x i8] c"finds a \00"
@.str.195 = private constant [23 x i8] c"-(-Y) differs from Y.\0A\00"
@.str.196 = private constant [1 x i8] zeroinitializer
@.str.197 = private constant [41 x i8] c"overflow past %.17e\0A\09shrinks to %.17e .\0A\00"
@.str.198 = private constant [36 x i8] c"Overflow threshold is V  = %.17e .\0A\00"
@.str.199 = private constant [36 x i8] c"Overflow saturates at V0 = %.17e .\0A\00"
@.str.200 = private constant [68 x i8] c"There is no saturation value because the system traps on overflow.\0A\00"
@.str.201 = private constant [50 x i8] c"No Overflow should be signaled for V * 1 = %.17e\0A\00"
@.str.202 = private constant [52 x i8] c"                           nor for V / 1 = %.17e .\0A\00"
@.str.203 = private constant [52 x i8] c"Any overflow signal separating this * from the one\0A\00"
@.str.204 = private constant [20 x i8] c"above is a DEFECT.\0A\00"
@.str.205 = private constant [23 x i8] c"Comparisons involving \00"
@.str.206 = private constant [46 x i8] c"+-%g, +-%g\0Aand +-%g are confused by Overflow.\00"
@.str.207 = private constant [2 x i8] c"\0A\00"
@.str.208 = private constant [1 x i8] zeroinitializer
@.str.209 = private constant [1 x i8] zeroinitializer
@.str.210 = private constant [50 x i8] c"Comparison alleges that what prints as Z = %.17e\0A\00"
@.str.211 = private constant [40 x i8] c" is too far from sqrt(Z) ^ 2 = %.17e .\0A\00"
@.str.212 = private constant [1 x i8] zeroinitializer
@.str.213 = private constant [1 x i8] zeroinitializer
@.str.214 = private constant [34 x i8] c"Comparison alleges that Z = %17e\0A\00"
@.str.215 = private constant [40 x i8] c" is too far from sqrt(Z) ^ 2 (%.17e) .\0A\00"
@.str.216 = private constant [6 x i8] c"Badly\00"
@.str.217 = private constant [1 x i8] zeroinitializer
@.str.218 = private constant [44 x i8] c" unbalanced range; UfThold * V = %.17e\0A\09%s\0A\00"
@.str.219 = private constant [20 x i8] c"is too far from 1.\0A\00"
@.str.220 = private constant [28 x i8] c"  X / X  traps when X = %g\0A\00"
@.str.221 = private constant [1 x i8] zeroinitializer
@.str.222 = private constant [1 x i8] zeroinitializer
@.str.223 = private constant [39 x i8] c"  X / X differs from 1 when X = %.17e\0A\00"
@.str.224 = private constant [40 x i8] c"  instead, X / X - 1/2 - 1/2 = %.17e .\0A\00"
@.str.225 = private constant [2 x i8] c"\0A\00"
@.str.226 = private constant [59 x i8] c"What message and/or values does Division by Zero produce?\0A\00"
@.str.227 = private constant [41 x i8] c"    Trying to compute 1 / 0 produces ...\00"
@.str.228 = private constant [10 x i8] c"  %.7e .\0A\00"
@.str.229 = private constant [42 x i8] c"\0A    Trying to compute 0 / 0 produces ...\00"
@.str.230 = private constant [10 x i8] c"  %.7e .\0A\00"
@.str.231 = private constant [2 x i8] c"\0A\00"
@.str.232 = private constant [26 x i8] c"The number of  %-29s %d.\0A\00"
@.str.233 = private constant [2 x i8] c"\0A\00"
@.str.234 = private constant [32 x i8] c"The arithmetic diagnosed seems \00"
@.str.235 = private constant [29 x i8] c"Satisfactory though flawed.\0A\00"
@.str.236 = private constant [44 x i8] c"The arithmetic diagnosed may be Acceptable\0A\00"
@.str.237 = private constant [31 x i8] c"despite inconvenient Defects.\0A\00"
@.str.238 = private constant [30 x i8] c"The arithmetic diagnosed has \00"
@.str.239 = private constant [31 x i8] c"unacceptable Serious Defects.\0A\00"
@.str.240 = private constant [48 x i8] c"Potentially fatal FAILURE may have spoiled this\00"
@.str.241 = private constant [34 x i8] c" program's subsequent diagnoses.\0A\00"
@.str.242 = private constant [54 x i8] c"No failures, defects nor flaws have been discovered.\0A\00"
@.str.243 = private constant [46 x i8] c"The arithmetic diagnosed seems Satisfactory.\0A\00"
@.str.244 = private constant [32 x i8] c"Rounding appears to conform to \00"
@.str.245 = private constant [29 x i8] c"the proposed IEEE standard P\00"
@.str.246 = private constant [4 x i8] c"754\00"
@.str.247 = private constant [4 x i8] c"854\00"
@.str.248 = private constant [3 x i8] c".\0A\00"
@.str.249 = private constant [38 x i8] c",\0Aexcept for possibly Double Rounding\00"
@.str.250 = private constant [28 x i8] c" during Gradual Underflow.\0A\00"
@.str.251 = private constant [51 x i8] c"The arithmetic diagnosed appears to be Excellent!\0A\00"
@.str.252 = private constant [59 x i8] c"\0AA total of %d floating point exceptions were registered.\0A\00"
@.str.253 = private constant [14 x i8] c"END OF TEST.\0A\00"
@.str.254 = private constant [45 x i8] c"\0ADiagnosis resumes after milestone Number %d\00"
@.str.255 = private constant [21 x i8] c"          Page: %d\0A\0A\00"
@.str.256 = private constant [3 x i8] c".\0A\00"
@.str.257 = private constant [8 x i8] c"%s:  %s\00"
@.str.258 = private constant [2 x i8] c"\0A\00"
@.str.259 = private constant [31 x i8] c"sqrt( %.17e) - %.17e  = %.17e\0A\00"
@.str.260 = private constant [31 x i8] c"\09instead of correct value 0 .\0A\00"
@.str.261 = private constant [21 x i8] c"WARNING:  computing\0A\00"
@.str.262 = private constant [11 x i8] c"computing\0A\00"
@.str.263 = private constant [20 x i8] c"\09(%.17e) ^ (%.17e)\0A\00"
@.str.264 = private constant [17 x i8] c"\09yielded %.17e;\0A\00"
@.str.265 = private constant [44 x i8] c"\09which compared unequal to correct %.17e ;\0A\00"
@.str.266 = private constant [26 x i8] c"\09\09they differ by %.17e .\0A\00"
@.str.267 = private constant [47 x i8] c"Similar discrepancies have occurred %d times.\0A\00"
@.str.268 = private constant [43 x i8] c"Since comparison denies Z = 0, evaluating \00"
@.str.269 = private constant [29 x i8] c"(Z + Z) / Z should be safe.\0A\00"
@.str.270 = private constant [51 x i8] c"What the machine gets for (Z + Z) / Z is  %.17e .\0A\00"
@.str.271 = private constant [38 x i8] c"This is O.K., provided Over/Underflow\00"
@.str.272 = private constant [30 x i8] c" has NOT just been signaled.\0A\00"
@.str.273 = private constant [32 x i8] c"This is a VERY SERIOUS DEFECT!\0A\00"
@.str.274 = private constant [19 x i8] c"This is a DEFECT!\0A\00"
@.str.275 = private constant [20 x i8] c"What prints as Z = \00"
@.str.276 = private constant [33 x i8] c"%.17e\0A\09compares different from  \00"
@.str.277 = private constant [15 x i8] c"Z * 1 = %.17e \00"
@.str.278 = private constant [13 x i8] c"1 * Z == %g\0A\00"
@.str.279 = private constant [15 x i8] c"Z / 1 = %.17e\0A\00"
@.str.280 = private constant [34 x i8] c"Multiplication does not commute!\0A\00"
@.str.281 = private constant [40 x i8] c"\09Comparison alleges that 1 * Z = %.17e\0A\00"
@.str.282 = private constant [29 x i8] c"\09differs from Z * 1 = %.17e\0A\00"
@.str.283 = private constant [39 x i8] c"%s test appears to be inconsistent...\0A\00"
@.str.284 = private constant [29 x i8] c"   PLEASE NOTIFY KARPINKSI!\0A\00"
@.str.285 = private constant [4 x i8] c"%s\0A\00"

define void @sigfpe(i32 %ARG1) {
L0:
  %load_target = load i32, i32* @fpecount
  %R2 = add i32 %load_target, 1
  store i32 %R2, i32* @fpecount
  %R5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str, i64 0, i64 0), i32 %ARG1)
  %load_target1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout
  %R7 = call i32 @fflush(%struct._IO_FILE* %load_target1)
  %load_target2 = load void (i32)*, void (i32)** @sigsave
  %cond = icmp ne void (i32)* %load_target2, null
  br i1 %cond, label %L1, label %L2

L1:                                               ; preds = %L0
  store void (i32)* null, void (i32)** @sigsave
  call void @longjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @ovfl_buf, i32 0, i32 0), i32 1)
  br label %L2

L2:                                               ; preds = %L1, %L0
  call void @exit(i32 1)
  ret void
}

declare i32 @printf(i8*, ...)

declare i32 @fflush(%struct._IO_FILE*)

declare void @longjmp(%struct.__jmp_buf_tag*, i32)

declare void @exit(i32)

define i32 @main() {
L3:
  %0 = alloca i32
  %1 = alloca i32
  %2 = alloca i32
  %3 = alloca i32
  %4 = alloca double
  %5 = alloca double
  %6 = alloca double
  %7 = alloca double
  %8 = alloca double
  %9 = alloca double
  %10 = alloca double
  %11 = alloca double
  %12 = alloca double
  %13 = alloca double
  %14 = alloca double
  %15 = alloca double
  %16 = alloca double
  %17 = alloca double
  %18 = alloca double
  %19 = alloca double
  %20 = alloca double
  %21 = alloca double
  %22 = alloca i32
  %23 = alloca double
  %24 = alloca i32
  %25 = alloca double
  %26 = alloca double
  %27 = alloca i32
  %28 = alloca i32
  %29 = alloca double
  %30 = alloca double
  %31 = alloca double
  %32 = alloca double
  %33 = alloca double
  %34 = alloca double
  %35 = alloca double
  %36 = alloca double
  %37 = alloca double
  %38 = alloca double
  %39 = alloca double
  %40 = alloca double
  %41 = alloca double
  %42 = alloca double
  %43 = alloca double
  %44 = alloca double
  %45 = alloca double
  %46 = alloca double
  %47 = alloca double
  %48 = alloca double
  %49 = alloca i32
  %50 = alloca i32
  %51 = alloca double
  %52 = alloca double
  %53 = alloca double
  %54 = alloca double
  %55 = alloca double
  %56 = alloca i32
  %57 = alloca double
  %58 = alloca double
  %59 = alloca double
  %60 = alloca double
  %61 = alloca double
  %62 = alloca double
  %63 = alloca i32
  %64 = alloca i32
  %65 = alloca double
  %66 = alloca i32
  %67 = alloca double
  %68 = alloca i32
  store i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.1, i64 0, i64 0), i8** getelementptr inbounds ([4 x i8*], [4 x i8*]* @msg, i32 0, i32 0)
  store i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.2, i64 0, i64 0), i8** bitcast (i8* getelementptr inbounds (i8, i8* bitcast ([4 x i8*]* @msg to i8*), i64 8) to i8**)
  store i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.3, i64 0, i64 0), i8** bitcast (i8* getelementptr inbounds (i8, i8* bitcast ([4 x i8*]* @msg to i8*), i64 16) to i8**)
  store i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.4, i64 0, i64 0), i8** bitcast (i8* getelementptr inbounds (i8, i8* bitcast ([4 x i8*]* @msg to i8*), i64 24) to i8**)
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), i8** getelementptr inbounds ([4 x i8*], [4 x i8*]* @msg2, i32 0, i32 0)
  store i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.6, i64 0, i64 0), i8** bitcast (i8* getelementptr inbounds (i8, i8* bitcast ([4 x i8*]* @msg2 to i8*), i64 8) to i8**)
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.7, i64 0, i64 0), i8** bitcast (i8* getelementptr inbounds (i8, i8* bitcast ([4 x i8*]* @msg2 to i8*), i64 16) to i8**)
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.8, i64 0, i64 0), i8** bitcast (i8* getelementptr inbounds (i8, i8* bitcast ([4 x i8*]* @msg2 to i8*), i64 24) to i8**)
  store double 0.000000e+00, double* @Zero
  store double 1.000000e+00, double* @One
  store double 2.000000e+00, double* @Two
  store double 3.000000e+00, double* @Three
  store double 4.000000e+00, double* @Four
  store double 5.000000e+00, double* @Five
  store double 8.000000e+00, double* @Eight
  store double 9.000000e+00, double* @Nine
  store double 2.700000e+01, double* @TwentySeven
  store double 3.200000e+01, double* @ThirtyTwo
  store double 2.400000e+02, double* @TwoForty
  store double -1.000000e+00, double* @MinusOne
  store double 5.000000e-01, double* @Half
  store double 1.500000e+00, double* @OneAndHalf
  store i32 0, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @ErrCnt, i32 0, i32 0)
  store i32 0, i32* bitcast (i8* getelementptr inbounds (i8, i8* bitcast ([4 x i32]* @ErrCnt to i8*), i64 4) to i32*)
  store i32 0, i32* bitcast (i8* getelementptr inbounds (i8, i8* bitcast ([4 x i32]* @ErrCnt to i8*), i64 8) to i32*)
  store i32 0, i32* bitcast (i8* getelementptr inbounds (i8, i8* bitcast ([4 x i32]* @ErrCnt to i8*), i64 12) to i32*)
  store i32 1, i32* @PageNo
  store i32 0, i32* @Milestone
  call void @Instructions()
  call void @Pause()
  call void @Heading()
  call void @Pause()
  call void @Characteristics()
  call void @Pause()
  call void @History()
  call void @Pause()
  store i32 7, i32* @Milestone
  %R58 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.9, i64 0, i64 0))
  %load_target = load double, double* @Zero
  %R61 = fadd double %load_target, %load_target
  %R63 = fcmp oeq double %R61, %load_target
  %R631 = zext i1 %R63 to i32
  %load_target2 = load double, double* @One
  %R66 = fsub double %load_target2, %load_target2
  %R68 = fcmp oeq double %R66, %load_target
  %R683 = zext i1 %R68 to i32
  %69 = icmp ne i32 %R631, 0
  %70 = icmp ne i32 %R683, 0
  %R69 = and i1 %69, %70
  %R694 = zext i1 %R69 to i32
  %R72 = fcmp ogt double %load_target2, %load_target
  %R725 = zext i1 %R72 to i32
  %71 = icmp ne i32 %R694, 0
  %72 = icmp ne i32 %R725, 0
  %R73 = and i1 %71, %72
  %R736 = zext i1 %R73 to i32
  %R76 = fadd double %load_target2, %load_target2
  %load_target7 = load double, double* @Two
  %R78 = fcmp oeq double %R76, %load_target7
  %R788 = zext i1 %R78 to i32
  %73 = icmp ne i32 %R736, 0
  %74 = icmp ne i32 %R788, 0
  %R79 = and i1 %73, %74
  %R799 = zext i1 %R79 to i32
  call void @TstCond(i32 0, i32 %R799, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.10, i64 0, i64 0))
  %load_target10 = load double, double* @Zero
  %R82 = fsub double -0.000000e+00, %load_target10
  store double %R82, double* @Z
  %R85 = fcmp une double %R82, 0.000000e+00
  %R8511 = zext i1 %R85 to i32
  %cond = icmp ne i32 %R8511, 0
  br i1 %cond, label %L4, label %L5

L4:                                               ; preds = %L3
  %load_target12 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @ErrCnt, i32 0, i32 0)
  %R87 = add i32 %load_target12, 1
  store i32 %R87, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @ErrCnt, i32 0, i32 0)
  %R89 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.11, i64 0, i64 0))
  store double 1.000000e-03, double* @U2
  store double 1.000000e+00, double* @Radix
  call void @TstPtUf()
  br label %L5

L5:                                               ; preds = %L4, %L3
  %load_target13 = load double, double* @Three
  %load_target14 = load double, double* @Two
  %load_target15 = load double, double* @One
  %R94 = fadd double %load_target14, %load_target15
  %R95 = fcmp oeq double %load_target13, %R94
  %R9516 = zext i1 %R95 to i32
  %load_target17 = load double, double* @Four
  %R99 = fadd double %load_target13, %load_target15
  %R100 = fcmp oeq double %load_target17, %R99
  %R10018 = zext i1 %R100 to i32
  %75 = icmp ne i32 %R9516, 0
  %76 = icmp ne i32 %R10018, 0
  %R101 = and i1 %75, %76
  %R10119 = zext i1 %R101 to i32
  %cond20 = icmp ne i32 %R10119, 0
  br i1 %cond20, label %L6, label %L8

L6:                                               ; preds = %L5
  %R105 = fsub double -0.000000e+00, %load_target14
  %R106 = fmul double %load_target14, %R105
  %R107 = fadd double %load_target17, %R106
  %load_target21 = load double, double* @Zero
  %R109 = fcmp oeq double %R107, %load_target21
  %R10922 = zext i1 %R109 to i32
  %cond23 = icmp ne i32 %R10922, 0
  br i1 %cond23, label %L7, label %L8

L7:                                               ; preds = %L6
  %R112 = fsub double %load_target17, %load_target13
  %R114 = fsub double %R112, %load_target15
  %R116 = fcmp oeq double %R114, %load_target21
  %R11624 = zext i1 %R116 to i32
  store i32 %R11624, i32* %0
  br label %L9

L8:                                               ; preds = %L6, %L5
  store i32 0, i32* %0
  br label %L9

L9:                                               ; preds = %L8, %L7
  %77 = load i32, i32* %0
  call void @TstCond(i32 0, i32 %77, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.12, i64 0, i64 0))
  %load_target25 = load double, double* @MinusOne
  %load_target26 = load double, double* @One
  %R122 = fsub double 0.000000e+00, %load_target26
  %R123 = fcmp oeq double %load_target25, %R122
  %R12327 = zext i1 %R123 to i32
  %R126 = fadd double %load_target25, %load_target26
  %load_target28 = load double, double* @Zero
  %R128 = fcmp oeq double %R126, %load_target28
  %R12829 = zext i1 %R128 to i32
  %78 = icmp ne i32 %R12327, 0
  %79 = icmp ne i32 %R12829, 0
  %R129 = and i1 %78, %79
  %R12930 = zext i1 %R129 to i32
  %R132 = fadd double %load_target26, %load_target25
  %R134 = fcmp oeq double %R132, %load_target28
  %R13431 = zext i1 %R134 to i32
  %80 = icmp ne i32 %R12930, 0
  %81 = icmp ne i32 %R13431, 0
  %R135 = and i1 %80, %81
  %R13532 = zext i1 %R135 to i32
  %R138 = call double @fabs(double %load_target26)
  %R139 = fadd double %load_target25, %R138
  %load_target33 = load double, double* @Zero
  %R141 = fcmp oeq double %R139, %load_target33
  %R14134 = zext i1 %R141 to i32
  %82 = icmp ne i32 %R13532, 0
  %83 = icmp ne i32 %R14134, 0
  %R142 = and i1 %82, %83
  %R14235 = zext i1 %R142 to i32
  %cond36 = icmp ne i32 %R14235, 0
  br i1 %cond36, label %L10, label %L11

L10:                                              ; preds = %L9
  %load_target37 = load double, double* @MinusOne
  %R146 = fmul double %load_target37, %load_target37
  %R147 = fadd double %load_target37, %R146
  %R149 = fcmp oeq double %R147, %load_target33
  %R14938 = zext i1 %R149 to i32
  store i32 %R14938, i32* %1
  br label %L12

L11:                                              ; preds = %L9
  store i32 0, i32* %1
  br label %L12

L12:                                              ; preds = %L11, %L10
  %84 = load i32, i32* %1
  call void @TstCond(i32 0, i32 %84, i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.13, i64 0, i64 0))
  %load_target39 = load double, double* @Half
  %load_target40 = load double, double* @MinusOne
  %R154 = fadd double %load_target39, %load_target40
  %R156 = fadd double %R154, %load_target39
  %load_target41 = load double, double* @Zero
  %R158 = fcmp oeq double %R156, %load_target41
  %R15842 = zext i1 %R158 to i32
  call void @TstCond(i32 0, i32 %R15842, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.14, i64 0, i64 0))
  store i32 10, i32* @Milestone
  %load_target43 = load double, double* @Nine
  %load_target44 = load double, double* @Three
  %R163 = fmul double %load_target44, %load_target44
  %R164 = fcmp oeq double %load_target43, %R163
  %R16445 = zext i1 %R164 to i32
  %load_target46 = load double, double* @TwentySeven
  %R168 = fmul double %load_target43, %load_target44
  %R169 = fcmp oeq double %load_target46, %R168
  %R16947 = zext i1 %R169 to i32
  %85 = icmp ne i32 %R16445, 0
  %86 = icmp ne i32 %R16947, 0
  %R170 = and i1 %85, %86
  %R17048 = zext i1 %R170 to i32
  %load_target49 = load double, double* @Eight
  %load_target50 = load double, double* @Four
  %R174 = fadd double %load_target50, %load_target50
  %R175 = fcmp oeq double %load_target49, %R174
  %R17551 = zext i1 %R175 to i32
  %87 = icmp ne i32 %R17048, 0
  %88 = icmp ne i32 %R17551, 0
  %R176 = and i1 %87, %88
  %R17652 = zext i1 %R176 to i32
  %load_target53 = load double, double* @ThirtyTwo
  %R180 = fmul double %load_target49, %load_target50
  %R181 = fcmp oeq double %load_target53, %R180
  %R18154 = zext i1 %R181 to i32
  %89 = icmp ne i32 %R17652, 0
  %90 = icmp ne i32 %R18154, 0
  %R182 = and i1 %89, %90
  %R18255 = zext i1 %R182 to i32
  %cond56 = icmp ne i32 %R18255, 0
  br i1 %cond56, label %L13, label %L14

L13:                                              ; preds = %L12
  %R185 = fsub double %load_target53, %load_target46
  %R187 = fsub double %R185, %load_target50
  %load_target57 = load double, double* @One
  %R189 = fsub double %R187, %load_target57
  %load_target58 = load double, double* @Zero
  %R191 = fcmp oeq double %R189, %load_target58
  %R19159 = zext i1 %R191 to i32
  store i32 %R19159, i32* %2
  br label %L15

L14:                                              ; preds = %L12
  store i32 0, i32* %2
  br label %L15

L15:                                              ; preds = %L14, %L13
  %91 = load i32, i32* %2
  call void @TstCond(i32 0, i32 %91, i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.15, i64 0, i64 0))
  %load_target60 = load double, double* @Five
  %load_target61 = load double, double* @Four
  %load_target62 = load double, double* @One
  %R197 = fadd double %load_target61, %load_target62
  %R198 = fcmp oeq double %load_target60, %R197
  %R19863 = zext i1 %R198 to i32
  %cond64 = icmp ne i32 %R19863, 0
  br i1 %cond64, label %L16, label %L20

L16:                                              ; preds = %L15
  %load_target65 = load double, double* @TwoForty
  %R202 = fmul double %load_target61, %load_target60
  %load_target66 = load double, double* @Three
  %R204 = fmul double %R202, %load_target66
  %R206 = fmul double %R204, %load_target61
  %R207 = fcmp oeq double %load_target65, %R206
  %R20767 = zext i1 %R207 to i32
  %cond68 = icmp ne i32 %R20767, 0
  br i1 %cond68, label %L17, label %L20

L17:                                              ; preds = %L16
  %R210 = fdiv double %load_target65, %load_target66
  %R213 = fmul double %load_target61, %load_target61
  %R215 = fmul double %R213, %load_target60
  %R216 = fsub double %R210, %R215
  %load_target69 = load double, double* @Zero
  %R218 = fcmp oeq double %R216, %load_target69
  %R21870 = zext i1 %R218 to i32
  %cond71 = icmp ne i32 %R21870, 0
  br i1 %cond71, label %L18, label %L20

L18:                                              ; preds = %L17
  %R221 = fdiv double %load_target65, %load_target61
  %R224 = fmul double %load_target60, %load_target66
  %R226 = fmul double %R224, %load_target61
  %R227 = fsub double %R221, %R226
  %R229 = fcmp oeq double %R227, %load_target69
  %R22972 = zext i1 %R229 to i32
  %cond73 = icmp ne i32 %R22972, 0
  br i1 %cond73, label %L19, label %L20

L19:                                              ; preds = %L18
  %R232 = fdiv double %load_target65, %load_target60
  %R235 = fmul double %load_target61, %load_target66
  %R237 = fmul double %R235, %load_target61
  %R238 = fsub double %R232, %R237
  %R240 = fcmp oeq double %R238, %load_target69
  %R24074 = zext i1 %R240 to i32
  store i32 %R24074, i32* %3
  br label %L21

L20:                                              ; preds = %L18, %L17, %L16, %L15
  store i32 0, i32* %3
  br label %L21

L21:                                              ; preds = %L20, %L19
  %92 = load i32, i32* %3
  call void @TstCond(i32 0, i32 %92, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.16, i64 0, i64 0))
  %load_target75 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @ErrCnt, i32 0, i32 0)
  %cond76 = icmp ne i32 %load_target75, 0
  br i1 %cond76, label %L23, label %L22

L22:                                              ; preds = %L21
  %R246 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.17, i64 0, i64 0))
  %R248 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.18, i64 0, i64 0))
  br label %L23

L23:                                              ; preds = %L22, %L21
  %R250 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.19, i64 0, i64 0))
  %load_target77 = load double, double* @One
  store double %load_target77, double* @W
  br label %L24

L24:                                              ; preds = %L24, %L23
  %load_target78 = load double, double* @W
  %R254 = fadd double %load_target78, %load_target78
  store double %R254, double* @W
  %load_target79 = load double, double* @One
  %R257 = fadd double %R254, %load_target79
  %R260 = fsub double %R257, %R254
  store double %R260, double* @Z
  %R263 = fsub double %R260, %load_target79
  store double %R263, double* @Y
  %load_target80 = load double, double* @MinusOne
  %R266 = call double @fabs(double %R263)
  %R267 = fadd double %load_target80, %R266
  %load_target81 = load double, double* @Zero
  %R269 = fcmp olt double %R267, %load_target81
  %R26982 = zext i1 %R269 to i32
  %cond83 = icmp ne i32 %R26982, 0
  br i1 %cond83, label %L24, label %L25

L25:                                              ; preds = %L24
  store double %load_target81, double* @Precision
  %load_target84 = load double, double* @One
  store double %load_target84, double* %4
  br label %L26

L26:                                              ; preds = %L26, %L25
  %load_target85 = load double, double* @W
  %93 = load double, double* %4
  %R274 = fadd double %load_target85, %93
  %R277 = fadd double %93, %93
  store double %R277, double* @Y
  %R280 = fsub double %R274, %load_target85
  store double %R280, double* @Radix
  store double %R277, double* %4
  %R283 = fcmp oeq double %R280, %load_target81
  %R28386 = zext i1 %R283 to i32
  %cond87 = icmp ne i32 %R28386, 0
  br i1 %cond87, label %L26, label %L27

L27:                                              ; preds = %L26
  %load_target88 = load double, double* @Two
  %R286 = fcmp olt double %R280, %load_target88
  %R28689 = zext i1 %R286 to i32
  store double %R280, double* %5
  %cond90 = icmp ne i32 %R28689, 0
  br i1 %cond90, label %L28, label %L29

L28:                                              ; preds = %L27
  store double %load_target84, double* @Radix
  store double %load_target84, double* %5
  br label %L29

L29:                                              ; preds = %L28, %L27
  %94 = load double, double* %5
  %R290 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.20, i64 0, i64 0), double %94)
  %load_target91 = load double, double* @Radix
  %R293 = fcmp une double %load_target91, 1.000000e+00
  %R29392 = zext i1 %R293 to i32
  store double %load_target91, double* %7
  %cond93 = icmp ne i32 %R29392, 0
  br i1 %cond93, label %L30, label %L32

L30:                                              ; preds = %L29
  %load_target94 = load double, double* @One
  store double %load_target94, double* %6
  br label %L31

L31:                                              ; preds = %L31, %L30
  %load_target95 = load double, double* @Precision
  %R297 = fadd double %load_target95, %load_target94
  store double %R297, double* @Precision
  %95 = load double, double* %6
  %R300 = fmul double %95, %load_target91
  store double %R300, double* @W
  %R303 = fadd double %R300, %load_target94
  store double %R303, double* @Y
  store double %load_target91, double* %7
  store double %R300, double* %6
  %R306 = fsub double %R303, %R300
  %R308 = fcmp oeq double %R306, %load_target94
  %R30896 = zext i1 %R308 to i32
  %cond97 = icmp ne i32 %R30896, 0
  br i1 %cond97, label %L31, label %L32

L32:                                              ; preds = %L31, %L29
  %load_target98 = load double, double* @One
  %load_target99 = load double, double* @W
  %R311 = fdiv double %load_target98, %load_target99
  store double %R311, double* @U1
  %96 = load double, double* %7
  %R314 = fmul double %96, %R311
  store double %R314, double* @U2
  %R317 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.21, i64 0, i64 0), double %R311)
  %R319 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.22, i64 0, i64 0))
  %load_target100 = load double, double* @Radix
  store double %load_target100, double* @E0
  %load_target101 = load double, double* @U1
  store double %load_target101, double* @E1
  %load_target102 = load double, double* @U2
  store double %load_target102, double* @E9
  %load_target103 = load double, double* @Precision
  store double %load_target103, double* @E3
  %load_target104 = load double, double* @Four
  %load_target105 = load double, double* @Three
  %R326 = fdiv double %load_target104, %load_target105
  %load_target106 = load double, double* @One
  %R329 = fsub double %R326, %load_target106
  store double %R329, double* @Third
  %load_target107 = load double, double* @Half
  %R332 = fsub double %load_target107, %R329
  store double %R332, double* @F6
  %R335 = fadd double %R332, %R332
  store double %R335, double* @X
  %R338 = fsub double %R335, %R329
  %R339 = call double @fabs(double %R338)
  store double %R339, double* @X
  %load_target108 = load double, double* @U2
  %R342 = fcmp olt double %R339, %load_target108
  %R342109 = zext i1 %R342 to i32
  store double %R339, double* %8
  %cond110 = icmp ne i32 %R342109, 0
  br i1 %cond110, label %L33, label %L34

L33:                                              ; preds = %L32
  store double %load_target108, double* @X
  store double %load_target108, double* %8
  br label %L34

L34:                                              ; preds = %L34, %L33, %L32
  %97 = load double, double* %8
  store double %97, double* @U2
  %load_target111 = load double, double* @Half
  %R347 = fmul double %load_target111, %97
  %load_target112 = load double, double* @ThirtyTwo
  %R350 = fmul double %load_target112, %97
  %R352 = fmul double %R350, %97
  %R353 = fadd double %R347, %R352
  %load_target113 = load double, double* @One
  %R356 = fadd double %load_target113, %R353
  store double %R356, double* @Y
  %R359 = fsub double %R356, %load_target113
  store double %R359, double* @X
  store double %R359, double* %8
  %R362 = fcmp ole double %97, %R359
  %R362114 = zext i1 %R362 to i32
  %load_target115 = load double, double* @Zero
  %R365 = fcmp ole double %R359, %load_target115
  %R365116 = zext i1 %R365 to i32
  %98 = icmp ne i32 %R362114, 0
  %99 = icmp ne i32 %R365116, 0
  %R366 = or i1 %98, %99
  %R366117 = zext i1 %R366 to i32
  %cond118 = icmp ne i32 %R366117, 0
  br i1 %cond118, label %L35, label %L34

L35:                                              ; preds = %L34
  %load_target119 = load double, double* @Two
  %load_target120 = load double, double* @Three
  %R369 = fdiv double %load_target119, %load_target120
  %R372 = fsub double %R369, %load_target111
  store double %R372, double* @F6
  %R375 = fadd double %R372, %R372
  store double %R375, double* @Third
  %R378 = fsub double %R375, %load_target111
  store double %R378, double* @X
  %R381 = fadd double %R378, %R372
  %R382 = call double @fabs(double %R381)
  store double %R382, double* @X
  %load_target121 = load double, double* @U1
  %R385 = fcmp olt double %R382, %load_target121
  %R385122 = zext i1 %R385 to i32
  store double %R382, double* %9
  %cond123 = icmp ne i32 %R385122, 0
  br i1 %cond123, label %L36, label %L37

L36:                                              ; preds = %L35
  store double %load_target121, double* @X
  store double %load_target121, double* %9
  br label %L37

L37:                                              ; preds = %L37, %L36, %L35
  %100 = load double, double* %9
  store double %100, double* @U1
  %load_target124 = load double, double* @Half
  %R390 = fmul double %load_target124, %100
  %load_target125 = load double, double* @ThirtyTwo
  %R393 = fmul double %load_target125, %100
  %R395 = fmul double %R393, %100
  %R396 = fadd double %R390, %R395
  %R399 = fsub double %load_target124, %R396
  %R402 = fadd double %load_target124, %R399
  %R405 = fsub double %load_target124, %R402
  store double %R405, double* @Y
  %R408 = fadd double %load_target124, %R405
  store double %R408, double* @X
  store double %R408, double* %9
  %R411 = fcmp ole double %100, %R408
  %R411126 = zext i1 %R411 to i32
  %load_target127 = load double, double* @Zero
  %R414 = fcmp ole double %R408, %load_target127
  %R414128 = zext i1 %R414 to i32
  %101 = icmp ne i32 %R411126, 0
  %102 = icmp ne i32 %R414128, 0
  %R415 = or i1 %101, %102
  %R415129 = zext i1 %R415 to i32
  %cond130 = icmp ne i32 %R415129, 0
  br i1 %cond130, label %L38, label %L37

L38:                                              ; preds = %L37
  %load_target131 = load double, double* @E1
  %R418 = fcmp oeq double %100, %load_target131
  %R418132 = zext i1 %R418 to i32
  %cond133 = icmp ne i32 %R418132, 0
  br i1 %cond133, label %L39, label %L40

L39:                                              ; preds = %L38
  %R420 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.23, i64 0, i64 0))
  br label %L41

L40:                                              ; preds = %L38
  %R423 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.24, i64 0, i64 0), double %100)
  br label %L41

L41:                                              ; preds = %L40, %L39
  %load_target134 = load double, double* @One
  %load_target135 = load double, double* @U1
  %R426 = fdiv double %load_target134, %load_target135
  store double %R426, double* @W
  %load_target136 = load double, double* @Half
  %R429 = fsub double %load_target136, %load_target135
  %R431 = fadd double %R429, %load_target136
  store double %R431, double* @F9
  %load_target137 = load double, double* @U2
  %R435 = fdiv double %load_target137, %load_target135
  %R436 = fadd double 1.000000e-02, %R435
  %R437 = call double @floor(double %R436)
  store double %R437, double* @Radix
  %load_target138 = load double, double* @E0
  %R440 = fcmp oeq double %R437, %load_target138
  %R440139 = zext i1 %R440 to i32
  %cond140 = icmp ne i32 %R440139, 0
  br i1 %cond140, label %L42, label %L43

L42:                                              ; preds = %L41
  %R442 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.25, i64 0, i64 0))
  br label %L44

L43:                                              ; preds = %L41
  %R445 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.26, i64 0, i64 0), double %R437)
  br label %L44

L44:                                              ; preds = %L43, %L42
  %load_target141 = load double, double* @Radix
  %load_target142 = load double, double* @Eight
  %R449 = fadd double %load_target142, %load_target142
  %R450 = fcmp ole double %load_target141, %R449
  %R450143 = zext i1 %R450 to i32
  call void @TstCond(i32 2, i32 %R450143, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.27, i64 0, i64 0))
  %load_target144 = load double, double* @Radix
  %load_target145 = load double, double* @Two
  %R454 = fcmp oeq double %load_target144, %load_target145
  %R454146 = zext i1 %R454 to i32
  %R457 = fcmp oeq double %load_target144, 1.000000e+01
  %R457147 = zext i1 %R457 to i32
  %103 = icmp ne i32 %R454146, 0
  %104 = icmp ne i32 %R457147, 0
  %R458 = or i1 %103, %104
  %R458148 = zext i1 %R458 to i32
  %load_target149 = load double, double* @One
  %R461 = fcmp oeq double %load_target144, %load_target149
  %R461150 = zext i1 %R461 to i32
  %105 = icmp ne i32 %R458148, 0
  %106 = icmp ne i32 %R461150, 0
  %R462 = or i1 %105, %106
  %R462151 = zext i1 %R462 to i32
  call void @TstCond(i32 3, i32 %R462151, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.28, i64 0, i64 0))
  store i32 20, i32* @Milestone
  %load_target152 = load double, double* @F9
  %load_target153 = load double, double* @Half
  %R466 = fsub double %load_target152, %load_target153
  %R468 = fcmp olt double %R466, %load_target153
  %R468154 = zext i1 %R468 to i32
  call void @TstCond(i32 0, i32 %R468154, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.29, i64 0, i64 0))
  %load_target155 = load double, double* @F9
  store double %load_target155, double* @X
  store i32 1, i32* @I
  %load_target156 = load double, double* @Half
  %R473 = fsub double %load_target155, %load_target156
  store double %R473, double* @Y
  %R476 = fsub double %R473, %load_target156
  store double %R476, double* @Z
  %load_target157 = load double, double* @One
  %R479 = fcmp une double %load_target155, %load_target157
  %R479158 = zext i1 %R479 to i32
  %load_target159 = load double, double* @Zero
  %R482 = fcmp oeq double %R476, %load_target159
  %R482160 = zext i1 %R482 to i32
  %107 = icmp ne i32 %R479158, 0
  %108 = icmp ne i32 %R482160, 0
  %R483 = or i1 %107, %108
  %R483161 = zext i1 %R483 to i32
  call void @TstCond(i32 0, i32 %R483161, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.30, i64 0, i64 0))
  %load_target162 = load double, double* @One
  %load_target163 = load double, double* @U2
  %R487 = fadd double %load_target162, %load_target163
  store double %R487, double* @X
  store i32 0, i32* @I
  store i32 25, i32* @Milestone
  %load_target164 = load double, double* @Radix
  %R490 = fsub double %load_target164, %load_target162
  %R493 = fsub double %R490, %load_target163
  %R495 = fadd double %R493, %load_target162
  store double %R495, double* @BMinusU2
  %R498 = fcmp une double %load_target164, %load_target162
  %R498165 = zext i1 %R498 to i32
  %cond166 = icmp ne i32 %R498165, 0
  br i1 %cond166, label %L45, label %L49

L45:                                              ; preds = %L44
  %load_target167 = load double, double* @TwoForty
  %R500 = fsub double -0.000000e+00, %load_target167
  %load_target168 = load double, double* @U1
  %R502 = call double @log(double %load_target168)
  %R503 = fmul double %R500, %R502
  %load_target169 = load double, double* @Radix
  %R505 = call double @log(double %load_target169)
  %R506 = fdiv double %R503, %R505
  store double %R506, double* @X
  %load_target170 = load double, double* @Half
  %R509 = fadd double %load_target170, %R506
  %R510 = call double @floor(double %R509)
  store double %R510, double* @Y
  %load_target171 = load double, double* @X
  %R513 = fsub double %load_target171, %R510
  %R514 = call double @fabs(double %R513)
  %load_target172 = load double, double* @Four
  %R516 = fmul double %R514, %load_target172
  %load_target173 = load double, double* @One
  %R518 = fcmp olt double %R516, %load_target173
  %R518174 = zext i1 %R518 to i32
  %cond175 = icmp ne i32 %R518174, 0
  br i1 %cond175, label %L46, label %L47

L46:                                              ; preds = %L45
  %load_target176 = load double, double* @Y
  store double %load_target176, double* @X
  br label %L47

L47:                                              ; preds = %L46, %L45
  %load_target177 = load double, double* @X
  %load_target178 = load double, double* @TwoForty
  %R522 = fdiv double %load_target177, %load_target178
  store double %R522, double* @Precision
  %load_target179 = load double, double* @Half
  %R525 = fadd double %load_target179, %R522
  %R526 = call double @floor(double %R525)
  store double %R526, double* @Y
  %load_target180 = load double, double* @Precision
  %R529 = fsub double %load_target180, %R526
  %R530 = call double @fabs(double %R529)
  %load_target181 = load double, double* @TwoForty
  %R532 = fmul double %R530, %load_target181
  %load_target182 = load double, double* @Half
  %R534 = fcmp olt double %R532, %load_target182
  %R534183 = zext i1 %R534 to i32
  %cond184 = icmp ne i32 %R534183, 0
  br i1 %cond184, label %L48, label %L49

L48:                                              ; preds = %L47
  %load_target185 = load double, double* @Y
  store double %load_target185, double* @Precision
  br label %L49

L49:                                              ; preds = %L48, %L47, %L44
  %load_target186 = load double, double* @Precision
  %R538 = call double @floor(double %load_target186)
  %R539 = fcmp une double %load_target186, %R538
  %R539187 = zext i1 %R539 to i32
  %load_target188 = load double, double* @Radix
  %load_target189 = load double, double* @One
  %R542 = fcmp oeq double %load_target188, %load_target189
  %R542190 = zext i1 %R542 to i32
  %109 = icmp ne i32 %R539187, 0
  %110 = icmp ne i32 %R542190, 0
  %R543 = or i1 %109, %110
  %R543191 = zext i1 %R543 to i32
  %cond192 = icmp ne i32 %R543191, 0
  br i1 %cond192, label %L50, label %L51

L50:                                              ; preds = %L49
  %R545 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([56 x i8], [56 x i8]* @.str.31, i64 0, i64 0))
  %R547 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([61 x i8], [61 x i8]* @.str.32, i64 0, i64 0))
  br label %L51

L51:                                              ; preds = %L50, %L49
  %load_target193 = load double, double* @Radix
  %load_target194 = load double, double* @One
  %R550 = fcmp oeq double %load_target193, %load_target194
  %R550195 = zext i1 %R550 to i32
  %cond196 = icmp ne i32 %R550195, 0
  br i1 %cond196, label %L52, label %L53

L52:                                              ; preds = %L51
  %R552 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.33, i64 0, i64 0))
  br label %L54

L53:                                              ; preds = %L51
  %load_target197 = load double, double* @Precision
  %R555 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.34, i64 0, i64 0), double %load_target197)
  br label %L54

L54:                                              ; preds = %L53, %L52
  %load_target198 = load double, double* @U2
  %load_target199 = load double, double* @Nine
  %R558 = fmul double %load_target198, %load_target199
  %R560 = fmul double %R558, %load_target199
  %load_target200 = load double, double* @TwoForty
  %R562 = fmul double %R560, %load_target200
  %load_target201 = load double, double* @One
  %R564 = fcmp olt double %R562, %load_target201
  %R564202 = zext i1 %R564 to i32
  call void @TstCond(i32 1, i32 %R564202, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.35, i64 0, i64 0))
  store i32 30, i32* @Milestone
  %load_target203 = load double, double* @Four
  %load_target204 = load double, double* @Three
  %R568 = fdiv double %load_target203, %load_target204
  %load_target205 = load double, double* @One
  %R570 = fsub double %R568, %load_target205
  %R573 = fdiv double %load_target205, %load_target203
  %R574 = fsub double %R570, %R573
  %R576 = fmul double %R574, %load_target204
  %R580 = fsub double %R576, %R573
  %R581 = call double @fabs(double %R580)
  store double %R581, double* %10
  br label %L55

L55:                                              ; preds = %L55, %L54
  %111 = load double, double* %10
  store double %111, double* @Z2
  %load_target206 = load double, double* @One
  %load_target207 = load double, double* @Half
  %R586 = fmul double %load_target207, %111
  %load_target208 = load double, double* @ThirtyTwo
  %R589 = fmul double %load_target208, %111
  %R591 = fmul double %R589, %111
  %R592 = fadd double %R586, %R591
  %R593 = fadd double %load_target206, %R592
  %R595 = fsub double %R593, %load_target206
  store double %R595, double* @X
  store double %R595, double* %10
  %R598 = fcmp ole double %111, %R595
  %R598209 = zext i1 %R598 to i32
  %load_target210 = load double, double* @Zero
  %R601 = fcmp ole double %R595, %load_target210
  %R601211 = zext i1 %R601 to i32
  %112 = icmp ne i32 %R598209, 0
  %113 = icmp ne i32 %R601211, 0
  %R602 = or i1 %112, %113
  %R602212 = zext i1 %R602 to i32
  %cond213 = icmp ne i32 %R602212, 0
  br i1 %cond213, label %L56, label %L55

L56:                                              ; preds = %L55
  %load_target214 = load double, double* @Three
  %load_target215 = load double, double* @Four
  %R605 = fdiv double %load_target214, %load_target215
  %load_target216 = load double, double* @Two
  %R608 = fdiv double %load_target216, %load_target214
  %R609 = fsub double %R605, %R608
  %R611 = fmul double %R609, %load_target214
  %R614 = fdiv double %load_target206, %load_target215
  %R615 = fsub double %R611, %R614
  %R616 = call double @fabs(double %R615)
  store double %R616, double* @Y
  store double %R616, double* @X
  store double %R616, double* %11
  store double %R616, double* %12
  store double %R616, double* %13
  br label %L57

L57:                                              ; preds = %L57, %L56
  %114 = load double, double* %11
  store double %114, double* @Z1
  %load_target217 = load double, double* @One
  %load_target218 = load double, double* @Two
  %R620 = fdiv double %load_target217, %load_target218
  %load_target219 = load double, double* @Half
  %R626 = fmul double %load_target219, %114
  %load_target220 = load double, double* @ThirtyTwo
  %R629 = fmul double %load_target220, %114
  %R631221 = fmul double %R629, %114
  %R632 = fadd double %R626, %R631221
  %R633 = fsub double %R620, %R632
  %R637 = fadd double %R633, %R620
  %R638 = fsub double %R620, %R637
  %R642 = fadd double %R638, %R620
  store double %R642, double* @Z
  store double %R642, double* %11
  %R645 = fcmp ole double %114, %R642
  %R645222 = zext i1 %R645 to i32
  %load_target223 = load double, double* @Zero
  %R648 = fcmp ole double %R642, %load_target223
  %R648224 = zext i1 %R648 to i32
  %115 = icmp ne i32 %R645222, 0
  %116 = icmp ne i32 %R648224, 0
  %R649 = or i1 %115, %116
  %R649225 = zext i1 %R649 to i32
  %cond226 = icmp ne i32 %R649225, 0
  br i1 %cond226, label %L58, label %L57

L58:                                              ; preds = %L59, %L58, %L57
  %117 = load double, double* %12
  store double %117, double* @Y1
  %R655 = fmul double %load_target219, %117
  %R658 = fmul double %load_target220, %117
  %R660 = fmul double %R658, %117
  %R661 = fadd double %R655, %R660
  %R662 = fsub double %load_target219, %R661
  %R664 = fadd double %R662, %load_target219
  %R665 = fsub double %load_target219, %R664
  %R667 = fadd double %R665, %load_target219
  store double %R667, double* @Y
  store double %R667, double* %12
  %R670 = fcmp ole double %117, %R667
  %R670227 = zext i1 %R670 to i32
  %R673 = fcmp ole double %R667, %load_target223
  %R673228 = zext i1 %R673 to i32
  %118 = icmp ne i32 %R670227, 0
  %119 = icmp ne i32 %R673228, 0
  %R674 = or i1 %118, %119
  %R674229 = zext i1 %R674 to i32
  %cond230 = icmp ne i32 %R674229, 0
  br i1 %cond230, label %L59, label %L58

L59:                                              ; preds = %L58
  %120 = load double, double* %13
  store double %120, double* @X1
  %R678 = fmul double %load_target219, %120
  %R681 = fmul double %load_target220, %120
  %R683231 = fmul double %R681, %120
  %R684 = fadd double %R678, %R683231
  %load_target232 = load double, double* @F9
  %R686 = fsub double %R684, %load_target232
  %R688 = fadd double %R686, %load_target232
  store double %R688, double* @X
  store double %R688, double* %13
  %R691 = fcmp ole double %120, %R688
  %R691233 = zext i1 %R691 to i32
  %R694234 = fcmp ole double %R688, %load_target223
  %R694235 = zext i1 %R694234 to i32
  %121 = icmp ne i32 %R691233, 0
  %122 = icmp ne i32 %R694235, 0
  %R695 = or i1 %121, %122
  %R695236 = zext i1 %R695 to i32
  %cond237 = icmp ne i32 %R695236, 0
  br i1 %cond237, label %L60, label %L58

L60:                                              ; preds = %L59
  %R698 = fcmp une double %120, %117
  %R698238 = zext i1 %R698 to i32
  %R701 = fcmp une double %120, %114
  %R701239 = zext i1 %R701 to i32
  %123 = icmp ne i32 %R698238, 0
  %124 = icmp ne i32 %R701239, 0
  %R702 = or i1 %123, %124
  %R702240 = zext i1 %R702 to i32
  %cond241 = icmp ne i32 %R702240, 0
  br i1 %cond241, label %L61, label %L63

L61:                                              ; preds = %L60
  call void @BadCond(i32 1, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.36, i64 0, i64 0))
  %load_target242 = load double, double* @X1
  %load_target243 = load double, double* @Y1
  %load_target244 = load double, double* @Z1
  %R708 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.37, i64 0, i64 0), double %load_target242, double %load_target243, double %load_target244)
  %R710 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.38, i64 0, i64 0))
  %R712 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.39, i64 0, i64 0))
  call void @notify(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.40, i64 0, i64 0))
  %load_target245 = load double, double* @X1
  %load_target246 = load double, double* @U1
  %R716 = fcmp oeq double %load_target245, %load_target246
  %R716247 = zext i1 %R716 to i32
  %load_target248 = load double, double* @Y1
  %R719 = fcmp oeq double %load_target248, %load_target246
  %R719249 = zext i1 %R719 to i32
  %125 = icmp ne i32 %R716247, 0
  %126 = icmp ne i32 %R719249, 0
  %R720 = or i1 %125, %126
  %R720250 = zext i1 %R720 to i32
  %load_target251 = load double, double* @Z1
  %R723 = fcmp oeq double %load_target251, %load_target246
  %R723252 = zext i1 %R723 to i32
  %127 = icmp ne i32 %R720250, 0
  %128 = icmp ne i32 %R723252, 0
  %R724 = or i1 %127, %128
  %R724253 = zext i1 %R724 to i32
  %cond254 = icmp ne i32 %R724253, 0
  br i1 %cond254, label %L62, label %L73

L62:                                              ; preds = %L61
  %R726 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.41, i64 0, i64 0))
  br label %L73

L63:                                              ; preds = %L60
  %load_target255 = load double, double* @U1
  %R729 = fcmp une double %114, %load_target255
  %R729256 = zext i1 %R729 to i32
  %load_target257 = load double, double* @Z2
  %load_target258 = load double, double* @U2
  %R732 = fcmp une double %load_target257, %load_target258
  %R732259 = zext i1 %R732 to i32
  %129 = icmp ne i32 %R729256, 0
  %130 = icmp ne i32 %R732259, 0
  %R733 = or i1 %129, %130
  %R733260 = zext i1 %R733 to i32
  %cond261 = icmp ne i32 %R733260, 0
  br i1 %cond261, label %L64, label %L73

L64:                                              ; preds = %L63
  %R736262 = fcmp oge double %114, %load_target255
  %R736263 = zext i1 %R736262 to i32
  %R739 = fcmp oge double %load_target257, %load_target258
  %R739264 = zext i1 %R739 to i32
  %131 = icmp ne i32 %R736263, 0
  %132 = icmp ne i32 %R739264, 0
  %R740 = or i1 %131, %132
  %R740265 = zext i1 %R740 to i32
  %cond266 = icmp ne i32 %R740265, 0
  br i1 %cond266, label %L65, label %L66

L65:                                              ; preds = %L64
  call void @BadCond(i32 0, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.42, i64 0, i64 0))
  call void @notify(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.43, i64 0, i64 0))
  %load_target267 = load double, double* @U1
  %load_target268 = load double, double* @Z1
  %R747 = fsub double %load_target268, %load_target267
  %R748 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.44, i64 0, i64 0), double %load_target267, double %R747)
  %load_target269 = load double, double* @U2
  %load_target270 = load double, double* @Z2
  %R753 = fsub double %load_target270, %load_target269
  %R754 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.45, i64 0, i64 0), double %load_target269, double %R753)
  br label %L73

L66:                                              ; preds = %L64
  %R757 = fcmp ole double %114, %load_target223
  %R757271 = zext i1 %R757 to i32
  %R760 = fcmp ole double %load_target257, %load_target223
  %R760272 = zext i1 %R760 to i32
  %133 = icmp ne i32 %R757271, 0
  %134 = icmp ne i32 %R760272, 0
  %R761 = or i1 %133, %134
  %R761273 = zext i1 %R761 to i32
  %cond274 = icmp ne i32 %R761273, 0
  br i1 %cond274, label %L67, label %L68

L67:                                              ; preds = %L66
  %load_target275 = load double, double* @Radix
  %R764 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.46, i64 0, i64 0), double %load_target275)
  %R766 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.47, i64 0, i64 0))
  %load_target276 = load double, double* @Z1
  %load_target277 = load double, double* @Z2
  %R770 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.48, i64 0, i64 0), double %load_target276, double %load_target277)
  call void @notify(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.49, i64 0, i64 0))
  br label %L68

L68:                                              ; preds = %L67, %L66
  %load_target278 = load double, double* @Z1
  %load_target279 = load double, double* @Z2
  %R774 = fcmp une double %load_target278, %load_target279
  %R774280 = zext i1 %R774 to i32
  %load_target281 = load double, double* @Zero
  %R777 = fcmp ogt double %load_target278, %load_target281
  %R777282 = zext i1 %R777 to i32
  %135 = icmp ne i32 %R774280, 0
  %136 = icmp ne i32 %R777282, 0
  %R778 = or i1 %135, %136
  %R778283 = zext i1 %R778 to i32
  %cond284 = icmp ne i32 %R778283, 0
  br i1 %cond284, label %L69, label %L72

L69:                                              ; preds = %L68
  %load_target285 = load double, double* @U1
  %R781 = fdiv double %load_target278, %load_target285
  store double %R781, double* @X
  %load_target286 = load double, double* @U2
  %R784 = fdiv double %load_target279, %load_target286
  store double %R784, double* @Y
  %R787 = fcmp ogt double %R784, %R781
  %R787287 = zext i1 %R787 to i32
  store double %R781, double* %14
  %cond288 = icmp ne i32 %R787287, 0
  br i1 %cond288, label %L70, label %L71

L70:                                              ; preds = %L69
  store double %R784, double* @X
  store double %R784, double* %14
  br label %L71

L71:                                              ; preds = %L70, %L69
  %137 = load double, double* %14
  %R790 = call double @log(double %137)
  %R791 = fsub double -0.000000e+00, %R790
  store double %R791, double* @Q
  %R793 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.50, i64 0, i64 0))
  %load_target289 = load double, double* @Q
  %load_target290 = load double, double* @Radix
  %R797 = call double @log(double %load_target290)
  %R798 = fdiv double %load_target289, %R797
  %R799291 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.51, i64 0, i64 0), double %R798)
  %load_target292 = load double, double* @Q
  %R803 = call double @log(double 1.000000e+01)
  %R804 = fdiv double %load_target292, %R803
  %R805 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.52, i64 0, i64 0), double %R804)
  br label %L72

L72:                                              ; preds = %L71, %L68
  %R807 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.53, i64 0, i64 0))
  br label %L73

L73:                                              ; preds = %L72, %L65, %L63, %L62, %L61
  call void @Pause()
  store i32 35, i32* @Milestone
  %load_target293 = load double, double* @Radix
  %load_target294 = load double, double* @Two
  %R810 = fcmp oge double %load_target293, %load_target294
  %R810295 = zext i1 %R810 to i32
  %cond296 = icmp ne i32 %R810295, 0
  br i1 %cond296, label %L74, label %L76

L74:                                              ; preds = %L73
  %load_target297 = load double, double* @W
  %R814 = fmul double %load_target293, %load_target293
  %R815 = fdiv double %load_target297, %R814
  %load_target298 = load double, double* @One
  %R818 = fadd double %R815, %load_target298
  store double %R818, double* @Y
  %R821 = fsub double %R818, %R815
  store double %R821, double* @Z
  %load_target299 = load double, double* @U2
  %R824 = fadd double %R821, %load_target299
  store double %R824, double* @T
  %R827 = fsub double %R824, %R821
  store double %R827, double* @X
  %R830 = fcmp oeq double %R827, %load_target299
  %R830300 = zext i1 %R830 to i32
  call void @TstCond(i32 0, i32 %R830300, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.54, i64 0, i64 0))
  %load_target301 = load double, double* @X
  %load_target302 = load double, double* @U2
  %R834 = fcmp oeq double %load_target301, %load_target302
  %R834303 = zext i1 %R834 to i32
  %cond304 = icmp ne i32 %R834303, 0
  br i1 %cond304, label %L75, label %L76

L75:                                              ; preds = %L74
  %R836 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.55, i64 0, i64 0))
  br label %L76

L76:                                              ; preds = %L75, %L74, %L73
  %R838 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.56, i64 0, i64 0))
  %load_target305 = load double, double* @F9
  %load_target306 = load double, double* @One
  %R841 = fmul double %load_target305, %load_target306
  %R844 = fmul double %load_target306, %load_target305
  %load_target307 = load double, double* @Half
  %R847 = fsub double %load_target305, %load_target307
  %R850 = fsub double %R841, %load_target307
  %R852 = fsub double %R850, %R847
  store double %R852, double* @Y
  %R855 = fsub double %R844, %load_target307
  %R857 = fsub double %R855, %R847
  store double %R857, double* @Z
  %load_target308 = load double, double* @U2
  %R860 = fadd double %load_target306, %load_target308
  %load_target309 = load double, double* @Radix
  %R863 = fmul double %R860, %load_target309
  %R866 = fmul double %load_target309, %R860
  store double %R866, double* @R
  %R869 = fsub double %R863, %load_target309
  %R873 = fmul double %load_target309, %load_target308
  %R874 = fsub double %R869, %R873
  %R877 = fsub double %R866, %load_target309
  %R882 = fsub double %R877, %R873
  %R886 = fsub double %load_target309, %load_target306
  %R887 = fmul double %R874, %R886
  store double %R887, double* @X
  %R892 = fmul double %R882, %R886
  store double %R892, double* @T
  %load_target310 = load double, double* @Zero
  %R895 = fcmp oeq double %R887, %load_target310
  %R895311 = zext i1 %R895 to i32
  %R898 = fcmp oeq double %R852, %load_target310
  %R898312 = zext i1 %R898 to i32
  %138 = icmp ne i32 %R895311, 0
  %139 = icmp ne i32 %R898312, 0
  %R899 = and i1 %138, %139
  %R899313 = zext i1 %R899 to i32
  %R902 = fcmp oeq double %R857, %load_target310
  %R902314 = zext i1 %R902 to i32
  %140 = icmp ne i32 %R899313, 0
  %141 = icmp ne i32 %R902314, 0
  %R903 = and i1 %140, %141
  %R903315 = zext i1 %R903 to i32
  %R906 = fcmp oeq double %R892, %load_target310
  %R906316 = zext i1 %R906 to i32
  %142 = icmp ne i32 %R903315, 0
  %143 = icmp ne i32 %R906316, 0
  %R907 = and i1 %142, %143
  %R907317 = zext i1 %R907 to i32
  %cond318 = icmp ne i32 %R907317, 0
  br i1 %cond318, label %L77, label %L78

L77:                                              ; preds = %L76
  store i32 1, i32* @GMult
  br label %L79

L78:                                              ; preds = %L76
  store i32 0, i32* @GMult
  call void @TstCond(i32 1, i32 0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.57, i64 0, i64 0))
  br label %L79

L79:                                              ; preds = %L78, %L77
  %load_target319 = load double, double* @Radix
  %load_target320 = load double, double* @U2
  %R911 = fmul double %load_target319, %load_target320
  store double %R911, double* @Z
  %load_target321 = load double, double* @One
  %R914 = fadd double %load_target321, %R911
  store double %R914, double* @X
  %R917 = fadd double %R914, %R911
  %R920 = fmul double %R914, %R914
  %R921 = fsub double %R917, %R920
  %R922 = call double @fabs(double %R921)
  %load_target322 = load double, double* @U2
  %R924 = fsub double %R922, %load_target322
  store double %R924, double* @Y
  %load_target323 = load double, double* @One
  %R927 = fsub double %load_target323, %load_target322
  store double %R927, double* @X
  %R930 = fsub double %R927, %load_target322
  %R933 = fmul double %R927, %R927
  %R934 = fsub double %R930, %R933
  %R935 = call double @fabs(double %R934)
  %load_target324 = load double, double* @U1
  %R937 = fsub double %R935, %load_target324
  store double %R937, double* @Z
  %load_target325 = load double, double* @Y
  %load_target326 = load double, double* @Zero
  %R940 = fcmp ole double %load_target325, %load_target326
  %R940327 = zext i1 %R940 to i32
  %R943 = fcmp ole double %R937, %load_target326
  %R943328 = zext i1 %R943 to i32
  %144 = icmp ne i32 %R940327, 0
  %145 = icmp ne i32 %R943328, 0
  %R944 = and i1 %144, %145
  %R944329 = zext i1 %R944 to i32
  call void @TstCond(i32 0, i32 %R944329, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.58, i64 0, i64 0))
  %load_target330 = load double, double* @One
  %load_target331 = load double, double* @U2
  %R948 = fsub double %load_target330, %load_target331
  %R951 = fadd double %load_target330, %load_target331
  %R954 = fdiv double %load_target330, %R948
  %R957 = fsub double %R954, %R951
  store double %R957, double* @Y
  %load_target332 = load double, double* @Three
  %R960 = fdiv double %load_target330, %load_target332
  %load_target333 = load double, double* @Nine
  %R963 = fdiv double %load_target332, %load_target333
  %R966 = fsub double %R960, %R963
  store double %R966, double* @X
  %load_target334 = load double, double* @TwentySeven
  %R969 = fdiv double %load_target333, %load_target334
  store double %R969, double* @T
  %R972 = fsub double %R963, %R969
  store double %R972, double* @Z
  %load_target335 = load double, double* @Zero
  %R975 = fcmp oeq double %R966, %load_target335
  %R975336 = zext i1 %R975 to i32
  %R978 = fcmp oeq double %R957, %load_target335
  %R978337 = zext i1 %R978 to i32
  %146 = icmp ne i32 %R975336, 0
  %147 = icmp ne i32 %R978337, 0
  %R979 = and i1 %146, %147
  %R979338 = zext i1 %R979 to i32
  %R982 = fcmp oeq double %R972, %load_target335
  %R982339 = zext i1 %R982 to i32
  %148 = icmp ne i32 %R979338, 0
  %149 = icmp ne i32 %R982339, 0
  %R983 = and i1 %148, %149
  %R983340 = zext i1 %R983 to i32
  call void @TstCond(i32 2, i32 %R983340, i8* getelementptr inbounds ([98 x i8], [98 x i8]* @.str.59, i64 0, i64 0))
  %load_target341 = load double, double* @F9
  %load_target342 = load double, double* @One
  %R987 = fdiv double %load_target341, %load_target342
  %load_target343 = load double, double* @Half
  %R990 = fsub double %load_target341, %load_target343
  %R993 = fsub double %R987, %load_target343
  %R995 = fsub double %R993, %R990
  store double %R995, double* @Y
  %load_target344 = load double, double* @U2
  %R998 = fadd double %load_target342, %load_target344
  %R1001 = fdiv double %R998, %load_target342
  store double %R1001, double* @T
  %R1004 = fsub double %R1001, %R998
  store double %R1004, double* @X
  %load_target345 = load double, double* @Zero
  %R1007 = fcmp oeq double %R1004, %load_target345
  %R1007346 = zext i1 %R1007 to i32
  %R1010 = fcmp oeq double %R995, %load_target345
  %R1010347 = zext i1 %R1010 to i32
  %150 = icmp ne i32 %R1007346, 0
  %151 = icmp ne i32 %R1010347, 0
  %R1011 = and i1 %150, %151
  %R1011348 = zext i1 %R1011 to i32
  %load_target349 = load double, double* @Z
  %R1014 = fcmp oeq double %load_target349, %load_target345
  %R1014350 = zext i1 %R1014 to i32
  %152 = icmp ne i32 %R1011348, 0
  %153 = icmp ne i32 %R1014350, 0
  %R1015 = and i1 %152, %153
  %R1015351 = zext i1 %R1015 to i32
  %cond352 = icmp ne i32 %R1015351, 0
  br i1 %cond352, label %L80, label %L81

L80:                                              ; preds = %L79
  store i32 1, i32* @GDiv
  br label %L82

L81:                                              ; preds = %L79
  store i32 0, i32* @GDiv
  call void @TstCond(i32 1, i32 0, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.60, i64 0, i64 0))
  br label %L82

L82:                                              ; preds = %L81, %L80
  %load_target353 = load double, double* @One
  %load_target354 = load double, double* @U2
  %R1020 = fadd double %load_target353, %load_target354
  %R1021 = fdiv double %load_target353, %R1020
  store double %R1021, double* @X
  %load_target355 = load double, double* @Half
  %R1024 = fsub double %R1021, %load_target355
  %R1026 = fsub double %R1024, %load_target355
  store double %R1026, double* @Y
  %load_target356 = load double, double* @Zero
  %R1029 = fcmp olt double %R1026, %load_target356
  %R1029357 = zext i1 %R1029 to i32
  call void @TstCond(i32 1, i32 %R1029357, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.61, i64 0, i64 0))
  %load_target358 = load double, double* @One
  %load_target359 = load double, double* @U2
  %R1033 = fsub double %load_target358, %load_target359
  %load_target360 = load double, double* @Radix
  %R1037 = fmul double %load_target360, %load_target359
  %R1038 = fadd double %load_target358, %R1037
  %R1041 = fmul double %R1033, %load_target360
  store double %R1041, double* @Z
  %R1044 = fmul double %R1038, %load_target360
  store double %R1044, double* @T
  %R1047 = fdiv double %R1041, %load_target360
  store double %R1047, double* @R
  %R1050 = fdiv double %R1044, %load_target360
  store double %R1050, double* @StickyBit
  %R1053 = fsub double %R1047, %R1033
  store double %R1053, double* @X
  %R1056 = fsub double %R1050, %R1038
  store double %R1056, double* @Y
  %load_target361 = load double, double* @Zero
  %R1059 = fcmp oeq double %R1053, %load_target361
  %R1059362 = zext i1 %R1059 to i32
  %R1062 = fcmp oeq double %R1056, %load_target361
  %R1062363 = zext i1 %R1062 to i32
  %154 = icmp ne i32 %R1059362, 0
  %155 = icmp ne i32 %R1062363, 0
  %R1063 = and i1 %154, %155
  %R1063364 = zext i1 %R1063 to i32
  call void @TstCond(i32 0, i32 %R1063364, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.62, i64 0, i64 0))
  %load_target365 = load double, double* @One
  %load_target366 = load double, double* @U1
  %R1067 = fsub double %load_target365, %load_target366
  %load_target367 = load double, double* @F9
  %R1070 = fsub double %load_target365, %load_target367
  store double %R1070, double* @X
  %R1073 = fsub double %load_target365, %R1067
  store double %R1073, double* @Y
  %load_target368 = load double, double* @Radix
  %load_target369 = load double, double* @U2
  %R1076 = fsub double %load_target368, %load_target369
  %load_target370 = load double, double* @BMinusU2
  %R1079 = fsub double %load_target368, %load_target370
  store double %R1079, double* @Z
  %R1082 = fsub double %load_target368, %R1076
  store double %R1082, double* @T
  %R1085 = fcmp oeq double %R1070, %load_target366
  %R1085371 = zext i1 %R1085 to i32
  %R1088 = fcmp oeq double %R1073, %load_target366
  %R1088372 = zext i1 %R1088 to i32
  %156 = icmp ne i32 %R1085371, 0
  %157 = icmp ne i32 %R1088372, 0
  %R1089 = and i1 %156, %157
  %R1089373 = zext i1 %R1089 to i32
  %R1092 = fcmp oeq double %R1079, %load_target369
  %R1092374 = zext i1 %R1092 to i32
  %158 = icmp ne i32 %R1089373, 0
  %159 = icmp ne i32 %R1092374, 0
  %R1093 = and i1 %158, %159
  %R1093375 = zext i1 %R1093 to i32
  %R1096 = fcmp oeq double %R1082, %load_target369
  %R1096376 = zext i1 %R1096 to i32
  %160 = icmp ne i32 %R1093375, 0
  %161 = icmp ne i32 %R1096376, 0
  %R1097 = and i1 %160, %161
  %R1097377 = zext i1 %R1097 to i32
  %cond378 = icmp ne i32 %R1097377, 0
  br i1 %cond378, label %L83, label %L84

L83:                                              ; preds = %L82
  store i32 1, i32* @GAddSub
  br label %L85

L84:                                              ; preds = %L82
  store i32 0, i32* @GAddSub
  call void @TstCond(i32 1, i32 0, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.63, i64 0, i64 0))
  br label %L85

L85:                                              ; preds = %L84, %L83
  %load_target379 = load double, double* @F9
  %load_target380 = load double, double* @One
  %R1101 = fcmp une double %load_target379, %load_target380
  %R1101381 = zext i1 %R1101 to i32
  %R1104 = fsub double %load_target379, %load_target380
  %load_target382 = load double, double* @Zero
  %R1106 = fcmp oge double %R1104, %load_target382
  %R1106383 = zext i1 %R1106 to i32
  %162 = icmp ne i32 %R1101381, 0
  %163 = icmp ne i32 %R1106383, 0
  %R1107 = and i1 %162, %163
  %R1107384 = zext i1 %R1107 to i32
  %cond385 = icmp ne i32 %R1107384, 0
  br i1 %cond385, label %L86, label %L87

L86:                                              ; preds = %L85
  call void @BadCond(i32 1, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.64, i64 0, i64 0))
  %R1110 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.65, i64 0, i64 0))
  %R1112 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.66, i64 0, i64 0))
  %R1114 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.67, i64 0, i64 0))
  br label %L87

L87:                                              ; preds = %L86, %L85
  %load_target386 = load i32, i32* @GMult
  %R1116 = icmp eq i32 %load_target386, 1
  %R1116387 = zext i1 %R1116 to i32
  %load_target388 = load i32, i32* @GDiv
  %R1118 = icmp eq i32 %load_target388, 1
  %R1118389 = zext i1 %R1118 to i32
  %164 = icmp ne i32 %R1116387, 0
  %165 = icmp ne i32 %R1118389, 0
  %R1119 = and i1 %164, %165
  %R1119390 = zext i1 %R1119 to i32
  %load_target391 = load i32, i32* @GAddSub
  %R1121 = icmp eq i32 %load_target391, 1
  %R1121392 = zext i1 %R1121 to i32
  %166 = icmp ne i32 %R1119390, 0
  %167 = icmp ne i32 %R1121392, 0
  %R1122 = and i1 %166, %167
  %R1122393 = zext i1 %R1122 to i32
  %cond394 = icmp ne i32 %R1122393, 0
  br i1 %cond394, label %L88, label %L89

L88:                                              ; preds = %L87
  %R1124 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str.68, i64 0, i64 0))
  br label %L89

L89:                                              ; preds = %L88, %L87
  store i32 40, i32* @Milestone
  call void @Pause()
  %R1126 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.69, i64 0, i64 0))
  store i32 0, i32* @RMult
  store i32 0, i32* @RDiv
  store i32 0, i32* @RAddSub
  %load_target395 = load double, double* @Radix
  %load_target396 = load double, double* @Two
  %R1129 = fdiv double %load_target395, %load_target396
  store double %R1129, double* @RadixD2
  store double %load_target396, double* @A1
  store i32 0, i32* @Done
  br label %L90

L90:                                              ; preds = %L93, %L89
  %load_target397 = load double, double* @Radix
  store double %load_target397, double* %15
  br label %L91

L91:                                              ; preds = %L91, %L90
  %168 = load double, double* %15
  store double %168, double* @X
  %load_target398 = load double, double* @A1
  %R1135 = fdiv double %168, %load_target398
  store double %R1135, double* @AInvrse
  %R1137 = call double @floor(double %R1135)
  %load_target399 = load double, double* @AInvrse
  %R1139 = fcmp une double %R1137, %load_target399
  %R1139400 = zext i1 %R1139 to i32
  store double %load_target399, double* %15
  %cond401 = icmp ne i32 %R1139400, 0
  br i1 %cond401, label %L92, label %L91

L92:                                              ; preds = %L91
  %load_target402 = load double, double* @X
  %load_target403 = load double, double* @One
  %R1142 = fcmp oeq double %load_target402, %load_target403
  %R1142404 = zext i1 %R1142 to i32
  %load_target405 = load double, double* @A1
  %load_target406 = load double, double* @Three
  %R1145 = fcmp ogt double %load_target405, %load_target406
  %R1145407 = zext i1 %R1145 to i32
  %169 = icmp ne i32 %R1142404, 0
  %170 = icmp ne i32 %R1145407, 0
  %R1146 = or i1 %169, %170
  %R1146408 = zext i1 %R1146 to i32
  store i32 %R1146408, i32* @Done
  store double %load_target403, double* %16
  store double %load_target405, double* %17
  %cond409 = icmp ne i32 %R1146408, 0
  br i1 %cond409, label %L94, label %L93

L93:                                              ; preds = %L92
  %load_target410 = load double, double* @Nine
  %R1150 = fadd double %load_target410, %load_target403
  store double %R1150, double* @A1
  store double %load_target403, double* %16
  store double %R1150, double* %17
  br label %L90

L94:                                              ; preds = %L92
  %171 = load double, double* %16
  %R1154 = fcmp oeq double %load_target402, %171
  %R1154411 = zext i1 %R1154 to i32
  %cond412 = icmp ne i32 %R1154411, 0
  br i1 %cond412, label %L95, label %L96

L95:                                              ; preds = %L94
  %load_target413 = load double, double* @Radix
  store double %load_target413, double* @A1
  store double %load_target413, double* %17
  br label %L96

L96:                                              ; preds = %L95, %L94
  %172 = load double, double* %17
  %R1158 = fdiv double %171, %172
  store double %R1158, double* @AInvrse
  store double %172, double* @X
  store double %R1158, double* @Y
  store i32 0, i32* @Done
  store double %R1158, double* %19
  store double %172, double* %18
  br label %L97

L97:                                              ; preds = %L97, %L96
  %173 = load double, double* %18
  %174 = load double, double* %19
  %R1163 = fmul double %173, %174
  %load_target414 = load double, double* @Half
  %R1165 = fsub double %R1163, %load_target414
  store double %R1165, double* @Z
  %R1168 = fcmp oeq double %R1165, %load_target414
  %R1168415 = zext i1 %R1168 to i32
  call void @TstCond(i32 0, i32 %R1168415, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.70, i64 0, i64 0))
  %load_target416 = load double, double* @X
  %load_target417 = load double, double* @Radix
  %R1172 = fcmp oeq double %load_target416, %load_target417
  %R1172418 = zext i1 %R1172 to i32
  store i32 %R1172418, i32* @Done
  store double %load_target417, double* @X
  %load_target419 = load double, double* @One
  %R1176 = fdiv double %load_target419, %load_target417
  store double %R1176, double* @Y
  store double %R1176, double* %19
  store double %load_target417, double* %18
  %cond420 = icmp ne i32 %R1172418, 0
  br i1 %cond420, label %L98, label %L97

L98:                                              ; preds = %L97
  %load_target421 = load double, double* @U2
  %R1180 = fadd double %load_target419, %load_target421
  store double %R1180, double* @Y2
  %R1183 = fsub double %load_target419, %load_target421
  store double %R1183, double* @Y1
  %load_target422 = load double, double* @OneAndHalf
  %R1186 = fsub double %load_target422, %load_target421
  %R1189 = fadd double %load_target422, %load_target421
  %R1192 = fsub double %R1186, %load_target421
  %R1194 = fmul double %R1192, %R1180
  %R1197 = fmul double %R1189, %R1183
  %R1200 = fsub double %R1194, %R1186
  store double %R1200, double* @Z
  %R1203 = fsub double %R1197, %R1186
  store double %R1203, double* @T
  %R1206 = fmul double %R1186, %R1180
  %R1209 = fadd double %R1189, %load_target421
  %R1211 = fmul double %R1209, %R1183
  %R1214 = fsub double %R1206, %load_target422
  store double %R1214, double* @X
  %R1217 = fsub double %R1211, %load_target422
  store double %R1217, double* @Y
  %load_target423 = load double, double* @Zero
  %R1220 = fcmp oeq double %R1214, %load_target423
  %R1220424 = zext i1 %R1220 to i32
  %R1223 = fcmp oeq double %R1217, %load_target423
  %R1223425 = zext i1 %R1223 to i32
  %175 = icmp ne i32 %R1220424, 0
  %176 = icmp ne i32 %R1223425, 0
  %R1224 = and i1 %175, %176
  %R1224426 = zext i1 %R1224 to i32
  %R1227 = fcmp oeq double %R1200, %load_target423
  %R1227427 = zext i1 %R1227 to i32
  %177 = icmp ne i32 %R1224426, 0
  %178 = icmp ne i32 %R1227427, 0
  %R1228 = and i1 %177, %178
  %R1228428 = zext i1 %R1228 to i32
  %R1231 = fcmp ole double %R1203, %load_target423
  %R1231429 = zext i1 %R1231 to i32
  %179 = icmp ne i32 %R1228428, 0
  %180 = icmp ne i32 %R1231429, 0
  %R1232 = and i1 %179, %180
  %R1232430 = zext i1 %R1232 to i32
  %cond431 = icmp ne i32 %R1232430, 0
  br i1 %cond431, label %L99, label %L106

L99:                                              ; preds = %L98
  %R1237 = fmul double %R1189, %R1180
  %R1252 = fmul double %R1186, %R1183
  %R1256 = fadd double %R1209, %load_target421
  %R1257 = fsub double %R1237, %R1256
  store double %R1257, double* @X
  %R1260 = fmul double %R1192, %R1183
  %R1263 = fmul double %R1209, %R1180
  store double %R1263, double* @S
  %R1266 = fsub double %R1252, %R1192
  store double %R1266, double* @T
  %R1269 = fsub double %load_target421, %R1192
  %R1271 = fadd double %R1269, %R1260
  store double %R1271, double* @Y
  %R1277 = fadd double %R1256, %load_target421
  %R1278 = fsub double %R1263, %R1277
  store double %R1278, double* @Z
  %R1281 = fadd double %R1180, %load_target421
  %R1283 = fmul double %R1281, %R1183
  %R1286 = fmul double %R1180, %R1183
  %R1289 = fsub double %R1283, %R1180
  store double %R1289, double* @StickyBit
  %load_target432 = load double, double* @Half
  %R1292 = fsub double %R1286, %load_target432
  store double %R1292, double* @Y1
  %R1295 = fcmp oeq double %R1257, %load_target423
  %R1295433 = zext i1 %R1295 to i32
  %R1298 = fcmp oeq double %R1271, %load_target423
  %R1298434 = zext i1 %R1298 to i32
  %181 = icmp ne i32 %R1295433, 0
  %182 = icmp ne i32 %R1298434, 0
  %R1299 = and i1 %181, %182
  %R1299435 = zext i1 %R1299 to i32
  %R1302 = fcmp oeq double %R1278, %load_target423
  %R1302436 = zext i1 %R1302 to i32
  %183 = icmp ne i32 %R1299435, 0
  %184 = icmp ne i32 %R1302436, 0
  %R1303 = and i1 %183, %184
  %R1303437 = zext i1 %R1303 to i32
  %R1306 = fcmp oeq double %R1266, %load_target423
  %R1306438 = zext i1 %R1306 to i32
  %185 = icmp ne i32 %R1303437, 0
  %186 = icmp ne i32 %R1306438, 0
  %R1307 = and i1 %185, %186
  %R1307439 = zext i1 %R1307 to i32
  %R1310 = fcmp oeq double %R1289, %load_target423
  %R1310440 = zext i1 %R1310 to i32
  %187 = icmp ne i32 %R1307439, 0
  %188 = icmp ne i32 %R1310440, 0
  %R1311 = and i1 %187, %188
  %R1311441 = zext i1 %R1311 to i32
  %R1314 = fcmp oeq double %R1292, %load_target432
  %R1314442 = zext i1 %R1314 to i32
  %189 = icmp ne i32 %R1311441, 0
  %190 = icmp ne i32 %R1314442, 0
  %R1315 = and i1 %189, %190
  %R1315443 = zext i1 %R1315 to i32
  %cond444 = icmp ne i32 %R1315443, 0
  br i1 %cond444, label %L100, label %L101

L100:                                             ; preds = %L99
  store i32 1, i32* @RMult
  %R1317 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.71, i64 0, i64 0))
  br label %L104

L101:                                             ; preds = %L99
  %R1320 = fadd double %R1257, %load_target421
  %R1322 = fcmp oeq double %R1320, %load_target423
  %R1322445 = zext i1 %R1322 to i32
  %R1325 = fcmp olt double %R1271, %load_target423
  %R1325446 = zext i1 %R1325 to i32
  %191 = icmp ne i32 %R1322445, 0
  %192 = icmp ne i32 %R1325446, 0
  %R1326 = and i1 %191, %192
  %R1326447 = zext i1 %R1326 to i32
  %R1329 = fadd double %R1278, %load_target421
  %R1331 = fcmp oeq double %R1329, %load_target423
  %R1331448 = zext i1 %R1331 to i32
  %193 = icmp ne i32 %R1326447, 0
  %194 = icmp ne i32 %R1331448, 0
  %R1332 = and i1 %193, %194
  %R1332449 = zext i1 %R1332 to i32
  %R1335 = fcmp olt double %R1266, %load_target423
  %R1335450 = zext i1 %R1335 to i32
  %195 = icmp ne i32 %R1332449, 0
  %196 = icmp ne i32 %R1335450, 0
  %R1336 = and i1 %195, %196
  %R1336451 = zext i1 %R1336 to i32
  %R1339 = fadd double %R1289, %load_target421
  %R1341 = fcmp oeq double %R1339, %load_target423
  %R1341452 = zext i1 %R1341 to i32
  %197 = icmp ne i32 %R1336451, 0
  %198 = icmp ne i32 %R1341452, 0
  %R1342 = and i1 %197, %198
  %R1342453 = zext i1 %R1342 to i32
  %R1345 = fcmp olt double %R1292, %load_target432
  %R1345454 = zext i1 %R1345 to i32
  %199 = icmp ne i32 %R1342453, 0
  %200 = icmp ne i32 %R1345454, 0
  %R1346 = and i1 %199, %200
  %R1346455 = zext i1 %R1346 to i32
  %cond456 = icmp ne i32 %R1346455, 0
  br i1 %cond456, label %L102, label %L103

L102:                                             ; preds = %L101
  store i32 2, i32* @RMult
  %R1348 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.72, i64 0, i64 0))
  br label %L104

L103:                                             ; preds = %L101
  %R1350 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.73, i64 0, i64 0))
  br label %L104

L104:                                             ; preds = %L103, %L102, %L100
  %load_target457 = load i32, i32* @RMult
  %R1352 = icmp eq i32 %load_target457, 1
  %R1352458 = zext i1 %R1352 to i32
  %load_target459 = load i32, i32* @GMult
  %R1354 = icmp eq i32 %load_target459, 0
  %R1354460 = zext i1 %R1354 to i32
  %201 = icmp ne i32 %R1352458, 0
  %202 = icmp ne i32 %R1354460, 0
  %R1355 = and i1 %201, %202
  %R1355461 = zext i1 %R1355 to i32
  %cond462 = icmp ne i32 %R1355461, 0
  br i1 %cond462, label %L105, label %L107

L105:                                             ; preds = %L104
  call void @notify(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.74, i64 0, i64 0))
  br label %L107

L106:                                             ; preds = %L98
  %R1358 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.75, i64 0, i64 0))
  br label %L107

L107:                                             ; preds = %L106, %L105, %L104
  store i32 45, i32* @Milestone
  %load_target463 = load double, double* @One
  %load_target464 = load double, double* @U2
  %R1361 = fadd double %load_target463, %load_target464
  store double %R1361, double* @Y2
  %R1364 = fsub double %load_target463, %load_target464
  store double %R1364, double* @Y1
  %load_target465 = load double, double* @OneAndHalf
  %R1367 = fadd double %load_target465, %load_target464
  %R1369 = fadd double %R1367, %load_target464
  %R1372 = fdiv double %R1369, %R1361
  %R1375 = fsub double %load_target465, %load_target464
  %R1377 = fsub double %R1375, %load_target464
  %R1380 = fsub double %R1377, %load_target464
  %R1382 = fdiv double %R1380, %R1364
  %R1385 = fadd double %R1369, %load_target464
  %R1387 = fdiv double %R1385, %R1361
  %R1390 = fsub double %R1372, %load_target465
  store double %R1390, double* @X
  %R1393 = fsub double %R1382, %R1377
  store double %R1393, double* @Y
  %R1396 = fdiv double %R1377, %R1364
  %R1401 = fsub double %R1387, %R1367
  store double %R1401, double* @Z
  %R1404 = fsub double %load_target464, %load_target465
  %R1406 = fadd double %R1404, %R1396
  store double %R1406, double* @T
  %load_target466 = load double, double* @Zero
  %R1409 = fcmp ogt double %R1390, %load_target466
  %R1409467 = zext i1 %R1409 to i32
  %R1412 = fcmp ogt double %R1393, %load_target466
  %R1412468 = zext i1 %R1412 to i32
  %203 = icmp ne i32 %R1409467, 0
  %204 = icmp ne i32 %R1412468, 0
  %R1413 = or i1 %203, %204
  %R1413469 = zext i1 %R1413 to i32
  %R1416 = fcmp ogt double %R1401, %load_target466
  %R1416470 = zext i1 %R1416 to i32
  %205 = icmp ne i32 %R1413469, 0
  %206 = icmp ne i32 %R1416470, 0
  %R1417 = or i1 %205, %206
  %R1417471 = zext i1 %R1417 to i32
  %R1420 = fcmp ogt double %R1406, %load_target466
  %R1420472 = zext i1 %R1420 to i32
  %207 = icmp ne i32 %R1417471, 0
  %208 = icmp ne i32 %R1420472, 0
  %R1421 = or i1 %207, %208
  %R1421473 = zext i1 %R1421 to i32
  %cond474 = icmp ne i32 %R1421473, 0
  br i1 %cond474, label %L115, label %L108

L108:                                             ; preds = %L107
  %R1424 = fdiv double %load_target465, %R1361
  %R1433 = fsub double %R1424, %R1375
  store double %R1433, double* @X
  %R1436 = fdiv double %load_target465, %R1364
  %R1439 = fdiv double %R1375, %R1364
  %R1444 = fsub double %R1436, %R1369
  store double %R1444, double* @T
  %R1447 = fsub double %R1439, %R1367
  store double %R1447, double* @Y
  %R1450 = fdiv double %R1367, %R1361
  %R1453 = fadd double %R1361, %load_target464
  %R1455 = fdiv double %R1453, %R1361
  %R1458 = fsub double %R1450, %load_target465
  store double %R1458, double* @Z
  %R1461 = fsub double %R1455, %R1361
  store double %R1461, double* @Y2
  %load_target475 = load double, double* @F9
  %load_target476 = load double, double* @U1
  %R1464 = fsub double %load_target475, %load_target476
  %R1466 = fdiv double %R1464, %load_target475
  store double %R1466, double* @Y1
  %R1469 = fcmp oeq double %R1433, %load_target466
  %R1469477 = zext i1 %R1469 to i32
  %R1472 = fcmp oeq double %R1447, %load_target466
  %R1472478 = zext i1 %R1472 to i32
  %209 = icmp ne i32 %R1469477, 0
  %210 = icmp ne i32 %R1472478, 0
  %R1473 = and i1 %209, %210
  %R1473479 = zext i1 %R1473 to i32
  %R1476 = fcmp oeq double %R1458, %load_target466
  %R1476480 = zext i1 %R1476 to i32
  %211 = icmp ne i32 %R1473479, 0
  %212 = icmp ne i32 %R1476480, 0
  %R1477 = and i1 %211, %212
  %R1477481 = zext i1 %R1477 to i32
  %R1480 = fcmp oeq double %R1444, %load_target466
  %R1480482 = zext i1 %R1480 to i32
  %213 = icmp ne i32 %R1477481, 0
  %214 = icmp ne i32 %R1480482, 0
  %R1481 = and i1 %213, %214
  %R1481483 = zext i1 %R1481 to i32
  %R1484 = fcmp oeq double %R1461, %load_target466
  %R1484484 = zext i1 %R1484 to i32
  %215 = icmp ne i32 %R1481483, 0
  %216 = icmp ne i32 %R1484484, 0
  %R1485 = and i1 %215, %216
  %R1485485 = zext i1 %R1485 to i32
  %217 = icmp ne i32 %R1485485, 0
  %218 = icmp ne i32 %R1484484, 0
  %R1489 = and i1 %217, %218
  %R1489486 = zext i1 %R1489 to i32
  store double %load_target475, double* %21
  store double %R1466, double* %20
  %cond487 = icmp ne i32 %R1489486, 0
  br i1 %cond487, label %L109, label %L112

L109:                                             ; preds = %L108
  %load_target488 = load double, double* @Half
  %R1492 = fsub double %R1466, %load_target488
  %R1495 = fsub double %load_target475, %load_target488
  %R1496 = fcmp oeq double %R1492, %R1495
  %R1496489 = zext i1 %R1496 to i32
  store double %load_target475, double* %21
  store double %R1466, double* %20
  %cond490 = icmp ne i32 %R1496489, 0
  br i1 %cond490, label %L110, label %L112

L110:                                             ; preds = %L109
  store i32 1, i32* @RDiv
  %R1498 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.76, i64 0, i64 0))
  %load_target491 = load i32, i32* @GDiv
  %cond492 = icmp ne i32 %load_target491, 0
  br i1 %cond492, label %L115, label %L111

L111:                                             ; preds = %L110
  call void @notify(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.77, i64 0, i64 0))
  br label %L115

L112:                                             ; preds = %L109, %L108
  %R1504 = fcmp olt double %R1433, %load_target466
  %R1504493 = zext i1 %R1504 to i32
  %R1507 = fcmp olt double %R1447, %load_target466
  %R1507494 = zext i1 %R1507 to i32
  %219 = icmp ne i32 %R1504493, 0
  %220 = icmp ne i32 %R1507494, 0
  %R1508 = and i1 %219, %220
  %R1508495 = zext i1 %R1508 to i32
  %R1511 = fcmp olt double %R1458, %load_target466
  %R1511496 = zext i1 %R1511 to i32
  %221 = icmp ne i32 %R1508495, 0
  %222 = icmp ne i32 %R1511496, 0
  %R1512 = and i1 %221, %222
  %R1512497 = zext i1 %R1512 to i32
  %R1515 = fcmp olt double %R1444, %load_target466
  %R1515498 = zext i1 %R1515 to i32
  %223 = icmp ne i32 %R1512497, 0
  %224 = icmp ne i32 %R1515498, 0
  %R1516 = and i1 %223, %224
  %R1516499 = zext i1 %R1516 to i32
  %R1519 = fcmp olt double %R1461, %load_target466
  %R1519500 = zext i1 %R1519 to i32
  %225 = icmp ne i32 %R1516499, 0
  %226 = icmp ne i32 %R1519500, 0
  %R1520 = and i1 %225, %226
  %R1520501 = zext i1 %R1520 to i32
  %cond502 = icmp ne i32 %R1520501, 0
  br i1 %cond502, label %L113, label %L115

L113:                                             ; preds = %L112
  %227 = load double, double* %20
  %load_target503 = load double, double* @Half
  %R1523 = fsub double %227, %load_target503
  %228 = load double, double* %21
  %R1526 = fsub double %228, %load_target503
  %R1527 = fcmp olt double %R1523, %R1526
  %R1527504 = zext i1 %R1527 to i32
  %cond505 = icmp ne i32 %R1527504, 0
  br i1 %cond505, label %L114, label %L115

L114:                                             ; preds = %L113
  store i32 2, i32* @RDiv
  %R1529 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.78, i64 0, i64 0))
  br label %L115

L115:                                             ; preds = %L114, %L113, %L112, %L111, %L110, %L107
  %load_target506 = load i32, i32* @RDiv
  %cond507 = icmp ne i32 %load_target506, 0
  br i1 %cond507, label %L117, label %L116

L116:                                             ; preds = %L115
  %R1533 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.79, i64 0, i64 0))
  br label %L117

L117:                                             ; preds = %L116, %L115
  %load_target508 = load double, double* @One
  %load_target509 = load double, double* @Radix
  %R1536 = fdiv double %load_target508, %load_target509
  store double %R1536, double* @BInvrse
  %R1539 = fmul double %R1536, %load_target509
  %load_target510 = load double, double* @Half
  %R1541 = fsub double %R1539, %load_target510
  %R1543 = fcmp oeq double %R1541, %load_target510
  %R1543511 = zext i1 %R1543 to i32
  call void @TstCond(i32 0, i32 %R1543511, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.80, i64 0, i64 0))
  store i32 50, i32* @Milestone
  %load_target512 = load double, double* @F9
  %load_target513 = load double, double* @U1
  %R1547 = fadd double %load_target512, %load_target513
  %load_target514 = load double, double* @Half
  %R1549 = fsub double %R1547, %load_target514
  %R1551 = fcmp oeq double %R1549, %load_target514
  %R1551515 = zext i1 %R1551 to i32
  %cond516 = icmp ne i32 %R1551515, 0
  br i1 %cond516, label %L118, label %L119

L118:                                             ; preds = %L117
  %load_target517 = load double, double* @BMinusU2
  %load_target518 = load double, double* @U2
  %R1554 = fadd double %load_target517, %load_target518
  %load_target519 = load double, double* @One
  %R1556 = fsub double %R1554, %load_target519
  %load_target520 = load double, double* @Radix
  %R1559 = fsub double %load_target520, %load_target519
  %R1560 = fcmp oeq double %R1556, %R1559
  %R1560521 = zext i1 %R1560 to i32
  store i32 %R1560521, i32* %22
  br label %L120

L119:                                             ; preds = %L117
  store i32 0, i32* %22
  br label %L120

L120:                                             ; preds = %L119, %L118
  %229 = load i32, i32* %22
  call void @TstCond(i32 0, i32 %229, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.81, i64 0, i64 0))
  %load_target522 = load double, double* @One
  %load_target523 = load double, double* @U1
  %R1566 = fmul double %load_target523, %load_target523
  %R1567 = fsub double %load_target522, %R1566
  %load_target524 = load double, double* @U2
  %R1572 = fsub double %load_target522, %load_target524
  %R1573 = fmul double %load_target524, %R1572
  %R1574 = fadd double %load_target522, %R1573
  %load_target525 = load double, double* @F9
  %load_target526 = load double, double* @Half
  %R1577 = fsub double %load_target525, %load_target526
  store double %R1577, double* @Z
  %R1580 = fsub double %R1567, %load_target526
  %R1582 = fsub double %R1580, %R1577
  store double %R1582, double* @X
  %R1585 = fsub double %R1574, %load_target522
  store double %R1585, double* @Y
  %load_target527 = load double, double* @Zero
  %R1588 = fcmp oeq double %R1582, %load_target527
  %R1588528 = zext i1 %R1588 to i32
  %R1591 = fcmp oeq double %R1585, %load_target527
  %R1591529 = zext i1 %R1591 to i32
  %230 = icmp ne i32 %R1588528, 0
  %231 = icmp ne i32 %R1591529, 0
  %R1592 = and i1 %230, %231
  %R1592530 = zext i1 %R1592 to i32
  %cond531 = icmp ne i32 %R1592530, 0
  br i1 %cond531, label %L121, label %L122

L121:                                             ; preds = %L120
  store i32 2, i32* @RAddSub
  %R1594 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.82, i64 0, i64 0))
  br label %L122

L122:                                             ; preds = %L121, %L120
  %load_target532 = load i32, i32* @GAddSub
  %R1596 = icmp eq i32 %load_target532, 1
  %R1596533 = zext i1 %R1596 to i32
  %cond534 = icmp ne i32 %R1596533, 0
  br i1 %cond534, label %L123, label %L129

L123:                                             ; preds = %L122
  %load_target535 = load double, double* @Half
  %load_target536 = load double, double* @U2
  %R1599 = fadd double %load_target535, %load_target536
  %R1601 = fmul double %R1599, %load_target536
  %R1604 = fsub double %load_target535, %load_target536
  %R1606 = fmul double %R1604, %load_target536
  %load_target537 = load double, double* @One
  %R1609 = fadd double %load_target537, %R1601
  %R1612 = fadd double %load_target537, %R1606
  %R1615 = fadd double %load_target537, %load_target536
  %R1617 = fsub double %R1615, %R1609
  store double %R1617, double* @X
  %R1620 = fsub double %load_target537, %R1612
  store double %R1620, double* @Y
  %load_target538 = load double, double* @Zero
  %R1623 = fcmp oeq double %R1617, %load_target538
  %R1623539 = zext i1 %R1623 to i32
  %R1626 = fcmp oeq double %R1620, %load_target538
  %R1626540 = zext i1 %R1626 to i32
  %232 = icmp ne i32 %R1623539, 0
  %233 = icmp ne i32 %R1626540, 0
  %R1627 = and i1 %232, %233
  %R1627541 = zext i1 %R1627 to i32
  %cond542 = icmp ne i32 %R1627541, 0
  br i1 %cond542, label %L124, label %L128

L124:                                             ; preds = %L123
  %load_target543 = load double, double* @U1
  %R1632 = fmul double %R1599, %load_target543
  %R1637 = fmul double %R1604, %load_target543
  %R1640 = fsub double %load_target537, %R1632
  %R1643 = fsub double %load_target537, %R1637
  %load_target544 = load double, double* @F9
  %R1646 = fsub double %load_target544, %R1640
  store double %R1646, double* @X
  %R1649 = fsub double %load_target537, %R1643
  store double %R1649, double* @Y
  %R1652 = fcmp oeq double %R1646, %load_target538
  %R1652545 = zext i1 %R1652 to i32
  %R1655 = fcmp oeq double %R1649, %load_target538
  %R1655546 = zext i1 %R1655 to i32
  %234 = icmp ne i32 %R1652545, 0
  %235 = icmp ne i32 %R1655546, 0
  %R1656 = and i1 %234, %235
  %R1656547 = zext i1 %R1656 to i32
  %cond548 = icmp ne i32 %R1656547, 0
  br i1 %cond548, label %L125, label %L127

L125:                                             ; preds = %L124
  store i32 1, i32* @RAddSub
  %R1658 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.83, i64 0, i64 0))
  %load_target549 = load i32, i32* @GAddSub
  %cond550 = icmp ne i32 %load_target549, 0
  br i1 %cond550, label %L130, label %L126

L126:                                             ; preds = %L125
  call void @notify(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.84, i64 0, i64 0))
  br label %L130

L127:                                             ; preds = %L124
  %R1663 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.85, i64 0, i64 0))
  br label %L130

L128:                                             ; preds = %L123
  %R1665 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.86, i64 0, i64 0))
  br label %L130

L129:                                             ; preds = %L122
  %R1667 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.87, i64 0, i64 0))
  br label %L130

L130:                                             ; preds = %L129, %L128, %L127, %L126, %L125
  %load_target551 = load double, double* @One
  store double %load_target551, double* @S
  %load_target552 = load double, double* @Half
  %R1673 = fadd double %load_target551, %load_target552
  %R1674 = fmul double %load_target552, %R1673
  %R1675 = fadd double %load_target551, %R1674
  store double %R1675, double* @X
  %load_target553 = load double, double* @U2
  %R1678 = fadd double %load_target551, %load_target553
  %R1680 = fmul double %R1678, %load_target552
  store double %R1680, double* @Y
  %R1683 = fsub double %R1675, %R1680
  store double %R1683, double* @Z
  %R1686 = fsub double %R1680, %R1675
  store double %R1686, double* @T
  %R1689 = fadd double %R1683, %R1686
  store double %R1689, double* @StickyBit
  %load_target554 = load double, double* @Zero
  %R1692 = fcmp une double %R1689, %load_target554
  %R1692555 = zext i1 %R1692 to i32
  %cond556 = icmp ne i32 %R1692555, 0
  br i1 %cond556, label %L131, label %L132

L131:                                             ; preds = %L130
  store double %load_target554, double* @S
  call void @BadCond(i32 3, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.88, i64 0, i64 0))
  br label %L132

L132:                                             ; preds = %L131, %L130
  %load_target557 = load double, double* @Zero
  store double %load_target557, double* @StickyBit
  %load_target558 = load i32, i32* @GMult
  %R1697 = icmp eq i32 %load_target558, 1
  %R1697559 = zext i1 %R1697 to i32
  %load_target560 = load i32, i32* @GDiv
  %R1699 = icmp eq i32 %load_target560, 1
  %R1699561 = zext i1 %R1699 to i32
  %236 = icmp ne i32 %R1697559, 0
  %237 = icmp ne i32 %R1699561, 0
  %R1700 = and i1 %236, %237
  %R1700562 = zext i1 %R1700 to i32
  %load_target563 = load i32, i32* @GAddSub
  %R1702 = icmp eq i32 %load_target563, 1
  %R1702564 = zext i1 %R1702 to i32
  %238 = icmp ne i32 %R1700562, 0
  %239 = icmp ne i32 %R1702564, 0
  %R1703 = and i1 %238, %239
  %R1703565 = zext i1 %R1703 to i32
  %load_target566 = load i32, i32* @RMult
  %R1705 = icmp eq i32 %load_target566, 1
  %R1705567 = zext i1 %R1705 to i32
  %240 = icmp ne i32 %R1703565, 0
  %241 = icmp ne i32 %R1705567, 0
  %R1706 = and i1 %240, %241
  %R1706568 = zext i1 %R1706 to i32
  %load_target569 = load i32, i32* @RDiv
  %R1708 = icmp eq i32 %load_target569, 1
  %R1708570 = zext i1 %R1708 to i32
  %242 = icmp ne i32 %R1706568, 0
  %243 = icmp ne i32 %R1708570, 0
  %R1709 = and i1 %242, %243
  %R1709571 = zext i1 %R1709 to i32
  %load_target572 = load i32, i32* @RAddSub
  %R1711 = icmp eq i32 %load_target572, 1
  %R1711573 = zext i1 %R1711 to i32
  %244 = icmp ne i32 %R1709571, 0
  %245 = icmp ne i32 %R1711573, 0
  %R1712 = and i1 %244, %245
  %R1712574 = zext i1 %R1712 to i32
  %load_target575 = load double, double* @RadixD2
  %R1714 = call double @floor(double %load_target575)
  %load_target576 = load double, double* @RadixD2
  %R1716 = fcmp oeq double %R1714, %load_target576
  %R1716577 = zext i1 %R1716 to i32
  %246 = icmp ne i32 %R1712574, 0
  %247 = icmp ne i32 %R1716577, 0
  %R1717 = and i1 %246, %247
  %R1717578 = zext i1 %R1717 to i32
  %cond579 = icmp ne i32 %R1717578, 0
  br i1 %cond579, label %L133, label %L144

L133:                                             ; preds = %L132
  %R1719 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.89, i64 0, i64 0))
  %load_target580 = load double, double* @Half
  %load_target581 = load double, double* @U1
  %R1722 = fadd double %load_target580, %load_target581
  %load_target582 = load double, double* @U2
  %R1724 = fmul double %R1722, %load_target582
  store double %R1724, double* @X
  %R1727 = fmul double %load_target580, %load_target582
  store double %R1727, double* @Y
  %load_target583 = load double, double* @One
  %R1730 = fadd double %load_target583, %R1727
  store double %R1730, double* @Z
  %R1733 = fadd double %load_target583, %R1724
  store double %R1733, double* @T
  %R1736 = fsub double %R1730, %load_target583
  %load_target584 = load double, double* @Zero
  %R1738 = fcmp ole double %R1736, %load_target584
  %R1738585 = zext i1 %R1738 to i32
  %R1741 = fsub double %R1733, %load_target583
  %R1743 = fcmp oge double %R1741, %load_target582
  %R1743586 = zext i1 %R1743 to i32
  %248 = icmp ne i32 %R1738585, 0
  %249 = icmp ne i32 %R1743586, 0
  %R1744 = and i1 %248, %249
  %R1744587 = zext i1 %R1744 to i32
  %cond588 = icmp ne i32 %R1744587, 0
  br i1 %cond588, label %L134, label %L144

L134:                                             ; preds = %L133
  %R1747 = fadd double %R1733, %R1727
  store double %R1747, double* @Z
  %R1750 = fsub double %R1747, %R1724
  store double %R1750, double* @Y
  %R1753 = fsub double %R1747, %R1733
  %R1755 = fcmp oge double %R1753, %load_target582
  %R1755589 = zext i1 %R1755 to i32
  %R1758 = fsub double %R1750, %R1733
  %R1760 = fcmp oeq double %R1758, %load_target584
  %R1760590 = zext i1 %R1760 to i32
  %250 = icmp ne i32 %R1755589, 0
  %251 = icmp ne i32 %R1760590, 0
  %R1761 = and i1 %250, %251
  %R1761591 = zext i1 %R1761 to i32
  %cond592 = icmp ne i32 %R1761591, 0
  br i1 %cond592, label %L135, label %L144

L135:                                             ; preds = %L134
  %R1766 = fmul double %R1722, %load_target581
  store double %R1766, double* @X
  %R1769 = fmul double %load_target580, %load_target581
  store double %R1769, double* @Y
  %R1772 = fsub double %load_target583, %R1769
  store double %R1772, double* @Z
  %R1775 = fsub double %load_target583, %R1766
  store double %R1775, double* @T
  %R1778 = fsub double %R1772, %load_target583
  %R1780 = fcmp oeq double %R1778, %load_target584
  %R1780593 = zext i1 %R1780 to i32
  %load_target594 = load double, double* @F9
  %R1783 = fsub double %R1775, %load_target594
  %R1785 = fcmp oeq double %R1783, %load_target584
  %R1785595 = zext i1 %R1785 to i32
  %252 = icmp ne i32 %R1780593, 0
  %253 = icmp ne i32 %R1785595, 0
  %R1786 = and i1 %252, %253
  %R1786596 = zext i1 %R1786 to i32
  %cond597 = icmp ne i32 %R1786596, 0
  br i1 %cond597, label %L136, label %L144

L136:                                             ; preds = %L135
  %R1789 = fsub double %load_target580, %load_target581
  %R1791 = fmul double %R1789, %load_target581
  store double %R1791, double* @Z
  %R1794 = fsub double %load_target594, %R1791
  store double %R1794, double* @T
  %R1797 = fsub double %load_target594, %R1769
  store double %R1797, double* @Q
  %R1800 = fsub double %R1794, %load_target594
  %R1802 = fcmp oeq double %R1800, %load_target584
  %R1802598 = zext i1 %R1802 to i32
  %cond599 = icmp ne i32 %R1802598, 0
  br i1 %cond599, label %L137, label %L144

L137:                                             ; preds = %L136
  %R1805 = fsub double %load_target594, %load_target581
  %R1807 = fsub double %R1805, %R1797
  %R1809 = fcmp oeq double %R1807, %load_target584
  %R1809600 = zext i1 %R1809 to i32
  %cond601 = icmp ne i32 %R1809600, 0
  br i1 %cond601, label %L138, label %L144

L138:                                             ; preds = %L137
  %R1812 = fadd double %load_target583, %load_target582
  %load_target602 = load double, double* @OneAndHalf
  %R1814 = fmul double %R1812, %load_target602
  %R1817 = fadd double %load_target602, %load_target582
  %R1819 = fsub double %R1817, %R1814
  %R1821 = fadd double %R1819, %load_target582
  store double %R1821, double* @T
  %load_target603 = load double, double* @Radix
  %R1825 = fdiv double %load_target580, %load_target603
  %R1826 = fadd double %load_target583, %R1825
  store double %R1826, double* @X
  %R1830 = fmul double %load_target603, %load_target582
  %R1831 = fadd double %load_target583, %R1830
  store double %R1831, double* @Y
  %R1834 = fmul double %R1826, %R1831
  store double %R1834, double* @Z
  %R1837 = fcmp oeq double %R1821, %load_target584
  %R1837604 = zext i1 %R1837 to i32
  %cond605 = icmp ne i32 %R1837604, 0
  br i1 %cond605, label %L139, label %L144

L139:                                             ; preds = %L138
  %R1842 = fadd double %R1826, %R1830
  %R1844 = fsub double %R1842, %R1834
  %R1846 = fcmp oeq double %R1844, %load_target584
  %R1846606 = zext i1 %R1846 to i32
  %cond607 = icmp ne i32 %R1846606, 0
  br i1 %cond607, label %L140, label %L144

L140:                                             ; preds = %L139
  %load_target608 = load double, double* @Two
  %R1849 = fcmp une double %load_target603, %load_target608
  %R1849609 = zext i1 %R1849 to i32
  %cond610 = icmp ne i32 %R1849609, 0
  br i1 %cond610, label %L141, label %L143

L141:                                             ; preds = %L140
  %R1852 = fadd double %load_target608, %load_target582
  store double %R1852, double* @X
  %R1855 = fdiv double %R1852, %load_target608
  store double %R1855, double* @Y
  %R1858 = fsub double %R1855, %load_target583
  %R1860 = fcmp oeq double %R1858, %load_target584
  %R1860611 = zext i1 %R1860 to i32
  %cond612 = icmp ne i32 %R1860611, 0
  br i1 %cond612, label %L142, label %L144

L142:                                             ; preds = %L141
  %load_target613 = load double, double* @S
  store double %load_target613, double* @StickyBit
  br label %L144

L143:                                             ; preds = %L140
  %load_target614 = load double, double* @S
  store double %load_target614, double* @StickyBit
  br label %L144

L144:                                             ; preds = %L143, %L142, %L141, %L139, %L138, %L137, %L136, %L135, %L134, %L133, %L132
  %load_target615 = load double, double* @StickyBit
  %load_target616 = load double, double* @One
  %R1865 = fcmp oeq double %load_target615, %load_target616
  %R1865617 = zext i1 %R1865 to i32
  %cond618 = icmp ne i32 %R1865617, 0
  br i1 %cond618, label %L145, label %L146

L145:                                             ; preds = %L144
  %R1867 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.90, i64 0, i64 0))
  br label %L147

L146:                                             ; preds = %L144
  %R1869 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.91, i64 0, i64 0))
  br label %L147

L147:                                             ; preds = %L146, %L145
  %load_target619 = load i32, i32* @GMult
  %R1871 = icmp eq i32 %load_target619, 0
  %R1871620 = zext i1 %R1871 to i32
  %load_target621 = load i32, i32* @GDiv
  %R1873 = icmp eq i32 %load_target621, 0
  %R1873622 = zext i1 %R1873 to i32
  %254 = icmp ne i32 %R1871620, 0
  %255 = icmp ne i32 %R1873622, 0
  %R1874 = or i1 %254, %255
  %R1874623 = zext i1 %R1874 to i32
  %load_target624 = load i32, i32* @GAddSub
  %R1876 = icmp eq i32 %load_target624, 0
  %R1876625 = zext i1 %R1876 to i32
  %256 = icmp ne i32 %R1874623, 0
  %257 = icmp ne i32 %R1876625, 0
  %R1877 = or i1 %256, %257
  %R1877626 = zext i1 %R1877 to i32
  %load_target627 = load i32, i32* @RMult
  %R1879 = icmp eq i32 %load_target627, 0
  %R1879628 = zext i1 %R1879 to i32
  %258 = icmp ne i32 %R1877626, 0
  %259 = icmp ne i32 %R1879628, 0
  %R1880 = or i1 %258, %259
  %R1880629 = zext i1 %R1880 to i32
  %load_target630 = load i32, i32* @RDiv
  %R1882 = icmp eq i32 %load_target630, 0
  %R1882631 = zext i1 %R1882 to i32
  %260 = icmp ne i32 %R1880629, 0
  %261 = icmp ne i32 %R1882631, 0
  %R1883 = or i1 %260, %261
  %R1883632 = zext i1 %R1883 to i32
  %load_target633 = load i32, i32* @RAddSub
  %R1885 = icmp eq i32 %load_target633, 0
  %R1885634 = zext i1 %R1885 to i32
  %262 = icmp ne i32 %R1883632, 0
  %263 = icmp ne i32 %R1885634, 0
  %R1886 = or i1 %262, %263
  %R1886635 = zext i1 %R1886 to i32
  %R1887 = icmp eq i32 %R1886635, 0
  %R1887636 = zext i1 %R1887 to i32
  call void @TstCond(i32 3, i32 %R1887636, i8* getelementptr inbounds ([122 x i8], [122 x i8]* @.str.92, i64 0, i64 0))
  store i32 60, i32* @Milestone
  %R1890 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.93, i64 0, i64 0))
  %R1892 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.94, i64 0, i64 0))
  %R1894 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.95, i64 0, i64 0), i32 20)
  %R1896 = call double @sqrt(double 3.000000e+00)
  store double %R1896, double* @Random9
  %load_target637 = load double, double* @Third
  store double %load_target637, double* @Random1
  store i32 1, i32* @I
  br label %L148

L148:                                             ; preds = %L148, %L147
  %R1898 = call double @Random()
  store double %R1898, double* @X
  %R1899 = call double @Random()
  store double %R1899, double* @Y
  %load_target638 = load double, double* @X
  %R1902 = fmul double %R1899, %load_target638
  %R1905 = fmul double %load_target638, %R1899
  store double %R1905, double* @Z
  %R1908 = fsub double %R1905, %R1902
  store double %R1908, double* @Z9
  %load_target639 = load i32, i32* @I
  %R1910 = add i32 %load_target639, 1
  store i32 %R1910, i32* @I
  %R1912 = icmp sgt i32 %R1910, 20
  %R1912640 = zext i1 %R1912 to i32
  %load_target641 = load double, double* @Zero
  %R1915 = fcmp une double %R1908, %load_target641
  %R1915642 = zext i1 %R1915 to i32
  %264 = icmp ne i32 %R1912640, 0
  %265 = icmp ne i32 %R1915642, 0
  %R1916 = or i1 %264, %265
  %R1916643 = zext i1 %R1916 to i32
  store double %R1908, double* %23
  %cond644 = icmp ne i32 %R1916643, 0
  br i1 %cond644, label %L149, label %L148

L149:                                             ; preds = %L148
  %R1918 = icmp eq i32 %R1910, 20
  %R1918645 = zext i1 %R1918 to i32
  %cond646 = icmp ne i32 %R1918645, 0
  br i1 %cond646, label %L150, label %L151

L150:                                             ; preds = %L149
  %load_target647 = load double, double* @One
  %load_target648 = load double, double* @Half
  %load_target649 = load double, double* @Three
  %R1922 = fdiv double %load_target648, %load_target649
  %R1923 = fadd double %load_target647, %R1922
  store double %R1923, double* @Random1
  %load_target650 = load double, double* @U2
  %load_target651 = load double, double* @U1
  %R1926 = fadd double %load_target650, %load_target651
  %R1928 = fadd double %R1926, %load_target647
  store double %R1928, double* @Random2
  %R1931 = fmul double %R1923, %R1928
  store double %R1931, double* @Z
  %R1934 = fmul double %R1928, %R1923
  store double %R1934, double* @Y
  %R1957 = fsub double %R1931, %R1931
  store double %R1957, double* @Z9
  store double %R1957, double* %23
  br label %L151

L151:                                             ; preds = %L150, %L149
  %266 = load double, double* %23
  %R1962 = fcmp oeq double %266, %load_target641
  %R1962652 = zext i1 %R1962 to i32
  %267 = icmp ne i32 %R1918645, 0
  %268 = icmp ne i32 %R1962652, 0
  %R1963 = or i1 %267, %268
  %R1963653 = zext i1 %R1963 to i32
  %cond654 = icmp ne i32 %R1963653, 0
  br i1 %cond654, label %L153, label %L152

L152:                                             ; preds = %L151
  call void @BadCond(i32 2, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.96, i64 0, i64 0))
  br label %L154

L153:                                             ; preds = %L151
  %R1966 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.97, i64 0, i64 0), i32 20)
  br label %L154

L154:                                             ; preds = %L153, %L152
  store i32 70, i32* @Milestone
  %R1968 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.98, i64 0, i64 0))
  %load_target655 = load double, double* @Zero
  %R1971 = call double @sqrt(double %load_target655)
  %R1972 = fcmp oeq double %load_target655, %R1971
  %R1972656 = zext i1 %R1972 to i32
  %cond657 = icmp ne i32 %R1972656, 0
  br i1 %cond657, label %L155, label %L157

L155:                                             ; preds = %L154
  %load_target658 = load double, double* @Zero
  %R1974 = fsub double -0.000000e+00, %load_target658
  %R1977 = call double @sqrt(double %R1974)
  %R1978 = fcmp oeq double %R1974, %R1977
  %R1978659 = zext i1 %R1978 to i32
  %cond660 = icmp ne i32 %R1978659, 0
  br i1 %cond660, label %L156, label %L157

L156:                                             ; preds = %L155
  %load_target661 = load double, double* @One
  %R1981 = call double @sqrt(double %load_target661)
  %R1982 = fcmp oeq double %load_target661, %R1981
  %R1982662 = zext i1 %R1982 to i32
  store i32 %R1982662, i32* %24
  br label %L158

L157:                                             ; preds = %L155, %L154
  store i32 0, i32* %24
  br label %L158

L158:                                             ; preds = %L157, %L156
  %269 = load i32, i32* %24
  call void @TstCond(i32 0, i32 %269, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.99, i64 0, i64 0))
  %load_target663 = load double, double* @Zero
  store double %load_target663, double* @MinSqEr
  store double %load_target663, double* @MaxSqEr
  store double %load_target663, double* @J
  %load_target664 = load double, double* @Radix
  store double %load_target664, double* @X
  %load_target665 = load double, double* @U2
  store double %load_target665, double* @OneUlp
  call void @SqXMinX(i32 1)
  %load_target666 = load double, double* @BInvrse
  store double %load_target666, double* @X
  %load_target667 = load double, double* @U1
  %R1993 = fmul double %load_target666, %load_target667
  store double %R1993, double* @OneUlp
  call void @SqXMinX(i32 1)
  %load_target668 = load double, double* @U1
  store double %load_target668, double* @X
  %R1997 = fmul double %load_target668, %load_target668
  store double %R1997, double* @OneUlp
  call void @SqXMinX(i32 1)
  %load_target669 = load double, double* @J
  %load_target670 = load double, double* @Zero
  %R2000 = fcmp une double %load_target669, %load_target670
  %R2000671 = zext i1 %R2000 to i32
  %cond672 = icmp ne i32 %R2000671, 0
  br i1 %cond672, label %L159, label %L160

L159:                                             ; preds = %L158
  call void @Pause()
  br label %L160

L160:                                             ; preds = %L159, %L158
  %R2002 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.100, i64 0, i64 0), i32 20)
  %load_target673 = load double, double* @Zero
  store double %load_target673, double* @J
  %load_target674 = load double, double* @Two
  store double %load_target674, double* @X
  %load_target675 = load double, double* @Radix
  store double %load_target675, double* @Y
  %load_target676 = load double, double* @One
  %R2008 = fcmp une double %load_target675, %load_target676
  %R2008677 = zext i1 %R2008 to i32
  store double %load_target675, double* %25
  store double %load_target674, double* %26
  %cond678 = icmp ne i32 %R2008677, 0
  br i1 %cond678, label %L161, label %L162

L161:                                             ; preds = %L161, %L160
  %270 = load double, double* %25
  store double %270, double* @X
  %R2012 = fmul double %load_target675, %270
  store double %R2012, double* @Y
  store double %R2012, double* %25
  %R2015 = fsub double %R2012, %270
  %R2017 = fcmp oge double %R2015, 2.000000e+01
  %R2017679 = zext i1 %R2017 to i32
  store double %270, double* %26
  %cond680 = icmp ne i32 %R2017679, 0
  br i1 %cond680, label %L162, label %L161

L162:                                             ; preds = %L161, %L160
  %271 = load double, double* %26
  %load_target681 = load double, double* @U2
  %R2020 = fmul double %271, %load_target681
  store double %R2020, double* @OneUlp
  store i32 1, i32* @I
  store i32 1, i32* %27
  br label %L163

L163:                                             ; preds = %L165, %L162
  %272 = load i32, i32* %27
  %R2022 = icmp sle i32 %272, 20
  %R2022682 = zext i1 %R2022 to i32
  %cond683 = icmp ne i32 %R2022682, 0
  br i1 %cond683, label %L164, label %L166

L164:                                             ; preds = %L163
  %load_target684 = load double, double* @X
  %load_target685 = load double, double* @One
  %R2025 = fadd double %load_target684, %load_target685
  store double %R2025, double* @X
  call void @SqXMinX(i32 2)
  %load_target686 = load double, double* @J
  %load_target687 = load double, double* @Zero
  %R2028 = fcmp ogt double %load_target686, %load_target687
  %R2028688 = zext i1 %R2028 to i32
  %cond689 = icmp ne i32 %R2028688, 0
  br i1 %cond689, label %L166, label %L165

L165:                                             ; preds = %L164
  %load_target690 = load i32, i32* @I
  %R2030 = add i32 %load_target690, 1
  store i32 %R2030, i32* @I
  store i32 %R2030, i32* %27
  br label %L163

L166:                                             ; preds = %L164, %L163
  %R2032 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.101, i64 0, i64 0))
  store i32 -1, i32* @I
  %load_target691 = load double, double* @BMinusU2
  store double %load_target691, double* @X
  %load_target692 = load double, double* @Radix
  store double %load_target692, double* @Y
  %load_target693 = load double, double* @U2
  %R2038 = fmul double %load_target692, %load_target693
  %R2039 = fadd double %load_target692, %R2038
  store double %R2039, double* @Z
  store i32 0, i32* @NotMonot
  store i32 0, i32* @Monot
  br label %L167

L167:                                             ; preds = %L176, %L175, %L174, %L171, %L169, %L166
  %load_target694 = load i32, i32* @NotMonot
  %load_target695 = load i32, i32* @Monot
  %273 = icmp ne i32 %load_target694, 0
  %274 = icmp ne i32 %load_target695, 0
  %R2042 = or i1 %273, %274
  %R2042696 = zext i1 %R2042 to i32
  %cond697 = icmp ne i32 %R2042696, 0
  br i1 %cond697, label %L177, label %L168

L168:                                             ; preds = %L167
  %load_target698 = load i32, i32* @I
  %R2044 = add i32 %load_target698, 1
  store i32 %R2044, i32* @I
  %load_target699 = load double, double* @X
  %R2046 = call double @sqrt(double %load_target699)
  store double %R2046, double* @X
  %load_target700 = load double, double* @Y
  %R2048 = call double @sqrt(double %load_target700)
  store double %R2048, double* @Q
  %load_target701 = load double, double* @Z
  %R2050 = call double @sqrt(double %load_target701)
  store double %R2050, double* @Z
  %load_target702 = load double, double* @X
  %load_target703 = load double, double* @Q
  %R2053 = fcmp ogt double %load_target702, %load_target703
  %R2053704 = zext i1 %R2053 to i32
  %R2056 = fcmp ogt double %load_target703, %R2050
  %R2056705 = zext i1 %R2056 to i32
  %275 = icmp ne i32 %R2053704, 0
  %276 = icmp ne i32 %R2056705, 0
  %R2057 = or i1 %275, %276
  %R2057706 = zext i1 %R2057 to i32
  %cond707 = icmp ne i32 %R2057706, 0
  br i1 %cond707, label %L169, label %L170

L169:                                             ; preds = %L168
  store i32 1, i32* @NotMonot
  br label %L167

L170:                                             ; preds = %L168
  %load_target708 = load double, double* @Half
  %R2060 = fadd double %load_target703, %load_target708
  %R2061 = call double @floor(double %R2060)
  store double %R2061, double* @Q
  %load_target709 = load i32, i32* @I
  %R2063 = icmp sgt i32 %load_target709, 0
  %R2063710 = zext i1 %R2063 to i32
  %load_target711 = load double, double* @Radix
  %R2067 = fmul double %R2061, %R2061
  %R2068 = fcmp oeq double %load_target711, %R2067
  %R2068712 = zext i1 %R2068 to i32
  %277 = icmp ne i32 %R2063710, 0
  %278 = icmp ne i32 %R2068712, 0
  %R2069 = or i1 %277, %278
  %R2069713 = zext i1 %R2069 to i32
  %cond714 = icmp ne i32 %R2069713, 0
  br i1 %cond714, label %L172, label %L171

L171:                                             ; preds = %L170
  store i32 1, i32* @Monot
  br label %L167

L172:                                             ; preds = %L170
  %cond715 = icmp ne i32 %R2063710, 0
  br i1 %cond715, label %L173, label %L176

L173:                                             ; preds = %L172
  %R2073 = icmp sgt i32 %load_target709, 1
  %R2073716 = zext i1 %R2073 to i32
  %cond717 = icmp ne i32 %R2073716, 0
  br i1 %cond717, label %L174, label %L175

L174:                                             ; preds = %L173
  store i32 1, i32* @Monot
  br label %L167

L175:                                             ; preds = %L173
  %load_target718 = load double, double* @Y
  %load_target719 = load double, double* @BInvrse
  %R2076 = fmul double %load_target718, %load_target719
  store double %R2076, double* @Y
  %load_target720 = load double, double* @U1
  %R2079 = fsub double %R2076, %load_target720
  store double %R2079, double* @X
  %R2082 = fadd double %R2076, %load_target720
  store double %R2082, double* @Z
  br label %L167

L176:                                             ; preds = %L172
  store double %R2061, double* @Y
  %load_target721 = load double, double* @U2
  %R2086 = fsub double %R2061, %load_target721
  store double %R2086, double* @X
  %R2089 = fadd double %R2061, %load_target721
  store double %R2089, double* @Z
  br label %L167

L177:                                             ; preds = %L167
  %cond722 = icmp ne i32 %load_target695, 0
  br i1 %cond722, label %L178, label %L179

L178:                                             ; preds = %L177
  %R2092 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.102, i64 0, i64 0))
  br label %L180

L179:                                             ; preds = %L177
  call void @BadCond(i32 2, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.103, i64 0, i64 0))
  %load_target723 = load double, double* @Y
  %R2096 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.104, i64 0, i64 0), double %load_target723)
  br label %L180

L180:                                             ; preds = %L179, %L178
  store i32 80, i32* @Milestone
  %load_target724 = load double, double* @MinSqEr
  %load_target725 = load double, double* @Half
  %R2099 = fadd double %load_target724, %load_target725
  store double %R2099, double* @MinSqEr
  %load_target726 = load double, double* @MaxSqEr
  %R2102 = fsub double %load_target726, %load_target725
  store double %R2102, double* @MaxSqEr
  %load_target727 = load double, double* @One
  %load_target728 = load double, double* @U2
  %R2105 = fadd double %load_target727, %load_target728
  %R2106 = call double @sqrt(double %R2105)
  %load_target729 = load double, double* @One
  %R2108 = fsub double %R2106, %load_target729
  %load_target730 = load double, double* @U2
  %R2110 = fdiv double %R2108, %load_target730
  store double %R2110, double* @Y
  %R2113 = fsub double %R2110, %load_target729
  %load_target731 = load double, double* @Eight
  %R2116 = fdiv double %load_target730, %load_target731
  %R2117 = fadd double %R2113, %R2116
  store double %R2117, double* @SqEr
  %load_target732 = load double, double* @MaxSqEr
  %R2120 = fcmp ogt double %R2117, %load_target732
  %R2120733 = zext i1 %R2120 to i32
  %cond734 = icmp ne i32 %R2120733, 0
  br i1 %cond734, label %L181, label %L182

L181:                                             ; preds = %L180
  store double %R2117, double* @MaxSqEr
  br label %L182

L182:                                             ; preds = %L181, %L180
  %R2126 = fadd double %R2110, %R2116
  store double %R2126, double* @SqEr
  %load_target735 = load double, double* @MinSqEr
  %R2129 = fcmp olt double %R2126, %load_target735
  %R2129736 = zext i1 %R2129 to i32
  %cond737 = icmp ne i32 %R2129736, 0
  br i1 %cond737, label %L183, label %L184

L183:                                             ; preds = %L182
  store double %R2126, double* @MinSqEr
  br label %L184

L184:                                             ; preds = %L183, %L182
  %load_target738 = load double, double* @F9
  %R2132 = call double @sqrt(double %load_target738)
  %load_target739 = load double, double* @U2
  %R2134 = fsub double %R2132, %load_target739
  %load_target740 = load double, double* @One
  %R2137 = fsub double %load_target740, %load_target739
  %R2138 = fsub double %R2134, %R2137
  %load_target741 = load double, double* @U1
  %R2140 = fdiv double %R2138, %load_target741
  store double %R2140, double* @Y
  %load_target742 = load double, double* @Eight
  %R2144 = fdiv double %load_target741, %load_target742
  %R2145 = fadd double %R2140, %R2144
  store double %R2145, double* @SqEr
  %load_target743 = load double, double* @MaxSqEr
  %R2148 = fcmp ogt double %R2145, %load_target743
  %R2148744 = zext i1 %R2148 to i32
  %cond745 = icmp ne i32 %R2148744, 0
  br i1 %cond745, label %L185, label %L186

L185:                                             ; preds = %L184
  store double %R2145, double* @MaxSqEr
  br label %L186

L186:                                             ; preds = %L185, %L184
  %R2152 = fadd double %R2140, %load_target740
  %R2156 = fadd double %R2152, %R2144
  store double %R2156, double* @SqEr
  %load_target746 = load double, double* @MinSqEr
  %R2159 = fcmp olt double %R2156, %load_target746
  %R2159747 = zext i1 %R2159 to i32
  %cond748 = icmp ne i32 %R2159747, 0
  br i1 %cond748, label %L187, label %L188

L187:                                             ; preds = %L186
  store double %R2156, double* @MinSqEr
  br label %L188

L188:                                             ; preds = %L187, %L186
  store double %load_target739, double* @OneUlp
  store double %load_target739, double* @X
  store i32 1, i32* @Indx
  store double %load_target739, double* %29
  store i32 1, i32* %28
  br label %L189

L189:                                             ; preds = %L197, %L188
  %279 = load i32, i32* %28
  %R2164 = icmp sle i32 %279, 3
  %R2164749 = zext i1 %R2164 to i32
  %cond750 = icmp ne i32 %R2164749, 0
  br i1 %cond750, label %L190, label %L198

L190:                                             ; preds = %L189
  %280 = load double, double* %29
  %load_target751 = load double, double* @U1
  %R2167 = fadd double %280, %load_target751
  %R2169 = fadd double %R2167, %280
  %load_target752 = load double, double* @F9
  %R2171 = fadd double %R2169, %load_target752
  %R2172 = call double @sqrt(double %R2171)
  %load_target753 = load double, double* @U2
  %R2175 = fsub double %R2172, %load_target753
  %load_target754 = load double, double* @One
  %R2178 = fsub double %load_target754, %load_target753
  %load_target755 = load double, double* @X
  %R2180 = fadd double %R2178, %load_target755
  %R2181 = fsub double %R2175, %R2180
  %load_target756 = load double, double* @OneUlp
  %R2183 = fdiv double %R2181, %load_target756
  store double %R2183, double* @Y
  %load_target757 = load double, double* @U1
  %R2186 = fsub double %load_target757, %load_target755
  %load_target758 = load double, double* @F9
  %R2188 = fadd double %R2186, %load_target758
  %load_target759 = load double, double* @Half
  %R2190 = fmul double %R2188, %load_target759
  %R2192 = fmul double %R2190, %load_target755
  %R2194 = fmul double %R2192, %load_target755
  %R2196 = fdiv double %R2194, %load_target756
  store double %R2196, double* @Z
  %R2199 = fadd double %R2183, %load_target759
  %R2201 = fadd double %R2199, %R2196
  store double %R2201, double* @SqEr
  %load_target760 = load double, double* @MinSqEr
  %R2204 = fcmp olt double %R2201, %load_target760
  %R2204761 = zext i1 %R2204 to i32
  %cond762 = icmp ne i32 %R2204761, 0
  br i1 %cond762, label %L191, label %L192

L191:                                             ; preds = %L190
  store double %R2201, double* @MinSqEr
  br label %L192

L192:                                             ; preds = %L191, %L190
  %R2208 = fsub double %R2183, %load_target759
  %R2210 = fadd double %R2208, %R2196
  store double %R2210, double* @SqEr
  %load_target763 = load double, double* @MaxSqEr
  %R2213 = fcmp ogt double %R2210, %load_target763
  %R2213764 = zext i1 %R2213 to i32
  %cond765 = icmp ne i32 %R2213764, 0
  br i1 %cond765, label %L193, label %L194

L193:                                             ; preds = %L192
  store double %R2210, double* @MaxSqEr
  br label %L194

L194:                                             ; preds = %L193, %L192
  %load_target766 = load i32, i32* @Indx
  %R2216 = icmp eq i32 %load_target766, 1
  %R2216767 = zext i1 %R2216 to i32
  %R2218 = icmp eq i32 %load_target766, 3
  %R2218768 = zext i1 %R2218 to i32
  %281 = icmp ne i32 %R2216767, 0
  %282 = icmp ne i32 %R2218768, 0
  %R2219 = or i1 %281, %282
  %R2219769 = zext i1 %R2219 to i32
  %cond770 = icmp ne i32 %R2219769, 0
  br i1 %cond770, label %L195, label %L196

L195:                                             ; preds = %L194
  %R2222 = call double @Sign(double %load_target755)
  %R2223 = fmul double %load_target756, %R2222
  %load_target771 = load double, double* @Eight
  %load_target772 = load double, double* @Nine
  %load_target773 = load double, double* @OneUlp
  %R2227 = call double @sqrt(double %load_target773)
  %R2228 = fmul double %load_target772, %R2227
  %R2229 = fdiv double %load_target771, %R2228
  %R2230 = call double @floor(double %R2229)
  %R2231 = fmul double %R2223, %R2230
  store double %R2231, double* @X
  store double %R2231, double* %29
  br label %L197

L196:                                             ; preds = %L194
  store double %load_target757, double* @OneUlp
  %R2234 = fsub double -0.000000e+00, %load_target757
  store double %R2234, double* @X
  store double %R2234, double* %29
  br label %L197

L197:                                             ; preds = %L196, %L195
  %load_target774 = load i32, i32* @Indx
  %R2236 = add i32 %load_target774, 1
  store i32 %R2236, i32* @Indx
  store i32 %R2236, i32* %28
  br label %L189

L198:                                             ; preds = %L189
  store i32 85, i32* @Milestone
  store i32 0, i32* @SqRWrng
  store i32 0, i32* @Anomaly
  store i32 0, i32* @RSqrt
  %load_target775 = load double, double* @Radix
  %load_target776 = load double, double* @One
  %R2239 = fcmp une double %load_target775, %load_target776
  %R2239777 = zext i1 %R2239 to i32
  %cond778 = icmp ne i32 %R2239777, 0
  br i1 %cond778, label %L199, label %L230

L199:                                             ; preds = %L198
  %R2241 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.105, i64 0, i64 0))
  %load_target779 = load double, double* @Half
  %load_target780 = load double, double* @Radix
  %load_target781 = load double, double* @One
  %load_target782 = load double, double* @Precision
  %R2246 = fadd double %load_target781, %load_target782
  %R2248 = call double @floor(double %load_target782)
  %R2249 = fsub double %R2246, %R2248
  %R2250 = call double @pow(double %load_target780, double %R2249)
  %R2251 = fadd double %load_target779, %R2250
  %R2252 = call double @floor(double %R2251)
  store double %R2252, double* @D
  %load_target783 = load double, double* @Radix
  %R2255 = fdiv double %R2252, %load_target783
  store double %R2255, double* @X
  %load_target784 = load double, double* @A1
  %R2258 = fdiv double %R2252, %load_target784
  store double %R2258, double* @Y
  %R2261 = call double @floor(double %R2255)
  %R2262 = fcmp une double %R2255, %R2261
  %R2262785 = zext i1 %R2262 to i32
  %load_target786 = load double, double* @Y
  %R2265 = call double @floor(double %load_target786)
  %R2266 = fcmp une double %load_target786, %R2265
  %R2266787 = zext i1 %R2266 to i32
  %283 = icmp ne i32 %R2262785, 0
  %284 = icmp ne i32 %R2266787, 0
  %R2267 = or i1 %283, %284
  %R2267788 = zext i1 %R2267 to i32
  %cond789 = icmp ne i32 %R2267788, 0
  br i1 %cond789, label %L200, label %L201

L200:                                             ; preds = %L199
  store i32 1, i32* @Anomaly
  br label %L228

L201:                                             ; preds = %L199
  %load_target790 = load double, double* @Zero
  store double %load_target790, double* @X
  store double %load_target790, double* @Z2
  %load_target791 = load double, double* @One
  store double %load_target791, double* @Y
  store double %load_target791, double* @Y2
  %load_target792 = load double, double* @Radix
  %R2274 = fsub double %load_target792, %load_target791
  store double %R2274, double* @Z1
  %load_target793 = load double, double* @Four
  %load_target794 = load double, double* @D
  %R2277 = fmul double %load_target793, %load_target794
  store double %R2277, double* @FourD
  store double %load_target791, double* %31
  store double %load_target791, double* %30
  br label %L202

L202:                                             ; preds = %L209, %L201
  %285 = load double, double* %30
  %load_target795 = load double, double* @Z2
  %R2280 = fcmp ogt double %285, %load_target795
  %R2280796 = zext i1 %R2280 to i32
  %cond797 = icmp ne i32 %R2280796, 0
  br i1 %cond797, label %L203, label %L207

L203:                                             ; preds = %L202
  %load_target798 = load double, double* @Radix
  store double %load_target798, double* @Q
  %286 = load double, double* %31
  store double %286, double* @Y1
  store double %286, double* %33
  store double %load_target798, double* %32
  br label %L204

L204:                                             ; preds = %L204, %L203
  %287 = load double, double* %32
  %load_target799 = load double, double* @Half
  %288 = load double, double* %33
  %R2287 = fdiv double %287, %288
  %R2288 = fsub double %load_target799, %R2287
  %R2289 = call double @floor(double %R2288)
  %load_target800 = load double, double* @Y1
  %R2291 = fmul double %R2289, %load_target800
  %R2292 = fadd double %287, %R2291
  %R2293 = call double @fabs(double %R2292)
  store double %R2293, double* @X1
  %load_target801 = load double, double* @Y1
  store double %load_target801, double* @Q
  store double %R2293, double* @Y1
  store double %R2293, double* %33
  store double %load_target801, double* %32
  %load_target802 = load double, double* @Zero
  %R2298 = fcmp ole double %R2293, %load_target802
  %R2298803 = zext i1 %R2298 to i32
  %cond804 = icmp ne i32 %R2298803, 0
  br i1 %cond804, label %L205, label %L204

L205:                                             ; preds = %L204
  %load_target805 = load double, double* @One
  %R2301 = fcmp ole double %load_target801, %load_target805
  %R2301806 = zext i1 %R2301 to i32
  %cond807 = icmp ne i32 %R2301806, 0
  br i1 %cond807, label %L206, label %L207

L206:                                             ; preds = %L205
  %load_target808 = load double, double* @Y2
  store double %load_target808, double* @Z2
  %load_target809 = load double, double* @Y
  store double %load_target809, double* @Z
  br label %L207

L207:                                             ; preds = %L206, %L205, %L202
  %load_target810 = load double, double* @Y
  %load_target811 = load double, double* @Two
  %R2306 = fadd double %load_target810, %load_target811
  store double %R2306, double* @Y
  %load_target812 = load double, double* @X
  %load_target813 = load double, double* @Eight
  %R2309 = fadd double %load_target812, %load_target813
  store double %R2309, double* @X
  %load_target814 = load double, double* @Y2
  %R2312 = fadd double %load_target814, %R2309
  store double %R2312, double* @Y2
  %load_target815 = load double, double* @FourD
  %R2315 = fcmp oge double %R2312, %load_target815
  %R2315816 = zext i1 %R2315 to i32
  store double %R2306, double* %31
  store double %R2312, double* %30
  store double %load_target815, double* %34
  %cond817 = icmp ne i32 %R2315816, 0
  br i1 %cond817, label %L208, label %L209

L208:                                             ; preds = %L207
  %R2318 = fsub double %R2312, %load_target815
  store double %R2318, double* @Y2
  store double %R2318, double* %30
  store double %load_target815, double* %34
  br label %L209

L209:                                             ; preds = %L208, %L207
  %load_target818 = load double, double* @D
  %R2321 = fcmp oge double %R2306, %load_target818
  %R2321819 = zext i1 %R2321 to i32
  %cond820 = icmp ne i32 %R2321819, 0
  br i1 %cond820, label %L210, label %L202

L210:                                             ; preds = %L209
  %289 = load double, double* %34
  %load_target821 = load double, double* @Z2
  %R2324 = fsub double %289, %load_target821
  %load_target822 = load double, double* @Z
  %R2328 = fmul double %load_target822, %load_target822
  %R2329 = fadd double %R2324, %R2328
  %R2331 = fdiv double %R2329, %289
  store double %R2331, double* @Q
  %R2334 = fdiv double %R2324, %load_target813
  store double %R2334, double* @X8
  %R2337 = call double @floor(double %R2331)
  %R2338 = fcmp une double %R2331, %R2337
  %R2338823 = zext i1 %R2338 to i32
  %cond824 = icmp ne i32 %R2338823, 0
  br i1 %cond824, label %L211, label %L212

L211:                                             ; preds = %L210
  store i32 1, i32* @Anomaly
  br label %L228

L212:                                             ; preds = %L210
  store i32 0, i32* @Break
  br label %L213

L213:                                             ; preds = %L216, %L212
  %load_target825 = load double, double* @Z1
  %load_target826 = load double, double* @Z
  %R2341 = fmul double %load_target825, %load_target826
  store double %R2341, double* @X
  %load_target827 = load double, double* @Radix
  %R2345 = fdiv double %R2341, %load_target827
  %R2346 = call double @floor(double %R2345)
  %load_target828 = load double, double* @Radix
  %R2348 = fmul double %R2346, %load_target828
  %R2349 = fsub double %R2341, %R2348
  store double %R2349, double* @X
  %load_target829 = load double, double* @One
  %R2352 = fcmp oeq double %R2349, %load_target829
  %R2352830 = zext i1 %R2352 to i32
  %cond831 = icmp ne i32 %R2352830, 0
  br i1 %cond831, label %L214, label %L215

L214:                                             ; preds = %L213
  store i32 1, i32* @Break
  br label %L216

L215:                                             ; preds = %L213
  %load_target832 = load double, double* @Z1
  %R2355 = fsub double %load_target832, %load_target829
  store double %R2355, double* @Z1
  br label %L216

L216:                                             ; preds = %L215, %L214
  %load_target833 = load i32, i32* @Break
  %load_target834 = load double, double* @Z1
  %load_target835 = load double, double* @Zero
  %R2359 = fcmp ole double %load_target834, %load_target835
  %R2359836 = zext i1 %R2359 to i32
  %290 = icmp ne i32 %load_target833, 0
  %291 = icmp ne i32 %R2359836, 0
  %R2360 = or i1 %290, %291
  %R2360837 = zext i1 %R2360 to i32
  %cond838 = icmp ne i32 %R2360837, 0
  br i1 %cond838, label %L217, label %L213

L217:                                             ; preds = %L216
  %R2365 = icmp eq i32 %load_target833, 0
  %R2365839 = zext i1 %R2365 to i32
  %292 = icmp ne i32 %R2359836, 0
  %293 = icmp ne i32 %R2365839, 0
  %R2366 = and i1 %292, %293
  %R2366840 = zext i1 %R2366 to i32
  %cond841 = icmp ne i32 %R2366840, 0
  br i1 %cond841, label %L218, label %L219

L218:                                             ; preds = %L217
  store i32 1, i32* @Anomaly
  br label %L228

L219:                                             ; preds = %L217
  %load_target842 = load double, double* @RadixD2
  %R2369 = fcmp ogt double %load_target834, %load_target842
  %R2369843 = zext i1 %R2369 to i32
  %cond844 = icmp ne i32 %R2369843, 0
  br i1 %cond844, label %L220, label %L221

L220:                                             ; preds = %L219
  %R2372 = fsub double %load_target834, %load_target828
  store double %R2372, double* @Z1
  br label %L221

L221:                                             ; preds = %L221, %L220, %L219
  call void @NewD()
  %load_target845 = load double, double* @U2
  %load_target846 = load double, double* @D
  %R2375 = fmul double %load_target845, %load_target846
  %load_target847 = load double, double* @F9
  %R2377 = fcmp oge double %R2375, %load_target847
  %R2377848 = zext i1 %R2377 to i32
  %cond849 = icmp ne i32 %R2377848, 0
  br i1 %cond849, label %L222, label %L221

L222:                                             ; preds = %L221
  %load_target850 = load double, double* @Radix
  %R2380 = fmul double %load_target846, %load_target850
  %R2382 = fsub double %R2380, %load_target846
  %load_target851 = load double, double* @W
  %R2385 = fsub double %load_target851, %load_target846
  %R2386 = fcmp une double %R2382, %R2385
  %R2386852 = zext i1 %R2386 to i32
  %cond853 = icmp ne i32 %R2386852, 0
  br i1 %cond853, label %L223, label %L224

L223:                                             ; preds = %L222
  store i32 1, i32* @Anomaly
  br label %L228

L224:                                             ; preds = %L222
  store double %load_target846, double* @Z2
  store i32 0, i32* @I
  %load_target854 = load double, double* @One
  %load_target855 = load double, double* @Z
  %R2391 = fadd double %load_target854, %load_target855
  %load_target856 = load double, double* @Half
  %R2393 = fmul double %R2391, %load_target856
  %R2394 = fadd double %load_target846, %R2393
  store double %R2394, double* @Y
  %R2397 = fadd double %load_target846, %load_target855
  %load_target857 = load double, double* @Q
  %R2399 = fadd double %R2397, %load_target857
  store double %R2399, double* @X
  call void @SR3750()
  %load_target858 = load double, double* @D
  %load_target859 = load double, double* @One
  %load_target860 = load double, double* @Z
  %R2403 = fsub double %load_target859, %load_target860
  %load_target861 = load double, double* @Half
  %R2405 = fmul double %R2403, %load_target861
  %R2406 = fadd double %load_target858, %R2405
  %R2408 = fadd double %R2406, %load_target858
  store double %R2408, double* @Y
  %R2411 = fsub double %load_target858, %load_target860
  %R2413 = fadd double %R2411, %load_target858
  %load_target862 = load double, double* @Q
  %R2416 = fadd double %R2413, %load_target862
  %R2418 = fadd double %R2416, %R2413
  store double %R2418, double* @X
  call void @SR3750()
  call void @NewD()
  %load_target863 = load double, double* @D
  %load_target864 = load double, double* @Z2
  %R2421 = fsub double %load_target863, %load_target864
  %load_target865 = load double, double* @W
  %R2424 = fsub double %load_target865, %load_target864
  %R2425 = fcmp une double %R2421, %R2424
  %R2425866 = zext i1 %R2425 to i32
  %cond867 = icmp ne i32 %R2425866, 0
  br i1 %cond867, label %L225, label %L226

L225:                                             ; preds = %L224
  store i32 1, i32* @Anomaly
  br label %L228

L226:                                             ; preds = %L224
  %load_target868 = load double, double* @One
  %load_target869 = load double, double* @Z
  %R2432 = fsub double %load_target868, %load_target869
  %load_target870 = load double, double* @Half
  %R2434 = fmul double %R2432, %load_target870
  %R2435 = fadd double %load_target864, %R2434
  %R2436 = fadd double %R2421, %R2435
  store double %R2436, double* @Y
  %R2442 = fsub double %load_target864, %load_target869
  %load_target871 = load double, double* @Q
  %R2444 = fadd double %R2442, %load_target871
  %R2445 = fadd double %R2421, %R2444
  store double %R2445, double* @X
  call void @SR3750()
  %load_target872 = load double, double* @One
  %load_target873 = load double, double* @Z
  %R2448 = fadd double %load_target872, %load_target873
  %load_target874 = load double, double* @Half
  %R2450 = fmul double %R2448, %load_target874
  store double %R2450, double* @Y
  %load_target875 = load double, double* @Q
  store double %load_target875, double* @X
  call void @SR3750()
  %load_target876 = load i32, i32* @I
  %cond877 = icmp ne i32 %load_target876, 0
  br i1 %cond877, label %L228, label %L227

L227:                                             ; preds = %L226
  store i32 1, i32* @Anomaly
  br label %L228

L228:                                             ; preds = %L227, %L226, %L225, %L223, %L218, %L211, %L200
  %load_target878 = load i32, i32* @I
  %R2455 = icmp eq i32 %load_target878, 0
  %R2455879 = zext i1 %R2455 to i32
  %load_target880 = load i32, i32* @Anomaly
  %294 = icmp ne i32 %R2455879, 0
  %295 = icmp ne i32 %load_target880, 0
  %R2457 = or i1 %294, %295
  %R2457881 = zext i1 %R2457 to i32
  %cond882 = icmp ne i32 %R2457881, 0
  br i1 %cond882, label %L229, label %L230

L229:                                             ; preds = %L228
  call void @BadCond(i32 0, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.106, i64 0, i64 0))
  %load_target883 = load double, double* @W
  %R2461 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.107, i64 0, i64 0), double %load_target883)
  %R2463 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.108, i64 0, i64 0))
  store i32 1, i32* @SqRWrng
  br label %L230

L230:                                             ; preds = %L229, %L228, %L198
  %load_target884 = load i32, i32* @Anomaly
  %cond885 = icmp ne i32 %load_target884, 0
  br i1 %cond885, label %L236, label %L231

L231:                                             ; preds = %L230
  %load_target886 = load double, double* @MinSqEr
  %load_target887 = load double, double* @Zero
  %R2467 = fcmp olt double %load_target886, %load_target887
  %R2467888 = zext i1 %R2467 to i32
  %load_target889 = load double, double* @MaxSqEr
  %R2470 = fcmp ogt double %load_target889, %load_target887
  %R2470890 = zext i1 %R2470 to i32
  %296 = icmp ne i32 %R2467888, 0
  %297 = icmp ne i32 %R2470890, 0
  %R2471 = or i1 %296, %297
  %R2471891 = zext i1 %R2471 to i32
  %cond892 = icmp ne i32 %R2471891, 0
  br i1 %cond892, label %L233, label %L232

L232:                                             ; preds = %L231
  store i32 1, i32* @RSqrt
  %R2473 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.109, i64 0, i64 0))
  br label %L236

L233:                                             ; preds = %L231
  %load_target893 = load double, double* @U2
  %R2476 = fadd double %load_target889, %load_target893
  %load_target894 = load double, double* @Half
  %R2479 = fsub double %load_target893, %load_target894
  %R2480 = fcmp ogt double %R2476, %R2479
  %R2480895 = zext i1 %R2480 to i32
  %R2483 = fcmp ogt double %load_target886, %load_target894
  %R2483896 = zext i1 %R2483 to i32
  %298 = icmp ne i32 %R2480895, 0
  %299 = icmp ne i32 %R2483896, 0
  %R2484 = or i1 %298, %299
  %R2484897 = zext i1 %R2484 to i32
  %load_target898 = load double, double* @Radix
  %R2487 = fadd double %load_target886, %load_target898
  %R2489 = fcmp olt double %R2487, %load_target894
  %R2489899 = zext i1 %R2489 to i32
  %300 = icmp ne i32 %R2484897, 0
  %301 = icmp ne i32 %R2489899, 0
  %R2490 = or i1 %300, %301
  %R2490900 = zext i1 %R2490 to i32
  %cond901 = icmp ne i32 %R2490900, 0
  br i1 %cond901, label %L234, label %L235

L234:                                             ; preds = %L233
  store i32 1, i32* @SqRWrng
  br label %L236

L235:                                             ; preds = %L233
  store i32 2, i32* @RSqrt
  %R2492 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.110, i64 0, i64 0))
  br label %L236

L236:                                             ; preds = %L235, %L234, %L232, %L230
  %load_target902 = load i32, i32* @SqRWrng
  %cond903 = icmp ne i32 %load_target902, 0
  br i1 %cond903, label %L237, label %L238

L237:                                             ; preds = %L236
  %R2495 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.111, i64 0, i64 0))
  %load_target904 = load double, double* @MinSqEr
  %load_target905 = load double, double* @Half
  %R2499 = fsub double %load_target904, %load_target905
  %R2500 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.112, i64 0, i64 0), double %R2499)
  %load_target906 = load double, double* @Half
  %load_target907 = load double, double* @MaxSqEr
  %R2504 = fadd double %load_target906, %load_target907
  %R2505 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.113, i64 0, i64 0), double %R2504)
  %load_target908 = load double, double* @MaxSqEr
  %load_target909 = load double, double* @MinSqEr
  %R2508 = fsub double %load_target908, %load_target909
  %load_target910 = load double, double* @Radix
  %R2511 = fmul double %load_target910, %load_target910
  %R2512 = fcmp olt double %R2508, %R2511
  %R2512911 = zext i1 %R2512 to i32
  call void @TstCond(i32 1, i32 %R2512911, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.114, i64 0, i64 0))
  br label %L238

L238:                                             ; preds = %L237, %L236
  store i32 90, i32* @Milestone
  call void @Pause()
  %R2515 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.115, i64 0, i64 0))
  store i32 0, i32* @N
  store i32 0, i32* @I
  %load_target912 = load double, double* @Zero
  %R2517 = fsub double -0.000000e+00, %load_target912
  store double %R2517, double* @Z
  store i32 3, i32* @M
  store i32 0, i32* @Break
  br label %L239

L239:                                             ; preds = %L244, %L238
  %load_target913 = load double, double* @One
  store double %load_target913, double* @X
  call void @SR3980()
  %load_target914 = load i32, i32* @I
  %R2520 = icmp sle i32 %load_target914, 10
  %R2520915 = zext i1 %R2520 to i32
  %cond916 = icmp ne i32 %R2520915, 0
  br i1 %cond916, label %L240, label %L241

L240:                                             ; preds = %L239
  store i32 1023, i32* @I
  call void @SR3980()
  br label %L241

L241:                                             ; preds = %L240, %L239
  %load_target917 = load double, double* @Z
  %load_target918 = load double, double* @MinusOne
  %R2523 = fcmp oeq double %load_target917, %load_target918
  %R2523919 = zext i1 %R2523 to i32
  %cond920 = icmp ne i32 %R2523919, 0
  br i1 %cond920, label %L242, label %L243

L242:                                             ; preds = %L241
  store i32 1, i32* @Break
  br label %L244

L243:                                             ; preds = %L241
  store double %load_target918, double* @Z
  store i32 -4, i32* @I
  br label %L244

L244:                                             ; preds = %L243, %L242
  %load_target921 = load i32, i32* @Break
  %cond922 = icmp ne i32 %load_target921, 0
  br i1 %cond922, label %L245, label %L239

L245:                                             ; preds = %L244
  call void @PrintIfNPositive()
  %load_target923 = load i32, i32* @N
  store i32 %load_target923, i32* @N1
  store i32 0, i32* @N
  %load_target924 = load double, double* @A1
  store double %load_target924, double* @Z
  %load_target925 = load double, double* @Two
  %load_target926 = load double, double* @W
  %R2530 = call double @log(double %load_target926)
  %R2531 = fmul double %load_target925, %R2530
  %load_target927 = load double, double* @A1
  %R2533 = call double @log(double %load_target927)
  %R2534 = fdiv double %R2531, %R2533
  %R2535 = call double @floor(double %R2534)
  %R2536 = fptosi double %R2535 to i32
  store i32 %R2536, i32* @M
  store i32 0, i32* @Break
  br label %L246

L246:                                             ; preds = %L249, %L245
  %load_target928 = load double, double* @Z
  store double %load_target928, double* @X
  store i32 1, i32* @I
  call void @SR3980()
  %load_target929 = load double, double* @Z
  %load_target930 = load double, double* @AInvrse
  %R2540 = fcmp oeq double %load_target929, %load_target930
  %R2540931 = zext i1 %R2540 to i32
  %cond932 = icmp ne i32 %R2540931, 0
  br i1 %cond932, label %L247, label %L248

L247:                                             ; preds = %L246
  store i32 1, i32* @Break
  br label %L249

L248:                                             ; preds = %L246
  store double %load_target930, double* @Z
  br label %L249

L249:                                             ; preds = %L248, %L247
  %load_target933 = load i32, i32* @Break
  %cond934 = icmp ne i32 %load_target933, 0
  br i1 %cond934, label %L250, label %L246

L250:                                             ; preds = %L249
  store i32 100, i32* @Milestone
  store i32 20, i32* @M
  %load_target935 = load double, double* @Three
  store double %load_target935, double* @Z
  store double %load_target935, double* %35
  br label %L251

L251:                                             ; preds = %L253, %L250
  %302 = load double, double* %35
  store double %302, double* @X
  store i32 1, i32* @I
  call void @SR3980()
  br label %L252

L252:                                             ; preds = %L252, %L251
  %load_target936 = load double, double* @Z
  %load_target937 = load double, double* @Two
  %R2547 = fadd double %load_target936, %load_target937
  store double %R2547, double* @Z
  %load_target938 = load double, double* @Three
  %R2551 = fdiv double %R2547, %load_target938
  %R2552 = call double @floor(double %R2551)
  %R2553 = fmul double %load_target938, %R2552
  %load_target939 = load double, double* @Z
  %R2555 = fcmp oeq double %R2553, %load_target939
  %R2555940 = zext i1 %R2555 to i32
  store double %load_target939, double* %35
  %cond941 = icmp ne i32 %R2555940, 0
  br i1 %cond941, label %L252, label %L253

L253:                                             ; preds = %L252
  %load_target942 = load double, double* @Eight
  %load_target943 = load double, double* @Three
  %R2559 = fmul double %load_target942, %load_target943
  %R2560 = fcmp olt double %load_target939, %R2559
  %R2560944 = zext i1 %R2560 to i32
  %cond945 = icmp ne i32 %R2560944, 0
  br i1 %cond945, label %L251, label %L254

L254:                                             ; preds = %L253
  %load_target946 = load i32, i32* @N
  %R2562 = icmp sgt i32 %load_target946, 0
  %R2562947 = zext i1 %R2562 to i32
  %cond948 = icmp ne i32 %R2562947, 0
  br i1 %cond948, label %L255, label %L256

L255:                                             ; preds = %L254
  %R2564 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([56 x i8], [56 x i8]* @.str.116, i64 0, i64 0))
  %R2566 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.117, i64 0, i64 0))
  br label %L256

L256:                                             ; preds = %L255, %L254
  call void @PrintIfNPositive()
  %load_target949 = load i32, i32* @N1
  %load_target950 = load i32, i32* @N
  %R2570 = add i32 %load_target950, %load_target949
  store i32 %R2570, i32* @N
  %cond951 = icmp ne i32 %R2570, 0
  br i1 %cond951, label %L258, label %L257

L257:                                             ; preds = %L256
  %R2575 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.118, i64 0, i64 0))
  br label %L258

L258:                                             ; preds = %L257, %L256
  %load_target952 = load i32, i32* @N
  %R2577 = icmp sgt i32 %load_target952, 0
  %R2577953 = zext i1 %R2577 to i32
  %cond954 = icmp ne i32 %R2577953, 0
  br i1 %cond954, label %L259, label %L260

L259:                                             ; preds = %L258
  call void @Pause()
  br label %L261

L260:                                             ; preds = %L258
  %R2579 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.119, i64 0, i64 0))
  br label %L261

L261:                                             ; preds = %L260, %L259
  store i32 110, i32* @Milestone
  %R2581 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.120, i64 0, i64 0))
  %load_target955 = load double, double* @U1
  store double %load_target955, double* @D
  %load_target956 = load double, double* @Precision
  %R2585 = call double @floor(double %load_target956)
  %R2586 = fcmp une double %load_target956, %R2585
  %R2586957 = zext i1 %R2586 to i32
  %cond958 = icmp ne i32 %R2586957, 0
  br i1 %cond958, label %L262, label %L264

L262:                                             ; preds = %L261
  %load_target959 = load double, double* @BInvrse
  %load_target960 = load double, double* @Precision
  store double %load_target960, double* %37
  store double %load_target959, double* %36
  br label %L263

L263:                                             ; preds = %L263, %L262
  %303 = load double, double* %36
  %R2591 = fmul double %303, %load_target959
  store double %R2591, double* @D
  %304 = load double, double* %37
  %load_target961 = load double, double* @One
  %R2594 = fsub double %304, %load_target961
  store double %R2594, double* @X
  store double %R2594, double* %37
  store double %R2591, double* %36
  %load_target962 = load double, double* @Zero
  %R2597 = fcmp ogt double %R2594, %load_target962
  %R2597963 = zext i1 %R2597 to i32
  %cond964 = icmp ne i32 %R2597963, 0
  br i1 %cond964, label %L263, label %L264

L264:                                             ; preds = %L263, %L261
  %load_target965 = load double, double* @One
  %load_target966 = load double, double* @D
  store double %load_target966, double* %39
  store double %load_target965, double* %38
  br label %L265

L265:                                             ; preds = %L265, %L264
  %305 = load double, double* %38
  store double %305, double* @C
  %306 = load double, double* %39
  store double %306, double* @Y
  %R2604 = fmul double %306, %306
  store double %R2604, double* @Z
  store double %R2604, double* %39
  store double %306, double* %38
  %R2607 = fcmp ogt double %306, %R2604
  %R2607967 = zext i1 %R2607 to i32
  %R2610 = fadd double %R2604, %R2604
  %R2612 = fcmp ogt double %R2610, %R2604
  %R2612968 = zext i1 %R2612 to i32
  %307 = icmp ne i32 %R2607967, 0
  %308 = icmp ne i32 %R2612968, 0
  %R2613 = and i1 %307, %308
  %R2613969 = zext i1 %R2613 to i32
  %cond970 = icmp ne i32 %R2613969, 0
  br i1 %cond970, label %L265, label %L266

L266:                                             ; preds = %L265
  %R2617 = fmul double %305, %load_target966
  store double %R2617, double* %41
  store double %305, double* %40
  br label %L267

L267:                                             ; preds = %L267, %L266
  %309 = load double, double* %40
  store double %309, double* @C
  %310 = load double, double* %41
  store double %310, double* @Y
  %R2622 = fmul double %310, %load_target966
  store double %R2622, double* @Z
  store double %R2622, double* %41
  store double %310, double* %40
  %R2625 = fcmp ogt double %310, %R2622
  %R2625971 = zext i1 %R2625 to i32
  %R2628 = fadd double %R2622, %R2622
  %R2630 = fcmp ogt double %R2628, %R2622
  %R2630972 = zext i1 %R2630 to i32
  %311 = icmp ne i32 %R2625971, 0
  %312 = icmp ne i32 %R2630972, 0
  %R2631 = and i1 %311, %312
  %R2631973 = zext i1 %R2631 to i32
  %cond974 = icmp ne i32 %R2631973, 0
  br i1 %cond974, label %L267, label %L268

L268:                                             ; preds = %L267
  %load_target975 = load double, double* @Radix
  %load_target976 = load double, double* @Two
  %R2634 = fcmp olt double %load_target975, %load_target976
  %R2634977 = zext i1 %R2634 to i32
  store double %load_target975, double* %45
  %cond978 = icmp ne i32 %R2634977, 0
  br i1 %cond978, label %L269, label %L270

L269:                                             ; preds = %L268
  store double %load_target976, double* @HInvrse
  store double %load_target976, double* %42
  br label %L271

L270:                                             ; preds = %L268
  store double %load_target975, double* @HInvrse
  store double %load_target975, double* %45
  store double %load_target975, double* %42
  br label %L271

L271:                                             ; preds = %L270, %L269
  %313 = load double, double* %42
  %R2639 = fdiv double %load_target965, %313
  store double %R2639, double* @H
  %R2642 = fdiv double %load_target965, %309
  store double %R2642, double* @CInvrse
  %R2646 = fmul double %309, %R2639
  store double %R2646, double* %44
  store double %309, double* %43
  br label %L272

L272:                                             ; preds = %L272, %L271
  %314 = load double, double* %43
  store double %314, double* @Y
  %315 = load double, double* %44
  store double %315, double* @E0
  %R2651 = fmul double %315, %R2639
  store double %R2651, double* @Z
  store double %R2651, double* %44
  store double %315, double* %43
  %R2654 = fcmp ogt double %315, %R2651
  %R2654979 = zext i1 %R2654 to i32
  %R2657 = fadd double %R2651, %R2651
  %R2659 = fcmp ogt double %R2657, %R2651
  %R2659980 = zext i1 %R2659 to i32
  %316 = icmp ne i32 %R2654979, 0
  %317 = icmp ne i32 %R2659980, 0
  %R2660 = and i1 %316, %317
  %R2660981 = zext i1 %R2660 to i32
  %cond982 = icmp ne i32 %R2660981, 0
  br i1 %cond982, label %L272, label %L273

L273:                                             ; preds = %L272
  store double %315, double* @UfThold
  %load_target983 = load double, double* @Zero
  store double %load_target983, double* @E1
  store double %load_target983, double* @Q
  %load_target984 = load double, double* @U2
  store double %load_target984, double* @E9
  %R2667 = fadd double %load_target965, %load_target984
  store double %R2667, double* @S
  %R2670 = fmul double %309, %R2667
  store double %R2670, double* @D
  %R2673 = fcmp ole double %R2670, %309
  %R2673985 = zext i1 %R2673 to i32
  store double %load_target983, double* %48
  %cond986 = icmp ne i32 %R2673985, 0
  br i1 %cond986, label %L274, label %L276

L274:                                             ; preds = %L273
  %318 = load double, double* %45
  %R2676 = fmul double %318, %load_target984
  store double %R2676, double* @E9
  %R2679 = fadd double %load_target965, %R2676
  store double %R2679, double* @S
  %R2682 = fmul double %309, %R2679
  store double %R2682, double* @D
  %R2685 = fcmp ole double %R2682, %309
  %R2685987 = zext i1 %R2685 to i32
  %cond988 = icmp ne i32 %R2685987, 0
  br i1 %cond988, label %L275, label %L281

L275:                                             ; preds = %L274
  call void @BadCond(i32 0, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.121, i64 0, i64 0))
  %load_target989 = load double, double* @E0
  store double %load_target989, double* @Underflow
  %load_target990 = load double, double* @Zero
  store double %load_target990, double* @Y1
  %load_target991 = load double, double* @Z
  store double %load_target991, double* @PseudoZero
  call void @Pause()
  br label %L281

L276:                                             ; preds = %L273
  %R2693 = fmul double %R2670, %R2639
  store double %R2693, double* @PseudoZero
  store double %load_target983, double* @UfThold
  store double %R2670, double* %46
  store double %R2693, double* %47
  br label %L277

L277:                                             ; preds = %L280, %L276
  %319 = load double, double* %46
  store double %319, double* @Y1
  %320 = load double, double* %47
  store double %320, double* @Underflow
  %321 = load double, double* %48
  %R2699 = fadd double %321, %321
  %R2701 = fcmp ole double %R2699, %321
  %R2701992 = zext i1 %R2701 to i32
  %cond993 = icmp ne i32 %R2701992, 0
  br i1 %cond993, label %L278, label %L280

L278:                                             ; preds = %L277
  %load_target994 = load double, double* @HInvrse
  %R2704 = fmul double %320, %load_target994
  store double %R2704, double* @Y2
  %R2707 = fsub double %319, %R2704
  %R2708 = call double @fabs(double %R2707)
  store double %R2708, double* @E1
  %load_target995 = load double, double* @Y1
  store double %load_target995, double* @Q
  %load_target996 = load double, double* @UfThold
  %load_target997 = load double, double* @Zero
  %R2712 = fcmp oeq double %load_target996, %load_target997
  %R2712998 = zext i1 %R2712 to i32
  %load_target999 = load double, double* @Y2
  %R2715 = fcmp une double %load_target995, %load_target999
  %R27151000 = zext i1 %R2715 to i32
  %322 = icmp ne i32 %R2712998, 0
  %323 = icmp ne i32 %R27151000, 0
  %R2716 = and i1 %322, %323
  %R27161001 = zext i1 %R2716 to i32
  store double %R2708, double* %48
  %cond1002 = icmp ne i32 %R27161001, 0
  br i1 %cond1002, label %L279, label %L280

L279:                                             ; preds = %L278
  store double %load_target995, double* @UfThold
  br label %L280

L280:                                             ; preds = %L279, %L278, %L277
  %load_target1003 = load double, double* @PseudoZero
  %load_target1004 = load double, double* @H
  %R2720 = fmul double %load_target1003, %load_target1004
  store double %R2720, double* @PseudoZero
  store double %R2720, double* %47
  %load_target1005 = load double, double* @Underflow
  %R2723 = fcmp ogt double %load_target1005, %R2720
  %R27231006 = zext i1 %R2723 to i32
  %R2726 = fadd double %R2720, %R2720
  %R2728 = fcmp ogt double %R2726, %R2720
  %R27281007 = zext i1 %R2728 to i32
  %324 = icmp ne i32 %R27231006, 0
  %325 = icmp ne i32 %R27281007, 0
  %R2729 = and i1 %324, %325
  %R27291008 = zext i1 %R2729 to i32
  store double %load_target1005, double* %46
  %cond1009 = icmp ne i32 %R27291008, 0
  br i1 %cond1009, label %L277, label %L281

L281:                                             ; preds = %L280, %L275, %L274
  %load_target1010 = load double, double* @PseudoZero
  %load_target1011 = load double, double* @Zero
  %R2732 = fcmp une double %load_target1010, %load_target1011
  %R27321012 = zext i1 %R2732 to i32
  %cond1013 = icmp ne i32 %R27321012, 0
  br i1 %cond1013, label %L282, label %L287

L282:                                             ; preds = %L281
  %R2734 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.122, i64 0, i64 0))
  %load_target1014 = load double, double* @PseudoZero
  store double %load_target1014, double* @Z
  %load_target1015 = load double, double* @Zero
  %R2738 = fcmp ole double %load_target1014, %load_target1015
  %R27381016 = zext i1 %R2738 to i32
  %cond1017 = icmp ne i32 %R27381016, 0
  br i1 %cond1017, label %L283, label %L285

L283:                                             ; preds = %L282
  call void @BadCond(i32 0, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.123, i64 0, i64 0))
  %R2741 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.124, i64 0, i64 0))
  %load_target1018 = load double, double* @PseudoZero
  %R2744 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.125, i64 0, i64 0), double %load_target1018)
  %load_target1019 = load double, double* @PseudoZero
  %R2746 = fsub double -0.000000e+00, %load_target1019
  store double %R2746, double* @X
  %load_target1020 = load double, double* @Zero
  %R2749 = fcmp ole double %R2746, %load_target1020
  %R27491021 = zext i1 %R2749 to i32
  %cond1022 = icmp ne i32 %R27491021, 0
  br i1 %cond1022, label %L284, label %L286

L284:                                             ; preds = %L283
  %R2751 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.126, i64 0, i64 0))
  %load_target1023 = load double, double* @X
  %R2754 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.127, i64 0, i64 0), double %load_target1023)
  br label %L286

L285:                                             ; preds = %L282
  call void @BadCond(i32 3, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.128, i64 0, i64 0))
  %load_target1024 = load double, double* @PseudoZero
  %R2758 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.129, i64 0, i64 0), double %load_target1024)
  br label %L286

L286:                                             ; preds = %L285, %L284, %L283
  call void @TstPtUf()
  br label %L287

L287:                                             ; preds = %L286, %L281
  store i32 120, i32* @Milestone
  %load_target1025 = load double, double* @CInvrse
  %load_target1026 = load double, double* @Y
  %R2761 = fmul double %load_target1025, %load_target1026
  %load_target1027 = load double, double* @Y1
  %R2764 = fmul double %load_target1025, %load_target1027
  %R2765 = fcmp ogt double %R2761, %R2764
  %R27651028 = zext i1 %R2765 to i32
  %cond1029 = icmp ne i32 %R27651028, 0
  br i1 %cond1029, label %L288, label %L289

L288:                                             ; preds = %L287
  %load_target1030 = load double, double* @H
  %load_target1031 = load double, double* @S
  %R2768 = fmul double %load_target1030, %load_target1031
  store double %R2768, double* @S
  %load_target1032 = load double, double* @Underflow
  store double %load_target1032, double* @E0
  br label %L289

L289:                                             ; preds = %L288, %L287
  %load_target1033 = load double, double* @E1
  %load_target1034 = load double, double* @Zero
  %R2772 = fcmp oeq double %load_target1033, %load_target1034
  %R27721035 = zext i1 %R2772 to i32
  %load_target1036 = load double, double* @E0
  %R2775 = fcmp oeq double %load_target1033, %load_target1036
  %R27751037 = zext i1 %R2775 to i32
  %326 = icmp ne i32 %R27721035, 0
  %327 = icmp ne i32 %R27751037, 0
  %R2776 = or i1 %326, %327
  %R27761038 = zext i1 %R2776 to i32
  %cond1039 = icmp ne i32 %R27761038, 0
  br i1 %cond1039, label %L294, label %L290

L290:                                             ; preds = %L289
  call void @BadCond(i32 2, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.130, i64 0, i64 0))
  %load_target1040 = load double, double* @E1
  %load_target1041 = load double, double* @E0
  %R2780 = fcmp olt double %load_target1040, %load_target1041
  %R27801042 = zext i1 %R2780 to i32
  %cond1043 = icmp ne i32 %R27801042, 0
  br i1 %cond1043, label %L291, label %L293

L291:                                             ; preds = %L290
  %R2782 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.131, i64 0, i64 0))
  %R2784 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.132, i64 0, i64 0))
  %load_target1044 = load double, double* @PseudoZero
  %load_target1045 = load double, double* @Zero
  %R2787 = fcmp oeq double %load_target1044, %load_target1045
  %R27871046 = zext i1 %R2787 to i32
  %cond1047 = icmp ne i32 %R27871046, 0
  br i1 %cond1047, label %L292, label %L294

L292:                                             ; preds = %L291
  %load_target1048 = load double, double* @E1
  store double %load_target1048, double* @E0
  br label %L294

L293:                                             ; preds = %L290
  %R2790 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.133, i64 0, i64 0))
  %R2792 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.134, i64 0, i64 0))
  br label %L294

L294:                                             ; preds = %L293, %L292, %L291, %L289
  %load_target1049 = load double, double* @E0
  %R2795 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.135, i64 0, i64 0), double %load_target1049)
  %load_target1050 = load double, double* @E0
  store double %load_target1050, double* @Z
  call void @TstPtUf()
  %load_target1051 = load double, double* @E0
  store double %load_target1051, double* @Underflow
  %load_target1052 = load i32, i32* @N
  %R2799 = icmp eq i32 %load_target1052, 1
  %R27991053 = zext i1 %R2799 to i32
  store double %load_target1051, double* %51
  %cond1054 = icmp ne i32 %R27991053, 0
  br i1 %cond1054, label %L295, label %L296

L295:                                             ; preds = %L294
  %load_target1055 = load double, double* @Y
  store double %load_target1055, double* @Underflow
  store double %load_target1055, double* %51
  br label %L296

L296:                                             ; preds = %L295, %L294
  store i32 4, i32* @I
  %load_target1056 = load double, double* @E1
  %load_target1057 = load double, double* @Zero
  %R2803 = fcmp oeq double %load_target1056, %load_target1057
  %R28031058 = zext i1 %R2803 to i32
  store i32 4, i32* %50
  store i32 4, i32* %49
  %cond1059 = icmp ne i32 %R28031058, 0
  br i1 %cond1059, label %L297, label %L298

L297:                                             ; preds = %L296
  store i32 3, i32* @I
  store i32 3, i32* %50
  store i32 3, i32* %49
  br label %L298

L298:                                             ; preds = %L297, %L296
  %load_target1060 = load double, double* @UfThold
  %R2806 = fcmp oeq double %load_target1060, %load_target1057
  %R28061061 = zext i1 %R2806 to i32
  %cond1062 = icmp ne i32 %R28061061, 0
  br i1 %cond1062, label %L299, label %L300

L299:                                             ; preds = %L298
  %328 = load i32, i32* %49
  %R2808 = add i32 %328, -2
  store i32 %R2808, i32* @I
  store i32 %R2808, i32* %50
  br label %L300

L300:                                             ; preds = %L299, %L298
  store i32 1, i32* @UfNGrad
  %329 = load i32, i32* %50
  switch i32 %329, label %L308 [
    i32 1, label %L301
    i32 2, label %L304
    i32 3, label %L305
    i32 4, label %L306
  ]

L301:                                             ; preds = %L300
  %330 = load double, double* %51
  store double %330, double* @UfThold
  %load_target1063 = load double, double* @CInvrse
  %load_target1064 = load double, double* @Q
  %R2813 = fmul double %load_target1063, %load_target1064
  %load_target1065 = load double, double* @Y
  %R2816 = fmul double %load_target1063, %load_target1065
  %load_target1066 = load double, double* @S
  %R2818 = fmul double %R2816, %load_target1066
  %R2819 = fcmp une double %R2813, %R2818
  %R28191067 = zext i1 %R2819 to i32
  %cond1068 = icmp ne i32 %R28191067, 0
  br i1 %cond1068, label %L302, label %L303

L302:                                             ; preds = %L301
  store double %load_target1065, double* @UfThold
  call void @BadCond(i32 0, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.136, i64 0, i64 0))
  %load_target1069 = load double, double* @UfThold
  %R2824 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.137, i64 0, i64 0), double %load_target1069)
  %load_target1070 = load double, double* @C
  %R2827 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.138, i64 0, i64 0), double %load_target1070)
  %R2829 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.139, i64 0, i64 0))
  br label %L303

L303:                                             ; preds = %L302, %L301
  call void @Pause()
  br label %L308

L304:                                             ; preds = %L300
  call void @BadCond(i32 0, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.140, i64 0, i64 0))
  %R2832 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.141, i64 0, i64 0))
  %load_target1071 = load double, double* @Q
  %load_target1072 = load double, double* @Y2
  %R2836 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.142, i64 0, i64 0), double %load_target1071, double %load_target1072)
  %load_target1073 = load double, double* @Q
  %load_target1074 = load double, double* @Y2
  %R2840 = fsub double %load_target1073, %load_target1074
  %R2841 = call double @fabs(double %R2840)
  %R2842 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.143, i64 0, i64 0), double %R2841)
  %load_target1075 = load double, double* @Q
  store double %load_target1075, double* @UfThold
  br label %L308

L305:                                             ; preds = %L300
  %load_target1076 = load double, double* @X
  store double %load_target1076, double* @X
  br label %L308

L306:                                             ; preds = %L300
  %load_target1077 = load double, double* @Q
  %R2847 = fcmp oeq double %load_target1077, %load_target1060
  %R28471078 = zext i1 %R2847 to i32
  %R2850 = fcmp oeq double %load_target1056, %load_target1051
  %R28501079 = zext i1 %R2850 to i32
  %331 = icmp ne i32 %R28471078, 0
  %332 = icmp ne i32 %R28501079, 0
  %R2851 = and i1 %331, %332
  %R28511080 = zext i1 %R2851 to i32
  %load_target1081 = load double, double* @E9
  %R2855 = fdiv double %load_target1056, %load_target1081
  %R2856 = fsub double %load_target1060, %R2855
  %R2857 = call double @fabs(double %R2856)
  %load_target1082 = load double, double* @E1
  %R2859 = fcmp ole double %R2857, %load_target1082
  %R28591083 = zext i1 %R2859 to i32
  %333 = icmp ne i32 %R28511080, 0
  %334 = icmp ne i32 %R28591083, 0
  %R2860 = and i1 %333, %334
  %R28601084 = zext i1 %R2860 to i32
  %cond1085 = icmp ne i32 %R28601084, 0
  br i1 %cond1085, label %L307, label %L308

L307:                                             ; preds = %L306
  store i32 0, i32* @UfNGrad
  %R2862 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.144, i64 0, i64 0))
  %R2864 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.145, i64 0, i64 0))
  %load_target1086 = load double, double* @E0
  %load_target1087 = load double, double* @CInvrse
  %R2867 = fmul double %load_target1086, %load_target1087
  %load_target1088 = load double, double* @OneAndHalf
  %load_target1089 = load double, double* @U2
  %R2871 = fadd double %load_target1088, %load_target1089
  %R2872 = fmul double %R2867, %R2871
  %load_target1090 = load double, double* @One
  %R2876 = fadd double %load_target1090, %load_target1089
  %R2877 = fmul double %load_target1087, %R2876
  store double %R2877, double* @X
  %R2880 = fdiv double %R2872, %R2877
  store double %R2880, double* @Y
  %R2883 = fcmp oeq double %R2880, %load_target1086
  %R28831091 = zext i1 %R2883 to i32
  store i32 %R28831091, i32* @IEEE
  br label %L308

L308:                                             ; preds = %L307, %L306, %L305, %L304, %L303, %L300
  %load_target1092 = load i32, i32* @UfNGrad
  %cond1093 = icmp ne i32 %load_target1092, 0
  br i1 %cond1093, label %L309, label %L320

L309:                                             ; preds = %L308
  %R2886 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.146, i64 0, i64 0))
  store void (i32)* @sigfpe, void (i32)** @sigsave
  %R2889 = call i32 @_setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @ovfl_buf, i32 0, i32 0))
  %cond1094 = icmp ne i32 %R2889, 0
  br i1 %cond1094, label %L310, label %L311

L310:                                             ; preds = %L309
  %R2891 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.147, i64 0, i64 0))
  %load_target1095 = load double, double* @H
  %R2894 = fadd double %load_target1095, %load_target1095
  store double %R2894, double* @R
  store double %R2894, double* %52
  br label %L312

L311:                                             ; preds = %L309
  %load_target1096 = load double, double* @Underflow
  %load_target1097 = load double, double* @UfThold
  %R2897 = fdiv double %load_target1096, %load_target1097
  %R2898 = call double @sqrt(double %R2897)
  store double %R2898, double* @R
  store double %R2898, double* %52
  br label %L312

L312:                                             ; preds = %L311, %L310
  store void (i32)* null, void (i32)** @sigsave
  %335 = load double, double* %52
  %load_target1098 = load double, double* @H
  %R2901 = fcmp ole double %335, %load_target1098
  %R29011099 = zext i1 %R2901 to i32
  %cond1100 = icmp ne i32 %R29011099, 0
  br i1 %cond1100, label %L313, label %L314

L313:                                             ; preds = %L312
  %load_target1101 = load double, double* @UfThold
  %R2904 = fmul double %335, %load_target1101
  store double %R2904, double* @Z
  %load_target1102 = load double, double* @One
  %R2909 = fmul double %335, %load_target1098
  %R2912 = fadd double %load_target1102, %load_target1098
  %R2913 = fmul double %R2909, %R2912
  %R2914 = fadd double %load_target1102, %R2913
  %R2915 = fmul double %R2904, %R2914
  store double %R2915, double* @X
  store double %R2904, double* %54
  store double %R2915, double* %53
  br label %L315

L314:                                             ; preds = %L312
  %load_target1103 = load double, double* @UfThold
  store double %load_target1103, double* @Z
  %load_target1104 = load double, double* @One
  %R2921 = fmul double %load_target1098, %load_target1098
  %R2924 = fadd double %load_target1104, %load_target1098
  %R2925 = fmul double %R2921, %R2924
  %R2926 = fadd double %load_target1104, %R2925
  %R2927 = fmul double %load_target1103, %R2926
  store double %R2927, double* @X
  store double %load_target1103, double* %54
  store double %R2927, double* %53
  br label %L315

L315:                                             ; preds = %L314, %L313
  %336 = load double, double* %53
  %337 = load double, double* %54
  %R2930 = fcmp oeq double %336, %337
  %R29301105 = zext i1 %R2930 to i32
  %R2933 = fsub double %336, %337
  %load_target1106 = load double, double* @Zero
  %R2935 = fcmp une double %R2933, %load_target1106
  %R29351107 = zext i1 %R2935 to i32
  %338 = icmp ne i32 %R29301105, 0
  %339 = icmp ne i32 %R29351107, 0
  %R2936 = or i1 %338, %339
  %R29361108 = zext i1 %R2936 to i32
  %cond1109 = icmp ne i32 %R29361108, 0
  br i1 %cond1109, label %L320, label %L316

L316:                                             ; preds = %L315
  call void @BadCond(i32 3, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.148, i64 0, i64 0))
  %load_target1110 = load double, double* @X
  %load_target1111 = load double, double* @Z
  %R2941 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.149, i64 0, i64 0), double %load_target1110, double %load_target1111)
  %load_target1112 = load double, double* @X
  %load_target1113 = load double, double* @Z
  %R2944 = fsub double %load_target1112, %load_target1113
  store double %R2944, double* @Z9
  %R2947 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.150, i64 0, i64 0), double %R2944)
  %R2949 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.151, i64 0, i64 0))
  %R2951 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.152, i64 0, i64 0))
  %R2953 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.153, i64 0, i64 0))
  %R2955 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.154, i64 0, i64 0))
  %R2957 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.155, i64 0, i64 0))
  %R2959 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.156, i64 0, i64 0))
  store void (i32)* @sigfpe, void (i32)** @sigsave
  %R2962 = call i32 @_setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @ovfl_buf, i32 0, i32 0))
  %cond1114 = icmp ne i32 %R2962, 0
  br i1 %cond1114, label %L317, label %L318

L317:                                             ; preds = %L316
  %R2964 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.157, i64 0, i64 0))
  br label %L319

L318:                                             ; preds = %L316
  %load_target1115 = load double, double* @X
  %load_target1116 = load double, double* @Z
  %R2968 = fdiv double %load_target1115, %load_target1116
  %load_target1117 = load double, double* @Half
  %R2970 = fsub double %R2968, %load_target1117
  %R2972 = fsub double %R2970, %load_target1117
  %R2973 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.158, i64 0, i64 0), double %R2972)
  br label %L319

L319:                                             ; preds = %L318, %L317
  store void (i32)* null, void (i32)** @sigsave
  br label %L320

L320:                                             ; preds = %L319, %L315, %L308
  %load_target1118 = load double, double* @UfThold
  %R2977 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.159, i64 0, i64 0), double %load_target1118, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.160, i64 0, i64 0))
  %R2979 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.161, i64 0, i64 0))
  %R2981 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.162, i64 0, i64 0))
  %load_target1119 = load double, double* @U1
  %R2984 = fmul double %load_target1119, %load_target1119
  %R2987 = fmul double %R2984, %R2984
  store double %R2987, double* @Y
  %R2990 = fmul double %R2987, %load_target1119
  store double %R2990, double* @Y2
  %load_target1120 = load double, double* @UfThold
  %R2993 = fcmp ole double %R2990, %load_target1120
  %R29931121 = zext i1 %R2993 to i32
  %cond1122 = icmp ne i32 %R29931121, 0
  br i1 %cond1122, label %L321, label %L325

L321:                                             ; preds = %L320
  %load_target1123 = load double, double* @E0
  %R2996 = fcmp ogt double %R2987, %load_target1123
  %R29961124 = zext i1 %R2996 to i32
  %cond1125 = icmp ne i32 %R29961124, 0
  %select = select i1 %cond1125, i32 5, i32 4
  %cond1126 = icmp ne i32 %R29961124, 0
  br i1 %cond1126, label %L322, label %L323

L322:                                             ; preds = %L321
  call void @BadCond(i32 2, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.163, i64 0, i64 0))
  store i32 5, i32* @I
  br label %L324

L323:                                             ; preds = %L321
  call void @BadCond(i32 1, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.164, i64 0, i64 0))
  store i32 4, i32* @I
  br label %L324

L324:                                             ; preds = %L323, %L322
  %R3001 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.165, i64 0, i64 0), i32 %select)
  br label %L325

L325:                                             ; preds = %L324, %L320
  store i32 130, i32* @Milestone
  %load_target1127 = load double, double* @Half
  %load_target1128 = load double, double* @TwoForty
  %load_target1129 = load double, double* @UfThold
  %R3005 = call double @log(double %load_target1129)
  %R3006 = fmul double %load_target1128, %R3005
  %load_target1130 = load double, double* @HInvrse
  %R3008 = call double @log(double %load_target1130)
  %R3009 = fdiv double %R3006, %R3008
  %R3010 = fsub double %load_target1127, %R3009
  %R3011 = call double @floor(double %R3010)
  %R3012 = fsub double -0.000000e+00, %R3011
  %load_target1131 = load double, double* @TwoForty
  %R3014 = fdiv double %R3012, %load_target1131
  store double %R3014, double* @Y
  %R3017 = fadd double %R3014, %R3014
  store double %R3017, double* @Y2
  %R3019 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.166, i64 0, i64 0))
  %load_target1132 = load double, double* @HInvrse
  %load_target1133 = load double, double* @Y
  %R3023 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.167, i64 0, i64 0), double %load_target1132, double %load_target1133)
  %load_target1134 = load double, double* @HInvrse
  %load_target1135 = load double, double* @Y2
  %R3027 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.168, i64 0, i64 0), double %load_target1134, double %load_target1135)
  %R3029 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.169, i64 0, i64 0))
  %R3031 = call i32 @_setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @ovfl_buf, i32 0, i32 0))
  %cond1136 = icmp ne i32 %R3031, 0
  br i1 %cond1136, label %L326, label %L327

L326:                                             ; preds = %L325
  store void (i32)* null, void (i32)** @sigsave
  call void @BadCond(i32 1, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.170, i64 0, i64 0))
  br label %L333

L327:                                             ; preds = %L325
  store void (i32)* @sigfpe, void (i32)** @sigsave
  %load_target1137 = load double, double* @HInvrse
  %load_target1138 = load double, double* @Y2
  %R3036 = call double @pow(double %load_target1137, double %load_target1138)
  store double %R3036, double* @V9
  store void (i32)* null, void (i32)** @sigsave
  %R3039 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.171, i64 0, i64 0), double %R3036)
  %load_target1139 = load double, double* @V9
  %load_target1140 = load double, double* @Zero
  %R3042 = fcmp oge double %load_target1139, %load_target1140
  %R30421141 = zext i1 %R3042 to i32
  %cond1142 = icmp ne i32 %R30421141, 0
  br i1 %cond1142, label %L328, label %L329

L328:                                             ; preds = %L327
  %load_target1143 = load double, double* @Radix
  %R3046 = fadd double %load_target1143, %load_target1143
  %load_target1144 = load double, double* @E9
  %R3048 = fadd double %R3046, %load_target1144
  %load_target1145 = load double, double* @UfThold
  %R3050 = fmul double %R3048, %load_target1145
  %R3051 = fcmp ole double %load_target1139, %R3050
  %R30511146 = zext i1 %R3051 to i32
  %cond1147 = icmp ne i32 %R30511146, 0
  br i1 %cond1147, label %L330, label %L329

L329:                                             ; preds = %L328, %L327
  call void @BadCond(i32 1, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.172, i64 0, i64 0))
  %load_target1148 = load double, double* @UfThold
  %R3055 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.173, i64 0, i64 0), double %load_target1148)
  br label %L333

L330:                                             ; preds = %L328
  %load_target1149 = load double, double* @One
  %R3060 = fadd double %load_target1149, %load_target1144
  %R3061 = fmul double %load_target1145, %R3060
  %R3062 = fcmp ogt double %load_target1139, %R3061
  %R30621150 = zext i1 %R3062 to i32
  %cond1151 = icmp ne i32 %R30621150, 0
  br i1 %cond1151, label %L332, label %L331

L331:                                             ; preds = %L330
  %R3064 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.174, i64 0, i64 0))
  br label %L333

L332:                                             ; preds = %L330
  call void @BadCond(i32 2, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.175, i64 0, i64 0))
  %load_target1152 = load double, double* @UfThold
  %R3068 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.176, i64 0, i64 0), double %load_target1152)
  br label %L333

L333:                                             ; preds = %L332, %L331, %L329, %L326
  store i32 140, i32* @Milestone
  %R3070 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.177, i64 0, i64 0))
  %load_target1153 = load double, double* @Zero
  %load_target1154 = load double, double* @Two
  %load_target1155 = load double, double* @Three
  %R3074 = fmul double %load_target1154, %load_target1155
  store i32 0, i32* @N
  store double %R3074, double* %57
  store double %load_target1153, double* %55
  store i32 2, i32* %56
  store double %load_target1153, double* %58
  br label %L334

L334:                                             ; preds = %L334, %L333
  %340 = load double, double* %55
  store double %340, double* @Z
  %341 = load i32, i32* %56
  %R3078 = add i32 %341, 1
  store i32 %R3078, i32* @I
  %342 = load double, double* %57
  %R3082 = add i32 %R3078, %R3078
  %R3083 = sitofp i32 %R3082 to double
  %R3084 = fdiv double %342, %R3083
  store double %R3084, double* @Y
  %343 = load double, double* %58
  %R3087 = fadd double %R3084, %343
  store double %R3087, double* @R
  %R3090 = fadd double %340, %R3087
  store double %R3090, double* @X
  %R3093 = fsub double %340, %R3090
  %R3095 = fadd double %R3093, %R3087
  store double %R3095, double* @Q
  store double %R3084, double* %57
  store double %R3090, double* %55
  store i32 %R3078, i32* %56
  store double %R3095, double* %58
  %R3098 = fcmp ogt double %R3090, %340
  %R30981156 = zext i1 %R3098 to i32
  %cond1157 = icmp ne i32 %R30981156, 0
  br i1 %cond1157, label %L334, label %L335

L335:                                             ; preds = %L334
  %load_target1158 = load double, double* @OneAndHalf
  %load_target1159 = load double, double* @One
  %load_target1160 = load double, double* @Eight
  %R3102 = fdiv double %load_target1159, %load_target1160
  %R3103 = fadd double %load_target1158, %R3102
  %load_target1161 = load double, double* @ThirtyTwo
  %R3107 = fmul double %load_target1158, %load_target1161
  %R3108 = fdiv double %R3090, %R3107
  %R3109 = fadd double %R3103, %R3108
  store double %R3109, double* @Z
  %R3112 = fmul double %R3109, %R3109
  %R3115 = fmul double %R3112, %R3112
  store double %R3115, double* @Exp2
  %load_target1162 = load double, double* @F9
  store double %load_target1162, double* @X
  %load_target1163 = load double, double* @U1
  %R3119 = fsub double %load_target1162, %load_target1163
  store double %R3119, double* @Y
  %R3122 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([61 x i8], [61 x i8]* @.str.178, i64 0, i64 0), double %R3115)
  store i32 1, i32* @I
  br label %L336

L336:                                             ; preds = %L343, %L339, %L335
  %load_target1164 = load double, double* @X
  %load_target1165 = load double, double* @BInvrse
  %R3125 = fsub double %load_target1164, %load_target1165
  %load_target1166 = load double, double* @One
  %R3128 = fadd double %load_target1164, %load_target1166
  %R3132 = fsub double %load_target1166, %load_target1165
  %R3133 = fsub double %R3125, %R3132
  %R3134 = fdiv double %R3128, %R3133
  store double %R3134, double* @Z
  %R3137 = call double @pow(double %load_target1164, double %R3134)
  %load_target1167 = load double, double* @Exp2
  %R3139 = fsub double %R3137, %load_target1167
  store double %R3139, double* @Q
  %R3141 = call double @fabs(double %R3139)
  %load_target1168 = load double, double* @TwoForty
  %load_target1169 = load double, double* @U2
  %R3144 = fmul double %load_target1168, %load_target1169
  %R3145 = fcmp ogt double %R3141, %R3144
  %R31451170 = zext i1 %R3145 to i32
  %cond1171 = icmp ne i32 %R31451170, 0
  br i1 %cond1171, label %L337, label %L338

L337:                                             ; preds = %L336
  store i32 1, i32* @N
  %load_target1172 = load double, double* @X
  %load_target1173 = load double, double* @BInvrse
  %R3148 = fsub double %load_target1172, %load_target1173
  %load_target1174 = load double, double* @One
  %R3151 = fsub double %load_target1174, %load_target1173
  %R3152 = fsub double %R3148, %R3151
  store double %R3152, double* @V9
  call void @BadCond(i32 2, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.179, i64 0, i64 0))
  %load_target1175 = load double, double* @X
  %load_target1176 = load double, double* @Z
  %R3157 = call double @pow(double %load_target1175, double %load_target1176)
  %R3158 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.180, i64 0, i64 0), double %R3157)
  %load_target1177 = load double, double* @V9
  %load_target1178 = load double, double* @Z
  %R3162 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.181, i64 0, i64 0), double %load_target1177, double %load_target1178)
  %load_target1179 = load double, double* @Q
  %R3165 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.182, i64 0, i64 0), double %load_target1179)
  %R3167 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.183, i64 0, i64 0))
  %R3169 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.184, i64 0, i64 0))
  br label %L344

L338:                                             ; preds = %L336
  %load_target1180 = load double, double* @Y
  %load_target1181 = load double, double* @X
  %R3172 = fsub double %load_target1180, %load_target1181
  %load_target1182 = load double, double* @Two
  %R3174 = fmul double %R3172, %load_target1182
  %R3176 = fadd double %R3174, %load_target1180
  store double %load_target1180, double* @X
  store double %R3176, double* @Y
  %load_target1183 = load double, double* @One
  %load_target1184 = load double, double* @F9
  %R3182 = fsub double %load_target1180, %load_target1184
  %R3186 = fmul double %R3182, %R3182
  %R3187 = fadd double %load_target1183, %R3186
  store double %R3187, double* @Z
  %R3190 = fcmp ogt double %R3187, %load_target1183
  %R31901185 = zext i1 %R3190 to i32
  %load_target1186 = load i32, i32* @I
  %R3192 = icmp slt i32 %load_target1186, 20
  %R31921187 = zext i1 %R3192 to i32
  %344 = icmp ne i32 %R31901185, 0
  %345 = icmp ne i32 %R31921187, 0
  %R3193 = and i1 %344, %345
  %R31931188 = zext i1 %R3193 to i32
  %cond1189 = icmp ne i32 %R31931188, 0
  br i1 %cond1189, label %L339, label %L340

L339:                                             ; preds = %L338
  %R3195 = add i32 %load_target1186, 1
  store i32 %R3195, i32* @I
  br label %L336

L340:                                             ; preds = %L338
  %R3198 = fcmp ogt double %load_target1180, %load_target1183
  %R31981190 = zext i1 %R3198 to i32
  %cond1191 = icmp ne i32 %R31981190, 0
  br i1 %cond1191, label %L341, label %L343

L341:                                             ; preds = %L340
  %load_target1192 = load i32, i32* @N
  %cond1193 = icmp ne i32 %load_target1192, 0
  br i1 %cond1193, label %L344, label %L342

L342:                                             ; preds = %L341
  %R3202 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.185, i64 0, i64 0))
  br label %L344

L343:                                             ; preds = %L340
  %R3205 = fadd double %load_target1183, %load_target1169
  store double %R3205, double* @X
  %R3208 = fadd double %load_target1169, %load_target1169
  %R3212 = fadd double %R3208, %R3205
  store double %R3212, double* @Y
  store i32 1, i32* @I
  br label %L336

L344:                                             ; preds = %L342, %L341, %L337
  store i32 150, i32* @Milestone
  %R3215 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.186, i64 0, i64 0))
  store i32 0, i32* @N
  %load_target1194 = load double, double* @A1
  store double %load_target1194, double* @Z
  %load_target1195 = load double, double* @Half
  %load_target1196 = load double, double* @C
  %R3219 = call double @log(double %load_target1196)
  %load_target1197 = load double, double* @A1
  %R3221 = call double @log(double %load_target1197)
  %R3222 = fdiv double %R3219, %R3221
  %R3223 = fsub double %load_target1195, %R3222
  %R3224 = call double @floor(double %R3223)
  store double %R3224, double* @Q
  store i32 0, i32* @Break
  br label %L345

L345:                                             ; preds = %L348, %L344
  %load_target1198 = load double, double* @CInvrse
  store double %load_target1198, double* @X
  %load_target1199 = load double, double* @Z
  %load_target1200 = load double, double* @Q
  %R3228 = call double @pow(double %load_target1199, double %load_target1200)
  store double %R3228, double* @Y
  call void @IsYeqX()
  %load_target1201 = load double, double* @Q
  %R3230 = fsub double -0.000000e+00, %load_target1201
  store double %R3230, double* @Q
  %load_target1202 = load double, double* @C
  store double %load_target1202, double* @X
  %load_target1203 = load double, double* @Z
  %R3234 = call double @pow(double %load_target1203, double %R3230)
  store double %R3234, double* @Y
  call void @IsYeqX()
  %load_target1204 = load double, double* @Z
  %load_target1205 = load double, double* @One
  %R3237 = fcmp olt double %load_target1204, %load_target1205
  %R32371206 = zext i1 %R3237 to i32
  %cond1207 = icmp ne i32 %R32371206, 0
  br i1 %cond1207, label %L346, label %L347

L346:                                             ; preds = %L345
  store i32 1, i32* @Break
  br label %L348

L347:                                             ; preds = %L345
  %load_target1208 = load double, double* @AInvrse
  store double %load_target1208, double* @Z
  br label %L348

L348:                                             ; preds = %L347, %L346
  %load_target1209 = load i32, i32* @Break
  %cond1210 = icmp ne i32 %load_target1209, 0
  br i1 %cond1210, label %L349, label %L345

L349:                                             ; preds = %L348
  call void @PrintIfNPositive()
  %load_target1211 = load i32, i32* @N
  %cond1212 = icmp ne i32 %load_target1211, 0
  br i1 %cond1212, label %L351, label %L350

L350:                                             ; preds = %L349
  %R3243 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.187, i64 0, i64 0))
  br label %L351

L351:                                             ; preds = %L350, %L349
  %R3245 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.188, i64 0, i64 0))
  store i32 160, i32* @Milestone
  call void @Pause()
  %R3247 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.189, i64 0, i64 0))
  %R3249 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.190, i64 0, i64 0))
  %load_target1213 = load double, double* @CInvrse
  %R3251 = fsub double -0.000000e+00, %load_target1213
  store double %R3251, double* @Y
  %load_target1214 = load double, double* @HInvrse
  %R3254 = fmul double %load_target1214, %R3251
  store double %R3254, double* @V9
  store void (i32)* @sigfpe, void (i32)** @sigsave
  %R3257 = call i32 @_setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @ovfl_buf, i32 0, i32 0))
  %cond1215 = icmp ne i32 %R3257, 0
  br i1 %cond1215, label %L352, label %L353

L352:                                             ; preds = %L351
  store i32 0, i32* @I
  %load_target1216 = load double, double* @Y
  store double %load_target1216, double* @V9
  store double %load_target1216, double* %59
  br label %L355

L353:                                             ; preds = %L353, %L351
  %load_target1217 = load double, double* @Y
  store double %load_target1217, double* @V
  %load_target1218 = load double, double* @V9
  store double %load_target1218, double* @Y
  %load_target1219 = load double, double* @HInvrse
  %R3263 = fmul double %load_target1219, %load_target1218
  store double %R3263, double* @V9
  %R3266 = fcmp olt double %R3263, %load_target1218
  %R32661220 = zext i1 %R3266 to i32
  store double %R3263, double* %59
  %cond1221 = icmp ne i32 %R32661220, 0
  br i1 %cond1221, label %L353, label %L354

L354:                                             ; preds = %L353
  store i32 1, i32* @I
  br label %L355

L355:                                             ; preds = %L354, %L352
  store void (i32)* null, void (i32)** @sigsave
  %346 = load double, double* %59
  store double %346, double* @Z
  %R3269 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.191, i64 0, i64 0))
  %load_target1222 = load double, double* @Y
  %R3272 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.192, i64 0, i64 0), double %load_target1222)
  %load_target1223 = load double, double* @Y
  %R3274 = fsub double -0.000000e+00, %load_target1223
  store double %R3274, double* @V9
  store double %R3274, double* @V0
  %load_target1224 = load double, double* @V
  %R3278 = fsub double %load_target1224, %load_target1223
  %R3281 = fadd double %load_target1224, %R3274
  %R3282 = fcmp oeq double %R3278, %R3281
  %R32821225 = zext i1 %R3282 to i32
  %cond1226 = icmp ne i32 %R32821225, 0
  br i1 %cond1226, label %L356, label %L357

L356:                                             ; preds = %L355
  %R3284 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.193, i64 0, i64 0))
  br label %L358

L357:                                             ; preds = %L355
  %R3286 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.194, i64 0, i64 0))
  call void @BadCond(i32 3, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.195, i64 0, i64 0))
  br label %L358

L358:                                             ; preds = %L357, %L356
  %load_target1227 = load double, double* @Z
  %load_target1228 = load double, double* @Y
  %R3290 = fcmp une double %load_target1227, %load_target1228
  %R32901229 = zext i1 %R3290 to i32
  %cond1230 = icmp ne i32 %R32901229, 0
  br i1 %cond1230, label %L359, label %L360

L359:                                             ; preds = %L358
  call void @BadCond(i32 1, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.196, i64 0, i64 0))
  %load_target1231 = load double, double* @Y
  %load_target1232 = load double, double* @Z
  %R3295 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.197, i64 0, i64 0), double %load_target1231, double %load_target1232)
  br label %L360

L360:                                             ; preds = %L359, %L358
  %load_target1233 = load i32, i32* @I
  %cond1234 = icmp ne i32 %load_target1233, 0
  br i1 %cond1234, label %L361, label %L367

L361:                                             ; preds = %L360
  %load_target1235 = load double, double* @V
  %load_target1236 = load double, double* @HInvrse
  %load_target1237 = load double, double* @U2
  %R3300 = fmul double %load_target1236, %load_target1237
  %R3302 = fsub double %R3300, %load_target1236
  %R3303 = fmul double %load_target1235, %R3302
  store double %R3303, double* @Y
  %load_target1238 = load double, double* @One
  %R3307 = fsub double %load_target1238, %load_target1236
  %R3309 = fmul double %R3307, %load_target1237
  %R3311 = fmul double %R3309, %load_target1235
  %R3312 = fadd double %R3303, %R3311
  store double %R3312, double* @Z
  %load_target1239 = load double, double* @V0
  %R3315 = fcmp olt double %R3312, %load_target1239
  %R33151240 = zext i1 %R3315 to i32
  store double %R3303, double* %60
  store double %load_target1235, double* %61
  %cond1241 = icmp ne i32 %R33151240, 0
  br i1 %cond1241, label %L362, label %L363

L362:                                             ; preds = %L361
  store double %R3312, double* @Y
  store double %R3312, double* %60
  br label %L363

L363:                                             ; preds = %L362, %L361
  %347 = load double, double* %60
  %R3319 = fcmp olt double %347, %load_target1239
  %R33191242 = zext i1 %R3319 to i32
  %cond1243 = icmp ne i32 %R33191242, 0
  br i1 %cond1243, label %L364, label %L365

L364:                                             ; preds = %L363
  store double %347, double* @V
  store double %347, double* %61
  br label %L365

L365:                                             ; preds = %L364, %L363
  %348 = load double, double* %61
  %R3323 = fsub double %load_target1239, %348
  %R3325 = fcmp olt double %R3323, %load_target1239
  %R33251244 = zext i1 %R3325 to i32
  store double %348, double* %62
  %cond1245 = icmp ne i32 %R33251244, 0
  br i1 %cond1245, label %L366, label %L368

L366:                                             ; preds = %L365
  store double %load_target1239, double* @V
  store double %load_target1239, double* %62
  br label %L368

L367:                                             ; preds = %L360
  %load_target1246 = load double, double* @Y
  %load_target1247 = load double, double* @HInvrse
  %load_target1248 = load double, double* @U2
  %R3330 = fmul double %load_target1247, %load_target1248
  %R3332 = fsub double %R3330, %load_target1247
  %R3333 = fmul double %load_target1246, %R3332
  %load_target1249 = load double, double* @One
  %R3337 = fsub double %load_target1249, %load_target1247
  %R3339 = fmul double %R3337, %load_target1248
  %R3341 = fmul double %R3339, %load_target1246
  %R3342 = fadd double %R3333, %R3341
  store double %R3342, double* @V
  store double %R3342, double* %62
  br label %L368

L368:                                             ; preds = %L367, %L366, %L365
  %349 = load double, double* %62
  %R3345 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.198, i64 0, i64 0), double %349)
  %load_target1250 = load i32, i32* @I
  %cond1251 = icmp ne i32 %load_target1250, 0
  br i1 %cond1251, label %L369, label %L370

L369:                                             ; preds = %L368
  %load_target1252 = load double, double* @V0
  %R3349 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.199, i64 0, i64 0), double %load_target1252)
  br label %L371

L370:                                             ; preds = %L368
  %R3351 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.200, i64 0, i64 0))
  br label %L371

L371:                                             ; preds = %L370, %L369
  %load_target1253 = load double, double* @V
  %load_target1254 = load double, double* @One
  %R3354 = fmul double %load_target1253, %load_target1254
  store double %R3354, double* @V9
  %R3357 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.201, i64 0, i64 0), double %R3354)
  %load_target1255 = load double, double* @V
  %load_target1256 = load double, double* @One
  %R3360 = fdiv double %load_target1255, %load_target1256
  store double %R3360, double* @V9
  %R3363 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.202, i64 0, i64 0), double %R3360)
  %R3365 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.203, i64 0, i64 0))
  %R3367 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.204, i64 0, i64 0))
  store i32 170, i32* @Milestone
  %load_target1257 = load double, double* @V
  %R3369 = fsub double -0.000000e+00, %load_target1257
  %R3371 = fcmp olt double %R3369, %load_target1257
  %R33711258 = zext i1 %R3371 to i32
  %load_target1259 = load double, double* @V0
  %R3373 = fsub double -0.000000e+00, %load_target1259
  %R3375 = fcmp olt double %R3373, %load_target1259
  %R33751260 = zext i1 %R3375 to i32
  %350 = icmp ne i32 %R33711258, 0
  %351 = icmp ne i32 %R33751260, 0
  %R3376 = and i1 %350, %351
  %R33761261 = zext i1 %R3376 to i32
  %load_target1262 = load double, double* @UfThold
  %R3378 = fsub double -0.000000e+00, %load_target1262
  %R3380 = fcmp olt double %R3378, %load_target1257
  %R33801263 = zext i1 %R3380 to i32
  %352 = icmp ne i32 %R33761261, 0
  %353 = icmp ne i32 %R33801263, 0
  %R3381 = and i1 %352, %353
  %R33811264 = zext i1 %R3381 to i32
  %R3384 = fcmp olt double %load_target1262, %load_target1257
  %R33841265 = zext i1 %R3384 to i32
  %354 = icmp ne i32 %R33811264, 0
  %355 = icmp ne i32 %R33841265, 0
  %R3385 = and i1 %354, %355
  %R33851266 = zext i1 %R3385 to i32
  %cond1267 = icmp ne i32 %R33851266, 0
  br i1 %cond1267, label %L373, label %L372

L372:                                             ; preds = %L371
  call void @BadCond(i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.205, i64 0, i64 0))
  %load_target1268 = load double, double* @V
  %load_target1269 = load double, double* @V0
  %load_target1270 = load double, double* @UfThold
  %R3391 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.206, i64 0, i64 0), double %load_target1268, double %load_target1269, double %load_target1270)
  br label %L373

L373:                                             ; preds = %L372, %L371
  store i32 175, i32* @Milestone
  %R3393 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.207, i64 0, i64 0))
  store i32 1, i32* @Indx
  store i32 1, i32* %63
  br label %L374

L374:                                             ; preds = %L386, %L373
  %356 = load i32, i32* %63
  %R3395 = icmp sle i32 %356, 3
  %R33951271 = zext i1 %R3395 to i32
  %cond1272 = icmp ne i32 %R33951271, 0
  br i1 %cond1272, label %L375, label %L387

L375:                                             ; preds = %L374
  switch i32 %356, label %L379 [
    i32 1, label %L376
    i32 2, label %L377
    i32 3, label %L378
  ]

L376:                                             ; preds = %L375
  %load_target1273 = load double, double* @UfThold
  store double %load_target1273, double* @Z
  br label %L379

L377:                                             ; preds = %L375
  %load_target1274 = load double, double* @E0
  store double %load_target1274, double* @Z
  br label %L379

L378:                                             ; preds = %L375
  %load_target1275 = load double, double* @PseudoZero
  store double %load_target1275, double* @Z
  br label %L379

L379:                                             ; preds = %L378, %L377, %L376, %L375
  %load_target1276 = load double, double* @Z
  %load_target1277 = load double, double* @Zero
  %R3402 = fcmp une double %load_target1276, %load_target1277
  %R34021278 = zext i1 %R3402 to i32
  %cond1279 = icmp ne i32 %R34021278, 0
  br i1 %cond1279, label %L380, label %L386

L380:                                             ; preds = %L379
  %R3404 = call double @sqrt(double %load_target1276)
  store double %R3404, double* @V9
  %R3407 = fmul double %R3404, %R3404
  store double %R3407, double* @Y
  %load_target1280 = load double, double* @One
  %load_target1281 = load double, double* @Radix
  %load_target1282 = load double, double* @E9
  %R3412 = fmul double %load_target1281, %load_target1282
  %R3413 = fsub double %load_target1280, %R3412
  %R3414 = fdiv double %R3407, %R3413
  %load_target1283 = load double, double* @Z
  %R3416 = fcmp olt double %R3414, %load_target1283
  %R34161284 = zext i1 %R3416 to i32
  %cond1285 = icmp ne i32 %R34161284, 0
  br i1 %cond1285, label %L382, label %L381

L381:                                             ; preds = %L380
  %R3422 = fadd double %load_target1280, %R3412
  %R3424 = fmul double %R3422, %load_target1283
  %R3425 = fcmp ogt double %R3407, %R3424
  %R34251286 = zext i1 %R3425 to i32
  %cond1287 = icmp ne i32 %R34251286, 0
  br i1 %cond1287, label %L382, label %L386

L382:                                             ; preds = %L381, %L380
  %load_target1288 = load double, double* @U1
  %R3428 = fcmp ogt double %R3404, %load_target1288
  %R34281289 = zext i1 %R3428 to i32
  %cond1290 = icmp ne i32 %R34281289, 0
  br i1 %cond1290, label %L383, label %L384

L383:                                             ; preds = %L382
  call void @BadCond(i32 1, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.208, i64 0, i64 0))
  br label %L385

L384:                                             ; preds = %L382
  call void @BadCond(i32 2, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.209, i64 0, i64 0))
  br label %L385

L385:                                             ; preds = %L384, %L383
  %load_target1291 = load double, double* @Z
  %R3433 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.210, i64 0, i64 0), double %load_target1291)
  %load_target1292 = load double, double* @Y
  %R3436 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.211, i64 0, i64 0), double %load_target1292)
  br label %L386

L386:                                             ; preds = %L385, %L381, %L379
  %load_target1293 = load i32, i32* @Indx
  %R3438 = add i32 %load_target1293, 1
  store i32 %R3438, i32* @Indx
  store i32 %R3438, i32* %63
  br label %L374

L387:                                             ; preds = %L374
  store i32 180, i32* @Milestone
  store i32 1, i32* @Indx
  store i32 1, i32* %64
  br label %L388

L388:                                             ; preds = %L397, %L387
  %357 = load i32, i32* %64
  %R3440 = icmp sle i32 %357, 2
  %R34401294 = zext i1 %R3440 to i32
  %cond1295 = icmp ne i32 %R34401294, 0
  br i1 %cond1295, label %L389, label %L398

L389:                                             ; preds = %L388
  %R3442 = icmp eq i32 %357, 1
  %R34421296 = zext i1 %R3442 to i32
  %cond1297 = icmp ne i32 %R34421296, 0
  br i1 %cond1297, label %L390, label %L391

L390:                                             ; preds = %L389
  %load_target1298 = load double, double* @V
  store double %load_target1298, double* @Z
  store double %load_target1298, double* %65
  br label %L392

L391:                                             ; preds = %L389
  %load_target1299 = load double, double* @V0
  store double %load_target1299, double* @Z
  store double %load_target1299, double* %65
  br label %L392

L392:                                             ; preds = %L391, %L390
  %358 = load double, double* %65
  %R3446 = call double @sqrt(double %358)
  %load_target1300 = load double, double* @One
  %load_target1301 = load double, double* @Radix
  %load_target1302 = load double, double* @E9
  %R3450 = fmul double %load_target1301, %load_target1302
  %R3451 = fsub double %load_target1300, %R3450
  %R3453 = fmul double %R3451, %R3446
  store double %R3453, double* @X
  %R3456 = fmul double %R3446, %R3453
  store double %R3456, double* @V9
  %load_target1303 = load double, double* @Two
  %R3461 = fmul double %load_target1303, %load_target1301
  %R3463 = fmul double %R3461, %load_target1302
  %R3464 = fsub double %load_target1300, %R3463
  %load_target1304 = load double, double* @Z
  %R3466 = fmul double %R3464, %load_target1304
  %R3467 = fcmp olt double %R3456, %R3466
  %R34671305 = zext i1 %R3467 to i32
  %R3470 = fcmp ogt double %R3456, %load_target1304
  %R34701306 = zext i1 %R3470 to i32
  %359 = icmp ne i32 %R34671305, 0
  %360 = icmp ne i32 %R34701306, 0
  %R3471 = or i1 %359, %360
  %R34711307 = zext i1 %R3471 to i32
  %cond1308 = icmp ne i32 %R34711307, 0
  br i1 %cond1308, label %L393, label %L397

L393:                                             ; preds = %L392
  store double %R3456, double* @Y
  %load_target1309 = load double, double* @W
  %R3475 = fcmp olt double %R3453, %load_target1309
  %R34751310 = zext i1 %R3475 to i32
  %cond1311 = icmp ne i32 %R34751310, 0
  br i1 %cond1311, label %L394, label %L395

L394:                                             ; preds = %L393
  call void @BadCond(i32 1, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.212, i64 0, i64 0))
  br label %L396

L395:                                             ; preds = %L393
  call void @BadCond(i32 2, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.213, i64 0, i64 0))
  br label %L396

L396:                                             ; preds = %L395, %L394
  %load_target1312 = load double, double* @Z
  %R3480 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.214, i64 0, i64 0), double %load_target1312)
  %load_target1313 = load double, double* @Y
  %R3483 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.215, i64 0, i64 0), double %load_target1313)
  br label %L397

L397:                                             ; preds = %L396, %L392
  %load_target1314 = load i32, i32* @Indx
  %R3485 = add i32 %load_target1314, 1
  store i32 %R3485, i32* @Indx
  store i32 %R3485, i32* %64
  br label %L388

L398:                                             ; preds = %L388
  store i32 190, i32* @Milestone
  call void @Pause()
  %load_target1315 = load double, double* @UfThold
  %load_target1316 = load double, double* @V
  %R3488 = fmul double %load_target1315, %load_target1316
  store double %R3488, double* @X
  %load_target1317 = load double, double* @Radix
  %R3491 = fmul double %load_target1317, %load_target1317
  store double %R3491, double* @Y
  %R3494 = fmul double %R3488, %R3491
  %load_target1318 = load double, double* @One
  %R3496 = fcmp olt double %R3494, %load_target1318
  %R34961319 = zext i1 %R3496 to i32
  %R3499 = fcmp ogt double %R3488, %R3491
  %R34991320 = zext i1 %R3499 to i32
  %361 = icmp ne i32 %R34961319, 0
  %362 = icmp ne i32 %R34991320, 0
  %R3500 = or i1 %361, %362
  %R35001321 = zext i1 %R3500 to i32
  %cond1322 = icmp ne i32 %R35001321, 0
  br i1 %cond1322, label %L399, label %L403

L399:                                             ; preds = %L398
  %load_target1323 = load double, double* @U1
  %R3505 = fcmp olt double %R3494, %load_target1323
  %R35051324 = zext i1 %R3505 to i32
  %R3509 = fdiv double %R3491, %load_target1323
  %R3510 = fcmp ogt double %R3488, %R3509
  %R35101325 = zext i1 %R3510 to i32
  %363 = icmp ne i32 %R35051324, 0
  %364 = icmp ne i32 %R35101325, 0
  %R3511 = or i1 %363, %364
  %R35111326 = zext i1 %R3511 to i32
  %cond1327 = icmp ne i32 %R35111326, 0
  br i1 %cond1327, label %L400, label %L401

L400:                                             ; preds = %L399
  call void @BadCond(i32 2, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.216, i64 0, i64 0))
  br label %L402

L401:                                             ; preds = %L399
  call void @BadCond(i32 3, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.217, i64 0, i64 0))
  br label %L402

L402:                                             ; preds = %L401, %L400
  %load_target1328 = load double, double* @X
  %R3517 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.218, i64 0, i64 0), double %load_target1328, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.219, i64 0, i64 0))
  br label %L403

L403:                                             ; preds = %L402, %L398
  store i32 200, i32* @Milestone
  store i32 1, i32* @Indx
  store i32 1, i32* %66
  br label %L404

L404:                                             ; preds = %L418, %L403
  %365 = load i32, i32* %66
  %R3519 = icmp sle i32 %365, 5
  %R35191329 = zext i1 %R3519 to i32
  %cond1330 = icmp ne i32 %R35191329, 0
  br i1 %cond1330, label %L405, label %L419

L405:                                             ; preds = %L404
  %load_target1331 = load double, double* @F9
  store double %load_target1331, double* @X
  store double %load_target1331, double* %67
  switch i32 %365, label %L410 [
    i32 2, label %L406
    i32 3, label %L407
    i32 4, label %L408
    i32 5, label %L409
  ]

L406:                                             ; preds = %L405
  %load_target1332 = load double, double* @One
  %load_target1333 = load double, double* @U2
  %R3524 = fadd double %load_target1332, %load_target1333
  store double %R3524, double* @X
  store double %R3524, double* %67
  br label %L410

L407:                                             ; preds = %L405
  %load_target1334 = load double, double* @V
  store double %load_target1334, double* @X
  store double %load_target1334, double* %67
  br label %L410

L408:                                             ; preds = %L405
  %load_target1335 = load double, double* @UfThold
  store double %load_target1335, double* @X
  store double %load_target1335, double* %67
  br label %L410

L409:                                             ; preds = %L405
  %load_target1336 = load double, double* @Radix
  store double %load_target1336, double* @X
  store double %load_target1336, double* %67
  br label %L410

L410:                                             ; preds = %L409, %L408, %L407, %L406, %L405
  %366 = load double, double* %67
  store double %366, double* @Y
  store void (i32)* @sigfpe, void (i32)** @sigsave
  %R3531 = call i32 @_setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @ovfl_buf, i32 0, i32 0))
  %cond1337 = icmp ne i32 %R3531, 0
  br i1 %cond1337, label %L411, label %L412

L411:                                             ; preds = %L410
  %load_target1338 = load double, double* @X
  %R3534 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.220, i64 0, i64 0), double %load_target1338)
  br label %L417

L412:                                             ; preds = %L410
  %load_target1339 = load double, double* @Y
  %load_target1340 = load double, double* @X
  %R3537 = fdiv double %load_target1339, %load_target1340
  %load_target1341 = load double, double* @Half
  %R3539 = fsub double %R3537, %load_target1341
  %R3541 = fsub double %R3539, %load_target1341
  store double %R3541, double* @V9
  %load_target1342 = load double, double* @Zero
  %R3544 = fcmp oeq double %R3541, %load_target1342
  %R35441343 = zext i1 %R3544 to i32
  %cond1344 = icmp ne i32 %R35441343, 0
  br i1 %cond1344, label %L418, label %L413

L413:                                             ; preds = %L412
  %load_target1345 = load double, double* @U1
  %R3547 = fsub double -0.000000e+00, %load_target1345
  %R3548 = fcmp oeq double %R3541, %R3547
  %R35481346 = zext i1 %R3548 to i32
  %load_target1347 = load i32, i32* @Indx
  %R3550 = icmp slt i32 %load_target1347, 5
  %R35501348 = zext i1 %R3550 to i32
  %367 = icmp ne i32 %R35481346, 0
  %368 = icmp ne i32 %R35501348, 0
  %R3551 = and i1 %367, %368
  %R35511349 = zext i1 %R3551 to i32
  %cond1350 = icmp ne i32 %R35511349, 0
  br i1 %cond1350, label %L414, label %L415

L414:                                             ; preds = %L413
  call void @BadCond(i32 3, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.221, i64 0, i64 0))
  br label %L416

L415:                                             ; preds = %L413
  call void @BadCond(i32 1, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.222, i64 0, i64 0))
  br label %L416

L416:                                             ; preds = %L415, %L414
  %load_target1351 = load double, double* @X
  %R3556 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.223, i64 0, i64 0), double %load_target1351)
  %load_target1352 = load double, double* @V9
  %R3559 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.224, i64 0, i64 0), double %load_target1352)
  br label %L417

L417:                                             ; preds = %L416, %L411
  store void (i32)* null, void (i32)** @sigsave
  br label %L418

L418:                                             ; preds = %L417, %L412
  %load_target1353 = load i32, i32* @Indx
  %R3561 = add i32 %load_target1353, 1
  store i32 %R3561, i32* @Indx
  store i32 %R3561, i32* %66
  br label %L404

L419:                                             ; preds = %L404
  store i32 210, i32* @Milestone
  %load_target1354 = load double, double* @Zero
  store double %load_target1354, double* @MyZero
  %R3564 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.225, i64 0, i64 0))
  %R3566 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.226, i64 0, i64 0))
  store void (i32)* @sigfpe, void (i32)** @sigsave
  %R3569 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.227, i64 0, i64 0))
  %R3571 = call i32 @_setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @ovfl_buf, i32 0, i32 0))
  %cond1355 = icmp ne i32 %R3571, 0
  br i1 %cond1355, label %L421, label %L420

L420:                                             ; preds = %L419
  %load_target1356 = load double, double* @One
  %load_target1357 = load double, double* @MyZero
  %R3575 = fdiv double %load_target1356, %load_target1357
  %R3576 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.228, i64 0, i64 0), double %R3575)
  br label %L421

L421:                                             ; preds = %L420, %L419
  store void (i32)* @sigfpe, void (i32)** @sigsave
  %R3579 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.229, i64 0, i64 0))
  %R3581 = call i32 @_setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @ovfl_buf, i32 0, i32 0))
  %cond1358 = icmp ne i32 %R3581, 0
  br i1 %cond1358, label %L423, label %L422

L422:                                             ; preds = %L421
  %load_target1359 = load double, double* @Zero
  %load_target1360 = load double, double* @MyZero
  %R3585 = fdiv double %load_target1359, %load_target1360
  %R3586 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.230, i64 0, i64 0), double %R3585)
  br label %L423

L423:                                             ; preds = %L422, %L421
  store void (i32)* null, void (i32)** @sigsave
  store i32 220, i32* @Milestone
  call void @Pause()
  %R3588 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.231, i64 0, i64 0))
  store i32 0, i32* %68
  br label %L424

L424:                                             ; preds = %L427, %L423
  %369 = load i32, i32* %68
  %R3590 = icmp slt i32 %369, 4
  %R35901361 = zext i1 %R3590 to i32
  %cond1362 = icmp ne i32 %R35901361, 0
  br i1 %cond1362, label %L425, label %L428

L425:                                             ; preds = %L424
  %R3593 = sext i32 %369 to i64
  %R3594 = mul i64 %R3593, 4
  %370 = getelementptr inbounds i8, i8* bitcast ([4 x i32]* @ErrCnt to i8*), i64 %R3594
  %371 = bitcast i8* %370 to i32*
  %372 = bitcast i32* %371 to i8*
  %373 = getelementptr inbounds i8, i8* %372, i64 0
  %374 = bitcast i8* %373 to i32*
  %load_target1363 = load i32, i32* %374
  %cond1364 = icmp ne i32 %load_target1363, 0
  br i1 %cond1364, label %L426, label %L427

L426:                                             ; preds = %L425
  %R3601 = mul i64 %R3593, 8
  %375 = getelementptr inbounds i8, i8* bitcast ([4 x i8*]* @msg to i8*), i64 %R3601
  %376 = bitcast i8* %375 to i8**
  %377 = bitcast i8** %376 to i8*
  %378 = getelementptr inbounds i8, i8* %377, i64 0
  %379 = bitcast i8* %378 to i8**
  %load_target1365 = load i8*, i8** %379
  %R3610 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.232, i64 0, i64 0), i8* %load_target1365, i32 %load_target1363)
  br label %L427

L427:                                             ; preds = %L426, %L425
  %R3612 = add i32 %369, 1
  store i32 %R3612, i32* %68
  br label %L424

L428:                                             ; preds = %L424
  %R3614 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.233, i64 0, i64 0))
  %load_target1366 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @ErrCnt, i32 0, i32 0)
  %load_target1367 = load i32, i32* bitcast (i8* getelementptr inbounds (i8, i8* bitcast ([4 x i32]* @ErrCnt to i8*), i64 4) to i32*)
  %R3617 = add i32 %load_target1366, %load_target1367
  %load_target1368 = load i32, i32* bitcast (i8* getelementptr inbounds (i8, i8* bitcast ([4 x i32]* @ErrCnt to i8*), i64 8) to i32*)
  %R3619 = add i32 %R3617, %load_target1368
  %load_target1369 = load i32, i32* bitcast (i8* getelementptr inbounds (i8, i8* bitcast ([4 x i32]* @ErrCnt to i8*), i64 12) to i32*)
  %R3621 = add i32 %R3619, %load_target1369
  %R3622 = icmp sgt i32 %R3621, 0
  %R36221370 = zext i1 %R3622 to i32
  %cond1371 = icmp ne i32 %R36221370, 0
  br i1 %cond1371, label %L429, label %L437

L429:                                             ; preds = %L428
  %R3628 = icmp eq i32 %R3619, 0
  %R36281372 = zext i1 %R3628 to i32
  %R3630 = icmp sgt i32 %load_target1369, 0
  %R36301373 = zext i1 %R3630 to i32
  %380 = icmp ne i32 %R36281372, 0
  %381 = icmp ne i32 %R36301373, 0
  %R3631 = and i1 %380, %381
  %R36311374 = zext i1 %R3631 to i32
  %cond1375 = icmp ne i32 %R36311374, 0
  br i1 %cond1375, label %L430, label %L431

L430:                                             ; preds = %L429
  %R3633 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.234, i64 0, i64 0))
  %R3635 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.235, i64 0, i64 0))
  br label %L431

L431:                                             ; preds = %L430, %L429
  %load_target1376 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @ErrCnt, i32 0, i32 0)
  %load_target1377 = load i32, i32* bitcast (i8* getelementptr inbounds (i8, i8* bitcast ([4 x i32]* @ErrCnt to i8*), i64 4) to i32*)
  %R3638 = add i32 %load_target1376, %load_target1377
  %R3639 = icmp eq i32 %R3638, 0
  %R36391378 = zext i1 %R3639 to i32
  %load_target1379 = load i32, i32* bitcast (i8* getelementptr inbounds (i8, i8* bitcast ([4 x i32]* @ErrCnt to i8*), i64 8) to i32*)
  %R3641 = icmp sgt i32 %load_target1379, 0
  %R36411380 = zext i1 %R3641 to i32
  %382 = icmp ne i32 %R36391378, 0
  %383 = icmp ne i32 %R36411380, 0
  %R3642 = and i1 %382, %383
  %R36421381 = zext i1 %R3642 to i32
  %cond1382 = icmp ne i32 %R36421381, 0
  br i1 %cond1382, label %L432, label %L433

L432:                                             ; preds = %L431
  %R3644 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.236, i64 0, i64 0))
  %R3646 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.237, i64 0, i64 0))
  br label %L433

L433:                                             ; preds = %L432, %L431
  %load_target1383 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @ErrCnt, i32 0, i32 0)
  %load_target1384 = load i32, i32* bitcast (i8* getelementptr inbounds (i8, i8* bitcast ([4 x i32]* @ErrCnt to i8*), i64 4) to i32*)
  %R3649 = add i32 %load_target1383, %load_target1384
  %R3650 = icmp sgt i32 %R3649, 0
  %R36501385 = zext i1 %R3650 to i32
  %cond1386 = icmp ne i32 %R36501385, 0
  br i1 %cond1386, label %L434, label %L435

L434:                                             ; preds = %L433
  %R3652 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.238, i64 0, i64 0))
  %R3654 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.239, i64 0, i64 0))
  br label %L435

L435:                                             ; preds = %L434, %L433
  %load_target1387 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @ErrCnt, i32 0, i32 0)
  %R3656 = icmp sgt i32 %load_target1387, 0
  %R36561388 = zext i1 %R3656 to i32
  %cond1389 = icmp ne i32 %R36561388, 0
  br i1 %cond1389, label %L436, label %L449

L436:                                             ; preds = %L435
  %R3658 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.240, i64 0, i64 0))
  %R3660 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.241, i64 0, i64 0))
  br label %L449

L437:                                             ; preds = %L428
  %R3662 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.242, i64 0, i64 0))
  %load_target1390 = load i32, i32* @RMult
  %R3664 = icmp eq i32 %load_target1390, 1
  %R36641391 = zext i1 %R3664 to i32
  %load_target1392 = load i32, i32* @RDiv
  %R3666 = icmp eq i32 %load_target1392, 1
  %R36661393 = zext i1 %R3666 to i32
  %384 = icmp ne i32 %R36641391, 0
  %385 = icmp ne i32 %R36661393, 0
  %R3667 = and i1 %384, %385
  %R36671394 = zext i1 %R3667 to i32
  %load_target1395 = load i32, i32* @RAddSub
  %R3669 = icmp eq i32 %load_target1395, 1
  %R36691396 = zext i1 %R3669 to i32
  %386 = icmp ne i32 %R36671394, 0
  %387 = icmp ne i32 %R36691396, 0
  %R3670 = and i1 %386, %387
  %R36701397 = zext i1 %R3670 to i32
  %load_target1398 = load i32, i32* @RSqrt
  %R3672 = icmp eq i32 %load_target1398, 1
  %R36721399 = zext i1 %R3672 to i32
  %388 = icmp ne i32 %R36701397, 0
  %389 = icmp ne i32 %R36721399, 0
  %R3673 = and i1 %388, %389
  %R36731400 = zext i1 %R3673 to i32
  %cond1401 = icmp ne i32 %R36731400, 0
  br i1 %cond1401, label %L439, label %L438

L438:                                             ; preds = %L437
  %R3675 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.243, i64 0, i64 0))
  br label %L449

L439:                                             ; preds = %L437
  %load_target1402 = load double, double* @StickyBit
  %load_target1403 = load double, double* @One
  %R3678 = fcmp oge double %load_target1402, %load_target1403
  %R36781404 = zext i1 %R3678 to i32
  %cond1405 = icmp ne i32 %R36781404, 0
  br i1 %cond1405, label %L440, label %L448

L440:                                             ; preds = %L439
  %load_target1406 = load double, double* @Radix
  %load_target1407 = load double, double* @Two
  %R3681 = fsub double %load_target1406, %load_target1407
  %load_target1408 = load double, double* @Nine
  %R3684 = fsub double %load_target1406, %load_target1408
  %R3686 = fsub double %R3684, %load_target1403
  %R3687 = fmul double %R3681, %R3686
  %load_target1409 = load double, double* @Zero
  %R3689 = fcmp oeq double %R3687, %load_target1409
  %R36891410 = zext i1 %R3689 to i32
  %cond1411 = icmp ne i32 %R36891410, 0
  br i1 %cond1411, label %L441, label %L448

L441:                                             ; preds = %L440
  %R3691 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.244, i64 0, i64 0))
  %R3693 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.245, i64 0, i64 0))
  %load_target1412 = load double, double* @Radix
  %load_target1413 = load double, double* @Two
  %R3696 = fcmp oeq double %load_target1412, %load_target1413
  %R36961414 = zext i1 %R3696 to i32
  %cond1415 = icmp ne i32 %R36961414, 0
  br i1 %cond1415, label %L442, label %L444

L442:                                             ; preds = %L441
  %load_target1416 = load double, double* @Precision
  %load_target1417 = load double, double* @Four
  %load_target1418 = load double, double* @Three
  %R3700 = fmul double %load_target1417, %load_target1418
  %R3702 = fmul double %R3700, %load_target1413
  %R3703 = fsub double %load_target1416, %R3702
  %load_target1419 = load double, double* @TwentySeven
  %R3706 = fsub double %load_target1416, %load_target1419
  %R3708 = fsub double %R3706, %load_target1419
  %load_target1420 = load double, double* @One
  %R3710 = fadd double %R3708, %load_target1420
  %R3711 = fmul double %R3703, %R3710
  %load_target1421 = load double, double* @Zero
  %R3713 = fcmp oeq double %R3711, %load_target1421
  %R37131422 = zext i1 %R3713 to i32
  %cond1423 = icmp ne i32 %R37131422, 0
  br i1 %cond1423, label %L443, label %L444

L443:                                             ; preds = %L442
  %R3715 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.246, i64 0, i64 0))
  br label %L445

L444:                                             ; preds = %L442, %L441
  %R3717 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.247, i64 0, i64 0))
  br label %L445

L445:                                             ; preds = %L444, %L443
  %load_target1424 = load i32, i32* @IEEE
  %cond1425 = icmp ne i32 %load_target1424, 0
  br i1 %cond1425, label %L446, label %L447

L446:                                             ; preds = %L445
  %R3720 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.248, i64 0, i64 0))
  br label %L448

L447:                                             ; preds = %L445
  %R3722 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.249, i64 0, i64 0))
  %R3724 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.250, i64 0, i64 0))
  br label %L448

L448:                                             ; preds = %L447, %L446, %L440, %L439
  %R3726 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.251, i64 0, i64 0))
  br label %L449

L449:                                             ; preds = %L448, %L438, %L436, %L435
  %load_target1426 = load i32, i32* @fpecount
  %cond1427 = icmp ne i32 %load_target1426, 0
  br i1 %cond1427, label %L450, label %L451

L450:                                             ; preds = %L449
  %R3730 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.252, i64 0, i64 0), i32 %load_target1426)
  br label %L451

L451:                                             ; preds = %L450, %L449
  %R3732 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.253, i64 0, i64 0))
  ret i32 0
}

define void @Instructions() {
L516:
  ret void
}

define void @Pause() {
L453:
  %load_target = load i32, i32* @Milestone
  %R3743 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.254, i64 0, i64 0), i32 %load_target)
  %load_target1 = load i32, i32* @PageNo
  %R3746 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.255, i64 0, i64 0), i32 %load_target1)
  %load_target2 = load i32, i32* @Milestone
  %R3748 = add i32 %load_target2, 1
  store i32 %R3748, i32* @Milestone
  %load_target3 = load i32, i32* @PageNo
  %R3750 = add i32 %load_target3, 1
  store i32 %R3750, i32* @PageNo
  ret void
}

define void @Heading() {
L517:
  ret void
}

define void @Characteristics() {
L518:
  ret void
}

define void @History() {
L519:
  ret void
}

define void @TstCond(i32 %ARG1, i32 %ARG2, i8* %ARG3) {
L454:
  %cond = icmp ne i32 %ARG2, 0
  br i1 %cond, label %L456, label %L455

L455:                                             ; preds = %L454
  call void @BadCond(i32 %ARG1, i8* %ARG3)
  %R3755 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.256, i64 0, i64 0))
  br label %L456

L456:                                             ; preds = %L455, %L454
  ret void
}

define void @TstPtUf() {
L491:
  store i32 0, i32* @N
  %load_target = load double, double* @Z
  %load_target1 = load double, double* @Zero
  %R3999 = fcmp une double %load_target, %load_target1
  %R39992 = zext i1 %R3999 to i32
  %cond = icmp ne i32 %R39992, 0
  br i1 %cond, label %L492, label %L510

L492:                                             ; preds = %L491
  %R4001 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.268, i64 0, i64 0))
  %R4003 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.269, i64 0, i64 0))
  store void (i32)* @sigfpe, void (i32)** @sigsave
  %R4006 = call i32 @_setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @ovfl_buf, i32 0, i32 0))
  %cond3 = icmp ne i32 %R4006, 0
  br i1 %cond3, label %L496, label %L493

L493:                                             ; preds = %L492
  %load_target4 = load double, double* @Z
  %R4009 = fadd double %load_target4, %load_target4
  %R4011 = fdiv double %R4009, %load_target4
  store double %R4011, double* @Q9
  %R4014 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.270, i64 0, i64 0), double %R4011)
  %load_target5 = load double, double* @Q9
  %load_target6 = load double, double* @Two
  %R4017 = fsub double %load_target5, %load_target6
  %R4018 = call double @fabs(double %R4017)
  %load_target7 = load double, double* @Radix
  %load_target8 = load double, double* @U2
  %R4021 = fmul double %load_target7, %load_target8
  %R4022 = fcmp olt double %R4018, %R4021
  %R40229 = zext i1 %R4022 to i32
  %cond10 = icmp ne i32 %R40229, 0
  br i1 %cond10, label %L494, label %L495

L494:                                             ; preds = %L493
  %R4024 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.271, i64 0, i64 0))
  %R4026 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.272, i64 0, i64 0))
  br label %L498

L495:                                             ; preds = %L493
  %load_target11 = load double, double* @Q9
  %load_target12 = load double, double* @One
  %R4029 = fcmp olt double %load_target11, %load_target12
  %R402913 = zext i1 %R4029 to i32
  %load_target14 = load double, double* @Two
  %R4032 = fcmp ogt double %load_target11, %load_target14
  %R403215 = zext i1 %R4032 to i32
  %0 = icmp ne i32 %R402913, 0
  %1 = icmp ne i32 %R403215, 0
  %R4033 = or i1 %0, %1
  %R403316 = zext i1 %R4033 to i32
  %cond17 = icmp ne i32 %R403316, 0
  br i1 %cond17, label %L496, label %L497

L496:                                             ; preds = %L495, %L492
  store i32 1, i32* @N
  %load_target18 = load i32, i32* bitcast (i8* getelementptr inbounds (i8, i8* bitcast ([4 x i32]* @ErrCnt to i8*), i64 4) to i32*)
  %R4035 = add i32 %load_target18, 1
  store i32 %R4035, i32* bitcast (i8* getelementptr inbounds (i8, i8* bitcast ([4 x i32]* @ErrCnt to i8*), i64 4) to i32*)
  %R4037 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.273, i64 0, i64 0))
  br label %L498

L497:                                             ; preds = %L495
  store i32 1, i32* @N
  %load_target19 = load i32, i32* bitcast (i8* getelementptr inbounds (i8, i8* bitcast ([4 x i32]* @ErrCnt to i8*), i64 8) to i32*)
  %R4039 = add i32 %load_target19, 1
  store i32 %R4039, i32* bitcast (i8* getelementptr inbounds (i8, i8* bitcast ([4 x i32]* @ErrCnt to i8*), i64 8) to i32*)
  %R4041 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.274, i64 0, i64 0))
  br label %L498

L498:                                             ; preds = %L497, %L496, %L494
  store void (i32)* null, void (i32)** @sigsave
  %load_target20 = load double, double* @Z
  %load_target21 = load double, double* @One
  %R4044 = fmul double %load_target20, %load_target21
  store double %R4044, double* @Random1
  %R4048 = fmul double %load_target21, %load_target20
  store double %R4048, double* @Random2
  %R4052 = fdiv double %load_target20, %load_target21
  store double %R4052, double* @V9
  %R4055 = fcmp oeq double %load_target20, %R4044
  %R405522 = zext i1 %R4055 to i32
  %R4058 = fcmp oeq double %load_target20, %R4048
  %R405823 = zext i1 %R4058 to i32
  %2 = icmp ne i32 %R405522, 0
  %3 = icmp ne i32 %R405823, 0
  %R4059 = and i1 %2, %3
  %R405924 = zext i1 %R4059 to i32
  %R4062 = fcmp oeq double %load_target20, %R4052
  %R406225 = zext i1 %R4062 to i32
  %4 = icmp ne i32 %R405924, 0
  %5 = icmp ne i32 %R406225, 0
  %R4063 = and i1 %4, %5
  %R406326 = zext i1 %R4063 to i32
  %cond27 = icmp ne i32 %R406326, 0
  br i1 %cond27, label %L499, label %L501

L499:                                             ; preds = %L498
  %load_target28 = load i32, i32* @N
  %R4065 = icmp sgt i32 %load_target28, 0
  %R406529 = zext i1 %R4065 to i32
  %cond30 = icmp ne i32 %R406529, 0
  br i1 %cond30, label %L500, label %L510

L500:                                             ; preds = %L499
  call void @Pause()
  br label %L510

L501:                                             ; preds = %L498
  store i32 1, i32* @N
  call void @BadCond(i32 2, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.275, i64 0, i64 0))
  %load_target31 = load double, double* @Z
  %R4069 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.276, i64 0, i64 0), double %load_target31)
  %load_target32 = load double, double* @Z
  %load_target33 = load double, double* @Random1
  %R4072 = fcmp une double %load_target32, %load_target33
  %R407234 = zext i1 %R4072 to i32
  %cond35 = icmp ne i32 %R407234, 0
  br i1 %cond35, label %L502, label %L503

L502:                                             ; preds = %L501
  %R4075 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.277, i64 0, i64 0), double %load_target33)
  br label %L503

L503:                                             ; preds = %L502, %L501
  %load_target36 = load double, double* @Z
  %load_target37 = load double, double* @Random2
  %R4078 = fcmp oeq double %load_target36, %load_target37
  %R407838 = zext i1 %R4078 to i32
  %load_target39 = load double, double* @Random1
  %R4081 = fcmp oeq double %load_target37, %load_target39
  %R408140 = zext i1 %R4081 to i32
  %6 = icmp ne i32 %R407838, 0
  %7 = icmp ne i32 %R408140, 0
  %R4082 = or i1 %6, %7
  %R408241 = zext i1 %R4082 to i32
  %cond42 = icmp ne i32 %R408241, 0
  br i1 %cond42, label %L505, label %L504

L504:                                             ; preds = %L503
  %R4085 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.278, i64 0, i64 0), double %load_target37)
  br label %L505

L505:                                             ; preds = %L504, %L503
  %load_target43 = load double, double* @Z
  %load_target44 = load double, double* @V9
  %R4088 = fcmp oeq double %load_target43, %load_target44
  %R408845 = zext i1 %R4088 to i32
  %cond46 = icmp ne i32 %R408845, 0
  br i1 %cond46, label %L507, label %L506

L506:                                             ; preds = %L505
  %R4091 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.279, i64 0, i64 0), double %load_target44)
  br label %L507

L507:                                             ; preds = %L506, %L505
  %load_target47 = load double, double* @Random2
  %load_target48 = load double, double* @Random1
  %R4094 = fcmp une double %load_target47, %load_target48
  %R409449 = zext i1 %R4094 to i32
  %cond50 = icmp ne i32 %R409449, 0
  br i1 %cond50, label %L508, label %L509

L508:                                             ; preds = %L507
  %load_target51 = load i32, i32* bitcast (i8* getelementptr inbounds (i8, i8* bitcast ([4 x i32]* @ErrCnt to i8*), i64 8) to i32*)
  %R4096 = add i32 %load_target51, 1
  store i32 %R4096, i32* bitcast (i8* getelementptr inbounds (i8, i8* bitcast ([4 x i32]* @ErrCnt to i8*), i64 8) to i32*)
  call void @BadCond(i32 2, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.280, i64 0, i64 0))
  %load_target52 = load double, double* @Random2
  %R4100 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.281, i64 0, i64 0), double %load_target52)
  %load_target53 = load double, double* @Random1
  %R4103 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.282, i64 0, i64 0), double %load_target53)
  br label %L509

L509:                                             ; preds = %L508, %L507
  call void @Pause()
  br label %L510

L510:                                             ; preds = %L509, %L500, %L499, %L491
  ret void
}

declare double @fabs(double)

declare double @floor(double)

declare double @log(double)

define void @BadCond(i32 %ARG1, i8* %ARG2) {
L457:
  %R3758 = sext i32 %ARG1 to i64
  %R3759 = mul i64 %R3758, 4
  %0 = getelementptr inbounds i8, i8* bitcast ([4 x i32]* @ErrCnt to i8*), i64 %R3759
  %1 = bitcast i8* %0 to i32*
  %2 = bitcast i32* %1 to i8*
  %3 = getelementptr inbounds i8, i8* %2, i64 0
  %4 = bitcast i8* %3 to i32*
  %load_target = load i32, i32* %4
  %R3762 = add i32 %load_target, 1
  %5 = bitcast i32* %1 to i8*
  %6 = getelementptr inbounds i8, i8* %5, i64 0
  %7 = bitcast i8* %6 to i32*
  store i32 %R3762, i32* %7
  %R3772 = mul i64 %R3758, 8
  %8 = getelementptr inbounds i8, i8* bitcast ([4 x i8*]* @msg2 to i8*), i64 %R3772
  %9 = bitcast i8* %8 to i8**
  %10 = bitcast i8** %9 to i8*
  %11 = getelementptr inbounds i8, i8* %10, i64 0
  %12 = bitcast i8* %11 to i8**
  %load_target1 = load i8*, i8** %12
  %R3776 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.257, i64 0, i64 0), i8* %load_target1, i8* %ARG2)
  ret void
}

define void @notify(i8* %ARG1) {
L511:
  %R4106 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.283, i64 0, i64 0), i8* %ARG1)
  %R4108 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.284, i64 0, i64 0))
  ret void
}

declare double @sqrt(double)

define double @Random() {
L458:
  %0 = alloca double
  %load_target = load double, double* @Random1
  %load_target1 = load double, double* @Random9
  %R3779 = fadd double %load_target, %load_target1
  %R3782 = fmul double %R3779, %R3779
  %R3785 = fmul double %R3782, %R3782
  %R3788 = fmul double %R3779, %R3785
  %R3791 = call double @floor(double %R3788)
  %R3792 = fsub double %R3788, %R3791
  %R3796 = fmul double %R3788, 5.000000e-06
  %R3797 = fadd double %R3792, %R3796
  store double %R3797, double* @Random1
  store double %R3797, double* %0
  %1 = load double, double* %0
  ret double %R3797
}

define void @SqXMinX(i32 %ARG1) {
L459:
  %0 = alloca double
  %load_target = load double, double* @X
  %load_target1 = load double, double* @BInvrse
  %R3802 = fmul double %load_target, %load_target1
  %R3805 = fsub double %load_target, %R3802
  %R3808 = fmul double %load_target, %load_target
  %R3809 = call double @sqrt(double %R3808)
  %R3811 = fsub double %R3809, %R3802
  %R3813 = fsub double %R3811, %R3805
  %load_target2 = load double, double* @OneUlp
  %R3815 = fdiv double %R3813, %load_target2
  store double %R3815, double* @SqEr
  %load_target3 = load double, double* @Zero
  %R3818 = fcmp une double %R3815, %load_target3
  %R38184 = zext i1 %R3818 to i32
  %cond = icmp ne i32 %R38184, 0
  br i1 %cond, label %L460, label %L465

L460:                                             ; preds = %L459
  %load_target5 = load double, double* @MinSqEr
  %R3821 = fcmp olt double %R3815, %load_target5
  %R38216 = zext i1 %R3821 to i32
  store double %R3815, double* %0
  %cond7 = icmp ne i32 %R38216, 0
  br i1 %cond7, label %L461, label %L462

L461:                                             ; preds = %L460
  store double %R3815, double* @MinSqEr
  store double %R3815, double* %0
  br label %L462

L462:                                             ; preds = %L461, %L460
  %1 = load double, double* %0
  %load_target8 = load double, double* @MaxSqEr
  %R3825 = fcmp ogt double %1, %load_target8
  %R38259 = zext i1 %R3825 to i32
  %cond10 = icmp ne i32 %R38259, 0
  br i1 %cond10, label %L463, label %L464

L463:                                             ; preds = %L462
  store double %1, double* @MaxSqEr
  br label %L464

L464:                                             ; preds = %L463, %L462
  %load_target11 = load double, double* @J
  %R3829 = fadd double %load_target11, 1.000000e+00
  store double %R3829, double* @J
  call void @BadCond(i32 %ARG1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.258, i64 0, i64 0))
  %load_target12 = load double, double* @X
  %R3835 = fmul double %load_target12, %load_target12
  %load_target13 = load double, double* @OneUlp
  %load_target14 = load double, double* @SqEr
  %R3839 = fmul double %load_target13, %load_target14
  %R3840 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.259, i64 0, i64 0), double %R3835, double %load_target12, double %R3839)
  %R3842 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.260, i64 0, i64 0))
  br label %L465

L465:                                             ; preds = %L464, %L459
  ret void
}

define double @Sign(double %ARG1) {
L452:
  %0 = alloca double
  %R3738 = fcmp oge double %ARG1, 0.000000e+00
  %R37381 = zext i1 %R3738 to i32
  %cond = icmp ne i32 %R37381, 0
  %select = select i1 %cond, double 1.000000e+00, double -1.000000e+00
  store double %select, double* %0
  %1 = load double, double* %0
  ret double %select
}

declare double @pow(double, double)

define void @NewD() {
L466:
  %load_target = load double, double* @Z1
  %load_target1 = load double, double* @Q
  %R3845 = fmul double %load_target, %load_target1
  store double %R3845, double* @X
  %load_target2 = load double, double* @Half
  %load_target3 = load double, double* @Radix
  %R3849 = fdiv double %R3845, %load_target3
  %R3850 = fsub double %load_target2, %R3849
  %R3851 = call double @floor(double %R3850)
  %load_target4 = load double, double* @Radix
  %R3853 = fmul double %R3851, %load_target4
  %load_target5 = load double, double* @X
  %R3855 = fadd double %R3853, %load_target5
  store double %R3855, double* @X
  %load_target6 = load double, double* @Q
  %load_target7 = load double, double* @Z
  %R3859 = fmul double %R3855, %load_target7
  %R3860 = fsub double %load_target6, %R3859
  %R3862 = fdiv double %R3860, %load_target4
  %R3865 = fmul double %R3855, %R3855
  %load_target8 = load double, double* @D
  %R3868 = fdiv double %load_target8, %load_target4
  %R3869 = fmul double %R3865, %R3868
  %R3870 = fadd double %R3862, %R3869
  store double %R3870, double* @Q
  %load_target9 = load double, double* @Two
  %R3874 = fmul double %load_target9, %R3855
  %R3876 = fmul double %R3874, %load_target8
  %R3877 = fsub double %load_target7, %R3876
  store double %R3877, double* @Z
  %load_target10 = load double, double* @Zero
  %R3880 = fcmp ole double %R3877, %load_target10
  %R388011 = zext i1 %R3880 to i32
  %cond = icmp ne i32 %R388011, 0
  br i1 %cond, label %L467, label %L468

L467:                                             ; preds = %L466
  %R3882 = fsub double -0.000000e+00, %R3877
  store double %R3882, double* @Z
  %load_target12 = load double, double* @Z1
  %R3884 = fsub double -0.000000e+00, %load_target12
  store double %R3884, double* @Z1
  br label %L468

L468:                                             ; preds = %L467, %L466
  %R3887 = fmul double %load_target4, %load_target8
  store double %R3887, double* @D
  ret void
}

define void @SR3750() {
L469:
  %load_target = load double, double* @X
  %load_target1 = load double, double* @Radix
  %R3890 = fsub double %load_target, %load_target1
  %load_target2 = load double, double* @Z2
  %R3893 = fsub double %load_target2, %load_target1
  %R3894 = fcmp olt double %R3890, %R3893
  %R38943 = zext i1 %R3894 to i32
  %cond = icmp ne i32 %R38943, 0
  br i1 %cond, label %L475, label %L470

L470:                                             ; preds = %L469
  %R3897 = fsub double %load_target, %load_target2
  %load_target4 = load double, double* @W
  %R3900 = fsub double %load_target4, %load_target2
  %R3901 = fcmp ogt double %R3897, %R3900
  %R39015 = zext i1 %R3901 to i32
  %cond6 = icmp ne i32 %R39015, 0
  br i1 %cond6, label %L475, label %L471

L471:                                             ; preds = %L470
  %load_target7 = load i32, i32* @I
  %R3903 = add i32 %load_target7, 1
  store i32 %R3903, i32* @I
  %load_target8 = load double, double* @D
  %R3906 = fmul double %load_target, %load_target8
  %R3907 = call double @sqrt(double %R3906)
  %load_target9 = load double, double* @Z2
  %R3910 = fsub double %R3907, %load_target9
  %load_target10 = load double, double* @Y
  %R3913 = fsub double %load_target10, %load_target9
  %R3914 = fsub double %R3910, %R3913
  store double %R3914, double* @Y2
  %load_target11 = load double, double* @X8
  %load_target12 = load double, double* @Half
  %R3918 = fsub double %load_target10, %load_target12
  %R3919 = fdiv double %load_target11, %R3918
  %R3923 = fmul double %load_target12, %R3919
  %R3925 = fmul double %R3923, %R3919
  %R3926 = fsub double %R3919, %R3925
  store double %R3926, double* @X2
  %R3929 = fadd double %R3914, %load_target12
  %R3932 = fsub double %load_target12, %R3926
  %R3933 = fadd double %R3929, %R3932
  store double %R3933, double* @SqEr
  %load_target13 = load double, double* @MinSqEr
  %R3936 = fcmp olt double %R3933, %load_target13
  %R393614 = zext i1 %R3936 to i32
  %cond15 = icmp ne i32 %R393614, 0
  br i1 %cond15, label %L472, label %L473

L472:                                             ; preds = %L471
  store double %R3933, double* @MinSqEr
  br label %L473

L473:                                             ; preds = %L472, %L471
  %R3940 = fsub double %R3914, %R3926
  store double %R3940, double* @SqEr
  %load_target16 = load double, double* @MaxSqEr
  %R3943 = fcmp ogt double %R3940, %load_target16
  %R394317 = zext i1 %R3943 to i32
  %cond18 = icmp ne i32 %R394317, 0
  br i1 %cond18, label %L474, label %L475

L474:                                             ; preds = %L473
  store double %R3940, double* @MaxSqEr
  br label %L475

L475:                                             ; preds = %L474, %L473, %L470, %L469
  ret void
}

define void @SR3980() {
L484:
  br label %L485

L485:                                             ; preds = %L486, %L484
  %load_target = load i32, i32* @I
  %R3978 = sitofp i32 %load_target to double
  store double %R3978, double* @Q
  %load_target1 = load double, double* @Z
  %R3981 = call double @pow(double %load_target1, double %R3978)
  store double %R3981, double* @Y
  call void @IsYeqX()
  %load_target2 = load i32, i32* @I
  %R3983 = add i32 %load_target2, 1
  store i32 %R3983, i32* @I
  %load_target3 = load i32, i32* @M
  %R3985 = icmp sgt i32 %R3983, %load_target3
  %R39854 = zext i1 %R3985 to i32
  %cond = icmp ne i32 %R39854, 0
  br i1 %cond, label %L487, label %L486

L486:                                             ; preds = %L485
  %load_target5 = load double, double* @Z
  %load_target6 = load double, double* @X
  %R3988 = fmul double %load_target5, %load_target6
  store double %R3988, double* @X
  %load_target7 = load double, double* @W
  %R3991 = fcmp olt double %R3988, %load_target7
  %R39918 = zext i1 %R3991 to i32
  %cond9 = icmp ne i32 %R39918, 0
  br i1 %cond9, label %L485, label %L487

L487:                                             ; preds = %L486, %L485
  ret void
}

define void @PrintIfNPositive() {
L488:
  %load_target = load i32, i32* @N
  %R3993 = icmp sgt i32 %load_target, 0
  %R39931 = zext i1 %R3993 to i32
  %cond = icmp ne i32 %R39931, 0
  br i1 %cond, label %L489, label %L490

L489:                                             ; preds = %L488
  %R3996 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.267, i64 0, i64 0), i32 %load_target)
  br label %L490

L490:                                             ; preds = %L489, %L488
  ret void
}

declare i32 @_setjmp(%struct.__jmp_buf_tag*)

define void @IsYeqX() {
L476:
  %load_target = load double, double* @Y
  %load_target1 = load double, double* @X
  %R3947 = fcmp une double %load_target, %load_target1
  %R39472 = zext i1 %R3947 to i32
  %cond = icmp ne i32 %R39472, 0
  br i1 %cond, label %L477, label %L483

L477:                                             ; preds = %L476
  %load_target3 = load i32, i32* @N
  %R3949 = icmp sle i32 %load_target3, 0
  %R39494 = zext i1 %R3949 to i32
  %cond5 = icmp ne i32 %R39494, 0
  br i1 %cond5, label %L478, label %L482

L478:                                             ; preds = %L477
  %load_target6 = load double, double* @Z
  %load_target7 = load double, double* @Zero
  %R3952 = fcmp oeq double %load_target6, %load_target7
  %R39528 = zext i1 %R3952 to i32
  %load_target9 = load double, double* @Q
  %R3955 = fcmp ole double %load_target9, %load_target7
  %R395510 = zext i1 %R3955 to i32
  %0 = icmp ne i32 %R39528, 0
  %1 = icmp ne i32 %R395510, 0
  %R3956 = and i1 %0, %1
  %R395611 = zext i1 %R3956 to i32
  %cond12 = icmp ne i32 %R395611, 0
  br i1 %cond12, label %L479, label %L480

L479:                                             ; preds = %L478
  %R3958 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.261, i64 0, i64 0))
  br label %L481

L480:                                             ; preds = %L478
  call void @BadCond(i32 2, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.262, i64 0, i64 0))
  br label %L481

L481:                                             ; preds = %L480, %L479
  %load_target13 = load double, double* @Z
  %load_target14 = load double, double* @Q
  %R3963 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.263, i64 0, i64 0), double %load_target13, double %load_target14)
  %load_target15 = load double, double* @Y
  %R3966 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.264, i64 0, i64 0), double %load_target15)
  %load_target16 = load double, double* @X
  %R3969 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.265, i64 0, i64 0), double %load_target16)
  %load_target17 = load double, double* @Y
  %load_target18 = load double, double* @X
  %R3973 = fsub double %load_target17, %load_target18
  %R3974 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.266, i64 0, i64 0), double %R3973)
  br label %L482

L482:                                             ; preds = %L481, %L477
  %load_target19 = load i32, i32* @N
  %R3976 = add i32 %load_target19, 1
  store i32 %R3976, i32* @N
  br label %L483

L483:                                             ; preds = %L482, %L476
  ret void
}

define void @msglist(i8** %ARG1) {
L512:
  %0 = alloca i8**
  store i8** %ARG1, i8*** %0
  br label %L513

L513:                                             ; preds = %L514, %L512
  %1 = load i8**, i8*** %0
  %2 = bitcast i8** %1 to i8*
  %3 = getelementptr inbounds i8, i8* %2, i64 0
  %4 = bitcast i8* %3 to i8**
  %load_target = load i8*, i8** %4
  %cond = icmp ne i8* %load_target, null
  br i1 %cond, label %L514, label %L515

L514:                                             ; preds = %L513
  %5 = bitcast i8** %1 to i8*
  %6 = getelementptr inbounds i8, i8* %5, i8** inttoptr (i64 8 to i8**)
  %7 = bitcast i8* %6 to i8**
  %8 = bitcast i8** %1 to i8*
  %9 = getelementptr inbounds i8, i8* %8, i64 0
  %10 = bitcast i8* %9 to i8**
  %load_target1 = load i8*, i8** %10
  %R4115 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.285, i64 0, i64 0), i8* %load_target1)
  store i8** %7, i8*** %0
  br label %L513

L515:                                             ; preds = %L513
  ret void
}
