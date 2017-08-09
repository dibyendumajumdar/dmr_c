; ModuleID = 'out.bc'
source_filename = "dmrC"

@Half = private global double 5.000000e-01, align 8
@One = private global double 1.000000e+00, align 8
@Two = private global double 2.000000e+00, align 8
@.str = private constant [4 x i8] c"%f\0A\00"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define i32 @main() {
L0:
  %0 = alloca i32
  store double 1.000000e+00, double* @One
  %R1 = load double, double* @One
  %R2 = load double, double* @One
  %R3 = fadd double %R1, %R2
  store double %R3, double* @Two
  %R4 = load double, double* @One
  %R5 = load double, double* @Two
  %R6 = fdiv double %R4, %R5
  store double %R6, double* @Half
  %R8 = load double, double* @Half
  %R9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), double %R8)
  %R10 = load double, double* @Half
  %R12 = fcmp oeq double %R10, 5.000000e-01
  %R121 = zext i1 %R12 to i32
  %cond = icmp ne i32 %R121, 0
  %select = select i1 %cond, i32 0, i32 1
  store i32 %select, i32* %0
  br label %L1

L1:                                               ; preds = %L0
  %1 = load i32, i32* %0
  ret i32 %select
}

declare i32 @printf(i8*, ...)

attributes #0 = { argmemonly nounwind }
