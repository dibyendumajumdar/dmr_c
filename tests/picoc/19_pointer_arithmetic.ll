; ModuleID = 'out.bc'
source_filename = "dmrC"

@.str = private constant [4 x i8] c"%d\0A\00"
@.str.1 = private constant [11 x i8] c"b is NULL\0A\00"
@.str.2 = private constant [15 x i8] c"b is not NULL\0A\00"
@.str.3 = private constant [11 x i8] c"c is NULL\0A\00"
@.str.4 = private constant [15 x i8] c"c is not NULL\0A\00"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define i32 @main() {
L0:
  %c_0000016B2CB1C3F8. = alloca i32*
  %b_0000016B2CB1C238. = alloca i32*
  %a_0000016B2CB1C158. = alloca i32
  %0 = alloca i32
  %a_0000016B2CB1C158.1 = ptrtoint i32* %a_0000016B2CB1C158. to i64
  %1 = add i64 %a_0000016B2CB1C158.1, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 42, i32* %2
  %b_0000016B2CB1C238.2 = ptrtoint i32** %b_0000016B2CB1C238. to i64
  %3 = add i64 %b_0000016B2CB1C238.2, 0
  %4 = inttoptr i64 %3 to i32**
  store i32* %a_0000016B2CB1C158., i32** %4
  %c_0000016B2CB1C3F8.3 = ptrtoint i32** %c_0000016B2CB1C3F8. to i64
  %5 = add i64 %c_0000016B2CB1C3F8.3, 0
  %6 = inttoptr i64 %5 to i32**
  store i32* null, i32** %6
  %b_0000016B2CB1C238.4 = ptrtoint i32** %b_0000016B2CB1C238. to i64
  %7 = add i64 %b_0000016B2CB1C238.4, 0
  %8 = inttoptr i64 %7 to i32**
  %R3 = load i32*, i32** %8
  %R35 = ptrtoint i32* %R3 to i64
  %9 = add i64 %R35, 0
  %10 = inttoptr i64 %9 to i32*
  %R4 = load i32, i32* %10
  %R5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %R4)
  %b_0000016B2CB1C238.6 = ptrtoint i32** %b_0000016B2CB1C238. to i64
  %11 = add i64 %b_0000016B2CB1C238.6, 0
  %12 = inttoptr i64 %11 to i32**
  %R6 = load i32*, i32** %12
  %13 = ptrtoint i32* %R6 to i64
  %R7 = icmp eq i64 %13, 0
  %R77 = zext i1 %R7 to i32
  %cond = icmp ne i32 %R77, 0
  br i1 %cond, label %L1, label %L2

L1:                                               ; preds = %L0
  %R9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0))
  br label %L3

L2:                                               ; preds = %L0
  %R11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0))
  br label %L3

L3:                                               ; preds = %L2, %L1
  %c_0000016B2CB1C3F8.8 = ptrtoint i32** %c_0000016B2CB1C3F8. to i64
  %14 = add i64 %c_0000016B2CB1C3F8.8, 0
  %15 = inttoptr i64 %14 to i32**
  %R12 = load i32*, i32** %15
  %16 = ptrtoint i32* %R12 to i64
  %R13 = icmp eq i64 %16, 0
  %R139 = zext i1 %R13 to i32
  %cond10 = icmp ne i32 %R139, 0
  br i1 %cond10, label %L4, label %L5

L4:                                               ; preds = %L3
  %R15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i64 0, i64 0))
  br label %L6

L5:                                               ; preds = %L3
  %R17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0))
  br label %L6

L6:                                               ; preds = %L5, %L4
  store i32 0, i32* %0
  br label %L7

L7:                                               ; preds = %L6
  %17 = load i32, i32* %0
  ret i32 0
}

declare i32 @printf(i8*, ...)

attributes #0 = { argmemonly nounwind }
