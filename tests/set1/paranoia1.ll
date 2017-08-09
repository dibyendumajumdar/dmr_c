; ModuleID = 'out.bc'
source_filename = "dmrC"

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
@msg2 = private global [4 x i8*] zeroinitializer, align 8
@ErrCnt = private global [4 x i32] zeroinitializer, align 4
@.str = private constant [8 x i8] c"%s:  %s\00"
@.str.1 = private constant [3 x i8] c".\0A\00"
@.str.2 = private constant [8 x i8] c"FAILURE\00"
@.str.3 = private constant [15 x i8] c"SERIOUS DEFECT\00"
@.str.4 = private constant [7 x i8] c"DEFECT\00"
@.str.5 = private constant [5 x i8] c"FLAW\00"
@.str.6 = private constant [50 x i8] c"-1+1 != 0, (-1)+abs(1) != 0, or -1+(-1)*(-1) != 0\00"
@.str.7 = private constant [22 x i8] c"1/2 + (-1) + 1/2 != 0\00"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define internal void @BadCond(i32 %ARG1, i8* %ARG2) {
L0:
  %T_000002765A0EDD28. = alloca i8*
  %K_000002765A0EDC48. = alloca i32
  %K_000002765A0EDC48.1 = ptrtoint i32* %K_000002765A0EDC48. to i64
  %0 = add i64 %K_000002765A0EDC48.1, 0
  %1 = inttoptr i64 %0 to i32*
  store i32 %ARG1, i32* %1
  %T_000002765A0EDD28.2 = ptrtoint i8** %T_000002765A0EDD28. to i64
  %2 = add i64 %T_000002765A0EDD28.2, 0
  %3 = inttoptr i64 %2 to i8**
  store i8* %ARG2, i8** %3
  %K_000002765A0EDC48.3 = ptrtoint i32* %K_000002765A0EDC48. to i64
  %4 = add i64 %K_000002765A0EDC48.3, 0
  %5 = inttoptr i64 %4 to i32*
  %R2 = load i32, i32* %5
  %R3 = sext i32 %R2 to i64
  %R4 = mul i64 %R3, 4
  %R5 = add i64 ptrtoint ([4 x i32]* @ErrCnt to i64), %R4
  %R54 = inttoptr i64 %R5 to i32*
  %R545 = ptrtoint i32* %R54 to i64
  %6 = add i64 %R545, 0
  %7 = inttoptr i64 %6 to i32*
  %R6 = load i32, i32* %7
  %R7 = add i32 %R6, 1
  %K_000002765A0EDC48.6 = ptrtoint i32* %K_000002765A0EDC48. to i64
  %8 = add i64 %K_000002765A0EDC48.6, 0
  %9 = inttoptr i64 %8 to i32*
  %R9 = load i32, i32* %9
  %R10 = sext i32 %R9 to i64
  %R11 = mul i64 %R10, 4
  %R12 = add i64 ptrtoint ([4 x i32]* @ErrCnt to i64), %R11
  %R127 = inttoptr i64 %R12 to i32*
  %R1278 = ptrtoint i32* %R127 to i64
  %10 = add i64 %R1278, 0
  %11 = inttoptr i64 %10 to i32*
  store i32 %R7, i32* %11
  %K_000002765A0EDC48.9 = ptrtoint i32* %K_000002765A0EDC48. to i64
  %12 = add i64 %K_000002765A0EDC48.9, 0
  %13 = inttoptr i64 %12 to i32*
  %R15 = load i32, i32* %13
  %R16 = sext i32 %R15 to i64
  %R17 = mul i64 %R16, 8
  %R18 = add i64 ptrtoint ([4 x i8*]* @msg2 to i64), %R17
  %R1810 = inttoptr i64 %R18 to i8**
  %R181011 = ptrtoint i8** %R1810 to i64
  %14 = add i64 %R181011, 0
  %15 = inttoptr i64 %14 to i8**
  %R19 = load i8*, i8** %15
  %T_000002765A0EDD28.12 = ptrtoint i8** %T_000002765A0EDD28. to i64
  %16 = add i64 %T_000002765A0EDD28.12, 0
  %17 = inttoptr i64 %16 to i8**
  %R20 = load i8*, i8** %17
  %R21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), i8* %R19, i8* %R20)
  br label %L1

