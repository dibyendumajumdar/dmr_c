; ModuleID = 'out.bc'
source_filename = "dmrC"

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

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define internal void @Hanoi(i32 %ARG1, i32* %ARG2, i32* %ARG3, i32* %ARG4) {
L26:
  %spare_00000265F6901108. = alloca i32*
  %dest_00000265F6900F48. = alloca i32*
  %source_00000265F6900D88. = alloca i32*
  %n_00000265F6900CA8. = alloca i32
  %n_00000265F6900CA8.1 = ptrtoint i32* %n_00000265F6900CA8. to i64
  %0 = add i64 %n_00000265F6900CA8.1, 0
  %1 = inttoptr i64 %0 to i32*
  store i32 %ARG1, i32* %1
  %source_00000265F6900D88.2 = ptrtoint i32** %source_00000265F6900D88. to i64
  %2 = add i64 %source_00000265F6900D88.2, 0
  %3 = inttoptr i64 %2 to i32**
  store i32* %ARG2, i32** %3
  %dest_00000265F6900F48.3 = ptrtoint i32** %dest_00000265F6900F48. to i64
  %4 = add i64 %dest_00000265F6900F48.3, 0
  %5 = inttoptr i64 %4 to i32**
  store i32* %ARG3, i32** %5
  %spare_00000265F6901108.4 = ptrtoint i32** %spare_00000265F6901108. to i64
  %6 = add i64 %spare_00000265F6901108.4, 0
  %7 = inttoptr i64 %6 to i32**
  store i32* %ARG4, i32** %7
  %n_00000265F6900CA8.5 = ptrtoint i32* %n_00000265F6900CA8. to i64
  %8 = add i64 %n_00000265F6900CA8.5, 0
  %9 = inttoptr i64 %8 to i32*
  %R98 = load i32, i32* %9
  %R99 = icmp eq i32 %R98, 1
  %R996 = zext i1 %R99 to i32
  %cond = icmp ne i32 %R996, 0
  br i1 %cond, label %L27, label %L28

L27:                                              ; preds = %L26
  %source_00000265F6900D88.7 = ptrtoint i32** %source_00000265F6900D88. to i64
  %10 = add i64 %source_00000265F6900D88.7, 0
  %11 = inttoptr i64 %10 to i32**
  %R100 = load i32*, i32** %11
  %dest_00000265F6900F48.8 = ptrtoint i32** %dest_00000265F6900F48. to i64
  %12 = add i64 %dest_00000265F6900F48.8, 0
  %13 = inttoptr i64 %12 to i32**
  %R101 = load i32*, i32** %13
  %R102 = call i32 @Move(i32* %R100, i32* %R101)
  br label %L29

L28:                                              ; preds = %L26
  %n_00000265F6900CA8.9 = ptrtoint i32* %n_00000265F6900CA8. to i64
  %14 = add i64 %n_00000265F6900CA8.9, 0
  %15 = inttoptr i64 %14 to i32*
  %R103 = load i32, i32* %15
  %R104 = sub i32 %R103, 1
  %source_00000265F6900D88.10 = ptrtoint i32** %source_00000265F6900D88. to i64
  %16 = add i64 %source_00000265F6900D88.10, 0
  %17 = inttoptr i64 %16 to i32**
  %R105 = load i32*, i32** %17
  %spare_00000265F6901108.11 = ptrtoint i32** %spare_00000265F6901108. to i64
  %18 = add i64 %spare_00000265F6901108.11, 0
  %19 = inttoptr i64 %18 to i32**
  %R106 = load i32*, i32** %19
  %dest_00000265F6900F48.12 = ptrtoint i32** %dest_00000265F6900F48. to i64
  %20 = add i64 %dest_00000265F6900F48.12, 0
  %21 = inttoptr i64 %20 to i32**
  %R107 = load i32*, i32** %21
  call void @Hanoi(i32 %R104, i32* %R105, i32* %R106, i32* %R107)
  %source_00000265F6900D88.13 = ptrtoint i32** %source_00000265F6900D88. to i64
  %22 = add i64 %source_00000265F6900D88.13, 0
  %23 = inttoptr i64 %22 to i32**
  %R108 = load i32*, i32** %23
  %dest_00000265F6900F48.14 = ptrtoint i32** %dest_00000265F6900F48. to i64
  %24 = add i64 %dest_00000265F6900F48.14, 0
  %25 = inttoptr i64 %24 to i32**
  %R109 = load i32*, i32** %25
  %R110 = call i32 @Move(i32* %R108, i32* %R109)
  %n_00000265F6900CA8.15 = ptrtoint i32* %n_00000265F6900CA8. to i64
  %26 = add i64 %n_00000265F6900CA8.15, 0
  %27 = inttoptr i64 %26 to i32*
  %R111 = load i32, i32* %27
  %R112 = sub i32 %R111, 1
  %spare_00000265F6901108.16 = ptrtoint i32** %spare_00000265F6901108. to i64
  %28 = add i64 %spare_00000265F6901108.16, 0
  %29 = inttoptr i64 %28 to i32**
  %R113 = load i32*, i32** %29
  %dest_00000265F6900F48.17 = ptrtoint i32** %dest_00000265F6900F48. to i64
  %30 = add i64 %dest_00000265F6900F48.17, 0
  %31 = inttoptr i64 %30 to i32**
  %R114 = load i32*, i32** %31
  %source_00000265F6900D88.18 = ptrtoint i32** %source_00000265F6900D88. to i64
  %32 = add i64 %source_00000265F6900D88.18, 0
  %33 = inttoptr i64 %32 to i32**
  %R115 = load i32*, i32** %33
  call void @Hanoi(i32 %R112, i32* %R113, i32* %R114, i32* %R115)
  br label %L29

L29:                                              ; preds = %L28, %L27
  ret void
}

