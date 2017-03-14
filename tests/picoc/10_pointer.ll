; ModuleID = 'out.bc'
source_filename = "sparse"

%struct.ziggy = type { i32, i32, i32 }

@bolshevic = global %struct.ziggy zeroinitializer, align 4
@.str = private constant [8 x i8] c"a = %d\0A\00"
@.str.1 = private constant [18 x i8] c"bolshevic.a = %d\0A\00"
@.str.2 = private constant [18 x i8] c"bolshevic.b = %d\0A\00"
@.str.3 = private constant [18 x i8] c"bolshevic.c = %d\0A\00"
@.str.4 = private constant [14 x i8] c"tsar->a = %d\0A\00"
@.str.5 = private constant [14 x i8] c"tsar->b = %d\0A\00"
@.str.6 = private constant [14 x i8] c"tsar->c = %d\0A\00"

define i32 @main() {
L0:
  %a_0000020B7AA49D88 = alloca i32
  %0 = bitcast i32* %a_0000020B7AA49D88 to i8*
  %1 = getelementptr inbounds i8, i8* %0, i64 0
  %2 = bitcast i8* %1 to i32*
  store i32 42, i32* %2
  %R5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), i32 42)
  store i32 12, i32* getelementptr inbounds (%struct.ziggy, %struct.ziggy* @bolshevic, i32 0, i32 0)
  store i32 34, i32* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.ziggy* @bolshevic to i8*), i64 4) to i32*)
  store i32 56, i32* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.ziggy* @bolshevic to i8*), i64 8) to i32*)
  %R8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0), i32 12)
  %load_target = load i32, i32* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.ziggy* @bolshevic to i8*), i64 4) to i32*)
  %R11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0), i32 %load_target)
  %load_target1 = load i32, i32* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.ziggy* @bolshevic to i8*), i64 8) to i32*)
  %R14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3, i64 0, i64 0), i32 %load_target1)
  %load_target2 = load i32, i32* getelementptr inbounds (%struct.ziggy, %struct.ziggy* @bolshevic, i32 0, i32 0)
  %R19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.4, i64 0, i64 0), i32 %load_target2)
  %load_target3 = load i32, i32* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.ziggy* @bolshevic to i8*), i64 4) to i32*)
  %R23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.5, i64 0, i64 0), i32 %load_target3)
  %load_target4 = load i32, i32* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.ziggy* @bolshevic to i8*), i64 8) to i32*)
  %R27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.6, i64 0, i64 0), i32 %load_target4)
  ret i32 0
}

declare i32 @printf(i8*, ...)
