; ModuleID = 'out.bc'
source_filename = "sparse"

@.str = private constant [10 x i8] c"char: %c\0A\00"
@.str.1 = private constant [9 x i8] c"int: %d\0A\00"
@.str.2 = private constant [11 x i8] c"float: %f\0A\00"
@.str.3 = private constant [10 x i8] c"%c %d %f\0A\00"
@.str.4 = private constant [10 x i8] c"%c %d %f\0A\00"
@.str.5 = private constant [10 x i8] c"%c %d %f\0A\00"
@.str.6 = private constant [7 x i8] c"%d %d\0A\00"
@.str.7 = private constant [7 x i8] c"%d %d\0A\00"
@.str.8 = private constant [7 x i8] c"%f %f\0A\00"

define internal void @charfunc(i8 %ARG1) {
L0:
  %R3 = sext i8 %ARG1 to i32
  %R4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), i32 %R3)
  ret void
}

declare i32 @printf(i8*, ...)

define internal void @intfunc(i32 %ARG1) {
L1:
  %R7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), i32 %ARG1)
  ret void
}

define internal void @floatfunc(float %ARG1) {
L2:
  %R10 = fpext float %ARG1 to double
  %R11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i64 0, i64 0), double %R10)
  ret void
}

define i32 @main() {
L3:
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
  %R21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i32 97, i32 97)
  %R23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.7, i64 0, i64 0), i32 97, i32 97)
  %R25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.8, i64 0, i64 0), double 9.700000e+01, double 9.700000e+01)
  ret i32 0
}
