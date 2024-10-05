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
	.file	5 "/Users/xss/code" "sprr.c"
	.loc	5 104 0                         ; sprr.c:104:0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #208                    ; =208
	stp	x29, x30, [sp, #192]            ; 16-byte Folded Spill
	add	x29, sp, #192                   ; =192
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, ___llvm_profile_counter_bias@PAGE
	ldr	x8, [x8, ___llvm_profile_counter_bias@PAGEOFF]
	mov	x9, x8
	mov	w10, #0
	stur	w10, [x29, #-4]
	stur	w0, [x29, #-8]
	stur	x1, [x29, #-16]
Ltmp0:
	.loc	5 104 1 prologue_end            ; sprr.c:104:1
	adrp	x11, l___profc_main@PAGE
	add	x11, x11, l___profc_main@PAGEOFF
	ldr	x12, [x11, x8]
	add	x12, x12, #1                    ; =1
	str	x12, [x11, x8]
	sub	x8, x29, #32                    ; =32
	.loc	5 109 5                         ; sprr.c:109:5
	add	x8, x8, #8                      ; =8
	mov	x11, x8
	mov	x1, x8
	mov	x2, #0
	stur	x9, [x29, #-56]                 ; 8-byte Folded Spill
	stur	x11, [x29, #-64]                ; 8-byte Folded Spill
	stur	x1, [x29, #-72]                 ; 8-byte Folded Spill
	stur	x2, [x29, #-80]                 ; 8-byte Folded Spill
	cbz	x8, LBB0_2
	b	LBB0_1
LBB0_1:
	.loc	5 0 5 is_stmt 0                 ; sprr.c:0:5
	ldur	x8, [x29, #-80]                 ; 8-byte Folded Reload
	.loc	5 109 5                         ; sprr.c:109:5
	cbz	x8, LBB0_3
	b	LBB0_2
LBB0_2:
	adrp	x0, l___unnamed_1@PAGE
	add	x0, x0, l___unnamed_1@PAGEOFF
	ldur	x1, [x29, #-72]                 ; 8-byte Folded Reload
	bl	___ubsan_handle_type_mismatch_v1
	b	LBB0_3
LBB0_3:
	.loc	5 0 5                           ; sprr.c:0:5
	mov	w8, #-1
	ldur	x9, [x29, #-64]                 ; 8-byte Folded Reload
	.loc	5 109 5                         ; sprr.c:109:5
	str	w8, [x9]
	.loc	5 110 21 is_stmt 1              ; sprr.c:110:21
	adrp	x10, _bus_handler@PAGE
	add	x10, x10, _bus_handler@PAGEOFF
	stur	x10, [x29, #-32]
	sub	x10, x29, #32                   ; =32
	.loc	5 111 8                         ; sprr.c:111:8
	add	x10, x10, #12                   ; =12
	mov	x11, x10
	mov	x12, #0
	stur	x11, [x29, #-88]                ; 8-byte Folded Spill
	str	x10, [sp, #96]                  ; 8-byte Folded Spill
	.loc	5 111 17 is_stmt 0              ; sprr.c:111:17
	cbz	x12, LBB0_5
	b	LBB0_4
LBB0_4:
	adrp	x0, l___unnamed_2@PAGE
	add	x0, x0, l___unnamed_2@PAGEOFF
	ldr	x1, [sp, #96]                   ; 8-byte Folded Reload
	bl	___ubsan_handle_type_mismatch_v1
	b	LBB0_5
LBB0_5:
	.loc	5 0 17                          ; sprr.c:0:17
	mov	w8, #66
	ldur	x9, [x29, #-88]                 ; 8-byte Folded Reload
	.loc	5 111 17                        ; sprr.c:111:17
	str	w8, [x9]
	mov	w0, #10
	sub	x10, x29, #32                   ; =32
	mov	x1, #0
	str	x1, [sp, #88]                   ; 8-byte Folded Spill
	.loc	5 112 5 is_stmt 1               ; sprr.c:112:5
	mov	x1, x10
	ldr	x2, [sp, #88]                   ; 8-byte Folded Reload
	str	x10, [sp, #80]                  ; 8-byte Folded Spill
	bl	_sigaction
	.loc	5 113 21                        ; sprr.c:113:21
	adrp	x9, _sev_handler@PAGE
	add	x9, x9, _sev_handler@PAGEOFF
	stur	x9, [x29, #-32]
	mov	w8, #11
	str	w0, [sp, #76]                   ; 4-byte Folded Spill
	.loc	5 114 5                         ; sprr.c:114:5
	mov	x0, x8
	ldr	x1, [sp, #80]                   ; 8-byte Folded Reload
	ldr	x2, [sp, #88]                   ; 8-byte Folded Reload
	bl	_sigaction
	mov	w8, #16384
	mov	x1, x8
	mov	w2, #7
	mov	w3, #6146
	mov	w4, #-1
	ldr	x5, [sp, #88]                   ; 8-byte Folded Reload
	str	w0, [sp, #72]                   ; 4-byte Folded Spill
	.loc	5 116 21                        ; sprr.c:116:21
	mov	x0, x5
	bl	_mmap
	.loc	5 116 15 is_stmt 0              ; sprr.c:116:15
	stur	x0, [x29, #-40]
	mov	x0, #3689348814741910323
	.loc	5 118 5 is_stmt 1               ; sprr.c:118:5
	bl	_write_sprr_perm
	.loc	5 119 5                         ; sprr.c:119:5
	ldur	x9, [x29, #-40]
	.loc	5 119 12 is_stmt 0              ; sprr.c:119:12
	mov	x10, x9
	mov	x0, x9
	mov	x11, x9
	mov	w8, #1
	str	x10, [sp, #64]                  ; 8-byte Folded Spill
	str	x0, [sp, #56]                   ; 8-byte Folded Spill
	str	x11, [sp, #48]                  ; 8-byte Folded Spill
	str	w8, [sp, #44]                   ; 4-byte Folded Spill
	cbz	x9, LBB0_8
	b	LBB0_6
LBB0_6:
	.loc	5 0 12                          ; sprr.c:0:12
	ldr	x8, [sp, #48]                   ; 8-byte Folded Reload
	.loc	5 119 12                        ; sprr.c:119:12
	cbz	x8, LBB0_8
	b	LBB0_7
LBB0_7:
	.loc	5 0 12                          ; sprr.c:0:12
	ldr	w8, [sp, #44]                   ; 4-byte Folded Reload
	.loc	5 119 12                        ; sprr.c:119:12
	tbnz	w8, #0, LBB0_9
	b	LBB0_8
LBB0_8:
	adrp	x0, l___unnamed_3@PAGE
	add	x0, x0, l___unnamed_3@PAGEOFF
	ldr	x1, [sp, #56]                   ; 8-byte Folded Reload
	ldr	x2, [sp, #48]                   ; 8-byte Folded Reload
	bl	___ubsan_handle_pointer_overflow
	b	LBB0_9
LBB0_9:
	.loc	5 0 12                          ; sprr.c:0:12
	ldr	x8, [sp, #64]                   ; 8-byte Folded Reload
	ldr	x9, [sp, #64]                   ; 8-byte Folded Reload
	.loc	5 119 12                        ; sprr.c:119:12
	and	x10, x9, #0x3
	str	x8, [sp, #32]                   ; 8-byte Folded Spill
	str	x10, [sp, #24]                  ; 8-byte Folded Spill
	cbz	x9, LBB0_11
	b	LBB0_10
LBB0_10:
	.loc	5 0 12                          ; sprr.c:0:12
	ldr	x8, [sp, #24]                   ; 8-byte Folded Reload
	.loc	5 119 12                        ; sprr.c:119:12
	cbz	x8, LBB0_12
	b	LBB0_11
LBB0_11:
	adrp	x0, l___unnamed_4@PAGE
	add	x0, x0, l___unnamed_4@PAGEOFF
	ldr	x1, [sp, #32]                   ; 8-byte Folded Reload
	bl	___ubsan_handle_type_mismatch_v1
	b	LBB0_12
LBB0_12:
	.loc	5 0 12                          ; sprr.c:0:12
	mov	w8, #960
	movk	w8, #54879, lsl #16
	ldr	x9, [sp, #64]                   ; 8-byte Folded Reload
	.loc	5 119 12                        ; sprr.c:119:12
	str	w8, [x9]
	mov	w8, #0
Ltmp1:
	.loc	5 121 14 is_stmt 1              ; sprr.c:121:14
	stur	w8, [x29, #-44]
	.loc	5 121 10 is_stmt 0              ; sprr.c:121:10
	b	LBB0_13
LBB0_13:                                ; =>This Inner Loop Header: Depth=1
Ltmp2:
	.loc	5 121 21                        ; sprr.c:121:21
	ldur	w8, [x29, #-44]
Ltmp3:
	.loc	5 121 5                         ; sprr.c:121:5
	subs	w8, w8, #3                      ; =3
	b.gt	LBB0_18
	b	LBB0_14
LBB0_14:                                ;   in Loop: Header=BB0_13 Depth=1
	adrp	x8, l___profc_main@PAGE
	add	x8, x8, l___profc_main@PAGEOFF
	ldur	x9, [x29, #-56]                 ; 8-byte Folded Reload
	add	x8, x8, x9
	ldr	x10, [x8, #8]
	add	x10, x10, #1                    ; =1
	str	x10, [x8, #8]
Ltmp4:
	.loc	5 122 19 is_stmt 1              ; sprr.c:122:19
	ldur	x0, [x29, #-40]
	.loc	5 122 38 is_stmt 0              ; sprr.c:122:38
	ldurb	w11, [x29, #-44]
	str	x0, [sp, #16]                   ; 8-byte Folded Spill
	.loc	5 122 24                        ; sprr.c:122:24
	mov	x0, x11
	bl	_make_sprr_val
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	.loc	5 122 9                         ; sprr.c:122:9
	mov	x0, x8
	ldr	x1, [sp, #8]                    ; 8-byte Folded Reload
	bl	_sprr_test
	b	LBB0_15
LBB0_15:                                ;   in Loop: Header=BB0_13 Depth=1
	.loc	5 121 28 is_stmt 1              ; sprr.c:121:28
	ldur	w8, [x29, #-44]
	mov	x9, x8
	adds	w8, w8, #1                      ; =1
	str	w9, [sp, #4]                    ; 4-byte Folded Spill
	str	w8, [sp]                        ; 4-byte Folded Spill
	b.vc	LBB0_17
	b	LBB0_16
LBB0_16:                                ;   in Loop: Header=BB0_13 Depth=1
	.loc	5 0 28 is_stmt 0                ; sprr.c:0:28
	ldr	w8, [sp, #4]                    ; 4-byte Folded Reload
	.loc	5 121 28                        ; sprr.c:121:28
	mov	w9, w8
	mov	x1, x9
	adrp	x0, l___unnamed_5@PAGE
	add	x0, x0, l___unnamed_5@PAGEOFF
	mov	w9, #1
	mov	x2, x9
	bl	___ubsan_handle_add_overflow
	b	LBB0_17
LBB0_17:                                ;   in Loop: Header=BB0_13 Depth=1
	.loc	5 0 28                          ; sprr.c:0:28
	ldr	w8, [sp]                        ; 4-byte Folded Reload
	.loc	5 121 28                        ; sprr.c:121:28
	stur	w8, [x29, #-44]
	.loc	5 121 5                         ; sprr.c:121:5
	b	LBB0_13
Ltmp5:
LBB0_18:
	.loc	5 123 1 is_stmt 1               ; sprr.c:123:1
	ldur	w0, [x29, #-4]
	ldp	x29, x30, [sp, #192]            ; 16-byte Folded Reload
	add	sp, sp, #208                    ; =208
	ret
Ltmp6:
Lfunc_end0:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function bus_handler
_bus_handler:                           ; @bus_handler
Lfunc_begin1:
	.loc	5 21 0                          ; sprr.c:21:0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #176                    ; =176
	stp	x29, x30, [sp, #160]            ; 16-byte Folded Spill
	add	x29, sp, #160                   ; =160
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp7:
	.loc	5 0 0 prologue_end              ; sprr.c:0:0
	adrp	x8, l___profc_sprr.c_bus_handler@PAGE
	add	x8, x8, l___profc_sprr.c_bus_handler@PAGEOFF
	mov	w9, #1
	adrp	x10, ___llvm_profile_counter_bias@PAGE
	ldr	x10, [x10, ___llvm_profile_counter_bias@PAGEOFF]
	stur	w0, [x29, #-4]
	stur	x1, [x29, #-16]
	stur	x2, [x29, #-24]
	.loc	5 21 1                          ; sprr.c:21:1
	add	x8, x8, x10
	ldr	x10, [x8]
	add	x10, x10, #1                    ; =1
	str	x10, [x8]
	.loc	5 24 22                         ; sprr.c:24:22
	ldur	x8, [x29, #-24]
	.loc	5 24 17 is_stmt 0               ; sprr.c:24:17
	stur	x8, [x29, #-32]
	.loc	5 25 5 is_stmt 1                ; sprr.c:25:5
	ldur	x8, [x29, #-32]
	.loc	5 25 9 is_stmt 0                ; sprr.c:25:9
	cmp	x8, #0                          ; =0
	cset	w11, ne
	mov	x10, x8
	tst	x10, #0xf
	cset	w12, eq
	and	w11, w11, w12
	stur	w9, [x29, #-36]                 ; 4-byte Folded Spill
	stur	x8, [x29, #-48]                 ; 8-byte Folded Spill
	stur	x10, [x29, #-56]                ; 8-byte Folded Spill
	tbnz	w11, #0, LBB1_2
; %bb.1:
	.loc	5 0 0                           ; sprr.c:0:0
	adrp	x0, l___unnamed_6@PAGE
	add	x0, x0, l___unnamed_6@PAGEOFF
	ldur	x1, [x29, #-56]                 ; 8-byte Folded Reload
	.loc	5 25 9                          ; sprr.c:25:9
	bl	___ubsan_handle_type_mismatch_v1
LBB1_2:
	.loc	5 0 9                           ; sprr.c:0:9
	ldur	x8, [x29, #-48]                 ; 8-byte Folded Reload
	.loc	5 25 9                          ; sprr.c:25:9
	add	x9, x8, #48                     ; =48
	cmp	x9, #0                          ; =0
	cset	w10, ne
	tst	x9, #0xf
	cset	w11, eq
	and	w10, w10, w11
	stur	x9, [x29, #-64]                 ; 8-byte Folded Spill
	tbnz	w10, #0, LBB1_4
; %bb.3:
	.loc	5 0 0                           ; sprr.c:0:0
	adrp	x0, l___unnamed_7@PAGE
	add	x0, x0, l___unnamed_7@PAGEOFF
	ldur	x1, [x29, #-64]                 ; 8-byte Folded Reload
	.loc	5 25 9                          ; sprr.c:25:9
	bl	___ubsan_handle_type_mismatch_v1
LBB1_4:
	.loc	5 0 9                           ; sprr.c:0:9
	ldur	x8, [x29, #-48]                 ; 8-byte Folded Reload
	.loc	5 25 9                          ; sprr.c:25:9
	ldr	x9, [x8, #48]
	.loc	5 25 22                         ; sprr.c:25:22
	cmp	x9, #0                          ; =0
	cset	w10, ne
	mov	x11, x9
	tst	x11, #0xf
	cset	w12, eq
	and	w10, w10, w12
	stur	x9, [x29, #-72]                 ; 8-byte Folded Spill
	str	x11, [sp, #80]                  ; 8-byte Folded Spill
	tbnz	w10, #0, LBB1_6
; %bb.5:
	.loc	5 0 0                           ; sprr.c:0:0
	adrp	x0, l___unnamed_8@PAGE
	add	x0, x0, l___unnamed_8@PAGEOFF
	ldr	x1, [sp, #80]                   ; 8-byte Folded Reload
	.loc	5 25 22                         ; sprr.c:25:22
	bl	___ubsan_handle_type_mismatch_v1
LBB1_6:
	.loc	5 0 22                          ; sprr.c:0:22
	ldur	x8, [x29, #-72]                 ; 8-byte Folded Reload
	.loc	5 25 22                         ; sprr.c:25:22
	add	x9, x8, #16                     ; =16
	.loc	5 25 27                         ; sprr.c:25:27
	cmp	x9, #0                          ; =0
	cset	w10, ne
	mov	x11, x9
	tst	x11, #0xf
	cset	w12, eq
	and	w10, w10, w12
	str	x9, [sp, #72]                   ; 8-byte Folded Spill
	str	x11, [sp, #64]                  ; 8-byte Folded Spill
	tbnz	w10, #0, LBB1_8
; %bb.7:
	.loc	5 0 0                           ; sprr.c:0:0
	adrp	x0, l___unnamed_9@PAGE
	add	x0, x0, l___unnamed_9@PAGEOFF
	ldr	x1, [sp, #64]                   ; 8-byte Folded Reload
	.loc	5 25 27                         ; sprr.c:25:27
	bl	___ubsan_handle_type_mismatch_v1
LBB1_8:
	.loc	5 0 27                          ; sprr.c:0:27
	ldur	w8, [x29, #-36]                 ; 4-byte Folded Reload
	.loc	5 25 34                         ; sprr.c:25:34
	tbnz	w8, #0, LBB1_10
; %bb.9:
	.loc	5 0 0                           ; sprr.c:0:0
	adrp	x0, l___unnamed_10@PAGE
	add	x0, x0, l___unnamed_10@PAGEOFF
	mov	x8, #0
	.loc	5 25 34                         ; sprr.c:25:34
	mov	x1, x8
	bl	___ubsan_handle_out_of_bounds
LBB1_10:
	.loc	5 0 34                          ; sprr.c:0:34
	ldr	x8, [sp, #72]                   ; 8-byte Folded Reload
	.loc	5 25 34                         ; sprr.c:25:34
	cmp	x8, #0                          ; =0
	cset	w9, ne
	cmp	x8, #0                          ; =0
	cset	w10, ne
	and	w9, w9, w10
	subs	x11, x8, x8
	cset	w10, hs
	subs	x12, x8, x8
	cset	w13, lo
	ldur	w14, [x29, #-36]                ; 4-byte Folded Reload
	tst	w14, #0x1
	csel	w10, w10, w13, ne
	and	w9, w9, w10
	tbnz	w9, #0, LBB1_12
; %bb.11:
	.loc	5 0 0                           ; sprr.c:0:0
	adrp	x0, l___unnamed_11@PAGE
	add	x0, x0, l___unnamed_11@PAGEOFF
	ldr	x1, [sp, #72]                   ; 8-byte Folded Reload
	ldr	x2, [sp, #72]                   ; 8-byte Folded Reload
	.loc	5 25 34                         ; sprr.c:25:34
	bl	___ubsan_handle_pointer_overflow
LBB1_12:
	.loc	5 0 34                          ; sprr.c:0:34
	ldr	x8, [sp, #72]                   ; 8-byte Folded Reload
	.loc	5 25 34                         ; sprr.c:25:34
	cmp	x8, #0                          ; =0
	cset	w9, ne
	tst	x8, #0xf
	cset	w10, eq
	and	w9, w9, w10
	str	x8, [sp, #56]                   ; 8-byte Folded Spill
	tbnz	w9, #0, LBB1_14
; %bb.13:
	.loc	5 0 0                           ; sprr.c:0:0
	adrp	x0, l___unnamed_12@PAGE
	add	x0, x0, l___unnamed_12@PAGEOFF
	ldr	x1, [sp, #56]                   ; 8-byte Folded Reload
	.loc	5 25 34                         ; sprr.c:25:34
	bl	___ubsan_handle_type_mismatch_v1
LBB1_14:
	.loc	5 0 34                          ; sprr.c:0:34
	mov	x8, #48879
	movk	x8, #57005, lsl #16
	ldur	x9, [x29, #-72]                 ; 8-byte Folded Reload
	.loc	5 25 34                         ; sprr.c:25:34
	str	x8, [x9, #16]
	.loc	5 26 5 is_stmt 1                ; sprr.c:26:5
	ldur	x8, [x29, #-32]
	.loc	5 26 9 is_stmt 0                ; sprr.c:26:9
	cmp	x8, #0                          ; =0
	cset	w10, ne
	mov	x11, x8
	tst	x11, #0xf
	cset	w12, eq
	and	w10, w10, w12
	str	x8, [sp, #48]                   ; 8-byte Folded Spill
	str	x11, [sp, #40]                  ; 8-byte Folded Spill
	tbnz	w10, #0, LBB1_16
; %bb.15:
	.loc	5 0 0                           ; sprr.c:0:0
	adrp	x0, l___unnamed_13@PAGE
	add	x0, x0, l___unnamed_13@PAGEOFF
	ldr	x1, [sp, #40]                   ; 8-byte Folded Reload
	.loc	5 26 9                          ; sprr.c:26:9
	bl	___ubsan_handle_type_mismatch_v1
LBB1_16:
	.loc	5 0 9                           ; sprr.c:0:9
	ldr	x8, [sp, #48]                   ; 8-byte Folded Reload
	.loc	5 26 9                          ; sprr.c:26:9
	add	x9, x8, #48                     ; =48
	cmp	x9, #0                          ; =0
	cset	w10, ne
	tst	x9, #0xf
	cset	w11, eq
	and	w10, w10, w11
	str	x9, [sp, #32]                   ; 8-byte Folded Spill
	tbnz	w10, #0, LBB1_18
; %bb.17:
	.loc	5 0 0                           ; sprr.c:0:0
	adrp	x0, l___unnamed_14@PAGE
	add	x0, x0, l___unnamed_14@PAGEOFF
	ldr	x1, [sp, #32]                   ; 8-byte Folded Reload
	.loc	5 26 9                          ; sprr.c:26:9
	bl	___ubsan_handle_type_mismatch_v1
LBB1_18:
	.loc	5 0 9                           ; sprr.c:0:9
	ldr	x8, [sp, #48]                   ; 8-byte Folded Reload
	.loc	5 26 9                          ; sprr.c:26:9
	ldr	x9, [x8, #48]
	.loc	5 26 22                         ; sprr.c:26:22
	cmp	x9, #0                          ; =0
	cset	w10, ne
	mov	x11, x9
	tst	x11, #0xf
	cset	w12, eq
	and	w10, w10, w12
	str	x9, [sp, #24]                   ; 8-byte Folded Spill
	str	x11, [sp, #16]                  ; 8-byte Folded Spill
	tbnz	w10, #0, LBB1_20
; %bb.19:
	.loc	5 0 0                           ; sprr.c:0:0
	adrp	x0, l___unnamed_15@PAGE
	add	x0, x0, l___unnamed_15@PAGEOFF
	ldr	x1, [sp, #16]                   ; 8-byte Folded Reload
	.loc	5 26 22                         ; sprr.c:26:22
	bl	___ubsan_handle_type_mismatch_v1
LBB1_20:
	.loc	5 0 22                          ; sprr.c:0:22
	ldr	x8, [sp, #24]                   ; 8-byte Folded Reload
	.loc	5 26 22                         ; sprr.c:26:22
	add	x9, x8, #16                     ; =16
	.loc	5 26 27                         ; sprr.c:26:27
	cmp	x9, #0                          ; =0
	cset	w10, ne
	tst	x9, #0xf
	cset	w11, eq
	and	w10, w10, w11
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	tbnz	w10, #0, LBB1_22
; %bb.21:
	.loc	5 0 0                           ; sprr.c:0:0
	adrp	x0, l___unnamed_16@PAGE
	add	x0, x0, l___unnamed_16@PAGEOFF
	ldr	x1, [sp, #8]                    ; 8-byte Folded Reload
	.loc	5 26 27                         ; sprr.c:26:27
	bl	___ubsan_handle_type_mismatch_v1
LBB1_22:
	.loc	5 0 27                          ; sprr.c:0:27
	ldr	x8, [sp, #24]                   ; 8-byte Folded Reload
	.loc	5 26 27                         ; sprr.c:26:27
	add	x9, x8, #272                    ; =272
	.loc	5 26 32                         ; sprr.c:26:32
	cmp	x9, #0                          ; =0
	cset	w10, ne
	tst	x9, #0xf
	cset	w11, eq
	and	w10, w10, w11
	str	x9, [sp]                        ; 8-byte Folded Spill
	tbnz	w10, #0, LBB1_24
; %bb.23:
	.loc	5 0 0                           ; sprr.c:0:0
	adrp	x0, l___unnamed_17@PAGE
	add	x0, x0, l___unnamed_17@PAGEOFF
	ldr	x1, [sp]                        ; 8-byte Folded Reload
	.loc	5 26 32                         ; sprr.c:26:32
	bl	___ubsan_handle_type_mismatch_v1
LBB1_24:
	.loc	5 0 32                          ; sprr.c:0:32
	ldr	x8, [sp, #24]                   ; 8-byte Folded Reload
	.loc	5 26 32                         ; sprr.c:26:32
	ldr	x9, [x8, #272]
	add	x9, x9, #4                      ; =4
	str	x9, [x8, #272]
	.loc	5 27 1 is_stmt 1                ; sprr.c:27:1
	ldp	x29, x30, [sp, #160]            ; 16-byte Folded Reload
	add	sp, sp, #176                    ; =176
	ret
Ltmp8:
Lfunc_end1:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function sev_handler
_sev_handler:                           ; @sev_handler
Lfunc_begin2:
	.loc	5 12 0                          ; sprr.c:12:0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #240                    ; =240
	stp	x29, x30, [sp, #224]            ; 16-byte Folded Spill
	add	x29, sp, #224                   ; =224
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp9:
	.loc	5 0 0 prologue_end              ; sprr.c:0:0
	adrp	x8, l___profc_sprr.c_sev_handler@PAGE
	add	x8, x8, l___profc_sprr.c_sev_handler@PAGEOFF
	mov	w9, #1
	adrp	x10, ___llvm_profile_counter_bias@PAGE
	ldr	x10, [x10, ___llvm_profile_counter_bias@PAGEOFF]
	stur	w0, [x29, #-4]
	stur	x1, [x29, #-16]
	stur	x2, [x29, #-24]
	.loc	5 12 1                          ; sprr.c:12:1
	add	x8, x8, x10
	ldr	x10, [x8]
	add	x10, x10, #1                    ; =1
	str	x10, [x8]
	.loc	5 15 22                         ; sprr.c:15:22
	ldur	x8, [x29, #-24]
	.loc	5 15 17 is_stmt 0               ; sprr.c:15:17
	stur	x8, [x29, #-32]
	.loc	5 16 5 is_stmt 1                ; sprr.c:16:5
	ldur	x8, [x29, #-32]
	.loc	5 16 9 is_stmt 0                ; sprr.c:16:9
	cmp	x8, #0                          ; =0
	cset	w11, ne
	mov	x10, x8
	tst	x10, #0xf
	cset	w12, eq
	and	w11, w11, w12
	stur	w9, [x29, #-36]                 ; 4-byte Folded Spill
	stur	x8, [x29, #-48]                 ; 8-byte Folded Spill
	stur	x10, [x29, #-56]                ; 8-byte Folded Spill
	tbnz	w11, #0, LBB2_2
; %bb.1:
	.loc	5 0 0                           ; sprr.c:0:0
	adrp	x0, l___unnamed_18@PAGE
	add	x0, x0, l___unnamed_18@PAGEOFF
	ldur	x1, [x29, #-56]                 ; 8-byte Folded Reload
	.loc	5 16 9                          ; sprr.c:16:9
	bl	___ubsan_handle_type_mismatch_v1
LBB2_2:
	.loc	5 0 9                           ; sprr.c:0:9
	ldur	x8, [x29, #-48]                 ; 8-byte Folded Reload
	.loc	5 16 9                          ; sprr.c:16:9
	add	x9, x8, #48                     ; =48
	cmp	x9, #0                          ; =0
	cset	w10, ne
	tst	x9, #0xf
	cset	w11, eq
	and	w10, w10, w11
	stur	x9, [x29, #-64]                 ; 8-byte Folded Spill
	tbnz	w10, #0, LBB2_4
; %bb.3:
	.loc	5 0 0                           ; sprr.c:0:0
	adrp	x0, l___unnamed_19@PAGE
	add	x0, x0, l___unnamed_19@PAGEOFF
	ldur	x1, [x29, #-64]                 ; 8-byte Folded Reload
	.loc	5 16 9                          ; sprr.c:16:9
	bl	___ubsan_handle_type_mismatch_v1
LBB2_4:
	.loc	5 0 9                           ; sprr.c:0:9
	ldur	x8, [x29, #-48]                 ; 8-byte Folded Reload
	.loc	5 16 9                          ; sprr.c:16:9
	ldr	x9, [x8, #48]
	.loc	5 16 22                         ; sprr.c:16:22
	cmp	x9, #0                          ; =0
	cset	w10, ne
	mov	x11, x9
	tst	x11, #0xf
	cset	w12, eq
	and	w10, w10, w12
	stur	x9, [x29, #-72]                 ; 8-byte Folded Spill
	stur	x11, [x29, #-80]                ; 8-byte Folded Spill
	tbnz	w10, #0, LBB2_6
; %bb.5:
	.loc	5 0 0                           ; sprr.c:0:0
	adrp	x0, l___unnamed_20@PAGE
	add	x0, x0, l___unnamed_20@PAGEOFF
	ldur	x1, [x29, #-80]                 ; 8-byte Folded Reload
	.loc	5 16 22                         ; sprr.c:16:22
	bl	___ubsan_handle_type_mismatch_v1
LBB2_6:
	.loc	5 0 22                          ; sprr.c:0:22
	ldur	x8, [x29, #-72]                 ; 8-byte Folded Reload
	.loc	5 16 22                         ; sprr.c:16:22
	add	x9, x8, #16                     ; =16
	.loc	5 16 27                         ; sprr.c:16:27
	cmp	x9, #0                          ; =0
	cset	w10, ne
	mov	x11, x9
	tst	x11, #0xf
	cset	w12, eq
	and	w10, w10, w12
	stur	x9, [x29, #-88]                 ; 8-byte Folded Spill
	stur	x11, [x29, #-96]                ; 8-byte Folded Spill
	tbnz	w10, #0, LBB2_8
; %bb.7:
	.loc	5 0 0                           ; sprr.c:0:0
	adrp	x0, l___unnamed_21@PAGE
	add	x0, x0, l___unnamed_21@PAGEOFF
	ldur	x1, [x29, #-96]                 ; 8-byte Folded Reload
	.loc	5 16 27                         ; sprr.c:16:27
	bl	___ubsan_handle_type_mismatch_v1
LBB2_8:
	.loc	5 0 27                          ; sprr.c:0:27
	ldur	w8, [x29, #-36]                 ; 4-byte Folded Reload
	.loc	5 16 34                         ; sprr.c:16:34
	tbnz	w8, #0, LBB2_10
; %bb.9:
	.loc	5 0 0                           ; sprr.c:0:0
	adrp	x0, l___unnamed_22@PAGE
	add	x0, x0, l___unnamed_22@PAGEOFF
	mov	x8, #0
	.loc	5 16 34                         ; sprr.c:16:34
	mov	x1, x8
	bl	___ubsan_handle_out_of_bounds
LBB2_10:
	.loc	5 0 34                          ; sprr.c:0:34
	ldur	x8, [x29, #-88]                 ; 8-byte Folded Reload
	.loc	5 16 34                         ; sprr.c:16:34
	cmp	x8, #0                          ; =0
	cset	w9, ne
	cmp	x8, #0                          ; =0
	cset	w10, ne
	and	w9, w9, w10
	subs	x11, x8, x8
	cset	w10, hs
	subs	x12, x8, x8
	cset	w13, lo
	ldur	w14, [x29, #-36]                ; 4-byte Folded Reload
	tst	w14, #0x1
	csel	w10, w10, w13, ne
	and	w9, w9, w10
	tbnz	w9, #0, LBB2_12
; %bb.11:
	.loc	5 0 0                           ; sprr.c:0:0
	adrp	x0, l___unnamed_23@PAGE
	add	x0, x0, l___unnamed_23@PAGEOFF
	ldur	x1, [x29, #-88]                 ; 8-byte Folded Reload
	ldur	x2, [x29, #-88]                 ; 8-byte Folded Reload
	.loc	5 16 34                         ; sprr.c:16:34
	bl	___ubsan_handle_pointer_overflow
LBB2_12:
	.loc	5 0 34                          ; sprr.c:0:34
	ldur	x8, [x29, #-88]                 ; 8-byte Folded Reload
	.loc	5 16 34                         ; sprr.c:16:34
	cmp	x8, #0                          ; =0
	cset	w9, ne
	tst	x8, #0xf
	cset	w10, eq
	and	w9, w9, w10
	stur	x8, [x29, #-104]                ; 8-byte Folded Spill
	tbnz	w9, #0, LBB2_14
; %bb.13:
	.loc	5 0 0                           ; sprr.c:0:0
	adrp	x0, l___unnamed_24@PAGE
	add	x0, x0, l___unnamed_24@PAGEOFF
	ldur	x1, [x29, #-104]                ; 8-byte Folded Reload
	.loc	5 16 34                         ; sprr.c:16:34
	bl	___ubsan_handle_type_mismatch_v1
LBB2_14:
	.loc	5 0 34                          ; sprr.c:0:34
	mov	x8, #48879
	movk	x8, #57005, lsl #16
	ldur	x9, [x29, #-72]                 ; 8-byte Folded Reload
	.loc	5 16 34                         ; sprr.c:16:34
	str	x8, [x9, #16]
	.loc	5 17 34 is_stmt 1               ; sprr.c:17:34
	ldur	x8, [x29, #-32]
	.loc	5 17 38 is_stmt 0               ; sprr.c:17:38
	cmp	x8, #0                          ; =0
	cset	w10, ne
	mov	x11, x8
	tst	x11, #0xf
	cset	w12, eq
	and	w10, w10, w12
	str	x8, [sp, #112]                  ; 8-byte Folded Spill
	str	x11, [sp, #104]                 ; 8-byte Folded Spill
	tbnz	w10, #0, LBB2_16
; %bb.15:
	.loc	5 0 0                           ; sprr.c:0:0
	adrp	x0, l___unnamed_25@PAGE
	add	x0, x0, l___unnamed_25@PAGEOFF
	ldr	x1, [sp, #104]                  ; 8-byte Folded Reload
	.loc	5 17 38                         ; sprr.c:17:38
	bl	___ubsan_handle_type_mismatch_v1
LBB2_16:
	.loc	5 0 38                          ; sprr.c:0:38
	ldr	x8, [sp, #112]                  ; 8-byte Folded Reload
	.loc	5 17 38                         ; sprr.c:17:38
	add	x9, x8, #48                     ; =48
	cmp	x9, #0                          ; =0
	cset	w10, ne
	tst	x9, #0xf
	cset	w11, eq
	and	w10, w10, w11
	str	x9, [sp, #96]                   ; 8-byte Folded Spill
	tbnz	w10, #0, LBB2_18
; %bb.17:
	.loc	5 0 0                           ; sprr.c:0:0
	adrp	x0, l___unnamed_26@PAGE
	add	x0, x0, l___unnamed_26@PAGEOFF
	ldr	x1, [sp, #96]                   ; 8-byte Folded Reload
	.loc	5 17 38                         ; sprr.c:17:38
	bl	___ubsan_handle_type_mismatch_v1
LBB2_18:
	.loc	5 0 38                          ; sprr.c:0:38
	ldr	x8, [sp, #112]                  ; 8-byte Folded Reload
	.loc	5 17 38                         ; sprr.c:17:38
	ldr	x9, [x8, #48]
	.loc	5 17 51                         ; sprr.c:17:51
	cmp	x9, #0                          ; =0
	cset	w10, ne
	mov	x11, x9
	tst	x11, #0xf
	cset	w12, eq
	and	w10, w10, w12
	str	x9, [sp, #88]                   ; 8-byte Folded Spill
	str	x11, [sp, #80]                  ; 8-byte Folded Spill
	tbnz	w10, #0, LBB2_20
; %bb.19:
	.loc	5 0 0                           ; sprr.c:0:0
	adrp	x0, l___unnamed_27@PAGE
	add	x0, x0, l___unnamed_27@PAGEOFF
	ldr	x1, [sp, #80]                   ; 8-byte Folded Reload
	.loc	5 17 51                         ; sprr.c:17:51
	bl	___ubsan_handle_type_mismatch_v1
LBB2_20:
	.loc	5 0 51                          ; sprr.c:0:51
	ldr	x8, [sp, #88]                   ; 8-byte Folded Reload
	.loc	5 17 51                         ; sprr.c:17:51
	add	x9, x8, #16                     ; =16
	.loc	5 17 56                         ; sprr.c:17:56
	cmp	x9, #0                          ; =0
	cset	w10, ne
	tst	x9, #0xf
	cset	w11, eq
	and	w10, w10, w11
	str	x9, [sp, #72]                   ; 8-byte Folded Spill
	tbnz	w10, #0, LBB2_22
; %bb.21:
	.loc	5 0 0                           ; sprr.c:0:0
	adrp	x0, l___unnamed_28@PAGE
	add	x0, x0, l___unnamed_28@PAGEOFF
	ldr	x1, [sp, #72]                   ; 8-byte Folded Reload
	.loc	5 17 56                         ; sprr.c:17:56
	bl	___ubsan_handle_type_mismatch_v1
LBB2_22:
	.loc	5 0 56                          ; sprr.c:0:56
	ldr	x8, [sp, #88]                   ; 8-byte Folded Reload
	.loc	5 17 56                         ; sprr.c:17:56
	add	x9, x8, #256                    ; =256
	cmp	x9, #0                          ; =0
	cset	w10, ne
	tst	x9, #0xf
	cset	w11, eq
	and	w10, w10, w11
	str	x9, [sp, #64]                   ; 8-byte Folded Spill
	tbnz	w10, #0, LBB2_24
; %bb.23:
	.loc	5 0 0                           ; sprr.c:0:0
	adrp	x0, l___unnamed_29@PAGE
	add	x0, x0, l___unnamed_29@PAGEOFF
	ldr	x1, [sp, #64]                   ; 8-byte Folded Reload
	.loc	5 17 56                         ; sprr.c:17:56
	bl	___ubsan_handle_type_mismatch_v1
LBB2_24:
	.loc	5 0 56                          ; sprr.c:0:56
	ldr	x8, [sp, #88]                   ; 8-byte Folded Reload
	.loc	5 17 56                         ; sprr.c:17:56
	ldr	x9, [x8, #256]
	.loc	5 17 5                          ; sprr.c:17:5
	ldur	x10, [x29, #-32]
	.loc	5 17 9                          ; sprr.c:17:9
	cmp	x10, #0                         ; =0
	cset	w11, ne
	mov	x12, x10
	tst	x12, #0xf
	cset	w13, eq
	and	w11, w11, w13
	str	x9, [sp, #56]                   ; 8-byte Folded Spill
	str	x10, [sp, #48]                  ; 8-byte Folded Spill
	str	x12, [sp, #40]                  ; 8-byte Folded Spill
	tbnz	w11, #0, LBB2_26
; %bb.25:
	.loc	5 0 0                           ; sprr.c:0:0
	adrp	x0, l___unnamed_30@PAGE
	add	x0, x0, l___unnamed_30@PAGEOFF
	ldr	x1, [sp, #40]                   ; 8-byte Folded Reload
	.loc	5 17 9                          ; sprr.c:17:9
	bl	___ubsan_handle_type_mismatch_v1
LBB2_26:
	.loc	5 0 9                           ; sprr.c:0:9
	ldr	x8, [sp, #48]                   ; 8-byte Folded Reload
	.loc	5 17 9                          ; sprr.c:17:9
	add	x9, x8, #48                     ; =48
	cmp	x9, #0                          ; =0
	cset	w10, ne
	tst	x9, #0xf
	cset	w11, eq
	and	w10, w10, w11
	str	x9, [sp, #32]                   ; 8-byte Folded Spill
	tbnz	w10, #0, LBB2_28
; %bb.27:
	.loc	5 0 0                           ; sprr.c:0:0
	adrp	x0, l___unnamed_31@PAGE
	add	x0, x0, l___unnamed_31@PAGEOFF
	ldr	x1, [sp, #32]                   ; 8-byte Folded Reload
	.loc	5 17 9                          ; sprr.c:17:9
	bl	___ubsan_handle_type_mismatch_v1
LBB2_28:
	.loc	5 0 9                           ; sprr.c:0:9
	ldr	x8, [sp, #48]                   ; 8-byte Folded Reload
	.loc	5 17 9                          ; sprr.c:17:9
	ldr	x9, [x8, #48]
	.loc	5 17 22                         ; sprr.c:17:22
	cmp	x9, #0                          ; =0
	cset	w10, ne
	mov	x11, x9
	tst	x11, #0xf
	cset	w12, eq
	and	w10, w10, w12
	str	x9, [sp, #24]                   ; 8-byte Folded Spill
	str	x11, [sp, #16]                  ; 8-byte Folded Spill
	tbnz	w10, #0, LBB2_30
; %bb.29:
	.loc	5 0 0                           ; sprr.c:0:0
	adrp	x0, l___unnamed_32@PAGE
	add	x0, x0, l___unnamed_32@PAGEOFF
	ldr	x1, [sp, #16]                   ; 8-byte Folded Reload
	.loc	5 17 22                         ; sprr.c:17:22
	bl	___ubsan_handle_type_mismatch_v1
LBB2_30:
	.loc	5 0 22                          ; sprr.c:0:22
	ldr	x8, [sp, #24]                   ; 8-byte Folded Reload
	.loc	5 17 22                         ; sprr.c:17:22
	add	x9, x8, #16                     ; =16
	.loc	5 17 27                         ; sprr.c:17:27
	cmp	x9, #0                          ; =0
	cset	w10, ne
	tst	x9, #0xf
	cset	w11, eq
	and	w10, w10, w11
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	tbnz	w10, #0, LBB2_32
; %bb.31:
	.loc	5 0 0                           ; sprr.c:0:0
	adrp	x0, l___unnamed_33@PAGE
	add	x0, x0, l___unnamed_33@PAGEOFF
	ldr	x1, [sp, #8]                    ; 8-byte Folded Reload
	.loc	5 17 27                         ; sprr.c:17:27
	bl	___ubsan_handle_type_mismatch_v1
LBB2_32:
	.loc	5 0 27                          ; sprr.c:0:27
	ldr	x8, [sp, #24]                   ; 8-byte Folded Reload
	.loc	5 17 27                         ; sprr.c:17:27
	add	x9, x8, #272                    ; =272
	.loc	5 17 32                         ; sprr.c:17:32
	cmp	x9, #0                          ; =0
	cset	w10, ne
	tst	x9, #0xf
	cset	w11, eq
	and	w10, w10, w11
	str	x9, [sp]                        ; 8-byte Folded Spill
	tbnz	w10, #0, LBB2_34
; %bb.33:
	.loc	5 0 0                           ; sprr.c:0:0
	adrp	x0, l___unnamed_34@PAGE
	add	x0, x0, l___unnamed_34@PAGEOFF
	ldr	x1, [sp]                        ; 8-byte Folded Reload
	.loc	5 17 32                         ; sprr.c:17:32
	bl	___ubsan_handle_type_mismatch_v1
LBB2_34:
	.loc	5 0 32                          ; sprr.c:0:32
	ldr	x8, [sp, #56]                   ; 8-byte Folded Reload
	ldr	x9, [sp, #24]                   ; 8-byte Folded Reload
	.loc	5 17 32                         ; sprr.c:17:32
	str	x8, [x9, #272]
	.loc	5 18 1 is_stmt 1                ; sprr.c:18:1
	ldp	x29, x30, [sp, #224]            ; 16-byte Folded Reload
	add	sp, sp, #240                    ; =240
	ret
Ltmp10:
Lfunc_end2:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function write_sprr_perm
_write_sprr_perm:                       ; @write_sprr_perm
Lfunc_begin3:
	.loc	5 30 0                          ; sprr.c:30:0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16                     ; =16
	.cfi_def_cfa_offset 16
Ltmp12:
	.loc	5 0 0 prologue_end              ; sprr.c:0:0
	adrp	x8, l___profc_sprr.c_write_sprr_perm@PAGE
	add	x8, x8, l___profc_sprr.c_write_sprr_perm@PAGEOFF
	adrp	x9, ___llvm_profile_counter_bias@PAGE
	ldr	x9, [x9, ___llvm_profile_counter_bias@PAGEOFF]
	str	x0, [sp, #8]
	.loc	5 30 1                          ; sprr.c:30:1
	add	x8, x8, x9
	ldr	x9, [x8]
	add	x9, x9, #1                      ; =1
	str	x9, [x8]
	.loc	5 32 43                         ; sprr.c:32:43
	ldr	x8, [sp, #8]
	.loc	5 31 5                          ; sprr.c:31:5
	; InlineAsm Start
	msr	S3_6_C15_C1_5, x8
	isb

	; InlineAsm End
	.loc	5 34 1                          ; sprr.c:34:1
	add	sp, sp, #16                     ; =16
	ret
Ltmp13:
Lfunc_end3:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function sprr_test
_sprr_test:                             ; @sprr_test
Lfunc_begin4:
	.loc	5 85 0                          ; sprr.c:85:0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #144                    ; =144
	stp	x29, x30, [sp, #128]            ; 16-byte Folded Spill
	add	x29, sp, #128                   ; =128
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp14:
	.loc	5 0 0 prologue_end              ; sprr.c:0:0
	adrp	x8, l___profc_sprr.c_sprr_test@PAGE
	add	x8, x8, l___profc_sprr.c_sprr_test@PAGEOFF
	mov	x9, x8
	add	x9, x9, #8                      ; =8
	mov	x10, x8
	add	x10, x10, #16                   ; =16
	mov	x11, x8
	add	x11, x11, #24                   ; =24
	adrp	x12, ___llvm_profile_counter_bias@PAGE
	ldr	x12, [x12, ___llvm_profile_counter_bias@PAGEOFF]
	stur	x0, [x29, #-8]
	stur	x1, [x29, #-16]
	.loc	5 85 1                          ; sprr.c:85:1
	add	x8, x8, x12
	ldr	x13, [x8]
	add	x13, x13, #1                    ; =1
	str	x13, [x8]
	stur	x9, [x29, #-40]                 ; 8-byte Folded Spill
	stur	x10, [x29, #-48]                ; 8-byte Folded Spill
	stur	x11, [x29, #-56]                ; 8-byte Folded Spill
	str	x12, [sp, #64]                  ; 8-byte Folded Spill
	.loc	5 87 9                          ; sprr.c:87:9
	bl	_read_sprr_perm
	.loc	5 87 7 is_stmt 0                ; sprr.c:87:7
	stur	x0, [x29, #-24]
	.loc	5 88 21 is_stmt 1               ; sprr.c:88:21
	ldur	x0, [x29, #-16]
	.loc	5 88 5 is_stmt 0                ; sprr.c:88:5
	bl	_write_sprr_perm
	.loc	5 89 9 is_stmt 1                ; sprr.c:89:9
	bl	_read_sprr_perm
	.loc	5 89 7 is_stmt 0                ; sprr.c:89:7
	stur	x0, [x29, #-32]
	.loc	5 91 30 is_stmt 1               ; sprr.c:91:30
	ldur	x8, [x29, #-32]
	.loc	5 91 42 is_stmt 0               ; sprr.c:91:42
	ldur	x0, [x29, #-8]
	str	x8, [sp, #56]                   ; 8-byte Folded Spill
	.loc	5 91 33                         ; sprr.c:91:33
	bl	_can_read
                                        ; implicit-def: $x1
	mov	x1, x0
	and	x8, x1, #0x1
	ldur	x9, [x29, #-40]                 ; 8-byte Folded Reload
	ldr	x10, [sp, #64]                  ; 8-byte Folded Reload
	add	x11, x9, x10
	ldr	x12, [x11]
	add	x8, x12, x8
	str	x8, [x11]
	mov	w14, #45
	mov	w15, #114
	tst	w0, #0x1
	csel	w15, w15, w14, ne
	.loc	5 91 70                         ; sprr.c:91:70
	ldur	x0, [x29, #-8]
	str	w14, [sp, #52]                  ; 4-byte Folded Spill
	str	w15, [sp, #48]                  ; 4-byte Folded Spill
	.loc	5 91 60                         ; sprr.c:91:60
	bl	_can_write
                                        ; implicit-def: $x1
	mov	x1, x0
	and	x8, x1, #0x1
	ldur	x9, [x29, #-48]                 ; 8-byte Folded Reload
	ldr	x10, [sp, #64]                  ; 8-byte Folded Reload
	add	x11, x9, x10
	ldr	x12, [x11]
	add	x8, x12, x8
	str	x8, [x11]
	mov	w14, #119
	tst	w0, #0x1
	ldr	w15, [sp, #52]                  ; 4-byte Folded Reload
	csel	w14, w14, w15, ne
	.loc	5 92 21 is_stmt 1               ; sprr.c:92:21
	ldur	x0, [x29, #-8]
	str	w14, [sp, #44]                  ; 4-byte Folded Spill
	.loc	5 92 12 is_stmt 0               ; sprr.c:92:12
	bl	_can_exec
                                        ; implicit-def: $x1
	mov	x1, x0
	and	x8, x1, #0x1
	ldur	x9, [x29, #-56]                 ; 8-byte Folded Reload
	ldr	x10, [sp, #64]                  ; 8-byte Folded Reload
	add	x11, x9, x10
	ldr	x12, [x11]
	add	x8, x12, x8
	str	x8, [x11]
	mov	w14, #120
	tst	w0, #0x1
	ldr	w15, [sp, #52]                  ; 4-byte Folded Reload
	csel	w14, w14, w15, ne
	.loc	5 0 0                           ; sprr.c:0:0
	adrp	x0, l_.str@PAGE
	add	x0, x0, l_.str@PAGEOFF
	.loc	5 91 5 is_stmt 1                ; sprr.c:91:5
	mov	x8, sp
	ldr	x11, [sp, #56]                  ; 8-byte Folded Reload
	str	x11, [x8]
                                        ; implicit-def: $x1
	ldr	w16, [sp, #48]                  ; 4-byte Folded Reload
	mov	x1, x16
	str	x1, [x8, #8]
                                        ; implicit-def: $x1
	ldr	w17, [sp, #44]                  ; 4-byte Folded Reload
	mov	x1, x17
	str	x1, [x8, #16]
                                        ; implicit-def: $x1
	mov	x1, x14
	str	x1, [x8, #24]
	bl	_printf
	.loc	5 93 1                          ; sprr.c:93:1
	ldp	x29, x30, [sp, #128]            ; 16-byte Folded Reload
	add	sp, sp, #144                    ; =144
	ret
Ltmp15:
Lfunc_end4:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function make_sprr_val
_make_sprr_val:                         ; @make_sprr_val
Lfunc_begin5:
	.loc	5 96 0                          ; sprr.c:96:0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80                     ; =80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64                    ; =64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, ___llvm_profile_counter_bias@PAGE
	ldr	x8, [x8, ___llvm_profile_counter_bias@PAGEOFF]
	mov	x9, x8
	sturb	w0, [x29, #-1]
Ltmp16:
	.loc	5 96 1 prologue_end             ; sprr.c:96:1
	adrp	x10, l___profc_sprr.c_make_sprr_val@PAGE
	add	x10, x10, l___profc_sprr.c_make_sprr_val@PAGEOFF
	ldr	x11, [x10, x8]
	add	x11, x11, #1                    ; =1
	str	x11, [x10, x8]
	mov	x8, #0
	.loc	5 97 14                         ; sprr.c:97:14
	stur	x8, [x29, #-16]
	mov	w12, #0
Ltmp17:
	.loc	5 98 14                         ; sprr.c:98:14
	stur	w12, [x29, #-20]
	str	x9, [sp, #32]                   ; 8-byte Folded Spill
	.loc	5 98 10 is_stmt 0               ; sprr.c:98:10
	b	LBB5_1
LBB5_1:                                 ; =>This Inner Loop Header: Depth=1
Ltmp18:
	.loc	5 98 21                         ; sprr.c:98:21
	ldur	w8, [x29, #-20]
Ltmp19:
	.loc	5 98 5                          ; sprr.c:98:5
	subs	w8, w8, #15                     ; =15
	b.gt	LBB5_10
	b	LBB5_2
LBB5_2:                                 ;   in Loop: Header=BB5_1 Depth=1
	adrp	x8, l___profc_sprr.c_make_sprr_val@PAGE
	add	x8, x8, l___profc_sprr.c_make_sprr_val@PAGEOFF
	ldr	x9, [sp, #32]                   ; 8-byte Folded Reload
	add	x8, x8, x9
	ldr	x10, [x8, #8]
	add	x10, x10, #1                    ; =1
	str	x10, [x8, #8]
Ltmp20:
	.loc	5 99 27 is_stmt 1               ; sprr.c:99:27
	ldurb	w11, [x29, #-1]
	mov	x8, x11
	.loc	5 99 43 is_stmt 0               ; sprr.c:99:43
	ldursw	x10, [x29, #-20]
	mov	x11, x10
	.loc	5 99 41                         ; sprr.c:99:41
	lsl	x12, x10, #2
                                        ; kill: def $w12 killed $w12 killed $x12
	ubfx	x10, x10, #30, #32
                                        ; kill: def $w10 killed $w10 killed $x10
	subs	w10, w10, w12, asr #31
	str	x8, [sp, #24]                   ; 8-byte Folded Spill
	str	w11, [sp, #20]                  ; 4-byte Folded Spill
	str	w12, [sp, #16]                  ; 4-byte Folded Spill
	b.eq	LBB5_4
	b	LBB5_3
LBB5_3:                                 ;   in Loop: Header=BB5_1 Depth=1
	.loc	5 0 41                          ; sprr.c:0:41
	ldr	w8, [sp, #20]                   ; 4-byte Folded Reload
	.loc	5 99 41                         ; sprr.c:99:41
	mov	w9, w8
	mov	x2, x9
	adrp	x0, l___unnamed_35@PAGE
	add	x0, x0, l___unnamed_35@PAGEOFF
	mov	w9, #4
	mov	x1, x9
	bl	___ubsan_handle_mul_overflow
	b	LBB5_4
LBB5_4:                                 ;   in Loop: Header=BB5_1 Depth=1
	.loc	5 0 41                          ; sprr.c:0:41
	ldr	w8, [sp, #16]                   ; 4-byte Folded Reload
	.loc	5 99 35                         ; sprr.c:99:35
	mov	w9, w8
	mov	x10, x9
	subs	w9, w8, #64                     ; =64
	str	x10, [sp, #8]                   ; 8-byte Folded Spill
	b.lo	LBB5_6
	b	LBB5_5
LBB5_5:                                 ;   in Loop: Header=BB5_1 Depth=1
	.loc	5 0 35                          ; sprr.c:0:35
	ldr	w8, [sp, #16]                   ; 4-byte Folded Reload
	.loc	5 99 35                         ; sprr.c:99:35
	mov	w9, w8
	mov	x2, x9
	adrp	x0, l___unnamed_36@PAGE
	add	x0, x0, l___unnamed_36@PAGEOFF
	ldr	x1, [sp, #24]                   ; 8-byte Folded Reload
	bl	___ubsan_handle_shift_out_of_bounds
	b	LBB5_6
LBB5_6:                                 ;   in Loop: Header=BB5_1 Depth=1
	.loc	5 0 35                          ; sprr.c:0:35
	ldr	x8, [sp, #24]                   ; 8-byte Folded Reload
	ldr	x9, [sp, #8]                    ; 8-byte Folded Reload
	.loc	5 99 35                         ; sprr.c:99:35
	lsl	x10, x8, x9
	.loc	5 99 13                         ; sprr.c:99:13
	ldur	x11, [x29, #-16]
	orr	x10, x11, x10
	stur	x10, [x29, #-16]
	.loc	5 99 9                          ; sprr.c:99:9
	b	LBB5_7
LBB5_7:                                 ;   in Loop: Header=BB5_1 Depth=1
	.loc	5 98 29 is_stmt 1               ; sprr.c:98:29
	ldur	w8, [x29, #-20]
	mov	x9, x8
	adds	w8, w8, #1                      ; =1
	str	w9, [sp, #4]                    ; 4-byte Folded Spill
	str	w8, [sp]                        ; 4-byte Folded Spill
	b.vc	LBB5_9
	b	LBB5_8
LBB5_8:                                 ;   in Loop: Header=BB5_1 Depth=1
	.loc	5 0 29 is_stmt 0                ; sprr.c:0:29
	ldr	w8, [sp, #4]                    ; 4-byte Folded Reload
	.loc	5 98 29                         ; sprr.c:98:29
	mov	w9, w8
	mov	x1, x9
	adrp	x0, l___unnamed_37@PAGE
	add	x0, x0, l___unnamed_37@PAGEOFF
	mov	w9, #1
	mov	x2, x9
	bl	___ubsan_handle_add_overflow
	b	LBB5_9
LBB5_9:                                 ;   in Loop: Header=BB5_1 Depth=1
	.loc	5 0 29                          ; sprr.c:0:29
	ldr	w8, [sp]                        ; 4-byte Folded Reload
	.loc	5 98 29                         ; sprr.c:98:29
	stur	w8, [x29, #-20]
	.loc	5 98 5                          ; sprr.c:98:5
	b	LBB5_1
Ltmp21:
LBB5_10:
	.loc	5 100 12 is_stmt 1              ; sprr.c:100:12
	ldur	x0, [x29, #-16]
	.loc	5 100 5 is_stmt 0               ; sprr.c:100:5
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80                     ; =80
	ret
Ltmp22:
Lfunc_end5:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function read_sprr_perm
_read_sprr_perm:                        ; @read_sprr_perm
Lfunc_begin6:
	.loc	5 37 0 is_stmt 1                ; sprr.c:37:0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16                     ; =16
	.cfi_def_cfa_offset 16
Ltmp24:
	.loc	5 0 0 prologue_end              ; sprr.c:0:0
	adrp	x8, l___profc_sprr.c_read_sprr_perm@PAGE
	add	x8, x8, l___profc_sprr.c_read_sprr_perm@PAGEOFF
	adrp	x9, ___llvm_profile_counter_bias@PAGE
	ldr	x9, [x9, ___llvm_profile_counter_bias@PAGEOFF]
	.loc	5 37 1                          ; sprr.c:37:1
	add	x8, x8, x9
	ldr	x9, [x8]
	add	x9, x9, #1                      ; =1
	str	x9, [x8]
	.loc	5 39 5                          ; sprr.c:39:5
	; InlineAsm Start
	isb
	mrs	x8, S3_6_C15_C1_5

	; InlineAsm End
	str	x8, [sp, #8]
	.loc	5 42 12                         ; sprr.c:42:12
	ldr	x0, [sp, #8]
	.loc	5 42 5 is_stmt 0                ; sprr.c:42:5
	add	sp, sp, #16                     ; =16
	ret
Ltmp25:
Lfunc_end6:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function can_read
_can_read:                              ; @can_read
Lfunc_begin7:
	.loc	5 46 0 is_stmt 1                ; sprr.c:46:0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48                     ; =48
	.cfi_def_cfa_offset 48
Ltmp27:
	.loc	5 0 0 prologue_end              ; sprr.c:0:0
	adrp	x8, l___profc_sprr.c_can_read@PAGE
	add	x8, x8, l___profc_sprr.c_can_read@PAGEOFF
	mov	x9, x8
	add	x9, x9, #8                      ; =8
	adrp	x10, ___llvm_profile_counter_bias@PAGE
	ldr	x10, [x10, ___llvm_profile_counter_bias@PAGEOFF]
	str	x0, [sp, #32]
	.loc	5 46 1                          ; sprr.c:46:1
	add	x8, x8, x10
	ldr	x11, [x8]
	add	x11, x11, #1                    ; =1
	str	x11, [x8]
	.loc	5 47 14                         ; sprr.c:47:14
	str	xzr, [sp, #24]
	.loc	5 52 32                         ; sprr.c:52:32
	ldr	x8, [sp, #32]
	.loc	5 49 5                          ; sprr.c:49:5
	; InlineAsm Start
	ldr	x0, [x8]
	mov	x8, x0

	; InlineAsm End
	str	x8, [sp, #24]
Ltmp28:
	.loc	5 55 9                          ; sprr.c:55:9
	ldr	x8, [sp, #24]
	mov	x11, #48879
	movk	x11, #57005, lsl #16
Ltmp29:
	.loc	5 55 9 is_stmt 0                ; sprr.c:55:9
	subs	x8, x8, x11
	str	x9, [sp, #16]                   ; 8-byte Folded Spill
	str	x10, [sp, #8]                   ; 8-byte Folded Spill
	b.ne	LBB7_2
; %bb.1:
	.loc	5 0 9                           ; sprr.c:0:9
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x9, [sp, #8]                    ; 8-byte Folded Reload
	.loc	5 55 9                          ; sprr.c:55:9
	add	x10, x8, x9
	ldr	x11, [x10]
	add	x11, x11, #1                    ; =1
	str	x11, [x10]
	mov	w12, #0
Ltmp30:
	.loc	5 56 9 is_stmt 1                ; sprr.c:56:9
	and	w12, w12, #0x1
	strb	w12, [sp, #47]
	b	LBB7_3
Ltmp31:
LBB7_2:
	.loc	5 0 9 is_stmt 0                 ; sprr.c:0:9
	mov	w8, #1
	.loc	5 57 5 is_stmt 1                ; sprr.c:57:5
	and	w8, w8, #0x1
	strb	w8, [sp, #47]
LBB7_3:
	.loc	5 58 1                          ; sprr.c:58:1
	ldrb	w8, [sp, #47]
	and	w0, w8, #0x1
	add	sp, sp, #48                     ; =48
	ret
Ltmp32:
Lfunc_end7:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function can_write
_can_write:                             ; @can_write
Lfunc_begin8:
	.loc	5 61 0                          ; sprr.c:61:0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48                     ; =48
	.cfi_def_cfa_offset 48
Ltmp34:
	.loc	5 0 0 prologue_end              ; sprr.c:0:0
	adrp	x8, l___profc_sprr.c_can_write@PAGE
	add	x8, x8, l___profc_sprr.c_can_write@PAGEOFF
	mov	x9, x8
	add	x9, x9, #8                      ; =8
	adrp	x10, ___llvm_profile_counter_bias@PAGE
	ldr	x10, [x10, ___llvm_profile_counter_bias@PAGEOFF]
	str	x0, [sp, #32]
	.loc	5 61 1                          ; sprr.c:61:1
	add	x8, x8, x10
	ldr	x11, [x8]
	add	x11, x11, #1                    ; =1
	str	x11, [x8]
	.loc	5 62 14                         ; sprr.c:62:14
	str	xzr, [sp, #24]
	.loc	5 67 32                         ; sprr.c:67:32
	ldr	x8, [sp, #32]
	.loc	5 67 36 is_stmt 0               ; sprr.c:67:36
	add	x8, x8, #8                      ; =8
	.loc	5 64 5 is_stmt 1                ; sprr.c:64:5
	; InlineAsm Start
	str	x0, [x8]
	mov	x8, x0

	; InlineAsm End
	str	x8, [sp, #24]
Ltmp35:
	.loc	5 70 9                          ; sprr.c:70:9
	ldr	x8, [sp, #24]
	mov	x11, #48879
	movk	x11, #57005, lsl #16
Ltmp36:
	.loc	5 70 9 is_stmt 0                ; sprr.c:70:9
	subs	x8, x8, x11
	str	x9, [sp, #16]                   ; 8-byte Folded Spill
	str	x10, [sp, #8]                   ; 8-byte Folded Spill
	b.ne	LBB8_2
; %bb.1:
	.loc	5 0 9                           ; sprr.c:0:9
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x9, [sp, #8]                    ; 8-byte Folded Reload
	.loc	5 70 9                          ; sprr.c:70:9
	add	x10, x8, x9
	ldr	x11, [x10]
	add	x11, x11, #1                    ; =1
	str	x11, [x10]
	mov	w12, #0
Ltmp37:
	.loc	5 71 9 is_stmt 1                ; sprr.c:71:9
	and	w12, w12, #0x1
	strb	w12, [sp, #47]
	b	LBB8_3
Ltmp38:
LBB8_2:
	.loc	5 0 9 is_stmt 0                 ; sprr.c:0:9
	mov	w8, #1
	.loc	5 72 5 is_stmt 1                ; sprr.c:72:5
	and	w8, w8, #0x1
	strb	w8, [sp, #47]
LBB8_3:
	.loc	5 73 1                          ; sprr.c:73:1
	ldrb	w8, [sp, #47]
	and	w0, w8, #0x1
	add	sp, sp, #48                     ; =48
	ret
Ltmp39:
Lfunc_end8:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function can_exec
_can_exec:                              ; @can_exec
Lfunc_begin9:
	.loc	5 76 0                          ; sprr.c:76:0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64                     ; =64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48                    ; =48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp40:
	.loc	5 0 0 prologue_end              ; sprr.c:0:0
	adrp	x8, l___profc_sprr.c_can_exec@PAGE
	add	x8, x8, l___profc_sprr.c_can_exec@PAGEOFF
	mov	x9, x8
	add	x9, x9, #8                      ; =8
	adrp	x10, ___llvm_profile_counter_bias@PAGE
	ldr	x10, [x10, ___llvm_profile_counter_bias@PAGEOFF]
	stur	x0, [x29, #-16]
	.loc	5 76 1                          ; sprr.c:76:1
	add	x8, x8, x10
	ldr	x11, [x8]
	add	x11, x11, #1                    ; =1
	str	x11, [x8]
	.loc	5 77 37                         ; sprr.c:77:37
	ldur	x8, [x29, #-16]
	.loc	5 77 16 is_stmt 0               ; sprr.c:77:16
	str	x8, [sp, #24]
	.loc	5 78 20 is_stmt 1               ; sprr.c:78:20
	ldr	x8, [sp, #24]
	mov	x11, #0
	mov	x0, x11
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	str	x10, [sp]                       ; 8-byte Folded Spill
	blr	x8
	.loc	5 78 14 is_stmt 0               ; sprr.c:78:14
	str	x0, [sp, #16]
Ltmp41:
	.loc	5 79 9 is_stmt 1                ; sprr.c:79:9
	ldr	x8, [sp, #16]
	mov	x9, #48879
	movk	x9, #57005, lsl #16
Ltmp42:
	.loc	5 79 9 is_stmt 0                ; sprr.c:79:9
	subs	x8, x8, x9
	b.ne	LBB9_2
; %bb.1:
	.loc	5 0 9                           ; sprr.c:0:9
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x9, [sp]                        ; 8-byte Folded Reload
	.loc	5 79 9                          ; sprr.c:79:9
	add	x10, x8, x9
	ldr	x11, [x10]
	add	x11, x11, #1                    ; =1
	str	x11, [x10]
	mov	w12, #0
Ltmp43:
	.loc	5 80 9 is_stmt 1                ; sprr.c:80:9
	and	w12, w12, #0x1
	sturb	w12, [x29, #-1]
	b	LBB9_3
Ltmp44:
LBB9_2:
	.loc	5 0 9 is_stmt 0                 ; sprr.c:0:9
	mov	w8, #1
	.loc	5 81 5 is_stmt 1                ; sprr.c:81:5
	and	w8, w8, #0x1
	sturb	w8, [x29, #-1]
LBB9_3:
	.loc	5 82 1                          ; sprr.c:82:1
	ldurb	w8, [x29, #-1]
	and	w0, w8, #0x1
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64                     ; =64
	ret
Ltmp45:
Lfunc_end9:
	.cfi_endproc
                                        ; -- End function
	.private_extern	___llvm_profile_runtime_user ; -- Begin function __llvm_profile_runtime_user
	.globl	___llvm_profile_runtime_user
	.weak_definition	___llvm_profile_runtime_user
	.p2align	2
___llvm_profile_runtime_user:           ; @__llvm_profile_runtime_user
Lfunc_begin10:
	.cfi_startproc
; %bb.0:
	adrp	x8, ___llvm_profile_runtime@GOTPAGE
	ldr	x8, [x8, ___llvm_profile_runtime@GOTPAGEOFF]
	ldr	w0, [x8]
	ret
Lfunc_end10:
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.src:                                 ; @.src
	.asciz	"sprr.c"

	.section	__TEXT,__const
	.p2align	4                               ; @0
l___unnamed_38:
	.short	0                               ; 0x0
	.short	10                              ; 0xa
	.asciz	"'sigset_t' (aka 'unsigned int')"

	.section	__DATA,__data
	.p2align	4                               ; @1
l___unnamed_1:
	.quad	l_.src
	.long	109                             ; 0x6d
	.long	5                               ; 0x5
	.quad	l___unnamed_38
	.byte	3                               ; 0x3
	.byte	1                               ; 0x1
	.space	6

	.section	__TEXT,__const
	.p2align	3                               ; @2
l___unnamed_39:
	.short	0                               ; 0x0
	.short	11                              ; 0xb
	.asciz	"'int'"

	.section	__DATA,__data
	.p2align	4                               ; @3
l___unnamed_2:
	.quad	l_.src
	.long	111                             ; 0x6f
	.long	8                               ; 0x8
	.quad	l___unnamed_39
	.byte	2                               ; 0x2
	.byte	1                               ; 0x1
	.space	6

	.p2align	3                               ; @4
l___unnamed_3:
	.quad	l_.src
	.long	119                             ; 0x77
	.long	5                               ; 0x5

	.section	__TEXT,__const
	.p2align	4                               ; @5
l___unnamed_40:
	.short	0                               ; 0x0
	.short	10                              ; 0xa
	.asciz	"'uint32_t' (aka 'unsigned int')"

	.section	__DATA,__data
	.p2align	4                               ; @6
l___unnamed_4:
	.quad	l_.src
	.long	119                             ; 0x77
	.long	5                               ; 0x5
	.quad	l___unnamed_40
	.byte	2                               ; 0x2
	.byte	1                               ; 0x1
	.space	6

	.p2align	4                               ; @7
l___unnamed_5:
	.quad	l_.src
	.long	121                             ; 0x79
	.long	28                              ; 0x1c
	.quad	l___unnamed_39

	.section	__TEXT,__const
	.p2align	4                               ; @8
l___unnamed_41:
	.short	65535                           ; 0xffff
	.short	0                               ; 0x0
	.asciz	"'ucontext_t' (aka 'struct __darwin_ucontext')"

	.section	__DATA,__data
	.p2align	4                               ; @9
l___unnamed_6:
	.quad	l_.src
	.long	25                              ; 0x19
	.long	9                               ; 0x9
	.quad	l___unnamed_41
	.byte	4                               ; 0x4
	.byte	3                               ; 0x3
	.space	6

	.section	__TEXT,__const
	.p2align	4                               ; @10
l___unnamed_42:
	.short	65535                           ; 0xffff
	.short	0                               ; 0x0
	.asciz	"'struct __darwin_mcontext64 *'"
	.space	1

	.section	__DATA,__data
	.p2align	4                               ; @11
l___unnamed_7:
	.quad	l_.src
	.long	25                              ; 0x19
	.long	9                               ; 0x9
	.quad	l___unnamed_42
	.byte	4                               ; 0x4
	.byte	0                               ; 0x0
	.space	6

	.section	__TEXT,__const
	.p2align	4                               ; @12
l___unnamed_43:
	.short	65535                           ; 0xffff
	.short	0                               ; 0x0
	.asciz	"'struct __darwin_mcontext64'"
	.space	1

	.section	__DATA,__data
	.p2align	4                               ; @13
l___unnamed_8:
	.quad	l_.src
	.long	25                              ; 0x19
	.long	22                              ; 0x16
	.quad	l___unnamed_43
	.byte	4                               ; 0x4
	.byte	3                               ; 0x3
	.space	6

	.section	__TEXT,__const
	.p2align	4                               ; @14
l___unnamed_44:
	.short	65535                           ; 0xffff
	.short	0                               ; 0x0
	.asciz	"'struct __darwin_arm_thread_state64'"
	.space	1

	.section	__DATA,__data
	.p2align	4                               ; @15
l___unnamed_9:
	.quad	l_.src
	.long	25                              ; 0x19
	.long	22                              ; 0x16
	.quad	l___unnamed_44
	.byte	4                               ; 0x4
	.byte	3                               ; 0x3
	.space	6

	.section	__TEXT,__const
	.p2align	4                               ; @16
l___unnamed_45:
	.short	65535                           ; 0xffff
	.short	0                               ; 0x0
	.asciz	"'__uint64_t [29]'"

	.section	__DATA,__data
	.p2align	4                               ; @17
l___unnamed_10:
	.quad	l_.src
	.long	25                              ; 0x19
	.long	5                               ; 0x5
	.quad	l___unnamed_45
	.quad	l___unnamed_39

	.p2align	3                               ; @18
l___unnamed_11:
	.quad	l_.src
	.long	25                              ; 0x19
	.long	5                               ; 0x5

	.section	__TEXT,__const
	.p2align	4                               ; @19
l___unnamed_46:
	.short	0                               ; 0x0
	.short	12                              ; 0xc
	.asciz	"'__uint64_t' (aka 'unsigned long long')"

	.section	__DATA,__data
	.p2align	4                               ; @20
l___unnamed_12:
	.quad	l_.src
	.long	25                              ; 0x19
	.long	5                               ; 0x5
	.quad	l___unnamed_46
	.byte	4                               ; 0x4
	.byte	1                               ; 0x1
	.space	6

	.p2align	4                               ; @21
l___unnamed_13:
	.quad	l_.src
	.long	26                              ; 0x1a
	.long	9                               ; 0x9
	.quad	l___unnamed_41
	.byte	4                               ; 0x4
	.byte	3                               ; 0x3
	.space	6

	.p2align	4                               ; @22
l___unnamed_14:
	.quad	l_.src
	.long	26                              ; 0x1a
	.long	9                               ; 0x9
	.quad	l___unnamed_42
	.byte	4                               ; 0x4
	.byte	0                               ; 0x0
	.space	6

	.p2align	4                               ; @23
l___unnamed_15:
	.quad	l_.src
	.long	26                              ; 0x1a
	.long	22                              ; 0x16
	.quad	l___unnamed_43
	.byte	4                               ; 0x4
	.byte	3                               ; 0x3
	.space	6

	.p2align	4                               ; @24
l___unnamed_16:
	.quad	l_.src
	.long	26                              ; 0x1a
	.long	22                              ; 0x16
	.quad	l___unnamed_44
	.byte	4                               ; 0x4
	.byte	3                               ; 0x3
	.space	6

	.p2align	4                               ; @25
l___unnamed_17:
	.quad	l_.src
	.long	26                              ; 0x1a
	.long	27                              ; 0x1b
	.quad	l___unnamed_46
	.byte	4                               ; 0x4
	.byte	1                               ; 0x1
	.space	6

	.p2align	4                               ; @26
l___unnamed_18:
	.quad	l_.src
	.long	16                              ; 0x10
	.long	9                               ; 0x9
	.quad	l___unnamed_41
	.byte	4                               ; 0x4
	.byte	3                               ; 0x3
	.space	6

	.p2align	4                               ; @27
l___unnamed_19:
	.quad	l_.src
	.long	16                              ; 0x10
	.long	9                               ; 0x9
	.quad	l___unnamed_42
	.byte	4                               ; 0x4
	.byte	0                               ; 0x0
	.space	6

	.p2align	4                               ; @28
l___unnamed_20:
	.quad	l_.src
	.long	16                              ; 0x10
	.long	22                              ; 0x16
	.quad	l___unnamed_43
	.byte	4                               ; 0x4
	.byte	3                               ; 0x3
	.space	6

	.p2align	4                               ; @29
l___unnamed_21:
	.quad	l_.src
	.long	16                              ; 0x10
	.long	22                              ; 0x16
	.quad	l___unnamed_44
	.byte	4                               ; 0x4
	.byte	3                               ; 0x3
	.space	6

	.p2align	4                               ; @30
l___unnamed_22:
	.quad	l_.src
	.long	16                              ; 0x10
	.long	5                               ; 0x5
	.quad	l___unnamed_45
	.quad	l___unnamed_39

	.p2align	3                               ; @31
l___unnamed_23:
	.quad	l_.src
	.long	16                              ; 0x10
	.long	5                               ; 0x5

	.p2align	4                               ; @32
l___unnamed_24:
	.quad	l_.src
	.long	16                              ; 0x10
	.long	5                               ; 0x5
	.quad	l___unnamed_46
	.byte	4                               ; 0x4
	.byte	1                               ; 0x1
	.space	6

	.p2align	4                               ; @33
l___unnamed_25:
	.quad	l_.src
	.long	17                              ; 0x11
	.long	38                              ; 0x26
	.quad	l___unnamed_41
	.byte	4                               ; 0x4
	.byte	3                               ; 0x3
	.space	6

	.p2align	4                               ; @34
l___unnamed_26:
	.quad	l_.src
	.long	17                              ; 0x11
	.long	38                              ; 0x26
	.quad	l___unnamed_42
	.byte	4                               ; 0x4
	.byte	0                               ; 0x0
	.space	6

	.p2align	4                               ; @35
l___unnamed_27:
	.quad	l_.src
	.long	17                              ; 0x11
	.long	51                              ; 0x33
	.quad	l___unnamed_43
	.byte	4                               ; 0x4
	.byte	3                               ; 0x3
	.space	6

	.p2align	4                               ; @36
l___unnamed_28:
	.quad	l_.src
	.long	17                              ; 0x11
	.long	51                              ; 0x33
	.quad	l___unnamed_44
	.byte	4                               ; 0x4
	.byte	3                               ; 0x3
	.space	6

	.p2align	4                               ; @37
l___unnamed_29:
	.quad	l_.src
	.long	17                              ; 0x11
	.long	56                              ; 0x38
	.quad	l___unnamed_46
	.byte	4                               ; 0x4
	.byte	0                               ; 0x0
	.space	6

	.p2align	4                               ; @38
l___unnamed_30:
	.quad	l_.src
	.long	17                              ; 0x11
	.long	9                               ; 0x9
	.quad	l___unnamed_41
	.byte	4                               ; 0x4
	.byte	3                               ; 0x3
	.space	6

	.p2align	4                               ; @39
l___unnamed_31:
	.quad	l_.src
	.long	17                              ; 0x11
	.long	9                               ; 0x9
	.quad	l___unnamed_42
	.byte	4                               ; 0x4
	.byte	0                               ; 0x0
	.space	6

	.p2align	4                               ; @40
l___unnamed_32:
	.quad	l_.src
	.long	17                              ; 0x11
	.long	22                              ; 0x16
	.quad	l___unnamed_43
	.byte	4                               ; 0x4
	.byte	3                               ; 0x3
	.space	6

	.p2align	4                               ; @41
l___unnamed_33:
	.quad	l_.src
	.long	17                              ; 0x11
	.long	22                              ; 0x16
	.quad	l___unnamed_44
	.byte	4                               ; 0x4
	.byte	3                               ; 0x3
	.space	6

	.p2align	4                               ; @42
l___unnamed_34:
	.quad	l_.src
	.long	17                              ; 0x11
	.long	27                              ; 0x1b
	.quad	l___unnamed_46
	.byte	4                               ; 0x4
	.byte	1                               ; 0x1
	.space	6

	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"%llx: %c%c%c\n"

	.section	__DATA,__data
	.p2align	4                               ; @43
l___unnamed_35:
	.quad	l_.src
	.long	99                              ; 0x63
	.long	41                              ; 0x29
	.quad	l___unnamed_39

	.section	__TEXT,__const
	.p2align	4                               ; @44
l___unnamed_47:
	.short	0                               ; 0x0
	.short	12                              ; 0xc
	.asciz	"'uint64_t' (aka 'unsigned long long')"

	.section	__DATA,__data
	.p2align	4                               ; @45
l___unnamed_36:
	.quad	l_.src
	.long	99                              ; 0x63
	.long	35                              ; 0x23
	.quad	l___unnamed_47
	.quad	l___unnamed_39

	.p2align	4                               ; @46
l___unnamed_37:
	.quad	l_.src
	.long	98                              ; 0x62
	.long	29                              ; 0x1d
	.quad	l___unnamed_39

	.private_extern	___covrec_DB956436E78DD5FAu ; @__covrec_DB956436E78DD5FAu
	.section	__LLVM_COV,__llvm_covfun
	.globl	___covrec_DB956436E78DD5FAu
	.weak_definition	___covrec_DB956436E78DD5FAu
	.p2align	3
___covrec_DB956436E78DD5FAu:
	.quad	-2624081020897602054            ; 0xdb956436e78dd5fa
	.long	35                              ; 0x23
	.quad	18129                           ; 0x46d1
	.quad	-2617453115339471387            ; 0xdbacf0426bf385e5
	.ascii	"\001\000\001\001\005\005\001h\001\023\002\003\021\025\000\032\005\000\034\000\037\005\000 \001\211\200\200\200\b\005\001\t\000)"

	.private_extern	___covrec_89F9239DF8DDE7ADu ; @__covrec_89F9239DF8DDE7ADu
	.globl	___covrec_89F9239DF8DDE7ADu
	.weak_definition	___covrec_89F9239DF8DDE7ADu
	.p2align	3
___covrec_89F9239DF8DDE7ADu:
	.quad	-8504727259920341075            ; 0x89f9239df8dde7ad
	.long	9                               ; 0x9
	.quad	0                               ; 0x0
	.quad	-2617453115339471387            ; 0xdbacf0426bf385e5
	.ascii	"\001\000\000\001\001\025\001\006\002"

	.private_extern	___covrec_699389576AAD0328u ; @__covrec_699389576AAD0328u
	.globl	___covrec_699389576AAD0328u
	.weak_definition	___covrec_699389576AAD0328u
	.p2align	3
___covrec_699389576AAD0328u:
	.quad	7607575204103783208             ; 0x699389576aad0328
	.long	9                               ; 0x9
	.quad	0                               ; 0x0
	.quad	-2617453115339471387            ; 0xdbacf0426bf385e5
	.ascii	"\001\000\000\001\001\f\001\006\002"

	.private_extern	___covrec_8E813B4F873511u ; @__covrec_8E813B4F873511u
	.globl	___covrec_8E813B4F873511u
	.weak_definition	___covrec_8E813B4F873511u
	.p2align	3
___covrec_8E813B4F873511u:
	.quad	40111538430227729               ; 0x8e813b4f873511
	.long	9                               ; 0x9
	.quad	0                               ; 0x0
	.quad	-2617453115339471387            ; 0xdbacf0426bf385e5
	.ascii	"\001\000\000\001\001\036\001\004\002"

	.private_extern	___covrec_19FA7037C99E12D6u ; @__covrec_19FA7037C99E12D6u
	.globl	___covrec_19FA7037C99E12D6u
	.weak_definition	___covrec_19FA7037C99E12D6u
	.p2align	3
___covrec_19FA7037C99E12D6u:
	.quad	1871931980033954518             ; 0x19fa7037c99e12d6
	.long	72                              ; 0x48
	.quad	54093                           ; 0xd34d
	.quad	-2617453115339471387            ; 0xdbacf0426bf385e5
	.ascii	"\001\000\003\001\005\001\t\001\r\n\001U\001\b\002\005\006/\000\261\200\200\200\b\005\0001\0004\002\0007\000:\t\000K\000\315\200\200\200\b\t\000M\000P\006\000S\000V\r\001\032\000\234\200\200\200\b\r\000\034\000\037\n\000\"\000%"

	.private_extern	___covrec_B73B135DEDA03AEAu ; @__covrec_B73B135DEDA03AEAu
	.globl	___covrec_B73B135DEDA03AEAu
	.weak_definition	___covrec_B73B135DEDA03AEAu
	.p2align	3
___covrec_B73B135DEDA03AEAu:
	.quad	-5243576047003223318            ; 0xb73b135deda03aea
	.long	9                               ; 0x9
	.quad	24                              ; 0x18
	.quad	-2617453115339471387            ; 0xdbacf0426bf385e5
	.ascii	"\001\000\000\001\001%\001\006\002"

	.private_extern	___covrec_2C5AD87AAD5840BCu ; @__covrec_2C5AD87AAD5840BCu
	.globl	___covrec_2C5AD87AAD5840BCu
	.weak_definition	___covrec_2C5AD87AAD5840BCu
	.p2align	3
___covrec_2C5AD87AAD5840BCu:
	.quad	3196104906978640060             ; 0x2c5ad87aad5840bc
	.long	44                              ; 0x2c
	.quad	11262329944                     ; 0x29f498458
	.quad	-2617453115339471387            ; 0xdbacf0426bf385e5
	.ascii	"\001\000\001\001\005\006\001.\001\f\002\001\t\t\000\030\005\000\031\001\211\200\200\200\b\005\001\t\000\025\002\000\025\001\205\200\200\200\b\002\001\005\001\002"

	.private_extern	___covrec_139B6E5CBE659994u ; @__covrec_139B6E5CBE659994u
	.globl	___covrec_139B6E5CBE659994u
	.weak_definition	___covrec_139B6E5CBE659994u
	.p2align	3
___covrec_139B6E5CBE659994u:
	.quad	1412844252721158548             ; 0x139b6e5cbe659994
	.long	44                              ; 0x2c
	.quad	11262329944                     ; 0x29f498458
	.quad	-2617453115339471387            ; 0xdbacf0426bf385e5
	.ascii	"\001\000\001\001\005\006\001=\001\f\002\001\t\t\000\030\005\000\031\001\211\200\200\200\b\005\001\t\000\025\002\000\025\001\205\200\200\200\b\002\001\005\001\002"

	.private_extern	___covrec_8AE931121E67790Au ; @__covrec_8AE931121E67790Au
	.globl	___covrec_8AE931121E67790Au
	.weak_definition	___covrec_8AE931121E67790Au
	.p2align	3
___covrec_8AE931121E67790Au:
	.quad	-8437158473012643574            ; 0x8ae931121e67790a
	.long	44                              ; 0x2c
	.quad	11262329944                     ; 0x29f498458
	.quad	-2617453115339471387            ; 0xdbacf0426bf385e5
	.ascii	"\001\000\001\001\005\006\001L\001\006\002\001\003\t\000\032\005\000\033\001\211\200\200\200\b\005\001\t\000\025\002\000\025\001\205\200\200\200\b\002\001\005\001\002"

	.private_extern	___covrec_A94AE0C240F3EC87u ; @__covrec_A94AE0C240F3EC87u
	.globl	___covrec_A94AE0C240F3EC87u
	.weak_definition	___covrec_A94AE0C240F3EC87u
	.p2align	3
___covrec_A94AE0C240F3EC87u:
	.quad	-6247934408105137017            ; 0xa94ae0c240f3ec87
	.long	35                              ; 0x23
	.quad	1160280                         ; 0x11b458
	.quad	-2617453115339471387            ; 0xdbacf0426bf385e5
	.ascii	"\001\000\001\001\005\005\001`\001\005\002\003\002\025\000\033\005\000\035\000 \005\000!\001\211\200\200\200\b\005\001\t\000-"

	.section	__LLVM_COV,__llvm_covmap
	.p2align	3                               ; @__llvm_coverage_mapping
l___llvm_coverage_mapping:
	.long	0                               ; 0x0
	.long	34                              ; 0x22
	.long	0                               ; 0x0
	.long	3                               ; 0x3
	.ascii	"\001\027\037x\332\023\323\017-N-*\326\257(.\326O\316OI\325/.(*\322K\006\000^\316\b6"
	.space	2

	.section	__DATA,__llvm_prf_cnts
	.p2align	3                               ; @__profc_main
l___profc_main:
	.space	16

	.section	__DATA,__llvm_prf_data,regular,live_support
	.p2align	3                               ; @__profd_main
l___profd_main:
	.quad	-2624081020897602054            ; 0xdb956436e78dd5fa
	.quad	18129                           ; 0x46d1
	.quad	l___profc_main
	.quad	_main
	.quad	0
	.long	2                               ; 0x2
	.space	4

	.section	__DATA,__llvm_prf_cnts
	.p2align	3                               ; @__profc_sprr.c_bus_handler
l___profc_sprr.c_bus_handler:
	.space	8

	.section	__DATA,__llvm_prf_data,regular,live_support
	.p2align	3                               ; @__profd_sprr.c_bus_handler
l___profd_sprr.c_bus_handler:
	.quad	-8504727259920341075            ; 0x89f9239df8dde7ad
	.quad	0                               ; 0x0
	.quad	l___profc_sprr.c_bus_handler
	.quad	_bus_handler
	.quad	0
	.long	1                               ; 0x1
	.space	4

	.section	__DATA,__llvm_prf_cnts
	.p2align	3                               ; @__profc_sprr.c_sev_handler
l___profc_sprr.c_sev_handler:
	.space	8

	.section	__DATA,__llvm_prf_data,regular,live_support
	.p2align	3                               ; @__profd_sprr.c_sev_handler
l___profd_sprr.c_sev_handler:
	.quad	7607575204103783208             ; 0x699389576aad0328
	.quad	0                               ; 0x0
	.quad	l___profc_sprr.c_sev_handler
	.quad	_sev_handler
	.quad	0
	.long	1                               ; 0x1
	.space	4

	.section	__DATA,__llvm_prf_cnts
	.p2align	3                               ; @__profc_sprr.c_write_sprr_perm
l___profc_sprr.c_write_sprr_perm:
	.space	8

	.section	__DATA,__llvm_prf_data,regular,live_support
	.p2align	3                               ; @__profd_sprr.c_write_sprr_perm
l___profd_sprr.c_write_sprr_perm:
	.quad	40111538430227729               ; 0x8e813b4f873511
	.quad	0                               ; 0x0
	.quad	l___profc_sprr.c_write_sprr_perm
	.quad	0
	.quad	0
	.long	1                               ; 0x1
	.space	4

	.section	__DATA,__llvm_prf_cnts
	.p2align	3                               ; @__profc_sprr.c_sprr_test
l___profc_sprr.c_sprr_test:
	.space	32

	.section	__DATA,__llvm_prf_data,regular,live_support
	.p2align	3                               ; @__profd_sprr.c_sprr_test
l___profd_sprr.c_sprr_test:
	.quad	1871931980033954518             ; 0x19fa7037c99e12d6
	.quad	54093                           ; 0xd34d
	.quad	l___profc_sprr.c_sprr_test
	.quad	0
	.quad	0
	.long	4                               ; 0x4
	.space	4

	.section	__DATA,__llvm_prf_cnts
	.p2align	3                               ; @__profc_sprr.c_make_sprr_val
l___profc_sprr.c_make_sprr_val:
	.space	16

	.section	__DATA,__llvm_prf_data,regular,live_support
	.p2align	3                               ; @__profd_sprr.c_make_sprr_val
l___profd_sprr.c_make_sprr_val:
	.quad	-6247934408105137017            ; 0xa94ae0c240f3ec87
	.quad	1160280                         ; 0x11b458
	.quad	l___profc_sprr.c_make_sprr_val
	.quad	0
	.quad	0
	.long	2                               ; 0x2
	.space	4

	.section	__DATA,__llvm_prf_cnts
	.p2align	3                               ; @__profc_sprr.c_read_sprr_perm
l___profc_sprr.c_read_sprr_perm:
	.space	8

	.section	__DATA,__llvm_prf_data,regular,live_support
	.p2align	3                               ; @__profd_sprr.c_read_sprr_perm
l___profd_sprr.c_read_sprr_perm:
	.quad	-5243576047003223318            ; 0xb73b135deda03aea
	.quad	24                              ; 0x18
	.quad	l___profc_sprr.c_read_sprr_perm
	.quad	0
	.quad	0
	.long	1                               ; 0x1
	.space	4

	.section	__DATA,__llvm_prf_cnts
	.p2align	3                               ; @__profc_sprr.c_can_read
l___profc_sprr.c_can_read:
	.space	16

	.section	__DATA,__llvm_prf_data,regular,live_support
	.p2align	3                               ; @__profd_sprr.c_can_read
l___profd_sprr.c_can_read:
	.quad	3196104906978640060             ; 0x2c5ad87aad5840bc
	.quad	11262329944                     ; 0x29f498458
	.quad	l___profc_sprr.c_can_read
	.quad	0
	.quad	0
	.long	2                               ; 0x2
	.space	4

	.section	__DATA,__llvm_prf_cnts
	.p2align	3                               ; @__profc_sprr.c_can_write
l___profc_sprr.c_can_write:
	.space	16

	.section	__DATA,__llvm_prf_data,regular,live_support
	.p2align	3                               ; @__profd_sprr.c_can_write
l___profd_sprr.c_can_write:
	.quad	1412844252721158548             ; 0x139b6e5cbe659994
	.quad	11262329944                     ; 0x29f498458
	.quad	l___profc_sprr.c_can_write
	.quad	0
	.quad	0
	.long	2                               ; 0x2
	.space	4

	.section	__DATA,__llvm_prf_cnts
	.p2align	3                               ; @__profc_sprr.c_can_exec
l___profc_sprr.c_can_exec:
	.space	16

	.section	__DATA,__llvm_prf_data,regular,live_support
	.p2align	3                               ; @__profd_sprr.c_can_exec
l___profd_sprr.c_can_exec:
	.quad	-8437158473012643574            ; 0x8ae931121e67790a
	.quad	11262329944                     ; 0x29f498458
	.quad	l___profc_sprr.c_can_exec
	.quad	0
	.quad	0
	.long	2                               ; 0x2
	.space	4

	.private_extern	___llvm_profile_counter_bias ; @__llvm_profile_counter_bias
	.section	__DATA,__data
	.globl	___llvm_profile_counter_bias
	.weak_definition	___llvm_profile_counter_bias
	.p2align	3
___llvm_profile_counter_bias:
	.quad	0                               ; 0x0

	.section	__DATA,__llvm_prf_names
l___llvm_prf_nm:                        ; @__llvm_prf_nm
	.ascii	"\256\001Yx\332e\315Q\n\200 \020\004P\272P\007\3502\313\246\003I*\262k\326\361\303\310\220\374\234\2673l`\027'M\"\263Y\326Ci\343h=\244\221\242\374\351\024\227A5P\202\204\257Y!Cs\203\300\373[+\354\033\n\330\216[\303\221\352\245\317\317\233\036p\301\334r\210A\207"

	.no_dead_strip	___covrec_DB956436E78DD5FAu
	.no_dead_strip	___covrec_89F9239DF8DDE7ADu
	.no_dead_strip	___covrec_699389576AAD0328u
	.no_dead_strip	___covrec_8E813B4F873511u
	.no_dead_strip	___covrec_19FA7037C99E12D6u
	.no_dead_strip	___covrec_B73B135DEDA03AEAu
	.no_dead_strip	___covrec_2C5AD87AAD5840BCu
	.no_dead_strip	___covrec_139B6E5CBE659994u
	.no_dead_strip	___covrec_8AE931121E67790Au
	.no_dead_strip	___covrec_A94AE0C240F3EC87u
	.no_dead_strip	l___llvm_coverage_mapping
	.no_dead_strip	___llvm_profile_runtime_user
	.no_dead_strip	l___profd_main
	.no_dead_strip	l___profd_sprr.c_bus_handler
	.no_dead_strip	l___profd_sprr.c_sev_handler
	.no_dead_strip	l___profd_sprr.c_write_sprr_perm
	.no_dead_strip	l___profd_sprr.c_sprr_test
	.no_dead_strip	l___profd_sprr.c_make_sprr_val
	.no_dead_strip	l___profd_sprr.c_read_sprr_perm
	.no_dead_strip	l___profd_sprr.c_can_read
	.no_dead_strip	l___profd_sprr.c_can_write
	.no_dead_strip	l___profd_sprr.c_can_exec
	.no_dead_strip	l___llvm_prf_nm
	.file	6 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys" "signal.h"
	.file	7 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types" "_pid_t.h"
	.file	8 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types" "_uid_t.h"
	.file	9 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_types" "_uint32_t.h"
	.file	10 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types" "_ucontext.h"
	.file	11 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types" "_sigaltstack.h"
	.file	12 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/mach/arm" "_structs.h"
	.file	13 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/arm" "_mcontext.h"
	.file	14 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_types" "_uint8_t.h"
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
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	6                               ; Abbreviation Code
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
	.byte	11                              ; DW_TAG_lexical_block
	.byte	1                               ; DW_CHILDREN_yes
	.byte	17                              ; DW_AT_low_pc
	.byte	1                               ; DW_FORM_addr
	.byte	18                              ; DW_AT_high_pc
	.byte	6                               ; DW_FORM_data4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	9                               ; Abbreviation Code
	.byte	46                              ; DW_TAG_subprogram
	.byte	1                               ; DW_CHILDREN_yes
	.byte	17                              ; DW_AT_low_pc
	.byte	1                               ; DW_FORM_addr
	.byte	18                              ; DW_AT_high_pc
	.byte	6                               ; DW_FORM_data4
	.byte	64                              ; DW_AT_frame_base
	.byte	24                              ; DW_FORM_exprloc
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	39                              ; DW_AT_prototyped
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	10                              ; Abbreviation Code
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
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	39                              ; DW_AT_prototyped
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	11                              ; Abbreviation Code
	.byte	46                              ; DW_TAG_subprogram
	.byte	1                               ; DW_CHILDREN_yes
	.byte	17                              ; DW_AT_low_pc
	.byte	1                               ; DW_FORM_addr
	.byte	18                              ; DW_AT_high_pc
	.byte	6                               ; DW_FORM_data4
	.byte	64                              ; DW_AT_frame_base
	.byte	24                              ; DW_FORM_exprloc
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
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	12                              ; Abbreviation Code
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
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	13                              ; Abbreviation Code
	.byte	15                              ; DW_TAG_pointer_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	14                              ; Abbreviation Code
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
	.byte	15                              ; Abbreviation Code
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
	.byte	16                              ; Abbreviation Code
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
	.byte	17                              ; Abbreviation Code
	.byte	21                              ; DW_TAG_subroutine_type
	.byte	1                               ; DW_CHILDREN_yes
	.byte	39                              ; DW_AT_prototyped
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	18                              ; Abbreviation Code
	.byte	5                               ; DW_TAG_formal_parameter
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	19                              ; Abbreviation Code
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
	.byte	20                              ; Abbreviation Code
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
	.byte	21                              ; Abbreviation Code
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
	.byte	22                              ; Abbreviation Code
	.byte	1                               ; DW_TAG_array_type
	.byte	1                               ; DW_CHILDREN_yes
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	23                              ; Abbreviation Code
	.byte	33                              ; DW_TAG_subrange_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	55                              ; DW_AT_count
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	24                              ; Abbreviation Code
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
	.byte	25                              ; Abbreviation Code
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
	.byte	26                              ; Abbreviation Code
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
	.byte	27                              ; Abbreviation Code
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
	.byte	28                              ; Abbreviation Code
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
	.byte	29                              ; Abbreviation Code
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
.set Lset0, Ldebug_info_end0-Ldebug_info_start0 ; Length of Unit
	.long	Lset0
Ldebug_info_start0:
	.short	4                               ; DWARF version number
.set Lset1, Lsection_abbrev-Lsection_abbrev ; Offset Into Abbrev. Section
	.long	Lset1
	.byte	8                               ; Address Size (in bytes)
	.byte	1                               ; Abbrev [1] 0xb:0x6b6 DW_TAG_compile_unit
	.long	0                               ; DW_AT_producer
	.short	12                              ; DW_AT_language
	.long	47                              ; DW_AT_name
	.long	54                              ; DW_AT_LLVM_sysroot
	.long	149                             ; DW_AT_APPLE_sdk
.set Lset2, Lline_table_start0-Lsection_line ; DW_AT_stmt_list
	.long	Lset2
	.long	160                             ; DW_AT_comp_dir
	.quad	Lfunc_begin0                    ; DW_AT_low_pc
.set Lset3, Lfunc_end9-Lfunc_begin0     ; DW_AT_high_pc
	.long	Lset3
	.byte	2                               ; Abbrev [2] 0x32:0xb DW_TAG_typedef
	.long	61                              ; DW_AT_type
	.long	176                             ; DW_AT_name
	.byte	3                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	2                               ; Abbrev [2] 0x3d:0xb DW_TAG_typedef
	.long	72                              ; DW_AT_type
	.long	185                             ; DW_AT_name
	.byte	2                               ; DW_AT_decl_file
	.byte	73                              ; DW_AT_decl_line
	.byte	2                               ; Abbrev [2] 0x48:0xb DW_TAG_typedef
	.long	83                              ; DW_AT_type
	.long	203                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	21                              ; DW_AT_decl_line
	.byte	3                               ; Abbrev [3] 0x53:0x7 DW_TAG_base_type
	.long	214                             ; DW_AT_name
	.byte	7                               ; DW_AT_encoding
	.byte	4                               ; DW_AT_byte_size
	.byte	4                               ; Abbrev [4] 0x5a:0x1 DW_TAG_pointer_type
	.byte	2                               ; Abbrev [2] 0x5b:0xb DW_TAG_typedef
	.long	102                             ; DW_AT_type
	.long	227                             ; DW_AT_name
	.byte	4                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	3                               ; Abbrev [3] 0x66:0x7 DW_TAG_base_type
	.long	236                             ; DW_AT_name
	.byte	7                               ; DW_AT_encoding
	.byte	8                               ; DW_AT_byte_size
	.byte	5                               ; Abbrev [5] 0x6d:0x6e DW_TAG_subprogram
	.quad	Lfunc_begin0                    ; DW_AT_low_pc
.set Lset4, Lfunc_end0-Lfunc_begin0     ; DW_AT_high_pc
	.long	Lset4
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.long	259                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	103                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	787                             ; DW_AT_type
                                        ; DW_AT_external
	.byte	6                               ; Abbrev [6] 0x86:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	120
	.long	381                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	103                             ; DW_AT_decl_line
	.long	787                             ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x94:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	112
	.long	386                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	103                             ; DW_AT_decl_line
	.long	801                             ; DW_AT_type
	.byte	7                               ; Abbrev [7] 0xa2:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	96
	.long	396                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	108                             ; DW_AT_decl_line
	.long	818                             ; DW_AT_type
	.byte	7                               ; Abbrev [7] 0xb0:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	88
	.long	685                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	116                             ; DW_AT_decl_line
	.long	1192                            ; DW_AT_type
	.byte	8                               ; Abbrev [8] 0xbe:0x1c DW_TAG_lexical_block
	.quad	Ltmp1                           ; DW_AT_low_pc
.set Lset5, Ltmp5-Ltmp1                 ; DW_AT_high_pc
	.long	Lset5
	.byte	7                               ; Abbrev [7] 0xcb:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	84
	.long	698                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	121                             ; DW_AT_decl_line
	.long	787                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	9                               ; Abbrev [9] 0xdb:0x4e DW_TAG_subprogram
	.quad	Lfunc_begin1                    ; DW_AT_low_pc
.set Lset6, Lfunc_end1-Lfunc_begin1     ; DW_AT_high_pc
	.long	Lset6
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.long	264                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	20                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	6                               ; Abbrev [6] 0xf0:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	124
	.long	700                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	20                              ; DW_AT_decl_line
	.long	787                             ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0xfe:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	112
	.long	706                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	20                              ; DW_AT_decl_line
	.long	1208                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x10c:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	104
	.long	721                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	20                              ; DW_AT_decl_line
	.long	90                              ; DW_AT_type
	.byte	7                               ; Abbrev [7] 0x11a:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	96
	.long	725                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	24                              ; DW_AT_decl_line
	.long	1224                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	9                               ; Abbrev [9] 0x129:0x4e DW_TAG_subprogram
	.quad	Lfunc_begin2                    ; DW_AT_low_pc
.set Lset7, Lfunc_end2-Lfunc_begin2     ; DW_AT_high_pc
	.long	Lset7
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.long	276                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	11                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	6                               ; Abbrev [6] 0x13e:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	124
	.long	700                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	11                              ; DW_AT_decl_line
	.long	787                             ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x14c:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	112
	.long	706                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	11                              ; DW_AT_decl_line
	.long	1208                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x15a:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	104
	.long	721                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	11                              ; DW_AT_decl_line
	.long	90                              ; DW_AT_type
	.byte	7                               ; Abbrev [7] 0x168:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	96
	.long	725                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	15                              ; DW_AT_decl_line
	.long	1224                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	10                              ; Abbrev [10] 0x177:0x24 DW_TAG_subprogram
	.quad	Lfunc_begin3                    ; DW_AT_low_pc
.set Lset8, Lfunc_end3-Lfunc_begin3     ; DW_AT_high_pc
	.long	Lset8
                                        ; DW_AT_APPLE_omit_frame_ptr
	.byte	1                               ; DW_AT_frame_base
	.byte	111
	.long	288                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	29                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	6                               ; Abbrev [6] 0x18c:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	8
	.long	1128                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	29                              ; DW_AT_decl_line
	.long	91                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	9                               ; Abbrev [9] 0x19b:0x4e DW_TAG_subprogram
	.quad	Lfunc_begin4                    ; DW_AT_low_pc
.set Lset9, Lfunc_end4-Lfunc_begin4     ; DW_AT_high_pc
	.long	Lset9
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.long	304                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	84                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	6                               ; Abbrev [6] 0x1b0:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	120
	.long	685                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	84                              ; DW_AT_decl_line
	.long	90                              ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x1be:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	112
	.long	1128                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	84                              ; DW_AT_decl_line
	.long	91                              ; DW_AT_type
	.byte	7                               ; Abbrev [7] 0x1cc:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	104
	.long	1130                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	86                              ; DW_AT_decl_line
	.long	91                              ; DW_AT_type
	.byte	7                               ; Abbrev [7] 0x1da:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	96
	.long	1132                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	86                              ; DW_AT_decl_line
	.long	91                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	11                              ; Abbrev [11] 0x1e9:0x52 DW_TAG_subprogram
	.quad	Lfunc_begin5                    ; DW_AT_low_pc
.set Lset10, Lfunc_end5-Lfunc_begin5    ; DW_AT_high_pc
	.long	Lset10
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.long	314                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	95                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	91                              ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x202:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	127
	.long	1134                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	95                              ; DW_AT_decl_line
	.long	1694                            ; DW_AT_type
	.byte	7                               ; Abbrev [7] 0x210:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	112
	.long	1163                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	97                              ; DW_AT_decl_line
	.long	91                              ; DW_AT_type
	.byte	8                               ; Abbrev [8] 0x21e:0x1c DW_TAG_lexical_block
	.quad	Ltmp17                          ; DW_AT_low_pc
.set Lset11, Ltmp21-Ltmp17              ; DW_AT_high_pc
	.long	Lset11
	.byte	7                               ; Abbrev [7] 0x22b:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	108
	.long	698                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	98                              ; DW_AT_decl_line
	.long	787                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	12                              ; Abbrev [12] 0x23b:0x28 DW_TAG_subprogram
	.quad	Lfunc_begin6                    ; DW_AT_low_pc
.set Lset12, Lfunc_end6-Lfunc_begin6    ; DW_AT_high_pc
	.long	Lset12
                                        ; DW_AT_APPLE_omit_frame_ptr
	.byte	1                               ; DW_AT_frame_base
	.byte	111
	.long	328                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	36                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	91                              ; DW_AT_type
	.byte	7                               ; Abbrev [7] 0x254:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	8
	.long	1128                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	38                              ; DW_AT_decl_line
	.long	91                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	12                              ; Abbrev [12] 0x263:0x36 DW_TAG_subprogram
	.quad	Lfunc_begin7                    ; DW_AT_low_pc
.set Lset13, Lfunc_end7-Lfunc_begin7    ; DW_AT_high_pc
	.long	Lset13
                                        ; DW_AT_APPLE_omit_frame_ptr
	.byte	1                               ; DW_AT_frame_base
	.byte	111
	.long	343                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	45                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	794                             ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x27c:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	32
	.long	685                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	45                              ; DW_AT_decl_line
	.long	90                              ; DW_AT_type
	.byte	7                               ; Abbrev [7] 0x28a:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	24
	.long	1128                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	47                              ; DW_AT_decl_line
	.long	91                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	12                              ; Abbrev [12] 0x299:0x36 DW_TAG_subprogram
	.quad	Lfunc_begin8                    ; DW_AT_low_pc
.set Lset14, Lfunc_end8-Lfunc_begin8    ; DW_AT_high_pc
	.long	Lset14
                                        ; DW_AT_APPLE_omit_frame_ptr
	.byte	1                               ; DW_AT_frame_base
	.byte	111
	.long	352                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	60                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	794                             ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x2b2:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	32
	.long	685                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	60                              ; DW_AT_decl_line
	.long	90                              ; DW_AT_type
	.byte	7                               ; Abbrev [7] 0x2c0:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	24
	.long	1128                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	62                              ; DW_AT_decl_line
	.long	91                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	11                              ; Abbrev [11] 0x2cf:0x44 DW_TAG_subprogram
	.quad	Lfunc_begin9                    ; DW_AT_low_pc
.set Lset15, Lfunc_end9-Lfunc_begin9    ; DW_AT_high_pc
	.long	Lset15
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.long	362                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	75                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	794                             ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x2e8:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	112
	.long	685                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	75                              ; DW_AT_decl_line
	.long	90                              ; DW_AT_type
	.byte	7                               ; Abbrev [7] 0x2f6:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	24
	.long	1167                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	77                              ; DW_AT_decl_line
	.long	1712                            ; DW_AT_type
	.byte	7                               ; Abbrev [7] 0x304:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	16
	.long	1163                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	78                              ; DW_AT_decl_line
	.long	91                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	3                               ; Abbrev [3] 0x313:0x7 DW_TAG_base_type
	.long	371                             ; DW_AT_name
	.byte	5                               ; DW_AT_encoding
	.byte	4                               ; DW_AT_byte_size
	.byte	3                               ; Abbrev [3] 0x31a:0x7 DW_TAG_base_type
	.long	375                             ; DW_AT_name
	.byte	2                               ; DW_AT_encoding
	.byte	1                               ; DW_AT_byte_size
	.byte	13                              ; Abbrev [13] 0x321:0x5 DW_TAG_pointer_type
	.long	806                             ; DW_AT_type
	.byte	13                              ; Abbrev [13] 0x326:0x5 DW_TAG_pointer_type
	.long	811                             ; DW_AT_type
	.byte	3                               ; Abbrev [3] 0x32b:0x7 DW_TAG_base_type
	.long	391                             ; DW_AT_name
	.byte	6                               ; DW_AT_encoding
	.byte	1                               ; DW_AT_byte_size
	.byte	14                              ; Abbrev [14] 0x332:0x31 DW_TAG_structure_type
	.long	399                             ; DW_AT_name
	.byte	16                              ; DW_AT_byte_size
	.byte	6                               ; DW_AT_decl_file
	.short	286                             ; DW_AT_decl_line
	.byte	15                              ; Abbrev [15] 0x33b:0xd DW_TAG_member
	.long	409                             ; DW_AT_name
	.long	867                             ; DW_AT_type
	.byte	6                               ; DW_AT_decl_file
	.short	287                             ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	15                              ; Abbrev [15] 0x348:0xd DW_TAG_member
	.long	668                             ; DW_AT_name
	.long	50                              ; DW_AT_type
	.byte	6                               ; DW_AT_decl_file
	.short	288                             ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	15                              ; Abbrev [15] 0x355:0xd DW_TAG_member
	.long	676                             ; DW_AT_name
	.long	787                             ; DW_AT_type
	.byte	6                               ; DW_AT_decl_file
	.short	289                             ; DW_AT_decl_line
	.byte	12                              ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	16                              ; Abbrev [16] 0x363:0x24 DW_TAG_union_type
	.long	409                             ; DW_AT_name
	.byte	8                               ; DW_AT_byte_size
	.byte	6                               ; DW_AT_decl_file
	.short	269                             ; DW_AT_decl_line
	.byte	15                              ; Abbrev [15] 0x36c:0xd DW_TAG_member
	.long	423                             ; DW_AT_name
	.long	903                             ; DW_AT_type
	.byte	6                               ; DW_AT_decl_file
	.short	270                             ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	15                              ; Abbrev [15] 0x379:0xd DW_TAG_member
	.long	436                             ; DW_AT_name
	.long	915                             ; DW_AT_type
	.byte	6                               ; DW_AT_decl_file
	.short	271                             ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	13                              ; Abbrev [13] 0x387:0x5 DW_TAG_pointer_type
	.long	908                             ; DW_AT_type
	.byte	17                              ; Abbrev [17] 0x38c:0x7 DW_TAG_subroutine_type
                                        ; DW_AT_prototyped
	.byte	18                              ; Abbrev [18] 0x38d:0x5 DW_TAG_formal_parameter
	.long	787                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	13                              ; Abbrev [13] 0x393:0x5 DW_TAG_pointer_type
	.long	920                             ; DW_AT_type
	.byte	17                              ; Abbrev [17] 0x398:0x11 DW_TAG_subroutine_type
                                        ; DW_AT_prototyped
	.byte	18                              ; Abbrev [18] 0x399:0x5 DW_TAG_formal_parameter
	.long	787                             ; DW_AT_type
	.byte	18                              ; Abbrev [18] 0x39e:0x5 DW_TAG_formal_parameter
	.long	937                             ; DW_AT_type
	.byte	18                              ; Abbrev [18] 0x3a3:0x5 DW_TAG_formal_parameter
	.long	90                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	13                              ; Abbrev [13] 0x3a9:0x5 DW_TAG_pointer_type
	.long	942                             ; DW_AT_type
	.byte	19                              ; Abbrev [19] 0x3ae:0x81 DW_TAG_structure_type
	.long	451                             ; DW_AT_name
	.byte	104                             ; DW_AT_byte_size
	.byte	6                               ; DW_AT_decl_file
	.byte	177                             ; DW_AT_decl_line
	.byte	20                              ; Abbrev [20] 0x3b6:0xc DW_TAG_member
	.long	461                             ; DW_AT_name
	.long	787                             ; DW_AT_type
	.byte	6                               ; DW_AT_decl_file
	.byte	178                             ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	20                              ; Abbrev [20] 0x3c2:0xc DW_TAG_member
	.long	470                             ; DW_AT_name
	.long	787                             ; DW_AT_type
	.byte	6                               ; DW_AT_decl_file
	.byte	179                             ; DW_AT_decl_line
	.byte	4                               ; DW_AT_data_member_location
	.byte	20                              ; Abbrev [20] 0x3ce:0xc DW_TAG_member
	.long	479                             ; DW_AT_name
	.long	787                             ; DW_AT_type
	.byte	6                               ; DW_AT_decl_file
	.byte	180                             ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	20                              ; Abbrev [20] 0x3da:0xc DW_TAG_member
	.long	487                             ; DW_AT_name
	.long	1071                            ; DW_AT_type
	.byte	6                               ; DW_AT_decl_file
	.byte	181                             ; DW_AT_decl_line
	.byte	12                              ; DW_AT_data_member_location
	.byte	20                              ; Abbrev [20] 0x3e6:0xc DW_TAG_member
	.long	525                             ; DW_AT_name
	.long	1104                            ; DW_AT_type
	.byte	6                               ; DW_AT_decl_file
	.byte	182                             ; DW_AT_decl_line
	.byte	16                              ; DW_AT_data_member_location
	.byte	20                              ; Abbrev [20] 0x3f2:0xc DW_TAG_member
	.long	553                             ; DW_AT_name
	.long	787                             ; DW_AT_type
	.byte	6                               ; DW_AT_decl_file
	.byte	183                             ; DW_AT_decl_line
	.byte	20                              ; DW_AT_data_member_location
	.byte	20                              ; Abbrev [20] 0x3fe:0xc DW_TAG_member
	.long	563                             ; DW_AT_name
	.long	90                              ; DW_AT_type
	.byte	6                               ; DW_AT_decl_file
	.byte	184                             ; DW_AT_decl_line
	.byte	24                              ; DW_AT_data_member_location
	.byte	20                              ; Abbrev [20] 0x40a:0xc DW_TAG_member
	.long	571                             ; DW_AT_name
	.long	1126                            ; DW_AT_type
	.byte	6                               ; DW_AT_decl_file
	.byte	185                             ; DW_AT_decl_line
	.byte	32                              ; DW_AT_data_member_location
	.byte	20                              ; Abbrev [20] 0x416:0xc DW_TAG_member
	.long	607                             ; DW_AT_name
	.long	1159                            ; DW_AT_type
	.byte	6                               ; DW_AT_decl_file
	.byte	186                             ; DW_AT_decl_line
	.byte	40                              ; DW_AT_data_member_location
	.byte	20                              ; Abbrev [20] 0x422:0xc DW_TAG_member
	.long	624                             ; DW_AT_name
	.long	1166                            ; DW_AT_type
	.byte	6                               ; DW_AT_decl_file
	.byte	187                             ; DW_AT_decl_line
	.byte	48                              ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	2                               ; Abbrev [2] 0x42f:0xb DW_TAG_typedef
	.long	1082                            ; DW_AT_type
	.long	494                             ; DW_AT_name
	.byte	7                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	2                               ; Abbrev [2] 0x43a:0xb DW_TAG_typedef
	.long	1093                            ; DW_AT_type
	.long	500                             ; DW_AT_name
	.byte	2                               ; DW_AT_decl_file
	.byte	72                              ; DW_AT_decl_line
	.byte	2                               ; Abbrev [2] 0x445:0xb DW_TAG_typedef
	.long	787                             ; DW_AT_type
	.long	515                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	20                              ; DW_AT_decl_line
	.byte	2                               ; Abbrev [2] 0x450:0xb DW_TAG_typedef
	.long	1115                            ; DW_AT_type
	.long	532                             ; DW_AT_name
	.byte	8                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	2                               ; Abbrev [2] 0x45b:0xb DW_TAG_typedef
	.long	72                              ; DW_AT_type
	.long	538                             ; DW_AT_name
	.byte	2                               ; DW_AT_decl_file
	.byte	75                              ; DW_AT_decl_line
	.byte	21                              ; Abbrev [21] 0x466:0x21 DW_TAG_union_type
	.long	580                             ; DW_AT_name
	.byte	8                               ; DW_AT_byte_size
	.byte	6                               ; DW_AT_decl_file
	.byte	158                             ; DW_AT_decl_line
	.byte	20                              ; Abbrev [20] 0x46e:0xc DW_TAG_member
	.long	587                             ; DW_AT_name
	.long	787                             ; DW_AT_type
	.byte	6                               ; DW_AT_decl_file
	.byte	160                             ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	20                              ; Abbrev [20] 0x47a:0xc DW_TAG_member
	.long	597                             ; DW_AT_name
	.long	90                              ; DW_AT_type
	.byte	6                               ; DW_AT_decl_file
	.byte	161                             ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	3                               ; Abbrev [3] 0x487:0x7 DW_TAG_base_type
	.long	615                             ; DW_AT_name
	.byte	5                               ; DW_AT_encoding
	.byte	8                               ; DW_AT_byte_size
	.byte	22                              ; Abbrev [22] 0x48e:0xc DW_TAG_array_type
	.long	1178                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x493:0x6 DW_TAG_subrange_type
	.long	1185                            ; DW_AT_type
	.byte	7                               ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	3                               ; Abbrev [3] 0x49a:0x7 DW_TAG_base_type
	.long	630                             ; DW_AT_name
	.byte	7                               ; DW_AT_encoding
	.byte	8                               ; DW_AT_byte_size
	.byte	24                              ; Abbrev [24] 0x4a1:0x7 DW_TAG_base_type
	.long	648                             ; DW_AT_name
	.byte	8                               ; DW_AT_byte_size
	.byte	7                               ; DW_AT_encoding
	.byte	13                              ; Abbrev [13] 0x4a8:0x5 DW_TAG_pointer_type
	.long	1197                            ; DW_AT_type
	.byte	2                               ; Abbrev [2] 0x4ad:0xb DW_TAG_typedef
	.long	83                              ; DW_AT_type
	.long	689                             ; DW_AT_name
	.byte	9                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	13                              ; Abbrev [13] 0x4b8:0x5 DW_TAG_pointer_type
	.long	1213                            ; DW_AT_type
	.byte	2                               ; Abbrev [2] 0x4bd:0xb DW_TAG_typedef
	.long	942                             ; DW_AT_type
	.long	711                             ; DW_AT_name
	.byte	6                               ; DW_AT_decl_file
	.byte	188                             ; DW_AT_decl_line
	.byte	13                              ; Abbrev [13] 0x4c8:0x5 DW_TAG_pointer_type
	.long	1229                            ; DW_AT_type
	.byte	2                               ; Abbrev [2] 0x4cd:0xb DW_TAG_typedef
	.long	1240                            ; DW_AT_type
	.long	728                             ; DW_AT_name
	.byte	10                              ; DW_AT_decl_file
	.byte	57                              ; DW_AT_decl_line
	.byte	25                              ; Abbrev [25] 0x4d8:0x5e DW_TAG_structure_type
	.long	739                             ; DW_AT_name
	.short	880                             ; DW_AT_byte_size
	.byte	10                              ; DW_AT_decl_file
	.byte	43                              ; DW_AT_decl_line
	.byte	20                              ; Abbrev [20] 0x4e1:0xc DW_TAG_member
	.long	757                             ; DW_AT_name
	.long	787                             ; DW_AT_type
	.byte	10                              ; DW_AT_decl_file
	.byte	45                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	20                              ; Abbrev [20] 0x4ed:0xc DW_TAG_member
	.long	768                             ; DW_AT_name
	.long	61                              ; DW_AT_type
	.byte	10                              ; DW_AT_decl_file
	.byte	46                              ; DW_AT_decl_line
	.byte	4                               ; DW_AT_data_member_location
	.byte	20                              ; Abbrev [20] 0x4f9:0xc DW_TAG_member
	.long	779                             ; DW_AT_name
	.long	1334                            ; DW_AT_type
	.byte	10                              ; DW_AT_decl_file
	.byte	47                              ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	20                              ; Abbrev [20] 0x505:0xc DW_TAG_member
	.long	848                             ; DW_AT_name
	.long	1390                            ; DW_AT_type
	.byte	10                              ; DW_AT_decl_file
	.byte	48                              ; DW_AT_decl_line
	.byte	32                              ; DW_AT_data_member_location
	.byte	20                              ; Abbrev [20] 0x511:0xc DW_TAG_member
	.long	856                             ; DW_AT_name
	.long	1379                            ; DW_AT_type
	.byte	10                              ; DW_AT_decl_file
	.byte	49                              ; DW_AT_decl_line
	.byte	40                              ; DW_AT_data_member_location
	.byte	20                              ; Abbrev [20] 0x51d:0xc DW_TAG_member
	.long	866                             ; DW_AT_name
	.long	1395                            ; DW_AT_type
	.byte	10                              ; DW_AT_decl_file
	.byte	50                              ; DW_AT_decl_line
	.byte	48                              ; DW_AT_data_member_location
	.byte	20                              ; Abbrev [20] 0x529:0xc DW_TAG_member
	.long	1112                            ; DW_AT_name
	.long	1400                            ; DW_AT_type
	.byte	10                              ; DW_AT_decl_file
	.byte	52                              ; DW_AT_decl_line
	.byte	64                              ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	19                              ; Abbrev [19] 0x536:0x2d DW_TAG_structure_type
	.long	788                             ; DW_AT_name
	.byte	24                              ; DW_AT_byte_size
	.byte	11                              ; DW_AT_decl_file
	.byte	42                              ; DW_AT_decl_line
	.byte	20                              ; Abbrev [20] 0x53e:0xc DW_TAG_member
	.long	809                             ; DW_AT_name
	.long	90                              ; DW_AT_type
	.byte	11                              ; DW_AT_decl_file
	.byte	44                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	20                              ; Abbrev [20] 0x54a:0xc DW_TAG_member
	.long	815                             ; DW_AT_name
	.long	1379                            ; DW_AT_type
	.byte	11                              ; DW_AT_decl_file
	.byte	45                              ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	20                              ; Abbrev [20] 0x556:0xc DW_TAG_member
	.long	839                             ; DW_AT_name
	.long	787                             ; DW_AT_type
	.byte	11                              ; DW_AT_decl_file
	.byte	46                              ; DW_AT_decl_line
	.byte	16                              ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	2                               ; Abbrev [2] 0x563:0xb DW_TAG_typedef
	.long	1178                            ; DW_AT_type
	.long	823                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	68                              ; DW_AT_decl_line
	.byte	13                              ; Abbrev [13] 0x56e:0x5 DW_TAG_pointer_type
	.long	1240                            ; DW_AT_type
	.byte	13                              ; Abbrev [13] 0x573:0x5 DW_TAG_pointer_type
	.long	1400                            ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0x578:0x2f DW_TAG_structure_type
	.long	878                             ; DW_AT_name
	.short	816                             ; DW_AT_byte_size
	.byte	13                              ; DW_AT_decl_file
	.byte	62                              ; DW_AT_decl_line
	.byte	20                              ; Abbrev [20] 0x581:0xc DW_TAG_member
	.long	898                             ; DW_AT_name
	.long	1447                            ; DW_AT_type
	.byte	13                              ; DW_AT_decl_file
	.byte	64                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	20                              ; Abbrev [20] 0x58d:0xc DW_TAG_member
	.long	969                             ; DW_AT_name
	.long	1503                            ; DW_AT_type
	.byte	13                              ; DW_AT_decl_file
	.byte	65                              ; DW_AT_decl_line
	.byte	16                              ; DW_AT_data_member_location
	.byte	26                              ; Abbrev [26] 0x599:0xd DW_TAG_member
	.long	1033                            ; DW_AT_name
	.long	1612                            ; DW_AT_type
	.byte	13                              ; DW_AT_decl_file
	.byte	66                              ; DW_AT_decl_line
	.short	288                             ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	19                              ; Abbrev [19] 0x5a7:0x2d DW_TAG_structure_type
	.long	903                             ; DW_AT_name
	.byte	16                              ; DW_AT_byte_size
	.byte	12                              ; DW_AT_decl_file
	.byte	57                              ; DW_AT_decl_line
	.byte	20                              ; Abbrev [20] 0x5af:0xc DW_TAG_member
	.long	934                             ; DW_AT_name
	.long	1492                            ; DW_AT_type
	.byte	12                              ; DW_AT_decl_file
	.byte	59                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	20                              ; Abbrev [20] 0x5bb:0xc DW_TAG_member
	.long	951                             ; DW_AT_name
	.long	72                              ; DW_AT_type
	.byte	12                              ; DW_AT_decl_file
	.byte	60                              ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	20                              ; Abbrev [20] 0x5c7:0xc DW_TAG_member
	.long	957                             ; DW_AT_name
	.long	72                              ; DW_AT_type
	.byte	12                              ; DW_AT_decl_file
	.byte	61                              ; DW_AT_decl_line
	.byte	12                              ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	2                               ; Abbrev [2] 0x5d4:0xb DW_TAG_typedef
	.long	102                             ; DW_AT_type
	.long	940                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	23                              ; DW_AT_decl_line
	.byte	25                              ; Abbrev [25] 0x5df:0x61 DW_TAG_structure_type
	.long	974                             ; DW_AT_name
	.short	272                             ; DW_AT_byte_size
	.byte	12                              ; DW_AT_decl_file
	.byte	134                             ; DW_AT_decl_line
	.byte	20                              ; Abbrev [20] 0x5e8:0xc DW_TAG_member
	.long	1002                            ; DW_AT_name
	.long	1600                            ; DW_AT_type
	.byte	12                              ; DW_AT_decl_file
	.byte	136                             ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	20                              ; Abbrev [20] 0x5f4:0xc DW_TAG_member
	.long	1006                            ; DW_AT_name
	.long	1492                            ; DW_AT_type
	.byte	12                              ; DW_AT_decl_file
	.byte	137                             ; DW_AT_decl_line
	.byte	232                             ; DW_AT_data_member_location
	.byte	20                              ; Abbrev [20] 0x600:0xc DW_TAG_member
	.long	1011                            ; DW_AT_name
	.long	1492                            ; DW_AT_type
	.byte	12                              ; DW_AT_decl_file
	.byte	138                             ; DW_AT_decl_line
	.byte	240                             ; DW_AT_data_member_location
	.byte	20                              ; Abbrev [20] 0x60c:0xc DW_TAG_member
	.long	1016                            ; DW_AT_name
	.long	1492                            ; DW_AT_type
	.byte	12                              ; DW_AT_decl_file
	.byte	139                             ; DW_AT_decl_line
	.byte	248                             ; DW_AT_data_member_location
	.byte	26                              ; Abbrev [26] 0x618:0xd DW_TAG_member
	.long	1021                            ; DW_AT_name
	.long	1492                            ; DW_AT_type
	.byte	12                              ; DW_AT_decl_file
	.byte	140                             ; DW_AT_decl_line
	.short	256                             ; DW_AT_data_member_location
	.byte	26                              ; Abbrev [26] 0x625:0xd DW_TAG_member
	.long	1026                            ; DW_AT_name
	.long	72                              ; DW_AT_type
	.byte	12                              ; DW_AT_decl_file
	.byte	141                             ; DW_AT_decl_line
	.short	264                             ; DW_AT_data_member_location
	.byte	26                              ; Abbrev [26] 0x632:0xd DW_TAG_member
	.long	624                             ; DW_AT_name
	.long	72                              ; DW_AT_type
	.byte	12                              ; DW_AT_decl_file
	.byte	142                             ; DW_AT_decl_line
	.short	268                             ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	22                              ; Abbrev [22] 0x640:0xc DW_TAG_array_type
	.long	1492                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x645:0x6 DW_TAG_subrange_type
	.long	1185                            ; DW_AT_type
	.byte	29                              ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	27                              ; Abbrev [27] 0x64c:0x34 DW_TAG_structure_type
	.long	1038                            ; DW_AT_name
	.short	528                             ; DW_AT_byte_size
	.byte	12                              ; DW_AT_decl_file
	.short	441                             ; DW_AT_decl_line
	.byte	15                              ; Abbrev [15] 0x656:0xd DW_TAG_member
	.long	1064                            ; DW_AT_name
	.long	1664                            ; DW_AT_type
	.byte	12                              ; DW_AT_decl_file
	.short	443                             ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	28                              ; Abbrev [28] 0x663:0xe DW_TAG_member
	.long	1098                            ; DW_AT_name
	.long	72                              ; DW_AT_type
	.byte	12                              ; DW_AT_decl_file
	.short	444                             ; DW_AT_decl_line
	.short	512                             ; DW_AT_data_member_location
	.byte	28                              ; Abbrev [28] 0x671:0xe DW_TAG_member
	.long	1105                            ; DW_AT_name
	.long	72                              ; DW_AT_type
	.byte	12                              ; DW_AT_decl_file
	.short	445                             ; DW_AT_decl_line
	.short	516                             ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	22                              ; Abbrev [22] 0x680:0xc DW_TAG_array_type
	.long	1676                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x685:0x6 DW_TAG_subrange_type
	.long	1185                            ; DW_AT_type
	.byte	32                              ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	2                               ; Abbrev [2] 0x68c:0xb DW_TAG_typedef
	.long	1687                            ; DW_AT_type
	.long	1068                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	24                              ; DW_AT_decl_line
	.byte	3                               ; Abbrev [3] 0x697:0x7 DW_TAG_base_type
	.long	1080                            ; DW_AT_name
	.byte	7                               ; DW_AT_encoding
	.byte	16                              ; DW_AT_byte_size
	.byte	2                               ; Abbrev [2] 0x69e:0xb DW_TAG_typedef
	.long	1705                            ; DW_AT_type
	.long	1141                            ; DW_AT_name
	.byte	14                              ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	3                               ; Abbrev [3] 0x6a9:0x7 DW_TAG_base_type
	.long	1149                            ; DW_AT_name
	.byte	8                               ; DW_AT_encoding
	.byte	1                               ; DW_AT_byte_size
	.byte	13                              ; Abbrev [13] 0x6b0:0x5 DW_TAG_pointer_type
	.long	1717                            ; DW_AT_type
	.byte	29                              ; Abbrev [29] 0x6b5:0xb DW_TAG_subroutine_type
	.long	91                              ; DW_AT_type
                                        ; DW_AT_prototyped
	.byte	18                              ; Abbrev [18] 0x6ba:0x5 DW_TAG_formal_parameter
	.long	91                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"Apple clang version 12.0.5 (clang-1205.0.22.9)" ; string offset=0
	.asciz	"sprr.c"                        ; string offset=47
	.asciz	"/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk" ; string offset=54
	.asciz	"MacOSX.sdk"                    ; string offset=149
	.asciz	"/Users/xss/code"               ; string offset=160
	.asciz	"sigset_t"                      ; string offset=176
	.asciz	"__darwin_sigset_t"             ; string offset=185
	.asciz	"__uint32_t"                    ; string offset=203
	.asciz	"unsigned int"                  ; string offset=214
	.asciz	"uint64_t"                      ; string offset=227
	.asciz	"long long unsigned int"        ; string offset=236
	.asciz	"main"                          ; string offset=259
	.asciz	"bus_handler"                   ; string offset=264
	.asciz	"sev_handler"                   ; string offset=276
	.asciz	"write_sprr_perm"               ; string offset=288
	.asciz	"sprr_test"                     ; string offset=304
	.asciz	"make_sprr_val"                 ; string offset=314
	.asciz	"read_sprr_perm"                ; string offset=328
	.asciz	"can_read"                      ; string offset=343
	.asciz	"can_write"                     ; string offset=352
	.asciz	"can_exec"                      ; string offset=362
	.asciz	"int"                           ; string offset=371
	.asciz	"_Bool"                         ; string offset=375
	.asciz	"argc"                          ; string offset=381
	.asciz	"argv"                          ; string offset=386
	.asciz	"char"                          ; string offset=391
	.asciz	"sa"                            ; string offset=396
	.asciz	"sigaction"                     ; string offset=399
	.asciz	"__sigaction_u"                 ; string offset=409
	.asciz	"__sa_handler"                  ; string offset=423
	.asciz	"__sa_sigaction"                ; string offset=436
	.asciz	"__siginfo"                     ; string offset=451
	.asciz	"si_signo"                      ; string offset=461
	.asciz	"si_errno"                      ; string offset=470
	.asciz	"si_code"                       ; string offset=479
	.asciz	"si_pid"                        ; string offset=487
	.asciz	"pid_t"                         ; string offset=494
	.asciz	"__darwin_pid_t"                ; string offset=500
	.asciz	"__int32_t"                     ; string offset=515
	.asciz	"si_uid"                        ; string offset=525
	.asciz	"uid_t"                         ; string offset=532
	.asciz	"__darwin_uid_t"                ; string offset=538
	.asciz	"si_status"                     ; string offset=553
	.asciz	"si_addr"                       ; string offset=563
	.asciz	"si_value"                      ; string offset=571
	.asciz	"sigval"                        ; string offset=580
	.asciz	"sival_int"                     ; string offset=587
	.asciz	"sival_ptr"                     ; string offset=597
	.asciz	"si_band"                       ; string offset=607
	.asciz	"long int"                      ; string offset=615
	.asciz	"__pad"                         ; string offset=624
	.asciz	"long unsigned int"             ; string offset=630
	.asciz	"__ARRAY_SIZE_TYPE__"           ; string offset=648
	.asciz	"sa_mask"                       ; string offset=668
	.asciz	"sa_flags"                      ; string offset=676
	.asciz	"ptr"                           ; string offset=685
	.asciz	"uint32_t"                      ; string offset=689
	.asciz	"i"                             ; string offset=698
	.asciz	"signo"                         ; string offset=700
	.asciz	"info"                          ; string offset=706
	.asciz	"siginfo_t"                     ; string offset=711
	.asciz	"cx_"                           ; string offset=721
	.asciz	"cx"                            ; string offset=725
	.asciz	"ucontext_t"                    ; string offset=728
	.asciz	"__darwin_ucontext"             ; string offset=739
	.asciz	"uc_onstack"                    ; string offset=757
	.asciz	"uc_sigmask"                    ; string offset=768
	.asciz	"uc_stack"                      ; string offset=779
	.asciz	"__darwin_sigaltstack"          ; string offset=788
	.asciz	"ss_sp"                         ; string offset=809
	.asciz	"ss_size"                       ; string offset=815
	.asciz	"__darwin_size_t"               ; string offset=823
	.asciz	"ss_flags"                      ; string offset=839
	.asciz	"uc_link"                       ; string offset=848
	.asciz	"uc_mcsize"                     ; string offset=856
	.asciz	"uc_mcontext"                   ; string offset=866
	.asciz	"__darwin_mcontext64"           ; string offset=878
	.asciz	"__es"                          ; string offset=898
	.asciz	"__darwin_arm_exception_state64" ; string offset=903
	.asciz	"__far"                         ; string offset=934
	.asciz	"__uint64_t"                    ; string offset=940
	.asciz	"__esr"                         ; string offset=951
	.asciz	"__exception"                   ; string offset=957
	.asciz	"__ss"                          ; string offset=969
	.asciz	"__darwin_arm_thread_state64"   ; string offset=974
	.asciz	"__x"                           ; string offset=1002
	.asciz	"__fp"                          ; string offset=1006
	.asciz	"__lr"                          ; string offset=1011
	.asciz	"__sp"                          ; string offset=1016
	.asciz	"__pc"                          ; string offset=1021
	.asciz	"__cpsr"                        ; string offset=1026
	.asciz	"__ns"                          ; string offset=1033
	.asciz	"__darwin_arm_neon_state64"     ; string offset=1038
	.asciz	"__v"                           ; string offset=1064
	.asciz	"__uint128_t"                   ; string offset=1068
	.asciz	"unsigned __int128"             ; string offset=1080
	.asciz	"__fpsr"                        ; string offset=1098
	.asciz	"__fpcr"                        ; string offset=1105
	.asciz	"__mcontext_data"               ; string offset=1112
	.asciz	"v"                             ; string offset=1128
	.asciz	"a"                             ; string offset=1130
	.asciz	"b"                             ; string offset=1132
	.asciz	"nibble"                        ; string offset=1134
	.asciz	"uint8_t"                       ; string offset=1141
	.asciz	"unsigned char"                 ; string offset=1149
	.asciz	"res"                           ; string offset=1163
	.asciz	"fun_ptr"                       ; string offset=1167
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
.set Lset16, LNames4-Lnames_begin       ; Offset in Bucket 0
	.long	Lset16
.set Lset17, LNames5-Lnames_begin       ; Offset in Bucket 0
	.long	Lset17
.set Lset18, LNames6-Lnames_begin       ; Offset in Bucket 1
	.long	Lset18
.set Lset19, LNames9-Lnames_begin       ; Offset in Bucket 2
	.long	Lset19
.set Lset20, LNames0-Lnames_begin       ; Offset in Bucket 3
	.long	Lset20
.set Lset21, LNames3-Lnames_begin       ; Offset in Bucket 3
	.long	Lset21
.set Lset22, LNames2-Lnames_begin       ; Offset in Bucket 6
	.long	Lset22
.set Lset23, LNames8-Lnames_begin       ; Offset in Bucket 7
	.long	Lset23
.set Lset24, LNames1-Lnames_begin       ; Offset in Bucket 7
	.long	Lset24
.set Lset25, LNames7-Lnames_begin       ; Offset in Bucket 8
	.long	Lset25
LNames4:
	.long	264                             ; bus_handler
	.long	1                               ; Num DIEs
	.long	219
	.long	0
LNames5:
	.long	328                             ; read_sprr_perm
	.long	1                               ; Num DIEs
	.long	571
	.long	0
LNames6:
	.long	314                             ; make_sprr_val
	.long	1                               ; Num DIEs
	.long	489
	.long	0
LNames9:
	.long	343                             ; can_read
	.long	1                               ; Num DIEs
	.long	611
	.long	0
LNames0:
	.long	362                             ; can_exec
	.long	1                               ; Num DIEs
	.long	719
	.long	0
LNames3:
	.long	304                             ; sprr_test
	.long	1                               ; Num DIEs
	.long	411
	.long	0
LNames2:
	.long	259                             ; main
	.long	1                               ; Num DIEs
	.long	109
	.long	0
LNames8:
	.long	352                             ; can_write
	.long	1                               ; Num DIEs
	.long	665
	.long	0
LNames1:
	.long	288                             ; write_sprr_perm
	.long	1                               ; Num DIEs
	.long	375
	.long	0
LNames7:
	.long	276                             ; sev_handler
	.long	1                               ; Num DIEs
	.long	297
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
	.long	36                              ; Header Hash Count
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
	.long	20                              ; Bucket 10
	.long	22                              ; Bucket 11
	.long	26                              ; Bucket 12
	.long	27                              ; Bucket 13
	.long	29                              ; Bucket 14
	.long	30                              ; Bucket 15
	.long	31                              ; Bucket 16
	.long	33                              ; Bucket 17
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
.set Lset26, Ltypes1-Ltypes_begin       ; Offset in Bucket 0
	.long	Lset26
.set Lset27, Ltypes25-Ltypes_begin      ; Offset in Bucket 0
	.long	Lset27
.set Lset28, Ltypes16-Ltypes_begin      ; Offset in Bucket 0
	.long	Lset28
.set Lset29, Ltypes24-Ltypes_begin      ; Offset in Bucket 1
	.long	Lset29
.set Lset30, Ltypes19-Ltypes_begin      ; Offset in Bucket 1
	.long	Lset30
.set Lset31, Ltypes3-Ltypes_begin       ; Offset in Bucket 2
	.long	Lset31
.set Lset32, Ltypes4-Ltypes_begin       ; Offset in Bucket 2
	.long	Lset32
.set Lset33, Ltypes17-Ltypes_begin      ; Offset in Bucket 2
	.long	Lset33
.set Lset34, Ltypes35-Ltypes_begin      ; Offset in Bucket 3
	.long	Lset34
.set Lset35, Ltypes22-Ltypes_begin      ; Offset in Bucket 3
	.long	Lset35
.set Lset36, Ltypes11-Ltypes_begin      ; Offset in Bucket 4
	.long	Lset36
.set Lset37, Ltypes2-Ltypes_begin       ; Offset in Bucket 5
	.long	Lset37
.set Lset38, Ltypes30-Ltypes_begin      ; Offset in Bucket 5
	.long	Lset38
.set Lset39, Ltypes31-Ltypes_begin      ; Offset in Bucket 6
	.long	Lset39
.set Lset40, Ltypes28-Ltypes_begin      ; Offset in Bucket 6
	.long	Lset40
.set Lset41, Ltypes21-Ltypes_begin      ; Offset in Bucket 7
	.long	Lset41
.set Lset42, Ltypes9-Ltypes_begin       ; Offset in Bucket 7
	.long	Lset42
.set Lset43, Ltypes10-Ltypes_begin      ; Offset in Bucket 7
	.long	Lset43
.set Lset44, Ltypes33-Ltypes_begin      ; Offset in Bucket 8
	.long	Lset44
.set Lset45, Ltypes0-Ltypes_begin       ; Offset in Bucket 8
	.long	Lset45
.set Lset46, Ltypes6-Ltypes_begin       ; Offset in Bucket 10
	.long	Lset46
.set Lset47, Ltypes27-Ltypes_begin      ; Offset in Bucket 10
	.long	Lset47
.set Lset48, Ltypes23-Ltypes_begin      ; Offset in Bucket 11
	.long	Lset48
.set Lset49, Ltypes29-Ltypes_begin      ; Offset in Bucket 11
	.long	Lset49
.set Lset50, Ltypes15-Ltypes_begin      ; Offset in Bucket 11
	.long	Lset50
.set Lset51, Ltypes14-Ltypes_begin      ; Offset in Bucket 11
	.long	Lset51
.set Lset52, Ltypes20-Ltypes_begin      ; Offset in Bucket 12
	.long	Lset52
.set Lset53, Ltypes8-Ltypes_begin       ; Offset in Bucket 13
	.long	Lset53
.set Lset54, Ltypes26-Ltypes_begin      ; Offset in Bucket 13
	.long	Lset54
.set Lset55, Ltypes34-Ltypes_begin      ; Offset in Bucket 14
	.long	Lset55
.set Lset56, Ltypes7-Ltypes_begin       ; Offset in Bucket 15
	.long	Lset56
.set Lset57, Ltypes5-Ltypes_begin       ; Offset in Bucket 16
	.long	Lset57
.set Lset58, Ltypes12-Ltypes_begin      ; Offset in Bucket 16
	.long	Lset58
.set Lset59, Ltypes13-Ltypes_begin      ; Offset in Bucket 17
	.long	Lset59
.set Lset60, Ltypes32-Ltypes_begin      ; Offset in Bucket 17
	.long	Lset60
.set Lset61, Ltypes18-Ltypes_begin      ; Offset in Bucket 17
	.long	Lset61
Ltypes1:
	.long	974                             ; __darwin_arm_thread_state64
	.long	1                               ; Num DIEs
	.long	1503
	.short	19
	.byte	0
	.long	0
Ltypes25:
	.long	515                             ; __int32_t
	.long	1                               ; Num DIEs
	.long	1093
	.short	22
	.byte	0
	.long	0
Ltypes16:
	.long	615                             ; long int
	.long	1                               ; Num DIEs
	.long	1159
	.short	36
	.byte	0
	.long	0
Ltypes24:
	.long	580                             ; sigval
	.long	1                               ; Num DIEs
	.long	1126
	.short	23
	.byte	0
	.long	0
Ltypes19:
	.long	878                             ; __darwin_mcontext64
	.long	1                               ; Num DIEs
	.long	1400
	.short	19
	.byte	0
	.long	0
Ltypes3:
	.long	371                             ; int
	.long	1                               ; Num DIEs
	.long	787
	.short	36
	.byte	0
	.long	0
Ltypes4:
	.long	375                             ; _Bool
	.long	1                               ; Num DIEs
	.long	794
	.short	36
	.byte	0
	.long	0
Ltypes17:
	.long	940                             ; __uint64_t
	.long	1                               ; Num DIEs
	.long	1492
	.short	22
	.byte	0
	.long	0
Ltypes35:
	.long	788                             ; __darwin_sigaltstack
	.long	1                               ; Num DIEs
	.long	1334
	.short	19
	.byte	0
	.long	0
Ltypes22:
	.long	711                             ; siginfo_t
	.long	1                               ; Num DIEs
	.long	1213
	.short	22
	.byte	0
	.long	0
Ltypes11:
	.long	532                             ; uid_t
	.long	1                               ; Num DIEs
	.long	1104
	.short	22
	.byte	0
	.long	0
Ltypes2:
	.long	214                             ; unsigned int
	.long	1                               ; Num DIEs
	.long	83
	.short	36
	.byte	0
	.long	0
Ltypes30:
	.long	648                             ; __ARRAY_SIZE_TYPE__
	.long	1                               ; Num DIEs
	.long	1185
	.short	36
	.byte	0
	.long	0
Ltypes31:
	.long	1038                            ; __darwin_arm_neon_state64
	.long	1                               ; Num DIEs
	.long	1612
	.short	19
	.byte	0
	.long	0
Ltypes28:
	.long	409                             ; __sigaction_u
	.long	1                               ; Num DIEs
	.long	867
	.short	23
	.byte	0
	.long	0
Ltypes21:
	.long	176                             ; sigset_t
	.long	1                               ; Num DIEs
	.long	50
	.short	22
	.byte	0
	.long	0
Ltypes9:
	.long	823                             ; __darwin_size_t
	.long	1                               ; Num DIEs
	.long	1379
	.short	22
	.byte	0
	.long	0
Ltypes10:
	.long	500                             ; __darwin_pid_t
	.long	1                               ; Num DIEs
	.long	1082
	.short	22
	.byte	0
	.long	0
Ltypes33:
	.long	227                             ; uint64_t
	.long	1                               ; Num DIEs
	.long	91
	.short	22
	.byte	0
	.long	0
Ltypes0:
	.long	1080                            ; unsigned __int128
	.long	1                               ; Num DIEs
	.long	1687
	.short	36
	.byte	0
	.long	0
Ltypes6:
	.long	1141                            ; uint8_t
	.long	1                               ; Num DIEs
	.long	1694
	.short	22
	.byte	0
	.long	0
Ltypes27:
	.long	728                             ; ucontext_t
	.long	1                               ; Num DIEs
	.long	1229
	.short	22
	.byte	0
	.long	0
Ltypes23:
	.long	185                             ; __darwin_sigset_t
	.long	1                               ; Num DIEs
	.long	61
	.short	22
	.byte	0
	.long	0
Ltypes29:
	.long	203                             ; __uint32_t
	.long	1                               ; Num DIEs
	.long	72
	.short	22
	.byte	0
	.long	0
Ltypes15:
	.long	903                             ; __darwin_arm_exception_state64
	.long	1                               ; Num DIEs
	.long	1447
	.short	19
	.byte	0
	.long	0
Ltypes14:
	.long	630                             ; long unsigned int
	.long	1                               ; Num DIEs
	.long	1178
	.short	36
	.byte	0
	.long	0
Ltypes20:
	.long	399                             ; sigaction
	.long	1                               ; Num DIEs
	.long	818
	.short	19
	.byte	0
	.long	0
Ltypes8:
	.long	494                             ; pid_t
	.long	1                               ; Num DIEs
	.long	1071
	.short	22
	.byte	0
	.long	0
Ltypes26:
	.long	236                             ; long long unsigned int
	.long	1                               ; Num DIEs
	.long	102
	.short	36
	.byte	0
	.long	0
Ltypes34:
	.long	1149                            ; unsigned char
	.long	1                               ; Num DIEs
	.long	1705
	.short	36
	.byte	0
	.long	0
Ltypes7:
	.long	1068                            ; __uint128_t
	.long	1                               ; Num DIEs
	.long	1676
	.short	22
	.byte	0
	.long	0
Ltypes5:
	.long	451                             ; __siginfo
	.long	1                               ; Num DIEs
	.long	942
	.short	19
	.byte	0
	.long	0
Ltypes12:
	.long	538                             ; __darwin_uid_t
	.long	1                               ; Num DIEs
	.long	1115
	.short	22
	.byte	0
	.long	0
Ltypes13:
	.long	689                             ; uint32_t
	.long	1                               ; Num DIEs
	.long	1197
	.short	22
	.byte	0
	.long	0
Ltypes32:
	.long	739                             ; __darwin_ucontext
	.long	1                               ; Num DIEs
	.long	1240
	.short	19
	.byte	0
	.long	0
Ltypes18:
	.long	391                             ; char
	.long	1                               ; Num DIEs
	.long	811
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
