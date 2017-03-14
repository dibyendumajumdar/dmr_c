; ModuleID = 'out.bc'
source_filename = "sparse"

@f = private global i32 (i32)* null, align 8

define internal i32 @testfunc(i32 %ARG1) {
L0:
  %R2 = add i32 %ARG1, -6
  ret i32 %R2
}

define i32 @main(i32 %ARG1, i8** %ARG2) {
L1:
  %0 = alloca i32
  store i32 (i32)* @testfunc, i32 (i32)** @f
  br i1 true, label %L2, label %L3

L2:                                               ; preds = %L1
  %R7 = call i32 @testfunc(i32 6)
  store i32 %R7, i32* %0
  br label %L4

L3:                                               ; preds = %L1
  store i32 1, i32* %0
  br label %L4

L4:                                               ; preds = %L3, %L2
  %1 = load i32, i32* %0
  ret i32 %1
}