define internal void @PrintAll() {
L0:
  %i_00000265F68FF968. = alloca i32
  %R2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0))
  %i_00000265F68FF968.1 = ptrtoint i32* %i_00000265F68FF968. to i64
  %0 = add i64 %i_00000265F68FF968.1, 0
  %1 = inttoptr i64 %0 to i32*
  store i32 0, i32* %1
  br label %L1

L1:                                               ; preds = %L3, %L0
  %i_00000265F68FF968.2 = ptrtoint i32* %i_00000265F68FF968. to i64
  %2 = add i64 %i_00000265F68FF968.2, 0
  %3 = inttoptr i64 %2 to i32*
  %R3 = load i32, i32* %3
  %R4 = icmp slt i32 %R3, 4
  %R43 = zext i1 %R4 to i32
  %cond = icmp ne i32 %R43, 0
  br i1 %cond, label %L2, label %L4

L2:                                               ; preds = %L1
  %i_00000265F68FF968.4 = ptrtoint i32* %i_00000265F68FF968. to i64
  %4 = add i64 %i_00000265F68FF968.4, 0
  %5 = inttoptr i64 %4 to i32*
  %R7 = load i32, i32* %5
  %R8 = sext i32 %R7 to i64
  %R9 = mul i64 %R8, 4
  %R10 = add i64 ptrtoint ([4 x i32]* @A to i64), %R9
  %R105 = inttoptr i64 %R10 to i32*
  %R1056 = ptrtoint i32* %R105 to i64
  %6 = add i64 %R1056, 0
  %7 = inttoptr i64 %6 to i32*
  %R11 = load i32, i32* %7
  %R12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0), i32 %R11)
  br label %L3

