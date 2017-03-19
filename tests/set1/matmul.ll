; ModuleID = 'out.bc'
source_filename = "sparse"

@.str = private constant [5 x i8] c"%lf\0A\00"

define internal double** @mm_init(i32 %ARG1) {
L0:
  %0 = alloca i32
  %R2 = sext i32 %ARG1 to i64
  %R3 = mul i64 %R2, 8
  %R4 = call i8* @malloc(i64 %R3)
  %R5 = bitcast i8* %R4 to double**
  store i32 0, i32* %0
  br label %L1

L1:                                               ; preds = %L2, %L0
  %1 = load i32, i32* %0
  %R8 = icmp slt i32 %1, %ARG1
  %R81 = zext i1 %R8 to i32
  %cond = icmp ne i32 %R81, 0
  br i1 %cond, label %L2, label %L3

L2:                                               ; preds = %L1
  %R11 = call i8* @calloc(i64 %R2, i64 8)
  %R12 = bitcast i8* %R11 to double*
  %R15 = sext i32 %1 to i64
  %R16 = mul i64 %R15, 8
  %2 = ptrtoint double** %R5 to i64
  %R17 = add i64 %2, %R16
  %3 = inttoptr i64 %R17 to double**
  %4 = ptrtoint double** %3 to i64
  %5 = add i64 %4, 0
  %6 = inttoptr i64 %5 to double**
  store double* %R12, double** %6
  %R19 = add i32 %1, 1
  store i32 %R19, i32* %0
  br label %L1

L3:                                               ; preds = %L1
  ret double** %R5
}

declare i8* @malloc(i64)

declare i8* @calloc(i64, i64)

define internal void @mm_destroy(i32 %ARG1, double** %ARG2) {
L4:
  %0 = alloca i32
  store i32 0, i32* %0
  br label %L5

L5:                                               ; preds = %L6, %L4
  %1 = load i32, i32* %0
  %R24 = icmp slt i32 %1, %ARG1
  %R241 = zext i1 %R24 to i32
  %cond = icmp ne i32 %R241, 0
  br i1 %cond, label %L6, label %L7

L6:                                               ; preds = %L5
  %R27 = sext i32 %1 to i64
  %R28 = mul i64 %R27, 8
  %2 = ptrtoint double** %ARG2 to i64
  %R29 = add i64 %2, %R28
  %3 = inttoptr i64 %R29 to double**
  %4 = ptrtoint double** %3 to i64
  %5 = add i64 %4, 0
  %6 = inttoptr i64 %5 to double**
  %load_target = load double*, double** %6
  %R31 = bitcast double* %load_target to i8*
  call void @free(i8* %R31)
  %R33 = add i32 %1, 1
  store i32 %R33, i32* %0
  br label %L5

L7:                                               ; preds = %L5
  %R35 = bitcast double** %ARG2 to i8*
  call void @free(i8* %R35)
  ret void
}

declare void @free(i8*)

define internal double** @mm_gen(i32 %ARG1) {
L8:
  %0 = alloca i32
  %1 = alloca i32
  %R38 = sitofp i32 %ARG1 to double
  %R39 = fdiv double 1.000000e+00, %R38
  %R41 = sitofp i32 %ARG1 to double
  %R42 = fdiv double %R39, %R41
  %R44 = call double** @mm_init(i32 %ARG1)
  store i32 0, i32* %0
  br label %L9

L9:                                               ; preds = %L13, %L8
  %2 = load i32, i32* %0
  %R47 = icmp slt i32 %2, %ARG1
  %R471 = zext i1 %R47 to i32
  %cond = icmp ne i32 %R471, 0
  br i1 %cond, label %L10, label %L14

L10:                                              ; preds = %L9
  store i32 0, i32* %1
  br label %L11

L11:                                              ; preds = %L12, %L10
  %3 = load i32, i32* %1
  %R50 = icmp slt i32 %3, %ARG1
  %R502 = zext i1 %R50 to i32
  %cond3 = icmp ne i32 %R502, 0
  br i1 %cond3, label %L12, label %L13

L12:                                              ; preds = %L11
  %R54 = sub i32 %2, %3
  %R55 = sitofp i32 %R54 to double
  %R56 = fmul double %R42, %R55
  %R59 = add i32 %2, %3
  %R60 = sitofp i32 %R59 to double
  %R61 = fmul double %R56, %R60
  %R64 = sext i32 %2 to i64
  %R65 = mul i64 %R64, 8
  %4 = ptrtoint double** %R44 to i64
  %R66 = add i64 %4, %R65
  %5 = inttoptr i64 %R66 to double**
  %6 = ptrtoint double** %5 to i64
  %7 = add i64 %6, 0
  %8 = inttoptr i64 %7 to double**
  %load_target = load double*, double** %8
  %R69 = sext i32 %3 to i64
  %R70 = mul i64 %R69, 8
  %9 = ptrtoint double* %load_target to i64
  %R71 = add i64 %9, %R70
  %10 = inttoptr i64 %R71 to double*
  %11 = ptrtoint double* %10 to i64
  %12 = add i64 %11, 0
  %13 = inttoptr i64 %12 to double*
  store double %R61, double* %13
  %R73 = add i32 %3, 1
  store i32 %R73, i32* %1
  br label %L11

L13:                                              ; preds = %L11
  %R75 = add i32 %2, 1
  store i32 %R75, i32* %0
  br label %L9

L14:                                              ; preds = %L9
  ret double** %R44
}

