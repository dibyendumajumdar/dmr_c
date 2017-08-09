; ModuleID = 'out.bc'
source_filename = "dmrC"

%struct.UpVal = type { %union.GCObject*, i8, i8, %struct.lua_TValue*, %union.anno }
%union.GCObject = type opaque
%struct.lua_TValue = type { %union.Value, i32 }
%union.Value = type { [8 x i8] }
%union.anno = type { [16 x i8] }

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define internal i32 @close(%struct.UpVal* %ARG1) {
L0:
  %uv_000002800E14EB78. = alloca %struct.UpVal*
  %0 = alloca i32
  %uv_000002800E14EB78.1 = ptrtoint %struct.UpVal** %uv_000002800E14EB78. to i64
  %1 = add i64 %uv_000002800E14EB78.1, 0
  %2 = inttoptr i64 %1 to %struct.UpVal**
  store %struct.UpVal* %ARG1, %struct.UpVal** %2
  %uv_000002800E14EB78.2 = ptrtoint %struct.UpVal** %uv_000002800E14EB78. to i64
  %3 = add i64 %uv_000002800E14EB78.2, 0
  %4 = inttoptr i64 %3 to %struct.UpVal**
  %R1 = load %struct.UpVal*, %struct.UpVal** %4
  %R13 = ptrtoint %struct.UpVal* %R1 to i64
  %R2 = add i64 %R13, 24
  %R24 = inttoptr i64 %R2 to i8*
  %R245 = ptrtoint i8* %R24 to i64
  %R3 = add i64 %R245, 0
  %R36 = inttoptr i64 %R3 to %struct.lua_TValue*
  %uv_000002800E14EB78.7 = ptrtoint %struct.UpVal** %uv_000002800E14EB78. to i64
  %5 = add i64 %uv_000002800E14EB78.7, 0
  %6 = inttoptr i64 %5 to %struct.UpVal**
  %R4 = load %struct.UpVal*, %struct.UpVal** %6
  %R48 = ptrtoint %struct.UpVal* %R4 to i64
  %7 = add i64 %R48, 16
  %8 = inttoptr i64 %7 to %struct.lua_TValue**
  store %struct.lua_TValue* %R36, %struct.lua_TValue** %8
  %uv_000002800E14EB78.9 = ptrtoint %struct.UpVal** %uv_000002800E14EB78. to i64
  %9 = add i64 %uv_000002800E14EB78.9, 0
  %10 = inttoptr i64 %9 to %struct.UpVal**
  %R5 = load %struct.UpVal*, %struct.UpVal** %10
  %R510 = ptrtoint %struct.UpVal* %R5 to i64
  %11 = add i64 %R510, 32
  %12 = inttoptr i64 %11 to i32*
  %R6 = load i32, i32* %12
  store i32 %R6, i32* %0
  br label %L1

L1:                                               ; preds = %L0
  %13 = load i32, i32* %0
  ret i32 %R6
}

define i32 @main() {
L2:
  %tt_000002800E14F278. = alloca i32
  %uv_000002800E14F198. = alloca %struct.UpVal
  %0 = alloca i32
  %uv_000002800E14F198.1 = ptrtoint %struct.UpVal* %uv_000002800E14F198. to i64
  %1 = add i64 %uv_000002800E14F198.1, 32
  %2 = inttoptr i64 %1 to i32*
  store i32 5, i32* %2
  %R9 = call i32 @close(%struct.UpVal* %uv_000002800E14F198.)
  %tt_000002800E14F278.2 = ptrtoint i32* %tt_000002800E14F278. to i64
  %3 = add i64 %tt_000002800E14F278.2, 0
  %4 = inttoptr i64 %3 to i32*
  store i32 %R9, i32* %4
  %uv_000002800E14F198.3 = ptrtoint %struct.UpVal* %uv_000002800E14F198. to i64
  %5 = add i64 %uv_000002800E14F198.3, 16
  %6 = inttoptr i64 %5 to %struct.lua_TValue**
  %R10 = load %struct.lua_TValue*, %struct.lua_TValue** %6
  %R11 = bitcast %struct.UpVal* %uv_000002800E14F198. to i8*
  %R114 = ptrtoint i8* %R11 to i64
  %R12 = add i64 %R114, 24
  %R125 = inttoptr i64 %R12 to i8*
  %R1256 = ptrtoint i8* %R125 to i64
  %R13 = add i64 %R1256, 0
  %R137 = inttoptr i64 %R13 to %struct.lua_TValue*
  %7 = ptrtoint %struct.lua_TValue* %R10 to i64
  %8 = ptrtoint %struct.lua_TValue* %R137 to i64
  %R14 = icmp eq i64 %7, %8
  %R148 = zext i1 %R14 to i32
  %tt_000002800E14F278.9 = ptrtoint i32* %tt_000002800E14F278. to i64
  %9 = add i64 %tt_000002800E14F278.9, 0
  %10 = inttoptr i64 %9 to i32*
  %R15 = load i32, i32* %10
  %R16 = icmp eq i32 %R15, 5
  %R1610 = zext i1 %R16 to i32
  %11 = icmp ne i32 %R148, 0
  %12 = icmp ne i32 %R1610, 0
  %R17 = and i1 %11, %12
  %R1711 = zext i1 %R17 to i32
  %cond = icmp ne i32 %R1711, 0
  %select = select i1 %cond, i32 0, i32 1
  store i32 %select, i32* %0
  br label %L3

L3:                                               ; preds = %L2
  %13 = load i32, i32* %0
  ret i32 %select
}

attributes #0 = { argmemonly nounwind }
