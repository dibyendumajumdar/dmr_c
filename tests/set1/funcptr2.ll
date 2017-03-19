; ModuleID = 'out.bc'
source_filename = "sparse"

%struct.luaL_Reg = type { i8*, i32 (i8*, i32)* }

@base_funcs = private global [1 x %struct.luaL_Reg] zeroinitializer, align 8
@.str = private constant [19 x i8] c"%s called with %d\0A\00"
@.str.1 = private constant [7 x i8] c"myfunc\00"

define internal i32 @myfunc(i8* %ARG1, i32 %ARG2) {
L0:
  %R4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str, i64 0, i64 0), i8* %ARG1, i32 %ARG2)
  ret i32 %ARG2
}

declare i32 @printf(i8*, ...)

define internal i32 @calling(i32 %ARG1) {
L1:
  %load_target = load i8*, i8** getelementptr inbounds ([1 x %struct.luaL_Reg], [1 x %struct.luaL_Reg]* @base_funcs, i32 0, i32 0, i32 0)
  %load_target1 = load i32 (i8*, i32)*, i32 (i8*, i32)** bitcast (i8* getelementptr inbounds (i8, i8* bitcast ([1 x %struct.luaL_Reg]* @base_funcs to i8*), i64 8) to i32 (i8*, i32)**)
  %R10 = bitcast i32 (i8*, i32)* %load_target1 to i8*
  %R102 = bitcast i8* %R10 to i32 (i8*, i32)*
  %R103 = call i32 %R102(i8* %load_target, i32 %ARG1)
  ret i32 %R103
}

define i32 @main() {
L2:
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i8** getelementptr inbounds ([1 x %struct.luaL_Reg], [1 x %struct.luaL_Reg]* @base_funcs, i32 0, i32 0, i32 0)
  store i32 (i8*, i32)* @myfunc, i32 (i8*, i32)** bitcast (i8* getelementptr inbounds (i8, i8* bitcast ([1 x %struct.luaL_Reg]* @base_funcs to i8*), i64 8) to i32 (i8*, i32)**)
  %R14 = call i32 @calling(i32 42)
  %R16 = icmp ne i32 %R14, 42
  %R161 = zext i1 %R16 to i32
  ret i32 %R161
}
