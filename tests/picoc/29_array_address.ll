; ModuleID = 'out.bc'
source_filename = "sparse"

@.str = private constant [7 x i8] c"abcdef\00"
@.str.1 = private constant [4 x i8] c"%s\0A\00"

define i32 @main() {
L0:
  %a_00000214B200B1F8 = alloca [10 x i8]
  %R1 = bitcast [10 x i8]* %a_00000214B200B1F8 to i8*
  %R3 = call i8* @strcpy(i8* %R1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0))
  %0 = getelementptr inbounds i8, i8* %R1, i64 1
  %R7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i8* %0)
  ret i32 0
}

declare i8* @strcpy(i8*, i8*)

declare i32 @printf(i8*, ...)
