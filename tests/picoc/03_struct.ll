; ModuleID = 'out.bc'
source_filename = "dmrC"

%struct.fred = type { i32, i32 }

@.str = private constant [4 x i8] c"%d\0A\00"
@.str.1 = private constant [4 x i8] c"%d\0A\00"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define i32 @main() {
L0:
  %bloggs_000001A7ED67CF78. = alloca %struct.fred
  %0 = alloca i32
  %bloggs_000001A7ED67CF78.1 = ptrtoint %struct.fred* %bloggs_000001A7ED67CF78. to i64
  %1 = add i64 %bloggs_000001A7ED67CF78.1, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 12, i32* %2
  %bloggs_000001A7ED67CF78.2 = ptrtoint %struct.fred* %bloggs_000001A7ED67CF78. to i64
  %3 = add i64 %bloggs_000001A7ED67CF78.2, 4
  %4 = inttoptr i64 %3 to i32*
  store i32 34, i32* %4
  %bloggs_000001A7ED67CF78.3 = ptrtoint %struct.fred* %bloggs_000001A7ED67CF78. to i64
  %5 = add i64 %bloggs_000001A7ED67CF78.3, 0
  %6 = inttoptr i64 %5 to i32*
  %R2 = load i32, i32* %6
  %R3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %R2)
  %bloggs_000001A7ED67CF78.4 = ptrtoint %struct.fred* %bloggs_000001A7ED67CF78. to i64
  %7 = add i64 %bloggs_000001A7ED67CF78.4, 4
  %8 = inttoptr i64 %7 to i32*
  %R5 = load i32, i32* %8
  %R6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 %R5)
  store i32 0, i32* %0
  br label %L1

L1:                                               ; preds = %L0
  %9 = load i32, i32* %0
  ret i32 0
}

declare i32 @printf(i8*, ...)

attributes #0 = { argmemonly nounwind }
