; ModuleID = 'out.bc'
source_filename = "dmrC"

%struct.arg_t = type { i32*, i32 ()* }
%struct.S1 = type { i32, %struct.S2, i8* }
%struct.S2 = type { double, i8 }
%struct.S0 = type { i32, i8*, double }

@i1 = global i32 1, align 4
@i2 = global i32 2, align 4
@i3 = global i32 3, align 4
@.str = private constant [5 x i8] c"abcd\00"
@.str.1 = private constant [3 x i8] c"ab\00"
@.str.2 = private constant [32 x i8] c"assertion failed at %s line %d\0A\00"
@.str.3 = private constant [12 x i8] c"testinit1.c\00"
@.str.4 = private constant [32 x i8] c"assertion failed at %s line %d\0A\00"
@.str.5 = private constant [12 x i8] c"testinit1.c\00"
@.str.6 = private constant [32 x i8] c"assertion failed at %s line %d\0A\00"
@.str.7 = private constant [12 x i8] c"testinit1.c\00"
@.str.8 = private constant [32 x i8] c"assertion failed at %s line %d\0A\00"
@.str.9 = private constant [12 x i8] c"testinit1.c\00"
@.str.10 = private constant [32 x i8] c"assertion failed at %s line %d\0A\00"
@.str.11 = private constant [12 x i8] c"testinit1.c\00"
@.str.12 = private constant [32 x i8] c"assertion failed at %s line %d\0A\00"
@.str.13 = private constant [12 x i8] c"testinit1.c\00"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define i32 @f() {
L0:
  %0 = alloca i32
  store i32 1, i32* %0
  br label %L1

L1:                                               ; preds = %L0
  %1 = load i32, i32* %0
  ret i32 1
}

define i32 @foo(i32* %ARG1) {
L2:
  %p_000001DC02AE0928. = alloca i32*
  %x_000001DC02AE0688. = alloca i32*
  %0 = alloca i32
  %x_000001DC02AE0688.1 = ptrtoint i32** %x_000001DC02AE0688. to i64
  %1 = add i64 %x_000001DC02AE0688.1, 0
  %2 = inttoptr i64 %1 to i32**
  store i32* %ARG1, i32** %2
  %x_000001DC02AE0688.2 = ptrtoint i32** %x_000001DC02AE0688. to i64
  %3 = add i64 %x_000001DC02AE0688.2, 0
  %4 = inttoptr i64 %3 to i32**
  %R2 = load i32*, i32** %4
  %p_000001DC02AE0928.3 = ptrtoint i32** %p_000001DC02AE0928. to i64
  %5 = add i64 %p_000001DC02AE0928.3, 0
  %6 = inttoptr i64 %5 to i32**
  store i32* %R2, i32** %6
  %p_000001DC02AE0928.4 = ptrtoint i32** %p_000001DC02AE0928. to i64
  %7 = add i64 %p_000001DC02AE0928.4, 0
  %8 = inttoptr i64 %7 to i32**
  %R4 = load i32*, i32** %8
  %R45 = ptrtoint i32* %R4 to i64
  %9 = add i64 %R45, 0
  %10 = inttoptr i64 %9 to i32*
  %R5 = load i32, i32* %10
  store i32 %R5, i32* %0
  br label %L3

L3:                                               ; preds = %L2
  %11 = load i32, i32* %0
  ret i32 %R5
}

