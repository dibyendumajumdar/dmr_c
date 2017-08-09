; ModuleID = 'out.bc'
source_filename = "dmrC"

@.str = private constant [5 x i8] c"%lf\0A\00"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define internal double** @mm_init(i32 %ARG1) {
L0:
  %i_00000256913FFE78. = alloca i32
  %m_00000256913FFBD8. = alloca double**
  %n_00000256913FFA18. = alloca i32
  %0 = alloca double**
  %n_00000256913FFA18.1 = ptrtoint i32* %n_00000256913FFA18. to i64
  %1 = add i64 %n_00000256913FFA18.1, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 %ARG1, i32* %2
  %n_00000256913FFA18.2 = ptrtoint i32* %n_00000256913FFA18. to i64
  %3 = add i64 %n_00000256913FFA18.2, 0
  %4 = inttoptr i64 %3 to i32*
  %R1 = load i32, i32* %4
  %R2 = sext i32 %R1 to i64
  %R3 = mul i64 %R2, 8
  %R4 = call i8* @malloc(i64 %R3)
  %R5 = bitcast i8* %R4 to double**
  %m_00000256913FFBD8.3 = ptrtoint double*** %m_00000256913FFBD8. to i64
  %5 = add i64 %m_00000256913FFBD8.3, 0
  %6 = inttoptr i64 %5 to double***
  store double** %R5, double*** %6
  %i_00000256913FFE78.4 = ptrtoint i32* %i_00000256913FFE78. to i64
  %7 = add i64 %i_00000256913FFE78.4, 0
  %8 = inttoptr i64 %7 to i32*
  store i32 0, i32* %8
  br label %L1

L1:                                               ; preds = %L3, %L0
  %i_00000256913FFE78.5 = ptrtoint i32* %i_00000256913FFE78. to i64
  %9 = add i64 %i_00000256913FFE78.5, 0
  %10 = inttoptr i64 %9 to i32*
  %R6 = load i32, i32* %10
  %n_00000256913FFA18.6 = ptrtoint i32* %n_00000256913FFA18. to i64
  %11 = add i64 %n_00000256913FFA18.6, 0
  %12 = inttoptr i64 %11 to i32*
  %R7 = load i32, i32* %12
  %R8 = icmp slt i32 %R6, %R7
  %R87 = zext i1 %R8 to i32
  %cond = icmp ne i32 %R87, 0
  br i1 %cond, label %L2, label %L4

L2:                                               ; preds = %L1
  %n_00000256913FFA18.8 = ptrtoint i32* %n_00000256913FFA18. to i64
  %13 = add i64 %n_00000256913FFA18.8, 0
  %14 = inttoptr i64 %13 to i32*
  %R9 = load i32, i32* %14
  %R10 = sext i32 %R9 to i64
  %R11 = call i8* @calloc(i64 %R10, i64 8)
  %R12 = bitcast i8* %R11 to double*
  %m_00000256913FFBD8.9 = ptrtoint double*** %m_00000256913FFBD8. to i64
  %15 = add i64 %m_00000256913FFBD8.9, 0
  %16 = inttoptr i64 %15 to double***
  %R13 = load double**, double*** %16
  %i_00000256913FFE78.10 = ptrtoint i32* %i_00000256913FFE78. to i64
  %17 = add i64 %i_00000256913FFE78.10, 0
  %18 = inttoptr i64 %17 to i32*
  %R14 = load i32, i32* %18
  %R15 = sext i32 %R14 to i64
  %R16 = mul i64 %R15, 8
  %R1311 = ptrtoint double** %R13 to i64
  %R17 = add i64 %R1311, %R16
  %R1712 = inttoptr i64 %R17 to double**
  %R171213 = ptrtoint double** %R1712 to i64
  %19 = add i64 %R171213, 0
  %20 = inttoptr i64 %19 to double**
  store double* %R12, double** %20
  br label %L3

L3:                                               ; preds = %L2
  %i_00000256913FFE78.14 = ptrtoint i32* %i_00000256913FFE78. to i64
  %21 = add i64 %i_00000256913FFE78.14, 0
  %22 = inttoptr i64 %21 to i32*
  %R18 = load i32, i32* %22
  %R19 = add i32 %R18, 1
  %i_00000256913FFE78.15 = ptrtoint i32* %i_00000256913FFE78. to i64
  %23 = add i64 %i_00000256913FFE78.15, 0
  %24 = inttoptr i64 %23 to i32*
  store i32 %R19, i32* %24
  br label %L1

L4:                                               ; preds = %L1
  %m_00000256913FFBD8.16 = ptrtoint double*** %m_00000256913FFBD8. to i64
  %25 = add i64 %m_00000256913FFBD8.16, 0
  %26 = inttoptr i64 %25 to double***
  %R20 = load double**, double*** %26
  store double** %R20, double*** %0
  br label %L5

L5:                                               ; preds = %L4
  %27 = load double**, double*** %0
  ret double** %R20
}

declare i8* @malloc(i64)

declare i8* @calloc(i64, i64)

