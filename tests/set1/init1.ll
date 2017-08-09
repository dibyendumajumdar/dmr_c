; ModuleID = 'out.bc'
source_filename = "dmrC"

@"<noident>" = private global [16 x i8] c"hello %d %f %f\0A\00", align 1
@str = private global [16 x i8]* @"<noident>", align 8
@i = private global i32 55, align 4
@f = private global float 1.500000e+00, align 4
@d = private global double 6.578000e+01, align 8
@.str = private constant [23 x i8] c"local string %d %f %f\0A\00"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define i32 @main() {
L0:
  %fmt_00000263900FC378. = alloca i8*
  %e_00000263900FC298. = alloca double
  %g_00000263900FC1B8. = alloca float
  %txt_00000263900FBFF8. = alloca i8*
  %x_00000263900FBF18. = alloca i32
  %0 = alloca i32
  %R1 = load i8*, i8** bitcast ([16 x i8]** @str to i8**)
  %R4 = call i32 (i8*, ...) @printf(i8* %R1, i32 55, double 1.500000e+00, double 6.578000e+01)
  store i32 6, i32* %x_00000263900FBF18.
  %x_00000263900FBF18.1 = ptrtoint i32* %x_00000263900FBF18. to i64
  %1 = add i64 %x_00000263900FBF18.1, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 6, i32* %2
  %txt_00000263900FBFF8.2 = ptrtoint i8** %txt_00000263900FBFF8. to i64
  %3 = add i64 %txt_00000263900FBFF8.2, 0
  %4 = inttoptr i64 %3 to i8**
  store i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i64 0, i64 0), i8** %4
  store float 0x4010CCCCC0000000, float* %g_00000263900FC1B8.
  %g_00000263900FC1B8.3 = ptrtoint float* %g_00000263900FC1B8. to i64
  %5 = add i64 %g_00000263900FC1B8.3, 0
  %6 = inttoptr i64 %5 to float*
  store float 0x4010CCCCC0000000, float* %6
  store double 4.234000e+01, double* %e_00000263900FC298.
  %e_00000263900FC298.4 = ptrtoint double* %e_00000263900FC298. to i64
  %7 = add i64 %e_00000263900FC298.4, 0
  %8 = inttoptr i64 %7 to double*
  store double 4.234000e+01, double* %8
  %txt_00000263900FBFF8.5 = ptrtoint i8** %txt_00000263900FBFF8. to i64
  %9 = add i64 %txt_00000263900FBFF8.5, 0
  %10 = inttoptr i64 %9 to i8**
  %R8 = load i8*, i8** %10
  %R86 = ptrtoint i8* %R8 to i64
  %R9 = add i64 %R86, 1
  %R97 = inttoptr i64 %R9 to i8*
  %fmt_00000263900FC378.8 = ptrtoint i8** %fmt_00000263900FC378. to i64
  %11 = add i64 %fmt_00000263900FC378.8, 0
  %12 = inttoptr i64 %11 to i8**
  store i8* %R97, i8** %12
  %fmt_00000263900FC378.9 = ptrtoint i8** %fmt_00000263900FC378. to i64
  %13 = add i64 %fmt_00000263900FC378.9, 0
  %14 = inttoptr i64 %13 to i8**
  %R10 = load i8*, i8** %14
  %R13 = call i32 (i8*, ...) @printf(i8* %R10, i32 6, double 0x4010CCCCC0000000, double 4.234000e+01)
  store i32 0, i32* %0
  br label %L1

L1:                                               ; preds = %L0
  %15 = load i32, i32* %0
  ret i32 0
}

declare i32 @printf(i8*, ...)

attributes #0 = { argmemonly nounwind }
