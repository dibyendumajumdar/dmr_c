; ModuleID = 'out.bc'
source_filename = "sparse"

@.str = private constant [6 x i8] c"hello\00"
@.str.1 = private constant [4 x i8] c"%s\0A\00"
@.str.2 = private constant [8 x i8] c"%c: %d\0A\00"
@.str.3 = private constant [21 x i8] c"copied string is %s\0A\00"

define i32 @main() {
L0:
  %destarray_0000025CC40CEF38 = alloca [10 x i8]
  %0 = alloca i8*
  %1 = alloca i8*
  %2 = alloca i8*
  %R4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0))
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i8** %0
  br label %L1

L1:                                               ; preds = %L2, %L0
  %3 = load i8*, i8** %0
  %4 = ptrtoint i8* %3 to i64
  %5 = add i64 %4, 0
  %6 = inttoptr i64 %5 to i8*
  %load_target = load i8, i8* %6
  %cond = icmp ne i8 %load_target, 0
  br i1 %cond, label %L2, label %L3

L2:                                               ; preds = %L1
  %R16 = sext i8 %load_target to i32
  %R19 = sext i8 %load_target to i32
  %R20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i64 0, i64 0), i32 %R16, i32 %R19)
  %7 = ptrtoint i8* %3 to i64
  %R22 = add i64 %7, 1
  %8 = inttoptr i64 %R22 to i8*
  store i8* %8, i8** %0
  br label %L1

L3:                                               ; preds = %L1
  %R23 = bitcast [10 x i8]* %destarray_0000025CC40CEF38 to i8*
  store i8* %R23, i8** %2
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i8** %1
  br label %L4

L4:                                               ; preds = %L5, %L3
  %9 = load i8*, i8** %1
  %10 = ptrtoint i8* %9 to i64
  %11 = add i64 %10, 0
  %12 = inttoptr i64 %11 to i8*
  %load_target1 = load i8, i8* %12
  %13 = load i8*, i8** %2
  %cond2 = icmp ne i8 %load_target1, 0
  br i1 %cond2, label %L5, label %L6

L5:                                               ; preds = %L4
  %14 = ptrtoint i8* %9 to i64
  %R31 = add i64 %14, 1
  %15 = inttoptr i64 %R31 to i8*
  %16 = ptrtoint i8* %13 to i64
  %R34 = add i64 %16, 1
  %17 = inttoptr i64 %R34 to i8*
  %18 = ptrtoint i8* %13 to i64
  %19 = add i64 %18, 0
  %20 = inttoptr i64 %19 to i8*
  store i8 %load_target1, i8* %20
  store i8* %17, i8** %2
  store i8* %15, i8** %1
  br label %L4

L6:                                               ; preds = %L4
  %21 = ptrtoint i8* %13 to i64
  %22 = add i64 %21, 0
  %23 = inttoptr i64 %22 to i8*
  store i8 0, i8* %23
  %R38 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i64 0, i64 0), i8* %R23)
  ret i32 0
}

declare i32 @printf(i8*, ...)
