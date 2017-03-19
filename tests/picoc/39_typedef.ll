; ModuleID = 'out.bc'
source_filename = "sparse"

%struct.FunStruct = type { i32, i32 }

@.str = private constant [4 x i8] c"%d\0A\00"
@.str.1 = private constant [7 x i8] c"%d,%d\0A\00"
@.str.2 = private constant [7 x i8] c"%d,%d\0A\00"

define i32 @main() {
L0:
  %b_000001D6DE3EE498 = alloca %struct.FunStruct
  %R3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 1)
  %0 = ptrtoint %struct.FunStruct* %b_000001D6DE3EE498 to i64
  %1 = add i64 %0, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 12, i32* %2
  %3 = ptrtoint %struct.FunStruct* %b_000001D6DE3EE498 to i64
  %4 = add i64 %3, 4
  %5 = inttoptr i64 %4 to i32*
  store i32 34, i32* %5
  %R7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 12, i32 34)
  %R14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i64 0, i64 0), i32 12, i32 34)
  ret i32 0
}

declare i32 @printf(i8*, ...)
