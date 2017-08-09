; ModuleID = 'out.bc'
source_filename = "dmrC"

@.str = private constant [10 x i8] c"char: %c\0A\00"
@.str.1 = private constant [9 x i8] c"int: %d\0A\00"
@.str.2 = private constant [11 x i8] c"float: %f\0A\00"
@.str.3 = private constant [10 x i8] c"%c %d %f\0A\00"
@.str.4 = private constant [10 x i8] c"%c %d %f\0A\00"
@.str.5 = private constant [10 x i8] c"%c %d %f\0A\00"
@.str.6 = private constant [7 x i8] c"%d %d\0A\00"
@.str.7 = private constant [7 x i8] c"%d %d\0A\00"
@.str.8 = private constant [7 x i8] c"%f %f\0A\00"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define internal void @charfunc(i8 %ARG1) {
L0:
  %a_000002C22950D5F8. = alloca i8
  %a_000002C22950D5F8.1 = ptrtoint i8* %a_000002C22950D5F8. to i64
  %0 = add i64 %a_000002C22950D5F8.1, 0
  %1 = inttoptr i64 %0 to i8*
  store i8 %ARG1, i8* %1
  %a_000002C22950D5F8.2 = ptrtoint i8* %a_000002C22950D5F8. to i64
  %2 = add i64 %a_000002C22950D5F8.2, 0
  %3 = inttoptr i64 %2 to i8*
  %R2 = load i8, i8* %3
  %R3 = sext i8 %R2 to i32
  %R4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), i32 %R3)
  br label %L1

L1:                                               ; preds = %L0
  ret void
}

declare i32 @printf(i8*, ...)

define internal void @intfunc(i32 %ARG1) {
L2:
  %a_000002C22950D978. = alloca i32
  %a_000002C22950D978.1 = ptrtoint i32* %a_000002C22950D978. to i64
  %0 = add i64 %a_000002C22950D978.1, 0
  %1 = inttoptr i64 %0 to i32*
  store i32 %ARG1, i32* %1
  %a_000002C22950D978.2 = ptrtoint i32* %a_000002C22950D978. to i64
  %2 = add i64 %a_000002C22950D978.2, 0
  %3 = inttoptr i64 %2 to i32*
  %R6 = load i32, i32* %3
  %R7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), i32 %R6)
  br label %L3

L3:                                               ; preds = %L2
  ret void
}

define internal void @floatfunc(float %ARG1) {
L4:
  %a_000002C22950DCF8. = alloca float
  %a_000002C22950DCF8.1 = ptrtoint float* %a_000002C22950DCF8. to i64
  %0 = add i64 %a_000002C22950DCF8.1, 0
  %1 = inttoptr i64 %0 to float*
  store float %ARG1, float* %1
  %a_000002C22950DCF8.2 = ptrtoint float* %a_000002C22950DCF8. to i64
  %2 = add i64 %a_000002C22950DCF8.2, 0
  %3 = inttoptr i64 %2 to float*
  %R9 = load float, float* %3
  %R10 = fpext float %R9 to double
  %R11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i64 0, i64 0), double %R10)
  br label %L5

L5:                                               ; preds = %L4
  ret void
}

define i32 @main() {
L6:
  %g_000002C22950EAF8. = alloca float
  %f_000002C22950EA18. = alloca float
  %e_000002C22950E938. = alloca i32
  %d_000002C22950E858. = alloca i32
  %c_000002C22950E778. = alloca i8
  %b_000002C22950E698. = alloca i8
  %0 = alloca i32
  call void @charfunc(i8 97)
  call void @charfunc(i8 98)
  call void @charfunc(i8 99)
  call void @intfunc(i32 97)
  call void @intfunc(i32 98)
  call void @intfunc(i32 99)
  call void @floatfunc(float 9.700000e+01)
  call void @floatfunc(float 9.800000e+01)
  call void @floatfunc(float 9.900000e+01)
  %R14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.3, i64 0, i64 0), i32 97, i32 98, double 9.900000e+01)
  %R16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i64 0, i64 0), i32 97, i32 98, double 9.900000e+01)
  %R19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.5, i64 0, i64 0), i32 97, i32 98, double 9.900000e+01)
  store i8 97, i8* %b_000002C22950E698.
  %b_000002C22950E698.1 = ptrtoint i8* %b_000002C22950E698. to i64
  %1 = add i64 %b_000002C22950E698.1, 0
  %2 = inttoptr i64 %1 to i8*
  store i8 97, i8* %2
  store i8 97, i8* %c_000002C22950E778.
  %c_000002C22950E778.2 = ptrtoint i8* %c_000002C22950E778. to i64
  %3 = add i64 %c_000002C22950E778.2, 0
  %4 = inttoptr i64 %3 to i8*
  store i8 97, i8* %4
  %R21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i32 97, i32 97)
  store i32 97, i32* %d_000002C22950E858.
  %d_000002C22950E858.3 = ptrtoint i32* %d_000002C22950E858. to i64
  %5 = add i64 %d_000002C22950E858.3, 0
  %6 = inttoptr i64 %5 to i32*
  store i32 97, i32* %6
  store i32 97, i32* %e_000002C22950E938.
  %e_000002C22950E938.4 = ptrtoint i32* %e_000002C22950E938. to i64
  %7 = add i64 %e_000002C22950E938.4, 0
  %8 = inttoptr i64 %7 to i32*
  store i32 97, i32* %8
  %R23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.7, i64 0, i64 0), i32 97, i32 97)
  store float 9.700000e+01, float* %f_000002C22950EA18.
  %f_000002C22950EA18.5 = ptrtoint float* %f_000002C22950EA18. to i64
  %9 = add i64 %f_000002C22950EA18.5, 0
  %10 = inttoptr i64 %9 to float*
  store float 9.700000e+01, float* %10
  store float 9.700000e+01, float* %g_000002C22950EAF8.
  %g_000002C22950EAF8.6 = ptrtoint float* %g_000002C22950EAF8. to i64
  %11 = add i64 %g_000002C22950EAF8.6, 0
  %12 = inttoptr i64 %11 to float*
  store float 9.700000e+01, float* %12
  %R25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.8, i64 0, i64 0), double 9.700000e+01, double 9.700000e+01)
  store i32 0, i32* %0
  br label %L7

L7:                                               ; preds = %L6
  %13 = load i32, i32* %0
  ret i32 0
}

attributes #0 = { argmemonly nounwind }
