; ModuleID = 'out.bc'
source_filename = "sparse"

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

define internal void @BadCond(i32 %ARG1, i8* %ARG2) {
L0:
  %R3 = sext i32 %ARG1 to i64
  %R4 = mul i64 %R3, 4
  %R5 = add i64 ptrtoint ([4 x i32]* @ErrCnt to i64), %R4
  %0 = inttoptr i64 %R5 to i32*
  %1 = ptrtoint i32* %0 to i64
  %2 = add i64 %1, 0
  %3 = inttoptr i64 %2 to i32*
  %load_target = load i32, i32* %3
  %R7 = add i32 %load_target, 1
  %4 = ptrtoint i32* %0 to i64
  %5 = add i64 %4, 0
  %6 = inttoptr i64 %5 to i32*
  store i32 %R7, i32* %6
  %R17 = mul i64 %R3, 8
  %R18 = add i64 ptrtoint ([4 x i8*]* @msg2 to i64), %R17
  %7 = inttoptr i64 %R18 to i8**
  %8 = ptrtoint i8** %7 to i64
  %9 = add i64 %8, 0
  %10 = inttoptr i64 %9 to i8**
  %load_target1 = load i8*, i8** %10
  %R21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), i8* %load_target1, i8* %ARG2)
  ret void
}

declare i32 @printf(i8*, ...)

define internal void @TstCond(i32 %ARG1, i32 %ARG2, i8* %ARG3) {
L1:
  %cond = icmp ne i32 %ARG2, 0
  br i1 %cond, label %L3, label %L2

L2:                                               ; preds = %L1
  call void @BadCond(i32 %ARG1, i8* %ARG3)
  %R26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0))
  br label %L3

L3:                                               ; preds = %L2, %L1
  ret void
}

define i32 @main() {
L4:
  %0 = alloca i32
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i64 0, i64 0), i8** getelementptr inbounds ([4 x i8*], [4 x i8*]* @msg2, i32 0, i32 0)
  store i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0), i8** inttoptr (i64 add (i64 ptrtoint ([4 x i8*]* @msg2 to i64), i64 8) to i8**)
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.4, i64 0, i64 0), i8** inttoptr (i64 add (i64 ptrtoint ([4 x i8*]* @msg2 to i64), i64 16) to i8**)
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i64 0, i64 0), i8** inttoptr (i64 add (i64 ptrtoint ([4 x i8*]* @msg2 to i64), i64 24) to i8**)
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
  br i1 true, label %L5, label %L7

L5:                                               ; preds = %L4
  %R89 = call double @fabs(double 1.000000e+00)
  %R90 = fadd double -1.000000e+00, %R89
  %load_target = load double, double* @Zero
  %R92 = fcmp oeq double %R90, %load_target
  %R921 = zext i1 %R92 to i32
  %cond = icmp ne i32 %R921, 0
  br i1 %cond, label %L6, label %L7

L6:                                               ; preds = %L5
  %load_target2 = load double, double* @MinusOne
  %R96 = fmul double %load_target2, %load_target2
  %R97 = fadd double %load_target2, %R96
  %R99 = fcmp oeq double %R97, %load_target
  %R993 = zext i1 %R99 to i32
  store i32 %R993, i32* %0
  br label %L8

L7:                                               ; preds = %L5, %L4
  store i32 0, i32* %0
  br label %L8

L8:                                               ; preds = %L7, %L6
  %1 = load i32, i32* %0
  call void @TstCond(i32 0, i32 %1, i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.6, i64 0, i64 0))
  %load_target4 = load double, double* @Half
  %load_target5 = load double, double* @MinusOne
  %R104 = fadd double %load_target4, %load_target5
  %R106 = fadd double %R104, %load_target4
  %load_target6 = load double, double* @Zero
  %R108 = fcmp oeq double %R106, %load_target6
  %R1087 = zext i1 %R108 to i32
  call void @TstCond(i32 0, i32 %R1087, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.7, i64 0, i64 0))
  ret i32 0
}

declare double @fabs(double)
