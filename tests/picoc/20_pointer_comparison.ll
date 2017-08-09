; ModuleID = 'out.bc'
source_filename = "dmrC"

@.str = private constant [4 x i8] c"%d\0A\00"
@.str.1 = private constant [4 x i8] c"%d\0A\00"
@.str.2 = private constant [4 x i8] c"%d\0A\00"
@.str.3 = private constant [4 x i8] c"%d\0A\00"
@.str.4 = private constant [4 x i8] c"%d\0A\00"
@.str.5 = private constant [4 x i8] c"%d\0A\00"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define i32 @main() {
L0:
  %e_0000022BAB5DD758. = alloca i32*
  %b_0000022BAB5DD4B8. = alloca i32
  %d_0000022BAB5DD598. = alloca i32*
  %a_0000022BAB5DD3D8. = alloca i32
  %0 = alloca i32
  %d_0000022BAB5DD598.1 = ptrtoint i32** %d_0000022BAB5DD598. to i64
  %1 = add i64 %d_0000022BAB5DD598.1, 0
  %2 = inttoptr i64 %1 to i32**
  store i32* %a_0000022BAB5DD3D8., i32** %2
  %e_0000022BAB5DD758.2 = ptrtoint i32** %e_0000022BAB5DD758. to i64
  %3 = add i64 %e_0000022BAB5DD758.2, 0
  %4 = inttoptr i64 %3 to i32**
  store i32* %b_0000022BAB5DD4B8., i32** %4
  %a_0000022BAB5DD3D8.3 = ptrtoint i32* %a_0000022BAB5DD3D8. to i64
  %5 = add i64 %a_0000022BAB5DD3D8.3, 0
  %6 = inttoptr i64 %5 to i32*
  store i32 12, i32* %6
  %b_0000022BAB5DD4B8.4 = ptrtoint i32* %b_0000022BAB5DD4B8. to i64
  %7 = add i64 %b_0000022BAB5DD4B8.4, 0
  %8 = inttoptr i64 %7 to i32*
  store i32 34, i32* %8
  %d_0000022BAB5DD598.5 = ptrtoint i32** %d_0000022BAB5DD598. to i64
  %9 = add i64 %d_0000022BAB5DD598.5, 0
  %10 = inttoptr i64 %9 to i32**
  %R4 = load i32*, i32** %10
  %R46 = ptrtoint i32* %R4 to i64
  %11 = add i64 %R46, 0
  %12 = inttoptr i64 %11 to i32*
  %R5 = load i32, i32* %12
  %R6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %R5)
  %e_0000022BAB5DD758.7 = ptrtoint i32** %e_0000022BAB5DD758. to i64
  %13 = add i64 %e_0000022BAB5DD758.7, 0
  %14 = inttoptr i64 %13 to i32**
  %R8 = load i32*, i32** %14
  %R88 = ptrtoint i32* %R8 to i64
  %15 = add i64 %R88, 0
  %16 = inttoptr i64 %15 to i32*
  %R9 = load i32, i32* %16
  %R10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 %R9)
  %d_0000022BAB5DD598.9 = ptrtoint i32** %d_0000022BAB5DD598. to i64
  %17 = add i64 %d_0000022BAB5DD598.9, 0
  %18 = inttoptr i64 %17 to i32**
  %R12 = load i32*, i32** %18
  %e_0000022BAB5DD758.10 = ptrtoint i32** %e_0000022BAB5DD758. to i64
  %19 = add i64 %e_0000022BAB5DD758.10, 0
  %20 = inttoptr i64 %19 to i32**
  %R13 = load i32*, i32** %20
  %21 = ptrtoint i32* %R12 to i64
  %22 = ptrtoint i32* %R13 to i64
  %R14 = icmp eq i64 %21, %22
  %R1411 = zext i1 %R14 to i32
  %R15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i32 %R1411)
  %d_0000022BAB5DD598.12 = ptrtoint i32** %d_0000022BAB5DD598. to i64
  %23 = add i64 %d_0000022BAB5DD598.12, 0
  %24 = inttoptr i64 %23 to i32**
  %R17 = load i32*, i32** %24
  %e_0000022BAB5DD758.13 = ptrtoint i32** %e_0000022BAB5DD758. to i64
  %25 = add i64 %e_0000022BAB5DD758.13, 0
  %26 = inttoptr i64 %25 to i32**
  %R18 = load i32*, i32** %26
  %27 = ptrtoint i32* %R17 to i64
  %28 = ptrtoint i32* %R18 to i64
  %R19 = icmp ne i64 %27, %28
  %R1914 = zext i1 %R19 to i32
  %R20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 %R1914)
  %e_0000022BAB5DD758.15 = ptrtoint i32** %e_0000022BAB5DD758. to i64
  %29 = add i64 %e_0000022BAB5DD758.15, 0
  %30 = inttoptr i64 %29 to i32**
  %R21 = load i32*, i32** %30
  %d_0000022BAB5DD598.16 = ptrtoint i32** %d_0000022BAB5DD598. to i64
  %31 = add i64 %d_0000022BAB5DD598.16, 0
  %32 = inttoptr i64 %31 to i32**
  store i32* %R21, i32** %32
  %d_0000022BAB5DD598.17 = ptrtoint i32** %d_0000022BAB5DD598. to i64
  %33 = add i64 %d_0000022BAB5DD598.17, 0
  %34 = inttoptr i64 %33 to i32**
  %R23 = load i32*, i32** %34
  %e_0000022BAB5DD758.18 = ptrtoint i32** %e_0000022BAB5DD758. to i64
  %35 = add i64 %e_0000022BAB5DD758.18, 0
  %36 = inttoptr i64 %35 to i32**
  %R24 = load i32*, i32** %36
  %37 = ptrtoint i32* %R23 to i64
  %38 = ptrtoint i32* %R24 to i64
  %R25 = icmp eq i64 %37, %38
  %R2519 = zext i1 %R25 to i32
  %R26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i64 0, i64 0), i32 %R2519)
  %d_0000022BAB5DD598.20 = ptrtoint i32** %d_0000022BAB5DD598. to i64
  %39 = add i64 %d_0000022BAB5DD598.20, 0
  %40 = inttoptr i64 %39 to i32**
  %R28 = load i32*, i32** %40
  %e_0000022BAB5DD758.21 = ptrtoint i32** %e_0000022BAB5DD758. to i64
  %41 = add i64 %e_0000022BAB5DD758.21, 0
  %42 = inttoptr i64 %41 to i32**
  %R29 = load i32*, i32** %42
  %43 = ptrtoint i32* %R28 to i64
  %44 = ptrtoint i32* %R29 to i64
  %R30 = icmp ne i64 %43, %44
  %R3022 = zext i1 %R30 to i32
  %R31 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i32 %R3022)
  store i32 0, i32* %0
  br label %L1

L1:                                               ; preds = %L0
  %45 = load i32, i32* %0
  ret i32 0
}

declare i32 @printf(i8*, ...)

attributes #0 = { argmemonly nounwind }
