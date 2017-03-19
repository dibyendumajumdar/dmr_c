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
  %ux_0000018D968CDD28 = alloca %union.anno
  %ut_0000018D968CDC48 = alloca %union.anno
  %0 = alloca double
  %1 = ptrtoint %union.anno* %ut_0000018D968CDC48 to i64
  %2 = add i64 %1, 0
  %3 = inttoptr i64 %2 to double*
  store double 1.000000e+00, double* %3
  %4 = ptrtoint %union.anno* %ut_0000018D968CDC48 to i64
  %5 = add i64 %4, 0
  %6 = inttoptr i64 %5 to i32*
  %load_target = load i32, i32* %6
  %R3 = icmp eq i32 %load_target, 0
  %R31 = zext i1 %R3 to i32
  %7 = ptrtoint %union.anno* %ut_0000018D968CDC48 to i64
  %8 = add i64 %7, 0
  %9 = inttoptr i64 %8 to double*
  store double 0.000000e+00, double* %9
  %10 = ptrtoint %union.anno* %ux_0000018D968CDD28 to i64
  %11 = add i64 %10, 0
  %12 = inttoptr i64 %11 to double*
  store double %ARG1, double* %12
  %R6 = bitcast %union.anno* %ux_0000018D968CDD28 to i8*
  %R9 = sext i32 %R31 to i64
  %R10 = mul i64 %R9, 4
  %13 = ptrtoint i8* %R6 to i64
  %R11 = add i64 %13, %R10
  %14 = inttoptr i64 %R11 to i32*
  %15 = ptrtoint i32* %14 to i64
  %16 = add i64 %15, 0
  %17 = inttoptr i64 %16 to i32*
  %load_target2 = load i32, i32* %17
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
  %18 = ptrtoint i8* %R6 to i64
  %R36 = add i64 %18, %R35
  %19 = inttoptr i64 %R36 to i32*
  %20 = ptrtoint i32* %19 to i64
  %21 = add i64 %20, 0
  %22 = inttoptr i64 %21 to i32*
  %load_target4 = load i32, i32* %22
  %R38 = or i32 %R20, %load_target4
  %cond5 = icmp ne i32 %R38, 0
  br i1 %cond5, label %L4, label %L3

L3:                                               ; preds = %L2
  store double %ARG1, double* %0
  br label %L8

L4:                                               ; preds = %L2
  %23 = ptrtoint i32* %14 to i64
  %24 = add i64 %23, 0
  %25 = inttoptr i64 %24 to i32*
  store i32 %R20, i32* %25
  %R50 = icmp slt i32 %R20, 1048576
  %R506 = zext i1 %R50 to i32
  %R51 = bitcast %union.anno* %ut_0000018D968CDC48 to i8*
  %26 = ptrtoint i8* %R51 to i64
  %R56 = add i64 %26, %R10
  %27 = inttoptr i64 %R56 to i32*
  %cond7 = icmp ne i32 %R506, 0
  br i1 %cond7, label %L5, label %L6

L5:                                               ; preds = %L4
  %28 = ptrtoint i32* %27 to i64
  %29 = add i64 %28, 0
  %30 = inttoptr i64 %29 to i32*
  store i32 1129316352, i32* %30
  %31 = ptrtoint %union.anno* %ut_0000018D968CDC48 to i64
  %32 = add i64 %31, 0
  %33 = inttoptr i64 %32 to double*
  %load_target8 = load double, double* %33
  %R60 = fmul double %load_target8, %ARG1
  %34 = ptrtoint %union.anno* %ut_0000018D968CDC48 to i64
  %35 = add i64 %34, 0
  %36 = inttoptr i64 %35 to double*
  store double %R60, double* %36
  %37 = ptrtoint i32* %27 to i64
  %38 = add i64 %37, 0
  %39 = inttoptr i64 %38 to i32*
  %load_target9 = load i32, i32* %39
  %R69 = udiv i32 %load_target9, 3
  %R70 = add i32 %R69, 696219795
  %40 = ptrtoint i32* %27 to i64
  %41 = add i64 %40, 0
  %42 = inttoptr i64 %41 to i32*
  store i32 %R70, i32* %42
  br label %L7

