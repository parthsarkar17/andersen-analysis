; ModuleID = '<stdin>'
source_filename = "call_graph.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-redhat-linux-gnu"

%struct.some_class = type { i32, ptr, ptr, i32 }

@global_char = dso_local global i8 103, align 1, !dbg !0
@global_obj = dso_local global { i32, [4 x i8], ptr, ptr, i32, [4 x i8] } { i32 100, [4 x i8] zeroinitializer, ptr @global_char, ptr @swap, i32 200, [4 x i8] zeroinitializer }, align 8, !dbg !5
@.str = private unnamed_addr constant [14 x i8] c"x: %d, y: %d\0A\00", align 1, !dbg !20
@.str.1 = private unnamed_addr constant [58 x i8] c"global: a: %d, b: %d, field1: %d, field2: %c, field3: %d\0A\00", align 1, !dbg !25

; Function Attrs: noinline nounwind uwtable
define dso_local void @swap(ptr noundef %0, ptr noundef %1) #0 !dbg !36 {
    #dbg_value(ptr %0, !38, !DIExpression(), !39)
    #dbg_value(ptr %1, !40, !DIExpression(), !39)
  %3 = load i32, ptr %0, align 4, !dbg !41
    #dbg_value(i32 %3, !42, !DIExpression(), !39)
  %4 = load i32, ptr %1, align 4, !dbg !43
  store i32 %4, ptr %0, align 4, !dbg !44
  store i32 %3, ptr %1, align 4, !dbg !45
  ret void, !dbg !46
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !47 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8, align 1
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
    #dbg_declare(ptr %1, !50, !DIExpression(), !51)
  store i32 37, ptr %1, align 4, !dbg !51
    #dbg_declare(ptr %2, !52, !DIExpression(), !53)
  store i32 45, ptr %2, align 4, !dbg !53
    #dbg_declare(ptr %3, !54, !DIExpression(), !55)
  store i8 97, ptr %3, align 1, !dbg !55
  %6 = call noalias ptr @malloc(i64 noundef 32) #4, !dbg !56
    #dbg_value(ptr %6, !57, !DIExpression(), !59)
  %7 = load i32, ptr %1, align 4, !dbg !60
  %8 = getelementptr inbounds nuw %struct.some_class, ptr %6, i32 0, i32 0, !dbg !61
  store i32 %7, ptr %8, align 8, !dbg !62
  %9 = getelementptr inbounds nuw %struct.some_class, ptr %6, i32 0, i32 1, !dbg !63
  store ptr %3, ptr %9, align 8, !dbg !64
  %10 = getelementptr inbounds nuw %struct.some_class, ptr %6, i32 0, i32 2, !dbg !65
  store ptr @swap, ptr %10, align 8, !dbg !66
  %11 = load i32, ptr %1, align 4, !dbg !67
  %12 = getelementptr inbounds nuw %struct.some_class, ptr %6, i32 0, i32 3, !dbg !68
  store i32 %11, ptr %12, align 8, !dbg !69
  %13 = getelementptr inbounds nuw %struct.some_class, ptr %6, i32 0, i32 2, !dbg !70
  %14 = load ptr, ptr %13, align 8, !dbg !70
  call void %14(ptr noundef %1, ptr noundef %2), !dbg !71
  %15 = load i32, ptr %1, align 4, !dbg !72
  %16 = load i32, ptr %2, align 4, !dbg !73
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %15, i32 noundef %16), !dbg !74
    #dbg_declare(ptr %4, !75, !DIExpression(), !76)
  store i32 10, ptr %4, align 4, !dbg !76
    #dbg_declare(ptr %5, !77, !DIExpression(), !78)
  store i32 20, ptr %5, align 4, !dbg !78
  %18 = load ptr, ptr getelementptr inbounds nuw (%struct.some_class, ptr @global_obj, i32 0, i32 2), align 8, !dbg !79
  call void %18(ptr noundef %4, ptr noundef %5), !dbg !80
  %19 = load i32, ptr %4, align 4, !dbg !81
  %20 = load i32, ptr %5, align 4, !dbg !82
  %21 = load i32, ptr @global_obj, align 8, !dbg !83
  %22 = load ptr, ptr getelementptr inbounds nuw (%struct.some_class, ptr @global_obj, i32 0, i32 1), align 8, !dbg !84
  %23 = load i8, ptr %22, align 1, !dbg !85
  %24 = sext i8 %23 to i32, !dbg !85
  %25 = load i32, ptr getelementptr inbounds nuw (%struct.some_class, ptr @global_obj, i32 0, i32 3), align 8, !dbg !86
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %19, i32 noundef %20, i32 noundef %21, i32 noundef %24, i32 noundef %25), !dbg !87
  call void @free(ptr noundef %6) #5, !dbg !88
  ret i32 0, !dbg !89
}

; Function Attrs: nounwind allocsize(0)
declare dso_local noalias ptr @malloc(i64 noundef) #1

declare dso_local i32 @printf(ptr noundef, ...) #2

