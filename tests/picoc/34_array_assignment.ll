; ModuleID = 'out.bc'
source_filename = "sparse"

@.str = private constant [13 x i8] c"%d %d %d %d\0A\00"
@.str.1 = private constant [13 x i8] c"%d %d %d %d\0A\00"

define i32 @main() {
L0:
  %a_0000020B5B47CE28 = alloca [4 x i32]
  %0 = ptrtoint [4 x i32]* %a_0000020B5B47CE28 to i64
  %1 = add i64 %0, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 12, i32* %2
  %3 = ptrtoint [4 x i32]* %a_0000020B5B47CE28 to i64
  %4 = add i64 %3, 4
  %5 = inttoptr i64 %4 to i32*
  store i32 23, i32* %5
  %6 = ptrtoint [4 x i32]* %a_0000020B5B47CE28 to i64
  %7 = add i64 %6, 8
  %8 = inttoptr i64 %7 to i32*
  store i32 34, i32* %8
  %9 = ptrtoint [4 x i32]* %a_0000020B5B47CE28 to i64
  %10 = add i64 %9, 12
  %11 = inttoptr i64 %10 to i32*
  store i32 45, i32* %11
  %R6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0), i32 12, i32 23, i32 34, i32 45)
  %R18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i64 0, i64 0), i32 12, i32 23, i32 34, i32 45)
  ret i32 0
}

declare i32 @printf(i8*, ...)