define internal void @mm_destroy(i32 %ARG1, double** %ARG2) {
L6:
  %i_0000025691400C78. = alloca i32
  %m_00000256914008F8. = alloca double**
  %n_0000025691400818. = alloca i32
  %n_0000025691400818.1 = ptrtoint i32* %n_0000025691400818. to i64
  %0 = add i64 %n_0000025691400818.1, 0
  %1 = inttoptr i64 %0 to i32*
  store i32 %ARG1, i32* %1
  %m_00000256914008F8.2 = ptrtoint double*** %m_00000256914008F8. to i64
  %2 = add i64 %m_00000256914008F8.2, 0
  %3 = inttoptr i64 %2 to double***
  store double** %ARG2, double*** %3
  %i_0000025691400C78.3 = ptrtoint i32* %i_0000025691400C78. to i64
  %4 = add i64 %i_0000025691400C78.3, 0
  %5 = inttoptr i64 %4 to i32*
  store i32 0, i32* %5
  br label %L7

L7:                                               ; preds = %L9, %L6
  %i_0000025691400C78.4 = ptrtoint i32* %i_0000025691400C78. to i64
  %6 = add i64 %i_0000025691400C78.4, 0
  %7 = inttoptr i64 %6 to i32*
  %R22 = load i32, i32* %7
  %n_0000025691400818.5 = ptrtoint i32* %n_0000025691400818. to i64
  %8 = add i64 %n_0000025691400818.5, 0
  %9 = inttoptr i64 %8 to i32*
  %R23 = load i32, i32* %9
  %R24 = icmp slt i32 %R22, %R23
  %R246 = zext i1 %R24 to i32
  %cond = icmp ne i32 %R246, 0
  br i1 %cond, label %L8, label %L10

L8:                                               ; preds = %L7
  %m_00000256914008F8.7 = ptrtoint double*** %m_00000256914008F8. to i64
  %10 = add i64 %m_00000256914008F8.7, 0
  %11 = inttoptr i64 %10 to double***
  %R25 = load double**, double*** %11
  %i_0000025691400C78.8 = ptrtoint i32* %i_0000025691400C78. to i64
  %12 = add i64 %i_0000025691400C78.8, 0
  %13 = inttoptr i64 %12 to i32*
  %R26 = load i32, i32* %13
  %R27 = sext i32 %R26 to i64
  %R28 = mul i64 %R27, 8
  %R259 = ptrtoint double** %R25 to i64
  %R29 = add i64 %R259, %R28
  %R2910 = inttoptr i64 %R29 to double**
  %R291011 = ptrtoint double** %R2910 to i64
  %14 = add i64 %R291011, 0
  %15 = inttoptr i64 %14 to double**
  %R30 = load double*, double** %15
  %R31 = bitcast double* %R30 to i8*
  call void @free(i8* %R31)
  br label %L9

L9:                                               ; preds = %L8
  %i_0000025691400C78.12 = ptrtoint i32* %i_0000025691400C78. to i64
  %16 = add i64 %i_0000025691400C78.12, 0
  %17 = inttoptr i64 %16 to i32*
  %R32 = load i32, i32* %17
  %R33 = add i32 %R32, 1
  %i_0000025691400C78.13 = ptrtoint i32* %i_0000025691400C78. to i64
  %18 = add i64 %i_0000025691400C78.13, 0
  %19 = inttoptr i64 %18 to i32*
  store i32 %R33, i32* %19
  br label %L7

L10:                                              ; preds = %L7
  %m_00000256914008F8.14 = ptrtoint double*** %m_00000256914008F8. to i64
  %20 = add i64 %m_00000256914008F8.14, 0
  %21 = inttoptr i64 %20 to double***
  %R34 = load double**, double*** %21
  %R35 = bitcast double** %R34 to i8*
  call void @free(i8* %R35)
  br label %L11

L11:                                              ; preds = %L10
  ret void
}

declare void @free(i8*)

