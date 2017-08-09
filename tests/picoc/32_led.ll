; ModuleID = 'out.bc'
source_filename = "dmrC"

@d_00000256366591A8. = internal global [32 x i32] zeroinitializer
@.str = private constant [4 x i8] c"%s\0A\00"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define internal void @topline(i32 %ARG1, i8* %ARG2) {
L0:
  %p_0000025634D7EF88. = alloca i8*
  %d_0000025634D7EEA8. = alloca i32
  %d_0000025634D7EEA8.1 = ptrtoint i32* %d_0000025634D7EEA8. to i64
  %0 = add i64 %d_0000025634D7EEA8.1, 0
  %1 = inttoptr i64 %0 to i32*
  store i32 %ARG1, i32* %1
  %p_0000025634D7EF88.2 = ptrtoint i8** %p_0000025634D7EF88. to i64
  %2 = add i64 %p_0000025634D7EF88.2, 0
  %3 = inttoptr i64 %2 to i8**
  store i8* %ARG2, i8** %3
  %p_0000025634D7EF88.3 = ptrtoint i8** %p_0000025634D7EF88. to i64
  %4 = add i64 %p_0000025634D7EF88.3, 0
  %5 = inttoptr i64 %4 to i8**
  %R1 = load i8*, i8** %5
  %R14 = ptrtoint i8* %R1 to i64
  %R2 = add i64 %R14, 1
  %R25 = inttoptr i64 %R2 to i8*
  %p_0000025634D7EF88.6 = ptrtoint i8** %p_0000025634D7EF88. to i64
  %6 = add i64 %p_0000025634D7EF88.6, 0
  %7 = inttoptr i64 %6 to i8**
  store i8* %R25, i8** %7
  %R17 = ptrtoint i8* %R1 to i64
  %8 = add i64 %R17, 0
  %9 = inttoptr i64 %8 to i8*
  store i8 32, i8* %9
  %d_0000025634D7EEA8.8 = ptrtoint i32* %d_0000025634D7EEA8. to i64
  %10 = add i64 %d_0000025634D7EEA8.8, 0
  %11 = inttoptr i64 %10 to i32*
  %R3 = load i32, i32* %11
  switch i32 %R3, label %L8 [
    i32 0, label %L1
    i32 2, label %L2
    i32 3, label %L3
    i32 5, label %L4
    i32 7, label %L5
    i32 8, label %L6
    i32 9, label %L7
  ]

L1:                                               ; preds = %L0
  br label %L2

L2:                                               ; preds = %L1, %L0
  br label %L3

L3:                                               ; preds = %L2, %L0
  br label %L4

L4:                                               ; preds = %L3, %L0
  br label %L5

L5:                                               ; preds = %L4, %L0
  br label %L6

L6:                                               ; preds = %L5, %L0
  br label %L7

L7:                                               ; preds = %L6, %L0
  %p_0000025634D7EF88.9 = ptrtoint i8** %p_0000025634D7EF88. to i64
  %12 = add i64 %p_0000025634D7EF88.9, 0
  %13 = inttoptr i64 %12 to i8**
  %R4 = load i8*, i8** %13
  %R410 = ptrtoint i8* %R4 to i64
  %R5 = add i64 %R410, 1
  %R511 = inttoptr i64 %R5 to i8*
  %p_0000025634D7EF88.12 = ptrtoint i8** %p_0000025634D7EF88. to i64
  %14 = add i64 %p_0000025634D7EF88.12, 0
  %15 = inttoptr i64 %14 to i8**
  store i8* %R511, i8** %15
  %R413 = ptrtoint i8* %R4 to i64
  %16 = add i64 %R413, 0
  %17 = inttoptr i64 %16 to i8*
  store i8 95, i8* %17
  br label %L9

L8:                                               ; preds = %L0
  %p_0000025634D7EF88.14 = ptrtoint i8** %p_0000025634D7EF88. to i64
  %18 = add i64 %p_0000025634D7EF88.14, 0
  %19 = inttoptr i64 %18 to i8**
  %R6 = load i8*, i8** %19
  %R615 = ptrtoint i8* %R6 to i64
  %R7 = add i64 %R615, 1
  %R716 = inttoptr i64 %R7 to i8*
  %p_0000025634D7EF88.17 = ptrtoint i8** %p_0000025634D7EF88. to i64
  %20 = add i64 %p_0000025634D7EF88.17, 0
  %21 = inttoptr i64 %20 to i8**
  store i8* %R716, i8** %21
  %R618 = ptrtoint i8* %R6 to i64
  %22 = add i64 %R618, 0
  %23 = inttoptr i64 %22 to i8*
  store i8 32, i8* %23
  br label %L9

L9:                                               ; preds = %L8, %L7
  %p_0000025634D7EF88.19 = ptrtoint i8** %p_0000025634D7EF88. to i64
  %24 = add i64 %p_0000025634D7EF88.19, 0
  %25 = inttoptr i64 %24 to i8**
  %R8 = load i8*, i8** %25
  %R820 = ptrtoint i8* %R8 to i64
  %R9 = add i64 %R820, 1
  %R921 = inttoptr i64 %R9 to i8*
  %p_0000025634D7EF88.22 = ptrtoint i8** %p_0000025634D7EF88. to i64
  %26 = add i64 %p_0000025634D7EF88.22, 0
  %27 = inttoptr i64 %26 to i8**
  store i8* %R921, i8** %27
  %R823 = ptrtoint i8* %R8 to i64
  %28 = add i64 %R823, 0
  %29 = inttoptr i64 %28 to i8*
  store i8 32, i8* %29
  br label %L10

L10:                                              ; preds = %L9
  ret void
}

