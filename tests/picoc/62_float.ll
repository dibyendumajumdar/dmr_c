; ModuleID = 'out.bc'
source_filename = "dmrC"

@.str = private constant [13 x i8] c"%f %f %f %f\0A\00"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define i32 @main() {
L0:
  %q_0000023A6B92F428. = alloca double
  %z_0000023A6B92F348. = alloca double
  %y_0000023A6B92F268. = alloca double
  %x_0000023A6B92F188. = alloca double
  %0 = alloca i32
  store double 3.140000e+00, double* %x_0000023A6B92F188.
  %x_0000023A6B92F188.1 = ptrtoint double* %x_0000023A6B92F188. to i64
  %1 = add i64 %x_0000023A6B92F188.1, 0
  %2 = inttoptr i64 %1 to double*
  store double 3.140000e+00, double* %2
  store double 1.000000e-03, double* %y_0000023A6B92F268.
  %y_0000023A6B92F268.2 = ptrtoint double* %y_0000023A6B92F268. to i64
  %3 = add i64 %y_0000023A6B92F268.2, 0
  %4 = inttoptr i64 %3 to double*
  store double 1.000000e-03, double* %4
  store double 1.000000e-13, double* %z_0000023A6B92F348.
  %z_0000023A6B92F348.3 = ptrtoint double* %z_0000023A6B92F348. to i64
  %5 = add i64 %z_0000023A6B92F348.3, 0
  %6 = inttoptr i64 %5 to double*
  store double 1.000000e-13, double* %6
  store double 0x3FF5555560000000, double* %q_0000023A6B92F428.
  %q_0000023A6B92F428.4 = ptrtoint double* %q_0000023A6B92F428. to i64
  %7 = add i64 %q_0000023A6B92F428.4, 0
  %8 = inttoptr i64 %7 to double*
  store double 0x3FF5555560000000, double* %8
  %R10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0), double 3.140000e+00, double 1.000000e-03, double 1.000000e+02, double 0x3FF5555560000000)
  store i32 0, i32* %0
  br label %L1

L1:                                               ; preds = %L0
  %9 = load i32, i32* %0
  ret i32 0
}

declare i32 @printf(i8*, ...)

attributes #0 = { argmemonly nounwind }