define internal double** @mm_gen(i32 %ARG1) {
L12:
  %j_00000256914018B8. = alloca i32
  %i_00000256914017D8. = alloca i32
  %m_0000025691401458. = alloca double**
  %tmp_00000256914016F8. = alloca double
  %n_0000025691401298. = alloca i32
  %0 = alloca double**
  %n_0000025691401298.1 = ptrtoint i32* %n_0000025691401298. to i64
  %1 = add i64 %n_0000025691401298.1, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 %ARG1, i32* %2
  %n_0000025691401298.2 = ptrtoint i32* %n_0000025691401298. to i64
  %3 = add i64 %n_0000025691401298.2, 0
  %4 = inttoptr i64 %3 to i32*
  %R37 = load i32, i32* %4
  %R38 = sitofp i32 %R37 to double
  %R39 = fdiv double 1.000000e+00, %R38
  %n_0000025691401298.3 = ptrtoint i32* %n_0000025691401298. to i64
  %5 = add i64 %n_0000025691401298.3, 0
  %6 = inttoptr i64 %5 to i32*
  %R40 = load i32, i32* %6
  %R41 = sitofp i32 %R40 to double
  %R42 = fdiv double %R39, %R41
  %tmp_00000256914016F8.4 = ptrtoint double* %tmp_00000256914016F8. to i64
  %7 = add i64 %tmp_00000256914016F8.4, 0
  %8 = inttoptr i64 %7 to double*
  store double %R42, double* %8
  %n_0000025691401298.5 = ptrtoint i32* %n_0000025691401298. to i64
  %9 = add i64 %n_0000025691401298.5, 0
  %10 = inttoptr i64 %9 to i32*
  %R43 = load i32, i32* %10
  %R44 = call double** @mm_init(i32 %R43)
  %m_0000025691401458.6 = ptrtoint double*** %m_0000025691401458. to i64
  %11 = add i64 %m_0000025691401458.6, 0
  %12 = inttoptr i64 %11 to double***
  store double** %R44, double*** %12
  %i_00000256914017D8.7 = ptrtoint i32* %i_00000256914017D8. to i64
  %13 = add i64 %i_00000256914017D8.7, 0
  %14 = inttoptr i64 %13 to i32*
  store i32 0, i32* %14
  br label %L13

L13:                                              ; preds = %L19, %L12
  %i_00000256914017D8.8 = ptrtoint i32* %i_00000256914017D8. to i64
  %15 = add i64 %i_00000256914017D8.8, 0
  %16 = inttoptr i64 %15 to i32*
  %R45 = load i32, i32* %16
  %n_0000025691401298.9 = ptrtoint i32* %n_0000025691401298. to i64
  %17 = add i64 %n_0000025691401298.9, 0
  %18 = inttoptr i64 %17 to i32*
  %R46 = load i32, i32* %18
  %R47 = icmp slt i32 %R45, %R46
  %R4710 = zext i1 %R47 to i32
  %cond = icmp ne i32 %R4710, 0
  br i1 %cond, label %L14, label %L20

L14:                                              ; preds = %L13
  %j_00000256914018B8.11 = ptrtoint i32* %j_00000256914018B8. to i64
  %19 = add i64 %j_00000256914018B8.11, 0
  %20 = inttoptr i64 %19 to i32*
  store i32 0, i32* %20
  br label %L15

L15:                                              ; preds = %L17, %L14
  %j_00000256914018B8.12 = ptrtoint i32* %j_00000256914018B8. to i64
  %21 = add i64 %j_00000256914018B8.12, 0
  %22 = inttoptr i64 %21 to i32*
  %R48 = load i32, i32* %22
  %n_0000025691401298.13 = ptrtoint i32* %n_0000025691401298. to i64
  %23 = add i64 %n_0000025691401298.13, 0
  %24 = inttoptr i64 %23 to i32*
  %R49 = load i32, i32* %24
  %R50 = icmp slt i32 %R48, %R49
  %R5014 = zext i1 %R50 to i32
  %cond15 = icmp ne i32 %R5014, 0
  br i1 %cond15, label %L16, label %L18

L16:                                              ; preds = %L15
  %tmp_00000256914016F8.16 = ptrtoint double* %tmp_00000256914016F8. to i64
  %25 = add i64 %tmp_00000256914016F8.16, 0
  %26 = inttoptr i64 %25 to double*
  %R51 = load double, double* %26
  %i_00000256914017D8.17 = ptrtoint i32* %i_00000256914017D8. to i64
  %27 = add i64 %i_00000256914017D8.17, 0
  %28 = inttoptr i64 %27 to i32*
  %R52 = load i32, i32* %28
  %j_00000256914018B8.18 = ptrtoint i32* %j_00000256914018B8. to i64
  %29 = add i64 %j_00000256914018B8.18, 0
  %30 = inttoptr i64 %29 to i32*
  %R53 = load i32, i32* %30
  %R54 = sub i32 %R52, %R53
  %R55 = sitofp i32 %R54 to double
  %R56 = fmul double %R51, %R55
  %i_00000256914017D8.19 = ptrtoint i32* %i_00000256914017D8. to i64
  %31 = add i64 %i_00000256914017D8.19, 0
  %32 = inttoptr i64 %31 to i32*
  %R57 = load i32, i32* %32
  %j_00000256914018B8.20 = ptrtoint i32* %j_00000256914018B8. to i64
  %33 = add i64 %j_00000256914018B8.20, 0
  %34 = inttoptr i64 %33 to i32*
  %R58 = load i32, i32* %34
  %R59 = add i32 %R57, %R58
  %R60 = sitofp i32 %R59 to double
  %R61 = fmul double %R56, %R60
  %m_0000025691401458.21 = ptrtoint double*** %m_0000025691401458. to i64
  %35 = add i64 %m_0000025691401458.21, 0
  %36 = inttoptr i64 %35 to double***
  %R62 = load double**, double*** %36
  %i_00000256914017D8.22 = ptrtoint i32* %i_00000256914017D8. to i64
  %37 = add i64 %i_00000256914017D8.22, 0
  %38 = inttoptr i64 %37 to i32*
  %R63 = load i32, i32* %38
  %R64 = sext i32 %R63 to i64
  %R65 = mul i64 %R64, 8
  %R6223 = ptrtoint double** %R62 to i64
  %R66 = add i64 %R6223, %R65
  %R6624 = inttoptr i64 %R66 to double**
  %R662425 = ptrtoint double** %R6624 to i64
  %39 = add i64 %R662425, 0
  %40 = inttoptr i64 %39 to double**
  %R67 = load double*, double** %40
  %j_00000256914018B8.26 = ptrtoint i32* %j_00000256914018B8. to i64
  %41 = add i64 %j_00000256914018B8.26, 0
  %42 = inttoptr i64 %41 to i32*
  %R68 = load i32, i32* %42
  %R69 = sext i32 %R68 to i64
  %R70 = mul i64 %R69, 8
  %R6727 = ptrtoint double* %R67 to i64
  %R71 = add i64 %R6727, %R70
  %R7128 = inttoptr i64 %R71 to double*
  %R712829 = ptrtoint double* %R7128 to i64
  %43 = add i64 %R712829, 0
  %44 = inttoptr i64 %43 to double*
  store double %R61, double* %44
  br label %L17

L17:                                              ; preds = %L16
  %j_00000256914018B8.30 = ptrtoint i32* %j_00000256914018B8. to i64
  %45 = add i64 %j_00000256914018B8.30, 0
  %46 = inttoptr i64 %45 to i32*
  %R72 = load i32, i32* %46
  %R73 = add i32 %R72, 1
  %j_00000256914018B8.31 = ptrtoint i32* %j_00000256914018B8. to i64
  %47 = add i64 %j_00000256914018B8.31, 0
  %48 = inttoptr i64 %47 to i32*
  store i32 %R73, i32* %48
  br label %L15

L18:                                              ; preds = %L15
  br label %L19

L19:                                              ; preds = %L18
  %i_00000256914017D8.32 = ptrtoint i32* %i_00000256914017D8. to i64
  %49 = add i64 %i_00000256914017D8.32, 0
  %50 = inttoptr i64 %49 to i32*
  %R74 = load i32, i32* %50
  %R75 = add i32 %R74, 1
  %i_00000256914017D8.33 = ptrtoint i32* %i_00000256914017D8. to i64
  %51 = add i64 %i_00000256914017D8.33, 0
  %52 = inttoptr i64 %51 to i32*
  store i32 %R75, i32* %52
  br label %L13

L20:                                              ; preds = %L13
  %m_0000025691401458.34 = ptrtoint double*** %m_0000025691401458. to i64
  %53 = add i64 %m_0000025691401458.34, 0
  %54 = inttoptr i64 %53 to double***
  %R76 = load double**, double*** %54
  store double** %R76, double*** %0
  br label %L21

L21:                                              ; preds = %L20
  %55 = load double**, double*** %0
  ret double** %R76
}

