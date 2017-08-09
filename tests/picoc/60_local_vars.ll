; ModuleID = 'out.bc'
source_filename = "dmrC"

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

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define internal void @foo() {
L0:
  %j_000001AEBDFD00E8. = alloca i32
  %i_000001AEBDFD0008. = alloca i32
  %j_000001AEBDFCFD68. = alloca i32
  %i_000001AEBDFCFC88. = alloca i32
  %i_000001AEBDFCF9E8. = alloca i32
  %i_000001AEBDFCF748. = alloca i32
  %j_000001AEBDFCF4A8. = alloca i32
  %i_000001AEBDFCF3C8. = alloca i32
  %R2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0))
  store i32 0, i32* %i_000001AEBDFCF3C8.
  %i_000001AEBDFCF3C8.1 = ptrtoint i32* %i_000001AEBDFCF3C8. to i64
  %0 = add i64 %i_000001AEBDFCF3C8.1, 0
  %1 = inttoptr i64 %0 to i32*
  store i32 0, i32* %1
  br label %L1

L1:                                               ; preds = %L3, %L0
  %i_000001AEBDFCF3C8.2 = ptrtoint i32* %i_000001AEBDFCF3C8. to i64
  %2 = add i64 %i_000001AEBDFCF3C8.2, 0
  %3 = inttoptr i64 %2 to i32*
  %R3 = load i32, i32* %3
  %R4 = icmp slt i32 %R3, 3
  %R43 = zext i1 %R4 to i32
  %cond = icmp ne i32 %R43, 0
  br i1 %cond, label %L2, label %L4

L2:                                               ; preds = %L1
  %i_000001AEBDFCF3C8.4 = ptrtoint i32* %i_000001AEBDFCF3C8. to i64
  %4 = add i64 %i_000001AEBDFCF3C8.4, 0
  %5 = inttoptr i64 %4 to i32*
  %R5 = load i32, i32* %5
  %R6 = add i32 %R5, 1
  %j_000001AEBDFCF4A8.5 = ptrtoint i32* %j_000001AEBDFCF4A8. to i64
  %6 = add i64 %j_000001AEBDFCF4A8.5, 0
  %7 = inttoptr i64 %6 to i32*
  store i32 %R6, i32* %7
  %i_000001AEBDFCF3C8.6 = ptrtoint i32* %i_000001AEBDFCF3C8. to i64
  %8 = add i64 %i_000001AEBDFCF3C8.6, 0
  %9 = inttoptr i64 %8 to i32*
  %R8 = load i32, i32* %9
  %R9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), i32 %R8)
  br label %L3

L3:                                               ; preds = %L2
  %i_000001AEBDFCF3C8.7 = ptrtoint i32* %i_000001AEBDFCF3C8. to i64
  %10 = add i64 %i_000001AEBDFCF3C8.7, 0
  %11 = inttoptr i64 %10 to i32*
  %R10 = load i32, i32* %11
  %R11 = add i32 %R10, 1
  %i_000001AEBDFCF3C8.8 = ptrtoint i32* %i_000001AEBDFCF3C8. to i64
  %12 = add i64 %i_000001AEBDFCF3C8.8, 0
  %13 = inttoptr i64 %12 to i32*
  store i32 %R11, i32* %13
  br label %L1

L4:                                               ; preds = %L1
  br label %L5

L5:                                               ; preds = %L4
  br label %L6

L6:                                               ; preds = %L5
  store i32 5, i32* %i_000001AEBDFCF748.
  %i_000001AEBDFCF748.9 = ptrtoint i32* %i_000001AEBDFCF748. to i64
  %14 = add i64 %i_000001AEBDFCF748.9, 0
  %15 = inttoptr i64 %14 to i32*
  store i32 5, i32* %15
  %R13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0), i32 5)
  br label %L7

L7:                                               ; preds = %L6
  br label %L8

