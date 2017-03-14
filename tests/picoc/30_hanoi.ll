; ModuleID = 'out.bc'
source_filename = "sparse"

@A = private global [4 x i32] zeroinitializer, align 4
@B = private global [4 x i32] zeroinitializer, align 4
@C = private global [4 x i32] zeroinitializer, align 4
@.str = private constant [4 x i8] c"A: \00"
@.str.1 = private constant [5 x i8] c" %d \00"
@.str.2 = private constant [2 x i8] c"\0A\00"
@.str.3 = private constant [4 x i8] c"B: \00"
@.str.4 = private constant [5 x i8] c" %d \00"
@.str.5 = private constant [2 x i8] c"\0A\00"
@.str.6 = private constant [4 x i8] c"C: \00"
@.str.7 = private constant [5 x i8] c" %d \00"
@.str.8 = private constant [2 x i8] c"\0A\00"
@.str.9 = private constant [44 x i8] c"------------------------------------------\0A\00"
@.str.10 = private constant [51 x i8] c"Solution of Tower of Hanoi Problem with %d Disks\0A\0A\00"
@.str.11 = private constant [17 x i8] c"Starting state:\0A\00"
@.str.12 = private constant [23 x i8] c"\0A\0ASubsequent states:\0A\0A\00"

define internal void @Hanoi(i32 %ARG1, i32* %ARG2, i32* %ARG3, i32* %ARG4) {
L18:
  %R99 = icmp eq i32 %ARG1, 1
  %R991 = zext i1 %R99 to i32
  %cond = icmp ne i32 %R991, 0
  br i1 %cond, label %L19, label %L20

L19:                                              ; preds = %L18
  %R102 = call i32 @Move(i32* %ARG2, i32* %ARG3)
  br label %L21

L20:                                              ; preds = %L18
  %R104 = add i32 %ARG1, -1
  call void @Hanoi(i32 %R104, i32* %ARG2, i32* %ARG4, i32* %ARG3)
  %R110 = call i32 @Move(i32* %ARG2, i32* %ARG3)
  call void @Hanoi(i32 %R104, i32* %ARG4, i32* %ARG3, i32* %ARG2)
  br label %L21

L21:                                              ; preds = %L20, %L19
  ret void
}

define internal void @PrintAll() {
L0:
  %0 = alloca i32
  %1 = alloca i32
  %2 = alloca i32
  %R2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0))
  store i32 0, i32* %0
  br label %L1

L1:                                               ; preds = %L2, %L0
  %3 = load i32, i32* %0
  %R4 = icmp slt i32 %3, 4
  %R41 = zext i1 %R4 to i32
  %cond = icmp ne i32 %R41, 0
  br i1 %cond, label %L2, label %L3

L2:                                               ; preds = %L1
  %R8 = sext i32 %3 to i64
  %R9 = mul i64 %R8, 4
  %4 = getelementptr inbounds i8, i8* bitcast ([4 x i32]* @A to i8*), i64 %R9
  %5 = bitcast i8* %4 to i32*
  %6 = bitcast i32* %5 to i8*
  %7 = getelementptr inbounds i8, i8* %6, i64 0
  %8 = bitcast i8* %7 to i32*
  %load_target = load i32, i32* %8
  %R12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0), i32 %load_target)
  %R14 = add i32 %3, 1
  store i32 %R14, i32* %0
  br label %L1

L3:                                               ; preds = %L1
  %R16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0))
  %R18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0))
  store i32 0, i32* %1
  br label %L4

L4:                                               ; preds = %L5, %L3
  %9 = load i32, i32* %1
  %R20 = icmp slt i32 %9, 4
  %R202 = zext i1 %R20 to i32
  %cond3 = icmp ne i32 %R202, 0
  br i1 %cond3, label %L5, label %L6

L5:                                               ; preds = %L4
  %R24 = sext i32 %9 to i64
  %R25 = mul i64 %R24, 4
  %10 = getelementptr inbounds i8, i8* bitcast ([4 x i32]* @B to i8*), i64 %R25
  %11 = bitcast i8* %10 to i32*
  %12 = bitcast i32* %11 to i8*
  %13 = getelementptr inbounds i8, i8* %12, i64 0
  %14 = bitcast i8* %13 to i32*
  %load_target4 = load i32, i32* %14
  %R28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i64 0, i64 0), i32 %load_target4)
  %R30 = add i32 %9, 1
  store i32 %R30, i32* %1
  br label %L4

