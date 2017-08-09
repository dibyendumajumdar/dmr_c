; ModuleID = 'out.bc'
source_filename = "dmrC"

@.str = private constant [4 x i8] c"%f\0A\00"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define double @f1() {
L0:
  %0 = alloca double
  store double -1.000000e+00, double* %0
  br label %L1

L1:                                               ; preds = %L0
  %1 = load double, double* %0
  ret double -1.000000e+00
}

define double @f2() {
L2:
  %0 = alloca double
  store double -1.000000e+00, double* %0
  br label %L3

L3:                                               ; preds = %L2
  %1 = load double, double* %0
  ret double -1.000000e+00
}

define double @f3() {
L4:
  %0 = alloca double
  store double -1.000000e+00, double* %0
  br label %L5

L5:                                               ; preds = %L4
  %1 = load double, double* %0
  ret double -1.000000e+00
}

define i32 @main() {
L6:
  %a_00000296E346CFE8. = alloca float
  %0 = alloca i32
  store float 9.700000e+01, float* %a_00000296E346CFE8.
  %a_00000296E346CFE8.1 = ptrtoint float* %a_00000296E346CFE8. to i64
  %1 = add i64 %a_00000296E346CFE8.1, 0
  %2 = inttoptr i64 %1 to float*
  store float 9.700000e+01, float* %2
  %R7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), double 9.700000e+01)
  store i32 0, i32* %0
  br label %L7

L7:                                               ; preds = %L6
  %3 = load i32, i32* %0
  ret i32 0
}

declare i32 @printf(i8*, ...)

attributes #0 = { argmemonly nounwind }