L8:                                               ; preds = %L7
  %R15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0))
  store i32 0, i32* %i_000001AEBDFCF9E8.
  %i_000001AEBDFCF9E8.10 = ptrtoint i32* %i_000001AEBDFCF9E8. to i64
  %16 = add i64 %i_000001AEBDFCF9E8.10, 0
  %17 = inttoptr i64 %16 to i32*
  store i32 0, i32* %17
  br label %L9

L9:                                               ; preds = %L11, %L8
  %i_000001AEBDFCF9E8.11 = ptrtoint i32* %i_000001AEBDFCF9E8. to i64
  %18 = add i64 %i_000001AEBDFCF9E8.11, 0
  %19 = inttoptr i64 %18 to i32*
  %R16 = load i32, i32* %19
  %R17 = icmp slt i32 %R16, 3
  %R1712 = zext i1 %R17 to i32
  %cond13 = icmp ne i32 %R1712, 0
  br i1 %cond13, label %L10, label %L12

L10:                                              ; preds = %L9
  %i_000001AEBDFCF9E8.14 = ptrtoint i32* %i_000001AEBDFCF9E8. to i64
  %20 = add i64 %i_000001AEBDFCF9E8.14, 0
  %21 = inttoptr i64 %20 to i32*
  %R19 = load i32, i32* %21
  %R20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i64 0, i64 0), i32 %R19)
  br label %L11

L11:                                              ; preds = %L10
  %i_000001AEBDFCF9E8.15 = ptrtoint i32* %i_000001AEBDFCF9E8. to i64
  %22 = add i64 %i_000001AEBDFCF9E8.15, 0
  %23 = inttoptr i64 %22 to i32*
  %R21 = load i32, i32* %23
  %R22 = add i32 %R21, 1
  %i_000001AEBDFCF9E8.16 = ptrtoint i32* %i_000001AEBDFCF9E8. to i64
  %24 = add i64 %i_000001AEBDFCF9E8.16, 0
  %25 = inttoptr i64 %24 to i32*
  store i32 %R22, i32* %25
  br label %L9

L12:                                              ; preds = %L9
  store i32 0, i32* %i_000001AEBDFCFC88.
  %i_000001AEBDFCFC88.17 = ptrtoint i32* %i_000001AEBDFCFC88. to i64
  %26 = add i64 %i_000001AEBDFCFC88.17, 0
  %27 = inttoptr i64 %26 to i32*
  store i32 0, i32* %27
  br label %L13

L13:                                              ; preds = %L15, %L12
  %i_000001AEBDFCFC88.18 = ptrtoint i32* %i_000001AEBDFCFC88. to i64
  %28 = add i64 %i_000001AEBDFCFC88.18, 0
  %29 = inttoptr i64 %28 to i32*
  %R23 = load i32, i32* %29
  %R24 = icmp slt i32 %R23, 100000
  %R2419 = zext i1 %R24 to i32
  %cond20 = icmp ne i32 %R2419, 0
  br i1 %cond20, label %L14, label %L16

L14:                                              ; preds = %L13
  %i_000001AEBDFCFC88.21 = ptrtoint i32* %i_000001AEBDFCFC88. to i64
  %30 = add i64 %i_000001AEBDFCFC88.21, 0
  %31 = inttoptr i64 %30 to i32*
  %R25 = load i32, i32* %31
  %R26 = add i32 %R25, 1
  %j_000001AEBDFCFD68.22 = ptrtoint i32* %j_000001AEBDFCFD68. to i64
  %32 = add i64 %j_000001AEBDFCFD68.22, 0
  %33 = inttoptr i64 %32 to i32*
  store i32 %R26, i32* %33
  br label %L15

L15:                                              ; preds = %L14
  %i_000001AEBDFCFC88.23 = ptrtoint i32* %i_000001AEBDFCFC88. to i64
  %34 = add i64 %i_000001AEBDFCFC88.23, 0
  %35 = inttoptr i64 %34 to i32*
  %R27 = load i32, i32* %35
  %R28 = add i32 %R27, 1
  %i_000001AEBDFCFC88.24 = ptrtoint i32* %i_000001AEBDFCFC88. to i64
  %36 = add i64 %i_000001AEBDFCFC88.24, 0
  %37 = inttoptr i64 %36 to i32*
  store i32 %R28, i32* %37
  br label %L13

