; ModuleID = 'out.bc'
source_filename = "sparse"

%union.anno = type { [8 x i8] }

@B1 = private constant i32 715094163, align 4
@B2 = private constant i32 696219795, align 4
@C = private constant double 0x3FE15F1600000000, align 8
@D = private constant double 0xBFE691DE20000000, align 8
@E = private constant double 0x3FF6A0EA00000000, align 8
@F = private constant double 0x3FF9B6DB60000000, align 8
@G = private constant double 0x3FD6DB6DC0000000, align 8
@.str = private constant [4 x i8] c"%f\0A\00"
@.str.1 = private constant [13 x i8] c"Failed test\0A\00"
@.str.2 = private constant [13 x i8] c"Passed test\0A\00"

define internal double @cbrtl(double %ARG1) {
L0:
  %lt_0000018134FCBB68 = alloca double
  %w_0000018134FCBA88 = alloca double
  %s_0000018134FCB9A8 = alloca double
  %r_0000018134FCB8C8 = alloca double
  %sign_0000018134FCBC48 = alloca i32
  %hx_0000018134FCB7E8 = alloca i32
  %ux_0000018134FCC188 = alloca %union.anno
  %n0_0000018134FCC268 = alloca i32
  %ut_0000018134FCC0A8 = alloca %union.anno
  %x_0000018134FCB628 = alloca double
  %0 = alloca double
  %1 = bitcast double* %x_0000018134FCB628 to i8*
  %2 = getelementptr inbounds i8, i8* %1, i64 0
  %3 = bitcast i8* %2 to double*
  store double %ARG1, double* %3
  %4 = bitcast %union.anno* %ut_0000018134FCC0A8 to double*
  %5 = bitcast double* %4 to i8*
  %6 = getelementptr inbounds i8, i8* %5, i64 0
  %7 = bitcast i8* %6 to double*
  store double 1.000000e+00, double* %7
  %8 = bitcast %union.anno* %ut_0000018134FCC0A8 to i32*
  %9 = bitcast i32* %8 to i8*
  %10 = getelementptr inbounds i8, i8* %9, i64 0
  %11 = bitcast i8* %10 to i32*
  %load_target = load i32, i32* %11
  %R3 = icmp eq i32 %load_target, 0
  %R31 = zext i1 %R3 to i32
  %12 = bitcast i32* %n0_0000018134FCC268 to i8*
  %13 = getelementptr inbounds i8, i8* %12, i64 0
  %14 = bitcast i8* %13 to i32*
  store i32 %R31, i32* %14
  %15 = bitcast %union.anno* %ut_0000018134FCC0A8 to double*
  %16 = bitcast double* %15 to i8*
  %17 = getelementptr inbounds i8, i8* %16, i64 0
  %18 = bitcast i8* %17 to double*
  store double 0.000000e+00, double* %18
  %19 = bitcast double* %x_0000018134FCB628 to i8*
  %20 = getelementptr inbounds i8, i8* %19, i64 0
  %21 = bitcast i8* %20 to double*
  %load_target2 = load double, double* %21
  %22 = bitcast %union.anno* %ux_0000018134FCC188 to double*
  %23 = bitcast double* %22 to i8*
  %24 = getelementptr inbounds i8, i8* %23, i64 0
  %25 = bitcast i8* %24 to double*
  store double %load_target2, double* %25
  %R6 = bitcast %union.anno* %ux_0000018134FCC188 to i8*
  %26 = getelementptr inbounds i8, i8* %R6, i32 0
  %27 = bitcast i32* %n0_0000018134FCC268 to i8*
  %28 = getelementptr inbounds i8, i8* %27, i64 0
  %29 = bitcast i8* %28 to i32*
  %load_target3 = load i32, i32* %29
  %R9 = sext i32 %load_target3 to i64
  %R10 = mul i64 %R9, 4
  %30 = getelementptr inbounds i8, i8* %26, i64 %R10
  %31 = bitcast i8* %30 to i32*
  %32 = bitcast i32* %31 to i8*
  %33 = getelementptr inbounds i8, i8* %32, i64 0
  %34 = bitcast i8* %33 to i32*
  %load_target4 = load i32, i32* %34
  %35 = bitcast i32* %hx_0000018134FCB7E8 to i8*
  %36 = getelementptr inbounds i8, i8* %35, i64 0
  %37 = bitcast i8* %36 to i32*
  store i32 %load_target4, i32* %37
  %38 = bitcast i32* %hx_0000018134FCB7E8 to i8*
  %39 = getelementptr inbounds i8, i8* %38, i64 0
  %40 = bitcast i8* %39 to i32*
  %load_target5 = load i32, i32* %40
  %R16 = and i32 %load_target5, -2147483648
  %41 = bitcast i32* %sign_0000018134FCBC48 to i8*
  %42 = getelementptr inbounds i8, i8* %41, i64 0
  %43 = bitcast i8* %42 to i32*
  store i32 %R16, i32* %43
  %44 = bitcast i32* %sign_0000018134FCBC48 to i8*
  %45 = getelementptr inbounds i8, i8* %44, i64 0
  %46 = bitcast i8* %45 to i32*
  %load_target6 = load i32, i32* %46
  %47 = bitcast i32* %hx_0000018134FCB7E8 to i8*
  %48 = getelementptr inbounds i8, i8* %47, i64 0
  %49 = bitcast i8* %48 to i32*
  %load_target7 = load i32, i32* %49
  %R20 = xor i32 %load_target7, %load_target6
  %50 = bitcast i32* %hx_0000018134FCB7E8 to i8*
  %51 = getelementptr inbounds i8, i8* %50, i64 0
  %52 = bitcast i8* %51 to i32*
  store i32 %R20, i32* %52
  %53 = bitcast i32* %hx_0000018134FCB7E8 to i8*
  %54 = getelementptr inbounds i8, i8* %53, i64 0
  %55 = bitcast i8* %54 to i32*
  %load_target8 = load i32, i32* %55
  %R23 = icmp sge i32 %load_target8, 2146435072
  %R239 = zext i1 %R23 to i32
  %cond = icmp ne i32 %R239, 0
  br i1 %cond, label %L1, label %L2

L1:                                               ; preds = %L0
  %56 = bitcast double* %x_0000018134FCB628 to i8*
  %57 = getelementptr inbounds i8, i8* %56, i64 0
  %58 = bitcast i8* %57 to double*
  %load_target10 = load double, double* %58
  %59 = bitcast double* %x_0000018134FCB628 to i8*
  %60 = getelementptr inbounds i8, i8* %59, i64 0
  %61 = bitcast i8* %60 to double*
  %load_target11 = load double, double* %61
  %R26 = fadd double %load_target10, %load_target11
  br label %L8

L2:                                               ; preds = %L0
  %62 = bitcast i32* %hx_0000018134FCB7E8 to i8*
  %63 = getelementptr inbounds i8, i8* %62, i64 0
  %64 = bitcast i8* %63 to i32*
  %load_target12 = load i32, i32* %64
  %R30 = bitcast %union.anno* %ux_0000018134FCC188 to i8*
  %65 = getelementptr inbounds i8, i8* %R30, i32 0
  %66 = bitcast i32* %n0_0000018134FCC268 to i8*
  %67 = getelementptr inbounds i8, i8* %66, i64 0
  %68 = bitcast i8* %67 to i32*
  %load_target13 = load i32, i32* %68
  %R33 = sub i32 1, %load_target13
  %R34 = sext i32 %R33 to i64
  %R35 = mul i64 %R34, 4
  %69 = getelementptr inbounds i8, i8* %65, i64 %R35
  %70 = bitcast i8* %69 to i32*
  %71 = bitcast i32* %70 to i8*
  %72 = getelementptr inbounds i8, i8* %71, i64 0
  %73 = bitcast i8* %72 to i32*
  %load_target14 = load i32, i32* %73
  %R38 = or i32 %load_target12, %load_target14
  %R39 = icmp eq i32 %R38, 0
  %R3915 = zext i1 %R39 to i32
  %cond16 = icmp ne i32 %R3915, 0
  br i1 %cond16, label %L3, label %L4

L3:                                               ; preds = %L2
  %74 = bitcast %union.anno* %ux_0000018134FCC188 to double*
  %75 = bitcast double* %74 to i8*
  %76 = getelementptr inbounds i8, i8* %75, i64 0
  %77 = bitcast i8* %76 to double*
  %load_target17 = load double, double* %77
  br label %L8

L4:                                               ; preds = %L2
  %78 = bitcast i32* %hx_0000018134FCB7E8 to i8*
  %79 = getelementptr inbounds i8, i8* %78, i64 0
  %80 = bitcast i8* %79 to i32*
  %load_target18 = load i32, i32* %80
  %R43 = bitcast %union.anno* %ux_0000018134FCC188 to i8*
  %81 = getelementptr inbounds i8, i8* %R43, i32 0
  %82 = bitcast i32* %n0_0000018134FCC268 to i8*
  %83 = getelementptr inbounds i8, i8* %82, i64 0
  %84 = bitcast i8* %83 to i32*
  %load_target19 = load i32, i32* %84
  %R46 = sext i32 %load_target19 to i64
  %R47 = mul i64 %R46, 4
  %85 = getelementptr inbounds i8, i8* %81, i64 %R47
  %86 = bitcast i8* %85 to i32*
  %87 = bitcast i32* %86 to i8*
  %88 = getelementptr inbounds i8, i8* %87, i64 0
  %89 = bitcast i8* %88 to i32*
  store i32 %load_target18, i32* %89
  %90 = bitcast i32* %hx_0000018134FCB7E8 to i8*
  %91 = getelementptr inbounds i8, i8* %90, i64 0
  %92 = bitcast i8* %91 to i32*
  %load_target20 = load i32, i32* %92
  %R50 = icmp slt i32 %load_target20, 1048576
  %R5021 = zext i1 %R50 to i32
  %cond22 = icmp ne i32 %R5021, 0
  br i1 %cond22, label %L5, label %L6

L5:                                               ; preds = %L4
  %R51 = bitcast %union.anno* %ut_0000018134FCC0A8 to i8*
  %93 = getelementptr inbounds i8, i8* %R51, i32 0
  %94 = bitcast i32* %n0_0000018134FCC268 to i8*
  %95 = getelementptr inbounds i8, i8* %94, i64 0
  %96 = bitcast i8* %95 to i32*
  %load_target23 = load i32, i32* %96
  %R54 = sext i32 %load_target23 to i64
  %R55 = mul i64 %R54, 4
  %97 = getelementptr inbounds i8, i8* %93, i64 %R55
  %98 = bitcast i8* %97 to i32*
  %99 = bitcast i32* %98 to i8*
  %100 = getelementptr inbounds i8, i8* %99, i64 0
  %101 = bitcast i8* %100 to i32*
  store i32 1129316352, i32* %101
  %102 = bitcast double* %x_0000018134FCB628 to i8*
  %103 = getelementptr inbounds i8, i8* %102, i64 0
  %104 = bitcast i8* %103 to double*
  %load_target24 = load double, double* %104
  %105 = bitcast %union.anno* %ut_0000018134FCC0A8 to double*
  %106 = bitcast double* %105 to i8*
  %107 = getelementptr inbounds i8, i8* %106, i64 0
  %108 = bitcast i8* %107 to double*
  %load_target25 = load double, double* %108
  %R60 = fmul double %load_target25, %load_target24
  %109 = bitcast %union.anno* %ut_0000018134FCC0A8 to double*
  %110 = bitcast double* %109 to i8*
  %111 = getelementptr inbounds i8, i8* %110, i64 0
  %112 = bitcast i8* %111 to double*
  store double %R60, double* %112
  %R62 = bitcast %union.anno* %ut_0000018134FCC0A8 to i8*
  %113 = getelementptr inbounds i8, i8* %R62, i32 0
  %114 = bitcast i32* %n0_0000018134FCC268 to i8*
  %115 = getelementptr inbounds i8, i8* %114, i64 0
  %116 = bitcast i8* %115 to i32*
  %load_target26 = load i32, i32* %116
  %R65 = sext i32 %load_target26 to i64
  %R66 = mul i64 %R65, 4
  %117 = getelementptr inbounds i8, i8* %113, i64 %R66
  %118 = bitcast i8* %117 to i32*
  %119 = bitcast i32* %118 to i8*
  %120 = getelementptr inbounds i8, i8* %119, i64 0
  %121 = bitcast i8* %120 to i32*
  %load_target27 = load i32, i32* %121
  %R69 = udiv i32 %load_target27, 3
  %R70 = add i32 %R69, 696219795
  %R71 = bitcast %union.anno* %ut_0000018134FCC0A8 to i8*
  %122 = getelementptr inbounds i8, i8* %R71, i32 0
  %123 = bitcast i32* %n0_0000018134FCC268 to i8*
  %124 = getelementptr inbounds i8, i8* %123, i64 0
  %125 = bitcast i8* %124 to i32*
  %load_target28 = load i32, i32* %125
  %R74 = sext i32 %load_target28 to i64
  %R75 = mul i64 %R74, 4
  %126 = getelementptr inbounds i8, i8* %122, i64 %R75
  %127 = bitcast i8* %126 to i32*
  %128 = bitcast i32* %127 to i8*
  %129 = getelementptr inbounds i8, i8* %128, i64 0
  %130 = bitcast i8* %129 to i32*
  store i32 %R70, i32* %130
  br label %L7

L6:                                               ; preds = %L4
  %131 = bitcast i32* %hx_0000018134FCB7E8 to i8*
  %132 = getelementptr inbounds i8, i8* %131, i64 0
  %133 = bitcast i8* %132 to i32*
  %load_target29 = load i32, i32* %133
  %R78 = sdiv i32 %load_target29, 3
  %R80 = add i32 %R78, 715094163
  %R81 = bitcast %union.anno* %ut_0000018134FCC0A8 to i8*
  %134 = getelementptr inbounds i8, i8* %R81, i32 0
  %135 = bitcast i32* %n0_0000018134FCC268 to i8*
  %136 = getelementptr inbounds i8, i8* %135, i64 0
  %137 = bitcast i8* %136 to i32*
  %load_target30 = load i32, i32* %137
  %R84 = sext i32 %load_target30 to i64
  %R85 = mul i64 %R84, 4
  %138 = getelementptr inbounds i8, i8* %134, i64 %R85
  %139 = bitcast i8* %138 to i32*
  %140 = bitcast i32* %139 to i8*
  %141 = getelementptr inbounds i8, i8* %140, i64 0
  %142 = bitcast i8* %141 to i32*
  store i32 %R80, i32* %142
  br label %L7

L7:                                               ; preds = %L6, %L5
  %143 = bitcast %union.anno* %ut_0000018134FCC0A8 to double*
  %144 = bitcast double* %143 to i8*
  %145 = getelementptr inbounds i8, i8* %144, i64 0
  %146 = bitcast i8* %145 to double*
  %load_target31 = load double, double* %146
  %147 = bitcast %union.anno* %ut_0000018134FCC0A8 to double*
  %148 = bitcast double* %147 to i8*
  %149 = getelementptr inbounds i8, i8* %148, i64 0
  %150 = bitcast i8* %149 to double*
  %load_target32 = load double, double* %150
  %R89 = fmul double %load_target31, %load_target32
  %151 = bitcast %union.anno* %ux_0000018134FCC188 to double*
  %152 = bitcast double* %151 to i8*
  %153 = getelementptr inbounds i8, i8* %152, i64 0
  %154 = bitcast i8* %153 to double*
  %load_target33 = load double, double* %154
  %R91 = fdiv double %R89, %load_target33
  %155 = bitcast double* %r_0000018134FCB8C8 to i8*
  %156 = getelementptr inbounds i8, i8* %155, i64 0
  %157 = bitcast i8* %156 to double*
  store double %R91, double* %157
  %158 = bitcast double* %r_0000018134FCB8C8 to i8*
  %159 = getelementptr inbounds i8, i8* %158, i64 0
  %160 = bitcast i8* %159 to double*
  %load_target34 = load double, double* %160
  %161 = bitcast %union.anno* %ut_0000018134FCC0A8 to double*
  %162 = bitcast double* %161 to i8*
  %163 = getelementptr inbounds i8, i8* %162, i64 0
  %164 = bitcast i8* %163 to double*
  %load_target35 = load double, double* %164
  %R95 = fmul double %load_target34, %load_target35
  %R96 = fadd double 0x3FE15F1600000000, %R95
  %165 = bitcast double* %s_0000018134FCB9A8 to i8*
  %166 = getelementptr inbounds i8, i8* %165, i64 0
  %167 = bitcast i8* %166 to double*
  store double %R96, double* %167
  %168 = bitcast double* %s_0000018134FCB9A8 to i8*
  %169 = getelementptr inbounds i8, i8* %168, i64 0
  %170 = bitcast i8* %169 to double*
  %load_target36 = load double, double* %170
  %R101 = fadd double %load_target36, 0x3FF6A0EA00000000
  %171 = bitcast double* %s_0000018134FCB9A8 to i8*
  %172 = getelementptr inbounds i8, i8* %171, i64 0
  %173 = bitcast i8* %172 to double*
  %load_target37 = load double, double* %173
  %R104 = fdiv double 0xBFE691DE20000000, %load_target37
  %R105 = fadd double %R101, %R104
  %R106 = fdiv double 0x3FF9B6DB60000000, %R105
  %R107 = fadd double 0x3FD6DB6DC0000000, %R106
  %174 = bitcast %union.anno* %ut_0000018134FCC0A8 to double*
  %175 = bitcast double* %174 to i8*
  %176 = getelementptr inbounds i8, i8* %175, i64 0
  %177 = bitcast i8* %176 to double*
  %load_target38 = load double, double* %177
  %R110 = fmul double %load_target38, %R107
  %178 = bitcast %union.anno* %ut_0000018134FCC0A8 to double*
  %179 = bitcast double* %178 to i8*
  %180 = getelementptr inbounds i8, i8* %179, i64 0
  %181 = bitcast i8* %180 to double*
  store double %R110, double* %181
  %R112 = bitcast %union.anno* %ut_0000018134FCC0A8 to i8*
  %182 = getelementptr inbounds i8, i8* %R112, i32 0
  %183 = bitcast i32* %n0_0000018134FCC268 to i8*
  %184 = getelementptr inbounds i8, i8* %183, i64 0
  %185 = bitcast i8* %184 to i32*
  %load_target39 = load i32, i32* %185
  %R115 = sub i32 1, %load_target39
  %R116 = sext i32 %R115 to i64
  %R117 = mul i64 %R116, 4
  %186 = getelementptr inbounds i8, i8* %182, i64 %R117
  %187 = bitcast i8* %186 to i32*
  %188 = bitcast i32* %187 to i8*
  %189 = getelementptr inbounds i8, i8* %188, i64 0
  %190 = bitcast i8* %189 to i32*
  store i32 0, i32* %190
  %R119 = bitcast %union.anno* %ut_0000018134FCC0A8 to i8*
  %191 = getelementptr inbounds i8, i8* %R119, i32 0
  %192 = bitcast i32* %n0_0000018134FCC268 to i8*
  %193 = getelementptr inbounds i8, i8* %192, i64 0
  %194 = bitcast i8* %193 to i32*
  %load_target40 = load i32, i32* %194
  %R122 = sext i32 %load_target40 to i64
  %R123 = mul i64 %R122, 4
  %195 = getelementptr inbounds i8, i8* %191, i64 %R123
  %196 = bitcast i8* %195 to i32*
  %197 = bitcast i32* %196 to i8*
  %198 = getelementptr inbounds i8, i8* %197, i64 0
  %199 = bitcast i8* %198 to i32*
  %load_target41 = load i32, i32* %199
  %R127 = add i32 %load_target41, 1
  %200 = bitcast i8* %195 to i32*
  %201 = bitcast i32* %200 to i8*
  %202 = getelementptr inbounds i8, i8* %201, i64 0
  %203 = bitcast i8* %202 to i32*
  store i32 %R127, i32* %203
  %204 = bitcast %union.anno* %ut_0000018134FCC0A8 to double*
  %205 = bitcast double* %204 to i8*
  %206 = getelementptr inbounds i8, i8* %205, i64 0
  %207 = bitcast i8* %206 to double*
  %load_target42 = load double, double* %207
  %208 = bitcast %union.anno* %ut_0000018134FCC0A8 to double*
  %209 = bitcast double* %208 to i8*
  %210 = getelementptr inbounds i8, i8* %209, i64 0
  %211 = bitcast i8* %210 to double*
  %load_target43 = load double, double* %211
  %R131 = fmul double %load_target42, %load_target43
  %212 = bitcast double* %s_0000018134FCB9A8 to i8*
  %213 = getelementptr inbounds i8, i8* %212, i64 0
  %214 = bitcast i8* %213 to double*
  store double %R131, double* %214
  %215 = bitcast %union.anno* %ux_0000018134FCC188 to double*
  %216 = bitcast double* %215 to i8*
  %217 = getelementptr inbounds i8, i8* %216, i64 0
  %218 = bitcast i8* %217 to double*
  %load_target44 = load double, double* %218
  %219 = bitcast double* %s_0000018134FCB9A8 to i8*
  %220 = getelementptr inbounds i8, i8* %219, i64 0
  %221 = bitcast i8* %220 to double*
  %load_target45 = load double, double* %221
  %R134 = fdiv double %load_target44, %load_target45
  %222 = bitcast double* %r_0000018134FCB8C8 to i8*
  %223 = getelementptr inbounds i8, i8* %222, i64 0
  %224 = bitcast i8* %223 to double*
  store double %R134, double* %224
  %225 = bitcast %union.anno* %ut_0000018134FCC0A8 to double*
  %226 = bitcast double* %225 to i8*
  %227 = getelementptr inbounds i8, i8* %226, i64 0
  %228 = bitcast i8* %227 to double*
  %load_target46 = load double, double* %228
  %229 = bitcast %union.anno* %ut_0000018134FCC0A8 to double*
  %230 = bitcast double* %229 to i8*
  %231 = getelementptr inbounds i8, i8* %230, i64 0
  %232 = bitcast i8* %231 to double*
  %load_target47 = load double, double* %232
  %R137 = fadd double %load_target46, %load_target47
  %233 = bitcast double* %w_0000018134FCBA88 to i8*
  %234 = getelementptr inbounds i8, i8* %233, i64 0
  %235 = bitcast i8* %234 to double*
  store double %R137, double* %235
  %236 = bitcast double* %r_0000018134FCB8C8 to i8*
  %237 = getelementptr inbounds i8, i8* %236, i64 0
  %238 = bitcast i8* %237 to double*
  %load_target48 = load double, double* %238
  %239 = bitcast %union.anno* %ut_0000018134FCC0A8 to double*
  %240 = bitcast double* %239 to i8*
  %241 = getelementptr inbounds i8, i8* %240, i64 0
  %242 = bitcast i8* %241 to double*
  %load_target49 = load double, double* %242
  %R140 = fsub double %load_target48, %load_target49
  %243 = bitcast double* %w_0000018134FCBA88 to i8*
  %244 = getelementptr inbounds i8, i8* %243, i64 0
  %245 = bitcast i8* %244 to double*
  %load_target50 = load double, double* %245
  %246 = bitcast double* %r_0000018134FCB8C8 to i8*
  %247 = getelementptr inbounds i8, i8* %246, i64 0
  %248 = bitcast i8* %247 to double*
  %load_target51 = load double, double* %248
  %R143 = fadd double %load_target50, %load_target51
  %R144 = fdiv double %R140, %R143
  %249 = bitcast double* %r_0000018134FCB8C8 to i8*
  %250 = getelementptr inbounds i8, i8* %249, i64 0
  %251 = bitcast i8* %250 to double*
  store double %R144, double* %251
  %252 = bitcast %union.anno* %ut_0000018134FCC0A8 to double*
  %253 = bitcast double* %252 to i8*
  %254 = getelementptr inbounds i8, i8* %253, i64 0
  %255 = bitcast i8* %254 to double*
  %load_target52 = load double, double* %255
  %256 = bitcast %union.anno* %ut_0000018134FCC0A8 to double*
  %257 = bitcast double* %256 to i8*
  %258 = getelementptr inbounds i8, i8* %257, i64 0
  %259 = bitcast i8* %258 to double*
  %load_target53 = load double, double* %259
  %260 = bitcast double* %r_0000018134FCB8C8 to i8*
  %261 = getelementptr inbounds i8, i8* %260, i64 0
  %262 = bitcast i8* %261 to double*
  %load_target54 = load double, double* %262
  %R148 = fmul double %load_target53, %load_target54
  %R149 = fadd double %load_target52, %R148
  %263 = bitcast %union.anno* %ut_0000018134FCC0A8 to double*
  %264 = bitcast double* %263 to i8*
  %265 = getelementptr inbounds i8, i8* %264, i64 0
  %266 = bitcast i8* %265 to double*
  store double %R149, double* %266
  %267 = bitcast i32* %sign_0000018134FCBC48 to i8*
  %268 = getelementptr inbounds i8, i8* %267, i64 0
  %269 = bitcast i8* %268 to i32*
  %load_target55 = load i32, i32* %269
  %R151 = bitcast %union.anno* %ut_0000018134FCC0A8 to i8*
  %270 = getelementptr inbounds i8, i8* %R151, i32 0
  %271 = bitcast i32* %n0_0000018134FCC268 to i8*
  %272 = getelementptr inbounds i8, i8* %271, i64 0
  %273 = bitcast i8* %272 to i32*
  %load_target56 = load i32, i32* %273
  %R154 = sext i32 %load_target56 to i64
  %R155 = mul i64 %R154, 4
  %274 = getelementptr inbounds i8, i8* %270, i64 %R155
  %275 = bitcast i8* %274 to i32*
  %276 = bitcast i32* %275 to i8*
  %277 = getelementptr inbounds i8, i8* %276, i64 0
  %278 = bitcast i8* %277 to i32*
  %load_target57 = load i32, i32* %278
  %R159 = or i32 %load_target57, %load_target55
  %279 = bitcast i8* %274 to i32*
  %280 = bitcast i32* %279 to i8*
  %281 = getelementptr inbounds i8, i8* %280, i64 0
  %282 = bitcast i8* %281 to i32*
  store i32 %R159, i32* %282
  %283 = bitcast %union.anno* %ut_0000018134FCC0A8 to double*
  %284 = bitcast double* %283 to i8*
  %285 = getelementptr inbounds i8, i8* %284, i64 0
  %286 = bitcast i8* %285 to double*
  %load_target58 = load double, double* %286
  %287 = bitcast double* %lt_0000018134FCBB68 to i8*
  %288 = getelementptr inbounds i8, i8* %287, i64 0
  %289 = bitcast i8* %288 to double*
  store double %load_target58, double* %289
  %290 = bitcast double* %lt_0000018134FCBB68 to i8*
  %291 = getelementptr inbounds i8, i8* %290, i64 0
  %292 = bitcast i8* %291 to double*
  %load_target59 = load double, double* %292
  %293 = bitcast double* %x_0000018134FCB628 to i8*
  %294 = getelementptr inbounds i8, i8* %293, i64 0
  %295 = bitcast i8* %294 to double*
  %load_target60 = load double, double* %295
  %296 = bitcast double* %lt_0000018134FCBB68 to i8*
  %297 = getelementptr inbounds i8, i8* %296, i64 0
  %298 = bitcast i8* %297 to double*
  %load_target61 = load double, double* %298
  %299 = bitcast double* %lt_0000018134FCBB68 to i8*
  %300 = getelementptr inbounds i8, i8* %299, i64 0
  %301 = bitcast i8* %300 to double*
  %load_target62 = load double, double* %301
  %R166 = fmul double %load_target61, %load_target62
  %R167 = fdiv double %load_target60, %R166
  %R168 = fsub double %load_target59, %R167
  %R170 = fmul double %R168, 0x3FD5555555555555
  %302 = bitcast double* %lt_0000018134FCBB68 to i8*
  %303 = getelementptr inbounds i8, i8* %302, i64 0
  %304 = bitcast i8* %303 to double*
  %load_target63 = load double, double* %304
  %R173 = fsub double %load_target63, %R170
  %305 = bitcast double* %lt_0000018134FCBB68 to i8*
  %306 = getelementptr inbounds i8, i8* %305, i64 0
  %307 = bitcast i8* %306 to double*
  store double %R173, double* %307
  %308 = bitcast double* %lt_0000018134FCBB68 to i8*
  %309 = getelementptr inbounds i8, i8* %308, i64 0
  %310 = bitcast i8* %309 to double*
  %load_target64 = load double, double* %310
  %R177 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), double %load_target64)
  %311 = bitcast double* %lt_0000018134FCBB68 to i8*
  %312 = getelementptr inbounds i8, i8* %311, i64 0
  %313 = bitcast i8* %312 to double*
  %load_target65 = load double, double* %313
  br label %L8

L8:                                               ; preds = %L7, %L3, %L1
  %314 = load double, double* %0
  ret double %314
}

declare i32 @printf(i8*, ...)

define i32 @main() {
L9:
  %0 = alloca i32
  %R180 = call double @cbrtl(double 2.700000e+01)
  %R182 = fadd double %R180, 5.000000e-01
  %R183 = fptosi double %R182 to i32
  %R184 = icmp ne i32 %R183, 3
  %R1841 = zext i1 %R184 to i32
  %cond = icmp ne i32 %R1841, 0
  br i1 %cond, label %L10, label %L11

L10:                                              ; preds = %L9
  %R186 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i64 0, i64 0))
  br label %L12

L11:                                              ; preds = %L9
  %R188 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0))
  br label %L12

L12:                                              ; preds = %L11, %L10
  br label %L13

L13:                                              ; preds = %L12
  %1 = load i32, i32* %0
  ret i32 0
}
