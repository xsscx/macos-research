	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	__Z11LoadLibraryPKc             ; -- Begin function _Z11LoadLibraryPKc
	.p2align	2
__Z11LoadLibraryPKc:                    ; @_Z11LoadLibraryPKc
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #96
	.cfi_def_cfa_offset 96
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-16]
	ldur	x0, [x29, #-16]
	mov	w1, #1
	bl	_dlopen
	add	x3, sp, #40
	mov	w8, #5
	str	w8, [sp, #40]
	adrp	x8, _mach_task_self_@GOTPAGE
	ldr	x8, [x8, _mach_task_self_@GOTPAGEOFF]
	ldr	w0, [x8]
	mov	w1, #17
	sub	x2, x29, #36
	bl	_task_info
	str	w0, [sp, #36]
	ldr	w8, [sp, #36]
	subs	w8, w8, #0
	cset	w8, eq
	tbnz	w8, #0, LBB0_2
	b	LBB0_1
LBB0_1:
	ldr	w9, [sp, #36]
                                        ; implicit-def: $x8
	mov	x8, x9
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str@PAGE
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
                                        ; kill: def $x8 killed $xzr
	stur	xzr, [x29, #-8]
	b	LBB0_9
LBB0_2:
	ldur	x8, [x29, #-36]
	str	x8, [sp, #24]
	ldr	x8, [sp, #24]
	ldr	x8, [x8, #8]
	str	x8, [sp, #16]
	str	wzr, [sp, #12]
	b	LBB0_3
LBB0_3:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #12]
	ldr	x9, [sp, #24]
	ldr	w9, [x9, #4]
	subs	w8, w8, w9
	cset	w8, hs
	tbnz	w8, #0, LBB0_8
	b	LBB0_4
LBB0_4:                                 ;   in Loop: Header=BB0_3 Depth=1
	ldr	x8, [sp, #16]
	ldr	w9, [sp, #12]
                                        ; kill: def $x9 killed $w9
	mov	x10, #24
	mul	x9, x9, x10
	add	x8, x8, x9
	ldr	x0, [x8, #8]
	ldur	x1, [x29, #-16]
	bl	_strcmp
	subs	w8, w0, #0
	cset	w8, ne
	tbnz	w8, #0, LBB0_6
	b	LBB0_5
LBB0_5:
	ldr	x8, [sp, #16]
	ldr	w9, [sp, #12]
                                        ; kill: def $x9 killed $w9
	mov	x10, #24
	mul	x9, x9, x10
	ldr	x8, [x8, x9]
	stur	x8, [x29, #-8]
	b	LBB0_9
LBB0_6:                                 ;   in Loop: Header=BB0_3 Depth=1
	b	LBB0_7
LBB0_7:                                 ;   in Loop: Header=BB0_3 Depth=1
	ldr	w8, [sp, #12]
	add	w8, w8, #1
	str	w8, [sp, #12]
	b	LBB0_3
LBB0_8:
                                        ; kill: def $x8 killed $xzr
	stur	xzr, [x29, #-8]
	b	LBB0_9
LBB0_9:
	ldur	x0, [x29, #-8]
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	add	sp, sp, #96
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__Z14GetLoadCommandP14mach_header_64PvjPKc ; -- Begin function _Z14GetLoadCommandP14mach_header_64PvjPKc
	.p2align	2
__Z14GetLoadCommandP14mach_header_64PvjPKc: ; @_Z14GetLoadCommandP14mach_header_64PvjPKc
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80
	.cfi_def_cfa_offset 80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-16]
	stur	x1, [x29, #-24]
	stur	w2, [x29, #-28]
	str	x3, [sp, #24]
	ldur	x8, [x29, #-24]
	str	x8, [sp, #16]
	str	wzr, [sp, #12]
	b	LBB1_1
LBB1_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #12]
	ldur	x9, [x29, #-16]
	ldr	w9, [x9, #16]
	subs	w8, w8, w9
	cset	w8, hs
	tbnz	w8, #0, LBB1_9
	b	LBB1_2
LBB1_2:                                 ;   in Loop: Header=BB1_1 Depth=1
	ldr	x8, [sp, #16]
	str	x8, [sp]
	ldr	x8, [sp]
	ldr	w8, [x8]
	ldur	w9, [x29, #-28]
	subs	w8, w8, w9
	cset	w8, ne
	tbnz	w8, #0, LBB1_7
	b	LBB1_3
LBB1_3:                                 ;   in Loop: Header=BB1_1 Depth=1
	ldur	w8, [x29, #-28]
	subs	w8, w8, #25
	cset	w8, ne
	tbnz	w8, #0, LBB1_5
	b	LBB1_4
LBB1_4:                                 ;   in Loop: Header=BB1_1 Depth=1
	ldr	x8, [sp]
	add	x0, x8, #8
	ldr	x1, [sp, #24]
	bl	_strcmp
	subs	w8, w0, #0
	cset	w8, ne
	tbnz	w8, #0, LBB1_6
	b	LBB1_5
LBB1_5:
	ldr	x8, [sp]
	stur	x8, [x29, #-8]
	b	LBB1_10
LBB1_6:                                 ;   in Loop: Header=BB1_1 Depth=1
	b	LBB1_7
LBB1_7:                                 ;   in Loop: Header=BB1_1 Depth=1
	ldr	x8, [sp]
	ldr	w8, [x8, #4]
	mov	x9, x8
	ldr	x8, [sp, #16]
	add	x8, x8, x9
	str	x8, [sp, #16]
	b	LBB1_8
LBB1_8:                                 ;   in Loop: Header=BB1_1 Depth=1
	ldr	w8, [sp, #12]
	add	w8, w8, #1
	str	w8, [sp, #12]
	b	LBB1_1
LBB1_9:
                                        ; kill: def $x8 killed $xzr
	stur	xzr, [x29, #-8]
	b	LBB1_10
LBB1_10:
	ldur	x0, [x29, #-8]
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__Z16GetSymbolAddressPvPKc      ; -- Begin function _Z16GetSymbolAddressPvPKc
	.p2align	2
__Z16GetSymbolAddressPvPKc:             ; @_Z16GetSymbolAddressPvPKc
Lfunc_begin0:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception0
; %bb.0:
	sub	sp, sp, #208
	.cfi_def_cfa_offset 208
	stp	x29, x30, [sp, #192]            ; 16-byte Folded Spill
	add	x29, sp, #192
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	x1, [x29, #-16]
	ldur	x8, [x29, #-8]
	stur	x8, [x29, #-24]
	ldur	x8, [x29, #-8]
	add	x8, x8, #32
	stur	x8, [x29, #-32]
	ldur	x0, [x29, #-24]
	ldur	x1, [x29, #-32]
	mov	w2, #2
	mov	x3, #0
	bl	__Z14GetLoadCommandP14mach_header_64PvjPKc
	stur	x0, [x29, #-40]
	ldur	x0, [x29, #-24]
	ldur	x1, [x29, #-32]
	mov	w2, #25
	str	w2, [sp, #12]                   ; 4-byte Folded Spill
	adrp	x3, l_.str.1@PAGE
	add	x3, x3, l_.str.1@PAGEOFF
	bl	__Z14GetLoadCommandP14mach_header_64PvjPKc
	ldr	w2, [sp, #12]                   ; 4-byte Folded Reload
	stur	x0, [x29, #-48]
	ldur	x0, [x29, #-24]
	ldur	x1, [x29, #-32]
	adrp	x3, l_.str.2@PAGE
	add	x3, x3, l_.str.2@PAGEOFF
	bl	__Z14GetLoadCommandP14mach_header_64PvjPKc
	stur	x0, [x29, #-56]
	ldur	x8, [x29, #-8]
	ldur	x9, [x29, #-56]
	ldr	x9, [x9, #24]
	subs	x8, x8, x9
	stur	x8, [x29, #-64]
	ldur	x8, [x29, #-48]
	ldr	x8, [x8, #24]
	ldur	x9, [x29, #-64]
	add	x8, x8, x9
	ldur	x9, [x29, #-40]
	ldr	w9, [x9, #16]
                                        ; kill: def $x9 killed $w9
	add	x8, x8, x9
	ldur	x9, [x29, #-48]
	ldr	x9, [x9, #40]
	subs	x8, x8, x9
	stur	x8, [x29, #-72]
	ldur	x8, [x29, #-48]
	ldr	x8, [x8, #24]
	ldur	x9, [x29, #-64]
	add	x8, x8, x9
	ldur	x9, [x29, #-40]
	ldr	w9, [x9, #8]
                                        ; kill: def $x9 killed $w9
	add	x8, x8, x9
	ldur	x9, [x29, #-48]
	ldr	x9, [x9, #40]
	subs	x8, x8, x9
	stur	x8, [x29, #-80]
	stur	xzr, [x29, #-88]
	ldur	x8, [x29, #-80]
	str	x8, [sp, #96]
	str	wzr, [sp, #92]
	b	LBB2_1
LBB2_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #92]
	ldur	x9, [x29, #-40]
	ldr	w9, [x9, #12]
	subs	w8, w8, w9
	cset	w8, hs
	tbnz	w8, #0, LBB2_14
	b	LBB2_2
LBB2_2:                                 ;   in Loop: Header=BB2_1 Depth=1
	ldr	x8, [sp, #96]
	ldr	q0, [x8]
	str	q0, [sp, #64]
	ldrb	w8, [sp, #68]
	and	w8, w8, #0xe
	subs	w8, w8, #14
	cset	w8, ne
	tbnz	w8, #0, LBB2_12
	b	LBB2_3
LBB2_3:                                 ;   in Loop: Header=BB2_1 Depth=1
                                        ; kill: def $x8 killed $xzr
	str	xzr, [sp, #56]
	add	x0, sp, #32
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B6v15006Ev
	ldur	x8, [x29, #-72]
	ldr	w9, [sp, #64]
                                        ; kill: def $x9 killed $w9
	add	x8, x8, x9
	str	x8, [sp, #56]
	ldr	x0, [sp, #56]
	ldur	x1, [x29, #-16]
Ltmp0:
	bl	_strcmp
	str	w0, [sp, #8]                    ; 4-byte Folded Spill
Ltmp1:
	b	LBB2_4
LBB2_4:                                 ;   in Loop: Header=BB2_1 Depth=1
	ldr	w8, [sp, #8]                    ; 4-byte Folded Reload
	subs	w8, w8, #0
	cset	w8, ne
	tbnz	w8, #0, LBB2_7
	b	LBB2_5
LBB2_5:                                 ;   in Loop: Header=BB2_1 Depth=1
	ldur	x8, [x29, #-8]
	ldur	x9, [x29, #-56]
	ldr	x9, [x9, #24]
	subs	x8, x8, x9
	ldr	x9, [sp, #72]
	add	x8, x8, x9
	stur	x8, [x29, #-88]
	mov	w8, #2
	str	w8, [sp, #16]
	b	LBB2_8
LBB2_6:
Ltmp2:
	mov	x8, x1
	str	x0, [sp, #24]
	str	w8, [sp, #20]
Ltmp3:
	add	x0, sp, #32
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
Ltmp4:
	b	LBB2_11
LBB2_7:                                 ;   in Loop: Header=BB2_1 Depth=1
	str	wzr, [sp, #16]
	b	LBB2_8
LBB2_8:                                 ;   in Loop: Header=BB2_1 Depth=1
	add	x0, sp, #32
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
	ldr	w8, [sp, #16]
	subs	w8, w8, #0
	cset	w8, eq
	tbnz	w8, #0, LBB2_10
	b	LBB2_9
LBB2_9:
	b	LBB2_14
LBB2_10:                                ;   in Loop: Header=BB2_1 Depth=1
	b	LBB2_12
LBB2_11:
	b	LBB2_15
LBB2_12:                                ;   in Loop: Header=BB2_1 Depth=1
	ldr	x8, [sp, #96]
	add	x8, x8, #16
	str	x8, [sp, #96]
	b	LBB2_13
LBB2_13:                                ;   in Loop: Header=BB2_1 Depth=1
	ldr	w8, [sp, #92]
	add	w8, w8, #1
	str	w8, [sp, #92]
	b	LBB2_1
LBB2_14:
	ldur	x0, [x29, #-88]
	ldp	x29, x30, [sp, #192]            ; 16-byte Folded Reload
	add	sp, sp, #208
	ret
LBB2_15:
	ldr	x0, [sp, #24]
	bl	__Unwind_Resume
LBB2_16:
Ltmp5:
	bl	___clang_call_terminate
; %bb.17:
Lfunc_end0:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table2:
Lexception0:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase0-Lttbaseref0
Lttbaseref0:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end0-Lcst_begin0
Lcst_begin0:
	.uleb128 Lfunc_begin0-Lfunc_begin0      ; >> Call Site 1 <<
	.uleb128 Ltmp0-Lfunc_begin0             ;   Call between Lfunc_begin0 and Ltmp0
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp0-Lfunc_begin0             ; >> Call Site 2 <<
	.uleb128 Ltmp1-Ltmp0                    ;   Call between Ltmp0 and Ltmp1
	.uleb128 Ltmp2-Lfunc_begin0             ;     jumps to Ltmp2
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp3-Lfunc_begin0             ; >> Call Site 3 <<
	.uleb128 Ltmp4-Ltmp3                    ;   Call between Ltmp3 and Ltmp4
	.uleb128 Ltmp5-Lfunc_begin0             ;     jumps to Ltmp5
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp4-Lfunc_begin0             ; >> Call Site 4 <<
	.uleb128 Lfunc_end0-Ltmp4               ;   Call between Ltmp4 and Lfunc_end0
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end0:
	.byte	1                               ; >> Action Record 1 <<
                                        ;   Catch TypeInfo 1
	.byte	0                               ;   No further actions
	.p2align	2
                                        ; >> Catch TypeInfos <<
	.long	0                               ; TypeInfo 1
Lttbase0:
	.p2align	2
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B6v15006Ev ; -- Begin function _ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B6v15006Ev
	.globl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B6v15006Ev
	.weak_def_can_be_hidden	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B6v15006Ev
	.p2align	2
__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B6v15006Ev: ; @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B6v15006Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	___clang_call_terminate ; -- Begin function __clang_call_terminate
	.globl	___clang_call_terminate
	.weak_definition	___clang_call_terminate
	.p2align	2
___clang_call_terminate:                ; @__clang_call_terminate
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	bl	___cxa_begin_catch
	bl	__ZSt9terminatev
                                        ; -- End function
	.globl	__Z15initIPTelephonyv           ; -- Begin function _Z15initIPTelephonyv
	.p2align	2
__Z15initIPTelephonyv:                  ; @_Z15initIPTelephonyv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x0, l_.str.3@PAGE
	add	x0, x0, l_.str.3@PAGEOFF
	bl	__Z11LoadLibraryPKc
	str	x0, [sp, #16]
	ldr	x8, [sp, #16]
	subs	x8, x8, #0
	cset	w8, ne
	tbnz	w8, #0, LBB5_2
	b	LBB5_1
LBB5_1:
	adrp	x0, l_.str.4@PAGE
	add	x0, x0, l_.str.4@PAGEOFF
	bl	_printf
	stur	wzr, [x29, #-4]
	b	LBB5_8
LBB5_2:
	ldr	x8, [sp, #16]
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.5@PAGE
	add	x0, x0, l_.str.5@PAGEOFF
	bl	_printf
	b	LBB5_3
LBB5_3:
	ldr	x0, [sp, #16]
	adrp	x1, l_.str.6@PAGE
	add	x1, x1, l_.str.6@PAGEOFF
	bl	__Z16GetSymbolAddressPvPKc
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	subs	x8, x8, #0
	cset	w8, ne
	tbnz	w8, #0, LBB5_5
	b	LBB5_4
LBB5_4:
	adrp	x0, l_.str.7@PAGE
	add	x0, x0, l_.str.7@PAGEOFF
	bl	_printf
	stur	wzr, [x29, #-4]
	b	LBB5_8
LBB5_5:
	ldr	x8, [sp, #8]
	adrp	x9, _SipMessageDecoder_decode@PAGE
	str	x8, [x9, _SipMessageDecoder_decode@PAGEOFF]
	ldr	x0, [sp, #16]
	adrp	x1, l_.str.8@PAGE
	add	x1, x1, l_.str.8@PAGEOFF
	bl	__Z16GetSymbolAddressPvPKc
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	subs	x8, x8, #0
	cset	w8, ne
	tbnz	w8, #0, LBB5_7
	b	LBB5_6
LBB5_6:
	adrp	x0, l_.str.7@PAGE
	add	x0, x0, l_.str.7@PAGEOFF
	bl	_printf
	stur	wzr, [x29, #-4]
	b	LBB5_8
LBB5_7:
	ldr	x8, [sp, #8]
	adrp	x9, _SipMessageEncodingMap_constructor@PAGE
	str	x8, [x9, _SipMessageEncodingMap_constructor@PAGEOFF]
	mov	w8, #1
	stur	w8, [x29, #-4]
	b	LBB5_8
LBB5_8:
	ldur	w0, [x29, #-4]
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__Z16ReadFileToStringPKcRNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEE ; -- Begin function _Z16ReadFileToStringPKcRNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEE
	.p2align	2
__Z16ReadFileToStringPKcRNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEE: ; @_Z16ReadFileToStringPKcRNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEE
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80
	.cfi_def_cfa_offset 80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-16]
	stur	x1, [x29, #-24]
	ldur	x0, [x29, #-16]
	adrp	x1, l_.str.9@PAGE
	add	x1, x1, l_.str.9@PAGEOFF
	bl	_fopen
	str	x0, [sp, #32]
	ldr	x8, [sp, #32]
	subs	x8, x8, #0
	cset	w8, ne
	tbnz	w8, #0, LBB6_2
	b	LBB6_1
LBB6_1:
	ldur	x8, [x29, #-16]
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.10@PAGE
	add	x0, x0, l_.str.10@PAGEOFF
	bl	_printf
	stur	wzr, [x29, #-4]
	b	LBB6_3
LBB6_2:
	ldr	x0, [sp, #32]
	mov	x1, #0
	str	x1, [sp, #8]                    ; 8-byte Folded Spill
	mov	w2, #2
	bl	_fseek
	ldr	x0, [sp, #32]
	bl	_ftell
	ldr	x1, [sp, #8]                    ; 8-byte Folded Reload
	str	x0, [sp, #24]
	ldr	x0, [sp, #32]
	mov	w2, #0
	bl	_fseek
	ldr	x0, [sp, #24]
	bl	_malloc
	str	x0, [sp, #16]
	ldr	x0, [sp, #16]
	ldr	x2, [sp, #24]
	ldr	x3, [sp, #32]
	mov	x1, #1
	bl	_fread
	ldr	x0, [sp, #32]
	bl	_fclose
	ldur	x0, [x29, #-24]
	ldr	x1, [sp, #16]
	ldr	x2, [sp, #24]
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6assignEPKcm
	ldr	x0, [sp, #16]
	bl	_free
	mov	w8, #1
	stur	w8, [x29, #-4]
	b	LBB6_3
LBB6_3:
	ldur	w0, [x29, #-4]
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
Lfunc_begin1:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception1
; %bb.0:
	stp	x28, x27, [sp, #-32]!           ; 16-byte Folded Spill
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w27, -24
	.cfi_offset w28, -32
	sub	sp, sp, #1200
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	stur	x8, [x29, #-24]
	str	wzr, [sp, #108]
	str	w0, [sp, #104]
	str	x1, [sp, #96]
	bl	__Z15initIPTelephonyv
	subs	w8, w0, #0
	cset	w8, ne
	tbnz	w8, #0, LBB7_2
	b	LBB7_1
LBB7_1:
	str	wzr, [sp, #108]
	b	LBB7_15
LBB7_2:
	ldr	w8, [sp, #104]
	subs	w8, w8, #2
	cset	w8, ge
	tbnz	w8, #0, LBB7_4
	b	LBB7_3
LBB7_3:
	ldr	x8, [sp, #96]
	ldr	x8, [x8]
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.11@PAGE
	add	x0, x0, l_.str.11@PAGEOFF
	bl	_printf
	str	wzr, [sp, #108]
	b	LBB7_15
LBB7_4:
	add	x0, sp, #72
	str	x0, [sp, #32]                   ; 8-byte Folded Spill
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B6v15006Ev
	ldr	x1, [sp, #32]                   ; 8-byte Folded Reload
	ldr	x8, [sp, #96]
	ldr	x0, [x8, #8]
Ltmp6:
	bl	__Z16ReadFileToStringPKcRNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEE
	str	w0, [sp, #40]                   ; 4-byte Folded Spill
Ltmp7:
	b	LBB7_5
LBB7_5:
	ldr	w8, [sp, #40]                   ; 4-byte Folded Reload
	subs	w8, w8, #0
	cset	w8, ne
	tbnz	w8, #0, LBB7_8
	b	LBB7_6
LBB7_6:
	str	wzr, [sp, #108]
	mov	w8, #1
	str	w8, [sp, #56]
	b	LBB7_13
LBB7_7:
Ltmp16:
	mov	x8, x1
	str	x0, [sp, #64]
	str	w8, [sp, #60]
Ltmp17:
	add	x0, sp, #72
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
Ltmp18:
	b	LBB7_14
LBB7_8:
Ltmp8:
	adrp	x0, l_.str.12@PAGE
	add	x0, x0, l_.str.12@PAGEOFF
	bl	_printf
Ltmp9:
	b	LBB7_9
LBB7_9:
	adrp	x8, _SipMessageEncodingMap_constructor@PAGE
	ldr	x8, [x8, _SipMessageEncodingMap_constructor@PAGEOFF]
Ltmp10:
	add	x0, sp, #192
	blr	x8
Ltmp11:
	b	LBB7_10
LBB7_10:
	add	x0, sp, #112
	str	x0, [sp, #24]                   ; 8-byte Folded Spill
	mov	w1, #0
	mov	x2, #80
	bl	_memset
	ldr	x0, [sp, #24]                   ; 8-byte Folded Reload
	mov	x8, #-6148914691236517206
	str	x8, [sp, #152]
	add	x8, sp, #192
	str	x8, [sp, #168]
	add	x2, sp, #48
                                        ; kill: def $x8 killed $xzr
	str	xzr, [sp, #48]
	add	x3, sp, #47
	strb	wzr, [sp, #47]
	adrp	x8, _SipMessageDecoder_decode@PAGE
	ldr	x8, [x8, _SipMessageDecoder_decode@PAGEOFF]
Ltmp12:
	add	x1, sp, #72
	blr	x8
Ltmp13:
	b	LBB7_11
LBB7_11:
Ltmp14:
	adrp	x0, l_.str.13@PAGE
	add	x0, x0, l_.str.13@PAGEOFF
	bl	_printf
Ltmp15:
	b	LBB7_12
LBB7_12:
	str	wzr, [sp, #108]
	mov	w8, #1
	str	w8, [sp, #56]
	b	LBB7_13
LBB7_13:
	add	x0, sp, #72
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
	b	LBB7_15
LBB7_14:
	b	LBB7_18
LBB7_15:
	ldr	w8, [sp, #108]
	str	w8, [sp, #20]                   ; 4-byte Folded Spill
	ldur	x9, [x29, #-24]
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	subs	x8, x8, x9
	cset	w8, eq
	tbnz	w8, #0, LBB7_17
	b	LBB7_16
LBB7_16:
	bl	___stack_chk_fail
LBB7_17:
	ldr	w0, [sp, #20]                   ; 4-byte Folded Reload
	add	sp, sp, #1200
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp], #32             ; 16-byte Folded Reload
	ret
LBB7_18:
	ldr	x0, [sp, #64]
	bl	__Unwind_Resume
LBB7_19:
Ltmp19:
	bl	___clang_call_terminate
Lfunc_end1:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table7:
Lexception1:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase1-Lttbaseref1
Lttbaseref1:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end1-Lcst_begin1
Lcst_begin1:
	.uleb128 Lfunc_begin1-Lfunc_begin1      ; >> Call Site 1 <<
	.uleb128 Ltmp6-Lfunc_begin1             ;   Call between Lfunc_begin1 and Ltmp6
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp6-Lfunc_begin1             ; >> Call Site 2 <<
	.uleb128 Ltmp7-Ltmp6                    ;   Call between Ltmp6 and Ltmp7
	.uleb128 Ltmp16-Lfunc_begin1            ;     jumps to Ltmp16
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp17-Lfunc_begin1            ; >> Call Site 3 <<
	.uleb128 Ltmp18-Ltmp17                  ;   Call between Ltmp17 and Ltmp18
	.uleb128 Ltmp19-Lfunc_begin1            ;     jumps to Ltmp19
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp8-Lfunc_begin1             ; >> Call Site 4 <<
	.uleb128 Ltmp11-Ltmp8                   ;   Call between Ltmp8 and Ltmp11
	.uleb128 Ltmp16-Lfunc_begin1            ;     jumps to Ltmp16
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp11-Lfunc_begin1            ; >> Call Site 5 <<
	.uleb128 Ltmp12-Ltmp11                  ;   Call between Ltmp11 and Ltmp12
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp12-Lfunc_begin1            ; >> Call Site 6 <<
	.uleb128 Ltmp15-Ltmp12                  ;   Call between Ltmp12 and Ltmp15
	.uleb128 Ltmp16-Lfunc_begin1            ;     jumps to Ltmp16
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp15-Lfunc_begin1            ; >> Call Site 7 <<
	.uleb128 Lfunc_end1-Ltmp15              ;   Call between Ltmp15 and Lfunc_end1
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end1:
	.byte	1                               ; >> Action Record 1 <<
                                        ;   Catch TypeInfo 1
	.byte	0                               ;   No further actions
	.p2align	2
                                        ; >> Catch TypeInfos <<
	.long	0                               ; TypeInfo 1
Lttbase1:
	.p2align	2
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B6v15006Ev ; -- Begin function _ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B6v15006Ev
	.globl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B6v15006Ev
	.weak_def_can_be_hidden	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B6v15006Ev
	.p2align	2
__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B6v15006Ev: ; @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	ldur	x0, [x29, #-8]
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	sub	x1, x29, #9
	sub	x2, x29, #10
	bl	__ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC1B6v15006INS_18__default_init_tagESA_EEOT_OT0_
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	bl	__ZNSt3__119__debug_db_insert_cB6v15006INS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEvPT_
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE14__default_initB6v15006Ev
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC1B6v15006INS_18__default_init_tagESA_EEOT_OT0_ ; -- Begin function _ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC1B6v15006INS_18__default_init_tagESA_EEOT_OT0_
	.weak_def_can_be_hidden	__ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC1B6v15006INS_18__default_init_tagESA_EEOT_OT0_
	.p2align	2
__ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC1B6v15006INS_18__default_init_tagESA_EEOT_OT0_: ; @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC1B6v15006INS_18__default_init_tagESA_EEOT_OT0_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	str	x2, [sp, #8]
	ldur	x0, [x29, #-8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	ldr	x1, [sp, #16]
	ldr	x2, [sp, #8]
	bl	__ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC2B6v15006INS_18__default_init_tagESA_EEOT_OT0_
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__119__debug_db_insert_cB6v15006INS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEvPT_ ; -- Begin function _ZNSt3__119__debug_db_insert_cB6v15006INS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEvPT_
	.globl	__ZNSt3__119__debug_db_insert_cB6v15006INS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEvPT_
	.weak_definition	__ZNSt3__119__debug_db_insert_cB6v15006INS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEvPT_
	.p2align	2
__ZNSt3__119__debug_db_insert_cB6v15006INS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEvPT_: ; @_ZNSt3__119__debug_db_insert_cB6v15006INS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEvPT_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE14__default_initB6v15006Ev ; -- Begin function _ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE14__default_initB6v15006Ev
	.globl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE14__default_initB6v15006Ev
	.weak_definition	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE14__default_initB6v15006Ev
	.p2align	2
__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE14__default_initB6v15006Ev: ; @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE14__default_initB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	.cfi_def_cfa_offset 64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	ldur	x0, [x29, #-8]
	str	x0, [sp, #16]                   ; 8-byte Folded Spill
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__zeroB6v15006Ev
	bl	__ZNSt3__130__libcpp_is_constant_evaluatedEv
	tbz	w0, #0, LBB11_2
	b	LBB11_1
LBB11_1:
	mov	x0, #0
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE11__recommendB6v15006Em
	mov	x8, x0
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	add	x8, x8, #1
	stur	x8, [x29, #-16]
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7__allocB6v15006Ev
	ldur	x1, [x29, #-16]
	bl	__ZNSt3__116allocator_traitsINS_9allocatorIcEEE8allocateB6v15006ERS2_m
	str	x0, [sp, #24]
	ldr	x0, [sp, #24]
	ldur	x1, [x29, #-16]
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE16__begin_lifetimeB6v15006EPcm
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x1, [sp, #24]
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__set_long_pointerB6v15006EPc
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	ldur	x1, [x29, #-16]
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE14__set_long_capB6v15006Em
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x1, [sp, #8]                    ; 8-byte Folded Reload
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE15__set_long_sizeB6v15006Em
	b	LBB11_2
LBB11_2:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC2B6v15006INS_18__default_init_tagESA_EEOT_OT0_ ; -- Begin function _ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC2B6v15006INS_18__default_init_tagESA_EEOT_OT0_
	.weak_def_can_be_hidden	__ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC2B6v15006INS_18__default_init_tagESA_EEOT_OT0_
	.p2align	2
__ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC2B6v15006INS_18__default_init_tagESA_EEOT_OT0_: ; @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC2B6v15006INS_18__default_init_tagESA_EEOT_OT0_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	.cfi_def_cfa_offset 64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	x1, [x29, #-16]
	str	x2, [sp, #24]
	ldur	x0, [x29, #-8]
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	bl	__ZNSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EEC2B6v15006ENS_18__default_init_tagE
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	bl	__ZNSt3__122__compressed_pair_elemINS_9allocatorIcEELi1ELb1EEC2B6v15006ENS_18__default_init_tagE
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EEC2B6v15006ENS_18__default_init_tagE ; -- Begin function _ZNSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EEC2B6v15006ENS_18__default_init_tagE
	.globl	__ZNSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EEC2B6v15006ENS_18__default_init_tagE
	.weak_def_can_be_hidden	__ZNSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EEC2B6v15006ENS_18__default_init_tagE
	.p2align	2
__ZNSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EEC2B6v15006ENS_18__default_init_tagE: ; @_ZNSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EEC2B6v15006ENS_18__default_init_tagE
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp]
	ldr	x0, [sp]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__122__compressed_pair_elemINS_9allocatorIcEELi1ELb1EEC2B6v15006ENS_18__default_init_tagE ; -- Begin function _ZNSt3__122__compressed_pair_elemINS_9allocatorIcEELi1ELb1EEC2B6v15006ENS_18__default_init_tagE
	.globl	__ZNSt3__122__compressed_pair_elemINS_9allocatorIcEELi1ELb1EEC2B6v15006ENS_18__default_init_tagE
	.weak_def_can_be_hidden	__ZNSt3__122__compressed_pair_elemINS_9allocatorIcEELi1ELb1EEC2B6v15006ENS_18__default_init_tagE
	.p2align	2
__ZNSt3__122__compressed_pair_elemINS_9allocatorIcEELi1ELb1EEC2B6v15006ENS_18__default_init_tagE: ; @_ZNSt3__122__compressed_pair_elemINS_9allocatorIcEELi1ELb1EEC2B6v15006ENS_18__default_init_tagE
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #16]
	ldr	x0, [sp, #16]
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	bl	__ZNSt3__19allocatorIcEC2B6v15006Ev
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__19allocatorIcEC2B6v15006Ev ; -- Begin function _ZNSt3__19allocatorIcEC2B6v15006Ev
	.globl	__ZNSt3__19allocatorIcEC2B6v15006Ev
	.weak_def_can_be_hidden	__ZNSt3__19allocatorIcEC2B6v15006Ev
	.p2align	2
__ZNSt3__19allocatorIcEC2B6v15006Ev:    ; @_ZNSt3__19allocatorIcEC2B6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIcEEEC2B6v15006Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIcEEEC2B6v15006Ev ; -- Begin function _ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIcEEEC2B6v15006Ev
	.globl	__ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIcEEEC2B6v15006Ev
	.weak_def_can_be_hidden	__ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIcEEEC2B6v15006Ev
	.p2align	2
__ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIcEEEC2B6v15006Ev: ; @_ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIcEEEC2B6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__zeroB6v15006Ev ; -- Begin function _ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__zeroB6v15006Ev
	.globl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__zeroB6v15006Ev
	.weak_definition	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__zeroB6v15006Ev
	.p2align	2
__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__zeroB6v15006Ev: ; @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__zeroB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	ldur	x0, [x29, #-8]
	str	xzr, [sp]
	str	xzr, [sp, #8]
	str	xzr, [sp, #16]
	bl	__ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB6v15006Ev
	ldr	q0, [sp]
	str	q0, [x0]
	ldr	x8, [sp, #16]
	str	x8, [x0, #16]
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__130__libcpp_is_constant_evaluatedEv ; -- Begin function _ZNSt3__130__libcpp_is_constant_evaluatedEv
	.weak_definition	__ZNSt3__130__libcpp_is_constant_evaluatedEv
	.p2align	2
__ZNSt3__130__libcpp_is_constant_evaluatedEv: ; @_ZNSt3__130__libcpp_is_constant_evaluatedEv
	.cfi_startproc
; %bb.0:
	mov	w8, #0
	and	w0, w8, #0x1
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE11__recommendB6v15006Em ; -- Begin function _ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE11__recommendB6v15006Em
	.globl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE11__recommendB6v15006Em
	.weak_definition	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE11__recommendB6v15006Em
	.p2align	2
__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE11__recommendB6v15006Em: ; @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE11__recommendB6v15006Em
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #16]
	ldr	x8, [sp, #16]
	subs	x8, x8, #23
	cset	w8, hs
	tbnz	w8, #0, LBB19_4
	b	LBB19_1
LBB19_1:
	bl	__ZNSt3__130__libcpp_is_constant_evaluatedEv
	tbz	w0, #0, LBB19_3
	b	LBB19_2
LBB19_2:
	mov	x8, #23
	stur	x8, [x29, #-8]
	b	LBB19_7
LBB19_3:
	mov	x8, #22
	stur	x8, [x29, #-8]
	b	LBB19_7
LBB19_4:
	ldr	x8, [sp, #16]
	add	x0, x8, #1
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE10__align_itB6v15006ILm16EEEmm
	subs	x8, x0, #1
	str	x8, [sp, #8]
	ldr	x8, [sp, #8]
	subs	x8, x8, #23
	cset	w8, ne
	tbnz	w8, #0, LBB19_6
	b	LBB19_5
LBB19_5:
	ldr	x8, [sp, #8]
	add	x8, x8, #1
	str	x8, [sp, #8]
	b	LBB19_6
LBB19_6:
	ldr	x8, [sp, #8]
	stur	x8, [x29, #-8]
	b	LBB19_7
LBB19_7:
	ldur	x0, [x29, #-8]
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__116allocator_traitsINS_9allocatorIcEEE8allocateB6v15006ERS2_m ; -- Begin function _ZNSt3__116allocator_traitsINS_9allocatorIcEEE8allocateB6v15006ERS2_m
	.globl	__ZNSt3__116allocator_traitsINS_9allocatorIcEEE8allocateB6v15006ERS2_m
	.weak_definition	__ZNSt3__116allocator_traitsINS_9allocatorIcEEE8allocateB6v15006ERS2_m
	.p2align	2
__ZNSt3__116allocator_traitsINS_9allocatorIcEEE8allocateB6v15006ERS2_m: ; @_ZNSt3__116allocator_traitsINS_9allocatorIcEEE8allocateB6v15006ERS2_m
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x0, [sp, #8]
	ldr	x1, [sp]
	bl	__ZNSt3__19allocatorIcE8allocateB6v15006Em
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7__allocB6v15006Ev ; -- Begin function _ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7__allocB6v15006Ev
	.globl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7__allocB6v15006Ev
	.weak_definition	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7__allocB6v15006Ev
	.p2align	2
__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7__allocB6v15006Ev: ; @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7__allocB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	bl	__ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E6secondB6v15006Ev
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE16__begin_lifetimeB6v15006EPcm ; -- Begin function _ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE16__begin_lifetimeB6v15006EPcm
	.globl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE16__begin_lifetimeB6v15006EPcm
	.weak_definition	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE16__begin_lifetimeB6v15006EPcm
	.p2align	2
__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE16__begin_lifetimeB6v15006EPcm: ; @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE16__begin_lifetimeB6v15006EPcm
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	str	x1, [sp]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__set_long_pointerB6v15006EPc ; -- Begin function _ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__set_long_pointerB6v15006EPc
	.globl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__set_long_pointerB6v15006EPc
	.weak_definition	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__set_long_pointerB6v15006EPc
	.p2align	2
__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__set_long_pointerB6v15006EPc: ; @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__set_long_pointerB6v15006EPc
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	ldur	x0, [x29, #-8]
	ldr	x8, [sp, #16]
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	bl	__ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB6v15006Ev
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	str	x8, [x0]
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE14__set_long_capB6v15006Em ; -- Begin function _ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE14__set_long_capB6v15006Em
	.globl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE14__set_long_capB6v15006Em
	.weak_definition	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE14__set_long_capB6v15006Em
	.p2align	2
__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE14__set_long_capB6v15006Em: ; @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE14__set_long_capB6v15006Em
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	ldur	x0, [x29, #-8]
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x8, [sp, #16]
	mov	x9, #1
	udiv	x8, x8, x9
	str	x8, [sp]                        ; 8-byte Folded Spill
	bl	__ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB6v15006Ev
	ldr	x10, [sp]                       ; 8-byte Folded Reload
	mov	x9, x0
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x8, [x9, #16]
	and	x10, x10, #0x7fffffffffffffff
	and	x8, x8, #0x8000000000000000
	orr	x8, x8, x10
	str	x8, [x9, #16]
	bl	__ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB6v15006Ev
	ldr	x8, [x0, #16]
	and	x8, x8, #0x7fffffffffffffff
	orr	x8, x8, #0x8000000000000000
	str	x8, [x0, #16]
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE15__set_long_sizeB6v15006Em ; -- Begin function _ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE15__set_long_sizeB6v15006Em
	.globl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE15__set_long_sizeB6v15006Em
	.weak_definition	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE15__set_long_sizeB6v15006Em
	.p2align	2
__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE15__set_long_sizeB6v15006Em: ; @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE15__set_long_sizeB6v15006Em
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	ldur	x0, [x29, #-8]
	ldr	x8, [sp, #16]
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	bl	__ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB6v15006Ev
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	str	x8, [x0, #8]
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB6v15006Ev ; -- Begin function _ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB6v15006Ev
	.globl	__ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB6v15006Ev
	.weak_definition	__ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB6v15006Ev
	.p2align	2
__ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB6v15006Ev: ; @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	bl	__ZNSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EE5__getB6v15006Ev
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EE5__getB6v15006Ev ; -- Begin function _ZNSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EE5__getB6v15006Ev
	.globl	__ZNSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EE5__getB6v15006Ev
	.weak_definition	__ZNSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EE5__getB6v15006Ev
	.p2align	2
__ZNSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EE5__getB6v15006Ev: ; @_ZNSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EE5__getB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE10__align_itB6v15006ILm16EEEmm ; -- Begin function _ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE10__align_itB6v15006ILm16EEEmm
	.weak_definition	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE10__align_itB6v15006ILm16EEEmm
	.p2align	2
__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE10__align_itB6v15006ILm16EEEmm: ; @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE10__align_itB6v15006ILm16EEEmm
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	add	x8, x8, #15
	and	x0, x8, #0xfffffffffffffff0
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__19allocatorIcE8allocateB6v15006Em ; -- Begin function _ZNSt3__19allocatorIcE8allocateB6v15006Em
	.globl	__ZNSt3__19allocatorIcE8allocateB6v15006Em
	.weak_definition	__ZNSt3__19allocatorIcE8allocateB6v15006Em
	.p2align	2
__ZNSt3__19allocatorIcE8allocateB6v15006Em: ; @_ZNSt3__19allocatorIcE8allocateB6v15006Em
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #16]
	str	x1, [sp, #8]
	ldr	x0, [sp, #16]
	ldr	x8, [sp, #8]
	str	x8, [sp]                        ; 8-byte Folded Spill
	bl	__ZNSt3__116allocator_traitsINS_9allocatorIcEEE8max_sizeB6v15006IS2_vEEmRKS2_
	ldr	x8, [sp]                        ; 8-byte Folded Reload
	subs	x8, x8, x0
	cset	w8, ls
	tbnz	w8, #0, LBB29_2
	b	LBB29_1
LBB29_1:
	bl	__ZSt28__throw_bad_array_new_lengthB6v15006v
LBB29_2:
	bl	__ZNSt3__130__libcpp_is_constant_evaluatedEv
	tbz	w0, #0, LBB29_4
	b	LBB29_3
LBB29_3:
	ldr	x8, [sp, #8]
	lsr	x0, x8, #0
	bl	__Znwm
	stur	x0, [x29, #-8]
	b	LBB29_5
LBB29_4:
	ldr	x8, [sp, #8]
	lsr	x0, x8, #0
	mov	x1, #1
	bl	__ZNSt3__117__libcpp_allocateB6v15006Emm
	stur	x0, [x29, #-8]
	b	LBB29_5
LBB29_5:
	ldur	x0, [x29, #-8]
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__116allocator_traitsINS_9allocatorIcEEE8max_sizeB6v15006IS2_vEEmRKS2_ ; -- Begin function _ZNSt3__116allocator_traitsINS_9allocatorIcEEE8max_sizeB6v15006IS2_vEEmRKS2_
	.weak_definition	__ZNSt3__116allocator_traitsINS_9allocatorIcEEE8max_sizeB6v15006IS2_vEEmRKS2_
	.p2align	2
__ZNSt3__116allocator_traitsINS_9allocatorIcEEE8max_sizeB6v15006IS2_vEEmRKS2_: ; @_ZNSt3__116allocator_traitsINS_9allocatorIcEEE8max_sizeB6v15006IS2_vEEmRKS2_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	bl	__ZNKSt3__19allocatorIcE8max_sizeB6v15006Ev
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZSt28__throw_bad_array_new_lengthB6v15006v ; -- Begin function _ZSt28__throw_bad_array_new_lengthB6v15006v
	.globl	__ZSt28__throw_bad_array_new_lengthB6v15006v
	.weak_definition	__ZSt28__throw_bad_array_new_lengthB6v15006v
	.p2align	2
__ZSt28__throw_bad_array_new_lengthB6v15006v: ; @_ZSt28__throw_bad_array_new_lengthB6v15006v
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	x0, #8
	bl	___cxa_allocate_exception
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	bl	__ZNSt20bad_array_new_lengthC1Ev
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	adrp	x1, __ZTISt20bad_array_new_length@GOTPAGE
	ldr	x1, [x1, __ZTISt20bad_array_new_length@GOTPAGEOFF]
	adrp	x2, __ZNSt20bad_array_new_lengthD1Ev@GOTPAGE
	ldr	x2, [x2, __ZNSt20bad_array_new_lengthD1Ev@GOTPAGEOFF]
	bl	___cxa_throw
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__117__libcpp_allocateB6v15006Emm ; -- Begin function _ZNSt3__117__libcpp_allocateB6v15006Emm
	.globl	__ZNSt3__117__libcpp_allocateB6v15006Emm
	.weak_definition	__ZNSt3__117__libcpp_allocateB6v15006Emm
	.p2align	2
__ZNSt3__117__libcpp_allocateB6v15006Emm: ; @_ZNSt3__117__libcpp_allocateB6v15006Emm
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x0, [sp, #8]
	bl	__ZNSt3__121__libcpp_operator_newB6v15006IJmEEEPvDpT_
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__19allocatorIcE8max_sizeB6v15006Ev ; -- Begin function _ZNKSt3__19allocatorIcE8max_sizeB6v15006Ev
	.globl	__ZNKSt3__19allocatorIcE8max_sizeB6v15006Ev
	.weak_definition	__ZNKSt3__19allocatorIcE8max_sizeB6v15006Ev
	.p2align	2
__ZNKSt3__19allocatorIcE8max_sizeB6v15006Ev: ; @_ZNKSt3__19allocatorIcE8max_sizeB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	mov	x0, #-1
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__121__libcpp_operator_newB6v15006IJmEEEPvDpT_ ; -- Begin function _ZNSt3__121__libcpp_operator_newB6v15006IJmEEEPvDpT_
	.globl	__ZNSt3__121__libcpp_operator_newB6v15006IJmEEEPvDpT_
	.weak_definition	__ZNSt3__121__libcpp_operator_newB6v15006IJmEEEPvDpT_
	.p2align	2
__ZNSt3__121__libcpp_operator_newB6v15006IJmEEEPvDpT_: ; @_ZNSt3__121__libcpp_operator_newB6v15006IJmEEEPvDpT_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	bl	__Znwm
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E6secondB6v15006Ev ; -- Begin function _ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E6secondB6v15006Ev
	.globl	__ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E6secondB6v15006Ev
	.weak_definition	__ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E6secondB6v15006Ev
	.p2align	2
__ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E6secondB6v15006Ev: ; @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E6secondB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	bl	__ZNSt3__122__compressed_pair_elemINS_9allocatorIcEELi1ELb1EE5__getB6v15006Ev
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__122__compressed_pair_elemINS_9allocatorIcEELi1ELb1EE5__getB6v15006Ev ; -- Begin function _ZNSt3__122__compressed_pair_elemINS_9allocatorIcEELi1ELb1EE5__getB6v15006Ev
	.globl	__ZNSt3__122__compressed_pair_elemINS_9allocatorIcEELi1ELb1EE5__getB6v15006Ev
	.weak_definition	__ZNSt3__122__compressed_pair_elemINS_9allocatorIcEELi1ELb1EE5__getB6v15006Ev
	.p2align	2
__ZNSt3__122__compressed_pair_elemINS_9allocatorIcEELi1ELb1EE5__getB6v15006Ev: ; @_ZNSt3__122__compressed_pair_elemINS_9allocatorIcEELi1ELb1EE5__getB6v15006Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_SipMessageDecoder_decode       ; @SipMessageDecoder_decode
.zerofill __DATA,__common,_SipMessageDecoder_decode,8,3
	.globl	_SipMessageEncodingMap_constructor ; @SipMessageEncodingMap_constructor
.zerofill __DATA,__common,_SipMessageEncodingMap_constructor,8,3
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"Unable to retrieve task_info, %d\n"

l_.str.1:                               ; @.str.1
	.asciz	"__LINKEDIT"

l_.str.2:                               ; @.str.2
	.asciz	"__TEXT"

l_.str.3:                               ; @.str.3
	.asciz	"/System/Library/PrivateFrameworks/IPTelephony.framework/Support/libIPTelephony.dylib"

l_.str.4:                               ; @.str.4
	.asciz	"Error loading libIPTelephony.dylib\n"

l_.str.5:                               ; @.str.5
	.asciz	"Loaded libIPTelephony.dylib at %p\n"

l_.str.6:                               ; @.str.6
	.asciz	"__ZN17SipMessageDecoder6decodeERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEPP10SipMessagePb"

l_.str.7:                               ; @.str.7
	.asciz	"Symbol lookup failed\n"

l_.str.8:                               ; @.str.8
	.asciz	"__ZN21SipMessageEncodingMapD2Ev"

l_.str.9:                               ; @.str.9
	.asciz	"rb"

l_.str.10:                              ; @.str.10
	.asciz	"Error opening %s\n"

l_.str.11:                              ; @.str.11
	.asciz	"Usage: %s <input file>\n"

l_.str.12:                              ; @.str.12
	.asciz	"Running decoder\n"

l_.str.13:                              ; @.str.13
	.asciz	"Done\n"

.subsections_via_symbols
