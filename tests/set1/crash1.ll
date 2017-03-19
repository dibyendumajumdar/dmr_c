; ModuleID = 'out.bc'
source_filename = "sparse"

@"<noident>" = private global [20 x i8] c"agqwewbxklpfgytuorz\00", align 1
@randomletters = private global [20 x i8]* @"<noident>", align 8
@.str = private constant [14 x i8] c"Inserting %d\0A\00"

define i32 @main() {
L0:
  %0 = alloca i32
  store i32 0, i32* %0
  br label %L1

L1:                                               ; preds = %L2, %L0
  %1 = load i32, i32* %0
  %R2 = icmp slt i32 %1, 20
  %R21 = zext i1 %R2 to i32
  %cond = icmp ne i32 %R21, 0
  br i1 %cond, label %L2, label %L3

L2:                                               ; preds = %L1
  %load_target = load i8*, i8** bitcast ([20 x i8]** @randomletters to i8**)
  %R5 = sext i32 %1 to i64
  %2 = ptrtoint i8* %load_target to i64
  %R6 = add i64 %2, %R5
  %3 = inttoptr i64 %R6 to i8*
  %4 = ptrtoint i8* %3 to i64
  %5 = add i64 %4, 0
  %6 = inttoptr i64 %5 to i8*
  %load_target2 = load i8, i8* %6
  %R8 = sext i8 %load_target2 to i32
  %R11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i64 0, i64 0), i32 %R8)
  %R13 = add i32 %1, 1
  store i32 %R13, i32* %0
  br label %L1

L3:                                               ; preds = %L1
  ret i32 0
}

declare i32 @printf(i8*, ...)