define internal void @midline(i32 %ARG1, i8* %ARG2) {
L11:
  %p_0000025634D7FD88. = alloca i8*
  %d_0000025634D7FCA8. = alloca i32
  %d_0000025634D7FCA8.1 = ptrtoint i32* %d_0000025634D7FCA8. to i64
  %0 = add i64 %d_0000025634D7FCA8.1, 0
  %1 = inttoptr i64 %0 to i32*
  store i32 %ARG1, i32* %1
  %p_0000025634D7FD88.2 = ptrtoint i8** %p_0000025634D7FD88. to i64
  %2 = add i64 %p_0000025634D7FD88.2, 0
  %3 = inttoptr i64 %2 to i8**
  store i8* %ARG2, i8** %3
  %d_0000025634D7FCA8.3 = ptrtoint i32* %d_0000025634D7FCA8. to i64
  %4 = add i64 %d_0000025634D7FCA8.3, 0
  %5 = inttoptr i64 %4 to i32*
  %R10 = load i32, i32* %5
  switch i32 %R10, label %L18 [
    i32 0, label %L12
    i32 4, label %L13
    i32 5, label %L14
    i32 6, label %L15
    i32 8, label %L16
    i32 9, label %L17
  ]

L12:                                              ; preds = %L11
  br label %L13

L13:                                              ; preds = %L12, %L11
  br label %L14

L14:                                              ; preds = %L13, %L11
  br label %L15

L15:                                              ; preds = %L14, %L11
  br label %L16

L16:                                              ; preds = %L15, %L11
  br label %L17

L17:                                              ; preds = %L16, %L11
  %p_0000025634D7FD88.4 = ptrtoint i8** %p_0000025634D7FD88. to i64
  %6 = add i64 %p_0000025634D7FD88.4, 0
  %7 = inttoptr i64 %6 to i8**
  %R11 = load i8*, i8** %7
  %R115 = ptrtoint i8* %R11 to i64
  %R12 = add i64 %R115, 1
  %R126 = inttoptr i64 %R12 to i8*
  %p_0000025634D7FD88.7 = ptrtoint i8** %p_0000025634D7FD88. to i64
  %8 = add i64 %p_0000025634D7FD88.7, 0
  %9 = inttoptr i64 %8 to i8**
  store i8* %R126, i8** %9
  %R118 = ptrtoint i8* %R11 to i64
  %10 = add i64 %R118, 0
  %11 = inttoptr i64 %10 to i8*
  store i8 124, i8* %11
  br label %L19

L18:                                              ; preds = %L11
  %p_0000025634D7FD88.9 = ptrtoint i8** %p_0000025634D7FD88. to i64
  %12 = add i64 %p_0000025634D7FD88.9, 0
  %13 = inttoptr i64 %12 to i8**
  %R13 = load i8*, i8** %13
  %R1310 = ptrtoint i8* %R13 to i64
  %R14 = add i64 %R1310, 1
  %R1411 = inttoptr i64 %R14 to i8*
  %p_0000025634D7FD88.12 = ptrtoint i8** %p_0000025634D7FD88. to i64
  %14 = add i64 %p_0000025634D7FD88.12, 0
  %15 = inttoptr i64 %14 to i8**
  store i8* %R1411, i8** %15
  %R1313 = ptrtoint i8* %R13 to i64
  %16 = add i64 %R1313, 0
  %17 = inttoptr i64 %16 to i8*
  store i8 32, i8* %17
  br label %L19

L19:                                              ; preds = %L18, %L17
  %d_0000025634D7FCA8.14 = ptrtoint i32* %d_0000025634D7FCA8. to i64
  %18 = add i64 %d_0000025634D7FCA8.14, 0
  %19 = inttoptr i64 %18 to i32*
  %R15 = load i32, i32* %19
  switch i32 %R15, label %L27 [
    i32 2, label %L20
    i32 3, label %L21
    i32 4, label %L22
    i32 5, label %L23
    i32 6, label %L24
    i32 8, label %L25
    i32 9, label %L26
  ]

L20:                                              ; preds = %L19
  br label %L21

L21:                                              ; preds = %L20, %L19
  br label %L22

L22:                                              ; preds = %L21, %L19
  br label %L23

L23:                                              ; preds = %L22, %L19
  br label %L24

L24:                                              ; preds = %L23, %L19
  br label %L25

L25:                                              ; preds = %L24, %L19
  br label %L26

L26:                                              ; preds = %L25, %L19
  %p_0000025634D7FD88.15 = ptrtoint i8** %p_0000025634D7FD88. to i64
  %20 = add i64 %p_0000025634D7FD88.15, 0
  %21 = inttoptr i64 %20 to i8**
  %R16 = load i8*, i8** %21
  %R1616 = ptrtoint i8* %R16 to i64
  %R17 = add i64 %R1616, 1
  %R1717 = inttoptr i64 %R17 to i8*
  %p_0000025634D7FD88.18 = ptrtoint i8** %p_0000025634D7FD88. to i64
  %22 = add i64 %p_0000025634D7FD88.18, 0
  %23 = inttoptr i64 %22 to i8**
  store i8* %R1717, i8** %23
  %R1619 = ptrtoint i8* %R16 to i64
  %24 = add i64 %R1619, 0
  %25 = inttoptr i64 %24 to i8*
  store i8 95, i8* %25
  br label %L28

L27:                                              ; preds = %L19
  %p_0000025634D7FD88.20 = ptrtoint i8** %p_0000025634D7FD88. to i64
  %26 = add i64 %p_0000025634D7FD88.20, 0
  %27 = inttoptr i64 %26 to i8**
  %R18 = load i8*, i8** %27
  %R1821 = ptrtoint i8* %R18 to i64
  %R19 = add i64 %R1821, 1
  %R1922 = inttoptr i64 %R19 to i8*
  %p_0000025634D7FD88.23 = ptrtoint i8** %p_0000025634D7FD88. to i64
  %28 = add i64 %p_0000025634D7FD88.23, 0
  %29 = inttoptr i64 %28 to i8**
  store i8* %R1922, i8** %29
  %R1824 = ptrtoint i8* %R18 to i64
  %30 = add i64 %R1824, 0
  %31 = inttoptr i64 %30 to i8*
  store i8 32, i8* %31
  br label %L28

L28:                                              ; preds = %L27, %L26
  %d_0000025634D7FCA8.25 = ptrtoint i32* %d_0000025634D7FCA8. to i64
  %32 = add i64 %d_0000025634D7FCA8.25, 0
  %33 = inttoptr i64 %32 to i32*
  %R20 = load i32, i32* %33
  switch i32 %R20, label %L37 [
    i32 0, label %L29
    i32 1, label %L30
    i32 2, label %L31
    i32 3, label %L32
    i32 4, label %L33
    i32 7, label %L34
    i32 8, label %L35
    i32 9, label %L36
  ]

L29:                                              ; preds = %L28
  br label %L30

L30:                                              ; preds = %L29, %L28
  br label %L31

L31:                                              ; preds = %L30, %L28
  br label %L32

L32:                                              ; preds = %L31, %L28
  br label %L33

L33:                                              ; preds = %L32, %L28
  br label %L34

L34:                                              ; preds = %L33, %L28
  br label %L35

L35:                                              ; preds = %L34, %L28
  br label %L36

L36:                                              ; preds = %L35, %L28
  %p_0000025634D7FD88.26 = ptrtoint i8** %p_0000025634D7FD88. to i64
  %34 = add i64 %p_0000025634D7FD88.26, 0
  %35 = inttoptr i64 %34 to i8**
  %R21 = load i8*, i8** %35
  %R2127 = ptrtoint i8* %R21 to i64
  %R22 = add i64 %R2127, 1
  %R2228 = inttoptr i64 %R22 to i8*
  %p_0000025634D7FD88.29 = ptrtoint i8** %p_0000025634D7FD88. to i64
  %36 = add i64 %p_0000025634D7FD88.29, 0
  %37 = inttoptr i64 %36 to i8**
  store i8* %R2228, i8** %37
  %R2130 = ptrtoint i8* %R21 to i64
  %38 = add i64 %R2130, 0
  %39 = inttoptr i64 %38 to i8*
  store i8 124, i8* %39
  br label %L38

L37:                                              ; preds = %L28
  %p_0000025634D7FD88.31 = ptrtoint i8** %p_0000025634D7FD88. to i64
  %40 = add i64 %p_0000025634D7FD88.31, 0
  %41 = inttoptr i64 %40 to i8**
  %R23 = load i8*, i8** %41
  %R2332 = ptrtoint i8* %R23 to i64
  %R24 = add i64 %R2332, 1
  %R2433 = inttoptr i64 %R24 to i8*
  %p_0000025634D7FD88.34 = ptrtoint i8** %p_0000025634D7FD88. to i64
  %42 = add i64 %p_0000025634D7FD88.34, 0
  %43 = inttoptr i64 %42 to i8**
  store i8* %R2433, i8** %43
  %R2335 = ptrtoint i8* %R23 to i64
  %44 = add i64 %R2335, 0
  %45 = inttoptr i64 %44 to i8*
  store i8 32, i8* %45
  br label %L38

L38:                                              ; preds = %L37, %L36
  ret void
}

