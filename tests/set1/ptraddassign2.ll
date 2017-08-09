; ModuleID = 'out.bc'
source_filename = "dmrC"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define internal i32* @incr(i32* %ARG1) {
L0:
  %tmp_000001D833A2CCF8. = alloca i32*
  %p_000001D833A2CA58. = alloca i32*
  %0 = alloca i32*
  %p_000001D833A2CA58.1 = ptrtoint i32** %p_000001D833A2CA58. to i64
  %1 = add i64 %p_000001D833A2CA58.1, 0
  %2 = inttoptr i64 %1 to i32**
  store i32* %ARG1, i32** %2
  %p_000001D833A2CA58.2 = ptrtoint i32** %p_000001D833A2CA58. to i64
  %3 = add i64 %p_000001D833A2CA58.2, 0
  %4 = inttoptr i64 %3 to i32**
  %R1 = load i32*, i32** %4
  %tmp_000001D833A2CCF8.3 = ptrtoint i32** %tmp_000001D833A2CCF8. to i64
  %5 = add i64 %tmp_000001D833A2CCF8.3, 0
  %6 = inttoptr i64 %5 to i32**
  store i32* %R1, i32** %6
  %tmp_000001D833A2CCF8.4 = ptrtoint i32** %tmp_000001D833A2CCF8. to i64
  %7 = add i64 %tmp_000001D833A2CCF8.4, 0
  %8 = inttoptr i64 %7 to i32**
  %R2 = load i32*, i32** %8
  %R3 = ptrtoint i32* %R2 to i64
  %R4 = add i64 %R3, 16
  %R5 = inttoptr i64 %R4 to i32*
  %tmp_000001D833A2CCF8.5 = ptrtoint i32** %tmp_000001D833A2CCF8. to i64
  %9 = add i64 %tmp_000001D833A2CCF8.5, 0
  %10 = inttoptr i64 %9 to i32**
  store i32* %R5, i32** %10
  %tmp_000001D833A2CCF8.6 = ptrtoint i32** %tmp_000001D833A2CCF8. to i64
  %11 = add i64 %tmp_000001D833A2CCF8.6, 0
  %12 = inttoptr i64 %11 to i32**
  %R6 = load i32*, i32** %12
  store i32* %R6, i32** %0
  br label %L1

L1:                                               ; preds = %L0
  %13 = load i32*, i32** %0
  ret i32* %R6
}

define i32 @main(i32 %ARG1, i8** %ARG2) {
L2:
  %p_000001D833A2D698. = alloca i32*
  %values_000001D833A2D4D8. = alloca [5 x i32]
  %argv_000001D833A2D158. = alloca i8**
  %argc_000001D833A2D078. = alloca i32
  %0 = alloca i32
  %argc_000001D833A2D078.1 = ptrtoint i32* %argc_000001D833A2D078. to i64
  %1 = add i64 %argc_000001D833A2D078.1, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 %ARG1, i32* %2
  %argv_000001D833A2D158.2 = ptrtoint i8*** %argv_000001D833A2D158. to i64
  %3 = add i64 %argv_000001D833A2D158.2, 0
  %4 = inttoptr i64 %3 to i8***
  store i8** %ARG2, i8*** %4
  %values_000001D833A2D4D8.3 = ptrtoint [5 x i32]* %values_000001D833A2D4D8. to i64
  %5 = add i64 %values_000001D833A2D4D8.3, 0
  %6 = inttoptr i64 %5 to i32*
  store i32 9, i32* %6
  %values_000001D833A2D4D8.4 = ptrtoint [5 x i32]* %values_000001D833A2D4D8. to i64
  %7 = add i64 %values_000001D833A2D4D8.4, 4
  %8 = inttoptr i64 %7 to i32*
  store i32 8, i32* %8
  %values_000001D833A2D4D8.5 = ptrtoint [5 x i32]* %values_000001D833A2D4D8. to i64
  %9 = add i64 %values_000001D833A2D4D8.5, 8
  %10 = inttoptr i64 %9 to i32*
  store i32 7, i32* %10
  %values_000001D833A2D4D8.6 = ptrtoint [5 x i32]* %values_000001D833A2D4D8. to i64
  %11 = add i64 %values_000001D833A2D4D8.6, 12
  %12 = inttoptr i64 %11 to i32*
  store i32 6, i32* %12
  %values_000001D833A2D4D8.7 = ptrtoint [5 x i32]* %values_000001D833A2D4D8. to i64
  %13 = add i64 %values_000001D833A2D4D8.7, 16
  %14 = inttoptr i64 %13 to i32*
  store i32 5, i32* %14
  %R8 = bitcast [5 x i32]* %values_000001D833A2D4D8. to i32*
  %R10 = call i32* @incr(i32* %R8)
  %p_000001D833A2D698.8 = ptrtoint i32** %p_000001D833A2D698. to i64
  %15 = add i64 %p_000001D833A2D698.8, 0
  %16 = inttoptr i64 %15 to i32**
  store i32* %R10, i32** %16
  %p_000001D833A2D698.9 = ptrtoint i32** %p_000001D833A2D698. to i64
  %17 = add i64 %p_000001D833A2D698.9, 0
  %18 = inttoptr i64 %17 to i32**
  %R11 = load i32*, i32** %18
  %R1110 = ptrtoint i32* %R11 to i64
  %19 = add i64 %R1110, 0
  %20 = inttoptr i64 %19 to i32*
  %R12 = load i32, i32* %20
  %R13 = icmp eq i32 %R12, 5
  %R1311 = zext i1 %R13 to i32
  %cond = icmp ne i32 %R1311, 0
  %select = select i1 %cond, i32 0, i32 1
  store i32 %select, i32* %0
  br label %L3

L3:                                               ; preds = %L2
  %21 = load i32, i32* %0
  ret i32 %select
}

attributes #0 = { argmemonly nounwind }
