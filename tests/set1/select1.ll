; ModuleID = 'out.bc'
source_filename = "dmrC"

%struct.lua_TValue = type { %union.Value, i32 }
%union.Value = type { [8 x i8] }
%union.Closure = type { [24 x i8] }

@luaO_nilobject_ = private global %struct.lua_TValue zeroinitializer, align 8

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define internal %struct.lua_TValue* @select(%union.Closure* %ARG1, i32 %ARG2) {
L0:
  %op_0000015B909EE5F8. = alloca i32
  %closure_0000015B909EE438. = alloca %union.Closure*
  %0 = alloca %struct.lua_TValue*
  %closure_0000015B909EE438.1 = ptrtoint %union.Closure** %closure_0000015B909EE438. to i64
  %1 = add i64 %closure_0000015B909EE438.1, 0
  %2 = inttoptr i64 %1 to %union.Closure**
  store %union.Closure* %ARG1, %union.Closure** %2
  %op_0000015B909EE5F8.2 = ptrtoint i32* %op_0000015B909EE5F8. to i64
  %3 = add i64 %op_0000015B909EE5F8.2, 0
  %4 = inttoptr i64 %3 to i32*
  store i32 %ARG2, i32* %4
  %closure_0000015B909EE438.3 = ptrtoint %union.Closure** %closure_0000015B909EE438. to i64
  %5 = add i64 %closure_0000015B909EE438.3, 0
  %6 = inttoptr i64 %5 to %union.Closure**
  %R1 = load %union.Closure*, %union.Closure** %6
  %R14 = ptrtoint %union.Closure* %R1 to i64
  %R2 = add i64 %R14, 0
  %R25 = inttoptr i64 %R2 to i8*
  %R256 = ptrtoint i8* %R25 to i64
  %R3 = add i64 %R256, 8
  %R37 = inttoptr i64 %R3 to %struct.lua_TValue*
  %R378 = ptrtoint %struct.lua_TValue* %R37 to i64
  %R4 = add i64 %R378, 0
  %R49 = inttoptr i64 %R4 to %struct.lua_TValue*
  %op_0000015B909EE5F8.10 = ptrtoint i32* %op_0000015B909EE5F8. to i64
  %7 = add i64 %op_0000015B909EE5F8.10, 0
  %8 = inttoptr i64 %7 to i32*
  %R8 = load i32, i32* %8
  %R9 = icmp eq i32 %R8, 1
  %R911 = zext i1 %R9 to i32
  %cond = icmp ne i32 %R911, 0
  %select = select i1 %cond, %struct.lua_TValue* %R49, %struct.lua_TValue* @luaO_nilobject_
  store %struct.lua_TValue* %select, %struct.lua_TValue** %0
  br label %L1

L1:                                               ; preds = %L0
  %9 = load %struct.lua_TValue*, %struct.lua_TValue** %0
  ret %struct.lua_TValue* %select
}

define i32 @main() {
L2:
  %cl_0000015B909EECF8. = alloca %union.Closure
  %0 = alloca i32
  %1 = alloca i32
  %R13 = call %struct.lua_TValue* @select(%union.Closure* %cl_0000015B909EECF8., i32 0)
  %2 = ptrtoint %struct.lua_TValue* %R13 to i64
  %R15 = icmp eq i64 %2, ptrtoint (%struct.lua_TValue* @luaO_nilobject_ to i64)
  %R151 = zext i1 %R15 to i32
  %cond = icmp ne i32 %R151, 0
  br i1 %cond, label %L3, label %L4

L3:                                               ; preds = %L2
  %R17 = call %struct.lua_TValue* @select(%union.Closure* %cl_0000015B909EECF8., i32 1)
  %3 = ptrtoint %struct.lua_TValue* %R17 to i64
  %R19 = icmp ne i64 %3, ptrtoint (%struct.lua_TValue* @luaO_nilobject_ to i64)
  %R192 = zext i1 %R19 to i32
  store i32 %R192, i32* %0
  br label %L5

L4:                                               ; preds = %L2
  store i32 0, i32* %0
  br label %L5

L5:                                               ; preds = %L4, %L3
  %4 = load i32, i32* %0
  %cond3 = icmp ne i32 %4, 0
  %select = select i1 %cond3, i32 0, i32 1
  store i32 %select, i32* %1
  br label %L6

L6:                                               ; preds = %L5
  %5 = load i32, i32* %1
  ret i32 %select
}

attributes #0 = { argmemonly nounwind }
