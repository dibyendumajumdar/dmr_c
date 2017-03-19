; ModuleID = 'out.bc'
source_filename = "sparse"

@d_0000020BD45239E8 = internal global [32 x i32] zeroinitializer
@.str = private constant [4 x i8] c"%s\0A\00"

define internal void @topline(i32 %ARG1, i8* %ARG2) {
L0:
  %0 = alloca i8*
  %1 = getelementptr inbounds i8, i8* %ARG2, inttoptr (i64 1 to i8*)
  %2 = getelementptr inbounds i8, i8* %ARG2, i64 0
  store i8 32, i8* %2
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
  %3 = getelementptr inbounds i8, i8* %1, inttoptr (i64 1 to i8*)
  %4 = getelementptr inbounds i8, i8* %ARG2, i64 1
  store i8 95, i8* %4
  store i8* %3, i8** %0
  br label %L3

L2:                                               ; preds = %L0
  %5 = getelementptr inbounds i8, i8* %1, inttoptr (i64 1 to i8*)
  %6 = getelementptr inbounds i8, i8* %ARG2, i64 1
  store i8 32, i8* %6
  store i8* %5, i8** %0
  br label %L3

L3:                                               ; preds = %L2, %L1
  %7 = load i8*, i8** %0
  %8 = getelementptr inbounds i8, i8* %7, i64 0
  store i8 32, i8* %8
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
  %4 = getelementptr inbounds i8, i8* %ARG2, inttoptr (i64 1 to i8*)
  %5 = getelementptr inbounds i8, i8* %ARG2, i64 0
  store i8 124, i8* %5
  store i8* %4, i8** %1
  store i8* %4, i8** %0
  br label %L7

L6:                                               ; preds = %L4
  %6 = getelementptr inbounds i8, i8* %ARG2, inttoptr (i64 1 to i8*)
  %7 = getelementptr inbounds i8, i8* %ARG2, i64 0
  store i8 32, i8* %7
  store i8* %6, i8** %1
  store i8* %6, i8** %0
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
  %8 = load i8*, i8** %0
  %9 = getelementptr inbounds i8, i8* %8, inttoptr (i64 1 to i8*)
  %10 = getelementptr inbounds i8, i8* %8, i64 0
  store i8 95, i8* %10
  store i8* %9, i8** %3
  store i8* %9, i8** %2
  br label %L10

L9:                                               ; preds = %L7
  %11 = load i8*, i8** %1
  %12 = getelementptr inbounds i8, i8* %11, inttoptr (i64 1 to i8*)
  %13 = getelementptr inbounds i8, i8* %11, i64 0
  store i8 32, i8* %13
  store i8* %12, i8** %3
  store i8* %12, i8** %2
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
  %14 = load i8*, i8** %2
  %15 = getelementptr inbounds i8, i8* %14, i64 0
  store i8 124, i8* %15
  br label %L13

L12:                                              ; preds = %L10
  %16 = load i8*, i8** %3
  %17 = getelementptr inbounds i8, i8* %16, i64 0
  store i8 32, i8* %17
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
  %4 = getelementptr inbounds i8, i8* %ARG2, inttoptr (i64 1 to i8*)
  %5 = getelementptr inbounds i8, i8* %ARG2, i64 0
  store i8 124, i8* %5
  store i8* %4, i8** %1
  store i8* %4, i8** %0
  br label %L17

L16:                                              ; preds = %L14
  %6 = getelementptr inbounds i8, i8* %ARG2, inttoptr (i64 1 to i8*)
  %7 = getelementptr inbounds i8, i8* %ARG2, i64 0
  store i8 32, i8* %7
  store i8* %6, i8** %1
  store i8* %6, i8** %0
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
  %8 = load i8*, i8** %0
  %9 = getelementptr inbounds i8, i8* %8, inttoptr (i64 1 to i8*)
  %10 = getelementptr inbounds i8, i8* %8, i64 0
  store i8 95, i8* %10
  store i8* %9, i8** %3
  store i8* %9, i8** %2
  br label %L20

L19:                                              ; preds = %L17
  %11 = load i8*, i8** %1
  %12 = getelementptr inbounds i8, i8* %11, inttoptr (i64 1 to i8*)
  %13 = getelementptr inbounds i8, i8* %11, i64 0
  store i8 32, i8* %13
  store i8* %12, i8** %3
  store i8* %12, i8** %2
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
  %14 = load i8*, i8** %2
  %15 = getelementptr inbounds i8, i8* %14, i64 0
  store i8 124, i8* %15
  br label %L23

L22:                                              ; preds = %L20
  %16 = load i8*, i8** %3
  %17 = getelementptr inbounds i8, i8* %16, i64 0
  store i8 32, i8* %17
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
  %11 = getelementptr inbounds i8, i8* bitcast ([32 x i32]* @d_0000020BD45239E8 to i8*), i64 %R51
  %12 = bitcast i8* %11 to i32*
  %13 = bitcast i32* %12 to i8*
  %14 = getelementptr inbounds i8, i8* %13, i64 0
  %15 = bitcast i8* %14 to i32*
  store i32 %R45, i32* %15
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
  %16 = load i32, i32* %2
  %R58 = add i32 %16, -1
  store i32 %R58, i32* %3
  br label %L29

L29:                                              ; preds = %L30, %L28
  %17 = load i32, i32* %3
  %R60 = icmp sge i32 %17, 0
  %R604 = zext i1 %R60 to i32
  %18 = load i8*, i8** %4
  %cond5 = icmp ne i32 %R604, 0
  br i1 %cond5, label %L30, label %L31

L30:                                              ; preds = %L29
  %R63 = sext i32 %17 to i64
  %R64 = mul i64 %R63, 4
  %19 = getelementptr inbounds i8, i8* bitcast ([32 x i32]* @d_0000020BD45239E8 to i8*), i64 %R64
  %20 = bitcast i8* %19 to i32*
  %21 = bitcast i32* %20 to i8*
  %22 = getelementptr inbounds i8, i8* %21, i64 0
  %23 = bitcast i8* %22 to i32*
  %load_target = load i32, i32* %23
  call void @topline(i32 %load_target, i8* %18)
  %R69 = ptrtoint i8* %18 to i64
  %R70 = add i64 %R69, 3
  %R71 = inttoptr i64 %R70 to i8*
  %24 = getelementptr inbounds i8, i8* %R71, inttoptr (i64 1 to i8*)
  %25 = getelementptr inbounds i8, i8* %R71, i64 0
  store i8 32, i8* %25
  store i8* %24, i8** %4
  %R75 = add i32 %17, -1
  store i32 %R75, i32* %3
  br label %L29

L31:                                              ; preds = %L29
  %26 = getelementptr inbounds i8, i8* %18, inttoptr (i64 1 to i8*)
  %27 = getelementptr inbounds i8, i8* %18, i64 0
  store i8 10, i8* %27
  store i8* %26, i8** %6
  store i32 %R58, i32* %5
  br label %L32

L32:                                              ; preds = %L33, %L31
  %28 = load i32, i32* %5
  %R81 = icmp sge i32 %28, 0
  %R816 = zext i1 %R81 to i32
  %29 = load i8*, i8** %6
  %cond7 = icmp ne i32 %R816, 0
  br i1 %cond7, label %L33, label %L34

L33:                                              ; preds = %L32
  %R84 = sext i32 %28 to i64
  %R85 = mul i64 %R84, 4
  %30 = getelementptr inbounds i8, i8* bitcast ([32 x i32]* @d_0000020BD45239E8 to i8*), i64 %R85
  %31 = bitcast i8* %30 to i32*
  %32 = bitcast i32* %31 to i8*
  %33 = getelementptr inbounds i8, i8* %32, i64 0
  %34 = bitcast i8* %33 to i32*
  %load_target8 = load i32, i32* %34
  call void @midline(i32 %load_target8, i8* %29)
  %R90 = ptrtoint i8* %29 to i64
  %R91 = add i64 %R90, 3
  %R92 = inttoptr i64 %R91 to i8*
  %35 = getelementptr inbounds i8, i8* %R92, inttoptr (i64 1 to i8*)
  %36 = getelementptr inbounds i8, i8* %R92, i64 0
  store i8 32, i8* %36
  store i8* %35, i8** %6
  %R96 = add i32 %28, -1
  store i32 %R96, i32* %5
  br label %L32

L34:                                              ; preds = %L32
  %37 = getelementptr inbounds i8, i8* %29, inttoptr (i64 1 to i8*)
  %38 = getelementptr inbounds i8, i8* %29, i64 0
  store i8 10, i8* %38
  store i8* %37, i8** %8
  store i32 %R58, i32* %7
  br label %L35

L35:                                              ; preds = %L36, %L34
  %39 = load i32, i32* %7
  %R102 = icmp sge i32 %39, 0
  %R1029 = zext i1 %R102 to i32
  %40 = load i8*, i8** %8
  %cond10 = icmp ne i32 %R1029, 0
  br i1 %cond10, label %L36, label %L37

L36:                                              ; preds = %L35
  %R105 = sext i32 %39 to i64
  %R106 = mul i64 %R105, 4
  %41 = getelementptr inbounds i8, i8* bitcast ([32 x i32]* @d_0000020BD45239E8 to i8*), i64 %R106
  %42 = bitcast i8* %41 to i32*
  %43 = bitcast i32* %42 to i8*
  %44 = getelementptr inbounds i8, i8* %43, i64 0
  %45 = bitcast i8* %44 to i32*
  %load_target11 = load i32, i32* %45
  call void @botline(i32 %load_target11, i8* %40)
  %R111 = ptrtoint i8* %40 to i64
  %R112 = add i64 %R111, 3
  %R113 = inttoptr i64 %R112 to i8*
  %46 = getelementptr inbounds i8, i8* %R113, inttoptr (i64 1 to i8*)
  %47 = getelementptr inbounds i8, i8* %R113, i64 0
  store i8 32, i8* %47
  store i8* %46, i8** %8
  %R117 = add i32 %39, -1
  store i32 %R117, i32* %7
  br label %L35

L37:                                              ; preds = %L35
  %48 = getelementptr inbounds i8, i8* %40, i64 0
  store i8 10, i8* %48
  %49 = getelementptr inbounds i8, i8* %40, i64 1
  store i8 0, i8* %49
  ret void
}

define i32 @main() {
L38:
  %buf_0000020BD4524708 = alloca [160 x i8]
  %R121 = bitcast [160 x i8]* %buf_0000020BD4524708 to i8*
  call void @print_led(i32 1234567, i8* %R121)
  %R124 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i8* %R121)
  ret i32 0
}

declare i32 @printf(i8*, ...)
