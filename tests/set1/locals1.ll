; ModuleID = 'out.bc'
source_filename = "sparse"

define internal void @init(i32* %ARG1) {
L0:
  %0 = bitcast i32* %ARG1 to i8*
  %1 = getelementptr inbounds i8, i8* %0, i64 0
  %2 = bitcast i8* %1 to i32*
  store i32 5, i32* %2
  ret void
}

define i32 @main(i32 %ARG1, i8** %ARG2) {
L1:
  %x_000001FA4F7FBCA8 = alloca [6 x i32]
  %x_000001FA4F7FB928 = alloca [5 x i32]
  %R2 = bitcast [5 x i32]* %x_000001FA4F7FB928 to i32*
  call void @init(i32* %R2)
  %0 = bitcast [5 x i32]* %x_000001FA4F7FB928 to i32*
  %1 = bitcast i32* %0 to i8*
  %2 = getelementptr inbounds i8, i8* %1, i64 0
  %3 = bitcast i8* %2 to i32*
  %load_target = load i32, i32* %3
  %R9 = bitcast [6 x i32]* %x_000001FA4F7FBCA8 to i32*
  call void @init(i32* %R9)
  %4 = bitcast [6 x i32]* %x_000001FA4F7FBCA8 to i32*
  %5 = bitcast i32* %4 to i8*
  %6 = getelementptr inbounds i8, i8* %5, i64 0
  %7 = bitcast i8* %6 to i32*
  %load_target1 = load i32, i32* %7
  %R14 = add i32 %load_target, %load_target1
  %R18 = icmp ne i32 %R14, 10
  %R182 = zext i1 %R18 to i32
  ret i32 %R182
}
