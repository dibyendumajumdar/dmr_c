; ModuleID = 'out.bc'
source_filename = "sparse"

%struct.UpVal = type { %union.GCObject*, i8, i8, %struct.lua_TValue*, %union.anno }
%union.GCObject = type { [0 x i8] }
%struct.lua_TValue = type { %union.Value, i32 }
%union.Value = type { [8 x i8] }
%union.anno = type { [16 x i8] }

define internal i32 @close(%struct.UpVal* %ARG1) {
L0:
  %0 = bitcast %struct.UpVal* %ARG1 to i8*
  %1 = getelementptr inbounds i8, i8* %0, inttoptr (i64 24 to i8*)
  %2 = bitcast i8* %1 to %struct.UpVal*
  %3 = bitcast %struct.UpVal* %ARG1 to %struct.lua_TValue**
  %4 = bitcast %struct.lua_TValue** %3 to i8*
  %5 = getelementptr inbounds i8, i8* %4, i64 16
  %6 = bitcast i8* %5 to %struct.lua_TValue**
  %7 = bitcast %struct.UpVal* %2 to %struct.lua_TValue*
  store %struct.lua_TValue* %7, %struct.lua_TValue** %6
  %8 = bitcast %struct.UpVal* %ARG1 to i32*
  %9 = bitcast i32* %8 to i8*
  %10 = getelementptr inbounds i8, i8* %9, i64 32
  %11 = bitcast i8* %10 to i32*
  %load_target = load i32, i32* %11
  ret i32 %load_target
}

define i32 @main() {
L1:
  %uv_000001D81102C5C8 = alloca %struct.UpVal
  %0 = bitcast %struct.UpVal* %uv_000001D81102C5C8 to i32*
  %1 = bitcast i32* %0 to i8*
  %2 = getelementptr inbounds i8, i8* %1, i64 32
  %3 = bitcast i8* %2 to i32*
  store i32 5, i32* %3
  %R9 = call i32 @close(%struct.UpVal* %uv_000001D81102C5C8)
  %4 = bitcast %struct.UpVal* %uv_000001D81102C5C8 to %struct.lua_TValue**
  %5 = bitcast %struct.lua_TValue** %4 to i8*
  %6 = getelementptr inbounds i8, i8* %5, i64 16
  %7 = bitcast i8* %6 to %struct.lua_TValue**
  %load_target = load %struct.lua_TValue*, %struct.lua_TValue** %7
  %8 = bitcast %struct.UpVal* %uv_000001D81102C5C8 to i8*
  %9 = getelementptr inbounds i8, i8* %8, inttoptr (i64 24 to i8*)
  %10 = bitcast i8* %9 to %struct.UpVal*
  %11 = ptrtoint %struct.lua_TValue* %load_target to i64
  %12 = ptrtoint %struct.UpVal* %10 to i64
  %R14 = icmp eq i64 %11, %12
  %R141 = zext i1 %R14 to i32
  %R16 = icmp eq i32 %R9, 5
  %R162 = zext i1 %R16 to i32
  %13 = icmp ne i32 %R141, 0
  %14 = icmp ne i32 %R162, 0
  %R17 = and i1 %13, %14
  %R173 = zext i1 %R17 to i32
  %R18 = icmp eq i32 %R173, 0
  %R184 = zext i1 %R18 to i32
  ret i32 %R184
}
