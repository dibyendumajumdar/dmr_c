Global is external, but doesn't have external or weak linkage!
void (%struct.lua_State*, i8*, ...)* @luaG_runerror
Global is external, but doesn't have external or weak linkage!
i32 (%struct.lua_State*, %struct.lua_TValue*)* @luaV_tostring
Global is external, but doesn't have external or weak linkage!
i32 (%struct.lua_State*, %struct.lua_TValue*, %struct.lua_TValue*, %struct.lua_TValue*, i32)* @call_binTM
Global is external, but doesn't have external or weak linkage!
void (%struct.lua_State*, %struct.lua_TValue*, %struct.lua_TValue*)* @luaG_concaterror
Global is external, but doesn't have external or weak linkage!
i8* (%struct.lua_State*, %struct.Mbuffer*, i64)* @luaZ_openspace
Global is external, but doesn't have external or weak linkage!
%union.TString* (%struct.lua_State*, i8*, i64)* @luaS_newlstr
Global is external, but doesn't have external or weak linkage!
void (%struct.lua_State*, i8*, ...)* @luaG_runerror
Global is external, but doesn't have external or weak linkage!
i32 (%struct.lua_State*, %struct.lua_TValue*)* @luaV_tostring
Global is external, but doesn't have external or weak linkage!
i32 (%struct.lua_State*, %struct.lua_TValue*, %struct.lua_TValue*, %struct.lua_TValue*, i32)* @call_binTM
Global is external, but doesn't have external or weak linkage!
void (%struct.lua_State*, %struct.lua_TValue*, %struct.lua_TValue*)* @luaG_concaterror
Global is external, but doesn't have external or weak linkage!
i8* (%struct.lua_State*, %struct.Mbuffer*, i64)* @luaZ_openspace
Global is external, but doesn't have external or weak linkage!
%union.TString* (%struct.lua_State*, i8*, i64)* @luaS_newlstr


; ModuleID = 'sparse'
source_filename = "sparse"

%struct.lua_TValue = type { %union.Value, i32 }
%union.Value = type { [8 x i8] }
%struct.lua_State = type { %union.GCObject*, i8, i8, i8, %struct.lua_TValue*, %struct.lua_TValue*, %struct.global_State*, %struct.CallInfo*, i32*, %struct.lua_TValue*, %struct.lua_TValue*, %struct.CallInfo*, %struct.CallInfo*, i32, i32, i16, i16, i8, i8, i32, i32, void (%struct.lua_State*, %struct.lua_Debug*)*, %struct.lua_TValue, %struct.lua_TValue, %union.GCObject*, %union.GCObject*, %struct.lua_longjmp*, i64 }
%struct.global_State = type { %struct.stringtable, i8* (i8*, i8*, i64, i64)*, i8*, i8, i8, i32, %union.GCObject*, %union.GCObject**, %union.GCObject*, %union.GCObject*, %union.GCObject*, %union.GCObject*, %struct.Mbuffer, i64, i64, i64, i64, i32, i32, i32 (%struct.lua_State*)*, %struct.lua_TValue, %struct.lua_State*, %struct.UpVal, [9 x %struct.Table*], [17 x %union.TString*] }
%struct.stringtable = type { %union.GCObject**, i32, i32 }
%struct.Mbuffer = type { i8*, i64, i64 }
%struct.UpVal = type { %union.GCObject*, i8, i8, %struct.lua_TValue*, %union.anno }
%union.anno = type { [16 x i8] }
%struct.Table = type { %union.GCObject*, i8, i8, i8, i8, %struct.Table*, %struct.lua_TValue*, %struct.Node*, %struct.Node*, %union.GCObject*, i32 }
%struct.Node = type { %struct.lua_TValue, %union.TKey }
%union.TKey = type { [0 x i8] }
%union.TString = type { [24 x i8] }
%struct.CallInfo = type { %struct.lua_TValue*, %struct.lua_TValue*, %struct.lua_TValue*, i32*, i32, i32 }
%struct.lua_Debug = type { i32, i8*, i8*, i8*, i8*, i32, i32, i32, i32, [0 x i8], i32 }
%union.GCObject = type { [184 x i8] }
%struct.lua_longjmp = type {}

