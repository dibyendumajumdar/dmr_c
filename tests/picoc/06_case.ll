; ModuleID = 'out.bc'
source_filename = "sparse"

@.str = private constant [4 x i8] c"%d\0A\00"
@.str.1 = private constant [4 x i8] c"%d\0A\00"
@.str.2 = private constant [4 x i8] c"%d\0A\00"
@.str.3 = private constant [4 x i8] c"%d\0A\00"

define i32 @main() {
L0:
  %0 = alloca i32
  store i32 0, i32* %0
  br label %L1

L1:                                               ; preds = %L6, %L0
  %1 = load i32, i32* %0
  %R2 = icmp slt i32 %1, 4
  %R21 = zext i1 %R2 to i32
  %cond = icmp ne i32 %R21, 0
  br i1 %cond, label %L2, label %L7

L2:                                               ; preds = %L1
  %R5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %1)
  switch i32 %1, label %L5 [
    i32 1, label %L3
    i32 2, label %L4
  ]

L3:                                               ; preds = %L2
  %R8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 1)
  br label %L6

L4:                                               ; preds = %L2
  %R10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i32 2)
  br label %L6

L5:                                               ; preds = %L2
  %R12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 0)
  br label %L6

L6:                                               ; preds = %L5, %L4, %L3
  %R14 = add i32 %1, 1
  store i32 %R14, i32* %0
  br label %L1

L7:                                               ; preds = %L1
  ret i32 0
}

declare i32 @printf(i8*, ...)
