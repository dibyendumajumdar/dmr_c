; ModuleID = 'out.bc'
source_filename = "dmrC"

@.str = private constant [4 x i8] c"%d\0A\00"
@.str.1 = private constant [4 x i8] c"%d\0A\00"
@.str.2 = private constant [4 x i8] c"%d\0A\00"
@.str.3 = private constant [4 x i8] c"%d\0A\00"
@.str.4 = private constant [4 x i8] c"%d\0A\00"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define i32 @main() {
L0:
  %e_0000023D069AC768. = alloca i32
  %d_0000023D069AC688. = alloca i32
  %c_0000023D069AC5A8. = alloca i32
  %b_0000023D069AC4C8. = alloca i32
  %a_0000023D069AC3E8. = alloca i32
  %0 = alloca i32
  store i32 24680, i32* %a_0000023D069AC3E8.
  %a_0000023D069AC3E8.1 = ptrtoint i32* %a_0000023D069AC3E8. to i64
  %1 = add i64 %a_0000023D069AC3E8.1, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 24680, i32* %2
  store i32 342391, i32* %b_0000023D069AC4C8.
  %b_0000023D069AC4C8.2 = ptrtoint i32* %b_0000023D069AC4C8. to i64
  %3 = add i64 %b_0000023D069AC4C8.2, 0
  %4 = inttoptr i64 %3 to i32*
  store i32 342391, i32* %4
  store i32 2386092, i32* %c_0000023D069AC5A8.
  %c_0000023D069AC5A8.3 = ptrtoint i32* %c_0000023D069AC5A8. to i64
  %5 = add i64 %c_0000023D069AC5A8.3, 0
  %6 = inttoptr i64 %5 to i32*
  store i32 2386092, i32* %6
  store i32 2386092, i32* %d_0000023D069AC688.
  %d_0000023D069AC688.4 = ptrtoint i32* %d_0000023D069AC688. to i64
  %7 = add i64 %d_0000023D069AC688.4, 0
  %8 = inttoptr i64 %7 to i32*
  store i32 2386092, i32* %8
  store i32 1365, i32* %e_0000023D069AC768.
  %e_0000023D069AC768.5 = ptrtoint i32* %e_0000023D069AC768. to i64
  %9 = add i64 %e_0000023D069AC768.5, 0
  %10 = inttoptr i64 %9 to i32*
  store i32 1365, i32* %10
  %R2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 24680)
  %R4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 342391)
  %R6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i32 2386092)
  %R8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 2386092)
  %R10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i64 0, i64 0), i32 1365)
  store i32 0, i32* %0
  br label %L1

L1:                                               ; preds = %L0
  %11 = load i32, i32* %0
  ret i32 0
}

declare i32 @printf(i8*, ...)

attributes #0 = { argmemonly nounwind }
