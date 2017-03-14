; ModuleID = 'out.bc'
source_filename = "sparse"

@"<noident>" = private global [16 x i8] c"hello %d %f %f\0A\00", align 1
@str = private global [16 x i8]* @"<noident>", align 8
@i = private global i32 55, align 4
@f = private global float 1.500000e+00, align 4
@d = private global double 6.578000e+01, align 8
@.str = private constant [23 x i8] c"local string %d %f %f\0A\00"

define i32 @main() {
L0:
  %load_target = load i8*, i8** bitcast ([16 x i8]** @str to i8**)
  %R4 = call i32 (i8*, ...) @printf(i8* %load_target, i32 55, double 1.500000e+00, double 6.578000e+01)
  %R13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i64 0, i64 1), i32 6, double 0x4010CCCCC0000000, double 4.234000e+01)
  ret i32 0
}

declare i32 @printf(i8*, ...)
