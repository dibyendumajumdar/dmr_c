; ModuleID = 'out.bc'
source_filename = "sparse"

@array = private global [16 x i32] zeroinitializer, align 4
@.str = private constant [4 x i8] c"%d \00"
@.str.1 = private constant [2 x i8] c"\0A\00"
@.str.2 = private constant [4 x i8] c"%d \00"
@.str.3 = private constant [2 x i8] c"\0A\00"

define internal void @swap(i32 %ARG1, i32 %ARG2) {
L0:
  %R3 = sext i32 %ARG1 to i64
  %R4 = mul i64 %R3, 4
  %R5 = add i64 ptrtoint ([16 x i32]* @array to i64), %R4
  %0 = inttoptr i64 %R5 to i32*
  %1 = ptrtoint i32* %0 to i64
  %2 = add i64 %1, 0
  %3 = inttoptr i64 %2 to i32*
  %load_target = load i32, i32* %3
  %R9 = sext i32 %ARG2 to i64
  %R10 = mul i64 %R9, 4
  %R11 = add i64 ptrtoint ([16 x i32]* @array to i64), %R10
  %4 = inttoptr i64 %R11 to i32*
  %5 = ptrtoint i32* %4 to i64
  %6 = add i64 %5, 0
  %7 = inttoptr i64 %6 to i32*
  %load_target1 = load i32, i32* %7
  %8 = ptrtoint i32* %0 to i64
  %9 = add i64 %8, 0
  %10 = inttoptr i64 %9 to i32*
  store i32 %load_target1, i32* %10
  %11 = ptrtoint i32* %4 to i64
  %12 = add i64 %11, 0
  %13 = inttoptr i64 %12 to i32*
  store i32 %load_target, i32* %13
  ret void
}

define internal i32 @partition(i32 %ARG1, i32 %ARG2) {
L1:
  %0 = alloca i32
  %1 = alloca i32
  %2 = alloca i32
  %R27 = sext i32 %ARG1 to i64
  %R28 = mul i64 %R27, 4
  %R29 = add i64 ptrtoint ([16 x i32]* @array to i64), %R28
  %3 = inttoptr i64 %R29 to i32*
  %4 = ptrtoint i32* %3 to i64
  %5 = add i64 %4, 0
  %6 = inttoptr i64 %5 to i32*
  %load_target = load i32, i32* %6
  call void @swap(i32 %ARG1, i32 %ARG2)
  store i32 %ARG1, i32* %2
  store i32 %ARG1, i32* %1
  store i32 %ARG1, i32* %0
  br label %L2

L2:                                               ; preds = %L5, %L1
  %7 = load i32, i32* %0
  %R37 = icmp slt i32 %7, %ARG2
  %R371 = zext i1 %R37 to i32
  %cond = icmp ne i32 %R371, 0
  br i1 %cond, label %L3, label %L6

L3:                                               ; preds = %L2
  %R40 = sext i32 %7 to i64
  %R41 = mul i64 %R40, 4
  %R42 = add i64 ptrtoint ([16 x i32]* @array to i64), %R41
  %8 = inttoptr i64 %R42 to i32*
  %9 = ptrtoint i32* %8 to i64
  %10 = add i64 %9, 0
  %11 = inttoptr i64 %10 to i32*
  %load_target2 = load i32, i32* %11
  %R45 = icmp slt i32 %load_target2, %load_target
  %R453 = zext i1 %R45 to i32
  %cond4 = icmp ne i32 %R453, 0
  br i1 %cond4, label %L4, label %L5

L4:                                               ; preds = %L3
  %12 = load i32, i32* %1
  call void @swap(i32 %7, i32 %12)
  %R50 = add i32 %12, 1
  store i32 %R50, i32* %2
  store i32 %R50, i32* %1
  br label %L5

L5:                                               ; preds = %L4, %L3
  %R53 = add i32 %7, 1
  store i32 %R53, i32* %0
  br label %L2

L6:                                               ; preds = %L2
  %13 = load i32, i32* %2
  call void @swap(i32 %ARG2, i32 %13)
  ret i32 %13
}

define internal void @quicksort(i32 %ARG1, i32 %ARG2) {
L7:
  %R60 = icmp sge i32 %ARG1, %ARG2
  %R601 = zext i1 %R60 to i32
  %cond = icmp ne i32 %R601, 0
  br i1 %cond, label %L9, label %L8

L8:                                               ; preds = %L7
  %R63 = call i32 @partition(i32 %ARG1, i32 %ARG2)
  %R66 = add i32 %R63, -1
  call void @quicksort(i32 %ARG1, i32 %R66)
  %R68 = add i32 %R63, 1
  call void @quicksort(i32 %R68, i32 %ARG2)
  br label %L9

L9:                                               ; preds = %L8, %L7
  ret void
}

