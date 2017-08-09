; ModuleID = 'out.bc'
source_filename = "dmrC"

%struct.luaL_Reg = type { i8*, i32 (i8*, i32)* }

@base_funcs = private global [1 x %struct.luaL_Reg] zeroinitializer, align 8
@.str = private constant [19 x i8] c"%s called with %d\0A\00"
@.str.1 = private constant [7 x i8] c"myfunc\00"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define internal i32 @myfunc(i8* %ARG1, i32 %ARG2) {
L0:
  %p_0000022B7366D708. = alloca i32
  %name_0000022B7366D548. = alloca i8*
  %0 = alloca i32
  %name_0000022B7366D548.1 = ptrtoint i8** %name_0000022B7366D548. to i64
  %1 = add i64 %name_0000022B7366D548.1, 0
  %2 = inttoptr i64 %1 to i8**
  store i8* %ARG1, i8** %2
  %p_0000022B7366D708.2 = ptrtoint i32* %p_0000022B7366D708. to i64
  %3 = add i64 %p_0000022B7366D708.2, 0
  %4 = inttoptr i64 %3 to i32*
  store i32 %ARG2, i32* %4
  %name_0000022B7366D548.3 = ptrtoint i8** %name_0000022B7366D548. to i64
  %5 = add i64 %name_0000022B7366D548.3, 0
  %6 = inttoptr i64 %5 to i8**
  %R2 = load i8*, i8** %6
  %p_0000022B7366D708.4 = ptrtoint i32* %p_0000022B7366D708. to i64
  %7 = add i64 %p_0000022B7366D708.4, 0
  %8 = inttoptr i64 %7 to i32*
  %R3 = load i32, i32* %8
  %R4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str, i64 0, i64 0), i8* %R2, i32 %R3)
  %p_0000022B7366D708.5 = ptrtoint i32* %p_0000022B7366D708. to i64
  %9 = add i64 %p_0000022B7366D708.5, 0
  %10 = inttoptr i64 %9 to i32*
  %R5 = load i32, i32* %10
  store i32 %R5, i32* %0
  br label %L1

L1:                                               ; preds = %L0
  %11 = load i32, i32* %0
  ret i32 %R5
}

declare i32 @printf(i8*, ...)

define internal i32 @calling(i32 %ARG1) {
L2:
  %p_0000022B7366DA88. = alloca i32
  %0 = alloca i32
  %p_0000022B7366DA88.1 = ptrtoint i32* %p_0000022B7366DA88. to i64
  %1 = add i64 %p_0000022B7366DA88.1, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 %ARG1, i32* %2
  %R7 = load i8*, i8** getelementptr inbounds ([1 x %struct.luaL_Reg], [1 x %struct.luaL_Reg]* @base_funcs, i32 0, i32 0, i32 0)
  %p_0000022B7366DA88.2 = ptrtoint i32* %p_0000022B7366DA88. to i64
  %3 = add i64 %p_0000022B7366DA88.2, 0
  %4 = inttoptr i64 %3 to i32*
  %R8 = load i32, i32* %4
  %R9 = load i32 (i8*, i32)*, i32 (i8*, i32)** inttoptr (i64 add (i64 ptrtoint ([1 x %struct.luaL_Reg]* @base_funcs to i64), i64 8) to i32 (i8*, i32)**)
  %R10 = bitcast i32 (i8*, i32)* %R9 to i8*
  %R103 = bitcast i8* %R10 to i32 (i8*, i32)*
  %R104 = call i32 %R103(i8* %R7, i32 %R8)
  store i32 %R104, i32* %0
  br label %L3

L3:                                               ; preds = %L2
  %5 = load i32, i32* %0
  ret i32 %R104
}

define i32 @main() {
L4:
  %0 = alloca i32
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i8** getelementptr inbounds ([1 x %struct.luaL_Reg], [1 x %struct.luaL_Reg]* @base_funcs, i32 0, i32 0, i32 0)
  store i32 (i8*, i32)* @myfunc, i32 (i8*, i32)** inttoptr (i64 add (i64 ptrtoint ([1 x %struct.luaL_Reg]* @base_funcs to i64), i64 8) to i32 (i8*, i32)**)
  %R14 = call i32 @calling(i32 42)
  %R15 = icmp eq i32 %R14, 42
  %R151 = zext i1 %R15 to i32
  %cond = icmp ne i32 %R151, 0
  %select = select i1 %cond, i32 0, i32 1
  store i32 %select, i32* %0
  br label %L5

L5:                                               ; preds = %L4
  %1 = load i32, i32* %0
  ret i32 %select
}

attributes #0 = { argmemonly nounwind }
