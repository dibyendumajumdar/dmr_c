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
  %2 = bitcast double** %R5 to i8*
  %3 = getelementptr inbounds i8, i8* %2, i64 %R16
  %4 = bitcast i8* %3 to double**
  %5 = bitcast double** %4 to i8*
  %6 = getelementptr inbounds i8, i8* %5, i64 0
  %7 = bitcast i8* %6 to double**
  store double* %R12, double** %7
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
  %2 = bitcast double** %ARG2 to i8*
  %3 = getelementptr inbounds i8, i8* %2, i64 %R28
  %4 = bitcast i8* %3 to double**
  %5 = bitcast double** %4 to i8*
  %6 = getelementptr inbounds i8, i8* %5, i64 0
  %7 = bitcast i8* %6 to double**
  %load_target = load double*, double** %7
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
  %4 = bitcast double** %R44 to i8*
  %5 = getelementptr inbounds i8, i8* %4, i64 %R65
  %6 = bitcast i8* %5 to double**
  %7 = bitcast double** %6 to i8*
  %8 = getelementptr inbounds i8, i8* %7, i64 0
  %9 = bitcast i8* %8 to double**
  %load_target = load double*, double** %9
  %R69 = sext i32 %3 to i64
  %R70 = mul i64 %R69, 8
  %10 = bitcast double* %load_target to i8*
  %11 = getelementptr inbounds i8, i8* %10, i64 %R70
  %12 = bitcast i8* %11 to double*
  %13 = bitcast double* %12 to i8*
  %14 = getelementptr inbounds i8, i8* %13, i64 0
  %15 = bitcast i8* %14 to double*
  store double %R61, double* %15
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
  %8 = bitcast double** %ARG3 to i8*
  %9 = getelementptr inbounds i8, i8* %8, i64 %R91
  %10 = bitcast i8* %9 to double**
  %11 = bitcast double** %10 to i8*
  %12 = getelementptr inbounds i8, i8* %11, i64 0
  %13 = bitcast i8* %12 to double**
  %load_target = load double*, double** %13
  %R95 = sext i32 %6 to i64
  %R96 = mul i64 %R95, 8
  %14 = bitcast double* %load_target to i8*
  %15 = getelementptr inbounds i8, i8* %14, i64 %R96
  %16 = bitcast i8* %15 to double*
  %17 = bitcast double* %16 to i8*
  %18 = getelementptr inbounds i8, i8* %17, i64 0
  %19 = bitcast i8* %18 to double*
  %load_target4 = load double, double* %19
  %20 = bitcast double** %R81 to i8*
  %21 = getelementptr inbounds i8, i8* %20, i64 %R96
  %22 = bitcast i8* %21 to double**
  %23 = bitcast double** %22 to i8*
  %24 = getelementptr inbounds i8, i8* %23, i64 0
  %25 = bitcast i8* %24 to double**
  %load_target5 = load double*, double** %25
  %26 = bitcast double* %load_target5 to i8*
  %27 = getelementptr inbounds i8, i8* %26, i64 %R91
  %28 = bitcast i8* %27 to double*
  %29 = bitcast double* %28 to i8*
  %30 = getelementptr inbounds i8, i8* %29, i64 0
  %31 = bitcast i8* %30 to double*
  store double %load_target4, double* %31
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
  %32 = load i32, i32* %2
  %R115 = icmp slt i32 %32, %ARG1
  %R1156 = zext i1 %R115 to i32
  %cond7 = icmp ne i32 %R1156, 0
  br i1 %cond7, label %L23, label %L30

L23:                                              ; preds = %L22
  %R118 = sext i32 %32 to i64
  %R119 = mul i64 %R118, 8
  %33 = bitcast double** %ARG2 to i8*
  %34 = getelementptr inbounds i8, i8* %33, i64 %R119
  %35 = bitcast i8* %34 to double**
  %36 = bitcast double** %35 to i8*
  %37 = getelementptr inbounds i8, i8* %36, i64 0
  %38 = bitcast i8* %37 to double**
  %load_target8 = load double*, double** %38
  %39 = bitcast double** %R79 to i8*
  %40 = getelementptr inbounds i8, i8* %39, i64 %R119
  %41 = bitcast i8* %40 to double**
  %42 = bitcast double** %41 to i8*
  %43 = getelementptr inbounds i8, i8* %42, i64 0
  %44 = bitcast i8* %43 to double**
  %load_target9 = load double*, double** %44
  store i32 0, i32* %3
  br label %L24