define i32 @main() {
L10:
  %0 = alloca i32
  %1 = alloca i32
  store i32 62, i32* getelementptr inbounds ([16 x i32], [16 x i32]* @array, i32 0, i32 0)
  store i32 83, i32* inttoptr (i64 add (i64 ptrtoint ([16 x i32]* @array to i64), i64 4) to i32*)
  store i32 4, i32* inttoptr (i64 add (i64 ptrtoint ([16 x i32]* @array to i64), i64 8) to i32*)
  store i32 89, i32* inttoptr (i64 add (i64 ptrtoint ([16 x i32]* @array to i64), i64 12) to i32*)
  store i32 36, i32* inttoptr (i64 add (i64 ptrtoint ([16 x i32]* @array to i64), i64 16) to i32*)
  store i32 21, i32* inttoptr (i64 add (i64 ptrtoint ([16 x i32]* @array to i64), i64 20) to i32*)
  store i32 74, i32* inttoptr (i64 add (i64 ptrtoint ([16 x i32]* @array to i64), i64 24) to i32*)
  store i32 37, i32* inttoptr (i64 add (i64 ptrtoint ([16 x i32]* @array to i64), i64 28) to i32*)
  store i32 65, i32* inttoptr (i64 add (i64 ptrtoint ([16 x i32]* @array to i64), i64 32) to i32*)
  store i32 33, i32* inttoptr (i64 add (i64 ptrtoint ([16 x i32]* @array to i64), i64 36) to i32*)
  store i32 96, i32* inttoptr (i64 add (i64 ptrtoint ([16 x i32]* @array to i64), i64 40) to i32*)
  store i32 38, i32* inttoptr (i64 add (i64 ptrtoint ([16 x i32]* @array to i64), i64 44) to i32*)
  store i32 53, i32* inttoptr (i64 add (i64 ptrtoint ([16 x i32]* @array to i64), i64 48) to i32*)
  store i32 16, i32* inttoptr (i64 add (i64 ptrtoint ([16 x i32]* @array to i64), i64 52) to i32*)
  store i32 74, i32* inttoptr (i64 add (i64 ptrtoint ([16 x i32]* @array to i64), i64 56) to i32*)
  store i32 55, i32* inttoptr (i64 add (i64 ptrtoint ([16 x i32]* @array to i64), i64 60) to i32*)
  store i32 0, i32* %0
  br label %L11

L11:                                              ; preds = %L12, %L10
  %2 = load i32, i32* %0
  %R71 = icmp slt i32 %2, 16
  %R711 = zext i1 %R71 to i32
  %cond = icmp ne i32 %R711, 0
  br i1 %cond, label %L12, label %L13

L12:                                              ; preds = %L11
  %R75 = sext i32 %2 to i64
  %R76 = mul i64 %R75, 4
  %R77 = add i64 ptrtoint ([16 x i32]* @array to i64), %R76
  %3 = inttoptr i64 %R77 to i32*
  %4 = ptrtoint i32* %3 to i64
  %5 = add i64 %4, 0
  %6 = inttoptr i64 %5 to i32*
  %load_target = load i32, i32* %6
  %R79 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %load_target)
  %R81 = add i32 %2, 1
  store i32 %R81, i32* %0
  br label %L11

L13:                                              ; preds = %L11
  %R83 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0))
  call void @quicksort(i32 0, i32 15)
  store i32 0, i32* %1
  br label %L14

L14:                                              ; preds = %L15, %L13
  %7 = load i32, i32* %1
  %R85 = icmp slt i32 %7, 16
  %R852 = zext i1 %R85 to i32
  %cond3 = icmp ne i32 %R852, 0
  br i1 %cond3, label %L15, label %L16

L15:                                              ; preds = %L14
  %R89 = sext i32 %7 to i64
  %R90 = mul i64 %R89, 4
  %R91 = add i64 ptrtoint ([16 x i32]* @array to i64), %R90
  %8 = inttoptr i64 %R91 to i32*
  %9 = ptrtoint i32* %8 to i64
  %10 = add i64 %9, 0
  %11 = inttoptr i64 %10 to i32*
  %load_target4 = load i32, i32* %11
  %R93 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i32 %load_target4)
  %R95 = add i32 %7, 1
  store i32 %R95, i32* %1
  br label %L14

L16:                                              ; preds = %L14
  %R97 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0))
  ret i32 0
}

declare i32 @printf(i8*, ...)