define internal double** @mm_mul(i32 %ARG1, double** %ARG2, double** %ARG3) {
L22:
  %k_0000025691402958. = alloca i32
  %r_0000025692BC8D48. = alloca double*
  %t_0000025692BC8C68. = alloca double
  %q_0000025692BC88E8. = alloca double*
  %p_0000025692BC8728. = alloca double*
  %j_0000025691402878. = alloca i32
  %i_0000025691402798. = alloca i32
  %c_0000025691402CD8. = alloca double**
  %m_0000025691402A38. = alloca double**
  %b_0000025691402418. = alloca double**
  %a_0000025691402178. = alloca double**
  %n_0000025691402098. = alloca i32
  %0 = alloca double**
  %n_0000025691402098.1 = ptrtoint i32* %n_0000025691402098. to i64
  %1 = add i64 %n_0000025691402098.1, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 %ARG1, i32* %2
  %a_0000025691402178.2 = ptrtoint double*** %a_0000025691402178. to i64
  %3 = add i64 %a_0000025691402178.2, 0
  %4 = inttoptr i64 %3 to double***
  store double** %ARG2, double*** %4
  %b_0000025691402418.3 = ptrtoint double*** %b_0000025691402418. to i64
  %5 = add i64 %b_0000025691402418.3, 0
  %6 = inttoptr i64 %5 to double***
  store double** %ARG3, double*** %6
  %n_0000025691402098.4 = ptrtoint i32* %n_0000025691402098. to i64
  %7 = add i64 %n_0000025691402098.4, 0
  %8 = inttoptr i64 %7 to i32*
  %R78 = load i32, i32* %8
  %R79 = call double** @mm_init(i32 %R78)
  %m_0000025691402A38.5 = ptrtoint double*** %m_0000025691402A38. to i64
  %9 = add i64 %m_0000025691402A38.5, 0
  %10 = inttoptr i64 %9 to double***
  store double** %R79, double*** %10
  %n_0000025691402098.6 = ptrtoint i32* %n_0000025691402098. to i64
  %11 = add i64 %n_0000025691402098.6, 0
  %12 = inttoptr i64 %11 to i32*
  %R80 = load i32, i32* %12
  %R81 = call double** @mm_init(i32 %R80)
  %c_0000025691402CD8.7 = ptrtoint double*** %c_0000025691402CD8. to i64
  %13 = add i64 %c_0000025691402CD8.7, 0
  %14 = inttoptr i64 %13 to double***
  store double** %R81, double*** %14
  %i_0000025691402798.8 = ptrtoint i32* %i_0000025691402798. to i64
  %15 = add i64 %i_0000025691402798.8, 0
  %16 = inttoptr i64 %15 to i32*
  store i32 0, i32* %16
  br label %L23

L23:                                              ; preds = %L29, %L22
  %i_0000025691402798.9 = ptrtoint i32* %i_0000025691402798. to i64
  %17 = add i64 %i_0000025691402798.9, 0
  %18 = inttoptr i64 %17 to i32*
  %R82 = load i32, i32* %18
  %n_0000025691402098.10 = ptrtoint i32* %n_0000025691402098. to i64
  %19 = add i64 %n_0000025691402098.10, 0
  %20 = inttoptr i64 %19 to i32*
  %R83 = load i32, i32* %20
  %R84 = icmp slt i32 %R82, %R83
  %R8411 = zext i1 %R84 to i32
  %cond = icmp ne i32 %R8411, 0
  br i1 %cond, label %L24, label %L30

L24:                                              ; preds = %L23
  %j_0000025691402878.12 = ptrtoint i32* %j_0000025691402878. to i64
  %21 = add i64 %j_0000025691402878.12, 0
  %22 = inttoptr i64 %21 to i32*
  store i32 0, i32* %22
  br label %L25

L25:                                              ; preds = %L27, %L24
  %j_0000025691402878.13 = ptrtoint i32* %j_0000025691402878. to i64
  %23 = add i64 %j_0000025691402878.13, 0
  %24 = inttoptr i64 %23 to i32*
  %R85 = load i32, i32* %24
  %n_0000025691402098.14 = ptrtoint i32* %n_0000025691402098. to i64
  %25 = add i64 %n_0000025691402098.14, 0
  %26 = inttoptr i64 %25 to i32*
  %R86 = load i32, i32* %26
  %R87 = icmp slt i32 %R85, %R86
  %R8715 = zext i1 %R87 to i32
  %cond16 = icmp ne i32 %R8715, 0
  br i1 %cond16, label %L26, label %L28

L26:                                              ; preds = %L25
  %b_0000025691402418.17 = ptrtoint double*** %b_0000025691402418. to i64
  %27 = add i64 %b_0000025691402418.17, 0
  %28 = inttoptr i64 %27 to double***
  %R88 = load double**, double*** %28
  %j_0000025691402878.18 = ptrtoint i32* %j_0000025691402878. to i64
  %29 = add i64 %j_0000025691402878.18, 0
  %30 = inttoptr i64 %29 to i32*
  %R89 = load i32, i32* %30
  %R90 = sext i32 %R89 to i64
  %R91 = mul i64 %R90, 8
  %R8819 = ptrtoint double** %R88 to i64
  %R92 = add i64 %R8819, %R91
  %R9220 = inttoptr i64 %R92 to double**
  %R922021 = ptrtoint double** %R9220 to i64
  %31 = add i64 %R922021, 0
  %32 = inttoptr i64 %31 to double**
  %R93 = load double*, double** %32
  %i_0000025691402798.22 = ptrtoint i32* %i_0000025691402798. to i64
  %33 = add i64 %i_0000025691402798.22, 0
  %34 = inttoptr i64 %33 to i32*
  %R94 = load i32, i32* %34
  %R95 = sext i32 %R94 to i64
  %R96 = mul i64 %R95, 8
  %R9323 = ptrtoint double* %R93 to i64
  %R97 = add i64 %R9323, %R96
  %R9724 = inttoptr i64 %R97 to double*
  %R972425 = ptrtoint double* %R9724 to i64
  %35 = add i64 %R972425, 0
  %36 = inttoptr i64 %35 to double*
  %R98 = load double, double* %36
  %c_0000025691402CD8.26 = ptrtoint double*** %c_0000025691402CD8. to i64
  %37 = add i64 %c_0000025691402CD8.26, 0
  %38 = inttoptr i64 %37 to double***
  %R99 = load double**, double*** %38
  %i_0000025691402798.27 = ptrtoint i32* %i_0000025691402798. to i64
  %39 = add i64 %i_0000025691402798.27, 0
  %40 = inttoptr i64 %39 to i32*
  %R100 = load i32, i32* %40
  %R101 = sext i32 %R100 to i64
  %R102 = mul i64 %R101, 8
  %R9928 = ptrtoint double** %R99 to i64
  %R103 = add i64 %R9928, %R102
  %R10329 = inttoptr i64 %R103 to double**
  %R1032930 = ptrtoint double** %R10329 to i64
  %41 = add i64 %R1032930, 0
  %42 = inttoptr i64 %41 to double**
  %R104 = load double*, double** %42
  %j_0000025691402878.31 = ptrtoint i32* %j_0000025691402878. to i64
  %43 = add i64 %j_0000025691402878.31, 0
  %44 = inttoptr i64 %43 to i32*
  %R105 = load i32, i32* %44
  %R106 = sext i32 %R105 to i64
  %R107 = mul i64 %R106, 8
  %R10432 = ptrtoint double* %R104 to i64
  %R108 = add i64 %R10432, %R107
  %R10833 = inttoptr i64 %R108 to double*
  %R1083334 = ptrtoint double* %R10833 to i64
  %45 = add i64 %R1083334, 0
  %46 = inttoptr i64 %45 to double*
  store double %R98, double* %46
  br label %L27

L27:                                              ; preds = %L26
  %j_0000025691402878.35 = ptrtoint i32* %j_0000025691402878. to i64
  %47 = add i64 %j_0000025691402878.35, 0
  %48 = inttoptr i64 %47 to i32*
  %R109 = load i32, i32* %48
  %R110 = add i32 %R109, 1
  %j_0000025691402878.36 = ptrtoint i32* %j_0000025691402878. to i64
  %49 = add i64 %j_0000025691402878.36, 0
  %50 = inttoptr i64 %49 to i32*
  store i32 %R110, i32* %50
  br label %L25

L28:                                              ; preds = %L25
  br label %L29

L29:                                              ; preds = %L28
  %i_0000025691402798.37 = ptrtoint i32* %i_0000025691402798. to i64
  %51 = add i64 %i_0000025691402798.37, 0
  %52 = inttoptr i64 %51 to i32*
  %R111 = load i32, i32* %52
  %R112 = add i32 %R111, 1
  %i_0000025691402798.38 = ptrtoint i32* %i_0000025691402798. to i64
  %53 = add i64 %i_0000025691402798.38, 0
  %54 = inttoptr i64 %53 to i32*
  store i32 %R112, i32* %54
  br label %L23

L30:                                              ; preds = %L23
  %i_0000025691402798.39 = ptrtoint i32* %i_0000025691402798. to i64
  %55 = add i64 %i_0000025691402798.39, 0
  %56 = inttoptr i64 %55 to i32*
  store i32 0, i32* %56
  br label %L31

L31:                                              ; preds = %L41, %L30
  %i_0000025691402798.40 = ptrtoint i32* %i_0000025691402798. to i64
  %57 = add i64 %i_0000025691402798.40, 0
  %58 = inttoptr i64 %57 to i32*
  %R113 = load i32, i32* %58
  %n_0000025691402098.41 = ptrtoint i32* %n_0000025691402098. to i64
  %59 = add i64 %n_0000025691402098.41, 0
  %60 = inttoptr i64 %59 to i32*
  %R114 = load i32, i32* %60
  %R115 = icmp slt i32 %R113, %R114
  %R11542 = zext i1 %R115 to i32
  %cond43 = icmp ne i32 %R11542, 0
  br i1 %cond43, label %L32, label %L42

L32:                                              ; preds = %L31
  %a_0000025691402178.44 = ptrtoint double*** %a_0000025691402178. to i64
  %61 = add i64 %a_0000025691402178.44, 0
  %62 = inttoptr i64 %61 to double***
  %R116 = load double**, double*** %62
  %i_0000025691402798.45 = ptrtoint i32* %i_0000025691402798. to i64
  %63 = add i64 %i_0000025691402798.45, 0
  %64 = inttoptr i64 %63 to i32*
  %R117 = load i32, i32* %64
  %R118 = sext i32 %R117 to i64
  %R119 = mul i64 %R118, 8
  %R11646 = ptrtoint double** %R116 to i64
  %R120 = add i64 %R11646, %R119
  %R12047 = inttoptr i64 %R120 to double**
  %R1204748 = ptrtoint double** %R12047 to i64
  %65 = add i64 %R1204748, 0
  %66 = inttoptr i64 %65 to double**
  %R121 = load double*, double** %66
  %p_0000025692BC8728.49 = ptrtoint double** %p_0000025692BC8728. to i64
  %67 = add i64 %p_0000025692BC8728.49, 0
  %68 = inttoptr i64 %67 to double**
  store double* %R121, double** %68
  %m_0000025691402A38.50 = ptrtoint double*** %m_0000025691402A38. to i64
  %69 = add i64 %m_0000025691402A38.50, 0
  %70 = inttoptr i64 %69 to double***
  %R122 = load double**, double*** %70
  %i_0000025691402798.51 = ptrtoint i32* %i_0000025691402798. to i64
  %71 = add i64 %i_0000025691402798.51, 0
  %72 = inttoptr i64 %71 to i32*
  %R123 = load i32, i32* %72
  %R124 = sext i32 %R123 to i64
  %R125 = mul i64 %R124, 8
  %R12252 = ptrtoint double** %R122 to i64
  %R126 = add i64 %R12252, %R125
  %R12653 = inttoptr i64 %R126 to double**
  %R1265354 = ptrtoint double** %R12653 to i64
  %73 = add i64 %R1265354, 0
  %74 = inttoptr i64 %73 to double**
  %R127 = load double*, double** %74
  %q_0000025692BC88E8.55 = ptrtoint double** %q_0000025692BC88E8. to i64
  %75 = add i64 %q_0000025692BC88E8.55, 0
  %76 = inttoptr i64 %75 to double**
  store double* %R127, double** %76
  %j_0000025691402878.56 = ptrtoint i32* %j_0000025691402878. to i64
  %77 = add i64 %j_0000025691402878.56, 0
  %78 = inttoptr i64 %77 to i32*
  store i32 0, i32* %78
  br label %L33

L33:                                              ; preds = %L39, %L32
  %j_0000025691402878.57 = ptrtoint i32* %j_0000025691402878. to i64
  %79 = add i64 %j_0000025691402878.57, 0
  %80 = inttoptr i64 %79 to i32*
  %R128 = load i32, i32* %80
  %n_0000025691402098.58 = ptrtoint i32* %n_0000025691402098. to i64
  %81 = add i64 %n_0000025691402098.58, 0
  %82 = inttoptr i64 %81 to i32*
  %R129 = load i32, i32* %82
  %R130 = icmp slt i32 %R128, %R129
  %R13059 = zext i1 %R130 to i32
  %cond60 = icmp ne i32 %R13059, 0
  br i1 %cond60, label %L34, label %L40

L34:                                              ; preds = %L33
  store double 0.000000e+00, double* %t_0000025692BC8C68.
  %t_0000025692BC8C68.61 = ptrtoint double* %t_0000025692BC8C68. to i64
  %83 = add i64 %t_0000025692BC8C68.61, 0
  %84 = inttoptr i64 %83 to double*
  store double 0.000000e+00, double* %84
  %c_0000025691402CD8.62 = ptrtoint double*** %c_0000025691402CD8. to i64
  %85 = add i64 %c_0000025691402CD8.62, 0
  %86 = inttoptr i64 %85 to double***
  %R132 = load double**, double*** %86
  %j_0000025691402878.63 = ptrtoint i32* %j_0000025691402878. to i64
  %87 = add i64 %j_0000025691402878.63, 0
  %88 = inttoptr i64 %87 to i32*
  %R133 = load i32, i32* %88
  %R134 = sext i32 %R133 to i64
  %R135 = mul i64 %R134, 8
  %R13264 = ptrtoint double** %R132 to i64
  %R136 = add i64 %R13264, %R135
  %R13665 = inttoptr i64 %R136 to double**
  %R1366566 = ptrtoint double** %R13665 to i64
  %89 = add i64 %R1366566, 0
  %90 = inttoptr i64 %89 to double**
  %R137 = load double*, double** %90
  %r_0000025692BC8D48.67 = ptrtoint double** %r_0000025692BC8D48. to i64
  %91 = add i64 %r_0000025692BC8D48.67, 0
  %92 = inttoptr i64 %91 to double**
  store double* %R137, double** %92
  %k_0000025691402958.68 = ptrtoint i32* %k_0000025691402958. to i64
  %93 = add i64 %k_0000025691402958.68, 0
  %94 = inttoptr i64 %93 to i32*
  store i32 0, i32* %94
  br label %L35

L35:                                              ; preds = %L37, %L34
  %k_0000025691402958.69 = ptrtoint i32* %k_0000025691402958. to i64
  %95 = add i64 %k_0000025691402958.69, 0
  %96 = inttoptr i64 %95 to i32*
  %R138 = load i32, i32* %96
  %n_0000025691402098.70 = ptrtoint i32* %n_0000025691402098. to i64
  %97 = add i64 %n_0000025691402098.70, 0
  %98 = inttoptr i64 %97 to i32*
  %R139 = load i32, i32* %98
  %R140 = icmp slt i32 %R138, %R139
  %R14071 = zext i1 %R140 to i32
  %cond72 = icmp ne i32 %R14071, 0
  br i1 %cond72, label %L36, label %L38

L36:                                              ; preds = %L35
  %p_0000025692BC8728.73 = ptrtoint double** %p_0000025692BC8728. to i64
  %99 = add i64 %p_0000025692BC8728.73, 0
  %100 = inttoptr i64 %99 to double**
  %R141 = load double*, double** %100
  %k_0000025691402958.74 = ptrtoint i32* %k_0000025691402958. to i64
  %101 = add i64 %k_0000025691402958.74, 0
  %102 = inttoptr i64 %101 to i32*
  %R142 = load i32, i32* %102
  %R143 = sext i32 %R142 to i64
  %R144 = mul i64 %R143, 8
  %R14175 = ptrtoint double* %R141 to i64
  %R145 = add i64 %R14175, %R144
  %R14576 = inttoptr i64 %R145 to double*
  %R1457677 = ptrtoint double* %R14576 to i64
  %103 = add i64 %R1457677, 0
  %104 = inttoptr i64 %103 to double*
  %R146 = load double, double* %104
  %r_0000025692BC8D48.78 = ptrtoint double** %r_0000025692BC8D48. to i64
  %105 = add i64 %r_0000025692BC8D48.78, 0
  %106 = inttoptr i64 %105 to double**
  %R147 = load double*, double** %106
  %k_0000025691402958.79 = ptrtoint i32* %k_0000025691402958. to i64
  %107 = add i64 %k_0000025691402958.79, 0
  %108 = inttoptr i64 %107 to i32*
  %R148 = load i32, i32* %108
  %R149 = sext i32 %R148 to i64
  %R150 = mul i64 %R149, 8
  %R14780 = ptrtoint double* %R147 to i64
  %R151 = add i64 %R14780, %R150
  %R15181 = inttoptr i64 %R151 to double*
  %R1518182 = ptrtoint double* %R15181 to i64
  %109 = add i64 %R1518182, 0
  %110 = inttoptr i64 %109 to double*
  %R152 = load double, double* %110
  %R153 = fmul double %R146, %R152
  %t_0000025692BC8C68.83 = ptrtoint double* %t_0000025692BC8C68. to i64
  %111 = add i64 %t_0000025692BC8C68.83, 0
  %112 = inttoptr i64 %111 to double*
  %R154 = load double, double* %112
  %R156 = fadd double %R154, %R153
  %t_0000025692BC8C68.84 = ptrtoint double* %t_0000025692BC8C68. to i64
  %113 = add i64 %t_0000025692BC8C68.84, 0
  %114 = inttoptr i64 %113 to double*
  store double %R156, double* %114
  br label %L37

L37:                                              ; preds = %L36
  %k_0000025691402958.85 = ptrtoint i32* %k_0000025691402958. to i64
  %115 = add i64 %k_0000025691402958.85, 0
  %116 = inttoptr i64 %115 to i32*
  %R158 = load i32, i32* %116
  %R159 = add i32 %R158, 1
  %k_0000025691402958.86 = ptrtoint i32* %k_0000025691402958. to i64
  %117 = add i64 %k_0000025691402958.86, 0
  %118 = inttoptr i64 %117 to i32*
  store i32 %R159, i32* %118
  br label %L35

L38:                                              ; preds = %L35
  %t_0000025692BC8C68.87 = ptrtoint double* %t_0000025692BC8C68. to i64
  %119 = add i64 %t_0000025692BC8C68.87, 0
  %120 = inttoptr i64 %119 to double*
  %R160 = load double, double* %120
  %q_0000025692BC88E8.88 = ptrtoint double** %q_0000025692BC88E8. to i64
  %121 = add i64 %q_0000025692BC88E8.88, 0
  %122 = inttoptr i64 %121 to double**
  %R161 = load double*, double** %122
  %j_0000025691402878.89 = ptrtoint i32* %j_0000025691402878. to i64
  %123 = add i64 %j_0000025691402878.89, 0
  %124 = inttoptr i64 %123 to i32*
  %R162 = load i32, i32* %124
  %R163 = sext i32 %R162 to i64
  %R164 = mul i64 %R163, 8
  %R16190 = ptrtoint double* %R161 to i64
  %R165 = add i64 %R16190, %R164
  %R16591 = inttoptr i64 %R165 to double*
  %R1659192 = ptrtoint double* %R16591 to i64
  %125 = add i64 %R1659192, 0
  %126 = inttoptr i64 %125 to double*
  store double %R160, double* %126
  br label %L39

L39:                                              ; preds = %L38
  %j_0000025691402878.93 = ptrtoint i32* %j_0000025691402878. to i64
  %127 = add i64 %j_0000025691402878.93, 0
  %128 = inttoptr i64 %127 to i32*
  %R166 = load i32, i32* %128
  %R167 = add i32 %R166, 1
  %j_0000025691402878.94 = ptrtoint i32* %j_0000025691402878. to i64
  %129 = add i64 %j_0000025691402878.94, 0
  %130 = inttoptr i64 %129 to i32*
  store i32 %R167, i32* %130
  br label %L33

L40:                                              ; preds = %L33
  br label %L41

L41:                                              ; preds = %L40
  %i_0000025691402798.95 = ptrtoint i32* %i_0000025691402798. to i64
  %131 = add i64 %i_0000025691402798.95, 0
  %132 = inttoptr i64 %131 to i32*
  %R168 = load i32, i32* %132
  %R169 = add i32 %R168, 1
  %i_0000025691402798.96 = ptrtoint i32* %i_0000025691402798. to i64
  %133 = add i64 %i_0000025691402798.96, 0
  %134 = inttoptr i64 %133 to i32*
  store i32 %R169, i32* %134
  br label %L31

L42:                                              ; preds = %L31
  %n_0000025691402098.97 = ptrtoint i32* %n_0000025691402098. to i64
  %135 = add i64 %n_0000025691402098.97, 0
  %136 = inttoptr i64 %135 to i32*
  %R170 = load i32, i32* %136
  %c_0000025691402CD8.98 = ptrtoint double*** %c_0000025691402CD8. to i64
  %137 = add i64 %c_0000025691402CD8.98, 0
  %138 = inttoptr i64 %137 to double***
  %R171 = load double**, double*** %138
  call void @mm_destroy(i32 %R170, double** %R171)
  %m_0000025691402A38.99 = ptrtoint double*** %m_0000025691402A38. to i64
  %139 = add i64 %m_0000025691402A38.99, 0
  %140 = inttoptr i64 %139 to double***
  %R172 = load double**, double*** %140
  store double** %R172, double*** %0
  br label %L43

L43:                                              ; preds = %L42
  %141 = load double**, double*** %0
  ret double** %R172
}