L6:                                               ; preds = %L4
  %R32 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i64 0, i64 0))
  %R34 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.6, i64 0, i64 0))
  store i32 0, i32* %2
  br label %L7

L7:                                               ; preds = %L8, %L6
  %15 = load i32, i32* %2
  %R36 = icmp slt i32 %15, 4
  %R365 = zext i1 %R36 to i32
  %cond6 = icmp ne i32 %R365, 0
  br i1 %cond6, label %L8, label %L9

L8:                                               ; preds = %L7
  %R40 = sext i32 %15 to i64
  %R417 = mul i64 %R40, 4
  %16 = getelementptr inbounds i8, i8* bitcast ([4 x i32]* @C to i8*), i64 %R417
  %17 = bitcast i8* %16 to i32*
  %18 = bitcast i32* %17 to i8*
  %19 = getelementptr inbounds i8, i8* %18, i64 0
  %20 = bitcast i8* %19 to i32*
  %load_target8 = load i32, i32* %20
  %R44 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i64 0, i64 0), i32 %load_target8)
  %R46 = add i32 %15, 1
  store i32 %R46, i32* %2
  br label %L7

L9:                                               ; preds = %L7
  %R48 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8, i64 0, i64 0))
  %R50 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.9, i64 0, i64 0))
  ret void
}

declare i32 @printf(i8*, ...)

define internal i32 @Move(i32* %ARG1, i32* %ARG2) {
L10:
  %0 = alloca i32
  %1 = alloca i32
  store i32 0, i32* %0
  store i32 0, i32* %1
  br label %L11

L11:                                              ; preds = %L13, %L10
  %2 = load i32, i32* %0
  %R52 = icmp slt i32 %2, 4
  %R521 = zext i1 %R52 to i32
  %cond = icmp ne i32 %R521, 0
  br i1 %cond, label %L12, label %L14

L12:                                              ; preds = %L11
  %R55 = sext i32 %2 to i64
  %R56 = mul i64 %R55, 4
  %3 = bitcast i32* %ARG1 to i8*
  %4 = getelementptr inbounds i8, i8* %3, i64 %R56
  %5 = bitcast i8* %4 to i32*
  %6 = bitcast i32* %5 to i8*
  %7 = getelementptr inbounds i8, i8* %6, i64 0
  %8 = bitcast i8* %7 to i32*
  %load_target = load i32, i32* %8
  %cond2 = icmp ne i32 %load_target, 0
  br i1 %cond2, label %L14, label %L13

L13:                                              ; preds = %L12
  %R61 = add i32 %2, 1
  store i32 %R61, i32* %0
  br label %L11

L14:                                              ; preds = %L16, %L12, %L11
  %9 = load i32, i32* %1
  %R63 = icmp slt i32 %9, 4
  %R633 = zext i1 %R63 to i32
  %cond4 = icmp ne i32 %R633, 0
  br i1 %cond4, label %L15, label %L17

L15:                                              ; preds = %L14
  %R66 = sext i32 %9 to i64
  %R67 = mul i64 %R66, 4
  %10 = bitcast i32* %ARG2 to i8*
  %11 = getelementptr inbounds i8, i8* %10, i64 %R67
  %12 = bitcast i8* %11 to i32*
  %13 = bitcast i32* %12 to i8*
  %14 = getelementptr inbounds i8, i8* %13, i64 0
  %15 = bitcast i8* %14 to i32*
  %load_target5 = load i32, i32* %15
  %cond6 = icmp ne i32 %load_target5, 0
  br i1 %cond6, label %L17, label %L16

L16:                                              ; preds = %L15
  %R72 = add i32 %9, 1
  store i32 %R72, i32* %1
  br label %L14

L17:                                              ; preds = %L15, %L14
  %R75 = sext i32 %2 to i64
  %R76 = mul i64 %R75, 4
  %16 = bitcast i32* %ARG1 to i8*
  %17 = getelementptr inbounds i8, i8* %16, i64 %R76
  %18 = bitcast i8* %17 to i32*
  %19 = bitcast i32* %18 to i8*
  %20 = getelementptr inbounds i8, i8* %19, i64 0
  %21 = bitcast i8* %20 to i32*
  %load_target7 = load i32, i32* %21
  %R81 = add i32 %9, -1
  %R82 = sext i32 %R81 to i64
  %R83 = mul i64 %R82, 4
  %22 = bitcast i32* %ARG2 to i8*
  %23 = getelementptr inbounds i8, i8* %22, i64 %R83
  %24 = bitcast i8* %23 to i32*
  %25 = bitcast i32* %24 to i8*
  %26 = getelementptr inbounds i8, i8* %25, i64 0
  %27 = bitcast i8* %26 to i32*
  store i32 %load_target7, i32* %27
  %R87 = sext i32 %2 to i64
  %R88 = mul i64 %R87, 4
  %28 = bitcast i32* %ARG1 to i8*
  %29 = getelementptr inbounds i8, i8* %28, i64 %R88
  %30 = bitcast i8* %29 to i32*
  %31 = bitcast i32* %30 to i8*
  %32 = getelementptr inbounds i8, i8* %31, i64 0
  %33 = bitcast i8* %32 to i32*
  store i32 0, i32* %33
  call void @PrintAll()
  %34 = bitcast i32* %24 to i8*
  %35 = getelementptr inbounds i8, i8* %34, i64 0
  %36 = bitcast i8* %35 to i32*
  %load_target8 = load i32, i32* %36
  ret i32 %load_target8
}

