; ModuleID = 'out.bc'
source_filename = "dmrC"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define i32 @main() {
L0:
  %p_000002300F60CC78. = alloca i8*
  %buf_000002300F60CAB8. = alloca [5 x i8]
  %0 = alloca i32
  %R1 = bitcast [5 x i8]* %buf_000002300F60CAB8. to i8*
  %R11 = ptrtoint i8* %R1 to i64
  %R2 = add i64 %R11, 4
  %R22 = inttoptr i64 %R2 to i8*
  %p_000002300F60CC78.3 = ptrtoint i8** %p_000002300F60CC78. to i64
  %1 = add i64 %p_000002300F60CC78.3, 0
  %2 = inttoptr i64 %1 to i8**
  store i8* %R22, i8** %2
  %p_000002300F60CC78.4 = ptrtoint i8** %p_000002300F60CC78. to i64
  %3 = add i64 %p_000002300F60CC78.4, 0
  %4 = inttoptr i64 %3 to i8**
  %R3 = load i8*, i8** %4
  %R35 = ptrtoint i8* %R3 to i64
  %R4 = sub i64 %R35, 1
  %R46 = inttoptr i64 %R4 to i8*
  %p_000002300F60CC78.7 = ptrtoint i8** %p_000002300F60CC78. to i64
  %5 = add i64 %p_000002300F60CC78.7, 0
  %6 = inttoptr i64 %5 to i8**
  store i8* %R46, i8** %6
  %p_000002300F60CC78.8 = ptrtoint i8** %p_000002300F60CC78. to i64
  %7 = add i64 %p_000002300F60CC78.8, 0
  %8 = inttoptr i64 %7 to i8**
  %R5 = load i8*, i8** %8
  %R6 = bitcast [5 x i8]* %buf_000002300F60CAB8. to i8*
  %R69 = ptrtoint i8* %R6 to i64
  %R7 = add i64 %R69, 3
  %R710 = inttoptr i64 %R7 to i8*
  %9 = ptrtoint i8* %R5 to i64
  %10 = ptrtoint i8* %R710 to i64
  %R8 = icmp ne i64 %9, %10
  %R811 = zext i1 %R8 to i32
  %cond = icmp ne i32 %R811, 0
  %select = select i1 %cond, i32 1, i32 0
  store i32 %select, i32* %0
  br label %L1

L1:                                               ; preds = %L0
  %11 = load i32, i32* %0
  ret i32 %select
}

attributes #0 = { argmemonly nounwind }