L1:                                               ; preds = %L0
  ret void
}

declare i32 @printf(i8*, ...)

define internal void @TstCond(i32 %ARG1, i32 %ARG2, i8* %ARG3) {
L2:
  %T_000002765A0EE348. = alloca i8*
  %Valid_000002765A0EE268. = alloca i32
  %K_000002765A0EE188. = alloca i32
  %K_000002765A0EE188.1 = ptrtoint i32* %K_000002765A0EE188. to i64
  %0 = add i64 %K_000002765A0EE188.1, 0
  %1 = inttoptr i64 %0 to i32*
  store i32 %ARG1, i32* %1
  %Valid_000002765A0EE268.2 = ptrtoint i32* %Valid_000002765A0EE268. to i64
  %2 = add i64 %Valid_000002765A0EE268.2, 0
  %3 = inttoptr i64 %2 to i32*
  store i32 %ARG2, i32* %3
  %T_000002765A0EE348.3 = ptrtoint i8** %T_000002765A0EE348. to i64
  %4 = add i64 %T_000002765A0EE348.3, 0
  %5 = inttoptr i64 %4 to i8**
  store i8* %ARG3, i8** %5
  %Valid_000002765A0EE268.4 = ptrtoint i32* %Valid_000002765A0EE268. to i64
  %6 = add i64 %Valid_000002765A0EE268.4, 0
  %7 = inttoptr i64 %6 to i32*
  %R22 = load i32, i32* %7
  %cond = icmp ne i32 %R22, 0
  br i1 %cond, label %L4, label %L3

L3:                                               ; preds = %L2
  %K_000002765A0EE188.5 = ptrtoint i32* %K_000002765A0EE188. to i64
  %8 = add i64 %K_000002765A0EE188.5, 0
  %9 = inttoptr i64 %8 to i32*
  %R23 = load i32, i32* %9
  %T_000002765A0EE348.6 = ptrtoint i8** %T_000002765A0EE348. to i64
  %10 = add i64 %T_000002765A0EE348.6, 0
  %11 = inttoptr i64 %10 to i8**
  %R24 = load i8*, i8** %11
  call void @BadCond(i32 %R23, i8* %R24)
  %R26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0))
  br label %L4

L4:                                               ; preds = %L3, %L2
  ret void
}

