; ModuleID = 'out.bc'
source_filename = "sparse"

@d_00000230874C0F78 = internal global [32 x i32] zeroinitializer
@.str = private constant [4 x i8] c"%s\0A\00"

define internal void @topline(i32 %ARG1, i8* %ARG2) {
L0:
  %0 = alloca i8*
  %1 = ptrtoint i8* %ARG2 to i64
  %R2 = add i64 %1, 1
  %2 = inttoptr i64 %R2 to i8*
  %3 = ptrtoint i8* %ARG2 to i64
  %4 = add i64 %3, 0
  %5 = inttoptr i64 %4 to i8*
  store i8 32, i8* %5
  switch i32 %ARG1, label %L2 [
    i32 0, label %L1
    i32 2, label %L1
    i32 3, label %L1
    i32 5, label %L1
    i32 7, label %L1
    i32 8, label %L1
    i32 9, label %L1
  ]

L1:                                               ; preds = %L0, %L0, %L0, %L0, %L0, %L0, %L0
  %6 = ptrtoint i8* %2 to i64
  %R5 = add i64 %6, 1
  %7 = inttoptr i64 %R5 to i8*
  %8 = ptrtoint i8* %ARG2 to i64
  %9 = add i64 %8, 1
  %10 = inttoptr i64 %9 to i8*
  store i8 95, i8* %10
  store i8* %7, i8** %0
  br label %L3

L2:                                               ; preds = %L0
  %11 = ptrtoint i8* %2 to i64
  %R7 = add i64 %11, 1
  %12 = inttoptr i64 %R7 to i8*
  %13 = ptrtoint i8* %ARG2 to i64
  %14 = add i64 %13, 1
  %15 = inttoptr i64 %14 to i8*
  store i8 32, i8* %15
  store i8* %12, i8** %0
  br label %L3

L3:                                               ; preds = %L2, %L1
  %16 = load i8*, i8** %0
  %17 = ptrtoint i8* %16 to i64
  %18 = add i64 %17, 0
  %19 = inttoptr i64 %18 to i8*
  store i8 32, i8* %19
  ret void
}

define internal void @midline(i32 %ARG1, i8* %ARG2) {
L4:
  %0 = alloca i8*
  %1 = alloca i8*
  %2 = alloca i8*
  %3 = alloca i8*
  switch i32 %ARG1, label %L6 [
    i32 0, label %L5
    i32 4, label %L5
    i32 5, label %L5
    i32 6, label %L5
    i32 8, label %L5
    i32 9, label %L5
  ]

L5:                                               ; preds = %L4, %L4, %L4, %L4, %L4, %L4
  %4 = ptrtoint i8* %ARG2 to i64
  %R12 = add i64 %4, 1
  %5 = inttoptr i64 %R12 to i8*
  %6 = ptrtoint i8* %ARG2 to i64
  %7 = add i64 %6, 0
  %8 = inttoptr i64 %7 to i8*
  store i8 124, i8* %8
  store i8* %5, i8** %1
  store i8* %5, i8** %0
  br label %L7

L6:                                               ; preds = %L4
  %9 = ptrtoint i8* %ARG2 to i64
  %R14 = add i64 %9, 1
  %10 = inttoptr i64 %R14 to i8*
  %11 = ptrtoint i8* %ARG2 to i64
  %12 = add i64 %11, 0
  %13 = inttoptr i64 %12 to i8*
  store i8 32, i8* %13
  store i8* %10, i8** %1
  store i8* %10, i8** %0
  br label %L7

L7:                                               ; preds = %L6, %L5
  switch i32 %ARG1, label %L9 [
    i32 2, label %L8
    i32 3, label %L8
    i32 4, label %L8
    i32 5, label %L8
    i32 6, label %L8
    i32 8, label %L8
    i32 9, label %L8
  ]

L8:                                               ; preds = %L7, %L7, %L7, %L7, %L7, %L7, %L7
  %14 = load i8*, i8** %0
  %15 = ptrtoint i8* %14 to i64
  %R17 = add i64 %15, 1
  %16 = inttoptr i64 %R17 to i8*
  %17 = ptrtoint i8* %14 to i64
  %18 = add i64 %17, 0
  %19 = inttoptr i64 %18 to i8*
  store i8 95, i8* %19
  store i8* %16, i8** %3
  store i8* %16, i8** %2
  br label %L10

L9:                                               ; preds = %L7
  %20 = load i8*, i8** %1
  %21 = ptrtoint i8* %20 to i64
  %R19 = add i64 %21, 1
  %22 = inttoptr i64 %R19 to i8*
  %23 = ptrtoint i8* %20 to i64
  %24 = add i64 %23, 0
  %25 = inttoptr i64 %24 to i8*
  store i8 32, i8* %25
  store i8* %22, i8** %3
  store i8* %22, i8** %2
  br label %L10

L10:                                              ; preds = %L9, %L8
  switch i32 %ARG1, label %L12 [
    i32 0, label %L11
    i32 1, label %L11
    i32 2, label %L11
    i32 3, label %L11
    i32 4, label %L11
    i32 7, label %L11
    i32 8, label %L11
    i32 9, label %L11
  ]

L11:                                              ; preds = %L10, %L10, %L10, %L10, %L10, %L10, %L10, %L10
  %26 = load i8*, i8** %2
  %27 = ptrtoint i8* %26 to i64
  %28 = add i64 %27, 0
  %29 = inttoptr i64 %28 to i8*
  store i8 124, i8* %29
  br label %L13

L12:                                              ; preds = %L10
  %30 = load i8*, i8** %3
  %31 = ptrtoint i8* %30 to i64
  %32 = add i64 %31, 0
  %33 = inttoptr i64 %32 to i8*
  store i8 32, i8* %33
  br label %L13

L13:                                              ; preds = %L12, %L11
  ret void
}

