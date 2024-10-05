	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 11, 0	sdk_version 11, 3
	.file	1 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/arm" "_types.h"
	.file	2 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys" "_types.h"
	.file	3 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types" "_sigset_t.h"
	.file	4 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_types" "_uint64_t.h"
	.globl	_read_sprr                      ; -- Begin function read_sprr
	.p2align	2
_read_sprr:                             ; @read_sprr
Lfunc_begin0:
	.file	5 "/Users/xss/code" "ptime.c"
	.loc	5 189 0                         ; ptime.c:189:0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16                     ; =16
	.cfi_def_cfa_offset 16
Ltmp1:
	.loc	5 195 5 prologue_end            ; ptime.c:195:5
	; InlineAsm Start
	isb
	mrs	x8, S3_6_C15_C1_5

	; InlineAsm End
	str	x8, [sp, #8]
	.loc	5 202 12                        ; ptime.c:202:12
	ldr	x0, [sp, #8]
	.loc	5 202 5 is_stmt 0               ; ptime.c:202:5
	add	sp, sp, #16                     ; =16
	ret
Ltmp2:
Lfunc_end0:
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3                               ; -- Begin function main
lCPI1_0:
	.quad	0x412e848000000000              ; double 1.0E+6
lCPI1_1:
	.quad	0x408f400000000000              ; double 1000
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:                                  ; @main
Lfunc_begin1:
	.loc	5 206 0 is_stmt 1               ; ptime.c:206:0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #224                    ; =224
	stp	x29, x30, [sp, #208]            ; 16-byte Folded Spill
	add	x29, sp, #208                   ; =208
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	wzr, [x29, #-4]
	stur	w0, [x29, #-8]
	stur	x1, [x29, #-16]
Ltmp3:
	.loc	5 0 0 prologue_end              ; ptime.c:0:0
	adrp	x8, l_.str@PAGE
	add	x8, x8, l_.str@PAGEOFF
	.loc	5 207 5                         ; ptime.c:207:5
	mov	x0, x8
	str	x8, [sp, #88]                   ; 8-byte Folded Spill
	bl	_printf
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.1@PAGE
	add	x8, x8, l_.str.1@PAGEOFF
	.loc	5 208 5 is_stmt 1               ; ptime.c:208:5
	mov	x0, x8
	bl	_printf
	ldr	x8, [sp, #88]                   ; 8-byte Folded Reload
	.loc	5 209 5                         ; ptime.c:209:5
	mov	x0, x8
	bl	_printf
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.2@PAGE
	add	x8, x8, l_.str.2@PAGEOFF
	.loc	5 210 5 is_stmt 1               ; ptime.c:210:5
	mov	x0, x8
	bl	_printf
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.3@PAGE
	add	x8, x8, l_.str.3@PAGEOFF
	.loc	5 211 5 is_stmt 1               ; ptime.c:211:5
	mov	x0, x8
	bl	_system
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.4@PAGE
	add	x8, x8, l_.str.4@PAGEOFF
	.loc	5 212 5 is_stmt 1               ; ptime.c:212:5
	mov	x0, x8
	bl	_system
	ldr	x8, [sp, #88]                   ; 8-byte Folded Reload
	.loc	5 213 5                         ; ptime.c:213:5
	mov	x0, x8
	bl	_printf
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.5@PAGE
	add	x8, x8, l_.str.5@PAGEOFF
	.loc	5 214 5 is_stmt 1               ; ptime.c:214:5
	mov	x0, x8
	bl	_printf
	ldr	x8, [sp, #88]                   ; 8-byte Folded Reload
	.loc	5 215 5                         ; ptime.c:215:5
	mov	x0, x8
	bl	_printf
	mov	w9, #63
	.loc	5 216 5                         ; ptime.c:216:5
	mov	x0, x9
	bl	_setlogmask
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.6@PAGE
	add	x8, x8, l_.str.6@PAGEOFF
	.loc	5 217 5 is_stmt 1               ; ptime.c:217:5
	mov	x0, x8
	mov	w9, #11
	mov	x1, x9
	mov	w2, #136
	str	x8, [sp, #80]                   ; 8-byte Folded Spill
	str	w9, [sp, #76]                   ; 4-byte Folded Spill
	bl	_openlog
	mov	w0, #5
	ldr	x1, [sp, #80]                   ; 8-byte Folded Reload
	.loc	5 218 5                         ; ptime.c:218:5
	bl	_syslog$DARWIN_EXTSN
	.loc	5 219 5                         ; ptime.c:219:5
	bl	_closelog
	sub	x8, x29, #48                    ; =48
	.loc	5 229 5                         ; ptime.c:229:5
	mov	x0, x8
	str	x8, [sp, #64]                   ; 8-byte Folded Spill
	bl	_time
	ldr	x8, [sp, #64]                   ; 8-byte Folded Reload
	.loc	5 233 37                        ; ptime.c:233:37
	mov	x0, x8
	bl	_ctime
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.7@PAGE
	add	x8, x8, l_.str.7@PAGEOFF
	str	x0, [sp, #56]                   ; 8-byte Folded Spill
	.loc	5 233 5                         ; ptime.c:233:5
	mov	x0, x8
	mov	x8, sp
	ldr	x10, [sp, #56]                  ; 8-byte Folded Reload
	str	x10, [x8]
	bl	_printf
	ldr	x8, [sp, #64]                   ; 8-byte Folded Reload
	.loc	5 238 24 is_stmt 1              ; ptime.c:238:24
	mov	x0, x8
	bl	_localtime
	.loc	5 238 16 is_stmt 0              ; ptime.c:238:16
	stur	x0, [x29, #-56]
	.loc	5 240 13 is_stmt 1              ; ptime.c:240:13
	ldur	x8, [x29, #-56]
	.loc	5 240 20 is_stmt 0              ; ptime.c:240:20
	ldr	w9, [x8, #8]
	.loc	5 240 11                        ; ptime.c:240:11
	stur	w9, [x29, #-20]
	.loc	5 241 15 is_stmt 1              ; ptime.c:241:15
	ldur	x8, [x29, #-56]
	.loc	5 241 22 is_stmt 0              ; ptime.c:241:22
	ldr	w9, [x8, #4]
	.loc	5 241 13                        ; ptime.c:241:13
	stur	w9, [x29, #-24]
	.loc	5 242 15 is_stmt 1              ; ptime.c:242:15
	ldur	x8, [x29, #-56]
	.loc	5 242 22 is_stmt 0              ; ptime.c:242:22
	ldr	w9, [x8]
	.loc	5 242 13                        ; ptime.c:242:13
	stur	w9, [x29, #-28]
	.loc	5 244 11 is_stmt 1              ; ptime.c:244:11
	ldur	x8, [x29, #-56]
	.loc	5 244 18 is_stmt 0              ; ptime.c:244:18
	ldr	w9, [x8, #12]
	.loc	5 244 9                         ; ptime.c:244:9
	stur	w9, [x29, #-32]
	.loc	5 245 13 is_stmt 1              ; ptime.c:245:13
	ldur	x8, [x29, #-56]
	.loc	5 245 20 is_stmt 0              ; ptime.c:245:20
	ldr	w9, [x8, #16]
	.loc	5 245 27                        ; ptime.c:245:27
	add	w9, w9, #1                      ; =1
	.loc	5 245 11                        ; ptime.c:245:11
	stur	w9, [x29, #-36]
	.loc	5 246 12 is_stmt 1              ; ptime.c:246:12
	ldur	x8, [x29, #-56]
	.loc	5 246 19 is_stmt 0              ; ptime.c:246:19
	ldr	w9, [x8, #20]
	.loc	5 246 27                        ; ptime.c:246:27
	add	w9, w9, #1900                   ; =1900
	.loc	5 246 10                        ; ptime.c:246:10
	stur	w9, [x29, #-40]
	ldr	x0, [sp, #88]                   ; 8-byte Folded Reload
	.loc	5 260 5 is_stmt 1               ; ptime.c:260:5
	bl	_printf
	.loc	5 262 21                        ; ptime.c:262:21
	bl	_clock
	.loc	5 262 13 is_stmt 0              ; ptime.c:262:13
	stur	x0, [x29, #-64]
	.loc	5 0 0                           ; ptime.c:0:0
	adrp	x0, l_.str.8@PAGE
	add	x0, x0, l_.str.8@PAGEOFF
	.loc	5 266 5 is_stmt 1               ; ptime.c:266:5
	bl	_printf
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.9@PAGE
	add	x8, x8, l_.str.9@PAGEOFF
	.loc	5 268 5 is_stmt 1               ; ptime.c:268:5
	mov	x0, x8
	bl	_printf
	sub	x8, x29, #80                    ; =80
	mov	w9, #-1
	.loc	5 269 5                         ; ptime.c:269:5
	stur	w9, [x29, #-72]
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x10, l_.str.10@PAGE
	add	x10, x10, l_.str.10@PAGEOFF
	.loc	5 270 5 is_stmt 1               ; ptime.c:270:5
	mov	x0, x10
	str	x8, [sp, #48]                   ; 8-byte Folded Spill
	str	w9, [sp, #44]                   ; 4-byte Folded Spill
	bl	_printf
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, _bus_handler@PAGE
	add	x8, x8, _bus_handler@PAGEOFF
	.loc	5 271 21 is_stmt 1              ; ptime.c:271:21
	stur	x8, [x29, #-80]
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.11@PAGE
	add	x8, x8, l_.str.11@PAGEOFF
	.loc	5 272 5 is_stmt 1               ; ptime.c:272:5
	mov	x0, x8
	bl	_printf
	mov	w9, #66
	.loc	5 273 17                        ; ptime.c:273:17
	stur	w9, [x29, #-68]
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.12@PAGE
	add	x8, x8, l_.str.12@PAGEOFF
	.loc	5 274 5 is_stmt 1               ; ptime.c:274:5
	mov	x0, x8
	bl	_printf
	mov	w9, #10
	.loc	5 275 5                         ; ptime.c:275:5
	mov	x0, x9
	ldr	x1, [sp, #48]                   ; 8-byte Folded Reload
	mov	x8, #0
	mov	x2, x8
	str	x8, [sp, #32]                   ; 8-byte Folded Spill
	bl	_sigaction
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.13@PAGE
	add	x8, x8, l_.str.13@PAGEOFF
	.loc	5 276 5 is_stmt 1               ; ptime.c:276:5
	mov	x0, x8
	bl	_printf
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, _sev_handler@PAGE
	add	x8, x8, _sev_handler@PAGEOFF
	.loc	5 277 21 is_stmt 1              ; ptime.c:277:21
	stur	x8, [x29, #-80]
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.14@PAGE
	add	x8, x8, l_.str.14@PAGEOFF
	.loc	5 278 5 is_stmt 1               ; ptime.c:278:5
	mov	x0, x8
	bl	_printf
	ldr	w9, [sp, #76]                   ; 4-byte Folded Reload
	.loc	5 279 5                         ; ptime.c:279:5
	mov	x0, x9
	ldr	x1, [sp, #48]                   ; 8-byte Folded Reload
	ldr	x2, [sp, #32]                   ; 8-byte Folded Reload
	bl	_sigaction
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.15@PAGE
	add	x8, x8, l_.str.15@PAGEOFF
	.loc	5 280 5 is_stmt 1               ; ptime.c:280:5
	mov	x0, x8
	bl	_printf
	ldr	x8, [sp, #32]                   ; 8-byte Folded Reload
	.loc	5 281 21                        ; ptime.c:281:21
	mov	x0, x8
	mov	x1, #16384
	mov	w2, #7
	mov	w3, #6146
	ldr	w4, [sp, #44]                   ; 4-byte Folded Reload
	mov	x10, #0
	mov	x5, x10
	bl	_mmap
	.loc	5 281 15 is_stmt 0              ; ptime.c:281:15
	stur	x0, [x29, #-88]
	.loc	5 0 0                           ; ptime.c:0:0
	adrp	x0, l_.str.16@PAGE
	add	x0, x0, l_.str.16@PAGEOFF
	.loc	5 283 5 is_stmt 1               ; ptime.c:283:5
	bl	_printf
	mov	x8, #3689348814741910323
	.loc	5 284 5                         ; ptime.c:284:5
	mov	x0, x8
	bl	_write_sprr_perm
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x0, l_.str.17@PAGE
	add	x0, x0, l_.str.17@PAGEOFF
	.loc	5 285 5 is_stmt 1               ; ptime.c:285:5
	bl	_printf
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.18@PAGE
	add	x8, x8, l_.str.18@PAGEOFF
	.loc	5 286 5 is_stmt 1               ; ptime.c:286:5
	mov	x0, x8
	bl	_printf
	.loc	5 287 5                         ; ptime.c:287:5
	ldur	x8, [x29, #-88]
	mov	w9, #960
	movk	w9, #54879, lsl #16
	.loc	5 287 12 is_stmt 0              ; ptime.c:287:12
	str	w9, [x8]
	.loc	5 0 0                           ; ptime.c:0:0
	adrp	x8, l_.str.19@PAGE
	add	x8, x8, l_.str.19@PAGEOFF
	.loc	5 288 5 is_stmt 1               ; ptime.c:288:5
	mov	x0, x8
	bl	_printf
Ltmp4:
	.loc	5 289 14                        ; ptime.c:289:14
	stur	wzr, [x29, #-92]
LBB1_1:                                 ; =>This Inner Loop Header: Depth=1
Ltmp5:
	.loc	5 289 21 is_stmt 0              ; ptime.c:289:21
	ldur	w8, [x29, #-92]
Ltmp6:
	.loc	5 289 5                         ; ptime.c:289:5
	cmp	w8, #4                          ; =4
	b.ge	LBB1_4
; %bb.2:                                ;   in Loop: Header=BB1_1 Depth=1
Ltmp7:
	.loc	5 290 19 is_stmt 1              ; ptime.c:290:19
	ldur	x0, [x29, #-88]
	.loc	5 290 38 is_stmt 0              ; ptime.c:290:38
	ldur	w8, [x29, #-92]
	.loc	5 290 24                        ; ptime.c:290:24
	and	w8, w8, #0xff
	str	x0, [sp, #24]                   ; 8-byte Folded Spill
	mov	x0, x8
	bl	_make_sprr_val
	ldr	x9, [sp, #24]                   ; 8-byte Folded Reload
	str	x0, [sp, #16]                   ; 8-byte Folded Spill
	.loc	5 290 9                         ; ptime.c:290:9
	mov	x0, x9
	ldr	x1, [sp, #16]                   ; 8-byte Folded Reload
	bl	_sprr_test
; %bb.3:                                ;   in Loop: Header=BB1_1 Depth=1
	.loc	5 289 28 is_stmt 1              ; ptime.c:289:28
	ldur	w8, [x29, #-92]
	add	w8, w8, #1                      ; =1
	stur	w8, [x29, #-92]
	.loc	5 289 5 is_stmt 0               ; ptime.c:289:5
	b	LBB1_1
Ltmp8:
LBB1_4:
	.loc	5 291 20 is_stmt 1              ; ptime.c:291:20
	bl	_clock
	.loc	5 291 13 is_stmt 0              ; ptime.c:291:13
	str	x0, [sp, #104]
	.loc	5 292 35 is_stmt 1              ; ptime.c:292:35
	ldr	x8, [sp, #104]
	.loc	5 292 42 is_stmt 0              ; ptime.c:292:42
	ldur	x9, [x29, #-64]
	.loc	5 292 40                        ; ptime.c:292:40
	subs	x8, x8, x9
	.loc	5 292 26                        ; ptime.c:292:26
	ucvtf	d0, x8
	adrp	x8, lCPI1_1@PAGE
	ldr	d1, [x8, lCPI1_1@PAGEOFF]
	.loc	5 292 49                        ; ptime.c:292:49
	fmul	d0, d0, d1
	adrp	x8, lCPI1_0@PAGE
	ldr	d1, [x8, lCPI1_0@PAGEOFF]
	.loc	5 292 58                        ; ptime.c:292:58
	fdiv	d0, d0, d1
	.loc	5 292 16                        ; ptime.c:292:16
	str	d0, [sp, #96]
	.loc	5 293 73 is_stmt 1              ; ptime.c:293:73
	ldr	d0, [sp, #96]
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x0, l_.str.20@PAGE
	add	x0, x0, l_.str.20@PAGEOFF
	.loc	5 293 5                         ; ptime.c:293:5
	mov	x8, sp
	str	d0, [x8]
	bl	_printf
	sub	x8, x29, #48                    ; =48
	.loc	5 295 105 is_stmt 1             ; ptime.c:295:105
	mov	x0, x8
	bl	_ctime
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.21@PAGE
	add	x8, x8, l_.str.21@PAGEOFF
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	.loc	5 295 5                         ; ptime.c:295:5
	mov	x0, x8
	mov	x8, sp
	ldr	x9, [sp, #8]                    ; 8-byte Folded Reload
	str	x9, [x8]
	bl	_printf
	.loc	5 297 1 is_stmt 1               ; ptime.c:297:1
	ldur	w10, [x29, #-4]
	mov	x0, x10
	ldp	x29, x30, [sp, #208]            ; 16-byte Folded Reload
	add	sp, sp, #224                    ; =224
	ret
Ltmp9:
Lfunc_end1:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function bus_handler
_bus_handler:                           ; @bus_handler
Lfunc_begin2:
	.loc	5 33 0                          ; ptime.c:33:0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32                     ; =32
	.cfi_def_cfa_offset 32
	str	w0, [sp, #28]
	str	x1, [sp, #16]
	str	x2, [sp, #8]
Ltmp11:
	.loc	5 37 22 prologue_end            ; ptime.c:37:22
	ldr	x8, [sp, #8]
	.loc	5 37 17 is_stmt 0               ; ptime.c:37:17
	str	x8, [sp]
	.loc	5 38 5 is_stmt 1                ; ptime.c:38:5
	ldr	x8, [sp]
	.loc	5 38 9 is_stmt 0                ; ptime.c:38:9
	ldr	x8, [x8, #48]
	mov	x9, #48879
	movk	x9, #57005, lsl #16
	.loc	5 38 34                         ; ptime.c:38:34
	str	x9, [x8, #16]
	.loc	5 39 5 is_stmt 1                ; ptime.c:39:5
	ldr	x8, [sp]
	.loc	5 39 9 is_stmt 0                ; ptime.c:39:9
	ldr	x8, [x8, #48]
	.loc	5 39 32                         ; ptime.c:39:32
	ldr	x9, [x8, #272]
	add	x9, x9, #4                      ; =4
	str	x9, [x8, #272]
	.loc	5 40 1 is_stmt 1                ; ptime.c:40:1
	add	sp, sp, #32                     ; =32
	ret
Ltmp12:
Lfunc_end2:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function sev_handler
_sev_handler:                           ; @sev_handler
Lfunc_begin3:
	.loc	5 23 0                          ; ptime.c:23:0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32                     ; =32
	.cfi_def_cfa_offset 32
	str	w0, [sp, #28]
	str	x1, [sp, #16]
	str	x2, [sp, #8]
Ltmp14:
	.loc	5 27 22 prologue_end            ; ptime.c:27:22
	ldr	x8, [sp, #8]
	.loc	5 27 17 is_stmt 0               ; ptime.c:27:17
	str	x8, [sp]
	.loc	5 28 5 is_stmt 1                ; ptime.c:28:5
	ldr	x8, [sp]
	.loc	5 28 9 is_stmt 0                ; ptime.c:28:9
	ldr	x8, [x8, #48]
	mov	x9, #48879
	movk	x9, #57005, lsl #16
	.loc	5 28 34                         ; ptime.c:28:34
	str	x9, [x8, #16]
	.loc	5 29 34 is_stmt 1               ; ptime.c:29:34
	ldr	x8, [sp]
	.loc	5 29 38 is_stmt 0               ; ptime.c:29:38
	ldr	x8, [x8, #48]
	.loc	5 29 56                         ; ptime.c:29:56
	ldr	x8, [x8, #256]
	.loc	5 29 5                          ; ptime.c:29:5
	ldr	x9, [sp]
	.loc	5 29 9                          ; ptime.c:29:9
	ldr	x9, [x9, #48]
	.loc	5 29 32                         ; ptime.c:29:32
	str	x8, [x9, #272]
	.loc	5 30 1 is_stmt 1                ; ptime.c:30:1
	add	sp, sp, #32                     ; =32
	ret
Ltmp15:
Lfunc_end3:
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3                               ; -- Begin function write_sprr_perm
lCPI4_0:
	.quad	0x412e848000000000              ; double 1.0E+6
lCPI4_1:
	.quad	0x408f400000000000              ; double 1000
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	2
_write_sprr_perm:                       ; @write_sprr_perm
Lfunc_begin4:
	.loc	5 43 0                          ; ptime.c:43:0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64                     ; =64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48                    ; =48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
Ltmp16:
	.loc	5 0 0 prologue_end              ; ptime.c:0:0
	adrp	x0, l_.str.22@PAGE
	add	x0, x0, l_.str.22@PAGEOFF
	.loc	5 44 5                          ; ptime.c:44:5
	bl	_printf
	.loc	5 45 21                         ; ptime.c:45:21
	bl	_clock
	.loc	5 45 13 is_stmt 0               ; ptime.c:45:13
	stur	x0, [x29, #-16]
	.loc	5 0 0                           ; ptime.c:0:0
	adrp	x0, l_.str.23@PAGE
	add	x0, x0, l_.str.23@PAGEOFF
	.loc	5 46 5 is_stmt 1                ; ptime.c:46:5
	bl	_printf
	.loc	5 48 43                         ; ptime.c:48:43
	ldur	x8, [x29, #-8]
	.loc	5 47 5                          ; ptime.c:47:5
	; InlineAsm Start
	msr	S3_6_C15_C1_5, x8
	isb

	; InlineAsm End
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.24@PAGE
	add	x8, x8, l_.str.24@PAGEOFF
	.loc	5 50 5 is_stmt 1                ; ptime.c:50:5
	mov	x0, x8
	bl	_printf
	.loc	5 51 20                         ; ptime.c:51:20
	bl	_clock
	.loc	5 51 13 is_stmt 0               ; ptime.c:51:13
	str	x0, [sp, #24]
	.loc	5 52 35 is_stmt 1               ; ptime.c:52:35
	ldr	x8, [sp, #24]
	.loc	5 52 42 is_stmt 0               ; ptime.c:52:42
	ldur	x9, [x29, #-16]
	.loc	5 52 40                         ; ptime.c:52:40
	subs	x8, x8, x9
	.loc	5 52 26                         ; ptime.c:52:26
	ucvtf	d0, x8
	adrp	x8, lCPI4_1@PAGE
	ldr	d1, [x8, lCPI4_1@PAGEOFF]
	.loc	5 52 49                         ; ptime.c:52:49
	fmul	d0, d0, d1
	adrp	x8, lCPI4_0@PAGE
	ldr	d1, [x8, lCPI4_0@PAGEOFF]
	.loc	5 52 58                         ; ptime.c:52:58
	fdiv	d0, d0, d1
	.loc	5 52 16                         ; ptime.c:52:16
	str	d0, [sp, #16]
	.loc	5 0 0                           ; ptime.c:0:0
	adrp	x0, l_.str.25@PAGE
	add	x0, x0, l_.str.25@PAGEOFF
	.loc	5 53 9 is_stmt 1                ; ptime.c:53:9
	bl	_printf
	.loc	5 54 95                         ; ptime.c:54:95
	ldr	d0, [sp, #16]
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.26@PAGE
	add	x8, x8, l_.str.26@PAGEOFF
	.loc	5 54 9                          ; ptime.c:54:9
	mov	x0, x8
	mov	x8, sp
	str	d0, [x8]
	bl	_printf
	.loc	5 55 1 is_stmt 1                ; ptime.c:55:1
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64                     ; =64
	ret
Ltmp17:
Lfunc_end4:
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3                               ; -- Begin function sprr_test
lCPI5_0:
	.quad	0x412e848000000000              ; double 1.0E+6
lCPI5_1:
	.quad	0x408f400000000000              ; double 1000
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	2
_sprr_test:                             ; @sprr_test
Lfunc_begin5:
	.loc	5 138 0                         ; ptime.c:138:0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #128                    ; =128
	stp	x29, x30, [sp, #112]            ; 16-byte Folded Spill
	add	x29, sp, #112                   ; =112
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	x1, [x29, #-16]
Ltmp18:
	.loc	5 0 0 prologue_end              ; ptime.c:0:0
	adrp	x0, l_.str.27@PAGE
	add	x0, x0, l_.str.27@PAGEOFF
	.loc	5 139 5                         ; ptime.c:139:5
	bl	_printf
	.loc	5 140 21                        ; ptime.c:140:21
	bl	_clock
	.loc	5 140 13 is_stmt 0              ; ptime.c:140:13
	stur	x0, [x29, #-24]
	.loc	5 0 0                           ; ptime.c:0:0
	adrp	x0, l_.str.28@PAGE
	add	x0, x0, l_.str.28@PAGEOFF
	.loc	5 141 5 is_stmt 1               ; ptime.c:141:5
	bl	_printf
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.29@PAGE
	add	x8, x8, l_.str.29@PAGEOFF
	.loc	5 143 5 is_stmt 1               ; ptime.c:143:5
	mov	x0, x8
	bl	_printf
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.30@PAGE
	add	x8, x8, l_.str.30@PAGEOFF
	.loc	5 144 5 is_stmt 1               ; ptime.c:144:5
	mov	x0, x8
	bl	_printf
	.loc	5 145 9                         ; ptime.c:145:9
	bl	_read_sprr_perm
	.loc	5 145 7 is_stmt 0               ; ptime.c:145:7
	stur	x0, [x29, #-32]
	.loc	5 0 0                           ; ptime.c:0:0
	adrp	x0, l_.str.31@PAGE
	add	x0, x0, l_.str.31@PAGEOFF
	.loc	5 146 5 is_stmt 1               ; ptime.c:146:5
	bl	_printf
	.loc	5 147 21                        ; ptime.c:147:21
	ldur	x8, [x29, #-16]
	.loc	5 147 5 is_stmt 0               ; ptime.c:147:5
	mov	x0, x8
	bl	_write_sprr_perm
	.loc	5 0 0                           ; ptime.c:0:0
	adrp	x0, l_.str.32@PAGE
	add	x0, x0, l_.str.32@PAGEOFF
	.loc	5 148 5 is_stmt 1               ; ptime.c:148:5
	bl	_printf
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.33@PAGE
	add	x8, x8, l_.str.33@PAGEOFF
	.loc	5 149 5 is_stmt 1               ; ptime.c:149:5
	mov	x0, x8
	bl	_printf
	.loc	5 150 9                         ; ptime.c:150:9
	bl	_read_sprr_perm
	.loc	5 150 7 is_stmt 0               ; ptime.c:150:7
	stur	x0, [x29, #-40]
	.loc	5 0 0                           ; ptime.c:0:0
	adrp	x0, l_.str.34@PAGE
	add	x0, x0, l_.str.34@PAGEOFF
	.loc	5 151 5 is_stmt 1               ; ptime.c:151:5
	bl	_printf
	.loc	5 153 45                        ; ptime.c:153:45
	ldur	x8, [x29, #-40]
	.loc	5 153 57 is_stmt 0              ; ptime.c:153:57
	ldur	x9, [x29, #-8]
	.loc	5 153 48                        ; ptime.c:153:48
	mov	x0, x9
	str	x8, [sp, #48]                   ; 8-byte Folded Spill
	bl	_can_read
	mov	w10, #45
	mov	w11, #114
	tst	w0, #0x1
	csel	w11, w11, w10, ne
	.loc	5 153 85                        ; ptime.c:153:85
	ldur	x0, [x29, #-8]
	str	w10, [sp, #44]                  ; 4-byte Folded Spill
	str	w11, [sp, #40]                  ; 4-byte Folded Spill
	.loc	5 153 75                        ; ptime.c:153:75
	bl	_can_write
	mov	w10, #119
	tst	w0, #0x1
	ldr	w11, [sp, #44]                  ; 4-byte Folded Reload
	csel	w10, w10, w11, ne
	.loc	5 154 21 is_stmt 1              ; ptime.c:154:21
	ldur	x0, [x29, #-8]
	str	w10, [sp, #36]                  ; 4-byte Folded Spill
	.loc	5 154 12 is_stmt 0              ; ptime.c:154:12
	bl	_can_exec
	mov	w10, #120
	tst	w0, #0x1
	ldr	w11, [sp, #44]                  ; 4-byte Folded Reload
	csel	w10, w10, w11, ne
	.loc	5 0 0                           ; ptime.c:0:0
	adrp	x0, l_.str.35@PAGE
	add	x0, x0, l_.str.35@PAGEOFF
	.loc	5 153 5 is_stmt 1               ; ptime.c:153:5
	mov	x8, sp
	ldr	x9, [sp, #48]                   ; 8-byte Folded Reload
	str	x9, [x8]
                                        ; implicit-def: $x1
	ldr	w12, [sp, #40]                  ; 4-byte Folded Reload
	mov	x1, x12
	str	x1, [x8, #8]
                                        ; implicit-def: $x1
	ldr	w13, [sp, #36]                  ; 4-byte Folded Reload
	mov	x1, x13
	str	x1, [x8, #16]
                                        ; implicit-def: $x1
	mov	x1, x10
	str	x1, [x8, #24]
	bl	_printf
	.loc	5 155 20                        ; ptime.c:155:20
	bl	_clock
	.loc	5 155 13 is_stmt 0              ; ptime.c:155:13
	stur	x0, [x29, #-48]
	.loc	5 156 35 is_stmt 1              ; ptime.c:156:35
	ldur	x8, [x29, #-48]
	.loc	5 156 42 is_stmt 0              ; ptime.c:156:42
	ldur	x9, [x29, #-24]
	.loc	5 156 40                        ; ptime.c:156:40
	subs	x8, x8, x9
	.loc	5 156 26                        ; ptime.c:156:26
	ucvtf	d0, x8
	adrp	x8, lCPI5_1@PAGE
	ldr	d1, [x8, lCPI5_1@PAGEOFF]
	.loc	5 156 49                        ; ptime.c:156:49
	fmul	d0, d0, d1
	adrp	x8, lCPI5_0@PAGE
	ldr	d1, [x8, lCPI5_0@PAGEOFF]
	.loc	5 156 58                        ; ptime.c:156:58
	fdiv	d0, d0, d1
	.loc	5 156 16                        ; ptime.c:156:16
	str	d0, [sp, #56]
	.loc	5 157 73 is_stmt 1              ; ptime.c:157:73
	ldr	d0, [sp, #56]
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x0, l_.str.36@PAGE
	add	x0, x0, l_.str.36@PAGEOFF
	.loc	5 157 9                         ; ptime.c:157:9
	mov	x8, sp
	str	d0, [x8]
	bl	_printf
	.loc	5 170 1 is_stmt 1               ; ptime.c:170:1
	ldp	x29, x30, [sp, #112]            ; 16-byte Folded Reload
	add	sp, sp, #128                    ; =128
	ret
Ltmp19:
Lfunc_end5:
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3                               ; -- Begin function make_sprr_val
lCPI6_0:
	.quad	0x412e848000000000              ; double 1.0E+6
lCPI6_1:
	.quad	0x408f400000000000              ; double 1000
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	2
_make_sprr_val:                         ; @make_sprr_val
Lfunc_begin6:
	.loc	5 173 0                         ; ptime.c:173:0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80                     ; =80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64                    ; =64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	sturb	w0, [x29, #-1]
Ltmp20:
	.loc	5 0 0 prologue_end              ; ptime.c:0:0
	adrp	x0, l_.str.61@PAGE
	add	x0, x0, l_.str.61@PAGEOFF
	.loc	5 174 5                         ; ptime.c:174:5
	bl	_printf
	.loc	5 175 21                        ; ptime.c:175:21
	bl	_clock
	.loc	5 175 13 is_stmt 0              ; ptime.c:175:13
	stur	x0, [x29, #-16]
	.loc	5 0 0                           ; ptime.c:0:0
	adrp	x0, l_.str.62@PAGE
	add	x0, x0, l_.str.62@PAGEOFF
	.loc	5 176 5 is_stmt 1               ; ptime.c:176:5
	bl	_printf
	.loc	5 177 14                        ; ptime.c:177:14
	stur	xzr, [x29, #-24]
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.63@PAGE
	add	x8, x8, l_.str.63@PAGEOFF
	.loc	5 178 5 is_stmt 1               ; ptime.c:178:5
	mov	x0, x8
	bl	_printf
Ltmp21:
	.loc	5 179 14                        ; ptime.c:179:14
	stur	wzr, [x29, #-28]
LBB6_1:                                 ; =>This Inner Loop Header: Depth=1
Ltmp22:
	.loc	5 179 21 is_stmt 0              ; ptime.c:179:21
	ldur	w8, [x29, #-28]
Ltmp23:
	.loc	5 179 5                         ; ptime.c:179:5
	cmp	w8, #16                         ; =16
	b.ge	LBB6_4
; %bb.2:                                ;   in Loop: Header=BB6_1 Depth=1
Ltmp24:
	.loc	5 180 27 is_stmt 1              ; ptime.c:180:27
	ldurb	w8, [x29, #-1]
	mov	x9, x8
	.loc	5 180 43 is_stmt 0              ; ptime.c:180:43
	ldur	w8, [x29, #-28]
	mov	w10, #4
	.loc	5 180 41                        ; ptime.c:180:41
	mul	w8, w10, w8
	.loc	5 180 35                        ; ptime.c:180:35
	mov	x11, x8
	lsl	x9, x9, x11
	.loc	5 180 13                        ; ptime.c:180:13
	ldur	x11, [x29, #-24]
	orr	x9, x11, x9
	stur	x9, [x29, #-24]
; %bb.3:                                ;   in Loop: Header=BB6_1 Depth=1
	.loc	5 179 29 is_stmt 1              ; ptime.c:179:29
	ldur	w8, [x29, #-28]
	add	w8, w8, #1                      ; =1
	stur	w8, [x29, #-28]
	.loc	5 179 5 is_stmt 0               ; ptime.c:179:5
	b	LBB6_1
Ltmp25:
LBB6_4:
	.loc	5 0 0                           ; ptime.c:0:0
	adrp	x0, l_.str.64@PAGE
	add	x0, x0, l_.str.64@PAGEOFF
	.loc	5 181 5 is_stmt 1               ; ptime.c:181:5
	bl	_printf
	.loc	5 182 20                        ; ptime.c:182:20
	bl	_clock
	.loc	5 182 13 is_stmt 0              ; ptime.c:182:13
	str	x0, [sp, #24]
	.loc	5 183 35 is_stmt 1              ; ptime.c:183:35
	ldr	x8, [sp, #24]
	.loc	5 183 42 is_stmt 0              ; ptime.c:183:42
	ldur	x9, [x29, #-16]
	.loc	5 183 40                        ; ptime.c:183:40
	subs	x8, x8, x9
	.loc	5 183 26                        ; ptime.c:183:26
	ucvtf	d0, x8
	adrp	x8, lCPI6_1@PAGE
	ldr	d1, [x8, lCPI6_1@PAGEOFF]
	.loc	5 183 49                        ; ptime.c:183:49
	fmul	d0, d0, d1
	adrp	x8, lCPI6_0@PAGE
	ldr	d1, [x8, lCPI6_0@PAGEOFF]
	.loc	5 183 58                        ; ptime.c:183:58
	fdiv	d0, d0, d1
	.loc	5 183 16                        ; ptime.c:183:16
	str	d0, [sp, #16]
	.loc	5 184 76 is_stmt 1              ; ptime.c:184:76
	ldr	d0, [sp, #16]
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x0, l_.str.65@PAGE
	add	x0, x0, l_.str.65@PAGEOFF
	.loc	5 184 9                         ; ptime.c:184:9
	mov	x8, sp
	str	d0, [x8]
	bl	_printf
	.loc	5 185 12 is_stmt 1              ; ptime.c:185:12
	ldur	x8, [x29, #-24]
	.loc	5 185 5 is_stmt 0               ; ptime.c:185:5
	mov	x0, x8
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80                     ; =80
	ret
Ltmp26:
Lfunc_end6:
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3                               ; -- Begin function read_sprr_perm
lCPI7_0:
	.quad	0x412e848000000000              ; double 1.0E+6
lCPI7_1:
	.quad	0x408f400000000000              ; double 1000
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	2
_read_sprr_perm:                        ; @read_sprr_perm
Lfunc_begin7:
	.loc	5 58 0 is_stmt 1                ; ptime.c:58:0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64                     ; =64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48                    ; =48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp27:
	.loc	5 0 0 prologue_end              ; ptime.c:0:0
	adrp	x0, l_.str.37@PAGE
	add	x0, x0, l_.str.37@PAGEOFF
	.loc	5 59 5                          ; ptime.c:59:5
	bl	_printf
	.loc	5 60 21                         ; ptime.c:60:21
	bl	_clock
	.loc	5 60 13 is_stmt 0               ; ptime.c:60:13
	stur	x0, [x29, #-8]
	.loc	5 0 0                           ; ptime.c:0:0
	adrp	x0, l_.str.38@PAGE
	add	x0, x0, l_.str.38@PAGEOFF
	.loc	5 61 5 is_stmt 1                ; ptime.c:61:5
	bl	_printf
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.39@PAGE
	add	x8, x8, l_.str.39@PAGEOFF
	.loc	5 63 5 is_stmt 1                ; ptime.c:63:5
	mov	x0, x8
	bl	_printf
	.loc	5 64 5                          ; ptime.c:64:5
	; InlineAsm Start
	isb
	mrs	x8, S3_6_C15_C1_5

	; InlineAsm End
	stur	x8, [x29, #-16]
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.40@PAGE
	add	x8, x8, l_.str.40@PAGEOFF
	.loc	5 67 5 is_stmt 1                ; ptime.c:67:5
	mov	x0, x8
	bl	_printf
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.41@PAGE
	add	x8, x8, l_.str.41@PAGEOFF
	.loc	5 68 5 is_stmt 1                ; ptime.c:68:5
	mov	x0, x8
	bl	_printf
	.loc	5 69 20                         ; ptime.c:69:20
	bl	_clock
	.loc	5 69 13 is_stmt 0               ; ptime.c:69:13
	str	x0, [sp, #24]
	.loc	5 70 35 is_stmt 1               ; ptime.c:70:35
	ldr	x8, [sp, #24]
	.loc	5 70 42 is_stmt 0               ; ptime.c:70:42
	ldur	x9, [x29, #-8]
	.loc	5 70 40                         ; ptime.c:70:40
	subs	x8, x8, x9
	.loc	5 70 26                         ; ptime.c:70:26
	ucvtf	d0, x8
	adrp	x8, lCPI7_1@PAGE
	ldr	d1, [x8, lCPI7_1@PAGEOFF]
	.loc	5 70 49                         ; ptime.c:70:49
	fmul	d0, d0, d1
	adrp	x8, lCPI7_0@PAGE
	ldr	d1, [x8, lCPI7_0@PAGEOFF]
	.loc	5 70 58                         ; ptime.c:70:58
	fdiv	d0, d0, d1
	.loc	5 70 16                         ; ptime.c:70:16
	str	d0, [sp, #16]
	.loc	5 71 89 is_stmt 1               ; ptime.c:71:89
	ldr	d0, [sp, #16]
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x0, l_.str.42@PAGE
	add	x0, x0, l_.str.42@PAGEOFF
	.loc	5 71 5                          ; ptime.c:71:5
	mov	x8, sp
	str	d0, [x8]
	bl	_printf
	.loc	5 72 12 is_stmt 1               ; ptime.c:72:12
	ldur	x8, [x29, #-16]
	.loc	5 72 5 is_stmt 0                ; ptime.c:72:5
	mov	x0, x8
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64                     ; =64
	ret
Ltmp28:
Lfunc_end7:
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3                               ; -- Begin function can_read
lCPI8_0:
	.quad	0x412e848000000000              ; double 1.0E+6
lCPI8_1:
	.quad	0x408f400000000000              ; double 1000
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	2
_can_read:                              ; @can_read
Lfunc_begin8:
	.loc	5 76 0 is_stmt 1                ; ptime.c:76:0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80                     ; =80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64                    ; =64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-16]
Ltmp29:
	.loc	5 0 0 prologue_end              ; ptime.c:0:0
	adrp	x0, l_.str.43@PAGE
	add	x0, x0, l_.str.43@PAGEOFF
	.loc	5 77 5                          ; ptime.c:77:5
	bl	_printf
	.loc	5 78 21                         ; ptime.c:78:21
	bl	_clock
	.loc	5 78 13 is_stmt 0               ; ptime.c:78:13
	stur	x0, [x29, #-24]
	.loc	5 0 0                           ; ptime.c:0:0
	adrp	x0, l_.str.44@PAGE
	add	x0, x0, l_.str.44@PAGEOFF
	.loc	5 79 5 is_stmt 1                ; ptime.c:79:5
	bl	_printf
	.loc	5 80 14                         ; ptime.c:80:14
	str	xzr, [sp, #32]
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.45@PAGE
	add	x8, x8, l_.str.45@PAGEOFF
	.loc	5 81 5 is_stmt 1                ; ptime.c:81:5
	mov	x0, x8
	bl	_printf
	.loc	5 85 32                         ; ptime.c:85:32
	ldur	x8, [x29, #-16]
	.loc	5 82 5                          ; ptime.c:82:5
	; InlineAsm Start
	ldr	x0, [x8]
	mov	x8, x0

	; InlineAsm End
	str	x8, [sp, #32]
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x0, l_.str.46@PAGE
	add	x0, x0, l_.str.46@PAGEOFF
	.loc	5 87 5 is_stmt 1                ; ptime.c:87:5
	bl	_printf
	.loc	5 88 20                         ; ptime.c:88:20
	bl	_clock
	.loc	5 88 13 is_stmt 0               ; ptime.c:88:13
	str	x0, [sp, #24]
	.loc	5 89 35 is_stmt 1               ; ptime.c:89:35
	ldr	x8, [sp, #24]
	.loc	5 89 42 is_stmt 0               ; ptime.c:89:42
	ldur	x9, [x29, #-24]
	.loc	5 89 40                         ; ptime.c:89:40
	subs	x8, x8, x9
	.loc	5 89 26                         ; ptime.c:89:26
	ucvtf	d0, x8
	adrp	x8, lCPI8_1@PAGE
	ldr	d1, [x8, lCPI8_1@PAGEOFF]
	.loc	5 89 49                         ; ptime.c:89:49
	fmul	d0, d0, d1
	adrp	x8, lCPI8_0@PAGE
	ldr	d1, [x8, lCPI8_0@PAGEOFF]
	.loc	5 89 58                         ; ptime.c:89:58
	fdiv	d0, d0, d1
	.loc	5 89 16                         ; ptime.c:89:16
	str	d0, [sp, #16]
	.loc	5 0 0                           ; ptime.c:0:0
	adrp	x0, l_.str.47@PAGE
	add	x0, x0, l_.str.47@PAGEOFF
	.loc	5 90 5 is_stmt 1                ; ptime.c:90:5
	bl	_printf
	.loc	5 91 67                         ; ptime.c:91:67
	ldr	d0, [sp, #16]
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.48@PAGE
	add	x8, x8, l_.str.48@PAGEOFF
	.loc	5 91 5                          ; ptime.c:91:5
	mov	x0, x8
	mov	x8, sp
	str	d0, [x8]
	bl	_printf
Ltmp30:
	.loc	5 92 9 is_stmt 1                ; ptime.c:92:9
	ldr	x8, [sp, #32]
	mov	x9, #48879
	movk	x9, #57005, lsl #16
Ltmp31:
	.loc	5 92 9 is_stmt 0                ; ptime.c:92:9
	subs	x8, x8, x9
	b.ne	LBB8_2
; %bb.1:
	.loc	5 0 9                           ; ptime.c:0:9
	mov	w8, #0
Ltmp32:
	.loc	5 93 9 is_stmt 1                ; ptime.c:93:9
	and	w8, w8, #0x1
	sturb	w8, [x29, #-1]
	b	LBB8_3
Ltmp33:
LBB8_2:
	.loc	5 0 9 is_stmt 0                 ; ptime.c:0:9
	mov	w8, #1
	.loc	5 94 5 is_stmt 1                ; ptime.c:94:5
	and	w8, w8, #0x1
	sturb	w8, [x29, #-1]
LBB8_3:
	.loc	5 95 1                          ; ptime.c:95:1
	ldurb	w8, [x29, #-1]
	and	w0, w8, #0x1
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80                     ; =80
	ret
Ltmp34:
Lfunc_end8:
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3                               ; -- Begin function can_write
lCPI9_0:
	.quad	0x412e848000000000              ; double 1.0E+6
lCPI9_1:
	.quad	0x408f400000000000              ; double 1000
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	2
_can_write:                             ; @can_write
Lfunc_begin9:
	.loc	5 98 0                          ; ptime.c:98:0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80                     ; =80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64                    ; =64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-16]
Ltmp35:
	.loc	5 0 0 prologue_end              ; ptime.c:0:0
	adrp	x0, l_.str.49@PAGE
	add	x0, x0, l_.str.49@PAGEOFF
	.loc	5 99 5                          ; ptime.c:99:5
	bl	_printf
	.loc	5 100 21                        ; ptime.c:100:21
	bl	_clock
	.loc	5 100 13 is_stmt 0              ; ptime.c:100:13
	stur	x0, [x29, #-24]
	.loc	5 0 0                           ; ptime.c:0:0
	adrp	x0, l_.str.50@PAGE
	add	x0, x0, l_.str.50@PAGEOFF
	.loc	5 101 5 is_stmt 1               ; ptime.c:101:5
	bl	_printf
	.loc	5 102 14                        ; ptime.c:102:14
	str	xzr, [sp, #32]
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.51@PAGE
	add	x8, x8, l_.str.51@PAGEOFF
	.loc	5 103 5 is_stmt 1               ; ptime.c:103:5
	mov	x0, x8
	bl	_printf
	.loc	5 107 32                        ; ptime.c:107:32
	ldur	x8, [x29, #-16]
	.loc	5 107 36 is_stmt 0              ; ptime.c:107:36
	add	x8, x8, #8                      ; =8
	.loc	5 104 5 is_stmt 1               ; ptime.c:104:5
	; InlineAsm Start
	str	x0, [x8]
	mov	x8, x0

	; InlineAsm End
	str	x8, [sp, #32]
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x0, l_.str.52@PAGE
	add	x0, x0, l_.str.52@PAGEOFF
	.loc	5 109 5 is_stmt 1               ; ptime.c:109:5
	bl	_printf
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.53@PAGE
	add	x8, x8, l_.str.53@PAGEOFF
	.loc	5 110 5 is_stmt 1               ; ptime.c:110:5
	mov	x0, x8
	bl	_printf
	.loc	5 111 20                        ; ptime.c:111:20
	bl	_clock
	.loc	5 111 13 is_stmt 0              ; ptime.c:111:13
	str	x0, [sp, #24]
	.loc	5 112 35 is_stmt 1              ; ptime.c:112:35
	ldr	x8, [sp, #24]
	.loc	5 112 42 is_stmt 0              ; ptime.c:112:42
	ldur	x9, [x29, #-24]
	.loc	5 112 40                        ; ptime.c:112:40
	subs	x8, x8, x9
	.loc	5 112 26                        ; ptime.c:112:26
	ucvtf	d0, x8
	adrp	x8, lCPI9_1@PAGE
	ldr	d1, [x8, lCPI9_1@PAGEOFF]
	.loc	5 112 49                        ; ptime.c:112:49
	fmul	d0, d0, d1
	adrp	x8, lCPI9_0@PAGE
	ldr	d1, [x8, lCPI9_0@PAGEOFF]
	.loc	5 112 58                        ; ptime.c:112:58
	fdiv	d0, d0, d1
	.loc	5 112 16                        ; ptime.c:112:16
	str	d0, [sp, #16]
	.loc	5 113 72 is_stmt 1              ; ptime.c:113:72
	ldr	d0, [sp, #16]
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x0, l_.str.54@PAGE
	add	x0, x0, l_.str.54@PAGEOFF
	.loc	5 113 9                         ; ptime.c:113:9
	mov	x8, sp
	str	d0, [x8]
	bl	_printf
Ltmp36:
	.loc	5 114 9 is_stmt 1               ; ptime.c:114:9
	ldr	x8, [sp, #32]
	mov	x9, #48879
	movk	x9, #57005, lsl #16
Ltmp37:
	.loc	5 114 9 is_stmt 0               ; ptime.c:114:9
	subs	x8, x8, x9
	b.ne	LBB9_2
; %bb.1:
	.loc	5 0 9                           ; ptime.c:0:9
	mov	w8, #0
Ltmp38:
	.loc	5 115 9 is_stmt 1               ; ptime.c:115:9
	and	w8, w8, #0x1
	sturb	w8, [x29, #-1]
	b	LBB9_3
Ltmp39:
LBB9_2:
	.loc	5 0 9 is_stmt 0                 ; ptime.c:0:9
	mov	w8, #1
	.loc	5 116 5 is_stmt 1               ; ptime.c:116:5
	and	w8, w8, #0x1
	sturb	w8, [x29, #-1]
LBB9_3:
	.loc	5 117 1                         ; ptime.c:117:1
	ldurb	w8, [x29, #-1]
	and	w0, w8, #0x1
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80                     ; =80
	ret
Ltmp40:
Lfunc_end9:
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3                               ; -- Begin function can_exec
lCPI10_0:
	.quad	0x412e848000000000              ; double 1.0E+6
lCPI10_1:
	.quad	0x408f400000000000              ; double 1000
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	2
_can_exec:                              ; @can_exec
Lfunc_begin10:
	.loc	5 120 0                         ; ptime.c:120:0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80                     ; =80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64                    ; =64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-16]
Ltmp41:
	.loc	5 0 0 prologue_end              ; ptime.c:0:0
	adrp	x0, l_.str.55@PAGE
	add	x0, x0, l_.str.55@PAGEOFF
	.loc	5 121 5                         ; ptime.c:121:5
	bl	_printf
	.loc	5 122 21                        ; ptime.c:122:21
	bl	_clock
	.loc	5 122 13 is_stmt 0              ; ptime.c:122:13
	stur	x0, [x29, #-24]
	.loc	5 0 0                           ; ptime.c:0:0
	adrp	x0, l_.str.56@PAGE
	add	x0, x0, l_.str.56@PAGEOFF
	.loc	5 123 5 is_stmt 1               ; ptime.c:123:5
	bl	_printf
	.loc	5 124 37                        ; ptime.c:124:37
	ldur	x8, [x29, #-16]
	.loc	5 124 16 is_stmt 0              ; ptime.c:124:16
	str	x8, [sp, #32]
	.loc	5 0 0                           ; ptime.c:0:0
	adrp	x8, l_.str.57@PAGE
	add	x8, x8, l_.str.57@PAGEOFF
	.loc	5 125 5 is_stmt 1               ; ptime.c:125:5
	mov	x0, x8
	bl	_printf
	.loc	5 126 20                        ; ptime.c:126:20
	ldr	x8, [sp, #32]
	mov	x9, #0
	mov	x0, x9
	blr	x8
	.loc	5 126 14 is_stmt 0              ; ptime.c:126:14
	str	x0, [sp, #24]
	.loc	5 0 0                           ; ptime.c:0:0
	adrp	x0, l_.str.58@PAGE
	add	x0, x0, l_.str.58@PAGEOFF
	.loc	5 127 5 is_stmt 1               ; ptime.c:127:5
	bl	_printf
	.loc	5 128 20                        ; ptime.c:128:20
	bl	_clock
	.loc	5 128 13 is_stmt 0              ; ptime.c:128:13
	str	x0, [sp, #16]
	.loc	5 129 35 is_stmt 1              ; ptime.c:129:35
	ldr	x8, [sp, #16]
	.loc	5 129 42 is_stmt 0              ; ptime.c:129:42
	ldur	x9, [x29, #-24]
	.loc	5 129 40                        ; ptime.c:129:40
	subs	x8, x8, x9
	.loc	5 129 26                        ; ptime.c:129:26
	ucvtf	d0, x8
	adrp	x8, lCPI10_1@PAGE
	ldr	d1, [x8, lCPI10_1@PAGEOFF]
	.loc	5 129 49                        ; ptime.c:129:49
	fmul	d0, d0, d1
	adrp	x8, lCPI10_0@PAGE
	ldr	d1, [x8, lCPI10_0@PAGEOFF]
	.loc	5 129 58                        ; ptime.c:129:58
	fdiv	d0, d0, d1
	.loc	5 129 16                        ; ptime.c:129:16
	str	d0, [sp, #8]
	.loc	5 0 0                           ; ptime.c:0:0
	adrp	x0, l_.str.59@PAGE
	add	x0, x0, l_.str.59@PAGEOFF
	.loc	5 130 5 is_stmt 1               ; ptime.c:130:5
	bl	_printf
	.loc	5 131 66                        ; ptime.c:131:66
	ldr	d0, [sp, #8]
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.60@PAGE
	add	x8, x8, l_.str.60@PAGEOFF
	.loc	5 131 5                         ; ptime.c:131:5
	mov	x0, x8
	mov	x8, sp
	str	d0, [x8]
	bl	_printf
Ltmp42:
	.loc	5 132 9 is_stmt 1               ; ptime.c:132:9
	ldr	x8, [sp, #24]
	mov	x9, #48879
	movk	x9, #57005, lsl #16
Ltmp43:
	.loc	5 132 9 is_stmt 0               ; ptime.c:132:9
	subs	x8, x8, x9
	b.ne	LBB10_2
; %bb.1:
	.loc	5 0 9                           ; ptime.c:0:9
	mov	w8, #0
Ltmp44:
	.loc	5 133 9 is_stmt 1               ; ptime.c:133:9
	and	w8, w8, #0x1
	sturb	w8, [x29, #-1]
	b	LBB10_3
Ltmp45:
LBB10_2:
	.loc	5 0 9 is_stmt 0                 ; ptime.c:0:9
	mov	w8, #1
	.loc	5 134 5 is_stmt 1               ; ptime.c:134:5
	and	w8, w8, #0x1
	sturb	w8, [x29, #-1]
LBB10_3:
	.loc	5 135 1                         ; ptime.c:135:1
	ldurb	w8, [x29, #-1]
	and	w0, w8, #0x1
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80                     ; =80
	ret
Ltmp46:
Lfunc_end10:
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"\033[0;32m---------------------------\033[0m\n"

l_.str.1:                               ; @.str.1
	.asciz	"\033[0;36mStarting M1 SPRR Permission Configuration Register (EL0) S3_6_c15_c1_5 check in main()\033[0m\n"

l_.str.2:                               ; @.str.2
	.asciz	"\033[0;97mSystem Hardware & Software\033[0m\n"

l_.str.3:                               ; @.str.3
	.asciz	"sysctl machdep.cpu.brand_string\n"

l_.str.4:                               ; @.str.4
	.asciz	"uname -a\n"

l_.str.5:                               ; @.str.5
	.asciz	"Writing to Syslogd at LOG_NOTICE of (EL0) S3_6_c15_c1_5 check\n"

l_.str.6:                               ; @.str.6
	.asciz	"Starting M1 SPRR Permission Configuration Register (EL0) S3_6_c15_c1_5 check"

l_.str.7:                               ; @.str.7
	.asciz	"\033[0;32mToday is %s\033[0m"

l_.str.8:                               ; @.str.8
	.asciz	"Now hitting main() struct sigaction\n"

l_.str.9:                               ; @.str.9
	.asciz	"Now hitting main() sigfillset(&sa.sa_mask)\n"

l_.str.10:                              ; @.str.10
	.asciz	"Now hitting main() sa.sa_sigaction = bus_handler\n"

l_.str.11:                              ; @.str.11
	.asciz	"Now hitting main() sa.sa_flags = SA_RESTART | SA_SIGINFO\n"

l_.str.12:                              ; @.str.12
	.asciz	"Now hitting main() sigaction SIGBUS, &sa, 0\n"

l_.str.13:                              ; @.str.13
	.asciz	"Now hitting main() sa.sa_sigaction = sev_handler\n"

l_.str.14:                              ; @.str.14
	.asciz	"Now hitting main() sigaction SIGSEGV, &sa\n"

l_.str.15:                              ; @.str.15
	.asciz	"Now hitting main() uint32_t *ptr = mmap(NULL, 0x4000, PROT_READ | PROT_WRITE | PROT_EXEC, MAP_PRIVATE | MAP_ANONYMOUS | MAP_JIT, -1, 0)\n\n"

l_.str.16:                              ; @.str.16
	.asciz	"Now hitting main() write_sprr_perm(0x3333333333333333)\n\n"

l_.str.17:                              ; @.str.17
	.asciz	"Just executed main() write_sprr_perm(0x3333333333333333)\n\n"

l_.str.18:                              ; @.str.18
	.asciz	"Now in main() hitting ptr[0] 0xd65f03c0 RET\n\n"

l_.str.19:                              ; @.str.19
	.asciz	"Now in main() hitting for (int i = 0; i < 4; ++i)\n\n"

l_.str.20:                              ; @.str.20
	.asciz	"\033[0;32mmain () finished... Total Elapsed Time in ms: %f\n\n\033[0m"

l_.str.21:                              ; @.str.21
	.asciz	"\033[0;36mM1 SPRR Permission Configuration Register (EL0) S3_6_c15_c1_5 check ended at %s\033[0m"

l_.str.22:                              ; @.str.22
	.asciz	"Jumped to write_sprr_perm... Step 4...\n"

l_.str.23:                              ; @.str.23
	.asciz	"Start __volatile__ write_sprr_perm\n"

l_.str.24:                              ; @.str.24
	.asciz	"End __volatile__ write_sprr_perm\n"

l_.str.25:                              ; @.str.25
	.asciz	"End write_sprr_perm\n"

l_.str.26:                              ; @.str.26
	.asciz	"Finished write_sprr_perm ... Time elapsed for write_sprr_perm in ms: %f\n\n"

l_.str.27:                              ; @.str.27
	.asciz	"Jumped to sprr_test.. Step 2...\n"

l_.str.28:                              ; @.str.28
	.asciz	"Now at sprr_test before uint64_t a, b\n"

l_.str.29:                              ; @.str.29
	.asciz	"Completed at sprr_test after uint64_t a, b\n"

l_.str.30:                              ; @.str.30
	.asciz	"Now at sprr_test before a = read_sprr_perm()\n\n"

l_.str.31:                              ; @.str.31
	.asciz	"Completed at sprr_test following a = read_sprr_perm()\n\n"

l_.str.32:                              ; @.str.32
	.asciz	"Completed at sprr_test following write_sprr_perm(v)\n\n"

l_.str.33:                              ; @.str.33
	.asciz	"Now at sprr_test before b = read_sprr_perm()\n\n"

l_.str.34:                              ; @.str.34
	.asciz	"Finished at sprr_test after b = read_sprr_perm()\n\n"

l_.str.35:                              ; @.str.35
	.asciz	"Register Value:%llx: %c%c%c\n"

l_.str.36:                              ; @.str.36
	.asciz	"Finished.... Time elapsed for sprr_test in ms: %f\n\n"

l_.str.37:                              ; @.str.37
	.asciz	"Jumped to read_sprr_perm... Step 3...\n"

l_.str.38:                              ; @.str.38
	.asciz	"Hitting read_sprr_perm at uint64_t v;\n"

l_.str.39:                              ; @.str.39
	.asciz	"Start __volatile__ read_sprr_perm\n"

l_.str.40:                              ; @.str.40
	.asciz	"End __volatile__ read_sprr_perm\n"

l_.str.41:                              ; @.str.41
	.asciz	"End read_sprr_perm\n"

l_.str.42:                              ; @.str.42
	.asciz	"Finished read_sprr_perm ... Time elapsed for read_sprr_perm in ms: %f\n\n"

l_.str.43:                              ; @.str.43
	.asciz	"Jumped to can_read... Step 5...\n"

l_.str.44:                              ; @.str.44
	.asciz	"Hitting can_read at uint64_t v = 0\n"

l_.str.45:                              ; @.str.45
	.asciz	"Start __volatile__ can_read\n"

l_.str.46:                              ; @.str.46
	.asciz	"End __volatile__ can_read\n"

l_.str.47:                              ; @.str.47
	.asciz	"Hitting 0xdeadbeef in can_read\n"

l_.str.48:                              ; @.str.48
	.asciz	"Finished... Time elapsed for can_read in ms: %f\n\n"

l_.str.49:                              ; @.str.49
	.asciz	"Jumped to can_write... Step 6...\n"

l_.str.50:                              ; @.str.50
	.asciz	"Hitting can_write at uint64_t v = 0\n"

l_.str.51:                              ; @.str.51
	.asciz	"Start __volatile__ can_write\n"

l_.str.52:                              ; @.str.52
	.asciz	"End __volatile__ can_write\n"

l_.str.53:                              ; @.str.53
	.asciz	"Hitting 0xdeadbeef in can_write\n"

l_.str.54:                              ; @.str.54
	.asciz	"Finished... Time elapsed for can_write in ms: %f\n\n"

l_.str.55:                              ; @.str.55
	.asciz	"Jumped to can_exec... Step 7...\n"

l_.str.56:                              ; @.str.56
	.asciz	"Hitting can_exec at uint64_t (*fun_ptr)(uint64_t) = ptr\n"

l_.str.57:                              ; @.str.57
	.asciz	"Hitting uint64_t res = fun_ptr(0)\n"

l_.str.58:                              ; @.str.58
	.asciz	"Executed uint64_t res = fun_ptr(0)\n"

l_.str.59:                              ; @.str.59
	.asciz	"Hitting 0xdeadbeef in can_exec\n"

l_.str.60:                              ; @.str.60
	.asciz	"Finished... Time elapsed in can_exec in ms: %f\n\n"

l_.str.61:                              ; @.str.61
	.asciz	"Jumped to make_sprr_val.. Step 1...\n"

l_.str.62:                              ; @.str.62
	.asciz	"Hitting make_sprr_val at uint64_t res = 0\n"

l_.str.63:                              ; @.str.63
	.asciz	"Hitting make_sprr_val at int i = 0; i < 16; ++i \n"

l_.str.64:                              ; @.str.64
	.asciz	"End of make_sprr_val\n"

l_.str.65:                              ; @.str.65
	.asciz	"Finished... Time elapsed for make_sprr_val in ms: %f\n\n"

	.file	6 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types" "_time_t.h"
	.file	7 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include" "time.h"
	.file	8 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types" "_clock_t.h"
	.file	9 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys" "signal.h"
	.file	10 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types" "_pid_t.h"
	.file	11 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types" "_uid_t.h"
	.file	12 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_types" "_uint32_t.h"
	.file	13 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types" "_ucontext.h"
	.file	14 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types" "_sigaltstack.h"
	.file	15 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/mach/arm" "_structs.h"
	.file	16 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/arm" "_mcontext.h"
	.file	17 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_types" "_uint8_t.h"
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
	.byte	63                              ; DW_AT_external
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	6                               ; Abbreviation Code
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
	.byte	7                               ; Abbreviation Code
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
	.byte	8                               ; Abbreviation Code
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
	.byte	9                               ; Abbreviation Code
	.byte	52                              ; DW_TAG_variable
	.byte	0                               ; DW_CHILDREN_no
	.byte	2                               ; DW_AT_location
	.byte	24                              ; DW_FORM_exprloc
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	5                               ; DW_FORM_data2
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	10                              ; Abbreviation Code
	.byte	11                              ; DW_TAG_lexical_block
	.byte	1                               ; DW_CHILDREN_yes
	.byte	17                              ; DW_AT_low_pc
	.byte	1                               ; DW_FORM_addr
	.byte	18                              ; DW_AT_high_pc
	.byte	6                               ; DW_FORM_data4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	11                              ; Abbreviation Code
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
	.byte	12                              ; Abbreviation Code
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
	.byte	13                              ; Abbreviation Code
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
	.byte	14                              ; Abbreviation Code
	.byte	15                              ; DW_TAG_pointer_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	15                              ; Abbreviation Code
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
	.byte	16                              ; Abbreviation Code
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
	.byte	5                               ; DW_TAG_formal_parameter
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	22                              ; Abbreviation Code
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
	.byte	23                              ; Abbreviation Code
	.byte	1                               ; DW_TAG_array_type
	.byte	1                               ; DW_CHILDREN_yes
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	24                              ; Abbreviation Code
	.byte	33                              ; DW_TAG_subrange_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	55                              ; DW_AT_count
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	25                              ; Abbreviation Code
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
	.byte	26                              ; Abbreviation Code
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
	.byte	27                              ; Abbreviation Code
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
	.byte	28                              ; Abbreviation Code
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
	.byte	29                              ; Abbreviation Code
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
	.byte	30                              ; Abbreviation Code
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
	.byte	1                               ; Abbrev [1] 0xb:0x96e DW_TAG_compile_unit
	.long	0                               ; DW_AT_producer
	.short	12                              ; DW_AT_language
	.long	47                              ; DW_AT_name
	.long	55                              ; DW_AT_LLVM_sysroot
	.long	150                             ; DW_AT_APPLE_sdk
.set Lset2, Lline_table_start0-Lsection_line ; DW_AT_stmt_list
	.long	Lset2
	.long	161                             ; DW_AT_comp_dir
	.quad	Lfunc_begin0                    ; DW_AT_low_pc
.set Lset3, Lfunc_end10-Lfunc_begin0    ; DW_AT_high_pc
	.long	Lset3
	.byte	2                               ; Abbrev [2] 0x32:0xb DW_TAG_typedef
	.long	61                              ; DW_AT_type
	.long	177                             ; DW_AT_name
	.byte	3                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	2                               ; Abbrev [2] 0x3d:0xb DW_TAG_typedef
	.long	72                              ; DW_AT_type
	.long	186                             ; DW_AT_name
	.byte	2                               ; DW_AT_decl_file
	.byte	73                              ; DW_AT_decl_line
	.byte	2                               ; Abbrev [2] 0x48:0xb DW_TAG_typedef
	.long	83                              ; DW_AT_type
	.long	204                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	21                              ; DW_AT_decl_line
	.byte	3                               ; Abbrev [3] 0x53:0x7 DW_TAG_base_type
	.long	215                             ; DW_AT_name
	.byte	7                               ; DW_AT_encoding
	.byte	4                               ; DW_AT_byte_size
	.byte	4                               ; Abbrev [4] 0x5a:0x1 DW_TAG_pointer_type
	.byte	3                               ; Abbrev [3] 0x5b:0x7 DW_TAG_base_type
	.long	228                             ; DW_AT_name
	.byte	4                               ; DW_AT_encoding
	.byte	8                               ; DW_AT_byte_size
	.byte	2                               ; Abbrev [2] 0x62:0xb DW_TAG_typedef
	.long	109                             ; DW_AT_type
	.long	235                             ; DW_AT_name
	.byte	4                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	3                               ; Abbrev [3] 0x6d:0x7 DW_TAG_base_type
	.long	244                             ; DW_AT_name
	.byte	7                               ; DW_AT_encoding
	.byte	8                               ; DW_AT_byte_size
	.byte	5                               ; Abbrev [5] 0x74:0x28 DW_TAG_subprogram
	.quad	Lfunc_begin0                    ; DW_AT_low_pc
.set Lset4, Lfunc_end0-Lfunc_begin0     ; DW_AT_high_pc
	.long	Lset4
                                        ; DW_AT_APPLE_omit_frame_ptr
	.byte	1                               ; DW_AT_frame_base
	.byte	111
	.long	267                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	188                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	98                              ; DW_AT_type
                                        ; DW_AT_external
	.byte	6                               ; Abbrev [6] 0x8d:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	8
	.long	399                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	193                             ; DW_AT_decl_line
	.long	98                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	7                               ; Abbrev [7] 0x9c:0x113 DW_TAG_subprogram
	.quad	Lfunc_begin1                    ; DW_AT_low_pc
.set Lset5, Lfunc_end1-Lfunc_begin1     ; DW_AT_high_pc
	.long	Lset5
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.long	277                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	205                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	1293                            ; DW_AT_type
                                        ; DW_AT_external
	.byte	8                               ; Abbrev [8] 0xb5:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	120
	.long	401                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	205                             ; DW_AT_decl_line
	.long	1293                            ; DW_AT_type
	.byte	8                               ; Abbrev [8] 0xc3:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	112
	.long	406                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	205                             ; DW_AT_decl_line
	.long	1307                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0xd1:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	108
	.long	416                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	222                             ; DW_AT_decl_line
	.long	1293                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0xdf:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	104
	.long	422                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	222                             ; DW_AT_decl_line
	.long	1293                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0xed:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	100
	.long	430                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	222                             ; DW_AT_decl_line
	.long	1293                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0xfb:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	96
	.long	438                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	222                             ; DW_AT_decl_line
	.long	1293                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x109:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	92
	.long	442                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	222                             ; DW_AT_decl_line
	.long	1293                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x117:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	88
	.long	448                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	222                             ; DW_AT_decl_line
	.long	1293                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x125:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	80
	.long	453                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	225                             ; DW_AT_decl_line
	.long	1324                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x133:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	72
	.long	489                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	238                             ; DW_AT_decl_line
	.long	1353                            ; DW_AT_type
	.byte	9                               ; Abbrev [9] 0x141:0xf DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	64
	.long	586                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.short	262                             ; DW_AT_decl_line
	.long	1499                            ; DW_AT_type
	.byte	9                               ; Abbrev [9] 0x150:0x10 DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\260\177"
	.long	635                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.short	267                             ; DW_AT_decl_line
	.long	1528                            ; DW_AT_type
	.byte	9                               ; Abbrev [9] 0x160:0x10 DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\250\177"
	.long	897                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.short	281                             ; DW_AT_decl_line
	.long	1888                            ; DW_AT_type
	.byte	9                               ; Abbrev [9] 0x170:0x10 DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	143
	.asciz	"\350"
	.long	912                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.short	291                             ; DW_AT_decl_line
	.long	1499                            ; DW_AT_type
	.byte	9                               ; Abbrev [9] 0x180:0x10 DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	143
	.asciz	"\340"
	.long	917                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.short	292                             ; DW_AT_decl_line
	.long	91                              ; DW_AT_type
	.byte	10                              ; Abbrev [10] 0x190:0x1e DW_TAG_lexical_block
	.quad	Ltmp4                           ; DW_AT_low_pc
.set Lset6, Ltmp8-Ltmp4                 ; DW_AT_high_pc
	.long	Lset6
	.byte	9                               ; Abbrev [9] 0x19d:0x10 DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\244\177"
	.long	910                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.short	289                             ; DW_AT_decl_line
	.long	1293                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	11                              ; Abbrev [11] 0x1af:0x4e DW_TAG_subprogram
	.quad	Lfunc_begin2                    ; DW_AT_low_pc
.set Lset7, Lfunc_end2-Lfunc_begin2     ; DW_AT_high_pc
	.long	Lset7
                                        ; DW_AT_APPLE_omit_frame_ptr
	.byte	1                               ; DW_AT_frame_base
	.byte	111
	.long	282                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	32                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	8                               ; Abbrev [8] 0x1c4:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	28
	.long	925                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	32                              ; DW_AT_decl_line
	.long	1293                            ; DW_AT_type
	.byte	8                               ; Abbrev [8] 0x1d2:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	16
	.long	931                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	32                              ; DW_AT_decl_line
	.long	1904                            ; DW_AT_type
	.byte	8                               ; Abbrev [8] 0x1e0:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	8
	.long	946                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	32                              ; DW_AT_decl_line
	.long	90                              ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x1ee:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	0
	.long	950                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	37                              ; DW_AT_decl_line
	.long	1920                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	11                              ; Abbrev [11] 0x1fd:0x4e DW_TAG_subprogram
	.quad	Lfunc_begin3                    ; DW_AT_low_pc
.set Lset8, Lfunc_end3-Lfunc_begin3     ; DW_AT_high_pc
	.long	Lset8
                                        ; DW_AT_APPLE_omit_frame_ptr
	.byte	1                               ; DW_AT_frame_base
	.byte	111
	.long	294                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	22                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	8                               ; Abbrev [8] 0x212:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	28
	.long	925                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	22                              ; DW_AT_decl_line
	.long	1293                            ; DW_AT_type
	.byte	8                               ; Abbrev [8] 0x220:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	16
	.long	931                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	22                              ; DW_AT_decl_line
	.long	1904                            ; DW_AT_type
	.byte	8                               ; Abbrev [8] 0x22e:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	8
	.long	946                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	22                              ; DW_AT_decl_line
	.long	90                              ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x23c:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	0
	.long	950                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	27                              ; DW_AT_decl_line
	.long	1920                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	12                              ; Abbrev [12] 0x24b:0x4e DW_TAG_subprogram
	.quad	Lfunc_begin4                    ; DW_AT_low_pc
.set Lset9, Lfunc_end4-Lfunc_begin4     ; DW_AT_high_pc
	.long	Lset9
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.long	306                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	42                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	8                               ; Abbrev [8] 0x260:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	120
	.long	399                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	42                              ; DW_AT_decl_line
	.long	98                              ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x26e:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	112
	.long	586                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	45                              ; DW_AT_decl_line
	.long	1499                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x27c:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	24
	.long	912                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	51                              ; DW_AT_decl_line
	.long	1499                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x28a:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	16
	.long	917                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	52                              ; DW_AT_decl_line
	.long	91                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	12                              ; Abbrev [12] 0x299:0x78 DW_TAG_subprogram
	.quad	Lfunc_begin5                    ; DW_AT_low_pc
.set Lset10, Lfunc_end5-Lfunc_begin5    ; DW_AT_high_pc
	.long	Lset10
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.long	322                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	137                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	8                               ; Abbrev [8] 0x2ae:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	120
	.long	897                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	137                             ; DW_AT_decl_line
	.long	90                              ; DW_AT_type
	.byte	8                               ; Abbrev [8] 0x2bc:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	112
	.long	399                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	137                             ; DW_AT_decl_line
	.long	98                              ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x2ca:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	104
	.long	586                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	140                             ; DW_AT_decl_line
	.long	1499                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x2d8:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	96
	.long	1353                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	142                             ; DW_AT_decl_line
	.long	98                              ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x2e6:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	88
	.long	1355                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	142                             ; DW_AT_decl_line
	.long	98                              ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x2f4:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	80
	.long	912                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	155                             ; DW_AT_decl_line
	.long	1499                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x302:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	56
	.long	917                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	156                             ; DW_AT_decl_line
	.long	91                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	13                              ; Abbrev [13] 0x311:0x7c DW_TAG_subprogram
	.quad	Lfunc_begin6                    ; DW_AT_low_pc
.set Lset11, Lfunc_end6-Lfunc_begin6    ; DW_AT_high_pc
	.long	Lset11
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.long	332                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	172                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	98                              ; DW_AT_type
	.byte	8                               ; Abbrev [8] 0x32a:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	127
	.long	1357                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	172                             ; DW_AT_decl_line
	.long	2390                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x338:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	112
	.long	586                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	175                             ; DW_AT_decl_line
	.long	1499                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x346:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	104
	.long	1386                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	177                             ; DW_AT_decl_line
	.long	98                              ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x354:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	24
	.long	912                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	182                             ; DW_AT_decl_line
	.long	1499                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x362:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	16
	.long	917                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	183                             ; DW_AT_decl_line
	.long	91                              ; DW_AT_type
	.byte	10                              ; Abbrev [10] 0x370:0x1c DW_TAG_lexical_block
	.quad	Ltmp21                          ; DW_AT_low_pc
.set Lset12, Ltmp25-Ltmp21              ; DW_AT_high_pc
	.long	Lset12
	.byte	6                               ; Abbrev [6] 0x37d:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	100
	.long	910                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	179                             ; DW_AT_decl_line
	.long	1293                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	13                              ; Abbrev [13] 0x38d:0x52 DW_TAG_subprogram
	.quad	Lfunc_begin7                    ; DW_AT_low_pc
.set Lset13, Lfunc_end7-Lfunc_begin7    ; DW_AT_high_pc
	.long	Lset13
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.long	346                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	57                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	98                              ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x3a6:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	120
	.long	586                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	60                              ; DW_AT_decl_line
	.long	1499                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x3b4:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	112
	.long	399                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	62                              ; DW_AT_decl_line
	.long	98                              ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x3c2:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	24
	.long	912                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	69                              ; DW_AT_decl_line
	.long	1499                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x3d0:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	16
	.long	917                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	70                              ; DW_AT_decl_line
	.long	91                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	13                              ; Abbrev [13] 0x3df:0x60 DW_TAG_subprogram
	.quad	Lfunc_begin8                    ; DW_AT_low_pc
.set Lset14, Lfunc_end8-Lfunc_begin8    ; DW_AT_high_pc
	.long	Lset14
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.long	361                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	75                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	1300                            ; DW_AT_type
	.byte	8                               ; Abbrev [8] 0x3f8:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	112
	.long	897                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	75                              ; DW_AT_decl_line
	.long	90                              ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x406:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	104
	.long	586                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	78                              ; DW_AT_decl_line
	.long	1499                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x414:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	32
	.long	399                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	80                              ; DW_AT_decl_line
	.long	98                              ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x422:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	24
	.long	912                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	88                              ; DW_AT_decl_line
	.long	1499                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x430:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	16
	.long	917                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	89                              ; DW_AT_decl_line
	.long	91                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	13                              ; Abbrev [13] 0x43f:0x60 DW_TAG_subprogram
	.quad	Lfunc_begin9                    ; DW_AT_low_pc
.set Lset15, Lfunc_end9-Lfunc_begin9    ; DW_AT_high_pc
	.long	Lset15
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.long	370                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	97                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	1300                            ; DW_AT_type
	.byte	8                               ; Abbrev [8] 0x458:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	112
	.long	897                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	97                              ; DW_AT_decl_line
	.long	90                              ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x466:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	104
	.long	586                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	100                             ; DW_AT_decl_line
	.long	1499                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x474:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	32
	.long	399                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	102                             ; DW_AT_decl_line
	.long	98                              ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x482:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	24
	.long	912                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	111                             ; DW_AT_decl_line
	.long	1499                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x490:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	16
	.long	917                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	112                             ; DW_AT_decl_line
	.long	91                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	13                              ; Abbrev [13] 0x49f:0x6e DW_TAG_subprogram
	.quad	Lfunc_begin10                   ; DW_AT_low_pc
.set Lset16, Lfunc_end10-Lfunc_begin10  ; DW_AT_high_pc
	.long	Lset16
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.long	380                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	119                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	1300                            ; DW_AT_type
	.byte	8                               ; Abbrev [8] 0x4b8:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	112
	.long	897                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	119                             ; DW_AT_decl_line
	.long	90                              ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x4c6:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	104
	.long	586                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	122                             ; DW_AT_decl_line
	.long	1499                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x4d4:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	32
	.long	1390                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	124                             ; DW_AT_decl_line
	.long	2408                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x4e2:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	24
	.long	1386                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	126                             ; DW_AT_decl_line
	.long	98                              ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x4f0:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	16
	.long	912                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	128                             ; DW_AT_decl_line
	.long	1499                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x4fe:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	8
	.long	917                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	129                             ; DW_AT_decl_line
	.long	91                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	3                               ; Abbrev [3] 0x50d:0x7 DW_TAG_base_type
	.long	389                             ; DW_AT_name
	.byte	5                               ; DW_AT_encoding
	.byte	4                               ; DW_AT_byte_size
	.byte	3                               ; Abbrev [3] 0x514:0x7 DW_TAG_base_type
	.long	393                             ; DW_AT_name
	.byte	2                               ; DW_AT_encoding
	.byte	1                               ; DW_AT_byte_size
	.byte	14                              ; Abbrev [14] 0x51b:0x5 DW_TAG_pointer_type
	.long	1312                            ; DW_AT_type
	.byte	14                              ; Abbrev [14] 0x520:0x5 DW_TAG_pointer_type
	.long	1317                            ; DW_AT_type
	.byte	3                               ; Abbrev [3] 0x525:0x7 DW_TAG_base_type
	.long	411                             ; DW_AT_name
	.byte	6                               ; DW_AT_encoding
	.byte	1                               ; DW_AT_byte_size
	.byte	2                               ; Abbrev [2] 0x52c:0xb DW_TAG_typedef
	.long	1335                            ; DW_AT_type
	.long	457                             ; DW_AT_name
	.byte	6                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	2                               ; Abbrev [2] 0x537:0xb DW_TAG_typedef
	.long	1346                            ; DW_AT_type
	.long	464                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	96                              ; DW_AT_decl_line
	.byte	3                               ; Abbrev [3] 0x542:0x7 DW_TAG_base_type
	.long	480                             ; DW_AT_name
	.byte	5                               ; DW_AT_encoding
	.byte	8                               ; DW_AT_byte_size
	.byte	14                              ; Abbrev [14] 0x549:0x5 DW_TAG_pointer_type
	.long	1358                            ; DW_AT_type
	.byte	15                              ; Abbrev [15] 0x54e:0x8d DW_TAG_structure_type
	.long	495                             ; DW_AT_name
	.byte	56                              ; DW_AT_byte_size
	.byte	7                               ; DW_AT_decl_file
	.byte	75                              ; DW_AT_decl_line
	.byte	16                              ; Abbrev [16] 0x556:0xc DW_TAG_member
	.long	498                             ; DW_AT_name
	.long	1293                            ; DW_AT_type
	.byte	7                               ; DW_AT_decl_file
	.byte	76                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x562:0xc DW_TAG_member
	.long	505                             ; DW_AT_name
	.long	1293                            ; DW_AT_type
	.byte	7                               ; DW_AT_decl_file
	.byte	77                              ; DW_AT_decl_line
	.byte	4                               ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x56e:0xc DW_TAG_member
	.long	512                             ; DW_AT_name
	.long	1293                            ; DW_AT_type
	.byte	7                               ; DW_AT_decl_file
	.byte	78                              ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x57a:0xc DW_TAG_member
	.long	520                             ; DW_AT_name
	.long	1293                            ; DW_AT_type
	.byte	7                               ; DW_AT_decl_file
	.byte	79                              ; DW_AT_decl_line
	.byte	12                              ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x586:0xc DW_TAG_member
	.long	528                             ; DW_AT_name
	.long	1293                            ; DW_AT_type
	.byte	7                               ; DW_AT_decl_file
	.byte	80                              ; DW_AT_decl_line
	.byte	16                              ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x592:0xc DW_TAG_member
	.long	535                             ; DW_AT_name
	.long	1293                            ; DW_AT_type
	.byte	7                               ; DW_AT_decl_file
	.byte	81                              ; DW_AT_decl_line
	.byte	20                              ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x59e:0xc DW_TAG_member
	.long	543                             ; DW_AT_name
	.long	1293                            ; DW_AT_type
	.byte	7                               ; DW_AT_decl_file
	.byte	82                              ; DW_AT_decl_line
	.byte	24                              ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x5aa:0xc DW_TAG_member
	.long	551                             ; DW_AT_name
	.long	1293                            ; DW_AT_type
	.byte	7                               ; DW_AT_decl_file
	.byte	83                              ; DW_AT_decl_line
	.byte	28                              ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x5b6:0xc DW_TAG_member
	.long	559                             ; DW_AT_name
	.long	1293                            ; DW_AT_type
	.byte	7                               ; DW_AT_decl_file
	.byte	84                              ; DW_AT_decl_line
	.byte	32                              ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x5c2:0xc DW_TAG_member
	.long	568                             ; DW_AT_name
	.long	1346                            ; DW_AT_type
	.byte	7                               ; DW_AT_decl_file
	.byte	85                              ; DW_AT_decl_line
	.byte	40                              ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x5ce:0xc DW_TAG_member
	.long	578                             ; DW_AT_name
	.long	1312                            ; DW_AT_type
	.byte	7                               ; DW_AT_decl_file
	.byte	86                              ; DW_AT_decl_line
	.byte	48                              ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	2                               ; Abbrev [2] 0x5db:0xb DW_TAG_typedef
	.long	1510                            ; DW_AT_type
	.long	592                             ; DW_AT_name
	.byte	8                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	2                               ; Abbrev [2] 0x5e6:0xb DW_TAG_typedef
	.long	1521                            ; DW_AT_type
	.long	600                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	93                              ; DW_AT_decl_line
	.byte	3                               ; Abbrev [3] 0x5f1:0x7 DW_TAG_base_type
	.long	617                             ; DW_AT_name
	.byte	7                               ; DW_AT_encoding
	.byte	8                               ; DW_AT_byte_size
	.byte	17                              ; Abbrev [17] 0x5f8:0x31 DW_TAG_structure_type
	.long	638                             ; DW_AT_name
	.byte	16                              ; DW_AT_byte_size
	.byte	9                               ; DW_AT_decl_file
	.short	286                             ; DW_AT_decl_line
	.byte	18                              ; Abbrev [18] 0x601:0xd DW_TAG_member
	.long	648                             ; DW_AT_name
	.long	1577                            ; DW_AT_type
	.byte	9                               ; DW_AT_decl_file
	.short	287                             ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	18                              ; Abbrev [18] 0x60e:0xd DW_TAG_member
	.long	880                             ; DW_AT_name
	.long	50                              ; DW_AT_type
	.byte	9                               ; DW_AT_decl_file
	.short	288                             ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	18                              ; Abbrev [18] 0x61b:0xd DW_TAG_member
	.long	888                             ; DW_AT_name
	.long	1293                            ; DW_AT_type
	.byte	9                               ; DW_AT_decl_file
	.short	289                             ; DW_AT_decl_line
	.byte	12                              ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	19                              ; Abbrev [19] 0x629:0x24 DW_TAG_union_type
	.long	648                             ; DW_AT_name
	.byte	8                               ; DW_AT_byte_size
	.byte	9                               ; DW_AT_decl_file
	.short	269                             ; DW_AT_decl_line
	.byte	18                              ; Abbrev [18] 0x632:0xd DW_TAG_member
	.long	662                             ; DW_AT_name
	.long	1613                            ; DW_AT_type
	.byte	9                               ; DW_AT_decl_file
	.short	270                             ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	18                              ; Abbrev [18] 0x63f:0xd DW_TAG_member
	.long	675                             ; DW_AT_name
	.long	1625                            ; DW_AT_type
	.byte	9                               ; DW_AT_decl_file
	.short	271                             ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	14                              ; Abbrev [14] 0x64d:0x5 DW_TAG_pointer_type
	.long	1618                            ; DW_AT_type
	.byte	20                              ; Abbrev [20] 0x652:0x7 DW_TAG_subroutine_type
                                        ; DW_AT_prototyped
	.byte	21                              ; Abbrev [21] 0x653:0x5 DW_TAG_formal_parameter
	.long	1293                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	14                              ; Abbrev [14] 0x659:0x5 DW_TAG_pointer_type
	.long	1630                            ; DW_AT_type
	.byte	20                              ; Abbrev [20] 0x65e:0x11 DW_TAG_subroutine_type
                                        ; DW_AT_prototyped
	.byte	21                              ; Abbrev [21] 0x65f:0x5 DW_TAG_formal_parameter
	.long	1293                            ; DW_AT_type
	.byte	21                              ; Abbrev [21] 0x664:0x5 DW_TAG_formal_parameter
	.long	1647                            ; DW_AT_type
	.byte	21                              ; Abbrev [21] 0x669:0x5 DW_TAG_formal_parameter
	.long	90                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	14                              ; Abbrev [14] 0x66f:0x5 DW_TAG_pointer_type
	.long	1652                            ; DW_AT_type
	.byte	15                              ; Abbrev [15] 0x674:0x81 DW_TAG_structure_type
	.long	690                             ; DW_AT_name
	.byte	104                             ; DW_AT_byte_size
	.byte	9                               ; DW_AT_decl_file
	.byte	177                             ; DW_AT_decl_line
	.byte	16                              ; Abbrev [16] 0x67c:0xc DW_TAG_member
	.long	700                             ; DW_AT_name
	.long	1293                            ; DW_AT_type
	.byte	9                               ; DW_AT_decl_file
	.byte	178                             ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x688:0xc DW_TAG_member
	.long	709                             ; DW_AT_name
	.long	1293                            ; DW_AT_type
	.byte	9                               ; DW_AT_decl_file
	.byte	179                             ; DW_AT_decl_line
	.byte	4                               ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x694:0xc DW_TAG_member
	.long	718                             ; DW_AT_name
	.long	1293                            ; DW_AT_type
	.byte	9                               ; DW_AT_decl_file
	.byte	180                             ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x6a0:0xc DW_TAG_member
	.long	726                             ; DW_AT_name
	.long	1781                            ; DW_AT_type
	.byte	9                               ; DW_AT_decl_file
	.byte	181                             ; DW_AT_decl_line
	.byte	12                              ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x6ac:0xc DW_TAG_member
	.long	764                             ; DW_AT_name
	.long	1814                            ; DW_AT_type
	.byte	9                               ; DW_AT_decl_file
	.byte	182                             ; DW_AT_decl_line
	.byte	16                              ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x6b8:0xc DW_TAG_member
	.long	792                             ; DW_AT_name
	.long	1293                            ; DW_AT_type
	.byte	9                               ; DW_AT_decl_file
	.byte	183                             ; DW_AT_decl_line
	.byte	20                              ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x6c4:0xc DW_TAG_member
	.long	802                             ; DW_AT_name
	.long	90                              ; DW_AT_type
	.byte	9                               ; DW_AT_decl_file
	.byte	184                             ; DW_AT_decl_line
	.byte	24                              ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x6d0:0xc DW_TAG_member
	.long	810                             ; DW_AT_name
	.long	1836                            ; DW_AT_type
	.byte	9                               ; DW_AT_decl_file
	.byte	185                             ; DW_AT_decl_line
	.byte	32                              ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x6dc:0xc DW_TAG_member
	.long	846                             ; DW_AT_name
	.long	1346                            ; DW_AT_type
	.byte	9                               ; DW_AT_decl_file
	.byte	186                             ; DW_AT_decl_line
	.byte	40                              ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x6e8:0xc DW_TAG_member
	.long	854                             ; DW_AT_name
	.long	1869                            ; DW_AT_type
	.byte	9                               ; DW_AT_decl_file
	.byte	187                             ; DW_AT_decl_line
	.byte	48                              ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	2                               ; Abbrev [2] 0x6f5:0xb DW_TAG_typedef
	.long	1792                            ; DW_AT_type
	.long	733                             ; DW_AT_name
	.byte	10                              ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	2                               ; Abbrev [2] 0x700:0xb DW_TAG_typedef
	.long	1803                            ; DW_AT_type
	.long	739                             ; DW_AT_name
	.byte	2                               ; DW_AT_decl_file
	.byte	72                              ; DW_AT_decl_line
	.byte	2                               ; Abbrev [2] 0x70b:0xb DW_TAG_typedef
	.long	1293                            ; DW_AT_type
	.long	754                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	20                              ; DW_AT_decl_line
	.byte	2                               ; Abbrev [2] 0x716:0xb DW_TAG_typedef
	.long	1825                            ; DW_AT_type
	.long	771                             ; DW_AT_name
	.byte	11                              ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	2                               ; Abbrev [2] 0x721:0xb DW_TAG_typedef
	.long	72                              ; DW_AT_type
	.long	777                             ; DW_AT_name
	.byte	2                               ; DW_AT_decl_file
	.byte	75                              ; DW_AT_decl_line
	.byte	22                              ; Abbrev [22] 0x72c:0x21 DW_TAG_union_type
	.long	819                             ; DW_AT_name
	.byte	8                               ; DW_AT_byte_size
	.byte	9                               ; DW_AT_decl_file
	.byte	158                             ; DW_AT_decl_line
	.byte	16                              ; Abbrev [16] 0x734:0xc DW_TAG_member
	.long	826                             ; DW_AT_name
	.long	1293                            ; DW_AT_type
	.byte	9                               ; DW_AT_decl_file
	.byte	160                             ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x740:0xc DW_TAG_member
	.long	836                             ; DW_AT_name
	.long	90                              ; DW_AT_type
	.byte	9                               ; DW_AT_decl_file
	.byte	161                             ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	23                              ; Abbrev [23] 0x74d:0xc DW_TAG_array_type
	.long	1521                            ; DW_AT_type
	.byte	24                              ; Abbrev [24] 0x752:0x6 DW_TAG_subrange_type
	.long	1881                            ; DW_AT_type
	.byte	7                               ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	25                              ; Abbrev [25] 0x759:0x7 DW_TAG_base_type
	.long	860                             ; DW_AT_name
	.byte	8                               ; DW_AT_byte_size
	.byte	7                               ; DW_AT_encoding
	.byte	14                              ; Abbrev [14] 0x760:0x5 DW_TAG_pointer_type
	.long	1893                            ; DW_AT_type
	.byte	2                               ; Abbrev [2] 0x765:0xb DW_TAG_typedef
	.long	83                              ; DW_AT_type
	.long	901                             ; DW_AT_name
	.byte	12                              ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	14                              ; Abbrev [14] 0x770:0x5 DW_TAG_pointer_type
	.long	1909                            ; DW_AT_type
	.byte	2                               ; Abbrev [2] 0x775:0xb DW_TAG_typedef
	.long	1652                            ; DW_AT_type
	.long	936                             ; DW_AT_name
	.byte	9                               ; DW_AT_decl_file
	.byte	188                             ; DW_AT_decl_line
	.byte	14                              ; Abbrev [14] 0x780:0x5 DW_TAG_pointer_type
	.long	1925                            ; DW_AT_type
	.byte	2                               ; Abbrev [2] 0x785:0xb DW_TAG_typedef
	.long	1936                            ; DW_AT_type
	.long	953                             ; DW_AT_name
	.byte	13                              ; DW_AT_decl_file
	.byte	57                              ; DW_AT_decl_line
	.byte	26                              ; Abbrev [26] 0x790:0x5e DW_TAG_structure_type
	.long	964                             ; DW_AT_name
	.short	880                             ; DW_AT_byte_size
	.byte	13                              ; DW_AT_decl_file
	.byte	43                              ; DW_AT_decl_line
	.byte	16                              ; Abbrev [16] 0x799:0xc DW_TAG_member
	.long	982                             ; DW_AT_name
	.long	1293                            ; DW_AT_type
	.byte	13                              ; DW_AT_decl_file
	.byte	45                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x7a5:0xc DW_TAG_member
	.long	993                             ; DW_AT_name
	.long	61                              ; DW_AT_type
	.byte	13                              ; DW_AT_decl_file
	.byte	46                              ; DW_AT_decl_line
	.byte	4                               ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x7b1:0xc DW_TAG_member
	.long	1004                            ; DW_AT_name
	.long	2030                            ; DW_AT_type
	.byte	13                              ; DW_AT_decl_file
	.byte	47                              ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x7bd:0xc DW_TAG_member
	.long	1073                            ; DW_AT_name
	.long	2086                            ; DW_AT_type
	.byte	13                              ; DW_AT_decl_file
	.byte	48                              ; DW_AT_decl_line
	.byte	32                              ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x7c9:0xc DW_TAG_member
	.long	1081                            ; DW_AT_name
	.long	2075                            ; DW_AT_type
	.byte	13                              ; DW_AT_decl_file
	.byte	49                              ; DW_AT_decl_line
	.byte	40                              ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x7d5:0xc DW_TAG_member
	.long	1091                            ; DW_AT_name
	.long	2091                            ; DW_AT_type
	.byte	13                              ; DW_AT_decl_file
	.byte	50                              ; DW_AT_decl_line
	.byte	48                              ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x7e1:0xc DW_TAG_member
	.long	1337                            ; DW_AT_name
	.long	2096                            ; DW_AT_type
	.byte	13                              ; DW_AT_decl_file
	.byte	52                              ; DW_AT_decl_line
	.byte	64                              ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	15                              ; Abbrev [15] 0x7ee:0x2d DW_TAG_structure_type
	.long	1013                            ; DW_AT_name
	.byte	24                              ; DW_AT_byte_size
	.byte	14                              ; DW_AT_decl_file
	.byte	42                              ; DW_AT_decl_line
	.byte	16                              ; Abbrev [16] 0x7f6:0xc DW_TAG_member
	.long	1034                            ; DW_AT_name
	.long	90                              ; DW_AT_type
	.byte	14                              ; DW_AT_decl_file
	.byte	44                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x802:0xc DW_TAG_member
	.long	1040                            ; DW_AT_name
	.long	2075                            ; DW_AT_type
	.byte	14                              ; DW_AT_decl_file
	.byte	45                              ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x80e:0xc DW_TAG_member
	.long	1064                            ; DW_AT_name
	.long	1293                            ; DW_AT_type
	.byte	14                              ; DW_AT_decl_file
	.byte	46                              ; DW_AT_decl_line
	.byte	16                              ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	2                               ; Abbrev [2] 0x81b:0xb DW_TAG_typedef
	.long	1521                            ; DW_AT_type
	.long	1048                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	68                              ; DW_AT_decl_line
	.byte	14                              ; Abbrev [14] 0x826:0x5 DW_TAG_pointer_type
	.long	1936                            ; DW_AT_type
	.byte	14                              ; Abbrev [14] 0x82b:0x5 DW_TAG_pointer_type
	.long	2096                            ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0x830:0x2f DW_TAG_structure_type
	.long	1103                            ; DW_AT_name
	.short	816                             ; DW_AT_byte_size
	.byte	16                              ; DW_AT_decl_file
	.byte	62                              ; DW_AT_decl_line
	.byte	16                              ; Abbrev [16] 0x839:0xc DW_TAG_member
	.long	1123                            ; DW_AT_name
	.long	2143                            ; DW_AT_type
	.byte	16                              ; DW_AT_decl_file
	.byte	64                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x845:0xc DW_TAG_member
	.long	1194                            ; DW_AT_name
	.long	2199                            ; DW_AT_type
	.byte	16                              ; DW_AT_decl_file
	.byte	65                              ; DW_AT_decl_line
	.byte	16                              ; DW_AT_data_member_location
	.byte	27                              ; Abbrev [27] 0x851:0xd DW_TAG_member
	.long	1258                            ; DW_AT_name
	.long	2308                            ; DW_AT_type
	.byte	16                              ; DW_AT_decl_file
	.byte	66                              ; DW_AT_decl_line
	.short	288                             ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	15                              ; Abbrev [15] 0x85f:0x2d DW_TAG_structure_type
	.long	1128                            ; DW_AT_name
	.byte	16                              ; DW_AT_byte_size
	.byte	15                              ; DW_AT_decl_file
	.byte	57                              ; DW_AT_decl_line
	.byte	16                              ; Abbrev [16] 0x867:0xc DW_TAG_member
	.long	1159                            ; DW_AT_name
	.long	2188                            ; DW_AT_type
	.byte	15                              ; DW_AT_decl_file
	.byte	59                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x873:0xc DW_TAG_member
	.long	1176                            ; DW_AT_name
	.long	72                              ; DW_AT_type
	.byte	15                              ; DW_AT_decl_file
	.byte	60                              ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x87f:0xc DW_TAG_member
	.long	1182                            ; DW_AT_name
	.long	72                              ; DW_AT_type
	.byte	15                              ; DW_AT_decl_file
	.byte	61                              ; DW_AT_decl_line
	.byte	12                              ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	2                               ; Abbrev [2] 0x88c:0xb DW_TAG_typedef
	.long	109                             ; DW_AT_type
	.long	1165                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	23                              ; DW_AT_decl_line
	.byte	26                              ; Abbrev [26] 0x897:0x61 DW_TAG_structure_type
	.long	1199                            ; DW_AT_name
	.short	272                             ; DW_AT_byte_size
	.byte	15                              ; DW_AT_decl_file
	.byte	134                             ; DW_AT_decl_line
	.byte	16                              ; Abbrev [16] 0x8a0:0xc DW_TAG_member
	.long	1227                            ; DW_AT_name
	.long	2296                            ; DW_AT_type
	.byte	15                              ; DW_AT_decl_file
	.byte	136                             ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x8ac:0xc DW_TAG_member
	.long	1231                            ; DW_AT_name
	.long	2188                            ; DW_AT_type
	.byte	15                              ; DW_AT_decl_file
	.byte	137                             ; DW_AT_decl_line
	.byte	232                             ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x8b8:0xc DW_TAG_member
	.long	1236                            ; DW_AT_name
	.long	2188                            ; DW_AT_type
	.byte	15                              ; DW_AT_decl_file
	.byte	138                             ; DW_AT_decl_line
	.byte	240                             ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x8c4:0xc DW_TAG_member
	.long	1241                            ; DW_AT_name
	.long	2188                            ; DW_AT_type
	.byte	15                              ; DW_AT_decl_file
	.byte	139                             ; DW_AT_decl_line
	.byte	248                             ; DW_AT_data_member_location
	.byte	27                              ; Abbrev [27] 0x8d0:0xd DW_TAG_member
	.long	1246                            ; DW_AT_name
	.long	2188                            ; DW_AT_type
	.byte	15                              ; DW_AT_decl_file
	.byte	140                             ; DW_AT_decl_line
	.short	256                             ; DW_AT_data_member_location
	.byte	27                              ; Abbrev [27] 0x8dd:0xd DW_TAG_member
	.long	1251                            ; DW_AT_name
	.long	72                              ; DW_AT_type
	.byte	15                              ; DW_AT_decl_file
	.byte	141                             ; DW_AT_decl_line
	.short	264                             ; DW_AT_data_member_location
	.byte	27                              ; Abbrev [27] 0x8ea:0xd DW_TAG_member
	.long	854                             ; DW_AT_name
	.long	72                              ; DW_AT_type
	.byte	15                              ; DW_AT_decl_file
	.byte	142                             ; DW_AT_decl_line
	.short	268                             ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	23                              ; Abbrev [23] 0x8f8:0xc DW_TAG_array_type
	.long	2188                            ; DW_AT_type
	.byte	24                              ; Abbrev [24] 0x8fd:0x6 DW_TAG_subrange_type
	.long	1881                            ; DW_AT_type
	.byte	29                              ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	28                              ; Abbrev [28] 0x904:0x34 DW_TAG_structure_type
	.long	1263                            ; DW_AT_name
	.short	528                             ; DW_AT_byte_size
	.byte	15                              ; DW_AT_decl_file
	.short	441                             ; DW_AT_decl_line
	.byte	18                              ; Abbrev [18] 0x90e:0xd DW_TAG_member
	.long	1289                            ; DW_AT_name
	.long	2360                            ; DW_AT_type
	.byte	15                              ; DW_AT_decl_file
	.short	443                             ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	29                              ; Abbrev [29] 0x91b:0xe DW_TAG_member
	.long	1323                            ; DW_AT_name
	.long	72                              ; DW_AT_type
	.byte	15                              ; DW_AT_decl_file
	.short	444                             ; DW_AT_decl_line
	.short	512                             ; DW_AT_data_member_location
	.byte	29                              ; Abbrev [29] 0x929:0xe DW_TAG_member
	.long	1330                            ; DW_AT_name
	.long	72                              ; DW_AT_type
	.byte	15                              ; DW_AT_decl_file
	.short	445                             ; DW_AT_decl_line
	.short	516                             ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	23                              ; Abbrev [23] 0x938:0xc DW_TAG_array_type
	.long	2372                            ; DW_AT_type
	.byte	24                              ; Abbrev [24] 0x93d:0x6 DW_TAG_subrange_type
	.long	1881                            ; DW_AT_type
	.byte	32                              ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	2                               ; Abbrev [2] 0x944:0xb DW_TAG_typedef
	.long	2383                            ; DW_AT_type
	.long	1293                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	37                              ; DW_AT_decl_line
	.byte	3                               ; Abbrev [3] 0x94f:0x7 DW_TAG_base_type
	.long	1305                            ; DW_AT_name
	.byte	7                               ; DW_AT_encoding
	.byte	16                              ; DW_AT_byte_size
	.byte	2                               ; Abbrev [2] 0x956:0xb DW_TAG_typedef
	.long	2401                            ; DW_AT_type
	.long	1364                            ; DW_AT_name
	.byte	17                              ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	3                               ; Abbrev [3] 0x961:0x7 DW_TAG_base_type
	.long	1372                            ; DW_AT_name
	.byte	8                               ; DW_AT_encoding
	.byte	1                               ; DW_AT_byte_size
	.byte	14                              ; Abbrev [14] 0x968:0x5 DW_TAG_pointer_type
	.long	2413                            ; DW_AT_type
	.byte	30                              ; Abbrev [30] 0x96d:0xb DW_TAG_subroutine_type
	.long	98                              ; DW_AT_type
                                        ; DW_AT_prototyped
	.byte	21                              ; Abbrev [21] 0x972:0x5 DW_TAG_formal_parameter
	.long	98                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"Apple clang version 12.0.5 (clang-1205.0.22.9)" ; string offset=0
	.asciz	"ptime.c"                       ; string offset=47
	.asciz	"/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk" ; string offset=55
	.asciz	"MacOSX.sdk"                    ; string offset=150
	.asciz	"/Users/xss/code"               ; string offset=161
	.asciz	"sigset_t"                      ; string offset=177
	.asciz	"__darwin_sigset_t"             ; string offset=186
	.asciz	"__uint32_t"                    ; string offset=204
	.asciz	"unsigned int"                  ; string offset=215
	.asciz	"double"                        ; string offset=228
	.asciz	"uint64_t"                      ; string offset=235
	.asciz	"long long unsigned int"        ; string offset=244
	.asciz	"read_sprr"                     ; string offset=267
	.asciz	"main"                          ; string offset=277
	.asciz	"bus_handler"                   ; string offset=282
	.asciz	"sev_handler"                   ; string offset=294
	.asciz	"write_sprr_perm"               ; string offset=306
	.asciz	"sprr_test"                     ; string offset=322
	.asciz	"make_sprr_val"                 ; string offset=332
	.asciz	"read_sprr_perm"                ; string offset=346
	.asciz	"can_read"                      ; string offset=361
	.asciz	"can_write"                     ; string offset=370
	.asciz	"can_exec"                      ; string offset=380
	.asciz	"int"                           ; string offset=389
	.asciz	"_Bool"                         ; string offset=393
	.asciz	"v"                             ; string offset=399
	.asciz	"argc"                          ; string offset=401
	.asciz	"argv"                          ; string offset=406
	.asciz	"char"                          ; string offset=411
	.asciz	"hours"                         ; string offset=416
	.asciz	"minutes"                       ; string offset=422
	.asciz	"seconds"                       ; string offset=430
	.asciz	"day"                           ; string offset=438
	.asciz	"month"                         ; string offset=442
	.asciz	"year"                          ; string offset=448
	.asciz	"now"                           ; string offset=453
	.asciz	"time_t"                        ; string offset=457
	.asciz	"__darwin_time_t"               ; string offset=464
	.asciz	"long int"                      ; string offset=480
	.asciz	"local"                         ; string offset=489
	.asciz	"tm"                            ; string offset=495
	.asciz	"tm_sec"                        ; string offset=498
	.asciz	"tm_min"                        ; string offset=505
	.asciz	"tm_hour"                       ; string offset=512
	.asciz	"tm_mday"                       ; string offset=520
	.asciz	"tm_mon"                        ; string offset=528
	.asciz	"tm_year"                       ; string offset=535
	.asciz	"tm_wday"                       ; string offset=543
	.asciz	"tm_yday"                       ; string offset=551
	.asciz	"tm_isdst"                      ; string offset=559
	.asciz	"tm_gmtoff"                     ; string offset=568
	.asciz	"tm_zone"                       ; string offset=578
	.asciz	"start"                         ; string offset=586
	.asciz	"clock_t"                       ; string offset=592
	.asciz	"__darwin_clock_t"              ; string offset=600
	.asciz	"long unsigned int"             ; string offset=617
	.asciz	"sa"                            ; string offset=635
	.asciz	"sigaction"                     ; string offset=638
	.asciz	"__sigaction_u"                 ; string offset=648
	.asciz	"__sa_handler"                  ; string offset=662
	.asciz	"__sa_sigaction"                ; string offset=675
	.asciz	"__siginfo"                     ; string offset=690
	.asciz	"si_signo"                      ; string offset=700
	.asciz	"si_errno"                      ; string offset=709
	.asciz	"si_code"                       ; string offset=718
	.asciz	"si_pid"                        ; string offset=726
	.asciz	"pid_t"                         ; string offset=733
	.asciz	"__darwin_pid_t"                ; string offset=739
	.asciz	"__int32_t"                     ; string offset=754
	.asciz	"si_uid"                        ; string offset=764
	.asciz	"uid_t"                         ; string offset=771
	.asciz	"__darwin_uid_t"                ; string offset=777
	.asciz	"si_status"                     ; string offset=792
	.asciz	"si_addr"                       ; string offset=802
	.asciz	"si_value"                      ; string offset=810
	.asciz	"sigval"                        ; string offset=819
	.asciz	"sival_int"                     ; string offset=826
	.asciz	"sival_ptr"                     ; string offset=836
	.asciz	"si_band"                       ; string offset=846
	.asciz	"__pad"                         ; string offset=854
	.asciz	"__ARRAY_SIZE_TYPE__"           ; string offset=860
	.asciz	"sa_mask"                       ; string offset=880
	.asciz	"sa_flags"                      ; string offset=888
	.asciz	"ptr"                           ; string offset=897
	.asciz	"uint32_t"                      ; string offset=901
	.asciz	"i"                             ; string offset=910
	.asciz	"stop"                          ; string offset=912
	.asciz	"elapsed"                       ; string offset=917
	.asciz	"signo"                         ; string offset=925
	.asciz	"info"                          ; string offset=931
	.asciz	"siginfo_t"                     ; string offset=936
	.asciz	"cx_"                           ; string offset=946
	.asciz	"cx"                            ; string offset=950
	.asciz	"ucontext_t"                    ; string offset=953
	.asciz	"__darwin_ucontext"             ; string offset=964
	.asciz	"uc_onstack"                    ; string offset=982
	.asciz	"uc_sigmask"                    ; string offset=993
	.asciz	"uc_stack"                      ; string offset=1004
	.asciz	"__darwin_sigaltstack"          ; string offset=1013
	.asciz	"ss_sp"                         ; string offset=1034
	.asciz	"ss_size"                       ; string offset=1040
	.asciz	"__darwin_size_t"               ; string offset=1048
	.asciz	"ss_flags"                      ; string offset=1064
	.asciz	"uc_link"                       ; string offset=1073
	.asciz	"uc_mcsize"                     ; string offset=1081
	.asciz	"uc_mcontext"                   ; string offset=1091
	.asciz	"__darwin_mcontext64"           ; string offset=1103
	.asciz	"__es"                          ; string offset=1123
	.asciz	"__darwin_arm_exception_state64" ; string offset=1128
	.asciz	"__far"                         ; string offset=1159
	.asciz	"__uint64_t"                    ; string offset=1165
	.asciz	"__esr"                         ; string offset=1176
	.asciz	"__exception"                   ; string offset=1182
	.asciz	"__ss"                          ; string offset=1194
	.asciz	"__darwin_arm_thread_state64"   ; string offset=1199
	.asciz	"__x"                           ; string offset=1227
	.asciz	"__fp"                          ; string offset=1231
	.asciz	"__lr"                          ; string offset=1236
	.asciz	"__sp"                          ; string offset=1241
	.asciz	"__pc"                          ; string offset=1246
	.asciz	"__cpsr"                        ; string offset=1251
	.asciz	"__ns"                          ; string offset=1258
	.asciz	"__darwin_arm_neon_state64"     ; string offset=1263
	.asciz	"__v"                           ; string offset=1289
	.asciz	"__uint128_t"                   ; string offset=1293
	.asciz	"unsigned __int128"             ; string offset=1305
	.asciz	"__fpsr"                        ; string offset=1323
	.asciz	"__fpcr"                        ; string offset=1330
	.asciz	"__mcontext_data"               ; string offset=1337
	.asciz	"a"                             ; string offset=1353
	.asciz	"b"                             ; string offset=1355
	.asciz	"nibble"                        ; string offset=1357
	.asciz	"uint8_t"                       ; string offset=1364
	.asciz	"unsigned char"                 ; string offset=1372
	.asciz	"res"                           ; string offset=1386
	.asciz	"fun_ptr"                       ; string offset=1390
	.section	__DWARF,__apple_names,regular,debug
Lnames_begin:
	.long	1212240712                      ; Header Magic
	.short	1                               ; Header Version
	.short	0                               ; Header Hash Function
	.long	11                              ; Header Bucket Count
	.long	11                              ; Header Hash Count
	.long	12                              ; Header Data Length
	.long	0                               ; HeaderData Die Offset Base
	.long	1                               ; HeaderData Atom Count
	.short	1                               ; DW_ATOM_die_offset
	.short	6                               ; DW_FORM_data4
	.long	-1                              ; Bucket 0
	.long	-1                              ; Bucket 1
	.long	-1                              ; Bucket 2
	.long	-1                              ; Bucket 3
	.long	0                               ; Bucket 4
	.long	1                               ; Bucket 5
	.long	2                               ; Bucket 6
	.long	3                               ; Bucket 7
	.long	7                               ; Bucket 8
	.long	9                               ; Bucket 9
	.long	-1                              ; Bucket 10
	.long	33327980                        ; Hash in Bucket 4
	.long	-994525399                      ; Hash in Bucket 5
	.long	-81525013                       ; Hash in Bucket 6
	.long	193043803                       ; Hash in Bucket 7
	.long	2090499946                      ; Hash in Bucket 7
	.long	-321079206                      ; Hash in Bucket 7
	.long	-101657168                      ; Hash in Bucket 7
	.long	193490162                       ; Hash in Bucket 8
	.long	579653863                       ; Hash in Bucket 8
	.long	905971691                       ; Hash in Bucket 9
	.long	2096614177                      ; Hash in Bucket 9
.set Lset17, LNames5-Lnames_begin       ; Offset in Bucket 4
	.long	Lset17
.set Lset18, LNames2-Lnames_begin       ; Offset in Bucket 5
	.long	Lset18
.set Lset19, LNames4-Lnames_begin       ; Offset in Bucket 6
	.long	Lset19
.set Lset20, LNames0-Lnames_begin       ; Offset in Bucket 7
	.long	Lset20
.set Lset21, LNames3-Lnames_begin       ; Offset in Bucket 7
	.long	Lset21
.set Lset22, LNames6-Lnames_begin       ; Offset in Bucket 7
	.long	Lset22
.set Lset23, LNames8-Lnames_begin       ; Offset in Bucket 7
	.long	Lset23
.set Lset24, LNames10-Lnames_begin      ; Offset in Bucket 8
	.long	Lset24
.set Lset25, LNames1-Lnames_begin       ; Offset in Bucket 8
	.long	Lset25
.set Lset26, LNames7-Lnames_begin       ; Offset in Bucket 9
	.long	Lset26
.set Lset27, LNames9-Lnames_begin       ; Offset in Bucket 9
	.long	Lset27
LNames5:
	.long	282                             ; bus_handler
	.long	1                               ; Num DIEs
	.long	431
	.long	0
LNames2:
	.long	306                             ; write_sprr_perm
	.long	1                               ; Num DIEs
	.long	587
	.long	0
LNames4:
	.long	322                             ; sprr_test
	.long	1                               ; Num DIEs
	.long	665
	.long	0
LNames0:
	.long	380                             ; can_exec
	.long	1                               ; Num DIEs
	.long	1183
	.long	0
LNames3:
	.long	277                             ; main
	.long	1                               ; Num DIEs
	.long	156
	.long	0
LNames6:
	.long	346                             ; read_sprr_perm
	.long	1                               ; Num DIEs
	.long	909
	.long	0
LNames8:
	.long	294                             ; sev_handler
	.long	1                               ; Num DIEs
	.long	509
	.long	0
LNames10:
	.long	361                             ; can_read
	.long	1                               ; Num DIEs
	.long	991
	.long	0
LNames1:
	.long	267                             ; read_sprr
	.long	1                               ; Num DIEs
	.long	116
	.long	0
LNames7:
	.long	332                             ; make_sprr_val
	.long	1                               ; Num DIEs
	.long	785
	.long	0
LNames9:
	.long	370                             ; can_write
	.long	1                               ; Num DIEs
	.long	1087
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
	.long	21                              ; Header Bucket Count
	.long	42                              ; Header Hash Count
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
	.long	1                               ; Bucket 1
	.long	4                               ; Bucket 2
	.long	6                               ; Bucket 3
	.long	9                               ; Bucket 4
	.long	12                              ; Bucket 5
	.long	15                              ; Bucket 6
	.long	-1                              ; Bucket 7
	.long	19                              ; Bucket 8
	.long	-1                              ; Bucket 9
	.long	-1                              ; Bucket 10
	.long	-1                              ; Bucket 11
	.long	21                              ; Bucket 12
	.long	22                              ; Bucket 13
	.long	24                              ; Bucket 14
	.long	27                              ; Bucket 15
	.long	28                              ; Bucket 16
	.long	32                              ; Bucket 17
	.long	34                              ; Bucket 18
	.long	35                              ; Bucket 19
	.long	39                              ; Bucket 20
	.long	177647526                       ; Hash in Bucket 0
	.long	276790522                       ; Hash in Bucket 1
	.long	1771224946                      ; Hash in Bucket 1
	.long	-243996567                      ; Hash in Bucket 1
	.long	-2056763333                     ; Hash in Bucket 2
	.long	-1571268449                     ; Hash in Bucket 2
	.long	461127873                       ; Hash in Bucket 3
	.long	843871857                       ; Hash in Bucket 3
	.long	1950534918                      ; Hash in Bucket 3
	.long	789719536                       ; Hash in Bucket 4
	.long	-863830716                      ; Hash in Bucket 4
	.long	-113419488                      ; Hash in Bucket 4
	.long	290821634                       ; Hash in Bucket 5
	.long	688950281                       ; Hash in Bucket 5
	.long	2090147939                      ; Hash in Bucket 5
	.long	505346631                       ; Hash in Bucket 6
	.long	897561888                       ; Hash in Bucket 6
	.long	-1880351968                     ; Hash in Bucket 6
	.long	-627816040                      ; Hash in Bucket 6
	.long	1175294177                      ; Hash in Bucket 8
	.long	-594775205                      ; Hash in Bucket 8
	.long	89027496                        ; Hash in Bucket 12
	.long	-547304637                      ; Hash in Bucket 13
	.long	-282664779                      ; Hash in Bucket 13
	.long	249311216                       ; Hash in Bucket 14
	.long	290711645                       ; Hash in Bucket 14
	.long	-2056653344                     ; Hash in Bucket 14
	.long	255285318                       ; Hash in Bucket 15
	.long	5863846                         ; Hash in Bucket 16
	.long	466014187                       ; Hash in Bucket 16
	.long	679906663                       ; Hash in Bucket 16
	.long	-142298025                      ; Hash in Bucket 16
	.long	193495088                       ; Hash in Bucket 17
	.long	1835292518                      ; Hash in Bucket 17
	.long	580916487                       ; Hash in Bucket 18
	.long	270860917                       ; Hash in Bucket 19
	.long	-1263457614                     ; Hash in Bucket 19
	.long	-136368420                      ; Hash in Bucket 19
	.long	-69895251                       ; Hash in Bucket 19
	.long	-1304652851                     ; Hash in Bucket 20
	.long	-104093792                      ; Hash in Bucket 20
	.long	-80380739                       ; Hash in Bucket 20
.set Lset28, Ltypes28-Ltypes_begin      ; Offset in Bucket 0
	.long	Lset28
.set Lset29, Ltypes13-Ltypes_begin      ; Offset in Bucket 1
	.long	Lset29
.set Lset30, Ltypes7-Ltypes_begin       ; Offset in Bucket 1
	.long	Lset30
.set Lset31, Ltypes3-Ltypes_begin       ; Offset in Bucket 1
	.long	Lset31
.set Lset32, Ltypes34-Ltypes_begin      ; Offset in Bucket 2
	.long	Lset32
.set Lset33, Ltypes17-Ltypes_begin      ; Offset in Bucket 2
	.long	Lset33
.set Lset34, Ltypes41-Ltypes_begin      ; Offset in Bucket 3
	.long	Lset34
.set Lset35, Ltypes9-Ltypes_begin       ; Offset in Bucket 3
	.long	Lset35
.set Lset36, Ltypes30-Ltypes_begin      ; Offset in Bucket 3
	.long	Lset36
.set Lset37, Ltypes8-Ltypes_begin       ; Offset in Bucket 4
	.long	Lset37
.set Lset38, Ltypes21-Ltypes_begin      ; Offset in Bucket 4
	.long	Lset38
.set Lset39, Ltypes19-Ltypes_begin      ; Offset in Bucket 4
	.long	Lset39
.set Lset40, Ltypes39-Ltypes_begin      ; Offset in Bucket 5
	.long	Lset40
.set Lset41, Ltypes25-Ltypes_begin      ; Offset in Bucket 5
	.long	Lset41
.set Lset42, Ltypes20-Ltypes_begin      ; Offset in Bucket 5
	.long	Lset42
.set Lset43, Ltypes1-Ltypes_begin       ; Offset in Bucket 6
	.long	Lset43
.set Lset44, Ltypes37-Ltypes_begin      ; Offset in Bucket 6
	.long	Lset44
.set Lset45, Ltypes18-Ltypes_begin      ; Offset in Bucket 6
	.long	Lset45
.set Lset46, Ltypes33-Ltypes_begin      ; Offset in Bucket 6
	.long	Lset46
.set Lset47, Ltypes38-Ltypes_begin      ; Offset in Bucket 8
	.long	Lset47
.set Lset48, Ltypes35-Ltypes_begin      ; Offset in Bucket 8
	.long	Lset48
.set Lset49, Ltypes2-Ltypes_begin       ; Offset in Bucket 12
	.long	Lset49
.set Lset50, Ltypes36-Ltypes_begin      ; Offset in Bucket 13
	.long	Lset50
.set Lset51, Ltypes11-Ltypes_begin      ; Offset in Bucket 13
	.long	Lset51
.set Lset52, Ltypes6-Ltypes_begin       ; Offset in Bucket 14
	.long	Lset52
.set Lset53, Ltypes16-Ltypes_begin      ; Offset in Bucket 14
	.long	Lset53
.set Lset54, Ltypes26-Ltypes_begin      ; Offset in Bucket 14
	.long	Lset54
.set Lset55, Ltypes32-Ltypes_begin      ; Offset in Bucket 15
	.long	Lset55
.set Lset56, Ltypes22-Ltypes_begin      ; Offset in Bucket 16
	.long	Lset56
.set Lset57, Ltypes27-Ltypes_begin      ; Offset in Bucket 16
	.long	Lset57
.set Lset58, Ltypes23-Ltypes_begin      ; Offset in Bucket 16
	.long	Lset58
.set Lset59, Ltypes12-Ltypes_begin      ; Offset in Bucket 16
	.long	Lset59
.set Lset60, Ltypes5-Ltypes_begin       ; Offset in Bucket 17
	.long	Lset60
.set Lset61, Ltypes0-Ltypes_begin       ; Offset in Bucket 17
	.long	Lset61
.set Lset62, Ltypes24-Ltypes_begin      ; Offset in Bucket 18
	.long	Lset62
.set Lset63, Ltypes10-Ltypes_begin      ; Offset in Bucket 19
	.long	Lset63
.set Lset64, Ltypes31-Ltypes_begin      ; Offset in Bucket 19
	.long	Lset64
.set Lset65, Ltypes14-Ltypes_begin      ; Offset in Bucket 19
	.long	Lset65
.set Lset66, Ltypes29-Ltypes_begin      ; Offset in Bucket 19
	.long	Lset66
.set Lset67, Ltypes4-Ltypes_begin       ; Offset in Bucket 20
	.long	Lset67
.set Lset68, Ltypes40-Ltypes_begin      ; Offset in Bucket 20
	.long	Lset68
.set Lset69, Ltypes15-Ltypes_begin      ; Offset in Bucket 20
	.long	Lset69
Ltypes28:
	.long	600                             ; __darwin_clock_t
	.long	1                               ; Num DIEs
	.long	1510
	.short	22
	.byte	0
	.long	0
Ltypes13:
	.long	771                             ; uid_t
	.long	1                               ; Num DIEs
	.long	1814
	.short	22
	.byte	0
	.long	0
Ltypes7:
	.long	690                             ; __siginfo
	.long	1                               ; Num DIEs
	.long	1652
	.short	19
	.byte	0
	.long	0
Ltypes3:
	.long	464                             ; __darwin_time_t
	.long	1                               ; Num DIEs
	.long	1335
	.short	22
	.byte	0
	.long	0
Ltypes34:
	.long	204                             ; __uint32_t
	.long	1                               ; Num DIEs
	.long	72
	.short	22
	.byte	0
	.long	0
Ltypes17:
	.long	1128                            ; __darwin_arm_exception_state64
	.long	1                               ; Num DIEs
	.long	2143
	.short	19
	.byte	0
	.long	0
Ltypes41:
	.long	1013                            ; __darwin_sigaltstack
	.long	1                               ; Num DIEs
	.long	2030
	.short	19
	.byte	0
	.long	0
Ltypes9:
	.long	1293                            ; __uint128_t
	.long	1                               ; Num DIEs
	.long	2372
	.short	22
	.byte	0
	.long	0
Ltypes30:
	.long	754                             ; __int32_t
	.long	1                               ; Num DIEs
	.long	1803
	.short	22
	.byte	0
	.long	0
Ltypes8:
	.long	1364                            ; uint8_t
	.long	1                               ; Num DIEs
	.long	2390
	.short	22
	.byte	0
	.long	0
Ltypes21:
	.long	592                             ; clock_t
	.long	1                               ; Num DIEs
	.long	1499
	.short	22
	.byte	0
	.long	0
Ltypes19:
	.long	228                             ; double
	.long	1                               ; Num DIEs
	.long	91
	.short	36
	.byte	0
	.long	0
Ltypes39:
	.long	235                             ; uint64_t
	.long	1                               ; Num DIEs
	.long	98
	.short	22
	.byte	0
	.long	0
Ltypes25:
	.long	186                             ; __darwin_sigset_t
	.long	1                               ; Num DIEs
	.long	61
	.short	22
	.byte	0
	.long	0
Ltypes20:
	.long	411                             ; char
	.long	1                               ; Num DIEs
	.long	1317
	.short	36
	.byte	0
	.long	0
Ltypes1:
	.long	457                             ; time_t
	.long	1                               ; Num DIEs
	.long	1324
	.short	22
	.byte	0
	.long	0
Ltypes37:
	.long	1263                            ; __darwin_arm_neon_state64
	.long	1                               ; Num DIEs
	.long	2308
	.short	19
	.byte	0
	.long	0
Ltypes18:
	.long	480                             ; long int
	.long	1                               ; Num DIEs
	.long	1346
	.short	36
	.byte	0
	.long	0
Ltypes33:
	.long	648                             ; __sigaction_u
	.long	1                               ; Num DIEs
	.long	1577
	.short	23
	.byte	0
	.long	0
Ltypes38:
	.long	964                             ; __darwin_ucontext
	.long	1                               ; Num DIEs
	.long	1936
	.short	19
	.byte	0
	.long	0
Ltypes35:
	.long	860                             ; __ARRAY_SIZE_TYPE__
	.long	1                               ; Num DIEs
	.long	1881
	.short	36
	.byte	0
	.long	0
Ltypes2:
	.long	1199                            ; __darwin_arm_thread_state64
	.long	1                               ; Num DIEs
	.long	2199
	.short	19
	.byte	0
	.long	0
Ltypes36:
	.long	1103                            ; __darwin_mcontext64
	.long	1                               ; Num DIEs
	.long	2096
	.short	19
	.byte	0
	.long	0
Ltypes11:
	.long	1048                            ; __darwin_size_t
	.long	1                               ; Num DIEs
	.long	2075
	.short	22
	.byte	0
	.long	0
Ltypes6:
	.long	393                             ; _Bool
	.long	1                               ; Num DIEs
	.long	1300
	.short	36
	.byte	0
	.long	0
Ltypes16:
	.long	901                             ; uint32_t
	.long	1                               ; Num DIEs
	.long	1893
	.short	22
	.byte	0
	.long	0
Ltypes26:
	.long	1165                            ; __uint64_t
	.long	1                               ; Num DIEs
	.long	2188
	.short	22
	.byte	0
	.long	0
Ltypes32:
	.long	638                             ; sigaction
	.long	1                               ; Num DIEs
	.long	1528
	.short	19
	.byte	0
	.long	0
Ltypes22:
	.long	495                             ; tm
	.long	1                               ; Num DIEs
	.long	1358
	.short	19
	.byte	0
	.long	0
Ltypes27:
	.long	819                             ; sigval
	.long	1                               ; Num DIEs
	.long	1836
	.short	23
	.byte	0
	.long	0
Ltypes23:
	.long	177                             ; sigset_t
	.long	1                               ; Num DIEs
	.long	50
	.short	22
	.byte	0
	.long	0
Ltypes12:
	.long	739                             ; __darwin_pid_t
	.long	1                               ; Num DIEs
	.long	1792
	.short	22
	.byte	0
	.long	0
Ltypes5:
	.long	389                             ; int
	.long	1                               ; Num DIEs
	.long	1293
	.short	36
	.byte	0
	.long	0
Ltypes0:
	.long	1305                            ; unsigned __int128
	.long	1                               ; Num DIEs
	.long	2383
	.short	36
	.byte	0
	.long	0
Ltypes24:
	.long	936                             ; siginfo_t
	.long	1                               ; Num DIEs
	.long	1909
	.short	22
	.byte	0
	.long	0
Ltypes10:
	.long	733                             ; pid_t
	.long	1                               ; Num DIEs
	.long	1781
	.short	22
	.byte	0
	.long	0
Ltypes31:
	.long	953                             ; ucontext_t
	.long	1                               ; Num DIEs
	.long	1925
	.short	22
	.byte	0
	.long	0
Ltypes14:
	.long	777                             ; __darwin_uid_t
	.long	1                               ; Num DIEs
	.long	1825
	.short	22
	.byte	0
	.long	0
Ltypes29:
	.long	244                             ; long long unsigned int
	.long	1                               ; Num DIEs
	.long	109
	.short	36
	.byte	0
	.long	0
Ltypes4:
	.long	215                             ; unsigned int
	.long	1                               ; Num DIEs
	.long	83
	.short	36
	.byte	0
	.long	0
Ltypes40:
	.long	1372                            ; unsigned char
	.long	1                               ; Num DIEs
	.long	2401
	.short	36
	.byte	0
	.long	0
Ltypes15:
	.long	617                             ; long unsigned int
	.long	1                               ; Num DIEs
	.long	1521
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