define internal void @botline(i32 %ARG1, i8* %ARG2) {
L39:
  %p_0000025634D81D08. = alloca i8*
  %d_0000025634D81C28. = alloca i32
  %d_0000025634D81C28.1 = ptrtoint i32* %d_0000025634D81C28. to i64
  %0 = add i64 %d_0000025634D81C28.1, 0
  %1 = inttoptr i64 %0 to i32*
  store i32 %ARG1, i32* %1
  %p_0000025634D81D08.2 = ptrtoint i8** %p_0000025634D81D08. to i64
  %2 = add i64 %p_0000025634D81D08.2, 0
  %3 = inttoptr i64 %2 to i8**
  store i8* %ARG2, i8** %3
  %d_0000025634D81C28.3 = ptrtoint i32* %d_0000025634D81C28. to i64
  %4 = add i64 %d_0000025634D81C28.3, 0
  %5 = inttoptr i64 %4 to i32*
  %R25 = load i32, i32* %5
  switch i32 %R25, label %L44 [
    i32 0, label %L40
    i32 2, label %L41
    i32 6, label %L42
    i32 8, label %L43
  ]

L40:                                              ; preds = %L39
  br label %L41

L41:                                              ; preds = %L40, %L39
  br label %L42

L42:                                              ; preds = %L41, %L39
  br label %L43

L43:                                              ; preds = %L42, %L39
  %p_0000025634D81D08.4 = ptrtoint i8** %p_0000025634D81D08. to i64
  %6 = add i64 %p_0000025634D81D08.4, 0
  %7 = inttoptr i64 %6 to i8**
  %R26 = load i8*, i8** %7
  %R265 = ptrtoint i8* %R26 to i64
  %R27 = add i64 %R265, 1
  %R276 = inttoptr i64 %R27 to i8*
  %p_0000025634D81D08.7 = ptrtoint i8** %p_0000025634D81D08. to i64
  %8 = add i64 %p_0000025634D81D08.7, 0
  %9 = inttoptr i64 %8 to i8**
  store i8* %R276, i8** %9
  %R268 = ptrtoint i8* %R26 to i64
  %10 = add i64 %R268, 0
  %11 = inttoptr i64 %10 to i8*
  store i8 124, i8* %11
  br label %L45

L44:                                              ; preds = %L39
  %p_0000025634D81D08.9 = ptrtoint i8** %p_0000025634D81D08. to i64
  %12 = add i64 %p_0000025634D81D08.9, 0
  %13 = inttoptr i64 %12 to i8**
  %R28 = load i8*, i8** %13
  %R2810 = ptrtoint i8* %R28 to i64
  %R29 = add i64 %R2810, 1
  %R2911 = inttoptr i64 %R29 to i8*
  %p_0000025634D81D08.12 = ptrtoint i8** %p_0000025634D81D08. to i64
  %14 = add i64 %p_0000025634D81D08.12, 0
  %15 = inttoptr i64 %14 to i8**
  store i8* %R2911, i8** %15
  %R2813 = ptrtoint i8* %R28 to i64
  %16 = add i64 %R2813, 0
  %17 = inttoptr i64 %16 to i8*
  store i8 32, i8* %17
  br label %L45

L45:                                              ; preds = %L44, %L43
  %d_0000025634D81C28.14 = ptrtoint i32* %d_0000025634D81C28. to i64
  %18 = add i64 %d_0000025634D81C28.14, 0
  %19 = inttoptr i64 %18 to i32*
  %R30 = load i32, i32* %19
  switch i32 %R30, label %L52 [
    i32 0, label %L46
    i32 2, label %L47
    i32 3, label %L48
    i32 5, label %L49
    i32 6, label %L50
    i32 8, label %L51
  ]

L46:                                              ; preds = %L45
  br label %L47

L47:                                              ; preds = %L46, %L45
  br label %L48

L48:                                              ; preds = %L47, %L45
  br label %L49

L49:                                              ; preds = %L48, %L45
  br label %L50

L50:                                              ; preds = %L49, %L45
  br label %L51

L51:                                              ; preds = %L50, %L45
  %p_0000025634D81D08.15 = ptrtoint i8** %p_0000025634D81D08. to i64
  %20 = add i64 %p_0000025634D81D08.15, 0
  %21 = inttoptr i64 %20 to i8**
  %R31 = load i8*, i8** %21
  %R3116 = ptrtoint i8* %R31 to i64
  %R32 = add i64 %R3116, 1
  %R3217 = inttoptr i64 %R32 to i8*
  %p_0000025634D81D08.18 = ptrtoint i8** %p_0000025634D81D08. to i64
  %22 = add i64 %p_0000025634D81D08.18, 0
  %23 = inttoptr i64 %22 to i8**
  store i8* %R3217, i8** %23
  %R3119 = ptrtoint i8* %R31 to i64
  %24 = add i64 %R3119, 0
  %25 = inttoptr i64 %24 to i8*
  store i8 95, i8* %25
  br label %L53

L52:                                              ; preds = %L45
  %p_0000025634D81D08.20 = ptrtoint i8** %p_0000025634D81D08. to i64
  %26 = add i64 %p_0000025634D81D08.20, 0
  %27 = inttoptr i64 %26 to i8**
  %R33 = load i8*, i8** %27
  %R3321 = ptrtoint i8* %R33 to i64
  %R34 = add i64 %R3321, 1
  %R3422 = inttoptr i64 %R34 to i8*
  %p_0000025634D81D08.23 = ptrtoint i8** %p_0000025634D81D08. to i64
  %28 = add i64 %p_0000025634D81D08.23, 0
  %29 = inttoptr i64 %28 to i8**
  store i8* %R3422, i8** %29
  %R3324 = ptrtoint i8* %R33 to i64
  %30 = add i64 %R3324, 0
  %31 = inttoptr i64 %30 to i8*
  store i8 32, i8* %31
  br label %L53

L53:                                              ; preds = %L52, %L51
  %d_0000025634D81C28.25 = ptrtoint i32* %d_0000025634D81C28. to i64
  %32 = add i64 %d_0000025634D81C28.25, 0
  %33 = inttoptr i64 %32 to i32*
  %R35 = load i32, i32* %33
  switch i32 %R35, label %L63 [
    i32 0, label %L54
    i32 1, label %L55
    i32 3, label %L56
    i32 4, label %L57
    i32 5, label %L58
    i32 6, label %L59
    i32 7, label %L60
    i32 8, label %L61
    i32 9, label %L62
  ]

L54:                                              ; preds = %L53
  br label %L55

L55:                                              ; preds = %L54, %L53
  br label %L56

L56:                                              ; preds = %L55, %L53
  br label %L57

L57:                                              ; preds = %L56, %L53
  br label %L58

L58:                                              ; preds = %L57, %L53
  br label %L59

L59:                                              ; preds = %L58, %L53
  br label %L60

L60:                                              ; preds = %L59, %L53
  br label %L61

L61:                                              ; preds = %L60, %L53
  br label %L62

L62:                                              ; preds = %L61, %L53
  %p_0000025634D81D08.26 = ptrtoint i8** %p_0000025634D81D08. to i64
  %34 = add i64 %p_0000025634D81D08.26, 0
  %35 = inttoptr i64 %34 to i8**
  %R36 = load i8*, i8** %35
  %R3627 = ptrtoint i8* %R36 to i64
  %R37 = add i64 %R3627, 1
  %R3728 = inttoptr i64 %R37 to i8*
  %p_0000025634D81D08.29 = ptrtoint i8** %p_0000025634D81D08. to i64
  %36 = add i64 %p_0000025634D81D08.29, 0
  %37 = inttoptr i64 %36 to i8**
  store i8* %R3728, i8** %37
  %R3630 = ptrtoint i8* %R36 to i64
  %38 = add i64 %R3630, 0
  %39 = inttoptr i64 %38 to i8*
  store i8 124, i8* %39
  br label %L64

L63:                                              ; preds = %L53
  %p_0000025634D81D08.31 = ptrtoint i8** %p_0000025634D81D08. to i64
  %40 = add i64 %p_0000025634D81D08.31, 0
  %41 = inttoptr i64 %40 to i8**
  %R38 = load i8*, i8** %41
  %R3832 = ptrtoint i8* %R38 to i64
  %R39 = add i64 %R3832, 1
  %R3933 = inttoptr i64 %R39 to i8*
  %p_0000025634D81D08.34 = ptrtoint i8** %p_0000025634D81D08. to i64
  %42 = add i64 %p_0000025634D81D08.34, 0
  %43 = inttoptr i64 %42 to i8**
  store i8* %R3933, i8** %43
  %R3835 = ptrtoint i8* %R38 to i64
  %44 = add i64 %R3835, 0
  %45 = inttoptr i64 %44 to i8*
  store i8 32, i8* %45
  br label %L64

L64:                                              ; preds = %L63, %L62
  ret void
}

