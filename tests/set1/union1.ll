; ModuleID = 'out.bc'
source_filename = "sparse"

%struct.UpVal = type { %union.GCObject*, i8, i8, %struct.lua_TValue*, %union.anno }
%union.GCObject = type { [0 x i8] }
%struct.lua_TValue = type { %union.Value, i32 }
%union.Value = type { [8 x i8] }
%union.anno = type { [16 x i8] }

define internal i32 @close(%struct.UpVal* %ARG1) {
L0:
  %0 = ptrtoint %struct.UpVal* %ARG1 to i64
  %R2 = add i64 %0, 24
  %1 = inttoptr i64 %R2 to i8*
  %2 = ptrtoint %struct.UpVal* %ARG1 to i64
  %3 = add i64 %2, 16
  %4 = inttoptr i64 %3 to %struct.lua_TValue**
  %5 = bitcast i8* %1 to %struct.lua_TValue*
  store %struct.lua_TValue* %5, %struct.lua_TValue** %4
  %6 = ptrtoint %struct.UpVal* %ARG1 to i64
  %7 = add i64 %6, 32
  %8 = inttoptr i64 %7 to i32*
  %load_target = load i32, i32* %8
  ret i32 %load_target
}

define i32 @main() {
L1:
  %uv_0000029CF5A3E928 = alloca %struct.UpVal
  %0 = ptrtoint %struct.UpVal* %uv_0000029CF5A3E928 to i64
  %1 = add i64 %0, 32
  %2 = inttoptr i64 %1 to i32*
  store i32 5, i32* %2
  %R9 = call i32 @close(%struct.UpVal* %uv_0000029CF5A3E928)
  %3 = ptrtoint %struct.UpVal* %uv_0000029CF5A3E928 to i64
  %4 = add i64 %3, 16
  %5 = inttoptr i64 %4 to %struct.lua_TValue**
  %load_target = load %struct.lua_TValue*, %struct.lua_TValue** %5
  %6 = ptrtoint %struct.UpVal* %uv_0000029CF5A3E928 to i64
  %R12 = add i64 %6, 24
  %7 = inttoptr i64 %R12 to i8*
  %8 = ptrtoint %struct.lua_TValue* %load_target to i64
  %9 = ptrtoint i8* %7 to i64
  %R14 = icmp eq i64 %8, %9
  %R141 = zext i1 %R14 to i32
  %R16 = icmp eq i32 %R9, 5
  %R162 = zext i1 %R16 to i32
  %10 = icmp ne i32 %R141, 0
  %11 = icmp ne i32 %R162, 0
  %R17 = and i1 %10, %11
  %R173 = zext i1 %R17 to i32
  %R18 = icmp eq i32 %R173, 0
  %R184 = zext i1 %R18 to i32
  ret i32 %R184
}