define i32 @main() {
L5:
  %0 = alloca i32
  %1 = alloca i32
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i64 0, i64 0), i8** getelementptr inbounds ([4 x i8*], [4 x i8*]* @msg2, i32 0, i32 0)
  store i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0), i8** inttoptr (i64 add (i64 ptrtoint ([4 x i8*]* @msg2 to i64), i64 8) to i8**)
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.4, i64 0, i64 0), i8** inttoptr (i64 add (i64 ptrtoint ([4 x i8*]* @msg2 to i64), i64 16) to i8**)
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i64 0, i64 0), i8** inttoptr (i64 add (i64 ptrtoint ([4 x i8*]* @msg2 to i64), i64 24) to i8**)
  store double 0.000000e+00, double* @Zero
  store double 1.000000e+00, double* @One
  %R31 = load double, double* @One
  %R32 = load double, double* @One
  %R33 = fadd double %R31, %R32
  store double %R33, double* @Two
  %R34 = load double, double* @Two
  %R35 = load double, double* @One
  %R36 = fadd double %R34, %R35
  store double %R36, double* @Three
  %R37 = load double, double* @Three
  %R38 = load double, double* @One
  %R39 = fadd double %R37, %R38
  store double %R39, double* @Four
  %R40 = load double, double* @Four
  %R41 = load double, double* @One
  %R42 = fadd double %R40, %R41
  store double %R42, double* @Five
  %R43 = load double, double* @Four
  %R44 = load double, double* @Four
  %R45 = fadd double %R43, %R44
  store double %R45, double* @Eight
  %R46 = load double, double* @Three
  %R47 = load double, double* @Three
  %R48 = fmul double %R46, %R47
  store double %R48, double* @Nine
  %R49 = load double, double* @Nine
  %R50 = load double, double* @Three
  %R51 = fmul double %R49, %R50
  store double %R51, double* @TwentySeven
  %R52 = load double, double* @Four
  %R53 = load double, double* @Eight
  %R54 = fmul double %R52, %R53
  store double %R54, double* @ThirtyTwo
  %R55 = load double, double* @Four
  %R56 = load double, double* @Five
  %R57 = fmul double %R55, %R56
  %R58 = load double, double* @Three
  %R59 = fmul double %R57, %R58
  %R60 = load double, double* @Four
  %R61 = fmul double %R59, %R60
  store double %R61, double* @TwoForty
  %R62 = load double, double* @One
  %R63 = fsub double -0.000000e+00, %R62
  store double %R63, double* @MinusOne
  %R64 = load double, double* @One
  %R65 = load double, double* @Two
  %R66 = fdiv double %R64, %R65
  store double %R66, double* @Half
  %R67 = load double, double* @One
  %R68 = load double, double* @Half
  %R69 = fadd double %R67, %R68
  store double %R69, double* @OneAndHalf
  %R70 = load double, double* @MinusOne
  %R72 = load double, double* @One
  %R73 = fsub double 0.000000e+00, %R72
  %R74 = fcmp oeq double %R70, %R73
  %R741 = zext i1 %R74 to i32
  %R75 = load double, double* @MinusOne
  %R76 = load double, double* @One
  %R77 = fadd double %R75, %R76
  %R78 = load double, double* @Zero
  %R79 = fcmp oeq double %R77, %R78
  %R792 = zext i1 %R79 to i32
  %2 = icmp ne i32 %R741, 0
  %3 = icmp ne i32 %R792, 0
  %R80 = and i1 %2, %3
  %R803 = zext i1 %R80 to i32
  %R81 = load double, double* @One
  %R82 = load double, double* @MinusOne
  %R83 = fadd double %R81, %R82
  %R84 = load double, double* @Zero
  %R85 = fcmp oeq double %R83, %R84
  %R854 = zext i1 %R85 to i32
  %4 = icmp ne i32 %R803, 0
  %5 = icmp ne i32 %R854, 0
  %R86 = and i1 %4, %5
  %R865 = zext i1 %R86 to i32
  %cond = icmp ne i32 %R865, 0
  br i1 %cond, label %L6, label %L8

L6:                                               ; preds = %L5
  %R87 = load double, double* @MinusOne
  %R88 = load double, double* @One
  %R89 = call double @fabs(double %R88)
  %R90 = fadd double %R87, %R89
  %R91 = load double, double* @Zero
  %R92 = fcmp oeq double %R90, %R91
  %R926 = zext i1 %R92 to i32
  %cond7 = icmp ne i32 %R926, 0
  br i1 %cond7, label %L7, label %L8

L7:                                               ; preds = %L6
  %R93 = load double, double* @MinusOne
  %R94 = load double, double* @MinusOne
  %R95 = load double, double* @MinusOne
  %R96 = fmul double %R94, %R95
  %R97 = fadd double %R93, %R96
  %R98 = load double, double* @Zero
  %R99 = fcmp oeq double %R97, %R98
  %R998 = zext i1 %R99 to i32
  store i32 %R998, i32* %0
  br label %L9

L8:                                               ; preds = %L6, %L5
  store i32 0, i32* %0
  br label %L9

L9:                                               ; preds = %L8, %L7
  %6 = load i32, i32* %0
  call void @TstCond(i32 0, i32 %6, i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.6, i64 0, i64 0))
  %R102 = load double, double* @Half
  %R103 = load double, double* @MinusOne
  %R104 = fadd double %R102, %R103
  %R105 = load double, double* @Half
  %R106 = fadd double %R104, %R105
  %R107 = load double, double* @Zero
  %R108 = fcmp oeq double %R106, %R107
  %R1089 = zext i1 %R108 to i32
  call void @TstCond(i32 0, i32 %R1089, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.7, i64 0, i64 0))
  store i32 0, i32* %1
  br label %L10

L10:                                              ; preds = %L9
  %7 = load i32, i32* %1
  ret i32 0
}

declare double @fabs(double)

attributes #0 = { argmemonly nounwind }
