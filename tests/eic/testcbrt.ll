; ModuleID = 'testcbrt.c'
source_filename = "testcbrt.c"
target datalayout = "e-m:x-p:32:32-i64:64-f80:32-n8:16:32-a:0:32-S32"
target triple = "i686-pc-windows-msvc"

%union.anon = type { double }

$"\01??_C@_0N@CCECFIIH@Failed?5test?6?$AA@" = comdat any

$"\01??_C@_0N@KMFMGHKK@Passed?5test?6?$AA@" = comdat any

$"\01??_C@_03PPOCCAPH@?$CFf?6?$AA@" = comdat any

@"\01??_C@_0N@CCECFIIH@Failed?5test?6?$AA@" = linkonce_odr unnamed_addr constant [13 x i8] c"Failed test\0A\00", comdat, align 1
@"\01??_C@_0N@KMFMGHKK@Passed?5test?6?$AA@" = linkonce_odr unnamed_addr constant [13 x i8] c"Passed test\0A\00", comdat, align 1
@"\01??_C@_03PPOCCAPH@?$CFf?6?$AA@" = linkonce_odr unnamed_addr constant [4 x i8] c"%f\0A\00", comdat, align 1
@str = private unnamed_addr constant [12 x i8] c"Passed test\00"
@str.1 = private unnamed_addr constant [12 x i8] c"Failed test\00"

; Function Attrs: nounwind
define i32 @main() local_unnamed_addr #0 {
entry:
  %call = tail call fastcc double @cbrtl()
  %add = fadd double %call, 5.000000e-01
  %conv = fptosi double %add to i32
  %cmp = icmp eq i32 %conv, 3
  br i1 %cmp, label %if.else, label %if.then

if.then:                                          ; preds = %entry
  %puts4 = tail call i32 @puts(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @str.1, i32 0, i32 0))
  br label %if.end

if.else:                                          ; preds = %entry
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @str, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret i32 0
}

; Function Attrs: nounwind
define internal fastcc double @cbrtl() unnamed_addr #0 {
entry:
  %ut = alloca %union.anon, align 8
  %ux = alloca %union.anon, align 8
  %0 = bitcast %union.anon* %ut to i8*
  call void @llvm.lifetime.start(i64 8, i8* %0) #3
  %1 = bitcast %union.anon* %ux to i8*
  call void @llvm.lifetime.start(i64 8, i8* %1) #3
  %t = getelementptr inbounds %union.anon, %union.anon* %ut, i32 0, i32 0
  store double 1.000000e+00, double* %t, align 8, !tbaa !1
  %pt = bitcast %union.anon* %ut to [2 x i32]*
  %arrayidx = bitcast %union.anon* %ut to i32*
  %2 = load i32, i32* %arrayidx, align 8, !tbaa !5
  %cmp = icmp eq i32 %2, 0
  %conv = zext i1 %cmp to i32
  store double 0.000000e+00, double* %t, align 8, !tbaa !1
  %t2 = getelementptr inbounds %union.anon, %union.anon* %ux, i32 0, i32 0
  store double 2.700000e+01, double* %t2, align 8, !tbaa !1
  %pt3 = bitcast %union.anon* %ux to [2 x i32]*
  %arrayidx4 = getelementptr inbounds [2 x i32], [2 x i32]* %pt3, i32 0, i32 %conv
  %3 = load i32, i32* %arrayidx4, align 4, !tbaa !5
  %and = and i32 %3, -2147483648
  %xor = xor i32 %and, %3
  %cmp5 = icmp sgt i32 %xor, 2146435071
  br i1 %cmp5, label %cleanup, label %if.end

if.end:                                           ; preds = %entry
  %sub = xor i32 %conv, 1
  %arrayidx8 = getelementptr inbounds [2 x i32], [2 x i32]* %pt3, i32 0, i32 %sub
  %4 = load i32, i32* %arrayidx8, align 4, !tbaa !5
  %or = or i32 %4, %xor
  %cmp9 = icmp eq i32 %or, 0
  br i1 %cmp9, label %cleanup, label %if.end13

if.end13:                                         ; preds = %if.end
  store i32 %xor, i32* %arrayidx4, align 4, !tbaa !5
  %cmp16 = icmp slt i32 %xor, 1048576
  br i1 %cmp16, label %if.then18, label %if.else

