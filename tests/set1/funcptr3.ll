; ModuleID = 'out.bc'
source_filename = "dmrC"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define internal i32 @execute(i32 %ARG1, i8* %ARG2, i32 %ARG3, i32 %ARG4) {
L0:
  %arg2_00000196473BED98. = alloca i32
  %arg1_00000196473BECB8. = alloca i32
  %fn_00000196473BEAF8. = alloca i8*
  %type_00000196473BEA18. = alloca i32
  %0 = alloca i32
  %type_00000196473BEA18.1 = ptrtoint i32* %type_00000196473BEA18. to i64
  %1 = add i64 %type_00000196473BEA18.1, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 %ARG1, i32* %2
  %fn_00000196473BEAF8.2 = ptrtoint i8** %fn_00000196473BEAF8. to i64
  %3 = add i64 %fn_00000196473BEAF8.2, 0
  %4 = inttoptr i64 %3 to i8**
  store i8* %ARG2, i8** %4
  %arg1_00000196473BECB8.3 = ptrtoint i32* %arg1_00000196473BECB8. to i64
  %5 = add i64 %arg1_00000196473BECB8.3, 0
  %6 = inttoptr i64 %5 to i32*
  store i32 %ARG3, i32* %6
  %arg2_00000196473BED98.4 = ptrtoint i32* %arg2_00000196473BED98. to i64
  %7 = add i64 %arg2_00000196473BED98.4, 0
  %8 = inttoptr i64 %7 to i32*
  store i32 %ARG4, i32* %8
  %type_00000196473BEA18.5 = ptrtoint i32* %type_00000196473BEA18. to i64
  %9 = add i64 %type_00000196473BEA18.5, 0
  %10 = inttoptr i64 %9 to i32*
  %R1 = load i32, i32* %10
  %R2 = icmp eq i32 %R1, 0
  %R26 = zext i1 %R2 to i32
  %cond = icmp ne i32 %R26, 0
  br i1 %cond, label %L1, label %L2

L1:                                               ; preds = %L0
  %arg1_00000196473BECB8.7 = ptrtoint i32* %arg1_00000196473BECB8. to i64
  %11 = add i64 %arg1_00000196473BECB8.7, 0
  %12 = inttoptr i64 %11 to i32*
  %R3 = load i32, i32* %12
  %arg2_00000196473BED98.8 = ptrtoint i32* %arg2_00000196473BED98. to i64
  %13 = add i64 %arg2_00000196473BED98.8, 0
  %14 = inttoptr i64 %13 to i32*
  %R4 = load i32, i32* %14
  %fn_00000196473BEAF8.9 = ptrtoint i8** %fn_00000196473BEAF8. to i64
  %15 = add i64 %fn_00000196473BEAF8.9, 0
  %16 = inttoptr i64 %15 to i8**
  %R5 = load i8*, i8** %16
  %R6 = bitcast i8* %R5 to i32 (i32, i32)*
  %R7 = bitcast i32 (i32, i32)* %R6 to i8*
  %R710 = bitcast i8* %R7 to i32 (i32, i32)*
  %R711 = call i32 %R710(i32 %R3, i32 %R4)
  store i32 %R711, i32* %0
  br label %L3

L2:                                               ; preds = %L0
  %arg1_00000196473BECB8.12 = ptrtoint i32* %arg1_00000196473BECB8. to i64
  %17 = add i64 %arg1_00000196473BECB8.12, 0
  %18 = inttoptr i64 %17 to i32*
  %R9 = load i32, i32* %18
  %fn_00000196473BEAF8.13 = ptrtoint i8** %fn_00000196473BEAF8. to i64
  %19 = add i64 %fn_00000196473BEAF8.13, 0
  %20 = inttoptr i64 %19 to i8**
  %R10 = load i8*, i8** %20
  %R11 = bitcast i8* %R10 to i32 (i32)*
  %R12 = bitcast i32 (i32)* %R11 to i8*
  %R1214 = bitcast i8* %R12 to i32 (i32)*
  %R1215 = call i32 %R1214(i32 %R9)
  store i32 %R1215, i32* %0
  br label %L3

L3:                                               ; preds = %L2, %L1
  %21 = load i32, i32* %0
  ret i32 %21
}

define internal i32 @unary(i32 %ARG1) {
L4:
  %arg1_00000196473BF2D8. = alloca i32
  %0 = alloca i32
  %arg1_00000196473BF2D8.1 = ptrtoint i32* %arg1_00000196473BF2D8. to i64
  %1 = add i64 %arg1_00000196473BF2D8.1, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 %ARG1, i32* %2
  %arg1_00000196473BF2D8.2 = ptrtoint i32* %arg1_00000196473BF2D8. to i64
  %3 = add i64 %arg1_00000196473BF2D8.2, 0
  %4 = inttoptr i64 %3 to i32*
  %R13 = load i32, i32* %4
  %R14 = add i32 %R13, 3
  store i32 %R14, i32* %0
  br label %L5

L5:                                               ; preds = %L4
  %5 = load i32, i32* %0
  ret i32 %R14
}

define i32 @main() {
L6:
  %0 = alloca i32
  %R19 = call i32 @execute(i32 1, i8* bitcast (i32 (i32)* @unary to i8*), i32 3, i32 10)
  %R20 = icmp eq i32 %R19, 6
  %R201 = zext i1 %R20 to i32
  %cond = icmp ne i32 %R201, 0
  %select = select i1 %cond, i32 0, i32 1
  store i32 %select, i32* %0
  br label %L7

L7:                                               ; preds = %L6
  %1 = load i32, i32* %0
  ret i32 %select
}

attributes #0 = { argmemonly nounwind }