define i32 @main() {
L22:
  %0 = alloca i32
  %1 = alloca i32
  %2 = alloca i32
  store i32 0, i32* %0
  br label %L23

L23:                                              ; preds = %L24, %L22
  %3 = load i32, i32* %0
  %R117 = icmp slt i32 %3, 4
  %R1171 = zext i1 %R117 to i32
  %cond = icmp ne i32 %R1171, 0
  br i1 %cond, label %L24, label %L25

L24:                                              ; preds = %L23
  %R119 = add i32 %3, 1
  %R122 = sext i32 %3 to i64
  %R123 = mul i64 %R122, 4
  %4 = getelementptr inbounds i8, i8* bitcast ([4 x i32]* @A to i8*), i64 %R123
  %5 = bitcast i8* %4 to i32*
  %6 = bitcast i32* %5 to i8*
  %7 = getelementptr inbounds i8, i8* %6, i64 0
  %8 = bitcast i8* %7 to i32*
  store i32 %R119, i32* %8
  store i32 %R119, i32* %0
  br label %L23

L25:                                              ; preds = %L23
  store i32 0, i32* %1
  br label %L26

L26:                                              ; preds = %L27, %L25
  %9 = load i32, i32* %1
  %R128 = icmp slt i32 %9, 4
  %R1282 = zext i1 %R128 to i32
  %cond3 = icmp ne i32 %R1282, 0
  br i1 %cond3, label %L27, label %L28

L27:                                              ; preds = %L26
  %R131 = sext i32 %9 to i64
  %R132 = mul i64 %R131, 4
  %10 = getelementptr inbounds i8, i8* bitcast ([4 x i32]* @B to i8*), i64 %R132
  %11 = bitcast i8* %10 to i32*
  %12 = bitcast i32* %11 to i8*
  %13 = getelementptr inbounds i8, i8* %12, i64 0
  %14 = bitcast i8* %13 to i32*
  store i32 0, i32* %14
  %R135 = add i32 %9, 1
  store i32 %R135, i32* %1
  br label %L26

L28:                                              ; preds = %L26
  store i32 0, i32* %2
  br label %L29

L29:                                              ; preds = %L30, %L28
  %15 = load i32, i32* %2
  %R137 = icmp slt i32 %15, 4
  %R1374 = zext i1 %R137 to i32
  %cond5 = icmp ne i32 %R1374, 0
  br i1 %cond5, label %L30, label %L31

L30:                                              ; preds = %L29
  %R140 = sext i32 %15 to i64
  %R141 = mul i64 %R140, 4
  %16 = getelementptr inbounds i8, i8* bitcast ([4 x i32]* @C to i8*), i64 %R141
  %17 = bitcast i8* %16 to i32*
  %18 = bitcast i32* %17 to i8*
  %19 = getelementptr inbounds i8, i8* %18, i64 0
  %20 = bitcast i8* %19 to i32*
  store i32 0, i32* %20
  %R144 = add i32 %15, 1
  store i32 %R144, i32* %2
  br label %L29

L31:                                              ; preds = %L29
  %R146 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.10, i64 0, i64 0), i32 4)
  %R148 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.11, i64 0, i64 0))
  call void @PrintAll()
  %R150 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.12, i64 0, i64 0))
  call void @Hanoi(i32 4, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @A, i32 0, i32 0), i32* getelementptr inbounds ([4 x i32], [4 x i32]* @B, i32 0, i32 0), i32* getelementptr inbounds ([4 x i32], [4 x i32]* @C, i32 0, i32 0))
  ret i32 0
}