L3:                                               ; preds = %L2
  %i_00000265F68FF968.7 = ptrtoint i32* %i_00000265F68FF968. to i64
  %8 = add i64 %i_00000265F68FF968.7, 0
  %9 = inttoptr i64 %8 to i32*
  %R13 = load i32, i32* %9
  %R14 = add i32 %R13, 1
  %i_00000265F68FF968.8 = ptrtoint i32* %i_00000265F68FF968. to i64
  %10 = add i64 %i_00000265F68FF968.8, 0
  %11 = inttoptr i64 %10 to i32*
  store i32 %R14, i32* %11
  br label %L1

L4:                                               ; preds = %L1
  %R16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0))
  %R18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0))
  %i_00000265F68FF968.9 = ptrtoint i32* %i_00000265F68FF968. to i64
  %12 = add i64 %i_00000265F68FF968.9, 0
  %13 = inttoptr i64 %12 to i32*
  store i32 0, i32* %13
  br label %L5

L5:                                               ; preds = %L7, %L4
  %i_00000265F68FF968.10 = ptrtoint i32* %i_00000265F68FF968. to i64
  %14 = add i64 %i_00000265F68FF968.10, 0
  %15 = inttoptr i64 %14 to i32*
  %R19 = load i32, i32* %15
  %R20 = icmp slt i32 %R19, 4
  %R2011 = zext i1 %R20 to i32
  %cond12 = icmp ne i32 %R2011, 0
  br i1 %cond12, label %L6, label %L8

L6:                                               ; preds = %L5
  %i_00000265F68FF968.13 = ptrtoint i32* %i_00000265F68FF968. to i64
  %16 = add i64 %i_00000265F68FF968.13, 0
  %17 = inttoptr i64 %16 to i32*
  %R23 = load i32, i32* %17
  %R24 = sext i32 %R23 to i64
  %R25 = mul i64 %R24, 4
  %R26 = add i64 ptrtoint ([4 x i32]* @B to i64), %R25
  %R2614 = inttoptr i64 %R26 to i32*
  %R261415 = ptrtoint i32* %R2614 to i64
  %18 = add i64 %R261415, 0
  %19 = inttoptr i64 %18 to i32*
  %R27 = load i32, i32* %19
  %R28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i64 0, i64 0), i32 %R27)
  br label %L7

L7:                                               ; preds = %L6
  %i_00000265F68FF968.16 = ptrtoint i32* %i_00000265F68FF968. to i64
  %20 = add i64 %i_00000265F68FF968.16, 0
  %21 = inttoptr i64 %20 to i32*
  %R29 = load i32, i32* %21
  %R30 = add i32 %R29, 1
  %i_00000265F68FF968.17 = ptrtoint i32* %i_00000265F68FF968. to i64
  %22 = add i64 %i_00000265F68FF968.17, 0
  %23 = inttoptr i64 %22 to i32*
  store i32 %R30, i32* %23
  br label %L5

L8:                                               ; preds = %L5
  %R32 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i64 0, i64 0))
  %R34 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.6, i64 0, i64 0))
  %i_00000265F68FF968.18 = ptrtoint i32* %i_00000265F68FF968. to i64
  %24 = add i64 %i_00000265F68FF968.18, 0
  %25 = inttoptr i64 %24 to i32*
  store i32 0, i32* %25
  br label %L9

L9:                                               ; preds = %L11, %L8
  %i_00000265F68FF968.19 = ptrtoint i32* %i_00000265F68FF968. to i64
  %26 = add i64 %i_00000265F68FF968.19, 0
  %27 = inttoptr i64 %26 to i32*
  %R35 = load i32, i32* %27
  %R36 = icmp slt i32 %R35, 4
  %R3620 = zext i1 %R36 to i32
  %cond21 = icmp ne i32 %R3620, 0
  br i1 %cond21, label %L10, label %L12