if.then18:                                        ; preds = %if.end13
  %arrayidx20 = getelementptr inbounds [2 x i32], [2 x i32]* %pt, i32 0, i32 %conv
  store i32 1129316352, i32* %arrayidx20, align 4, !tbaa !5
  %5 = load double, double* %t, align 8, !tbaa !1
  %mul = fmul double %5, 2.700000e+01
  store double %mul, double* %t, align 8, !tbaa !1
  %6 = load i32, i32* %arrayidx20, align 4, !tbaa !5
  %div = udiv i32 %6, 3
  %add24 = add nuw i32 %div, 696219795
  store i32 %add24, i32* %arrayidx20, align 4, !tbaa !5
  br label %if.end31

if.else:                                          ; preds = %if.end13
  %div271 = udiv i32 %xor, 3
  %add28 = add nuw nsw i32 %div271, 715094163
  %arrayidx30 = getelementptr inbounds [2 x i32], [2 x i32]* %pt, i32 0, i32 %conv
  store i32 %add28, i32* %arrayidx30, align 4, !tbaa !5
  br label %if.end31

if.end31:                                         ; preds = %if.else, %if.then18
  %7 = load double, double* %t, align 8, !tbaa !1
  %mul34 = fmul double %7, %7
  %8 = load double, double* %t2, align 8, !tbaa !1
  %div36 = fdiv double %mul34, %8
  %mul38 = fmul double %7, %div36
  %add39 = fadd double %mul38, 0x3FE15F15F15F15F1
  %add40 = fadd double %add39, 0x3FF6A0EA0EA0EA0F
  %div41 = fdiv double 0x3FE691DE2532C834, %add39
  %add422 = fsub double %add40, %div41
  %div43 = fdiv double 0x3FF9B6DB6DB6DB6E, %add422
  %add44 = fadd double %div43, 0x3FD6DB6DB6DB6DB7
  %mul46 = fmul double %7, %add44
  store double %mul46, double* %t, align 8, !tbaa !1
  %arrayidx49 = getelementptr inbounds [2 x i32], [2 x i32]* %pt, i32 0, i32 %sub
  store i32 0, i32* %arrayidx49, align 4, !tbaa !5
  %arrayidx51 = getelementptr inbounds [2 x i32], [2 x i32]* %pt, i32 0, i32 %conv
  %9 = load i32, i32* %arrayidx51, align 4, !tbaa !5
  %add52 = add i32 %9, 1
  store i32 %add52, i32* %arrayidx51, align 4, !tbaa !5
  %10 = load double, double* %t, align 8, !tbaa !1
  %mul55 = fmul double %10, %10
  %11 = load double, double* %t2, align 8, !tbaa !1
  %div57 = fdiv double %11, %mul55
  %add60 = fadd double %10, %10
  %sub62 = fsub double %div57, %10
  %add63 = fadd double %add60, %div57
  %div64 = fdiv double %sub62, %add63
  %mul67 = fmul double %10, %div64
  %add68 = fadd double %10, %mul67
  store double %add68, double* %t, align 8, !tbaa !1
  %12 = load i32, i32* %arrayidx51, align 4, !tbaa !5
  %or72 = or i32 %12, %and
  store i32 %or72, i32* %arrayidx51, align 4, !tbaa !5
  %13 = load double, double* %t, align 8, !tbaa !1
  %mul74 = fmul double %13, %13
  %div75 = fdiv double 2.700000e+01, %mul74
  %sub76 = fsub double %13, %div75
  %mul77 = fmul double %sub76, 0x3FD5555555555555
  %sub78 = fsub double %13, %mul77
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @"\01??_C@_03PPOCCAPH@?$CFf?6?$AA@", i32 0, i32 0), double %sub78)
  br label %cleanup

cleanup:                                          ; preds = %if.end, %entry, %if.end31
  %retval.0 = phi double [ %sub78, %if.end31 ], [ 5.400000e+01, %entry ], [ 2.700000e+01, %if.end ]
  call void @llvm.lifetime.end(i64 8, i8* %1) #3
  call void @llvm.lifetime.end(i64 8, i8* %0) #3
  ret double %retval.0
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #1

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #2

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #3

attributes #0 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (trunk)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"double", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !3, i64 0}