define i32 @main() {
L4:
  %k_000001DC02AE12C8. = alloca i32
  %arg_000001DC02AE1108. = alloca [3 x %struct.arg_t]
  %xs1_000001DC02AE1028. = alloca %struct.S1
  %xs0_000001DC02AE0F48. = alloca %struct.S0
  %0 = alloca i32
  %1 = alloca i32
  %xs0_000001DC02AE0F48.1 = bitcast %struct.S0* %xs0_000001DC02AE0F48. to i8*
  call void @llvm.memset.p0i8.i32(i8* %xs0_000001DC02AE0F48.1, i8 0, i32 24, i32 8, i1 false)
  %xs0_000001DC02AE0F48.2 = ptrtoint %struct.S0* %xs0_000001DC02AE0F48. to i64
  %2 = add i64 %xs0_000001DC02AE0F48.2, 0
  %3 = inttoptr i64 %2 to i32*
  store i32 1, i32* %3
  %xs0_000001DC02AE0F48.3 = ptrtoint %struct.S0* %xs0_000001DC02AE0F48. to i64
  %4 = add i64 %xs0_000001DC02AE0F48.3, 8
  %5 = inttoptr i64 %4 to i8**
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i8** %5
  %xs0_000001DC02AE0F48.4 = ptrtoint %struct.S0* %xs0_000001DC02AE0F48. to i64
  %6 = add i64 %xs0_000001DC02AE0F48.4, 16
  %7 = inttoptr i64 %6 to double*
  store double 4.500000e+01, double* %7
  %xs1_000001DC02AE1028.5 = bitcast %struct.S1* %xs1_000001DC02AE1028. to i8*
  call void @llvm.memset.p0i8.i32(i8* %xs1_000001DC02AE1028.5, i8 0, i32 32, i32 8, i1 false)
  %xs1_000001DC02AE1028.6 = ptrtoint %struct.S1* %xs1_000001DC02AE1028. to i64
  %8 = add i64 %xs1_000001DC02AE1028.6, 0
  %9 = inttoptr i64 %8 to i32*
  store i32 22, i32* %9
  %xs1_000001DC02AE1028.7 = ptrtoint %struct.S1* %xs1_000001DC02AE1028. to i64
  %10 = add i64 %xs1_000001DC02AE1028.7, 8
  %11 = inttoptr i64 %10 to double*
  store double 5.500000e+00, double* %11
  %xs1_000001DC02AE1028.8 = ptrtoint %struct.S1* %xs1_000001DC02AE1028. to i64
  %12 = add i64 %xs1_000001DC02AE1028.8, 24
  %13 = inttoptr i64 %12 to i8**
  store i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i8** %13
  %arg_000001DC02AE1108.9 = bitcast [3 x %struct.arg_t]* %arg_000001DC02AE1108. to i8*
  call void @llvm.memset.p0i8.i32(i8* %arg_000001DC02AE1108.9, i8 0, i32 48, i32 8, i1 false)
  %arg_000001DC02AE1108.10 = ptrtoint [3 x %struct.arg_t]* %arg_000001DC02AE1108. to i64
  %14 = add i64 %arg_000001DC02AE1108.10, 0
  %15 = inttoptr i64 %14 to i32**
  store i32* @i1, i32** %15
  %arg_000001DC02AE1108.11 = ptrtoint [3 x %struct.arg_t]* %arg_000001DC02AE1108. to i64
  %16 = add i64 %arg_000001DC02AE1108.11, 8
  %17 = inttoptr i64 %16 to i32 ()**
  store i32 ()* @f, i32 ()** %17
  %arg_000001DC02AE1108.12 = ptrtoint [3 x %struct.arg_t]* %arg_000001DC02AE1108. to i64
  %18 = add i64 %arg_000001DC02AE1108.12, 16
  %19 = inttoptr i64 %18 to i32**
  store i32* @i2, i32** %19
  %arg_000001DC02AE1108.13 = ptrtoint [3 x %struct.arg_t]* %arg_000001DC02AE1108. to i64
  %20 = add i64 %arg_000001DC02AE1108.13, 24
  %21 = inttoptr i64 %20 to i32 ()**
  store i32 ()* @f, i32 ()** %21
  %arg_000001DC02AE1108.14 = ptrtoint [3 x %struct.arg_t]* %arg_000001DC02AE1108. to i64
  %22 = add i64 %arg_000001DC02AE1108.14, 32
  %23 = inttoptr i64 %22 to i32**
  store i32* @i3, i32** %23
  %arg_000001DC02AE1108.15 = ptrtoint [3 x %struct.arg_t]* %arg_000001DC02AE1108. to i64
  %24 = add i64 %arg_000001DC02AE1108.15, 40
  %25 = inttoptr i64 %24 to i32 ()**
  store i32 ()* @f, i32 ()** %25
  store i32 5, i32* %k_000001DC02AE12C8.
  %k_000001DC02AE12C8.16 = ptrtoint i32* %k_000001DC02AE12C8. to i64
  %26 = add i64 %k_000001DC02AE12C8.16, 0
  %27 = inttoptr i64 %26 to i32*
  store i32 5, i32* %27
  br label %L5

L5:                                               ; preds = %L4
  %arg_000001DC02AE1108.17 = ptrtoint [3 x %struct.arg_t]* %arg_000001DC02AE1108. to i64
  %28 = add i64 %arg_000001DC02AE1108.17, 0
  %29 = inttoptr i64 %28 to i32**
  %R21 = load i32*, i32** %29
  %R2118 = ptrtoint i32* %R21 to i64
  %30 = add i64 %R2118, 0
  %31 = inttoptr i64 %30 to i32*
  %R22 = load i32, i32* %31
  %R23 = load i32, i32* @i1
  %R24 = icmp eq i32 %R22, %R23
  %R2419 = zext i1 %R24 to i32
  %cond = icmp ne i32 %R2419, 0
  br i1 %cond, label %L6, label %L8

L6:                                               ; preds = %L5
  %arg_000001DC02AE1108.20 = ptrtoint [3 x %struct.arg_t]* %arg_000001DC02AE1108. to i64
  %32 = add i64 %arg_000001DC02AE1108.20, 16
  %33 = inttoptr i64 %32 to i32**
  %R25 = load i32*, i32** %33
  %R2521 = ptrtoint i32* %R25 to i64
  %34 = add i64 %R2521, 0
  %35 = inttoptr i64 %34 to i32*
  %R26 = load i32, i32* %35
  %R27 = load i32, i32* @i2
  %R28 = icmp eq i32 %R26, %R27
  %R2822 = zext i1 %R28 to i32
  %cond23 = icmp ne i32 %R2822, 0
  br i1 %cond23, label %L7, label %L8

L7:                                               ; preds = %L6
  %arg_000001DC02AE1108.24 = ptrtoint [3 x %struct.arg_t]* %arg_000001DC02AE1108. to i64
  %36 = add i64 %arg_000001DC02AE1108.24, 32
  %37 = inttoptr i64 %36 to i32**
  %R29 = load i32*, i32** %37
  %R2925 = ptrtoint i32* %R29 to i64
  %38 = add i64 %R2925, 0
  %39 = inttoptr i64 %38 to i32*
  %R30 = load i32, i32* %39
  %R31 = load i32, i32* @i3
  %R32 = icmp eq i32 %R30, %R31
  %R3226 = zext i1 %R32 to i32
  %cond27 = icmp ne i32 %R3226, 0
  br i1 %cond27, label %L9, label %L8

L8:                                               ; preds = %L7, %L6, %L5
  %R35 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i64 0, i64 0), i32 41)
  call void @exit(i32 1)
  br label %L9

