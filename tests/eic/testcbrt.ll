; ModuleID = 'out.bc'
source_filename = "sparse"

%union.anno = type { [8 x i8] }

@B1 = private constant i32 715094163, align 4
@B2 = private constant i32 696219795, align 4
@C = private constant double 0x3FE15F1600000000, align 8
@D = private constant double 0xBFE691DE20000000, align 8
@E = private constant double 0x3FF6A0EA00000000, align 8
@F = private constant double 0x3FF9B6DB60000000, align 8
@G = private constant double 0x3FD6DB6DC0000000, align 8
@.str = private constant [13 x i8] c"Failed test\0A\00"
@.str.1 = private constant [13 x i8] c"Passed test\0A\00"

define internal double @cbrtl(double %ARG1) {
L0:
  %ux_000002431C5DBC28 = alloca %union.anno
  %ut_000002431C5DBB48 = alloca %union.anno
  %0 = alloca double
  %1 = bitcast %union.anno* %ut_000002431C5DBB48 to double*
  %2 = bitcast double* %1 to i8*
  %3 = getelementptr inbounds i8, i8* %2, i64 0
  %4 = bitcast i8* %3 to double*
  store double 1.000000e+00, double* %4
  %5 = bitcast %union.anno* %ut_000002431C5DBB48 to i32*
  %6 = bitcast i32* %5 to i8*
  %7 = getelementptr inbounds i8, i8* %6, i64 0
  %8 = bitcast i8* %7 to i32*
  %load_target = load i32, i32* %8
  %R3 = icmp eq i32 %load_target, 0
  %R31 = zext i1 %R3 to i32
  %9 = bitcast %union.anno* %ut_000002431C5DBB48 to double*
  %10 = bitcast double* %9 to i8*
  %11 = getelementptr inbounds i8, i8* %10, i64 0
  %12 = bitcast i8* %11 to double*
  store double 0.000000e+00, double* %12
  %13 = bitcast %union.anno* %ux_000002431C5DBC28 to double*
  %14 = bitcast double* %13 to i8*
  %15 = getelementptr inbounds i8, i8* %14, i64 0
  %16 = bitcast i8* %15 to double*
  store double %ARG1, double* %16
  %R6 = bitcast %union.anno* %ux_000002431C5DBC28 to i8*
  %R9 = sext i32 %R31 to i64
  %R10 = mul i64 %R9, 4
  %17 = getelementptr inbounds i8, i8* %R6, i64 %R10
  %18 = bitcast i8* %17 to i32*
  %19 = bitcast i32* %18 to i8*
  %20 = getelementptr inbounds i8, i8* %19, i64 0
  %21 = bitcast i8* %20 to i32*
  %load_target2 = load i32, i32* %21
  %R16 = and i32 %load_target2, -2147483648
  %R20 = xor i32 %load_target2, %R16
  %R23 = icmp sge i32 %R20, 2146435072
  %R233 = zext i1 %R23 to i32
  %cond = icmp ne i32 %R233, 0
  br i1 %cond, label %L1, label %L2

L1:                                               ; preds = %L0
  %R26 = fadd double %ARG1, %ARG1
  store double %R26, double* %0
  br label %L8

L2:                                               ; preds = %L0
  %R33 = sub i32 1, %R31
  %R34 = sext i32 %R33 to i64
  %R35 = mul i64 %R34, 4
  %22 = getelementptr inbounds i8, i8* %R6, i64 %R35
  %23 = bitcast i8* %22 to i32*
  %24 = bitcast i32* %23 to i8*
  %25 = getelementptr inbounds i8, i8* %24, i64 0
  %26 = bitcast i8* %25 to i32*
  %load_target4 = load i32, i32* %26
  %R38 = or i32 %R20, %load_target4
  %cond5 = icmp ne i32 %R38, 0
  br i1 %cond5, label %L4, label %L3

L3:                                               ; preds = %L2
  store double %ARG1, double* %0
  br label %L8

L4:                                               ; preds = %L2
  %27 = bitcast i8* %17 to i32*
  %28 = bitcast i32* %27 to i8*
  %29 = getelementptr inbounds i8, i8* %28, i64 0
  %30 = bitcast i8* %29 to i32*
  store i32 %R20, i32* %30
  %R50 = icmp slt i32 %R20, 1048576
  %R506 = zext i1 %R50 to i32
  %R51 = bitcast %union.anno* %ut_000002431C5DBB48 to i8*
  %31 = getelementptr inbounds i8, i8* %R51, i64 %R10
  %cond7 = icmp ne i32 %R506, 0
  br i1 %cond7, label %L5, label %L6

L5:                                               ; preds = %L4
  %32 = bitcast i8* %31 to i32*
  %33 = bitcast i32* %32 to i8*
  %34 = getelementptr inbounds i8, i8* %33, i64 0
  %35 = bitcast i8* %34 to i32*
  store i32 1129316352, i32* %35
  %36 = bitcast %union.anno* %ut_000002431C5DBB48 to double*
  %37 = bitcast double* %36 to i8*
  %38 = getelementptr inbounds i8, i8* %37, i64 0
  %39 = bitcast i8* %38 to double*
  %load_target8 = load double, double* %39
  %R60 = fmul double %load_target8, %ARG1
  %40 = bitcast %union.anno* %ut_000002431C5DBB48 to double*
  %41 = bitcast double* %40 to i8*
  %42 = getelementptr inbounds i8, i8* %41, i64 0
  %43 = bitcast i8* %42 to double*
  store double %R60, double* %43
  %44 = bitcast i8* %31 to i32*
  %45 = bitcast i32* %44 to i8*
  %46 = getelementptr inbounds i8, i8* %45, i64 0
  %47 = bitcast i8* %46 to i32*
  %load_target9 = load i32, i32* %47
  %R69 = udiv i32 %load_target9, 3
  %R70 = add i32 %R69, 696219795
  %48 = bitcast i8* %31 to i32*
  %49 = bitcast i32* %48 to i8*
  %50 = getelementptr inbounds i8, i8* %49, i64 0
  %51 = bitcast i8* %50 to i32*
  store i32 %R70, i32* %51
  br label %L7

L6:                                               ; preds = %L4
  %R78 = sdiv i32 %R20, 3
  %R80 = add i32 %R78, 715094163
  %52 = bitcast i8* %31 to i32*
  %53 = bitcast i32* %52 to i8*
  %54 = getelementptr inbounds i8, i8* %53, i64 0
  %55 = bitcast i8* %54 to i32*
  store i32 %R80, i32* %55
  br label %L7

L7:                                               ; preds = %L6, %L5
  %56 = bitcast %union.anno* %ut_000002431C5DBB48 to double*
  %57 = bitcast double* %56 to i8*
  %58 = getelementptr inbounds i8, i8* %57, i64 0
  %59 = bitcast i8* %58 to double*
  %load_target10 = load double, double* %59
  %R89 = fmul double %load_target10, %load_target10
  %60 = bitcast %union.anno* %ux_000002431C5DBC28 to double*
  %61 = bitcast double* %60 to i8*
  %62 = getelementptr inbounds i8, i8* %61, i64 0
  %63 = bitcast i8* %62 to double*
  %load_target11 = load double, double* %63
  %R91 = fdiv double %R89, %load_target11
  %R95 = fmul double %R91, %load_target10
  %R96 = fadd double 0x3FE15F1600000000, %R95
  %R101 = fadd double %R96, 0x3FF6A0EA00000000
  %R104 = fdiv double 0xBFE691DE20000000, %R96
  %R105 = fadd double %R101, %R104
  %R106 = fdiv double 0x3FF9B6DB60000000, %R105
  %R107 = fadd double 0x3FD6DB6DC0000000, %R106
  %R110 = fmul double %load_target10, %R107
  %64 = bitcast %union.anno* %ut_000002431C5DBB48 to double*
  %65 = bitcast double* %64 to i8*
  %66 = getelementptr inbounds i8, i8* %65, i64 0
  %67 = bitcast i8* %66 to double*
  store double %R110, double* %67
  %68 = getelementptr inbounds i8, i8* %R51, i64 %R35
  %69 = bitcast i8* %68 to i32*
  %70 = bitcast i32* %69 to i8*
  %71 = getelementptr inbounds i8, i8* %70, i64 0
  %72 = bitcast i8* %71 to i32*
  store i32 0, i32* %72
  %73 = bitcast i8* %31 to i32*
  %74 = bitcast i32* %73 to i8*
  %75 = getelementptr inbounds i8, i8* %74, i64 0
  %76 = bitcast i8* %75 to i32*
  %load_target12 = load i32, i32* %76
  %R127 = add i32 %load_target12, 1
  %77 = bitcast i8* %31 to i32*
  %78 = bitcast i32* %77 to i8*
  %79 = getelementptr inbounds i8, i8* %78, i64 0
  %80 = bitcast i8* %79 to i32*
  store i32 %R127, i32* %80
  %81 = bitcast %union.anno* %ut_000002431C5DBB48 to double*
  %82 = bitcast double* %81 to i8*
  %83 = getelementptr inbounds i8, i8* %82, i64 0
  %84 = bitcast i8* %83 to double*
  %load_target13 = load double, double* %84
  %R131 = fmul double %load_target13, %load_target13
  %85 = bitcast %union.anno* %ux_000002431C5DBC28 to double*
  %86 = bitcast double* %85 to i8*
  %87 = getelementptr inbounds i8, i8* %86, i64 0
  %88 = bitcast i8* %87 to double*
  %load_target14 = load double, double* %88
  %R134 = fdiv double %load_target14, %R131
  %R137 = fadd double %load_target13, %load_target13
  %R140 = fsub double %R134, %load_target13
  %R143 = fadd double %R137, %R134
  %R144 = fdiv double %R140, %R143
  %R148 = fmul double %load_target13, %R144
  %R149 = fadd double %load_target13, %R148
  %89 = bitcast %union.anno* %ut_000002431C5DBB48 to double*
  %90 = bitcast double* %89 to i8*
  %91 = getelementptr inbounds i8, i8* %90, i64 0
  %92 = bitcast i8* %91 to double*
  store double %R149, double* %92
  %93 = bitcast i8* %31 to i32*
  %94 = bitcast i32* %93 to i8*
  %95 = getelementptr inbounds i8, i8* %94, i64 0
  %96 = bitcast i8* %95 to i32*
  %load_target15 = load i32, i32* %96
  %R159 = or i32 %load_target15, %R16
  %97 = bitcast i8* %31 to i32*
  %98 = bitcast i32* %97 to i8*
  %99 = getelementptr inbounds i8, i8* %98, i64 0
  %100 = bitcast i8* %99 to i32*
  store i32 %R159, i32* %100
  %101 = bitcast %union.anno* %ut_000002431C5DBB48 to double*
  %102 = bitcast double* %101 to i8*
  %103 = getelementptr inbounds i8, i8* %102, i64 0
  %104 = bitcast i8* %103 to double*
  %load_target16 = load double, double* %104
  %R166 = fmul double %load_target16, %load_target16
  %R167 = fdiv double %ARG1, %R166
  %R168 = fsub double %load_target16, %R167
  %R170 = fmul double %R168, 0x3FD5555555555555
  %R173 = fsub double %load_target16, %R170
  store double %R173, double* %0
  br label %L8

L8:                                               ; preds = %L7, %L3, %L1
  %105 = load double, double* %0
  ret double %105
}

define i32 @main() {
L9:
  %R177 = call double @cbrtl(double 2.700000e+01)
  %R179 = fadd double %R177, 5.000000e-01
  %R180 = fptosi double %R179 to i32
  %R181 = icmp ne i32 %R180, 3
  %R1811 = zext i1 %R181 to i32
  %cond = icmp ne i32 %R1811, 0
  br i1 %cond, label %L10, label %L11

L10:                                              ; preds = %L9
  %R183 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0))
  br label %L12

L11:                                              ; preds = %L9
  %R185 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i64 0, i64 0))
  br label %L12

L12:                                              ; preds = %L11, %L10
  ret i32 0
}

declare i32 @printf(i8*, ...)
