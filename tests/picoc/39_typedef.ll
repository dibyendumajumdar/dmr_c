; ModuleID = 'out.bc'
source_filename = "sparse"

%struct.FunStruct = type { i32, i32 }

@.str = private constant [4 x i8] c"%d\0A\00"
@.str.1 = private constant [7 x i8] c"%d,%d\0A\00"
@.str.2 = private constant [7 x i8] c"%d,%d\0A\00"

define i32 @main() {
L0:
  %b_000001B07CF4C0A8 = alloca %struct.FunStruct
  %R3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 1)
  %0 = bitcast %struct.FunStruct* %b_000001B07CF4C0A8 to i32*
  %1 = bitcast i32* %0 to i8*
  %2 = getelementptr inbounds i8, i8* %1, i64 0
  %3 = bitcast i8* %2 to i32*
  store i32 12, i32* %3
  %4 = bitcast %struct.FunStruct* %b_000001B07CF4C0A8 to i32*
  %5 = bitcast i32* %4 to i8*
  %6 = getelementptr inbounds i8, i8* %5, i64 4
  %7 = bitcast i8* %6 to i32*
  store i32 34, i32* %7
  %R7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 12, i32 34)
  %R14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i64 0, i64 0), i32 12, i32 34)
  ret i32 0
}

declare i32 @printf(i8*, ...)
