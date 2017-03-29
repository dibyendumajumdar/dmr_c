; ModuleID = 'out.bc'
source_filename = "sparse"

%struct.UpVal = type { %union.GCObject*, i8, i8, %struct.lua_TValue*, %union.anno }
%union.GCObject = type opaque
%struct.lua_TValue = type { %union.Value, i32 }
%union.Value = type { [8 x i8] }
%union.anno = type { [16 x i8] }

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define internal i32 @close(%struct.UpVal* %ARG1) {
L0:
  %uv_0000026319200A18. = alloca %struct.UpVal*
  %0 = alloca i32
  %uv_0000026319200A18.1 = ptrtoint %struct.UpVal** %uv_0000026319200A18. to i64
  %uv_0000026319200A18.12 = add i64 %uv_0000026319200A18.1, 0
  %uv_0000026319200A18.13 = inttoptr i64 %uv_0000026319200A18.12 to %struct.UpVal**
  store %struct.UpVal* %ARG1, %struct.UpVal** %uv_0000026319200A18.13
  %uv_0000026319200A18.4 = ptrtoint %struct.UpVal** %uv_0000026319200A18. to i64
  %uv_0000026319200A18.45 = add i64 %uv_0000026319200A18.4, 0
  %uv_0000026319200A18.46 = inttoptr i64 %uv_0000026319200A18.45 to %struct.UpVal**
  %R1 = load %struct.UpVal*, %struct.UpVal** %uv_0000026319200A18.46
  %R17 = ptrtoint %struct.UpVal* %R1 to i64
  %R2 = add i64 %R17, 24
  %R28 = inttoptr i64 %R2 to i8*
  %R289 = ptrtoint i8* %R28 to i64
  %R3 = add i64 %R289, 0
  %R310 = inttoptr i64 %R3 to %struct.lua_TValue*
  %uv_0000026319200A18.11 = ptrtoint %struct.UpVal** %uv_0000026319200A18. to i64
  %uv_0000026319200A18.1112 = add i64 %uv_0000026319200A18.11, 0
  %uv_0000026319200A18.1113 = inttoptr i64 %uv_0000026319200A18.1112 to %struct.UpVal**
  %R4 = load %struct.UpVal*, %struct.UpVal** %uv_0000026319200A18.1113
  %R414 = ptrtoint %struct.UpVal* %R4 to i64
  %R41415 = add i64 %R414, 16
  %R41416 = inttoptr i64 %R41415 to %struct.lua_TValue**
  store %struct.lua_TValue* %R310, %struct.lua_TValue** %R41416
  %uv_0000026319200A18.17 = ptrtoint %struct.UpVal** %uv_0000026319200A18. to i64
  %uv_0000026319200A18.1718 = add i64 %uv_0000026319200A18.17, 0
  %uv_0000026319200A18.1719 = inttoptr i64 %uv_0000026319200A18.1718 to %struct.UpVal**
  %R5 = load %struct.UpVal*, %struct.UpVal** %uv_0000026319200A18.1719
  %R520 = ptrtoint %struct.UpVal* %R5 to i64
  %R52021 = add i64 %R520, 32
  %R52022 = inttoptr i64 %R52021 to i32*
  %R6 = load i32, i32* %R52022
  store i32 %R6, i32* %0
  br label %L1

L1:                                               ; preds = %L0
  %1 = load i32, i32* %0
  ret i32 %R6
}

define i32 @main() {
L2:
  %tt_0000026319201118. = alloca i32
  %uv_0000026319201038. = alloca %struct.UpVal
  %0 = alloca i32
  %uv_0000026319201038.1 = ptrtoint %struct.UpVal* %uv_0000026319201038. to i64
  %uv_0000026319201038.12 = add i64 %uv_0000026319201038.1, 32
  %uv_0000026319201038.13 = inttoptr i64 %uv_0000026319201038.12 to i32*
  store i32 5, i32* %uv_0000026319201038.13
  %R9 = call i32 @close(%struct.UpVal* %uv_0000026319201038.)
  %tt_0000026319201118.4 = ptrtoint i32* %tt_0000026319201118. to i64
  %tt_0000026319201118.45 = add i64 %tt_0000026319201118.4, 0
  %tt_0000026319201118.46 = inttoptr i64 %tt_0000026319201118.45 to i32*
  store i32 %R9, i32* %tt_0000026319201118.46
  %uv_0000026319201038.7 = ptrtoint %struct.UpVal* %uv_0000026319201038. to i64
  %uv_0000026319201038.78 = add i64 %uv_0000026319201038.7, 16
  %uv_0000026319201038.79 = inttoptr i64 %uv_0000026319201038.78 to %struct.lua_TValue**
  %R10 = load %struct.lua_TValue*, %struct.lua_TValue** %uv_0000026319201038.79
  %R11 = bitcast %struct.UpVal* %uv_0000026319201038. to i8*
  %R1110 = ptrtoint i8* %R11 to i64
  %R12 = add i64 %R1110, 24
  %R1211 = inttoptr i64 %R12 to i8*
  %R121112 = ptrtoint i8* %R1211 to i64
  %R13 = add i64 %R121112, 0
  %R1313 = inttoptr i64 %R13 to %struct.lua_TValue*
  %1 = ptrtoint %struct.lua_TValue* %R10 to i64
  %2 = ptrtoint %struct.lua_TValue* %R1313 to i64
  %R14 = icmp eq i64 %1, %2
  %R1414 = zext i1 %R14 to i32
  %tt_0000026319201118.15 = ptrtoint i32* %tt_0000026319201118. to i64
  %tt_0000026319201118.1516 = add i64 %tt_0000026319201118.15, 0
  %tt_0000026319201118.1517 = inttoptr i64 %tt_0000026319201118.1516 to i32*
  %R15 = load i32, i32* %tt_0000026319201118.1517
  %R16 = icmp eq i32 %R15, 5
  %R1618 = zext i1 %R16 to i32
  %3 = icmp ne i32 %R1414, 0
  %4 = icmp ne i32 %R1618, 0
  %R17 = and i1 %3, %4
  %R1719 = zext i1 %R17 to i32
  %cond = icmp ne i32 %R1719, 0
  %select = select i1 %cond, i32 0, i32 1
  store i32 %select, i32* %0
  br label %L3

L3:                                               ; preds = %L2
  %5 = load i32, i32* %0
  ret i32 %select
}

attributes #0 = { argmemonly nounwind }
