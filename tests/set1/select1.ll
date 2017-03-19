; ModuleID = 'out.bc'
source_filename = "sparse"

%struct.lua_TValue = type { %union.Value, i32 }
%union.Value = type { [8 x i8] }
%union.Closure = type { [24 x i8] }

@luaO_nilobject_ = private global %struct.lua_TValue zeroinitializer, align 8

define internal %struct.lua_TValue* @select(%union.Closure* %ARG1, i32 %ARG2) {
L0:
  %0 = bitcast %union.Closure* %ARG1 to i8*
  %1 = getelementptr inbounds i8, i8* %0, %struct.lua_TValue* inttoptr (i64 8 to %struct.lua_TValue*)
  %2 = bitcast i8* %1 to %union.Closure*
  %R9 = icmp eq i32 %ARG2, 1
  %R91 = zext i1 %R9 to i32
  %cond = icmp ne i32 %R91, 0
  %src2 = bitcast %union.Closure* %2 to %struct.lua_TValue*
  %select = select i1 %cond, %struct.lua_TValue* %src2, %struct.lua_TValue* @luaO_nilobject_
  ret %struct.lua_TValue* %select
}

define i32 @main() {
L1:
  %cl_00000169BF19EB18 = alloca %union.Closure
  %0 = alloca i32
  %R13 = call %struct.lua_TValue* @select(%union.Closure* %cl_00000169BF19EB18, i32 0)
  %1 = ptrtoint %struct.lua_TValue* %R13 to i64
  %R15 = icmp eq i64 %1, ptrtoint (%struct.lua_TValue* @luaO_nilobject_ to i64)
  %R151 = zext i1 %R15 to i32
  %cond = icmp ne i32 %R151, 0
  br i1 %cond, label %L2, label %L3

L2:                                               ; preds = %L1
  %R17 = call %struct.lua_TValue* @select(%union.Closure* %cl_00000169BF19EB18, i32 1)
  %2 = ptrtoint %struct.lua_TValue* %R17 to i64
  %R19 = icmp ne i64 %2, ptrtoint (%struct.lua_TValue* @luaO_nilobject_ to i64)
  %R192 = zext i1 %R19 to i32
  store i32 %R192, i32* %0
  br label %L4

L3:                                               ; preds = %L1
  store i32 0, i32* %0
  br label %L4

L4:                                               ; preds = %L3, %L2
  %3 = load i32, i32* %0
  %R21 = icmp eq i32 %3, 0
  %R213 = zext i1 %R21 to i32
  ret i32 %R213
}
