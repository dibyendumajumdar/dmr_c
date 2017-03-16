; ModuleID = 'out.bc'
source_filename = "sparse"

define internal i32 @execute(i32 %ARG1, i8* %ARG2, i32 %ARG3, i32 %ARG4) {
L0:
  %0 = alloca i32
  %R6 = bitcast i8* %ARG2 to i32 (i32, i32)*
  %cond = icmp ne i32 %ARG1, 0
  br i1 %cond, label %L2, label %L1

L1:                                               ; preds = %L0
  %R7 = bitcast i32 (i32, i32)* %R6 to i8*
  %R71 = bitcast i8* %R7 to i32 (i32, i32)*
  %R72 = call i32 %R71(i32 %ARG3, i32 %ARG4)
  store i32 %R72, i32* %0
  br label %L3

L2:                                               ; preds = %L0
  %R12 = bitcast i32 (i32, i32)* %R6 to i8*
  %R123 = bitcast i8* %R12 to i32 (i32)*
  %R124 = call i32 %R123(i32 %ARG3)
  store i32 %R124, i32* %0
  br label %L3

L3:                                               ; preds = %L2, %L1
  %1 = load i32, i32* %0
  ret i32 %1
}

define internal i32 @unary(i32 %ARG1) {
L4:
  %R14 = add i32 %ARG1, 3
  ret i32 %R14
}

define i32 @main() {
L5:
  %R19 = call i32 @execute(i32 1, i8* bitcast (i32 (i32)* @unary to i8*), i32 3, i32 10)
  %R21 = icmp ne i32 %R19, 6
  %R211 = zext i1 %R21 to i32
  ret i32 %R211
}
