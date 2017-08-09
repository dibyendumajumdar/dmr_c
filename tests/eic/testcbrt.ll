; ModuleID = 'out.bc'
source_filename = "dmrC"

%union.anno = type { [8 x i8] }

@B1 = private constant i32 715094163, align 4
@B2 = private constant i32 696219795, align 4
@C = private constant double 0x3FE15F1600000000, align 8
@D = private constant double 0xBFE691DE20000000, align 8
@E = private constant double 0x3FF6A0EA00000000, align 8
@F = private constant double 0x3FF9B6DB60000000, align 8
@G = private constant double 0x3FD6DB6DC0000000, align 8
@.str = private constant [13 x i8] c"Failed test\0A\00"
@.str.1 = private constant [13 x i8] c"Passed test\0A\00"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define internal double @cbrtl(double %ARG1) {
L0:
  %lt_0000026796F1C828. = alloca double
  %w_0000026796F1C748. = alloca double
  %s_0000026796F1C668. = alloca double
  %r_0000026796F1C588. = alloca double
  %sign_0000026796F1C908. = alloca i32
  %hx_0000026796F1C4A8. = alloca i32
  %ux_0000026796F1CE48. = alloca %union.anno
  %n0_0000026796F1CF28. = alloca i32
  %ut_0000026796F1CD68. = alloca %union.anno
  %x_0000026796F1C2E8. = alloca double
  %0 = alloca double
  %x_0000026796F1C2E8.1 = ptrtoint double* %x_0000026796F1C2E8. to i64
  %1 = add i64 %x_0000026796F1C2E8.1, 0
  %2 = inttoptr i64 %1 to double*
  store double %ARG1, double* %2
  %ut_0000026796F1CD68.2 = ptrtoint %union.anno* %ut_0000026796F1CD68. to i64
  %3 = add i64 %ut_0000026796F1CD68.2, 0
  %4 = inttoptr i64 %3 to double*
  store double 1.000000e+00, double* %4
  %ut_0000026796F1CD68.3 = ptrtoint %union.anno* %ut_0000026796F1CD68. to i64
  %5 = add i64 %ut_0000026796F1CD68.3, 0
  %6 = inttoptr i64 %5 to i32*
  %R2 = load i32, i32* %6
  %R3 = icmp eq i32 %R2, 0
  %R34 = zext i1 %R3 to i32
  %n0_0000026796F1CF28.5 = ptrtoint i32* %n0_0000026796F1CF28. to i64
  %7 = add i64 %n0_0000026796F1CF28.5, 0
  %8 = inttoptr i64 %7 to i32*
  store i32 %R34, i32* %8
  %ut_0000026796F1CD68.6 = ptrtoint %union.anno* %ut_0000026796F1CD68. to i64
  %9 = add i64 %ut_0000026796F1CD68.6, 0
  %10 = inttoptr i64 %9 to double*
  store double 0.000000e+00, double* %10
  %x_0000026796F1C2E8.7 = ptrtoint double* %x_0000026796F1C2E8. to i64
  %11 = add i64 %x_0000026796F1C2E8.7, 0
  %12 = inttoptr i64 %11 to double*
  %R5 = load double, double* %12
  %ux_0000026796F1CE48.8 = ptrtoint %union.anno* %ux_0000026796F1CE48. to i64
  %13 = add i64 %ux_0000026796F1CE48.8, 0
  %14 = inttoptr i64 %13 to double*
  store double %R5, double* %14
  %R6 = bitcast %union.anno* %ux_0000026796F1CE48. to i8*
  %R69 = ptrtoint i8* %R6 to i64
  %R7 = add i64 %R69, 0
  %R710 = inttoptr i64 %R7 to i32*
  %n0_0000026796F1CF28.11 = ptrtoint i32* %n0_0000026796F1CF28. to i64
  %15 = add i64 %n0_0000026796F1CF28.11, 0
  %16 = inttoptr i64 %15 to i32*
  %R8 = load i32, i32* %16
  %R9 = sext i32 %R8 to i64
  %R10 = mul i64 %R9, 4
  %R71012 = ptrtoint i32* %R710 to i64
  %R11 = add i64 %R71012, %R10
  %R1113 = inttoptr i64 %R11 to i32*
  %R111314 = ptrtoint i32* %R1113 to i64
  %17 = add i64 %R111314, 0
  %18 = inttoptr i64 %17 to i32*
  %R12 = load i32, i32* %18
  %hx_0000026796F1C4A8.15 = ptrtoint i32* %hx_0000026796F1C4A8. to i64
  %19 = add i64 %hx_0000026796F1C4A8.15, 0
  %20 = inttoptr i64 %19 to i32*
  store i32 %R12, i32* %20
  %hx_0000026796F1C4A8.16 = ptrtoint i32* %hx_0000026796F1C4A8. to i64
  %21 = add i64 %hx_0000026796F1C4A8.16, 0
  %22 = inttoptr i64 %21 to i32*
  %R14 = load i32, i32* %22
  %R16 = and i32 %R14, -2147483648
  %sign_0000026796F1C908.17 = ptrtoint i32* %sign_0000026796F1C908. to i64
  %23 = add i64 %sign_0000026796F1C908.17, 0
  %24 = inttoptr i64 %23 to i32*
  store i32 %R16, i32* %24
  %sign_0000026796F1C908.18 = ptrtoint i32* %sign_0000026796F1C908. to i64
  %25 = add i64 %sign_0000026796F1C908.18, 0
  %26 = inttoptr i64 %25 to i32*
  %R17 = load i32, i32* %26
  %hx_0000026796F1C4A8.19 = ptrtoint i32* %hx_0000026796F1C4A8. to i64
  %27 = add i64 %hx_0000026796F1C4A8.19, 0
  %28 = inttoptr i64 %27 to i32*
  %R18 = load i32, i32* %28
  %R20 = xor i32 %R18, %R17
  %hx_0000026796F1C4A8.20 = ptrtoint i32* %hx_0000026796F1C4A8. to i64
  %29 = add i64 %hx_0000026796F1C4A8.20, 0
  %30 = inttoptr i64 %29 to i32*
  store i32 %R20, i32* %30
  %hx_0000026796F1C4A8.21 = ptrtoint i32* %hx_0000026796F1C4A8. to i64
  %31 = add i64 %hx_0000026796F1C4A8.21, 0
  %32 = inttoptr i64 %31 to i32*
  %R22 = load i32, i32* %32
  %R23 = icmp sge i32 %R22, 2146435072
  %R2322 = zext i1 %R23 to i32
  %cond = icmp ne i32 %R2322, 0
  br i1 %cond, label %L1, label %L2

L1:                                               ; preds = %L0
  %x_0000026796F1C2E8.23 = ptrtoint double* %x_0000026796F1C2E8. to i64
  %33 = add i64 %x_0000026796F1C2E8.23, 0
  %34 = inttoptr i64 %33 to double*
  %R24 = load double, double* %34
  %x_0000026796F1C2E8.24 = ptrtoint double* %x_0000026796F1C2E8. to i64
  %35 = add i64 %x_0000026796F1C2E8.24, 0
  %36 = inttoptr i64 %35 to double*
  %R25 = load double, double* %36
  %R26 = fadd double %R24, %R25
  store double %R26, double* %0
  br label %L8

L2:                                               ; preds = %L0
  %hx_0000026796F1C4A8.25 = ptrtoint i32* %hx_0000026796F1C4A8. to i64
  %37 = add i64 %hx_0000026796F1C4A8.25, 0
  %38 = inttoptr i64 %37 to i32*
  %R28 = load i32, i32* %38
  %R30 = bitcast %union.anno* %ux_0000026796F1CE48. to i8*
  %R3026 = ptrtoint i8* %R30 to i64
  %R31 = add i64 %R3026, 0
  %R3127 = inttoptr i64 %R31 to i32*
  %n0_0000026796F1CF28.28 = ptrtoint i32* %n0_0000026796F1CF28. to i64
  %39 = add i64 %n0_0000026796F1CF28.28, 0
  %40 = inttoptr i64 %39 to i32*
  %R32 = load i32, i32* %40
  %R33 = sub i32 1, %R32
  %R3429 = sext i32 %R33 to i64
  %R35 = mul i64 %R3429, 4
  %R312730 = ptrtoint i32* %R3127 to i64
  %R36 = add i64 %R312730, %R35
  %R3631 = inttoptr i64 %R36 to i32*
  %R363132 = ptrtoint i32* %R3631 to i64
  %41 = add i64 %R363132, 0
  %42 = inttoptr i64 %41 to i32*
  %R37 = load i32, i32* %42
  %R38 = or i32 %R28, %R37
  %R39 = icmp eq i32 %R38, 0
  %R3933 = zext i1 %R39 to i32
  %cond34 = icmp ne i32 %R3933, 0
  br i1 %cond34, label %L3, label %L4

L3:                                               ; preds = %L2
  %ux_0000026796F1CE48.35 = ptrtoint %union.anno* %ux_0000026796F1CE48. to i64
  %43 = add i64 %ux_0000026796F1CE48.35, 0
  %44 = inttoptr i64 %43 to double*
  %R40 = load double, double* %44
  store double %R40, double* %0
  br label %L8

L4:                                               ; preds = %L2
  %hx_0000026796F1C4A8.36 = ptrtoint i32* %hx_0000026796F1C4A8. to i64
  %45 = add i64 %hx_0000026796F1C4A8.36, 0
  %46 = inttoptr i64 %45 to i32*
  %R41 = load i32, i32* %46
  %R43 = bitcast %union.anno* %ux_0000026796F1CE48. to i8*
  %R4337 = ptrtoint i8* %R43 to i64
  %R44 = add i64 %R4337, 0
  %R4438 = inttoptr i64 %R44 to i32*
  %n0_0000026796F1CF28.39 = ptrtoint i32* %n0_0000026796F1CF28. to i64
  %47 = add i64 %n0_0000026796F1CF28.39, 0
  %48 = inttoptr i64 %47 to i32*
  %R45 = load i32, i32* %48
  %R46 = sext i32 %R45 to i64
  %R47 = mul i64 %R46, 4
  %R443840 = ptrtoint i32* %R4438 to i64
  %R48 = add i64 %R443840, %R47
  %R4841 = inttoptr i64 %R48 to i32*
  %R484142 = ptrtoint i32* %R4841 to i64
  %49 = add i64 %R484142, 0
  %50 = inttoptr i64 %49 to i32*
  store i32 %R41, i32* %50
  %hx_0000026796F1C4A8.43 = ptrtoint i32* %hx_0000026796F1C4A8. to i64
  %51 = add i64 %hx_0000026796F1C4A8.43, 0
  %52 = inttoptr i64 %51 to i32*
  %R49 = load i32, i32* %52
  %R50 = icmp slt i32 %R49, 1048576
  %R5044 = zext i1 %R50 to i32
  %cond45 = icmp ne i32 %R5044, 0
  br i1 %cond45, label %L5, label %L6

L5:                                               ; preds = %L4
  %R51 = bitcast %union.anno* %ut_0000026796F1CD68. to i8*
  %R5146 = ptrtoint i8* %R51 to i64
  %R52 = add i64 %R5146, 0
  %R5247 = inttoptr i64 %R52 to i32*
  %n0_0000026796F1CF28.48 = ptrtoint i32* %n0_0000026796F1CF28. to i64
  %53 = add i64 %n0_0000026796F1CF28.48, 0
  %54 = inttoptr i64 %53 to i32*
  %R53 = load i32, i32* %54
  %R54 = sext i32 %R53 to i64
  %R55 = mul i64 %R54, 4
  %R524749 = ptrtoint i32* %R5247 to i64
  %R56 = add i64 %R524749, %R55
  %R5650 = inttoptr i64 %R56 to i32*
  %R565051 = ptrtoint i32* %R5650 to i64
  %55 = add i64 %R565051, 0
  %56 = inttoptr i64 %55 to i32*
  store i32 1129316352, i32* %56
  %x_0000026796F1C2E8.52 = ptrtoint double* %x_0000026796F1C2E8. to i64
  %57 = add i64 %x_0000026796F1C2E8.52, 0
  %58 = inttoptr i64 %57 to double*
  %R57 = load double, double* %58
  %ut_0000026796F1CD68.53 = ptrtoint %union.anno* %ut_0000026796F1CD68. to i64
  %59 = add i64 %ut_0000026796F1CD68.53, 0
  %60 = inttoptr i64 %59 to double*
  %R58 = load double, double* %60
  %R60 = fmul double %R58, %R57
  %ut_0000026796F1CD68.54 = ptrtoint %union.anno* %ut_0000026796F1CD68. to i64
  %61 = add i64 %ut_0000026796F1CD68.54, 0
  %62 = inttoptr i64 %61 to double*
  store double %R60, double* %62
  %R62 = bitcast %union.anno* %ut_0000026796F1CD68. to i8*
  %R6255 = ptrtoint i8* %R62 to i64
  %R63 = add i64 %R6255, 0
  %R6356 = inttoptr i64 %R63 to i32*
  %n0_0000026796F1CF28.57 = ptrtoint i32* %n0_0000026796F1CF28. to i64
  %63 = add i64 %n0_0000026796F1CF28.57, 0
  %64 = inttoptr i64 %63 to i32*
  %R64 = load i32, i32* %64
  %R65 = sext i32 %R64 to i64
  %R66 = mul i64 %R65, 4
  %R635658 = ptrtoint i32* %R6356 to i64
  %R67 = add i64 %R635658, %R66
  %R6759 = inttoptr i64 %R67 to i32*
  %R675960 = ptrtoint i32* %R6759 to i64
  %65 = add i64 %R675960, 0
  %66 = inttoptr i64 %65 to i32*
  %R68 = load i32, i32* %66
  %R6961 = udiv i32 %R68, 3
  %R70 = add i32 %R6961, 696219795
  %R71 = bitcast %union.anno* %ut_0000026796F1CD68. to i8*
  %R7162 = ptrtoint i8* %R71 to i64
  %R72 = add i64 %R7162, 0
  %R7263 = inttoptr i64 %R72 to i32*
  %n0_0000026796F1CF28.64 = ptrtoint i32* %n0_0000026796F1CF28. to i64
  %67 = add i64 %n0_0000026796F1CF28.64, 0
  %68 = inttoptr i64 %67 to i32*
  %R73 = load i32, i32* %68
  %R74 = sext i32 %R73 to i64
  %R75 = mul i64 %R74, 4
  %R726365 = ptrtoint i32* %R7263 to i64
  %R76 = add i64 %R726365, %R75
  %R7666 = inttoptr i64 %R76 to i32*
  %R766667 = ptrtoint i32* %R7666 to i64
  %69 = add i64 %R766667, 0
  %70 = inttoptr i64 %69 to i32*
  store i32 %R70, i32* %70
  br label %L7

L6:                                               ; preds = %L4
  %hx_0000026796F1C4A8.68 = ptrtoint i32* %hx_0000026796F1C4A8. to i64
  %71 = add i64 %hx_0000026796F1C4A8.68, 0
  %72 = inttoptr i64 %71 to i32*
  %R77 = load i32, i32* %72
  %R78 = sdiv i32 %R77, 3
  %R80 = add i32 %R78, 715094163
  %R81 = bitcast %union.anno* %ut_0000026796F1CD68. to i8*
  %R8169 = ptrtoint i8* %R81 to i64
  %R82 = add i64 %R8169, 0
  %R8270 = inttoptr i64 %R82 to i32*
  %n0_0000026796F1CF28.71 = ptrtoint i32* %n0_0000026796F1CF28. to i64
  %73 = add i64 %n0_0000026796F1CF28.71, 0
  %74 = inttoptr i64 %73 to i32*
  %R83 = load i32, i32* %74
  %R84 = sext i32 %R83 to i64
  %R85 = mul i64 %R84, 4
  %R827072 = ptrtoint i32* %R8270 to i64
  %R86 = add i64 %R827072, %R85
  %R8673 = inttoptr i64 %R86 to i32*
  %R867374 = ptrtoint i32* %R8673 to i64
  %75 = add i64 %R867374, 0
  %76 = inttoptr i64 %75 to i32*
  store i32 %R80, i32* %76
  br label %L7

L7:                                               ; preds = %L6, %L5
  %ut_0000026796F1CD68.75 = ptrtoint %union.anno* %ut_0000026796F1CD68. to i64
  %77 = add i64 %ut_0000026796F1CD68.75, 0
  %78 = inttoptr i64 %77 to double*
  %R87 = load double, double* %78
  %ut_0000026796F1CD68.76 = ptrtoint %union.anno* %ut_0000026796F1CD68. to i64
  %79 = add i64 %ut_0000026796F1CD68.76, 0
  %80 = inttoptr i64 %79 to double*
  %R88 = load double, double* %80
  %R89 = fmul double %R87, %R88
  %ux_0000026796F1CE48.77 = ptrtoint %union.anno* %ux_0000026796F1CE48. to i64
  %81 = add i64 %ux_0000026796F1CE48.77, 0
  %82 = inttoptr i64 %81 to double*
  %R90 = load double, double* %82
  %R91 = fdiv double %R89, %R90
  %r_0000026796F1C588.78 = ptrtoint double* %r_0000026796F1C588. to i64
  %83 = add i64 %r_0000026796F1C588.78, 0
  %84 = inttoptr i64 %83 to double*
  store double %R91, double* %84
  %r_0000026796F1C588.79 = ptrtoint double* %r_0000026796F1C588. to i64
  %85 = add i64 %r_0000026796F1C588.79, 0
  %86 = inttoptr i64 %85 to double*
  %R93 = load double, double* %86
  %ut_0000026796F1CD68.80 = ptrtoint %union.anno* %ut_0000026796F1CD68. to i64
  %87 = add i64 %ut_0000026796F1CD68.80, 0
  %88 = inttoptr i64 %87 to double*
  %R94 = load double, double* %88
  %R95 = fmul double %R93, %R94
  %R96 = fadd double 0x3FE15F1600000000, %R95
  %s_0000026796F1C668.81 = ptrtoint double* %s_0000026796F1C668. to i64
  %89 = add i64 %s_0000026796F1C668.81, 0
  %90 = inttoptr i64 %89 to double*
  store double %R96, double* %90
  %s_0000026796F1C668.82 = ptrtoint double* %s_0000026796F1C668. to i64
  %91 = add i64 %s_0000026796F1C668.82, 0
  %92 = inttoptr i64 %91 to double*
  %R99 = load double, double* %92
  %R101 = fadd double %R99, 0x3FF6A0EA00000000
  %s_0000026796F1C668.83 = ptrtoint double* %s_0000026796F1C668. to i64
  %93 = add i64 %s_0000026796F1C668.83, 0
  %94 = inttoptr i64 %93 to double*
  %R103 = load double, double* %94
  %R104 = fdiv double 0xBFE691DE20000000, %R103
  %R105 = fadd double %R101, %R104
  %R106 = fdiv double 0x3FF9B6DB60000000, %R105
  %R107 = fadd double 0x3FD6DB6DC0000000, %R106
  %ut_0000026796F1CD68.84 = ptrtoint %union.anno* %ut_0000026796F1CD68. to i64
  %95 = add i64 %ut_0000026796F1CD68.84, 0
  %96 = inttoptr i64 %95 to double*
  %R108 = load double, double* %96
  %R110 = fmul double %R108, %R107
  %ut_0000026796F1CD68.85 = ptrtoint %union.anno* %ut_0000026796F1CD68. to i64
  %97 = add i64 %ut_0000026796F1CD68.85, 0
  %98 = inttoptr i64 %97 to double*
  store double %R110, double* %98
  %R112 = bitcast %union.anno* %ut_0000026796F1CD68. to i8*
  %R11286 = ptrtoint i8* %R112 to i64
  %R113 = add i64 %R11286, 0
  %R11387 = inttoptr i64 %R113 to i32*
  %n0_0000026796F1CF28.88 = ptrtoint i32* %n0_0000026796F1CF28. to i64
  %99 = add i64 %n0_0000026796F1CF28.88, 0
  %100 = inttoptr i64 %99 to i32*
  %R114 = load i32, i32* %100
  %R115 = sub i32 1, %R114
  %R116 = sext i32 %R115 to i64
  %R117 = mul i64 %R116, 4
  %R1138789 = ptrtoint i32* %R11387 to i64
  %R118 = add i64 %R1138789, %R117
  %R11890 = inttoptr i64 %R118 to i32*
  %R1189091 = ptrtoint i32* %R11890 to i64
  %101 = add i64 %R1189091, 0
  %102 = inttoptr i64 %101 to i32*
  store i32 0, i32* %102
  %R119 = bitcast %union.anno* %ut_0000026796F1CD68. to i8*
  %R11992 = ptrtoint i8* %R119 to i64
  %R120 = add i64 %R11992, 0
  %R12093 = inttoptr i64 %R120 to i32*
  %n0_0000026796F1CF28.94 = ptrtoint i32* %n0_0000026796F1CF28. to i64
  %103 = add i64 %n0_0000026796F1CF28.94, 0
  %104 = inttoptr i64 %103 to i32*
  %R121 = load i32, i32* %104
  %R122 = sext i32 %R121 to i64
  %R123 = mul i64 %R122, 4
  %R1209395 = ptrtoint i32* %R12093 to i64
  %R124 = add i64 %R1209395, %R123
  %R12496 = inttoptr i64 %R124 to i32*
  %R1249697 = ptrtoint i32* %R12496 to i64
  %105 = add i64 %R1249697, 0
  %106 = inttoptr i64 %105 to i32*
  %R125 = load i32, i32* %106
  %R127 = add i32 %R125, 1
  %R1249698 = ptrtoint i32* %R12496 to i64
  %107 = add i64 %R1249698, 0
  %108 = inttoptr i64 %107 to i32*
  store i32 %R127, i32* %108
  %ut_0000026796F1CD68.99 = ptrtoint %union.anno* %ut_0000026796F1CD68. to i64
  %109 = add i64 %ut_0000026796F1CD68.99, 0
  %110 = inttoptr i64 %109 to double*
  %R129 = load double, double* %110
  %ut_0000026796F1CD68.100 = ptrtoint %union.anno* %ut_0000026796F1CD68. to i64
  %111 = add i64 %ut_0000026796F1CD68.100, 0
  %112 = inttoptr i64 %111 to double*
  %R130 = load double, double* %112
  %R131 = fmul double %R129, %R130
  %s_0000026796F1C668.101 = ptrtoint double* %s_0000026796F1C668. to i64
  %113 = add i64 %s_0000026796F1C668.101, 0
  %114 = inttoptr i64 %113 to double*
  store double %R131, double* %114
  %ux_0000026796F1CE48.102 = ptrtoint %union.anno* %ux_0000026796F1CE48. to i64
  %115 = add i64 %ux_0000026796F1CE48.102, 0
  %116 = inttoptr i64 %115 to double*
  %R132 = load double, double* %116
  %s_0000026796F1C668.103 = ptrtoint double* %s_0000026796F1C668. to i64
  %117 = add i64 %s_0000026796F1C668.103, 0
  %118 = inttoptr i64 %117 to double*
  %R133 = load double, double* %118
  %R134 = fdiv double %R132, %R133
  %r_0000026796F1C588.104 = ptrtoint double* %r_0000026796F1C588. to i64
  %119 = add i64 %r_0000026796F1C588.104, 0
  %120 = inttoptr i64 %119 to double*
  store double %R134, double* %120
  %ut_0000026796F1CD68.105 = ptrtoint %union.anno* %ut_0000026796F1CD68. to i64
  %121 = add i64 %ut_0000026796F1CD68.105, 0
  %122 = inttoptr i64 %121 to double*
  %R135 = load double, double* %122
  %ut_0000026796F1CD68.106 = ptrtoint %union.anno* %ut_0000026796F1CD68. to i64
  %123 = add i64 %ut_0000026796F1CD68.106, 0
  %124 = inttoptr i64 %123 to double*
  %R136 = load double, double* %124
  %R137 = fadd double %R135, %R136
  %w_0000026796F1C748.107 = ptrtoint double* %w_0000026796F1C748. to i64
  %125 = add i64 %w_0000026796F1C748.107, 0
  %126 = inttoptr i64 %125 to double*
  store double %R137, double* %126
  %r_0000026796F1C588.108 = ptrtoint double* %r_0000026796F1C588. to i64
  %127 = add i64 %r_0000026796F1C588.108, 0
  %128 = inttoptr i64 %127 to double*
  %R138 = load double, double* %128
  %ut_0000026796F1CD68.109 = ptrtoint %union.anno* %ut_0000026796F1CD68. to i64
  %129 = add i64 %ut_0000026796F1CD68.109, 0
  %130 = inttoptr i64 %129 to double*
  %R139 = load double, double* %130
  %R140 = fsub double %R138, %R139
  %w_0000026796F1C748.110 = ptrtoint double* %w_0000026796F1C748. to i64
  %131 = add i64 %w_0000026796F1C748.110, 0
  %132 = inttoptr i64 %131 to double*
  %R141 = load double, double* %132
  %r_0000026796F1C588.111 = ptrtoint double* %r_0000026796F1C588. to i64
  %133 = add i64 %r_0000026796F1C588.111, 0
  %134 = inttoptr i64 %133 to double*
  %R142 = load double, double* %134
  %R143 = fadd double %R141, %R142
  %R144 = fdiv double %R140, %R143
  %r_0000026796F1C588.112 = ptrtoint double* %r_0000026796F1C588. to i64
  %135 = add i64 %r_0000026796F1C588.112, 0
  %136 = inttoptr i64 %135 to double*
  store double %R144, double* %136
  %ut_0000026796F1CD68.113 = ptrtoint %union.anno* %ut_0000026796F1CD68. to i64
  %137 = add i64 %ut_0000026796F1CD68.113, 0
  %138 = inttoptr i64 %137 to double*
  %R145 = load double, double* %138
  %ut_0000026796F1CD68.114 = ptrtoint %union.anno* %ut_0000026796F1CD68. to i64
  %139 = add i64 %ut_0000026796F1CD68.114, 0
  %140 = inttoptr i64 %139 to double*
  %R146 = load double, double* %140
  %r_0000026796F1C588.115 = ptrtoint double* %r_0000026796F1C588. to i64
  %141 = add i64 %r_0000026796F1C588.115, 0
  %142 = inttoptr i64 %141 to double*
  %R147 = load double, double* %142
  %R148 = fmul double %R146, %R147
  %R149 = fadd double %R145, %R148
  %ut_0000026796F1CD68.116 = ptrtoint %union.anno* %ut_0000026796F1CD68. to i64
  %143 = add i64 %ut_0000026796F1CD68.116, 0
  %144 = inttoptr i64 %143 to double*
  store double %R149, double* %144
  %sign_0000026796F1C908.117 = ptrtoint i32* %sign_0000026796F1C908. to i64
  %145 = add i64 %sign_0000026796F1C908.117, 0
  %146 = inttoptr i64 %145 to i32*
  %R150 = load i32, i32* %146
  %R151 = bitcast %union.anno* %ut_0000026796F1CD68. to i8*
  %R151118 = ptrtoint i8* %R151 to i64
  %R152 = add i64 %R151118, 0
  %R152119 = inttoptr i64 %R152 to i32*
  %n0_0000026796F1CF28.120 = ptrtoint i32* %n0_0000026796F1CF28. to i64
  %147 = add i64 %n0_0000026796F1CF28.120, 0
  %148 = inttoptr i64 %147 to i32*
  %R153 = load i32, i32* %148
  %R154 = sext i32 %R153 to i64
  %R155 = mul i64 %R154, 4
  %R152119121 = ptrtoint i32* %R152119 to i64
  %R156 = add i64 %R152119121, %R155
  %R156122 = inttoptr i64 %R156 to i32*
  %R156122123 = ptrtoint i32* %R156122 to i64
  %149 = add i64 %R156122123, 0
  %150 = inttoptr i64 %149 to i32*
  %R157 = load i32, i32* %150
  %R159 = or i32 %R157, %R150
  %R156122124 = ptrtoint i32* %R156122 to i64
  %151 = add i64 %R156122124, 0
  %152 = inttoptr i64 %151 to i32*
  store i32 %R159, i32* %152
  %ut_0000026796F1CD68.125 = ptrtoint %union.anno* %ut_0000026796F1CD68. to i64
  %153 = add i64 %ut_0000026796F1CD68.125, 0
  %154 = inttoptr i64 %153 to double*
  %R161 = load double, double* %154
  %lt_0000026796F1C828.126 = ptrtoint double* %lt_0000026796F1C828. to i64
  %155 = add i64 %lt_0000026796F1C828.126, 0
  %156 = inttoptr i64 %155 to double*
  store double %R161, double* %156
  %lt_0000026796F1C828.127 = ptrtoint double* %lt_0000026796F1C828. to i64
  %157 = add i64 %lt_0000026796F1C828.127, 0
  %158 = inttoptr i64 %157 to double*
  %R162 = load double, double* %158
  %x_0000026796F1C2E8.128 = ptrtoint double* %x_0000026796F1C2E8. to i64
  %159 = add i64 %x_0000026796F1C2E8.128, 0
  %160 = inttoptr i64 %159 to double*
  %R163 = load double, double* %160
  %lt_0000026796F1C828.129 = ptrtoint double* %lt_0000026796F1C828. to i64
  %161 = add i64 %lt_0000026796F1C828.129, 0
  %162 = inttoptr i64 %161 to double*
  %R164 = load double, double* %162
  %lt_0000026796F1C828.130 = ptrtoint double* %lt_0000026796F1C828. to i64
  %163 = add i64 %lt_0000026796F1C828.130, 0
  %164 = inttoptr i64 %163 to double*
  %R165 = load double, double* %164
  %R166 = fmul double %R164, %R165
  %R167 = fdiv double %R163, %R166
  %R168 = fsub double %R162, %R167
  %R170 = fmul double %R168, 0x3FD5555555555555
  %lt_0000026796F1C828.131 = ptrtoint double* %lt_0000026796F1C828. to i64
  %165 = add i64 %lt_0000026796F1C828.131, 0
  %166 = inttoptr i64 %165 to double*
  %R171 = load double, double* %166
  %R173 = fsub double %R171, %R170
  %lt_0000026796F1C828.132 = ptrtoint double* %lt_0000026796F1C828. to i64
  %167 = add i64 %lt_0000026796F1C828.132, 0
  %168 = inttoptr i64 %167 to double*
  store double %R173, double* %168
  %lt_0000026796F1C828.133 = ptrtoint double* %lt_0000026796F1C828. to i64
  %169 = add i64 %lt_0000026796F1C828.133, 0
  %170 = inttoptr i64 %169 to double*
  %R175 = load double, double* %170
  store double %R175, double* %0
  br label %L8

L8:                                               ; preds = %L7, %L3, %L1
  %171 = load double, double* %0
  ret double %171
}

define i32 @main() {
L9:
  %0 = alloca i32
  %R177 = call double @cbrtl(double 2.700000e+01)
  %R179 = fadd double %R177, 5.000000e-01
  %R180 = fptosi double %R179 to i32
  %R181 = icmp ne i32 %R180, 3
  %R1811 = zext i1 %R181 to i32
  %cond = icmp ne i32 %R1811, 0
  br i1 %cond, label %L10, label %L11

L10:                                              ; preds = %L9
  %R183 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0))
  br label %L12

L11:                                              ; preds = %L9
  %R185 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i64 0, i64 0))
  br label %L12

L12:                                              ; preds = %L11, %L10
  store i32 0, i32* %0
  br label %L13

L13:                                              ; preds = %L12
  %1 = load i32, i32* %0
  ret i32 0
}

declare i32 @printf(i8*, ...)

attributes #0 = { argmemonly nounwind }