L10:                                              ; preds = %L9
  %i_00000265F68FF968.22 = ptrtoint i32* %i_00000265F68FF968. to i64
  %28 = add i64 %i_00000265F68FF968.22, 0
  %29 = inttoptr i64 %28 to i32*
  %R39 = load i32, i32* %29
  %R40 = sext i32 %R39 to i64
  %R41 = mul i64 %R40, 4
  %R42 = add i64 ptrtoint ([4 x i32]* @C to i64), %R41
  %R4223 = inttoptr i64 %R42 to i32*
  %R422324 = ptrtoint i32* %R4223 to i64
  %30 = add i64 %R422324, 0
  %31 = inttoptr i64 %30 to i32*
  %R4325 = load i32, i32* %31
  %R44 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i64 0, i64 0), i32 %R4325)
  br label %L11

L11:                                              ; preds = %L10
  %i_00000265F68FF968.26 = ptrtoint i32* %i_00000265F68FF968. to i64
  %32 = add i64 %i_00000265F68FF968.26, 0
  %33 = inttoptr i64 %32 to i32*
  %R45 = load i32, i32* %33
  %R46 = add i32 %R45, 1
  %i_00000265F68FF968.27 = ptrtoint i32* %i_00000265F68FF968. to i64
  %34 = add i64 %i_00000265F68FF968.27, 0
  %35 = inttoptr i64 %34 to i32*
  store i32 %R46, i32* %35
  br label %L9

L12:                                              ; preds = %L9
  %R48 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8, i64 0, i64 0))
  %R50 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.9, i64 0, i64 0))
  br label %L13

L13:                                              ; preds = %L12
  ret void
}

declare i32 @printf(i8*, ...)