L6:                                               ; preds = %L4
  %R78 = sdiv i32 %R20, 3
  %R80 = add i32 %R78, 715094163
  %43 = ptrtoint i32* %27 to i64
  %44 = add i64 %43, 0
  %45 = inttoptr i64 %44 to i32*
  store i32 %R80, i32* %45
  br label %L7

L7:                                               ; preds = %L6, %L5
  %46 = ptrtoint %union.anno* %ut_0000018D968CDC48 to i64
  %47 = add i64 %46, 0
  %48 = inttoptr i64 %47 to double*
  %load_target10 = load double, double* %48
  %R89 = fmul double %load_target10, %load_target10
  %49 = ptrtoint %union.anno* %ux_0000018D968CDD28 to i64
  %50 = add i64 %49, 0
  %51 = inttoptr i64 %50 to double*
  %load_target11 = load double, double* %51
  %R91 = fdiv double %R89, %load_target11
  %R95 = fmul double %R91, %load_target10
  %R96 = fadd double 0x3FE15F1600000000, %R95
  %R101 = fadd double %R96, 0x3FF6A0EA00000000
  %R104 = fdiv double 0xBFE691DE20000000, %R96
  %R105 = fadd double %R101, %R104
  %R106 = fdiv double 0x3FF9B6DB60000000, %R105
  %R107 = fadd double 0x3FD6DB6DC0000000, %R106
  %R110 = fmul double %load_target10, %R107
  %52 = ptrtoint %union.anno* %ut_0000018D968CDC48 to i64
  %53 = add i64 %52, 0
  %54 = inttoptr i64 %53 to double*
  store double %R110, double* %54
  %55 = ptrtoint i8* %R51 to i64
  %R118 = add i64 %55, %R35
  %56 = inttoptr i64 %R118 to i32*
  %57 = ptrtoint i32* %56 to i64
  %58 = add i64 %57, 0
  %59 = inttoptr i64 %58 to i32*
  store i32 0, i32* %59
  %60 = ptrtoint i32* %27 to i64
  %61 = add i64 %60, 0
  %62 = inttoptr i64 %61 to i32*
  %load_target12 = load i32, i32* %62
  %R127 = add i32 %load_target12, 1
  %63 = ptrtoint i32* %27 to i64
  %64 = add i64 %63, 0
  %65 = inttoptr i64 %64 to i32*
  store i32 %R127, i32* %65
  %66 = ptrtoint %union.anno* %ut_0000018D968CDC48 to i64
  %67 = add i64 %66, 0
  %68 = inttoptr i64 %67 to double*
  %load_target13 = load double, double* %68
  %R131 = fmul double %load_target13, %load_target13
  %69 = ptrtoint %union.anno* %ux_0000018D968CDD28 to i64
  %70 = add i64 %69, 0
  %71 = inttoptr i64 %70 to double*
  %load_target14 = load double, double* %71
  %R134 = fdiv double %load_target14, %R131
  %R137 = fadd double %load_target13, %load_target13
  %R140 = fsub double %R134, %load_target13
  %R143 = fadd double %R137, %R134
  %R144 = fdiv double %R140, %R143
  %R148 = fmul double %load_target13, %R144
  %R149 = fadd double %load_target13, %R148
  %72 = ptrtoint %union.anno* %ut_0000018D968CDC48 to i64
  %73 = add i64 %72, 0
  %74 = inttoptr i64 %73 to double*
  store double %R149, double* %74
  %75 = ptrtoint i32* %27 to i64
  %76 = add i64 %75, 0
  %77 = inttoptr i64 %76 to i32*
  %load_target15 = load i32, i32* %77
  %R159 = or i32 %load_target15, %R16
  %78 = ptrtoint i32* %27 to i64
  %79 = add i64 %78, 0
  %80 = inttoptr i64 %79 to i32*
  store i32 %R159, i32* %80
  %81 = ptrtoint %union.anno* %ut_0000018D968CDC48 to i64
  %82 = add i64 %81, 0
  %83 = inttoptr i64 %82 to double*
  %load_target16 = load double, double* %83
  %R166 = fmul double %load_target16, %load_target16
  %R167 = fdiv double %ARG1, %R166
  %R168 = fsub double %load_target16, %R167
  %R170 = fmul double %R168, 0x3FD5555555555555
  %R173 = fsub double %load_target16, %R170
  store double %R173, double* %0
  br label %L8

L8:                                               ; preds = %L7, %L3, %L1
  %84 = load double, double* %0
  ret double %84
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