@_CRT_glob = private global i32 0, align 4
@luaO_nilobject_ = private global %struct.lua_TValue zeroinitializer, align 8
@.str = private constant [23 x i8] c"string length overflow\00"

declare internal void @luaG_runerror(%struct.lua_State*, i8*, ...)

declare internal i32 @luaV_tostring(%struct.lua_State*, %struct.lua_TValue*)

declare internal i32 @call_binTM(%struct.lua_State*, %struct.lua_TValue*, %struct.lua_TValue*, %struct.lua_TValue*, i32)

declare internal void @luaG_concaterror(%struct.lua_State*, %struct.lua_TValue*, %struct.lua_TValue*)

declare internal i8* @luaZ_openspace(%struct.lua_State*, %struct.Mbuffer*, i64)

declare internal %union.TString* @luaS_newlstr(%struct.lua_State*, i8*, i64)

define internal void @luaV_concat(%struct.lua_State* %ARG1, i32 %ARG2, i32 %ARG3) {
L0:
  %0 = alloca i32
  %1 = alloca i32
  %2 = alloca i32
  %3 = alloca i64
  %4 = alloca i64
  %5 = alloca i32
  %6 = alloca i64
  %7 = alloca i32
  %8 = alloca i32
  store i32 %ARG2, i32* %8
  store i32 %ARG2, i32* %2
  store i32 %ARG3, i32* %0
  br label %L1

L1:                                               ; preds = %L21, %L0
  %9 = bitcast %struct.lua_State* %ARG1 to %struct.lua_TValue**
  %10 = bitcast %struct.lua_TValue** %9 to i8*
  %11 = getelementptr inbounds i8, i8* %10, i64 24
  %12 = bitcast i8* %11 to %struct.lua_TValue**
  %load_target = load %struct.lua_TValue*, %struct.lua_TValue** %12
  %13 = load i32, i32* %0
  %R4 = sext i32 %13 to i64
  %R5 = mul i64 %R4, 16
  %14 = bitcast %struct.lua_TValue* %load_target to i8*
  %15 = getelementptr inbounds i8, i8* %14, i64 %R5
  %16 = bitcast i8* %15 to %struct.lua_TValue*
  %17 = bitcast %struct.lua_TValue* %16 to i8*
  %18 = getelementptr inbounds i8, i8* %17, i64 16
  %19 = bitcast i8* %18 to %struct.lua_TValue*
  %20 = bitcast %struct.lua_TValue* %16 to i32*
  %21 = bitcast i32* %20 to i8*
  %22 = getelementptr inbounds i8, i8* %21, i64 -8
  %23 = bitcast i8* %22 to i32*
  %load_target1 = load i32, i32* %23
  %R11 = icmp eq i32 %load_target1, 4
  %R112 = zext i1 %R11 to i32
  store i32 2, i32* %7
  %cond = icmp ne i32 %R112, 0
  br i1 %cond, label %L3, label %L2

L2:                                               ; preds = %L1
  %R15 = icmp eq i32 %load_target1, 3
  %R153 = zext i1 %R15 to i32
  %cond4 = icmp ne i32 %R153, 0
  br i1 %cond4, label %L3, label %L5

L3:                                               ; preds = %L2, %L1
  %24 = bitcast %struct.lua_TValue* %16 to i32*
  %25 = bitcast i32* %24 to i8*
  %26 = getelementptr inbounds i8, i8* %25, i64 8
  %27 = bitcast i8* %26 to i32*
  %load_target5 = load i32, i32* %27
  %R19 = icmp eq i32 %load_target5, 4
  %R196 = zext i1 %R19 to i32
  %cond7 = icmp ne i32 %R196, 0
  br i1 %cond7, label %L7, label %L4

L4:                                               ; preds = %L3
  %28 = bitcast %struct.lua_TValue* %19 to i8*
  %29 = getelementptr inbounds i8, i8* %28, i64 -16
  %30 = bitcast i8* %29 to %struct.lua_TValue*
  %R23 = call i32 @luaV_tostring(%struct.lua_State* %ARG1, %struct.lua_TValue* %30)
  %cond8 = icmp ne i32 %R23, 0
  br i1 %cond8, label %L7, label %L5

L5:                                               ; preds = %L4, %L2
  %31 = bitcast %struct.lua_TValue* %19 to i8*
  %32 = getelementptr inbounds i8, i8* %31, i64 -32
  %33 = bitcast i8* %32 to %struct.lua_TValue*
  %34 = bitcast %struct.lua_TValue* %19 to i8*
  %35 = getelementptr inbounds i8, i8* %34, i64 -16
  %36 = bitcast i8* %35 to %struct.lua_TValue*
  %R31 = call i32 @call_binTM(%struct.lua_State* %ARG1, %struct.lua_TValue* %33, %struct.lua_TValue* %36, %struct.lua_TValue* %33, i32 15)
  %cond9 = icmp ne i32 %R31, 0
  br i1 %cond9, label %L21, label %L6

L6:                                               ; preds = %L5
  %37 = bitcast %struct.lua_TValue* %19 to i8*
  %38 = getelementptr inbounds i8, i8* %37, i64 -16
  %39 = bitcast i8* %38 to %struct.lua_TValue*
  call void @luaG_concaterror(%struct.lua_State* %ARG1, %struct.lua_TValue* %33, %struct.lua_TValue* %39)
  br label %L21

L7:                                               ; preds = %L4, %L3
  %40 = bitcast %struct.lua_TValue* %16 to %union.GCObject**
  %41 = bitcast %union.GCObject** %40 to i8*
  %42 = getelementptr inbounds i8, i8* %41, i64 0
  %43 = bitcast i8* %42 to %union.GCObject**
  %load_target10 = load %union.GCObject*, %union.GCObject** %43
  %44 = bitcast %union.GCObject* %load_target10 to i64*
  %45 = bitcast i64* %44 to i8*
  %46 = getelementptr inbounds i8, i8* %45, i64 16
  %47 = bitcast i8* %46 to i64*
  %load_target11 = load i64, i64* %47
  %cond12 = icmp ne i64 %load_target11, 0
  br i1 %cond12, label %L10, label %L8

L8:                                               ; preds = %L7
  %48 = bitcast %struct.lua_TValue* %16 to i32*
  %49 = bitcast i32* %48 to i8*
  %50 = getelementptr inbounds i8, i8* %49, i64 -8
  %51 = bitcast i8* %50 to i32*
  %load_target13 = load i32, i32* %51
  %R45 = icmp eq i32 %load_target13, 4
  %R4514 = zext i1 %R45 to i32
  %cond15 = icmp ne i32 %R4514, 0
  br i1 %cond15, label %L21, label %L9

L9:                                               ; preds = %L8
  %52 = bitcast %struct.lua_TValue* %19 to i8*
  %53 = getelementptr inbounds i8, i8* %52, i64 -32
  %54 = bitcast i8* %53 to %struct.lua_TValue*
  %R49 = call i32 @luaV_tostring(%struct.lua_State* %ARG1, %struct.lua_TValue* %54)
  br label %L21

L10:                                              ; preds = %L7
  store i32 1, i32* %1
  store i64 %load_target11, i64* %4
  store i64 %load_target11, i64* %3
  br label %L11

L11:                                              ; preds = %L16, %L10
  %55 = load i32, i32* %1
  %56 = load i32, i32* %2
  %R57 = icmp slt i32 %55, %56
  %R5716 = zext i1 %R57 to i32
  store i32 %56, i32* %8
  %cond17 = icmp ne i32 %R5716, 0
  br i1 %cond17, label %L12, label %L17

L12:                                              ; preds = %L11
  %R60 = sext i32 %55 to i64
  %R61 = mul i64 %R60, 16
  %57 = bitcast %struct.lua_TValue* %19 to i8*
  %58 = getelementptr inbounds i8, i8* %57, i64 %R61
  %59 = bitcast i8* %58 to %struct.lua_TValue*
  %60 = bitcast %struct.lua_TValue* %59 to i32*
  %61 = bitcast i32* %60 to i8*
  %62 = getelementptr inbounds i8, i8* %61, i64 -8
  %63 = bitcast i8* %62 to i32*
  %load_target18 = load i32, i32* %63
  %R65 = icmp eq i32 %load_target18, 4
  %R6519 = zext i1 %R65 to i32
  %cond20 = icmp ne i32 %R6519, 0
  br i1 %cond20, label %L14, label %L13

L13:                                              ; preds = %L12
  %64 = bitcast %struct.lua_TValue* %59 to i8*
  %65 = getelementptr inbounds i8, i8* %64, i64 -16
  %66 = bitcast i8* %65 to %struct.lua_TValue*
  %R73 = call i32 @luaV_tostring(%struct.lua_State* %ARG1, %struct.lua_TValue* %66)
  %cond21 = icmp ne i32 %R73, 0
  br i1 %cond21, label %L14, label %L17

L14:                                              ; preds = %L13, %L12
  %67 = bitcast %struct.lua_TValue* %59 to %union.GCObject**
  %68 = bitcast %union.GCObject** %67 to i8*
  %69 = getelementptr inbounds i8, i8* %68, i64 -16
  %70 = bitcast i8* %69 to %union.GCObject**
  %load_target22 = load %union.GCObject*, %union.GCObject** %70
  %71 = bitcast %union.GCObject* %load_target22 to i64*
  %72 = bitcast i64* %71 to i8*
  %73 = getelementptr inbounds i8, i8* %72, i64 16
  %74 = bitcast i8* %73 to i64*
  %load_target23 = load i64, i64* %74
  %75 = load i64, i64* %3
  %R84 = sub i64 -3, %75
  %R85 = icmp uge i64 %load_target23, %R84
  %R8524 = zext i1 %R85 to i32
  %cond25 = icmp ne i32 %R8524, 0
  br i1 %cond25, label %L15, label %L16

L15:                                              ; preds = %L14
  call void (%struct.lua_State*, i8*, ...) @luaG_runerror(%struct.lua_State* %ARG1, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i64 0, i64 0))
  br label %L16