L16:                                              ; preds = %L13
  store i32 0, i32* %i_000001AEBDFD0008.
  %i_000001AEBDFD0008.25 = ptrtoint i32* %i_000001AEBDFD0008. to i64
  %38 = add i64 %i_000001AEBDFD0008.25, 0
  %39 = inttoptr i64 %38 to i32*
  store i32 0, i32* %39
  br label %L17

L17:                                              ; preds = %L19, %L16
  %i_000001AEBDFD0008.26 = ptrtoint i32* %i_000001AEBDFD0008. to i64
  %40 = add i64 %i_000001AEBDFD0008.26, 0
  %41 = inttoptr i64 %40 to i32*
  %R29 = load i32, i32* %41
  %R30 = icmp slt i32 %R29, 3
  %R3027 = zext i1 %R30 to i32
  %cond28 = icmp ne i32 %R3027, 0
  br i1 %cond28, label %L18, label %L20

L18:                                              ; preds = %L17
  %i_000001AEBDFD0008.29 = ptrtoint i32* %i_000001AEBDFD0008. to i64
  %42 = add i64 %i_000001AEBDFD0008.29, 0
  %43 = inttoptr i64 %42 to i32*
  %R31 = load i32, i32* %43
  %j_000001AEBDFD00E8.30 = ptrtoint i32* %j_000001AEBDFD00E8. to i64
  %44 = add i64 %j_000001AEBDFD00E8.30, 0
  %45 = inttoptr i64 %44 to i32*
  store i32 %R31, i32* %45
  %j_000001AEBDFD00E8.31 = ptrtoint i32* %j_000001AEBDFD00E8. to i64
  %46 = add i64 %j_000001AEBDFD00E8.31, 0
  %47 = inttoptr i64 %46 to i32*
  %R33 = load i32, i32* %47
  %R34 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.5, i64 0, i64 0), i32 %R33)
  br label %L19

L19:                                              ; preds = %L18
  %i_000001AEBDFD0008.32 = ptrtoint i32* %i_000001AEBDFD0008. to i64
  %48 = add i64 %i_000001AEBDFD0008.32, 0
  %49 = inttoptr i64 %48 to i32*
  %R35 = load i32, i32* %49
  %R36 = add i32 %R35, 1
  %i_000001AEBDFD0008.33 = ptrtoint i32* %i_000001AEBDFD0008. to i64
  %50 = add i64 %i_000001AEBDFD0008.33, 0
  %51 = inttoptr i64 %50 to i32*
  store i32 %R36, i32* %51
  br label %L17

L20:                                              ; preds = %L17
  ret void
}

declare i32 @printf(i8*, ...)

define i32 @main() {
L21:
  %i_000001AEBDFD0C48. = alloca i32
  %j_000001AEBDFD09A8. = alloca i32
  %i_000001AEBDFD08C8. = alloca i32
  %0 = alloca i32
  %R38 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.6, i64 0, i64 0))
  store i32 0, i32* %i_000001AEBDFD08C8.
  %i_000001AEBDFD08C8.1 = ptrtoint i32* %i_000001AEBDFD08C8. to i64
  %1 = add i64 %i_000001AEBDFD08C8.1, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 0, i32* %2
  br label %L22

L22:                                              ; preds = %L24, %L21
  %i_000001AEBDFD08C8.2 = ptrtoint i32* %i_000001AEBDFD08C8. to i64
  %3 = add i64 %i_000001AEBDFD08C8.2, 0
  %4 = inttoptr i64 %3 to i32*
  %R39 = load i32, i32* %4
  %R40 = icmp slt i32 %R39, 3
  %R403 = zext i1 %R40 to i32
  %cond = icmp ne i32 %R403, 0
  br i1 %cond, label %L23, label %L25

