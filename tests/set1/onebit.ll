; ModuleID = 'out.bc'
source_filename = "dmrC"

%struct.anno = type { i2, i1, i3, i1 }

@.str = private constant [45 x i8] c"Be especially careful with 1-bit fields! %d\0A\00"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define i32 @main() {
L0:
  %s3_0000024EDF48DD18. = alloca %struct.anno
  %0 = alloca i32
  %s3_0000024EDF48DD18.1 = ptrtoint %struct.anno* %s3_0000024EDF48DD18. to i64
  %1 = add i64 %s3_0000024EDF48DD18.1, 0
  %2 = inttoptr i64 %1 to i32*
  %R1 = load i32, i32* %2
  %R3 = and i32 %R1, -65
  %R4 = or i32 %R3, 64
  %s3_0000024EDF48DD18.2 = ptrtoint %struct.anno* %s3_0000024EDF48DD18. to i64
  %3 = add i64 %s3_0000024EDF48DD18.2, 0
  %4 = inttoptr i64 %3 to i32*
  store i32 %R4, i32* %4
  %s3_0000024EDF48DD18.3 = ptrtoint %struct.anno* %s3_0000024EDF48DD18. to i64
  %5 = add i64 %s3_0000024EDF48DD18.3, 0
  %6 = inttoptr i64 %5 to i32*
  %R5 = load i32, i32* %6
  %R6 = lshr i32 %R5, 6
  %R64 = trunc i32 %R6 to i1
  %R7 = zext i1 %R64 to i32
  %R8 = icmp ne i32 %R7, 1
  %R85 = zext i1 %R8 to i32
  %cond = icmp ne i32 %R85, 0
  br i1 %cond, label %L1, label %L2

L1:                                               ; preds = %L0
  %s3_0000024EDF48DD18.6 = ptrtoint %struct.anno* %s3_0000024EDF48DD18. to i64
  %7 = add i64 %s3_0000024EDF48DD18.6, 0
  %8 = inttoptr i64 %7 to i32*
  %R10 = load i32, i32* %8
  %R11 = lshr i32 %R10, 6
  %R117 = trunc i32 %R11 to i1
  %R12 = zext i1 %R117 to i32
  %R13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str, i64 0, i64 0), i32 %R12)
  store i32 1, i32* %0
  br label %L3

L2:                                               ; preds = %L0
  store i32 0, i32* %0
  br label %L3

L3:                                               ; preds = %L2, %L1
  %9 = load i32, i32* %0
  ret i32 %9
}

declare i32 @printf(i8*, ...)

attributes #0 = { argmemonly nounwind }