L16:                                              ; preds = %L15, %L14
  %R91 = add i64 %75, %load_target23
  store i64 %R91, i64* %4
  store i64 %R91, i64* %3
  %R94 = add i32 %55, 1
  store i32 %R94, i32* %1
  br label %L11

L17:                                              ; preds = %L13, %L11
  %76 = bitcast %struct.lua_State* %ARG1 to %struct.global_State**
  %77 = bitcast %struct.global_State** %76 to i8*
  %78 = getelementptr inbounds i8, i8* %77, i64 32
  %79 = bitcast i8* %78 to %struct.global_State**
  %load_target26 = load %struct.global_State*, %struct.global_State** %79
  %80 = bitcast %struct.global_State* %load_target26 to i8*
  %81 = getelementptr inbounds i8, i8* %80, i32 88
  %82 = bitcast i8* %81 to %struct.global_State*
  %83 = load i64, i64* %4
  %84 = bitcast %struct.global_State* %82 to %struct.Mbuffer*
  %R100 = call i8* @luaZ_openspace(%struct.lua_State* %ARG1, %struct.Mbuffer* %84, i64 %83)
  store i64 0, i64* %6
  store i32 %55, i32* %5
  br label %L18

L18:                                              ; preds = %L19, %L17
  %85 = load i32, i32* %5
  %R103 = icmp sgt i32 %85, 0
  %R10327 = zext i1 %R103 to i32
  %86 = load i64, i64* %6
  %cond28 = icmp ne i32 %R10327, 0
  br i1 %cond28, label %L19, label %L20

