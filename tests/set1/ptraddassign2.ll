; ModuleID = 'out.bc'
source_filename = "sparse"

define internal i32* @incr(i32* %ARG1) {
L0:
  %R3 = ptrtoint i32* %ARG1 to i64
  %R4 = add i64 %R3, 16
  %R5 = inttoptr i64 %R4 to i32*
  ret i32* %R5
}

define i32 @main(i32 %ARG1, i8** %ARG2) {
L1:
  %values_0000027762F8D148 = alloca [5 x i32]
  %0 = ptrtoint [5 x i32]* %values_0000027762F8D148 to i64
  %1 = add i64 %0, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 9, i32* %2
  %3 = ptrtoint [5 x i32]* %values_0000027762F8D148 to i64
  %4 = add i64 %3, 4
  %5 = inttoptr i64 %4 to i32*
  store i32 8, i32* %5
  %6 = ptrtoint [5 x i32]* %values_0000027762F8D148 to i64
  %7 = add i64 %6, 8
  %8 = inttoptr i64 %7 to i32*
  store i32 7, i32* %8
  %9 = ptrtoint [5 x i32]* %values_0000027762F8D148 to i64
  %10 = add i64 %9, 12
  %11 = inttoptr i64 %10 to i32*
  store i32 6, i32* %11
  %12 = ptrtoint [5 x i32]* %values_0000027762F8D148 to i64
  %13 = add i64 %12, 16
  %14 = inttoptr i64 %13 to i32*
  store i32 5, i32* %14
  %R8 = bitcast [5 x i32]* %values_0000027762F8D148 to i32*
  %R10 = call i32* @incr(i32* %R8)
  %15 = ptrtoint i32* %R10 to i64
  %16 = add i64 %15, 0
  %17 = inttoptr i64 %16 to i32*
  %load_target = load i32, i32* %17
  %R14 = icmp ne i32 %load_target, 5
  %R141 = zext i1 %R14 to i32
  ret i32 %R141
}
