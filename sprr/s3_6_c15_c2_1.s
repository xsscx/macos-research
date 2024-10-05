	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 11, 0	sdk_version 11, 3
	.file	1 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/arm" "_types.h"
	.file	2 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys" "_types.h"
	.file	3 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types" "_sigset_t.h"
	.file	4 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_types" "_uint64_t.h"
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
Lfunc_begin0:
	.file	5 "/Users/xss/code" "s3_6_c15_c2_1.c"
	.loc	5 104 0                         ; s3_6_c15_c2_1.c:104:0
	.cfi_startproc
; %bb.0:
	;DEBUG_VALUE: main:argc <- $w0
	;DEBUG_VALUE: main:argv <- $x1
	sub	sp, sp, #48                     ; =48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32                    ; =32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x8, #-281187213901825
	movk	x8, #0, lsl #48
Ltmp0:
	.loc	5 110 21 prologue_end           ; s3_6_c15_c2_1.c:110:21
Lloh0:
	adrp	x9, _bus_handler@PAGE
Lloh1:
	add	x9, x9, _bus_handler@PAGEOFF
	.loc	5 109 5                         ; s3_6_c15_c2_1.c:109:5
	stp	x9, x8, [sp]
	.loc	5 112 5                         ; s3_6_c15_c2_1.c:112:5
	mov	x1, sp
Ltmp1:
	;DEBUG_VALUE: main:argv <- [DW_OP_LLVM_entry_value 1] $x1
	mov	w0, #10
Ltmp2:
	;DEBUG_VALUE: main:argc <- [DW_OP_LLVM_entry_value 1] $w0
	mov	x2, #0
	bl	_sigaction
Ltmp3:
	.loc	5 113 21                        ; s3_6_c15_c2_1.c:113:21
Lloh2:
	adrp	x8, _sev_handler@PAGE
Lloh3:
	add	x8, x8, _sev_handler@PAGEOFF
	str	x8, [sp]
	.loc	5 114 5                         ; s3_6_c15_c2_1.c:114:5
	mov	x1, sp
	mov	w0, #11
	mov	x2, #0
	bl	_sigaction
Ltmp4:
	.loc	5 116 21                        ; s3_6_c15_c2_1.c:116:21
	mov	x0, #0
	mov	w1, #16384
	mov	w2, #7
	mov	w3, #6146
	mov	w4, #-1
	mov	x5, #0
	bl	_mmap
Ltmp5:
	mov	x19, x0
Ltmp6:
	;DEBUG_VALUE: main:ptr <- $x19
	.loc	5 118 5                         ; s3_6_c15_c2_1.c:118:5
	mov	x0, #3689348814741910323
	bl	_write_sprr_perm
Ltmp7:
	.loc	5 119 12                        ; s3_6_c15_c2_1.c:119:12
	cbz	x19, LBB0_6
Ltmp8:
; %bb.1:
	;DEBUG_VALUE: main:ptr <- $x19
	;DEBUG_VALUE: main:argc <- [DW_OP_LLVM_entry_value 1] $w0
	;DEBUG_VALUE: main:argv <- [DW_OP_LLVM_entry_value 1] $x1
	cbz	x19, LBB0_7
Ltmp9:
LBB0_2:
	;DEBUG_VALUE: main:ptr <- $x19
	;DEBUG_VALUE: main:argc <- [DW_OP_LLVM_entry_value 1] $w0
	;DEBUG_VALUE: main:argv <- [DW_OP_LLVM_entry_value 1] $x1
	and	x8, x19, #0x3
	cbnz	x8, LBB0_7
Ltmp10:
LBB0_3:
	;DEBUG_VALUE: main:ptr <- $x19
	;DEBUG_VALUE: main:argc <- [DW_OP_LLVM_entry_value 1] $w0
	;DEBUG_VALUE: main:argv <- [DW_OP_LLVM_entry_value 1] $x1
	.loc	5 0 12 is_stmt 0                ; s3_6_c15_c2_1.c:0:12
	mov	x20, #0
	mov	w8, #960
	movk	w8, #54879, lsl #16
	.loc	5 119 12                        ; s3_6_c15_c2_1.c:119:12
	str	w8, [x19]
Ltmp11:
	;DEBUG_VALUE: i <- 0
LBB0_4:                                 ; =>This Inner Loop Header: Depth=1
	;DEBUG_VALUE: main:ptr <- $x19
	;DEBUG_VALUE: main:argc <- [DW_OP_LLVM_entry_value 1] $w0
	;DEBUG_VALUE: main:argv <- [DW_OP_LLVM_entry_value 1] $x1
	;DEBUG_VALUE: i <- $x20
	.loc	5 122 24 is_stmt 1              ; s3_6_c15_c2_1.c:122:24
	and	w0, w20, #0xff
	bl	_make_sprr_val
Ltmp12:
	mov	x1, x0
	.loc	5 122 9 is_stmt 0               ; s3_6_c15_c2_1.c:122:9
	mov	x0, x19
	bl	_sprr_test
Ltmp13:
	.loc	5 0 9                           ; s3_6_c15_c2_1.c:0:9
	add	x20, x20, #1                    ; =1
Ltmp14:
	;DEBUG_VALUE: i <- $x20
	.loc	5 121 5 is_stmt 1               ; s3_6_c15_c2_1.c:121:5
	cmp	x20, #4                         ; =4
	b.ne	LBB0_4
Ltmp15:
; %bb.5:
	;DEBUG_VALUE: main:ptr <- $x19
	;DEBUG_VALUE: main:argc <- [DW_OP_LLVM_entry_value 1] $w0
	;DEBUG_VALUE: main:argv <- [DW_OP_LLVM_entry_value 1] $x1
	.loc	5 123 1                         ; s3_6_c15_c2_1.c:123:1
	mov	w0, #0
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
Ltmp16:
	add	sp, sp, #48                     ; =48
	ret
Ltmp17:
LBB0_6:
	;DEBUG_VALUE: main:ptr <- $x19
	;DEBUG_VALUE: main:argc <- [DW_OP_LLVM_entry_value 1] $w0
	;DEBUG_VALUE: main:argv <- [DW_OP_LLVM_entry_value 1] $x1
	.loc	5 119 12                        ; s3_6_c15_c2_1.c:119:12
Lloh4:
	adrp	x0, l___unnamed_1@PAGE
Lloh5:
	add	x0, x0, l___unnamed_1@PAGEOFF
	mov	x1, x19
	mov	x2, x19
	bl	___ubsan_handle_pointer_overflow
Ltmp18:
	cbnz	x19, LBB0_2
Ltmp19:
LBB0_7:
	;DEBUG_VALUE: main:ptr <- $x19
	;DEBUG_VALUE: main:argc <- [DW_OP_LLVM_entry_value 1] $w0
	;DEBUG_VALUE: main:argv <- [DW_OP_LLVM_entry_value 1] $x1
Lloh6:
	adrp	x0, l___unnamed_2@PAGE
Lloh7:
	add	x0, x0, l___unnamed_2@PAGEOFF
	mov	x1, x19
	bl	___ubsan_handle_type_mismatch_v1
Ltmp20:
	.loc	5 0 12 is_stmt 0                ; s3_6_c15_c2_1.c:0:12
	b	LBB0_3
Ltmp21:
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh0, Lloh1
	.loh AdrpAdd	Lloh4, Lloh5
	.loh AdrpAdd	Lloh6, Lloh7
Lfunc_end0:
	.cfi_endproc
	.file	6 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include" "signal.h"
	.file	7 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys" "signal.h"
	.file	8 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types" "_pid_t.h"
	.file	9 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types" "_uid_t.h"
	.file	10 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys" "mman.h"
                                        ; -- End function
	.p2align	2                               ; -- Begin function bus_handler
_bus_handler:                           ; @bus_handler
Lfunc_begin1:
	.loc	5 21 0 is_stmt 1                ; s3_6_c15_c2_1.c:21:0
	.cfi_startproc
; %bb.0:
	;DEBUG_VALUE: bus_handler:signo <- $w0
	;DEBUG_VALUE: bus_handler:info <- $x1
	;DEBUG_VALUE: bus_handler:cx_ <- $x2
	;DEBUG_VALUE: bus_handler:cx_ <- $x2
	sub	sp, sp, #64                     ; =64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48                    ; =48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp22:
	;DEBUG_VALUE: bus_handler:cx <- $x2
	;DEBUG_VALUE: bus_handler:cx <- $x2
	.loc	5 25 9 prologue_end             ; s3_6_c15_c2_1.c:25:9
	cmp	x2, #0                          ; =0
	cset	w8, ne
	tst	x2, #0xf
	cset	w9, eq
	and	w9, w8, w9
	tbz	w9, #0, LBB1_12
Ltmp23:
LBB1_1:
	add	x8, x2, #48                     ; =48
	ands	x10, x8, #0xf
	b.ne	LBB1_13
LBB1_2:
	ldr	x11, [x8]
	.loc	5 25 22 is_stmt 0               ; s3_6_c15_c2_1.c:25:22
	and	x12, x11, #0xf
	cmp	x12, #0                         ; =0
	ccmp	x11, #0, #4, eq
	b.eq	LBB1_14
LBB1_3:
	add	x11, x11, #16                   ; =16
	.loc	5 25 27                         ; s3_6_c15_c2_1.c:25:27
	ands	x12, x11, #0xf
	b.ne	LBB1_15
; %bb.4:
	.loc	5 25 34                         ; s3_6_c15_c2_1.c:25:34
	cbnz	x12, LBB1_16
LBB1_5:
	.loc	5 0 34                          ; s3_6_c15_c2_1.c:0:34
	mov	w12, #48879
	movk	w12, #57005, lsl #16
	.loc	5 25 34                         ; s3_6_c15_c2_1.c:25:34
	str	x12, [x11]
	.loc	5 26 9 is_stmt 1                ; s3_6_c15_c2_1.c:26:9
	tbz	w9, #0, LBB1_17
; %bb.6:
	cbnz	x10, LBB1_18
LBB1_7:
	ldr	x8, [x8]
	.loc	5 26 22 is_stmt 0               ; s3_6_c15_c2_1.c:26:22
	tst	x8, #0xf
	b.ne	LBB1_19
; %bb.8:
	cbz	x8, LBB1_19
LBB1_9:
	add	x1, x8, #16                     ; =16
	.loc	5 26 27                         ; s3_6_c15_c2_1.c:26:27
	tst	x1, #0xf
	b.ne	LBB1_20
LBB1_10:
	add	x8, x8, #272                    ; =272
	.loc	5 26 32                         ; s3_6_c15_c2_1.c:26:32
	tst	x8, #0xf
	b.ne	LBB1_21
LBB1_11:
	ldr	x9, [x8]
	add	x9, x9, #4                      ; =4
	str	x9, [x8]
	.loc	5 27 1 is_stmt 1                ; s3_6_c15_c2_1.c:27:1
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64                     ; =64
	ret
LBB1_12:
Ltmp24:
	;DEBUG_VALUE: bus_handler:cx <- $x2
	;DEBUG_VALUE: bus_handler:cx_ <- $x2
	;DEBUG_VALUE: bus_handler:info <- $x1
	;DEBUG_VALUE: bus_handler:signo <- $w0
	.loc	5 25 9                          ; s3_6_c15_c2_1.c:25:9
Lloh8:
	adrp	x0, l___unnamed_3@PAGE
Ltmp25:
	;DEBUG_VALUE: bus_handler:signo <- [DW_OP_LLVM_entry_value 1] $w0
Lloh9:
	add	x0, x0, l___unnamed_3@PAGEOFF
	mov	x1, x2