L19:                                              ; preds = %L18
  %R106 = sext i32 %85 to i64
  %R107 = mul i64 %R106, 16
  %87 = bitcast %struct.lua_TValue* %19 to i8*
  %88 = getelementptr inbounds i8, i8* %87, i64 %R107
  %89 = bitcast i8* %88 to %struct.lua_TValue*
  %90 = bitcast %struct.lua_TValue* %89 to %union.GCObject**
  %91 = bitcast %union.GCObject** %90 to i8*
  %92 = getelementptr inbounds i8, i8* %91, i64 0
  %93 = bitcast i8* %92 to %union.GCObject**
  %load_target29 = load %union.GCObject*, %union.GCObject** %93
  %94 = bitcast %union.GCObject* %load_target29 to i64*
  %95 = bitcast i64* %94 to i8*
  %96 = getelementptr inbounds i8, i8* %95, i64 16
  %97 = bitcast i8* %96 to i64*
  %load_target30 = load i64, i64* %97
  %98 = getelementptr inbounds i8, i8* %R100, i64 %86
  %99 = bitcast %union.GCObject* %load_target29 to i8*
  %100 = getelementptr inbounds i8, i8* %99, i64 24
  %101 = bitcast i8* %100 to %union.GCObject*
  %R123 = bitcast %union.GCObject* %101 to i8*
  %R126 = call i8* @memcpy(i8* %98, i8* %R123, i64 %load_target30)
  %R130 = add i64 %86, %load_target30
  store i64 %R130, i64* %6
  %R133 = add i32 %85, -1
  store i32 %R133, i32* %5
  br label %L18