define internal double** @mm_mul(i32 %ARG1, double** %ARG2, double** %ARG3) {
L15:
  %0 = alloca i32
  %1 = alloca i32
  %2 = alloca i32
  %3 = alloca i32
  %4 = alloca i32
  %5 = alloca double
  %R79 = call double** @mm_init(i32 %ARG1)
  %R81 = call double** @mm_init(i32 %ARG1)
  store i32 0, i32* %0
  br label %L16

L16:                                              ; preds = %L20, %L15
  %6 = load i32, i32* %0
  %R84 = icmp slt i32 %6, %ARG1
  %R841 = zext i1 %R84 to i32
  %cond = icmp ne i32 %R841, 0
  br i1 %cond, label %L17, label %L21

L17:                                              ; preds = %L16
  store i32 0, i32* %1
  br label %L18

L18:                                              ; preds = %L19, %L17
  %7 = load i32, i32* %1
  %R87 = icmp slt i32 %7, %ARG1
  %R872 = zext i1 %R87 to i32
  %cond3 = icmp ne i32 %R872, 0
  br i1 %cond3, label %L19, label %L20

L19:                                              ; preds = %L18
  %R90 = sext i32 %7 to i64
  %R91 = mul i64 %R90, 8
  %8 = ptrtoint double** %ARG3 to i64
  %R92 = add i64 %8, %R91
  %9 = inttoptr i64 %R92 to double**
  %10 = ptrtoint double** %9 to i64
  %11 = add i64 %10, 0
  %12 = inttoptr i64 %11 to double**
  %load_target = load double*, double** %12
  %R95 = sext i32 %6 to i64
  %R96 = mul i64 %R95, 8
  %13 = ptrtoint double* %load_target to i64
  %R97 = add i64 %13, %R96
  %14 = inttoptr i64 %R97 to double*
  %15 = ptrtoint double* %14 to i64
  %16 = add i64 %15, 0
  %17 = inttoptr i64 %16 to double*
  %load_target4 = load double, double* %17
  %18 = ptrtoint double** %R81 to i64
  %R103 = add i64 %18, %R96
  %19 = inttoptr i64 %R103 to double**
  %20 = ptrtoint double** %19 to i64
  %21 = add i64 %20, 0
  %22 = inttoptr i64 %21 to double**
  %load_target5 = load double*, double** %22
  %23 = ptrtoint double* %load_target5 to i64
  %R108 = add i64 %23, %R91
  %24 = inttoptr i64 %R108 to double*
  %25 = ptrtoint double* %24 to i64
  %26 = add i64 %25, 0
  %27 = inttoptr i64 %26 to double*
  store double %load_target4, double* %27
  %R110 = add i32 %7, 1
  store i32 %R110, i32* %1
  br label %L18

L20:                                              ; preds = %L18
  %R112 = add i32 %6, 1
  store i32 %R112, i32* %0
  br label %L16

L21:                                              ; preds = %L16
  store i32 0, i32* %2
  br label %L22

L22:                                              ; preds = %L29, %L21
  %28 = load i32, i32* %2
  %R115 = icmp slt i32 %28, %ARG1
  %R1156 = zext i1 %R115 to i32
  %cond7 = icmp ne i32 %R1156, 0
  br i1 %cond7, label %L23, label %L30

L23:                                              ; preds = %L22
  %R118 = sext i32 %28 to i64
  %R119 = mul i64 %R118, 8
  %29 = ptrtoint double** %ARG2 to i64
  %R120 = add i64 %29, %R119
  %30 = inttoptr i64 %R120 to double**
  %31 = ptrtoint double** %30 to i64
  %32 = add i64 %31, 0
  %33 = inttoptr i64 %32 to double**
  %load_target8 = load double*, double** %33
  %34 = ptrtoint double** %R79 to i64
  %R126 = add i64 %34, %R119
  %35 = inttoptr i64 %R126 to double**
  %36 = ptrtoint double** %35 to i64
  %37 = add i64 %36, 0
  %38 = inttoptr i64 %37 to double**
  %load_target9 = load double*, double** %38
  store i32 0, i32* %3
  br label %L24

L24:                                              ; preds = %L28, %L23
  %39 = load i32, i32* %3
  %R130 = icmp slt i32 %39, %ARG1
  %R13010 = zext i1 %R130 to i32
  %cond11 = icmp ne i32 %R13010, 0
  br i1 %cond11, label %L25, label %L29

L25:                                              ; preds = %L24
  %R134 = sext i32 %39 to i64
  %R135 = mul i64 %R134, 8
  %40 = ptrtoint double** %R81 to i64
  %R136 = add i64 %40, %R135
  %41 = inttoptr i64 %R136 to double**
  %42 = ptrtoint double** %41 to i64
  %43 = add i64 %42, 0
  %44 = inttoptr i64 %43 to double**
  %load_target12 = load double*, double** %44
  store double 0.000000e+00, double* %5
  store i32 0, i32* %4
  br label %L26

L26:                                              ; preds = %L27, %L25
  %45 = load i32, i32* %4
  %R140 = icmp slt i32 %45, %ARG1
  %R14013 = zext i1 %R140 to i32
  %46 = load double, double* %5
  %cond14 = icmp ne i32 %R14013, 0
  br i1 %cond14, label %L27, label %L28

L27:                                              ; preds = %L26
  %R143 = sext i32 %45 to i64
  %R144 = mul i64 %R143, 8
  %47 = ptrtoint double* %load_target8 to i64
  %R145 = add i64 %47, %R144
  %48 = inttoptr i64 %R145 to double*
  %49 = ptrtoint double* %48 to i64
  %50 = add i64 %49, 0
  %51 = inttoptr i64 %50 to double*
  %load_target15 = load double, double* %51
  %52 = ptrtoint double* %load_target12 to i64
  %R151 = add i64 %52, %R144
  %53 = inttoptr i64 %R151 to double*
  %54 = ptrtoint double* %53 to i64
  %55 = add i64 %54, 0
  %56 = inttoptr i64 %55 to double*
  %load_target16 = load double, double* %56
  %R153 = fmul double %load_target15, %load_target16
  %R156 = fadd double %46, %R153
  store double %R156, double* %5
  %R159 = add i32 %45, 1
  store i32 %R159, i32* %4
  br label %L26

L28:                                              ; preds = %L26
  %57 = ptrtoint double* %load_target9 to i64
  %R165 = add i64 %57, %R135
  %58 = inttoptr i64 %R165 to double*
  %59 = ptrtoint double* %58 to i64
  %60 = add i64 %59, 0
  %61 = inttoptr i64 %60 to double*
  store double %46, double* %61
  %R167 = add i32 %39, 1
  store i32 %R167, i32* %3
  br label %L24

L29:                                              ; preds = %L24
  %R169 = add i32 %28, 1
  store i32 %R169, i32* %2
  br label %L22

L30:                                              ; preds = %L22
  call void @mm_destroy(i32 %ARG1, double** %R81)
  ret double** %R79
}

define i32 @main() {
L31:
  %R178 = call double** @mm_gen(i32 1000)
  %R180 = call double** @mm_gen(i32 1000)
  %R184 = call double** @mm_mul(i32 1000, double** %R178, double** %R180)
  %0 = ptrtoint double** %R184 to i64
  %1 = add i64 %0, 4000
  %2 = inttoptr i64 %1 to double**
  %load_target = load double*, double** %2
  %3 = ptrtoint double* %load_target to i64
  %R197 = add i64 %3, 4000
  %4 = inttoptr i64 %R197 to double*
  %5 = ptrtoint double* %4 to i64
  %6 = add i64 %5, 0
  %7 = inttoptr i64 %6 to double*
  %load_target1 = load double, double* %7
  %R199 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), double %load_target1)
  call void @mm_destroy(i32 1000, double** %R178)
  call void @mm_destroy(i32 1000, double** %R180)
  call void @mm_destroy(i32 1000, double** %R184)
  ret i32 0
}

declare i32 @printf(i8*, ...)