define internal void @botline(i32 %ARG1, i8* %ARG2) {
L14:
  %0 = alloca i8*
  %1 = alloca i8*
  %2 = alloca i8*
  %3 = alloca i8*
  switch i32 %ARG1, label %L16 [
    i32 0, label %L15
    i32 2, label %L15
    i32 6, label %L15
    i32 8, label %L15
  ]

L15:                                              ; preds = %L14, %L14, %L14, %L14
  %4 = ptrtoint i8* %ARG2 to i64
  %R27 = add i64 %4, 1
  %5 = inttoptr i64 %R27 to i8*
  %6 = ptrtoint i8* %ARG2 to i64
  %7 = add i64 %6, 0
  %8 = inttoptr i64 %7 to i8*
  store i8 124, i8* %8
  store i8* %5, i8** %1
  store i8* %5, i8** %0
  br label %L17

L16:                                              ; preds = %L14
  %9 = ptrtoint i8* %ARG2 to i64
  %R29 = add i64 %9, 1
  %10 = inttoptr i64 %R29 to i8*
  %11 = ptrtoint i8* %ARG2 to i64
  %12 = add i64 %11, 0
  %13 = inttoptr i64 %12 to i8*
  store i8 32, i8* %13
  store i8* %10, i8** %1
  store i8* %10, i8** %0
  br label %L17

L17:                                              ; preds = %L16, %L15
  switch i32 %ARG1, label %L19 [
    i32 0, label %L18
    i32 2, label %L18
    i32 3, label %L18
    i32 5, label %L18
    i32 6, label %L18
    i32 8, label %L18
  ]

L18:                                              ; preds = %L17, %L17, %L17, %L17, %L17, %L17
  %14 = load i8*, i8** %0
  %15 = ptrtoint i8* %14 to i64
  %R32 = add i64 %15, 1
  %16 = inttoptr i64 %R32 to i8*
  %17 = ptrtoint i8* %14 to i64
  %18 = add i64 %17, 0
  %19 = inttoptr i64 %18 to i8*
  store i8 95, i8* %19
  store i8* %16, i8** %3
  store i8* %16, i8** %2
  br label %L20

L19:                                              ; preds = %L17
  %20 = load i8*, i8** %1
  %21 = ptrtoint i8* %20 to i64
  %R34 = add i64 %21, 1
  %22 = inttoptr i64 %R34 to i8*
  %23 = ptrtoint i8* %20 to i64
  %24 = add i64 %23, 0
  %25 = inttoptr i64 %24 to i8*
  store i8 32, i8* %25
  store i8* %22, i8** %3
  store i8* %22, i8** %2
  br label %L20

L20:                                              ; preds = %L19, %L18
  switch i32 %ARG1, label %L22 [
    i32 0, label %L21
    i32 1, label %L21
    i32 3, label %L21
    i32 4, label %L21
    i32 5, label %L21
    i32 6, label %L21
    i32 7, label %L21
    i32 8, label %L21
    i32 9, label %L21
  ]

L21:                                              ; preds = %L20, %L20, %L20, %L20, %L20, %L20, %L20, %L20, %L20
  %26 = load i8*, i8** %2
  %27 = ptrtoint i8* %26 to i64
  %28 = add i64 %27, 0
  %29 = inttoptr i64 %28 to i8*
  store i8 124, i8* %29
  br label %L23

L22:                                              ; preds = %L20
  %30 = load i8*, i8** %3
  %31 = ptrtoint i8* %30 to i64
  %32 = add i64 %31, 0
  %33 = inttoptr i64 %32 to i8*
  store i8 32, i8* %33
  br label %L23

L23:                                              ; preds = %L22, %L21
  ret void
}

