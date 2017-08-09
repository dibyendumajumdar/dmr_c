; ModuleID = 'out.bc'
source_filename = "dmrC"

%struct.ziggy = type { i32, i32, i32 }

@bolshevic = global %struct.ziggy zeroinitializer, align 4
@.str = private constant [8 x i8] c"a = %d\0A\00"
@.str.1 = private constant [18 x i8] c"bolshevic.a = %d\0A\00"
@.str.2 = private constant [18 x i8] c"bolshevic.b = %d\0A\00"
@.str.3 = private constant [18 x i8] c"bolshevic.c = %d\0A\00"
@.str.4 = private constant [14 x i8] c"tsar->a = %d\0A\00"
@.str.5 = private constant [14 x i8] c"tsar->b = %d\0A\00"
@.str.6 = private constant [14 x i8] c"tsar->c = %d\0A\00"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define i32 @main() {
L0:
  %tsar_000001B5A8ABC1B8. = alloca %struct.ziggy*
  %b_000001B5A8ABBF18. = alloca i32*
  %a_000001B5A8ABBE38. = alloca i32
  %0 = alloca i32
  %a_000001B5A8ABBE38.1 = ptrtoint i32* %a_000001B5A8ABBE38. to i64
  %1 = add i64 %a_000001B5A8ABBE38.1, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 42, i32* %2
  %b_000001B5A8ABBF18.2 = ptrtoint i32** %b_000001B5A8ABBF18. to i64
  %3 = add i64 %b_000001B5A8ABBF18.2, 0
  %4 = inttoptr i64 %3 to i32**
  store i32* %a_000001B5A8ABBE38., i32** %4
  %b_000001B5A8ABBF18.3 = ptrtoint i32** %b_000001B5A8ABBF18. to i64
  %5 = add i64 %b_000001B5A8ABBF18.3, 0
  %6 = inttoptr i64 %5 to i32**
  %R3 = load i32*, i32** %6
  %R34 = ptrtoint i32* %R3 to i64
  %7 = add i64 %R34, 0
  %8 = inttoptr i64 %7 to i32*
  %R4 = load i32, i32* %8
  %R5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), i32 %R4)
  store i32 12, i32* getelementptr inbounds (%struct.ziggy, %struct.ziggy* @bolshevic, i32 0, i32 0)
  store i32 34, i32* inttoptr (i64 add (i64 ptrtoint (%struct.ziggy* @bolshevic to i64), i64 4) to i32*)
  store i32 56, i32* inttoptr (i64 add (i64 ptrtoint (%struct.ziggy* @bolshevic to i64), i64 8) to i32*)
  %R7 = load i32, i32* getelementptr inbounds (%struct.ziggy, %struct.ziggy* @bolshevic, i32 0, i32 0)
  %R8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0), i32 %R7)
  %R10 = load i32, i32* inttoptr (i64 add (i64 ptrtoint (%struct.ziggy* @bolshevic to i64), i64 4) to i32*)
  %R11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0), i32 %R10)
  %R13 = load i32, i32* inttoptr (i64 add (i64 ptrtoint (%struct.ziggy* @bolshevic to i64), i64 8) to i32*)
  %R14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3, i64 0, i64 0), i32 %R13)
  %tsar_000001B5A8ABC1B8.5 = ptrtoint %struct.ziggy** %tsar_000001B5A8ABC1B8. to i64
  %9 = add i64 %tsar_000001B5A8ABC1B8.5, 0
  %10 = inttoptr i64 %9 to %struct.ziggy**
  store %struct.ziggy* @bolshevic, %struct.ziggy** %10
  %tsar_000001B5A8ABC1B8.6 = ptrtoint %struct.ziggy** %tsar_000001B5A8ABC1B8. to i64
  %11 = add i64 %tsar_000001B5A8ABC1B8.6, 0
  %12 = inttoptr i64 %11 to %struct.ziggy**
  %R17 = load %struct.ziggy*, %struct.ziggy** %12
  %R177 = ptrtoint %struct.ziggy* %R17 to i64
  %13 = add i64 %R177, 0
  %14 = inttoptr i64 %13 to i32*
  %R18 = load i32, i32* %14
  %R19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.4, i64 0, i64 0), i32 %R18)
  %tsar_000001B5A8ABC1B8.8 = ptrtoint %struct.ziggy** %tsar_000001B5A8ABC1B8. to i64
  %15 = add i64 %tsar_000001B5A8ABC1B8.8, 0
  %16 = inttoptr i64 %15 to %struct.ziggy**
  %R21 = load %struct.ziggy*, %struct.ziggy** %16
  %R219 = ptrtoint %struct.ziggy* %R21 to i64
  %17 = add i64 %R219, 4
  %18 = inttoptr i64 %17 to i32*
  %R22 = load i32, i32* %18
  %R23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.5, i64 0, i64 0), i32 %R22)
  %tsar_000001B5A8ABC1B8.10 = ptrtoint %struct.ziggy** %tsar_000001B5A8ABC1B8. to i64
  %19 = add i64 %tsar_000001B5A8ABC1B8.10, 0
  %20 = inttoptr i64 %19 to %struct.ziggy**
  %R25 = load %struct.ziggy*, %struct.ziggy** %20
  %R2511 = ptrtoint %struct.ziggy* %R25 to i64
  %21 = add i64 %R2511, 8
  %22 = inttoptr i64 %21 to i32*
  %R26 = load i32, i32* %22
  %R27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.6, i64 0, i64 0), i32 %R26)
  store i32 0, i32* %0
  br label %L1

L1:                                               ; preds = %L0
  %23 = load i32, i32* %0
  ret i32 0
}

declare i32 @printf(i8*, ...)

attributes #0 = { argmemonly nounwind }