L20:                                              ; preds = %L18
  %R136 = sext i32 %55 to i64
  %R137 = mul i64 %R136, 16
  %102 = bitcast %struct.lua_TValue* %19 to i8*
  %103 = getelementptr inbounds i8, i8* %102, i64 %R137
  %104 = bitcast i8* %103 to %struct.lua_TValue*
  %R142 = call %union.TString* @luaS_newlstr(%struct.lua_State* %ARG1, i8* %R100, i64 %86)
  %R143 = bitcast %union.TString* %R142 to %union.GCObject*
  %105 = bitcast %struct.lua_TValue* %104 to %union.GCObject**
  %106 = bitcast %union.GCObject** %105 to i8*
  %107 = getelementptr inbounds i8, i8* %106, i64 0
  %108 = bitcast i8* %107 to %union.GCObject**
  store %union.GCObject* %R143, %union.GCObject** %108
  %109 = bitcast %struct.lua_TValue* %104 to i32*
  %110 = bitcast i32* %109 to i8*
  %111 = getelementptr inbounds i8, i8* %110, i64 8
  %112 = bitcast i8* %111 to i32*
  store i32 4, i32* %112
  store i32 %55, i32* %7
  br label %L21

L21:                                              ; preds = %L20, %L9, %L8, %L6, %L5
  %113 = load i32, i32* %7
  %R147 = add i32 %113, -1
  %114 = load i32, i32* %8
  %R150 = sub i32 %114, %R147
  %R156 = sub i32 %13, %R147
  store i32 %R150, i32* %8
  store i32 %R150, i32* %2
  store i32 %R156, i32* %0
  %R159 = icmp sgt i32 %R150, 1
  %R15931 = zext i1 %R159 to i32
  %cond32 = icmp ne i32 %R15931, 0
  br i1 %cond32, label %L1, label %L22

L22:                                              ; preds = %L21
  ret void
}

declare i8* @memcpy(i8*, i8*, i64)