Ltmp26:
	;DEBUG_VALUE: bus_handler:info <- [DW_OP_LLVM_entry_value 1] $x1
	.loc	5 0 9 is_stmt 0                 ; s3_6_c15_c2_1.c:0:9
	stur	x2, [x29, #-16]                 ; 8-byte Folded Spill
Ltmp27:
	;DEBUG_VALUE: bus_handler:cx_ <- [DW_OP_constu 16, DW_OP_minus] [$fp+0]
	str	w9, [sp, #20]                   ; 4-byte Folded Spill
	.loc	5 25 9                          ; s3_6_c15_c2_1.c:25:9
	bl	___ubsan_handle_type_mismatch_v1
Ltmp28:
	.loc	5 0 9                           ; s3_6_c15_c2_1.c:0:9
	ldr	w9, [sp, #20]                   ; 4-byte Folded Reload
	ldur	x2, [x29, #-16]                 ; 8-byte Folded Reload
	b	LBB1_1
Ltmp29:
LBB1_13:
	.loc	5 25 9                          ; s3_6_c15_c2_1.c:25:9
Lloh10:
	adrp	x0, l___unnamed_4@PAGE
Lloh11:
	add	x0, x0, l___unnamed_4@PAGEOFF
	stp	x2, x8, [x29, #-16]             ; 16-byte Folded Spill
	mov	x1, x8
	str	w9, [sp, #20]                   ; 4-byte Folded Spill
	str	x10, [sp, #24]                  ; 8-byte Folded Spill
	bl	___ubsan_handle_type_mismatch_v1
Ltmp30:
	.loc	5 0 9                           ; s3_6_c15_c2_1.c:0:9
	ldr	x10, [sp, #24]                  ; 8-byte Folded Reload
	ldr	w9, [sp, #20]                   ; 4-byte Folded Reload
	ldp	x2, x8, [x29, #-16]             ; 16-byte Folded Reload
	b	LBB1_2
LBB1_14:
	.loc	5 25 22                         ; s3_6_c15_c2_1.c:25:22
Lloh12:
	adrp	x0, l___unnamed_5@PAGE
Lloh13:
	add	x0, x0, l___unnamed_5@PAGEOFF
	stur	x8, [x29, #-8]                  ; 8-byte Folded Spill
	str	x11, [sp, #8]                   ; 8-byte Folded Spill
	mov	x1, x11
	stur	x2, [x29, #-16]                 ; 8-byte Folded Spill
	str	w9, [sp, #20]                   ; 4-byte Folded Spill
	str	x10, [sp, #24]                  ; 8-byte Folded Spill
	bl	___ubsan_handle_type_mismatch_v1
Ltmp31:
	.loc	5 0 22                          ; s3_6_c15_c2_1.c:0:22
	ldr	x10, [sp, #24]                  ; 8-byte Folded Reload
	ldr	w9, [sp, #20]                   ; 4-byte Folded Reload
	ldr	x11, [sp, #8]                   ; 8-byte Folded Reload
	ldp	x2, x8, [x29, #-16]             ; 16-byte Folded Reload
	b	LBB1_3
LBB1_15:
	.loc	5 25 27                         ; s3_6_c15_c2_1.c:25:27
Lloh14:
	adrp	x0, l___unnamed_6@PAGE
Lloh15:
	add	x0, x0, l___unnamed_6@PAGEOFF
	stur	x8, [x29, #-8]                  ; 8-byte Folded Spill
	str	x11, [sp, #8]                   ; 8-byte Folded Spill
	mov	x1, x11
	stur	x2, [x29, #-16]                 ; 8-byte Folded Spill
	str	w9, [sp, #20]                   ; 4-byte Folded Spill
	str	x10, [sp, #24]                  ; 8-byte Folded Spill
	str	x12, [sp]                       ; 8-byte Folded Spill
	bl	___ubsan_handle_type_mismatch_v1
Ltmp32:
	.loc	5 0 27                          ; s3_6_c15_c2_1.c:0:27
	ldp	x12, x11, [sp]                  ; 16-byte Folded Reload
	ldr	x10, [sp, #24]                  ; 8-byte Folded Reload
	ldr	w9, [sp, #20]                   ; 4-byte Folded Reload
	ldp	x2, x8, [x29, #-16]             ; 16-byte Folded Reload
	.loc	5 25 34                         ; s3_6_c15_c2_1.c:25:34
	cbz	x12, LBB1_5
LBB1_16:
Lloh16:
	adrp	x0, l___unnamed_7@PAGE
Lloh17:
	add	x0, x0, l___unnamed_7@PAGEOFF
	stur	x8, [x29, #-8]                  ; 8-byte Folded Spill
	str	x11, [sp, #8]                   ; 8-byte Folded Spill
	mov	x1, x11
	stur	x2, [x29, #-16]                 ; 8-byte Folded Spill
	str	w9, [sp, #20]                   ; 4-byte Folded Spill
	str	x10, [sp, #24]                  ; 8-byte Folded Spill
	bl	___ubsan_handle_type_mismatch_v1
Ltmp33:
	.loc	5 0 34                          ; s3_6_c15_c2_1.c:0:34
	ldr	x10, [sp, #24]                  ; 8-byte Folded Reload
	ldr	w9, [sp, #20]                   ; 4-byte Folded Reload
	ldr	x11, [sp, #8]                   ; 8-byte Folded Reload
	ldp	x2, x8, [x29, #-16]             ; 16-byte Folded Reload
	b	LBB1_5
LBB1_17:
	.loc	5 26 9 is_stmt 1                ; s3_6_c15_c2_1.c:26:9
Lloh18:
	adrp	x0, l___unnamed_8@PAGE
Lloh19:
	add	x0, x0, l___unnamed_8@PAGEOFF
	stur	x8, [x29, #-8]                  ; 8-byte Folded Spill
	mov	x1, x2
	str	x10, [sp, #24]                  ; 8-byte Folded Spill
	bl	___ubsan_handle_type_mismatch_v1
Ltmp34:
	.loc	5 0 9 is_stmt 0                 ; s3_6_c15_c2_1.c:0:9
	ldr	x10, [sp, #24]                  ; 8-byte Folded Reload
	ldur	x8, [x29, #-8]                  ; 8-byte Folded Reload
	.loc	5 26 9                          ; s3_6_c15_c2_1.c:26:9
	cbz	x10, LBB1_7
LBB1_18:
Lloh20:
	adrp	x0, l___unnamed_9@PAGE
Lloh21:
	add	x0, x0, l___unnamed_9@PAGEOFF
	stur	x8, [x29, #-8]                  ; 8-byte Folded Spill
	mov	x1, x8
	bl	___ubsan_handle_type_mismatch_v1
Ltmp35:
	.loc	5 0 9                           ; s3_6_c15_c2_1.c:0:9
	ldur	x8, [x29, #-8]                  ; 8-byte Folded Reload
	b	LBB1_7
LBB1_19:
	.loc	5 26 22                         ; s3_6_c15_c2_1.c:26:22
Lloh22:
	adrp	x0, l___unnamed_10@PAGE
Lloh23:
	add	x0, x0, l___unnamed_10@PAGEOFF
	stur	x8, [x29, #-8]                  ; 8-byte Folded Spill
	mov	x1, x8
	bl	___ubsan_handle_type_mismatch_v1
Ltmp36:
	.loc	5 0 22                          ; s3_6_c15_c2_1.c:0:22
	ldur	x8, [x29, #-8]                  ; 8-byte Folded Reload
	b	LBB1_9
LBB1_20:
	.loc	5 26 27                         ; s3_6_c15_c2_1.c:26:27
Lloh24:
	adrp	x0, l___unnamed_11@PAGE
Lloh25:
	add	x0, x0, l___unnamed_11@PAGEOFF
	stur	x8, [x29, #-8]                  ; 8-byte Folded Spill
	bl	___ubsan_handle_type_mismatch_v1
Ltmp37:
	.loc	5 0 27                          ; s3_6_c15_c2_1.c:0:27
	ldur	x8, [x29, #-8]                  ; 8-byte Folded Reload
	b	LBB1_10
LBB1_21:
	.loc	5 26 32                         ; s3_6_c15_c2_1.c:26:32
Lloh26:
	adrp	x0, l___unnamed_12@PAGE
Lloh27:
	add	x0, x0, l___unnamed_12@PAGEOFF
	stur	x8, [x29, #-8]                  ; 8-byte Folded Spill
	mov	x1, x8
	bl	___ubsan_handle_type_mismatch_v1
Ltmp38:
	.loc	5 0 32                          ; s3_6_c15_c2_1.c:0:32
	ldur	x8, [x29, #-8]                  ; 8-byte Folded Reload
	b	LBB1_11
Ltmp39:
	.loh AdrpAdd	Lloh8, Lloh9
	.loh AdrpAdd	Lloh10, Lloh11
	.loh AdrpAdd	Lloh12, Lloh13
	.loh AdrpAdd	Lloh14, Lloh15
	.loh AdrpAdd	Lloh16, Lloh17
	.loh AdrpAdd	Lloh18, Lloh19
	.loh AdrpAdd	Lloh20, Lloh21
	.loh AdrpAdd	Lloh22, Lloh23
	.loh AdrpAdd	Lloh24, Lloh25
	.loh AdrpAdd	Lloh26, Lloh27
Lfunc_end1:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function sev_handler
_sev_handler:                           ; @sev_handler
Lfunc_begin2:
	.loc	5 12 0 is_stmt 1                ; s3_6_c15_c2_1.c:12:0
	.cfi_startproc
; %bb.0:
	;DEBUG_VALUE: sev_handler:signo <- $w0
	;DEBUG_VALUE: sev_handler:info <- $x1
	;DEBUG_VALUE: sev_handler:cx_ <- $x2
	;DEBUG_VALUE: sev_handler:cx_ <- $x2
	sub	sp, sp, #64                     ; =64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48                    ; =48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp40:
	;DEBUG_VALUE: sev_handler:cx <- $x2
	;DEBUG_VALUE: sev_handler:cx <- $x2
	.loc	5 16 9 prologue_end             ; s3_6_c15_c2_1.c:16:9
	cmp	x2, #0                          ; =0
	cset	w8, ne
	tst	x2, #0xf
	cset	w9, eq
	and	w8, w8, w9
	tbz	w8, #0, LBB2_18
Ltmp41:
LBB2_1:
	add	x9, x2, #48                     ; =48
	ands	x10, x9, #0xf
	b.ne	LBB2_19
LBB2_2:
	ldr	x11, [x9]
	.loc	5 16 22 is_stmt 0               ; s3_6_c15_c2_1.c:16:22
	and	x12, x11, #0xf
	cmp	x12, #0                         ; =0
	ccmp	x11, #0, #4, eq
	b.eq	LBB2_20
LBB2_3:
	add	x11, x11, #16                   ; =16
	.loc	5 16 27                         ; s3_6_c15_c2_1.c:16:27
	ands	x12, x11, #0xf
	b.ne	LBB2_21
; %bb.4:
	.loc	5 16 34                         ; s3_6_c15_c2_1.c:16:34
	cbnz	x12, LBB2_22
LBB2_5:
	.loc	5 0 34                          ; s3_6_c15_c2_1.c:0:34
	mov	w12, #48879
	movk	w12, #57005, lsl #16
	.loc	5 16 34                         ; s3_6_c15_c2_1.c:16:34
	str	x12, [x11]
	.loc	5 17 38 is_stmt 1               ; s3_6_c15_c2_1.c:17:38
	tbz	w8, #0, LBB2_23
; %bb.6:
	cbnz	x10, LBB2_24
LBB2_7:
	ldr	x11, [x9]
	.loc	5 17 51 is_stmt 0               ; s3_6_c15_c2_1.c:17:51
	tst	x11, #0xf
	b.ne	LBB2_25
; %bb.8:
	cbz	x11, LBB2_25
LBB2_9:
	add	x1, x11, #16                    ; =16
	.loc	5 17 56                         ; s3_6_c15_c2_1.c:17:56
	tst	x1, #0xf
	b.ne	LBB2_26
LBB2_10:
	add	x11, x11, #256                  ; =256
	tst	x11, #0xf
	b.ne	LBB2_27
; %bb.11:
	ldr	x11, [x11]
	.loc	5 17 9                          ; s3_6_c15_c2_1.c:17:9
	tbz	w8, #0, LBB2_28
LBB2_12:
	cbnz	x10, LBB2_29
LBB2_13:
	ldr	x8, [x9]
	.loc	5 17 22                         ; s3_6_c15_c2_1.c:17:22
	tst	x8, #0xf
	b.ne	LBB2_30
; %bb.14:
	cbz	x8, LBB2_30
LBB2_15:
	add	x1, x8, #16                     ; =16
	.loc	5 17 27                         ; s3_6_c15_c2_1.c:17:27
	tst	x1, #0xf
	b.ne	LBB2_31
LBB2_16:
	add	x8, x8, #272                    ; =272
	.loc	5 17 32                         ; s3_6_c15_c2_1.c:17:32
	tst	x8, #0xf
	b.ne	LBB2_32
LBB2_17:
	str	x11, [x8]
	.loc	5 18 1 is_stmt 1                ; s3_6_c15_c2_1.c:18:1
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64                     ; =64
	ret
LBB2_18:
Ltmp42:
	;DEBUG_VALUE: sev_handler:cx <- $x2
	;DEBUG_VALUE: sev_handler:cx_ <- $x2
	;DEBUG_VALUE: sev_handler:info <- $x1
	;DEBUG_VALUE: sev_handler:signo <- $w0
	.loc	5 16 9                          ; s3_6_c15_c2_1.c:16:9
Lloh28:
	adrp	x0, l___unnamed_13@PAGE
Ltmp43:
	;DEBUG_VALUE: sev_handler:signo <- [DW_OP_LLVM_entry_value 1] $w0
Lloh29:
	add	x0, x0, l___unnamed_13@PAGEOFF
	mov	x1, x2
Ltmp44:
	;DEBUG_VALUE: sev_handler:info <- [DW_OP_LLVM_entry_value 1] $x1
	.loc	5 0 9 is_stmt 0                 ; s3_6_c15_c2_1.c:0:9
	stur	x2, [x29, #-16]                 ; 8-byte Folded Spill
Ltmp45:
	;DEBUG_VALUE: sev_handler:cx_ <- [DW_OP_constu 16, DW_OP_minus] [$fp+0]
	str	w8, [sp, #20]                   ; 4-byte Folded Spill
	.loc	5 16 9                          ; s3_6_c15_c2_1.c:16:9
	bl	___ubsan_handle_type_mismatch_v1
Ltmp46:
	.loc	5 0 9                           ; s3_6_c15_c2_1.c:0:9
	ldr	w8, [sp, #20]                   ; 4-byte Folded Reload
	ldur	x2, [x29, #-16]                 ; 8-byte Folded Reload
	b	LBB2_1
Ltmp47:
LBB2_19:
	.loc	5 16 9                          ; s3_6_c15_c2_1.c:16:9
Lloh30:
	adrp	x0, l___unnamed_14@PAGE
Lloh31:
	add	x0, x0, l___unnamed_14@PAGEOFF
	stp	x2, x9, [x29, #-16]             ; 16-byte Folded Spill
	mov	x1, x9
	str	w8, [sp, #20]                   ; 4-byte Folded Spill
	str	x10, [sp, #24]                  ; 8-byte Folded Spill
	bl	___ubsan_handle_type_mismatch_v1
Ltmp48:
	.loc	5 0 9                           ; s3_6_c15_c2_1.c:0:9
	ldr	x10, [sp, #24]                  ; 8-byte Folded Reload
	ldr	w8, [sp, #20]                   ; 4-byte Folded Reload
	ldp	x2, x9, [x29, #-16]             ; 16-byte Folded Reload
	b	LBB2_2
LBB2_20:
	.loc	5 16 22                         ; s3_6_c15_c2_1.c:16:22
Lloh32:
	adrp	x0, l___unnamed_15@PAGE
Lloh33:
	add	x0, x0, l___unnamed_15@PAGEOFF
	stur	x9, [x29, #-8]                  ; 8-byte Folded Spill
	str	x11, [sp, #8]                   ; 8-byte Folded Spill
	mov	x1, x11
	stur	x2, [x29, #-16]                 ; 8-byte Folded Spill
	str	w8, [sp, #20]                   ; 4-byte Folded Spill
	str	x10, [sp, #24]                  ; 8-byte Folded Spill
	bl	___ubsan_handle_type_mismatch_v1
Ltmp49:
	.loc	5 0 22                          ; s3_6_c15_c2_1.c:0:22
	ldr	x10, [sp, #24]                  ; 8-byte Folded Reload
	ldr	w8, [sp, #20]                   ; 4-byte Folded Reload
	ldr	x11, [sp, #8]                   ; 8-byte Folded Reload
	ldp	x2, x9, [x29, #-16]             ; 16-byte Folded Reload
	b	LBB2_3
LBB2_21:
	.loc	5 16 27                         ; s3_6_c15_c2_1.c:16:27
Lloh34:
	adrp	x0, l___unnamed_16@PAGE
Lloh35:
	add	x0, x0, l___unnamed_16@PAGEOFF
	stur	x9, [x29, #-8]                  ; 8-byte Folded Spill
	str	x11, [sp, #8]                   ; 8-byte Folded Spill
	mov	x1, x11
	stur	x2, [x29, #-16]                 ; 8-byte Folded Spill
	str	w8, [sp, #20]                   ; 4-byte Folded Spill
	str	x10, [sp, #24]                  ; 8-byte Folded Spill
	str	x12, [sp]                       ; 8-byte Folded Spill
	bl	___ubsan_handle_type_mismatch_v1
Ltmp50:
	.loc	5 0 27                          ; s3_6_c15_c2_1.c:0:27
	ldp	x12, x11, [sp]                  ; 16-byte Folded Reload
	ldr	x10, [sp, #24]                  ; 8-byte Folded Reload
	ldr	w8, [sp, #20]                   ; 4-byte Folded Reload
	ldp	x2, x9, [x29, #-16]             ; 16-byte Folded Reload
	.loc	5 16 34                         ; s3_6_c15_c2_1.c:16:34
	cbz	x12, LBB2_5
LBB2_22:
Lloh36:
	adrp	x0, l___unnamed_17@PAGE
Lloh37:
	add	x0, x0, l___unnamed_17@PAGEOFF
	stur	x9, [x29, #-8]                  ; 8-byte Folded Spill
	str	x11, [sp, #8]                   ; 8-byte Folded Spill
	mov	x1, x11
	stur	x2, [x29, #-16]                 ; 8-byte Folded Spill
	str	w8, [sp, #20]                   ; 4-byte Folded Spill
	str	x10, [sp, #24]                  ; 8-byte Folded Spill
	bl	___ubsan_handle_type_mismatch_v1
Ltmp51:
	.loc	5 0 34                          ; s3_6_c15_c2_1.c:0:34
	ldr	x10, [sp, #24]                  ; 8-byte Folded Reload
	ldr	w8, [sp, #20]                   ; 4-byte Folded Reload
	ldr	x11, [sp, #8]                   ; 8-byte Folded Reload
	ldp	x2, x9, [x29, #-16]             ; 16-byte Folded Reload
	b	LBB2_5
LBB2_23:
	.loc	5 17 38 is_stmt 1               ; s3_6_c15_c2_1.c:17:38
Lloh38:
	adrp	x0, l___unnamed_18@PAGE
Lloh39:
	add	x0, x0, l___unnamed_18@PAGEOFF
	stp	x2, x9, [x29, #-16]             ; 16-byte Folded Spill
	mov	x1, x2
	str	w8, [sp, #20]                   ; 4-byte Folded Spill
	str	x10, [sp, #24]                  ; 8-byte Folded Spill
	bl	___ubsan_handle_type_mismatch_v1
Ltmp52:
	.loc	5 0 38 is_stmt 0                ; s3_6_c15_c2_1.c:0:38
	ldr	x10, [sp, #24]                  ; 8-byte Folded Reload
	ldr	w8, [sp, #20]                   ; 4-byte Folded Reload
	ldp	x2, x9, [x29, #-16]             ; 16-byte Folded Reload
	.loc	5 17 38                         ; s3_6_c15_c2_1.c:17:38
	cbz	x10, LBB2_7
LBB2_24:
Lloh40:
	adrp	x0, l___unnamed_19@PAGE
Lloh41:
	add	x0, x0, l___unnamed_19@PAGEOFF
	stp	x2, x9, [x29, #-16]             ; 16-byte Folded Spill
	mov	x1, x9
	str	w8, [sp, #20]                   ; 4-byte Folded Spill
	str	x10, [sp, #24]                  ; 8-byte Folded Spill
	bl	___ubsan_handle_type_mismatch_v1
Ltmp53:
	.loc	5 0 38                          ; s3_6_c15_c2_1.c:0:38
	ldr	x10, [sp, #24]                  ; 8-byte Folded Reload
	ldr	w8, [sp, #20]                   ; 4-byte Folded Reload
	ldp	x2, x9, [x29, #-16]             ; 16-byte Folded Reload
	b	LBB2_7
LBB2_25:
	.loc	5 17 51                         ; s3_6_c15_c2_1.c:17:51
Lloh42:
	adrp	x0, l___unnamed_20@PAGE
Lloh43:
	add	x0, x0, l___unnamed_20@PAGEOFF
	stur	x9, [x29, #-8]                  ; 8-byte Folded Spill
	str	x11, [sp, #8]                   ; 8-byte Folded Spill
	mov	x1, x11
	stur	x2, [x29, #-16]                 ; 8-byte Folded Spill
	str	w8, [sp, #20]                   ; 4-byte Folded Spill
	str	x10, [sp, #24]                  ; 8-byte Folded Spill
	bl	___ubsan_handle_type_mismatch_v1
Ltmp54:
	.loc	5 0 51                          ; s3_6_c15_c2_1.c:0:51
	ldr	x10, [sp, #24]                  ; 8-byte Folded Reload
	ldr	w8, [sp, #20]                   ; 4-byte Folded Reload
	ldr	x11, [sp, #8]                   ; 8-byte Folded Reload
	ldp	x2, x9, [x29, #-16]             ; 16-byte Folded Reload
	b	LBB2_9
LBB2_26:
	.loc	5 17 56                         ; s3_6_c15_c2_1.c:17:56
Lloh44:
	adrp	x0, l___unnamed_21@PAGE
Lloh45:
	add	x0, x0, l___unnamed_21@PAGEOFF
	stur	x9, [x29, #-8]                  ; 8-byte Folded Spill
	str	x11, [sp, #8]                   ; 8-byte Folded Spill
	stur	x2, [x29, #-16]                 ; 8-byte Folded Spill
	str	w8, [sp, #20]                   ; 4-byte Folded Spill
	str	x10, [sp, #24]                  ; 8-byte Folded Spill
	bl	___ubsan_handle_type_mismatch_v1
Ltmp55:
	.loc	5 0 56                          ; s3_6_c15_c2_1.c:0:56
	ldr	x10, [sp, #24]                  ; 8-byte Folded Reload
	ldr	w8, [sp, #20]                   ; 4-byte Folded Reload
	ldr	x11, [sp, #8]                   ; 8-byte Folded Reload
	ldp	x2, x9, [x29, #-16]             ; 16-byte Folded Reload
	b	LBB2_10
LBB2_27:
	.loc	5 17 56                         ; s3_6_c15_c2_1.c:17:56
Lloh46:
	adrp	x0, l___unnamed_22@PAGE
Lloh47:
	add	x0, x0, l___unnamed_22@PAGEOFF
	stur	x9, [x29, #-8]                  ; 8-byte Folded Spill
	str	x11, [sp, #8]                   ; 8-byte Folded Spill
	mov	x1, x11
	stur	x2, [x29, #-16]                 ; 8-byte Folded Spill
	str	w8, [sp, #20]                   ; 4-byte Folded Spill
	str	x10, [sp, #24]                  ; 8-byte Folded Spill
	bl	___ubsan_handle_type_mismatch_v1
Ltmp56:
	.loc	5 0 56                          ; s3_6_c15_c2_1.c:0:56
	ldr	x10, [sp, #24]                  ; 8-byte Folded Reload
	ldr	w8, [sp, #20]                   ; 4-byte Folded Reload
	ldr	x11, [sp, #8]                   ; 8-byte Folded Reload
	ldp	x2, x9, [x29, #-16]             ; 16-byte Folded Reload
	.loc	5 17 56                         ; s3_6_c15_c2_1.c:17:56
	ldr	x11, [x11]
	.loc	5 17 9                          ; s3_6_c15_c2_1.c:17:9
	tbnz	w8, #0, LBB2_12
LBB2_28:
Lloh48:
	adrp	x0, l___unnamed_23@PAGE
Lloh49:
	add	x0, x0, l___unnamed_23@PAGEOFF
	stur	x9, [x29, #-8]                  ; 8-byte Folded Spill
	mov	x1, x2
	str	x10, [sp, #24]                  ; 8-byte Folded Spill
	stur	x11, [x29, #-16]                ; 8-byte Folded Spill
	bl	___ubsan_handle_type_mismatch_v1
Ltmp57:
	.loc	5 0 9                           ; s3_6_c15_c2_1.c:0:9
	ldp	x11, x9, [x29, #-16]            ; 16-byte Folded Reload
	ldr	x10, [sp, #24]                  ; 8-byte Folded Reload
	.loc	5 17 9                          ; s3_6_c15_c2_1.c:17:9
	cbz	x10, LBB2_13
LBB2_29:
Lloh50:
	adrp	x0, l___unnamed_24@PAGE
Lloh51:
	add	x0, x0, l___unnamed_24@PAGEOFF
	stp	x11, x9, [x29, #-16]            ; 16-byte Folded Spill
	mov	x1, x9
	bl	___ubsan_handle_type_mismatch_v1
Ltmp58:
	.loc	5 0 9                           ; s3_6_c15_c2_1.c:0:9
	ldp	x11, x9, [x29, #-16]            ; 16-byte Folded Reload
	b	LBB2_13
LBB2_30:
	.loc	5 17 22                         ; s3_6_c15_c2_1.c:17:22
Lloh52:
	adrp	x0, l___unnamed_25@PAGE
Lloh53:
	add	x0, x0, l___unnamed_25@PAGEOFF
	stp	x11, x8, [x29, #-16]            ; 16-byte Folded Spill
	mov	x1, x8
	bl	___ubsan_handle_type_mismatch_v1
Ltmp59:
	.loc	5 0 22                          ; s3_6_c15_c2_1.c:0:22
	ldp	x11, x8, [x29, #-16]            ; 16-byte Folded Reload
	b	LBB2_15
LBB2_31:
	.loc	5 17 27                         ; s3_6_c15_c2_1.c:17:27
Lloh54:
	adrp	x0, l___unnamed_26@PAGE
Lloh55:
	add	x0, x0, l___unnamed_26@PAGEOFF
	stp	x11, x8, [x29, #-16]            ; 16-byte Folded Spill
	bl	___ubsan_handle_type_mismatch_v1
Ltmp60:
	.loc	5 0 27                          ; s3_6_c15_c2_1.c:0:27
	ldp	x11, x8, [x29, #-16]            ; 16-byte Folded Reload
	b	LBB2_16
LBB2_32:
	.loc	5 17 32                         ; s3_6_c15_c2_1.c:17:32
Lloh56:
	adrp	x0, l___unnamed_27@PAGE
Lloh57:
	add	x0, x0, l___unnamed_27@PAGEOFF
	stp	x11, x8, [x29, #-16]            ; 16-byte Folded Spill
	mov	x1, x8
	bl	___ubsan_handle_type_mismatch_v1
Ltmp61:
	.loc	5 0 32                          ; s3_6_c15_c2_1.c:0:32
	ldp	x11, x8, [x29, #-16]            ; 16-byte Folded Reload
	b	LBB2_17
Ltmp62:
	.loh AdrpAdd	Lloh28, Lloh29
	.loh AdrpAdd	Lloh30, Lloh31
	.loh AdrpAdd	Lloh32, Lloh33
	.loh AdrpAdd	Lloh34, Lloh35
	.loh AdrpAdd	Lloh36, Lloh37
	.loh AdrpAdd	Lloh38, Lloh39
	.loh AdrpAdd	Lloh40, Lloh41
	.loh AdrpAdd	Lloh42, Lloh43
	.loh AdrpAdd	Lloh44, Lloh45
	.loh AdrpAdd	Lloh46, Lloh47
	.loh AdrpAdd	Lloh48, Lloh49
	.loh AdrpAdd	Lloh50, Lloh51
	.loh AdrpAdd	Lloh52, Lloh53
	.loh AdrpAdd	Lloh54, Lloh55
	.loh AdrpAdd	Lloh56, Lloh57
Lfunc_end2:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function write_sprr_perm
_write_sprr_perm:                       ; @write_sprr_perm
Lfunc_begin3:
	.loc	5 30 0 is_stmt 1                ; s3_6_c15_c2_1.c:30:0
	.cfi_startproc
; %bb.0:
	;DEBUG_VALUE: write_sprr_perm:v <- $x0
	;DEBUG_VALUE: write_sprr_perm:v <- $x0
	.loc	5 31 5 prologue_end             ; s3_6_c15_c2_1.c:31:5
	; InlineAsm Start
	msr	S3_6_C15_C2_1, x0
	isb

	; InlineAsm End
	.loc	5 34 1                          ; s3_6_c15_c2_1.c:34:1
	ret
Ltmp63:
Lfunc_end3:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function sprr_test
_sprr_test:                             ; @sprr_test
Lfunc_begin4:
	.loc	5 85 0                          ; s3_6_c15_c2_1.c:85:0
	.cfi_startproc
; %bb.0:
	;DEBUG_VALUE: sprr_test:ptr <- $x0
	;DEBUG_VALUE: sprr_test:v <- $x1
	sub	sp, sp, #80                     ; =80
	stp	x22, x21, [sp, #32]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64                    ; =64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	mov	x19, x1
	mov	x20, x0
Ltmp64:
	;DEBUG_VALUE: sprr_test:v <- $x19
	;DEBUG_VALUE: sprr_test:ptr <- $x20
	.loc	5 87 9 prologue_end             ; s3_6_c15_c2_1.c:87:9
	bl	_read_sprr_perm
Ltmp65:
	;DEBUG_VALUE: sprr_test:a <- undef
	.loc	5 88 5                          ; s3_6_c15_c2_1.c:88:5
	mov	x0, x19
Ltmp66:
	;DEBUG_VALUE: sprr_test:v <- $x0
	bl	_write_sprr_perm
Ltmp67:
	.loc	5 89 9                          ; s3_6_c15_c2_1.c:89:9
	bl	_read_sprr_perm
Ltmp68:
	mov	x19, x0
Ltmp69:
	;DEBUG_VALUE: sprr_test:b <- $x19
	.loc	5 91 33                         ; s3_6_c15_c2_1.c:91:33
	mov	x0, x20
	bl	_can_read
Ltmp70:
	mov	x21, x0
	.loc	5 91 60 is_stmt 0               ; s3_6_c15_c2_1.c:91:60
	mov	x0, x20
	bl	_can_write
Ltmp71:
	mov	x22, x0
	.loc	5 92 12 is_stmt 1               ; s3_6_c15_c2_1.c:92:12
	mov	x0, x20
	bl	_can_exec
Ltmp72:
	.loc	5 91 5                          ; s3_6_c15_c2_1.c:91:5
	cmp	w0, #0                          ; =0
	mov	w8, #45
	mov	w9, #120
	csel	x9, x9, x8, ne
	cmp	w22, #0                         ; =0
	mov	w10, #119
	csel	x10, x10, x8, ne
	stp	x10, x9, [sp, #16]
	cmp	w21, #0                         ; =0
	mov	w9, #114
	csel	x8, x9, x8, ne
	stp	x19, x8, [sp]
Lloh58:
	adrp	x0, l_.str@PAGE
Lloh59:
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
Ltmp73:
	.loc	5 93 1                          ; s3_6_c15_c2_1.c:93:1
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
Ltmp74:
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #80                     ; =80
	ret
Ltmp75:
	.loh AdrpAdd	Lloh58, Lloh59
Lfunc_end4:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function make_sprr_val
_make_sprr_val:                         ; @make_sprr_val
Lfunc_begin5:
	.loc	5 96 0                          ; s3_6_c15_c2_1.c:96:0
	.cfi_startproc
; %bb.0:
	;DEBUG_VALUE: make_sprr_val:nibble <- $w0
                                        ; kill: def $w0 killed $w0 def $x0
	mov	x9, #0
	mov	x8, #0
Ltmp76:
	;DEBUG_VALUE: i <- 0
	;DEBUG_VALUE: make_sprr_val:res <- 0
	;DEBUG_VALUE: make_sprr_val:nibble <- $w0
LBB5_1:                                 ; =>This Inner Loop Header: Depth=1
	;DEBUG_VALUE: make_sprr_val:nibble <- $w0
	;DEBUG_VALUE: make_sprr_val:res <- $x8
	;DEBUG_VALUE: i <- undef
	.loc	5 99 35 prologue_end            ; s3_6_c15_c2_1.c:99:35
	lsl	x10, x0, x9
	.loc	5 99 13 is_stmt 0               ; s3_6_c15_c2_1.c:99:13
	orr	x8, x10, x8
Ltmp77:
	;DEBUG_VALUE: i <- [DW_OP_plus_uconst 1, DW_OP_stack_value] undef
	;DEBUG_VALUE: make_sprr_val:res <- $x8
	.loc	5 98 23 is_stmt 1               ; s3_6_c15_c2_1.c:98:23
	add	x9, x9, #4                      ; =4
Ltmp78:
	.loc	5 98 5 is_stmt 0                ; s3_6_c15_c2_1.c:98:5
	cmp	x9, #64                         ; =64
	b.ne	LBB5_1
Ltmp79:
; %bb.2:
	;DEBUG_VALUE: make_sprr_val:res <- $x8
	;DEBUG_VALUE: make_sprr_val:nibble <- $w0
	;DEBUG_VALUE: make_sprr_val:res <- $x8
	.loc	5 100 5 is_stmt 1               ; s3_6_c15_c2_1.c:100:5
	mov	x0, x8
Ltmp80:
	;DEBUG_VALUE: make_sprr_val:nibble <- [DW_OP_LLVM_entry_value 1] $w0
	ret
Ltmp81:
Lfunc_end5:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function read_sprr_perm
_read_sprr_perm:                        ; @read_sprr_perm
Lfunc_begin6:
	.loc	5 37 0                          ; s3_6_c15_c2_1.c:37:0
	.cfi_startproc
; %bb.0:
	.loc	5 39 5 prologue_end             ; s3_6_c15_c2_1.c:39:5
	; InlineAsm Start
	isb
	mrs	x0, S3_6_C15_C2_1

	; InlineAsm End
Ltmp82:
	;DEBUG_VALUE: read_sprr_perm:v <- $x0
	.loc	5 42 5                          ; s3_6_c15_c2_1.c:42:5
	ret
Ltmp83:
Lfunc_end6:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function can_read
_can_read:                              ; @can_read
Lfunc_begin7:
	.loc	5 46 0                          ; s3_6_c15_c2_1.c:46:0
	.cfi_startproc
; %bb.0:
	;DEBUG_VALUE: can_read:ptr <- $x0
	mov	x8, x0
Ltmp84:
	;DEBUG_VALUE: can_read:v <- 0
	;DEBUG_VALUE: can_read:ptr <- $x8
	.loc	5 49 5 prologue_end             ; s3_6_c15_c2_1.c:49:5
	; InlineAsm Start
	ldr	x0, [x8]
	mov	x8, x0

	; InlineAsm End
Ltmp85:
	;DEBUG_VALUE: can_read:v <- $x8
	.loc	5 0 5 is_stmt 0                 ; s3_6_c15_c2_1.c:0:5
	mov	w9, #48879
	movk	w9, #57005, lsl #16
Ltmp86:
	.loc	5 55 11 is_stmt 1               ; s3_6_c15_c2_1.c:55:11
	cmp	x8, x9
	cset	w0, ne
Ltmp87:
	.loc	5 58 1                          ; s3_6_c15_c2_1.c:58:1
	ret
Ltmp88:
Lfunc_end7:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function can_write
_can_write:                             ; @can_write
Lfunc_begin8:
	.loc	5 61 0                          ; s3_6_c15_c2_1.c:61:0
	.cfi_startproc
; %bb.0:
	;DEBUG_VALUE: can_write:ptr <- $x0
	;DEBUG_VALUE: can_write:ptr <- $x0
	;DEBUG_VALUE: can_write:v <- 0
	.loc	5 67 36 prologue_end            ; s3_6_c15_c2_1.c:67:36
	add	x8, x0, #8                      ; =8
	.loc	5 64 5                          ; s3_6_c15_c2_1.c:64:5
	; InlineAsm Start
	str	x0, [x8]
	mov	x8, x0

	; InlineAsm End
Ltmp89:
	;DEBUG_VALUE: can_write:ptr <- [DW_OP_LLVM_entry_value 1] $x0
	;DEBUG_VALUE: can_write:v <- $x8
	.loc	5 0 5 is_stmt 0                 ; s3_6_c15_c2_1.c:0:5
	mov	w9, #48879
	movk	w9, #57005, lsl #16
Ltmp90:
	.loc	5 70 11 is_stmt 1               ; s3_6_c15_c2_1.c:70:11
	cmp	x8, x9
	cset	w0, ne
Ltmp91:
	.loc	5 73 1                          ; s3_6_c15_c2_1.c:73:1
	ret
Ltmp92:
Lfunc_end8:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function can_exec
_can_exec:                              ; @can_exec
Lfunc_begin9:
	.loc	5 76 0                          ; s3_6_c15_c2_1.c:76:0
	.cfi_startproc
; %bb.0:
	;DEBUG_VALUE: can_exec:ptr <- $x0
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	x8, x0
Ltmp93:
	;DEBUG_VALUE: can_exec:fun_ptr <- $x8
	;DEBUG_VALUE: can_exec:ptr <- $x8
	.loc	5 78 20 prologue_end            ; s3_6_c15_c2_1.c:78:20
	mov	x0, #0
	blr	x8
Ltmp94:
	;DEBUG_VALUE: can_exec:res <- $x0
	.loc	5 0 20 is_stmt 0                ; s3_6_c15_c2_1.c:0:20
	mov	w8, #48879
	movk	w8, #57005, lsl #16
Ltmp95:
	.loc	5 79 13 is_stmt 1               ; s3_6_c15_c2_1.c:79:13
	cmp	x0, x8
	cset	w0, ne
Ltmp96:
	.loc	5 82 1                          ; s3_6_c15_c2_1.c:82:1
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
Ltmp97:
Lfunc_end9:
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.src:                                 ; @.src
	.asciz	"s3_6_c15_c2_1.c"

	.section	__DATA,__data
	.p2align	3                               ; @0
l___unnamed_1:
	.quad	l_.src
	.long	119                             ; 0x77
	.long	5                               ; 0x5

	.section	__TEXT,__const
	.p2align	4                               ; @1
l___unnamed_28:
	.short	0                               ; 0x0
	.short	10                              ; 0xa
	.asciz	"'uint32_t' (aka 'unsigned int')"

	.section	__DATA,__data
	.p2align	4                               ; @2
l___unnamed_2:
	.quad	l_.src
	.long	119                             ; 0x77
	.long	5                               ; 0x5
	.quad	l___unnamed_28
	.byte	2                               ; 0x2
	.byte	1                               ; 0x1
	.space	6

	.section	__TEXT,__const
	.p2align	4                               ; @3
l___unnamed_29:
	.short	65535                           ; 0xffff
	.short	0                               ; 0x0
	.asciz	"'ucontext_t' (aka 'struct __darwin_ucontext')"

	.section	__DATA,__data
	.p2align	4                               ; @4
l___unnamed_3:
	.quad	l_.src
	.long	25                              ; 0x19
	.long	9                               ; 0x9
	.quad	l___unnamed_29
	.byte	4                               ; 0x4
	.byte	3                               ; 0x3
	.space	6

	.section	__TEXT,__const
	.p2align	4                               ; @5
l___unnamed_30:
	.short	65535                           ; 0xffff
	.short	0                               ; 0x0
	.asciz	"'struct __darwin_mcontext64 *'"
	.space	1

	.section	__DATA,__data
	.p2align	4                               ; @6
l___unnamed_4:
	.quad	l_.src
	.long	25                              ; 0x19
	.long	9                               ; 0x9
	.quad	l___unnamed_30
	.byte	4                               ; 0x4
	.byte	0                               ; 0x0
	.space	6

	.section	__TEXT,__const
	.p2align	4                               ; @7
l___unnamed_31:
	.short	65535                           ; 0xffff
	.short	0                               ; 0x0
	.asciz	"'struct __darwin_mcontext64'"
	.space	1

	.section	__DATA,__data
	.p2align	4                               ; @8
l___unnamed_5:
	.quad	l_.src
	.long	25                              ; 0x19
	.long	22                              ; 0x16
	.quad	l___unnamed_31
	.byte	4                               ; 0x4
	.byte	3                               ; 0x3
	.space	6

	.section	__TEXT,__const
	.p2align	4                               ; @9
l___unnamed_32:
	.short	65535                           ; 0xffff
	.short	0                               ; 0x0
	.asciz	"'struct __darwin_arm_thread_state64'"
	.space	1

	.section	__DATA,__data
	.p2align	4                               ; @10
l___unnamed_6:
	.quad	l_.src
	.long	25                              ; 0x19
	.long	22                              ; 0x16
	.quad	l___unnamed_32
	.byte	4                               ; 0x4
	.byte	3                               ; 0x3
	.space	6

	.section	__TEXT,__const
	.p2align	4                               ; @11
l___unnamed_33:
	.short	0                               ; 0x0
	.short	12                              ; 0xc
	.asciz	"'__uint64_t' (aka 'unsigned long long')"

	.section	__DATA,__data
	.p2align	4                               ; @12
l___unnamed_7:
	.quad	l_.src
	.long	25                              ; 0x19
	.long	5                               ; 0x5
	.quad	l___unnamed_33
	.byte	4                               ; 0x4
	.byte	1                               ; 0x1
	.space	6

	.p2align	4                               ; @13
l___unnamed_8:
	.quad	l_.src
	.long	26                              ; 0x1a
	.long	9                               ; 0x9
	.quad	l___unnamed_29
	.byte	4                               ; 0x4
	.byte	3                               ; 0x3
	.space	6

	.p2align	4                               ; @14
l___unnamed_9:
	.quad	l_.src
	.long	26                              ; 0x1a
	.long	9                               ; 0x9
	.quad	l___unnamed_30
	.byte	4                               ; 0x4
	.byte	0                               ; 0x0
	.space	6

	.p2align	4                               ; @15
l___unnamed_10:
	.quad	l_.src
	.long	26                              ; 0x1a
	.long	22                              ; 0x16
	.quad	l___unnamed_31
	.byte	4                               ; 0x4
	.byte	3                               ; 0x3
	.space	6

	.p2align	4                               ; @16
l___unnamed_11:
	.quad	l_.src
	.long	26                              ; 0x1a
	.long	22                              ; 0x16
	.quad	l___unnamed_32
	.byte	4                               ; 0x4
	.byte	3                               ; 0x3
	.space	6

	.p2align	4                               ; @17
l___unnamed_12:
	.quad	l_.src
	.long	26                              ; 0x1a
	.long	27                              ; 0x1b
	.quad	l___unnamed_33
	.byte	4                               ; 0x4
	.byte	1                               ; 0x1
	.space	6

	.p2align	4                               ; @18
l___unnamed_13:
	.quad	l_.src
	.long	16                              ; 0x10
	.long	9                               ; 0x9
	.quad	l___unnamed_29
	.byte	4                               ; 0x4
	.byte	3                               ; 0x3
	.space	6

	.p2align	4                               ; @19
l___unnamed_14:
	.quad	l_.src
	.long	16                              ; 0x10
	.long	9                               ; 0x9
	.quad	l___unnamed_30
	.byte	4                               ; 0x4
	.byte	0                               ; 0x0
	.space	6

	.p2align	4                               ; @20
l___unnamed_15:
	.quad	l_.src
	.long	16                              ; 0x10
	.long	22                              ; 0x16
	.quad	l___unnamed_31
	.byte	4                               ; 0x4
	.byte	3                               ; 0x3
	.space	6

	.p2align	4                               ; @21
l___unnamed_16:
	.quad	l_.src
	.long	16                              ; 0x10
	.long	22                              ; 0x16
	.quad	l___unnamed_32
	.byte	4                               ; 0x4
	.byte	3                               ; 0x3
	.space	6

	.p2align	4                               ; @22
l___unnamed_17:
	.quad	l_.src
	.long	16                              ; 0x10
	.long	5                               ; 0x5
	.quad	l___unnamed_33
	.byte	4                               ; 0x4
	.byte	1                               ; 0x1
	.space	6

	.p2align	4                               ; @23
l___unnamed_18:
	.quad	l_.src
	.long	17                              ; 0x11
	.long	38                              ; 0x26
	.quad	l___unnamed_29
	.byte	4                               ; 0x4
	.byte	3                               ; 0x3
	.space	6

	.p2align	4                               ; @24
l___unnamed_19:
	.quad	l_.src
	.long	17                              ; 0x11
	.long	38                              ; 0x26
	.quad	l___unnamed_30
	.byte	4                               ; 0x4
	.byte	0                               ; 0x0
	.space	6

	.p2align	4                               ; @25
l___unnamed_20:
	.quad	l_.src
	.long	17                              ; 0x11
	.long	51                              ; 0x33
	.quad	l___unnamed_31
	.byte	4                               ; 0x4
	.byte	3                               ; 0x3
	.space	6

	.p2align	4                               ; @26
l___unnamed_21:
	.quad	l_.src
	.long	17                              ; 0x11
	.long	51                              ; 0x33
	.quad	l___unnamed_32
	.byte	4                               ; 0x4
	.byte	3                               ; 0x3
	.space	6

	.p2align	4                               ; @27
l___unnamed_22:
	.quad	l_.src
	.long	17                              ; 0x11
	.long	56                              ; 0x38
	.quad	l___unnamed_33
	.byte	4                               ; 0x4
	.byte	0                               ; 0x0
	.space	6

	.p2align	4                               ; @28
l___unnamed_23:
	.quad	l_.src
	.long	17                              ; 0x11
	.long	9                               ; 0x9
	.quad	l___unnamed_29
	.byte	4                               ; 0x4
	.byte	3                               ; 0x3
	.space	6

	.p2align	4                               ; @29
l___unnamed_24:
	.quad	l_.src
	.long	17                              ; 0x11
	.long	9                               ; 0x9
	.quad	l___unnamed_30
	.byte	4                               ; 0x4
	.byte	0                               ; 0x0
	.space	6

	.p2align	4                               ; @30
l___unnamed_25:
	.quad	l_.src
	.long	17                              ; 0x11
	.long	22                              ; 0x16
	.quad	l___unnamed_31
	.byte	4                               ; 0x4
	.byte	3                               ; 0x3
	.space	6

	.p2align	4                               ; @31
l___unnamed_26:
	.quad	l_.src
	.long	17                              ; 0x11
	.long	22                              ; 0x16
	.quad	l___unnamed_32
	.byte	4                               ; 0x4
	.byte	3                               ; 0x3
	.space	6

	.p2align	4                               ; @32
l___unnamed_27:
	.quad	l_.src
	.long	17                              ; 0x11
	.long	27                              ; 0x1b
	.quad	l___unnamed_33
	.byte	4                               ; 0x4
	.byte	1                               ; 0x1
	.space	6

	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"%llx: %c%c%c\n"

	.file	11 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_types" "_uint32_t.h"
	.file	12 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types" "_ucontext.h"
	.file	13 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types" "_sigaltstack.h"
	.file	14 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/mach/arm" "_structs.h"
	.file	15 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/arm" "_mcontext.h"
	.file	16 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_types" "_uint8_t.h"
	.section	__DWARF,__debug_loc,regular,debug
Lsection_debug_loc:
Ldebug_loc0:
.set Lset0, Lfunc_begin0-Lfunc_begin0
	.quad	Lset0
.set Lset1, Ltmp2-Lfunc_begin0
	.quad	Lset1
	.short	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
.set Lset2, Ltmp2-Lfunc_begin0
	.quad	Lset2
.set Lset3, Lfunc_end0-Lfunc_begin0
	.quad	Lset3
	.short	4                               ; Loc expr size
	.byte	163                             ; DW_OP_entry_value
	.byte	1                               ; 1
	.byte	80                              ; DW_OP_reg0
	.byte	159                             ; DW_OP_stack_value
	.quad	0
	.quad	0
Ldebug_loc1:
.set Lset4, Lfunc_begin0-Lfunc_begin0
	.quad	Lset4
.set Lset5, Ltmp1-Lfunc_begin0
	.quad	Lset5
	.short	1                               ; Loc expr size
	.byte	81                              ; DW_OP_reg1
.set Lset6, Ltmp1-Lfunc_begin0
	.quad	Lset6
.set Lset7, Lfunc_end0-Lfunc_begin0
	.quad	Lset7
	.short	4                               ; Loc expr size
	.byte	163                             ; DW_OP_entry_value
	.byte	1                               ; 1
	.byte	81                              ; DW_OP_reg1
	.byte	159                             ; DW_OP_stack_value
	.quad	0
	.quad	0
Ldebug_loc2:
.set Lset8, Ltmp6-Lfunc_begin0
	.quad	Lset8
.set Lset9, Ltmp16-Lfunc_begin0
	.quad	Lset9
	.short	1                               ; Loc expr size
	.byte	99                              ; DW_OP_reg19
.set Lset10, Ltmp17-Lfunc_begin0
	.quad	Lset10
.set Lset11, Lfunc_end0-Lfunc_begin0
	.quad	Lset11
	.short	1                               ; Loc expr size
	.byte	99                              ; DW_OP_reg19
	.quad	0
	.quad	0
Ldebug_loc3:
.set Lset12, Ltmp11-Lfunc_begin0
	.quad	Lset12
.set Lset13, Ltmp15-Lfunc_begin0
	.quad	Lset13
	.short	1                               ; Loc expr size
	.byte	100                             ; DW_OP_reg20
	.quad	0
	.quad	0
Ldebug_loc4:
.set Lset14, Lfunc_begin1-Lfunc_begin0
	.quad	Lset14
.set Lset15, Ltmp23-Lfunc_begin0
	.quad	Lset15
	.short	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
.set Lset16, Ltmp24-Lfunc_begin0
	.quad	Lset16
.set Lset17, Ltmp25-Lfunc_begin0
	.quad	Lset17
	.short	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
.set Lset18, Ltmp25-Lfunc_begin0
	.quad	Lset18
.set Lset19, Ltmp29-Lfunc_begin0
	.quad	Lset19
	.short	4                               ; Loc expr size
	.byte	163                             ; DW_OP_entry_value
	.byte	1                               ; 1
	.byte	80                              ; DW_OP_reg0
	.byte	159                             ; DW_OP_stack_value
	.quad	0
	.quad	0
Ldebug_loc5:
.set Lset20, Lfunc_begin1-Lfunc_begin0
	.quad	Lset20
.set Lset21, Ltmp23-Lfunc_begin0
	.quad	Lset21
	.short	1                               ; Loc expr size
	.byte	81                              ; DW_OP_reg1
.set Lset22, Ltmp24-Lfunc_begin0
	.quad	Lset22
.set Lset23, Ltmp26-Lfunc_begin0
	.quad	Lset23
	.short	1                               ; Loc expr size
	.byte	81                              ; DW_OP_reg1
.set Lset24, Ltmp26-Lfunc_begin0
	.quad	Lset24
.set Lset25, Ltmp29-Lfunc_begin0
	.quad	Lset25
	.short	4                               ; Loc expr size
	.byte	163                             ; DW_OP_entry_value
	.byte	1                               ; 1
	.byte	81                              ; DW_OP_reg1
	.byte	159                             ; DW_OP_stack_value
	.quad	0
	.quad	0
Ldebug_loc6:
.set Lset26, Lfunc_begin1-Lfunc_begin0
	.quad	Lset26
.set Lset27, Ltmp23-Lfunc_begin0
	.quad	Lset27
	.short	1                               ; Loc expr size
	.byte	82                              ; DW_OP_reg2
.set Lset28, Ltmp24-Lfunc_begin0
	.quad	Lset28
.set Lset29, Ltmp27-Lfunc_begin0
	.quad	Lset29
	.short	1                               ; Loc expr size
	.byte	82                              ; DW_OP_reg2
.set Lset30, Ltmp27-Lfunc_begin0
	.quad	Lset30
.set Lset31, Ltmp29-Lfunc_begin0
	.quad	Lset31
	.short	2                               ; Loc expr size
	.byte	141                             ; DW_OP_breg29
	.byte	112                             ; -16
	.quad	0
	.quad	0
Ldebug_loc7:
.set Lset32, Ltmp22-Lfunc_begin0
	.quad	Lset32
.set Lset33, Ltmp23-Lfunc_begin0
	.quad	Lset33
	.short	1                               ; Loc expr size
	.byte	82                              ; DW_OP_reg2
.set Lset34, Ltmp24-Lfunc_begin0
	.quad	Lset34
.set Lset35, Ltmp28-Lfunc_begin0
	.quad	Lset35
	.short	1                               ; Loc expr size
	.byte	82                              ; DW_OP_reg2
	.quad	0
	.quad	0
Ldebug_loc8:
.set Lset36, Lfunc_begin2-Lfunc_begin0
	.quad	Lset36
.set Lset37, Ltmp41-Lfunc_begin0
	.quad	Lset37
	.short	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
.set Lset38, Ltmp42-Lfunc_begin0
	.quad	Lset38
.set Lset39, Ltmp43-Lfunc_begin0
	.quad	Lset39
	.short	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
.set Lset40, Ltmp43-Lfunc_begin0
	.quad	Lset40
.set Lset41, Ltmp47-Lfunc_begin0
	.quad	Lset41
	.short	4                               ; Loc expr size
	.byte	163                             ; DW_OP_entry_value
	.byte	1                               ; 1
	.byte	80                              ; DW_OP_reg0
	.byte	159                             ; DW_OP_stack_value
	.quad	0
	.quad	0
Ldebug_loc9:
.set Lset42, Lfunc_begin2-Lfunc_begin0
	.quad	Lset42
.set Lset43, Ltmp41-Lfunc_begin0
	.quad	Lset43
	.short	1                               ; Loc expr size
	.byte	81                              ; DW_OP_reg1
.set Lset44, Ltmp42-Lfunc_begin0
	.quad	Lset44
.set Lset45, Ltmp44-Lfunc_begin0
	.quad	Lset45
	.short	1                               ; Loc expr size
	.byte	81                              ; DW_OP_reg1
.set Lset46, Ltmp44-Lfunc_begin0
	.quad	Lset46
.set Lset47, Ltmp47-Lfunc_begin0
	.quad	Lset47
	.short	4                               ; Loc expr size
	.byte	163                             ; DW_OP_entry_value
	.byte	1                               ; 1
	.byte	81                              ; DW_OP_reg1
	.byte	159                             ; DW_OP_stack_value
	.quad	0
	.quad	0
Ldebug_loc10:
.set Lset48, Lfunc_begin2-Lfunc_begin0
	.quad	Lset48
.set Lset49, Ltmp41-Lfunc_begin0
	.quad	Lset49
	.short	1                               ; Loc expr size
	.byte	82                              ; DW_OP_reg2
.set Lset50, Ltmp42-Lfunc_begin0
	.quad	Lset50
.set Lset51, Ltmp45-Lfunc_begin0
	.quad	Lset51
	.short	1                               ; Loc expr size
	.byte	82                              ; DW_OP_reg2
.set Lset52, Ltmp45-Lfunc_begin0
	.quad	Lset52
.set Lset53, Ltmp47-Lfunc_begin0
	.quad	Lset53
	.short	2                               ; Loc expr size
	.byte	141                             ; DW_OP_breg29
	.byte	112                             ; -16
	.quad	0
	.quad	0
Ldebug_loc11:
.set Lset54, Ltmp40-Lfunc_begin0
	.quad	Lset54
.set Lset55, Ltmp41-Lfunc_begin0
	.quad	Lset55
	.short	1                               ; Loc expr size
	.byte	82                              ; DW_OP_reg2
.set Lset56, Ltmp42-Lfunc_begin0
	.quad	Lset56
.set Lset57, Ltmp46-Lfunc_begin0
	.quad	Lset57
	.short	1                               ; Loc expr size
	.byte	82                              ; DW_OP_reg2
	.quad	0
	.quad	0
Ldebug_loc12:
.set Lset58, Lfunc_begin4-Lfunc_begin0
	.quad	Lset58
.set Lset59, Ltmp64-Lfunc_begin0
	.quad	Lset59
	.short	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
.set Lset60, Ltmp64-Lfunc_begin0
	.quad	Lset60
.set Lset61, Ltmp74-Lfunc_begin0
	.quad	Lset61
	.short	1                               ; Loc expr size
	.byte	100                             ; DW_OP_reg20
	.quad	0
	.quad	0
Ldebug_loc13:
.set Lset62, Lfunc_begin4-Lfunc_begin0
	.quad	Lset62
.set Lset63, Ltmp64-Lfunc_begin0
	.quad	Lset63
	.short	1                               ; Loc expr size
	.byte	81                              ; DW_OP_reg1
.set Lset64, Ltmp64-Lfunc_begin0
	.quad	Lset64
.set Lset65, Ltmp66-Lfunc_begin0
	.quad	Lset65
	.short	1                               ; Loc expr size
	.byte	99                              ; DW_OP_reg19
.set Lset66, Ltmp66-Lfunc_begin0
	.quad	Lset66
.set Lset67, Ltmp67-Lfunc_begin0
	.quad	Lset67
	.short	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
	.quad	0
	.quad	0
Ldebug_loc14:
.set Lset68, Ltmp69-Lfunc_begin0
	.quad	Lset68
.set Lset69, Ltmp74-Lfunc_begin0
	.quad	Lset69
	.short	1                               ; Loc expr size
	.byte	99                              ; DW_OP_reg19
	.quad	0
	.quad	0
Ldebug_loc15:
.set Lset70, Lfunc_begin5-Lfunc_begin0
	.quad	Lset70
.set Lset71, Ltmp80-Lfunc_begin0
	.quad	Lset71
	.short	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
.set Lset72, Ltmp80-Lfunc_begin0
	.quad	Lset72
.set Lset73, Lfunc_end5-Lfunc_begin0
	.quad	Lset73
	.short	4                               ; Loc expr size
	.byte	163                             ; DW_OP_entry_value
	.byte	1                               ; 1
	.byte	80                              ; DW_OP_reg0
	.byte	159                             ; DW_OP_stack_value
	.quad	0
	.quad	0
Ldebug_loc16:
.set Lset74, Ltmp76-Lfunc_begin0
	.quad	Lset74
.set Lset75, Lfunc_end5-Lfunc_begin0
	.quad	Lset75
	.short	1                               ; Loc expr size
	.byte	88                              ; DW_OP_reg8
	.quad	0
	.quad	0
Ldebug_loc17:
.set Lset76, Ltmp82-Lfunc_begin0
	.quad	Lset76
.set Lset77, Lfunc_end6-Lfunc_begin0
	.quad	Lset77
	.short	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
	.quad	0
	.quad	0
Ldebug_loc18:
.set Lset78, Lfunc_begin7-Lfunc_begin0
	.quad	Lset78
.set Lset79, Ltmp84-Lfunc_begin0
	.quad	Lset79
	.short	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
.set Lset80, Ltmp84-Lfunc_begin0
	.quad	Lset80
.set Lset81, Ltmp85-Lfunc_begin0
	.quad	Lset81
	.short	1                               ; Loc expr size
	.byte	88                              ; DW_OP_reg8
	.quad	0
	.quad	0
Ldebug_loc19:
.set Lset82, Ltmp84-Lfunc_begin0
	.quad	Lset82
.set Lset83, Ltmp85-Lfunc_begin0
	.quad	Lset83
	.short	2                               ; Loc expr size
	.byte	48                              ; DW_OP_lit0
	.byte	159                             ; DW_OP_stack_value
.set Lset84, Ltmp85-Lfunc_begin0
	.quad	Lset84
.set Lset85, Lfunc_end7-Lfunc_begin0
	.quad	Lset85
	.short	1                               ; Loc expr size
	.byte	88                              ; DW_OP_reg8
	.quad	0
	.quad	0
Ldebug_loc20:
.set Lset86, Lfunc_begin8-Lfunc_begin0
	.quad	Lset86
.set Lset87, Ltmp89-Lfunc_begin0
	.quad	Lset87
	.short	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
.set Lset88, Ltmp89-Lfunc_begin0
	.quad	Lset88
.set Lset89, Lfunc_end8-Lfunc_begin0
	.quad	Lset89
	.short	4                               ; Loc expr size
	.byte	163                             ; DW_OP_entry_value
	.byte	1                               ; 1
	.byte	80                              ; DW_OP_reg0
	.byte	159                             ; DW_OP_stack_value
	.quad	0
	.quad	0
Ldebug_loc21:
.set Lset90, Lfunc_begin8-Lfunc_begin0
	.quad	Lset90
.set Lset91, Ltmp89-Lfunc_begin0
	.quad	Lset91
	.short	2                               ; Loc expr size
	.byte	48                              ; DW_OP_lit0
	.byte	159                             ; DW_OP_stack_value
.set Lset92, Ltmp89-Lfunc_begin0
	.quad	Lset92
.set Lset93, Lfunc_end8-Lfunc_begin0
	.quad	Lset93
	.short	1                               ; Loc expr size
	.byte	88                              ; DW_OP_reg8
	.quad	0
	.quad	0
Ldebug_loc22:
.set Lset94, Lfunc_begin9-Lfunc_begin0
	.quad	Lset94
.set Lset95, Ltmp93-Lfunc_begin0
	.quad	Lset95
	.short	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
.set Lset96, Ltmp93-Lfunc_begin0
	.quad	Lset96
.set Lset97, Ltmp94-Lfunc_begin0
	.quad	Lset97
	.short	1                               ; Loc expr size
	.byte	88                              ; DW_OP_reg8
	.quad	0
	.quad	0
Ldebug_loc23:
.set Lset98, Ltmp93-Lfunc_begin0
	.quad	Lset98
.set Lset99, Ltmp94-Lfunc_begin0
	.quad	Lset99
	.short	1                               ; Loc expr size
	.byte	88                              ; DW_OP_reg8
	.quad	0
	.quad	0
Ldebug_loc24:
.set Lset100, Ltmp94-Lfunc_begin0
	.quad	Lset100
.set Lset101, Ltmp96-Lfunc_begin0
	.quad	Lset101
	.short	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
	.quad	0
	.quad	0
	.section	__DWARF,__debug_abbrev,regular,debug
Lsection_abbrev:
	.byte	1                               ; Abbreviation Code
	.byte	17                              ; DW_TAG_compile_unit
	.byte	1                               ; DW_CHILDREN_yes
	.byte	37                              ; DW_AT_producer
	.byte	14                              ; DW_FORM_strp
	.byte	19                              ; DW_AT_language
	.byte	5                               ; DW_FORM_data2
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.ascii	"\202|"                         ; DW_AT_LLVM_sysroot
	.byte	14                              ; DW_FORM_strp
	.ascii	"\357\177"                      ; DW_AT_APPLE_sdk
	.byte	14                              ; DW_FORM_strp
	.byte	16                              ; DW_AT_stmt_list
	.byte	23                              ; DW_FORM_sec_offset
	.byte	27                              ; DW_AT_comp_dir
	.byte	14                              ; DW_FORM_strp
	.ascii	"\341\177"                      ; DW_AT_APPLE_optimized
	.byte	25                              ; DW_FORM_flag_present
	.byte	17                              ; DW_AT_low_pc
	.byte	1                               ; DW_FORM_addr
	.byte	18                              ; DW_AT_high_pc
	.byte	6                               ; DW_FORM_data4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	2                               ; Abbreviation Code
	.byte	22                              ; DW_TAG_typedef
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	3                               ; Abbreviation Code
	.byte	36                              ; DW_TAG_base_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	62                              ; DW_AT_encoding
	.byte	11                              ; DW_FORM_data1
	.byte	11                              ; DW_AT_byte_size
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	4                               ; Abbreviation Code
	.byte	15                              ; DW_TAG_pointer_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	5                               ; Abbreviation Code
	.byte	46                              ; DW_TAG_subprogram
	.byte	1                               ; DW_CHILDREN_yes
	.byte	17                              ; DW_AT_low_pc
	.byte	1                               ; DW_FORM_addr
	.byte	18                              ; DW_AT_high_pc
	.byte	6                               ; DW_FORM_data4
	.byte	64                              ; DW_AT_frame_base
	.byte	24                              ; DW_FORM_exprloc
	.byte	122                             ; DW_AT_call_all_calls
	.byte	25                              ; DW_FORM_flag_present
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	39                              ; DW_AT_prototyped
	.byte	25                              ; DW_FORM_flag_present
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	63                              ; DW_AT_external
	.byte	25                              ; DW_FORM_flag_present
	.ascii	"\341\177"                      ; DW_AT_APPLE_optimized
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	6                               ; Abbreviation Code
	.byte	5                               ; DW_TAG_formal_parameter
	.byte	0                               ; DW_CHILDREN_no
	.byte	2                               ; DW_AT_location
	.byte	23                              ; DW_FORM_sec_offset
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	7                               ; Abbreviation Code
	.byte	52                              ; DW_TAG_variable
	.byte	0                               ; DW_CHILDREN_no
	.byte	2                               ; DW_AT_location
	.byte	24                              ; DW_FORM_exprloc
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	8                               ; Abbreviation Code
	.byte	52                              ; DW_TAG_variable
	.byte	0                               ; DW_CHILDREN_no
	.byte	2                               ; DW_AT_location
	.byte	23                              ; DW_FORM_sec_offset
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	9                               ; Abbreviation Code
	.byte	11                              ; DW_TAG_lexical_block
	.byte	1                               ; DW_CHILDREN_yes
	.byte	17                              ; DW_AT_low_pc
	.byte	1                               ; DW_FORM_addr
	.byte	18                              ; DW_AT_high_pc
	.byte	6                               ; DW_FORM_data4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	10                              ; Abbreviation Code
	.byte	72                              ; DW_TAG_call_site
	.byte	1                               ; DW_CHILDREN_yes
	.byte	127                             ; DW_AT_call_origin
	.byte	19                              ; DW_FORM_ref4
	.byte	125                             ; DW_AT_call_return_pc
	.byte	1                               ; DW_FORM_addr
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	11                              ; Abbreviation Code
	.byte	73                              ; DW_TAG_call_site_parameter
	.byte	0                               ; DW_CHILDREN_no
	.byte	2                               ; DW_AT_location
	.byte	24                              ; DW_FORM_exprloc
	.byte	126                             ; DW_AT_call_value
	.byte	24                              ; DW_FORM_exprloc
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	12                              ; Abbreviation Code
	.byte	72                              ; DW_TAG_call_site
	.byte	0                               ; DW_CHILDREN_no
	.byte	127                             ; DW_AT_call_origin
	.byte	19                              ; DW_FORM_ref4
	.byte	125                             ; DW_AT_call_return_pc
	.byte	1                               ; DW_FORM_addr
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	13                              ; Abbreviation Code
	.byte	46                              ; DW_TAG_subprogram
	.byte	1                               ; DW_CHILDREN_yes
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	39                              ; DW_AT_prototyped
	.byte	25                              ; DW_FORM_flag_present
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	60                              ; DW_AT_declaration
	.byte	25                              ; DW_FORM_flag_present
	.byte	63                              ; DW_AT_external
	.byte	25                              ; DW_FORM_flag_present
	.ascii	"\341\177"                      ; DW_AT_APPLE_optimized
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	14                              ; Abbreviation Code
	.byte	5                               ; DW_TAG_formal_parameter
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	15                              ; Abbreviation Code
	.byte	15                              ; DW_TAG_pointer_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	16                              ; Abbreviation Code
	.byte	38                              ; DW_TAG_const_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	17                              ; Abbreviation Code
	.byte	19                              ; DW_TAG_structure_type
	.byte	1                               ; DW_CHILDREN_yes
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	11                              ; DW_AT_byte_size
	.byte	11                              ; DW_FORM_data1
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	5                               ; DW_FORM_data2
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	18                              ; Abbreviation Code
	.byte	13                              ; DW_TAG_member
	.byte	0                               ; DW_CHILDREN_no
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	5                               ; DW_FORM_data2
	.byte	56                              ; DW_AT_data_member_location
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	19                              ; Abbreviation Code
	.byte	23                              ; DW_TAG_union_type
	.byte	1                               ; DW_CHILDREN_yes
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	11                              ; DW_AT_byte_size
	.byte	11                              ; DW_FORM_data1
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	5                               ; DW_FORM_data2
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	20                              ; Abbreviation Code
	.byte	21                              ; DW_TAG_subroutine_type
	.byte	1                               ; DW_CHILDREN_yes
	.byte	39                              ; DW_AT_prototyped
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	21                              ; Abbreviation Code
	.byte	19                              ; DW_TAG_structure_type
	.byte	1                               ; DW_CHILDREN_yes
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	11                              ; DW_AT_byte_size
	.byte	11                              ; DW_FORM_data1
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	22                              ; Abbreviation Code
	.byte	13                              ; DW_TAG_member
	.byte	0                               ; DW_CHILDREN_no
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	56                              ; DW_AT_data_member_location
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	23                              ; Abbreviation Code
	.byte	23                              ; DW_TAG_union_type
	.byte	1                               ; DW_CHILDREN_yes
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	11                              ; DW_AT_byte_size
	.byte	11                              ; DW_FORM_data1
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	24                              ; Abbreviation Code
	.byte	1                               ; DW_TAG_array_type
	.byte	1                               ; DW_CHILDREN_yes
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	25                              ; Abbreviation Code
	.byte	33                              ; DW_TAG_subrange_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	55                              ; DW_AT_count
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	26                              ; Abbreviation Code
	.byte	36                              ; DW_TAG_base_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	11                              ; DW_AT_byte_size
	.byte	11                              ; DW_FORM_data1
	.byte	62                              ; DW_AT_encoding
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	27                              ; Abbreviation Code
	.byte	46                              ; DW_TAG_subprogram
	.byte	1                               ; DW_CHILDREN_yes
	.byte	110                             ; DW_AT_linkage_name
	.byte	14                              ; DW_FORM_strp
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	39                              ; DW_AT_prototyped
	.byte	25                              ; DW_FORM_flag_present
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	60                              ; DW_AT_declaration
	.byte	25                              ; DW_FORM_flag_present
	.byte	63                              ; DW_AT_external
	.byte	25                              ; DW_FORM_flag_present
	.ascii	"\341\177"                      ; DW_AT_APPLE_optimized
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	28                              ; Abbreviation Code
	.byte	46                              ; DW_TAG_subprogram
	.byte	1                               ; DW_CHILDREN_yes
	.byte	17                              ; DW_AT_low_pc
	.byte	1                               ; DW_FORM_addr
	.byte	18                              ; DW_AT_high_pc
	.byte	6                               ; DW_FORM_data4
	.ascii	"\347\177"                      ; DW_AT_APPLE_omit_frame_ptr
	.byte	25                              ; DW_FORM_flag_present
	.byte	64                              ; DW_AT_frame_base
	.byte	24                              ; DW_FORM_exprloc
	.byte	122                             ; DW_AT_call_all_calls
	.byte	25                              ; DW_FORM_flag_present
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	39                              ; DW_AT_prototyped
	.byte	25                              ; DW_FORM_flag_present
	.ascii	"\341\177"                      ; DW_AT_APPLE_optimized
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	29                              ; Abbreviation Code
	.byte	5                               ; DW_TAG_formal_parameter
	.byte	0                               ; DW_CHILDREN_no
	.byte	2                               ; DW_AT_location
	.byte	24                              ; DW_FORM_exprloc
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	30                              ; Abbreviation Code
	.byte	46                              ; DW_TAG_subprogram
	.byte	1                               ; DW_CHILDREN_yes
	.byte	17                              ; DW_AT_low_pc
	.byte	1                               ; DW_FORM_addr
	.byte	18                              ; DW_AT_high_pc
	.byte	6                               ; DW_FORM_data4
	.ascii	"\347\177"                      ; DW_AT_APPLE_omit_frame_ptr
	.byte	25                              ; DW_FORM_flag_present
	.byte	64                              ; DW_AT_frame_base
	.byte	24                              ; DW_FORM_exprloc
	.byte	122                             ; DW_AT_call_all_calls
	.byte	25                              ; DW_FORM_flag_present
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	39                              ; DW_AT_prototyped
	.byte	25                              ; DW_FORM_flag_present
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.ascii	"\341\177"                      ; DW_AT_APPLE_optimized
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	31                              ; Abbreviation Code
	.byte	52                              ; DW_TAG_variable
	.byte	0                               ; DW_CHILDREN_no
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	32                              ; Abbreviation Code
	.byte	46                              ; DW_TAG_subprogram
	.byte	1                               ; DW_CHILDREN_yes
	.byte	17                              ; DW_AT_low_pc
	.byte	1                               ; DW_FORM_addr
	.byte	18                              ; DW_AT_high_pc
	.byte	6                               ; DW_FORM_data4
	.byte	64                              ; DW_AT_frame_base
	.byte	24                              ; DW_FORM_exprloc
	.byte	122                             ; DW_AT_call_all_calls
	.byte	25                              ; DW_FORM_flag_present
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	39                              ; DW_AT_prototyped
	.byte	25                              ; DW_FORM_flag_present
	.ascii	"\341\177"                      ; DW_AT_APPLE_optimized
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	33                              ; Abbreviation Code
	.byte	46                              ; DW_TAG_subprogram
	.byte	1                               ; DW_CHILDREN_yes
	.byte	17                              ; DW_AT_low_pc
	.byte	1                               ; DW_FORM_addr
	.byte	18                              ; DW_AT_high_pc
	.byte	6                               ; DW_FORM_data4
	.byte	64                              ; DW_AT_frame_base
	.byte	24                              ; DW_FORM_exprloc
	.byte	122                             ; DW_AT_call_all_calls
	.byte	25                              ; DW_FORM_flag_present
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	39                              ; DW_AT_prototyped
	.byte	25                              ; DW_FORM_flag_present
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.ascii	"\341\177"                      ; DW_AT_APPLE_optimized
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	34                              ; Abbreviation Code
	.byte	72                              ; DW_TAG_call_site
	.byte	1                               ; DW_CHILDREN_yes
	.ascii	"\203\001"                      ; DW_AT_call_target
	.byte	24                              ; DW_FORM_exprloc
	.byte	125                             ; DW_AT_call_return_pc
	.byte	1                               ; DW_FORM_addr
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	35                              ; Abbreviation Code
	.byte	19                              ; DW_TAG_structure_type
	.byte	1                               ; DW_CHILDREN_yes
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	11                              ; DW_AT_byte_size
	.byte	5                               ; DW_FORM_data2
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	36                              ; Abbreviation Code
	.byte	13                              ; DW_TAG_member
	.byte	0                               ; DW_CHILDREN_no
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	56                              ; DW_AT_data_member_location
	.byte	5                               ; DW_FORM_data2
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	37                              ; Abbreviation Code
	.byte	19                              ; DW_TAG_structure_type
	.byte	1                               ; DW_CHILDREN_yes
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	11                              ; DW_AT_byte_size
	.byte	5                               ; DW_FORM_data2
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	5                               ; DW_FORM_data2
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	38                              ; Abbreviation Code
	.byte	13                              ; DW_TAG_member
	.byte	0                               ; DW_CHILDREN_no
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	5                               ; DW_FORM_data2
	.byte	56                              ; DW_AT_data_member_location
	.byte	5                               ; DW_FORM_data2
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	39                              ; Abbreviation Code
	.byte	21                              ; DW_TAG_subroutine_type
	.byte	1                               ; DW_CHILDREN_yes
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	39                              ; DW_AT_prototyped
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	0                               ; EOM(3)
	.section	__DWARF,__debug_info,regular,debug
Lsection_info:
Lcu_begin0:
.set Lset102, Ldebug_info_end0-Ldebug_info_start0 ; Length of Unit
	.long	Lset102
Ldebug_info_start0:
	.short	4                               ; DWARF version number
.set Lset103, Lsection_abbrev-Lsection_abbrev ; Offset Into Abbrev. Section
	.long	Lset103
	.byte	8                               ; Address Size (in bytes)
	.byte	1                               ; Abbrev [1] 0xb:0x838 DW_TAG_compile_unit
	.long	0                               ; DW_AT_producer
	.short	12                              ; DW_AT_language
	.long	47                              ; DW_AT_name
	.long	63                              ; DW_AT_LLVM_sysroot
	.long	158                             ; DW_AT_APPLE_sdk
.set Lset104, Lline_table_start0-Lsection_line ; DW_AT_stmt_list
	.long	Lset104
	.long	169                             ; DW_AT_comp_dir
                                        ; DW_AT_APPLE_optimized
	.quad	Lfunc_begin0                    ; DW_AT_low_pc
.set Lset105, Lfunc_end9-Lfunc_begin0   ; DW_AT_high_pc
	.long	Lset105
	.byte	2                               ; Abbrev [2] 0x32:0xb DW_TAG_typedef
	.long	61                              ; DW_AT_type
	.long	185                             ; DW_AT_name
	.byte	3                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	2                               ; Abbrev [2] 0x3d:0xb DW_TAG_typedef
	.long	72                              ; DW_AT_type
	.long	194                             ; DW_AT_name
	.byte	2                               ; DW_AT_decl_file
	.byte	73                              ; DW_AT_decl_line
	.byte	2                               ; Abbrev [2] 0x48:0xb DW_TAG_typedef
	.long	83                              ; DW_AT_type
	.long	212                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	21                              ; DW_AT_decl_line
	.byte	3                               ; Abbrev [3] 0x53:0x7 DW_TAG_base_type
	.long	223                             ; DW_AT_name
	.byte	7                               ; DW_AT_encoding
	.byte	4                               ; DW_AT_byte_size
	.byte	4                               ; Abbrev [4] 0x5a:0x1 DW_TAG_pointer_type
	.byte	2                               ; Abbrev [2] 0x5b:0xb DW_TAG_typedef
	.long	102                             ; DW_AT_type
	.long	236                             ; DW_AT_name
	.byte	4                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	3                               ; Abbrev [3] 0x66:0x7 DW_TAG_base_type
	.long	245                             ; DW_AT_name
	.byte	7                               ; DW_AT_encoding
	.byte	8                               ; DW_AT_byte_size
	.byte	5                               ; Abbrev [5] 0x6d:0x108 DW_TAG_subprogram
	.quad	Lfunc_begin0                    ; DW_AT_low_pc
.set Lset106, Lfunc_end0-Lfunc_begin0   ; DW_AT_high_pc
	.long	Lset106
	.byte	1                               ; DW_AT_frame_base
	.byte	109
                                        ; DW_AT_call_all_calls
	.long	268                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	103                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	400                             ; DW_AT_type
                                        ; DW_AT_external
                                        ; DW_AT_APPLE_optimized
	.byte	6                               ; Abbrev [6] 0x86:0xf DW_TAG_formal_parameter
.set Lset107, Ldebug_loc0-Lsection_debug_loc ; DW_AT_location
	.long	Lset107
	.long	704                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	103                             ; DW_AT_decl_line
	.long	400                             ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x95:0xf DW_TAG_formal_parameter
.set Lset108, Ldebug_loc1-Lsection_debug_loc ; DW_AT_location
	.long	Lset108
	.long	709                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	103                             ; DW_AT_decl_line
	.long	1561                            ; DW_AT_type
	.byte	7                               ; Abbrev [7] 0xa4:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	0
	.long	701                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	108                             ; DW_AT_decl_line
	.long	417                             ; DW_AT_type
	.byte	8                               ; Abbrev [8] 0xb2:0xf DW_TAG_variable
.set Lset109, Ldebug_loc2-Lsection_debug_loc ; DW_AT_location
	.long	Lset109
	.long	719                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	116                             ; DW_AT_decl_line
	.long	1578                            ; DW_AT_type
	.byte	9                               ; Abbrev [9] 0xc1:0x1d DW_TAG_lexical_block
	.quad	Ltmp11                          ; DW_AT_low_pc
.set Lset110, Ltmp15-Ltmp11             ; DW_AT_high_pc
	.long	Lset110
	.byte	8                               ; Abbrev [8] 0xce:0xf DW_TAG_variable
.set Lset111, Ldebug_loc3-Lsection_debug_loc ; DW_AT_location
	.long	Lset111
	.long	732                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	121                             ; DW_AT_decl_line
	.long	400                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	10                              ; Abbrev [10] 0xde:0x1e DW_TAG_call_site
	.long	373                             ; DW_AT_call_origin
	.quad	Ltmp3                           ; DW_AT_call_return_pc
	.byte	11                              ; Abbrev [11] 0xeb:0x5 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	82
	.byte	1                               ; DW_AT_call_value
	.byte	48
	.byte	11                              ; Abbrev [11] 0xf0:0x5 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	80
	.byte	1                               ; DW_AT_call_value
	.byte	58
	.byte	11                              ; Abbrev [11] 0xf5:0x6 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	81
	.byte	2                               ; DW_AT_call_value
	.byte	143
	.byte	0
	.byte	0                               ; End Of Children Mark
	.byte	10                              ; Abbrev [10] 0xfc:0x1e DW_TAG_call_site
	.long	373                             ; DW_AT_call_origin
	.quad	Ltmp4                           ; DW_AT_call_return_pc
	.byte	11                              ; Abbrev [11] 0x109:0x5 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	82
	.byte	1                               ; DW_AT_call_value
	.byte	48
	.byte	11                              ; Abbrev [11] 0x10e:0x5 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	80
	.byte	1                               ; DW_AT_call_value
	.byte	59
	.byte	11                              ; Abbrev [11] 0x113:0x6 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	81
	.byte	2                               ; DW_AT_call_value
	.byte	143
	.byte	0
	.byte	0                               ; End Of Children Mark
	.byte	10                              ; Abbrev [10] 0x11a:0x2c DW_TAG_call_site
	.long	796                             ; DW_AT_call_origin
	.quad	Ltmp5                           ; DW_AT_call_return_pc
	.byte	11                              ; Abbrev [11] 0x127:0x5 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	85
	.byte	1                               ; DW_AT_call_value
	.byte	48
	.byte	11                              ; Abbrev [11] 0x12c:0x7 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	83
	.byte	3                               ; DW_AT_call_value
	.byte	16
	.ascii	"\2020"
	.byte	11                              ; Abbrev [11] 0x133:0x5 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	82
	.byte	1                               ; DW_AT_call_value
	.byte	55
	.byte	11                              ; Abbrev [11] 0x138:0x8 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	81
	.byte	4                               ; DW_AT_call_value
	.byte	16
	.ascii	"\200\200\001"
	.byte	11                              ; Abbrev [11] 0x140:0x5 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	80
	.byte	1                               ; DW_AT_call_value
	.byte	48
	.byte	0                               ; End Of Children Mark
	.byte	12                              ; Abbrev [12] 0x146:0xd DW_TAG_call_site
	.long	849                             ; DW_AT_call_origin
	.quad	Ltmp7                           ; DW_AT_call_return_pc
	.byte	12                              ; Abbrev [12] 0x153:0xd DW_TAG_call_site
	.long	884                             ; DW_AT_call_origin
	.quad	Ltmp12                          ; DW_AT_call_return_pc
	.byte	10                              ; Abbrev [10] 0x160:0x14 DW_TAG_call_site
	.long	965                             ; DW_AT_call_origin
	.quad	Ltmp13                          ; DW_AT_call_return_pc
	.byte	11                              ; Abbrev [11] 0x16d:0x6 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	80
	.byte	2                               ; DW_AT_call_value
	.byte	131
	.byte	0
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	13                              ; Abbrev [13] 0x175:0x1b DW_TAG_subprogram
	.long	273                             ; DW_AT_name
	.byte	6                               ; DW_AT_decl_file
	.byte	84                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	400                             ; DW_AT_type
                                        ; DW_AT_declaration
                                        ; DW_AT_external
                                        ; DW_AT_APPLE_optimized
	.byte	14                              ; Abbrev [14] 0x180:0x5 DW_TAG_formal_parameter
	.long	400                             ; DW_AT_type
	.byte	14                              ; Abbrev [14] 0x185:0x5 DW_TAG_formal_parameter
	.long	407                             ; DW_AT_type
	.byte	14                              ; Abbrev [14] 0x18a:0x5 DW_TAG_formal_parameter
	.long	791                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	3                               ; Abbrev [3] 0x190:0x7 DW_TAG_base_type
	.long	283                             ; DW_AT_name
	.byte	5                               ; DW_AT_encoding
	.byte	4                               ; DW_AT_byte_size
	.byte	15                              ; Abbrev [15] 0x197:0x5 DW_TAG_pointer_type
	.long	412                             ; DW_AT_type
	.byte	16                              ; Abbrev [16] 0x19c:0x5 DW_TAG_const_type
	.long	417                             ; DW_AT_type
	.byte	17                              ; Abbrev [17] 0x1a1:0x31 DW_TAG_structure_type
	.long	273                             ; DW_AT_name
	.byte	16                              ; DW_AT_byte_size
	.byte	7                               ; DW_AT_decl_file
	.short	286                             ; DW_AT_decl_line
	.byte	18                              ; Abbrev [18] 0x1aa:0xd DW_TAG_member
	.long	287                             ; DW_AT_name
	.long	466                             ; DW_AT_type
	.byte	7                               ; DW_AT_decl_file
	.short	287                             ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	18                              ; Abbrev [18] 0x1b7:0xd DW_TAG_member
	.long	546                             ; DW_AT_name
	.long	50                              ; DW_AT_type
	.byte	7                               ; DW_AT_decl_file
	.short	288                             ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	18                              ; Abbrev [18] 0x1c4:0xd DW_TAG_member
	.long	554                             ; DW_AT_name
	.long	400                             ; DW_AT_type
	.byte	7                               ; DW_AT_decl_file
	.short	289                             ; DW_AT_decl_line
	.byte	12                              ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	19                              ; Abbrev [19] 0x1d2:0x24 DW_TAG_union_type
	.long	287                             ; DW_AT_name
	.byte	8                               ; DW_AT_byte_size
	.byte	7                               ; DW_AT_decl_file
	.short	269                             ; DW_AT_decl_line
	.byte	18                              ; Abbrev [18] 0x1db:0xd DW_TAG_member
	.long	301                             ; DW_AT_name
	.long	502                             ; DW_AT_type
	.byte	7                               ; DW_AT_decl_file
	.short	270                             ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	18                              ; Abbrev [18] 0x1e8:0xd DW_TAG_member
	.long	314                             ; DW_AT_name
	.long	514                             ; DW_AT_type
	.byte	7                               ; DW_AT_decl_file
	.short	271                             ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	15                              ; Abbrev [15] 0x1f6:0x5 DW_TAG_pointer_type
	.long	507                             ; DW_AT_type
	.byte	20                              ; Abbrev [20] 0x1fb:0x7 DW_TAG_subroutine_type
                                        ; DW_AT_prototyped
	.byte	14                              ; Abbrev [14] 0x1fc:0x5 DW_TAG_formal_parameter
	.long	400                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	15                              ; Abbrev [15] 0x202:0x5 DW_TAG_pointer_type
	.long	519                             ; DW_AT_type
	.byte	20                              ; Abbrev [20] 0x207:0x11 DW_TAG_subroutine_type
                                        ; DW_AT_prototyped
	.byte	14                              ; Abbrev [14] 0x208:0x5 DW_TAG_formal_parameter
	.long	400                             ; DW_AT_type
	.byte	14                              ; Abbrev [14] 0x20d:0x5 DW_TAG_formal_parameter
	.long	536                             ; DW_AT_type
	.byte	14                              ; Abbrev [14] 0x212:0x5 DW_TAG_formal_parameter
	.long	90                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	15                              ; Abbrev [15] 0x218:0x5 DW_TAG_pointer_type
	.long	541                             ; DW_AT_type
	.byte	21                              ; Abbrev [21] 0x21d:0x81 DW_TAG_structure_type
	.long	329                             ; DW_AT_name
	.byte	104                             ; DW_AT_byte_size
	.byte	7                               ; DW_AT_decl_file
	.byte	177                             ; DW_AT_decl_line
	.byte	22                              ; Abbrev [22] 0x225:0xc DW_TAG_member
	.long	339                             ; DW_AT_name
	.long	400                             ; DW_AT_type
	.byte	7                               ; DW_AT_decl_file
	.byte	178                             ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	22                              ; Abbrev [22] 0x231:0xc DW_TAG_member
	.long	348                             ; DW_AT_name
	.long	400                             ; DW_AT_type
	.byte	7                               ; DW_AT_decl_file
	.byte	179                             ; DW_AT_decl_line
	.byte	4                               ; DW_AT_data_member_location
	.byte	22                              ; Abbrev [22] 0x23d:0xc DW_TAG_member
	.long	357                             ; DW_AT_name
	.long	400                             ; DW_AT_type
	.byte	7                               ; DW_AT_decl_file
	.byte	180                             ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	22                              ; Abbrev [22] 0x249:0xc DW_TAG_member
	.long	365                             ; DW_AT_name
	.long	670                             ; DW_AT_type
	.byte	7                               ; DW_AT_decl_file
	.byte	181                             ; DW_AT_decl_line
	.byte	12                              ; DW_AT_data_member_location
	.byte	22                              ; Abbrev [22] 0x255:0xc DW_TAG_member
	.long	403                             ; DW_AT_name
	.long	703                             ; DW_AT_type
	.byte	7                               ; DW_AT_decl_file
	.byte	182                             ; DW_AT_decl_line
	.byte	16                              ; DW_AT_data_member_location
	.byte	22                              ; Abbrev [22] 0x261:0xc DW_TAG_member
	.long	431                             ; DW_AT_name
	.long	400                             ; DW_AT_type
	.byte	7                               ; DW_AT_decl_file
	.byte	183                             ; DW_AT_decl_line
	.byte	20                              ; DW_AT_data_member_location
	.byte	22                              ; Abbrev [22] 0x26d:0xc DW_TAG_member
	.long	441                             ; DW_AT_name
	.long	90                              ; DW_AT_type
	.byte	7                               ; DW_AT_decl_file
	.byte	184                             ; DW_AT_decl_line
	.byte	24                              ; DW_AT_data_member_location
	.byte	22                              ; Abbrev [22] 0x279:0xc DW_TAG_member
	.long	449                             ; DW_AT_name
	.long	725                             ; DW_AT_type
	.byte	7                               ; DW_AT_decl_file
	.byte	185                             ; DW_AT_decl_line
	.byte	32                              ; DW_AT_data_member_location
	.byte	22                              ; Abbrev [22] 0x285:0xc DW_TAG_member
	.long	485                             ; DW_AT_name
	.long	758                             ; DW_AT_type
	.byte	7                               ; DW_AT_decl_file
	.byte	186                             ; DW_AT_decl_line
	.byte	40                              ; DW_AT_data_member_location
	.byte	22                              ; Abbrev [22] 0x291:0xc DW_TAG_member
	.long	502                             ; DW_AT_name
	.long	765                             ; DW_AT_type
	.byte	7                               ; DW_AT_decl_file
	.byte	187                             ; DW_AT_decl_line
	.byte	48                              ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	2                               ; Abbrev [2] 0x29e:0xb DW_TAG_typedef
	.long	681                             ; DW_AT_type
	.long	372                             ; DW_AT_name
	.byte	8                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	2                               ; Abbrev [2] 0x2a9:0xb DW_TAG_typedef
	.long	692                             ; DW_AT_type
	.long	378                             ; DW_AT_name
	.byte	2                               ; DW_AT_decl_file
	.byte	72                              ; DW_AT_decl_line
	.byte	2                               ; Abbrev [2] 0x2b4:0xb DW_TAG_typedef
	.long	400                             ; DW_AT_type
	.long	393                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	20                              ; DW_AT_decl_line
	.byte	2                               ; Abbrev [2] 0x2bf:0xb DW_TAG_typedef
	.long	714                             ; DW_AT_type
	.long	410                             ; DW_AT_name
	.byte	9                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	2                               ; Abbrev [2] 0x2ca:0xb DW_TAG_typedef
	.long	72                              ; DW_AT_type
	.long	416                             ; DW_AT_name
	.byte	2                               ; DW_AT_decl_file
	.byte	75                              ; DW_AT_decl_line
	.byte	23                              ; Abbrev [23] 0x2d5:0x21 DW_TAG_union_type
	.long	458                             ; DW_AT_name
	.byte	8                               ; DW_AT_byte_size
	.byte	7                               ; DW_AT_decl_file
	.byte	158                             ; DW_AT_decl_line
	.byte	22                              ; Abbrev [22] 0x2dd:0xc DW_TAG_member
	.long	465                             ; DW_AT_name
	.long	400                             ; DW_AT_type
	.byte	7                               ; DW_AT_decl_file
	.byte	160                             ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	22                              ; Abbrev [22] 0x2e9:0xc DW_TAG_member
	.long	475                             ; DW_AT_name
	.long	90                              ; DW_AT_type
	.byte	7                               ; DW_AT_decl_file
	.byte	161                             ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	3                               ; Abbrev [3] 0x2f6:0x7 DW_TAG_base_type
	.long	493                             ; DW_AT_name
	.byte	5                               ; DW_AT_encoding
	.byte	8                               ; DW_AT_byte_size
	.byte	24                              ; Abbrev [24] 0x2fd:0xc DW_TAG_array_type
	.long	777                             ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0x302:0x6 DW_TAG_subrange_type
	.long	784                             ; DW_AT_type
	.byte	7                               ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	3                               ; Abbrev [3] 0x309:0x7 DW_TAG_base_type
	.long	508                             ; DW_AT_name
	.byte	7                               ; DW_AT_encoding
	.byte	8                               ; DW_AT_byte_size
	.byte	26                              ; Abbrev [26] 0x310:0x7 DW_TAG_base_type
	.long	526                             ; DW_AT_name
	.byte	8                               ; DW_AT_byte_size
	.byte	7                               ; DW_AT_encoding
	.byte	15                              ; Abbrev [15] 0x317:0x5 DW_TAG_pointer_type
	.long	417                             ; DW_AT_type
	.byte	27                              ; Abbrev [27] 0x31c:0x2e DW_TAG_subprogram
	.long	563                             ; DW_AT_linkage_name
	.long	569                             ; DW_AT_name
	.byte	10                              ; DW_AT_decl_file
	.byte	238                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	90                              ; DW_AT_type
                                        ; DW_AT_declaration
                                        ; DW_AT_external
                                        ; DW_AT_APPLE_optimized
	.byte	14                              ; Abbrev [14] 0x32b:0x5 DW_TAG_formal_parameter
	.long	90                              ; DW_AT_type
	.byte	14                              ; Abbrev [14] 0x330:0x5 DW_TAG_formal_parameter
	.long	777                             ; DW_AT_type
	.byte	14                              ; Abbrev [14] 0x335:0x5 DW_TAG_formal_parameter
	.long	400                             ; DW_AT_type
	.byte	14                              ; Abbrev [14] 0x33a:0x5 DW_TAG_formal_parameter
	.long	400                             ; DW_AT_type
	.byte	14                              ; Abbrev [14] 0x33f:0x5 DW_TAG_formal_parameter
	.long	400                             ; DW_AT_type
	.byte	14                              ; Abbrev [14] 0x344:0x5 DW_TAG_formal_parameter
	.long	842                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	3                               ; Abbrev [3] 0x34a:0x7 DW_TAG_base_type
	.long	574                             ; DW_AT_name
	.byte	5                               ; DW_AT_encoding
	.byte	8                               ; DW_AT_byte_size
	.byte	28                              ; Abbrev [28] 0x351:0x23 DW_TAG_subprogram
	.quad	Lfunc_begin3                    ; DW_AT_low_pc
.set Lset112, Lfunc_end3-Lfunc_begin3   ; DW_AT_high_pc
	.long	Lset112
                                        ; DW_AT_APPLE_omit_frame_ptr
	.byte	1                               ; DW_AT_frame_base
	.byte	111
                                        ; DW_AT_call_all_calls
	.long	612                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	29                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
                                        ; DW_AT_APPLE_optimized
	.byte	29                              ; Abbrev [29] 0x366:0xd DW_TAG_formal_parameter
	.byte	1                               ; DW_AT_location
	.byte	80
	.long	1162                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	29                              ; DW_AT_decl_line
	.long	91                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	30                              ; Abbrev [30] 0x374:0x51 DW_TAG_subprogram
	.quad	Lfunc_begin5                    ; DW_AT_low_pc
.set Lset113, Lfunc_end5-Lfunc_begin5   ; DW_AT_high_pc
	.long	Lset113
                                        ; DW_AT_APPLE_omit_frame_ptr
	.byte	1                               ; DW_AT_frame_base
	.byte	111
                                        ; DW_AT_call_all_calls
	.long	638                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	95                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	91                              ; DW_AT_type
                                        ; DW_AT_APPLE_optimized
	.byte	6                               ; Abbrev [6] 0x38d:0xf DW_TAG_formal_parameter
.set Lset114, Ldebug_loc15-Lsection_debug_loc ; DW_AT_location
	.long	Lset114
	.long	1168                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	95                              ; DW_AT_decl_line
	.long	2080                            ; DW_AT_type
	.byte	8                               ; Abbrev [8] 0x39c:0xf DW_TAG_variable
.set Lset115, Ldebug_loc16-Lsection_debug_loc ; DW_AT_location
	.long	Lset115
	.long	1197                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	97                              ; DW_AT_decl_line
	.long	91                              ; DW_AT_type
	.byte	9                               ; Abbrev [9] 0x3ab:0x19 DW_TAG_lexical_block
	.quad	Ltmp76                          ; DW_AT_low_pc
.set Lset116, Ltmp79-Ltmp76             ; DW_AT_high_pc
	.long	Lset116
	.byte	31                              ; Abbrev [31] 0x3b8:0xb DW_TAG_variable
	.long	732                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	98                              ; DW_AT_decl_line
	.long	400                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	32                              ; Abbrev [32] 0x3c5:0xb8 DW_TAG_subprogram
	.quad	Lfunc_begin4                    ; DW_AT_low_pc
.set Lset117, Lfunc_end4-Lfunc_begin4   ; DW_AT_high_pc
	.long	Lset117
	.byte	1                               ; DW_AT_frame_base
	.byte	109
                                        ; DW_AT_call_all_calls
	.long	628                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	84                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
                                        ; DW_AT_APPLE_optimized
	.byte	6                               ; Abbrev [6] 0x3da:0xf DW_TAG_formal_parameter
.set Lset118, Ldebug_loc12-Lsection_debug_loc ; DW_AT_location
	.long	Lset118
	.long	719                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	84                              ; DW_AT_decl_line
	.long	90                              ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x3e9:0xf DW_TAG_formal_parameter
.set Lset119, Ldebug_loc13-Lsection_debug_loc ; DW_AT_location
	.long	Lset119
	.long	1162                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	84                              ; DW_AT_decl_line
	.long	91                              ; DW_AT_type
	.byte	31                              ; Abbrev [31] 0x3f8:0xb DW_TAG_variable
	.long	1164                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	86                              ; DW_AT_decl_line
	.long	91                              ; DW_AT_type
	.byte	8                               ; Abbrev [8] 0x403:0xf DW_TAG_variable
.set Lset120, Ldebug_loc14-Lsection_debug_loc ; DW_AT_location
	.long	Lset120
	.long	1166                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	86                              ; DW_AT_decl_line
	.long	91                              ; DW_AT_type
	.byte	12                              ; Abbrev [12] 0x412:0xd DW_TAG_call_site
	.long	1313                            ; DW_AT_call_origin
	.quad	Ltmp65                          ; DW_AT_call_return_pc
	.byte	10                              ; Abbrev [10] 0x41f:0x14 DW_TAG_call_site
	.long	849                             ; DW_AT_call_origin
	.quad	Ltmp67                          ; DW_AT_call_return_pc
	.byte	11                              ; Abbrev [11] 0x42c:0x6 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	80
	.byte	2                               ; DW_AT_call_value
	.byte	131
	.byte	0
	.byte	0                               ; End Of Children Mark
	.byte	12                              ; Abbrev [12] 0x433:0xd DW_TAG_call_site
	.long	1313                            ; DW_AT_call_origin
	.quad	Ltmp68                          ; DW_AT_call_return_pc
	.byte	10                              ; Abbrev [10] 0x440:0x14 DW_TAG_call_site
	.long	1354                            ; DW_AT_call_origin
	.quad	Ltmp70                          ; DW_AT_call_return_pc
	.byte	11                              ; Abbrev [11] 0x44d:0x6 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	80
	.byte	2                               ; DW_AT_call_value
	.byte	132
	.byte	0
	.byte	0                               ; End Of Children Mark
	.byte	10                              ; Abbrev [10] 0x454:0x14 DW_TAG_call_site
	.long	1410                            ; DW_AT_call_origin
	.quad	Ltmp71                          ; DW_AT_call_return_pc
	.byte	11                              ; Abbrev [11] 0x461:0x6 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	80
	.byte	2                               ; DW_AT_call_value
	.byte	132
	.byte	0
	.byte	0                               ; End Of Children Mark
	.byte	10                              ; Abbrev [10] 0x468:0x14 DW_TAG_call_site
	.long	1466                            ; DW_AT_call_origin
	.quad	Ltmp72                          ; DW_AT_call_return_pc
	.byte	11                              ; Abbrev [11] 0x475:0x6 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	80
	.byte	2                               ; DW_AT_call_value
	.byte	132
	.byte	0
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	32                              ; Abbrev [32] 0x47d:0x52 DW_TAG_subprogram
	.quad	Lfunc_begin1                    ; DW_AT_low_pc
.set Lset121, Lfunc_end1-Lfunc_begin1   ; DW_AT_high_pc
	.long	Lset121
	.byte	1                               ; DW_AT_frame_base
	.byte	109
                                        ; DW_AT_call_all_calls
	.long	588                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	20                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
                                        ; DW_AT_APPLE_optimized
	.byte	6                               ; Abbrev [6] 0x492:0xf DW_TAG_formal_parameter
.set Lset122, Ldebug_loc4-Lsection_debug_loc ; DW_AT_location
	.long	Lset122
	.long	734                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	20                              ; DW_AT_decl_line
	.long	400                             ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x4a1:0xf DW_TAG_formal_parameter
.set Lset123, Ldebug_loc5-Lsection_debug_loc ; DW_AT_location
	.long	Lset123
	.long	740                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	20                              ; DW_AT_decl_line
	.long	1594                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x4b0:0xf DW_TAG_formal_parameter
.set Lset124, Ldebug_loc6-Lsection_debug_loc ; DW_AT_location
	.long	Lset124
	.long	755                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	20                              ; DW_AT_decl_line
	.long	90                              ; DW_AT_type
	.byte	8                               ; Abbrev [8] 0x4bf:0xf DW_TAG_variable
.set Lset125, Ldebug_loc7-Lsection_debug_loc ; DW_AT_location
	.long	Lset125
	.long	759                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	24                              ; DW_AT_decl_line
	.long	1610                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	32                              ; Abbrev [32] 0x4cf:0x52 DW_TAG_subprogram
	.quad	Lfunc_begin2                    ; DW_AT_low_pc
.set Lset126, Lfunc_end2-Lfunc_begin2   ; DW_AT_high_pc
	.long	Lset126
	.byte	1                               ; DW_AT_frame_base
	.byte	109
                                        ; DW_AT_call_all_calls
	.long	600                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	11                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
                                        ; DW_AT_APPLE_optimized
	.byte	6                               ; Abbrev [6] 0x4e4:0xf DW_TAG_formal_parameter
.set Lset127, Ldebug_loc8-Lsection_debug_loc ; DW_AT_location
	.long	Lset127
	.long	734                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	11                              ; DW_AT_decl_line
	.long	400                             ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x4f3:0xf DW_TAG_formal_parameter
.set Lset128, Ldebug_loc9-Lsection_debug_loc ; DW_AT_location
	.long	Lset128
	.long	740                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	11                              ; DW_AT_decl_line
	.long	1594                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x502:0xf DW_TAG_formal_parameter
.set Lset129, Ldebug_loc10-Lsection_debug_loc ; DW_AT_location
	.long	Lset129
	.long	755                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	11                              ; DW_AT_decl_line
	.long	90                              ; DW_AT_type
	.byte	8                               ; Abbrev [8] 0x511:0xf DW_TAG_variable
.set Lset130, Ldebug_loc11-Lsection_debug_loc ; DW_AT_location
	.long	Lset130
	.long	759                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	15                              ; DW_AT_decl_line
	.long	1610                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	30                              ; Abbrev [30] 0x521:0x29 DW_TAG_subprogram
	.quad	Lfunc_begin6                    ; DW_AT_low_pc
.set Lset131, Lfunc_end6-Lfunc_begin6   ; DW_AT_high_pc
	.long	Lset131
                                        ; DW_AT_APPLE_omit_frame_ptr
	.byte	1                               ; DW_AT_frame_base
	.byte	111
                                        ; DW_AT_call_all_calls
	.long	652                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	36                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	91                              ; DW_AT_type
                                        ; DW_AT_APPLE_optimized
	.byte	8                               ; Abbrev [8] 0x53a:0xf DW_TAG_variable
.set Lset132, Ldebug_loc17-Lsection_debug_loc ; DW_AT_location
	.long	Lset132
	.long	1162                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	38                              ; DW_AT_decl_line
	.long	91                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	30                              ; Abbrev [30] 0x54a:0x38 DW_TAG_subprogram
	.quad	Lfunc_begin7                    ; DW_AT_low_pc
.set Lset133, Lfunc_end7-Lfunc_begin7   ; DW_AT_high_pc
	.long	Lset133
                                        ; DW_AT_APPLE_omit_frame_ptr
	.byte	1                               ; DW_AT_frame_base
	.byte	111
                                        ; DW_AT_call_all_calls
	.long	667                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	45                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	1554                            ; DW_AT_type
                                        ; DW_AT_APPLE_optimized
	.byte	6                               ; Abbrev [6] 0x563:0xf DW_TAG_formal_parameter
.set Lset134, Ldebug_loc18-Lsection_debug_loc ; DW_AT_location
	.long	Lset134
	.long	719                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	45                              ; DW_AT_decl_line
	.long	90                              ; DW_AT_type
	.byte	8                               ; Abbrev [8] 0x572:0xf DW_TAG_variable
.set Lset135, Ldebug_loc19-Lsection_debug_loc ; DW_AT_location
	.long	Lset135
	.long	1162                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	47                              ; DW_AT_decl_line
	.long	91                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	30                              ; Abbrev [30] 0x582:0x38 DW_TAG_subprogram
	.quad	Lfunc_begin8                    ; DW_AT_low_pc
.set Lset136, Lfunc_end8-Lfunc_begin8   ; DW_AT_high_pc
	.long	Lset136
                                        ; DW_AT_APPLE_omit_frame_ptr
	.byte	1                               ; DW_AT_frame_base
	.byte	111
                                        ; DW_AT_call_all_calls
	.long	676                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	60                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	1554                            ; DW_AT_type
                                        ; DW_AT_APPLE_optimized
	.byte	6                               ; Abbrev [6] 0x59b:0xf DW_TAG_formal_parameter
.set Lset137, Ldebug_loc20-Lsection_debug_loc ; DW_AT_location
	.long	Lset137
	.long	719                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	60                              ; DW_AT_decl_line
	.long	90                              ; DW_AT_type
	.byte	8                               ; Abbrev [8] 0x5aa:0xf DW_TAG_variable
.set Lset138, Ldebug_loc21-Lsection_debug_loc ; DW_AT_location
	.long	Lset138
	.long	1162                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	62                              ; DW_AT_decl_line
	.long	91                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	33                              ; Abbrev [33] 0x5ba:0x58 DW_TAG_subprogram
	.quad	Lfunc_begin9                    ; DW_AT_low_pc
.set Lset139, Lfunc_end9-Lfunc_begin9   ; DW_AT_high_pc
	.long	Lset139
	.byte	1                               ; DW_AT_frame_base
	.byte	109
                                        ; DW_AT_call_all_calls
	.long	686                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	75                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	1554                            ; DW_AT_type
                                        ; DW_AT_APPLE_optimized
	.byte	6                               ; Abbrev [6] 0x5d3:0xf DW_TAG_formal_parameter
.set Lset140, Ldebug_loc22-Lsection_debug_loc ; DW_AT_location
	.long	Lset140
	.long	719                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	75                              ; DW_AT_decl_line
	.long	90                              ; DW_AT_type
	.byte	8                               ; Abbrev [8] 0x5e2:0xf DW_TAG_variable
.set Lset141, Ldebug_loc23-Lsection_debug_loc ; DW_AT_location
	.long	Lset141
	.long	1201                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	77                              ; DW_AT_decl_line
	.long	2098                            ; DW_AT_type
	.byte	8                               ; Abbrev [8] 0x5f1:0xf DW_TAG_variable
.set Lset142, Ldebug_loc24-Lsection_debug_loc ; DW_AT_location
	.long	Lset142
	.long	1197                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	78                              ; DW_AT_decl_line
	.long	91                              ; DW_AT_type
	.byte	34                              ; Abbrev [34] 0x600:0x11 DW_TAG_call_site
	.byte	1                               ; DW_AT_call_target
	.byte	88
	.quad	Ltmp94                          ; DW_AT_call_return_pc
	.byte	11                              ; Abbrev [11] 0x60b:0x5 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	80
	.byte	1                               ; DW_AT_call_value
	.byte	48
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	3                               ; Abbrev [3] 0x612:0x7 DW_TAG_base_type
	.long	695                             ; DW_AT_name
	.byte	2                               ; DW_AT_encoding
	.byte	1                               ; DW_AT_byte_size
	.byte	15                              ; Abbrev [15] 0x619:0x5 DW_TAG_pointer_type
	.long	1566                            ; DW_AT_type
	.byte	15                              ; Abbrev [15] 0x61e:0x5 DW_TAG_pointer_type
	.long	1571                            ; DW_AT_type
	.byte	3                               ; Abbrev [3] 0x623:0x7 DW_TAG_base_type
	.long	714                             ; DW_AT_name
	.byte	6                               ; DW_AT_encoding
	.byte	1                               ; DW_AT_byte_size
	.byte	15                              ; Abbrev [15] 0x62a:0x5 DW_TAG_pointer_type
	.long	1583                            ; DW_AT_type
	.byte	2                               ; Abbrev [2] 0x62f:0xb DW_TAG_typedef
	.long	83                              ; DW_AT_type
	.long	723                             ; DW_AT_name
	.byte	11                              ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	15                              ; Abbrev [15] 0x63a:0x5 DW_TAG_pointer_type
	.long	1599                            ; DW_AT_type
	.byte	2                               ; Abbrev [2] 0x63f:0xb DW_TAG_typedef
	.long	541                             ; DW_AT_type
	.long	745                             ; DW_AT_name
	.byte	7                               ; DW_AT_decl_file
	.byte	188                             ; DW_AT_decl_line
	.byte	15                              ; Abbrev [15] 0x64a:0x5 DW_TAG_pointer_type
	.long	1615                            ; DW_AT_type
	.byte	2                               ; Abbrev [2] 0x64f:0xb DW_TAG_typedef
	.long	1626                            ; DW_AT_type
	.long	762                             ; DW_AT_name
	.byte	12                              ; DW_AT_decl_file
	.byte	57                              ; DW_AT_decl_line
	.byte	35                              ; Abbrev [35] 0x65a:0x5e DW_TAG_structure_type
	.long	773                             ; DW_AT_name
	.short	880                             ; DW_AT_byte_size
	.byte	12                              ; DW_AT_decl_file
	.byte	43                              ; DW_AT_decl_line
	.byte	22                              ; Abbrev [22] 0x663:0xc DW_TAG_member
	.long	791                             ; DW_AT_name
	.long	400                             ; DW_AT_type
	.byte	12                              ; DW_AT_decl_file
	.byte	45                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	22                              ; Abbrev [22] 0x66f:0xc DW_TAG_member
	.long	802                             ; DW_AT_name
	.long	61                              ; DW_AT_type
	.byte	12                              ; DW_AT_decl_file
	.byte	46                              ; DW_AT_decl_line
	.byte	4                               ; DW_AT_data_member_location
	.byte	22                              ; Abbrev [22] 0x67b:0xc DW_TAG_member
	.long	813                             ; DW_AT_name
	.long	1720                            ; DW_AT_type
	.byte	12                              ; DW_AT_decl_file
	.byte	47                              ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	22                              ; Abbrev [22] 0x687:0xc DW_TAG_member
	.long	882                             ; DW_AT_name
	.long	1776                            ; DW_AT_type
	.byte	12                              ; DW_AT_decl_file
	.byte	48                              ; DW_AT_decl_line
	.byte	32                              ; DW_AT_data_member_location
	.byte	22                              ; Abbrev [22] 0x693:0xc DW_TAG_member
	.long	890                             ; DW_AT_name
	.long	1765                            ; DW_AT_type
	.byte	12                              ; DW_AT_decl_file
	.byte	49                              ; DW_AT_decl_line
	.byte	40                              ; DW_AT_data_member_location
	.byte	22                              ; Abbrev [22] 0x69f:0xc DW_TAG_member
	.long	900                             ; DW_AT_name
	.long	1781                            ; DW_AT_type
	.byte	12                              ; DW_AT_decl_file
	.byte	50                              ; DW_AT_decl_line
	.byte	48                              ; DW_AT_data_member_location
	.byte	22                              ; Abbrev [22] 0x6ab:0xc DW_TAG_member
	.long	1146                            ; DW_AT_name
	.long	1786                            ; DW_AT_type
	.byte	12                              ; DW_AT_decl_file
	.byte	52                              ; DW_AT_decl_line
	.byte	64                              ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	21                              ; Abbrev [21] 0x6b8:0x2d DW_TAG_structure_type
	.long	822                             ; DW_AT_name
	.byte	24                              ; DW_AT_byte_size
	.byte	13                              ; DW_AT_decl_file
	.byte	42                              ; DW_AT_decl_line
	.byte	22                              ; Abbrev [22] 0x6c0:0xc DW_TAG_member
	.long	843                             ; DW_AT_name
	.long	90                              ; DW_AT_type
	.byte	13                              ; DW_AT_decl_file
	.byte	44                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	22                              ; Abbrev [22] 0x6cc:0xc DW_TAG_member
	.long	849                             ; DW_AT_name
	.long	1765                            ; DW_AT_type
	.byte	13                              ; DW_AT_decl_file
	.byte	45                              ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	22                              ; Abbrev [22] 0x6d8:0xc DW_TAG_member
	.long	873                             ; DW_AT_name
	.long	400                             ; DW_AT_type
	.byte	13                              ; DW_AT_decl_file
	.byte	46                              ; DW_AT_decl_line
	.byte	16                              ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	2                               ; Abbrev [2] 0x6e5:0xb DW_TAG_typedef
	.long	777                             ; DW_AT_type
	.long	857                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	68                              ; DW_AT_decl_line
	.byte	15                              ; Abbrev [15] 0x6f0:0x5 DW_TAG_pointer_type
	.long	1626                            ; DW_AT_type
	.byte	15                              ; Abbrev [15] 0x6f5:0x5 DW_TAG_pointer_type
	.long	1786                            ; DW_AT_type
	.byte	35                              ; Abbrev [35] 0x6fa:0x2f DW_TAG_structure_type
	.long	912                             ; DW_AT_name
	.short	816                             ; DW_AT_byte_size
	.byte	15                              ; DW_AT_decl_file
	.byte	62                              ; DW_AT_decl_line
	.byte	22                              ; Abbrev [22] 0x703:0xc DW_TAG_member
	.long	932                             ; DW_AT_name
	.long	1833                            ; DW_AT_type
	.byte	15                              ; DW_AT_decl_file
	.byte	64                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	22                              ; Abbrev [22] 0x70f:0xc DW_TAG_member
	.long	1003                            ; DW_AT_name
	.long	1889                            ; DW_AT_type
	.byte	15                              ; DW_AT_decl_file
	.byte	65                              ; DW_AT_decl_line
	.byte	16                              ; DW_AT_data_member_location
	.byte	36                              ; Abbrev [36] 0x71b:0xd DW_TAG_member
	.long	1067                            ; DW_AT_name
	.long	1998                            ; DW_AT_type
	.byte	15                              ; DW_AT_decl_file
	.byte	66                              ; DW_AT_decl_line
	.short	288                             ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	21                              ; Abbrev [21] 0x729:0x2d DW_TAG_structure_type
	.long	937                             ; DW_AT_name
	.byte	16                              ; DW_AT_byte_size
	.byte	14                              ; DW_AT_decl_file
	.byte	57                              ; DW_AT_decl_line
	.byte	22                              ; Abbrev [22] 0x731:0xc DW_TAG_member
	.long	968                             ; DW_AT_name
	.long	1878                            ; DW_AT_type
	.byte	14                              ; DW_AT_decl_file
	.byte	59                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	22                              ; Abbrev [22] 0x73d:0xc DW_TAG_member
	.long	985                             ; DW_AT_name
	.long	72                              ; DW_AT_type
	.byte	14                              ; DW_AT_decl_file
	.byte	60                              ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	22                              ; Abbrev [22] 0x749:0xc DW_TAG_member
	.long	991                             ; DW_AT_name
	.long	72                              ; DW_AT_type
	.byte	14                              ; DW_AT_decl_file
	.byte	61                              ; DW_AT_decl_line
	.byte	12                              ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	2                               ; Abbrev [2] 0x756:0xb DW_TAG_typedef
	.long	102                             ; DW_AT_type
	.long	974                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	23                              ; DW_AT_decl_line
	.byte	35                              ; Abbrev [35] 0x761:0x61 DW_TAG_structure_type
	.long	1008                            ; DW_AT_name
	.short	272                             ; DW_AT_byte_size
	.byte	14                              ; DW_AT_decl_file
	.byte	134                             ; DW_AT_decl_line
	.byte	22                              ; Abbrev [22] 0x76a:0xc DW_TAG_member
	.long	1036                            ; DW_AT_name
	.long	1986                            ; DW_AT_type
	.byte	14                              ; DW_AT_decl_file
	.byte	136                             ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	22                              ; Abbrev [22] 0x776:0xc DW_TAG_member
	.long	1040                            ; DW_AT_name
	.long	1878                            ; DW_AT_type
	.byte	14                              ; DW_AT_decl_file
	.byte	137                             ; DW_AT_decl_line
	.byte	232                             ; DW_AT_data_member_location
	.byte	22                              ; Abbrev [22] 0x782:0xc DW_TAG_member
	.long	1045                            ; DW_AT_name
	.long	1878                            ; DW_AT_type
	.byte	14                              ; DW_AT_decl_file
	.byte	138                             ; DW_AT_decl_line
	.byte	240                             ; DW_AT_data_member_location
	.byte	22                              ; Abbrev [22] 0x78e:0xc DW_TAG_member
	.long	1050                            ; DW_AT_name
	.long	1878                            ; DW_AT_type
	.byte	14                              ; DW_AT_decl_file
	.byte	139                             ; DW_AT_decl_line
	.byte	248                             ; DW_AT_data_member_location
	.byte	36                              ; Abbrev [36] 0x79a:0xd DW_TAG_member
	.long	1055                            ; DW_AT_name
	.long	1878                            ; DW_AT_type
	.byte	14                              ; DW_AT_decl_file
	.byte	140                             ; DW_AT_decl_line
	.short	256                             ; DW_AT_data_member_location
	.byte	36                              ; Abbrev [36] 0x7a7:0xd DW_TAG_member
	.long	1060                            ; DW_AT_name
	.long	72                              ; DW_AT_type
	.byte	14                              ; DW_AT_decl_file
	.byte	141                             ; DW_AT_decl_line
	.short	264                             ; DW_AT_data_member_location
	.byte	36                              ; Abbrev [36] 0x7b4:0xd DW_TAG_member
	.long	502                             ; DW_AT_name
	.long	72                              ; DW_AT_type
	.byte	14                              ; DW_AT_decl_file
	.byte	142                             ; DW_AT_decl_line
	.short	268                             ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x7c2:0xc DW_TAG_array_type
	.long	1878                            ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0x7c7:0x6 DW_TAG_subrange_type
	.long	784                             ; DW_AT_type
	.byte	29                              ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	37                              ; Abbrev [37] 0x7ce:0x34 DW_TAG_structure_type
	.long	1072                            ; DW_AT_name
	.short	528                             ; DW_AT_byte_size
	.byte	14                              ; DW_AT_decl_file
	.short	441                             ; DW_AT_decl_line
	.byte	18                              ; Abbrev [18] 0x7d8:0xd DW_TAG_member
	.long	1098                            ; DW_AT_name
	.long	2050                            ; DW_AT_type
	.byte	14                              ; DW_AT_decl_file
	.short	443                             ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	38                              ; Abbrev [38] 0x7e5:0xe DW_TAG_member
	.long	1132                            ; DW_AT_name
	.long	72                              ; DW_AT_type
	.byte	14                              ; DW_AT_decl_file
	.short	444                             ; DW_AT_decl_line
	.short	512                             ; DW_AT_data_member_location
	.byte	38                              ; Abbrev [38] 0x7f3:0xe DW_TAG_member
	.long	1139                            ; DW_AT_name
	.long	72                              ; DW_AT_type
	.byte	14                              ; DW_AT_decl_file
	.short	445                             ; DW_AT_decl_line
	.short	516                             ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x802:0xc DW_TAG_array_type
	.long	2062                            ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0x807:0x6 DW_TAG_subrange_type
	.long	784                             ; DW_AT_type
	.byte	32                              ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	2                               ; Abbrev [2] 0x80e:0xb DW_TAG_typedef
	.long	2073                            ; DW_AT_type
	.long	1102                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	24                              ; DW_AT_decl_line
	.byte	3                               ; Abbrev [3] 0x819:0x7 DW_TAG_base_type
	.long	1114                            ; DW_AT_name
	.byte	7                               ; DW_AT_encoding
	.byte	16                              ; DW_AT_byte_size
	.byte	2                               ; Abbrev [2] 0x820:0xb DW_TAG_typedef
	.long	2091                            ; DW_AT_type
	.long	1175                            ; DW_AT_name
	.byte	16                              ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	3                               ; Abbrev [3] 0x82b:0x7 DW_TAG_base_type
	.long	1183                            ; DW_AT_name
	.byte	8                               ; DW_AT_encoding
	.byte	1                               ; DW_AT_byte_size
	.byte	15                              ; Abbrev [15] 0x832:0x5 DW_TAG_pointer_type
	.long	2103                            ; DW_AT_type
	.byte	39                              ; Abbrev [39] 0x837:0xb DW_TAG_subroutine_type
	.long	91                              ; DW_AT_type
                                        ; DW_AT_prototyped
	.byte	14                              ; Abbrev [14] 0x83c:0x5 DW_TAG_formal_parameter
	.long	91                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"Apple clang version 12.0.5 (clang-1205.0.22.9)" ; string offset=0
	.asciz	"s3_6_c15_c2_1.c"               ; string offset=47
	.asciz	"/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk" ; string offset=63
	.asciz	"MacOSX.sdk"                    ; string offset=158
	.asciz	"/Users/xss/code"               ; string offset=169
	.asciz	"sigset_t"                      ; string offset=185
	.asciz	"__darwin_sigset_t"             ; string offset=194
	.asciz	"__uint32_t"                    ; string offset=212
	.asciz	"unsigned int"                  ; string offset=223
	.asciz	"uint64_t"                      ; string offset=236
	.asciz	"long long unsigned int"        ; string offset=245
	.asciz	"main"                          ; string offset=268
	.asciz	"sigaction"                     ; string offset=273
	.asciz	"int"                           ; string offset=283
	.asciz	"__sigaction_u"                 ; string offset=287
	.asciz	"__sa_handler"                  ; string offset=301
	.asciz	"__sa_sigaction"                ; string offset=314
	.asciz	"__siginfo"                     ; string offset=329
	.asciz	"si_signo"                      ; string offset=339
	.asciz	"si_errno"                      ; string offset=348
	.asciz	"si_code"                       ; string offset=357
	.asciz	"si_pid"                        ; string offset=365
	.asciz	"pid_t"                         ; string offset=372
	.asciz	"__darwin_pid_t"                ; string offset=378
	.asciz	"__int32_t"                     ; string offset=393
	.asciz	"si_uid"                        ; string offset=403
	.asciz	"uid_t"                         ; string offset=410
	.asciz	"__darwin_uid_t"                ; string offset=416
	.asciz	"si_status"                     ; string offset=431
	.asciz	"si_addr"                       ; string offset=441
	.asciz	"si_value"                      ; string offset=449
	.asciz	"sigval"                        ; string offset=458
	.asciz	"sival_int"                     ; string offset=465
	.asciz	"sival_ptr"                     ; string offset=475
	.asciz	"si_band"                       ; string offset=485
	.asciz	"long int"                      ; string offset=493
	.asciz	"__pad"                         ; string offset=502
	.asciz	"long unsigned int"             ; string offset=508
	.asciz	"__ARRAY_SIZE_TYPE__"           ; string offset=526
	.asciz	"sa_mask"                       ; string offset=546
	.asciz	"sa_flags"                      ; string offset=554
	.asciz	"_mmap"                         ; string offset=563
	.asciz	"mmap"                          ; string offset=569
	.asciz	"long long int"                 ; string offset=574
	.asciz	"bus_handler"                   ; string offset=588
	.asciz	"sev_handler"                   ; string offset=600
	.asciz	"write_sprr_perm"               ; string offset=612
	.asciz	"sprr_test"                     ; string offset=628
	.asciz	"make_sprr_val"                 ; string offset=638
	.asciz	"read_sprr_perm"                ; string offset=652
	.asciz	"can_read"                      ; string offset=667
	.asciz	"can_write"                     ; string offset=676
	.asciz	"can_exec"                      ; string offset=686
	.asciz	"_Bool"                         ; string offset=695
	.asciz	"sa"                            ; string offset=701
	.asciz	"argc"                          ; string offset=704
	.asciz	"argv"                          ; string offset=709
	.asciz	"char"                          ; string offset=714
	.asciz	"ptr"                           ; string offset=719
	.asciz	"uint32_t"                      ; string offset=723
	.asciz	"i"                             ; string offset=732
	.asciz	"signo"                         ; string offset=734
	.asciz	"info"                          ; string offset=740
	.asciz	"siginfo_t"                     ; string offset=745
	.asciz	"cx_"                           ; string offset=755
	.asciz	"cx"                            ; string offset=759
	.asciz	"ucontext_t"                    ; string offset=762
	.asciz	"__darwin_ucontext"             ; string offset=773
	.asciz	"uc_onstack"                    ; string offset=791
	.asciz	"uc_sigmask"                    ; string offset=802
	.asciz	"uc_stack"                      ; string offset=813
	.asciz	"__darwin_sigaltstack"          ; string offset=822
	.asciz	"ss_sp"                         ; string offset=843
	.asciz	"ss_size"                       ; string offset=849
	.asciz	"__darwin_size_t"               ; string offset=857
	.asciz	"ss_flags"                      ; string offset=873
	.asciz	"uc_link"                       ; string offset=882
	.asciz	"uc_mcsize"                     ; string offset=890
	.asciz	"uc_mcontext"                   ; string offset=900
	.asciz	"__darwin_mcontext64"           ; string offset=912
	.asciz	"__es"                          ; string offset=932
	.asciz	"__darwin_arm_exception_state64" ; string offset=937
	.asciz	"__far"                         ; string offset=968
	.asciz	"__uint64_t"                    ; string offset=974
	.asciz	"__esr"                         ; string offset=985
	.asciz	"__exception"                   ; string offset=991
	.asciz	"__ss"                          ; string offset=1003
	.asciz	"__darwin_arm_thread_state64"   ; string offset=1008
	.asciz	"__x"                           ; string offset=1036
	.asciz	"__fp"                          ; string offset=1040
	.asciz	"__lr"                          ; string offset=1045
	.asciz	"__sp"                          ; string offset=1050
	.asciz	"__pc"                          ; string offset=1055
	.asciz	"__cpsr"                        ; string offset=1060
	.asciz	"__ns"                          ; string offset=1067
	.asciz	"__darwin_arm_neon_state64"     ; string offset=1072
	.asciz	"__v"                           ; string offset=1098
	.asciz	"__uint128_t"                   ; string offset=1102
	.asciz	"unsigned __int128"             ; string offset=1114
	.asciz	"__fpsr"                        ; string offset=1132
	.asciz	"__fpcr"                        ; string offset=1139
	.asciz	"__mcontext_data"               ; string offset=1146
	.asciz	"v"                             ; string offset=1162
	.asciz	"a"                             ; string offset=1164
	.asciz	"b"                             ; string offset=1166
	.asciz	"nibble"                        ; string offset=1168
	.asciz	"uint8_t"                       ; string offset=1175
	.asciz	"unsigned char"                 ; string offset=1183
	.asciz	"res"                           ; string offset=1197
	.asciz	"fun_ptr"                       ; string offset=1201
	.section	__DWARF,__apple_names,regular,debug
Lnames_begin:
	.long	1212240712                      ; Header Magic
	.short	1                               ; Header Version
	.short	0                               ; Header Hash Function
	.long	10                              ; Header Bucket Count
	.long	10                              ; Header Hash Count
	.long	12                              ; Header Data Length
	.long	0                               ; HeaderData Die Offset Base
	.long	1                               ; HeaderData Atom Count
	.short	1                               ; DW_ATOM_die_offset
	.short	6                               ; DW_FORM_data4
	.long	0                               ; Bucket 0
	.long	2                               ; Bucket 1
	.long	3                               ; Bucket 2
	.long	4                               ; Bucket 3
	.long	-1                              ; Bucket 4
	.long	-1                              ; Bucket 5
	.long	6                               ; Bucket 6
	.long	7                               ; Bucket 7
	.long	9                               ; Bucket 8
	.long	-1                              ; Bucket 9
	.long	33327980                        ; Hash in Bucket 0
	.long	-321079206                      ; Hash in Bucket 0
	.long	905971691                       ; Hash in Bucket 1
	.long	193490162                       ; Hash in Bucket 2
	.long	193043803                       ; Hash in Bucket 3
	.long	-81525013                       ; Hash in Bucket 3
	.long	2090499946                      ; Hash in Bucket 6
	.long	2096614177                      ; Hash in Bucket 7
	.long	-994525399                      ; Hash in Bucket 7
	.long	-101657168                      ; Hash in Bucket 8
.set Lset143, LNames4-Lnames_begin      ; Offset in Bucket 0
	.long	Lset143
.set Lset144, LNames5-Lnames_begin      ; Offset in Bucket 0
	.long	Lset144
.set Lset145, LNames6-Lnames_begin      ; Offset in Bucket 1
	.long	Lset145
.set Lset146, LNames9-Lnames_begin      ; Offset in Bucket 2
	.long	Lset146
.set Lset147, LNames0-Lnames_begin      ; Offset in Bucket 3
	.long	Lset147
.set Lset148, LNames3-Lnames_begin      ; Offset in Bucket 3
	.long	Lset148
.set Lset149, LNames2-Lnames_begin      ; Offset in Bucket 6
	.long	Lset149
.set Lset150, LNames8-Lnames_begin      ; Offset in Bucket 7
	.long	Lset150
.set Lset151, LNames1-Lnames_begin      ; Offset in Bucket 7
	.long	Lset151
.set Lset152, LNames7-Lnames_begin      ; Offset in Bucket 8
	.long	Lset152
LNames4:
	.long	588                             ; bus_handler
	.long	1                               ; Num DIEs
	.long	1149
	.long	0
LNames5:
	.long	652                             ; read_sprr_perm
	.long	1                               ; Num DIEs
	.long	1313
	.long	0
LNames6:
	.long	638                             ; make_sprr_val
	.long	1                               ; Num DIEs
	.long	884
	.long	0
LNames9:
	.long	667                             ; can_read
	.long	1                               ; Num DIEs
	.long	1354
	.long	0
LNames0:
	.long	686                             ; can_exec
	.long	1                               ; Num DIEs
	.long	1466
	.long	0
LNames3:
	.long	628                             ; sprr_test
	.long	1                               ; Num DIEs
	.long	965
	.long	0
LNames2:
	.long	268                             ; main
	.long	1                               ; Num DIEs
	.long	109
	.long	0
LNames8:
	.long	676                             ; can_write
	.long	1                               ; Num DIEs
	.long	1410
	.long	0
LNames1:
	.long	612                             ; write_sprr_perm
	.long	1                               ; Num DIEs
	.long	849
	.long	0
LNames7:
	.long	600                             ; sev_handler
	.long	1                               ; Num DIEs
	.long	1231
	.long	0
	.section	__DWARF,__apple_objc,regular,debug
Lobjc_begin:
	.long	1212240712                      ; Header Magic
	.short	1                               ; Header Version
	.short	0                               ; Header Hash Function
	.long	1                               ; Header Bucket Count
	.long	0                               ; Header Hash Count
	.long	12                              ; Header Data Length
	.long	0                               ; HeaderData Die Offset Base
	.long	1                               ; HeaderData Atom Count
	.short	1                               ; DW_ATOM_die_offset
	.short	6                               ; DW_FORM_data4
	.long	-1                              ; Bucket 0
	.section	__DWARF,__apple_namespac,regular,debug
Lnamespac_begin:
	.long	1212240712                      ; Header Magic
	.short	1                               ; Header Version
	.short	0                               ; Header Hash Function
	.long	1                               ; Header Bucket Count
	.long	0                               ; Header Hash Count
	.long	12                              ; Header Data Length
	.long	0                               ; HeaderData Die Offset Base
	.long	1                               ; HeaderData Atom Count
	.short	1                               ; DW_ATOM_die_offset
	.short	6                               ; DW_FORM_data4
	.long	-1                              ; Bucket 0
	.section	__DWARF,__apple_types,regular,debug
Ltypes_begin:
	.long	1212240712                      ; Header Magic
	.short	1                               ; Header Version
	.short	0                               ; Header Hash Function
	.long	18                              ; Header Bucket Count
	.long	37                              ; Header Hash Count
	.long	20                              ; Header Data Length
	.long	0                               ; HeaderData Die Offset Base
	.long	3                               ; HeaderData Atom Count
	.short	1                               ; DW_ATOM_die_offset
	.short	6                               ; DW_FORM_data4
	.short	3                               ; DW_ATOM_die_tag
	.short	5                               ; DW_FORM_data2
	.short	4                               ; DW_ATOM_type_flags
	.short	11                              ; DW_FORM_data1
	.long	0                               ; Bucket 0
	.long	3                               ; Bucket 1
	.long	5                               ; Bucket 2
	.long	8                               ; Bucket 3
	.long	10                              ; Bucket 4
	.long	11                              ; Bucket 5
	.long	13                              ; Bucket 6
	.long	15                              ; Bucket 7
	.long	18                              ; Bucket 8
	.long	-1                              ; Bucket 9
	.long	21                              ; Bucket 10
	.long	23                              ; Bucket 11
	.long	27                              ; Bucket 12
	.long	28                              ; Bucket 13
	.long	30                              ; Bucket 14
	.long	31                              ; Bucket 15
	.long	32                              ; Bucket 16
	.long	34                              ; Bucket 17
	.long	89027496                        ; Hash in Bucket 0
	.long	1950534918                      ; Hash in Bucket 0
	.long	-1880351968                     ; Hash in Bucket 0
	.long	466014187                       ; Hash in Bucket 1
	.long	-547304637                      ; Hash in Bucket 1
	.long	193495088                       ; Hash in Bucket 2
	.long	249311216                       ; Hash in Bucket 2
	.long	-2056653344                     ; Hash in Bucket 2
	.long	461127873                       ; Hash in Bucket 3
	.long	580916487                       ; Hash in Bucket 3
	.long	276790522                       ; Hash in Bucket 4
	.long	-1304652851                     ; Hash in Bucket 5
	.long	-594775205                      ; Hash in Bucket 5
	.long	897561888                       ; Hash in Bucket 6
	.long	-627816040                      ; Hash in Bucket 6
	.long	679906663                       ; Hash in Bucket 7
	.long	-282664779                      ; Hash in Bucket 7
	.long	-142298025                      ; Hash in Bucket 7
	.long	290821634                       ; Hash in Bucket 8
	.long	1835292518                      ; Hash in Bucket 8
	.long	-1267332080                     ; Hash in Bucket 8
	.long	789719536                       ; Hash in Bucket 10
	.long	-1263457614                     ; Hash in Bucket 10
	.long	688950281                       ; Hash in Bucket 11
	.long	-2056763333                     ; Hash in Bucket 11
	.long	-1571268449                     ; Hash in Bucket 11
	.long	-80380739                       ; Hash in Bucket 11
	.long	255285318                       ; Hash in Bucket 12
	.long	270860917                       ; Hash in Bucket 13
	.long	-69895251                       ; Hash in Bucket 13
	.long	-104093792                      ; Hash in Bucket 14
	.long	843871857                       ; Hash in Bucket 15
	.long	1771224946                      ; Hash in Bucket 16
	.long	-136368420                      ; Hash in Bucket 16
	.long	290711645                       ; Hash in Bucket 17
	.long	1175294177                      ; Hash in Bucket 17
	.long	2090147939                      ; Hash in Bucket 17
.set Lset153, Ltypes1-Ltypes_begin      ; Offset in Bucket 0
	.long	Lset153
.set Lset154, Ltypes25-Ltypes_begin     ; Offset in Bucket 0
	.long	Lset154
.set Lset155, Ltypes16-Ltypes_begin     ; Offset in Bucket 0
	.long	Lset155
.set Lset156, Ltypes24-Ltypes_begin     ; Offset in Bucket 1
	.long	Lset156
.set Lset157, Ltypes19-Ltypes_begin     ; Offset in Bucket 1
	.long	Lset157
.set Lset158, Ltypes3-Ltypes_begin      ; Offset in Bucket 2
	.long	Lset158
.set Lset159, Ltypes4-Ltypes_begin      ; Offset in Bucket 2
	.long	Lset159
.set Lset160, Ltypes17-Ltypes_begin     ; Offset in Bucket 2
	.long	Lset160
.set Lset161, Ltypes36-Ltypes_begin     ; Offset in Bucket 3
	.long	Lset161
.set Lset162, Ltypes22-Ltypes_begin     ; Offset in Bucket 3
	.long	Lset162
.set Lset163, Ltypes11-Ltypes_begin     ; Offset in Bucket 4
	.long	Lset163
.set Lset164, Ltypes2-Ltypes_begin      ; Offset in Bucket 5
	.long	Lset164
.set Lset165, Ltypes31-Ltypes_begin     ; Offset in Bucket 5
	.long	Lset165
.set Lset166, Ltypes32-Ltypes_begin     ; Offset in Bucket 6
	.long	Lset166
.set Lset167, Ltypes29-Ltypes_begin     ; Offset in Bucket 6
	.long	Lset167
.set Lset168, Ltypes21-Ltypes_begin     ; Offset in Bucket 7
	.long	Lset168
.set Lset169, Ltypes9-Ltypes_begin      ; Offset in Bucket 7
	.long	Lset169
.set Lset170, Ltypes10-Ltypes_begin     ; Offset in Bucket 7
	.long	Lset170
.set Lset171, Ltypes34-Ltypes_begin     ; Offset in Bucket 8
	.long	Lset171
.set Lset172, Ltypes0-Ltypes_begin      ; Offset in Bucket 8
	.long	Lset172
.set Lset173, Ltypes27-Ltypes_begin     ; Offset in Bucket 8
	.long	Lset173
.set Lset174, Ltypes6-Ltypes_begin      ; Offset in Bucket 10
	.long	Lset174
.set Lset175, Ltypes28-Ltypes_begin     ; Offset in Bucket 10
	.long	Lset175
.set Lset176, Ltypes23-Ltypes_begin     ; Offset in Bucket 11
	.long	Lset176
.set Lset177, Ltypes30-Ltypes_begin     ; Offset in Bucket 11
	.long	Lset177
.set Lset178, Ltypes15-Ltypes_begin     ; Offset in Bucket 11
	.long	Lset178
.set Lset179, Ltypes14-Ltypes_begin     ; Offset in Bucket 11
	.long	Lset179
.set Lset180, Ltypes20-Ltypes_begin     ; Offset in Bucket 12
	.long	Lset180
.set Lset181, Ltypes8-Ltypes_begin      ; Offset in Bucket 13
	.long	Lset181
.set Lset182, Ltypes26-Ltypes_begin     ; Offset in Bucket 13
	.long	Lset182
.set Lset183, Ltypes35-Ltypes_begin     ; Offset in Bucket 14
	.long	Lset183
.set Lset184, Ltypes7-Ltypes_begin      ; Offset in Bucket 15
	.long	Lset184
.set Lset185, Ltypes5-Ltypes_begin      ; Offset in Bucket 16
	.long	Lset185
.set Lset186, Ltypes12-Ltypes_begin     ; Offset in Bucket 16
	.long	Lset186
.set Lset187, Ltypes13-Ltypes_begin     ; Offset in Bucket 17
	.long	Lset187
.set Lset188, Ltypes33-Ltypes_begin     ; Offset in Bucket 17
	.long	Lset188
.set Lset189, Ltypes18-Ltypes_begin     ; Offset in Bucket 17
	.long	Lset189
Ltypes1:
	.long	1008                            ; __darwin_arm_thread_state64
	.long	1                               ; Num DIEs
	.long	1889
	.short	19
	.byte	0
	.long	0
Ltypes25:
	.long	393                             ; __int32_t
	.long	1                               ; Num DIEs
	.long	692
	.short	22
	.byte	0
	.long	0
Ltypes16:
	.long	493                             ; long int
	.long	1                               ; Num DIEs
	.long	758
	.short	36
	.byte	0
	.long	0
Ltypes24:
	.long	458                             ; sigval
	.long	1                               ; Num DIEs
	.long	725
	.short	23
	.byte	0
	.long	0
Ltypes19:
	.long	912                             ; __darwin_mcontext64
	.long	1                               ; Num DIEs
	.long	1786
	.short	19
	.byte	0
	.long	0
Ltypes3:
	.long	283                             ; int
	.long	1                               ; Num DIEs
	.long	400
	.short	36
	.byte	0
	.long	0
Ltypes4:
	.long	695                             ; _Bool
	.long	1                               ; Num DIEs
	.long	1554
	.short	36
	.byte	0
	.long	0
Ltypes17:
	.long	974                             ; __uint64_t
	.long	1                               ; Num DIEs
	.long	1878
	.short	22
	.byte	0
	.long	0
Ltypes36:
	.long	822                             ; __darwin_sigaltstack
	.long	1                               ; Num DIEs
	.long	1720
	.short	19
	.byte	0
	.long	0
Ltypes22:
	.long	745                             ; siginfo_t
	.long	1                               ; Num DIEs
	.long	1599
	.short	22
	.byte	0
	.long	0
Ltypes11:
	.long	410                             ; uid_t
	.long	1                               ; Num DIEs
	.long	703
	.short	22
	.byte	0
	.long	0
Ltypes2:
	.long	223                             ; unsigned int
	.long	1                               ; Num DIEs
	.long	83
	.short	36
	.byte	0
	.long	0
Ltypes31:
	.long	526                             ; __ARRAY_SIZE_TYPE__
	.long	1                               ; Num DIEs
	.long	784
	.short	36
	.byte	0
	.long	0
Ltypes32:
	.long	1072                            ; __darwin_arm_neon_state64
	.long	1                               ; Num DIEs
	.long	1998
	.short	19
	.byte	0
	.long	0
Ltypes29:
	.long	287                             ; __sigaction_u
	.long	1                               ; Num DIEs
	.long	466
	.short	23
	.byte	0
	.long	0
Ltypes21:
	.long	185                             ; sigset_t
	.long	1                               ; Num DIEs
	.long	50
	.short	22
	.byte	0
	.long	0
Ltypes9:
	.long	857                             ; __darwin_size_t
	.long	1                               ; Num DIEs
	.long	1765
	.short	22
	.byte	0
	.long	0
Ltypes10:
	.long	378                             ; __darwin_pid_t
	.long	1                               ; Num DIEs
	.long	681
	.short	22
	.byte	0
	.long	0
Ltypes34:
	.long	236                             ; uint64_t
	.long	1                               ; Num DIEs
	.long	91
	.short	22
	.byte	0
	.long	0
Ltypes0:
	.long	1114                            ; unsigned __int128
	.long	1                               ; Num DIEs
	.long	2073
	.short	36
	.byte	0
	.long	0
Ltypes27:
	.long	574                             ; long long int
	.long	1                               ; Num DIEs
	.long	842
	.short	36
	.byte	0
	.long	0
Ltypes6:
	.long	1175                            ; uint8_t
	.long	1                               ; Num DIEs
	.long	2080
	.short	22
	.byte	0
	.long	0
Ltypes28:
	.long	762                             ; ucontext_t
	.long	1                               ; Num DIEs
	.long	1615
	.short	22
	.byte	0
	.long	0
Ltypes23:
	.long	194                             ; __darwin_sigset_t
	.long	1                               ; Num DIEs
	.long	61
	.short	22
	.byte	0
	.long	0
Ltypes30:
	.long	212                             ; __uint32_t
	.long	1                               ; Num DIEs
	.long	72
	.short	22
	.byte	0
	.long	0
Ltypes15:
	.long	937                             ; __darwin_arm_exception_state64
	.long	1                               ; Num DIEs
	.long	1833
	.short	19
	.byte	0
	.long	0
Ltypes14:
	.long	508                             ; long unsigned int
	.long	1                               ; Num DIEs
	.long	777
	.short	36
	.byte	0
	.long	0
Ltypes20:
	.long	273                             ; sigaction
	.long	1                               ; Num DIEs
	.long	417
	.short	19
	.byte	0
	.long	0
Ltypes8:
	.long	372                             ; pid_t
	.long	1                               ; Num DIEs
	.long	670
	.short	22
	.byte	0
	.long	0
Ltypes26:
	.long	245                             ; long long unsigned int
	.long	1                               ; Num DIEs
	.long	102
	.short	36
	.byte	0
	.long	0
Ltypes35:
	.long	1183                            ; unsigned char
	.long	1                               ; Num DIEs
	.long	2091
	.short	36
	.byte	0
	.long	0
Ltypes7:
	.long	1102                            ; __uint128_t
	.long	1                               ; Num DIEs
	.long	2062
	.short	22
	.byte	0
	.long	0
Ltypes5:
	.long	329                             ; __siginfo
	.long	1                               ; Num DIEs
	.long	541
	.short	19
	.byte	0
	.long	0
Ltypes12:
	.long	416                             ; __darwin_uid_t
	.long	1                               ; Num DIEs
	.long	714
	.short	22
	.byte	0
	.long	0
Ltypes13:
	.long	723                             ; uint32_t
	.long	1                               ; Num DIEs
	.long	1583
	.short	22
	.byte	0
	.long	0
Ltypes33:
	.long	773                             ; __darwin_ucontext
	.long	1                               ; Num DIEs
	.long	1626
	.short	19
	.byte	0
	.long	0
Ltypes18:
	.long	714                             ; char
	.long	1                               ; Num DIEs
	.long	1571
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
