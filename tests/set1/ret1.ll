; ModuleID = 'out.bc'
source_filename = "sparse"

define internal double @test(double* %ARG1) {
L0:
  %0 = alloca double
  %1 = ptrtoint double* %ARG1 to i64
  %2 = add i64 %1, 0
  %3 = inttoptr i64 %2 to double*
  %load_target = load double, double* %3
  store double %load_target, double* %0
  %4 = load double, double* %0
  ret double %load_target
}

define i32 @main() {
L1:
  %v_000001AACE0BEB68 = alloca double
  %0 = ptrtoint double* %v_000001AACE0BEB68 to i64
  %1 = add i64 %0, 0
  %2 = inttoptr i64 %1 to double*
  store double 4.200000e+01, double* %2
  %R7 = call double @test(double* %v_000001AACE0BEB68)
  %3 = ptrtoint double* %v_000001AACE0BEB68 to i64
  %4 = add i64 %3, 0
  %5 = inttoptr i64 %4 to double*
  %load_target = load double, double* %5
  %R11 = fcmp une double %load_target, 4.200000e+01
  %R111 = zext i1 %R11 to i32
  ret i32 %R111
}