L9:                                               ; preds = %L8, %L7
  %arg_000001DC02AE1108.28 = ptrtoint [3 x %struct.arg_t]* %arg_000001DC02AE1108. to i64
  %40 = add i64 %arg_000001DC02AE1108.28, 8
  %41 = inttoptr i64 %40 to i32 ()**
  %R36 = load i32 ()*, i32 ()** %41
  %42 = ptrtoint i32 ()* %R36 to i64
  %R38 = icmp eq i64 %42, ptrtoint (i32 ()* @f to i64)
  %R3829 = zext i1 %R38 to i32
  %cond30 = icmp ne i32 %R3829, 0
  br i1 %cond30, label %L10, label %L12

L10:                                              ; preds = %L9
  %arg_000001DC02AE1108.31 = ptrtoint [3 x %struct.arg_t]* %arg_000001DC02AE1108. to i64
  %43 = add i64 %arg_000001DC02AE1108.31, 24
  %44 = inttoptr i64 %43 to i32 ()**
  %R39 = load i32 ()*, i32 ()** %44
  %45 = ptrtoint i32 ()* %R39 to i64
  %R41 = icmp eq i64 %45, ptrtoint (i32 ()* @f to i64)
  %R4132 = zext i1 %R41 to i32
  %cond33 = icmp ne i32 %R4132, 0
  br i1 %cond33, label %L11, label %L12

L11:                                              ; preds = %L10
  %arg_000001DC02AE1108.34 = ptrtoint [3 x %struct.arg_t]* %arg_000001DC02AE1108. to i64
  %46 = add i64 %arg_000001DC02AE1108.34, 40
  %47 = inttoptr i64 %46 to i32 ()**
  %R42 = load i32 ()*, i32 ()** %47
  %48 = ptrtoint i32 ()* %R42 to i64
  %R44 = icmp eq i64 %48, ptrtoint (i32 ()* @f to i64)
  %R4435 = zext i1 %R44 to i32
  %cond36 = icmp ne i32 %R4435, 0
  br i1 %cond36, label %L13, label %L12

L12:                                              ; preds = %L11, %L10, %L9
  %R47 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.5, i64 0, i64 0), i32 42)
  call void @exit(i32 1)
  br label %L13

L13:                                              ; preds = %L12, %L11
  br label %L14

L14:                                              ; preds = %L13
  %xs0_000001DC02AE0F48.37 = ptrtoint %struct.S0* %xs0_000001DC02AE0F48. to i64
  %49 = add i64 %xs0_000001DC02AE0F48.37, 8
  %50 = inttoptr i64 %49 to i8**
  %R48 = load i8*, i8** %50
  %R4838 = ptrtoint i8* %R48 to i64
  %51 = add i64 %R4838, 2
  %52 = inttoptr i64 %51 to i8*
  %R49 = load i8, i8* %52
  %R50 = sext i8 %R49 to i32
  %R51 = icmp eq i32 %R50, 99
  %R5139 = zext i1 %R51 to i32
  store i32 %R5139, i32* %0
  br label %L15