define internal void @print_led(i32 %ARG1, i8* %ARG2) {
L24:
  %0 = alloca i32
  %1 = alloca i32
  %2 = alloca i32
  %3 = alloca i32
  %4 = alloca i8*
  %5 = alloca i32
  %6 = alloca i8*
  %7 = alloca i32
  %8 = alloca i8*
  %R42 = icmp eq i32 %ARG1, 0
  %R421 = zext i1 %R42 to i32
  store i32 %ARG1, i32* %0
  store i8* %ARG2, i8** %4
  store i32 %R421, i32* %2
  store i32 %R421, i32* %1
  br label %L25

L25:                                              ; preds = %L27, %L24
  %9 = load i32, i32* %0
  %cond = icmp ne i32 %9, 0
  br i1 %cond, label %L26, label %L28

L26:                                              ; preds = %L25
  %R45 = urem i32 %9, 10
  %10 = load i32, i32* %1
  %R49 = add i32 %10, 1
  %R50 = sext i32 %10 to i64
  %R51 = mul i64 %R50, 4
  %R52 = add i64 ptrtoint ([32 x i32]* @d_00000230874C0F78 to i64), %R51
  %11 = inttoptr i64 %R52 to i32*
  %12 = ptrtoint i32* %11 to i64
  %13 = add i64 %12, 0
  %14 = inttoptr i64 %13 to i32*
  store i32 %R45, i32* %14
  %R54 = icmp sge i32 %R49, 32
  %R542 = zext i1 %R54 to i32
  store i32 %R49, i32* %2
  store i32 %R49, i32* %1
  %cond3 = icmp ne i32 %R542, 0
  br i1 %cond3, label %L28, label %L27

L27:                                              ; preds = %L26
  %R56 = udiv i32 %9, 10
  store i32 %R56, i32* %0
  br label %L25

L28:                                              ; preds = %L26, %L25
  %15 = load i32, i32* %2
  %R58 = add i32 %15, -1
  store i32 %R58, i32* %3
  br label %L29

L29:                                              ; preds = %L30, %L28
  %16 = load i32, i32* %3
  %R60 = icmp sge i32 %16, 0
  %R604 = zext i1 %R60 to i32
  %17 = load i8*, i8** %4
  %cond5 = icmp ne i32 %R604, 0
  br i1 %cond5, label %L30, label %L31

L30:                                              ; preds = %L29
  %R63 = sext i32 %16 to i64
  %R64 = mul i64 %R63, 4
  %R65 = add i64 ptrtoint ([32 x i32]* @d_00000230874C0F78 to i64), %R64
  %18 = inttoptr i64 %R65 to i32*
  %19 = ptrtoint i32* %18 to i64
  %20 = add i64 %19, 0
  %21 = inttoptr i64 %20 to i32*
  %load_target = load i32, i32* %21
  call void @topline(i32 %load_target, i8* %17)
  %R69 = ptrtoint i8* %17 to i64
  %R70 = add i64 %R69, 3
  %R71 = inttoptr i64 %R70 to i8*
  %22 = ptrtoint i8* %R71 to i64
  %R73 = add i64 %22, 1
  %23 = inttoptr i64 %R73 to i8*
  %24 = ptrtoint i8* %R71 to i64
  %25 = add i64 %24, 0
  %26 = inttoptr i64 %25 to i8*
  store i8 32, i8* %26
  store i8* %23, i8** %4
  %R75 = add i32 %16, -1
  store i32 %R75, i32* %3
  br label %L29

L31:                                              ; preds = %L29
  %27 = ptrtoint i8* %17 to i64
  %R77 = add i64 %27, 1
  %28 = inttoptr i64 %R77 to i8*
  %29 = ptrtoint i8* %17 to i64
  %30 = add i64 %29, 0
  %31 = inttoptr i64 %30 to i8*
  store i8 10, i8* %31
  store i8* %28, i8** %6
  store i32 %R58, i32* %5
  br label %L32

L32:                                              ; preds = %L33, %L31
  %32 = load i32, i32* %5
  %R81 = icmp sge i32 %32, 0
  %R816 = zext i1 %R81 to i32
  %33 = load i8*, i8** %6
  %cond7 = icmp ne i32 %R816, 0
  br i1 %cond7, label %L33, label %L34

L33:                                              ; preds = %L32
  %R84 = sext i32 %32 to i64
  %R85 = mul i64 %R84, 4
  %R86 = add i64 ptrtoint ([32 x i32]* @d_00000230874C0F78 to i64), %R85
  %34 = inttoptr i64 %R86 to i32*
  %35 = ptrtoint i32* %34 to i64
  %36 = add i64 %35, 0
  %37 = inttoptr i64 %36 to i32*
  %load_target8 = load i32, i32* %37
  call void @midline(i32 %load_target8, i8* %33)
  %R90 = ptrtoint i8* %33 to i64
  %R91 = add i64 %R90, 3
  %R92 = inttoptr i64 %R91 to i8*
  %38 = ptrtoint i8* %R92 to i64
  %R94 = add i64 %38, 1
  %39 = inttoptr i64 %R94 to i8*
  %40 = ptrtoint i8* %R92 to i64
  %41 = add i64 %40, 0
  %42 = inttoptr i64 %41 to i8*
  store i8 32, i8* %42
  store i8* %39, i8** %6
  %R96 = add i32 %32, -1
  store i32 %R96, i32* %5
  br label %L32

L34:                                              ; preds = %L32
  %43 = ptrtoint i8* %33 to i64
  %R98 = add i64 %43, 1
  %44 = inttoptr i64 %R98 to i8*
  %45 = ptrtoint i8* %33 to i64
  %46 = add i64 %45, 0
  %47 = inttoptr i64 %46 to i8*
  store i8 10, i8* %47
  store i8* %44, i8** %8
  store i32 %R58, i32* %7
  br label %L35

L35:                                              ; preds = %L36, %L34
  %48 = load i32, i32* %7
  %R102 = icmp sge i32 %48, 0
  %R1029 = zext i1 %R102 to i32
  %49 = load i8*, i8** %8
  %cond10 = icmp ne i32 %R1029, 0
  br i1 %cond10, label %L36, label %L37

L36:                                              ; preds = %L35
  %R105 = sext i32 %48 to i64
  %R106 = mul i64 %R105, 4
  %R107 = add i64 ptrtoint ([32 x i32]* @d_00000230874C0F78 to i64), %R106
  %50 = inttoptr i64 %R107 to i32*
  %51 = ptrtoint i32* %50 to i64
  %52 = add i64 %51, 0
  %53 = inttoptr i64 %52 to i32*
  %load_target11 = load i32, i32* %53
  call void @botline(i32 %load_target11, i8* %49)
  %R111 = ptrtoint i8* %49 to i64
  %R112 = add i64 %R111, 3
  %R113 = inttoptr i64 %R112 to i8*
  %54 = ptrtoint i8* %R113 to i64
  %R115 = add i64 %54, 1
  %55 = inttoptr i64 %R115 to i8*
  %56 = ptrtoint i8* %R113 to i64
  %57 = add i64 %56, 0
  %58 = inttoptr i64 %57 to i8*
  store i8 32, i8* %58
  store i8* %55, i8** %8
  %R117 = add i32 %48, -1
  store i32 %R117, i32* %7
  br label %L35

L37:                                              ; preds = %L35
  %59 = ptrtoint i8* %49 to i64
  %60 = add i64 %59, 0
  %61 = inttoptr i64 %60 to i8*
  store i8 10, i8* %61
  %62 = ptrtoint i8* %49 to i64
  %63 = add i64 %62, 1
  %64 = inttoptr i64 %63 to i8*
  store i8 0, i8* %64
  ret void
}

define i32 @main() {
L38:
  %buf_00000230874C1C98 = alloca [160 x i8]
  %R121 = bitcast [160 x i8]* %buf_00000230874C1C98 to i8*
  call void @print_led(i32 1234567, i8* %R121)
  %R124 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i8* %R121)
  ret i32 0
}

declare i32 @printf(i8*, ...)