define internal i32 @Move(i32* %ARG1, i32* %ARG2) {
L14:
  %j_00000265F6900688. = alloca i32
  %i_00000265F69005A8. = alloca i32
  %dest_00000265F6900308. = alloca i32*
  %source_00000265F6900148. = alloca i32*
  %0 = alloca i32
  %source_00000265F6900148.1 = ptrtoint i32** %source_00000265F6900148. to i64
  %1 = add i64 %source_00000265F6900148.1, 0
  %2 = inttoptr i64 %1 to i32**
  store i32* %ARG1, i32** %2
  %dest_00000265F6900308.2 = ptrtoint i32** %dest_00000265F6900308. to i64
  %3 = add i64 %dest_00000265F6900308.2, 0
  %4 = inttoptr i64 %3 to i32**
  store i32* %ARG2, i32** %4
  %i_00000265F69005A8.3 = ptrtoint i32* %i_00000265F69005A8. to i64
  %5 = add i64 %i_00000265F69005A8.3, 0
  %6 = inttoptr i64 %5 to i32*
  store i32 0, i32* %6
  %j_00000265F6900688.4 = ptrtoint i32* %j_00000265F6900688. to i64
  %7 = add i64 %j_00000265F6900688.4, 0
  %8 = inttoptr i64 %7 to i32*
  store i32 0, i32* %8
  br label %L15

L15:                                              ; preds = %L18, %L14
  %i_00000265F69005A8.5 = ptrtoint i32* %i_00000265F69005A8. to i64
  %9 = add i64 %i_00000265F69005A8.5, 0
  %10 = inttoptr i64 %9 to i32*
  %R51 = load i32, i32* %10
  %R52 = icmp slt i32 %R51, 4
  %R526 = zext i1 %R52 to i32
  %cond = icmp ne i32 %R526, 0
  br i1 %cond, label %L16, label %L19

L16:                                              ; preds = %L15
  %source_00000265F6900148.7 = ptrtoint i32** %source_00000265F6900148. to i64
  %11 = add i64 %source_00000265F6900148.7, 0
  %12 = inttoptr i64 %11 to i32**
  %R53 = load i32*, i32** %12
  %i_00000265F69005A8.8 = ptrtoint i32* %i_00000265F69005A8. to i64
  %13 = add i64 %i_00000265F69005A8.8, 0
  %14 = inttoptr i64 %13 to i32*
  %R54 = load i32, i32* %14
  %R55 = sext i32 %R54 to i64
  %R56 = mul i64 %R55, 4
  %R539 = ptrtoint i32* %R53 to i64
  %R57 = add i64 %R539, %R56
  %R5710 = inttoptr i64 %R57 to i32*
  %R571011 = ptrtoint i32* %R5710 to i64
  %15 = add i64 %R571011, 0
  %16 = inttoptr i64 %15 to i32*
  %R58 = load i32, i32* %16
  %R59 = icmp eq i32 %R58, 0
  %R5912 = zext i1 %R59 to i32
  %cond13 = icmp ne i32 %R5912, 0
  br i1 %cond13, label %L17, label %L19

L17:                                              ; preds = %L16
  %i_00000265F69005A8.14 = ptrtoint i32* %i_00000265F69005A8. to i64
  %17 = add i64 %i_00000265F69005A8.14, 0
  %18 = inttoptr i64 %17 to i32*
  %R60 = load i32, i32* %18
  %R61 = add i32 %R60, 1
  %i_00000265F69005A8.15 = ptrtoint i32* %i_00000265F69005A8. to i64
  %19 = add i64 %i_00000265F69005A8.15, 0
  %20 = inttoptr i64 %19 to i32*
  store i32 %R61, i32* %20
  br label %L18

L18:                                              ; preds = %L17
  br label %L15

L19:                                              ; preds = %L16, %L15
  br label %L20

L20:                                              ; preds = %L23, %L19
  %j_00000265F6900688.16 = ptrtoint i32* %j_00000265F6900688. to i64
  %21 = add i64 %j_00000265F6900688.16, 0
  %22 = inttoptr i64 %21 to i32*
  %R62 = load i32, i32* %22
  %R63 = icmp slt i32 %R62, 4
  %R6317 = zext i1 %R63 to i32
  %cond18 = icmp ne i32 %R6317, 0
  br i1 %cond18, label %L21, label %L24

L21:                                              ; preds = %L20
  %dest_00000265F6900308.19 = ptrtoint i32** %dest_00000265F6900308. to i64
  %23 = add i64 %dest_00000265F6900308.19, 0
  %24 = inttoptr i64 %23 to i32**
  %R64 = load i32*, i32** %24
  %j_00000265F6900688.20 = ptrtoint i32* %j_00000265F6900688. to i64
  %25 = add i64 %j_00000265F6900688.20, 0
  %26 = inttoptr i64 %25 to i32*
  %R65 = load i32, i32* %26
  %R66 = sext i32 %R65 to i64
  %R67 = mul i64 %R66, 4
  %R6421 = ptrtoint i32* %R64 to i64
  %R68 = add i64 %R6421, %R67
  %R6822 = inttoptr i64 %R68 to i32*
  %R682223 = ptrtoint i32* %R6822 to i64
  %27 = add i64 %R682223, 0
  %28 = inttoptr i64 %27 to i32*
  %R69 = load i32, i32* %28
  %R70 = icmp eq i32 %R69, 0
  %R7024 = zext i1 %R70 to i32
  %cond25 = icmp ne i32 %R7024, 0
  br i1 %cond25, label %L22, label %L24

L22:                                              ; preds = %L21
  %j_00000265F6900688.26 = ptrtoint i32* %j_00000265F6900688. to i64
  %29 = add i64 %j_00000265F6900688.26, 0
  %30 = inttoptr i64 %29 to i32*
  %R71 = load i32, i32* %30
  %R72 = add i32 %R71, 1
  %j_00000265F6900688.27 = ptrtoint i32* %j_00000265F6900688. to i64
  %31 = add i64 %j_00000265F6900688.27, 0
  %32 = inttoptr i64 %31 to i32*
  store i32 %R72, i32* %32
  br label %L23

L23:                                              ; preds = %L22
  br label %L20

L24:                                              ; preds = %L21, %L20
  %source_00000265F6900148.28 = ptrtoint i32** %source_00000265F6900148. to i64
  %33 = add i64 %source_00000265F6900148.28, 0
  %34 = inttoptr i64 %33 to i32**
  %R73 = load i32*, i32** %34
  %i_00000265F69005A8.29 = ptrtoint i32* %i_00000265F69005A8. to i64
  %35 = add i64 %i_00000265F69005A8.29, 0
  %36 = inttoptr i64 %35 to i32*
  %R74 = load i32, i32* %36
  %R75 = sext i32 %R74 to i64
  %R76 = mul i64 %R75, 4
  %R7330 = ptrtoint i32* %R73 to i64
  %R77 = add i64 %R7330, %R76
  %R7731 = inttoptr i64 %R77 to i32*
  %R773132 = ptrtoint i32* %R7731 to i64
  %37 = add i64 %R773132, 0
  %38 = inttoptr i64 %37 to i32*
  %R78 = load i32, i32* %38
  %dest_00000265F6900308.33 = ptrtoint i32** %dest_00000265F6900308. to i64
  %39 = add i64 %dest_00000265F6900308.33, 0
  %40 = inttoptr i64 %39 to i32**
  %R79 = load i32*, i32** %40
  %j_00000265F6900688.34 = ptrtoint i32* %j_00000265F6900688. to i64
  %41 = add i64 %j_00000265F6900688.34, 0
  %42 = inttoptr i64 %41 to i32*
  %R80 = load i32, i32* %42
  %R81 = sub i32 %R80, 1
  %R82 = sext i32 %R81 to i64
  %R83 = mul i64 %R82, 4
  %R7935 = ptrtoint i32* %R79 to i64
  %R84 = add i64 %R7935, %R83
  %R8436 = inttoptr i64 %R84 to i32*
  %R843637 = ptrtoint i32* %R8436 to i64
  %43 = add i64 %R843637, 0
  %44 = inttoptr i64 %43 to i32*
  store i32 %R78, i32* %44
  %source_00000265F6900148.38 = ptrtoint i32** %source_00000265F6900148. to i64
  %45 = add i64 %source_00000265F6900148.38, 0
  %46 = inttoptr i64 %45 to i32**
  %R85 = load i32*, i32** %46
  %i_00000265F69005A8.39 = ptrtoint i32* %i_00000265F69005A8. to i64
  %47 = add i64 %i_00000265F69005A8.39, 0
  %48 = inttoptr i64 %47 to i32*
  %R86 = load i32, i32* %48
  %R87 = sext i32 %R86 to i64
  %R88 = mul i64 %R87, 4
  %R8540 = ptrtoint i32* %R85 to i64
  %R89 = add i64 %R8540, %R88
  %R8941 = inttoptr i64 %R89 to i32*
  %R894142 = ptrtoint i32* %R8941 to i64
  %49 = add i64 %R894142, 0
  %50 = inttoptr i64 %49 to i32*
  store i32 0, i32* %50
  call void @PrintAll()
  %dest_00000265F6900308.43 = ptrtoint i32** %dest_00000265F6900308. to i64
  %51 = add i64 %dest_00000265F6900308.43, 0
  %52 = inttoptr i64 %51 to i32**
  %R90 = load i32*, i32** %52
  %j_00000265F6900688.44 = ptrtoint i32* %j_00000265F6900688. to i64
  %53 = add i64 %j_00000265F6900688.44, 0
  %54 = inttoptr i64 %53 to i32*
  %R91 = load i32, i32* %54
  %R92 = sub i32 %R91, 1
  %R93 = sext i32 %R92 to i64
  %R94 = mul i64 %R93, 4
  %R9045 = ptrtoint i32* %R90 to i64
  %R95 = add i64 %R9045, %R94
  %R9546 = inttoptr i64 %R95 to i32*
  %R954647 = ptrtoint i32* %R9546 to i64
  %55 = add i64 %R954647, 0
  %56 = inttoptr i64 %55 to i32*
  %R96 = load i32, i32* %56
  store i32 %R96, i32* %0
  br label %L25

L25:                                              ; preds = %L24
  %57 = load i32, i32* %0
  ret i32 %R96
}

