; ModuleID = 'out.bc'
source_filename = "sparse"

@.str = private constant [6 x i8] c"hello\00"
@.str.1 = private constant [4 x i8] c"%s\0A\00"
@.str.2 = private constant [8 x i8] c"%c: %d\0A\00"
@.str.3 = private constant [21 x i8] c"copied string is %s\0A\00"

define i32 @main() {
L0:
  %destarray_0000025202A1B7A8 = alloca [10 x i8]
  %0 = alloca i8*
  %1 = alloca i8*
  %2 = alloca i8*
  %R4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0))
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i8** %0
  br label %L1

L1:                                               ; preds = %L2, %L0
  %3 = load i8*, i8** %0
  %4 = getelementptr inbounds i8, i8* %3, i64 0
  %load_target = load i8, i8* %4
  %cond = icmp ne i8 %load_target, 0
  br i1 %cond, label %L2, label %L3

L2:                                               ; preds = %L1
  %R16 = sext i8 %load_target to i32
  %R19 = sext i8 %load_target to i32
  %R20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i64 0, i64 0), i32 %R16, i32 %R19)
  %5 = getelementptr inbounds i8, i8* %3, inttoptr (i64 1 to i8*)
  store i8* %5, i8** %0
  br label %L1

L3:                                               ; preds = %L1
  %R23 = bitcast [10 x i8]* %destarray_0000025202A1B7A8 to i8*
  store i8* %R23, i8** %2
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i8** %1
  br label %L4

L4:                                               ; preds = %L5, %L3
  %6 = load i8*, i8** %1
  %7 = getelementptr inbounds i8, i8* %6, i64 0
  %load_target1 = load i8, i8* %7
  %8 = load i8*, i8** %2
  %cond2 = icmp ne i8 %load_target1, 0
  br i1 %cond2, label %L5, label %L6

L5:                                               ; preds = %L4
  %9 = getelementptr inbounds i8, i8* %6, inttoptr (i64 1 to i8*)
  %10 = getelementptr inbounds i8, i8* %8, inttoptr (i64 1 to i8*)
  %11 = getelementptr inbounds i8, i8* %8, i64 0
  store i8 %load_target1, i8* %11
  store i8* %10, i8** %2
  store i8* %9, i8** %1
  br label %L4

L6:                                               ; preds = %L4
  %12 = getelementptr inbounds i8, i8* %8, i64 0
  store i8 0, i8* %12
  %R38 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i64 0, i64 0), i8* %R23)
  ret i32 0
}

declare i32 @printf(i8*, ...)
