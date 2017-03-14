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
  %values_000001EE80FD9878 = alloca [5 x i32]
  %0 = bitcast [5 x i32]* %values_000001EE80FD9878 to i32*
  %1 = bitcast i32* %0 to i8*
  %2 = getelementptr inbounds i8, i8* %1, i64 0
  %3 = bitcast i8* %2 to i32*
  store i32 9, i32* %3
  %4 = bitcast [5 x i32]* %values_000001EE80FD9878 to i32*
  %5 = bitcast i32* %4 to i8*
  %6 = getelementptr inbounds i8, i8* %5, i64 4
  %7 = bitcast i8* %6 to i32*
  store i32 8, i32* %7
  %8 = bitcast [5 x i32]* %values_000001EE80FD9878 to i32*
  %9 = bitcast i32* %8 to i8*
  %10 = getelementptr inbounds i8, i8* %9, i64 8
  %11 = bitcast i8* %10 to i32*
  store i32 7, i32* %11
  %12 = bitcast [5 x i32]* %values_000001EE80FD9878 to i32*
  %13 = bitcast i32* %12 to i8*
  %14 = getelementptr inbounds i8, i8* %13, i64 12
  %15 = bitcast i8* %14 to i32*
  store i32 6, i32* %15
  %16 = bitcast [5 x i32]* %values_000001EE80FD9878 to i32*
  %17 = bitcast i32* %16 to i8*
  %18 = getelementptr inbounds i8, i8* %17, i64 16
  %19 = bitcast i8* %18 to i32*
  store i32 5, i32* %19
  %R8 = bitcast [5 x i32]* %values_000001EE80FD9878 to i32*
  %R10 = call i32* @incr(i32* %R8)
  %20 = bitcast i32* %R10 to i8*
  %21 = getelementptr inbounds i8, i8* %20, i64 0
  %22 = bitcast i8* %21 to i32*
  %load_target = load i32, i32* %22
  %R14 = icmp ne i32 %load_target, 5
  %R141 = zext i1 %R14 to i32
  ret i32 %R141
}