define i32 @main() {
L30:
  %i_00000265F6901728. = alloca i32
  %0 = alloca i32
  %i_00000265F6901728.1 = ptrtoint i32* %i_00000265F6901728. to i64
  %1 = add i64 %i_00000265F6901728.1, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 0, i32* %2
  br label %L31

L31:                                              ; preds = %L33, %L30
  %i_00000265F6901728.2 = ptrtoint i32* %i_00000265F6901728. to i64
  %3 = add i64 %i_00000265F6901728.2, 0
  %4 = inttoptr i64 %3 to i32*
  %R116 = load i32, i32* %4
  %R117 = icmp slt i32 %R116, 4
  %R1173 = zext i1 %R117 to i32
  %cond = icmp ne i32 %R1173, 0
  br i1 %cond, label %L32, label %L34

L32:                                              ; preds = %L31
  %i_00000265F6901728.4 = ptrtoint i32* %i_00000265F6901728. to i64
  %5 = add i64 %i_00000265F6901728.4, 0
  %6 = inttoptr i64 %5 to i32*
  %R118 = load i32, i32* %6
  %R119 = add i32 %R118, 1
  %i_00000265F6901728.5 = ptrtoint i32* %i_00000265F6901728. to i64
  %7 = add i64 %i_00000265F6901728.5, 0
  %8 = inttoptr i64 %7 to i32*
  %R121 = load i32, i32* %8
  %R122 = sext i32 %R121 to i64
  %R123 = mul i64 %R122, 4
  %R124 = add i64 ptrtoint ([4 x i32]* @A to i64), %R123
  %R1246 = inttoptr i64 %R124 to i32*
  %R12467 = ptrtoint i32* %R1246 to i64
  %9 = add i64 %R12467, 0
  %10 = inttoptr i64 %9 to i32*
  store i32 %R119, i32* %10
  br label %L33

L33:                                              ; preds = %L32
  %i_00000265F6901728.8 = ptrtoint i32* %i_00000265F6901728. to i64
  %11 = add i64 %i_00000265F6901728.8, 0
  %12 = inttoptr i64 %11 to i32*
  %R125 = load i32, i32* %12
  %R126 = add i32 %R125, 1
  %i_00000265F6901728.9 = ptrtoint i32* %i_00000265F6901728. to i64
  %13 = add i64 %i_00000265F6901728.9, 0
  %14 = inttoptr i64 %13 to i32*
  store i32 %R126, i32* %14
  br label %L31

L34:                                              ; preds = %L31
  %i_00000265F6901728.10 = ptrtoint i32* %i_00000265F6901728. to i64
  %15 = add i64 %i_00000265F6901728.10, 0
  %16 = inttoptr i64 %15 to i32*
  store i32 0, i32* %16
  br label %L35

L35:                                              ; preds = %L37, %L34
  %i_00000265F6901728.11 = ptrtoint i32* %i_00000265F6901728. to i64
  %17 = add i64 %i_00000265F6901728.11, 0
  %18 = inttoptr i64 %17 to i32*
  %R127 = load i32, i32* %18
  %R128 = icmp slt i32 %R127, 4
  %R12812 = zext i1 %R128 to i32
  %cond13 = icmp ne i32 %R12812, 0
  br i1 %cond13, label %L36, label %L38

L36:                                              ; preds = %L35
  %i_00000265F6901728.14 = ptrtoint i32* %i_00000265F6901728. to i64
  %19 = add i64 %i_00000265F6901728.14, 0
  %20 = inttoptr i64 %19 to i32*
  %R130 = load i32, i32* %20
  %R131 = sext i32 %R130 to i64
  %R132 = mul i64 %R131, 4
  %R133 = add i64 ptrtoint ([4 x i32]* @B to i64), %R132
  %R13315 = inttoptr i64 %R133 to i32*
  %R1331516 = ptrtoint i32* %R13315 to i64
  %21 = add i64 %R1331516, 0
  %22 = inttoptr i64 %21 to i32*
  store i32 0, i32* %22
  br label %L37

L37:                                              ; preds = %L36
  %i_00000265F6901728.17 = ptrtoint i32* %i_00000265F6901728. to i64
  %23 = add i64 %i_00000265F6901728.17, 0
  %24 = inttoptr i64 %23 to i32*
  %R134 = load i32, i32* %24
  %R135 = add i32 %R134, 1
  %i_00000265F6901728.18 = ptrtoint i32* %i_00000265F6901728. to i64
  %25 = add i64 %i_00000265F6901728.18, 0
  %26 = inttoptr i64 %25 to i32*
  store i32 %R135, i32* %26
  br label %L35

L38:                                              ; preds = %L35
  %i_00000265F6901728.19 = ptrtoint i32* %i_00000265F6901728. to i64
  %27 = add i64 %i_00000265F6901728.19, 0
  %28 = inttoptr i64 %27 to i32*
  store i32 0, i32* %28
  br label %L39

L39:                                              ; preds = %L41, %L38
  %i_00000265F6901728.20 = ptrtoint i32* %i_00000265F6901728. to i64
  %29 = add i64 %i_00000265F6901728.20, 0
  %30 = inttoptr i64 %29 to i32*
  %R136 = load i32, i32* %30
  %R137 = icmp slt i32 %R136, 4
  %R13721 = zext i1 %R137 to i32
  %cond22 = icmp ne i32 %R13721, 0
  br i1 %cond22, label %L40, label %L42

L40:                                              ; preds = %L39
  %i_00000265F6901728.23 = ptrtoint i32* %i_00000265F6901728. to i64
  %31 = add i64 %i_00000265F6901728.23, 0
  %32 = inttoptr i64 %31 to i32*
  %R139 = load i32, i32* %32
  %R140 = sext i32 %R139 to i64
  %R141 = mul i64 %R140, 4
  %R142 = add i64 ptrtoint ([4 x i32]* @C to i64), %R141
  %R14224 = inttoptr i64 %R142 to i32*
  %R1422425 = ptrtoint i32* %R14224 to i64
  %33 = add i64 %R1422425, 0
  %34 = inttoptr i64 %33 to i32*
  store i32 0, i32* %34
  br label %L41

L41:                                              ; preds = %L40
  %i_00000265F6901728.26 = ptrtoint i32* %i_00000265F6901728. to i64
  %35 = add i64 %i_00000265F6901728.26, 0
  %36 = inttoptr i64 %35 to i32*
  %R143 = load i32, i32* %36
  %R144 = add i32 %R143, 1
  %i_00000265F6901728.27 = ptrtoint i32* %i_00000265F6901728. to i64
  %37 = add i64 %i_00000265F6901728.27, 0
  %38 = inttoptr i64 %37 to i32*
  store i32 %R144, i32* %38
  br label %L39

L42:                                              ; preds = %L39
  %R146 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.10, i64 0, i64 0), i32 4)
  %R148 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.11, i64 0, i64 0))
  call void @PrintAll()
  %R150 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.12, i64 0, i64 0))
  call void @Hanoi(i32 4, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @A, i32 0, i32 0), i32* getelementptr inbounds ([4 x i32], [4 x i32]* @B, i32 0, i32 0), i32* getelementptr inbounds ([4 x i32], [4 x i32]* @C, i32 0, i32 0))
  store i32 0, i32* %0
  br label %L43

L43:                                              ; preds = %L42
  %39 = load i32, i32* %0
  ret i32 0
}

attributes #0 = { argmemonly nounwind }
