; ModuleID = 'out.bc'
source_filename = "sparse"

@.str = private constant [4 x i8] c"%c\0A\00"
@.str.1 = private constant [4 x i8] c"%c\0A\00"

define i32 @main(i32 %ARG1, i8** %ARG2) {
L0:
  %0 = ptrtoint i8** %ARG2 to i64
  %1 = add i64 %0, 0
  %2 = inttoptr i64 %1 to i8**
  %load_target = load i8*, i8** %2
  %3 = ptrtoint i8* %load_target to i64
  %4 = add i64 %3, 0
  %5 = inttoptr i64 %4 to i8*
  %load_target1 = load i8, i8* %5
  switch i8 %load_target1, label %L2 [
    i8 115, label %L1
  ]

L1:                                               ; preds = %L0
  %R8 = sext i8 %load_target1 to i32
  %R9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %R8)
  br label %L4

L2:                                               ; preds = %L0
  %cond = icmp ne i8 %load_target1, 0
  br i1 %cond, label %L3, label %L4

L3:                                               ; preds = %L2
  %R15 = sext i8 %load_target1 to i32
  %R16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 %R15)
  br label %L4

L4:                                               ; preds = %L3, %L2, %L1
  ret i32 0
}

declare i32 @printf(i8*, ...)