define internal void @print_led(i32 %ARG1, i8* %ARG2) {
L65:
  %n_00000256366590C8. = alloca i32
  %i_0000025636658FE8. = alloca i32
  %buf_0000025636658D48. = alloca i8*
  %x_0000025636658C68. = alloca i32
  %x_0000025636658C68.1 = ptrtoint i32* %x_0000025636658C68. to i64
  %0 = add i64 %x_0000025636658C68.1, 0
  %1 = inttoptr i64 %0 to i32*
  store i32 %ARG1, i32* %1
  %buf_0000025636658D48.2 = ptrtoint i8** %buf_0000025636658D48. to i64
  %2 = add i64 %buf_0000025636658D48.2, 0
  %3 = inttoptr i64 %2 to i8**
  store i8* %ARG2, i8** %3
  store i32 0, i32* %i_0000025636658FE8.
  %i_0000025636658FE8.3 = ptrtoint i32* %i_0000025636658FE8. to i64
  %4 = add i64 %i_0000025636658FE8.3, 0
  %5 = inttoptr i64 %4 to i32*
  store i32 0, i32* %5
  %x_0000025636658C68.4 = ptrtoint i32* %x_0000025636658C68. to i64
  %6 = add i64 %x_0000025636658C68.4, 0
  %7 = inttoptr i64 %6 to i32*
  %R40 = load i32, i32* %7
  %R41 = icmp eq i32 %R40, 0
  %R415 = zext i1 %R41 to i32
  %cond = icmp ne i32 %R415, 0
  %select = select i1 %cond, i32 1, i32 0
  %n_00000256366590C8.6 = ptrtoint i32* %n_00000256366590C8. to i64
  %8 = add i64 %n_00000256366590C8.6, 0
  %9 = inttoptr i64 %8 to i32*
  store i32 %select, i32* %9
  br label %L66

L66:                                              ; preds = %L70, %L65
  %x_0000025636658C68.7 = ptrtoint i32* %x_0000025636658C68. to i64
  %10 = add i64 %x_0000025636658C68.7, 0
  %11 = inttoptr i64 %10 to i32*
  %R43 = load i32, i32* %11
  %cond8 = icmp ne i32 %R43, 0
  br i1 %cond8, label %L67, label %L71

L67:                                              ; preds = %L66
  %x_0000025636658C68.9 = ptrtoint i32* %x_0000025636658C68. to i64
  %12 = add i64 %x_0000025636658C68.9, 0
  %13 = inttoptr i64 %12 to i32*
  %R44 = load i32, i32* %13
  %R45 = urem i32 %R44, 10
  %n_00000256366590C8.10 = ptrtoint i32* %n_00000256366590C8. to i64
  %14 = add i64 %n_00000256366590C8.10, 0
  %15 = inttoptr i64 %14 to i32*
  %R48 = load i32, i32* %15
  %R49 = add i32 %R48, 1
  %n_00000256366590C8.11 = ptrtoint i32* %n_00000256366590C8. to i64
  %16 = add i64 %n_00000256366590C8.11, 0
  %17 = inttoptr i64 %16 to i32*
  store i32 %R49, i32* %17
  %R50 = sext i32 %R48 to i64
  %R51 = mul i64 %R50, 4
  %R52 = add i64 ptrtoint ([32 x i32]* @d_00000256366591A8. to i64), %R51
  %R5212 = inttoptr i64 %R52 to i32*
  %R521213 = ptrtoint i32* %R5212 to i64
  %18 = add i64 %R521213, 0
  %19 = inttoptr i64 %18 to i32*
  store i32 %R45, i32* %19
  %n_00000256366590C8.14 = ptrtoint i32* %n_00000256366590C8. to i64
  %20 = add i64 %n_00000256366590C8.14, 0
  %21 = inttoptr i64 %20 to i32*
  %R53 = load i32, i32* %21
  %R54 = icmp sge i32 %R53, 32
  %R5415 = zext i1 %R54 to i32
  %cond16 = icmp ne i32 %R5415, 0
  br i1 %cond16, label %L68, label %L69

L68:                                              ; preds = %L67
  br label %L71

L69:                                              ; preds = %L67
  %x_0000025636658C68.17 = ptrtoint i32* %x_0000025636658C68. to i64
  %22 = add i64 %x_0000025636658C68.17, 0
  %23 = inttoptr i64 %22 to i32*
  %R55 = load i32, i32* %23
  %R56 = udiv i32 %R55, 10
  %x_0000025636658C68.18 = ptrtoint i32* %x_0000025636658C68. to i64
  %24 = add i64 %x_0000025636658C68.18, 0
  %25 = inttoptr i64 %24 to i32*
  store i32 %R56, i32* %25
  br label %L70

L70:                                              ; preds = %L69
  br label %L66

L71:                                              ; preds = %L68, %L66
  %n_00000256366590C8.19 = ptrtoint i32* %n_00000256366590C8. to i64
  %26 = add i64 %n_00000256366590C8.19, 0
  %27 = inttoptr i64 %26 to i32*
  %R57 = load i32, i32* %27
  %R58 = sub i32 %R57, 1
  %i_0000025636658FE8.20 = ptrtoint i32* %i_0000025636658FE8. to i64
  %28 = add i64 %i_0000025636658FE8.20, 0
  %29 = inttoptr i64 %28 to i32*
  store i32 %R58, i32* %29
  br label %L72

L72:                                              ; preds = %L74, %L71
  %i_0000025636658FE8.21 = ptrtoint i32* %i_0000025636658FE8. to i64
  %30 = add i64 %i_0000025636658FE8.21, 0
  %31 = inttoptr i64 %30 to i32*
  %R59 = load i32, i32* %31
  %R60 = icmp sge i32 %R59, 0
  %R6022 = zext i1 %R60 to i32
  %cond23 = icmp ne i32 %R6022, 0
  br i1 %cond23, label %L73, label %L75

L73:                                              ; preds = %L72
  %i_0000025636658FE8.24 = ptrtoint i32* %i_0000025636658FE8. to i64
  %32 = add i64 %i_0000025636658FE8.24, 0
  %33 = inttoptr i64 %32 to i32*
  %R62 = load i32, i32* %33
  %R63 = sext i32 %R62 to i64
  %R64 = mul i64 %R63, 4
  %R65 = add i64 ptrtoint ([32 x i32]* @d_00000256366591A8. to i64), %R64
  %R6525 = inttoptr i64 %R65 to i32*
  %R652526 = ptrtoint i32* %R6525 to i64
  %34 = add i64 %R652526, 0
  %35 = inttoptr i64 %34 to i32*
  %R66 = load i32, i32* %35
  %buf_0000025636658D48.27 = ptrtoint i8** %buf_0000025636658D48. to i64
  %36 = add i64 %buf_0000025636658D48.27, 0
  %37 = inttoptr i64 %36 to i8**
  %R67 = load i8*, i8** %37
  call void @topline(i32 %R66, i8* %R67)
  %buf_0000025636658D48.28 = ptrtoint i8** %buf_0000025636658D48. to i64
  %38 = add i64 %buf_0000025636658D48.28, 0
  %39 = inttoptr i64 %38 to i8**
  %R68 = load i8*, i8** %39
  %R69 = ptrtoint i8* %R68 to i64
  %R70 = add i64 %R69, 3
  %R71 = inttoptr i64 %R70 to i8*
  %buf_0000025636658D48.29 = ptrtoint i8** %buf_0000025636658D48. to i64
  %40 = add i64 %buf_0000025636658D48.29, 0
  %41 = inttoptr i64 %40 to i8**
  store i8* %R71, i8** %41
  %buf_0000025636658D48.30 = ptrtoint i8** %buf_0000025636658D48. to i64
  %42 = add i64 %buf_0000025636658D48.30, 0
  %43 = inttoptr i64 %42 to i8**
  %R72 = load i8*, i8** %43
  %R7231 = ptrtoint i8* %R72 to i64
  %R73 = add i64 %R7231, 1
  %R7332 = inttoptr i64 %R73 to i8*
  %buf_0000025636658D48.33 = ptrtoint i8** %buf_0000025636658D48. to i64
  %44 = add i64 %buf_0000025636658D48.33, 0
  %45 = inttoptr i64 %44 to i8**
  store i8* %R7332, i8** %45
  %R7234 = ptrtoint i8* %R72 to i64
  %46 = add i64 %R7234, 0
  %47 = inttoptr i64 %46 to i8*
  store i8 32, i8* %47
  br label %L74

L74:                                              ; preds = %L73
  %i_0000025636658FE8.35 = ptrtoint i32* %i_0000025636658FE8. to i64
  %48 = add i64 %i_0000025636658FE8.35, 0
  %49 = inttoptr i64 %48 to i32*
  %R74 = load i32, i32* %49
  %R75 = sub i32 %R74, 1
  %i_0000025636658FE8.36 = ptrtoint i32* %i_0000025636658FE8. to i64
  %50 = add i64 %i_0000025636658FE8.36, 0
  %51 = inttoptr i64 %50 to i32*
  store i32 %R75, i32* %51
  br label %L72

L75:                                              ; preds = %L72
  %buf_0000025636658D48.37 = ptrtoint i8** %buf_0000025636658D48. to i64
  %52 = add i64 %buf_0000025636658D48.37, 0
  %53 = inttoptr i64 %52 to i8**
  %R76 = load i8*, i8** %53
  %R7638 = ptrtoint i8* %R76 to i64
  %R77 = add i64 %R7638, 1
  %R7739 = inttoptr i64 %R77 to i8*
  %buf_0000025636658D48.40 = ptrtoint i8** %buf_0000025636658D48. to i64
  %54 = add i64 %buf_0000025636658D48.40, 0
  %55 = inttoptr i64 %54 to i8**
  store i8* %R7739, i8** %55
  %R7641 = ptrtoint i8* %R76 to i64
  %56 = add i64 %R7641, 0
  %57 = inttoptr i64 %56 to i8*
  store i8 10, i8* %57
  %n_00000256366590C8.42 = ptrtoint i32* %n_00000256366590C8. to i64
  %58 = add i64 %n_00000256366590C8.42, 0
  %59 = inttoptr i64 %58 to i32*
  %R78 = load i32, i32* %59
  %R79 = sub i32 %R78, 1
  %i_0000025636658FE8.43 = ptrtoint i32* %i_0000025636658FE8. to i64
  %60 = add i64 %i_0000025636658FE8.43, 0
  %61 = inttoptr i64 %60 to i32*
  store i32 %R79, i32* %61
  br label %L76

L76:                                              ; preds = %L78, %L75
  %i_0000025636658FE8.44 = ptrtoint i32* %i_0000025636658FE8. to i64
  %62 = add i64 %i_0000025636658FE8.44, 0
  %63 = inttoptr i64 %62 to i32*
  %R80 = load i32, i32* %63
  %R81 = icmp sge i32 %R80, 0
  %R8145 = zext i1 %R81 to i32
  %cond46 = icmp ne i32 %R8145, 0
  br i1 %cond46, label %L77, label %L79

L77:                                              ; preds = %L76
  %i_0000025636658FE8.47 = ptrtoint i32* %i_0000025636658FE8. to i64
  %64 = add i64 %i_0000025636658FE8.47, 0
  %65 = inttoptr i64 %64 to i32*
  %R83 = load i32, i32* %65
  %R84 = sext i32 %R83 to i64
  %R85 = mul i64 %R84, 4
  %R86 = add i64 ptrtoint ([32 x i32]* @d_00000256366591A8. to i64), %R85
  %R8648 = inttoptr i64 %R86 to i32*
  %R864849 = ptrtoint i32* %R8648 to i64
  %66 = add i64 %R864849, 0
  %67 = inttoptr i64 %66 to i32*
  %R87 = load i32, i32* %67
  %buf_0000025636658D48.50 = ptrtoint i8** %buf_0000025636658D48. to i64
  %68 = add i64 %buf_0000025636658D48.50, 0
  %69 = inttoptr i64 %68 to i8**
  %R88 = load i8*, i8** %69
  call void @midline(i32 %R87, i8* %R88)
  %buf_0000025636658D48.51 = ptrtoint i8** %buf_0000025636658D48. to i64
  %70 = add i64 %buf_0000025636658D48.51, 0
  %71 = inttoptr i64 %70 to i8**
  %R89 = load i8*, i8** %71
  %R90 = ptrtoint i8* %R89 to i64
  %R91 = add i64 %R90, 3
  %R92 = inttoptr i64 %R91 to i8*
  %buf_0000025636658D48.52 = ptrtoint i8** %buf_0000025636658D48. to i64
  %72 = add i64 %buf_0000025636658D48.52, 0
  %73 = inttoptr i64 %72 to i8**
  store i8* %R92, i8** %73
  %buf_0000025636658D48.53 = ptrtoint i8** %buf_0000025636658D48. to i64
  %74 = add i64 %buf_0000025636658D48.53, 0
  %75 = inttoptr i64 %74 to i8**
  %R93 = load i8*, i8** %75
  %R9354 = ptrtoint i8* %R93 to i64
  %R94 = add i64 %R9354, 1
  %R9455 = inttoptr i64 %R94 to i8*
  %buf_0000025636658D48.56 = ptrtoint i8** %buf_0000025636658D48. to i64
  %76 = add i64 %buf_0000025636658D48.56, 0
  %77 = inttoptr i64 %76 to i8**
  store i8* %R9455, i8** %77
  %R9357 = ptrtoint i8* %R93 to i64
  %78 = add i64 %R9357, 0
  %79 = inttoptr i64 %78 to i8*
  store i8 32, i8* %79
  br label %L78

L78:                                              ; preds = %L77
  %i_0000025636658FE8.58 = ptrtoint i32* %i_0000025636658FE8. to i64
  %80 = add i64 %i_0000025636658FE8.58, 0
  %81 = inttoptr i64 %80 to i32*
  %R95 = load i32, i32* %81
  %R96 = sub i32 %R95, 1
  %i_0000025636658FE8.59 = ptrtoint i32* %i_0000025636658FE8. to i64
  %82 = add i64 %i_0000025636658FE8.59, 0
  %83 = inttoptr i64 %82 to i32*
  store i32 %R96, i32* %83
  br label %L76

L79:                                              ; preds = %L76
  %buf_0000025636658D48.60 = ptrtoint i8** %buf_0000025636658D48. to i64
  %84 = add i64 %buf_0000025636658D48.60, 0
  %85 = inttoptr i64 %84 to i8**
  %R97 = load i8*, i8** %85
  %R9761 = ptrtoint i8* %R97 to i64
  %R98 = add i64 %R9761, 1
  %R9862 = inttoptr i64 %R98 to i8*
  %buf_0000025636658D48.63 = ptrtoint i8** %buf_0000025636658D48. to i64
  %86 = add i64 %buf_0000025636658D48.63, 0
  %87 = inttoptr i64 %86 to i8**
  store i8* %R9862, i8** %87
  %R9764 = ptrtoint i8* %R97 to i64
  %88 = add i64 %R9764, 0
  %89 = inttoptr i64 %88 to i8*
  store i8 10, i8* %89
  %n_00000256366590C8.65 = ptrtoint i32* %n_00000256366590C8. to i64
  %90 = add i64 %n_00000256366590C8.65, 0
  %91 = inttoptr i64 %90 to i32*
  %R99 = load i32, i32* %91
  %R100 = sub i32 %R99, 1
  %i_0000025636658FE8.66 = ptrtoint i32* %i_0000025636658FE8. to i64
  %92 = add i64 %i_0000025636658FE8.66, 0
  %93 = inttoptr i64 %92 to i32*
  store i32 %R100, i32* %93
  br label %L80

L80:                                              ; preds = %L82, %L79
  %i_0000025636658FE8.67 = ptrtoint i32* %i_0000025636658FE8. to i64
  %94 = add i64 %i_0000025636658FE8.67, 0
  %95 = inttoptr i64 %94 to i32*
  %R101 = load i32, i32* %95
  %R102 = icmp sge i32 %R101, 0
  %R10268 = zext i1 %R102 to i32
  %cond69 = icmp ne i32 %R10268, 0
  br i1 %cond69, label %L81, label %L83

L81:                                              ; preds = %L80
  %i_0000025636658FE8.70 = ptrtoint i32* %i_0000025636658FE8. to i64
  %96 = add i64 %i_0000025636658FE8.70, 0
  %97 = inttoptr i64 %96 to i32*
  %R104 = load i32, i32* %97
  %R105 = sext i32 %R104 to i64
  %R106 = mul i64 %R105, 4
  %R107 = add i64 ptrtoint ([32 x i32]* @d_00000256366591A8. to i64), %R106
  %R10771 = inttoptr i64 %R107 to i32*
  %R1077172 = ptrtoint i32* %R10771 to i64
  %98 = add i64 %R1077172, 0
  %99 = inttoptr i64 %98 to i32*
  %R108 = load i32, i32* %99
  %buf_0000025636658D48.73 = ptrtoint i8** %buf_0000025636658D48. to i64
  %100 = add i64 %buf_0000025636658D48.73, 0
  %101 = inttoptr i64 %100 to i8**
  %R109 = load i8*, i8** %101
  call void @botline(i32 %R108, i8* %R109)
  %buf_0000025636658D48.74 = ptrtoint i8** %buf_0000025636658D48. to i64
  %102 = add i64 %buf_0000025636658D48.74, 0
  %103 = inttoptr i64 %102 to i8**
  %R110 = load i8*, i8** %103
  %R111 = ptrtoint i8* %R110 to i64
  %R112 = add i64 %R111, 3
  %R113 = inttoptr i64 %R112 to i8*
  %buf_0000025636658D48.75 = ptrtoint i8** %buf_0000025636658D48. to i64
  %104 = add i64 %buf_0000025636658D48.75, 0
  %105 = inttoptr i64 %104 to i8**
  store i8* %R113, i8** %105
  %buf_0000025636658D48.76 = ptrtoint i8** %buf_0000025636658D48. to i64
  %106 = add i64 %buf_0000025636658D48.76, 0
  %107 = inttoptr i64 %106 to i8**
  %R114 = load i8*, i8** %107
  %R11477 = ptrtoint i8* %R114 to i64
  %R115 = add i64 %R11477, 1
  %R11578 = inttoptr i64 %R115 to i8*
  %buf_0000025636658D48.79 = ptrtoint i8** %buf_0000025636658D48. to i64
  %108 = add i64 %buf_0000025636658D48.79, 0
  %109 = inttoptr i64 %108 to i8**
  store i8* %R11578, i8** %109
  %R11480 = ptrtoint i8* %R114 to i64
  %110 = add i64 %R11480, 0
  %111 = inttoptr i64 %110 to i8*
  store i8 32, i8* %111
  br label %L82

L82:                                              ; preds = %L81
  %i_0000025636658FE8.81 = ptrtoint i32* %i_0000025636658FE8. to i64
  %112 = add i64 %i_0000025636658FE8.81, 0
  %113 = inttoptr i64 %112 to i32*
  %R116 = load i32, i32* %113
  %R117 = sub i32 %R116, 1
  %i_0000025636658FE8.82 = ptrtoint i32* %i_0000025636658FE8. to i64
  %114 = add i64 %i_0000025636658FE8.82, 0
  %115 = inttoptr i64 %114 to i32*
  store i32 %R117, i32* %115
  br label %L80

L83:                                              ; preds = %L80
  %buf_0000025636658D48.83 = ptrtoint i8** %buf_0000025636658D48. to i64
  %116 = add i64 %buf_0000025636658D48.83, 0
  %117 = inttoptr i64 %116 to i8**
  %R118 = load i8*, i8** %117
  %R11884 = ptrtoint i8* %R118 to i64
  %R119 = add i64 %R11884, 1
  %R11985 = inttoptr i64 %R119 to i8*
  %buf_0000025636658D48.86 = ptrtoint i8** %buf_0000025636658D48. to i64
  %118 = add i64 %buf_0000025636658D48.86, 0
  %119 = inttoptr i64 %118 to i8**
  store i8* %R11985, i8** %119
  %R11887 = ptrtoint i8* %R118 to i64
  %120 = add i64 %R11887, 0
  %121 = inttoptr i64 %120 to i8*
  store i8 10, i8* %121
  %buf_0000025636658D48.88 = ptrtoint i8** %buf_0000025636658D48. to i64
  %122 = add i64 %buf_0000025636658D48.88, 0
  %123 = inttoptr i64 %122 to i8**
  %R120 = load i8*, i8** %123
  %R12089 = ptrtoint i8* %R120 to i64
  %124 = add i64 %R12089, 0
  %125 = inttoptr i64 %124 to i8*
  store i8 0, i8* %125
  br label %L84

L84:                                              ; preds = %L83
  ret void
}

define i32 @main() {
L85:
  %buf_0000025636659EC8. = alloca [160 x i8]
  %0 = alloca i32
  %R121 = bitcast [160 x i8]* %buf_0000025636659EC8. to i8*
  call void @print_led(i32 1234567, i8* %R121)
  %R123 = bitcast [160 x i8]* %buf_0000025636659EC8. to i8*
  %R124 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i8* %R123)
  store i32 0, i32* %0
  br label %L86

L86:                                              ; preds = %L85
  %1 = load i32, i32* %0
  ret i32 0
}

declare i32 @printf(i8*, ...)

attributes #0 = { argmemonly nounwind }
