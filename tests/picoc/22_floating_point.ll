; ModuleID = 'out.bc'
source_filename = "sparse"

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

define i32 @main() {
L0:
  %R5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), double 0x405147AE20000000)
  %R8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), double 6.912000e+01)
  %R11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), double -4.444000e+01)
  %R14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), double 7.006652e+02)
  %R17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i64 0, i64 0), double 0x3FCBD1788F8E0597)
  %R19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.5, i64 0, i64 0), i32 1, i32 1, i32 0, i32 0, i32 0, i32 1)
  %R21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.6, i64 0, i64 0), i32 0, i32 1, i32 1, i32 1, i32 0, i32 0)
  %R23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.7, i64 0, i64 0), i32 0, i32 0, i32 0, i32 1, i32 1, i32 1)
  %R33 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.8, i64 0, i64 0), double 0x405147AE20000000)
  %R43 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i64 0, i64 0), double 0xC0463851E0000000)
  %R53 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.10, i64 0, i64 0), double 0x4085E55260000000)
  %R63 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.11, i64 0, i64 0), double 0x3FCBD178A0000000)
  %R66 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.12, i64 0, i64 0), double 1.234000e+01)
  %R69 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.13, i64 0, i64 0), double -1.234000e+01)
  %R73 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.14, i64 0, i64 0), double 2.000000e+00)
  %R75 = call double @sin(double 2.000000e+00)
  %R76 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.15, i64 0, i64 0), double %R75)
  ret i32 0
}

declare i32 @printf(i8*, ...)

declare double @sin(double)
