; ModuleID = 'out.bc'
source_filename = "dmrC"

@.str = private constant [4 x i8] c"%f\0A\00"
@.str.1 = private constant [4 x i8] c"%f\0A\00"
@.str.2 = private constant [4 x i8] c"%f\0A\00"
@.str.3 = private constant [4 x i8] c"%f\0A\00"
@.str.4 = private constant [4 x i8] c"%f\0A\00"
@.str.5 = private constant [19 x i8] c"%d %d %d %d %d %d\0A\00"
@.str.6 = private constant [19 x i8] c"%d %d %d %d %d %d\0A\00"
@.str.7 = private constant [19 x i8] c"%d %d %d %d %d %d\0A\00"
@.str.8 = private constant [4 x i8] c"%f\0A\00"
@.str.9 = private constant [4 x i8] c"%f\0A\00"
@.str.10 = private constant [4 x i8] c"%f\0A\00"
@.str.11 = private constant [4 x i8] c"%f\0A\00"
@.str.12 = private constant [4 x i8] c"%f\0A\00"
@.str.13 = private constant [4 x i8] c"%f\0A\00"
@.str.14 = private constant [4 x i8] c"%f\0A\00"
@.str.15 = private constant [4 x i8] c"%f\0A\00"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define i32 @main() {
L0:
  %a_000002BB4AF1C598. = alloca float
  %0 = alloca i32
  %a_000002BB4AF1C598.1 = ptrtoint float* %a_000002BB4AF1C598. to i64
  %1 = add i64 %a_000002BB4AF1C598.1, 0
  %2 = inttoptr i64 %1 to float*
  store float 0x405147AE20000000, float* %2
  %a_000002BB4AF1C598.2 = ptrtoint float* %a_000002BB4AF1C598. to i64
  %3 = add i64 %a_000002BB4AF1C598.2, 0
  %4 = inttoptr i64 %3 to float*
  %R3 = load float, float* %4
  %R4 = fpext float %R3 to double
  %R5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), double %R4)
  %R8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), double 6.912000e+01)
  %R11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), double -4.444000e+01)
  %R14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), double 7.006652e+02)
  %R17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i64 0, i64 0), double 0x3FCBD1788F8E0597)
  %R19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.5, i64 0, i64 0), i32 1, i32 1, i32 0, i32 0, i32 0, i32 1)
  %R21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.6, i64 0, i64 0), i32 0, i32 1, i32 1, i32 1, i32 0, i32 0)
  %R23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.7, i64 0, i64 0), i32 0, i32 0, i32 0, i32 1, i32 1, i32 1)
  %a_000002BB4AF1C598.3 = ptrtoint float* %a_000002BB4AF1C598. to i64
  %5 = add i64 %a_000002BB4AF1C598.3, 0
  %6 = inttoptr i64 %5 to float*
  store float 0x4028AE1480000000, float* %6
  %a_000002BB4AF1C598.4 = ptrtoint float* %a_000002BB4AF1C598. to i64
  %7 = add i64 %a_000002BB4AF1C598.4, 0
  %8 = inttoptr i64 %7 to float*
  %R26 = load float, float* %8
  %R27 = fpext float %R26 to double
  %R28 = fadd double %R27, 5.678000e+01
  %R29 = fptrunc double %R28 to float
  %a_000002BB4AF1C598.5 = ptrtoint float* %a_000002BB4AF1C598. to i64
  %9 = add i64 %a_000002BB4AF1C598.5, 0
  %10 = inttoptr i64 %9 to float*
  store float %R29, float* %10
  %a_000002BB4AF1C598.6 = ptrtoint float* %a_000002BB4AF1C598. to i64
  %11 = add i64 %a_000002BB4AF1C598.6, 0
  %12 = inttoptr i64 %11 to float*
  %R31 = load float, float* %12
  %R32 = fpext float %R31 to double
  %R33 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.8, i64 0, i64 0), double %R32)
  %a_000002BB4AF1C598.7 = ptrtoint float* %a_000002BB4AF1C598. to i64
  %13 = add i64 %a_000002BB4AF1C598.7, 0
  %14 = inttoptr i64 %13 to float*
  store float 0x4028AE1480000000, float* %14
  %a_000002BB4AF1C598.8 = ptrtoint float* %a_000002BB4AF1C598. to i64
  %15 = add i64 %a_000002BB4AF1C598.8, 0
  %16 = inttoptr i64 %15 to float*
  %R36 = load float, float* %16
  %R37 = fpext float %R36 to double
  %R38 = fsub double %R37, 5.678000e+01
  %R39 = fptrunc double %R38 to float
  %a_000002BB4AF1C598.9 = ptrtoint float* %a_000002BB4AF1C598. to i64
  %17 = add i64 %a_000002BB4AF1C598.9, 0
  %18 = inttoptr i64 %17 to float*
  store float %R39, float* %18
  %a_000002BB4AF1C598.10 = ptrtoint float* %a_000002BB4AF1C598. to i64
  %19 = add i64 %a_000002BB4AF1C598.10, 0
  %20 = inttoptr i64 %19 to float*
  %R41 = load float, float* %20
  %R42 = fpext float %R41 to double
  %R43 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i64 0, i64 0), double %R42)
  %a_000002BB4AF1C598.11 = ptrtoint float* %a_000002BB4AF1C598. to i64
  %21 = add i64 %a_000002BB4AF1C598.11, 0
  %22 = inttoptr i64 %21 to float*
  store float 0x4028AE1480000000, float* %22
  %a_000002BB4AF1C598.12 = ptrtoint float* %a_000002BB4AF1C598. to i64
  %23 = add i64 %a_000002BB4AF1C598.12, 0
  %24 = inttoptr i64 %23 to float*
  %R46 = load float, float* %24
  %R47 = fpext float %R46 to double
  %R48 = fmul double %R47, 5.678000e+01
  %R49 = fptrunc double %R48 to float
  %a_000002BB4AF1C598.13 = ptrtoint float* %a_000002BB4AF1C598. to i64
  %25 = add i64 %a_000002BB4AF1C598.13, 0
  %26 = inttoptr i64 %25 to float*
  store float %R49, float* %26
  %a_000002BB4AF1C598.14 = ptrtoint float* %a_000002BB4AF1C598. to i64
  %27 = add i64 %a_000002BB4AF1C598.14, 0
  %28 = inttoptr i64 %27 to float*
  %R51 = load float, float* %28
  %R52 = fpext float %R51 to double
  %R53 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.10, i64 0, i64 0), double %R52)
  %a_000002BB4AF1C598.15 = ptrtoint float* %a_000002BB4AF1C598. to i64
  %29 = add i64 %a_000002BB4AF1C598.15, 0
  %30 = inttoptr i64 %29 to float*
  store float 0x4028AE1480000000, float* %30
  %a_000002BB4AF1C598.16 = ptrtoint float* %a_000002BB4AF1C598. to i64
  %31 = add i64 %a_000002BB4AF1C598.16, 0
  %32 = inttoptr i64 %31 to float*
  %R56 = load float, float* %32
  %R57 = fpext float %R56 to double
  %R58 = fdiv double %R57, 5.678000e+01
  %R59 = fptrunc double %R58 to float
  %a_000002BB4AF1C598.17 = ptrtoint float* %a_000002BB4AF1C598. to i64
  %33 = add i64 %a_000002BB4AF1C598.17, 0
  %34 = inttoptr i64 %33 to float*
  store float %R59, float* %34
  %a_000002BB4AF1C598.18 = ptrtoint float* %a_000002BB4AF1C598. to i64
  %35 = add i64 %a_000002BB4AF1C598.18, 0
  %36 = inttoptr i64 %35 to float*
  %R61 = load float, float* %36
  %R62 = fpext float %R61 to double
  %R63 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.11, i64 0, i64 0), double %R62)
  %R66 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.12, i64 0, i64 0), double 1.234000e+01)
  %R69 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.13, i64 0, i64 0), double -1.234000e+01)
  %a_000002BB4AF1C598.19 = ptrtoint float* %a_000002BB4AF1C598. to i64
  %37 = add i64 %a_000002BB4AF1C598.19, 0
  %38 = inttoptr i64 %37 to float*
  store float 2.000000e+00, float* %38
  %a_000002BB4AF1C598.20 = ptrtoint float* %a_000002BB4AF1C598. to i64
  %39 = add i64 %a_000002BB4AF1C598.20, 0
  %40 = inttoptr i64 %39 to float*
  %R71 = load float, float* %40
  %R72 = fpext float %R71 to double
  %R73 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.14, i64 0, i64 0), double %R72)
  %R75 = call double @sin(double 2.000000e+00)
  %R76 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.15, i64 0, i64 0), double %R75)
  store i32 0, i32* %0
  br label %L1

L1:                                               ; preds = %L0
  %41 = load i32, i32* %0
  ret i32 0
}

declare i32 @printf(i8*, ...)

declare double @sin(double)

attributes #0 = { argmemonly nounwind }
