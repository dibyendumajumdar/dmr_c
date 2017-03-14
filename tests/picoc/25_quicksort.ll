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
  %0 = getelementptr inbounds i8, i8* bitcast ([16 x i32]* @array to i8*), i64 %R4
  %1 = bitcast i8* %0 to i32*
  %2 = bitcast i32* %1 to i8*
  %3 = getelementptr inbounds i8, i8* %2, i64 0
  %4 = bitcast i8* %3 to i32*
  %load_target = load i32, i32* %4
  %R9 = sext i32 %ARG2 to i64
  %R10 = mul i64 %R9, 4
  %5 = getelementptr inbounds i8, i8* bitcast ([16 x i32]* @array to i8*), i64 %R10
  %6 = bitcast i8* %5 to i32*
  %7 = bitcast i32* %6 to i8*
  %8 = getelementptr inbounds i8, i8* %7, i64 0
  %9 = bitcast i8* %8 to i32*
  %load_target1 = load i32, i32* %9
  %10 = bitcast i32* %1 to i8*
  %11 = getelementptr inbounds i8, i8* %10, i64 0
  %12 = bitcast i8* %11 to i32*
  store i32 %load_target1, i32* %12
  %13 = bitcast i32* %6 to i8*
  %14 = getelementptr inbounds i8, i8* %13, i64 0
  %15 = bitcast i8* %14 to i32*
  store i32 %load_target, i32* %15
  ret void
}