L23:                                              ; preds = %L22
  %i_000001AEBDFD08C8.4 = ptrtoint i32* %i_000001AEBDFD08C8. to i64
  %5 = add i64 %i_000001AEBDFD08C8.4, 0
  %6 = inttoptr i64 %5 to i32*
  %R41 = load i32, i32* %6
  %R42 = add i32 %R41, 1
  %j_000001AEBDFD09A8.5 = ptrtoint i32* %j_000001AEBDFD09A8. to i64
  %7 = add i64 %j_000001AEBDFD09A8.5, 0
  %8 = inttoptr i64 %7 to i32*
  store i32 %R42, i32* %8
  %i_000001AEBDFD08C8.6 = ptrtoint i32* %i_000001AEBDFD08C8. to i64
  %9 = add i64 %i_000001AEBDFD08C8.6, 0
  %10 = inttoptr i64 %9 to i32*
  %R44 = load i32, i32* %10
  %R45 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.7, i64 0, i64 0), i32 %R44)
  br label %L24

L24:                                              ; preds = %L23
  %i_000001AEBDFD08C8.7 = ptrtoint i32* %i_000001AEBDFD08C8. to i64
  %11 = add i64 %i_000001AEBDFD08C8.7, 0
  %12 = inttoptr i64 %11 to i32*
  %R46 = load i32, i32* %12
  %R47 = add i32 %R46, 1
  %i_000001AEBDFD08C8.8 = ptrtoint i32* %i_000001AEBDFD08C8. to i64
  %13 = add i64 %i_000001AEBDFD08C8.8, 0
  %14 = inttoptr i64 %13 to i32*
  store i32 %R47, i32* %14
  br label %L22

L25:                                              ; preds = %L22
  %R49 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.8, i64 0, i64 0))
  store i32 0, i32* %i_000001AEBDFD0C48.
  %i_000001AEBDFD0C48.9 = ptrtoint i32* %i_000001AEBDFD0C48. to i64
  %15 = add i64 %i_000001AEBDFD0C48.9, 0
  %16 = inttoptr i64 %15 to i32*
  store i32 0, i32* %16
  br label %L26

L26:                                              ; preds = %L28, %L25
  %i_000001AEBDFD0C48.10 = ptrtoint i32* %i_000001AEBDFD0C48. to i64
  %17 = add i64 %i_000001AEBDFD0C48.10, 0
  %18 = inttoptr i64 %17 to i32*
  %R50 = load i32, i32* %18
  %R51 = icmp slt i32 %R50, 3
  %R5111 = zext i1 %R51 to i32
  %cond12 = icmp ne i32 %R5111, 0
  br i1 %cond12, label %L27, label %L29

L27:                                              ; preds = %L26
  %i_000001AEBDFD0C48.13 = ptrtoint i32* %i_000001AEBDFD0C48. to i64
  %19 = add i64 %i_000001AEBDFD0C48.13, 0
  %20 = inttoptr i64 %19 to i32*
  %R53 = load i32, i32* %20
  %R54 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i64 0, i64 0), i32 %R53)
  br label %L28

L28:                                              ; preds = %L27
  %i_000001AEBDFD0C48.14 = ptrtoint i32* %i_000001AEBDFD0C48. to i64
  %21 = add i64 %i_000001AEBDFD0C48.14, 0
  %22 = inttoptr i64 %21 to i32*
  %R55 = load i32, i32* %22
  %R56 = add i32 %R55, 1
  %i_000001AEBDFD0C48.15 = ptrtoint i32* %i_000001AEBDFD0C48. to i64
  %23 = add i64 %i_000001AEBDFD0C48.15, 0
  %24 = inttoptr i64 %23 to i32*
  store i32 %R56, i32* %24
  br label %L26

L29:                                              ; preds = %L26
  call void @foo()
  store i32 0, i32* %0
  br label %L30

L30:                                              ; preds = %L29
  %25 = load i32, i32* %0
  ret i32 0
}

attributes #0 = { argmemonly nounwind }