; Function Attrs: nounwind
declare dso_local void @free(ptr noundef) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0) }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!30, !31, !32, !33, !34}
!llvm.ident = !{!35}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "global_char", scope: !2, file: !3, line: 20, type: !13, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "clang version 20.1.8 (Fedora 20.1.8-4.fc42)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !4, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "call_graph.c", directory: "/home/parthsarkar/Desktop/UPenn/cis5470/pointer-analysis", checksumkind: CSK_MD5, checksum: "ce55522d6c64b12f68dc4c73a8ced9cf")
!4 = !{!0, !5, !20, !25}
!5 = !DIGlobalVariableExpression(var: !6, expr: !DIExpression())
!6 = distinct !DIGlobalVariable(name: "global_obj", scope: !2, file: !3, line: 21, type: !7, isLocal: false, isDefinition: true)
!7 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "some_class", file: !3, line: 6, size: 256, elements: !8)
!8 = !{!9, !11, !14, !19}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "field1", scope: !7, file: !3, line: 7, baseType: !10, size: 32)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_member, name: "field2", scope: !7, file: !3, line: 8, baseType: !12, size: 64, offset: 64)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !DIDerivedType(tag: DW_TAG_member, name: "f_ptr", scope: !7, file: !3, line: 9, baseType: !15, size: 64, offset: 128)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DISubroutineType(types: !17)
!17 = !{null, !18, !18}
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!19 = !DIDerivedType(tag: DW_TAG_member, name: "field3", scope: !7, file: !3, line: 10, baseType: !10, size: 32, offset: 192)
!20 = !DIGlobalVariableExpression(var: !21, expr: !DIExpression())
!21 = distinct !DIGlobalVariable(scope: null, file: !3, line: 40, type: !22, isLocal: true, isDefinition: true)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 112, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 14)
!25 = !DIGlobalVariableExpression(var: !26, expr: !DIExpression())
!26 = distinct !DIGlobalVariable(scope: null, file: !3, line: 46, type: !27, isLocal: true, isDefinition: true)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 464, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 58)
!30 = !{i32 7, !"Dwarf Version", i32 5}
!31 = !{i32 2, !"Debug Info Version", i32 3}
!32 = !{i32 1, !"wchar_size", i32 4}
!33 = !{i32 7, !"uwtable", i32 2}
!34 = !{i32 7, !"frame-pointer", i32 2}
!35 = !{!"clang version 20.1.8 (Fedora 20.1.8-4.fc42)"}
!36 = distinct !DISubprogram(name: "swap", scope: !3, file: !3, line: 13, type: !16, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !37)
!37 = !{}
!38 = !DILocalVariable(name: "x", arg: 1, scope: !36, file: !3, line: 13, type: !18)
!39 = !DILocation(line: 0, scope: !36)
!40 = !DILocalVariable(name: "y", arg: 2, scope: !36, file: !3, line: 13, type: !18)
!41 = !DILocation(line: 14, column: 19, scope: !36)
!42 = !DILocalVariable(name: "x_deref", scope: !36, file: !3, line: 14, type: !10)
!43 = !DILocation(line: 15, column: 10, scope: !36)
!44 = !DILocation(line: 15, column: 8, scope: !36)
!45 = !DILocation(line: 16, column: 8, scope: !36)
!46 = !DILocation(line: 17, column: 1, scope: !36)
!47 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 28, type: !48, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !37)
!48 = !DISubroutineType(types: !49)
!49 = !{!10}
!50 = !DILocalVariable(name: "x", scope: !47, file: !3, line: 30, type: !10)
!51 = !DILocation(line: 30, column: 9, scope: !47)
!52 = !DILocalVariable(name: "y", scope: !47, file: !3, line: 31, type: !10)
!53 = !DILocation(line: 31, column: 9, scope: !47)
!54 = !DILocalVariable(name: "z", scope: !47, file: !3, line: 32, type: !13)
!55 = !DILocation(line: 32, column: 10, scope: !47)
!56 = !DILocation(line: 33, column: 28, scope: !47)
!57 = !DILocalVariable(name: "o", scope: !47, file: !3, line: 33, type: !58)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!59 = !DILocation(line: 0, scope: !47)
!60 = !DILocation(line: 34, column: 17, scope: !47)
!61 = !DILocation(line: 34, column: 8, scope: !47)
!62 = !DILocation(line: 34, column: 15, scope: !47)
!63 = !DILocation(line: 35, column: 8, scope: !47)
!64 = !DILocation(line: 35, column: 15, scope: !47)
!65 = !DILocation(line: 36, column: 8, scope: !47)
!66 = !DILocation(line: 36, column: 14, scope: !47)
!67 = !DILocation(line: 37, column: 17, scope: !47)
!68 = !DILocation(line: 37, column: 8, scope: !47)
!69 = !DILocation(line: 37, column: 15, scope: !47)
!70 = !DILocation(line: 39, column: 9, scope: !47)
!71 = !DILocation(line: 39, column: 5, scope: !47)
!72 = !DILocation(line: 40, column: 30, scope: !47)
!73 = !DILocation(line: 40, column: 33, scope: !47)
!74 = !DILocation(line: 40, column: 5, scope: !47)
!75 = !DILocalVariable(name: "a", scope: !47, file: !3, line: 43, type: !10)
!76 = !DILocation(line: 43, column: 9, scope: !47)
!77 = !DILocalVariable(name: "b", scope: !47, file: !3, line: 44, type: !10)
!78 = !DILocation(line: 44, column: 9, scope: !47)
!79 = !DILocation(line: 45, column: 17, scope: !47)
!80 = !DILocation(line: 45, column: 5, scope: !47)
!81 = !DILocation(line: 47, column: 12, scope: !47)
!82 = !DILocation(line: 47, column: 15, scope: !47)
!83 = !DILocation(line: 47, column: 29, scope: !47)
!84 = !DILocation(line: 47, column: 49, scope: !47)
!85 = !DILocation(line: 47, column: 37, scope: !47)
!86 = !DILocation(line: 47, column: 68, scope: !47)
!87 = !DILocation(line: 46, column: 5, scope: !47)
!88 = !DILocation(line: 49, column: 5, scope: !47)
!89 = !DILocation(line: 50, column: 5, scope: !47)
