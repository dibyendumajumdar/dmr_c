; ModuleID = 'out.bc'
source_filename = "sparse"

define internal double @test(double* %ARG1) {
L0:
  %0 = alloca double
  %1 = bitcast double* %ARG1 to i8*
  %2 = getelementptr inbounds i8, i8* %1, i64 0
  %3 = bitcast i8* %2 to double*
  %load_target = load double, double* %3
  store double %load_target, double* %0
  %4 = load double, double* %0
  ret double %load_target
}

define i32 @main() {
L1:
  %v_00000182A83A9DF8 = alloca double
  %0 = bitcast double* %v_00000182A83A9DF8 to i8*
  %1 = getelementptr inbounds i8, i8* %0, i64 0
  %2 = bitcast i8* %1 to double*
  store double 4.200000e+01, double* %2
  %R7 = call double @test(double* %v_00000182A83A9DF8)
  %3 = bitcast double* %v_00000182A83A9DF8 to i8*
  %4 = getelementptr inbounds i8, i8* %3, i64 0
  %5 = bitcast i8* %4 to double*
  %load_target = load double, double* %5
  %R11 = fcmp une double %load_target, 4.200000e+01
  %R111 = zext i1 %R11 to i32
  ret i32 %R111
}