L24:                                              ; preds = %L28, %L23
  %45 = load i32, i32* %3
  %R130 = icmp slt i32 %45, %ARG1
  %R13010 = zext i1 %R130 to i32
  %cond11 = icmp ne i32 %R13010, 0
  br i1 %cond11, label %L25, label %L29

L25:                                              ; preds = %L24
  %R134 = sext i32 %45 to i64
  %R135 = mul i64 %R134, 8
  %46 = bitcast double** %R81 to i8*
  %47 = getelementptr inbounds i8, i8* %46, i64 %R135
  %48 = bitcast i8* %47 to double**
  %49 = bitcast double** %48 to i8*
  %50 = getelementptr inbounds i8, i8* %49, i64 0
  %51 = bitcast i8* %50 to double**
  %load_target12 = load double*, double** %51
  store double 0.000000e+00, double* %5
  store i32 0, i32* %4
  br label %L26

L26:                                              ; preds = %L27, %L25
  %52 = load i32, i32* %4
  %R140 = icmp slt i32 %52, %ARG1
  %R14013 = zext i1 %R140 to i32
  %53 = load double, double* %5
  %cond14 = icmp ne i32 %R14013, 0
  br i1 %cond14, label %L27, label %L28

L27:                                              ; preds = %L26
  %R143 = sext i32 %52 to i64
  %R144 = mul i64 %R143, 8
  %54 = bitcast double* %load_target8 to i8*
  %55 = getelementptr inbounds i8, i8* %54, i64 %R144
  %56 = bitcast i8* %55 to double*
  %57 = bitcast double* %56 to i8*
  %58 = getelementptr inbounds i8, i8* %57, i64 0
  %59 = bitcast i8* %58 to double*
  %load_target15 = load double, double* %59
  %60 = bitcast double* %load_target12 to i8*
  %61 = getelementptr inbounds i8, i8* %60, i64 %R144
  %62 = bitcast i8* %61 to double*
  %63 = bitcast double* %62 to i8*
  %64 = getelementptr inbounds i8, i8* %63, i64 0
  %65 = bitcast i8* %64 to double*
  %load_target16 = load double, double* %65
  %R153 = fmul double %load_target15, %load_target16
  %R156 = fadd double %53, %R153
  store double %R156, double* %5
  %R159 = add i32 %52, 1
  store i32 %R159, i32* %4
  br label %L26

L28:                                              ; preds = %L26
  %66 = bitcast double* %load_target9 to i8*
  %67 = getelementptr inbounds i8, i8* %66, i64 %R135
  %68 = bitcast i8* %67 to double*
  %69 = bitcast double* %68 to i8*
  %70 = getelementptr inbounds i8, i8* %69, i64 0
  %71 = bitcast i8* %70 to double*
  store double %53, double* %71
  %R167 = add i32 %45, 1
  store i32 %R167, i32* %3
  br label %L24

L29:                                              ; preds = %L24
  %R169 = add i32 %32, 1
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
  %0 = bitcast double** %R184 to i8*
  %1 = getelementptr inbounds i8, i8* %0, i64 4000
  %2 = bitcast i8* %1 to double**
  %load_target = load double*, double** %2
  %3 = bitcast double* %load_target to i8*
  %4 = getelementptr inbounds i8, i8* %3, double* inttoptr (i64 4000 to double*)
  %5 = bitcast i8* %4 to double*
  %6 = bitcast double* %5 to i8*
  %7 = getelementptr inbounds i8, i8* %6, i64 0
  %8 = bitcast i8* %7 to double*
  %load_target1 = load double, double* %8
  %R199 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), double %load_target1)
  call void @mm_destroy(i32 1000, double** %R178)
  call void @mm_destroy(i32 1000, double** %R180)
  call void @mm_destroy(i32 1000, double** %R184)
  ret i32 0
}

declare i32 @printf(i8*, ...)
