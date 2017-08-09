; ModuleID = 'out.bc'
source_filename = "dmrC"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define internal double @test(double* %ARG1) {
L0:
  %x_000001B3A6B5C228. = alloca double
  %p_000001B3A6B5BF88. = alloca double*
  %0 = alloca double
  %p_000001B3A6B5BF88.1 = ptrtoint double** %p_000001B3A6B5BF88. to i64
  %1 = add i64 %p_000001B3A6B5BF88.1, 0
  %2 = inttoptr i64 %1 to double**
  store double* %ARG1, double** %2
  %p_000001B3A6B5BF88.2 = ptrtoint double** %p_000001B3A6B5BF88. to i64
  %3 = add i64 %p_000001B3A6B5BF88.2, 0
  %4 = inttoptr i64 %3 to double**
  %R1 = load double*, double** %4
  %R13 = ptrtoint double* %R1 to i64
  %5 = add i64 %R13, 0
  %6 = inttoptr i64 %5 to double*
  %R2 = load double, double* %6
  %x_000001B3A6B5C228.4 = ptrtoint double* %x_000001B3A6B5C228. to i64
  %7 = add i64 %x_000001B3A6B5C228.4, 0
  %8 = inttoptr i64 %7 to double*
  store double %R2, double* %8
  %x_000001B3A6B5C228.5 = ptrtoint double* %x_000001B3A6B5C228. to i64
  %9 = add i64 %x_000001B3A6B5C228.5, 0
  %10 = inttoptr i64 %9 to double*
  %R3 = load double, double* %10
  store double %R3, double* %0
  br label %L1

L1:                                               ; preds = %L0
  %11 = load double, double* %0
  ret double %R3
}

define i32 @main() {
L2:
  %u_000001B3A6B5C688. = alloca double
  %v_000001B3A6B5C768. = alloca double
  %0 = alloca i32
  %v_000001B3A6B5C768.1 = ptrtoint double* %v_000001B3A6B5C768. to i64
  %1 = add i64 %v_000001B3A6B5C768.1, 0
  %2 = inttoptr i64 %1 to double*
  store double 4.200000e+01, double* %2
  %R7 = call double @test(double* %v_000001B3A6B5C768.)
  %u_000001B3A6B5C688.2 = ptrtoint double* %u_000001B3A6B5C688. to i64
  %3 = add i64 %u_000001B3A6B5C688.2, 0
  %4 = inttoptr i64 %3 to double*
  store double %R7, double* %4
  %v_000001B3A6B5C768.3 = ptrtoint double* %v_000001B3A6B5C768. to i64
  %5 = add i64 %v_000001B3A6B5C768.3, 0
  %6 = inttoptr i64 %5 to double*
  %R8 = load double, double* %6
  %R10 = fcmp oeq double %R8, 4.200000e+01
  %R104 = zext i1 %R10 to i32
  %cond = icmp ne i32 %R104, 0
  %select = select i1 %cond, i32 0, i32 1
  store i32 %select, i32* %0
  br label %L3

L3:                                               ; preds = %L2
  %7 = load i32, i32* %0
  ret i32 %select
}

attributes #0 = { argmemonly nounwind }
