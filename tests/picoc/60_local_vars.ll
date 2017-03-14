; ModuleID = 'out.bc'
source_filename = "sparse"

@.str = private constant [16 x i8] c"foo: first for\0A\00"
@.str.1 = private constant [9 x i8] c"foo: %d\0A\00"
@.str.2 = private constant [16 x i8] c"foo: while: %d\0A\00"
@.str.3 = private constant [17 x i8] c"foo: second for\0A\00"
@.str.4 = private constant [9 x i8] c"foo: %d\0A\00"
@.str.5 = private constant [9 x i8] c"foo: %d\0A\00"
@.str.6 = private constant [11 x i8] c"first for\0A\00"
@.str.7 = private constant [4 x i8] c"%d\0A\00"
@.str.8 = private constant [12 x i8] c"second for\0A\00"
@.str.9 = private constant [4 x i8] c"%d\0A\00"

define internal void @foo() {
L0:
  %0 = alloca i32
  %1 = alloca i32
  %2 = alloca i32
  %3 = alloca i32
  %R2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0))
  store i32 0, i32* %0
  br label %L1

L1:                                               ; preds = %L2, %L0
  %4 = load i32, i32* %0
  %R4 = icmp slt i32 %4, 3
  %R41 = zext i1 %R4 to i32
  %cond = icmp ne i32 %R41, 0
  br i1 %cond, label %L2, label %L3

L2:                                               ; preds = %L1
  %R9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), i32 %4)
  %R11 = add i32 %4, 1
  store i32 %R11, i32* %0
  br label %L1

L3:                                               ; preds = %L1
  %R13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0), i32 5)
  %R15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0))
  store i32 0, i32* %1
  br label %L4

L4:                                               ; preds = %L5, %L3
  %5 = load i32, i32* %1
  %R17 = icmp slt i32 %5, 3
  %R172 = zext i1 %R17 to i32
  %cond3 = icmp ne i32 %R172, 0
  br i1 %cond3, label %L5, label %L6

L5:                                               ; preds = %L4
  %R20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i64 0, i64 0), i32 %5)
  %R22 = add i32 %5, 1
  store i32 %R22, i32* %1
  br label %L4

L6:                                               ; preds = %L4
  store i32 0, i32* %2
  br label %L7

L7:                                               ; preds = %L8, %L6
  %6 = load i32, i32* %2
  %R24 = icmp slt i32 %6, 100000
  %R244 = zext i1 %R24 to i32
  %cond5 = icmp ne i32 %R244, 0
  br i1 %cond5, label %L8, label %L9

L8:                                               ; preds = %L7
  %R28 = add i32 %6, 1
  store i32 %R28, i32* %2
  br label %L7

L9:                                               ; preds = %L7
  store i32 0, i32* %3
  br label %L10

L10:                                              ; preds = %L11, %L9
  %7 = load i32, i32* %3
  %R30 = icmp slt i32 %7, 3
  %R306 = zext i1 %R30 to i32
  %cond7 = icmp ne i32 %R306, 0
  br i1 %cond7, label %L11, label %L12

L11:                                              ; preds = %L10
  %R34 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.5, i64 0, i64 0), i32 %7)
  %R36 = add i32 %7, 1
  store i32 %R36, i32* %3
  br label %L10

L12:                                              ; preds = %L10
  ret void
}

declare i32 @printf(i8*, ...)

define i32 @main() {
L13:
  %0 = alloca i32
  %1 = alloca i32
  %R38 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.6, i64 0, i64 0))
  store i32 0, i32* %0
  br label %L14

L14:                                              ; preds = %L15, %L13
  %2 = load i32, i32* %0
  %R40 = icmp slt i32 %2, 3
  %R401 = zext i1 %R40 to i32
  %cond = icmp ne i32 %R401, 0
  br i1 %cond, label %L15, label %L16

L15:                                              ; preds = %L14
  %R45 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.7, i64 0, i64 0), i32 %2)
  %R47 = add i32 %2, 1
  store i32 %R47, i32* %0
  br label %L14

L16:                                              ; preds = %L14
  %R49 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.8, i64 0, i64 0))
  store i32 0, i32* %1
  br label %L17

L17:                                              ; preds = %L18, %L16
  %3 = load i32, i32* %1
  %R51 = icmp slt i32 %3, 3
  %R512 = zext i1 %R51 to i32
  %cond3 = icmp ne i32 %R512, 0
  br i1 %cond3, label %L18, label %L19

L18:                                              ; preds = %L17
  %R54 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i64 0, i64 0), i32 %3)
  %R56 = add i32 %3, 1
  store i32 %R56, i32* %1
  br label %L17

L19:                                              ; preds = %L17
  call void @foo()
  ret i32 0
}
