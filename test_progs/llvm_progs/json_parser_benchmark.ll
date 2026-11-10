; ModuleID = 'json_parser_benchmark.c'
source_filename = "json_parser_benchmark.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%struct._json_value = type { %struct._json_value*, i32, %union.anon, %union.anon.2 }
%union.anon = type { %struct.anon }
%struct.anon = type { i32, i8* }
%union.anon.2 = type { %struct._json_value* }
%struct.json_settings = type { i64, i32, i8* (i64, i32, i8*)*, void (i8*, i8*)*, i8*, i64 }
%struct.json_state = type { i64, %struct.json_settings, i32, i8*, i32, i32 }
%struct.anon.0 = type { i32, %struct._json_object_entry* }
%struct._json_object_entry = type { i8*, i32, %struct._json_value* }
%struct.anon.1 = type { i32, %struct._json_value** }

@stdin = external global %struct._IO_FILE*, align 8
@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [22 x i8] c"Unable to parse data\0A\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"%u:%u: Unexpected EOF in string\00", align 1
@.str.2 = private unnamed_addr constant [36 x i8] c"%u:%u: Invalid character value `%c`\00", align 1
@.str.3 = private unnamed_addr constant [39 x i8] c"%u:%u: Unexpected EOF in block comment\00", align 1
@.str.4 = private unnamed_addr constant [32 x i8] c"%u:%u: Comment not allowed here\00", align 1
@.str.5 = private unnamed_addr constant [22 x i8] c"%u:%u: EOF unexpected\00", align 1
@.str.6 = private unnamed_addr constant [51 x i8] c"%u:%u: Unexpected `%c` in comment opening sequence\00", align 1
@.str.7 = private unnamed_addr constant [30 x i8] c"%u:%u: Trailing garbage: `%c`\00", align 1
@.str.8 = private unnamed_addr constant [22 x i8] c"%u:%u: Unexpected `]`\00", align 1
@.str.9 = private unnamed_addr constant [32 x i8] c"%u:%u: Expected `,` before `%c`\00", align 1
@.str.10 = private unnamed_addr constant [32 x i8] c"%u:%u: Expected `:` before `%c`\00", align 1
@.str.11 = private unnamed_addr constant [42 x i8] c"%u:%u: Unexpected `%c` when seeking value\00", align 1
@.str.12 = private unnamed_addr constant [31 x i8] c"%u:%u: Expected `,` before `\22`\00", align 1
@.str.13 = private unnamed_addr constant [33 x i8] c"%u:%u: Unexpected `%c` in object\00", align 1
@.str.14 = private unnamed_addr constant [34 x i8] c"%u:%u: Unexpected `0` before `%c`\00", align 1
@.str.15 = private unnamed_addr constant [33 x i8] c"%u:%u: Expected digit before `.`\00", align 1
@.str.16 = private unnamed_addr constant [32 x i8] c"%u:%u: Expected digit after `.`\00", align 1
@.str.17 = private unnamed_addr constant [32 x i8] c"%u:%u: Expected digit after `e`\00", align 1
@.str.18 = private unnamed_addr constant [21 x i8] c"%u:%u: Unknown value\00", align 1
@.str.19 = private unnamed_addr constant [26 x i8] c"Memory allocation failure\00", align 1
@.str.20 = private unnamed_addr constant [34 x i8] c"%u:%u: Too long (caught overflow)\00", align 1
@.str.21 = private unnamed_addr constant [14 x i8] c"Unknown error\00", align 1
@json_value_none = dso_local constant %struct._json_value zeroinitializer, align 8, !dbg !0

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !133 {
entry:
  %retval = alloca i32, align 4
  %file_contents = alloca [65536 x i8], align 16
  %file_size = alloca i64, align 8
  %value = alloca %struct._json_value*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [65536 x i8]* %file_contents, metadata !137, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata i64* %file_size, metadata !142, metadata !DIExpression()), !dbg !145
  %arraydecay = getelementptr inbounds [65536 x i8], [65536 x i8]* %file_contents, i64 0, i64 0, !dbg !146
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !147
  %call = call i64 @fread(i8* noundef %arraydecay, i64 noundef 1, i64 noundef 65536, %struct._IO_FILE* noundef %0), !dbg !148
  store i64 %call, i64* %file_size, align 8, !dbg !145
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !149
  %call1 = call i32 @ferror(%struct._IO_FILE* noundef %1) #8, !dbg !151
  %tobool = icmp ne i32 %call1, 0, !dbg !151
  br i1 %tobool, label %if.then, label %if.end, !dbg !152

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4, !dbg !153
  br label %return, !dbg !153

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._json_value** %value, metadata !155, metadata !DIExpression()), !dbg !156
  %arraydecay2 = getelementptr inbounds [65536 x i8], [65536 x i8]* %file_contents, i64 0, i64 0, !dbg !157
  %2 = load i64, i64* %file_size, align 8, !dbg !158
  %call3 = call %struct._json_value* @json_parse(i8* noundef %arraydecay2, i64 noundef %2), !dbg !159
  store %struct._json_value* %call3, %struct._json_value** %value, align 8, !dbg !156
  %3 = load %struct._json_value*, %struct._json_value** %value, align 8, !dbg !160
  %cmp = icmp eq %struct._json_value* %3, null, !dbg !162
  br i1 %cmp, label %if.then4, label %if.end6, !dbg !163

if.then4:                                         ; preds = %if.end
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !164
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %4, i8* noundef getelementptr inbounds ([22 x i8], [22 x i8]* @.str, i64 0, i64 0)), !dbg !166
  call void @exit(i32 noundef 0) #9, !dbg !167
  unreachable, !dbg !167

if.end6:                                          ; preds = %if.end
  %5 = load %struct._json_value*, %struct._json_value** %value, align 8, !dbg !168
  call void @json_value_free(%struct._json_value* noundef %5), !dbg !169
  store i32 0, i32* %retval, align 4, !dbg !170
  br label %return, !dbg !170

return:                                           ; preds = %if.end6, %if.then
  %6 = load i32, i32* %retval, align 4, !dbg !171
  ret i32 %6, !dbg !171
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i64 @fread(i8* noundef, i64 noundef, i64 noundef, %struct._IO_FILE* noundef) #2

; Function Attrs: nounwind
declare i32 @ferror(%struct._IO_FILE* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct._json_value* @json_parse(i8* noundef %json, i64 noundef %length) #0 !dbg !172 {
entry:
  %json.addr = alloca i8*, align 8
  %length.addr = alloca i64, align 8
  %settings = alloca %struct.json_settings, align 8
  store i8* %json, i8** %json.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %json.addr, metadata !177, metadata !DIExpression()), !dbg !178
  store i64 %length, i64* %length.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %length.addr, metadata !179, metadata !DIExpression()), !dbg !180
  call void @llvm.dbg.declare(metadata %struct.json_settings* %settings, metadata !181, metadata !DIExpression()), !dbg !197
  %0 = bitcast %struct.json_settings* %settings to i8*, !dbg !197
  call void @llvm.memset.p0i8.i64(i8* align 8 %0, i8 0, i64 48, i1 false), !dbg !197
  %1 = load i8*, i8** %json.addr, align 8, !dbg !198
  %2 = load i64, i64* %length.addr, align 8, !dbg !199
  %call = call %struct._json_value* @json_parse_ex(%struct.json_settings* noundef %settings, i8* noundef %1, i64 noundef %2, i8* noundef null), !dbg !200
  ret %struct._json_value* %call, !dbg !201
}

declare i32 @fprintf(%struct._IO_FILE* noundef, i8* noundef, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @json_value_free(%struct._json_value* noundef %value) #0 !dbg !202 {
entry:
  %value.addr = alloca %struct._json_value*, align 8
  %settings = alloca %struct.json_settings, align 8
  store %struct._json_value* %value, %struct._json_value** %value.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._json_value** %value.addr, metadata !205, metadata !DIExpression()), !dbg !206
  call void @llvm.dbg.declare(metadata %struct.json_settings* %settings, metadata !207, metadata !DIExpression()), !dbg !208
  %0 = bitcast %struct.json_settings* %settings to i8*, !dbg !208
  call void @llvm.memset.p0i8.i64(i8* align 8 %0, i8 0, i64 48, i1 false), !dbg !208
  %mem_free = getelementptr inbounds %struct.json_settings, %struct.json_settings* %settings, i32 0, i32 3, !dbg !209
  store void (i8*, i8*)* @default_free, void (i8*, i8*)** %mem_free, align 8, !dbg !210
  %1 = load %struct._json_value*, %struct._json_value** %value.addr, align 8, !dbg !211
  call void @json_value_free_ex(%struct.json_settings* noundef %settings, %struct._json_value* noundef %1), !dbg !212
  ret void, !dbg !213
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct._json_value* @json_parse_ex(%struct.json_settings* noundef %settings, i8* noundef %json, i64 noundef %length, i8* noundef %error_buf) #0 !dbg !214 {
entry:
  %retval = alloca %struct._json_value*, align 8
  %settings.addr = alloca %struct.json_settings*, align 8
  %json.addr = alloca i8*, align 8
  %length.addr = alloca i64, align 8
  %error_buf.addr = alloca i8*, align 8
  %error = alloca [128 x i8], align 16
  %end = alloca i8*, align 8
  %top = alloca %struct._json_value*, align 8
  %root = alloca %struct._json_value*, align 8
  %alloc = alloca %struct._json_value*, align 8
  %state = alloca %struct.json_state, align 8
  %flags = alloca i64, align 8
  %num_digits = alloca i32, align 4
  %num_e = alloca double, align 8
  %num_fraction = alloca double, align 8
  %uchar = alloca i32, align 4
  %uc_b1 = alloca i8, align 1
  %uc_b2 = alloca i8, align 1
  %uc_b3 = alloca i8, align 1
  %uc_b4 = alloca i8, align 1
  %string = alloca i8*, align 8
  %string_length = alloca i32, align 4
  %b = alloca i8, align 1
  %uchar2 = alloca i32, align 4
  %chars = alloca i8**, align 8
  %integer847 = alloca i64, align 8
  %integer914 = alloca i64, align 8
  %integer964 = alloca i64, align 8
  %parent1043 = alloca %struct._json_value*, align 8
  store %struct.json_settings* %settings, %struct.json_settings** %settings.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.json_settings** %settings.addr, metadata !218, metadata !DIExpression()), !dbg !219
  store i8* %json, i8** %json.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %json.addr, metadata !220, metadata !DIExpression()), !dbg !221
  store i64 %length, i64* %length.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %length.addr, metadata !222, metadata !DIExpression()), !dbg !223
  store i8* %error_buf, i8** %error_buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %error_buf.addr, metadata !224, metadata !DIExpression()), !dbg !225
  call void @llvm.dbg.declare(metadata [128 x i8]* %error, metadata !226, metadata !DIExpression()), !dbg !230
  call void @llvm.dbg.declare(metadata i8** %end, metadata !231, metadata !DIExpression()), !dbg !232
  call void @llvm.dbg.declare(metadata %struct._json_value** %top, metadata !233, metadata !DIExpression()), !dbg !234
  call void @llvm.dbg.declare(metadata %struct._json_value** %root, metadata !235, metadata !DIExpression()), !dbg !236
  call void @llvm.dbg.declare(metadata %struct._json_value** %alloc, metadata !237, metadata !DIExpression()), !dbg !238
  store %struct._json_value* null, %struct._json_value** %alloc, align 8, !dbg !238
  call void @llvm.dbg.declare(metadata %struct.json_state* %state, metadata !239, metadata !DIExpression()), !dbg !249
  %0 = bitcast %struct.json_state* %state to i8*, !dbg !249
  call void @llvm.memset.p0i8.i64(i8* align 8 %0, i8 0, i64 80, i1 false), !dbg !249
  call void @llvm.dbg.declare(metadata i64* %flags, metadata !250, metadata !DIExpression()), !dbg !251
  store i64 0, i64* %flags, align 8, !dbg !251
  call void @llvm.dbg.declare(metadata i32* %num_digits, metadata !252, metadata !DIExpression()), !dbg !253
  store i32 0, i32* %num_digits, align 4, !dbg !253
  call void @llvm.dbg.declare(metadata double* %num_e, metadata !254, metadata !DIExpression()), !dbg !255
  store double 0.000000e+00, double* %num_e, align 8, !dbg !255
  call void @llvm.dbg.declare(metadata double* %num_fraction, metadata !256, metadata !DIExpression()), !dbg !257
  store double 0.000000e+00, double* %num_fraction, align 8, !dbg !257
  %1 = load i64, i64* %length.addr, align 8, !dbg !258
  %cmp = icmp uge i64 %1, 3, !dbg !260
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !261

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %json.addr, align 8, !dbg !262
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !262
  %3 = load i8, i8* %arrayidx, align 1, !dbg !262
  %conv = zext i8 %3 to i32, !dbg !263
  %cmp1 = icmp eq i32 %conv, 239, !dbg !264
  br i1 %cmp1, label %land.lhs.true3, label %if.end, !dbg !265

land.lhs.true3:                                   ; preds = %land.lhs.true
  %4 = load i8*, i8** %json.addr, align 8, !dbg !266
  %arrayidx4 = getelementptr inbounds i8, i8* %4, i64 1, !dbg !266
  %5 = load i8, i8* %arrayidx4, align 1, !dbg !266
  %conv5 = zext i8 %5 to i32, !dbg !267
  %cmp6 = icmp eq i32 %conv5, 187, !dbg !268
  br i1 %cmp6, label %land.lhs.true8, label %if.end, !dbg !269

land.lhs.true8:                                   ; preds = %land.lhs.true3
  %6 = load i8*, i8** %json.addr, align 8, !dbg !270
  %arrayidx9 = getelementptr inbounds i8, i8* %6, i64 2, !dbg !270
  %7 = load i8, i8* %arrayidx9, align 1, !dbg !270
  %conv10 = zext i8 %7 to i32, !dbg !271
  %cmp11 = icmp eq i32 %conv10, 191, !dbg !272
  br i1 %cmp11, label %if.then, label %if.end, !dbg !273

if.then:                                          ; preds = %land.lhs.true8
  %8 = load i8*, i8** %json.addr, align 8, !dbg !274
  %add.ptr = getelementptr inbounds i8, i8* %8, i64 3, !dbg !274
  store i8* %add.ptr, i8** %json.addr, align 8, !dbg !274
  %9 = load i64, i64* %length.addr, align 8, !dbg !276
  %sub = sub i64 %9, 3, !dbg !276
  store i64 %sub, i64* %length.addr, align 8, !dbg !276
  br label %if.end, !dbg !277

if.end:                                           ; preds = %if.then, %land.lhs.true8, %land.lhs.true3, %land.lhs.true, %entry
  %arrayidx13 = getelementptr inbounds [128 x i8], [128 x i8]* %error, i64 0, i64 0, !dbg !278
  store i8 0, i8* %arrayidx13, align 16, !dbg !279
  %10 = load i8*, i8** %json.addr, align 8, !dbg !280
  %11 = load i64, i64* %length.addr, align 8, !dbg !281
  %add.ptr14 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !282
  store i8* %add.ptr14, i8** %end, align 8, !dbg !283
  %settings15 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 1, !dbg !284
  %12 = bitcast %struct.json_settings* %settings15 to i8*, !dbg !285
  %13 = load %struct.json_settings*, %struct.json_settings** %settings.addr, align 8, !dbg !286
  %14 = bitcast %struct.json_settings* %13 to i8*, !dbg !285
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %12, i8* align 8 %14, i64 48, i1 false), !dbg !285
  %settings16 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 1, !dbg !287
  %mem_alloc = getelementptr inbounds %struct.json_settings, %struct.json_settings* %settings16, i32 0, i32 2, !dbg !289
  %15 = load i8* (i64, i32, i8*)*, i8* (i64, i32, i8*)** %mem_alloc, align 8, !dbg !289
  %tobool = icmp ne i8* (i64, i32, i8*)* %15, null, !dbg !290
  br i1 %tobool, label %if.end20, label %if.then17, !dbg !291

if.then17:                                        ; preds = %if.end
  %settings18 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 1, !dbg !292
  %mem_alloc19 = getelementptr inbounds %struct.json_settings, %struct.json_settings* %settings18, i32 0, i32 2, !dbg !293
  store i8* (i64, i32, i8*)* @default_alloc, i8* (i64, i32, i8*)** %mem_alloc19, align 8, !dbg !294
  br label %if.end20, !dbg !295

if.end20:                                         ; preds = %if.then17, %if.end
  %settings21 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 1, !dbg !296
  %mem_free = getelementptr inbounds %struct.json_settings, %struct.json_settings* %settings21, i32 0, i32 3, !dbg !298
  %16 = load void (i8*, i8*)*, void (i8*, i8*)** %mem_free, align 8, !dbg !298
  %tobool22 = icmp ne void (i8*, i8*)* %16, null, !dbg !299
  br i1 %tobool22, label %if.end26, label %if.then23, !dbg !300

if.then23:                                        ; preds = %if.end20
  %settings24 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 1, !dbg !301
  %mem_free25 = getelementptr inbounds %struct.json_settings, %struct.json_settings* %settings24, i32 0, i32 3, !dbg !302
  store void (i8*, i8*)* @default_free, void (i8*, i8*)** %mem_free25, align 8, !dbg !303
  br label %if.end26, !dbg !304

if.end26:                                         ; preds = %if.then23, %if.end20
  %first_pass = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 2, !dbg !305
  store i32 1, i32* %first_pass, align 8, !dbg !307
  br label %for.cond, !dbg !308

for.cond:                                         ; preds = %for.inc1079, %if.end26
  %first_pass27 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 2, !dbg !309
  %17 = load i32, i32* %first_pass27, align 8, !dbg !309
  %cmp28 = icmp sge i32 %17, 0, !dbg !311
  br i1 %cmp28, label %for.body, label %for.end1082, !dbg !312

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %uchar, metadata !313, metadata !DIExpression()), !dbg !316
  call void @llvm.dbg.declare(metadata i8* %uc_b1, metadata !317, metadata !DIExpression()), !dbg !318
  call void @llvm.dbg.declare(metadata i8* %uc_b2, metadata !319, metadata !DIExpression()), !dbg !320
  call void @llvm.dbg.declare(metadata i8* %uc_b3, metadata !321, metadata !DIExpression()), !dbg !322
  call void @llvm.dbg.declare(metadata i8* %uc_b4, metadata !323, metadata !DIExpression()), !dbg !324
  call void @llvm.dbg.declare(metadata i8** %string, metadata !325, metadata !DIExpression()), !dbg !326
  store i8* null, i8** %string, align 8, !dbg !326
  call void @llvm.dbg.declare(metadata i32* %string_length, metadata !327, metadata !DIExpression()), !dbg !328
  store i32 0, i32* %string_length, align 4, !dbg !328
  store %struct._json_value* null, %struct._json_value** %root, align 8, !dbg !329
  store %struct._json_value* null, %struct._json_value** %top, align 8, !dbg !330
  store i64 8, i64* %flags, align 8, !dbg !331
  %cur_line = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 4, !dbg !332
  store i32 1, i32* %cur_line, align 8, !dbg !333
  %18 = load i8*, i8** %json.addr, align 8, !dbg !334
  %ptr = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 3, !dbg !336
  store i8* %18, i8** %ptr, align 8, !dbg !337
  br label %for.cond30, !dbg !338

for.cond30:                                       ; preds = %for.inc, %for.body
  call void @llvm.dbg.declare(metadata i8* %b, metadata !339, metadata !DIExpression()), !dbg !342
  %ptr31 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 3, !dbg !343
  %19 = load i8*, i8** %ptr31, align 8, !dbg !343
  %20 = load i8*, i8** %end, align 8, !dbg !344
  %cmp32 = icmp eq i8* %19, %20, !dbg !345
  br i1 %cmp32, label %cond.true, label %cond.false, !dbg !346

cond.true:                                        ; preds = %for.cond30
  br label %cond.end, !dbg !346

cond.false:                                       ; preds = %for.cond30
  %ptr34 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 3, !dbg !347
  %21 = load i8*, i8** %ptr34, align 8, !dbg !347
  %22 = load i8, i8* %21, align 1, !dbg !348
  %conv35 = sext i8 %22 to i32, !dbg !348
  br label %cond.end, !dbg !346

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 0, %cond.true ], [ %conv35, %cond.false ], !dbg !346
  %conv36 = trunc i32 %cond to i8, !dbg !349
  store i8 %conv36, i8* %b, align 1, !dbg !342
  %23 = load i64, i64* %flags, align 8, !dbg !350
  %and = and i64 %23, 32, !dbg !352
  %tobool37 = icmp ne i64 %and, 0, !dbg !352
  br i1 %tobool37, label %if.then38, label %if.end393, !dbg !353

if.then38:                                        ; preds = %cond.end
  %24 = load i8, i8* %b, align 1, !dbg !354
  %tobool39 = icmp ne i8 %24, 0, !dbg !354
  br i1 %tobool39, label %if.end42, label %if.then40, !dbg !357

if.then40:                                        ; preds = %if.then38
  %arraydecay = getelementptr inbounds [128 x i8], [128 x i8]* %error, i64 0, i64 0, !dbg !358
  %cur_line41 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 4, !dbg !360
  %25 = load i32, i32* %cur_line41, align 8, !dbg !360
  %cur_col = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !360
  %26 = load i32, i32* %cur_col, align 4, !dbg !360
  %call = call i32 (i8*, i8*, ...) @sprintf(i8* noundef %arraydecay, i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0), i32 noundef %25, i32 noundef %26) #8, !dbg !361
  br label %e_failed, !dbg !362

if.end42:                                         ; preds = %if.then38
  %27 = load i32, i32* %string_length, align 4, !dbg !363
  %cmp43 = icmp ugt i32 %27, -9, !dbg !365
  br i1 %cmp43, label %if.then45, label %if.end46, !dbg !366

if.then45:                                        ; preds = %if.end42
  br label %e_overflow, !dbg !367

if.end46:                                         ; preds = %if.end42
  %28 = load i64, i64* %flags, align 8, !dbg !368
  %and47 = and i64 %28, 16, !dbg !370
  %tobool48 = icmp ne i64 %and47, 0, !dbg !370
  br i1 %tobool48, label %if.then49, label %if.end326, !dbg !371

if.then49:                                        ; preds = %if.end46
  %29 = load i64, i64* %flags, align 8, !dbg !372
  %and50 = and i64 %29, -17, !dbg !372
  store i64 %and50, i64* %flags, align 8, !dbg !372
  %30 = load i8, i8* %b, align 1, !dbg !374
  %conv51 = sext i8 %30 to i32, !dbg !374
  switch i32 %conv51, label %sw.default [
    i32 98, label %sw.bb
    i32 102, label %sw.bb57
    i32 110, label %sw.bb67
    i32 114, label %sw.bb77
    i32 116, label %sw.bb87
    i32 117, label %sw.bb97
  ], !dbg !375

sw.bb:                                            ; preds = %if.then49
  br label %do.body, !dbg !376

do.body:                                          ; preds = %sw.bb
  %first_pass52 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 2, !dbg !378
  %31 = load i32, i32* %first_pass52, align 8, !dbg !378
  %tobool53 = icmp ne i32 %31, 0, !dbg !378
  br i1 %tobool53, label %if.end56, label %if.then54, !dbg !381

if.then54:                                        ; preds = %do.body
  %32 = load i8*, i8** %string, align 8, !dbg !378
  %33 = load i32, i32* %string_length, align 4, !dbg !378
  %idxprom = zext i32 %33 to i64, !dbg !378
  %arrayidx55 = getelementptr inbounds i8, i8* %32, i64 %idxprom, !dbg !378
  store i8 8, i8* %arrayidx55, align 1, !dbg !378
  br label %if.end56, !dbg !378

if.end56:                                         ; preds = %if.then54, %do.body
  %34 = load i32, i32* %string_length, align 4, !dbg !381
  %inc = add i32 %34, 1, !dbg !381
  store i32 %inc, i32* %string_length, align 4, !dbg !381
  br label %do.end, !dbg !381

do.end:                                           ; preds = %if.end56
  br label %sw.epilog, !dbg !382

sw.bb57:                                          ; preds = %if.then49
  br label %do.body58, !dbg !383

do.body58:                                        ; preds = %sw.bb57
  %first_pass59 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 2, !dbg !384
  %35 = load i32, i32* %first_pass59, align 8, !dbg !384
  %tobool60 = icmp ne i32 %35, 0, !dbg !384
  br i1 %tobool60, label %if.end64, label %if.then61, !dbg !387

if.then61:                                        ; preds = %do.body58
  %36 = load i8*, i8** %string, align 8, !dbg !384
  %37 = load i32, i32* %string_length, align 4, !dbg !384
  %idxprom62 = zext i32 %37 to i64, !dbg !384
  %arrayidx63 = getelementptr inbounds i8, i8* %36, i64 %idxprom62, !dbg !384
  store i8 12, i8* %arrayidx63, align 1, !dbg !384
  br label %if.end64, !dbg !384

if.end64:                                         ; preds = %if.then61, %do.body58
  %38 = load i32, i32* %string_length, align 4, !dbg !387
  %inc65 = add i32 %38, 1, !dbg !387
  store i32 %inc65, i32* %string_length, align 4, !dbg !387
  br label %do.end66, !dbg !387

do.end66:                                         ; preds = %if.end64
  br label %sw.epilog, !dbg !388

sw.bb67:                                          ; preds = %if.then49
  br label %do.body68, !dbg !389

do.body68:                                        ; preds = %sw.bb67
  %first_pass69 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 2, !dbg !390
  %39 = load i32, i32* %first_pass69, align 8, !dbg !390
  %tobool70 = icmp ne i32 %39, 0, !dbg !390
  br i1 %tobool70, label %if.end74, label %if.then71, !dbg !393

if.then71:                                        ; preds = %do.body68
  %40 = load i8*, i8** %string, align 8, !dbg !390
  %41 = load i32, i32* %string_length, align 4, !dbg !390
  %idxprom72 = zext i32 %41 to i64, !dbg !390
  %arrayidx73 = getelementptr inbounds i8, i8* %40, i64 %idxprom72, !dbg !390
  store i8 10, i8* %arrayidx73, align 1, !dbg !390
  br label %if.end74, !dbg !390

if.end74:                                         ; preds = %if.then71, %do.body68
  %42 = load i32, i32* %string_length, align 4, !dbg !393
  %inc75 = add i32 %42, 1, !dbg !393
  store i32 %inc75, i32* %string_length, align 4, !dbg !393
  br label %do.end76, !dbg !393

do.end76:                                         ; preds = %if.end74
  br label %sw.epilog, !dbg !394

sw.bb77:                                          ; preds = %if.then49
  br label %do.body78, !dbg !395

do.body78:                                        ; preds = %sw.bb77
  %first_pass79 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 2, !dbg !396
  %43 = load i32, i32* %first_pass79, align 8, !dbg !396
  %tobool80 = icmp ne i32 %43, 0, !dbg !396
  br i1 %tobool80, label %if.end84, label %if.then81, !dbg !399

if.then81:                                        ; preds = %do.body78
  %44 = load i8*, i8** %string, align 8, !dbg !396
  %45 = load i32, i32* %string_length, align 4, !dbg !396
  %idxprom82 = zext i32 %45 to i64, !dbg !396
  %arrayidx83 = getelementptr inbounds i8, i8* %44, i64 %idxprom82, !dbg !396
  store i8 13, i8* %arrayidx83, align 1, !dbg !396
  br label %if.end84, !dbg !396

if.end84:                                         ; preds = %if.then81, %do.body78
  %46 = load i32, i32* %string_length, align 4, !dbg !399
  %inc85 = add i32 %46, 1, !dbg !399
  store i32 %inc85, i32* %string_length, align 4, !dbg !399
  br label %do.end86, !dbg !399

do.end86:                                         ; preds = %if.end84
  br label %sw.epilog, !dbg !400

sw.bb87:                                          ; preds = %if.then49
  br label %do.body88, !dbg !401

do.body88:                                        ; preds = %sw.bb87
  %first_pass89 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 2, !dbg !402
  %47 = load i32, i32* %first_pass89, align 8, !dbg !402
  %tobool90 = icmp ne i32 %47, 0, !dbg !402
  br i1 %tobool90, label %if.end94, label %if.then91, !dbg !405

if.then91:                                        ; preds = %do.body88
  %48 = load i8*, i8** %string, align 8, !dbg !402
  %49 = load i32, i32* %string_length, align 4, !dbg !402
  %idxprom92 = zext i32 %49 to i64, !dbg !402
  %arrayidx93 = getelementptr inbounds i8, i8* %48, i64 %idxprom92, !dbg !402
  store i8 9, i8* %arrayidx93, align 1, !dbg !402
  br label %if.end94, !dbg !402

if.end94:                                         ; preds = %if.then91, %do.body88
  %50 = load i32, i32* %string_length, align 4, !dbg !405
  %inc95 = add i32 %50, 1, !dbg !405
  store i32 %inc95, i32* %string_length, align 4, !dbg !405
  br label %do.end96, !dbg !405

do.end96:                                         ; preds = %if.end94
  br label %sw.epilog, !dbg !406

sw.bb97:                                          ; preds = %if.then49
  %51 = load i8*, i8** %end, align 8, !dbg !407
  %ptr98 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 3, !dbg !409
  %52 = load i8*, i8** %ptr98, align 8, !dbg !409
  %sub.ptr.lhs.cast = ptrtoint i8* %51 to i64, !dbg !410
  %sub.ptr.rhs.cast = ptrtoint i8* %52 to i64, !dbg !410
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast, !dbg !410
  %cmp99 = icmp sle i64 %sub.ptr.sub, 4, !dbg !411
  br i1 %cmp99, label %if.then127, label %lor.lhs.false, !dbg !412

lor.lhs.false:                                    ; preds = %sw.bb97
  %ptr101 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 3, !dbg !413
  %53 = load i8*, i8** %ptr101, align 8, !dbg !414
  %incdec.ptr = getelementptr inbounds i8, i8* %53, i32 1, !dbg !414
  store i8* %incdec.ptr, i8** %ptr101, align 8, !dbg !414
  %54 = load i8, i8* %incdec.ptr, align 1, !dbg !415
  %call102 = call zeroext i8 @hex_value(i8 noundef signext %54), !dbg !416
  store i8 %call102, i8* %uc_b1, align 1, !dbg !417
  %conv103 = zext i8 %call102 to i32, !dbg !418
  %cmp104 = icmp eq i32 %conv103, 255, !dbg !419
  br i1 %cmp104, label %if.then127, label %lor.lhs.false106, !dbg !420

lor.lhs.false106:                                 ; preds = %lor.lhs.false
  %ptr107 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 3, !dbg !421
  %55 = load i8*, i8** %ptr107, align 8, !dbg !422
  %incdec.ptr108 = getelementptr inbounds i8, i8* %55, i32 1, !dbg !422
  store i8* %incdec.ptr108, i8** %ptr107, align 8, !dbg !422
  %56 = load i8, i8* %incdec.ptr108, align 1, !dbg !423
  %call109 = call zeroext i8 @hex_value(i8 noundef signext %56), !dbg !424
  store i8 %call109, i8* %uc_b2, align 1, !dbg !425
  %conv110 = zext i8 %call109 to i32, !dbg !426
  %cmp111 = icmp eq i32 %conv110, 255, !dbg !427
  br i1 %cmp111, label %if.then127, label %lor.lhs.false113, !dbg !428

lor.lhs.false113:                                 ; preds = %lor.lhs.false106
  %ptr114 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 3, !dbg !429
  %57 = load i8*, i8** %ptr114, align 8, !dbg !430
  %incdec.ptr115 = getelementptr inbounds i8, i8* %57, i32 1, !dbg !430
  store i8* %incdec.ptr115, i8** %ptr114, align 8, !dbg !430
  %58 = load i8, i8* %incdec.ptr115, align 1, !dbg !431
  %call116 = call zeroext i8 @hex_value(i8 noundef signext %58), !dbg !432
  store i8 %call116, i8* %uc_b3, align 1, !dbg !433
  %conv117 = zext i8 %call116 to i32, !dbg !434
  %cmp118 = icmp eq i32 %conv117, 255, !dbg !435
  br i1 %cmp118, label %if.then127, label %lor.lhs.false120, !dbg !436

lor.lhs.false120:                                 ; preds = %lor.lhs.false113
  %ptr121 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 3, !dbg !437
  %59 = load i8*, i8** %ptr121, align 8, !dbg !438
  %incdec.ptr122 = getelementptr inbounds i8, i8* %59, i32 1, !dbg !438
  store i8* %incdec.ptr122, i8** %ptr121, align 8, !dbg !438
  %60 = load i8, i8* %incdec.ptr122, align 1, !dbg !439
  %call123 = call zeroext i8 @hex_value(i8 noundef signext %60), !dbg !440
  store i8 %call123, i8* %uc_b4, align 1, !dbg !441
  %conv124 = zext i8 %call123 to i32, !dbg !442
  %cmp125 = icmp eq i32 %conv124, 255, !dbg !443
  br i1 %cmp125, label %if.then127, label %if.end133, !dbg !444

if.then127:                                       ; preds = %lor.lhs.false120, %lor.lhs.false113, %lor.lhs.false106, %lor.lhs.false, %sw.bb97
  %arraydecay128 = getelementptr inbounds [128 x i8], [128 x i8]* %error, i64 0, i64 0, !dbg !445
  %cur_line129 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 4, !dbg !447
  %61 = load i32, i32* %cur_line129, align 8, !dbg !447
  %cur_col130 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !447
  %62 = load i32, i32* %cur_col130, align 4, !dbg !447
  %63 = load i8, i8* %b, align 1, !dbg !448
  %conv131 = sext i8 %63 to i32, !dbg !448
  %call132 = call i32 (i8*, i8*, ...) @sprintf(i8* noundef %arraydecay128, i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0), i32 noundef %61, i32 noundef %62, i32 noundef %conv131) #8, !dbg !449
  br label %e_failed, !dbg !450

if.end133:                                        ; preds = %lor.lhs.false120
  %64 = load i8, i8* %uc_b1, align 1, !dbg !451
  %conv134 = zext i8 %64 to i32, !dbg !451
  %shl = shl i32 %conv134, 4, !dbg !452
  %65 = load i8, i8* %uc_b2, align 1, !dbg !453
  %conv135 = zext i8 %65 to i32, !dbg !453
  %or = or i32 %shl, %conv135, !dbg !454
  %conv136 = trunc i32 %or to i8, !dbg !455
  store i8 %conv136, i8* %uc_b1, align 1, !dbg !456
  %66 = load i8, i8* %uc_b3, align 1, !dbg !457
  %conv137 = zext i8 %66 to i32, !dbg !457
  %shl138 = shl i32 %conv137, 4, !dbg !458
  %67 = load i8, i8* %uc_b4, align 1, !dbg !459
  %conv139 = zext i8 %67 to i32, !dbg !459
  %or140 = or i32 %shl138, %conv139, !dbg !460
  %conv141 = trunc i32 %or140 to i8, !dbg !461
  store i8 %conv141, i8* %uc_b2, align 1, !dbg !462
  %68 = load i8, i8* %uc_b1, align 1, !dbg !463
  %conv142 = zext i8 %68 to i32, !dbg !463
  %shl143 = shl i32 %conv142, 8, !dbg !464
  %69 = load i8, i8* %uc_b2, align 1, !dbg !465
  %conv144 = zext i8 %69 to i32, !dbg !465
  %or145 = or i32 %shl143, %conv144, !dbg !466
  store i32 %or145, i32* %uchar, align 4, !dbg !467
  %70 = load i32, i32* %uchar, align 4, !dbg !468
  %and146 = and i32 %70, 63488, !dbg !470
  %cmp147 = icmp eq i32 %and146, 55296, !dbg !471
  br i1 %cmp147, label %if.then149, label %if.end222, !dbg !472

if.then149:                                       ; preds = %if.end133
  call void @llvm.dbg.declare(metadata i32* %uchar2, metadata !473, metadata !DIExpression()), !dbg !475
  %71 = load i8*, i8** %end, align 8, !dbg !476
  %ptr150 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 3, !dbg !478
  %72 = load i8*, i8** %ptr150, align 8, !dbg !478
  %sub.ptr.lhs.cast151 = ptrtoint i8* %71 to i64, !dbg !479
  %sub.ptr.rhs.cast152 = ptrtoint i8* %72 to i64, !dbg !479
  %sub.ptr.sub153 = sub i64 %sub.ptr.lhs.cast151, %sub.ptr.rhs.cast152, !dbg !479
  %cmp154 = icmp sle i64 %sub.ptr.sub153, 6, !dbg !480
  br i1 %cmp154, label %if.then196, label %lor.lhs.false156, !dbg !481

lor.lhs.false156:                                 ; preds = %if.then149
  %ptr157 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 3, !dbg !482
  %73 = load i8*, i8** %ptr157, align 8, !dbg !483
  %incdec.ptr158 = getelementptr inbounds i8, i8* %73, i32 1, !dbg !483
  store i8* %incdec.ptr158, i8** %ptr157, align 8, !dbg !483
  %74 = load i8, i8* %incdec.ptr158, align 1, !dbg !484
  %conv159 = sext i8 %74 to i32, !dbg !485
  %cmp160 = icmp ne i32 %conv159, 92, !dbg !486
  br i1 %cmp160, label %if.then196, label %lor.lhs.false162, !dbg !487

lor.lhs.false162:                                 ; preds = %lor.lhs.false156
  %ptr163 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 3, !dbg !488
  %75 = load i8*, i8** %ptr163, align 8, !dbg !489
  %incdec.ptr164 = getelementptr inbounds i8, i8* %75, i32 1, !dbg !489
  store i8* %incdec.ptr164, i8** %ptr163, align 8, !dbg !489
  %76 = load i8, i8* %incdec.ptr164, align 1, !dbg !490
  %conv165 = sext i8 %76 to i32, !dbg !491
  %cmp166 = icmp ne i32 %conv165, 117, !dbg !492
  br i1 %cmp166, label %if.then196, label %lor.lhs.false168, !dbg !493

lor.lhs.false168:                                 ; preds = %lor.lhs.false162
  %ptr169 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 3, !dbg !494
  %77 = load i8*, i8** %ptr169, align 8, !dbg !495
  %incdec.ptr170 = getelementptr inbounds i8, i8* %77, i32 1, !dbg !495
  store i8* %incdec.ptr170, i8** %ptr169, align 8, !dbg !495
  %78 = load i8, i8* %incdec.ptr170, align 1, !dbg !496
  %call171 = call zeroext i8 @hex_value(i8 noundef signext %78), !dbg !497
  store i8 %call171, i8* %uc_b1, align 1, !dbg !498
  %conv172 = zext i8 %call171 to i32, !dbg !499
  %cmp173 = icmp eq i32 %conv172, 255, !dbg !500
  br i1 %cmp173, label %if.then196, label %lor.lhs.false175, !dbg !501

lor.lhs.false175:                                 ; preds = %lor.lhs.false168
  %ptr176 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 3, !dbg !502
  %79 = load i8*, i8** %ptr176, align 8, !dbg !503
  %incdec.ptr177 = getelementptr inbounds i8, i8* %79, i32 1, !dbg !503
  store i8* %incdec.ptr177, i8** %ptr176, align 8, !dbg !503
  %80 = load i8, i8* %incdec.ptr177, align 1, !dbg !504
  %call178 = call zeroext i8 @hex_value(i8 noundef signext %80), !dbg !505
  store i8 %call178, i8* %uc_b2, align 1, !dbg !506
  %conv179 = zext i8 %call178 to i32, !dbg !507
  %cmp180 = icmp eq i32 %conv179, 255, !dbg !508
  br i1 %cmp180, label %if.then196, label %lor.lhs.false182, !dbg !509

lor.lhs.false182:                                 ; preds = %lor.lhs.false175
  %ptr183 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 3, !dbg !510
  %81 = load i8*, i8** %ptr183, align 8, !dbg !511
  %incdec.ptr184 = getelementptr inbounds i8, i8* %81, i32 1, !dbg !511
  store i8* %incdec.ptr184, i8** %ptr183, align 8, !dbg !511
  %82 = load i8, i8* %incdec.ptr184, align 1, !dbg !512
  %call185 = call zeroext i8 @hex_value(i8 noundef signext %82), !dbg !513
  store i8 %call185, i8* %uc_b3, align 1, !dbg !514
  %conv186 = zext i8 %call185 to i32, !dbg !515
  %cmp187 = icmp eq i32 %conv186, 255, !dbg !516
  br i1 %cmp187, label %if.then196, label %lor.lhs.false189, !dbg !517

lor.lhs.false189:                                 ; preds = %lor.lhs.false182
  %ptr190 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 3, !dbg !518
  %83 = load i8*, i8** %ptr190, align 8, !dbg !519
  %incdec.ptr191 = getelementptr inbounds i8, i8* %83, i32 1, !dbg !519
  store i8* %incdec.ptr191, i8** %ptr190, align 8, !dbg !519
  %84 = load i8, i8* %incdec.ptr191, align 1, !dbg !520
  %call192 = call zeroext i8 @hex_value(i8 noundef signext %84), !dbg !521
  store i8 %call192, i8* %uc_b4, align 1, !dbg !522
  %conv193 = zext i8 %call192 to i32, !dbg !523
  %cmp194 = icmp eq i32 %conv193, 255, !dbg !524
  br i1 %cmp194, label %if.then196, label %if.end202, !dbg !525

if.then196:                                       ; preds = %lor.lhs.false189, %lor.lhs.false182, %lor.lhs.false175, %lor.lhs.false168, %lor.lhs.false162, %lor.lhs.false156, %if.then149
  %arraydecay197 = getelementptr inbounds [128 x i8], [128 x i8]* %error, i64 0, i64 0, !dbg !526
  %cur_line198 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 4, !dbg !528
  %85 = load i32, i32* %cur_line198, align 8, !dbg !528
  %cur_col199 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !528
  %86 = load i32, i32* %cur_col199, align 4, !dbg !528
  %87 = load i8, i8* %b, align 1, !dbg !529
  %conv200 = sext i8 %87 to i32, !dbg !529
  %call201 = call i32 (i8*, i8*, ...) @sprintf(i8* noundef %arraydecay197, i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0), i32 noundef %85, i32 noundef %86, i32 noundef %conv200) #8, !dbg !530
  br label %e_failed, !dbg !531

if.end202:                                        ; preds = %lor.lhs.false189
  %88 = load i8, i8* %uc_b1, align 1, !dbg !532
  %conv203 = zext i8 %88 to i32, !dbg !532
  %shl204 = shl i32 %conv203, 4, !dbg !533
  %89 = load i8, i8* %uc_b2, align 1, !dbg !534
  %conv205 = zext i8 %89 to i32, !dbg !534
  %or206 = or i32 %shl204, %conv205, !dbg !535
  %conv207 = trunc i32 %or206 to i8, !dbg !536
  store i8 %conv207, i8* %uc_b1, align 1, !dbg !537
  %90 = load i8, i8* %uc_b3, align 1, !dbg !538
  %conv208 = zext i8 %90 to i32, !dbg !538
  %shl209 = shl i32 %conv208, 4, !dbg !539
  %91 = load i8, i8* %uc_b4, align 1, !dbg !540
  %conv210 = zext i8 %91 to i32, !dbg !540
  %or211 = or i32 %shl209, %conv210, !dbg !541
  %conv212 = trunc i32 %or211 to i8, !dbg !542
  store i8 %conv212, i8* %uc_b2, align 1, !dbg !543
  %92 = load i8, i8* %uc_b1, align 1, !dbg !544
  %conv213 = zext i8 %92 to i32, !dbg !544
  %shl214 = shl i32 %conv213, 8, !dbg !545
  %93 = load i8, i8* %uc_b2, align 1, !dbg !546
  %conv215 = zext i8 %93 to i32, !dbg !546
  %or216 = or i32 %shl214, %conv215, !dbg !547
  store i32 %or216, i32* %uchar2, align 4, !dbg !548
  %94 = load i32, i32* %uchar, align 4, !dbg !549
  %and217 = and i32 %94, 1023, !dbg !550
  %shl218 = shl i32 %and217, 10, !dbg !551
  %or219 = or i32 65536, %shl218, !dbg !552
  %95 = load i32, i32* %uchar2, align 4, !dbg !553
  %and220 = and i32 %95, 1023, !dbg !554
  %or221 = or i32 %or219, %and220, !dbg !555
  store i32 %or221, i32* %uchar, align 4, !dbg !556
  br label %if.end222, !dbg !557

if.end222:                                        ; preds = %if.end202, %if.end133
  %96 = load i32, i32* %uchar, align 4, !dbg !558
  %cmp223 = icmp ule i32 %96, 127, !dbg !560
  br i1 %cmp223, label %if.then225, label %if.end236, !dbg !561

if.then225:                                       ; preds = %if.end222
  br label %do.body226, !dbg !562

do.body226:                                       ; preds = %if.then225
  %first_pass227 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 2, !dbg !564
  %97 = load i32, i32* %first_pass227, align 8, !dbg !564
  %tobool228 = icmp ne i32 %97, 0, !dbg !564
  br i1 %tobool228, label %if.end233, label %if.then229, !dbg !567

if.then229:                                       ; preds = %do.body226
  %98 = load i32, i32* %uchar, align 4, !dbg !564
  %conv230 = trunc i32 %98 to i8, !dbg !564
  %99 = load i8*, i8** %string, align 8, !dbg !564
  %100 = load i32, i32* %string_length, align 4, !dbg !564
  %idxprom231 = zext i32 %100 to i64, !dbg !564
  %arrayidx232 = getelementptr inbounds i8, i8* %99, i64 %idxprom231, !dbg !564
  store i8 %conv230, i8* %arrayidx232, align 1, !dbg !564
  br label %if.end233, !dbg !564

if.end233:                                        ; preds = %if.then229, %do.body226
  %101 = load i32, i32* %string_length, align 4, !dbg !567
  %inc234 = add i32 %101, 1, !dbg !567
  store i32 %inc234, i32* %string_length, align 4, !dbg !567
  br label %do.end235, !dbg !567

do.end235:                                        ; preds = %if.end233
  br label %sw.epilog, !dbg !568

if.end236:                                        ; preds = %if.end222
  %102 = load i32, i32* %uchar, align 4, !dbg !569
  %cmp237 = icmp ule i32 %102, 2047, !dbg !571
  br i1 %cmp237, label %if.then239, label %if.end255, !dbg !572

if.then239:                                       ; preds = %if.end236
  %first_pass240 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 2, !dbg !573
  %103 = load i32, i32* %first_pass240, align 8, !dbg !573
  %tobool241 = icmp ne i32 %103, 0, !dbg !576
  br i1 %tobool241, label %if.then242, label %if.else, !dbg !577

if.then242:                                       ; preds = %if.then239
  %104 = load i32, i32* %string_length, align 4, !dbg !578
  %add = add i32 %104, 2, !dbg !578
  store i32 %add, i32* %string_length, align 4, !dbg !578
  br label %if.end254, !dbg !579

if.else:                                          ; preds = %if.then239
  %105 = load i32, i32* %uchar, align 4, !dbg !580
  %shr = lshr i32 %105, 6, !dbg !582
  %or243 = or i32 192, %shr, !dbg !583
  %conv244 = trunc i32 %or243 to i8, !dbg !584
  %106 = load i8*, i8** %string, align 8, !dbg !585
  %107 = load i32, i32* %string_length, align 4, !dbg !586
  %inc245 = add i32 %107, 1, !dbg !586
  store i32 %inc245, i32* %string_length, align 4, !dbg !586
  %idxprom246 = zext i32 %107 to i64, !dbg !585
  %arrayidx247 = getelementptr inbounds i8, i8* %106, i64 %idxprom246, !dbg !585
  store i8 %conv244, i8* %arrayidx247, align 1, !dbg !587
  %108 = load i32, i32* %uchar, align 4, !dbg !588
  %and248 = and i32 %108, 63, !dbg !589
  %or249 = or i32 128, %and248, !dbg !590
  %conv250 = trunc i32 %or249 to i8, !dbg !591
  %109 = load i8*, i8** %string, align 8, !dbg !592
  %110 = load i32, i32* %string_length, align 4, !dbg !593
  %inc251 = add i32 %110, 1, !dbg !593
  store i32 %inc251, i32* %string_length, align 4, !dbg !593
  %idxprom252 = zext i32 %110 to i64, !dbg !592
  %arrayidx253 = getelementptr inbounds i8, i8* %109, i64 %idxprom252, !dbg !592
  store i8 %conv250, i8* %arrayidx253, align 1, !dbg !594
  br label %if.end254

if.end254:                                        ; preds = %if.else, %if.then242
  br label %sw.epilog, !dbg !595

if.end255:                                        ; preds = %if.end236
  %111 = load i32, i32* %uchar, align 4, !dbg !596
  %cmp256 = icmp ule i32 %111, 65535, !dbg !598
  br i1 %cmp256, label %if.then258, label %if.end284, !dbg !599

if.then258:                                       ; preds = %if.end255
  %first_pass259 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 2, !dbg !600
  %112 = load i32, i32* %first_pass259, align 8, !dbg !600
  %tobool260 = icmp ne i32 %112, 0, !dbg !603
  br i1 %tobool260, label %if.then261, label %if.else263, !dbg !604

if.then261:                                       ; preds = %if.then258
  %113 = load i32, i32* %string_length, align 4, !dbg !605
  %add262 = add i32 %113, 3, !dbg !605
  store i32 %add262, i32* %string_length, align 4, !dbg !605
  br label %if.end283, !dbg !606

if.else263:                                       ; preds = %if.then258
  %114 = load i32, i32* %uchar, align 4, !dbg !607
  %shr264 = lshr i32 %114, 12, !dbg !609
  %or265 = or i32 224, %shr264, !dbg !610
  %conv266 = trunc i32 %or265 to i8, !dbg !611
  %115 = load i8*, i8** %string, align 8, !dbg !612
  %116 = load i32, i32* %string_length, align 4, !dbg !613
  %inc267 = add i32 %116, 1, !dbg !613
  store i32 %inc267, i32* %string_length, align 4, !dbg !613
  %idxprom268 = zext i32 %116 to i64, !dbg !612
  %arrayidx269 = getelementptr inbounds i8, i8* %115, i64 %idxprom268, !dbg !612
  store i8 %conv266, i8* %arrayidx269, align 1, !dbg !614
  %117 = load i32, i32* %uchar, align 4, !dbg !615
  %shr270 = lshr i32 %117, 6, !dbg !616
  %and271 = and i32 %shr270, 63, !dbg !617
  %or272 = or i32 128, %and271, !dbg !618
  %conv273 = trunc i32 %or272 to i8, !dbg !619
  %118 = load i8*, i8** %string, align 8, !dbg !620
  %119 = load i32, i32* %string_length, align 4, !dbg !621
  %inc274 = add i32 %119, 1, !dbg !621
  store i32 %inc274, i32* %string_length, align 4, !dbg !621
  %idxprom275 = zext i32 %119 to i64, !dbg !620
  %arrayidx276 = getelementptr inbounds i8, i8* %118, i64 %idxprom275, !dbg !620
  store i8 %conv273, i8* %arrayidx276, align 1, !dbg !622
  %120 = load i32, i32* %uchar, align 4, !dbg !623
  %and277 = and i32 %120, 63, !dbg !624
  %or278 = or i32 128, %and277, !dbg !625
  %conv279 = trunc i32 %or278 to i8, !dbg !626
  %121 = load i8*, i8** %string, align 8, !dbg !627
  %122 = load i32, i32* %string_length, align 4, !dbg !628
  %inc280 = add i32 %122, 1, !dbg !628
  store i32 %inc280, i32* %string_length, align 4, !dbg !628
  %idxprom281 = zext i32 %122 to i64, !dbg !627
  %arrayidx282 = getelementptr inbounds i8, i8* %121, i64 %idxprom281, !dbg !627
  store i8 %conv279, i8* %arrayidx282, align 1, !dbg !629
  br label %if.end283

if.end283:                                        ; preds = %if.else263, %if.then261
  br label %sw.epilog, !dbg !630

if.end284:                                        ; preds = %if.end255
  %first_pass285 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 2, !dbg !631
  %123 = load i32, i32* %first_pass285, align 8, !dbg !631
  %tobool286 = icmp ne i32 %123, 0, !dbg !633
  br i1 %tobool286, label %if.then287, label %if.else289, !dbg !634

if.then287:                                       ; preds = %if.end284
  %124 = load i32, i32* %string_length, align 4, !dbg !635
  %add288 = add i32 %124, 4, !dbg !635
  store i32 %add288, i32* %string_length, align 4, !dbg !635
  br label %if.end316, !dbg !636

if.else289:                                       ; preds = %if.end284
  %125 = load i32, i32* %uchar, align 4, !dbg !637
  %shr290 = lshr i32 %125, 18, !dbg !639
  %or291 = or i32 240, %shr290, !dbg !640
  %conv292 = trunc i32 %or291 to i8, !dbg !641
  %126 = load i8*, i8** %string, align 8, !dbg !642
  %127 = load i32, i32* %string_length, align 4, !dbg !643
  %inc293 = add i32 %127, 1, !dbg !643
  store i32 %inc293, i32* %string_length, align 4, !dbg !643
  %idxprom294 = zext i32 %127 to i64, !dbg !642
  %arrayidx295 = getelementptr inbounds i8, i8* %126, i64 %idxprom294, !dbg !642
  store i8 %conv292, i8* %arrayidx295, align 1, !dbg !644
  %128 = load i32, i32* %uchar, align 4, !dbg !645
  %shr296 = lshr i32 %128, 12, !dbg !646
  %and297 = and i32 %shr296, 63, !dbg !647
  %or298 = or i32 128, %and297, !dbg !648
  %conv299 = trunc i32 %or298 to i8, !dbg !649
  %129 = load i8*, i8** %string, align 8, !dbg !650
  %130 = load i32, i32* %string_length, align 4, !dbg !651
  %inc300 = add i32 %130, 1, !dbg !651
  store i32 %inc300, i32* %string_length, align 4, !dbg !651
  %idxprom301 = zext i32 %130 to i64, !dbg !650
  %arrayidx302 = getelementptr inbounds i8, i8* %129, i64 %idxprom301, !dbg !650
  store i8 %conv299, i8* %arrayidx302, align 1, !dbg !652
  %131 = load i32, i32* %uchar, align 4, !dbg !653
  %shr303 = lshr i32 %131, 6, !dbg !654
  %and304 = and i32 %shr303, 63, !dbg !655
  %or305 = or i32 128, %and304, !dbg !656
  %conv306 = trunc i32 %or305 to i8, !dbg !657
  %132 = load i8*, i8** %string, align 8, !dbg !658
  %133 = load i32, i32* %string_length, align 4, !dbg !659
  %inc307 = add i32 %133, 1, !dbg !659
  store i32 %inc307, i32* %string_length, align 4, !dbg !659
  %idxprom308 = zext i32 %133 to i64, !dbg !658
  %arrayidx309 = getelementptr inbounds i8, i8* %132, i64 %idxprom308, !dbg !658
  store i8 %conv306, i8* %arrayidx309, align 1, !dbg !660
  %134 = load i32, i32* %uchar, align 4, !dbg !661
  %and310 = and i32 %134, 63, !dbg !662
  %or311 = or i32 128, %and310, !dbg !663
  %conv312 = trunc i32 %or311 to i8, !dbg !664
  %135 = load i8*, i8** %string, align 8, !dbg !665
  %136 = load i32, i32* %string_length, align 4, !dbg !666
  %inc313 = add i32 %136, 1, !dbg !666
  store i32 %inc313, i32* %string_length, align 4, !dbg !666
  %idxprom314 = zext i32 %136 to i64, !dbg !665
  %arrayidx315 = getelementptr inbounds i8, i8* %135, i64 %idxprom314, !dbg !665
  store i8 %conv312, i8* %arrayidx315, align 1, !dbg !667
  br label %if.end316

if.end316:                                        ; preds = %if.else289, %if.then287
  br label %sw.epilog, !dbg !668

sw.default:                                       ; preds = %if.then49
  br label %do.body317, !dbg !669

do.body317:                                       ; preds = %sw.default
  %first_pass318 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 2, !dbg !670
  %137 = load i32, i32* %first_pass318, align 8, !dbg !670
  %tobool319 = icmp ne i32 %137, 0, !dbg !670
  br i1 %tobool319, label %if.end323, label %if.then320, !dbg !673

if.then320:                                       ; preds = %do.body317
  %138 = load i8, i8* %b, align 1, !dbg !670
  %139 = load i8*, i8** %string, align 8, !dbg !670
  %140 = load i32, i32* %string_length, align 4, !dbg !670
  %idxprom321 = zext i32 %140 to i64, !dbg !670
  %arrayidx322 = getelementptr inbounds i8, i8* %139, i64 %idxprom321, !dbg !670
  store i8 %138, i8* %arrayidx322, align 1, !dbg !670
  br label %if.end323, !dbg !670

if.end323:                                        ; preds = %if.then320, %do.body317
  %141 = load i32, i32* %string_length, align 4, !dbg !673
  %inc324 = add i32 %141, 1, !dbg !673
  store i32 %inc324, i32* %string_length, align 4, !dbg !673
  br label %do.end325, !dbg !673

do.end325:                                        ; preds = %if.end323
  br label %sw.epilog, !dbg !674

sw.epilog:                                        ; preds = %do.end325, %if.end316, %if.end283, %if.end254, %do.end235, %do.end96, %do.end86, %do.end76, %do.end66, %do.end
  br label %for.inc, !dbg !675

if.end326:                                        ; preds = %if.end46
  %142 = load i8, i8* %b, align 1, !dbg !676
  %conv327 = sext i8 %142 to i32, !dbg !676
  %cmp328 = icmp eq i32 %conv327, 92, !dbg !678
  br i1 %cmp328, label %if.then330, label %if.end332, !dbg !679

if.then330:                                       ; preds = %if.end326
  %143 = load i64, i64* %flags, align 8, !dbg !680
  %or331 = or i64 %143, 16, !dbg !680
  store i64 %or331, i64* %flags, align 8, !dbg !680
  br label %for.inc, !dbg !682

if.end332:                                        ; preds = %if.end326
  %144 = load i8, i8* %b, align 1, !dbg !683
  %conv333 = sext i8 %144 to i32, !dbg !683
  %cmp334 = icmp eq i32 %conv333, 34, !dbg !685
  br i1 %cmp334, label %if.then336, label %if.else382, !dbg !686

if.then336:                                       ; preds = %if.end332
  %first_pass337 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 2, !dbg !687
  %145 = load i32, i32* %first_pass337, align 8, !dbg !687
  %tobool338 = icmp ne i32 %145, 0, !dbg !690
  br i1 %tobool338, label %if.end342, label %if.then339, !dbg !691

if.then339:                                       ; preds = %if.then336
  %146 = load i8*, i8** %string, align 8, !dbg !692
  %147 = load i32, i32* %string_length, align 4, !dbg !693
  %idxprom340 = zext i32 %147 to i64, !dbg !692
  %arrayidx341 = getelementptr inbounds i8, i8* %146, i64 %idxprom340, !dbg !692
  store i8 0, i8* %arrayidx341, align 1, !dbg !694
  br label %if.end342, !dbg !692

if.end342:                                        ; preds = %if.then339, %if.then336
  %148 = load i64, i64* %flags, align 8, !dbg !695
  %and343 = and i64 %148, -33, !dbg !695
  store i64 %and343, i64* %flags, align 8, !dbg !695
  store i8* null, i8** %string, align 8, !dbg !696
  %149 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !697
  %type = getelementptr inbounds %struct._json_value, %struct._json_value* %149, i32 0, i32 1, !dbg !698
  %150 = load i32, i32* %type, align 8, !dbg !698
  switch i32 %150, label %sw.default380 [
    i32 5, label %sw.bb344
    i32 1, label %sw.bb348
  ], !dbg !699

sw.bb344:                                         ; preds = %if.end342
  %151 = load i32, i32* %string_length, align 4, !dbg !700
  %152 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !702
  %u = getelementptr inbounds %struct._json_value, %struct._json_value* %152, i32 0, i32 2, !dbg !703
  %string345 = bitcast %union.anon* %u to %struct.anon*, !dbg !704
  %length346 = getelementptr inbounds %struct.anon, %struct.anon* %string345, i32 0, i32 0, !dbg !705
  store i32 %151, i32* %length346, align 8, !dbg !706
  %153 = load i64, i64* %flags, align 8, !dbg !707
  %or347 = or i64 %153, 1, !dbg !707
  store i64 %or347, i64* %flags, align 8, !dbg !707
  br label %sw.epilog381, !dbg !708

sw.bb348:                                         ; preds = %if.end342
  %first_pass349 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 2, !dbg !709
  %154 = load i32, i32* %first_pass349, align 8, !dbg !709
  %tobool350 = icmp ne i32 %154, 0, !dbg !711
  br i1 %tobool350, label %if.then351, label %if.else356, !dbg !712

if.then351:                                       ; preds = %sw.bb348
  call void @llvm.dbg.declare(metadata i8*** %chars, metadata !713, metadata !DIExpression()), !dbg !715
  %155 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !716
  %u352 = getelementptr inbounds %struct._json_value, %struct._json_value* %155, i32 0, i32 2, !dbg !717
  %object = bitcast %union.anon* %u352 to %struct.anon.0*, !dbg !718
  %values = getelementptr inbounds %struct.anon.0, %struct.anon.0* %object, i32 0, i32 1, !dbg !719
  %156 = bitcast %struct._json_object_entry** %values to i8**, !dbg !720
  store i8** %156, i8*** %chars, align 8, !dbg !715
  %157 = load i32, i32* %string_length, align 4, !dbg !721
  %add353 = add i32 %157, 1, !dbg !722
  %158 = load i8**, i8*** %chars, align 8, !dbg !723
  %arrayidx354 = getelementptr inbounds i8*, i8** %158, i64 0, !dbg !723
  %159 = load i8*, i8** %arrayidx354, align 8, !dbg !724
  %idx.ext = zext i32 %add353 to i64, !dbg !724
  %add.ptr355 = getelementptr inbounds i8, i8* %159, i64 %idx.ext, !dbg !724
  store i8* %add.ptr355, i8** %arrayidx354, align 8, !dbg !724
  br label %if.end378, !dbg !725

if.else356:                                       ; preds = %sw.bb348
  %160 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !726
  %_reserved = getelementptr inbounds %struct._json_value, %struct._json_value* %160, i32 0, i32 3, !dbg !728
  %object_mem = bitcast %union.anon.2* %_reserved to i8**, !dbg !729
  %161 = load i8*, i8** %object_mem, align 8, !dbg !729
  %162 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !730
  %u357 = getelementptr inbounds %struct._json_value, %struct._json_value* %162, i32 0, i32 2, !dbg !731
  %object358 = bitcast %union.anon* %u357 to %struct.anon.0*, !dbg !732
  %values359 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %object358, i32 0, i32 1, !dbg !733
  %163 = load %struct._json_object_entry*, %struct._json_object_entry** %values359, align 8, !dbg !733
  %164 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !734
  %u360 = getelementptr inbounds %struct._json_value, %struct._json_value* %164, i32 0, i32 2, !dbg !735
  %object361 = bitcast %union.anon* %u360 to %struct.anon.0*, !dbg !736
  %length362 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %object361, i32 0, i32 0, !dbg !737
  %165 = load i32, i32* %length362, align 8, !dbg !737
  %idxprom363 = zext i32 %165 to i64, !dbg !730
  %arrayidx364 = getelementptr inbounds %struct._json_object_entry, %struct._json_object_entry* %163, i64 %idxprom363, !dbg !730
  %name = getelementptr inbounds %struct._json_object_entry, %struct._json_object_entry* %arrayidx364, i32 0, i32 0, !dbg !738
  store i8* %161, i8** %name, align 8, !dbg !739
  %166 = load i32, i32* %string_length, align 4, !dbg !740
  %167 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !741
  %u365 = getelementptr inbounds %struct._json_value, %struct._json_value* %167, i32 0, i32 2, !dbg !742
  %object366 = bitcast %union.anon* %u365 to %struct.anon.0*, !dbg !743
  %values367 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %object366, i32 0, i32 1, !dbg !744
  %168 = load %struct._json_object_entry*, %struct._json_object_entry** %values367, align 8, !dbg !744
  %169 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !745
  %u368 = getelementptr inbounds %struct._json_value, %struct._json_value* %169, i32 0, i32 2, !dbg !746
  %object369 = bitcast %union.anon* %u368 to %struct.anon.0*, !dbg !747
  %length370 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %object369, i32 0, i32 0, !dbg !748
  %170 = load i32, i32* %length370, align 8, !dbg !748
  %idxprom371 = zext i32 %170 to i64, !dbg !741
  %arrayidx372 = getelementptr inbounds %struct._json_object_entry, %struct._json_object_entry* %168, i64 %idxprom371, !dbg !741
  %name_length = getelementptr inbounds %struct._json_object_entry, %struct._json_object_entry* %arrayidx372, i32 0, i32 1, !dbg !749
  store i32 %166, i32* %name_length, align 8, !dbg !750
  %171 = load i32, i32* %string_length, align 4, !dbg !751
  %add373 = add i32 %171, 1, !dbg !752
  %172 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !753
  %_reserved374 = getelementptr inbounds %struct._json_value, %struct._json_value* %172, i32 0, i32 3, !dbg !754
  %object_mem375 = bitcast %union.anon.2* %_reserved374 to i8**, !dbg !755
  %173 = load i8*, i8** %object_mem375, align 8, !dbg !756
  %idx.ext376 = zext i32 %add373 to i64, !dbg !756
  %add.ptr377 = getelementptr inbounds i8, i8* %173, i64 %idx.ext376, !dbg !756
  store i8* %add.ptr377, i8** %object_mem375, align 8, !dbg !756
  br label %if.end378

if.end378:                                        ; preds = %if.else356, %if.then351
  %174 = load i64, i64* %flags, align 8, !dbg !757
  %or379 = or i64 %174, 72, !dbg !757
  store i64 %or379, i64* %flags, align 8, !dbg !757
  br label %for.inc, !dbg !758

sw.default380:                                    ; preds = %if.end342
  br label %sw.epilog381, !dbg !759

sw.epilog381:                                     ; preds = %sw.default380, %sw.bb344
  br label %if.end392, !dbg !760

if.else382:                                       ; preds = %if.end332
  br label %do.body383, !dbg !761

do.body383:                                       ; preds = %if.else382
  %first_pass384 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 2, !dbg !763
  %175 = load i32, i32* %first_pass384, align 8, !dbg !763
  %tobool385 = icmp ne i32 %175, 0, !dbg !763
  br i1 %tobool385, label %if.end389, label %if.then386, !dbg !766

if.then386:                                       ; preds = %do.body383
  %176 = load i8, i8* %b, align 1, !dbg !763
  %177 = load i8*, i8** %string, align 8, !dbg !763
  %178 = load i32, i32* %string_length, align 4, !dbg !763
  %idxprom387 = zext i32 %178 to i64, !dbg !763
  %arrayidx388 = getelementptr inbounds i8, i8* %177, i64 %idxprom387, !dbg !763
  store i8 %176, i8* %arrayidx388, align 1, !dbg !763
  br label %if.end389, !dbg !763

if.end389:                                        ; preds = %if.then386, %do.body383
  %179 = load i32, i32* %string_length, align 4, !dbg !766
  %inc390 = add i32 %179, 1, !dbg !766
  store i32 %inc390, i32* %string_length, align 4, !dbg !766
  br label %do.end391, !dbg !766

do.end391:                                        ; preds = %if.end389
  br label %for.inc, !dbg !767

if.end392:                                        ; preds = %sw.epilog381
  br label %if.end393, !dbg !768

if.end393:                                        ; preds = %if.end392, %cond.end
  %settings394 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 1, !dbg !769
  %settings395 = getelementptr inbounds %struct.json_settings, %struct.json_settings* %settings394, i32 0, i32 1, !dbg !771
  %180 = load i32, i32* %settings395, align 8, !dbg !771
  %and396 = and i32 %180, 1, !dbg !772
  %tobool397 = icmp ne i32 %and396, 0, !dbg !772
  br i1 %tobool397, label %if.then398, label %if.end491, !dbg !773

if.then398:                                       ; preds = %if.end393
  %181 = load i64, i64* %flags, align 8, !dbg !774
  %and399 = and i64 %181, 24576, !dbg !777
  %tobool400 = icmp ne i64 %and399, 0, !dbg !777
  br i1 %tobool400, label %if.then401, label %if.else450, !dbg !778

if.then401:                                       ; preds = %if.then398
  %182 = load i64, i64* %flags, align 8, !dbg !779
  %and402 = and i64 %182, 8192, !dbg !782
  %tobool403 = icmp ne i64 %and402, 0, !dbg !782
  br i1 %tobool403, label %if.then404, label %if.end419, !dbg !783

if.then404:                                       ; preds = %if.then401
  %183 = load i8, i8* %b, align 1, !dbg !784
  %conv405 = sext i8 %183 to i32, !dbg !784
  %cmp406 = icmp eq i32 %conv405, 13, !dbg !787
  br i1 %cmp406, label %if.then414, label %lor.lhs.false408, !dbg !788

lor.lhs.false408:                                 ; preds = %if.then404
  %184 = load i8, i8* %b, align 1, !dbg !789
  %conv409 = sext i8 %184 to i32, !dbg !789
  %cmp410 = icmp eq i32 %conv409, 10, !dbg !790
  br i1 %cmp410, label %if.then414, label %lor.lhs.false412, !dbg !791

lor.lhs.false412:                                 ; preds = %lor.lhs.false408
  %185 = load i8, i8* %b, align 1, !dbg !792
  %tobool413 = icmp ne i8 %185, 0, !dbg !792
  br i1 %tobool413, label %if.end418, label %if.then414, !dbg !793

if.then414:                                       ; preds = %lor.lhs.false412, %lor.lhs.false408, %if.then404
  %186 = load i64, i64* %flags, align 8, !dbg !794
  %and415 = and i64 %186, -8193, !dbg !794
  store i64 %and415, i64* %flags, align 8, !dbg !794
  %ptr416 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 3, !dbg !796
  %187 = load i8*, i8** %ptr416, align 8, !dbg !797
  %incdec.ptr417 = getelementptr inbounds i8, i8* %187, i32 -1, !dbg !797
  store i8* %incdec.ptr417, i8** %ptr416, align 8, !dbg !797
  br label %if.end418, !dbg !798

if.end418:                                        ; preds = %if.then414, %lor.lhs.false412
  br label %for.inc, !dbg !799

if.end419:                                        ; preds = %if.then401
  %188 = load i64, i64* %flags, align 8, !dbg !800
  %and420 = and i64 %188, 16384, !dbg !802
  %tobool421 = icmp ne i64 %and420, 0, !dbg !802
  br i1 %tobool421, label %if.then422, label %if.end449, !dbg !803

if.then422:                                       ; preds = %if.end419
  %189 = load i8, i8* %b, align 1, !dbg !804
  %tobool423 = icmp ne i8 %189, 0, !dbg !804
  br i1 %tobool423, label %if.end429, label %if.then424, !dbg !807

if.then424:                                       ; preds = %if.then422
  %arraydecay425 = getelementptr inbounds [128 x i8], [128 x i8]* %error, i64 0, i64 0, !dbg !808
  %cur_line426 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 4, !dbg !810
  %190 = load i32, i32* %cur_line426, align 8, !dbg !810
  %cur_col427 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !810
  %191 = load i32, i32* %cur_col427, align 4, !dbg !810
  %call428 = call i32 (i8*, i8*, ...) @sprintf(i8* noundef %arraydecay425, i8* noundef getelementptr inbounds ([39 x i8], [39 x i8]* @.str.3, i64 0, i64 0), i32 noundef %190, i32 noundef %191) #8, !dbg !811
  br label %e_failed, !dbg !812

if.end429:                                        ; preds = %if.then422
  %192 = load i8, i8* %b, align 1, !dbg !813
  %conv430 = sext i8 %192 to i32, !dbg !813
  %cmp431 = icmp eq i32 %conv430, 42, !dbg !815
  br i1 %cmp431, label %land.lhs.true433, label %if.end448, !dbg !816

land.lhs.true433:                                 ; preds = %if.end429
  %ptr434 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 3, !dbg !817
  %193 = load i8*, i8** %ptr434, align 8, !dbg !817
  %194 = load i8*, i8** %end, align 8, !dbg !818
  %add.ptr435 = getelementptr inbounds i8, i8* %194, i64 -1, !dbg !819
  %cmp436 = icmp ult i8* %193, %add.ptr435, !dbg !820
  br i1 %cmp436, label %land.lhs.true438, label %if.end448, !dbg !821

land.lhs.true438:                                 ; preds = %land.lhs.true433
  %ptr439 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 3, !dbg !822
  %195 = load i8*, i8** %ptr439, align 8, !dbg !822
  %arrayidx440 = getelementptr inbounds i8, i8* %195, i64 1, !dbg !823
  %196 = load i8, i8* %arrayidx440, align 1, !dbg !823
  %conv441 = sext i8 %196 to i32, !dbg !823
  %cmp442 = icmp eq i32 %conv441, 47, !dbg !824
  br i1 %cmp442, label %if.then444, label %if.end448, !dbg !825

if.then444:                                       ; preds = %land.lhs.true438
  %197 = load i64, i64* %flags, align 8, !dbg !826
  %and445 = and i64 %197, -16385, !dbg !826
  store i64 %and445, i64* %flags, align 8, !dbg !826
  %ptr446 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 3, !dbg !828
  %198 = load i8*, i8** %ptr446, align 8, !dbg !829
  %incdec.ptr447 = getelementptr inbounds i8, i8* %198, i32 1, !dbg !829
  store i8* %incdec.ptr447, i8** %ptr446, align 8, !dbg !829
  br label %if.end448, !dbg !830

if.end448:                                        ; preds = %if.then444, %land.lhs.true438, %land.lhs.true433, %if.end429
  br label %for.inc, !dbg !831

if.end449:                                        ; preds = %if.end419
  br label %if.end490, !dbg !832

if.else450:                                       ; preds = %if.then398
  %199 = load i8, i8* %b, align 1, !dbg !833
  %conv451 = sext i8 %199 to i32, !dbg !833
  %cmp452 = icmp eq i32 %conv451, 47, !dbg !835
  br i1 %cmp452, label %if.then454, label %if.end489, !dbg !836

if.then454:                                       ; preds = %if.else450
  %200 = load i64, i64* %flags, align 8, !dbg !837
  %and455 = and i64 %200, 136, !dbg !840
  %tobool456 = icmp ne i64 %and455, 0, !dbg !840
  br i1 %tobool456, label %if.end466, label %land.lhs.true457, !dbg !841

land.lhs.true457:                                 ; preds = %if.then454
  %201 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !842
  %type458 = getelementptr inbounds %struct._json_value, %struct._json_value* %201, i32 0, i32 1, !dbg !843
  %202 = load i32, i32* %type458, align 8, !dbg !843
  %cmp459 = icmp ne i32 %202, 1, !dbg !844
  br i1 %cmp459, label %if.then461, label %if.end466, !dbg !845

if.then461:                                       ; preds = %land.lhs.true457
  %arraydecay462 = getelementptr inbounds [128 x i8], [128 x i8]* %error, i64 0, i64 0, !dbg !846
  %cur_line463 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 4, !dbg !848
  %203 = load i32, i32* %cur_line463, align 8, !dbg !848
  %cur_col464 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !848
  %204 = load i32, i32* %cur_col464, align 4, !dbg !848
  %call465 = call i32 (i8*, i8*, ...) @sprintf(i8* noundef %arraydecay462, i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0), i32 noundef %203, i32 noundef %204) #8, !dbg !849
  br label %e_failed, !dbg !850

if.end466:                                        ; preds = %land.lhs.true457, %if.then454
  %ptr467 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 3, !dbg !851
  %205 = load i8*, i8** %ptr467, align 8, !dbg !853
  %incdec.ptr468 = getelementptr inbounds i8, i8* %205, i32 1, !dbg !853
  store i8* %incdec.ptr468, i8** %ptr467, align 8, !dbg !853
  %206 = load i8*, i8** %end, align 8, !dbg !854
  %cmp469 = icmp eq i8* %incdec.ptr468, %206, !dbg !855
  br i1 %cmp469, label %if.then471, label %if.end476, !dbg !856

if.then471:                                       ; preds = %if.end466
  %arraydecay472 = getelementptr inbounds [128 x i8], [128 x i8]* %error, i64 0, i64 0, !dbg !857
  %cur_line473 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 4, !dbg !859
  %207 = load i32, i32* %cur_line473, align 8, !dbg !859
  %cur_col474 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !859
  %208 = load i32, i32* %cur_col474, align 4, !dbg !859
  %call475 = call i32 (i8*, i8*, ...) @sprintf(i8* noundef %arraydecay472, i8* noundef getelementptr inbounds ([22 x i8], [22 x i8]* @.str.5, i64 0, i64 0), i32 noundef %207, i32 noundef %208) #8, !dbg !860
  br label %e_failed, !dbg !861

if.end476:                                        ; preds = %if.end466
  %ptr477 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 3, !dbg !862
  %209 = load i8*, i8** %ptr477, align 8, !dbg !862
  %210 = load i8, i8* %209, align 1, !dbg !863
  store i8 %210, i8* %b, align 1, !dbg !864
  %conv478 = sext i8 %210 to i32, !dbg !865
  switch i32 %conv478, label %sw.default483 [
    i32 47, label %sw.bb479
    i32 42, label %sw.bb481
  ], !dbg !866

sw.bb479:                                         ; preds = %if.end476
  %211 = load i64, i64* %flags, align 8, !dbg !867
  %or480 = or i64 %211, 8192, !dbg !867
  store i64 %or480, i64* %flags, align 8, !dbg !867
  br label %for.inc, !dbg !869

sw.bb481:                                         ; preds = %if.end476
  %212 = load i64, i64* %flags, align 8, !dbg !870
  %or482 = or i64 %212, 16384, !dbg !870
  store i64 %or482, i64* %flags, align 8, !dbg !870
  br label %for.inc, !dbg !871

sw.default483:                                    ; preds = %if.end476
  %arraydecay484 = getelementptr inbounds [128 x i8], [128 x i8]* %error, i64 0, i64 0, !dbg !872
  %cur_line485 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 4, !dbg !873
  %213 = load i32, i32* %cur_line485, align 8, !dbg !873
  %cur_col486 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !873
  %214 = load i32, i32* %cur_col486, align 4, !dbg !873
  %215 = load i8, i8* %b, align 1, !dbg !874
  %conv487 = sext i8 %215 to i32, !dbg !874
  %call488 = call i32 (i8*, i8*, ...) @sprintf(i8* noundef %arraydecay484, i8* noundef getelementptr inbounds ([51 x i8], [51 x i8]* @.str.6, i64 0, i64 0), i32 noundef %213, i32 noundef %214, i32 noundef %conv487) #8, !dbg !875
  br label %e_failed, !dbg !876

if.end489:                                        ; preds = %if.else450
  br label %if.end490

if.end490:                                        ; preds = %if.end489, %if.end449
  br label %if.end491, !dbg !877

if.end491:                                        ; preds = %if.end490, %if.end393
  %216 = load i64, i64* %flags, align 8, !dbg !878
  %and492 = and i64 %216, 128, !dbg !880
  %tobool493 = icmp ne i64 %and492, 0, !dbg !880
  br i1 %tobool493, label %if.then494, label %if.end510, !dbg !881

if.then494:                                       ; preds = %if.end491
  %217 = load i8, i8* %b, align 1, !dbg !882
  %tobool495 = icmp ne i8 %217, 0, !dbg !882
  br i1 %tobool495, label %if.end497, label %if.then496, !dbg !885

if.then496:                                       ; preds = %if.then494
  br label %for.end, !dbg !886

if.end497:                                        ; preds = %if.then494
  %218 = load i8, i8* %b, align 1, !dbg !887
  %conv498 = sext i8 %218 to i32, !dbg !887
  switch i32 %conv498, label %sw.default504 [
    i32 10, label %sw.bb499
    i32 32, label %sw.bb503
    i32 9, label %sw.bb503
    i32 13, label %sw.bb503
  ], !dbg !888

sw.bb499:                                         ; preds = %if.end497
  %cur_line500 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 4, !dbg !889
  %219 = load i32, i32* %cur_line500, align 8, !dbg !889
  %inc501 = add i32 %219, 1, !dbg !889
  store i32 %inc501, i32* %cur_line500, align 8, !dbg !889
  %cur_col502 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !889
  store i32 0, i32* %cur_col502, align 4, !dbg !889
  br label %sw.bb503, !dbg !889

sw.bb503:                                         ; preds = %if.end497, %if.end497, %if.end497, %sw.bb499
  br label %for.inc, !dbg !891

sw.default504:                                    ; preds = %if.end497
  %arraydecay505 = getelementptr inbounds [128 x i8], [128 x i8]* %error, i64 0, i64 0, !dbg !892
  %cur_line506 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 4, !dbg !893
  %220 = load i32, i32* %cur_line506, align 8, !dbg !893
  %cur_col507 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !893
  %221 = load i32, i32* %cur_col507, align 4, !dbg !893
  %222 = load i8, i8* %b, align 1, !dbg !894
  %conv508 = sext i8 %222 to i32, !dbg !894
  %call509 = call i32 (i8*, i8*, ...) @sprintf(i8* noundef %arraydecay505, i8* noundef getelementptr inbounds ([30 x i8], [30 x i8]* @.str.7, i64 0, i64 0), i32 noundef %220, i32 noundef %221, i32 noundef %conv508) #8, !dbg !895
  br label %e_failed, !dbg !896

if.end510:                                        ; preds = %if.end491
  %223 = load i64, i64* %flags, align 8, !dbg !897
  %and511 = and i64 %223, 8, !dbg !899
  %tobool512 = icmp ne i64 %and511, 0, !dbg !899
  br i1 %tobool512, label %if.then513, label %if.else762, !dbg !900

if.then513:                                       ; preds = %if.end510
  %224 = load i8, i8* %b, align 1, !dbg !901
  %conv514 = sext i8 %224 to i32, !dbg !901
  switch i32 %conv514, label %sw.default535 [
    i32 10, label %sw.bb515
    i32 32, label %sw.bb519
    i32 9, label %sw.bb519
    i32 13, label %sw.bb519
    i32 93, label %sw.bb520
  ], !dbg !903

sw.bb515:                                         ; preds = %if.then513
  %cur_line516 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 4, !dbg !904
  %225 = load i32, i32* %cur_line516, align 8, !dbg !904
  %inc517 = add i32 %225, 1, !dbg !904
  store i32 %inc517, i32* %cur_line516, align 8, !dbg !904
  %cur_col518 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !904
  store i32 0, i32* %cur_col518, align 4, !dbg !904
  br label %sw.bb519, !dbg !904

sw.bb519:                                         ; preds = %if.then513, %if.then513, %if.then513, %sw.bb515
  br label %for.inc, !dbg !906

sw.bb520:                                         ; preds = %if.then513
  %226 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !907
  %tobool521 = icmp ne %struct._json_value* %226, null, !dbg !907
  br i1 %tobool521, label %land.lhs.true522, label %if.else529, !dbg !909

land.lhs.true522:                                 ; preds = %sw.bb520
  %227 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !910
  %type523 = getelementptr inbounds %struct._json_value, %struct._json_value* %227, i32 0, i32 1, !dbg !911
  %228 = load i32, i32* %type523, align 8, !dbg !911
  %cmp524 = icmp eq i32 %228, 2, !dbg !912
  br i1 %cmp524, label %if.then526, label %if.else529, !dbg !913

if.then526:                                       ; preds = %land.lhs.true522
  %229 = load i64, i64* %flags, align 8, !dbg !914
  %and527 = and i64 %229, -13, !dbg !915
  %or528 = or i64 %and527, 1, !dbg !916
  store i64 %or528, i64* %flags, align 8, !dbg !917
  br label %if.end534, !dbg !918

if.else529:                                       ; preds = %land.lhs.true522, %sw.bb520
  %arraydecay530 = getelementptr inbounds [128 x i8], [128 x i8]* %error, i64 0, i64 0, !dbg !919
  %cur_line531 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 4, !dbg !921
  %230 = load i32, i32* %cur_line531, align 8, !dbg !921
  %cur_col532 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !921
  %231 = load i32, i32* %cur_col532, align 4, !dbg !921
  %call533 = call i32 (i8*, i8*, ...) @sprintf(i8* noundef %arraydecay530, i8* noundef getelementptr inbounds ([22 x i8], [22 x i8]* @.str.8, i64 0, i64 0), i32 noundef %230, i32 noundef %231) #8, !dbg !922
  br label %e_failed, !dbg !923

if.end534:                                        ; preds = %if.then526
  br label %sw.epilog761, !dbg !924

sw.default535:                                    ; preds = %if.then513
  %232 = load i64, i64* %flags, align 8, !dbg !925
  %and536 = and i64 %232, 4, !dbg !927
  %tobool537 = icmp ne i64 %and536, 0, !dbg !927
  br i1 %tobool537, label %if.then538, label %if.end550, !dbg !928

if.then538:                                       ; preds = %sw.default535
  %233 = load i8, i8* %b, align 1, !dbg !929
  %conv539 = sext i8 %233 to i32, !dbg !929
  %cmp540 = icmp eq i32 %conv539, 44, !dbg !932
  br i1 %cmp540, label %if.then542, label %if.else544, !dbg !933

if.then542:                                       ; preds = %if.then538
  %234 = load i64, i64* %flags, align 8, !dbg !934
  %and543 = and i64 %234, -5, !dbg !934
  store i64 %and543, i64* %flags, align 8, !dbg !934
  br label %for.inc, !dbg !936

if.else544:                                       ; preds = %if.then538
  %arraydecay545 = getelementptr inbounds [128 x i8], [128 x i8]* %error, i64 0, i64 0, !dbg !937
  %cur_line546 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 4, !dbg !939
  %235 = load i32, i32* %cur_line546, align 8, !dbg !939
  %cur_col547 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !939
  %236 = load i32, i32* %cur_col547, align 4, !dbg !939
  %237 = load i8, i8* %b, align 1, !dbg !940
  %conv548 = sext i8 %237 to i32, !dbg !940
  %call549 = call i32 (i8*, i8*, ...) @sprintf(i8* noundef %arraydecay545, i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.9, i64 0, i64 0), i32 noundef %235, i32 noundef %236, i32 noundef %conv548) #8, !dbg !941
  br label %e_failed, !dbg !942

if.end550:                                        ; preds = %sw.default535
  %238 = load i64, i64* %flags, align 8, !dbg !943
  %and551 = and i64 %238, 64, !dbg !945
  %tobool552 = icmp ne i64 %and551, 0, !dbg !945
  br i1 %tobool552, label %if.then553, label %if.end565, !dbg !946

if.then553:                                       ; preds = %if.end550
  %239 = load i8, i8* %b, align 1, !dbg !947
  %conv554 = sext i8 %239 to i32, !dbg !947
  %cmp555 = icmp eq i32 %conv554, 58, !dbg !950
  br i1 %cmp555, label %if.then557, label %if.else559, !dbg !951

if.then557:                                       ; preds = %if.then553
  %240 = load i64, i64* %flags, align 8, !dbg !952
  %and558 = and i64 %240, -65, !dbg !952
  store i64 %and558, i64* %flags, align 8, !dbg !952
  br label %for.inc, !dbg !954

if.else559:                                       ; preds = %if.then553
  %arraydecay560 = getelementptr inbounds [128 x i8], [128 x i8]* %error, i64 0, i64 0, !dbg !955
  %cur_line561 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 4, !dbg !957
  %241 = load i32, i32* %cur_line561, align 8, !dbg !957
  %cur_col562 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !957
  %242 = load i32, i32* %cur_col562, align 4, !dbg !957
  %243 = load i8, i8* %b, align 1, !dbg !958
  %conv563 = sext i8 %243 to i32, !dbg !958
  %call564 = call i32 (i8*, i8*, ...) @sprintf(i8* noundef %arraydecay560, i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.10, i64 0, i64 0), i32 noundef %241, i32 noundef %242, i32 noundef %conv563) #8, !dbg !959
  br label %e_failed, !dbg !960

if.end565:                                        ; preds = %if.end550
  %244 = load i64, i64* %flags, align 8, !dbg !961
  %and566 = and i64 %244, -9, !dbg !961
  store i64 %and566, i64* %flags, align 8, !dbg !961
  %245 = load i8, i8* %b, align 1, !dbg !962
  %conv567 = sext i8 %245 to i32, !dbg !962
  switch i32 %conv567, label %sw.default691 [
    i32 123, label %sw.bb568
    i32 91, label %sw.bb573
    i32 34, label %sw.bb579
    i32 116, label %sw.bb588
    i32 102, label %sw.bb621
    i32 110, label %sw.bb659
  ], !dbg !963

sw.bb568:                                         ; preds = %if.end565
  %call569 = call i32 @new_value(%struct.json_state* noundef %state, %struct._json_value** noundef %top, %struct._json_value** noundef %root, %struct._json_value** noundef %alloc, i32 noundef 1), !dbg !964
  %tobool570 = icmp ne i32 %call569, 0, !dbg !964
  br i1 %tobool570, label %if.end572, label %if.then571, !dbg !967

if.then571:                                       ; preds = %sw.bb568
  br label %e_alloc_failure, !dbg !968

if.end572:                                        ; preds = %sw.bb568
  br label %for.inc, !dbg !969

sw.bb573:                                         ; preds = %if.end565
  %call574 = call i32 @new_value(%struct.json_state* noundef %state, %struct._json_value** noundef %top, %struct._json_value** noundef %root, %struct._json_value** noundef %alloc, i32 noundef 2), !dbg !970
  %tobool575 = icmp ne i32 %call574, 0, !dbg !970
  br i1 %tobool575, label %if.end577, label %if.then576, !dbg !972

if.then576:                                       ; preds = %sw.bb573
  br label %e_alloc_failure, !dbg !973

if.end577:                                        ; preds = %sw.bb573
  %246 = load i64, i64* %flags, align 8, !dbg !974
  %or578 = or i64 %246, 8, !dbg !974
  store i64 %or578, i64* %flags, align 8, !dbg !974
  br label %for.inc, !dbg !975

sw.bb579:                                         ; preds = %if.end565
  %call580 = call i32 @new_value(%struct.json_state* noundef %state, %struct._json_value** noundef %top, %struct._json_value** noundef %root, %struct._json_value** noundef %alloc, i32 noundef 5), !dbg !976
  %tobool581 = icmp ne i32 %call580, 0, !dbg !976
  br i1 %tobool581, label %if.end583, label %if.then582, !dbg !978

if.then582:                                       ; preds = %sw.bb579
  br label %e_alloc_failure, !dbg !979

if.end583:                                        ; preds = %sw.bb579
  %247 = load i64, i64* %flags, align 8, !dbg !980
  %or584 = or i64 %247, 32, !dbg !980
  store i64 %or584, i64* %flags, align 8, !dbg !980
  %248 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !981
  %u585 = getelementptr inbounds %struct._json_value, %struct._json_value* %248, i32 0, i32 2, !dbg !982
  %string586 = bitcast %union.anon* %u585 to %struct.anon*, !dbg !983
  %ptr587 = getelementptr inbounds %struct.anon, %struct.anon* %string586, i32 0, i32 1, !dbg !984
  %249 = load i8*, i8** %ptr587, align 8, !dbg !984
  store i8* %249, i8** %string, align 8, !dbg !985
  store i32 0, i32* %string_length, align 4, !dbg !986
  br label %for.inc, !dbg !987

sw.bb588:                                         ; preds = %if.end565
  %250 = load i8*, i8** %end, align 8, !dbg !988
  %ptr589 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 3, !dbg !990
  %251 = load i8*, i8** %ptr589, align 8, !dbg !990
  %sub.ptr.lhs.cast590 = ptrtoint i8* %250 to i64, !dbg !991
  %sub.ptr.rhs.cast591 = ptrtoint i8* %251 to i64, !dbg !991
  %sub.ptr.sub592 = sub i64 %sub.ptr.lhs.cast590, %sub.ptr.rhs.cast591, !dbg !991
  %cmp593 = icmp sle i64 %sub.ptr.sub592, 3, !dbg !992
  br i1 %cmp593, label %if.then613, label %lor.lhs.false595, !dbg !993

lor.lhs.false595:                                 ; preds = %sw.bb588
  %ptr596 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 3, !dbg !994
  %252 = load i8*, i8** %ptr596, align 8, !dbg !995
  %incdec.ptr597 = getelementptr inbounds i8, i8* %252, i32 1, !dbg !995
  store i8* %incdec.ptr597, i8** %ptr596, align 8, !dbg !995
  %253 = load i8, i8* %incdec.ptr597, align 1, !dbg !996
  %conv598 = sext i8 %253 to i32, !dbg !996
  %cmp599 = icmp ne i32 %conv598, 114, !dbg !997
  br i1 %cmp599, label %if.then613, label %lor.lhs.false601, !dbg !998

lor.lhs.false601:                                 ; preds = %lor.lhs.false595
  %ptr602 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 3, !dbg !999
  %254 = load i8*, i8** %ptr602, align 8, !dbg !1000
  %incdec.ptr603 = getelementptr inbounds i8, i8* %254, i32 1, !dbg !1000
  store i8* %incdec.ptr603, i8** %ptr602, align 8, !dbg !1000
  %255 = load i8, i8* %incdec.ptr603, align 1, !dbg !1001
  %conv604 = sext i8 %255 to i32, !dbg !1001
  %cmp605 = icmp ne i32 %conv604, 117, !dbg !1002
  br i1 %cmp605, label %if.then613, label %lor.lhs.false607, !dbg !1003

lor.lhs.false607:                                 ; preds = %lor.lhs.false601
  %ptr608 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 3, !dbg !1004
  %256 = load i8*, i8** %ptr608, align 8, !dbg !1005
  %incdec.ptr609 = getelementptr inbounds i8, i8* %256, i32 1, !dbg !1005
  store i8* %incdec.ptr609, i8** %ptr608, align 8, !dbg !1005
  %257 = load i8, i8* %incdec.ptr609, align 1, !dbg !1006
  %conv610 = sext i8 %257 to i32, !dbg !1006
  %cmp611 = icmp ne i32 %conv610, 101, !dbg !1007
  br i1 %cmp611, label %if.then613, label %if.end614, !dbg !1008

if.then613:                                       ; preds = %lor.lhs.false607, %lor.lhs.false601, %lor.lhs.false595, %sw.bb588
  br label %e_unknown_value, !dbg !1009

if.end614:                                        ; preds = %lor.lhs.false607
  %call615 = call i32 @new_value(%struct.json_state* noundef %state, %struct._json_value** noundef %top, %struct._json_value** noundef %root, %struct._json_value** noundef %alloc, i32 noundef 6), !dbg !1011
  %tobool616 = icmp ne i32 %call615, 0, !dbg !1011
  br i1 %tobool616, label %if.end618, label %if.then617, !dbg !1013

if.then617:                                       ; preds = %if.end614
  br label %e_alloc_failure, !dbg !1014

if.end618:                                        ; preds = %if.end614
  %258 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1015
  %u619 = getelementptr inbounds %struct._json_value, %struct._json_value* %258, i32 0, i32 2, !dbg !1016
  %boolean = bitcast %union.anon* %u619 to i32*, !dbg !1017
  store i32 1, i32* %boolean, align 8, !dbg !1018
  %259 = load i64, i64* %flags, align 8, !dbg !1019
  %or620 = or i64 %259, 1, !dbg !1019
  store i64 %or620, i64* %flags, align 8, !dbg !1019
  br label %sw.epilog760, !dbg !1020

sw.bb621:                                         ; preds = %if.end565
  %260 = load i8*, i8** %end, align 8, !dbg !1021
  %ptr622 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 3, !dbg !1023
  %261 = load i8*, i8** %ptr622, align 8, !dbg !1023
  %sub.ptr.lhs.cast623 = ptrtoint i8* %260 to i64, !dbg !1024
  %sub.ptr.rhs.cast624 = ptrtoint i8* %261 to i64, !dbg !1024
  %sub.ptr.sub625 = sub i64 %sub.ptr.lhs.cast623, %sub.ptr.rhs.cast624, !dbg !1024
  %cmp626 = icmp sle i64 %sub.ptr.sub625, 4, !dbg !1025
  br i1 %cmp626, label %if.then652, label %lor.lhs.false628, !dbg !1026

lor.lhs.false628:                                 ; preds = %sw.bb621
  %ptr629 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 3, !dbg !1027
  %262 = load i8*, i8** %ptr629, align 8, !dbg !1028
  %incdec.ptr630 = getelementptr inbounds i8, i8* %262, i32 1, !dbg !1028
  store i8* %incdec.ptr630, i8** %ptr629, align 8, !dbg !1028
  %263 = load i8, i8* %incdec.ptr630, align 1, !dbg !1029
  %conv631 = sext i8 %263 to i32, !dbg !1029
  %cmp632 = icmp ne i32 %conv631, 97, !dbg !1030
  br i1 %cmp632, label %if.then652, label %lor.lhs.false634, !dbg !1031

lor.lhs.false634:                                 ; preds = %lor.lhs.false628
  %ptr635 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 3, !dbg !1032
  %264 = load i8*, i8** %ptr635, align 8, !dbg !1033
  %incdec.ptr636 = getelementptr inbounds i8, i8* %264, i32 1, !dbg !1033
  store i8* %incdec.ptr636, i8** %ptr635, align 8, !dbg !1033
  %265 = load i8, i8* %incdec.ptr636, align 1, !dbg !1034
  %conv637 = sext i8 %265 to i32, !dbg !1034
  %cmp638 = icmp ne i32 %conv637, 108, !dbg !1035
  br i1 %cmp638, label %if.then652, label %lor.lhs.false640, !dbg !1036

lor.lhs.false640:                                 ; preds = %lor.lhs.false634
  %ptr641 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 3, !dbg !1037
  %266 = load i8*, i8** %ptr641, align 8, !dbg !1038
  %incdec.ptr642 = getelementptr inbounds i8, i8* %266, i32 1, !dbg !1038
  store i8* %incdec.ptr642, i8** %ptr641, align 8, !dbg !1038
  %267 = load i8, i8* %incdec.ptr642, align 1, !dbg !1039
  %conv643 = sext i8 %267 to i32, !dbg !1039
  %cmp644 = icmp ne i32 %conv643, 115, !dbg !1040
  br i1 %cmp644, label %if.then652, label %lor.lhs.false646, !dbg !1041

lor.lhs.false646:                                 ; preds = %lor.lhs.false640
  %ptr647 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 3, !dbg !1042
  %268 = load i8*, i8** %ptr647, align 8, !dbg !1043
  %incdec.ptr648 = getelementptr inbounds i8, i8* %268, i32 1, !dbg !1043
  store i8* %incdec.ptr648, i8** %ptr647, align 8, !dbg !1043
  %269 = load i8, i8* %incdec.ptr648, align 1, !dbg !1044
  %conv649 = sext i8 %269 to i32, !dbg !1044
  %cmp650 = icmp ne i32 %conv649, 101, !dbg !1045
  br i1 %cmp650, label %if.then652, label %if.end653, !dbg !1046

if.then652:                                       ; preds = %lor.lhs.false646, %lor.lhs.false640, %lor.lhs.false634, %lor.lhs.false628, %sw.bb621
  br label %e_unknown_value, !dbg !1047

if.end653:                                        ; preds = %lor.lhs.false646
  %call654 = call i32 @new_value(%struct.json_state* noundef %state, %struct._json_value** noundef %top, %struct._json_value** noundef %root, %struct._json_value** noundef %alloc, i32 noundef 6), !dbg !1049
  %tobool655 = icmp ne i32 %call654, 0, !dbg !1049
  br i1 %tobool655, label %if.end657, label %if.then656, !dbg !1051

if.then656:                                       ; preds = %if.end653
  br label %e_alloc_failure, !dbg !1052

if.end657:                                        ; preds = %if.end653
  %270 = load i64, i64* %flags, align 8, !dbg !1053
  %or658 = or i64 %270, 1, !dbg !1053
  store i64 %or658, i64* %flags, align 8, !dbg !1053
  br label %sw.epilog760, !dbg !1054

sw.bb659:                                         ; preds = %if.end565
  %271 = load i8*, i8** %end, align 8, !dbg !1055
  %ptr660 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 3, !dbg !1057
  %272 = load i8*, i8** %ptr660, align 8, !dbg !1057
  %sub.ptr.lhs.cast661 = ptrtoint i8* %271 to i64, !dbg !1058
  %sub.ptr.rhs.cast662 = ptrtoint i8* %272 to i64, !dbg !1058
  %sub.ptr.sub663 = sub i64 %sub.ptr.lhs.cast661, %sub.ptr.rhs.cast662, !dbg !1058
  %cmp664 = icmp sle i64 %sub.ptr.sub663, 3, !dbg !1059
  br i1 %cmp664, label %if.then684, label %lor.lhs.false666, !dbg !1060

lor.lhs.false666:                                 ; preds = %sw.bb659
  %ptr667 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 3, !dbg !1061
  %273 = load i8*, i8** %ptr667, align 8, !dbg !1062
  %incdec.ptr668 = getelementptr inbounds i8, i8* %273, i32 1, !dbg !1062
  store i8* %incdec.ptr668, i8** %ptr667, align 8, !dbg !1062
  %274 = load i8, i8* %incdec.ptr668, align 1, !dbg !1063
  %conv669 = sext i8 %274 to i32, !dbg !1063
  %cmp670 = icmp ne i32 %conv669, 117, !dbg !1064
  br i1 %cmp670, label %if.then684, label %lor.lhs.false672, !dbg !1065

lor.lhs.false672:                                 ; preds = %lor.lhs.false666
  %ptr673 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 3, !dbg !1066
  %275 = load i8*, i8** %ptr673, align 8, !dbg !1067
  %incdec.ptr674 = getelementptr inbounds i8, i8* %275, i32 1, !dbg !1067
  store i8* %incdec.ptr674, i8** %ptr673, align 8, !dbg !1067
  %276 = load i8, i8* %incdec.ptr674, align 1, !dbg !1068
  %conv675 = sext i8 %276 to i32, !dbg !1068
  %cmp676 = icmp ne i32 %conv675, 108, !dbg !1069
  br i1 %cmp676, label %if.then684, label %lor.lhs.false678, !dbg !1070

lor.lhs.false678:                                 ; preds = %lor.lhs.false672
  %ptr679 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 3, !dbg !1071
  %277 = load i8*, i8** %ptr679, align 8, !dbg !1072
  %incdec.ptr680 = getelementptr inbounds i8, i8* %277, i32 1, !dbg !1072
  store i8* %incdec.ptr680, i8** %ptr679, align 8, !dbg !1072
  %278 = load i8, i8* %incdec.ptr680, align 1, !dbg !1073
  %conv681 = sext i8 %278 to i32, !dbg !1073
  %cmp682 = icmp ne i32 %conv681, 108, !dbg !1074
  br i1 %cmp682, label %if.then684, label %if.end685, !dbg !1075

if.then684:                                       ; preds = %lor.lhs.false678, %lor.lhs.false672, %lor.lhs.false666, %sw.bb659
  br label %e_unknown_value, !dbg !1076

if.end685:                                        ; preds = %lor.lhs.false678
  %call686 = call i32 @new_value(%struct.json_state* noundef %state, %struct._json_value** noundef %top, %struct._json_value** noundef %root, %struct._json_value** noundef %alloc, i32 noundef 7), !dbg !1078
  %tobool687 = icmp ne i32 %call686, 0, !dbg !1078
  br i1 %tobool687, label %if.end689, label %if.then688, !dbg !1080

if.then688:                                       ; preds = %if.end685
  br label %e_alloc_failure, !dbg !1081

if.end689:                                        ; preds = %if.end685
  %279 = load i64, i64* %flags, align 8, !dbg !1082
  %or690 = or i64 %279, 1, !dbg !1082
  store i64 %or690, i64* %flags, align 8, !dbg !1082
  br label %sw.epilog760, !dbg !1083

sw.default691:                                    ; preds = %if.end565
  %call692 = call i16** @__ctype_b_loc() #10, !dbg !1084
  %280 = load i16*, i16** %call692, align 8, !dbg !1084
  %281 = load i8, i8* %b, align 1, !dbg !1084
  %conv693 = zext i8 %281 to i32, !dbg !1084
  %idxprom694 = sext i32 %conv693 to i64, !dbg !1084
  %arrayidx695 = getelementptr inbounds i16, i16* %280, i64 %idxprom694, !dbg !1084
  %282 = load i16, i16* %arrayidx695, align 2, !dbg !1084
  %conv696 = zext i16 %282 to i32, !dbg !1084
  %and697 = and i32 %conv696, 2048, !dbg !1084
  %tobool698 = icmp ne i32 %and697, 0, !dbg !1084
  br i1 %tobool698, label %if.then703, label %lor.lhs.false699, !dbg !1086

lor.lhs.false699:                                 ; preds = %sw.default691
  %283 = load i8, i8* %b, align 1, !dbg !1087
  %conv700 = sext i8 %283 to i32, !dbg !1087
  %cmp701 = icmp eq i32 %conv700, 45, !dbg !1088
  br i1 %cmp701, label %if.then703, label %if.else754, !dbg !1089

if.then703:                                       ; preds = %lor.lhs.false699, %sw.default691
  %call704 = call i32 @new_value(%struct.json_state* noundef %state, %struct._json_value** noundef %top, %struct._json_value** noundef %root, %struct._json_value** noundef %alloc, i32 noundef 3), !dbg !1090
  %tobool705 = icmp ne i32 %call704, 0, !dbg !1090
  br i1 %tobool705, label %if.end707, label %if.then706, !dbg !1093

if.then706:                                       ; preds = %if.then703
  br label %e_alloc_failure, !dbg !1094

if.end707:                                        ; preds = %if.then703
  %first_pass708 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 2, !dbg !1095
  %284 = load i32, i32* %first_pass708, align 8, !dbg !1095
  %tobool709 = icmp ne i32 %284, 0, !dbg !1097
  br i1 %tobool709, label %if.end745, label %if.then710, !dbg !1098

if.then710:                                       ; preds = %if.end707
  br label %while.cond, !dbg !1099

while.cond:                                       ; preds = %if.end742, %if.then710
  %call711 = call i16** @__ctype_b_loc() #10, !dbg !1101
  %285 = load i16*, i16** %call711, align 8, !dbg !1101
  %286 = load i8, i8* %b, align 1, !dbg !1101
  %conv712 = zext i8 %286 to i32, !dbg !1101
  %idxprom713 = sext i32 %conv712 to i64, !dbg !1101
  %arrayidx714 = getelementptr inbounds i16, i16* %285, i64 %idxprom713, !dbg !1101
  %287 = load i16, i16* %arrayidx714, align 2, !dbg !1101
  %conv715 = zext i16 %287 to i32, !dbg !1101
  %and716 = and i32 %conv715, 2048, !dbg !1101
  %tobool717 = icmp ne i32 %and716, 0, !dbg !1101
  br i1 %tobool717, label %lor.end, label %lor.lhs.false718, !dbg !1102

lor.lhs.false718:                                 ; preds = %while.cond
  %288 = load i8, i8* %b, align 1, !dbg !1103
  %conv719 = sext i8 %288 to i32, !dbg !1103
  %cmp720 = icmp eq i32 %conv719, 43, !dbg !1104
  br i1 %cmp720, label %lor.end, label %lor.lhs.false722, !dbg !1105

lor.lhs.false722:                                 ; preds = %lor.lhs.false718
  %289 = load i8, i8* %b, align 1, !dbg !1106
  %conv723 = sext i8 %289 to i32, !dbg !1106
  %cmp724 = icmp eq i32 %conv723, 45, !dbg !1107
  br i1 %cmp724, label %lor.end, label %lor.lhs.false726, !dbg !1108

lor.lhs.false726:                                 ; preds = %lor.lhs.false722
  %290 = load i8, i8* %b, align 1, !dbg !1109
  %conv727 = sext i8 %290 to i32, !dbg !1109
  %cmp728 = icmp eq i32 %conv727, 101, !dbg !1110
  br i1 %cmp728, label %lor.end, label %lor.lhs.false730, !dbg !1111

lor.lhs.false730:                                 ; preds = %lor.lhs.false726
  %291 = load i8, i8* %b, align 1, !dbg !1112
  %conv731 = sext i8 %291 to i32, !dbg !1112
  %cmp732 = icmp eq i32 %conv731, 69, !dbg !1113
  br i1 %cmp732, label %lor.end, label %lor.rhs, !dbg !1114

lor.rhs:                                          ; preds = %lor.lhs.false730
  %292 = load i8, i8* %b, align 1, !dbg !1115
  %conv734 = sext i8 %292 to i32, !dbg !1115
  %cmp735 = icmp eq i32 %conv734, 46, !dbg !1116
  br label %lor.end, !dbg !1114

lor.end:                                          ; preds = %lor.rhs, %lor.lhs.false730, %lor.lhs.false726, %lor.lhs.false722, %lor.lhs.false718, %while.cond
  %293 = phi i1 [ true, %lor.lhs.false730 ], [ true, %lor.lhs.false726 ], [ true, %lor.lhs.false722 ], [ true, %lor.lhs.false718 ], [ true, %while.cond ], [ %cmp735, %lor.rhs ]
  br i1 %293, label %while.body, label %while.end, !dbg !1099

while.body:                                       ; preds = %lor.end
  %ptr737 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 3, !dbg !1117
  %294 = load i8*, i8** %ptr737, align 8, !dbg !1120
  %incdec.ptr738 = getelementptr inbounds i8, i8* %294, i32 1, !dbg !1120
  store i8* %incdec.ptr738, i8** %ptr737, align 8, !dbg !1120
  %295 = load i8*, i8** %end, align 8, !dbg !1121
  %cmp739 = icmp eq i8* %incdec.ptr738, %295, !dbg !1122
  br i1 %cmp739, label %if.then741, label %if.end742, !dbg !1123

if.then741:                                       ; preds = %while.body
  store i8 0, i8* %b, align 1, !dbg !1124
  br label %while.end, !dbg !1126

if.end742:                                        ; preds = %while.body
  %ptr743 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 3, !dbg !1127
  %296 = load i8*, i8** %ptr743, align 8, !dbg !1127
  %297 = load i8, i8* %296, align 1, !dbg !1128
  store i8 %297, i8* %b, align 1, !dbg !1129
  br label %while.cond, !dbg !1099, !llvm.loop !1130

while.end:                                        ; preds = %if.then741, %lor.end
  %298 = load i64, i64* %flags, align 8, !dbg !1133
  %or744 = or i64 %298, 3, !dbg !1133
  store i64 %or744, i64* %flags, align 8, !dbg !1133
  br label %sw.epilog760, !dbg !1134

if.end745:                                        ; preds = %if.end707
  %299 = load i64, i64* %flags, align 8, !dbg !1135
  %and746 = and i64 %299, -7937, !dbg !1135
  store i64 %and746, i64* %flags, align 8, !dbg !1135
  store i32 0, i32* %num_digits, align 4, !dbg !1136
  store double 0.000000e+00, double* %num_fraction, align 8, !dbg !1137
  store double 0.000000e+00, double* %num_e, align 8, !dbg !1138
  %300 = load i8, i8* %b, align 1, !dbg !1139
  %conv747 = sext i8 %300 to i32, !dbg !1139
  %cmp748 = icmp ne i32 %conv747, 45, !dbg !1141
  br i1 %cmp748, label %if.then750, label %if.end752, !dbg !1142

if.then750:                                       ; preds = %if.end745
  %301 = load i64, i64* %flags, align 8, !dbg !1143
  %or751 = or i64 %301, 2, !dbg !1143
  store i64 %or751, i64* %flags, align 8, !dbg !1143
  br label %sw.epilog760, !dbg !1145

if.end752:                                        ; preds = %if.end745
  %302 = load i64, i64* %flags, align 8, !dbg !1146
  %or753 = or i64 %302, 256, !dbg !1146
  store i64 %or753, i64* %flags, align 8, !dbg !1146
  br label %for.inc, !dbg !1147

if.else754:                                       ; preds = %lor.lhs.false699
  %arraydecay755 = getelementptr inbounds [128 x i8], [128 x i8]* %error, i64 0, i64 0, !dbg !1148
  %cur_line756 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 4, !dbg !1150
  %303 = load i32, i32* %cur_line756, align 8, !dbg !1150
  %cur_col757 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !1150
  %304 = load i32, i32* %cur_col757, align 4, !dbg !1150
  %305 = load i8, i8* %b, align 1, !dbg !1151
  %conv758 = sext i8 %305 to i32, !dbg !1151
  %call759 = call i32 (i8*, i8*, ...) @sprintf(i8* noundef %arraydecay755, i8* noundef getelementptr inbounds ([42 x i8], [42 x i8]* @.str.11, i64 0, i64 0), i32 noundef %303, i32 noundef %304, i32 noundef %conv758) #8, !dbg !1152
  br label %e_failed, !dbg !1153

sw.epilog760:                                     ; preds = %if.then750, %while.end, %if.end689, %if.end657, %if.end618
  br label %sw.epilog761, !dbg !1154

sw.epilog761:                                     ; preds = %sw.epilog760, %if.end534
  br label %if.end1016, !dbg !1155

if.else762:                                       ; preds = %if.end510
  %306 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1156
  %type763 = getelementptr inbounds %struct._json_value, %struct._json_value* %306, i32 0, i32 1, !dbg !1158
  %307 = load i32, i32* %type763, align 8, !dbg !1158
  switch i32 %307, label %sw.default1014 [
    i32 1, label %sw.bb764
    i32 3, label %sw.bb799
    i32 4, label %sw.bb799
  ], !dbg !1159

sw.bb764:                                         ; preds = %if.else762
  %308 = load i8, i8* %b, align 1, !dbg !1160
  %conv765 = sext i8 %308 to i32, !dbg !1160
  switch i32 %conv765, label %sw.default792 [
    i32 10, label %sw.bb766
    i32 32, label %sw.bb770
    i32 9, label %sw.bb770
    i32 13, label %sw.bb770
    i32 34, label %sw.bb771
    i32 125, label %sw.bb783
    i32 44, label %sw.bb786
  ], !dbg !1162

sw.bb766:                                         ; preds = %sw.bb764
  %cur_line767 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 4, !dbg !1163
  %309 = load i32, i32* %cur_line767, align 8, !dbg !1163
  %inc768 = add i32 %309, 1, !dbg !1163
  store i32 %inc768, i32* %cur_line767, align 8, !dbg !1163
  %cur_col769 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !1163
  store i32 0, i32* %cur_col769, align 4, !dbg !1163
  br label %sw.bb770, !dbg !1163

sw.bb770:                                         ; preds = %sw.bb764, %sw.bb764, %sw.bb764, %sw.bb766
  br label %for.inc, !dbg !1165

sw.bb771:                                         ; preds = %sw.bb764
  %310 = load i64, i64* %flags, align 8, !dbg !1166
  %and772 = and i64 %310, 4, !dbg !1168
  %tobool773 = icmp ne i64 %and772, 0, !dbg !1168
  br i1 %tobool773, label %if.then774, label %if.end779, !dbg !1169

if.then774:                                       ; preds = %sw.bb771
  %arraydecay775 = getelementptr inbounds [128 x i8], [128 x i8]* %error, i64 0, i64 0, !dbg !1170
  %cur_line776 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 4, !dbg !1172
  %311 = load i32, i32* %cur_line776, align 8, !dbg !1172
  %cur_col777 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !1172
  %312 = load i32, i32* %cur_col777, align 4, !dbg !1172
  %call778 = call i32 (i8*, i8*, ...) @sprintf(i8* noundef %arraydecay775, i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.12, i64 0, i64 0), i32 noundef %311, i32 noundef %312) #8, !dbg !1173
  br label %e_failed, !dbg !1174

if.end779:                                        ; preds = %sw.bb771
  %313 = load i64, i64* %flags, align 8, !dbg !1175
  %or780 = or i64 %313, 32, !dbg !1175
  store i64 %or780, i64* %flags, align 8, !dbg !1175
  %314 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1176
  %_reserved781 = getelementptr inbounds %struct._json_value, %struct._json_value* %314, i32 0, i32 3, !dbg !1177
  %object_mem782 = bitcast %union.anon.2* %_reserved781 to i8**, !dbg !1178
  %315 = load i8*, i8** %object_mem782, align 8, !dbg !1178
  store i8* %315, i8** %string, align 8, !dbg !1179
  store i32 0, i32* %string_length, align 4, !dbg !1180
  br label %sw.epilog798, !dbg !1181

sw.bb783:                                         ; preds = %sw.bb764
  %316 = load i64, i64* %flags, align 8, !dbg !1182
  %and784 = and i64 %316, -5, !dbg !1183
  %or785 = or i64 %and784, 1, !dbg !1184
  store i64 %or785, i64* %flags, align 8, !dbg !1185
  br label %sw.epilog798, !dbg !1186

sw.bb786:                                         ; preds = %sw.bb764
  %317 = load i64, i64* %flags, align 8, !dbg !1187
  %and787 = and i64 %317, 4, !dbg !1189
  %tobool788 = icmp ne i64 %and787, 0, !dbg !1189
  br i1 %tobool788, label %if.then789, label %if.end791, !dbg !1190

if.then789:                                       ; preds = %sw.bb786
  %318 = load i64, i64* %flags, align 8, !dbg !1191
  %and790 = and i64 %318, -5, !dbg !1191
  store i64 %and790, i64* %flags, align 8, !dbg !1191
  br label %sw.epilog798, !dbg !1193

if.end791:                                        ; preds = %sw.bb786
  br label %sw.default792, !dbg !1194

sw.default792:                                    ; preds = %sw.bb764, %if.end791
  %arraydecay793 = getelementptr inbounds [128 x i8], [128 x i8]* %error, i64 0, i64 0, !dbg !1195
  %cur_line794 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 4, !dbg !1196
  %319 = load i32, i32* %cur_line794, align 8, !dbg !1196
  %cur_col795 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !1196
  %320 = load i32, i32* %cur_col795, align 4, !dbg !1196
  %321 = load i8, i8* %b, align 1, !dbg !1197
  %conv796 = sext i8 %321 to i32, !dbg !1197
  %call797 = call i32 (i8*, i8*, ...) @sprintf(i8* noundef %arraydecay793, i8* noundef getelementptr inbounds ([33 x i8], [33 x i8]* @.str.13, i64 0, i64 0), i32 noundef %319, i32 noundef %320, i32 noundef %conv796) #8, !dbg !1198
  br label %e_failed, !dbg !1199

sw.epilog798:                                     ; preds = %if.then789, %sw.bb783, %if.end779
  br label %sw.epilog1015, !dbg !1200

sw.bb799:                                         ; preds = %if.else762, %if.else762
  %call800 = call i16** @__ctype_b_loc() #10, !dbg !1201
  %322 = load i16*, i16** %call800, align 8, !dbg !1201
  %323 = load i8, i8* %b, align 1, !dbg !1201
  %conv801 = zext i8 %323 to i32, !dbg !1201
  %idxprom802 = sext i32 %conv801 to i64, !dbg !1201
  %arrayidx803 = getelementptr inbounds i16, i16* %322, i64 %idxprom802, !dbg !1201
  %324 = load i16, i16* %arrayidx803, align 2, !dbg !1201
  %conv804 = zext i16 %324 to i32, !dbg !1201
  %and805 = and i32 %conv804, 2048, !dbg !1201
  %tobool806 = icmp ne i32 %and805, 0, !dbg !1201
  br i1 %tobool806, label %if.then807, label %if.end882, !dbg !1203

if.then807:                                       ; preds = %sw.bb799
  %325 = load i32, i32* %num_digits, align 4, !dbg !1204
  %inc808 = add nsw i32 %325, 1, !dbg !1204
  store i32 %inc808, i32* %num_digits, align 4, !dbg !1204
  %326 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1206
  %type809 = getelementptr inbounds %struct._json_value, %struct._json_value* %326, i32 0, i32 1, !dbg !1208
  %327 = load i32, i32* %type809, align 8, !dbg !1208
  %cmp810 = icmp eq i32 %327, 3, !dbg !1209
  br i1 %cmp810, label %if.then815, label %lor.lhs.false812, !dbg !1210

lor.lhs.false812:                                 ; preds = %if.then807
  %328 = load i64, i64* %flags, align 8, !dbg !1211
  %and813 = and i64 %328, 1024, !dbg !1212
  %tobool814 = icmp ne i64 %and813, 0, !dbg !1212
  br i1 %tobool814, label %if.then815, label %if.end864, !dbg !1213

if.then815:                                       ; preds = %lor.lhs.false812, %if.then807
  %329 = load i64, i64* %flags, align 8, !dbg !1214
  %and816 = and i64 %329, 1024, !dbg !1217
  %tobool817 = icmp ne i64 %and816, 0, !dbg !1217
  br i1 %tobool817, label %if.else837, label %if.then818, !dbg !1218

if.then818:                                       ; preds = %if.then815
  %330 = load i64, i64* %flags, align 8, !dbg !1219
  %and819 = and i64 %330, 512, !dbg !1222
  %tobool820 = icmp ne i64 %and819, 0, !dbg !1222
  br i1 %tobool820, label %if.then821, label %if.end827, !dbg !1223

if.then821:                                       ; preds = %if.then818
  %arraydecay822 = getelementptr inbounds [128 x i8], [128 x i8]* %error, i64 0, i64 0, !dbg !1224
  %cur_line823 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 4, !dbg !1226
  %331 = load i32, i32* %cur_line823, align 8, !dbg !1226
  %cur_col824 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !1226
  %332 = load i32, i32* %cur_col824, align 4, !dbg !1226
  %333 = load i8, i8* %b, align 1, !dbg !1227
  %conv825 = sext i8 %333 to i32, !dbg !1227
  %call826 = call i32 (i8*, i8*, ...) @sprintf(i8* noundef %arraydecay822, i8* noundef getelementptr inbounds ([34 x i8], [34 x i8]* @.str.14, i64 0, i64 0), i32 noundef %331, i32 noundef %332, i32 noundef %conv825) #8, !dbg !1228
  br label %e_failed, !dbg !1229

if.end827:                                        ; preds = %if.then818
  %334 = load i32, i32* %num_digits, align 4, !dbg !1230
  %cmp828 = icmp eq i32 %334, 1, !dbg !1232
  br i1 %cmp828, label %land.lhs.true830, label %if.end836, !dbg !1233

land.lhs.true830:                                 ; preds = %if.end827
  %335 = load i8, i8* %b, align 1, !dbg !1234
  %conv831 = sext i8 %335 to i32, !dbg !1234
  %cmp832 = icmp eq i32 %conv831, 48, !dbg !1235
  br i1 %cmp832, label %if.then834, label %if.end836, !dbg !1236

if.then834:                                       ; preds = %land.lhs.true830
  %336 = load i64, i64* %flags, align 8, !dbg !1237
  %or835 = or i64 %336, 512, !dbg !1237
  store i64 %or835, i64* %flags, align 8, !dbg !1237
  br label %if.end836, !dbg !1238

if.end836:                                        ; preds = %if.then834, %land.lhs.true830, %if.end827
  br label %if.end842, !dbg !1239

if.else837:                                       ; preds = %if.then815
  %337 = load i64, i64* %flags, align 8, !dbg !1240
  %or838 = or i64 %337, 2048, !dbg !1240
  store i64 %or838, i64* %flags, align 8, !dbg !1240
  %338 = load double, double* %num_e, align 8, !dbg !1242
  %339 = load i8, i8* %b, align 1, !dbg !1243
  %conv839 = sext i8 %339 to i32, !dbg !1243
  %sub840 = sub nsw i32 %conv839, 48, !dbg !1244
  %conv841 = sitofp i32 %sub840 to double, !dbg !1245
  %340 = call double @llvm.fmuladd.f64(double %338, double 1.000000e+01, double %conv841), !dbg !1246
  store double %340, double* %num_e, align 8, !dbg !1247
  br label %for.inc, !dbg !1248

if.end842:                                        ; preds = %if.end836
  %341 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1249
  %u843 = getelementptr inbounds %struct._json_value, %struct._json_value* %341, i32 0, i32 2, !dbg !1251
  %integer = bitcast %union.anon* %u843 to i64*, !dbg !1252
  %342 = load i64, i64* %integer, align 8, !dbg !1252
  %343 = load i8, i8* %b, align 1, !dbg !1253
  %call844 = call i32 @would_overflow(i64 noundef %342, i8 noundef signext %343), !dbg !1254
  %tobool845 = icmp ne i32 %call844, 0, !dbg !1254
  br i1 %tobool845, label %if.then846, label %if.end855, !dbg !1255

if.then846:                                       ; preds = %if.end842
  call void @llvm.dbg.declare(metadata i64* %integer847, metadata !1256, metadata !DIExpression()), !dbg !1258
  %344 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1259
  %u848 = getelementptr inbounds %struct._json_value, %struct._json_value* %344, i32 0, i32 2, !dbg !1260
  %integer849 = bitcast %union.anon* %u848 to i64*, !dbg !1261
  %345 = load i64, i64* %integer849, align 8, !dbg !1261
  store i64 %345, i64* %integer847, align 8, !dbg !1258
  %346 = load i32, i32* %num_digits, align 4, !dbg !1262
  %dec = add nsw i32 %346, -1, !dbg !1262
  store i32 %dec, i32* %num_digits, align 4, !dbg !1262
  %ptr850 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 3, !dbg !1263
  %347 = load i8*, i8** %ptr850, align 8, !dbg !1264
  %incdec.ptr851 = getelementptr inbounds i8, i8* %347, i32 -1, !dbg !1264
  store i8* %incdec.ptr851, i8** %ptr850, align 8, !dbg !1264
  %348 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1265
  %type852 = getelementptr inbounds %struct._json_value, %struct._json_value* %348, i32 0, i32 1, !dbg !1266
  store i32 4, i32* %type852, align 8, !dbg !1267
  %349 = load i64, i64* %integer847, align 8, !dbg !1268
  %conv853 = sitofp i64 %349 to double, !dbg !1269
  %350 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1270
  %u854 = getelementptr inbounds %struct._json_value, %struct._json_value* %350, i32 0, i32 2, !dbg !1271
  %dbl = bitcast %union.anon* %u854 to double*, !dbg !1272
  store double %conv853, double* %dbl, align 8, !dbg !1273
  br label %for.inc, !dbg !1274

if.end855:                                        ; preds = %if.end842
  %351 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1275
  %u856 = getelementptr inbounds %struct._json_value, %struct._json_value* %351, i32 0, i32 2, !dbg !1276
  %integer857 = bitcast %union.anon* %u856 to i64*, !dbg !1277
  %352 = load i64, i64* %integer857, align 8, !dbg !1277
  %mul = mul nsw i64 %352, 10, !dbg !1278
  %353 = load i8, i8* %b, align 1, !dbg !1279
  %conv858 = sext i8 %353 to i32, !dbg !1279
  %sub859 = sub nsw i32 %conv858, 48, !dbg !1280
  %conv860 = sext i32 %sub859 to i64, !dbg !1281
  %add861 = add nsw i64 %mul, %conv860, !dbg !1282
  %354 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1283
  %u862 = getelementptr inbounds %struct._json_value, %struct._json_value* %354, i32 0, i32 2, !dbg !1284
  %integer863 = bitcast %union.anon* %u862 to i64*, !dbg !1285
  store i64 %add861, i64* %integer863, align 8, !dbg !1286
  br label %for.inc, !dbg !1287

if.end864:                                        ; preds = %lor.lhs.false812
  %355 = load i64, i64* %flags, align 8, !dbg !1288
  %and865 = and i64 %355, 32768, !dbg !1290
  %tobool866 = icmp ne i64 %and865, 0, !dbg !1290
  br i1 %tobool866, label %if.then867, label %if.else872, !dbg !1291

if.then867:                                       ; preds = %if.end864
  %356 = load double, double* %num_fraction, align 8, !dbg !1292
  %357 = load i8, i8* %b, align 1, !dbg !1293
  %conv869 = sext i8 %357 to i32, !dbg !1293
  %sub870 = sub nsw i32 %conv869, 48, !dbg !1294
  %conv871 = sitofp i32 %sub870 to double, !dbg !1295
  %358 = call double @llvm.fmuladd.f64(double %356, double 1.000000e+01, double %conv871), !dbg !1296
  store double %358, double* %num_fraction, align 8, !dbg !1297
  br label %if.end881, !dbg !1298

if.else872:                                       ; preds = %if.end864
  %359 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1299
  %u873 = getelementptr inbounds %struct._json_value, %struct._json_value* %359, i32 0, i32 2, !dbg !1300
  %dbl874 = bitcast %union.anon* %u873 to double*, !dbg !1301
  %360 = load double, double* %dbl874, align 8, !dbg !1301
  %361 = load i8, i8* %b, align 1, !dbg !1302
  %conv876 = sext i8 %361 to i32, !dbg !1302
  %sub877 = sub nsw i32 %conv876, 48, !dbg !1303
  %conv878 = sitofp i32 %sub877 to double, !dbg !1304
  %362 = call double @llvm.fmuladd.f64(double %360, double 1.000000e+01, double %conv878), !dbg !1305
  %363 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1306
  %u879 = getelementptr inbounds %struct._json_value, %struct._json_value* %363, i32 0, i32 2, !dbg !1307
  %dbl880 = bitcast %union.anon* %u879 to double*, !dbg !1308
  store double %362, double* %dbl880, align 8, !dbg !1309
  br label %if.end881

if.end881:                                        ; preds = %if.else872, %if.then867
  br label %for.inc, !dbg !1310

if.end882:                                        ; preds = %sw.bb799
  %364 = load i8, i8* %b, align 1, !dbg !1311
  %conv883 = sext i8 %364 to i32, !dbg !1311
  %cmp884 = icmp eq i32 %conv883, 43, !dbg !1313
  br i1 %cmp884, label %if.then890, label %lor.lhs.false886, !dbg !1314

lor.lhs.false886:                                 ; preds = %if.end882
  %365 = load i8, i8* %b, align 1, !dbg !1315
  %conv887 = sext i8 %365 to i32, !dbg !1315
  %cmp888 = icmp eq i32 %conv887, 45, !dbg !1316
  br i1 %cmp888, label %if.then890, label %if.else905, !dbg !1317

if.then890:                                       ; preds = %lor.lhs.false886, %if.end882
  %366 = load i64, i64* %flags, align 8, !dbg !1318
  %and891 = and i64 %366, 1024, !dbg !1321
  %tobool892 = icmp ne i64 %and891, 0, !dbg !1321
  br i1 %tobool892, label %land.lhs.true893, label %if.end904, !dbg !1322

land.lhs.true893:                                 ; preds = %if.then890
  %367 = load i64, i64* %flags, align 8, !dbg !1323
  %and894 = and i64 %367, 2048, !dbg !1324
  %tobool895 = icmp ne i64 %and894, 0, !dbg !1324
  br i1 %tobool895, label %if.end904, label %if.then896, !dbg !1325

if.then896:                                       ; preds = %land.lhs.true893
  %368 = load i64, i64* %flags, align 8, !dbg !1326
  %or897 = or i64 %368, 2048, !dbg !1326
  store i64 %or897, i64* %flags, align 8, !dbg !1326
  %369 = load i8, i8* %b, align 1, !dbg !1328
  %conv898 = sext i8 %369 to i32, !dbg !1328
  %cmp899 = icmp eq i32 %conv898, 45, !dbg !1330
  br i1 %cmp899, label %if.then901, label %if.end903, !dbg !1331

if.then901:                                       ; preds = %if.then896
  %370 = load i64, i64* %flags, align 8, !dbg !1332
  %or902 = or i64 %370, 4096, !dbg !1332
  store i64 %or902, i64* %flags, align 8, !dbg !1332
  br label %if.end903, !dbg !1333

if.end903:                                        ; preds = %if.then901, %if.then896
  br label %for.inc, !dbg !1334

if.end904:                                        ; preds = %land.lhs.true893, %if.then890
  br label %if.end930, !dbg !1335

if.else905:                                       ; preds = %lor.lhs.false886
  %371 = load i8, i8* %b, align 1, !dbg !1336
  %conv906 = sext i8 %371 to i32, !dbg !1336
  %cmp907 = icmp eq i32 %conv906, 46, !dbg !1338
  br i1 %cmp907, label %land.lhs.true909, label %if.end929, !dbg !1339

land.lhs.true909:                                 ; preds = %if.else905
  %372 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1340
  %type910 = getelementptr inbounds %struct._json_value, %struct._json_value* %372, i32 0, i32 1, !dbg !1341
  %373 = load i32, i32* %type910, align 8, !dbg !1341
  %cmp911 = icmp eq i32 %373, 3, !dbg !1342
  br i1 %cmp911, label %if.then913, label %if.end929, !dbg !1343

if.then913:                                       ; preds = %land.lhs.true909
  call void @llvm.dbg.declare(metadata i64* %integer914, metadata !1344, metadata !DIExpression()), !dbg !1346
  %374 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1347
  %u915 = getelementptr inbounds %struct._json_value, %struct._json_value* %374, i32 0, i32 2, !dbg !1348
  %integer916 = bitcast %union.anon* %u915 to i64*, !dbg !1349
  %375 = load i64, i64* %integer916, align 8, !dbg !1349
  store i64 %375, i64* %integer914, align 8, !dbg !1346
  %376 = load i32, i32* %num_digits, align 4, !dbg !1350
  %tobool917 = icmp ne i32 %376, 0, !dbg !1350
  br i1 %tobool917, label %if.end923, label %if.then918, !dbg !1352

if.then918:                                       ; preds = %if.then913
  %arraydecay919 = getelementptr inbounds [128 x i8], [128 x i8]* %error, i64 0, i64 0, !dbg !1353
  %cur_line920 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 4, !dbg !1355
  %377 = load i32, i32* %cur_line920, align 8, !dbg !1355
  %cur_col921 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !1355
  %378 = load i32, i32* %cur_col921, align 4, !dbg !1355
  %call922 = call i32 (i8*, i8*, ...) @sprintf(i8* noundef %arraydecay919, i8* noundef getelementptr inbounds ([33 x i8], [33 x i8]* @.str.15, i64 0, i64 0), i32 noundef %377, i32 noundef %378) #8, !dbg !1356
  br label %e_failed, !dbg !1357

if.end923:                                        ; preds = %if.then913
  %379 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1358
  %type924 = getelementptr inbounds %struct._json_value, %struct._json_value* %379, i32 0, i32 1, !dbg !1359
  store i32 4, i32* %type924, align 8, !dbg !1360
  %380 = load i64, i64* %integer914, align 8, !dbg !1361
  %conv925 = sitofp i64 %380 to double, !dbg !1362
  %381 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1363
  %u926 = getelementptr inbounds %struct._json_value, %struct._json_value* %381, i32 0, i32 2, !dbg !1364
  %dbl927 = bitcast %union.anon* %u926 to double*, !dbg !1365
  store double %conv925, double* %dbl927, align 8, !dbg !1366
  %382 = load i64, i64* %flags, align 8, !dbg !1367
  %or928 = or i64 %382, 32768, !dbg !1367
  store i64 %or928, i64* %flags, align 8, !dbg !1367
  store i32 0, i32* %num_digits, align 4, !dbg !1368
  br label %for.inc, !dbg !1369

if.end929:                                        ; preds = %land.lhs.true909, %if.else905
  br label %if.end930

if.end930:                                        ; preds = %if.end929, %if.end904
  %383 = load i64, i64* %flags, align 8, !dbg !1370
  %and931 = and i64 %383, 1024, !dbg !1372
  %tobool932 = icmp ne i64 %and931, 0, !dbg !1372
  br i1 %tobool932, label %if.else974, label %if.then933, !dbg !1373

if.then933:                                       ; preds = %if.end930
  %384 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1374
  %type934 = getelementptr inbounds %struct._json_value, %struct._json_value* %384, i32 0, i32 1, !dbg !1377
  %385 = load i32, i32* %type934, align 8, !dbg !1377
  %cmp935 = icmp eq i32 %385, 4, !dbg !1378
  br i1 %cmp935, label %if.then937, label %if.end950, !dbg !1379

if.then937:                                       ; preds = %if.then933
  %386 = load i32, i32* %num_digits, align 4, !dbg !1380
  %tobool938 = icmp ne i32 %386, 0, !dbg !1380
  br i1 %tobool938, label %if.end944, label %if.then939, !dbg !1383

if.then939:                                       ; preds = %if.then937
  %arraydecay940 = getelementptr inbounds [128 x i8], [128 x i8]* %error, i64 0, i64 0, !dbg !1384
  %cur_line941 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 4, !dbg !1386
  %387 = load i32, i32* %cur_line941, align 8, !dbg !1386
  %cur_col942 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !1386
  %388 = load i32, i32* %cur_col942, align 4, !dbg !1386
  %call943 = call i32 (i8*, i8*, ...) @sprintf(i8* noundef %arraydecay940, i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.16, i64 0, i64 0), i32 noundef %387, i32 noundef %388) #8, !dbg !1387
  br label %e_failed, !dbg !1388

if.end944:                                        ; preds = %if.then937
  %389 = load double, double* %num_fraction, align 8, !dbg !1389
  %390 = load i32, i32* %num_digits, align 4, !dbg !1390
  %conv945 = sitofp i32 %390 to double, !dbg !1390
  %call946 = call double @pow(double noundef 1.000000e+01, double noundef %conv945) #8, !dbg !1391
  %div = fdiv double %389, %call946, !dbg !1392
  %391 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1393
  %u947 = getelementptr inbounds %struct._json_value, %struct._json_value* %391, i32 0, i32 2, !dbg !1394
  %dbl948 = bitcast %union.anon* %u947 to double*, !dbg !1395
  %392 = load double, double* %dbl948, align 8, !dbg !1396
  %add949 = fadd double %392, %div, !dbg !1396
  store double %add949, double* %dbl948, align 8, !dbg !1396
  br label %if.end950, !dbg !1397

if.end950:                                        ; preds = %if.end944, %if.then933
  %393 = load i8, i8* %b, align 1, !dbg !1398
  %conv951 = sext i8 %393 to i32, !dbg !1398
  %cmp952 = icmp eq i32 %conv951, 101, !dbg !1400
  br i1 %cmp952, label %if.then958, label %lor.lhs.false954, !dbg !1401

lor.lhs.false954:                                 ; preds = %if.end950
  %394 = load i8, i8* %b, align 1, !dbg !1402
  %conv955 = sext i8 %394 to i32, !dbg !1402
  %cmp956 = icmp eq i32 %conv955, 69, !dbg !1403
  br i1 %cmp956, label %if.then958, label %if.end973, !dbg !1404

if.then958:                                       ; preds = %lor.lhs.false954, %if.end950
  %395 = load i64, i64* %flags, align 8, !dbg !1405
  %or959 = or i64 %395, 1024, !dbg !1405
  store i64 %or959, i64* %flags, align 8, !dbg !1405
  %396 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1407
  %type960 = getelementptr inbounds %struct._json_value, %struct._json_value* %396, i32 0, i32 1, !dbg !1409
  %397 = load i32, i32* %type960, align 8, !dbg !1409
  %cmp961 = icmp eq i32 %397, 3, !dbg !1410
  br i1 %cmp961, label %if.then963, label %if.end971, !dbg !1411

if.then963:                                       ; preds = %if.then958
  call void @llvm.dbg.declare(metadata i64* %integer964, metadata !1412, metadata !DIExpression()), !dbg !1414
  %398 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1415
  %u965 = getelementptr inbounds %struct._json_value, %struct._json_value* %398, i32 0, i32 2, !dbg !1416
  %integer966 = bitcast %union.anon* %u965 to i64*, !dbg !1417
  %399 = load i64, i64* %integer966, align 8, !dbg !1417
  store i64 %399, i64* %integer964, align 8, !dbg !1414
  %400 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1418
  %type967 = getelementptr inbounds %struct._json_value, %struct._json_value* %400, i32 0, i32 1, !dbg !1419
  store i32 4, i32* %type967, align 8, !dbg !1420
  %401 = load i64, i64* %integer964, align 8, !dbg !1421
  %conv968 = sitofp i64 %401 to double, !dbg !1422
  %402 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1423
  %u969 = getelementptr inbounds %struct._json_value, %struct._json_value* %402, i32 0, i32 2, !dbg !1424
  %dbl970 = bitcast %union.anon* %u969 to double*, !dbg !1425
  store double %conv968, double* %dbl970, align 8, !dbg !1426
  br label %if.end971, !dbg !1427

if.end971:                                        ; preds = %if.then963, %if.then958
  store i32 0, i32* %num_digits, align 4, !dbg !1428
  %403 = load i64, i64* %flags, align 8, !dbg !1429
  %and972 = and i64 %403, -513, !dbg !1429
  store i64 %and972, i64* %flags, align 8, !dbg !1429
  br label %for.inc, !dbg !1430

if.end973:                                        ; preds = %lor.lhs.false954
  br label %if.end992, !dbg !1431

if.else974:                                       ; preds = %if.end930
  %404 = load i32, i32* %num_digits, align 4, !dbg !1432
  %tobool975 = icmp ne i32 %404, 0, !dbg !1432
  br i1 %tobool975, label %if.end981, label %if.then976, !dbg !1435

if.then976:                                       ; preds = %if.else974
  %arraydecay977 = getelementptr inbounds [128 x i8], [128 x i8]* %error, i64 0, i64 0, !dbg !1436
  %cur_line978 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 4, !dbg !1438
  %405 = load i32, i32* %cur_line978, align 8, !dbg !1438
  %cur_col979 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !1438
  %406 = load i32, i32* %cur_col979, align 4, !dbg !1438
  %call980 = call i32 (i8*, i8*, ...) @sprintf(i8* noundef %arraydecay977, i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.17, i64 0, i64 0), i32 noundef %405, i32 noundef %406) #8, !dbg !1439
  br label %e_failed, !dbg !1440

if.end981:                                        ; preds = %if.else974
  %407 = load i64, i64* %flags, align 8, !dbg !1441
  %and982 = and i64 %407, 4096, !dbg !1442
  %tobool983 = icmp ne i64 %and982, 0, !dbg !1442
  br i1 %tobool983, label %cond.true984, label %cond.false985, !dbg !1441

cond.true984:                                     ; preds = %if.end981
  %408 = load double, double* %num_e, align 8, !dbg !1443
  %fneg = fneg double %408, !dbg !1444
  br label %cond.end986, !dbg !1441

cond.false985:                                    ; preds = %if.end981
  %409 = load double, double* %num_e, align 8, !dbg !1445
  br label %cond.end986, !dbg !1441

cond.end986:                                      ; preds = %cond.false985, %cond.true984
  %cond987 = phi double [ %fneg, %cond.true984 ], [ %409, %cond.false985 ], !dbg !1441
  %call988 = call double @pow(double noundef 1.000000e+01, double noundef %cond987) #8, !dbg !1446
  %410 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1447
  %u989 = getelementptr inbounds %struct._json_value, %struct._json_value* %410, i32 0, i32 2, !dbg !1448
  %dbl990 = bitcast %union.anon* %u989 to double*, !dbg !1449
  %411 = load double, double* %dbl990, align 8, !dbg !1450
  %mul991 = fmul double %411, %call988, !dbg !1450
  store double %mul991, double* %dbl990, align 8, !dbg !1450
  br label %if.end992

if.end992:                                        ; preds = %cond.end986, %if.end973
  %412 = load i64, i64* %flags, align 8, !dbg !1451
  %and993 = and i64 %412, 256, !dbg !1453
  %tobool994 = icmp ne i64 %and993, 0, !dbg !1453
  br i1 %tobool994, label %if.then995, label %if.end1012, !dbg !1454

if.then995:                                       ; preds = %if.end992
  %413 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1455
  %type996 = getelementptr inbounds %struct._json_value, %struct._json_value* %413, i32 0, i32 1, !dbg !1458
  %414 = load i32, i32* %type996, align 8, !dbg !1458
  %cmp997 = icmp eq i32 %414, 3, !dbg !1459
  br i1 %cmp997, label %if.then999, label %if.else1005, !dbg !1460

if.then999:                                       ; preds = %if.then995
  %415 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1461
  %u1000 = getelementptr inbounds %struct._json_value, %struct._json_value* %415, i32 0, i32 2, !dbg !1462
  %integer1001 = bitcast %union.anon* %u1000 to i64*, !dbg !1463
  %416 = load i64, i64* %integer1001, align 8, !dbg !1463
  %sub1002 = sub nsw i64 0, %416, !dbg !1464
  %417 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1465
  %u1003 = getelementptr inbounds %struct._json_value, %struct._json_value* %417, i32 0, i32 2, !dbg !1466
  %integer1004 = bitcast %union.anon* %u1003 to i64*, !dbg !1467
  store i64 %sub1002, i64* %integer1004, align 8, !dbg !1468
  br label %if.end1011, !dbg !1465

if.else1005:                                      ; preds = %if.then995
  %418 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1469
  %u1006 = getelementptr inbounds %struct._json_value, %struct._json_value* %418, i32 0, i32 2, !dbg !1470
  %dbl1007 = bitcast %union.anon* %u1006 to double*, !dbg !1471
  %419 = load double, double* %dbl1007, align 8, !dbg !1471
  %fneg1008 = fneg double %419, !dbg !1472
  %420 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1473
  %u1009 = getelementptr inbounds %struct._json_value, %struct._json_value* %420, i32 0, i32 2, !dbg !1474
  %dbl1010 = bitcast %union.anon* %u1009 to double*, !dbg !1475
  store double %fneg1008, double* %dbl1010, align 8, !dbg !1476
  br label %if.end1011

if.end1011:                                       ; preds = %if.else1005, %if.then999
  br label %if.end1012, !dbg !1477

if.end1012:                                       ; preds = %if.end1011, %if.end992
  %421 = load i64, i64* %flags, align 8, !dbg !1478
  %or1013 = or i64 %421, 3, !dbg !1478
  store i64 %or1013, i64* %flags, align 8, !dbg !1478
  br label %sw.epilog1015, !dbg !1479

sw.default1014:                                   ; preds = %if.else762
  br label %sw.epilog1015, !dbg !1480

sw.epilog1015:                                    ; preds = %sw.default1014, %if.end1012, %sw.epilog798
  br label %if.end1016

if.end1016:                                       ; preds = %sw.epilog1015, %sw.epilog761
  %422 = load i64, i64* %flags, align 8, !dbg !1481
  %and1017 = and i64 %422, 2, !dbg !1483
  %tobool1018 = icmp ne i64 %and1017, 0, !dbg !1483
  br i1 %tobool1018, label %if.then1019, label %if.end1023, !dbg !1484

if.then1019:                                      ; preds = %if.end1016
  %423 = load i64, i64* %flags, align 8, !dbg !1485
  %and1020 = and i64 %423, -3, !dbg !1485
  store i64 %and1020, i64* %flags, align 8, !dbg !1485
  %ptr1021 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 3, !dbg !1487
  %424 = load i8*, i8** %ptr1021, align 8, !dbg !1488
  %incdec.ptr1022 = getelementptr inbounds i8, i8* %424, i32 -1, !dbg !1488
  store i8* %incdec.ptr1022, i8** %ptr1021, align 8, !dbg !1488
  br label %if.end1023, !dbg !1489

if.end1023:                                       ; preds = %if.then1019, %if.end1016
  %425 = load i64, i64* %flags, align 8, !dbg !1490
  %and1024 = and i64 %425, 1, !dbg !1492
  %tobool1025 = icmp ne i64 %and1024, 0, !dbg !1492
  br i1 %tobool1025, label %if.then1026, label %if.end1076, !dbg !1493

if.then1026:                                      ; preds = %if.end1023
  %426 = load i64, i64* %flags, align 8, !dbg !1494
  %and1027 = and i64 %426, -2, !dbg !1496
  %or1028 = or i64 %and1027, 4, !dbg !1497
  store i64 %or1028, i64* %flags, align 8, !dbg !1498
  %427 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1499
  %parent = getelementptr inbounds %struct._json_value, %struct._json_value* %427, i32 0, i32 0, !dbg !1501
  %428 = load %struct._json_value*, %struct._json_value** %parent, align 8, !dbg !1501
  %tobool1029 = icmp ne %struct._json_value* %428, null, !dbg !1499
  br i1 %tobool1029, label %if.end1032, label %if.then1030, !dbg !1502

if.then1030:                                      ; preds = %if.then1026
  %429 = load i64, i64* %flags, align 8, !dbg !1503
  %or1031 = or i64 %429, 128, !dbg !1503
  store i64 %or1031, i64* %flags, align 8, !dbg !1503
  br label %for.inc, !dbg !1505

if.end1032:                                       ; preds = %if.then1026
  %430 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1506
  %parent1033 = getelementptr inbounds %struct._json_value, %struct._json_value* %430, i32 0, i32 0, !dbg !1508
  %431 = load %struct._json_value*, %struct._json_value** %parent1033, align 8, !dbg !1508
  %type1034 = getelementptr inbounds %struct._json_value, %struct._json_value* %431, i32 0, i32 1, !dbg !1509
  %432 = load i32, i32* %type1034, align 8, !dbg !1509
  %cmp1035 = icmp eq i32 %432, 2, !dbg !1510
  br i1 %cmp1035, label %if.then1037, label %if.end1039, !dbg !1511

if.then1037:                                      ; preds = %if.end1032
  %433 = load i64, i64* %flags, align 8, !dbg !1512
  %or1038 = or i64 %433, 8, !dbg !1512
  store i64 %or1038, i64* %flags, align 8, !dbg !1512
  br label %if.end1039, !dbg !1513

if.end1039:                                       ; preds = %if.then1037, %if.end1032
  %first_pass1040 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 2, !dbg !1514
  %434 = load i32, i32* %first_pass1040, align 8, !dbg !1514
  %tobool1041 = icmp ne i32 %434, 0, !dbg !1516
  br i1 %tobool1041, label %if.end1065, label %if.then1042, !dbg !1517

if.then1042:                                      ; preds = %if.end1039
  call void @llvm.dbg.declare(metadata %struct._json_value** %parent1043, metadata !1518, metadata !DIExpression()), !dbg !1520
  %435 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1521
  %parent1044 = getelementptr inbounds %struct._json_value, %struct._json_value* %435, i32 0, i32 0, !dbg !1522
  %436 = load %struct._json_value*, %struct._json_value** %parent1044, align 8, !dbg !1522
  store %struct._json_value* %436, %struct._json_value** %parent1043, align 8, !dbg !1520
  %437 = load %struct._json_value*, %struct._json_value** %parent1043, align 8, !dbg !1523
  %type1045 = getelementptr inbounds %struct._json_value, %struct._json_value* %437, i32 0, i32 1, !dbg !1524
  %438 = load i32, i32* %type1045, align 8, !dbg !1524
  switch i32 %438, label %sw.default1063 [
    i32 1, label %sw.bb1046
    i32 2, label %sw.bb1055
  ], !dbg !1525

sw.bb1046:                                        ; preds = %if.then1042
  %439 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1526
  %440 = load %struct._json_value*, %struct._json_value** %parent1043, align 8, !dbg !1528
  %u1047 = getelementptr inbounds %struct._json_value, %struct._json_value* %440, i32 0, i32 2, !dbg !1529
  %object1048 = bitcast %union.anon* %u1047 to %struct.anon.0*, !dbg !1530
  %values1049 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %object1048, i32 0, i32 1, !dbg !1531
  %441 = load %struct._json_object_entry*, %struct._json_object_entry** %values1049, align 8, !dbg !1531
  %442 = load %struct._json_value*, %struct._json_value** %parent1043, align 8, !dbg !1532
  %u1050 = getelementptr inbounds %struct._json_value, %struct._json_value* %442, i32 0, i32 2, !dbg !1533
  %object1051 = bitcast %union.anon* %u1050 to %struct.anon.0*, !dbg !1534
  %length1052 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %object1051, i32 0, i32 0, !dbg !1535
  %443 = load i32, i32* %length1052, align 8, !dbg !1535
  %idxprom1053 = zext i32 %443 to i64, !dbg !1528
  %arrayidx1054 = getelementptr inbounds %struct._json_object_entry, %struct._json_object_entry* %441, i64 %idxprom1053, !dbg !1528
  %value = getelementptr inbounds %struct._json_object_entry, %struct._json_object_entry* %arrayidx1054, i32 0, i32 2, !dbg !1536
  store %struct._json_value* %439, %struct._json_value** %value, align 8, !dbg !1537
  br label %sw.epilog1064, !dbg !1538

sw.bb1055:                                        ; preds = %if.then1042
  %444 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1539
  %445 = load %struct._json_value*, %struct._json_value** %parent1043, align 8, !dbg !1540
  %u1056 = getelementptr inbounds %struct._json_value, %struct._json_value* %445, i32 0, i32 2, !dbg !1541
  %array = bitcast %union.anon* %u1056 to %struct.anon.1*, !dbg !1542
  %values1057 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %array, i32 0, i32 1, !dbg !1543
  %446 = load %struct._json_value**, %struct._json_value*** %values1057, align 8, !dbg !1543
  %447 = load %struct._json_value*, %struct._json_value** %parent1043, align 8, !dbg !1544
  %u1058 = getelementptr inbounds %struct._json_value, %struct._json_value* %447, i32 0, i32 2, !dbg !1545
  %array1059 = bitcast %union.anon* %u1058 to %struct.anon.1*, !dbg !1546
  %length1060 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %array1059, i32 0, i32 0, !dbg !1547
  %448 = load i32, i32* %length1060, align 8, !dbg !1547
  %idxprom1061 = zext i32 %448 to i64, !dbg !1540
  %arrayidx1062 = getelementptr inbounds %struct._json_value*, %struct._json_value** %446, i64 %idxprom1061, !dbg !1540
  store %struct._json_value* %444, %struct._json_value** %arrayidx1062, align 8, !dbg !1548
  br label %sw.epilog1064, !dbg !1549

sw.default1063:                                   ; preds = %if.then1042
  br label %sw.epilog1064, !dbg !1550

sw.epilog1064:                                    ; preds = %sw.default1063, %sw.bb1055, %sw.bb1046
  br label %if.end1065, !dbg !1551

if.end1065:                                       ; preds = %sw.epilog1064, %if.end1039
  %449 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1552
  %parent1066 = getelementptr inbounds %struct._json_value, %struct._json_value* %449, i32 0, i32 0, !dbg !1554
  %450 = load %struct._json_value*, %struct._json_value** %parent1066, align 8, !dbg !1554
  %u1067 = getelementptr inbounds %struct._json_value, %struct._json_value* %450, i32 0, i32 2, !dbg !1555
  %array1068 = bitcast %union.anon* %u1067 to %struct.anon.1*, !dbg !1556
  %length1069 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %array1068, i32 0, i32 0, !dbg !1557
  %451 = load i32, i32* %length1069, align 8, !dbg !1558
  %inc1070 = add i32 %451, 1, !dbg !1558
  store i32 %inc1070, i32* %length1069, align 8, !dbg !1558
  %cmp1071 = icmp ugt i32 %inc1070, -9, !dbg !1559
  br i1 %cmp1071, label %if.then1073, label %if.end1074, !dbg !1560

if.then1073:                                      ; preds = %if.end1065
  br label %e_overflow, !dbg !1561

if.end1074:                                       ; preds = %if.end1065
  %452 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1562
  %parent1075 = getelementptr inbounds %struct._json_value, %struct._json_value* %452, i32 0, i32 0, !dbg !1563
  %453 = load %struct._json_value*, %struct._json_value** %parent1075, align 8, !dbg !1563
  store %struct._json_value* %453, %struct._json_value** %top, align 8, !dbg !1564
  br label %for.inc, !dbg !1565

if.end1076:                                       ; preds = %if.end1023
  br label %for.inc, !dbg !1566

for.inc:                                          ; preds = %if.end1076, %if.end1074, %if.then1030, %if.end971, %if.end923, %if.end903, %if.end881, %if.end855, %if.then846, %if.else837, %sw.bb770, %if.end752, %if.end583, %if.end577, %if.end572, %if.then557, %if.then542, %sw.bb519, %sw.bb503, %sw.bb481, %sw.bb479, %if.end448, %if.end418, %do.end391, %if.end378, %if.then330, %sw.epilog
  %ptr1077 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 3, !dbg !1567
  %454 = load i8*, i8** %ptr1077, align 8, !dbg !1568
  %incdec.ptr1078 = getelementptr inbounds i8, i8* %454, i32 1, !dbg !1568
  store i8* %incdec.ptr1078, i8** %ptr1077, align 8, !dbg !1568
  br label %for.cond30, !dbg !1569, !llvm.loop !1570

for.end:                                          ; preds = %if.then496
  %455 = load %struct._json_value*, %struct._json_value** %root, align 8, !dbg !1573
  store %struct._json_value* %455, %struct._json_value** %alloc, align 8, !dbg !1574
  br label %for.inc1079, !dbg !1575

for.inc1079:                                      ; preds = %for.end
  %first_pass1080 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 2, !dbg !1576
  %456 = load i32, i32* %first_pass1080, align 8, !dbg !1577
  %dec1081 = add nsw i32 %456, -1, !dbg !1577
  store i32 %dec1081, i32* %first_pass1080, align 8, !dbg !1577
  br label %for.cond, !dbg !1578, !llvm.loop !1579

for.end1082:                                      ; preds = %for.cond
  %457 = load %struct._json_value*, %struct._json_value** %root, align 8, !dbg !1581
  store %struct._json_value* %457, %struct._json_value** %retval, align 8, !dbg !1582
  br label %return, !dbg !1582

e_unknown_value:                                  ; preds = %if.then684, %if.then652, %if.then613
  call void @llvm.dbg.label(metadata !1583), !dbg !1584
  %arraydecay1083 = getelementptr inbounds [128 x i8], [128 x i8]* %error, i64 0, i64 0, !dbg !1585
  %cur_line1084 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 4, !dbg !1586
  %458 = load i32, i32* %cur_line1084, align 8, !dbg !1586
  %cur_col1085 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !1586
  %459 = load i32, i32* %cur_col1085, align 4, !dbg !1586
  %call1086 = call i32 (i8*, i8*, ...) @sprintf(i8* noundef %arraydecay1083, i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.18, i64 0, i64 0), i32 noundef %458, i32 noundef %459) #8, !dbg !1587
  br label %e_failed, !dbg !1588

e_alloc_failure:                                  ; preds = %if.then706, %if.then688, %if.then656, %if.then617, %if.then582, %if.then576, %if.then571
  call void @llvm.dbg.label(metadata !1589), !dbg !1590
  %arraydecay1087 = getelementptr inbounds [128 x i8], [128 x i8]* %error, i64 0, i64 0, !dbg !1591
  %call1088 = call i8* @strcpy(i8* noundef %arraydecay1087, i8* noundef getelementptr inbounds ([26 x i8], [26 x i8]* @.str.19, i64 0, i64 0)) #8, !dbg !1592
  br label %e_failed, !dbg !1593

e_overflow:                                       ; preds = %if.then1073, %if.then45
  call void @llvm.dbg.label(metadata !1594), !dbg !1595
  %arraydecay1089 = getelementptr inbounds [128 x i8], [128 x i8]* %error, i64 0, i64 0, !dbg !1596
  %cur_line1090 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 4, !dbg !1597
  %460 = load i32, i32* %cur_line1090, align 8, !dbg !1597
  %cur_col1091 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 5, !dbg !1597
  %461 = load i32, i32* %cur_col1091, align 4, !dbg !1597
  %call1092 = call i32 (i8*, i8*, ...) @sprintf(i8* noundef %arraydecay1089, i8* noundef getelementptr inbounds ([34 x i8], [34 x i8]* @.str.20, i64 0, i64 0), i32 noundef %460, i32 noundef %461) #8, !dbg !1598
  br label %e_failed, !dbg !1599

e_failed:                                         ; preds = %e_overflow, %e_alloc_failure, %e_unknown_value, %if.then976, %if.then939, %if.then918, %if.then821, %sw.default792, %if.then774, %if.else754, %if.else559, %if.else544, %if.else529, %sw.default504, %sw.default483, %if.then471, %if.then461, %if.then424, %if.then196, %if.then127, %if.then40
  call void @llvm.dbg.label(metadata !1600), !dbg !1601
  %462 = load i8*, i8** %error_buf.addr, align 8, !dbg !1602
  %tobool1093 = icmp ne i8* %462, null, !dbg !1602
  br i1 %tobool1093, label %if.then1094, label %if.end1103, !dbg !1604

if.then1094:                                      ; preds = %e_failed
  %arraydecay1095 = getelementptr inbounds [128 x i8], [128 x i8]* %error, i64 0, i64 0, !dbg !1605
  %463 = load i8, i8* %arraydecay1095, align 16, !dbg !1605
  %tobool1096 = icmp ne i8 %463, 0, !dbg !1605
  br i1 %tobool1096, label %if.then1097, label %if.else1100, !dbg !1608

if.then1097:                                      ; preds = %if.then1094
  %464 = load i8*, i8** %error_buf.addr, align 8, !dbg !1609
  %arraydecay1098 = getelementptr inbounds [128 x i8], [128 x i8]* %error, i64 0, i64 0, !dbg !1610
  %call1099 = call i8* @strcpy(i8* noundef %464, i8* noundef %arraydecay1098) #8, !dbg !1611
  br label %if.end1102, !dbg !1611

if.else1100:                                      ; preds = %if.then1094
  %465 = load i8*, i8** %error_buf.addr, align 8, !dbg !1612
  %call1101 = call i8* @strcpy(i8* noundef %465, i8* noundef getelementptr inbounds ([14 x i8], [14 x i8]* @.str.21, i64 0, i64 0)) #8, !dbg !1613
  br label %if.end1102

if.end1102:                                       ; preds = %if.else1100, %if.then1097
  br label %if.end1103, !dbg !1614

if.end1103:                                       ; preds = %if.end1102, %e_failed
  %first_pass1104 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 2, !dbg !1615
  %466 = load i32, i32* %first_pass1104, align 8, !dbg !1615
  %tobool1105 = icmp ne i32 %466, 0, !dbg !1617
  br i1 %tobool1105, label %if.then1106, label %if.end1107, !dbg !1618

if.then1106:                                      ; preds = %if.end1103
  %467 = load %struct._json_value*, %struct._json_value** %root, align 8, !dbg !1619
  store %struct._json_value* %467, %struct._json_value** %alloc, align 8, !dbg !1620
  br label %if.end1107, !dbg !1621

if.end1107:                                       ; preds = %if.then1106, %if.end1103
  br label %while.cond1108, !dbg !1622

while.cond1108:                                   ; preds = %while.body1110, %if.end1107
  %468 = load %struct._json_value*, %struct._json_value** %alloc, align 8, !dbg !1623
  %tobool1109 = icmp ne %struct._json_value* %468, null, !dbg !1622
  br i1 %tobool1109, label %while.body1110, label %while.end1115, !dbg !1622

while.body1110:                                   ; preds = %while.cond1108
  %469 = load %struct._json_value*, %struct._json_value** %alloc, align 8, !dbg !1624
  %_reserved1111 = getelementptr inbounds %struct._json_value, %struct._json_value* %469, i32 0, i32 3, !dbg !1626
  %next_alloc = bitcast %union.anon.2* %_reserved1111 to %struct._json_value**, !dbg !1627
  %470 = load %struct._json_value*, %struct._json_value** %next_alloc, align 8, !dbg !1627
  store %struct._json_value* %470, %struct._json_value** %top, align 8, !dbg !1628
  %settings1112 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 1, !dbg !1629
  %mem_free1113 = getelementptr inbounds %struct.json_settings, %struct.json_settings* %settings1112, i32 0, i32 3, !dbg !1630
  %471 = load void (i8*, i8*)*, void (i8*, i8*)** %mem_free1113, align 8, !dbg !1630
  %472 = load %struct._json_value*, %struct._json_value** %alloc, align 8, !dbg !1631
  %473 = bitcast %struct._json_value* %472 to i8*, !dbg !1631
  %settings1114 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 1, !dbg !1632
  %user_data = getelementptr inbounds %struct.json_settings, %struct.json_settings* %settings1114, i32 0, i32 4, !dbg !1633
  %474 = load i8*, i8** %user_data, align 8, !dbg !1633
  call void %471(i8* noundef %473, i8* noundef %474), !dbg !1634
  %475 = load %struct._json_value*, %struct._json_value** %top, align 8, !dbg !1635
  store %struct._json_value* %475, %struct._json_value** %alloc, align 8, !dbg !1636
  br label %while.cond1108, !dbg !1622, !llvm.loop !1637

while.end1115:                                    ; preds = %while.cond1108
  %first_pass1116 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 2, !dbg !1639
  %476 = load i32, i32* %first_pass1116, align 8, !dbg !1639
  %tobool1117 = icmp ne i32 %476, 0, !dbg !1641
  br i1 %tobool1117, label %if.end1120, label %if.then1118, !dbg !1642

if.then1118:                                      ; preds = %while.end1115
  %settings1119 = getelementptr inbounds %struct.json_state, %struct.json_state* %state, i32 0, i32 1, !dbg !1643
  %477 = load %struct._json_value*, %struct._json_value** %root, align 8, !dbg !1644
  call void @json_value_free_ex(%struct.json_settings* noundef %settings1119, %struct._json_value* noundef %477), !dbg !1645
  br label %if.end1120, !dbg !1645

if.end1120:                                       ; preds = %if.then1118, %while.end1115
  store %struct._json_value* null, %struct._json_value** %retval, align 8, !dbg !1646
  br label %return, !dbg !1646

return:                                           ; preds = %if.end1120, %for.end1082
  %478 = load %struct._json_value*, %struct._json_value** %retval, align 8, !dbg !1647
  ret %struct._json_value* %478, !dbg !1647
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #6

; Function Attrs: noinline nounwind optnone uwtable
define internal i8* @default_alloc(i64 noundef %size, i32 noundef %zero, i8* noundef %user_data) #0 !dbg !1648 {
entry:
  %size.addr = alloca i64, align 8
  %zero.addr = alloca i32, align 4
  %user_data.addr = alloca i8*, align 8
  store i64 %size, i64* %size.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %size.addr, metadata !1649, metadata !DIExpression()), !dbg !1650
  store i32 %zero, i32* %zero.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %zero.addr, metadata !1651, metadata !DIExpression()), !dbg !1652
  store i8* %user_data, i8** %user_data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %user_data.addr, metadata !1653, metadata !DIExpression()), !dbg !1654
  %0 = load i8*, i8** %user_data.addr, align 8, !dbg !1655
  %1 = load i32, i32* %zero.addr, align 4, !dbg !1656
  %tobool = icmp ne i32 %1, 0, !dbg !1656
  br i1 %tobool, label %cond.true, label %cond.false, !dbg !1656

cond.true:                                        ; preds = %entry
  %2 = load i64, i64* %size.addr, align 8, !dbg !1657
  %call = call noalias i8* @calloc(i64 noundef 1, i64 noundef %2) #8, !dbg !1658
  br label %cond.end, !dbg !1656

cond.false:                                       ; preds = %entry
  %3 = load i64, i64* %size.addr, align 8, !dbg !1659
  %call1 = call noalias i8* @malloc(i64 noundef %3) #8, !dbg !1660
  br label %cond.end, !dbg !1656

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call, %cond.true ], [ %call1, %cond.false ], !dbg !1656
  ret i8* %cond, !dbg !1661
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @default_free(i8* noundef %ptr, i8* noundef %user_data) #0 !dbg !1662 {
entry:
  %ptr.addr = alloca i8*, align 8
  %user_data.addr = alloca i8*, align 8
  store i8* %ptr, i8** %ptr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %ptr.addr, metadata !1663, metadata !DIExpression()), !dbg !1664
  store i8* %user_data, i8** %user_data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %user_data.addr, metadata !1665, metadata !DIExpression()), !dbg !1666
  %0 = load i8*, i8** %user_data.addr, align 8, !dbg !1667
  %1 = load i8*, i8** %ptr.addr, align 8, !dbg !1668
  call void @free(i8* noundef %1) #8, !dbg !1669
  ret void, !dbg !1670
}

; Function Attrs: nounwind
declare i32 @sprintf(i8* noundef, i8* noundef, ...) #3

; Function Attrs: noinline nounwind optnone uwtable
define internal zeroext i8 @hex_value(i8 noundef signext %c) #0 !dbg !1671 {
entry:
  %retval = alloca i8, align 1
  %c.addr = alloca i8, align 1
  store i8 %c, i8* %c.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %c.addr, metadata !1674, metadata !DIExpression()), !dbg !1675
  %call = call i16** @__ctype_b_loc() #10, !dbg !1676
  %0 = load i16*, i16** %call, align 8, !dbg !1676
  %1 = load i8, i8* %c.addr, align 1, !dbg !1676
  %conv = zext i8 %1 to i32, !dbg !1676
  %idxprom = sext i32 %conv to i64, !dbg !1676
  %arrayidx = getelementptr inbounds i16, i16* %0, i64 %idxprom, !dbg !1676
  %2 = load i16, i16* %arrayidx, align 2, !dbg !1676
  %conv1 = zext i16 %2 to i32, !dbg !1676
  %and = and i32 %conv1, 2048, !dbg !1676
  %tobool = icmp ne i32 %and, 0, !dbg !1676
  br i1 %tobool, label %if.then, label %if.end, !dbg !1678

if.then:                                          ; preds = %entry
  %3 = load i8, i8* %c.addr, align 1, !dbg !1679
  %conv2 = sext i8 %3 to i32, !dbg !1679
  %sub = sub nsw i32 %conv2, 48, !dbg !1680
  %conv3 = trunc i32 %sub to i8, !dbg !1679
  store i8 %conv3, i8* %retval, align 1, !dbg !1681
  br label %return, !dbg !1681

if.end:                                           ; preds = %entry
  %4 = load i8, i8* %c.addr, align 1, !dbg !1682
  %conv4 = sext i8 %4 to i32, !dbg !1682
  switch i32 %conv4, label %sw.default [
    i32 97, label %sw.bb
    i32 65, label %sw.bb
    i32 98, label %sw.bb5
    i32 66, label %sw.bb5
    i32 99, label %sw.bb6
    i32 67, label %sw.bb6
    i32 100, label %sw.bb7
    i32 68, label %sw.bb7
    i32 101, label %sw.bb8
    i32 69, label %sw.bb8
    i32 102, label %sw.bb9
    i32 70, label %sw.bb9
  ], !dbg !1683

sw.bb:                                            ; preds = %if.end, %if.end
  store i8 10, i8* %retval, align 1, !dbg !1684
  br label %return, !dbg !1684

sw.bb5:                                           ; preds = %if.end, %if.end
  store i8 11, i8* %retval, align 1, !dbg !1686
  br label %return, !dbg !1686

sw.bb6:                                           ; preds = %if.end, %if.end
  store i8 12, i8* %retval, align 1, !dbg !1687
  br label %return, !dbg !1687

sw.bb7:                                           ; preds = %if.end, %if.end
  store i8 13, i8* %retval, align 1, !dbg !1688
  br label %return, !dbg !1688

sw.bb8:                                           ; preds = %if.end, %if.end
  store i8 14, i8* %retval, align 1, !dbg !1689
  br label %return, !dbg !1689

sw.bb9:                                           ; preds = %if.end, %if.end
  store i8 15, i8* %retval, align 1, !dbg !1690
  br label %return, !dbg !1690

sw.default:                                       ; preds = %if.end
  store i8 -1, i8* %retval, align 1, !dbg !1691
  br label %return, !dbg !1691

return:                                           ; preds = %sw.default, %sw.bb9, %sw.bb8, %sw.bb7, %sw.bb6, %sw.bb5, %sw.bb, %if.then
  %5 = load i8, i8* %retval, align 1, !dbg !1692
  ret i8 %5, !dbg !1692
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @new_value(%struct.json_state* noundef %state, %struct._json_value** noundef %top, %struct._json_value** noundef %root, %struct._json_value** noundef %alloc, i32 noundef %type) #0 !dbg !1693 {
entry:
  %retval = alloca i32, align 4
  %state.addr = alloca %struct.json_state*, align 8
  %top.addr = alloca %struct._json_value**, align 8
  %root.addr = alloca %struct._json_value**, align 8
  %alloc.addr = alloca %struct._json_value**, align 8
  %type.addr = alloca i32, align 4
  %value = alloca %struct._json_value*, align 8
  %values_size = alloca i64, align 8
  store %struct.json_state* %state, %struct.json_state** %state.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.json_state** %state.addr, metadata !1697, metadata !DIExpression()), !dbg !1698
  store %struct._json_value** %top, %struct._json_value*** %top.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._json_value*** %top.addr, metadata !1699, metadata !DIExpression()), !dbg !1700
  store %struct._json_value** %root, %struct._json_value*** %root.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._json_value*** %root.addr, metadata !1701, metadata !DIExpression()), !dbg !1702
  store %struct._json_value** %alloc, %struct._json_value*** %alloc.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._json_value*** %alloc.addr, metadata !1703, metadata !DIExpression()), !dbg !1704
  store i32 %type, i32* %type.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %type.addr, metadata !1705, metadata !DIExpression()), !dbg !1706
  call void @llvm.dbg.declare(metadata %struct._json_value** %value, metadata !1707, metadata !DIExpression()), !dbg !1708
  call void @llvm.dbg.declare(metadata i64* %values_size, metadata !1709, metadata !DIExpression()), !dbg !1710
  %0 = load %struct.json_state*, %struct.json_state** %state.addr, align 8, !dbg !1711
  %first_pass = getelementptr inbounds %struct.json_state, %struct.json_state* %0, i32 0, i32 2, !dbg !1713
  %1 = load i32, i32* %first_pass, align 8, !dbg !1713
  %tobool = icmp ne i32 %1, 0, !dbg !1711
  br i1 %tobool, label %if.end61, label %if.then, !dbg !1714

if.then:                                          ; preds = %entry
  %2 = load %struct._json_value**, %struct._json_value*** %alloc.addr, align 8, !dbg !1715
  %3 = load %struct._json_value*, %struct._json_value** %2, align 8, !dbg !1717
  %4 = load %struct._json_value**, %struct._json_value*** %top.addr, align 8, !dbg !1718
  store %struct._json_value* %3, %struct._json_value** %4, align 8, !dbg !1719
  store %struct._json_value* %3, %struct._json_value** %value, align 8, !dbg !1720
  %5 = load %struct._json_value**, %struct._json_value*** %alloc.addr, align 8, !dbg !1721
  %6 = load %struct._json_value*, %struct._json_value** %5, align 8, !dbg !1722
  %_reserved = getelementptr inbounds %struct._json_value, %struct._json_value* %6, i32 0, i32 3, !dbg !1723
  %next_alloc = bitcast %union.anon.2* %_reserved to %struct._json_value**, !dbg !1724
  %7 = load %struct._json_value*, %struct._json_value** %next_alloc, align 8, !dbg !1724
  %8 = load %struct._json_value**, %struct._json_value*** %alloc.addr, align 8, !dbg !1725
  store %struct._json_value* %7, %struct._json_value** %8, align 8, !dbg !1726
  %9 = load %struct._json_value**, %struct._json_value*** %root.addr, align 8, !dbg !1727
  %10 = load %struct._json_value*, %struct._json_value** %9, align 8, !dbg !1729
  %tobool1 = icmp ne %struct._json_value* %10, null, !dbg !1729
  br i1 %tobool1, label %if.end, label %if.then2, !dbg !1730

if.then2:                                         ; preds = %if.then
  %11 = load %struct._json_value*, %struct._json_value** %value, align 8, !dbg !1731
  %12 = load %struct._json_value**, %struct._json_value*** %root.addr, align 8, !dbg !1732
  store %struct._json_value* %11, %struct._json_value** %12, align 8, !dbg !1733
  br label %if.end, !dbg !1734

if.end:                                           ; preds = %if.then2, %if.then
  %13 = load %struct._json_value*, %struct._json_value** %value, align 8, !dbg !1735
  %type3 = getelementptr inbounds %struct._json_value, %struct._json_value* %13, i32 0, i32 1, !dbg !1736
  %14 = load i32, i32* %type3, align 8, !dbg !1736
  switch i32 %14, label %sw.default [
    i32 2, label %sw.bb
    i32 1, label %sw.bb17
    i32 5, label %sw.bb46
  ], !dbg !1737

sw.bb:                                            ; preds = %if.end
  %15 = load %struct._json_value*, %struct._json_value** %value, align 8, !dbg !1738
  %u = getelementptr inbounds %struct._json_value, %struct._json_value* %15, i32 0, i32 2, !dbg !1741
  %array = bitcast %union.anon* %u to %struct.anon.1*, !dbg !1742
  %length = getelementptr inbounds %struct.anon.1, %struct.anon.1* %array, i32 0, i32 0, !dbg !1743
  %16 = load i32, i32* %length, align 8, !dbg !1743
  %cmp = icmp eq i32 %16, 0, !dbg !1744
  br i1 %cmp, label %if.then4, label %if.end5, !dbg !1745

if.then4:                                         ; preds = %sw.bb
  br label %sw.epilog, !dbg !1746

if.end5:                                          ; preds = %sw.bb
  %17 = load %struct.json_state*, %struct.json_state** %state.addr, align 8, !dbg !1747
  %18 = load %struct._json_value*, %struct._json_value** %value, align 8, !dbg !1749
  %u6 = getelementptr inbounds %struct._json_value, %struct._json_value* %18, i32 0, i32 2, !dbg !1750
  %array7 = bitcast %union.anon* %u6 to %struct.anon.1*, !dbg !1751
  %length8 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %array7, i32 0, i32 0, !dbg !1752
  %19 = load i32, i32* %length8, align 8, !dbg !1752
  %conv = zext i32 %19 to i64, !dbg !1749
  %mul = mul i64 %conv, 8, !dbg !1753
  %call = call i8* @json_alloc(%struct.json_state* noundef %17, i64 noundef %mul, i32 noundef 0), !dbg !1754
  %20 = bitcast i8* %call to %struct._json_value**, !dbg !1755
  %21 = load %struct._json_value*, %struct._json_value** %value, align 8, !dbg !1756
  %u9 = getelementptr inbounds %struct._json_value, %struct._json_value* %21, i32 0, i32 2, !dbg !1757
  %array10 = bitcast %union.anon* %u9 to %struct.anon.1*, !dbg !1758
  %values = getelementptr inbounds %struct.anon.1, %struct.anon.1* %array10, i32 0, i32 1, !dbg !1759
  store %struct._json_value** %20, %struct._json_value*** %values, align 8, !dbg !1760
  %tobool11 = icmp ne %struct._json_value** %20, null, !dbg !1760
  br i1 %tobool11, label %if.end13, label %if.then12, !dbg !1761

if.then12:                                        ; preds = %if.end5
  store i32 0, i32* %retval, align 4, !dbg !1762
  br label %return, !dbg !1762

if.end13:                                         ; preds = %if.end5
  %22 = load %struct._json_value*, %struct._json_value** %value, align 8, !dbg !1764
  %u14 = getelementptr inbounds %struct._json_value, %struct._json_value* %22, i32 0, i32 2, !dbg !1765
  %array15 = bitcast %union.anon* %u14 to %struct.anon.1*, !dbg !1766
  %length16 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %array15, i32 0, i32 0, !dbg !1767
  store i32 0, i32* %length16, align 8, !dbg !1768
  br label %sw.epilog, !dbg !1769

sw.bb17:                                          ; preds = %if.end
  %23 = load %struct._json_value*, %struct._json_value** %value, align 8, !dbg !1770
  %u18 = getelementptr inbounds %struct._json_value, %struct._json_value* %23, i32 0, i32 2, !dbg !1772
  %object = bitcast %union.anon* %u18 to %struct.anon.0*, !dbg !1773
  %length19 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %object, i32 0, i32 0, !dbg !1774
  %24 = load i32, i32* %length19, align 8, !dbg !1774
  %cmp20 = icmp eq i32 %24, 0, !dbg !1775
  br i1 %cmp20, label %if.then22, label %if.end23, !dbg !1776

if.then22:                                        ; preds = %sw.bb17
  br label %sw.epilog, !dbg !1777

if.end23:                                         ; preds = %sw.bb17
  %25 = load %struct._json_value*, %struct._json_value** %value, align 8, !dbg !1778
  %u24 = getelementptr inbounds %struct._json_value, %struct._json_value* %25, i32 0, i32 2, !dbg !1779
  %object25 = bitcast %union.anon* %u24 to %struct.anon.0*, !dbg !1780
  %length26 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %object25, i32 0, i32 0, !dbg !1781
  %26 = load i32, i32* %length26, align 8, !dbg !1781
  %conv27 = zext i32 %26 to i64, !dbg !1778
  %mul28 = mul i64 24, %conv27, !dbg !1782
  store i64 %mul28, i64* %values_size, align 8, !dbg !1783
  %27 = load %struct.json_state*, %struct.json_state** %state.addr, align 8, !dbg !1784
  %28 = load i64, i64* %values_size, align 8, !dbg !1786
  %29 = load %struct._json_value*, %struct._json_value** %value, align 8, !dbg !1787
  %u29 = getelementptr inbounds %struct._json_value, %struct._json_value* %29, i32 0, i32 2, !dbg !1788
  %object30 = bitcast %union.anon* %u29 to %struct.anon.0*, !dbg !1789
  %values31 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %object30, i32 0, i32 1, !dbg !1790
  %30 = load %struct._json_object_entry*, %struct._json_object_entry** %values31, align 8, !dbg !1790
  %31 = ptrtoint %struct._json_object_entry* %30 to i64, !dbg !1791
  %add = add i64 %28, %31, !dbg !1792
  %call32 = call i8* @json_alloc(%struct.json_state* noundef %27, i64 noundef %add, i32 noundef 0), !dbg !1793
  %32 = bitcast i8* %call32 to %struct._json_object_entry*, !dbg !1794
  %33 = load %struct._json_value*, %struct._json_value** %value, align 8, !dbg !1795
  %u33 = getelementptr inbounds %struct._json_value, %struct._json_value* %33, i32 0, i32 2, !dbg !1796
  %object34 = bitcast %union.anon* %u33 to %struct.anon.0*, !dbg !1797
  %values35 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %object34, i32 0, i32 1, !dbg !1798
  store %struct._json_object_entry* %32, %struct._json_object_entry** %values35, align 8, !dbg !1799
  %tobool36 = icmp ne %struct._json_object_entry* %32, null, !dbg !1799
  br i1 %tobool36, label %if.end38, label %if.then37, !dbg !1800

if.then37:                                        ; preds = %if.end23
  store i32 0, i32* %retval, align 4, !dbg !1801
  br label %return, !dbg !1801

if.end38:                                         ; preds = %if.end23
  %34 = load %struct._json_value*, %struct._json_value** %value, align 8, !dbg !1803
  %u39 = getelementptr inbounds %struct._json_value, %struct._json_value* %34, i32 0, i32 2, !dbg !1804
  %object40 = bitcast %union.anon* %u39 to %struct.anon.0*, !dbg !1805
  %values41 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %object40, i32 0, i32 1, !dbg !1806
  %35 = load %struct._json_object_entry*, %struct._json_object_entry** %values41, align 8, !dbg !1806
  %36 = bitcast %struct._json_object_entry* %35 to i8*, !dbg !1807
  %37 = load i64, i64* %values_size, align 8, !dbg !1808
  %add.ptr = getelementptr inbounds i8, i8* %36, i64 %37, !dbg !1809
  %38 = load %struct._json_value*, %struct._json_value** %value, align 8, !dbg !1810
  %_reserved42 = getelementptr inbounds %struct._json_value, %struct._json_value* %38, i32 0, i32 3, !dbg !1811
  %object_mem = bitcast %union.anon.2* %_reserved42 to i8**, !dbg !1812
  store i8* %add.ptr, i8** %object_mem, align 8, !dbg !1813
  %39 = load %struct._json_value*, %struct._json_value** %value, align 8, !dbg !1814
  %u43 = getelementptr inbounds %struct._json_value, %struct._json_value* %39, i32 0, i32 2, !dbg !1815
  %object44 = bitcast %union.anon* %u43 to %struct.anon.0*, !dbg !1816
  %length45 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %object44, i32 0, i32 0, !dbg !1817
  store i32 0, i32* %length45, align 8, !dbg !1818
  br label %sw.epilog, !dbg !1819

sw.bb46:                                          ; preds = %if.end
  %40 = load %struct.json_state*, %struct.json_state** %state.addr, align 8, !dbg !1820
  %41 = load %struct._json_value*, %struct._json_value** %value, align 8, !dbg !1822
  %u47 = getelementptr inbounds %struct._json_value, %struct._json_value* %41, i32 0, i32 2, !dbg !1823
  %string = bitcast %union.anon* %u47 to %struct.anon*, !dbg !1824
  %length48 = getelementptr inbounds %struct.anon, %struct.anon* %string, i32 0, i32 0, !dbg !1825
  %42 = load i32, i32* %length48, align 8, !dbg !1825
  %add49 = add i32 %42, 1, !dbg !1826
  %conv50 = zext i32 %add49 to i64, !dbg !1827
  %mul51 = mul i64 %conv50, 1, !dbg !1828
  %call52 = call i8* @json_alloc(%struct.json_state* noundef %40, i64 noundef %mul51, i32 noundef 0), !dbg !1829
  %43 = load %struct._json_value*, %struct._json_value** %value, align 8, !dbg !1830
  %u53 = getelementptr inbounds %struct._json_value, %struct._json_value* %43, i32 0, i32 2, !dbg !1831
  %string54 = bitcast %union.anon* %u53 to %struct.anon*, !dbg !1832
  %ptr = getelementptr inbounds %struct.anon, %struct.anon* %string54, i32 0, i32 1, !dbg !1833
  store i8* %call52, i8** %ptr, align 8, !dbg !1834
  %tobool55 = icmp ne i8* %call52, null, !dbg !1834
  br i1 %tobool55, label %if.end57, label %if.then56, !dbg !1835

if.then56:                                        ; preds = %sw.bb46
  store i32 0, i32* %retval, align 4, !dbg !1836
  br label %return, !dbg !1836

if.end57:                                         ; preds = %sw.bb46
  %44 = load %struct._json_value*, %struct._json_value** %value, align 8, !dbg !1838
  %u58 = getelementptr inbounds %struct._json_value, %struct._json_value* %44, i32 0, i32 2, !dbg !1839
  %string59 = bitcast %union.anon* %u58 to %struct.anon*, !dbg !1840
  %length60 = getelementptr inbounds %struct.anon, %struct.anon* %string59, i32 0, i32 0, !dbg !1841
  store i32 0, i32* %length60, align 8, !dbg !1842
  br label %sw.epilog, !dbg !1843

sw.default:                                       ; preds = %if.end
  br label %sw.epilog, !dbg !1844

sw.epilog:                                        ; preds = %sw.default, %if.end57, %if.end38, %if.then22, %if.end13, %if.then4
  store i32 1, i32* %retval, align 4, !dbg !1845
  br label %return, !dbg !1845

if.end61:                                         ; preds = %entry
  %45 = load %struct.json_state*, %struct.json_state** %state.addr, align 8, !dbg !1846
  %46 = load %struct.json_state*, %struct.json_state** %state.addr, align 8, !dbg !1848
  %settings = getelementptr inbounds %struct.json_state, %struct.json_state* %46, i32 0, i32 1, !dbg !1849
  %value_extra = getelementptr inbounds %struct.json_settings, %struct.json_settings* %settings, i32 0, i32 5, !dbg !1850
  %47 = load i64, i64* %value_extra, align 8, !dbg !1850
  %add62 = add i64 40, %47, !dbg !1851
  %call63 = call i8* @json_alloc(%struct.json_state* noundef %45, i64 noundef %add62, i32 noundef 1), !dbg !1852
  %48 = bitcast i8* %call63 to %struct._json_value*, !dbg !1853
  store %struct._json_value* %48, %struct._json_value** %value, align 8, !dbg !1854
  %tobool64 = icmp ne %struct._json_value* %48, null, !dbg !1854
  br i1 %tobool64, label %if.end66, label %if.then65, !dbg !1855

if.then65:                                        ; preds = %if.end61
  store i32 0, i32* %retval, align 4, !dbg !1856
  br label %return, !dbg !1856

if.end66:                                         ; preds = %if.end61
  %49 = load %struct._json_value**, %struct._json_value*** %root.addr, align 8, !dbg !1858
  %50 = load %struct._json_value*, %struct._json_value** %49, align 8, !dbg !1860
  %tobool67 = icmp ne %struct._json_value* %50, null, !dbg !1860
  br i1 %tobool67, label %if.end69, label %if.then68, !dbg !1861

if.then68:                                        ; preds = %if.end66
  %51 = load %struct._json_value*, %struct._json_value** %value, align 8, !dbg !1862
  %52 = load %struct._json_value**, %struct._json_value*** %root.addr, align 8, !dbg !1863
  store %struct._json_value* %51, %struct._json_value** %52, align 8, !dbg !1864
  br label %if.end69, !dbg !1865

if.end69:                                         ; preds = %if.then68, %if.end66
  %53 = load i32, i32* %type.addr, align 4, !dbg !1866
  %54 = load %struct._json_value*, %struct._json_value** %value, align 8, !dbg !1867
  %type70 = getelementptr inbounds %struct._json_value, %struct._json_value* %54, i32 0, i32 1, !dbg !1868
  store i32 %53, i32* %type70, align 8, !dbg !1869
  %55 = load %struct._json_value**, %struct._json_value*** %top.addr, align 8, !dbg !1870
  %56 = load %struct._json_value*, %struct._json_value** %55, align 8, !dbg !1871
  %57 = load %struct._json_value*, %struct._json_value** %value, align 8, !dbg !1872
  %parent = getelementptr inbounds %struct._json_value, %struct._json_value* %57, i32 0, i32 0, !dbg !1873
  store %struct._json_value* %56, %struct._json_value** %parent, align 8, !dbg !1874
  %58 = load %struct._json_value**, %struct._json_value*** %alloc.addr, align 8, !dbg !1875
  %59 = load %struct._json_value*, %struct._json_value** %58, align 8, !dbg !1877
  %tobool71 = icmp ne %struct._json_value* %59, null, !dbg !1877
  br i1 %tobool71, label %if.then72, label %if.end75, !dbg !1878

if.then72:                                        ; preds = %if.end69
  %60 = load %struct._json_value*, %struct._json_value** %value, align 8, !dbg !1879
  %61 = load %struct._json_value**, %struct._json_value*** %alloc.addr, align 8, !dbg !1880
  %62 = load %struct._json_value*, %struct._json_value** %61, align 8, !dbg !1881
  %_reserved73 = getelementptr inbounds %struct._json_value, %struct._json_value* %62, i32 0, i32 3, !dbg !1882
  %next_alloc74 = bitcast %union.anon.2* %_reserved73 to %struct._json_value**, !dbg !1883
  store %struct._json_value* %60, %struct._json_value** %next_alloc74, align 8, !dbg !1884
  br label %if.end75, !dbg !1885

if.end75:                                         ; preds = %if.then72, %if.end69
  %63 = load %struct._json_value*, %struct._json_value** %value, align 8, !dbg !1886
  %64 = load %struct._json_value**, %struct._json_value*** %top.addr, align 8, !dbg !1887
  store %struct._json_value* %63, %struct._json_value** %64, align 8, !dbg !1888
  %65 = load %struct._json_value**, %struct._json_value*** %alloc.addr, align 8, !dbg !1889
  store %struct._json_value* %63, %struct._json_value** %65, align 8, !dbg !1890
  store i32 1, i32* %retval, align 4, !dbg !1891
  br label %return, !dbg !1891

return:                                           ; preds = %if.end75, %if.then65, %sw.epilog, %if.then56, %if.then37, %if.then12
  %66 = load i32, i32* %retval, align 4, !dbg !1892
  ret i32 %66, !dbg !1892
}

; Function Attrs: nounwind readnone willreturn
declare i16** @__ctype_b_loc() #7

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fmuladd.f64(double, double, double) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @would_overflow(i64 noundef %value, i8 noundef signext %b) #0 !dbg !1893 {
entry:
  %value.addr = alloca i64, align 8
  %b.addr = alloca i8, align 1
  store i64 %value, i64* %value.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %value.addr, metadata !1896, metadata !DIExpression()), !dbg !1897
  store i8 %b, i8* %b.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %b.addr, metadata !1898, metadata !DIExpression()), !dbg !1899
  %0 = load i8, i8* %b.addr, align 1, !dbg !1900
  %conv = sext i8 %0 to i32, !dbg !1900
  %sub = sub nsw i32 %conv, 48, !dbg !1901
  %conv1 = sext i32 %sub to i64, !dbg !1902
  %sub2 = sub nsw i64 9223372036854775807, %conv1, !dbg !1903
  %div = sdiv i64 %sub2, 10, !dbg !1904
  %1 = load i64, i64* %value.addr, align 8, !dbg !1905
  %cmp = icmp slt i64 %div, %1, !dbg !1906
  %conv3 = zext i1 %cmp to i32, !dbg !1906
  ret i32 %conv3, !dbg !1907
}

; Function Attrs: nounwind
declare double @pow(double noundef, double noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nounwind
declare i8* @strcpy(i8* noundef, i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @json_value_free_ex(%struct.json_settings* noundef %settings, %struct._json_value* noundef %value) #0 !dbg !1908 {
entry:
  %settings.addr = alloca %struct.json_settings*, align 8
  %value.addr = alloca %struct._json_value*, align 8
  %cur_value = alloca %struct._json_value*, align 8
  store %struct.json_settings* %settings, %struct.json_settings** %settings.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.json_settings** %settings.addr, metadata !1911, metadata !DIExpression()), !dbg !1912
  store %struct._json_value* %value, %struct._json_value** %value.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._json_value** %value.addr, metadata !1913, metadata !DIExpression()), !dbg !1914
  call void @llvm.dbg.declare(metadata %struct._json_value** %cur_value, metadata !1915, metadata !DIExpression()), !dbg !1916
  %0 = load %struct._json_value*, %struct._json_value** %value.addr, align 8, !dbg !1917
  %tobool = icmp ne %struct._json_value* %0, null, !dbg !1917
  br i1 %tobool, label %if.end, label %if.then, !dbg !1919

if.then:                                          ; preds = %entry
  br label %while.end, !dbg !1920

if.end:                                           ; preds = %entry
  %1 = load %struct._json_value*, %struct._json_value** %value.addr, align 8, !dbg !1921
  %parent = getelementptr inbounds %struct._json_value, %struct._json_value* %1, i32 0, i32 0, !dbg !1922
  store %struct._json_value* null, %struct._json_value** %parent, align 8, !dbg !1923
  br label %while.cond, !dbg !1924

while.cond:                                       ; preds = %sw.epilog, %if.end23, %if.end6, %if.end
  %2 = load %struct._json_value*, %struct._json_value** %value.addr, align 8, !dbg !1925
  %tobool1 = icmp ne %struct._json_value* %2, null, !dbg !1924
  br i1 %tobool1, label %while.body, label %while.end, !dbg !1924

while.body:                                       ; preds = %while.cond
  %3 = load %struct._json_value*, %struct._json_value** %value.addr, align 8, !dbg !1926
  %type = getelementptr inbounds %struct._json_value, %struct._json_value* %3, i32 0, i32 1, !dbg !1928
  %4 = load i32, i32* %type, align 8, !dbg !1928
  switch i32 %4, label %sw.default [
    i32 2, label %sw.bb
    i32 1, label %sw.bb13
    i32 5, label %sw.bb34
  ], !dbg !1929

sw.bb:                                            ; preds = %while.body
  %5 = load %struct._json_value*, %struct._json_value** %value.addr, align 8, !dbg !1930
  %u = getelementptr inbounds %struct._json_value, %struct._json_value* %5, i32 0, i32 2, !dbg !1933
  %array = bitcast %union.anon* %u to %struct.anon.1*, !dbg !1934
  %length = getelementptr inbounds %struct.anon.1, %struct.anon.1* %array, i32 0, i32 0, !dbg !1935
  %6 = load i32, i32* %length, align 8, !dbg !1935
  %tobool2 = icmp ne i32 %6, 0, !dbg !1930
  br i1 %tobool2, label %if.end6, label %if.then3, !dbg !1936

if.then3:                                         ; preds = %sw.bb
  %7 = load %struct.json_settings*, %struct.json_settings** %settings.addr, align 8, !dbg !1937
  %mem_free = getelementptr inbounds %struct.json_settings, %struct.json_settings* %7, i32 0, i32 3, !dbg !1939
  %8 = load void (i8*, i8*)*, void (i8*, i8*)** %mem_free, align 8, !dbg !1939
  %9 = load %struct._json_value*, %struct._json_value** %value.addr, align 8, !dbg !1940
  %u4 = getelementptr inbounds %struct._json_value, %struct._json_value* %9, i32 0, i32 2, !dbg !1941
  %array5 = bitcast %union.anon* %u4 to %struct.anon.1*, !dbg !1942
  %values = getelementptr inbounds %struct.anon.1, %struct.anon.1* %array5, i32 0, i32 1, !dbg !1943
  %10 = load %struct._json_value**, %struct._json_value*** %values, align 8, !dbg !1943
  %11 = bitcast %struct._json_value** %10 to i8*, !dbg !1940
  %12 = load %struct.json_settings*, %struct.json_settings** %settings.addr, align 8, !dbg !1944
  %user_data = getelementptr inbounds %struct.json_settings, %struct.json_settings* %12, i32 0, i32 4, !dbg !1945
  %13 = load i8*, i8** %user_data, align 8, !dbg !1945
  call void %8(i8* noundef %11, i8* noundef %13), !dbg !1937
  br label %sw.epilog, !dbg !1946

if.end6:                                          ; preds = %sw.bb
  %14 = load %struct._json_value*, %struct._json_value** %value.addr, align 8, !dbg !1947
  %u7 = getelementptr inbounds %struct._json_value, %struct._json_value* %14, i32 0, i32 2, !dbg !1948
  %array8 = bitcast %union.anon* %u7 to %struct.anon.1*, !dbg !1949
  %values9 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %array8, i32 0, i32 1, !dbg !1950
  %15 = load %struct._json_value**, %struct._json_value*** %values9, align 8, !dbg !1950
  %16 = load %struct._json_value*, %struct._json_value** %value.addr, align 8, !dbg !1951
  %u10 = getelementptr inbounds %struct._json_value, %struct._json_value* %16, i32 0, i32 2, !dbg !1952
  %array11 = bitcast %union.anon* %u10 to %struct.anon.1*, !dbg !1953
  %length12 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %array11, i32 0, i32 0, !dbg !1954
  %17 = load i32, i32* %length12, align 8, !dbg !1955
  %dec = add i32 %17, -1, !dbg !1955
  store i32 %dec, i32* %length12, align 8, !dbg !1955
  %idxprom = zext i32 %dec to i64, !dbg !1947
  %arrayidx = getelementptr inbounds %struct._json_value*, %struct._json_value** %15, i64 %idxprom, !dbg !1947
  %18 = load %struct._json_value*, %struct._json_value** %arrayidx, align 8, !dbg !1947
  store %struct._json_value* %18, %struct._json_value** %value.addr, align 8, !dbg !1956
  br label %while.cond, !dbg !1957, !llvm.loop !1958

sw.bb13:                                          ; preds = %while.body
  %19 = load %struct._json_value*, %struct._json_value** %value.addr, align 8, !dbg !1960
  %u14 = getelementptr inbounds %struct._json_value, %struct._json_value* %19, i32 0, i32 2, !dbg !1962
  %object = bitcast %union.anon* %u14 to %struct.anon.0*, !dbg !1963
  %length15 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %object, i32 0, i32 0, !dbg !1964
  %20 = load i32, i32* %length15, align 8, !dbg !1964
  %tobool16 = icmp ne i32 %20, 0, !dbg !1960
  br i1 %tobool16, label %if.end23, label %if.then17, !dbg !1965

if.then17:                                        ; preds = %sw.bb13
  %21 = load %struct.json_settings*, %struct.json_settings** %settings.addr, align 8, !dbg !1966
  %mem_free18 = getelementptr inbounds %struct.json_settings, %struct.json_settings* %21, i32 0, i32 3, !dbg !1968
  %22 = load void (i8*, i8*)*, void (i8*, i8*)** %mem_free18, align 8, !dbg !1968
  %23 = load %struct._json_value*, %struct._json_value** %value.addr, align 8, !dbg !1969
  %u19 = getelementptr inbounds %struct._json_value, %struct._json_value* %23, i32 0, i32 2, !dbg !1970
  %object20 = bitcast %union.anon* %u19 to %struct.anon.0*, !dbg !1971
  %values21 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %object20, i32 0, i32 1, !dbg !1972
  %24 = load %struct._json_object_entry*, %struct._json_object_entry** %values21, align 8, !dbg !1972
  %25 = bitcast %struct._json_object_entry* %24 to i8*, !dbg !1969
  %26 = load %struct.json_settings*, %struct.json_settings** %settings.addr, align 8, !dbg !1973
  %user_data22 = getelementptr inbounds %struct.json_settings, %struct.json_settings* %26, i32 0, i32 4, !dbg !1974
  %27 = load i8*, i8** %user_data22, align 8, !dbg !1974
  call void %22(i8* noundef %25, i8* noundef %27), !dbg !1966
  br label %sw.epilog, !dbg !1975

if.end23:                                         ; preds = %sw.bb13
  %28 = load %struct._json_value*, %struct._json_value** %value.addr, align 8, !dbg !1976
  %u24 = getelementptr inbounds %struct._json_value, %struct._json_value* %28, i32 0, i32 2, !dbg !1977
  %object25 = bitcast %union.anon* %u24 to %struct.anon.0*, !dbg !1978
  %values26 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %object25, i32 0, i32 1, !dbg !1979
  %29 = load %struct._json_object_entry*, %struct._json_object_entry** %values26, align 8, !dbg !1979
  %30 = load %struct._json_value*, %struct._json_value** %value.addr, align 8, !dbg !1980
  %u27 = getelementptr inbounds %struct._json_value, %struct._json_value* %30, i32 0, i32 2, !dbg !1981
  %object28 = bitcast %union.anon* %u27 to %struct.anon.0*, !dbg !1982
  %length29 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %object28, i32 0, i32 0, !dbg !1983
  %31 = load i32, i32* %length29, align 8, !dbg !1984
  %dec30 = add i32 %31, -1, !dbg !1984
  store i32 %dec30, i32* %length29, align 8, !dbg !1984
  %idxprom31 = zext i32 %dec30 to i64, !dbg !1976
  %arrayidx32 = getelementptr inbounds %struct._json_object_entry, %struct._json_object_entry* %29, i64 %idxprom31, !dbg !1976
  %value33 = getelementptr inbounds %struct._json_object_entry, %struct._json_object_entry* %arrayidx32, i32 0, i32 2, !dbg !1985
  %32 = load %struct._json_value*, %struct._json_value** %value33, align 8, !dbg !1985
  store %struct._json_value* %32, %struct._json_value** %value.addr, align 8, !dbg !1986
  br label %while.cond, !dbg !1987, !llvm.loop !1958

sw.bb34:                                          ; preds = %while.body
  %33 = load %struct.json_settings*, %struct.json_settings** %settings.addr, align 8, !dbg !1988
  %mem_free35 = getelementptr inbounds %struct.json_settings, %struct.json_settings* %33, i32 0, i32 3, !dbg !1989
  %34 = load void (i8*, i8*)*, void (i8*, i8*)** %mem_free35, align 8, !dbg !1989
  %35 = load %struct._json_value*, %struct._json_value** %value.addr, align 8, !dbg !1990
  %u36 = getelementptr inbounds %struct._json_value, %struct._json_value* %35, i32 0, i32 2, !dbg !1991
  %string = bitcast %union.anon* %u36 to %struct.anon*, !dbg !1992
  %ptr = getelementptr inbounds %struct.anon, %struct.anon* %string, i32 0, i32 1, !dbg !1993
  %36 = load i8*, i8** %ptr, align 8, !dbg !1993
  %37 = load %struct.json_settings*, %struct.json_settings** %settings.addr, align 8, !dbg !1994
  %user_data37 = getelementptr inbounds %struct.json_settings, %struct.json_settings* %37, i32 0, i32 4, !dbg !1995
  %38 = load i8*, i8** %user_data37, align 8, !dbg !1995
  call void %34(i8* noundef %36, i8* noundef %38), !dbg !1988
  br label %sw.epilog, !dbg !1996

sw.default:                                       ; preds = %while.body
  br label %sw.epilog, !dbg !1997

sw.epilog:                                        ; preds = %sw.default, %sw.bb34, %if.then17, %if.then3
  %39 = load %struct._json_value*, %struct._json_value** %value.addr, align 8, !dbg !1998
  store %struct._json_value* %39, %struct._json_value** %cur_value, align 8, !dbg !1999
  %40 = load %struct._json_value*, %struct._json_value** %value.addr, align 8, !dbg !2000
  %parent38 = getelementptr inbounds %struct._json_value, %struct._json_value* %40, i32 0, i32 0, !dbg !2001
  %41 = load %struct._json_value*, %struct._json_value** %parent38, align 8, !dbg !2001
  store %struct._json_value* %41, %struct._json_value** %value.addr, align 8, !dbg !2002
  %42 = load %struct.json_settings*, %struct.json_settings** %settings.addr, align 8, !dbg !2003
  %mem_free39 = getelementptr inbounds %struct.json_settings, %struct.json_settings* %42, i32 0, i32 3, !dbg !2004
  %43 = load void (i8*, i8*)*, void (i8*, i8*)** %mem_free39, align 8, !dbg !2004
  %44 = load %struct._json_value*, %struct._json_value** %cur_value, align 8, !dbg !2005
  %45 = bitcast %struct._json_value* %44 to i8*, !dbg !2005
  %46 = load %struct.json_settings*, %struct.json_settings** %settings.addr, align 8, !dbg !2006
  %user_data40 = getelementptr inbounds %struct.json_settings, %struct.json_settings* %46, i32 0, i32 4, !dbg !2007
  %47 = load i8*, i8** %user_data40, align 8, !dbg !2007
  call void %43(i8* noundef %45, i8* noundef %47), !dbg !2003
  br label %while.cond, !dbg !1924, !llvm.loop !1958

while.end:                                        ; preds = %if.then, %while.cond
  ret void, !dbg !2008
}

; Function Attrs: nounwind
declare noalias i8* @calloc(i64 noundef, i64 noundef) #3

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define internal i8* @json_alloc(%struct.json_state* noundef %state, i64 noundef %size, i32 noundef %zero) #0 !dbg !2009 {
entry:
  %retval = alloca i8*, align 8
  %state.addr = alloca %struct.json_state*, align 8
  %size.addr = alloca i64, align 8
  %zero.addr = alloca i32, align 4
  store %struct.json_state* %state, %struct.json_state** %state.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.json_state** %state.addr, metadata !2012, metadata !DIExpression()), !dbg !2013
  store i64 %size, i64* %size.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %size.addr, metadata !2014, metadata !DIExpression()), !dbg !2015
  store i32 %zero, i32* %zero.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %zero.addr, metadata !2016, metadata !DIExpression()), !dbg !2017
  %0 = load %struct.json_state*, %struct.json_state** %state.addr, align 8, !dbg !2018
  %used_memory = getelementptr inbounds %struct.json_state, %struct.json_state* %0, i32 0, i32 0, !dbg !2020
  %1 = load i64, i64* %used_memory, align 8, !dbg !2020
  %sub = sub i64 -9, %1, !dbg !2021
  %2 = load i64, i64* %size.addr, align 8, !dbg !2022
  %cmp = icmp ult i64 %sub, %2, !dbg !2023
  br i1 %cmp, label %if.then, label %if.end, !dbg !2024

if.then:                                          ; preds = %entry
  store i8* null, i8** %retval, align 8, !dbg !2025
  br label %return, !dbg !2025

if.end:                                           ; preds = %entry
  %3 = load %struct.json_state*, %struct.json_state** %state.addr, align 8, !dbg !2026
  %settings = getelementptr inbounds %struct.json_state, %struct.json_state* %3, i32 0, i32 1, !dbg !2028
  %max_memory = getelementptr inbounds %struct.json_settings, %struct.json_settings* %settings, i32 0, i32 0, !dbg !2029
  %4 = load i64, i64* %max_memory, align 8, !dbg !2029
  %tobool = icmp ne i64 %4, 0, !dbg !2026
  br i1 %tobool, label %land.lhs.true, label %if.end6, !dbg !2030

land.lhs.true:                                    ; preds = %if.end
  %5 = load i64, i64* %size.addr, align 8, !dbg !2031
  %6 = load %struct.json_state*, %struct.json_state** %state.addr, align 8, !dbg !2032
  %used_memory1 = getelementptr inbounds %struct.json_state, %struct.json_state* %6, i32 0, i32 0, !dbg !2033
  %7 = load i64, i64* %used_memory1, align 8, !dbg !2034
  %add = add i64 %7, %5, !dbg !2034
  store i64 %add, i64* %used_memory1, align 8, !dbg !2034
  %8 = load %struct.json_state*, %struct.json_state** %state.addr, align 8, !dbg !2035
  %settings2 = getelementptr inbounds %struct.json_state, %struct.json_state* %8, i32 0, i32 1, !dbg !2036
  %max_memory3 = getelementptr inbounds %struct.json_settings, %struct.json_settings* %settings2, i32 0, i32 0, !dbg !2037
  %9 = load i64, i64* %max_memory3, align 8, !dbg !2037
  %cmp4 = icmp ugt i64 %add, %9, !dbg !2038
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !2039

if.then5:                                         ; preds = %land.lhs.true
  store i8* null, i8** %retval, align 8, !dbg !2040
  br label %return, !dbg !2040

if.end6:                                          ; preds = %land.lhs.true, %if.end
  %10 = load %struct.json_state*, %struct.json_state** %state.addr, align 8, !dbg !2042
  %settings7 = getelementptr inbounds %struct.json_state, %struct.json_state* %10, i32 0, i32 1, !dbg !2043
  %mem_alloc = getelementptr inbounds %struct.json_settings, %struct.json_settings* %settings7, i32 0, i32 2, !dbg !2044
  %11 = load i8* (i64, i32, i8*)*, i8* (i64, i32, i8*)** %mem_alloc, align 8, !dbg !2044
  %12 = load i64, i64* %size.addr, align 8, !dbg !2045
  %13 = load i32, i32* %zero.addr, align 4, !dbg !2046
  %14 = load %struct.json_state*, %struct.json_state** %state.addr, align 8, !dbg !2047
  %settings8 = getelementptr inbounds %struct.json_state, %struct.json_state* %14, i32 0, i32 1, !dbg !2048
  %user_data = getelementptr inbounds %struct.json_settings, %struct.json_settings* %settings8, i32 0, i32 4, !dbg !2049
  %15 = load i8*, i8** %user_data, align 8, !dbg !2049
  %call = call i8* %11(i64 noundef %12, i32 noundef %13, i8* noundef %15), !dbg !2042
  store i8* %call, i8** %retval, align 8, !dbg !2050
  br label %return, !dbg !2050

return:                                           ; preds = %if.end6, %if.then5, %if.then
  %16 = load i8*, i8** %retval, align 8, !dbg !2051
  ret i8* %16, !dbg !2051
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { argmemonly nofree nounwind willreturn }
attributes #7 = { nounwind readnone willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }
attributes #10 = { nounwind readnone willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!125, !126, !127, !128, !129, !130, !131}
!llvm.ident = !{!132}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "json_value_none", scope: !2, file: !92, line: 70, type: !124, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !32, globals: !89, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "json_parser_benchmark.c", directory: "/lab3/test", checksumkind: CSK_MD5, checksum: "5c3d7e749b6e59fbf540b81a93ce8a69")
!4 = !{!5, !17}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !6, line: 84, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "./vendor/json-parser/json.h", directory: "/lab3/test", checksumkind: CSK_MD5, checksum: "204e7d41ee49fc1f3d98ee55ca0c51f6")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12, !13, !14, !15, !16}
!9 = !DIEnumerator(name: "json_none", value: 0)
!10 = !DIEnumerator(name: "json_object", value: 1)
!11 = !DIEnumerator(name: "json_array", value: 2)
!12 = !DIEnumerator(name: "json_integer", value: 3)
!13 = !DIEnumerator(name: "json_double", value: 4)
!14 = !DIEnumerator(name: "json_string", value: 5)
!15 = !DIEnumerator(name: "json_boolean", value: 6)
!16 = !DIEnumerator(name: "json_null", value: 7)
!17 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !18, line: 46, baseType: !7, size: 32, elements: !19)
!18 = !DIFile(filename: "/usr/include/ctype.h", directory: "", checksumkind: CSK_MD5, checksum: "3ab3dd7fdf2578005732722ee2393e59")
!19 = !{!20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31}
!20 = !DIEnumerator(name: "_ISupper", value: 256)
!21 = !DIEnumerator(name: "_ISlower", value: 512)
!22 = !DIEnumerator(name: "_ISalpha", value: 1024)
!23 = !DIEnumerator(name: "_ISdigit", value: 2048)
!24 = !DIEnumerator(name: "_ISxdigit", value: 4096)
!25 = !DIEnumerator(name: "_ISspace", value: 8192)
!26 = !DIEnumerator(name: "_ISprint", value: 16384)
!27 = !DIEnumerator(name: "_ISgraph", value: 32768)
!28 = !DIEnumerator(name: "_ISblank", value: 1)
!29 = !DIEnumerator(name: "_IScntrl", value: 2)
!30 = !DIEnumerator(name: "_ISpunct", value: 4)
!31 = !DIEnumerator(name: "_ISalnum", value: 8)
!32 = !{!33, !35, !36, !34, !37, !38, !39, !40, !41, !69, !87, !42}
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64)
!34 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!36 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!37 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64)
!38 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!39 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!40 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !42, size: 64)
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "json_value", file: !6, line: 263, baseType: !44)
!44 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_json_value", file: !6, line: 108, size: 320, elements: !45)
!45 = !{!46, !48, !50, !82}
!46 = !DIDerivedType(tag: DW_TAG_member, name: "parent", scope: !44, file: !6, line: 110, baseType: !47, size: 64)
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !44, file: !6, line: 112, baseType: !49, size: 32, offset: 64)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "json_type", file: !6, line: 95, baseType: !5)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "u", scope: !44, file: !6, line: 160, baseType: !51, size: 128, offset: 128)
!51 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !44, file: !6, line: 114, size: 128, elements: !52)
!52 = !{!53, !54, !58, !59, !64, !76}
!53 = !DIDerivedType(tag: DW_TAG_member, name: "boolean", scope: !51, file: !6, line: 116, baseType: !38, size: 32)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "integer", scope: !51, file: !6, line: 117, baseType: !55, size: 64)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !56, line: 62, baseType: !57)
!56 = !DIFile(filename: "/usr/include/stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "a48e64edacc5b19f56c99745232c963c")
!57 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "dbl", scope: !51, file: !6, line: 118, baseType: !40, size: 64)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "string", scope: !51, file: !6, line: 125, baseType: !60, size: 128)
!60 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !51, file: !6, line: 120, size: 128, elements: !61)
!61 = !{!62, !63}
!62 = !DIDerivedType(tag: DW_TAG_member, name: "length", scope: !60, file: !6, line: 122, baseType: !7, size: 32)
!63 = !DIDerivedType(tag: DW_TAG_member, name: "ptr", scope: !60, file: !6, line: 123, baseType: !33, size: 64, offset: 64)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "object", scope: !51, file: !6, line: 142, baseType: !65, size: 128)
!65 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !51, file: !6, line: 127, size: 128, elements: !66)
!66 = !{!67, !68}
!67 = !DIDerivedType(tag: DW_TAG_member, name: "length", scope: !65, file: !6, line: 129, baseType: !7, size: 32)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "values", scope: !65, file: !6, line: 131, baseType: !69, size: 64, offset: 64)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_typedef, name: "json_object_entry", file: !6, line: 106, baseType: !71)
!71 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_json_object_entry", file: !6, line: 99, size: 192, elements: !72)
!72 = !{!73, !74, !75}
!73 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !71, file: !6, line: 101, baseType: !33, size: 64)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "name_length", scope: !71, file: !6, line: 102, baseType: !7, size: 32, offset: 64)
!75 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !71, file: !6, line: 104, baseType: !47, size: 64, offset: 128)
!76 = !DIDerivedType(tag: DW_TAG_member, name: "array", scope: !51, file: !6, line: 158, baseType: !77, size: 128)
!77 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !51, file: !6, line: 144, size: 128, elements: !78)
!78 = !{!79, !80}
!79 = !DIDerivedType(tag: DW_TAG_member, name: "length", scope: !77, file: !6, line: 146, baseType: !7, size: 32)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "values", scope: !77, file: !6, line: 147, baseType: !81, size: 64, offset: 64)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!82 = !DIDerivedType(tag: DW_TAG_member, name: "_reserved", scope: !44, file: !6, line: 167, baseType: !83, size: 64, offset: 256)
!83 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !44, file: !6, line: 162, size: 64, elements: !84)
!84 = !{!85, !86}
!85 = !DIDerivedType(tag: DW_TAG_member, name: "next_alloc", scope: !83, file: !6, line: 164, baseType: !47, size: 64)
!86 = !DIDerivedType(tag: DW_TAG_member, name: "object_mem", scope: !83, file: !6, line: 165, baseType: !35, size: 64)
!87 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !56, line: 90, baseType: !88)
!88 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!89 = !{!90, !94, !96, !98, !100, !102, !104, !106, !108, !110, !112, !114, !116, !118, !120, !122, !0}
!90 = !DIGlobalVariableExpression(var: !91, expr: !DIExpression(DW_OP_constu, 8, DW_OP_stack_value))
!91 = distinct !DIGlobalVariable(name: "flag_seek_value", scope: !2, file: !92, line: 241, type: !93, isLocal: true, isDefinition: true)
!92 = !DIFile(filename: "./vendor/json-parser/json.c", directory: "/lab3/test", checksumkind: CSK_MD5, checksum: "8946654903b3467826a3bb7a8726e6f8")
!93 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !57)
!94 = !DIGlobalVariableExpression(var: !95, expr: !DIExpression(DW_OP_constu, 32, DW_OP_stack_value))
!95 = distinct !DIGlobalVariable(name: "flag_string", scope: !2, file: !92, line: 243, type: !93, isLocal: true, isDefinition: true)
!96 = !DIGlobalVariableExpression(var: !97, expr: !DIExpression(DW_OP_constu, 16, DW_OP_stack_value))
!97 = distinct !DIGlobalVariable(name: "flag_escaped", scope: !2, file: !92, line: 242, type: !93, isLocal: true, isDefinition: true)
!98 = !DIGlobalVariableExpression(var: !99, expr: !DIExpression(DW_OP_constu, 1, DW_OP_stack_value))
!99 = distinct !DIGlobalVariable(name: "flag_next", scope: !2, file: !92, line: 238, type: !93, isLocal: true, isDefinition: true)
!100 = !DIGlobalVariableExpression(var: !101, expr: !DIExpression(DW_OP_constu, 64, DW_OP_stack_value))
!101 = distinct !DIGlobalVariable(name: "flag_need_colon", scope: !2, file: !92, line: 244, type: !93, isLocal: true, isDefinition: true)
!102 = !DIGlobalVariableExpression(var: !103, expr: !DIExpression(DW_OP_constu, 8192, DW_OP_stack_value))
!103 = distinct !DIGlobalVariable(name: "flag_line_comment", scope: !2, file: !92, line: 251, type: !93, isLocal: true, isDefinition: true)
!104 = !DIGlobalVariableExpression(var: !105, expr: !DIExpression(DW_OP_constu, 16384, DW_OP_stack_value))
!105 = distinct !DIGlobalVariable(name: "flag_block_comment", scope: !2, file: !92, line: 252, type: !93, isLocal: true, isDefinition: true)
!106 = !DIGlobalVariableExpression(var: !107, expr: !DIExpression(DW_OP_constu, 128, DW_OP_stack_value))
!107 = distinct !DIGlobalVariable(name: "flag_done", scope: !2, file: !92, line: 245, type: !93, isLocal: true, isDefinition: true)
!108 = !DIGlobalVariableExpression(var: !109, expr: !DIExpression(DW_OP_constu, 4, DW_OP_stack_value))
!109 = distinct !DIGlobalVariable(name: "flag_need_comma", scope: !2, file: !92, line: 240, type: !93, isLocal: true, isDefinition: true)
!110 = !DIGlobalVariableExpression(var: !111, expr: !DIExpression(DW_OP_constu, 2, DW_OP_stack_value))
!111 = distinct !DIGlobalVariable(name: "flag_reproc", scope: !2, file: !92, line: 239, type: !93, isLocal: true, isDefinition: true)
!112 = !DIGlobalVariableExpression(var: !113, expr: !DIExpression(DW_OP_constu, 256, DW_OP_stack_value))
!113 = distinct !DIGlobalVariable(name: "flag_num_negative", scope: !2, file: !92, line: 246, type: !93, isLocal: true, isDefinition: true)
!114 = !DIGlobalVariableExpression(var: !115, expr: !DIExpression(DW_OP_constu, 1024, DW_OP_stack_value))
!115 = distinct !DIGlobalVariable(name: "flag_num_e", scope: !2, file: !92, line: 248, type: !93, isLocal: true, isDefinition: true)
!116 = !DIGlobalVariableExpression(var: !117, expr: !DIExpression(DW_OP_constu, 2048, DW_OP_stack_value))
!117 = distinct !DIGlobalVariable(name: "flag_num_e_got_sign", scope: !2, file: !92, line: 249, type: !93, isLocal: true, isDefinition: true)
!118 = !DIGlobalVariableExpression(var: !119, expr: !DIExpression(DW_OP_constu, 4096, DW_OP_stack_value))
!119 = distinct !DIGlobalVariable(name: "flag_num_e_negative", scope: !2, file: !92, line: 250, type: !93, isLocal: true, isDefinition: true)
!120 = !DIGlobalVariableExpression(var: !121, expr: !DIExpression(DW_OP_constu, 512, DW_OP_stack_value))
!121 = distinct !DIGlobalVariable(name: "flag_num_zero", scope: !2, file: !92, line: 247, type: !93, isLocal: true, isDefinition: true)
!122 = !DIGlobalVariableExpression(var: !123, expr: !DIExpression(DW_OP_constu, 32768, DW_OP_stack_value))
!123 = distinct !DIGlobalVariable(name: "flag_num_got_decimal", scope: !2, file: !92, line: 253, type: !93, isLocal: true, isDefinition: true)
!124 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !44)
!125 = !{i32 7, !"Dwarf Version", i32 5}
!126 = !{i32 2, !"Debug Info Version", i32 3}
!127 = !{i32 1, !"wchar_size", i32 4}
!128 = !{i32 7, !"PIC Level", i32 2}
!129 = !{i32 7, !"PIE Level", i32 2}
!130 = !{i32 7, !"uwtable", i32 1}
!131 = !{i32 7, !"frame-pointer", i32 2}
!132 = !{!"Ubuntu clang version 14.0.6"}
!133 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 6, type: !134, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !136)
!134 = !DISubroutineType(types: !135)
!135 = !{!38}
!136 = !{}
!137 = !DILocalVariable(name: "file_contents", scope: !133, file: !3, line: 7, type: !138)
!138 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 524288, elements: !139)
!139 = !{!140}
!140 = !DISubrange(count: 65536)
!141 = !DILocation(line: 7, column: 8, scope: !133)
!142 = !DILocalVariable(name: "file_size", scope: !133, file: !3, line: 8, type: !143)
!143 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !144, line: 46, baseType: !88)
!144 = !DIFile(filename: "/usr/lib/llvm-14/lib/clang/14.0.6/include/stddef.h", directory: "", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!145 = !DILocation(line: 8, column: 10, scope: !133)
!146 = !DILocation(line: 8, column: 28, scope: !133)
!147 = !DILocation(line: 8, column: 69, scope: !133)
!148 = !DILocation(line: 8, column: 22, scope: !133)
!149 = !DILocation(line: 10, column: 14, scope: !150)
!150 = distinct !DILexicalBlock(scope: !133, file: !3, line: 10, column: 7)
!151 = !DILocation(line: 10, column: 7, scope: !150)
!152 = !DILocation(line: 10, column: 7, scope: !133)
!153 = !DILocation(line: 11, column: 5, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !3, line: 10, column: 22)
!155 = !DILocalVariable(name: "value", scope: !133, file: !3, line: 14, type: !42)
!156 = !DILocation(line: 14, column: 15, scope: !133)
!157 = !DILocation(line: 14, column: 46, scope: !133)
!158 = !DILocation(line: 14, column: 61, scope: !133)
!159 = !DILocation(line: 14, column: 23, scope: !133)
!160 = !DILocation(line: 16, column: 7, scope: !161)
!161 = distinct !DILexicalBlock(scope: !133, file: !3, line: 16, column: 7)
!162 = !DILocation(line: 16, column: 13, scope: !161)
!163 = !DILocation(line: 16, column: 7, scope: !133)
!164 = !DILocation(line: 17, column: 13, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !3, line: 16, column: 22)
!166 = !DILocation(line: 17, column: 5, scope: !165)
!167 = !DILocation(line: 18, column: 5, scope: !165)
!168 = !DILocation(line: 21, column: 19, scope: !133)
!169 = !DILocation(line: 21, column: 3, scope: !133)
!170 = !DILocation(line: 22, column: 3, scope: !133)
!171 = !DILocation(line: 23, column: 1, scope: !133)
!172 = distinct !DISubprogram(name: "json_parse", scope: !92, file: !92, line: 996, type: !173, scopeLine: 997, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !136)
!173 = !DISubroutineType(types: !174)
!174 = !{!42, !175, !143}
!175 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !176, size: 64)
!176 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !34)
!177 = !DILocalVariable(name: "json", arg: 1, scope: !172, file: !92, line: 996, type: !175)
!178 = !DILocation(line: 996, column: 44, scope: !172)
!179 = !DILocalVariable(name: "length", arg: 2, scope: !172, file: !92, line: 996, type: !143)
!180 = !DILocation(line: 996, column: 57, scope: !172)
!181 = !DILocalVariable(name: "settings", scope: !172, file: !92, line: 998, type: !182)
!182 = !DIDerivedType(tag: DW_TAG_typedef, name: "json_settings", file: !6, line: 80, baseType: !183)
!183 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !6, line: 65, size: 384, elements: !184)
!184 = !{!185, !186, !187, !191, !195, !196}
!185 = !DIDerivedType(tag: DW_TAG_member, name: "max_memory", scope: !183, file: !6, line: 67, baseType: !88, size: 64)
!186 = !DIDerivedType(tag: DW_TAG_member, name: "settings", scope: !183, file: !6, line: 68, baseType: !38, size: 32, offset: 64)
!187 = !DIDerivedType(tag: DW_TAG_member, name: "mem_alloc", scope: !183, file: !6, line: 73, baseType: !188, size: 64, offset: 128)
!188 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !189, size: 64)
!189 = !DISubroutineType(types: !190)
!190 = !{!35, !143, !38, !35}
!191 = !DIDerivedType(tag: DW_TAG_member, name: "mem_free", scope: !183, file: !6, line: 74, baseType: !192, size: 64, offset: 192)
!192 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !193, size: 64)
!193 = !DISubroutineType(types: !194)
!194 = !{null, !35, !35}
!195 = !DIDerivedType(tag: DW_TAG_member, name: "user_data", scope: !183, file: !6, line: 76, baseType: !35, size: 64, offset: 256)
!196 = !DIDerivedType(tag: DW_TAG_member, name: "value_extra", scope: !183, file: !6, line: 78, baseType: !143, size: 64, offset: 320)
!197 = !DILocation(line: 998, column: 18, scope: !172)
!198 = !DILocation(line: 999, column: 37, scope: !172)
!199 = !DILocation(line: 999, column: 43, scope: !172)
!200 = !DILocation(line: 999, column: 11, scope: !172)
!201 = !DILocation(line: 999, column: 4, scope: !172)
!202 = distinct !DISubprogram(name: "json_value_free", scope: !92, file: !92, line: 1052, type: !203, scopeLine: 1053, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !136)
!203 = !DISubroutineType(types: !204)
!204 = !{null, !42}
!205 = !DILocalVariable(name: "value", arg: 1, scope: !202, file: !92, line: 1052, type: !42)
!206 = !DILocation(line: 1052, column: 36, scope: !202)
!207 = !DILocalVariable(name: "settings", scope: !202, file: !92, line: 1054, type: !182)
!208 = !DILocation(line: 1054, column: 18, scope: !202)
!209 = !DILocation(line: 1055, column: 13, scope: !202)
!210 = !DILocation(line: 1055, column: 22, scope: !202)
!211 = !DILocation(line: 1056, column: 35, scope: !202)
!212 = !DILocation(line: 1056, column: 4, scope: !202)
!213 = !DILocation(line: 1057, column: 1, scope: !202)
!214 = distinct !DISubprogram(name: "json_parse_ex", scope: !92, file: !92, line: 255, type: !215, scopeLine: 259, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !136)
!215 = !DISubroutineType(types: !216)
!216 = !{!42, !217, !175, !143, !33}
!217 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !182, size: 64)
!218 = !DILocalVariable(name: "settings", arg: 1, scope: !214, file: !92, line: 255, type: !217)
!219 = !DILocation(line: 255, column: 45, scope: !214)
!220 = !DILocalVariable(name: "json", arg: 2, scope: !214, file: !92, line: 256, type: !175)
!221 = !DILocation(line: 256, column: 47, scope: !214)
!222 = !DILocalVariable(name: "length", arg: 3, scope: !214, file: !92, line: 257, type: !143)
!223 = !DILocation(line: 257, column: 36, scope: !214)
!224 = !DILocalVariable(name: "error_buf", arg: 4, scope: !214, file: !92, line: 258, type: !33)
!225 = !DILocation(line: 258, column: 36, scope: !214)
!226 = !DILocalVariable(name: "error", scope: !214, file: !92, line: 260, type: !227)
!227 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 1024, elements: !228)
!228 = !{!229}
!229 = !DISubrange(count: 128)
!230 = !DILocation(line: 260, column: 9, scope: !214)
!231 = !DILocalVariable(name: "end", scope: !214, file: !92, line: 261, type: !175)
!232 = !DILocation(line: 261, column: 22, scope: !214)
!233 = !DILocalVariable(name: "top", scope: !214, file: !92, line: 262, type: !42)
!234 = !DILocation(line: 262, column: 17, scope: !214)
!235 = !DILocalVariable(name: "root", scope: !214, file: !92, line: 262, type: !42)
!236 = !DILocation(line: 262, column: 24, scope: !214)
!237 = !DILocalVariable(name: "alloc", scope: !214, file: !92, line: 262, type: !42)
!238 = !DILocation(line: 262, column: 32, scope: !214)
!239 = !DILocalVariable(name: "state", scope: !214, file: !92, line: 263, type: !240)
!240 = !DIDerivedType(tag: DW_TAG_typedef, name: "json_state", file: !92, line: 103, baseType: !241)
!241 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !92, line: 93, size: 640, elements: !242)
!242 = !{!243, !244, !245, !246, !247, !248}
!243 = !DIDerivedType(tag: DW_TAG_member, name: "used_memory", scope: !241, file: !92, line: 95, baseType: !143, size: 64)
!244 = !DIDerivedType(tag: DW_TAG_member, name: "settings", scope: !241, file: !92, line: 97, baseType: !182, size: 384, offset: 64)
!245 = !DIDerivedType(tag: DW_TAG_member, name: "first_pass", scope: !241, file: !92, line: 98, baseType: !38, size: 32, offset: 448)
!246 = !DIDerivedType(tag: DW_TAG_member, name: "ptr", scope: !241, file: !92, line: 100, baseType: !175, size: 64, offset: 512)
!247 = !DIDerivedType(tag: DW_TAG_member, name: "cur_line", scope: !241, file: !92, line: 101, baseType: !7, size: 32, offset: 576)
!248 = !DIDerivedType(tag: DW_TAG_member, name: "cur_col", scope: !241, file: !92, line: 101, baseType: !7, size: 32, offset: 608)
!249 = !DILocation(line: 263, column: 15, scope: !214)
!250 = !DILocalVariable(name: "flags", scope: !214, file: !92, line: 264, type: !57)
!251 = !DILocation(line: 264, column: 9, scope: !214)
!252 = !DILocalVariable(name: "num_digits", scope: !214, file: !92, line: 265, type: !38)
!253 = !DILocation(line: 265, column: 8, scope: !214)
!254 = !DILocalVariable(name: "num_e", scope: !214, file: !92, line: 266, type: !40)
!255 = !DILocation(line: 266, column: 11, scope: !214)
!256 = !DILocalVariable(name: "num_fraction", scope: !214, file: !92, line: 266, type: !40)
!257 = !DILocation(line: 266, column: 22, scope: !214)
!258 = !DILocation(line: 270, column: 8, scope: !259)
!259 = distinct !DILexicalBlock(scope: !214, file: !92, line: 270, column: 8)
!260 = !DILocation(line: 270, column: 15, scope: !259)
!261 = !DILocation(line: 270, column: 20, scope: !259)
!262 = !DILocation(line: 270, column: 40, scope: !259)
!263 = !DILocation(line: 270, column: 23, scope: !259)
!264 = !DILocation(line: 270, column: 50, scope: !259)
!265 = !DILocation(line: 271, column: 20, scope: !259)
!266 = !DILocation(line: 271, column: 40, scope: !259)
!267 = !DILocation(line: 271, column: 23, scope: !259)
!268 = !DILocation(line: 271, column: 50, scope: !259)
!269 = !DILocation(line: 272, column: 20, scope: !259)
!270 = !DILocation(line: 272, column: 40, scope: !259)
!271 = !DILocation(line: 272, column: 23, scope: !259)
!272 = !DILocation(line: 272, column: 50, scope: !259)
!273 = !DILocation(line: 270, column: 8, scope: !214)
!274 = !DILocation(line: 274, column: 12, scope: !275)
!275 = distinct !DILexicalBlock(scope: !259, file: !92, line: 273, column: 4)
!276 = !DILocation(line: 275, column: 14, scope: !275)
!277 = !DILocation(line: 276, column: 4, scope: !275)
!278 = !DILocation(line: 278, column: 4, scope: !214)
!279 = !DILocation(line: 278, column: 13, scope: !214)
!280 = !DILocation(line: 279, column: 11, scope: !214)
!281 = !DILocation(line: 279, column: 18, scope: !214)
!282 = !DILocation(line: 279, column: 16, scope: !214)
!283 = !DILocation(line: 279, column: 8, scope: !214)
!284 = !DILocation(line: 281, column: 19, scope: !214)
!285 = !DILocation(line: 281, column: 4, scope: !214)
!286 = !DILocation(line: 281, column: 29, scope: !214)
!287 = !DILocation(line: 283, column: 15, scope: !288)
!288 = distinct !DILexicalBlock(scope: !214, file: !92, line: 283, column: 8)
!289 = !DILocation(line: 283, column: 24, scope: !288)
!290 = !DILocation(line: 283, column: 9, scope: !288)
!291 = !DILocation(line: 283, column: 8, scope: !214)
!292 = !DILocation(line: 284, column: 13, scope: !288)
!293 = !DILocation(line: 284, column: 22, scope: !288)
!294 = !DILocation(line: 284, column: 32, scope: !288)
!295 = !DILocation(line: 284, column: 7, scope: !288)
!296 = !DILocation(line: 286, column: 15, scope: !297)
!297 = distinct !DILexicalBlock(scope: !214, file: !92, line: 286, column: 8)
!298 = !DILocation(line: 286, column: 24, scope: !297)
!299 = !DILocation(line: 286, column: 9, scope: !297)
!300 = !DILocation(line: 286, column: 8, scope: !214)
!301 = !DILocation(line: 287, column: 13, scope: !297)
!302 = !DILocation(line: 287, column: 22, scope: !297)
!303 = !DILocation(line: 287, column: 31, scope: !297)
!304 = !DILocation(line: 287, column: 7, scope: !297)
!305 = !DILocation(line: 289, column: 15, scope: !306)
!306 = distinct !DILexicalBlock(scope: !214, file: !92, line: 289, column: 4)
!307 = !DILocation(line: 289, column: 26, scope: !306)
!308 = !DILocation(line: 289, column: 9, scope: !306)
!309 = !DILocation(line: 289, column: 37, scope: !310)
!310 = distinct !DILexicalBlock(scope: !306, file: !92, line: 289, column: 4)
!311 = !DILocation(line: 289, column: 48, scope: !310)
!312 = !DILocation(line: 289, column: 4, scope: !306)
!313 = !DILocalVariable(name: "uchar", scope: !314, file: !92, line: 291, type: !315)
!314 = distinct !DILexicalBlock(scope: !310, file: !92, line: 290, column: 4)
!315 = !DIDerivedType(tag: DW_TAG_typedef, name: "json_uchar", file: !92, line: 68, baseType: !7)
!316 = !DILocation(line: 291, column: 18, scope: !314)
!317 = !DILocalVariable(name: "uc_b1", scope: !314, file: !92, line: 292, type: !36)
!318 = !DILocation(line: 292, column: 21, scope: !314)
!319 = !DILocalVariable(name: "uc_b2", scope: !314, file: !92, line: 292, type: !36)
!320 = !DILocation(line: 292, column: 28, scope: !314)
!321 = !DILocalVariable(name: "uc_b3", scope: !314, file: !92, line: 292, type: !36)
!322 = !DILocation(line: 292, column: 35, scope: !314)
!323 = !DILocalVariable(name: "uc_b4", scope: !314, file: !92, line: 292, type: !36)
!324 = !DILocation(line: 292, column: 42, scope: !314)
!325 = !DILocalVariable(name: "string", scope: !314, file: !92, line: 293, type: !33)
!326 = !DILocation(line: 293, column: 19, scope: !314)
!327 = !DILocalVariable(name: "string_length", scope: !314, file: !92, line: 294, type: !7)
!328 = !DILocation(line: 294, column: 20, scope: !314)
!329 = !DILocation(line: 296, column: 18, scope: !314)
!330 = !DILocation(line: 296, column: 11, scope: !314)
!331 = !DILocation(line: 297, column: 13, scope: !314)
!332 = !DILocation(line: 299, column: 13, scope: !314)
!333 = !DILocation(line: 299, column: 22, scope: !314)
!334 = !DILocation(line: 301, column: 24, scope: !335)
!335 = distinct !DILexicalBlock(scope: !314, file: !92, line: 301, column: 7)
!336 = !DILocation(line: 301, column: 18, scope: !335)
!337 = !DILocation(line: 301, column: 22, scope: !335)
!338 = !DILocation(line: 301, column: 12, scope: !335)
!339 = !DILocalVariable(name: "b", scope: !340, file: !92, line: 303, type: !34)
!340 = distinct !DILexicalBlock(scope: !341, file: !92, line: 302, column: 7)
!341 = distinct !DILexicalBlock(scope: !335, file: !92, line: 301, column: 7)
!342 = !DILocation(line: 303, column: 20, scope: !340)
!343 = !DILocation(line: 303, column: 31, scope: !340)
!344 = !DILocation(line: 303, column: 38, scope: !340)
!345 = !DILocation(line: 303, column: 35, scope: !340)
!346 = !DILocation(line: 303, column: 25, scope: !340)
!347 = !DILocation(line: 303, column: 55, scope: !340)
!348 = !DILocation(line: 303, column: 48, scope: !340)
!349 = !DILocation(line: 303, column: 24, scope: !340)
!350 = !DILocation(line: 305, column: 14, scope: !351)
!351 = distinct !DILexicalBlock(scope: !340, file: !92, line: 305, column: 14)
!352 = !DILocation(line: 305, column: 20, scope: !351)
!353 = !DILocation(line: 305, column: 14, scope: !340)
!354 = !DILocation(line: 307, column: 18, scope: !355)
!355 = distinct !DILexicalBlock(scope: !356, file: !92, line: 307, column: 17)
!356 = distinct !DILexicalBlock(scope: !351, file: !92, line: 306, column: 10)
!357 = !DILocation(line: 307, column: 17, scope: !356)
!358 = !DILocation(line: 308, column: 25, scope: !359)
!359 = distinct !DILexicalBlock(scope: !355, file: !92, line: 308, column: 13)
!360 = !DILocation(line: 308, column: 67, scope: !359)
!361 = !DILocation(line: 308, column: 16, scope: !359)
!362 = !DILocation(line: 309, column: 16, scope: !359)
!363 = !DILocation(line: 312, column: 17, scope: !364)
!364 = distinct !DILexicalBlock(scope: !356, file: !92, line: 312, column: 17)
!365 = !DILocation(line: 312, column: 31, scope: !364)
!366 = !DILocation(line: 312, column: 17, scope: !356)
!367 = !DILocation(line: 313, column: 16, scope: !364)
!368 = !DILocation(line: 315, column: 17, scope: !369)
!369 = distinct !DILexicalBlock(scope: !356, file: !92, line: 315, column: 17)
!370 = !DILocation(line: 315, column: 23, scope: !369)
!371 = !DILocation(line: 315, column: 17, scope: !356)
!372 = !DILocation(line: 317, column: 22, scope: !373)
!373 = distinct !DILexicalBlock(scope: !369, file: !92, line: 316, column: 13)
!374 = !DILocation(line: 319, column: 24, scope: !373)
!375 = !DILocation(line: 319, column: 16, scope: !373)
!376 = !DILocation(line: 321, column: 30, scope: !377)
!377 = distinct !DILexicalBlock(scope: !373, file: !92, line: 320, column: 16)
!378 = !DILocation(line: 321, column: 30, scope: !379)
!379 = distinct !DILexicalBlock(scope: !380, file: !92, line: 321, column: 30)
!380 = distinct !DILexicalBlock(scope: !377, file: !92, line: 321, column: 30)
!381 = !DILocation(line: 321, column: 30, scope: !380)
!382 = !DILocation(line: 321, column: 50, scope: !377)
!383 = !DILocation(line: 322, column: 30, scope: !377)
!384 = !DILocation(line: 322, column: 30, scope: !385)
!385 = distinct !DILexicalBlock(scope: !386, file: !92, line: 322, column: 30)
!386 = distinct !DILexicalBlock(scope: !377, file: !92, line: 322, column: 30)
!387 = !DILocation(line: 322, column: 30, scope: !386)
!388 = !DILocation(line: 322, column: 50, scope: !377)
!389 = !DILocation(line: 323, column: 30, scope: !377)
!390 = !DILocation(line: 323, column: 30, scope: !391)
!391 = distinct !DILexicalBlock(scope: !392, file: !92, line: 323, column: 30)
!392 = distinct !DILexicalBlock(scope: !377, file: !92, line: 323, column: 30)
!393 = !DILocation(line: 323, column: 30, scope: !392)
!394 = !DILocation(line: 323, column: 50, scope: !377)
!395 = !DILocation(line: 324, column: 30, scope: !377)
!396 = !DILocation(line: 324, column: 30, scope: !397)
!397 = distinct !DILexicalBlock(scope: !398, file: !92, line: 324, column: 30)
!398 = distinct !DILexicalBlock(scope: !377, file: !92, line: 324, column: 30)
!399 = !DILocation(line: 324, column: 30, scope: !398)
!400 = !DILocation(line: 324, column: 50, scope: !377)
!401 = !DILocation(line: 325, column: 30, scope: !377)
!402 = !DILocation(line: 325, column: 30, scope: !403)
!403 = distinct !DILexicalBlock(scope: !404, file: !92, line: 325, column: 30)
!404 = distinct !DILexicalBlock(scope: !377, file: !92, line: 325, column: 30)
!405 = !DILocation(line: 325, column: 30, scope: !404)
!406 = !DILocation(line: 325, column: 50, scope: !377)
!407 = !DILocation(line: 328, column: 25, scope: !408)
!408 = distinct !DILexicalBlock(scope: !377, file: !92, line: 328, column: 25)
!409 = !DILocation(line: 328, column: 37, scope: !408)
!410 = !DILocation(line: 328, column: 29, scope: !408)
!411 = !DILocation(line: 328, column: 41, scope: !408)
!412 = !DILocation(line: 328, column: 46, scope: !408)
!413 = !DILocation(line: 329, column: 55, scope: !408)
!414 = !DILocation(line: 329, column: 46, scope: !408)
!415 = !DILocation(line: 329, column: 45, scope: !408)
!416 = !DILocation(line: 329, column: 34, scope: !408)
!417 = !DILocation(line: 329, column: 32, scope: !408)
!418 = !DILocation(line: 329, column: 25, scope: !408)
!419 = !DILocation(line: 329, column: 61, scope: !408)
!420 = !DILocation(line: 329, column: 69, scope: !408)
!421 = !DILocation(line: 330, column: 55, scope: !408)
!422 = !DILocation(line: 330, column: 46, scope: !408)
!423 = !DILocation(line: 330, column: 45, scope: !408)
!424 = !DILocation(line: 330, column: 34, scope: !408)
!425 = !DILocation(line: 330, column: 32, scope: !408)
!426 = !DILocation(line: 330, column: 25, scope: !408)
!427 = !DILocation(line: 330, column: 61, scope: !408)
!428 = !DILocation(line: 330, column: 69, scope: !408)
!429 = !DILocation(line: 331, column: 55, scope: !408)
!430 = !DILocation(line: 331, column: 46, scope: !408)
!431 = !DILocation(line: 331, column: 45, scope: !408)
!432 = !DILocation(line: 331, column: 34, scope: !408)
!433 = !DILocation(line: 331, column: 32, scope: !408)
!434 = !DILocation(line: 331, column: 25, scope: !408)
!435 = !DILocation(line: 331, column: 61, scope: !408)
!436 = !DILocation(line: 331, column: 69, scope: !408)
!437 = !DILocation(line: 332, column: 55, scope: !408)
!438 = !DILocation(line: 332, column: 46, scope: !408)
!439 = !DILocation(line: 332, column: 45, scope: !408)
!440 = !DILocation(line: 332, column: 34, scope: !408)
!441 = !DILocation(line: 332, column: 32, scope: !408)
!442 = !DILocation(line: 332, column: 25, scope: !408)
!443 = !DILocation(line: 332, column: 61, scope: !408)
!444 = !DILocation(line: 328, column: 25, scope: !377)
!445 = !DILocation(line: 334, column: 34, scope: !446)
!446 = distinct !DILexicalBlock(scope: !408, file: !92, line: 333, column: 21)
!447 = !DILocation(line: 334, column: 80, scope: !446)
!448 = !DILocation(line: 334, column: 94, scope: !446)
!449 = !DILocation(line: 334, column: 25, scope: !446)
!450 = !DILocation(line: 335, column: 25, scope: !446)
!451 = !DILocation(line: 338, column: 30, scope: !377)
!452 = !DILocation(line: 338, column: 36, scope: !377)
!453 = !DILocation(line: 338, column: 44, scope: !377)
!454 = !DILocation(line: 338, column: 42, scope: !377)
!455 = !DILocation(line: 338, column: 29, scope: !377)
!456 = !DILocation(line: 338, column: 27, scope: !377)
!457 = !DILocation(line: 339, column: 30, scope: !377)
!458 = !DILocation(line: 339, column: 36, scope: !377)
!459 = !DILocation(line: 339, column: 44, scope: !377)
!460 = !DILocation(line: 339, column: 42, scope: !377)
!461 = !DILocation(line: 339, column: 29, scope: !377)
!462 = !DILocation(line: 339, column: 27, scope: !377)
!463 = !DILocation(line: 340, column: 30, scope: !377)
!464 = !DILocation(line: 340, column: 36, scope: !377)
!465 = !DILocation(line: 340, column: 44, scope: !377)
!466 = !DILocation(line: 340, column: 42, scope: !377)
!467 = !DILocation(line: 340, column: 27, scope: !377)
!468 = !DILocation(line: 342, column: 26, scope: !469)
!469 = distinct !DILexicalBlock(scope: !377, file: !92, line: 342, column: 25)
!470 = !DILocation(line: 342, column: 32, scope: !469)
!471 = !DILocation(line: 342, column: 42, scope: !469)
!472 = !DILocation(line: 342, column: 25, scope: !377)
!473 = !DILocalVariable(name: "uchar2", scope: !474, file: !92, line: 343, type: !315)
!474 = distinct !DILexicalBlock(scope: !469, file: !92, line: 342, column: 53)
!475 = !DILocation(line: 343, column: 36, scope: !474)
!476 = !DILocation(line: 345, column: 29, scope: !477)
!477 = distinct !DILexicalBlock(scope: !474, file: !92, line: 345, column: 29)
!478 = !DILocation(line: 345, column: 41, scope: !477)
!479 = !DILocation(line: 345, column: 33, scope: !477)
!480 = !DILocation(line: 345, column: 45, scope: !477)
!481 = !DILocation(line: 345, column: 50, scope: !477)
!482 = !DILocation(line: 345, column: 64, scope: !477)
!483 = !DILocation(line: 345, column: 55, scope: !477)
!484 = !DILocation(line: 345, column: 54, scope: !477)
!485 = !DILocation(line: 345, column: 53, scope: !477)
!486 = !DILocation(line: 345, column: 69, scope: !477)
!487 = !DILocation(line: 345, column: 77, scope: !477)
!488 = !DILocation(line: 345, column: 91, scope: !477)
!489 = !DILocation(line: 345, column: 82, scope: !477)
!490 = !DILocation(line: 345, column: 81, scope: !477)
!491 = !DILocation(line: 345, column: 80, scope: !477)
!492 = !DILocation(line: 345, column: 96, scope: !477)
!493 = !DILocation(line: 345, column: 103, scope: !477)
!494 = !DILocation(line: 346, column: 59, scope: !477)
!495 = !DILocation(line: 346, column: 50, scope: !477)
!496 = !DILocation(line: 346, column: 49, scope: !477)
!497 = !DILocation(line: 346, column: 38, scope: !477)
!498 = !DILocation(line: 346, column: 36, scope: !477)
!499 = !DILocation(line: 346, column: 29, scope: !477)
!500 = !DILocation(line: 346, column: 65, scope: !477)
!501 = !DILocation(line: 346, column: 73, scope: !477)
!502 = !DILocation(line: 347, column: 59, scope: !477)
!503 = !DILocation(line: 347, column: 50, scope: !477)
!504 = !DILocation(line: 347, column: 49, scope: !477)
!505 = !DILocation(line: 347, column: 38, scope: !477)
!506 = !DILocation(line: 347, column: 36, scope: !477)
!507 = !DILocation(line: 347, column: 29, scope: !477)
!508 = !DILocation(line: 347, column: 65, scope: !477)
!509 = !DILocation(line: 347, column: 73, scope: !477)
!510 = !DILocation(line: 348, column: 59, scope: !477)
!511 = !DILocation(line: 348, column: 50, scope: !477)
!512 = !DILocation(line: 348, column: 49, scope: !477)
!513 = !DILocation(line: 348, column: 38, scope: !477)
!514 = !DILocation(line: 348, column: 36, scope: !477)
!515 = !DILocation(line: 348, column: 29, scope: !477)
!516 = !DILocation(line: 348, column: 65, scope: !477)
!517 = !DILocation(line: 348, column: 73, scope: !477)
!518 = !DILocation(line: 349, column: 59, scope: !477)
!519 = !DILocation(line: 349, column: 50, scope: !477)
!520 = !DILocation(line: 349, column: 49, scope: !477)
!521 = !DILocation(line: 349, column: 38, scope: !477)
!522 = !DILocation(line: 349, column: 36, scope: !477)
!523 = !DILocation(line: 349, column: 29, scope: !477)
!524 = !DILocation(line: 349, column: 65, scope: !477)
!525 = !DILocation(line: 345, column: 29, scope: !474)
!526 = !DILocation(line: 351, column: 38, scope: !527)
!527 = distinct !DILexicalBlock(scope: !477, file: !92, line: 350, column: 25)
!528 = !DILocation(line: 351, column: 84, scope: !527)
!529 = !DILocation(line: 351, column: 98, scope: !527)
!530 = !DILocation(line: 351, column: 29, scope: !527)
!531 = !DILocation(line: 352, column: 29, scope: !527)
!532 = !DILocation(line: 355, column: 34, scope: !474)
!533 = !DILocation(line: 355, column: 40, scope: !474)
!534 = !DILocation(line: 355, column: 48, scope: !474)
!535 = !DILocation(line: 355, column: 46, scope: !474)
!536 = !DILocation(line: 355, column: 33, scope: !474)
!537 = !DILocation(line: 355, column: 31, scope: !474)
!538 = !DILocation(line: 356, column: 34, scope: !474)
!539 = !DILocation(line: 356, column: 40, scope: !474)
!540 = !DILocation(line: 356, column: 48, scope: !474)
!541 = !DILocation(line: 356, column: 46, scope: !474)
!542 = !DILocation(line: 356, column: 33, scope: !474)
!543 = !DILocation(line: 356, column: 31, scope: !474)
!544 = !DILocation(line: 357, column: 35, scope: !474)
!545 = !DILocation(line: 357, column: 41, scope: !474)
!546 = !DILocation(line: 357, column: 49, scope: !474)
!547 = !DILocation(line: 357, column: 47, scope: !474)
!548 = !DILocation(line: 357, column: 32, scope: !474)
!549 = !DILocation(line: 359, column: 46, scope: !474)
!550 = !DILocation(line: 359, column: 52, scope: !474)
!551 = !DILocation(line: 359, column: 61, scope: !474)
!552 = !DILocation(line: 359, column: 42, scope: !474)
!553 = !DILocation(line: 359, column: 71, scope: !474)
!554 = !DILocation(line: 359, column: 78, scope: !474)
!555 = !DILocation(line: 359, column: 68, scope: !474)
!556 = !DILocation(line: 359, column: 31, scope: !474)
!557 = !DILocation(line: 360, column: 21, scope: !474)
!558 = !DILocation(line: 362, column: 71, scope: !559)
!559 = distinct !DILexicalBlock(scope: !377, file: !92, line: 362, column: 25)
!560 = !DILocation(line: 362, column: 77, scope: !559)
!561 = !DILocation(line: 362, column: 25, scope: !377)
!562 = !DILocation(line: 364, column: 24, scope: !563)
!563 = distinct !DILexicalBlock(scope: !559, file: !92, line: 363, column: 21)
!564 = !DILocation(line: 364, column: 24, scope: !565)
!565 = distinct !DILexicalBlock(scope: !566, file: !92, line: 364, column: 24)
!566 = distinct !DILexicalBlock(scope: !563, file: !92, line: 364, column: 24)
!567 = !DILocation(line: 364, column: 24, scope: !566)
!568 = !DILocation(line: 365, column: 24, scope: !563)
!569 = !DILocation(line: 368, column: 25, scope: !570)
!570 = distinct !DILexicalBlock(scope: !377, file: !92, line: 368, column: 25)
!571 = !DILocation(line: 368, column: 31, scope: !570)
!572 = !DILocation(line: 368, column: 25, scope: !377)
!573 = !DILocation(line: 370, column: 35, scope: !574)
!574 = distinct !DILexicalBlock(scope: !575, file: !92, line: 370, column: 29)
!575 = distinct !DILexicalBlock(scope: !570, file: !92, line: 369, column: 21)
!576 = !DILocation(line: 370, column: 29, scope: !574)
!577 = !DILocation(line: 370, column: 29, scope: !575)
!578 = !DILocation(line: 371, column: 42, scope: !574)
!579 = !DILocation(line: 371, column: 28, scope: !574)
!580 = !DILocation(line: 373, column: 64, scope: !581)
!581 = distinct !DILexicalBlock(scope: !574, file: !92, line: 373, column: 25)
!582 = !DILocation(line: 373, column: 70, scope: !581)
!583 = !DILocation(line: 373, column: 61, scope: !581)
!584 = !DILocation(line: 373, column: 56, scope: !581)
!585 = !DILocation(line: 373, column: 28, scope: !581)
!586 = !DILocation(line: 373, column: 50, scope: !581)
!587 = !DILocation(line: 373, column: 54, scope: !581)
!588 = !DILocation(line: 374, column: 64, scope: !581)
!589 = !DILocation(line: 374, column: 70, scope: !581)
!590 = !DILocation(line: 374, column: 61, scope: !581)
!591 = !DILocation(line: 374, column: 56, scope: !581)
!592 = !DILocation(line: 374, column: 28, scope: !581)
!593 = !DILocation(line: 374, column: 50, scope: !581)
!594 = !DILocation(line: 374, column: 54, scope: !581)
!595 = !DILocation(line: 377, column: 25, scope: !575)
!596 = !DILocation(line: 380, column: 25, scope: !597)
!597 = distinct !DILexicalBlock(scope: !377, file: !92, line: 380, column: 25)
!598 = !DILocation(line: 380, column: 31, scope: !597)
!599 = !DILocation(line: 380, column: 25, scope: !377)
!600 = !DILocation(line: 381, column: 35, scope: !601)
!601 = distinct !DILexicalBlock(scope: !602, file: !92, line: 381, column: 29)
!602 = distinct !DILexicalBlock(scope: !597, file: !92, line: 380, column: 42)
!603 = !DILocation(line: 381, column: 29, scope: !601)
!604 = !DILocation(line: 381, column: 29, scope: !602)
!605 = !DILocation(line: 382, column: 42, scope: !601)
!606 = !DILocation(line: 382, column: 28, scope: !601)
!607 = !DILocation(line: 384, column: 64, scope: !608)
!608 = distinct !DILexicalBlock(scope: !601, file: !92, line: 384, column: 25)
!609 = !DILocation(line: 384, column: 70, scope: !608)
!610 = !DILocation(line: 384, column: 61, scope: !608)
!611 = !DILocation(line: 384, column: 56, scope: !608)
!612 = !DILocation(line: 384, column: 28, scope: !608)
!613 = !DILocation(line: 384, column: 50, scope: !608)
!614 = !DILocation(line: 384, column: 54, scope: !608)
!615 = !DILocation(line: 385, column: 65, scope: !608)
!616 = !DILocation(line: 385, column: 71, scope: !608)
!617 = !DILocation(line: 385, column: 77, scope: !608)
!618 = !DILocation(line: 385, column: 61, scope: !608)
!619 = !DILocation(line: 385, column: 56, scope: !608)
!620 = !DILocation(line: 385, column: 28, scope: !608)
!621 = !DILocation(line: 385, column: 50, scope: !608)
!622 = !DILocation(line: 385, column: 54, scope: !608)
!623 = !DILocation(line: 386, column: 64, scope: !608)
!624 = !DILocation(line: 386, column: 70, scope: !608)
!625 = !DILocation(line: 386, column: 61, scope: !608)
!626 = !DILocation(line: 386, column: 56, scope: !608)
!627 = !DILocation(line: 386, column: 28, scope: !608)
!628 = !DILocation(line: 386, column: 50, scope: !608)
!629 = !DILocation(line: 386, column: 54, scope: !608)
!630 = !DILocation(line: 389, column: 25, scope: !602)
!631 = !DILocation(line: 392, column: 31, scope: !632)
!632 = distinct !DILexicalBlock(scope: !377, file: !92, line: 392, column: 25)
!633 = !DILocation(line: 392, column: 25, scope: !632)
!634 = !DILocation(line: 392, column: 25, scope: !377)
!635 = !DILocation(line: 393, column: 38, scope: !632)
!636 = !DILocation(line: 393, column: 24, scope: !632)
!637 = !DILocation(line: 395, column: 60, scope: !638)
!638 = distinct !DILexicalBlock(scope: !632, file: !92, line: 395, column: 21)
!639 = !DILocation(line: 395, column: 66, scope: !638)
!640 = !DILocation(line: 395, column: 57, scope: !638)
!641 = !DILocation(line: 395, column: 52, scope: !638)
!642 = !DILocation(line: 395, column: 24, scope: !638)
!643 = !DILocation(line: 395, column: 46, scope: !638)
!644 = !DILocation(line: 395, column: 50, scope: !638)
!645 = !DILocation(line: 396, column: 61, scope: !638)
!646 = !DILocation(line: 396, column: 67, scope: !638)
!647 = !DILocation(line: 396, column: 74, scope: !638)
!648 = !DILocation(line: 396, column: 57, scope: !638)
!649 = !DILocation(line: 396, column: 52, scope: !638)
!650 = !DILocation(line: 396, column: 24, scope: !638)
!651 = !DILocation(line: 396, column: 46, scope: !638)
!652 = !DILocation(line: 396, column: 50, scope: !638)
!653 = !DILocation(line: 397, column: 61, scope: !638)
!654 = !DILocation(line: 397, column: 67, scope: !638)
!655 = !DILocation(line: 397, column: 73, scope: !638)
!656 = !DILocation(line: 397, column: 57, scope: !638)
!657 = !DILocation(line: 397, column: 52, scope: !638)
!658 = !DILocation(line: 397, column: 24, scope: !638)
!659 = !DILocation(line: 397, column: 46, scope: !638)
!660 = !DILocation(line: 397, column: 50, scope: !638)
!661 = !DILocation(line: 398, column: 60, scope: !638)
!662 = !DILocation(line: 398, column: 66, scope: !638)
!663 = !DILocation(line: 398, column: 57, scope: !638)
!664 = !DILocation(line: 398, column: 52, scope: !638)
!665 = !DILocation(line: 398, column: 24, scope: !638)
!666 = !DILocation(line: 398, column: 46, scope: !638)
!667 = !DILocation(line: 398, column: 50, scope: !638)
!668 = !DILocation(line: 401, column: 21, scope: !377)
!669 = !DILocation(line: 404, column: 22, scope: !377)
!670 = !DILocation(line: 404, column: 22, scope: !671)
!671 = distinct !DILexicalBlock(scope: !672, file: !92, line: 404, column: 22)
!672 = distinct !DILexicalBlock(scope: !377, file: !92, line: 404, column: 22)
!673 = !DILocation(line: 404, column: 22, scope: !672)
!674 = !DILocation(line: 405, column: 16, scope: !377)
!675 = !DILocation(line: 407, column: 16, scope: !373)
!676 = !DILocation(line: 410, column: 17, scope: !677)
!677 = distinct !DILexicalBlock(scope: !356, file: !92, line: 410, column: 17)
!678 = !DILocation(line: 410, column: 19, scope: !677)
!679 = !DILocation(line: 410, column: 17, scope: !356)
!680 = !DILocation(line: 412, column: 22, scope: !681)
!681 = distinct !DILexicalBlock(scope: !677, file: !92, line: 411, column: 13)
!682 = !DILocation(line: 413, column: 16, scope: !681)
!683 = !DILocation(line: 416, column: 17, scope: !684)
!684 = distinct !DILexicalBlock(scope: !356, file: !92, line: 416, column: 17)
!685 = !DILocation(line: 416, column: 19, scope: !684)
!686 = !DILocation(line: 416, column: 17, scope: !356)
!687 = !DILocation(line: 418, column: 27, scope: !688)
!688 = distinct !DILexicalBlock(scope: !689, file: !92, line: 418, column: 20)
!689 = distinct !DILexicalBlock(scope: !684, file: !92, line: 417, column: 13)
!690 = !DILocation(line: 418, column: 21, scope: !688)
!691 = !DILocation(line: 418, column: 20, scope: !689)
!692 = !DILocation(line: 419, column: 19, scope: !688)
!693 = !DILocation(line: 419, column: 27, scope: !688)
!694 = !DILocation(line: 419, column: 42, scope: !688)
!695 = !DILocation(line: 421, column: 22, scope: !689)
!696 = !DILocation(line: 422, column: 23, scope: !689)
!697 = !DILocation(line: 424, column: 24, scope: !689)
!698 = !DILocation(line: 424, column: 29, scope: !689)
!699 = !DILocation(line: 424, column: 16, scope: !689)
!700 = !DILocation(line: 428, column: 45, scope: !701)
!701 = distinct !DILexicalBlock(scope: !689, file: !92, line: 425, column: 16)
!702 = !DILocation(line: 428, column: 22, scope: !701)
!703 = !DILocation(line: 428, column: 27, scope: !701)
!704 = !DILocation(line: 428, column: 29, scope: !701)
!705 = !DILocation(line: 428, column: 36, scope: !701)
!706 = !DILocation(line: 428, column: 43, scope: !701)
!707 = !DILocation(line: 429, column: 28, scope: !701)
!708 = !DILocation(line: 431, column: 22, scope: !701)
!709 = !DILocation(line: 435, column: 32, scope: !710)
!710 = distinct !DILexicalBlock(scope: !701, file: !92, line: 435, column: 26)
!711 = !DILocation(line: 435, column: 26, scope: !710)
!712 = !DILocation(line: 435, column: 26, scope: !701)
!713 = !DILocalVariable(name: "chars", scope: !714, file: !92, line: 436, type: !37)
!714 = distinct !DILexicalBlock(scope: !710, file: !92, line: 435, column: 44)
!715 = !DILocation(line: 436, column: 37, scope: !714)
!716 = !DILocation(line: 436, column: 61, scope: !714)
!717 = !DILocation(line: 436, column: 66, scope: !714)
!718 = !DILocation(line: 436, column: 68, scope: !714)
!719 = !DILocation(line: 436, column: 75, scope: !714)
!720 = !DILocation(line: 436, column: 45, scope: !714)
!721 = !DILocation(line: 437, column: 37, scope: !714)
!722 = !DILocation(line: 437, column: 51, scope: !714)
!723 = !DILocation(line: 437, column: 25, scope: !714)
!724 = !DILocation(line: 437, column: 34, scope: !714)
!725 = !DILocation(line: 438, column: 22, scope: !714)
!726 = !DILocation(line: 442, column: 44, scope: !727)
!727 = distinct !DILexicalBlock(scope: !710, file: !92, line: 440, column: 22)
!728 = !DILocation(line: 442, column: 49, scope: !727)
!729 = !DILocation(line: 442, column: 59, scope: !727)
!730 = !DILocation(line: 441, column: 25, scope: !727)
!731 = !DILocation(line: 441, column: 30, scope: !727)
!732 = !DILocation(line: 441, column: 32, scope: !727)
!733 = !DILocation(line: 441, column: 39, scope: !727)
!734 = !DILocation(line: 441, column: 47, scope: !727)
!735 = !DILocation(line: 441, column: 52, scope: !727)
!736 = !DILocation(line: 441, column: 54, scope: !727)
!737 = !DILocation(line: 441, column: 61, scope: !727)
!738 = !DILocation(line: 441, column: 69, scope: !727)
!739 = !DILocation(line: 442, column: 28, scope: !727)
!740 = !DILocation(line: 445, column: 30, scope: !727)
!741 = !DILocation(line: 444, column: 25, scope: !727)
!742 = !DILocation(line: 444, column: 30, scope: !727)
!743 = !DILocation(line: 444, column: 32, scope: !727)
!744 = !DILocation(line: 444, column: 39, scope: !727)
!745 = !DILocation(line: 444, column: 47, scope: !727)
!746 = !DILocation(line: 444, column: 52, scope: !727)
!747 = !DILocation(line: 444, column: 54, scope: !727)
!748 = !DILocation(line: 444, column: 61, scope: !727)
!749 = !DILocation(line: 444, column: 69, scope: !727)
!750 = !DILocation(line: 445, column: 28, scope: !727)
!751 = !DILocation(line: 447, column: 73, scope: !727)
!752 = !DILocation(line: 447, column: 87, scope: !727)
!753 = !DILocation(line: 447, column: 43, scope: !727)
!754 = !DILocation(line: 447, column: 48, scope: !727)
!755 = !DILocation(line: 447, column: 58, scope: !727)
!756 = !DILocation(line: 447, column: 70, scope: !727)
!757 = !DILocation(line: 450, column: 28, scope: !701)
!758 = !DILocation(line: 451, column: 22, scope: !701)
!759 = !DILocation(line: 454, column: 22, scope: !701)
!760 = !DILocation(line: 456, column: 13, scope: !689)
!761 = !DILocation(line: 459, column: 16, scope: !762)
!762 = distinct !DILexicalBlock(scope: !684, file: !92, line: 458, column: 13)
!763 = !DILocation(line: 459, column: 16, scope: !764)
!764 = distinct !DILexicalBlock(scope: !765, file: !92, line: 459, column: 16)
!765 = distinct !DILexicalBlock(scope: !762, file: !92, line: 459, column: 16)
!766 = !DILocation(line: 459, column: 16, scope: !765)
!767 = !DILocation(line: 460, column: 16, scope: !762)
!768 = !DILocation(line: 462, column: 10, scope: !356)
!769 = !DILocation(line: 464, column: 20, scope: !770)
!770 = distinct !DILexicalBlock(scope: !340, file: !92, line: 464, column: 14)
!771 = !DILocation(line: 464, column: 29, scope: !770)
!772 = !DILocation(line: 464, column: 38, scope: !770)
!773 = !DILocation(line: 464, column: 14, scope: !340)
!774 = !DILocation(line: 466, column: 17, scope: !775)
!775 = distinct !DILexicalBlock(scope: !776, file: !92, line: 466, column: 17)
!776 = distinct !DILexicalBlock(scope: !770, file: !92, line: 465, column: 10)
!777 = !DILocation(line: 466, column: 23, scope: !775)
!778 = !DILocation(line: 466, column: 17, scope: !776)
!779 = !DILocation(line: 468, column: 20, scope: !780)
!780 = distinct !DILexicalBlock(scope: !781, file: !92, line: 468, column: 20)
!781 = distinct !DILexicalBlock(scope: !775, file: !92, line: 467, column: 13)
!782 = !DILocation(line: 468, column: 26, scope: !780)
!783 = !DILocation(line: 468, column: 20, scope: !781)
!784 = !DILocation(line: 470, column: 23, scope: !785)
!785 = distinct !DILexicalBlock(scope: !786, file: !92, line: 470, column: 23)
!786 = distinct !DILexicalBlock(scope: !780, file: !92, line: 469, column: 16)
!787 = !DILocation(line: 470, column: 25, scope: !785)
!788 = !DILocation(line: 470, column: 33, scope: !785)
!789 = !DILocation(line: 470, column: 36, scope: !785)
!790 = !DILocation(line: 470, column: 38, scope: !785)
!791 = !DILocation(line: 470, column: 46, scope: !785)
!792 = !DILocation(line: 470, column: 50, scope: !785)
!793 = !DILocation(line: 470, column: 23, scope: !786)
!794 = !DILocation(line: 472, column: 28, scope: !795)
!795 = distinct !DILexicalBlock(scope: !785, file: !92, line: 471, column: 19)
!796 = !DILocation(line: 473, column: 31, scope: !795)
!797 = !DILocation(line: 473, column: 22, scope: !795)
!798 = !DILocation(line: 474, column: 19, scope: !795)
!799 = !DILocation(line: 476, column: 19, scope: !786)
!800 = !DILocation(line: 479, column: 20, scope: !801)
!801 = distinct !DILexicalBlock(scope: !781, file: !92, line: 479, column: 20)
!802 = !DILocation(line: 479, column: 26, scope: !801)
!803 = !DILocation(line: 479, column: 20, scope: !781)
!804 = !DILocation(line: 481, column: 24, scope: !805)
!805 = distinct !DILexicalBlock(scope: !806, file: !92, line: 481, column: 23)
!806 = distinct !DILexicalBlock(scope: !801, file: !92, line: 480, column: 16)
!807 = !DILocation(line: 481, column: 23, scope: !806)
!808 = !DILocation(line: 482, column: 31, scope: !809)
!809 = distinct !DILexicalBlock(scope: !805, file: !92, line: 482, column: 19)
!810 = !DILocation(line: 482, column: 80, scope: !809)
!811 = !DILocation(line: 482, column: 22, scope: !809)
!812 = !DILocation(line: 483, column: 22, scope: !809)
!813 = !DILocation(line: 486, column: 23, scope: !814)
!814 = distinct !DILexicalBlock(scope: !806, file: !92, line: 486, column: 23)
!815 = !DILocation(line: 486, column: 25, scope: !814)
!816 = !DILocation(line: 486, column: 32, scope: !814)
!817 = !DILocation(line: 486, column: 41, scope: !814)
!818 = !DILocation(line: 486, column: 48, scope: !814)
!819 = !DILocation(line: 486, column: 52, scope: !814)
!820 = !DILocation(line: 486, column: 45, scope: !814)
!821 = !DILocation(line: 486, column: 57, scope: !814)
!822 = !DILocation(line: 486, column: 66, scope: !814)
!823 = !DILocation(line: 486, column: 60, scope: !814)
!824 = !DILocation(line: 486, column: 74, scope: !814)
!825 = !DILocation(line: 486, column: 23, scope: !806)
!826 = !DILocation(line: 488, column: 28, scope: !827)
!827 = distinct !DILexicalBlock(scope: !814, file: !92, line: 487, column: 19)
!828 = !DILocation(line: 489, column: 31, scope: !827)
!829 = !DILocation(line: 489, column: 22, scope: !827)
!830 = !DILocation(line: 490, column: 19, scope: !827)
!831 = !DILocation(line: 492, column: 19, scope: !806)
!832 = !DILocation(line: 494, column: 13, scope: !781)
!833 = !DILocation(line: 495, column: 22, scope: !834)
!834 = distinct !DILexicalBlock(scope: !775, file: !92, line: 495, column: 22)
!835 = !DILocation(line: 495, column: 24, scope: !834)
!836 = !DILocation(line: 495, column: 22, scope: !775)
!837 = !DILocation(line: 497, column: 23, scope: !838)
!838 = distinct !DILexicalBlock(scope: !839, file: !92, line: 497, column: 20)
!839 = distinct !DILexicalBlock(scope: !834, file: !92, line: 496, column: 13)
!840 = !DILocation(line: 497, column: 29, scope: !838)
!841 = !DILocation(line: 497, column: 62, scope: !838)
!842 = !DILocation(line: 497, column: 65, scope: !838)
!843 = !DILocation(line: 497, column: 70, scope: !838)
!844 = !DILocation(line: 497, column: 75, scope: !838)
!845 = !DILocation(line: 497, column: 20, scope: !839)
!846 = !DILocation(line: 498, column: 28, scope: !847)
!847 = distinct !DILexicalBlock(scope: !838, file: !92, line: 498, column: 16)
!848 = !DILocation(line: 498, column: 70, scope: !847)
!849 = !DILocation(line: 498, column: 19, scope: !847)
!850 = !DILocation(line: 499, column: 19, scope: !847)
!851 = !DILocation(line: 502, column: 29, scope: !852)
!852 = distinct !DILexicalBlock(scope: !839, file: !92, line: 502, column: 20)
!853 = !DILocation(line: 502, column: 20, scope: !852)
!854 = !DILocation(line: 502, column: 36, scope: !852)
!855 = !DILocation(line: 502, column: 33, scope: !852)
!856 = !DILocation(line: 502, column: 20, scope: !839)
!857 = !DILocation(line: 503, column: 28, scope: !858)
!858 = distinct !DILexicalBlock(scope: !852, file: !92, line: 503, column: 16)
!859 = !DILocation(line: 503, column: 60, scope: !858)
!860 = !DILocation(line: 503, column: 19, scope: !858)
!861 = !DILocation(line: 504, column: 19, scope: !858)
!862 = !DILocation(line: 507, column: 35, scope: !839)
!863 = !DILocation(line: 507, column: 28, scope: !839)
!864 = !DILocation(line: 507, column: 26, scope: !839)
!865 = !DILocation(line: 507, column: 24, scope: !839)
!866 = !DILocation(line: 507, column: 16, scope: !839)
!867 = !DILocation(line: 510, column: 28, scope: !868)
!868 = distinct !DILexicalBlock(scope: !839, file: !92, line: 508, column: 16)
!869 = !DILocation(line: 511, column: 22, scope: !868)
!870 = !DILocation(line: 514, column: 28, scope: !868)
!871 = !DILocation(line: 515, column: 22, scope: !868)
!872 = !DILocation(line: 518, column: 31, scope: !868)
!873 = !DILocation(line: 518, column: 92, scope: !868)
!874 = !DILocation(line: 518, column: 106, scope: !868)
!875 = !DILocation(line: 518, column: 22, scope: !868)
!876 = !DILocation(line: 519, column: 22, scope: !868)
!877 = !DILocation(line: 522, column: 10, scope: !776)
!878 = !DILocation(line: 524, column: 14, scope: !879)
!879 = distinct !DILexicalBlock(scope: !340, file: !92, line: 524, column: 14)
!880 = !DILocation(line: 524, column: 20, scope: !879)
!881 = !DILocation(line: 524, column: 14, scope: !340)
!882 = !DILocation(line: 526, column: 18, scope: !883)
!883 = distinct !DILexicalBlock(scope: !884, file: !92, line: 526, column: 17)
!884 = distinct !DILexicalBlock(scope: !879, file: !92, line: 525, column: 10)
!885 = !DILocation(line: 526, column: 17, scope: !884)
!886 = !DILocation(line: 527, column: 16, scope: !883)
!887 = !DILocation(line: 529, column: 21, scope: !884)
!888 = !DILocation(line: 529, column: 13, scope: !884)
!889 = !DILocation(line: 531, column: 16, scope: !890)
!890 = distinct !DILexicalBlock(scope: !884, file: !92, line: 530, column: 13)
!891 = !DILocation(line: 532, column: 19, scope: !890)
!892 = !DILocation(line: 536, column: 28, scope: !890)
!893 = !DILocation(line: 537, column: 28, scope: !890)
!894 = !DILocation(line: 537, column: 42, scope: !890)
!895 = !DILocation(line: 536, column: 19, scope: !890)
!896 = !DILocation(line: 539, column: 19, scope: !890)
!897 = !DILocation(line: 543, column: 14, scope: !898)
!898 = distinct !DILexicalBlock(scope: !340, file: !92, line: 543, column: 14)
!899 = !DILocation(line: 543, column: 20, scope: !898)
!900 = !DILocation(line: 543, column: 14, scope: !340)
!901 = !DILocation(line: 545, column: 21, scope: !902)
!902 = distinct !DILexicalBlock(scope: !898, file: !92, line: 544, column: 10)
!903 = !DILocation(line: 545, column: 13, scope: !902)
!904 = !DILocation(line: 547, column: 16, scope: !905)
!905 = distinct !DILexicalBlock(scope: !902, file: !92, line: 546, column: 13)
!906 = !DILocation(line: 548, column: 19, scope: !905)
!907 = !DILocation(line: 552, column: 23, scope: !908)
!908 = distinct !DILexicalBlock(scope: !905, file: !92, line: 552, column: 23)
!909 = !DILocation(line: 552, column: 27, scope: !908)
!910 = !DILocation(line: 552, column: 30, scope: !908)
!911 = !DILocation(line: 552, column: 35, scope: !908)
!912 = !DILocation(line: 552, column: 40, scope: !908)
!913 = !DILocation(line: 552, column: 23, scope: !905)
!914 = !DILocation(line: 553, column: 31, scope: !908)
!915 = !DILocation(line: 553, column: 37, scope: !908)
!916 = !DILocation(line: 553, column: 78, scope: !908)
!917 = !DILocation(line: 553, column: 28, scope: !908)
!918 = !DILocation(line: 553, column: 22, scope: !908)
!919 = !DILocation(line: 555, column: 31, scope: !920)
!920 = distinct !DILexicalBlock(scope: !908, file: !92, line: 555, column: 19)
!921 = !DILocation(line: 555, column: 63, scope: !920)
!922 = !DILocation(line: 555, column: 22, scope: !920)
!923 = !DILocation(line: 556, column: 22, scope: !920)
!924 = !DILocation(line: 559, column: 19, scope: !905)
!925 = !DILocation(line: 563, column: 23, scope: !926)
!926 = distinct !DILexicalBlock(scope: !905, file: !92, line: 563, column: 23)
!927 = !DILocation(line: 563, column: 29, scope: !926)
!928 = !DILocation(line: 563, column: 23, scope: !905)
!929 = !DILocation(line: 565, column: 26, scope: !930)
!930 = distinct !DILexicalBlock(scope: !931, file: !92, line: 565, column: 26)
!931 = distinct !DILexicalBlock(scope: !926, file: !92, line: 564, column: 19)
!932 = !DILocation(line: 565, column: 28, scope: !930)
!933 = !DILocation(line: 565, column: 26, scope: !931)
!934 = !DILocation(line: 566, column: 31, scope: !935)
!935 = distinct !DILexicalBlock(scope: !930, file: !92, line: 566, column: 22)
!936 = !DILocation(line: 567, column: 25, scope: !935)
!937 = !DILocation(line: 571, column: 34, scope: !938)
!938 = distinct !DILexicalBlock(scope: !930, file: !92, line: 570, column: 22)
!939 = !DILocation(line: 572, column: 34, scope: !938)
!940 = !DILocation(line: 572, column: 48, scope: !938)
!941 = !DILocation(line: 571, column: 25, scope: !938)
!942 = !DILocation(line: 574, column: 25, scope: !938)
!943 = !DILocation(line: 578, column: 23, scope: !944)
!944 = distinct !DILexicalBlock(scope: !905, file: !92, line: 578, column: 23)
!945 = !DILocation(line: 578, column: 29, scope: !944)
!946 = !DILocation(line: 578, column: 23, scope: !905)
!947 = !DILocation(line: 580, column: 26, scope: !948)
!948 = distinct !DILexicalBlock(scope: !949, file: !92, line: 580, column: 26)
!949 = distinct !DILexicalBlock(scope: !944, file: !92, line: 579, column: 19)
!950 = !DILocation(line: 580, column: 28, scope: !948)
!951 = !DILocation(line: 580, column: 26, scope: !949)
!952 = !DILocation(line: 581, column: 31, scope: !953)
!953 = distinct !DILexicalBlock(scope: !948, file: !92, line: 581, column: 22)
!954 = !DILocation(line: 582, column: 25, scope: !953)
!955 = !DILocation(line: 586, column: 34, scope: !956)
!956 = distinct !DILexicalBlock(scope: !948, file: !92, line: 585, column: 22)
!957 = !DILocation(line: 587, column: 34, scope: !956)
!958 = !DILocation(line: 587, column: 48, scope: !956)
!959 = !DILocation(line: 586, column: 25, scope: !956)
!960 = !DILocation(line: 589, column: 25, scope: !956)
!961 = !DILocation(line: 593, column: 25, scope: !905)
!962 = !DILocation(line: 595, column: 27, scope: !905)
!963 = !DILocation(line: 595, column: 19, scope: !905)
!964 = !DILocation(line: 599, column: 30, scope: !965)
!965 = distinct !DILexicalBlock(scope: !966, file: !92, line: 599, column: 29)
!966 = distinct !DILexicalBlock(scope: !905, file: !92, line: 596, column: 19)
!967 = !DILocation(line: 599, column: 29, scope: !966)
!968 = !DILocation(line: 600, column: 28, scope: !965)
!969 = !DILocation(line: 602, column: 25, scope: !966)
!970 = !DILocation(line: 606, column: 30, scope: !971)
!971 = distinct !DILexicalBlock(scope: !966, file: !92, line: 606, column: 29)
!972 = !DILocation(line: 606, column: 29, scope: !966)
!973 = !DILocation(line: 607, column: 28, scope: !971)
!974 = !DILocation(line: 609, column: 31, scope: !966)
!975 = !DILocation(line: 610, column: 25, scope: !966)
!976 = !DILocation(line: 614, column: 30, scope: !977)
!977 = distinct !DILexicalBlock(scope: !966, file: !92, line: 614, column: 29)
!978 = !DILocation(line: 614, column: 29, scope: !966)
!979 = !DILocation(line: 615, column: 28, scope: !977)
!980 = !DILocation(line: 617, column: 31, scope: !966)
!981 = !DILocation(line: 619, column: 34, scope: !966)
!982 = !DILocation(line: 619, column: 39, scope: !966)
!983 = !DILocation(line: 619, column: 41, scope: !966)
!984 = !DILocation(line: 619, column: 48, scope: !966)
!985 = !DILocation(line: 619, column: 32, scope: !966)
!986 = !DILocation(line: 620, column: 39, scope: !966)
!987 = !DILocation(line: 622, column: 25, scope: !966)
!988 = !DILocation(line: 626, column: 30, scope: !989)
!989 = distinct !DILexicalBlock(scope: !966, file: !92, line: 626, column: 29)
!990 = !DILocation(line: 626, column: 42, scope: !989)
!991 = !DILocation(line: 626, column: 34, scope: !989)
!992 = !DILocation(line: 626, column: 47, scope: !989)
!993 = !DILocation(line: 626, column: 52, scope: !989)
!994 = !DILocation(line: 626, column: 66, scope: !989)
!995 = !DILocation(line: 626, column: 57, scope: !989)
!996 = !DILocation(line: 626, column: 55, scope: !989)
!997 = !DILocation(line: 626, column: 71, scope: !989)
!998 = !DILocation(line: 626, column: 78, scope: !989)
!999 = !DILocation(line: 627, column: 40, scope: !989)
!1000 = !DILocation(line: 627, column: 31, scope: !989)
!1001 = !DILocation(line: 627, column: 29, scope: !989)
!1002 = !DILocation(line: 627, column: 45, scope: !989)
!1003 = !DILocation(line: 627, column: 52, scope: !989)
!1004 = !DILocation(line: 627, column: 66, scope: !989)
!1005 = !DILocation(line: 627, column: 57, scope: !989)
!1006 = !DILocation(line: 627, column: 55, scope: !989)
!1007 = !DILocation(line: 627, column: 71, scope: !989)
!1008 = !DILocation(line: 626, column: 29, scope: !966)
!1009 = !DILocation(line: 629, column: 28, scope: !1010)
!1010 = distinct !DILexicalBlock(scope: !989, file: !92, line: 628, column: 25)
!1011 = !DILocation(line: 632, column: 30, scope: !1012)
!1012 = distinct !DILexicalBlock(scope: !966, file: !92, line: 632, column: 29)
!1013 = !DILocation(line: 632, column: 29, scope: !966)
!1014 = !DILocation(line: 633, column: 28, scope: !1012)
!1015 = !DILocation(line: 635, column: 25, scope: !966)
!1016 = !DILocation(line: 635, column: 30, scope: !966)
!1017 = !DILocation(line: 635, column: 32, scope: !966)
!1018 = !DILocation(line: 635, column: 40, scope: !966)
!1019 = !DILocation(line: 637, column: 31, scope: !966)
!1020 = !DILocation(line: 638, column: 25, scope: !966)
!1021 = !DILocation(line: 642, column: 30, scope: !1022)
!1022 = distinct !DILexicalBlock(scope: !966, file: !92, line: 642, column: 29)
!1023 = !DILocation(line: 642, column: 42, scope: !1022)
!1024 = !DILocation(line: 642, column: 34, scope: !1022)
!1025 = !DILocation(line: 642, column: 47, scope: !1022)
!1026 = !DILocation(line: 642, column: 52, scope: !1022)
!1027 = !DILocation(line: 642, column: 66, scope: !1022)
!1028 = !DILocation(line: 642, column: 57, scope: !1022)
!1029 = !DILocation(line: 642, column: 55, scope: !1022)
!1030 = !DILocation(line: 642, column: 71, scope: !1022)
!1031 = !DILocation(line: 642, column: 78, scope: !1022)
!1032 = !DILocation(line: 643, column: 40, scope: !1022)
!1033 = !DILocation(line: 643, column: 31, scope: !1022)
!1034 = !DILocation(line: 643, column: 29, scope: !1022)
!1035 = !DILocation(line: 643, column: 45, scope: !1022)
!1036 = !DILocation(line: 643, column: 52, scope: !1022)
!1037 = !DILocation(line: 643, column: 66, scope: !1022)
!1038 = !DILocation(line: 643, column: 57, scope: !1022)
!1039 = !DILocation(line: 643, column: 55, scope: !1022)
!1040 = !DILocation(line: 643, column: 71, scope: !1022)
!1041 = !DILocation(line: 643, column: 78, scope: !1022)
!1042 = !DILocation(line: 644, column: 40, scope: !1022)
!1043 = !DILocation(line: 644, column: 31, scope: !1022)
!1044 = !DILocation(line: 644, column: 29, scope: !1022)
!1045 = !DILocation(line: 644, column: 45, scope: !1022)
!1046 = !DILocation(line: 642, column: 29, scope: !966)
!1047 = !DILocation(line: 646, column: 28, scope: !1048)
!1048 = distinct !DILexicalBlock(scope: !1022, file: !92, line: 645, column: 25)
!1049 = !DILocation(line: 649, column: 30, scope: !1050)
!1050 = distinct !DILexicalBlock(scope: !966, file: !92, line: 649, column: 29)
!1051 = !DILocation(line: 649, column: 29, scope: !966)
!1052 = !DILocation(line: 650, column: 28, scope: !1050)
!1053 = !DILocation(line: 652, column: 31, scope: !966)
!1054 = !DILocation(line: 653, column: 25, scope: !966)
!1055 = !DILocation(line: 657, column: 30, scope: !1056)
!1056 = distinct !DILexicalBlock(scope: !966, file: !92, line: 657, column: 29)
!1057 = !DILocation(line: 657, column: 42, scope: !1056)
!1058 = !DILocation(line: 657, column: 34, scope: !1056)
!1059 = !DILocation(line: 657, column: 47, scope: !1056)
!1060 = !DILocation(line: 657, column: 52, scope: !1056)
!1061 = !DILocation(line: 657, column: 66, scope: !1056)
!1062 = !DILocation(line: 657, column: 57, scope: !1056)
!1063 = !DILocation(line: 657, column: 55, scope: !1056)
!1064 = !DILocation(line: 657, column: 71, scope: !1056)
!1065 = !DILocation(line: 657, column: 78, scope: !1056)
!1066 = !DILocation(line: 658, column: 40, scope: !1056)
!1067 = !DILocation(line: 658, column: 31, scope: !1056)
!1068 = !DILocation(line: 658, column: 29, scope: !1056)
!1069 = !DILocation(line: 658, column: 45, scope: !1056)
!1070 = !DILocation(line: 658, column: 52, scope: !1056)
!1071 = !DILocation(line: 658, column: 66, scope: !1056)
!1072 = !DILocation(line: 658, column: 57, scope: !1056)
!1073 = !DILocation(line: 658, column: 55, scope: !1056)
!1074 = !DILocation(line: 658, column: 71, scope: !1056)
!1075 = !DILocation(line: 657, column: 29, scope: !966)
!1076 = !DILocation(line: 660, column: 28, scope: !1077)
!1077 = distinct !DILexicalBlock(scope: !1056, file: !92, line: 659, column: 25)
!1078 = !DILocation(line: 663, column: 30, scope: !1079)
!1079 = distinct !DILexicalBlock(scope: !966, file: !92, line: 663, column: 29)
!1080 = !DILocation(line: 663, column: 29, scope: !966)
!1081 = !DILocation(line: 664, column: 28, scope: !1079)
!1082 = !DILocation(line: 666, column: 31, scope: !966)
!1083 = !DILocation(line: 667, column: 25, scope: !966)
!1084 = !DILocation(line: 671, column: 29, scope: !1085)
!1085 = distinct !DILexicalBlock(scope: !966, file: !92, line: 671, column: 29)
!1086 = !DILocation(line: 671, column: 57, scope: !1085)
!1087 = !DILocation(line: 671, column: 60, scope: !1085)
!1088 = !DILocation(line: 671, column: 62, scope: !1085)
!1089 = !DILocation(line: 671, column: 29, scope: !966)
!1090 = !DILocation(line: 673, column: 33, scope: !1091)
!1091 = distinct !DILexicalBlock(scope: !1092, file: !92, line: 673, column: 32)
!1092 = distinct !DILexicalBlock(scope: !1085, file: !92, line: 672, column: 25)
!1093 = !DILocation(line: 673, column: 32, scope: !1092)
!1094 = !DILocation(line: 674, column: 31, scope: !1091)
!1095 = !DILocation(line: 676, column: 39, scope: !1096)
!1096 = distinct !DILexicalBlock(scope: !1092, file: !92, line: 676, column: 32)
!1097 = !DILocation(line: 676, column: 33, scope: !1096)
!1098 = !DILocation(line: 676, column: 32, scope: !1092)
!1099 = !DILocation(line: 678, column: 31, scope: !1100)
!1100 = distinct !DILexicalBlock(scope: !1096, file: !92, line: 677, column: 28)
!1101 = !DILocation(line: 678, column: 38, scope: !1100)
!1102 = !DILocation(line: 678, column: 66, scope: !1100)
!1103 = !DILocation(line: 678, column: 69, scope: !1100)
!1104 = !DILocation(line: 678, column: 71, scope: !1100)
!1105 = !DILocation(line: 678, column: 78, scope: !1100)
!1106 = !DILocation(line: 678, column: 81, scope: !1100)
!1107 = !DILocation(line: 678, column: 83, scope: !1100)
!1108 = !DILocation(line: 679, column: 41, scope: !1100)
!1109 = !DILocation(line: 679, column: 44, scope: !1100)
!1110 = !DILocation(line: 679, column: 46, scope: !1100)
!1111 = !DILocation(line: 679, column: 53, scope: !1100)
!1112 = !DILocation(line: 679, column: 56, scope: !1100)
!1113 = !DILocation(line: 679, column: 58, scope: !1100)
!1114 = !DILocation(line: 679, column: 65, scope: !1100)
!1115 = !DILocation(line: 679, column: 68, scope: !1100)
!1116 = !DILocation(line: 679, column: 70, scope: !1100)
!1117 = !DILocation(line: 681, column: 49, scope: !1118)
!1118 = distinct !DILexicalBlock(scope: !1119, file: !92, line: 681, column: 39)
!1119 = distinct !DILexicalBlock(scope: !1100, file: !92, line: 680, column: 31)
!1120 = !DILocation(line: 681, column: 40, scope: !1118)
!1121 = !DILocation(line: 681, column: 57, scope: !1118)
!1122 = !DILocation(line: 681, column: 54, scope: !1118)
!1123 = !DILocation(line: 681, column: 39, scope: !1119)
!1124 = !DILocation(line: 683, column: 39, scope: !1125)
!1125 = distinct !DILexicalBlock(scope: !1118, file: !92, line: 682, column: 34)
!1126 = !DILocation(line: 684, column: 37, scope: !1125)
!1127 = !DILocation(line: 687, column: 45, scope: !1119)
!1128 = !DILocation(line: 687, column: 38, scope: !1119)
!1129 = !DILocation(line: 687, column: 36, scope: !1119)
!1130 = distinct !{!1130, !1099, !1131, !1132}
!1131 = !DILocation(line: 688, column: 31, scope: !1100)
!1132 = !{!"llvm.loop.mustprogress"}
!1133 = !DILocation(line: 690, column: 37, scope: !1100)
!1134 = !DILocation(line: 691, column: 31, scope: !1100)
!1135 = !DILocation(line: 694, column: 34, scope: !1092)
!1136 = !DILocation(line: 698, column: 39, scope: !1092)
!1137 = !DILocation(line: 699, column: 41, scope: !1092)
!1138 = !DILocation(line: 700, column: 34, scope: !1092)
!1139 = !DILocation(line: 702, column: 32, scope: !1140)
!1140 = distinct !DILexicalBlock(scope: !1092, file: !92, line: 702, column: 32)
!1141 = !DILocation(line: 702, column: 34, scope: !1140)
!1142 = !DILocation(line: 702, column: 32, scope: !1092)
!1143 = !DILocation(line: 704, column: 37, scope: !1144)
!1144 = distinct !DILexicalBlock(scope: !1140, file: !92, line: 703, column: 28)
!1145 = !DILocation(line: 705, column: 31, scope: !1144)
!1146 = !DILocation(line: 708, column: 34, scope: !1092)
!1147 = !DILocation(line: 709, column: 28, scope: !1092)
!1148 = !DILocation(line: 712, column: 37, scope: !1149)
!1149 = distinct !DILexicalBlock(scope: !1085, file: !92, line: 712, column: 25)
!1150 = !DILocation(line: 712, column: 89, scope: !1149)
!1151 = !DILocation(line: 712, column: 103, scope: !1149)
!1152 = !DILocation(line: 712, column: 28, scope: !1149)
!1153 = !DILocation(line: 713, column: 28, scope: !1149)
!1154 = !DILocation(line: 716, column: 13, scope: !905)
!1155 = !DILocation(line: 717, column: 10, scope: !902)
!1156 = !DILocation(line: 720, column: 21, scope: !1157)
!1157 = distinct !DILexicalBlock(scope: !898, file: !92, line: 719, column: 10)
!1158 = !DILocation(line: 720, column: 26, scope: !1157)
!1159 = !DILocation(line: 720, column: 13, scope: !1157)
!1160 = !DILocation(line: 724, column: 24, scope: !1161)
!1161 = distinct !DILexicalBlock(scope: !1157, file: !92, line: 721, column: 13)
!1162 = !DILocation(line: 724, column: 16, scope: !1161)
!1163 = !DILocation(line: 726, column: 19, scope: !1164)
!1164 = distinct !DILexicalBlock(scope: !1161, file: !92, line: 725, column: 16)
!1165 = !DILocation(line: 727, column: 22, scope: !1164)
!1166 = !DILocation(line: 731, column: 26, scope: !1167)
!1167 = distinct !DILexicalBlock(scope: !1164, file: !92, line: 731, column: 26)
!1168 = !DILocation(line: 731, column: 32, scope: !1167)
!1169 = !DILocation(line: 731, column: 26, scope: !1164)
!1170 = !DILocation(line: 732, column: 34, scope: !1171)
!1171 = distinct !DILexicalBlock(scope: !1167, file: !92, line: 732, column: 22)
!1172 = !DILocation(line: 732, column: 76, scope: !1171)
!1173 = !DILocation(line: 732, column: 25, scope: !1171)
!1174 = !DILocation(line: 733, column: 25, scope: !1171)
!1175 = !DILocation(line: 736, column: 28, scope: !1164)
!1176 = !DILocation(line: 738, column: 45, scope: !1164)
!1177 = !DILocation(line: 738, column: 50, scope: !1164)
!1178 = !DILocation(line: 738, column: 60, scope: !1164)
!1179 = !DILocation(line: 738, column: 29, scope: !1164)
!1180 = !DILocation(line: 739, column: 36, scope: !1164)
!1181 = !DILocation(line: 741, column: 22, scope: !1164)
!1182 = !DILocation(line: 745, column: 31, scope: !1164)
!1183 = !DILocation(line: 745, column: 37, scope: !1164)
!1184 = !DILocation(line: 745, column: 58, scope: !1164)
!1185 = !DILocation(line: 745, column: 28, scope: !1164)
!1186 = !DILocation(line: 746, column: 22, scope: !1164)
!1187 = !DILocation(line: 750, column: 26, scope: !1188)
!1188 = distinct !DILexicalBlock(scope: !1164, file: !92, line: 750, column: 26)
!1189 = !DILocation(line: 750, column: 32, scope: !1188)
!1190 = !DILocation(line: 750, column: 26, scope: !1164)
!1191 = !DILocation(line: 752, column: 31, scope: !1192)
!1192 = distinct !DILexicalBlock(scope: !1188, file: !92, line: 751, column: 22)
!1193 = !DILocation(line: 753, column: 25, scope: !1192)
!1194 = !DILocation(line: 750, column: 34, scope: !1188)
!1195 = !DILocation(line: 757, column: 31, scope: !1164)
!1196 = !DILocation(line: 757, column: 74, scope: !1164)
!1197 = !DILocation(line: 757, column: 88, scope: !1164)
!1198 = !DILocation(line: 757, column: 22, scope: !1164)
!1199 = !DILocation(line: 758, column: 22, scope: !1164)
!1200 = !DILocation(line: 761, column: 16, scope: !1161)
!1201 = !DILocation(line: 766, column: 20, scope: !1202)
!1202 = distinct !DILexicalBlock(scope: !1161, file: !92, line: 766, column: 20)
!1203 = !DILocation(line: 766, column: 20, scope: !1161)
!1204 = !DILocation(line: 768, column: 19, scope: !1205)
!1205 = distinct !DILexicalBlock(scope: !1202, file: !92, line: 767, column: 16)
!1206 = !DILocation(line: 770, column: 23, scope: !1207)
!1207 = distinct !DILexicalBlock(scope: !1205, file: !92, line: 770, column: 23)
!1208 = !DILocation(line: 770, column: 28, scope: !1207)
!1209 = !DILocation(line: 770, column: 33, scope: !1207)
!1210 = !DILocation(line: 770, column: 49, scope: !1207)
!1211 = !DILocation(line: 770, column: 52, scope: !1207)
!1212 = !DILocation(line: 770, column: 58, scope: !1207)
!1213 = !DILocation(line: 770, column: 23, scope: !1205)
!1214 = !DILocation(line: 772, column: 29, scope: !1215)
!1215 = distinct !DILexicalBlock(scope: !1216, file: !92, line: 772, column: 26)
!1216 = distinct !DILexicalBlock(scope: !1207, file: !92, line: 771, column: 19)
!1217 = !DILocation(line: 772, column: 35, scope: !1215)
!1218 = !DILocation(line: 772, column: 26, scope: !1216)
!1219 = !DILocation(line: 774, column: 29, scope: !1220)
!1220 = distinct !DILexicalBlock(scope: !1221, file: !92, line: 774, column: 29)
!1221 = distinct !DILexicalBlock(scope: !1215, file: !92, line: 773, column: 22)
!1222 = !DILocation(line: 774, column: 35, scope: !1220)
!1223 = !DILocation(line: 774, column: 29, scope: !1221)
!1224 = !DILocation(line: 775, column: 37, scope: !1225)
!1225 = distinct !DILexicalBlock(scope: !1220, file: !92, line: 775, column: 25)
!1226 = !DILocation(line: 775, column: 81, scope: !1225)
!1227 = !DILocation(line: 775, column: 95, scope: !1225)
!1228 = !DILocation(line: 775, column: 28, scope: !1225)
!1229 = !DILocation(line: 776, column: 28, scope: !1225)
!1230 = !DILocation(line: 779, column: 29, scope: !1231)
!1231 = distinct !DILexicalBlock(scope: !1221, file: !92, line: 779, column: 29)
!1232 = !DILocation(line: 779, column: 40, scope: !1231)
!1233 = !DILocation(line: 779, column: 45, scope: !1231)
!1234 = !DILocation(line: 779, column: 48, scope: !1231)
!1235 = !DILocation(line: 779, column: 50, scope: !1231)
!1236 = !DILocation(line: 779, column: 29, scope: !1221)
!1237 = !DILocation(line: 780, column: 34, scope: !1231)
!1238 = !DILocation(line: 780, column: 28, scope: !1231)
!1239 = !DILocation(line: 781, column: 22, scope: !1221)
!1240 = !DILocation(line: 784, column: 31, scope: !1241)
!1241 = distinct !DILexicalBlock(scope: !1215, file: !92, line: 783, column: 22)
!1242 = !DILocation(line: 785, column: 34, scope: !1241)
!1243 = !DILocation(line: 785, column: 49, scope: !1241)
!1244 = !DILocation(line: 785, column: 51, scope: !1241)
!1245 = !DILocation(line: 785, column: 48, scope: !1241)
!1246 = !DILocation(line: 785, column: 46, scope: !1241)
!1247 = !DILocation(line: 785, column: 31, scope: !1241)
!1248 = !DILocation(line: 786, column: 25, scope: !1241)
!1249 = !DILocation(line: 789, column: 41, scope: !1250)
!1250 = distinct !DILexicalBlock(scope: !1216, file: !92, line: 789, column: 26)
!1251 = !DILocation(line: 789, column: 46, scope: !1250)
!1252 = !DILocation(line: 789, column: 48, scope: !1250)
!1253 = !DILocation(line: 789, column: 57, scope: !1250)
!1254 = !DILocation(line: 789, column: 26, scope: !1250)
!1255 = !DILocation(line: 789, column: 26, scope: !1216)
!1256 = !DILocalVariable(name: "integer", scope: !1257, file: !92, line: 791, type: !55)
!1257 = distinct !DILexicalBlock(scope: !1250, file: !92, line: 790, column: 22)
!1258 = !DILocation(line: 791, column: 36, scope: !1257)
!1259 = !DILocation(line: 791, column: 46, scope: !1257)
!1260 = !DILocation(line: 791, column: 51, scope: !1257)
!1261 = !DILocation(line: 791, column: 53, scope: !1257)
!1262 = !DILocation(line: 792, column: 25, scope: !1257)
!1263 = !DILocation(line: 793, column: 34, scope: !1257)
!1264 = !DILocation(line: 793, column: 25, scope: !1257)
!1265 = !DILocation(line: 794, column: 25, scope: !1257)
!1266 = !DILocation(line: 794, column: 30, scope: !1257)
!1267 = !DILocation(line: 794, column: 35, scope: !1257)
!1268 = !DILocation(line: 795, column: 46, scope: !1257)
!1269 = !DILocation(line: 795, column: 38, scope: !1257)
!1270 = !DILocation(line: 795, column: 25, scope: !1257)
!1271 = !DILocation(line: 795, column: 30, scope: !1257)
!1272 = !DILocation(line: 795, column: 32, scope: !1257)
!1273 = !DILocation(line: 795, column: 36, scope: !1257)
!1274 = !DILocation(line: 796, column: 25, scope: !1257)
!1275 = !DILocation(line: 799, column: 40, scope: !1216)
!1276 = !DILocation(line: 799, column: 45, scope: !1216)
!1277 = !DILocation(line: 799, column: 47, scope: !1216)
!1278 = !DILocation(line: 799, column: 55, scope: !1216)
!1279 = !DILocation(line: 799, column: 64, scope: !1216)
!1280 = !DILocation(line: 799, column: 66, scope: !1216)
!1281 = !DILocation(line: 799, column: 63, scope: !1216)
!1282 = !DILocation(line: 799, column: 61, scope: !1216)
!1283 = !DILocation(line: 799, column: 22, scope: !1216)
!1284 = !DILocation(line: 799, column: 27, scope: !1216)
!1285 = !DILocation(line: 799, column: 29, scope: !1216)
!1286 = !DILocation(line: 799, column: 37, scope: !1216)
!1287 = !DILocation(line: 800, column: 22, scope: !1216)
!1288 = !DILocation(line: 803, column: 23, scope: !1289)
!1289 = distinct !DILexicalBlock(scope: !1205, file: !92, line: 803, column: 23)
!1290 = !DILocation(line: 803, column: 29, scope: !1289)
!1291 = !DILocation(line: 803, column: 23, scope: !1205)
!1292 = !DILocation(line: 804, column: 38, scope: !1289)
!1293 = !DILocation(line: 804, column: 60, scope: !1289)
!1294 = !DILocation(line: 804, column: 62, scope: !1289)
!1295 = !DILocation(line: 804, column: 59, scope: !1289)
!1296 = !DILocation(line: 804, column: 57, scope: !1289)
!1297 = !DILocation(line: 804, column: 35, scope: !1289)
!1298 = !DILocation(line: 804, column: 22, scope: !1289)
!1299 = !DILocation(line: 806, column: 36, scope: !1289)
!1300 = !DILocation(line: 806, column: 41, scope: !1289)
!1301 = !DILocation(line: 806, column: 43, scope: !1289)
!1302 = !DILocation(line: 806, column: 56, scope: !1289)
!1303 = !DILocation(line: 806, column: 58, scope: !1289)
!1304 = !DILocation(line: 806, column: 55, scope: !1289)
!1305 = !DILocation(line: 806, column: 53, scope: !1289)
!1306 = !DILocation(line: 806, column: 22, scope: !1289)
!1307 = !DILocation(line: 806, column: 27, scope: !1289)
!1308 = !DILocation(line: 806, column: 29, scope: !1289)
!1309 = !DILocation(line: 806, column: 33, scope: !1289)
!1310 = !DILocation(line: 808, column: 19, scope: !1205)
!1311 = !DILocation(line: 811, column: 20, scope: !1312)
!1312 = distinct !DILexicalBlock(scope: !1161, file: !92, line: 811, column: 20)
!1313 = !DILocation(line: 811, column: 22, scope: !1312)
!1314 = !DILocation(line: 811, column: 29, scope: !1312)
!1315 = !DILocation(line: 811, column: 32, scope: !1312)
!1316 = !DILocation(line: 811, column: 34, scope: !1312)
!1317 = !DILocation(line: 811, column: 20, scope: !1161)
!1318 = !DILocation(line: 813, column: 25, scope: !1319)
!1319 = distinct !DILexicalBlock(scope: !1320, file: !92, line: 813, column: 24)
!1320 = distinct !DILexicalBlock(scope: !1312, file: !92, line: 812, column: 16)
!1321 = !DILocation(line: 813, column: 31, scope: !1319)
!1322 = !DILocation(line: 813, column: 45, scope: !1319)
!1323 = !DILocation(line: 813, column: 50, scope: !1319)
!1324 = !DILocation(line: 813, column: 56, scope: !1319)
!1325 = !DILocation(line: 813, column: 24, scope: !1320)
!1326 = !DILocation(line: 815, column: 28, scope: !1327)
!1327 = distinct !DILexicalBlock(scope: !1319, file: !92, line: 814, column: 19)
!1328 = !DILocation(line: 817, column: 26, scope: !1329)
!1329 = distinct !DILexicalBlock(scope: !1327, file: !92, line: 817, column: 26)
!1330 = !DILocation(line: 817, column: 28, scope: !1329)
!1331 = !DILocation(line: 817, column: 26, scope: !1327)
!1332 = !DILocation(line: 818, column: 31, scope: !1329)
!1333 = !DILocation(line: 818, column: 25, scope: !1329)
!1334 = !DILocation(line: 820, column: 22, scope: !1327)
!1335 = !DILocation(line: 822, column: 16, scope: !1320)
!1336 = !DILocation(line: 823, column: 25, scope: !1337)
!1337 = distinct !DILexicalBlock(scope: !1312, file: !92, line: 823, column: 25)
!1338 = !DILocation(line: 823, column: 27, scope: !1337)
!1339 = !DILocation(line: 823, column: 34, scope: !1337)
!1340 = !DILocation(line: 823, column: 37, scope: !1337)
!1341 = !DILocation(line: 823, column: 42, scope: !1337)
!1342 = !DILocation(line: 823, column: 47, scope: !1337)
!1343 = !DILocation(line: 823, column: 25, scope: !1312)
!1344 = !DILocalVariable(name: "integer", scope: !1345, file: !92, line: 825, type: !55)
!1345 = distinct !DILexicalBlock(scope: !1337, file: !92, line: 824, column: 16)
!1346 = !DILocation(line: 825, column: 30, scope: !1345)
!1347 = !DILocation(line: 825, column: 40, scope: !1345)
!1348 = !DILocation(line: 825, column: 45, scope: !1345)
!1349 = !DILocation(line: 825, column: 47, scope: !1345)
!1350 = !DILocation(line: 827, column: 24, scope: !1351)
!1351 = distinct !DILexicalBlock(scope: !1345, file: !92, line: 827, column: 23)
!1352 = !DILocation(line: 827, column: 23, scope: !1345)
!1353 = !DILocation(line: 828, column: 31, scope: !1354)
!1354 = distinct !DILexicalBlock(scope: !1351, file: !92, line: 828, column: 19)
!1355 = !DILocation(line: 828, column: 74, scope: !1354)
!1356 = !DILocation(line: 828, column: 22, scope: !1354)
!1357 = !DILocation(line: 829, column: 22, scope: !1354)
!1358 = !DILocation(line: 832, column: 19, scope: !1345)
!1359 = !DILocation(line: 832, column: 24, scope: !1345)
!1360 = !DILocation(line: 832, column: 29, scope: !1345)
!1361 = !DILocation(line: 833, column: 41, scope: !1345)
!1362 = !DILocation(line: 833, column: 32, scope: !1345)
!1363 = !DILocation(line: 833, column: 19, scope: !1345)
!1364 = !DILocation(line: 833, column: 24, scope: !1345)
!1365 = !DILocation(line: 833, column: 26, scope: !1345)
!1366 = !DILocation(line: 833, column: 30, scope: !1345)
!1367 = !DILocation(line: 835, column: 25, scope: !1345)
!1368 = !DILocation(line: 836, column: 30, scope: !1345)
!1369 = !DILocation(line: 837, column: 19, scope: !1345)
!1370 = !DILocation(line: 840, column: 23, scope: !1371)
!1371 = distinct !DILexicalBlock(scope: !1161, file: !92, line: 840, column: 20)
!1372 = !DILocation(line: 840, column: 29, scope: !1371)
!1373 = !DILocation(line: 840, column: 20, scope: !1161)
!1374 = !DILocation(line: 842, column: 23, scope: !1375)
!1375 = distinct !DILexicalBlock(scope: !1376, file: !92, line: 842, column: 23)
!1376 = distinct !DILexicalBlock(scope: !1371, file: !92, line: 841, column: 16)
!1377 = !DILocation(line: 842, column: 28, scope: !1375)
!1378 = !DILocation(line: 842, column: 33, scope: !1375)
!1379 = !DILocation(line: 842, column: 23, scope: !1376)
!1380 = !DILocation(line: 844, column: 27, scope: !1381)
!1381 = distinct !DILexicalBlock(scope: !1382, file: !92, line: 844, column: 26)
!1382 = distinct !DILexicalBlock(scope: !1375, file: !92, line: 843, column: 19)
!1383 = !DILocation(line: 844, column: 26, scope: !1382)
!1384 = !DILocation(line: 845, column: 34, scope: !1385)
!1385 = distinct !DILexicalBlock(scope: !1381, file: !92, line: 845, column: 22)
!1386 = !DILocation(line: 845, column: 76, scope: !1385)
!1387 = !DILocation(line: 845, column: 25, scope: !1385)
!1388 = !DILocation(line: 846, column: 25, scope: !1385)
!1389 = !DILocation(line: 849, column: 36, scope: !1382)
!1390 = !DILocation(line: 849, column: 62, scope: !1382)
!1391 = !DILocation(line: 849, column: 51, scope: !1382)
!1392 = !DILocation(line: 849, column: 49, scope: !1382)
!1393 = !DILocation(line: 849, column: 22, scope: !1382)
!1394 = !DILocation(line: 849, column: 27, scope: !1382)
!1395 = !DILocation(line: 849, column: 29, scope: !1382)
!1396 = !DILocation(line: 849, column: 33, scope: !1382)
!1397 = !DILocation(line: 850, column: 19, scope: !1382)
!1398 = !DILocation(line: 852, column: 23, scope: !1399)
!1399 = distinct !DILexicalBlock(scope: !1376, file: !92, line: 852, column: 23)
!1400 = !DILocation(line: 852, column: 25, scope: !1399)
!1401 = !DILocation(line: 852, column: 32, scope: !1399)
!1402 = !DILocation(line: 852, column: 35, scope: !1399)
!1403 = !DILocation(line: 852, column: 37, scope: !1399)
!1404 = !DILocation(line: 852, column: 23, scope: !1376)
!1405 = !DILocation(line: 854, column: 28, scope: !1406)
!1406 = distinct !DILexicalBlock(scope: !1399, file: !92, line: 853, column: 19)
!1407 = !DILocation(line: 856, column: 26, scope: !1408)
!1408 = distinct !DILexicalBlock(scope: !1406, file: !92, line: 856, column: 26)
!1409 = !DILocation(line: 856, column: 31, scope: !1408)
!1410 = !DILocation(line: 856, column: 36, scope: !1408)
!1411 = !DILocation(line: 856, column: 26, scope: !1406)
!1412 = !DILocalVariable(name: "integer", scope: !1413, file: !92, line: 858, type: !55)
!1413 = distinct !DILexicalBlock(scope: !1408, file: !92, line: 857, column: 22)
!1414 = !DILocation(line: 858, column: 36, scope: !1413)
!1415 = !DILocation(line: 858, column: 46, scope: !1413)
!1416 = !DILocation(line: 858, column: 51, scope: !1413)
!1417 = !DILocation(line: 858, column: 53, scope: !1413)
!1418 = !DILocation(line: 859, column: 25, scope: !1413)
!1419 = !DILocation(line: 859, column: 30, scope: !1413)
!1420 = !DILocation(line: 859, column: 35, scope: !1413)
!1421 = !DILocation(line: 860, column: 47, scope: !1413)
!1422 = !DILocation(line: 860, column: 38, scope: !1413)
!1423 = !DILocation(line: 860, column: 25, scope: !1413)
!1424 = !DILocation(line: 860, column: 30, scope: !1413)
!1425 = !DILocation(line: 860, column: 32, scope: !1413)
!1426 = !DILocation(line: 860, column: 36, scope: !1413)
!1427 = !DILocation(line: 861, column: 22, scope: !1413)
!1428 = !DILocation(line: 863, column: 33, scope: !1406)
!1429 = !DILocation(line: 864, column: 28, scope: !1406)
!1430 = !DILocation(line: 866, column: 22, scope: !1406)
!1431 = !DILocation(line: 868, column: 16, scope: !1376)
!1432 = !DILocation(line: 871, column: 24, scope: !1433)
!1433 = distinct !DILexicalBlock(scope: !1434, file: !92, line: 871, column: 23)
!1434 = distinct !DILexicalBlock(scope: !1371, file: !92, line: 870, column: 16)
!1435 = !DILocation(line: 871, column: 23, scope: !1434)
!1436 = !DILocation(line: 872, column: 31, scope: !1437)
!1437 = distinct !DILexicalBlock(scope: !1433, file: !92, line: 872, column: 19)
!1438 = !DILocation(line: 872, column: 73, scope: !1437)
!1439 = !DILocation(line: 872, column: 22, scope: !1437)
!1440 = !DILocation(line: 873, column: 22, scope: !1437)
!1441 = !DILocation(line: 876, column: 45, scope: !1434)
!1442 = !DILocation(line: 876, column: 51, scope: !1434)
!1443 = !DILocation(line: 876, column: 77, scope: !1434)
!1444 = !DILocation(line: 876, column: 75, scope: !1434)
!1445 = !DILocation(line: 876, column: 85, scope: !1434)
!1446 = !DILocation(line: 876, column: 33, scope: !1434)
!1447 = !DILocation(line: 876, column: 19, scope: !1434)
!1448 = !DILocation(line: 876, column: 24, scope: !1434)
!1449 = !DILocation(line: 876, column: 26, scope: !1434)
!1450 = !DILocation(line: 876, column: 30, scope: !1434)
!1451 = !DILocation(line: 879, column: 20, scope: !1452)
!1452 = distinct !DILexicalBlock(scope: !1161, file: !92, line: 879, column: 20)
!1453 = !DILocation(line: 879, column: 26, scope: !1452)
!1454 = !DILocation(line: 879, column: 20, scope: !1161)
!1455 = !DILocation(line: 881, column: 23, scope: !1456)
!1456 = distinct !DILexicalBlock(scope: !1457, file: !92, line: 881, column: 23)
!1457 = distinct !DILexicalBlock(scope: !1452, file: !92, line: 880, column: 16)
!1458 = !DILocation(line: 881, column: 28, scope: !1456)
!1459 = !DILocation(line: 881, column: 33, scope: !1456)
!1460 = !DILocation(line: 881, column: 23, scope: !1457)
!1461 = !DILocation(line: 882, column: 41, scope: !1456)
!1462 = !DILocation(line: 882, column: 46, scope: !1456)
!1463 = !DILocation(line: 882, column: 48, scope: !1456)
!1464 = !DILocation(line: 882, column: 39, scope: !1456)
!1465 = !DILocation(line: 882, column: 22, scope: !1456)
!1466 = !DILocation(line: 882, column: 27, scope: !1456)
!1467 = !DILocation(line: 882, column: 29, scope: !1456)
!1468 = !DILocation(line: 882, column: 37, scope: !1456)
!1469 = !DILocation(line: 884, column: 37, scope: !1456)
!1470 = !DILocation(line: 884, column: 42, scope: !1456)
!1471 = !DILocation(line: 884, column: 44, scope: !1456)
!1472 = !DILocation(line: 884, column: 35, scope: !1456)
!1473 = !DILocation(line: 884, column: 22, scope: !1456)
!1474 = !DILocation(line: 884, column: 27, scope: !1456)
!1475 = !DILocation(line: 884, column: 29, scope: !1456)
!1476 = !DILocation(line: 884, column: 33, scope: !1456)
!1477 = !DILocation(line: 885, column: 16, scope: !1457)
!1478 = !DILocation(line: 887, column: 22, scope: !1161)
!1479 = !DILocation(line: 888, column: 16, scope: !1161)
!1480 = !DILocation(line: 891, column: 16, scope: !1161)
!1481 = !DILocation(line: 895, column: 14, scope: !1482)
!1482 = distinct !DILexicalBlock(scope: !340, file: !92, line: 895, column: 14)
!1483 = !DILocation(line: 895, column: 20, scope: !1482)
!1484 = !DILocation(line: 895, column: 14, scope: !340)
!1485 = !DILocation(line: 897, column: 19, scope: !1486)
!1486 = distinct !DILexicalBlock(scope: !1482, file: !92, line: 896, column: 10)
!1487 = !DILocation(line: 898, column: 22, scope: !1486)
!1488 = !DILocation(line: 898, column: 13, scope: !1486)
!1489 = !DILocation(line: 899, column: 10, scope: !1486)
!1490 = !DILocation(line: 901, column: 14, scope: !1491)
!1491 = distinct !DILexicalBlock(scope: !340, file: !92, line: 901, column: 14)
!1492 = !DILocation(line: 901, column: 20, scope: !1491)
!1493 = !DILocation(line: 901, column: 14, scope: !340)
!1494 = !DILocation(line: 903, column: 22, scope: !1495)
!1495 = distinct !DILexicalBlock(scope: !1491, file: !92, line: 902, column: 10)
!1496 = !DILocation(line: 903, column: 28, scope: !1495)
!1497 = !DILocation(line: 903, column: 43, scope: !1495)
!1498 = !DILocation(line: 903, column: 19, scope: !1495)
!1499 = !DILocation(line: 905, column: 18, scope: !1500)
!1500 = distinct !DILexicalBlock(scope: !1495, file: !92, line: 905, column: 17)
!1501 = !DILocation(line: 905, column: 23, scope: !1500)
!1502 = !DILocation(line: 905, column: 17, scope: !1495)
!1503 = !DILocation(line: 909, column: 22, scope: !1504)
!1504 = distinct !DILexicalBlock(scope: !1500, file: !92, line: 906, column: 13)
!1505 = !DILocation(line: 910, column: 16, scope: !1504)
!1506 = !DILocation(line: 913, column: 17, scope: !1507)
!1507 = distinct !DILexicalBlock(scope: !1495, file: !92, line: 913, column: 17)
!1508 = !DILocation(line: 913, column: 22, scope: !1507)
!1509 = !DILocation(line: 913, column: 30, scope: !1507)
!1510 = !DILocation(line: 913, column: 35, scope: !1507)
!1511 = !DILocation(line: 913, column: 17, scope: !1495)
!1512 = !DILocation(line: 914, column: 22, scope: !1507)
!1513 = !DILocation(line: 914, column: 16, scope: !1507)
!1514 = !DILocation(line: 916, column: 24, scope: !1515)
!1515 = distinct !DILexicalBlock(scope: !1495, file: !92, line: 916, column: 17)
!1516 = !DILocation(line: 916, column: 18, scope: !1515)
!1517 = !DILocation(line: 916, column: 17, scope: !1495)
!1518 = !DILocalVariable(name: "parent", scope: !1519, file: !92, line: 918, type: !42)
!1519 = distinct !DILexicalBlock(scope: !1515, file: !92, line: 917, column: 13)
!1520 = !DILocation(line: 918, column: 29, scope: !1519)
!1521 = !DILocation(line: 918, column: 38, scope: !1519)
!1522 = !DILocation(line: 918, column: 43, scope: !1519)
!1523 = !DILocation(line: 920, column: 24, scope: !1519)
!1524 = !DILocation(line: 920, column: 32, scope: !1519)
!1525 = !DILocation(line: 920, column: 16, scope: !1519)
!1526 = !DILocation(line: 925, column: 59, scope: !1527)
!1527 = distinct !DILexicalBlock(scope: !1519, file: !92, line: 921, column: 16)
!1528 = !DILocation(line: 924, column: 22, scope: !1527)
!1529 = !DILocation(line: 924, column: 30, scope: !1527)
!1530 = !DILocation(line: 924, column: 32, scope: !1527)
!1531 = !DILocation(line: 924, column: 39, scope: !1527)
!1532 = !DILocation(line: 925, column: 26, scope: !1527)
!1533 = !DILocation(line: 925, column: 34, scope: !1527)
!1534 = !DILocation(line: 925, column: 36, scope: !1527)
!1535 = !DILocation(line: 925, column: 43, scope: !1527)
!1536 = !DILocation(line: 925, column: 51, scope: !1527)
!1537 = !DILocation(line: 925, column: 57, scope: !1527)
!1538 = !DILocation(line: 927, column: 22, scope: !1527)
!1539 = !DILocation(line: 932, column: 55, scope: !1527)
!1540 = !DILocation(line: 931, column: 22, scope: !1527)
!1541 = !DILocation(line: 931, column: 30, scope: !1527)
!1542 = !DILocation(line: 931, column: 32, scope: !1527)
!1543 = !DILocation(line: 931, column: 38, scope: !1527)
!1544 = !DILocation(line: 932, column: 29, scope: !1527)
!1545 = !DILocation(line: 932, column: 37, scope: !1527)
!1546 = !DILocation(line: 932, column: 39, scope: !1527)
!1547 = !DILocation(line: 932, column: 45, scope: !1527)
!1548 = !DILocation(line: 932, column: 53, scope: !1527)
!1549 = !DILocation(line: 934, column: 22, scope: !1527)
!1550 = !DILocation(line: 937, column: 22, scope: !1527)
!1551 = !DILocation(line: 939, column: 13, scope: !1519)
!1552 = !DILocation(line: 941, column: 22, scope: !1553)
!1553 = distinct !DILexicalBlock(scope: !1495, file: !92, line: 941, column: 18)
!1554 = !DILocation(line: 941, column: 27, scope: !1553)
!1555 = !DILocation(line: 941, column: 35, scope: !1553)
!1556 = !DILocation(line: 941, column: 37, scope: !1553)
!1557 = !DILocation(line: 941, column: 43, scope: !1553)
!1558 = !DILocation(line: 941, column: 19, scope: !1553)
!1559 = !DILocation(line: 941, column: 51, scope: !1553)
!1560 = !DILocation(line: 941, column: 18, scope: !1495)
!1561 = !DILocation(line: 942, column: 16, scope: !1553)
!1562 = !DILocation(line: 944, column: 19, scope: !1495)
!1563 = !DILocation(line: 944, column: 24, scope: !1495)
!1564 = !DILocation(line: 944, column: 17, scope: !1495)
!1565 = !DILocation(line: 946, column: 13, scope: !1495)
!1566 = !DILocation(line: 948, column: 7, scope: !340)
!1567 = !DILocation(line: 301, column: 41, scope: !341)
!1568 = !DILocation(line: 301, column: 32, scope: !341)
!1569 = !DILocation(line: 301, column: 7, scope: !341)
!1570 = distinct !{!1570, !1571, !1572}
!1571 = !DILocation(line: 301, column: 7, scope: !335)
!1572 = !DILocation(line: 948, column: 7, scope: !335)
!1573 = !DILocation(line: 950, column: 15, scope: !314)
!1574 = !DILocation(line: 950, column: 13, scope: !314)
!1575 = !DILocation(line: 951, column: 4, scope: !314)
!1576 = !DILocation(line: 289, column: 63, scope: !310)
!1577 = !DILocation(line: 289, column: 54, scope: !310)
!1578 = !DILocation(line: 289, column: 4, scope: !310)
!1579 = distinct !{!1579, !312, !1580, !1132}
!1580 = !DILocation(line: 951, column: 4, scope: !306)
!1581 = !DILocation(line: 953, column: 11, scope: !214)
!1582 = !DILocation(line: 953, column: 4, scope: !214)
!1583 = !DILabel(scope: !214, name: "e_unknown_value", file: !92, line: 955)
!1584 = !DILocation(line: 955, column: 1, scope: !214)
!1585 = !DILocation(line: 957, column: 13, scope: !214)
!1586 = !DILocation(line: 957, column: 44, scope: !214)
!1587 = !DILocation(line: 957, column: 4, scope: !214)
!1588 = !DILocation(line: 958, column: 4, scope: !214)
!1589 = !DILabel(scope: !214, name: "e_alloc_failure", file: !92, line: 960)
!1590 = !DILocation(line: 960, column: 1, scope: !214)
!1591 = !DILocation(line: 962, column: 12, scope: !214)
!1592 = !DILocation(line: 962, column: 4, scope: !214)
!1593 = !DILocation(line: 963, column: 4, scope: !214)
!1594 = !DILabel(scope: !214, name: "e_overflow", file: !92, line: 965)
!1595 = !DILocation(line: 965, column: 1, scope: !214)
!1596 = !DILocation(line: 967, column: 13, scope: !214)
!1597 = !DILocation(line: 967, column: 57, scope: !214)
!1598 = !DILocation(line: 967, column: 4, scope: !214)
!1599 = !DILocation(line: 968, column: 4, scope: !214)
!1600 = !DILabel(scope: !214, name: "e_failed", file: !92, line: 970)
!1601 = !DILocation(line: 970, column: 1, scope: !214)
!1602 = !DILocation(line: 972, column: 8, scope: !1603)
!1603 = distinct !DILexicalBlock(scope: !214, file: !92, line: 972, column: 8)
!1604 = !DILocation(line: 972, column: 8, scope: !214)
!1605 = !DILocation(line: 974, column: 11, scope: !1606)
!1606 = distinct !DILexicalBlock(scope: !1607, file: !92, line: 974, column: 11)
!1607 = distinct !DILexicalBlock(scope: !1603, file: !92, line: 973, column: 4)
!1608 = !DILocation(line: 974, column: 11, scope: !1607)
!1609 = !DILocation(line: 975, column: 18, scope: !1606)
!1610 = !DILocation(line: 975, column: 29, scope: !1606)
!1611 = !DILocation(line: 975, column: 10, scope: !1606)
!1612 = !DILocation(line: 977, column: 18, scope: !1606)
!1613 = !DILocation(line: 977, column: 10, scope: !1606)
!1614 = !DILocation(line: 978, column: 4, scope: !1607)
!1615 = !DILocation(line: 980, column: 14, scope: !1616)
!1616 = distinct !DILexicalBlock(scope: !214, file: !92, line: 980, column: 8)
!1617 = !DILocation(line: 980, column: 8, scope: !1616)
!1618 = !DILocation(line: 980, column: 8, scope: !214)
!1619 = !DILocation(line: 981, column: 15, scope: !1616)
!1620 = !DILocation(line: 981, column: 13, scope: !1616)
!1621 = !DILocation(line: 981, column: 7, scope: !1616)
!1622 = !DILocation(line: 983, column: 4, scope: !214)
!1623 = !DILocation(line: 983, column: 11, scope: !214)
!1624 = !DILocation(line: 985, column: 13, scope: !1625)
!1625 = distinct !DILexicalBlock(scope: !214, file: !92, line: 984, column: 4)
!1626 = !DILocation(line: 985, column: 20, scope: !1625)
!1627 = !DILocation(line: 985, column: 30, scope: !1625)
!1628 = !DILocation(line: 985, column: 11, scope: !1625)
!1629 = !DILocation(line: 986, column: 13, scope: !1625)
!1630 = !DILocation(line: 986, column: 22, scope: !1625)
!1631 = !DILocation(line: 986, column: 32, scope: !1625)
!1632 = !DILocation(line: 986, column: 45, scope: !1625)
!1633 = !DILocation(line: 986, column: 54, scope: !1625)
!1634 = !DILocation(line: 986, column: 7, scope: !1625)
!1635 = !DILocation(line: 987, column: 15, scope: !1625)
!1636 = !DILocation(line: 987, column: 13, scope: !1625)
!1637 = distinct !{!1637, !1622, !1638, !1132}
!1638 = !DILocation(line: 988, column: 4, scope: !214)
!1639 = !DILocation(line: 990, column: 15, scope: !1640)
!1640 = distinct !DILexicalBlock(scope: !214, file: !92, line: 990, column: 8)
!1641 = !DILocation(line: 990, column: 9, scope: !1640)
!1642 = !DILocation(line: 990, column: 8, scope: !214)
!1643 = !DILocation(line: 991, column: 34, scope: !1640)
!1644 = !DILocation(line: 991, column: 44, scope: !1640)
!1645 = !DILocation(line: 991, column: 7, scope: !1640)
!1646 = !DILocation(line: 993, column: 4, scope: !214)
!1647 = !DILocation(line: 994, column: 1, scope: !214)
!1648 = distinct !DISubprogram(name: "default_alloc", scope: !92, file: !92, line: 105, type: !189, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !136)
!1649 = !DILocalVariable(name: "size", arg: 1, scope: !1648, file: !92, line: 105, type: !143)
!1650 = !DILocation(line: 105, column: 37, scope: !1648)
!1651 = !DILocalVariable(name: "zero", arg: 2, scope: !1648, file: !92, line: 105, type: !38)
!1652 = !DILocation(line: 105, column: 47, scope: !1648)
!1653 = !DILocalVariable(name: "user_data", arg: 3, scope: !1648, file: !92, line: 105, type: !35)
!1654 = !DILocation(line: 105, column: 60, scope: !1648)
!1655 = !DILocation(line: 107, column: 10, scope: !1648)
!1656 = !DILocation(line: 108, column: 11, scope: !1648)
!1657 = !DILocation(line: 108, column: 29, scope: !1648)
!1658 = !DILocation(line: 108, column: 18, scope: !1648)
!1659 = !DILocation(line: 108, column: 45, scope: !1648)
!1660 = !DILocation(line: 108, column: 37, scope: !1648)
!1661 = !DILocation(line: 108, column: 4, scope: !1648)
!1662 = distinct !DISubprogram(name: "default_free", scope: !92, file: !92, line: 111, type: !193, scopeLine: 112, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !136)
!1663 = !DILocalVariable(name: "ptr", arg: 1, scope: !1662, file: !92, line: 111, type: !35)
!1664 = !DILocation(line: 111, column: 34, scope: !1662)
!1665 = !DILocalVariable(name: "user_data", arg: 2, scope: !1662, file: !92, line: 111, type: !35)
!1666 = !DILocation(line: 111, column: 46, scope: !1662)
!1667 = !DILocation(line: 113, column: 10, scope: !1662)
!1668 = !DILocation(line: 114, column: 10, scope: !1662)
!1669 = !DILocation(line: 114, column: 4, scope: !1662)
!1670 = !DILocation(line: 115, column: 1, scope: !1662)
!1671 = distinct !DISubprogram(name: "hex_value", scope: !92, file: !92, line: 72, type: !1672, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !136)
!1672 = !DISubroutineType(types: !1673)
!1673 = !{!36, !34}
!1674 = !DILocalVariable(name: "c", arg: 1, scope: !1671, file: !92, line: 72, type: !34)
!1675 = !DILocation(line: 72, column: 43, scope: !1671)
!1676 = !DILocation(line: 74, column: 8, scope: !1677)
!1677 = distinct !DILexicalBlock(scope: !1671, file: !92, line: 74, column: 8)
!1678 = !DILocation(line: 74, column: 8, scope: !1671)
!1679 = !DILocation(line: 75, column: 14, scope: !1677)
!1680 = !DILocation(line: 75, column: 16, scope: !1677)
!1681 = !DILocation(line: 75, column: 7, scope: !1677)
!1682 = !DILocation(line: 77, column: 12, scope: !1671)
!1683 = !DILocation(line: 77, column: 4, scope: !1671)
!1684 = !DILocation(line: 78, column: 27, scope: !1685)
!1685 = distinct !DILexicalBlock(scope: !1671, file: !92, line: 77, column: 15)
!1686 = !DILocation(line: 79, column: 27, scope: !1685)
!1687 = !DILocation(line: 80, column: 27, scope: !1685)
!1688 = !DILocation(line: 81, column: 27, scope: !1685)
!1689 = !DILocation(line: 82, column: 27, scope: !1685)
!1690 = !DILocation(line: 83, column: 27, scope: !1685)
!1691 = !DILocation(line: 84, column: 16, scope: !1685)
!1692 = !DILocation(line: 86, column: 1, scope: !1671)
!1693 = distinct !DISubprogram(name: "new_value", scope: !92, file: !92, line: 131, type: !1694, scopeLine: 134, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !136)
!1694 = !DISubroutineType(types: !1695)
!1695 = !{!38, !1696, !41, !41, !41, !49}
!1696 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !240, size: 64)
!1697 = !DILocalVariable(name: "state", arg: 1, scope: !1693, file: !92, line: 131, type: !1696)
!1698 = !DILocation(line: 131, column: 36, scope: !1693)
!1699 = !DILocalVariable(name: "top", arg: 2, scope: !1693, file: !92, line: 132, type: !41)
!1700 = !DILocation(line: 132, column: 37, scope: !1693)
!1701 = !DILocalVariable(name: "root", arg: 3, scope: !1693, file: !92, line: 132, type: !41)
!1702 = !DILocation(line: 132, column: 56, scope: !1693)
!1703 = !DILocalVariable(name: "alloc", arg: 4, scope: !1693, file: !92, line: 132, type: !41)
!1704 = !DILocation(line: 132, column: 76, scope: !1693)
!1705 = !DILocalVariable(name: "type", arg: 5, scope: !1693, file: !92, line: 133, type: !49)
!1706 = !DILocation(line: 133, column: 33, scope: !1693)
!1707 = !DILocalVariable(name: "value", scope: !1693, file: !92, line: 135, type: !42)
!1708 = !DILocation(line: 135, column: 17, scope: !1693)
!1709 = !DILocalVariable(name: "values_size", scope: !1693, file: !92, line: 136, type: !143)
!1710 = !DILocation(line: 136, column: 11, scope: !1693)
!1711 = !DILocation(line: 138, column: 9, scope: !1712)
!1712 = distinct !DILexicalBlock(scope: !1693, file: !92, line: 138, column: 8)
!1713 = !DILocation(line: 138, column: 16, scope: !1712)
!1714 = !DILocation(line: 138, column: 8, scope: !1693)
!1715 = !DILocation(line: 140, column: 23, scope: !1716)
!1716 = distinct !DILexicalBlock(scope: !1712, file: !92, line: 139, column: 4)
!1717 = !DILocation(line: 140, column: 22, scope: !1716)
!1718 = !DILocation(line: 140, column: 16, scope: !1716)
!1719 = !DILocation(line: 140, column: 20, scope: !1716)
!1720 = !DILocation(line: 140, column: 13, scope: !1716)
!1721 = !DILocation(line: 141, column: 18, scope: !1716)
!1722 = !DILocation(line: 141, column: 17, scope: !1716)
!1723 = !DILocation(line: 141, column: 26, scope: !1716)
!1724 = !DILocation(line: 141, column: 36, scope: !1716)
!1725 = !DILocation(line: 141, column: 8, scope: !1716)
!1726 = !DILocation(line: 141, column: 14, scope: !1716)
!1727 = !DILocation(line: 143, column: 13, scope: !1728)
!1728 = distinct !DILexicalBlock(scope: !1716, file: !92, line: 143, column: 11)
!1729 = !DILocation(line: 143, column: 12, scope: !1728)
!1730 = !DILocation(line: 143, column: 11, scope: !1716)
!1731 = !DILocation(line: 144, column: 18, scope: !1728)
!1732 = !DILocation(line: 144, column: 11, scope: !1728)
!1733 = !DILocation(line: 144, column: 16, scope: !1728)
!1734 = !DILocation(line: 144, column: 10, scope: !1728)
!1735 = !DILocation(line: 146, column: 15, scope: !1716)
!1736 = !DILocation(line: 146, column: 22, scope: !1716)
!1737 = !DILocation(line: 146, column: 7, scope: !1716)
!1738 = !DILocation(line: 150, column: 17, scope: !1739)
!1739 = distinct !DILexicalBlock(scope: !1740, file: !92, line: 150, column: 17)
!1740 = distinct !DILexicalBlock(scope: !1716, file: !92, line: 147, column: 7)
!1741 = !DILocation(line: 150, column: 24, scope: !1739)
!1742 = !DILocation(line: 150, column: 26, scope: !1739)
!1743 = !DILocation(line: 150, column: 32, scope: !1739)
!1744 = !DILocation(line: 150, column: 39, scope: !1739)
!1745 = !DILocation(line: 150, column: 17, scope: !1740)
!1746 = !DILocation(line: 151, column: 16, scope: !1739)
!1747 = !DILocation(line: 154, column: 17, scope: !1748)
!1748 = distinct !DILexicalBlock(scope: !1740, file: !92, line: 153, column: 17)
!1749 = !DILocation(line: 154, column: 24, scope: !1748)
!1750 = !DILocation(line: 154, column: 31, scope: !1748)
!1751 = !DILocation(line: 154, column: 33, scope: !1748)
!1752 = !DILocation(line: 154, column: 39, scope: !1748)
!1753 = !DILocation(line: 154, column: 46, scope: !1748)
!1754 = !DILocation(line: 153, column: 60, scope: !1748)
!1755 = !DILocation(line: 153, column: 44, scope: !1748)
!1756 = !DILocation(line: 153, column: 20, scope: !1748)
!1757 = !DILocation(line: 153, column: 27, scope: !1748)
!1758 = !DILocation(line: 153, column: 29, scope: !1748)
!1759 = !DILocation(line: 153, column: 35, scope: !1748)
!1760 = !DILocation(line: 153, column: 42, scope: !1748)
!1761 = !DILocation(line: 153, column: 17, scope: !1740)
!1762 = !DILocation(line: 156, column: 16, scope: !1763)
!1763 = distinct !DILexicalBlock(scope: !1748, file: !92, line: 155, column: 13)
!1764 = !DILocation(line: 159, column: 13, scope: !1740)
!1765 = !DILocation(line: 159, column: 20, scope: !1740)
!1766 = !DILocation(line: 159, column: 22, scope: !1740)
!1767 = !DILocation(line: 159, column: 28, scope: !1740)
!1768 = !DILocation(line: 159, column: 35, scope: !1740)
!1769 = !DILocation(line: 160, column: 13, scope: !1740)
!1770 = !DILocation(line: 164, column: 17, scope: !1771)
!1771 = distinct !DILexicalBlock(scope: !1740, file: !92, line: 164, column: 17)
!1772 = !DILocation(line: 164, column: 24, scope: !1771)
!1773 = !DILocation(line: 164, column: 26, scope: !1771)
!1774 = !DILocation(line: 164, column: 33, scope: !1771)
!1775 = !DILocation(line: 164, column: 40, scope: !1771)
!1776 = !DILocation(line: 164, column: 17, scope: !1740)
!1777 = !DILocation(line: 165, column: 16, scope: !1771)
!1778 = !DILocation(line: 167, column: 62, scope: !1740)
!1779 = !DILocation(line: 167, column: 69, scope: !1740)
!1780 = !DILocation(line: 167, column: 71, scope: !1740)
!1781 = !DILocation(line: 167, column: 78, scope: !1740)
!1782 = !DILocation(line: 167, column: 60, scope: !1740)
!1783 = !DILocation(line: 167, column: 25, scope: !1740)
!1784 = !DILocation(line: 171, column: 20, scope: !1785)
!1785 = distinct !DILexicalBlock(scope: !1740, file: !92, line: 169, column: 17)
!1786 = !DILocation(line: 171, column: 27, scope: !1785)
!1787 = !DILocation(line: 171, column: 54, scope: !1785)
!1788 = !DILocation(line: 171, column: 61, scope: !1785)
!1789 = !DILocation(line: 171, column: 63, scope: !1785)
!1790 = !DILocation(line: 171, column: 70, scope: !1785)
!1791 = !DILocation(line: 171, column: 42, scope: !1785)
!1792 = !DILocation(line: 171, column: 39, scope: !1785)
!1793 = !DILocation(line: 169, column: 67, scope: !1785)
!1794 = !DILocation(line: 169, column: 45, scope: !1785)
!1795 = !DILocation(line: 169, column: 20, scope: !1785)
!1796 = !DILocation(line: 169, column: 27, scope: !1785)
!1797 = !DILocation(line: 169, column: 29, scope: !1785)
!1798 = !DILocation(line: 169, column: 36, scope: !1785)
!1799 = !DILocation(line: 169, column: 43, scope: !1785)
!1800 = !DILocation(line: 169, column: 17, scope: !1740)
!1801 = !DILocation(line: 176, column: 16, scope: !1802)
!1802 = distinct !DILexicalBlock(scope: !1785, file: !92, line: 175, column: 13)
!1803 = !DILocation(line: 179, column: 63, scope: !1740)
!1804 = !DILocation(line: 179, column: 70, scope: !1740)
!1805 = !DILocation(line: 179, column: 72, scope: !1740)
!1806 = !DILocation(line: 179, column: 79, scope: !1740)
!1807 = !DILocation(line: 179, column: 54, scope: !1740)
!1808 = !DILocation(line: 179, column: 89, scope: !1740)
!1809 = !DILocation(line: 179, column: 87, scope: !1740)
!1810 = !DILocation(line: 179, column: 13, scope: !1740)
!1811 = !DILocation(line: 179, column: 20, scope: !1740)
!1812 = !DILocation(line: 179, column: 30, scope: !1740)
!1813 = !DILocation(line: 179, column: 41, scope: !1740)
!1814 = !DILocation(line: 181, column: 13, scope: !1740)
!1815 = !DILocation(line: 181, column: 20, scope: !1740)
!1816 = !DILocation(line: 181, column: 22, scope: !1740)
!1817 = !DILocation(line: 181, column: 29, scope: !1740)
!1818 = !DILocation(line: 181, column: 36, scope: !1740)
!1819 = !DILocation(line: 182, column: 13, scope: !1740)
!1820 = !DILocation(line: 187, column: 17, scope: !1821)
!1821 = distinct !DILexicalBlock(scope: !1740, file: !92, line: 186, column: 17)
!1822 = !DILocation(line: 187, column: 25, scope: !1821)
!1823 = !DILocation(line: 187, column: 32, scope: !1821)
!1824 = !DILocation(line: 187, column: 34, scope: !1821)
!1825 = !DILocation(line: 187, column: 41, scope: !1821)
!1826 = !DILocation(line: 187, column: 48, scope: !1821)
!1827 = !DILocation(line: 187, column: 24, scope: !1821)
!1828 = !DILocation(line: 187, column: 53, scope: !1821)
!1829 = !DILocation(line: 186, column: 56, scope: !1821)
!1830 = !DILocation(line: 186, column: 20, scope: !1821)
!1831 = !DILocation(line: 186, column: 27, scope: !1821)
!1832 = !DILocation(line: 186, column: 29, scope: !1821)
!1833 = !DILocation(line: 186, column: 36, scope: !1821)
!1834 = !DILocation(line: 186, column: 40, scope: !1821)
!1835 = !DILocation(line: 186, column: 17, scope: !1740)
!1836 = !DILocation(line: 189, column: 16, scope: !1837)
!1837 = distinct !DILexicalBlock(scope: !1821, file: !92, line: 188, column: 13)
!1838 = !DILocation(line: 192, column: 13, scope: !1740)
!1839 = !DILocation(line: 192, column: 20, scope: !1740)
!1840 = !DILocation(line: 192, column: 22, scope: !1740)
!1841 = !DILocation(line: 192, column: 29, scope: !1740)
!1842 = !DILocation(line: 192, column: 36, scope: !1740)
!1843 = !DILocation(line: 193, column: 13, scope: !1740)
!1844 = !DILocation(line: 196, column: 13, scope: !1740)
!1845 = !DILocation(line: 199, column: 7, scope: !1716)
!1846 = !DILocation(line: 203, column: 11, scope: !1847)
!1847 = distinct !DILexicalBlock(scope: !1693, file: !92, line: 202, column: 8)
!1848 = !DILocation(line: 203, column: 40, scope: !1847)
!1849 = !DILocation(line: 203, column: 47, scope: !1847)
!1850 = !DILocation(line: 203, column: 56, scope: !1847)
!1851 = !DILocation(line: 203, column: 38, scope: !1847)
!1852 = !DILocation(line: 202, column: 34, scope: !1847)
!1853 = !DILocation(line: 202, column: 19, scope: !1847)
!1854 = !DILocation(line: 202, column: 17, scope: !1847)
!1855 = !DILocation(line: 202, column: 8, scope: !1693)
!1856 = !DILocation(line: 205, column: 7, scope: !1857)
!1857 = distinct !DILexicalBlock(scope: !1847, file: !92, line: 204, column: 4)
!1858 = !DILocation(line: 208, column: 10, scope: !1859)
!1859 = distinct !DILexicalBlock(scope: !1693, file: !92, line: 208, column: 8)
!1860 = !DILocation(line: 208, column: 9, scope: !1859)
!1861 = !DILocation(line: 208, column: 8, scope: !1693)
!1862 = !DILocation(line: 209, column: 15, scope: !1859)
!1863 = !DILocation(line: 209, column: 8, scope: !1859)
!1864 = !DILocation(line: 209, column: 13, scope: !1859)
!1865 = !DILocation(line: 209, column: 7, scope: !1859)
!1866 = !DILocation(line: 211, column: 18, scope: !1693)
!1867 = !DILocation(line: 211, column: 4, scope: !1693)
!1868 = !DILocation(line: 211, column: 11, scope: !1693)
!1869 = !DILocation(line: 211, column: 16, scope: !1693)
!1870 = !DILocation(line: 212, column: 21, scope: !1693)
!1871 = !DILocation(line: 212, column: 20, scope: !1693)
!1872 = !DILocation(line: 212, column: 4, scope: !1693)
!1873 = !DILocation(line: 212, column: 11, scope: !1693)
!1874 = !DILocation(line: 212, column: 18, scope: !1693)
!1875 = !DILocation(line: 219, column: 9, scope: !1876)
!1876 = distinct !DILexicalBlock(scope: !1693, file: !92, line: 219, column: 8)
!1877 = !DILocation(line: 219, column: 8, scope: !1876)
!1878 = !DILocation(line: 219, column: 8, scope: !1693)
!1879 = !DILocation(line: 220, column: 40, scope: !1876)
!1880 = !DILocation(line: 220, column: 9, scope: !1876)
!1881 = !DILocation(line: 220, column: 8, scope: !1876)
!1882 = !DILocation(line: 220, column: 17, scope: !1876)
!1883 = !DILocation(line: 220, column: 27, scope: !1876)
!1884 = !DILocation(line: 220, column: 38, scope: !1876)
!1885 = !DILocation(line: 220, column: 7, scope: !1876)
!1886 = !DILocation(line: 222, column: 20, scope: !1693)
!1887 = !DILocation(line: 222, column: 14, scope: !1693)
!1888 = !DILocation(line: 222, column: 18, scope: !1693)
!1889 = !DILocation(line: 222, column: 5, scope: !1693)
!1890 = !DILocation(line: 222, column: 11, scope: !1693)
!1891 = !DILocation(line: 224, column: 4, scope: !1693)
!1892 = !DILocation(line: 225, column: 1, scope: !1693)
!1893 = distinct !DISubprogram(name: "would_overflow", scope: !92, file: !92, line: 88, type: !1894, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !136)
!1894 = !DISubroutineType(types: !1895)
!1895 = !{!38, !55, !34}
!1896 = !DILocalVariable(name: "value", arg: 1, scope: !1893, file: !92, line: 88, type: !55)
!1897 = !DILocation(line: 88, column: 39, scope: !1893)
!1898 = !DILocalVariable(name: "b", arg: 2, scope: !1893, file: !92, line: 88, type: !34)
!1899 = !DILocation(line: 88, column: 56, scope: !1893)
!1900 = !DILocation(line: 90, column: 29, scope: !1893)
!1901 = !DILocation(line: 90, column: 31, scope: !1893)
!1902 = !DILocation(line: 90, column: 28, scope: !1893)
!1903 = !DILocation(line: 90, column: 26, scope: !1893)
!1904 = !DILocation(line: 90, column: 39, scope: !1893)
!1905 = !DILocation(line: 90, column: 48, scope: !1893)
!1906 = !DILocation(line: 90, column: 46, scope: !1893)
!1907 = !DILocation(line: 90, column: 4, scope: !1893)
!1908 = distinct !DISubprogram(name: "json_value_free_ex", scope: !92, file: !92, line: 1002, type: !1909, scopeLine: 1003, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !136)
!1909 = !DISubroutineType(types: !1910)
!1910 = !{null, !217, !42}
!1911 = !DILocalVariable(name: "settings", arg: 1, scope: !1908, file: !92, line: 1002, type: !217)
!1912 = !DILocation(line: 1002, column: 42, scope: !1908)
!1913 = !DILocalVariable(name: "value", arg: 2, scope: !1908, file: !92, line: 1002, type: !42)
!1914 = !DILocation(line: 1002, column: 65, scope: !1908)
!1915 = !DILocalVariable(name: "cur_value", scope: !1908, file: !92, line: 1004, type: !42)
!1916 = !DILocation(line: 1004, column: 17, scope: !1908)
!1917 = !DILocation(line: 1006, column: 9, scope: !1918)
!1918 = distinct !DILexicalBlock(scope: !1908, file: !92, line: 1006, column: 8)
!1919 = !DILocation(line: 1006, column: 8, scope: !1908)
!1920 = !DILocation(line: 1007, column: 7, scope: !1918)
!1921 = !DILocation(line: 1009, column: 4, scope: !1908)
!1922 = !DILocation(line: 1009, column: 11, scope: !1908)
!1923 = !DILocation(line: 1009, column: 18, scope: !1908)
!1924 = !DILocation(line: 1011, column: 4, scope: !1908)
!1925 = !DILocation(line: 1011, column: 11, scope: !1908)
!1926 = !DILocation(line: 1013, column: 15, scope: !1927)
!1927 = distinct !DILexicalBlock(scope: !1908, file: !92, line: 1012, column: 4)
!1928 = !DILocation(line: 1013, column: 22, scope: !1927)
!1929 = !DILocation(line: 1013, column: 7, scope: !1927)
!1930 = !DILocation(line: 1017, column: 18, scope: !1931)
!1931 = distinct !DILexicalBlock(scope: !1932, file: !92, line: 1017, column: 17)
!1932 = distinct !DILexicalBlock(scope: !1927, file: !92, line: 1014, column: 7)
!1933 = !DILocation(line: 1017, column: 25, scope: !1931)
!1934 = !DILocation(line: 1017, column: 27, scope: !1931)
!1935 = !DILocation(line: 1017, column: 33, scope: !1931)
!1936 = !DILocation(line: 1017, column: 17, scope: !1932)
!1937 = !DILocation(line: 1019, column: 16, scope: !1938)
!1938 = distinct !DILexicalBlock(scope: !1931, file: !92, line: 1018, column: 13)
!1939 = !DILocation(line: 1019, column: 26, scope: !1938)
!1940 = !DILocation(line: 1019, column: 36, scope: !1938)
!1941 = !DILocation(line: 1019, column: 43, scope: !1938)
!1942 = !DILocation(line: 1019, column: 45, scope: !1938)
!1943 = !DILocation(line: 1019, column: 51, scope: !1938)
!1944 = !DILocation(line: 1019, column: 59, scope: !1938)
!1945 = !DILocation(line: 1019, column: 69, scope: !1938)
!1946 = !DILocation(line: 1020, column: 16, scope: !1938)
!1947 = !DILocation(line: 1023, column: 21, scope: !1932)
!1948 = !DILocation(line: 1023, column: 28, scope: !1932)
!1949 = !DILocation(line: 1023, column: 30, scope: !1932)
!1950 = !DILocation(line: 1023, column: 36, scope: !1932)
!1951 = !DILocation(line: 1023, column: 47, scope: !1932)
!1952 = !DILocation(line: 1023, column: 54, scope: !1932)
!1953 = !DILocation(line: 1023, column: 56, scope: !1932)
!1954 = !DILocation(line: 1023, column: 62, scope: !1932)
!1955 = !DILocation(line: 1023, column: 44, scope: !1932)
!1956 = !DILocation(line: 1023, column: 19, scope: !1932)
!1957 = !DILocation(line: 1024, column: 13, scope: !1932)
!1958 = distinct !{!1958, !1924, !1959, !1132}
!1959 = !DILocation(line: 1049, column: 4, scope: !1908)
!1960 = !DILocation(line: 1028, column: 18, scope: !1961)
!1961 = distinct !DILexicalBlock(scope: !1932, file: !92, line: 1028, column: 17)
!1962 = !DILocation(line: 1028, column: 25, scope: !1961)
!1963 = !DILocation(line: 1028, column: 27, scope: !1961)
!1964 = !DILocation(line: 1028, column: 34, scope: !1961)
!1965 = !DILocation(line: 1028, column: 17, scope: !1932)
!1966 = !DILocation(line: 1030, column: 16, scope: !1967)
!1967 = distinct !DILexicalBlock(scope: !1961, file: !92, line: 1029, column: 13)
!1968 = !DILocation(line: 1030, column: 26, scope: !1967)
!1969 = !DILocation(line: 1030, column: 36, scope: !1967)
!1970 = !DILocation(line: 1030, column: 43, scope: !1967)
!1971 = !DILocation(line: 1030, column: 45, scope: !1967)
!1972 = !DILocation(line: 1030, column: 52, scope: !1967)
!1973 = !DILocation(line: 1030, column: 60, scope: !1967)
!1974 = !DILocation(line: 1030, column: 70, scope: !1967)
!1975 = !DILocation(line: 1031, column: 16, scope: !1967)
!1976 = !DILocation(line: 1034, column: 21, scope: !1932)
!1977 = !DILocation(line: 1034, column: 28, scope: !1932)
!1978 = !DILocation(line: 1034, column: 30, scope: !1932)
!1979 = !DILocation(line: 1034, column: 37, scope: !1932)
!1980 = !DILocation(line: 1034, column: 48, scope: !1932)
!1981 = !DILocation(line: 1034, column: 55, scope: !1932)
!1982 = !DILocation(line: 1034, column: 57, scope: !1932)
!1983 = !DILocation(line: 1034, column: 64, scope: !1932)
!1984 = !DILocation(line: 1034, column: 45, scope: !1932)
!1985 = !DILocation(line: 1034, column: 72, scope: !1932)
!1986 = !DILocation(line: 1034, column: 19, scope: !1932)
!1987 = !DILocation(line: 1035, column: 13, scope: !1932)
!1988 = !DILocation(line: 1039, column: 13, scope: !1932)
!1989 = !DILocation(line: 1039, column: 23, scope: !1932)
!1990 = !DILocation(line: 1039, column: 33, scope: !1932)
!1991 = !DILocation(line: 1039, column: 40, scope: !1932)
!1992 = !DILocation(line: 1039, column: 42, scope: !1932)
!1993 = !DILocation(line: 1039, column: 49, scope: !1932)
!1994 = !DILocation(line: 1039, column: 54, scope: !1932)
!1995 = !DILocation(line: 1039, column: 64, scope: !1932)
!1996 = !DILocation(line: 1040, column: 13, scope: !1932)
!1997 = !DILocation(line: 1043, column: 13, scope: !1932)
!1998 = !DILocation(line: 1046, column: 19, scope: !1927)
!1999 = !DILocation(line: 1046, column: 17, scope: !1927)
!2000 = !DILocation(line: 1047, column: 15, scope: !1927)
!2001 = !DILocation(line: 1047, column: 22, scope: !1927)
!2002 = !DILocation(line: 1047, column: 13, scope: !1927)
!2003 = !DILocation(line: 1048, column: 7, scope: !1927)
!2004 = !DILocation(line: 1048, column: 17, scope: !1927)
!2005 = !DILocation(line: 1048, column: 27, scope: !1927)
!2006 = !DILocation(line: 1048, column: 38, scope: !1927)
!2007 = !DILocation(line: 1048, column: 48, scope: !1927)
!2008 = !DILocation(line: 1050, column: 1, scope: !1908)
!2009 = distinct !DISubprogram(name: "json_alloc", scope: !92, file: !92, line: 117, type: !2010, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !136)
!2010 = !DISubroutineType(types: !2011)
!2011 = !{!35, !1696, !143, !38}
!2012 = !DILocalVariable(name: "state", arg: 1, scope: !2009, file: !92, line: 117, type: !1696)
!2013 = !DILocation(line: 117, column: 40, scope: !2009)
!2014 = !DILocalVariable(name: "size", arg: 2, scope: !2009, file: !92, line: 117, type: !143)
!2015 = !DILocation(line: 117, column: 54, scope: !2009)
!2016 = !DILocalVariable(name: "zero", arg: 3, scope: !2009, file: !92, line: 117, type: !38)
!2017 = !DILocation(line: 117, column: 64, scope: !2009)
!2018 = !DILocation(line: 119, column: 25, scope: !2019)
!2019 = distinct !DILexicalBlock(scope: !2009, file: !92, line: 119, column: 8)
!2020 = !DILocation(line: 119, column: 32, scope: !2019)
!2021 = !DILocation(line: 119, column: 23, scope: !2019)
!2022 = !DILocation(line: 119, column: 47, scope: !2019)
!2023 = !DILocation(line: 119, column: 45, scope: !2019)
!2024 = !DILocation(line: 119, column: 8, scope: !2009)
!2025 = !DILocation(line: 120, column: 7, scope: !2019)
!2026 = !DILocation(line: 122, column: 8, scope: !2027)
!2027 = distinct !DILexicalBlock(scope: !2009, file: !92, line: 122, column: 8)
!2028 = !DILocation(line: 122, column: 15, scope: !2027)
!2029 = !DILocation(line: 122, column: 24, scope: !2027)
!2030 = !DILocation(line: 123, column: 10, scope: !2027)
!2031 = !DILocation(line: 123, column: 36, scope: !2027)
!2032 = !DILocation(line: 123, column: 14, scope: !2027)
!2033 = !DILocation(line: 123, column: 21, scope: !2027)
!2034 = !DILocation(line: 123, column: 33, scope: !2027)
!2035 = !DILocation(line: 123, column: 44, scope: !2027)
!2036 = !DILocation(line: 123, column: 51, scope: !2027)
!2037 = !DILocation(line: 123, column: 60, scope: !2027)
!2038 = !DILocation(line: 123, column: 42, scope: !2027)
!2039 = !DILocation(line: 122, column: 8, scope: !2009)
!2040 = !DILocation(line: 125, column: 7, scope: !2041)
!2041 = distinct !DILexicalBlock(scope: !2027, file: !92, line: 124, column: 4)
!2042 = !DILocation(line: 128, column: 11, scope: !2009)
!2043 = !DILocation(line: 128, column: 18, scope: !2009)
!2044 = !DILocation(line: 128, column: 27, scope: !2009)
!2045 = !DILocation(line: 128, column: 38, scope: !2009)
!2046 = !DILocation(line: 128, column: 44, scope: !2009)
!2047 = !DILocation(line: 128, column: 50, scope: !2009)
!2048 = !DILocation(line: 128, column: 57, scope: !2009)
!2049 = !DILocation(line: 128, column: 66, scope: !2009)
!2050 = !DILocation(line: 128, column: 4, scope: !2009)
!2051 = !DILocation(line: 129, column: 1, scope: !2009)
