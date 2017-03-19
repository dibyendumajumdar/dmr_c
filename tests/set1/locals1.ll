; ModuleID = 'out.bc'
source_filename = "sparse"

define internal void @init(i32* %ARG1) {
L0:
  %0 = ptrtoint i32* %ARG1 to i64
  %1 = add i64 %0, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 5, i32* %2
  ret void
}

define i32 @main(i32 %ARG1, i8** %ARG2) {
L1:
  %x_000002752E52E7A8 = alloca [6 x i32]
  %x_000002752E52E428 = alloca [5 x i32]
  %R2 = bitcast [5 x i32]* %x_000002752E52E428 to i32*
  call void @init(i32* %R2)
  %0 = ptrtoint [5 x i32]* %x_000002752E52E428 to i64
  %1 = add i64 %0, 0
  %2 = inttoptr i64 %1 to i32*
  %load_target = load i32, i32* %2
  %R9 = bitcast [6 x i32]* %x_000002752E52E7A8 to i32*
  call void @init(i32* %R9)
  %3 = ptrtoint [6 x i32]* %x_000002752E52E7A8 to i64
  %4 = add i64 %3, 0
  %5 = inttoptr i64 %4 to i32*
  %load_target1 = load i32, i32* %5
  %R14 = add i32 %load_target, %load_target1
  %R18 = icmp ne i32 %R14, 10
  %R182 = zext i1 %R18 to i32
  ret i32 %R182
}