define i32 @main() {
L44:
  %m_0000025692BC9A68. = alloca double**
  %b_0000025692BC97C8. = alloca double**
  %a_0000025692BC9528. = alloca double**
  %n_0000025692BC9448. = alloca i32
  %0 = alloca i32
  store i32 1000, i32* %n_0000025692BC9448.
  %n_0000025692BC9448.1 = ptrtoint i32* %n_0000025692BC9448. to i64
  %1 = add i64 %n_0000025692BC9448.1, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 1000, i32* %2
  %n_0000025692BC9448.2 = ptrtoint i32* %n_0000025692BC9448. to i64
  %3 = add i64 %n_0000025692BC9448.2, 0
  %4 = inttoptr i64 %3 to i32*
  %R174 = load i32, i32* %4
  %R175 = sdiv i32 %R174, 2
  %R176 = mul i32 %R175, 2
  %n_0000025692BC9448.3 = ptrtoint i32* %n_0000025692BC9448. to i64
  %5 = add i64 %n_0000025692BC9448.3, 0
  %6 = inttoptr i64 %5 to i32*
  store i32 %R176, i32* %6
  %n_0000025692BC9448.4 = ptrtoint i32* %n_0000025692BC9448. to i64
  %7 = add i64 %n_0000025692BC9448.4, 0
  %8 = inttoptr i64 %7 to i32*
  %R177 = load i32, i32* %8
  %R178 = call double** @mm_gen(i32 %R177)
  %a_0000025692BC9528.5 = ptrtoint double*** %a_0000025692BC9528. to i64
  %9 = add i64 %a_0000025692BC9528.5, 0
  %10 = inttoptr i64 %9 to double***
  store double** %R178, double*** %10
  %n_0000025692BC9448.6 = ptrtoint i32* %n_0000025692BC9448. to i64
  %11 = add i64 %n_0000025692BC9448.6, 0
  %12 = inttoptr i64 %11 to i32*
  %R179 = load i32, i32* %12
  %R180 = call double** @mm_gen(i32 %R179)
  %b_0000025692BC97C8.7 = ptrtoint double*** %b_0000025692BC97C8. to i64
  %13 = add i64 %b_0000025692BC97C8.7, 0
  %14 = inttoptr i64 %13 to double***
  store double** %R180, double*** %14
  %n_0000025692BC9448.8 = ptrtoint i32* %n_0000025692BC9448. to i64
  %15 = add i64 %n_0000025692BC9448.8, 0
  %16 = inttoptr i64 %15 to i32*
  %R181 = load i32, i32* %16
  %a_0000025692BC9528.9 = ptrtoint double*** %a_0000025692BC9528. to i64
  %17 = add i64 %a_0000025692BC9528.9, 0
  %18 = inttoptr i64 %17 to double***
  %R182 = load double**, double*** %18
  %b_0000025692BC97C8.10 = ptrtoint double*** %b_0000025692BC97C8. to i64
  %19 = add i64 %b_0000025692BC97C8.10, 0
  %20 = inttoptr i64 %19 to double***
  %R183 = load double**, double*** %20
  %R184 = call double** @mm_mul(i32 %R181, double** %R182, double** %R183)
  %m_0000025692BC9A68.11 = ptrtoint double*** %m_0000025692BC9A68. to i64
  %21 = add i64 %m_0000025692BC9A68.11, 0
  %22 = inttoptr i64 %21 to double***
  store double** %R184, double*** %22
  %m_0000025692BC9A68.12 = ptrtoint double*** %m_0000025692BC9A68. to i64
  %23 = add i64 %m_0000025692BC9A68.12, 0
  %24 = inttoptr i64 %23 to double***
  %R186 = load double**, double*** %24
  %n_0000025692BC9448.13 = ptrtoint i32* %n_0000025692BC9448. to i64
  %25 = add i64 %n_0000025692BC9448.13, 0
  %26 = inttoptr i64 %25 to i32*
  %R187 = load i32, i32* %26
  %R188 = sdiv i32 %R187, 2
  %R189 = sext i32 %R188 to i64
  %R190 = mul i64 %R189, 8
  %R18614 = ptrtoint double** %R186 to i64
  %R191 = add i64 %R18614, %R190
  %R19115 = inttoptr i64 %R191 to double**
  %R1911516 = ptrtoint double** %R19115 to i64
  %27 = add i64 %R1911516, 0
  %28 = inttoptr i64 %27 to double**
  %R192 = load double*, double** %28
  %n_0000025692BC9448.17 = ptrtoint i32* %n_0000025692BC9448. to i64
  %29 = add i64 %n_0000025692BC9448.17, 0
  %30 = inttoptr i64 %29 to i32*
  %R193 = load i32, i32* %30
  %R194 = sdiv i32 %R193, 2
  %R195 = sext i32 %R194 to i64
  %R196 = mul i64 %R195, 8
  %R19218 = ptrtoint double* %R192 to i64
  %R197 = add i64 %R19218, %R196
  %R19719 = inttoptr i64 %R197 to double*
  %R1971920 = ptrtoint double* %R19719 to i64
  %31 = add i64 %R1971920, 0
  %32 = inttoptr i64 %31 to double*
  %R198 = load double, double* %32
  %R199 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), double %R198)
  %n_0000025692BC9448.21 = ptrtoint i32* %n_0000025692BC9448. to i64
  %33 = add i64 %n_0000025692BC9448.21, 0
  %34 = inttoptr i64 %33 to i32*
  %R200 = load i32, i32* %34
  %a_0000025692BC9528.22 = ptrtoint double*** %a_0000025692BC9528. to i64
  %35 = add i64 %a_0000025692BC9528.22, 0
  %36 = inttoptr i64 %35 to double***
  %R201 = load double**, double*** %36
  call void @mm_destroy(i32 %R200, double** %R201)
  %n_0000025692BC9448.23 = ptrtoint i32* %n_0000025692BC9448. to i64
  %37 = add i64 %n_0000025692BC9448.23, 0
  %38 = inttoptr i64 %37 to i32*
  %R202 = load i32, i32* %38
  %b_0000025692BC97C8.24 = ptrtoint double*** %b_0000025692BC97C8. to i64
  %39 = add i64 %b_0000025692BC97C8.24, 0
  %40 = inttoptr i64 %39 to double***
  %R203 = load double**, double*** %40
  call void @mm_destroy(i32 %R202, double** %R203)
  %n_0000025692BC9448.25 = ptrtoint i32* %n_0000025692BC9448. to i64
  %41 = add i64 %n_0000025692BC9448.25, 0
  %42 = inttoptr i64 %41 to i32*
  %R204 = load i32, i32* %42
  %m_0000025692BC9A68.26 = ptrtoint double*** %m_0000025692BC9A68. to i64
  %43 = add i64 %m_0000025692BC9A68.26, 0
  %44 = inttoptr i64 %43 to double***
  %R205 = load double**, double*** %44
  call void @mm_destroy(i32 %R204, double** %R205)
  store i32 0, i32* %0
  br label %L45

L45:                                              ; preds = %L44
  %45 = load i32, i32* %0
  ret i32 0
}

declare i32 @printf(i8*, ...)

attributes #0 = { argmemonly nounwind }