L15:                                              ; preds = %L14
  %53 = load i32, i32* %0
  %54 = icmp ne i32 %53, 0
  %R53 = zext i1 %54 to i32
  %cond40 = icmp ne i32 %R53, 0
  br i1 %cond40, label %L17, label %L16

L16:                                              ; preds = %L15
  %R56 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.7, i64 0, i64 0), i32 43)
  call void @exit(i32 1)
  br label %L17

L17:                                              ; preds = %L16, %L15
  br label %L18

L18:                                              ; preds = %L17
  %xs1_000001DC02AE1028.41 = ptrtoint %struct.S1* %xs1_000001DC02AE1028. to i64
  %55 = add i64 %xs1_000001DC02AE1028.41, 8
  %56 = inttoptr i64 %55 to double*
  %R57 = load double, double* %56
  %R59 = fcmp oeq double %R57, 5.500000e+00
  %R5942 = zext i1 %R59 to i32
  %cond43 = icmp ne i32 %R5942, 0
  br i1 %cond43, label %L19, label %L20

L19:                                              ; preds = %L18
  %xs1_000001DC02AE1028.44 = ptrtoint %struct.S1* %xs1_000001DC02AE1028. to i64
  %57 = add i64 %xs1_000001DC02AE1028.44, 24
  %58 = inttoptr i64 %57 to i8**
  %R60 = load i8*, i8** %58
  %R6045 = ptrtoint i8* %R60 to i64
  %59 = add i64 %R6045, 2
  %60 = inttoptr i64 %59 to i8*
  %R61 = load i8, i8* %60
  %R62 = sext i8 %R61 to i32
  %R63 = icmp eq i32 %R62, 0
  %R6346 = zext i1 %R63 to i32
  %cond47 = icmp ne i32 %R6346, 0
  br i1 %cond47, label %L21, label %L20

L20:                                              ; preds = %L19, %L18
  %R66 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.9, i64 0, i64 0), i32 44)
  call void @exit(i32 1)
  br label %L21

L21:                                              ; preds = %L20, %L19
  %xs1_000001DC02AE1028.48 = ptrtoint %struct.S1* %xs1_000001DC02AE1028. to i64
  %61 = add i64 %xs1_000001DC02AE1028.48, 16
  %62 = inttoptr i64 %61 to i8*
  %R67 = load i8, i8* %62
  %R68 = sext i8 %R67 to i32
  %R69 = icmp eq i32 %R68, 0
  %R6949 = zext i1 %R69 to i32
  %cond50 = icmp ne i32 %R6949, 0
  br i1 %cond50, label %L22, label %L23

L22:                                              ; preds = %L21
  %xs1_000001DC02AE1028.51 = ptrtoint %struct.S1* %xs1_000001DC02AE1028. to i64
  %63 = add i64 %xs1_000001DC02AE1028.51, 24
  %64 = inttoptr i64 %63 to i8**
  %R70 = load i8*, i8** %64
  %R7052 = ptrtoint i8* %R70 to i64
  %65 = add i64 %R7052, 1
  %66 = inttoptr i64 %65 to i8*
  %R71 = load i8, i8* %66
  %R72 = sext i8 %R71 to i32
  %R73 = icmp eq i32 %R72, 98
  %R7353 = zext i1 %R73 to i32
  %cond54 = icmp ne i32 %R7353, 0
  br i1 %cond54, label %L24, label %L23

L23:                                              ; preds = %L22, %L21
  %R76 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.10, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.11, i64 0, i64 0), i32 45)
  call void @exit(i32 1)
  br label %L24

L24:                                              ; preds = %L23, %L22
  %R78 = call i32 @foo(i32* %k_000001DC02AE12C8.)
  %k_000001DC02AE12C8.55 = ptrtoint i32* %k_000001DC02AE12C8. to i64
  %67 = add i64 %k_000001DC02AE12C8.55, 0
  %68 = inttoptr i64 %67 to i32*
  %R79 = load i32, i32* %68
  %R80 = icmp eq i32 %R78, %R79
  %R8056 = zext i1 %R80 to i32
  %cond57 = icmp ne i32 %R8056, 0
  br i1 %cond57, label %L26, label %L25

L25:                                              ; preds = %L24
  %R83 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.12, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.13, i64 0, i64 0), i32 46)
  call void @exit(i32 1)
  br label %L26

L26:                                              ; preds = %L25, %L24
  store i32 0, i32* %1
  br label %L27

L27:                                              ; preds = %L26
  %69 = load i32, i32* %1
  ret i32 0
}

declare i32 @printf(i8*, ...)

declare void @exit(i32)

attributes #0 = { argmemonly nounwind }