define internal i32 @partition(i32 %ARG1, i32 %ARG2) {
L1:
  %0 = alloca i32
  %1 = alloca i32
  %2 = alloca i32
  %R27 = sext i32 %ARG1 to i64
  %R28 = mul i64 %R27, 4
  %3 = getelementptr inbounds i8, i8* bitcast ([16 x i32]* @array to i8*), i64 %R28
  %4 = bitcast i8* %3 to i32*
  %5 = bitcast i32* %4 to i8*
  %6 = getelementptr inbounds i8, i8* %5, i64 0
  %7 = bitcast i8* %6 to i32*
  %load_target = load i32, i32* %7
  call void @swap(i32 %ARG1, i32 %ARG2)
  store i32 %ARG1, i32* %2
  store i32 %ARG1, i32* %1
  store i32 %ARG1, i32* %0
  br label %L2

L2:                                               ; preds = %L5, %L1
  %8 = load i32, i32* %0
  %R37 = icmp slt i32 %8, %ARG2
  %R371 = zext i1 %R37 to i32
  %cond = icmp ne i32 %R371, 0
  br i1 %cond, label %L3, label %L6

L3:                                               ; preds = %L2
  %R40 = sext i32 %8 to i64
  %R41 = mul i64 %R40, 4
  %9 = getelementptr inbounds i8, i8* bitcast ([16 x i32]* @array to i8*), i64 %R41
  %10 = bitcast i8* %9 to i32*
  %11 = bitcast i32* %10 to i8*
  %12 = getelementptr inbounds i8, i8* %11, i64 0
  %13 = bitcast i8* %12 to i32*
  %load_target2 = load i32, i32* %13
  %R45 = icmp slt i32 %load_target2, %load_target
  %R453 = zext i1 %R45 to i32
  %cond4 = icmp ne i32 %R453, 0
  br i1 %cond4, label %L4, label %L5

L4:                                               ; preds = %L3
  %14 = load i32, i32* %1
  call void @swap(i32 %8, i32 %14)
  %R50 = add i32 %14, 1
  store i32 %R50, i32* %2
  store i32 %R50, i32* %1
  br label %L5

L5:                                               ; preds = %L4, %L3
  %R53 = add i32 %8, 1
  store i32 %R53, i32* %0
  br label %L2

L6:                                               ; preds = %L2
  %15 = load i32, i32* %2
  call void @swap(i32 %ARG2, i32 %15)
  ret i32 %15
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
  store i32 83, i32* bitcast (i8* getelementptr inbounds (i8, i8* bitcast ([16 x i32]* @array to i8*), i64 4) to i32*)
  store i32 4, i32* bitcast (i8* getelementptr inbounds (i8, i8* bitcast ([16 x i32]* @array to i8*), i64 8) to i32*)
  store i32 89, i32* bitcast (i8* getelementptr inbounds (i8, i8* bitcast ([16 x i32]* @array to i8*), i64 12) to i32*)
  store i32 36, i32* bitcast (i8* getelementptr inbounds (i8, i8* bitcast ([16 x i32]* @array to i8*), i64 16) to i32*)
  store i32 21, i32* bitcast (i8* getelementptr inbounds (i8, i8* bitcast ([16 x i32]* @array to i8*), i64 20) to i32*)
  store i32 74, i32* bitcast (i8* getelementptr inbounds (i8, i8* bitcast ([16 x i32]* @array to i8*), i64 24) to i32*)
  store i32 37, i32* bitcast (i8* getelementptr inbounds (i8, i8* bitcast ([16 x i32]* @array to i8*), i64 28) to i32*)
  store i32 65, i32* bitcast (i8* getelementptr inbounds (i8, i8* bitcast ([16 x i32]* @array to i8*), i64 32) to i32*)
  store i32 33, i32* bitcast (i8* getelementptr inbounds (i8, i8* bitcast ([16 x i32]* @array to i8*), i64 36) to i32*)
  store i32 96, i32* bitcast (i8* getelementptr inbounds (i8, i8* bitcast ([16 x i32]* @array to i8*), i64 40) to i32*)
  store i32 38, i32* bitcast (i8* getelementptr inbounds (i8, i8* bitcast ([16 x i32]* @array to i8*), i64 44) to i32*)
  store i32 53, i32* bitcast (i8* getelementptr inbounds (i8, i8* bitcast ([16 x i32]* @array to i8*), i64 48) to i32*)
  store i32 16, i32* bitcast (i8* getelementptr inbounds (i8, i8* bitcast ([16 x i32]* @array to i8*), i64 52) to i32*)
  store i32 74, i32* bitcast (i8* getelementptr inbounds (i8, i8* bitcast ([16 x i32]* @array to i8*), i64 56) to i32*)
  store i32 55, i32* bitcast (i8* getelementptr inbounds (i8, i8* bitcast ([16 x i32]* @array to i8*), i64 60) to i32*)
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
  %3 = getelementptr inbounds i8, i8* bitcast ([16 x i32]* @array to i8*), i64 %R76
  %4 = bitcast i8* %3 to i32*
  %5 = bitcast i32* %4 to i8*
  %6 = getelementptr inbounds i8, i8* %5, i64 0
  %7 = bitcast i8* %6 to i32*
  %load_target = load i32, i32* %7
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
  %8 = load i32, i32* %1
  %R85 = icmp slt i32 %8, 16
  %R852 = zext i1 %R85 to i32
  %cond3 = icmp ne i32 %R852, 0
  br i1 %cond3, label %L15, label %L16

L15:                                              ; preds = %L14
  %R89 = sext i32 %8 to i64
  %R90 = mul i64 %R89, 4
  %9 = getelementptr inbounds i8, i8* bitcast ([16 x i32]* @array to i8*), i64 %R90
  %10 = bitcast i8* %9 to i32*
  %11 = bitcast i32* %10 to i8*
  %12 = getelementptr inbounds i8, i8* %11, i64 0
  %13 = bitcast i8* %12 to i32*
  %load_target4 = load i32, i32* %13
  %R93 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i32 %load_target4)
  %R95 = add i32 %8, 1
  store i32 %R95, i32* %1
  br label %L14

L16:                                              ; preds = %L14
  %R97 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0))
  ret i32 0
}

declare i32 @printf(i8*, ...)
