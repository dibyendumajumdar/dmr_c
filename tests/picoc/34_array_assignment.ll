; ModuleID = 'out.bc'
source_filename = "sparse"

@.str = private constant [13 x i8] c"%d %d %d %d\0A\00"
@.str.1 = private constant [13 x i8] c"%d %d %d %d\0A\00"

define i32 @main() {
L0:
  %a_000001D62535ABC8 = alloca [4 x i32]
  %0 = bitcast [4 x i32]* %a_000001D62535ABC8 to i32*
  %1 = bitcast i32* %0 to i8*
  %2 = getelementptr inbounds i8, i8* %1, i64 0
  %3 = bitcast i8* %2 to i32*
  store i32 12, i32* %3
  %4 = bitcast [4 x i32]* %a_000001D62535ABC8 to i32*
  %5 = bitcast i32* %4 to i8*
  %6 = getelementptr inbounds i8, i8* %5, i64 4
  %7 = bitcast i8* %6 to i32*
  store i32 23, i32* %7
  %8 = bitcast [4 x i32]* %a_000001D62535ABC8 to i32*
  %9 = bitcast i32* %8 to i8*
  %10 = getelementptr inbounds i8, i8* %9, i64 8
  %11 = bitcast i8* %10 to i32*
  store i32 34, i32* %11
  %12 = bitcast [4 x i32]* %a_000001D62535ABC8 to i32*
  %13 = bitcast i32* %12 to i8*
  %14 = getelementptr inbounds i8, i8* %13, i64 12
  %15 = bitcast i8* %14 to i32*
  store i32 45, i32* %15
  %R6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0), i32 12, i32 23, i32 34, i32 45)
  %R18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i64 0, i64 0), i32 12, i32 23, i32 34, i32 45)
  ret i32 0
}

declare i32 @printf(i8*, ...)
