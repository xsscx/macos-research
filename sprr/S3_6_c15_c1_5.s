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
	.loc	5 183 0                         ; ptime.c:183:0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16                     ; =16
	.cfi_def_cfa_offset 16
Ltmp1:
	.loc	5 189 5 prologue_end            ; ptime.c:189:5
	; InlineAsm Start
	isb
	mrs	x8, S3_6_C15_C1_5

	; InlineAsm End
	str	x8, [sp, #8]
	.loc	5 196 12                        ; ptime.c:196:12
	ldr	x0, [sp, #8]
	.loc	5 196 5 is_stmt 0               ; ptime.c:196:5
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
	.loc	5 200 0 is_stmt 1               ; ptime.c:200:0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #272                    ; =272
	stp	x28, x27, [sp, #240]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #256]            ; 16-byte Folded Spill
	add	x29, sp, #256                   ; =256
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w27, -24
	.cfi_offset w28, -32
	stur	wzr, [x29, #-20]
	stur	w0, [x29, #-24]
	stur	x1, [x29, #-32]
Ltmp3:
	.loc	5 0 0 prologue_end              ; ptime.c:0:0
	adrp	x8, l_.str@PAGE
	add	x8, x8, l_.str@PAGEOFF
	.loc	5 201 5                         ; ptime.c:201:5
	mov	x0, x8
	str	x8, [sp, #120]                  ; 8-byte Folded Spill
	bl	_printf
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.1@PAGE
	add	x8, x8, l_.str.1@PAGEOFF
	.loc	5 202 5 is_stmt 1               ; ptime.c:202:5
	mov	x0, x8
	bl	_printf
	ldr	x8, [sp, #120]                  ; 8-byte Folded Reload
	.loc	5 203 5                         ; ptime.c:203:5
	mov	x0, x8
	bl	_printf
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.2@PAGE
	add	x8, x8, l_.str.2@PAGEOFF
	.loc	5 205 5 is_stmt 1               ; ptime.c:205:5
	mov	x0, x8
	bl	_printf
	sub	x8, x29, #64                    ; =64
	.loc	5 220 5                         ; ptime.c:220:5
	mov	x0, x8
	str	x8, [sp, #112]                  ; 8-byte Folded Spill
	bl	_time
	ldr	x8, [sp, #112]                  ; 8-byte Folded Reload
	.loc	5 224 39                        ; ptime.c:224:39
	mov	x0, x8
	bl	_ctime
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.3@PAGE
	add	x8, x8, l_.str.3@PAGEOFF
	str	x0, [sp, #104]                  ; 8-byte Folded Spill
	.loc	5 224 5                         ; ptime.c:224:5
	mov	x0, x8
	mov	x8, sp
	ldr	x9, [sp, #104]                  ; 8-byte Folded Reload
	str	x9, [x8]
	bl	_printf
	ldr	x8, [sp, #112]                  ; 8-byte Folded Reload
	.loc	5 229 24 is_stmt 1              ; ptime.c:229:24
	mov	x0, x8
	bl	_localtime
	.loc	5 229 16 is_stmt 0              ; ptime.c:229:16
	stur	x0, [x29, #-72]
	.loc	5 231 13 is_stmt 1              ; ptime.c:231:13
	ldur	x8, [x29, #-72]
	.loc	5 231 20 is_stmt 0              ; ptime.c:231:20
	ldr	w10, [x8, #8]
	.loc	5 231 11                        ; ptime.c:231:11
	stur	w10, [x29, #-36]
	.loc	5 232 15 is_stmt 1              ; ptime.c:232:15
	ldur	x8, [x29, #-72]
	.loc	5 232 22 is_stmt 0              ; ptime.c:232:22
	ldr	w10, [x8, #4]
	.loc	5 232 13                        ; ptime.c:232:13
	stur	w10, [x29, #-40]
	.loc	5 233 15 is_stmt 1              ; ptime.c:233:15
	ldur	x8, [x29, #-72]
	.loc	5 233 22 is_stmt 0              ; ptime.c:233:22
	ldr	w10, [x8]
	.loc	5 233 13                        ; ptime.c:233:13
	stur	w10, [x29, #-44]
	.loc	5 235 11 is_stmt 1              ; ptime.c:235:11
	ldur	x8, [x29, #-72]
	.loc	5 235 18 is_stmt 0              ; ptime.c:235:18
	ldr	w10, [x8, #12]
	.loc	5 235 9                         ; ptime.c:235:9
	stur	w10, [x29, #-48]
	.loc	5 236 13 is_stmt 1              ; ptime.c:236:13
	ldur	x8, [x29, #-72]
	.loc	5 236 20 is_stmt 0              ; ptime.c:236:20
	ldr	w10, [x8, #16]
	.loc	5 236 27                        ; ptime.c:236:27
	add	w10, w10, #1                    ; =1
	.loc	5 236 11                        ; ptime.c:236:11
	stur	w10, [x29, #-52]
	.loc	5 237 12 is_stmt 1              ; ptime.c:237:12
	ldur	x8, [x29, #-72]
	.loc	5 237 19 is_stmt 0              ; ptime.c:237:19
	ldr	w10, [x8, #20]
	.loc	5 237 27                        ; ptime.c:237:27
	add	w10, w10, #1900                 ; =1900
	.loc	5 237 10                        ; ptime.c:237:10
	stur	w10, [x29, #-56]
	.loc	5 240 49 is_stmt 1              ; ptime.c:240:49
	ldur	w10, [x29, #-48]
                                        ; implicit-def: $x0
	mov	x0, x10
	.loc	5 240 54 is_stmt 0              ; ptime.c:240:54
	ldur	w10, [x29, #-52]
                                        ; implicit-def: $x1
	mov	x1, x10
	.loc	5 240 61                        ; ptime.c:240:61
	ldur	w10, [x29, #-56]
                                        ; implicit-def: $x2
	mov	x2, x10
	.loc	5 0 0                           ; ptime.c:0:0
	adrp	x8, l_.str.4@PAGE
	add	x8, x8, l_.str.4@PAGEOFF
	str	x0, [sp, #96]                   ; 8-byte Folded Spill
	.loc	5 240 5                         ; ptime.c:240:5
	mov	x0, x8
	mov	x8, sp
	ldr	x9, [sp, #96]                   ; 8-byte Folded Reload
	str	x9, [x8]
	str	x1, [x8, #8]
	str	x2, [x8, #16]
	bl	_printf
Ltmp4:
	.loc	5 242 9 is_stmt 1               ; ptime.c:242:9
	ldur	w10, [x29, #-36]
Ltmp5:
	.loc	5 242 9 is_stmt 0               ; ptime.c:242:9
	cmp	w10, #12                        ; =12
	b.ge	LBB1_2
; %bb.1:
Ltmp6:
	.loc	5 243 57 is_stmt 1              ; ptime.c:243:57
	ldur	w8, [x29, #-36]
                                        ; implicit-def: $x0
	mov	x0, x8
	.loc	5 243 64 is_stmt 0              ; ptime.c:243:64
	ldur	w8, [x29, #-40]
                                        ; implicit-def: $x1
	mov	x1, x8
	.loc	5 243 73                        ; ptime.c:243:73
	ldur	w8, [x29, #-44]
                                        ; implicit-def: $x2
	mov	x2, x8
	.loc	5 0 0                           ; ptime.c:0:0
	adrp	x9, l_.str.5@PAGE
	add	x9, x9, l_.str.5@PAGEOFF
	str	x0, [sp, #88]                   ; 8-byte Folded Spill
	.loc	5 243 9                         ; ptime.c:243:9
	mov	x0, x9
	mov	x9, sp
	ldr	x10, [sp, #88]                  ; 8-byte Folded Reload
	str	x10, [x9]
	str	x1, [x9, #8]
	str	x2, [x9, #16]
	bl	_printf
	.loc	5 244 5 is_stmt 1               ; ptime.c:244:5
	b	LBB1_3
Ltmp7:
LBB1_2:
	.loc	5 246 57                        ; ptime.c:246:57
	ldur	w8, [x29, #-36]
	.loc	5 246 63 is_stmt 0              ; ptime.c:246:63
	subs	w8, w8, #12                     ; =12
	.loc	5 246 69                        ; ptime.c:246:69
	ldur	w9, [x29, #-40]
                                        ; implicit-def: $x0
	mov	x0, x9
	.loc	5 246 78                        ; ptime.c:246:78
	ldur	w9, [x29, #-44]
                                        ; implicit-def: $x1
	mov	x1, x9
	.loc	5 0 0                           ; ptime.c:0:0
	adrp	x10, l_.str.6@PAGE
	add	x10, x10, l_.str.6@PAGEOFF
	str	x0, [sp, #80]                   ; 8-byte Folded Spill
	.loc	5 246 9                         ; ptime.c:246:9
	mov	x0, x10
	mov	x10, sp
                                        ; implicit-def: $x2
	mov	x2, x8
	str	x2, [x10]
	ldr	x11, [sp, #80]                  ; 8-byte Folded Reload
	str	x11, [x10, #8]
	str	x1, [x10, #16]
	bl	_printf
Ltmp8:
LBB1_3:
	.loc	5 0 0                           ; ptime.c:0:0
	adrp	x0, l_.str.7@PAGE
	add	x0, x0, l_.str.7@PAGEOFF
	.loc	5 249 5 is_stmt 1               ; ptime.c:249:5
	bl	_printf
	.loc	5 251 21                        ; ptime.c:251:21
	bl	_clock
	.loc	5 251 13 is_stmt 0              ; ptime.c:251:13
	stur	x0, [x29, #-80]
	.loc	5 0 0                           ; ptime.c:0:0
	adrp	x0, l_.str.8@PAGE
	add	x0, x0, l_.str.8@PAGEOFF
	.loc	5 255 5 is_stmt 1               ; ptime.c:255:5
	bl	_printf
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.9@PAGE
	add	x8, x8, l_.str.9@PAGEOFF
	.loc	5 257 5 is_stmt 1               ; ptime.c:257:5
	mov	x0, x8
	bl	_printf
	sub	x8, x29, #96                    ; =96
	mov	w9, #-1
	.loc	5 258 5                         ; ptime.c:258:5
	stur	w9, [x29, #-88]
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x10, l_.str.10@PAGE
	add	x10, x10, l_.str.10@PAGEOFF
	.loc	5 259 5 is_stmt 1               ; ptime.c:259:5
	mov	x0, x10
	str	x8, [sp, #72]                   ; 8-byte Folded Spill
	str	w9, [sp, #68]                   ; 4-byte Folded Spill
	bl	_printf
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, _bus_handler@PAGE
	add	x8, x8, _bus_handler@PAGEOFF
	.loc	5 260 21 is_stmt 1              ; ptime.c:260:21
	stur	x8, [x29, #-96]
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.11@PAGE
	add	x8, x8, l_.str.11@PAGEOFF
	.loc	5 261 5 is_stmt 1               ; ptime.c:261:5
	mov	x0, x8
	bl	_printf
	mov	w9, #66
	.loc	5 262 17                        ; ptime.c:262:17
	stur	w9, [x29, #-84]
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.12@PAGE
	add	x8, x8, l_.str.12@PAGEOFF
	.loc	5 263 5 is_stmt 1               ; ptime.c:263:5
	mov	x0, x8
	bl	_printf
	mov	w9, #10
	.loc	5 264 5                         ; ptime.c:264:5
	mov	x0, x9
	ldr	x1, [sp, #72]                   ; 8-byte Folded Reload
	mov	x8, #0
	mov	x2, x8
	str	x8, [sp, #56]                   ; 8-byte Folded Spill
	bl	_sigaction
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.13@PAGE
	add	x8, x8, l_.str.13@PAGEOFF
	.loc	5 265 5 is_stmt 1               ; ptime.c:265:5
	mov	x0, x8
	bl	_printf
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, _sev_handler@PAGE
	add	x8, x8, _sev_handler@PAGEOFF
	.loc	5 266 21 is_stmt 1              ; ptime.c:266:21
	stur	x8, [x29, #-96]
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.14@PAGE
	add	x8, x8, l_.str.14@PAGEOFF
	.loc	5 267 5 is_stmt 1               ; ptime.c:267:5
	mov	x0, x8
	bl	_printf
	mov	w9, #11
	.loc	5 268 5                         ; ptime.c:268:5
	mov	x0, x9
	ldr	x1, [sp, #72]                   ; 8-byte Folded Reload
	ldr	x2, [sp, #56]                   ; 8-byte Folded Reload
	bl	_sigaction
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.15@PAGE
	add	x8, x8, l_.str.15@PAGEOFF
	.loc	5 269 5 is_stmt 1               ; ptime.c:269:5
	mov	x0, x8
	bl	_printf
	ldr	x8, [sp, #56]                   ; 8-byte Folded Reload
	.loc	5 270 21                        ; ptime.c:270:21
	mov	x0, x8
	mov	x1, #16384
	mov	w2, #7
	mov	w3, #6146
	ldr	w4, [sp, #68]                   ; 4-byte Folded Reload
	mov	x10, #0
	mov	x5, x10
	bl	_mmap
	.loc	5 270 15 is_stmt 0              ; ptime.c:270:15
	stur	x0, [x29, #-104]
	.loc	5 0 0                           ; ptime.c:0:0
	adrp	x0, l_.str.16@PAGE
	add	x0, x0, l_.str.16@PAGEOFF
	.loc	5 272 5 is_stmt 1               ; ptime.c:272:5
	bl	_printf
	mov	x8, #3689348814741910323
	.loc	5 273 5                         ; ptime.c:273:5
	mov	x0, x8
	bl	_write_sprr_perm
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x0, l_.str.17@PAGE
	add	x0, x0, l_.str.17@PAGEOFF
	.loc	5 274 5 is_stmt 1               ; ptime.c:274:5
	bl	_printf
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.18@PAGE
	add	x8, x8, l_.str.18@PAGEOFF
	.loc	5 275 5 is_stmt 1               ; ptime.c:275:5
	mov	x0, x8
	bl	_printf
	.loc	5 276 5                         ; ptime.c:276:5
	ldur	x8, [x29, #-104]
	mov	w9, #960
	movk	w9, #54879, lsl #16
	.loc	5 276 12 is_stmt 0              ; ptime.c:276:12
	str	w9, [x8]
	.loc	5 0 0                           ; ptime.c:0:0
	adrp	x8, l_.str.19@PAGE
	add	x8, x8, l_.str.19@PAGEOFF
	.loc	5 277 5 is_stmt 1               ; ptime.c:277:5
	mov	x0, x8
	bl	_printf
Ltmp9:
	.loc	5 278 14                        ; ptime.c:278:14
	stur	wzr, [x29, #-108]
LBB1_4:                                 ; =>This Inner Loop Header: Depth=1
Ltmp10:
	.loc	5 278 21 is_stmt 0              ; ptime.c:278:21
	ldur	w8, [x29, #-108]
Ltmp11:
	.loc	5 278 5                         ; ptime.c:278:5
	cmp	w8, #4                          ; =4
	b.ge	LBB1_7
; %bb.5:                                ;   in Loop: Header=BB1_4 Depth=1
Ltmp12:
	.loc	5 279 19 is_stmt 1              ; ptime.c:279:19
	ldur	x0, [x29, #-104]
	.loc	5 279 38 is_stmt 0              ; ptime.c:279:38
	ldur	w8, [x29, #-108]
	.loc	5 279 24                        ; ptime.c:279:24
	and	w8, w8, #0xff
	str	x0, [sp, #48]                   ; 8-byte Folded Spill
	mov	x0, x8
	bl	_make_sprr_val
	ldr	x9, [sp, #48]                   ; 8-byte Folded Reload
	str	x0, [sp, #40]                   ; 8-byte Folded Spill
	.loc	5 279 9                         ; ptime.c:279:9
	mov	x0, x9
	ldr	x1, [sp, #40]                   ; 8-byte Folded Reload
	bl	_sprr_test
; %bb.6:                                ;   in Loop: Header=BB1_4 Depth=1
	.loc	5 278 28 is_stmt 1              ; ptime.c:278:28
	ldur	w8, [x29, #-108]
	add	w8, w8, #1                      ; =1
	stur	w8, [x29, #-108]
	.loc	5 278 5 is_stmt 0               ; ptime.c:278:5
	b	LBB1_4
Ltmp13:
LBB1_7:
	.loc	5 280 20 is_stmt 1              ; ptime.c:280:20
	bl	_clock
	.loc	5 280 13 is_stmt 0              ; ptime.c:280:13
	stur	x0, [x29, #-120]
	.loc	5 281 35 is_stmt 1              ; ptime.c:281:35
	ldur	x8, [x29, #-120]
	.loc	5 281 42 is_stmt 0              ; ptime.c:281:42
	ldur	x9, [x29, #-80]
	.loc	5 281 40                        ; ptime.c:281:40
	subs	x8, x8, x9
	.loc	5 281 26                        ; ptime.c:281:26
	ucvtf	d0, x8
	adrp	x8, lCPI1_1@PAGE
	ldr	d1, [x8, lCPI1_1@PAGEOFF]
	.loc	5 281 49                        ; ptime.c:281:49
	fmul	d0, d0, d1
	adrp	x8, lCPI1_0@PAGE
	ldr	d1, [x8, lCPI1_0@PAGEOFF]
	.loc	5 281 58                        ; ptime.c:281:58
	fdiv	d0, d0, d1
	.loc	5 281 16                        ; ptime.c:281:16
	str	d0, [sp, #128]
	.loc	5 282 64 is_stmt 1              ; ptime.c:282:64
	ldr	d0, [sp, #128]
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x0, l_.str.20@PAGE
	add	x0, x0, l_.str.20@PAGEOFF
	.loc	5 282 9                         ; ptime.c:282:9
	mov	x8, sp
	str	d0, [x8]
	bl	_printf
	sub	x8, x29, #64                    ; =64
	.loc	5 283 27 is_stmt 1              ; ptime.c:283:27
	mov	x0, x8
	bl	_ctime
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.21@PAGE
	add	x8, x8, l_.str.21@PAGEOFF
	str	x0, [sp, #32]                   ; 8-byte Folded Spill
	.loc	5 283 5                         ; ptime.c:283:5
	mov	x0, x8
	mov	x8, sp
	ldr	x9, [sp, #32]                   ; 8-byte Folded Reload
	str	x9, [x8]
	bl	_printf
	.loc	5 0 0                           ; ptime.c:0:0
	adrp	x8, l_.str.22@PAGE
	add	x8, x8, l_.str.22@PAGEOFF
	.loc	5 284 5 is_stmt 1               ; ptime.c:284:5
	mov	x0, x8
	bl	_printf
	.loc	5 287 1                         ; ptime.c:287:1
	ldur	w10, [x29, #-20]
	mov	x0, x10
	ldp	x29, x30, [sp, #256]            ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #240]            ; 16-byte Folded Reload
	add	sp, sp, #272                    ; =272
	ret
Ltmp14:
Lfunc_end1:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function bus_handler
_bus_handler:                           ; @bus_handler
Lfunc_begin2:
	.loc	5 27 0                          ; ptime.c:27:0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32                     ; =32
	.cfi_def_cfa_offset 32
	str	w0, [sp, #28]
	str	x1, [sp, #16]
	str	x2, [sp, #8]
Ltmp16:
	.loc	5 31 22 prologue_end            ; ptime.c:31:22
	ldr	x8, [sp, #8]
	.loc	5 31 17 is_stmt 0               ; ptime.c:31:17
	str	x8, [sp]
	.loc	5 32 5 is_stmt 1                ; ptime.c:32:5
	ldr	x8, [sp]
	.loc	5 32 9 is_stmt 0                ; ptime.c:32:9
	ldr	x8, [x8, #48]
	mov	x9, #48879
	movk	x9, #57005, lsl #16
	.loc	5 32 34                         ; ptime.c:32:34
	str	x9, [x8, #16]
	.loc	5 33 5 is_stmt 1                ; ptime.c:33:5
	ldr	x8, [sp]
	.loc	5 33 9 is_stmt 0                ; ptime.c:33:9
	ldr	x8, [x8, #48]
	.loc	5 33 32                         ; ptime.c:33:32
	ldr	x9, [x8, #272]
	add	x9, x9, #4                      ; =4
	str	x9, [x8, #272]
	.loc	5 34 1 is_stmt 1                ; ptime.c:34:1
	add	sp, sp, #32                     ; =32
	ret
Ltmp17:
Lfunc_end2:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function sev_handler
_sev_handler:                           ; @sev_handler
Lfunc_begin3:
	.loc	5 17 0                          ; ptime.c:17:0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32                     ; =32
	.cfi_def_cfa_offset 32
	str	w0, [sp, #28]
	str	x1, [sp, #16]
	str	x2, [sp, #8]
Ltmp19:
	.loc	5 21 22 prologue_end            ; ptime.c:21:22
	ldr	x8, [sp, #8]
	.loc	5 21 17 is_stmt 0               ; ptime.c:21:17
	str	x8, [sp]
	.loc	5 22 5 is_stmt 1                ; ptime.c:22:5
	ldr	x8, [sp]
	.loc	5 22 9 is_stmt 0                ; ptime.c:22:9
	ldr	x8, [x8, #48]
	mov	x9, #48879
	movk	x9, #57005, lsl #16
	.loc	5 22 34                         ; ptime.c:22:34
	str	x9, [x8, #16]
	.loc	5 23 34 is_stmt 1               ; ptime.c:23:34
	ldr	x8, [sp]
	.loc	5 23 38 is_stmt 0               ; ptime.c:23:38
	ldr	x8, [x8, #48]
	.loc	5 23 56                         ; ptime.c:23:56
	ldr	x8, [x8, #256]
	.loc	5 23 5                          ; ptime.c:23:5
	ldr	x9, [sp]
	.loc	5 23 9                          ; ptime.c:23:9
	ldr	x9, [x9, #48]
	.loc	5 23 32                         ; ptime.c:23:32
	str	x8, [x9, #272]
	.loc	5 24 1 is_stmt 1                ; ptime.c:24:1
	add	sp, sp, #32                     ; =32
	ret
Ltmp20:
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
	.loc	5 37 0                          ; ptime.c:37:0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64                     ; =64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48                    ; =48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
Ltmp21:
	.loc	5 0 0 prologue_end              ; ptime.c:0:0
	adrp	x0, l_.str.23@PAGE
	add	x0, x0, l_.str.23@PAGEOFF
	.loc	5 38 5                          ; ptime.c:38:5
	bl	_printf
	.loc	5 39 21                         ; ptime.c:39:21
	bl	_clock
	.loc	5 39 13 is_stmt 0               ; ptime.c:39:13
	stur	x0, [x29, #-16]
	.loc	5 0 0                           ; ptime.c:0:0
	adrp	x0, l_.str.24@PAGE
	add	x0, x0, l_.str.24@PAGEOFF
	.loc	5 40 5 is_stmt 1                ; ptime.c:40:5
	bl	_printf
	.loc	5 42 43                         ; ptime.c:42:43
	ldur	x8, [x29, #-8]
	.loc	5 41 5                          ; ptime.c:41:5
	; InlineAsm Start
	msr	S3_6_C15_C1_5, x8
	isb

	; InlineAsm End
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.25@PAGE
	add	x8, x8, l_.str.25@PAGEOFF
	.loc	5 44 5 is_stmt 1                ; ptime.c:44:5
	mov	x0, x8
	bl	_printf
	.loc	5 45 20                         ; ptime.c:45:20
	bl	_clock
	.loc	5 45 13 is_stmt 0               ; ptime.c:45:13
	str	x0, [sp, #24]
	.loc	5 46 35 is_stmt 1               ; ptime.c:46:35
	ldr	x8, [sp, #24]
	.loc	5 46 42 is_stmt 0               ; ptime.c:46:42
	ldur	x9, [x29, #-16]
	.loc	5 46 40                         ; ptime.c:46:40
	subs	x8, x8, x9
	.loc	5 46 26                         ; ptime.c:46:26
	ucvtf	d0, x8
	adrp	x8, lCPI4_1@PAGE
	ldr	d1, [x8, lCPI4_1@PAGEOFF]
	.loc	5 46 49                         ; ptime.c:46:49
	fmul	d0, d0, d1
	adrp	x8, lCPI4_0@PAGE
	ldr	d1, [x8, lCPI4_0@PAGEOFF]
	.loc	5 46 58                         ; ptime.c:46:58
	fdiv	d0, d0, d1
	.loc	5 46 16                         ; ptime.c:46:16
	str	d0, [sp, #16]
	.loc	5 0 0                           ; ptime.c:0:0
	adrp	x0, l_.str.26@PAGE
	add	x0, x0, l_.str.26@PAGEOFF
	.loc	5 47 9 is_stmt 1                ; ptime.c:47:9
	bl	_printf
	.loc	5 48 95                         ; ptime.c:48:95
	ldr	d0, [sp, #16]
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.27@PAGE
	add	x8, x8, l_.str.27@PAGEOFF
	.loc	5 48 9                          ; ptime.c:48:9
	mov	x0, x8
	mov	x8, sp
	str	d0, [x8]
	bl	_printf
	.loc	5 49 1 is_stmt 1                ; ptime.c:49:1
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64                     ; =64
	ret
Ltmp22:
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
	.loc	5 132 0                         ; ptime.c:132:0
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
Ltmp23:
	.loc	5 0 0 prologue_end              ; ptime.c:0:0
	adrp	x0, l_.str.28@PAGE
	add	x0, x0, l_.str.28@PAGEOFF
	.loc	5 133 5                         ; ptime.c:133:5
	bl	_printf
	.loc	5 134 21                        ; ptime.c:134:21
	bl	_clock
	.loc	5 134 13 is_stmt 0              ; ptime.c:134:13
	stur	x0, [x29, #-24]
	.loc	5 0 0                           ; ptime.c:0:0
	adrp	x0, l_.str.29@PAGE
	add	x0, x0, l_.str.29@PAGEOFF
	.loc	5 135 5 is_stmt 1               ; ptime.c:135:5
	bl	_printf
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.30@PAGE
	add	x8, x8, l_.str.30@PAGEOFF
	.loc	5 137 5 is_stmt 1               ; ptime.c:137:5
	mov	x0, x8
	bl	_printf
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.31@PAGE
	add	x8, x8, l_.str.31@PAGEOFF
	.loc	5 138 5 is_stmt 1               ; ptime.c:138:5
	mov	x0, x8
	bl	_printf
	.loc	5 139 9                         ; ptime.c:139:9
	bl	_read_sprr_perm
	.loc	5 139 7 is_stmt 0               ; ptime.c:139:7
	stur	x0, [x29, #-32]
	.loc	5 0 0                           ; ptime.c:0:0
	adrp	x0, l_.str.32@PAGE
	add	x0, x0, l_.str.32@PAGEOFF
	.loc	5 140 5 is_stmt 1               ; ptime.c:140:5
	bl	_printf
	.loc	5 141 21                        ; ptime.c:141:21
	ldur	x8, [x29, #-16]
	.loc	5 141 5 is_stmt 0               ; ptime.c:141:5
	mov	x0, x8
	bl	_write_sprr_perm
	.loc	5 0 0                           ; ptime.c:0:0
	adrp	x0, l_.str.33@PAGE
	add	x0, x0, l_.str.33@PAGEOFF
	.loc	5 142 5 is_stmt 1               ; ptime.c:142:5
	bl	_printf
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.34@PAGE
	add	x8, x8, l_.str.34@PAGEOFF
	.loc	5 143 5 is_stmt 1               ; ptime.c:143:5
	mov	x0, x8
	bl	_printf
	.loc	5 144 9                         ; ptime.c:144:9
	bl	_read_sprr_perm
	.loc	5 144 7 is_stmt 0               ; ptime.c:144:7
	stur	x0, [x29, #-40]
	.loc	5 0 0                           ; ptime.c:0:0
	adrp	x0, l_.str.35@PAGE
	add	x0, x0, l_.str.35@PAGEOFF
	.loc	5 145 5 is_stmt 1               ; ptime.c:145:5
	bl	_printf
	.loc	5 147 45                        ; ptime.c:147:45
	ldur	x8, [x29, #-40]
	.loc	5 147 57 is_stmt 0              ; ptime.c:147:57
	ldur	x9, [x29, #-8]
	.loc	5 147 48                        ; ptime.c:147:48
	mov	x0, x9
	str	x8, [sp, #48]                   ; 8-byte Folded Spill
	bl	_can_read
	mov	w10, #45
	mov	w11, #114
	tst	w0, #0x1
	csel	w11, w11, w10, ne
	.loc	5 147 85                        ; ptime.c:147:85
	ldur	x0, [x29, #-8]
	str	w10, [sp, #44]                  ; 4-byte Folded Spill
	str	w11, [sp, #40]                  ; 4-byte Folded Spill
	.loc	5 147 75                        ; ptime.c:147:75
	bl	_can_write
	mov	w10, #119
	tst	w0, #0x1
	ldr	w11, [sp, #44]                  ; 4-byte Folded Reload
	csel	w10, w10, w11, ne
	.loc	5 148 21 is_stmt 1              ; ptime.c:148:21
	ldur	x0, [x29, #-8]
	str	w10, [sp, #36]                  ; 4-byte Folded Spill
	.loc	5 148 12 is_stmt 0              ; ptime.c:148:12
	bl	_can_exec
	mov	w10, #120
	tst	w0, #0x1
	ldr	w11, [sp, #44]                  ; 4-byte Folded Reload
	csel	w10, w10, w11, ne
	.loc	5 0 0                           ; ptime.c:0:0
	adrp	x0, l_.str.36@PAGE
	add	x0, x0, l_.str.36@PAGEOFF
	.loc	5 147 5 is_stmt 1               ; ptime.c:147:5
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
	.loc	5 149 20                        ; ptime.c:149:20
	bl	_clock
	.loc	5 149 13 is_stmt 0              ; ptime.c:149:13
	stur	x0, [x29, #-48]
	.loc	5 150 35 is_stmt 1              ; ptime.c:150:35
	ldur	x8, [x29, #-48]
	.loc	5 150 42 is_stmt 0              ; ptime.c:150:42
	ldur	x9, [x29, #-24]
	.loc	5 150 40                        ; ptime.c:150:40
	subs	x8, x8, x9
	.loc	5 150 26                        ; ptime.c:150:26
	ucvtf	d0, x8
	adrp	x8, lCPI5_1@PAGE
	ldr	d1, [x8, lCPI5_1@PAGEOFF]
	.loc	5 150 49                        ; ptime.c:150:49
	fmul	d0, d0, d1
	adrp	x8, lCPI5_0@PAGE
	ldr	d1, [x8, lCPI5_0@PAGEOFF]
	.loc	5 150 58                        ; ptime.c:150:58
	fdiv	d0, d0, d1
	.loc	5 150 16                        ; ptime.c:150:16
	str	d0, [sp, #56]
	.loc	5 151 73 is_stmt 1              ; ptime.c:151:73
	ldr	d0, [sp, #56]
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x0, l_.str.37@PAGE
	add	x0, x0, l_.str.37@PAGEOFF
	.loc	5 151 9                         ; ptime.c:151:9
	mov	x8, sp
	str	d0, [x8]
	bl	_printf
	.loc	5 164 1 is_stmt 1               ; ptime.c:164:1
	ldp	x29, x30, [sp, #112]            ; 16-byte Folded Reload
	add	sp, sp, #128                    ; =128
	ret
Ltmp24:
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
	.loc	5 167 0                         ; ptime.c:167:0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80                     ; =80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64                    ; =64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	sturb	w0, [x29, #-1]
Ltmp25:
	.loc	5 0 0 prologue_end              ; ptime.c:0:0
	adrp	x0, l_.str.62@PAGE
	add	x0, x0, l_.str.62@PAGEOFF
	.loc	5 168 5                         ; ptime.c:168:5
	bl	_printf
	.loc	5 169 21                        ; ptime.c:169:21
	bl	_clock
	.loc	5 169 13 is_stmt 0              ; ptime.c:169:13
	stur	x0, [x29, #-16]
	.loc	5 0 0                           ; ptime.c:0:0
	adrp	x0, l_.str.63@PAGE
	add	x0, x0, l_.str.63@PAGEOFF
	.loc	5 170 5 is_stmt 1               ; ptime.c:170:5
	bl	_printf
	.loc	5 171 14                        ; ptime.c:171:14
	stur	xzr, [x29, #-24]
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.64@PAGE
	add	x8, x8, l_.str.64@PAGEOFF
	.loc	5 172 5 is_stmt 1               ; ptime.c:172:5
	mov	x0, x8
	bl	_printf
Ltmp26:
	.loc	5 173 14                        ; ptime.c:173:14
	stur	wzr, [x29, #-28]
LBB6_1:                                 ; =>This Inner Loop Header: Depth=1
Ltmp27:
	.loc	5 173 21 is_stmt 0              ; ptime.c:173:21
	ldur	w8, [x29, #-28]
Ltmp28:
	.loc	5 173 5                         ; ptime.c:173:5
	cmp	w8, #16                         ; =16
	b.ge	LBB6_4
; %bb.2:                                ;   in Loop: Header=BB6_1 Depth=1
Ltmp29:
	.loc	5 174 27 is_stmt 1              ; ptime.c:174:27
	ldurb	w8, [x29, #-1]
	mov	x9, x8
	.loc	5 174 43 is_stmt 0              ; ptime.c:174:43
	ldur	w8, [x29, #-28]
	mov	w10, #4
	.loc	5 174 41                        ; ptime.c:174:41
	mul	w8, w10, w8
	.loc	5 174 35                        ; ptime.c:174:35
	mov	x11, x8
	lsl	x9, x9, x11
	.loc	5 174 13                        ; ptime.c:174:13
	ldur	x11, [x29, #-24]
	orr	x9, x11, x9
	stur	x9, [x29, #-24]
; %bb.3:                                ;   in Loop: Header=BB6_1 Depth=1
	.loc	5 173 29 is_stmt 1              ; ptime.c:173:29
	ldur	w8, [x29, #-28]
	add	w8, w8, #1                      ; =1
	stur	w8, [x29, #-28]
	.loc	5 173 5 is_stmt 0               ; ptime.c:173:5
	b	LBB6_1
Ltmp30:
LBB6_4:
	.loc	5 0 0                           ; ptime.c:0:0
	adrp	x0, l_.str.65@PAGE
	add	x0, x0, l_.str.65@PAGEOFF
	.loc	5 175 5 is_stmt 1               ; ptime.c:175:5
	bl	_printf
	.loc	5 176 20                        ; ptime.c:176:20
	bl	_clock
	.loc	5 176 13 is_stmt 0              ; ptime.c:176:13
	str	x0, [sp, #24]
	.loc	5 177 35 is_stmt 1              ; ptime.c:177:35
	ldr	x8, [sp, #24]
	.loc	5 177 42 is_stmt 0              ; ptime.c:177:42
	ldur	x9, [x29, #-16]
	.loc	5 177 40                        ; ptime.c:177:40
	subs	x8, x8, x9
	.loc	5 177 26                        ; ptime.c:177:26
	ucvtf	d0, x8
	adrp	x8, lCPI6_1@PAGE
	ldr	d1, [x8, lCPI6_1@PAGEOFF]
	.loc	5 177 49                        ; ptime.c:177:49
	fmul	d0, d0, d1
	adrp	x8, lCPI6_0@PAGE
	ldr	d1, [x8, lCPI6_0@PAGEOFF]
	.loc	5 177 58                        ; ptime.c:177:58
	fdiv	d0, d0, d1
	.loc	5 177 16                        ; ptime.c:177:16
	str	d0, [sp, #16]
	.loc	5 178 76 is_stmt 1              ; ptime.c:178:76
	ldr	d0, [sp, #16]
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x0, l_.str.66@PAGE
	add	x0, x0, l_.str.66@PAGEOFF
	.loc	5 178 9                         ; ptime.c:178:9
	mov	x8, sp
	str	d0, [x8]
	bl	_printf
	.loc	5 179 12 is_stmt 1              ; ptime.c:179:12
	ldur	x8, [x29, #-24]
	.loc	5 179 5 is_stmt 0               ; ptime.c:179:5
	mov	x0, x8
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80                     ; =80
	ret
Ltmp31:
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
	.loc	5 52 0 is_stmt 1                ; ptime.c:52:0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64                     ; =64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48                    ; =48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp32:
	.loc	5 0 0 prologue_end              ; ptime.c:0:0
	adrp	x0, l_.str.38@PAGE
	add	x0, x0, l_.str.38@PAGEOFF
	.loc	5 53 5                          ; ptime.c:53:5
	bl	_printf
	.loc	5 54 21                         ; ptime.c:54:21
	bl	_clock
	.loc	5 54 13 is_stmt 0               ; ptime.c:54:13
	stur	x0, [x29, #-8]
	.loc	5 0 0                           ; ptime.c:0:0
	adrp	x0, l_.str.39@PAGE
	add	x0, x0, l_.str.39@PAGEOFF
	.loc	5 55 5 is_stmt 1                ; ptime.c:55:5
	bl	_printf
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.40@PAGE
	add	x8, x8, l_.str.40@PAGEOFF
	.loc	5 57 5 is_stmt 1                ; ptime.c:57:5
	mov	x0, x8
	bl	_printf
	.loc	5 58 5                          ; ptime.c:58:5
	; InlineAsm Start
	isb
	mrs	x8, S3_6_C15_C1_5

	; InlineAsm End
	stur	x8, [x29, #-16]
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.41@PAGE
	add	x8, x8, l_.str.41@PAGEOFF
	.loc	5 61 5 is_stmt 1                ; ptime.c:61:5
	mov	x0, x8
	bl	_printf
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.42@PAGE
	add	x8, x8, l_.str.42@PAGEOFF
	.loc	5 62 5 is_stmt 1                ; ptime.c:62:5
	mov	x0, x8
	bl	_printf
	.loc	5 63 20                         ; ptime.c:63:20
	bl	_clock
	.loc	5 63 13 is_stmt 0               ; ptime.c:63:13
	str	x0, [sp, #24]
	.loc	5 64 35 is_stmt 1               ; ptime.c:64:35
	ldr	x8, [sp, #24]
	.loc	5 64 42 is_stmt 0               ; ptime.c:64:42
	ldur	x9, [x29, #-8]
	.loc	5 64 40                         ; ptime.c:64:40
	subs	x8, x8, x9
	.loc	5 64 26                         ; ptime.c:64:26
	ucvtf	d0, x8
	adrp	x8, lCPI7_1@PAGE
	ldr	d1, [x8, lCPI7_1@PAGEOFF]
	.loc	5 64 49                         ; ptime.c:64:49
	fmul	d0, d0, d1
	adrp	x8, lCPI7_0@PAGE
	ldr	d1, [x8, lCPI7_0@PAGEOFF]
	.loc	5 64 58                         ; ptime.c:64:58
	fdiv	d0, d0, d1
	.loc	5 64 16                         ; ptime.c:64:16
	str	d0, [sp, #16]
	.loc	5 65 89 is_stmt 1               ; ptime.c:65:89
	ldr	d0, [sp, #16]
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x0, l_.str.43@PAGE
	add	x0, x0, l_.str.43@PAGEOFF
	.loc	5 65 5                          ; ptime.c:65:5
	mov	x8, sp
	str	d0, [x8]
	bl	_printf
	.loc	5 66 12 is_stmt 1               ; ptime.c:66:12
	ldur	x8, [x29, #-16]
	.loc	5 66 5 is_stmt 0                ; ptime.c:66:5
	mov	x0, x8
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64                     ; =64
	ret
Ltmp33:
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
	.loc	5 70 0 is_stmt 1                ; ptime.c:70:0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80                     ; =80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64                    ; =64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-16]
Ltmp34:
	.loc	5 0 0 prologue_end              ; ptime.c:0:0
	adrp	x0, l_.str.44@PAGE
	add	x0, x0, l_.str.44@PAGEOFF
	.loc	5 71 5                          ; ptime.c:71:5
	bl	_printf
	.loc	5 72 21                         ; ptime.c:72:21
	bl	_clock
	.loc	5 72 13 is_stmt 0               ; ptime.c:72:13
	stur	x0, [x29, #-24]
	.loc	5 0 0                           ; ptime.c:0:0
	adrp	x0, l_.str.45@PAGE
	add	x0, x0, l_.str.45@PAGEOFF
	.loc	5 73 5 is_stmt 1                ; ptime.c:73:5
	bl	_printf
	.loc	5 74 14                         ; ptime.c:74:14
	str	xzr, [sp, #32]
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.46@PAGE
	add	x8, x8, l_.str.46@PAGEOFF
	.loc	5 75 5 is_stmt 1                ; ptime.c:75:5
	mov	x0, x8
	bl	_printf
	.loc	5 79 32                         ; ptime.c:79:32
	ldur	x8, [x29, #-16]
	.loc	5 76 5                          ; ptime.c:76:5
	; InlineAsm Start
	ldr	x0, [x8]
	mov	x8, x0

	; InlineAsm End
	str	x8, [sp, #32]
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x0, l_.str.47@PAGE
	add	x0, x0, l_.str.47@PAGEOFF
	.loc	5 81 5 is_stmt 1                ; ptime.c:81:5
	bl	_printf
	.loc	5 82 20                         ; ptime.c:82:20
	bl	_clock
	.loc	5 82 13 is_stmt 0               ; ptime.c:82:13
	str	x0, [sp, #24]
	.loc	5 83 35 is_stmt 1               ; ptime.c:83:35
	ldr	x8, [sp, #24]
	.loc	5 83 42 is_stmt 0               ; ptime.c:83:42
	ldur	x9, [x29, #-24]
	.loc	5 83 40                         ; ptime.c:83:40
	subs	x8, x8, x9
	.loc	5 83 26                         ; ptime.c:83:26
	ucvtf	d0, x8
	adrp	x8, lCPI8_1@PAGE
	ldr	d1, [x8, lCPI8_1@PAGEOFF]
	.loc	5 83 49                         ; ptime.c:83:49
	fmul	d0, d0, d1
	adrp	x8, lCPI8_0@PAGE
	ldr	d1, [x8, lCPI8_0@PAGEOFF]
	.loc	5 83 58                         ; ptime.c:83:58
	fdiv	d0, d0, d1
	.loc	5 83 16                         ; ptime.c:83:16
	str	d0, [sp, #16]
	.loc	5 0 0                           ; ptime.c:0:0
	adrp	x0, l_.str.48@PAGE
	add	x0, x0, l_.str.48@PAGEOFF
	.loc	5 84 5 is_stmt 1                ; ptime.c:84:5
	bl	_printf
	.loc	5 85 67                         ; ptime.c:85:67
	ldr	d0, [sp, #16]
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.49@PAGE
	add	x8, x8, l_.str.49@PAGEOFF
	.loc	5 85 5                          ; ptime.c:85:5
	mov	x0, x8
	mov	x8, sp
	str	d0, [x8]
	bl	_printf
Ltmp35:
	.loc	5 86 9 is_stmt 1                ; ptime.c:86:9
	ldr	x8, [sp, #32]
	mov	x9, #48879
	movk	x9, #57005, lsl #16
Ltmp36:
	.loc	5 86 9 is_stmt 0                ; ptime.c:86:9
	subs	x8, x8, x9
	b.ne	LBB8_2
; %bb.1:
	.loc	5 0 9                           ; ptime.c:0:9
	mov	w8, #0
Ltmp37:
	.loc	5 87 9 is_stmt 1                ; ptime.c:87:9
	and	w8, w8, #0x1
	sturb	w8, [x29, #-1]
	b	LBB8_3
Ltmp38:
LBB8_2:
	.loc	5 0 9 is_stmt 0                 ; ptime.c:0:9
	mov	w8, #1
	.loc	5 88 5 is_stmt 1                ; ptime.c:88:5
	and	w8, w8, #0x1
	sturb	w8, [x29, #-1]
LBB8_3:
	.loc	5 89 1                          ; ptime.c:89:1
	ldurb	w8, [x29, #-1]
	and	w0, w8, #0x1
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80                     ; =80
	ret
Ltmp39:
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
	.loc	5 92 0                          ; ptime.c:92:0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80                     ; =80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64                    ; =64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-16]
Ltmp40:
	.loc	5 0 0 prologue_end              ; ptime.c:0:0
	adrp	x0, l_.str.50@PAGE
	add	x0, x0, l_.str.50@PAGEOFF
	.loc	5 93 5                          ; ptime.c:93:5
	bl	_printf
	.loc	5 94 21                         ; ptime.c:94:21
	bl	_clock
	.loc	5 94 13 is_stmt 0               ; ptime.c:94:13
	stur	x0, [x29, #-24]
	.loc	5 0 0                           ; ptime.c:0:0
	adrp	x0, l_.str.51@PAGE
	add	x0, x0, l_.str.51@PAGEOFF
	.loc	5 95 5 is_stmt 1                ; ptime.c:95:5
	bl	_printf
	.loc	5 96 14                         ; ptime.c:96:14
	str	xzr, [sp, #32]
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.52@PAGE
	add	x8, x8, l_.str.52@PAGEOFF
	.loc	5 97 5 is_stmt 1                ; ptime.c:97:5
	mov	x0, x8
	bl	_printf
	.loc	5 101 32                        ; ptime.c:101:32
	ldur	x8, [x29, #-16]
	.loc	5 101 36 is_stmt 0              ; ptime.c:101:36
	add	x8, x8, #8                      ; =8
	.loc	5 98 5 is_stmt 1                ; ptime.c:98:5
	; InlineAsm Start
	str	x0, [x8]
	mov	x8, x0

	; InlineAsm End
	str	x8, [sp, #32]
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x0, l_.str.53@PAGE
	add	x0, x0, l_.str.53@PAGEOFF
	.loc	5 103 5 is_stmt 1               ; ptime.c:103:5
	bl	_printf
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.54@PAGE
	add	x8, x8, l_.str.54@PAGEOFF
	.loc	5 104 5 is_stmt 1               ; ptime.c:104:5
	mov	x0, x8
	bl	_printf
	.loc	5 105 20                        ; ptime.c:105:20
	bl	_clock
	.loc	5 105 13 is_stmt 0              ; ptime.c:105:13
	str	x0, [sp, #24]
	.loc	5 106 35 is_stmt 1              ; ptime.c:106:35
	ldr	x8, [sp, #24]
	.loc	5 106 42 is_stmt 0              ; ptime.c:106:42
	ldur	x9, [x29, #-24]
	.loc	5 106 40                        ; ptime.c:106:40
	subs	x8, x8, x9
	.loc	5 106 26                        ; ptime.c:106:26
	ucvtf	d0, x8
	adrp	x8, lCPI9_1@PAGE
	ldr	d1, [x8, lCPI9_1@PAGEOFF]
	.loc	5 106 49                        ; ptime.c:106:49
	fmul	d0, d0, d1
	adrp	x8, lCPI9_0@PAGE
	ldr	d1, [x8, lCPI9_0@PAGEOFF]
	.loc	5 106 58                        ; ptime.c:106:58
	fdiv	d0, d0, d1
	.loc	5 106 16                        ; ptime.c:106:16
	str	d0, [sp, #16]
	.loc	5 107 72 is_stmt 1              ; ptime.c:107:72
	ldr	d0, [sp, #16]
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x0, l_.str.55@PAGE
	add	x0, x0, l_.str.55@PAGEOFF
	.loc	5 107 9                         ; ptime.c:107:9
	mov	x8, sp
	str	d0, [x8]
	bl	_printf
Ltmp41:
	.loc	5 108 9 is_stmt 1               ; ptime.c:108:9
	ldr	x8, [sp, #32]
	mov	x9, #48879
	movk	x9, #57005, lsl #16
Ltmp42:
	.loc	5 108 9 is_stmt 0               ; ptime.c:108:9
	subs	x8, x8, x9
	b.ne	LBB9_2
; %bb.1:
	.loc	5 0 9                           ; ptime.c:0:9
	mov	w8, #0
Ltmp43:
	.loc	5 109 9 is_stmt 1               ; ptime.c:109:9
	and	w8, w8, #0x1
	sturb	w8, [x29, #-1]
	b	LBB9_3
Ltmp44:
LBB9_2:
	.loc	5 0 9 is_stmt 0                 ; ptime.c:0:9
	mov	w8, #1
	.loc	5 110 5 is_stmt 1               ; ptime.c:110:5
	and	w8, w8, #0x1
	sturb	w8, [x29, #-1]
LBB9_3:
	.loc	5 111 1                         ; ptime.c:111:1
	ldurb	w8, [x29, #-1]
	and	w0, w8, #0x1
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80                     ; =80
	ret
Ltmp45:
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
	.loc	5 114 0                         ; ptime.c:114:0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80                     ; =80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64                    ; =64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-16]
Ltmp46:
	.loc	5 0 0 prologue_end              ; ptime.c:0:0
	adrp	x0, l_.str.56@PAGE
	add	x0, x0, l_.str.56@PAGEOFF
	.loc	5 115 5                         ; ptime.c:115:5
	bl	_printf
	.loc	5 116 21                        ; ptime.c:116:21
	bl	_clock
	.loc	5 116 13 is_stmt 0              ; ptime.c:116:13
	stur	x0, [x29, #-24]
	.loc	5 0 0                           ; ptime.c:0:0
	adrp	x0, l_.str.57@PAGE
	add	x0, x0, l_.str.57@PAGEOFF
	.loc	5 117 5 is_stmt 1               ; ptime.c:117:5
	bl	_printf
	.loc	5 118 37                        ; ptime.c:118:37
	ldur	x8, [x29, #-16]
	.loc	5 118 16 is_stmt 0              ; ptime.c:118:16
	str	x8, [sp, #32]
	.loc	5 0 0                           ; ptime.c:0:0
	adrp	x8, l_.str.58@PAGE
	add	x8, x8, l_.str.58@PAGEOFF
	.loc	5 119 5 is_stmt 1               ; ptime.c:119:5
	mov	x0, x8
	bl	_printf
	.loc	5 120 20                        ; ptime.c:120:20
	ldr	x8, [sp, #32]
	mov	x9, #0
	mov	x0, x9
	blr	x8
	.loc	5 120 14 is_stmt 0              ; ptime.c:120:14
	str	x0, [sp, #24]
	.loc	5 0 0                           ; ptime.c:0:0
	adrp	x0, l_.str.59@PAGE
	add	x0, x0, l_.str.59@PAGEOFF
	.loc	5 121 5 is_stmt 1               ; ptime.c:121:5
	bl	_printf
	.loc	5 122 20                        ; ptime.c:122:20
	bl	_clock
	.loc	5 122 13 is_stmt 0              ; ptime.c:122:13
	str	x0, [sp, #16]
	.loc	5 123 35 is_stmt 1              ; ptime.c:123:35
	ldr	x8, [sp, #16]
	.loc	5 123 42 is_stmt 0              ; ptime.c:123:42
	ldur	x9, [x29, #-24]
	.loc	5 123 40                        ; ptime.c:123:40
	subs	x8, x8, x9
	.loc	5 123 26                        ; ptime.c:123:26
	ucvtf	d0, x8
	adrp	x8, lCPI10_1@PAGE
	ldr	d1, [x8, lCPI10_1@PAGEOFF]
	.loc	5 123 49                        ; ptime.c:123:49
	fmul	d0, d0, d1
	adrp	x8, lCPI10_0@PAGE
	ldr	d1, [x8, lCPI10_0@PAGEOFF]
	.loc	5 123 58                        ; ptime.c:123:58
	fdiv	d0, d0, d1
	.loc	5 123 16                        ; ptime.c:123:16
	str	d0, [sp, #8]
	.loc	5 0 0                           ; ptime.c:0:0
	adrp	x0, l_.str.60@PAGE
	add	x0, x0, l_.str.60@PAGEOFF
	.loc	5 124 5 is_stmt 1               ; ptime.c:124:5
	bl	_printf
	.loc	5 125 66                        ; ptime.c:125:66
	ldr	d0, [sp, #8]
	.loc	5 0 0 is_stmt 0                 ; ptime.c:0:0
	adrp	x8, l_.str.61@PAGE
	add	x8, x8, l_.str.61@PAGEOFF
	.loc	5 125 5                         ; ptime.c:125:5
	mov	x0, x8
	mov	x8, sp
	str	d0, [x8]
	bl	_printf
Ltmp47:
	.loc	5 126 9 is_stmt 1               ; ptime.c:126:9
	ldr	x8, [sp, #24]
	mov	x9, #48879
	movk	x9, #57005, lsl #16
Ltmp48:
	.loc	5 126 9 is_stmt 0               ; ptime.c:126:9
	subs	x8, x8, x9
	b.ne	LBB10_2
; %bb.1:
	.loc	5 0 9                           ; ptime.c:0:9
	mov	w8, #0
Ltmp49:
	.loc	5 127 9 is_stmt 1               ; ptime.c:127:9
	and	w8, w8, #0x1
	sturb	w8, [x29, #-1]
	b	LBB10_3
Ltmp50:
LBB10_2:
	.loc	5 0 9 is_stmt 0                 ; ptime.c:0:9
	mov	w8, #1
	.loc	5 128 5 is_stmt 1               ; ptime.c:128:5
	and	w8, w8, #0x1
	sturb	w8, [x29, #-1]
LBB10_3:
	.loc	5 129 1                         ; ptime.c:129:1
	ldurb	w8, [x29, #-1]
	and	w0, w8, #0x1
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80                     ; =80
	ret
Ltmp51:
Lfunc_end10:
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"---------------------------------------\n"

l_.str.1:                               ; @.str.1
	.asciz	"Start inside Main\n"

l_.str.2:                               ; @.str.2
	.asciz	"Process: \033[31mFuzzing M1 S3_6_c15_c1_5\033[0m\n"

l_.str.3:                               ; @.str.3
	.asciz	"Today is \033[0;35m%s\033[0m\n"

l_.str.4:                               ; @.str.4
	.asciz	"Run Date (D/M/Y) = %02d/%02d/%d\n"

l_.str.5:                               ; @.str.5
	.asciz	"MS Timer Start at %02d:%02d:%02d am\n"

l_.str.6:                               ; @.str.6
	.asciz	"MS Timer Start at %02d:%02d:%02d pm\n"

l_.str.7:                               ; @.str.7
	.asciz	"--------------------------\n"

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
	.asciz	"Finished... Total Elapsed Time in ms: %f\n\n"

l_.str.21:                              ; @.str.21
	.asciz	"End Time %s"

l_.str.22:                              ; @.str.22
	.asciz	"Done.......\n\n\n"

l_.str.23:                              ; @.str.23
	.asciz	"Jumped to write_sprr_perm... Step 4...\n"

l_.str.24:                              ; @.str.24
	.asciz	"Start __volatile__ write_sprr_perm\n"

l_.str.25:                              ; @.str.25
	.asciz	"End __volatile__ write_sprr_perm\n"

l_.str.26:                              ; @.str.26
	.asciz	"End write_sprr_perm\n"

l_.str.27:                              ; @.str.27
	.asciz	"Finished write_sprr_perm ... Time elapsed for write_sprr_perm in ms: %f\n\n"

l_.str.28:                              ; @.str.28
	.asciz	"Jumped to sprr_test.. Step 2...\n"

l_.str.29:                              ; @.str.29
	.asciz	"Now at sprr_test before uint64_t a, b\n"

l_.str.30:                              ; @.str.30
	.asciz	"Completed at sprr_test after uint64_t a, b\n"

l_.str.31:                              ; @.str.31
	.asciz	"Now at sprr_test before a = read_sprr_perm()\n\n"

l_.str.32:                              ; @.str.32
	.asciz	"Completed at sprr_test following a = read_sprr_perm()\n\n"

l_.str.33:                              ; @.str.33
	.asciz	"Completed at sprr_test following write_sprr_perm(v)\n\n"

l_.str.34:                              ; @.str.34
	.asciz	"Now at sprr_test before b = read_sprr_perm()\n\n"

l_.str.35:                              ; @.str.35
	.asciz	"Finished at sprr_test after b = read_sprr_perm()\n\n"

l_.str.36:                              ; @.str.36
	.asciz	"Register Value:%llx: %c%c%c\n"

l_.str.37:                              ; @.str.37
	.asciz	"Finished.... Time elapsed for sprr_test in ms: %f\n\n"

l_.str.38:                              ; @.str.38
	.asciz	"Jumped to read_sprr_perm... Step 3...\n"

l_.str.39:                              ; @.str.39
	.asciz	"Hitting read_sprr_perm at uint64_t v;\n"

l_.str.40:                              ; @.str.40
	.asciz	"Start __volatile__ read_sprr_perm\n"

l_.str.41:                              ; @.str.41
	.asciz	"End __volatile__ read_sprr_perm\n"

l_.str.42:                              ; @.str.42
	.asciz	"End read_sprr_perm\n"

l_.str.43:                              ; @.str.43
	.asciz	"Finished read_sprr_perm ... Time elapsed for read_sprr_perm in ms: %f\n\n"

l_.str.44:                              ; @.str.44
	.asciz	"Jumped to can_read... Step 5...\n"

l_.str.45:                              ; @.str.45
	.asciz	"Hitting can_read at uint64_t v = 0\n"

l_.str.46:                              ; @.str.46
	.asciz	"Start __volatile__ can_read\n"

l_.str.47:                              ; @.str.47
	.asciz	"End __volatile__ can_read\n"

l_.str.48:                              ; @.str.48
	.asciz	"Hitting 0xdeadbeef in can_read\n"

l_.str.49:                              ; @.str.49
	.asciz	"Finished... Time elapsed for can_read in ms: %f\n\n"

l_.str.50:                              ; @.str.50
	.asciz	"Jumped to can_write... Step 6...\n"

l_.str.51:                              ; @.str.51
	.asciz	"Hitting can_write at uint64_t v = 0\n"

l_.str.52:                              ; @.str.52
	.asciz	"Start __volatile__ can_write\n"

l_.str.53:                              ; @.str.53
	.asciz	"End __volatile__ can_write\n"

l_.str.54:                              ; @.str.54
	.asciz	"Hitting 0xdeadbeef in can_write\n"

l_.str.55:                              ; @.str.55
	.asciz	"Finished... Time elapsed for can_write in ms: %f\n\n"

l_.str.56:                              ; @.str.56
	.asciz	"Jumped to can_exec... Step 7...\n"

l_.str.57:                              ; @.str.57
	.asciz	"Hitting can_exec at uint64_t (*fun_ptr)(uint64_t) = ptr\n"

l_.str.58:                              ; @.str.58
	.asciz	"Hitting uint64_t res = fun_ptr(0)\n"

l_.str.59:                              ; @.str.59
	.asciz	"Executed uint64_t res = fun_ptr(0)\n"

l_.str.60:                              ; @.str.60
	.asciz	"Hitting 0xdeadbeef in can_exec\n"

l_.str.61:                              ; @.str.61
	.asciz	"Finished... Time elapsed in can_exec in ms: %f\n\n"

l_.str.62:                              ; @.str.62
	.asciz	"Jumped to make_sprr_val.. Step 1...\n"

l_.str.63:                              ; @.str.63
	.asciz	"Hitting make_sprr_val at uint64_t res = 0\n"

l_.str.64:                              ; @.str.64
	.asciz	"Hitting make_sprr_val at int i = 0; i < 16; ++i \n"

l_.str.65:                              ; @.str.65
	.asciz	"End of make_sprr_val\n"

l_.str.66:                              ; @.str.66
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
	.byte	1                               ; Abbrev [1] 0xb:0x96f DW_TAG_compile_unit
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
	.byte	182                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	98                              ; DW_AT_type
                                        ; DW_AT_external
	.byte	6                               ; Abbrev [6] 0x8d:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	8
	.long	399                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	187                             ; DW_AT_decl_line
	.long	98                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	7                               ; Abbrev [7] 0x9c:0x114 DW_TAG_subprogram
	.quad	Lfunc_begin1                    ; DW_AT_low_pc
.set Lset5, Lfunc_end1-Lfunc_begin1     ; DW_AT_high_pc
	.long	Lset5
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.long	277                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	199                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	1294                            ; DW_AT_type
                                        ; DW_AT_external
	.byte	8                               ; Abbrev [8] 0xb5:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	104
	.long	401                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	199                             ; DW_AT_decl_line
	.long	1294                            ; DW_AT_type
	.byte	8                               ; Abbrev [8] 0xc3:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	96
	.long	406                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	199                             ; DW_AT_decl_line
	.long	1308                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0xd1:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	92
	.long	416                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	213                             ; DW_AT_decl_line
	.long	1294                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0xdf:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	88
	.long	422                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	213                             ; DW_AT_decl_line
	.long	1294                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0xed:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	84
	.long	430                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	213                             ; DW_AT_decl_line
	.long	1294                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0xfb:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	80
	.long	438                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	213                             ; DW_AT_decl_line
	.long	1294                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x109:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	76
	.long	442                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	213                             ; DW_AT_decl_line
	.long	1294                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x117:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	72
	.long	448                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	213                             ; DW_AT_decl_line
	.long	1294                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x125:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	64
	.long	453                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	216                             ; DW_AT_decl_line
	.long	1325                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x133:0xf DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\270\177"
	.long	489                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	229                             ; DW_AT_decl_line
	.long	1354                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x142:0xf DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\260\177"
	.long	586                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	251                             ; DW_AT_decl_line
	.long	1500                            ; DW_AT_type
	.byte	9                               ; Abbrev [9] 0x151:0x10 DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\240\177"
	.long	635                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.short	256                             ; DW_AT_decl_line
	.long	1529                            ; DW_AT_type
	.byte	9                               ; Abbrev [9] 0x161:0x10 DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\230\177"
	.long	897                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.short	270                             ; DW_AT_decl_line
	.long	1889                            ; DW_AT_type
	.byte	9                               ; Abbrev [9] 0x171:0x10 DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\210\177"
	.long	912                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.short	280                             ; DW_AT_decl_line
	.long	1500                            ; DW_AT_type
	.byte	9                               ; Abbrev [9] 0x181:0x10 DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	143
	.ascii	"\200\001"
	.long	917                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.short	281                             ; DW_AT_decl_line
	.long	91                              ; DW_AT_type
	.byte	10                              ; Abbrev [10] 0x191:0x1e DW_TAG_lexical_block
	.quad	Ltmp9                           ; DW_AT_low_pc
.set Lset6, Ltmp13-Ltmp9                ; DW_AT_high_pc
	.long	Lset6
	.byte	9                               ; Abbrev [9] 0x19e:0x10 DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\224\177"
	.long	910                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.short	278                             ; DW_AT_decl_line
	.long	1294                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	11                              ; Abbrev [11] 0x1b0:0x4e DW_TAG_subprogram
	.quad	Lfunc_begin2                    ; DW_AT_low_pc
.set Lset7, Lfunc_end2-Lfunc_begin2     ; DW_AT_high_pc
	.long	Lset7
                                        ; DW_AT_APPLE_omit_frame_ptr
	.byte	1                               ; DW_AT_frame_base
	.byte	111
	.long	282                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	26                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	8                               ; Abbrev [8] 0x1c5:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	28
	.long	925                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	26                              ; DW_AT_decl_line
	.long	1294                            ; DW_AT_type
	.byte	8                               ; Abbrev [8] 0x1d3:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	16
	.long	931                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	26                              ; DW_AT_decl_line
	.long	1905                            ; DW_AT_type
	.byte	8                               ; Abbrev [8] 0x1e1:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	8
	.long	946                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	26                              ; DW_AT_decl_line
	.long	90                              ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x1ef:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	0
	.long	950                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.long	1921                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	11                              ; Abbrev [11] 0x1fe:0x4e DW_TAG_subprogram
	.quad	Lfunc_begin3                    ; DW_AT_low_pc
.set Lset8, Lfunc_end3-Lfunc_begin3     ; DW_AT_high_pc
	.long	Lset8
                                        ; DW_AT_APPLE_omit_frame_ptr
	.byte	1                               ; DW_AT_frame_base
	.byte	111
	.long	294                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	16                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	8                               ; Abbrev [8] 0x213:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	28
	.long	925                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	16                              ; DW_AT_decl_line
	.long	1294                            ; DW_AT_type
	.byte	8                               ; Abbrev [8] 0x221:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	16
	.long	931                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	16                              ; DW_AT_decl_line
	.long	1905                            ; DW_AT_type
	.byte	8                               ; Abbrev [8] 0x22f:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	8
	.long	946                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	16                              ; DW_AT_decl_line
	.long	90                              ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x23d:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	0
	.long	950                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	21                              ; DW_AT_decl_line
	.long	1921                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	12                              ; Abbrev [12] 0x24c:0x4e DW_TAG_subprogram
	.quad	Lfunc_begin4                    ; DW_AT_low_pc
.set Lset9, Lfunc_end4-Lfunc_begin4     ; DW_AT_high_pc
	.long	Lset9
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.long	306                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	36                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	8                               ; Abbrev [8] 0x261:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	120
	.long	399                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	36                              ; DW_AT_decl_line
	.long	98                              ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x26f:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	112
	.long	586                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	39                              ; DW_AT_decl_line
	.long	1500                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x27d:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	24
	.long	912                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	45                              ; DW_AT_decl_line
	.long	1500                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x28b:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	16
	.long	917                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	46                              ; DW_AT_decl_line
	.long	91                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	12                              ; Abbrev [12] 0x29a:0x78 DW_TAG_subprogram
	.quad	Lfunc_begin5                    ; DW_AT_low_pc
.set Lset10, Lfunc_end5-Lfunc_begin5    ; DW_AT_high_pc
	.long	Lset10
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.long	322                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	131                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	8                               ; Abbrev [8] 0x2af:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	120
	.long	897                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	131                             ; DW_AT_decl_line
	.long	90                              ; DW_AT_type
	.byte	8                               ; Abbrev [8] 0x2bd:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	112
	.long	399                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	131                             ; DW_AT_decl_line
	.long	98                              ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x2cb:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	104
	.long	586                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	134                             ; DW_AT_decl_line
	.long	1500                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x2d9:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	96
	.long	1353                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	136                             ; DW_AT_decl_line
	.long	98                              ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x2e7:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	88
	.long	1355                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	136                             ; DW_AT_decl_line
	.long	98                              ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x2f5:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	80
	.long	912                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	149                             ; DW_AT_decl_line
	.long	1500                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x303:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	56
	.long	917                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	150                             ; DW_AT_decl_line
	.long	91                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	13                              ; Abbrev [13] 0x312:0x7c DW_TAG_subprogram
	.quad	Lfunc_begin6                    ; DW_AT_low_pc
.set Lset11, Lfunc_end6-Lfunc_begin6    ; DW_AT_high_pc
	.long	Lset11
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.long	332                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	166                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	98                              ; DW_AT_type
	.byte	8                               ; Abbrev [8] 0x32b:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	127
	.long	1357                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	166                             ; DW_AT_decl_line
	.long	2391                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x339:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	112
	.long	586                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	169                             ; DW_AT_decl_line
	.long	1500                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x347:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	104
	.long	1386                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	171                             ; DW_AT_decl_line
	.long	98                              ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x355:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	24
	.long	912                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	176                             ; DW_AT_decl_line
	.long	1500                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x363:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	16
	.long	917                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	177                             ; DW_AT_decl_line
	.long	91                              ; DW_AT_type
	.byte	10                              ; Abbrev [10] 0x371:0x1c DW_TAG_lexical_block
	.quad	Ltmp26                          ; DW_AT_low_pc
.set Lset12, Ltmp30-Ltmp26              ; DW_AT_high_pc
	.long	Lset12
	.byte	6                               ; Abbrev [6] 0x37e:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	100
	.long	910                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	173                             ; DW_AT_decl_line
	.long	1294                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	13                              ; Abbrev [13] 0x38e:0x52 DW_TAG_subprogram
	.quad	Lfunc_begin7                    ; DW_AT_low_pc
.set Lset13, Lfunc_end7-Lfunc_begin7    ; DW_AT_high_pc
	.long	Lset13
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.long	346                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	51                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	98                              ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x3a7:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	120
	.long	586                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	54                              ; DW_AT_decl_line
	.long	1500                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x3b5:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	112
	.long	399                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	56                              ; DW_AT_decl_line
	.long	98                              ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x3c3:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	24
	.long	912                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	63                              ; DW_AT_decl_line
	.long	1500                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x3d1:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	16
	.long	917                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	64                              ; DW_AT_decl_line
	.long	91                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	13                              ; Abbrev [13] 0x3e0:0x60 DW_TAG_subprogram
	.quad	Lfunc_begin8                    ; DW_AT_low_pc
.set Lset14, Lfunc_end8-Lfunc_begin8    ; DW_AT_high_pc
	.long	Lset14
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.long	361                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	69                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	1301                            ; DW_AT_type
	.byte	8                               ; Abbrev [8] 0x3f9:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	112
	.long	897                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	69                              ; DW_AT_decl_line
	.long	90                              ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x407:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	104
	.long	586                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	72                              ; DW_AT_decl_line
	.long	1500                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x415:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	32
	.long	399                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	74                              ; DW_AT_decl_line
	.long	98                              ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x423:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	24
	.long	912                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	82                              ; DW_AT_decl_line
	.long	1500                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x431:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	16
	.long	917                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	83                              ; DW_AT_decl_line
	.long	91                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	13                              ; Abbrev [13] 0x440:0x60 DW_TAG_subprogram
	.quad	Lfunc_begin9                    ; DW_AT_low_pc
.set Lset15, Lfunc_end9-Lfunc_begin9    ; DW_AT_high_pc
	.long	Lset15
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.long	370                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	91                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	1301                            ; DW_AT_type
	.byte	8                               ; Abbrev [8] 0x459:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	112
	.long	897                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	91                              ; DW_AT_decl_line
	.long	90                              ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x467:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	104
	.long	586                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	94                              ; DW_AT_decl_line
	.long	1500                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x475:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	32
	.long	399                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	96                              ; DW_AT_decl_line
	.long	98                              ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x483:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	24
	.long	912                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	105                             ; DW_AT_decl_line
	.long	1500                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x491:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	16
	.long	917                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	106                             ; DW_AT_decl_line
	.long	91                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	13                              ; Abbrev [13] 0x4a0:0x6e DW_TAG_subprogram
	.quad	Lfunc_begin10                   ; DW_AT_low_pc
.set Lset16, Lfunc_end10-Lfunc_begin10  ; DW_AT_high_pc
	.long	Lset16
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.long	380                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	113                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	1301                            ; DW_AT_type
	.byte	8                               ; Abbrev [8] 0x4b9:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	112
	.long	897                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	113                             ; DW_AT_decl_line
	.long	90                              ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x4c7:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	104
	.long	586                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	116                             ; DW_AT_decl_line
	.long	1500                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x4d5:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	32
	.long	1390                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	118                             ; DW_AT_decl_line
	.long	2409                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x4e3:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	24
	.long	1386                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	120                             ; DW_AT_decl_line
	.long	98                              ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x4f1:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	16
	.long	912                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	122                             ; DW_AT_decl_line
	.long	1500                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x4ff:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	8
	.long	917                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	123                             ; DW_AT_decl_line
	.long	91                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	3                               ; Abbrev [3] 0x50e:0x7 DW_TAG_base_type
	.long	389                             ; DW_AT_name
	.byte	5                               ; DW_AT_encoding
	.byte	4                               ; DW_AT_byte_size
	.byte	3                               ; Abbrev [3] 0x515:0x7 DW_TAG_base_type
	.long	393                             ; DW_AT_name
	.byte	2                               ; DW_AT_encoding
	.byte	1                               ; DW_AT_byte_size
	.byte	14                              ; Abbrev [14] 0x51c:0x5 DW_TAG_pointer_type
	.long	1313                            ; DW_AT_type
	.byte	14                              ; Abbrev [14] 0x521:0x5 DW_TAG_pointer_type
	.long	1318                            ; DW_AT_type
	.byte	3                               ; Abbrev [3] 0x526:0x7 DW_TAG_base_type
	.long	411                             ; DW_AT_name
	.byte	6                               ; DW_AT_encoding
	.byte	1                               ; DW_AT_byte_size
	.byte	2                               ; Abbrev [2] 0x52d:0xb DW_TAG_typedef
	.long	1336                            ; DW_AT_type
	.long	457                             ; DW_AT_name
	.byte	6                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	2                               ; Abbrev [2] 0x538:0xb DW_TAG_typedef
	.long	1347                            ; DW_AT_type
	.long	464                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	96                              ; DW_AT_decl_line
	.byte	3                               ; Abbrev [3] 0x543:0x7 DW_TAG_base_type
	.long	480                             ; DW_AT_name
	.byte	5                               ; DW_AT_encoding
	.byte	8                               ; DW_AT_byte_size
	.byte	14                              ; Abbrev [14] 0x54a:0x5 DW_TAG_pointer_type
	.long	1359                            ; DW_AT_type
	.byte	15                              ; Abbrev [15] 0x54f:0x8d DW_TAG_structure_type
	.long	495                             ; DW_AT_name
	.byte	56                              ; DW_AT_byte_size
	.byte	7                               ; DW_AT_decl_file
	.byte	75                              ; DW_AT_decl_line
	.byte	16                              ; Abbrev [16] 0x557:0xc DW_TAG_member
	.long	498                             ; DW_AT_name
	.long	1294                            ; DW_AT_type
	.byte	7                               ; DW_AT_decl_file
	.byte	76                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x563:0xc DW_TAG_member
	.long	505                             ; DW_AT_name
	.long	1294                            ; DW_AT_type
	.byte	7                               ; DW_AT_decl_file
	.byte	77                              ; DW_AT_decl_line
	.byte	4                               ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x56f:0xc DW_TAG_member
	.long	512                             ; DW_AT_name
	.long	1294                            ; DW_AT_type
	.byte	7                               ; DW_AT_decl_file
	.byte	78                              ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x57b:0xc DW_TAG_member
	.long	520                             ; DW_AT_name
	.long	1294                            ; DW_AT_type
	.byte	7                               ; DW_AT_decl_file
	.byte	79                              ; DW_AT_decl_line
	.byte	12                              ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x587:0xc DW_TAG_member
	.long	528                             ; DW_AT_name
	.long	1294                            ; DW_AT_type
	.byte	7                               ; DW_AT_decl_file
	.byte	80                              ; DW_AT_decl_line
	.byte	16                              ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x593:0xc DW_TAG_member
	.long	535                             ; DW_AT_name
	.long	1294                            ; DW_AT_type
	.byte	7                               ; DW_AT_decl_file
	.byte	81                              ; DW_AT_decl_line
	.byte	20                              ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x59f:0xc DW_TAG_member
	.long	543                             ; DW_AT_name
	.long	1294                            ; DW_AT_type
	.byte	7                               ; DW_AT_decl_file
	.byte	82                              ; DW_AT_decl_line
	.byte	24                              ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x5ab:0xc DW_TAG_member
	.long	551                             ; DW_AT_name
	.long	1294                            ; DW_AT_type
	.byte	7                               ; DW_AT_decl_file
	.byte	83                              ; DW_AT_decl_line
	.byte	28                              ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x5b7:0xc DW_TAG_member
	.long	559                             ; DW_AT_name
	.long	1294                            ; DW_AT_type
	.byte	7                               ; DW_AT_decl_file
	.byte	84                              ; DW_AT_decl_line
	.byte	32                              ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x5c3:0xc DW_TAG_member
	.long	568                             ; DW_AT_name
	.long	1347                            ; DW_AT_type
	.byte	7                               ; DW_AT_decl_file
	.byte	85                              ; DW_AT_decl_line
	.byte	40                              ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x5cf:0xc DW_TAG_member
	.long	578                             ; DW_AT_name
	.long	1313                            ; DW_AT_type
	.byte	7                               ; DW_AT_decl_file
	.byte	86                              ; DW_AT_decl_line
	.byte	48                              ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	2                               ; Abbrev [2] 0x5dc:0xb DW_TAG_typedef
	.long	1511                            ; DW_AT_type
	.long	592                             ; DW_AT_name
	.byte	8                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	2                               ; Abbrev [2] 0x5e7:0xb DW_TAG_typedef
	.long	1522                            ; DW_AT_type
	.long	600                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	93                              ; DW_AT_decl_line
	.byte	3                               ; Abbrev [3] 0x5f2:0x7 DW_TAG_base_type
	.long	617                             ; DW_AT_name
	.byte	7                               ; DW_AT_encoding
	.byte	8                               ; DW_AT_byte_size
	.byte	17                              ; Abbrev [17] 0x5f9:0x31 DW_TAG_structure_type
	.long	638                             ; DW_AT_name
	.byte	16                              ; DW_AT_byte_size
	.byte	9                               ; DW_AT_decl_file
	.short	286                             ; DW_AT_decl_line
	.byte	18                              ; Abbrev [18] 0x602:0xd DW_TAG_member
	.long	648                             ; DW_AT_name
	.long	1578                            ; DW_AT_type
	.byte	9                               ; DW_AT_decl_file
	.short	287                             ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	18                              ; Abbrev [18] 0x60f:0xd DW_TAG_member
	.long	880                             ; DW_AT_name
	.long	50                              ; DW_AT_type
	.byte	9                               ; DW_AT_decl_file
	.short	288                             ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	18                              ; Abbrev [18] 0x61c:0xd DW_TAG_member
	.long	888                             ; DW_AT_name
	.long	1294                            ; DW_AT_type
	.byte	9                               ; DW_AT_decl_file
	.short	289                             ; DW_AT_decl_line
	.byte	12                              ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	19                              ; Abbrev [19] 0x62a:0x24 DW_TAG_union_type
	.long	648                             ; DW_AT_name
	.byte	8                               ; DW_AT_byte_size
	.byte	9                               ; DW_AT_decl_file
	.short	269                             ; DW_AT_decl_line
	.byte	18                              ; Abbrev [18] 0x633:0xd DW_TAG_member
	.long	662                             ; DW_AT_name
	.long	1614                            ; DW_AT_type
	.byte	9                               ; DW_AT_decl_file
	.short	270                             ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	18                              ; Abbrev [18] 0x640:0xd DW_TAG_member
	.long	675                             ; DW_AT_name
	.long	1626                            ; DW_AT_type
	.byte	9                               ; DW_AT_decl_file
	.short	271                             ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	14                              ; Abbrev [14] 0x64e:0x5 DW_TAG_pointer_type
	.long	1619                            ; DW_AT_type
	.byte	20                              ; Abbrev [20] 0x653:0x7 DW_TAG_subroutine_type
                                        ; DW_AT_prototyped
	.byte	21                              ; Abbrev [21] 0x654:0x5 DW_TAG_formal_parameter
	.long	1294                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	14                              ; Abbrev [14] 0x65a:0x5 DW_TAG_pointer_type
	.long	1631                            ; DW_AT_type
	.byte	20                              ; Abbrev [20] 0x65f:0x11 DW_TAG_subroutine_type
                                        ; DW_AT_prototyped
	.byte	21                              ; Abbrev [21] 0x660:0x5 DW_TAG_formal_parameter
	.long	1294                            ; DW_AT_type
	.byte	21                              ; Abbrev [21] 0x665:0x5 DW_TAG_formal_parameter
	.long	1648                            ; DW_AT_type
	.byte	21                              ; Abbrev [21] 0x66a:0x5 DW_TAG_formal_parameter
	.long	90                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	14                              ; Abbrev [14] 0x670:0x5 DW_TAG_pointer_type
	.long	1653                            ; DW_AT_type
	.byte	15                              ; Abbrev [15] 0x675:0x81 DW_TAG_structure_type
	.long	690                             ; DW_AT_name
	.byte	104                             ; DW_AT_byte_size
	.byte	9                               ; DW_AT_decl_file
	.byte	177                             ; DW_AT_decl_line
	.byte	16                              ; Abbrev [16] 0x67d:0xc DW_TAG_member
	.long	700                             ; DW_AT_name
	.long	1294                            ; DW_AT_type
	.byte	9                               ; DW_AT_decl_file
	.byte	178                             ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x689:0xc DW_TAG_member
	.long	709                             ; DW_AT_name
	.long	1294                            ; DW_AT_type
	.byte	9                               ; DW_AT_decl_file
	.byte	179                             ; DW_AT_decl_line
	.byte	4                               ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x695:0xc DW_TAG_member
	.long	718                             ; DW_AT_name
	.long	1294                            ; DW_AT_type
	.byte	9                               ; DW_AT_decl_file
	.byte	180                             ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x6a1:0xc DW_TAG_member
	.long	726                             ; DW_AT_name
	.long	1782                            ; DW_AT_type
	.byte	9                               ; DW_AT_decl_file
	.byte	181                             ; DW_AT_decl_line
	.byte	12                              ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x6ad:0xc DW_TAG_member
	.long	764                             ; DW_AT_name
	.long	1815                            ; DW_AT_type
	.byte	9                               ; DW_AT_decl_file
	.byte	182                             ; DW_AT_decl_line
	.byte	16                              ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x6b9:0xc DW_TAG_member
	.long	792                             ; DW_AT_name
	.long	1294                            ; DW_AT_type
	.byte	9                               ; DW_AT_decl_file
	.byte	183                             ; DW_AT_decl_line
	.byte	20                              ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x6c5:0xc DW_TAG_member
	.long	802                             ; DW_AT_name
	.long	90                              ; DW_AT_type
	.byte	9                               ; DW_AT_decl_file
	.byte	184                             ; DW_AT_decl_line
	.byte	24                              ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x6d1:0xc DW_TAG_member
	.long	810                             ; DW_AT_name
	.long	1837                            ; DW_AT_type
	.byte	9                               ; DW_AT_decl_file
	.byte	185                             ; DW_AT_decl_line
	.byte	32                              ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x6dd:0xc DW_TAG_member
	.long	846                             ; DW_AT_name
	.long	1347                            ; DW_AT_type
	.byte	9                               ; DW_AT_decl_file
	.byte	186                             ; DW_AT_decl_line
	.byte	40                              ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x6e9:0xc DW_TAG_member
	.long	854                             ; DW_AT_name
	.long	1870                            ; DW_AT_type
	.byte	9                               ; DW_AT_decl_file
	.byte	187                             ; DW_AT_decl_line
	.byte	48                              ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	2                               ; Abbrev [2] 0x6f6:0xb DW_TAG_typedef
	.long	1793                            ; DW_AT_type
	.long	733                             ; DW_AT_name
	.byte	10                              ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	2                               ; Abbrev [2] 0x701:0xb DW_TAG_typedef
	.long	1804                            ; DW_AT_type
	.long	739                             ; DW_AT_name
	.byte	2                               ; DW_AT_decl_file
	.byte	72                              ; DW_AT_decl_line
	.byte	2                               ; Abbrev [2] 0x70c:0xb DW_TAG_typedef
	.long	1294                            ; DW_AT_type
	.long	754                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	20                              ; DW_AT_decl_line
	.byte	2                               ; Abbrev [2] 0x717:0xb DW_TAG_typedef
	.long	1826                            ; DW_AT_type
	.long	771                             ; DW_AT_name
	.byte	11                              ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	2                               ; Abbrev [2] 0x722:0xb DW_TAG_typedef
	.long	72                              ; DW_AT_type
	.long	777                             ; DW_AT_name
	.byte	2                               ; DW_AT_decl_file
	.byte	75                              ; DW_AT_decl_line
	.byte	22                              ; Abbrev [22] 0x72d:0x21 DW_TAG_union_type
	.long	819                             ; DW_AT_name
	.byte	8                               ; DW_AT_byte_size
	.byte	9                               ; DW_AT_decl_file
	.byte	158                             ; DW_AT_decl_line
	.byte	16                              ; Abbrev [16] 0x735:0xc DW_TAG_member
	.long	826                             ; DW_AT_name
	.long	1294                            ; DW_AT_type
	.byte	9                               ; DW_AT_decl_file
	.byte	160                             ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x741:0xc DW_TAG_member
	.long	836                             ; DW_AT_name
	.long	90                              ; DW_AT_type
	.byte	9                               ; DW_AT_decl_file
	.byte	161                             ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	23                              ; Abbrev [23] 0x74e:0xc DW_TAG_array_type
	.long	1522                            ; DW_AT_type
	.byte	24                              ; Abbrev [24] 0x753:0x6 DW_TAG_subrange_type
	.long	1882                            ; DW_AT_type
	.byte	7                               ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	25                              ; Abbrev [25] 0x75a:0x7 DW_TAG_base_type
	.long	860                             ; DW_AT_name
	.byte	8                               ; DW_AT_byte_size
	.byte	7                               ; DW_AT_encoding
	.byte	14                              ; Abbrev [14] 0x761:0x5 DW_TAG_pointer_type
	.long	1894                            ; DW_AT_type
	.byte	2                               ; Abbrev [2] 0x766:0xb DW_TAG_typedef
	.long	83                              ; DW_AT_type
	.long	901                             ; DW_AT_name
	.byte	12                              ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	14                              ; Abbrev [14] 0x771:0x5 DW_TAG_pointer_type
	.long	1910                            ; DW_AT_type
	.byte	2                               ; Abbrev [2] 0x776:0xb DW_TAG_typedef
	.long	1653                            ; DW_AT_type
	.long	936                             ; DW_AT_name
	.byte	9                               ; DW_AT_decl_file
	.byte	188                             ; DW_AT_decl_line
	.byte	14                              ; Abbrev [14] 0x781:0x5 DW_TAG_pointer_type
	.long	1926                            ; DW_AT_type
	.byte	2                               ; Abbrev [2] 0x786:0xb DW_TAG_typedef
	.long	1937                            ; DW_AT_type
	.long	953                             ; DW_AT_name
	.byte	13                              ; DW_AT_decl_file
	.byte	57                              ; DW_AT_decl_line
	.byte	26                              ; Abbrev [26] 0x791:0x5e DW_TAG_structure_type
	.long	964                             ; DW_AT_name
	.short	880                             ; DW_AT_byte_size
	.byte	13                              ; DW_AT_decl_file
	.byte	43                              ; DW_AT_decl_line
	.byte	16                              ; Abbrev [16] 0x79a:0xc DW_TAG_member
	.long	982                             ; DW_AT_name
	.long	1294                            ; DW_AT_type
	.byte	13                              ; DW_AT_decl_file
	.byte	45                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x7a6:0xc DW_TAG_member
	.long	993                             ; DW_AT_name
	.long	61                              ; DW_AT_type
	.byte	13                              ; DW_AT_decl_file
	.byte	46                              ; DW_AT_decl_line
	.byte	4                               ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x7b2:0xc DW_TAG_member
	.long	1004                            ; DW_AT_name
	.long	2031                            ; DW_AT_type
	.byte	13                              ; DW_AT_decl_file
	.byte	47                              ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x7be:0xc DW_TAG_member
	.long	1073                            ; DW_AT_name
	.long	2087                            ; DW_AT_type
	.byte	13                              ; DW_AT_decl_file
	.byte	48                              ; DW_AT_decl_line
	.byte	32                              ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x7ca:0xc DW_TAG_member
	.long	1081                            ; DW_AT_name
	.long	2076                            ; DW_AT_type
	.byte	13                              ; DW_AT_decl_file
	.byte	49                              ; DW_AT_decl_line
	.byte	40                              ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x7d6:0xc DW_TAG_member
	.long	1091                            ; DW_AT_name
	.long	2092                            ; DW_AT_type
	.byte	13                              ; DW_AT_decl_file
	.byte	50                              ; DW_AT_decl_line
	.byte	48                              ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x7e2:0xc DW_TAG_member
	.long	1337                            ; DW_AT_name
	.long	2097                            ; DW_AT_type
	.byte	13                              ; DW_AT_decl_file
	.byte	52                              ; DW_AT_decl_line
	.byte	64                              ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	15                              ; Abbrev [15] 0x7ef:0x2d DW_TAG_structure_type
	.long	1013                            ; DW_AT_name
	.byte	24                              ; DW_AT_byte_size
	.byte	14                              ; DW_AT_decl_file
	.byte	42                              ; DW_AT_decl_line
	.byte	16                              ; Abbrev [16] 0x7f7:0xc DW_TAG_member
	.long	1034                            ; DW_AT_name
	.long	90                              ; DW_AT_type
	.byte	14                              ; DW_AT_decl_file
	.byte	44                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x803:0xc DW_TAG_member
	.long	1040                            ; DW_AT_name
	.long	2076                            ; DW_AT_type
	.byte	14                              ; DW_AT_decl_file
	.byte	45                              ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x80f:0xc DW_TAG_member
	.long	1064                            ; DW_AT_name
	.long	1294                            ; DW_AT_type
	.byte	14                              ; DW_AT_decl_file
	.byte	46                              ; DW_AT_decl_line
	.byte	16                              ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	2                               ; Abbrev [2] 0x81c:0xb DW_TAG_typedef
	.long	1522                            ; DW_AT_type
	.long	1048                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	68                              ; DW_AT_decl_line
	.byte	14                              ; Abbrev [14] 0x827:0x5 DW_TAG_pointer_type
	.long	1937                            ; DW_AT_type
	.byte	14                              ; Abbrev [14] 0x82c:0x5 DW_TAG_pointer_type
	.long	2097                            ; DW_AT_type
	.byte	26                              ; Abbrev [26] 0x831:0x2f DW_TAG_structure_type
	.long	1103                            ; DW_AT_name
	.short	816                             ; DW_AT_byte_size
	.byte	16                              ; DW_AT_decl_file
	.byte	62                              ; DW_AT_decl_line
	.byte	16                              ; Abbrev [16] 0x83a:0xc DW_TAG_member
	.long	1123                            ; DW_AT_name
	.long	2144                            ; DW_AT_type
	.byte	16                              ; DW_AT_decl_file
	.byte	64                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x846:0xc DW_TAG_member
	.long	1194                            ; DW_AT_name
	.long	2200                            ; DW_AT_type
	.byte	16                              ; DW_AT_decl_file
	.byte	65                              ; DW_AT_decl_line
	.byte	16                              ; DW_AT_data_member_location
	.byte	27                              ; Abbrev [27] 0x852:0xd DW_TAG_member
	.long	1258                            ; DW_AT_name
	.long	2309                            ; DW_AT_type
	.byte	16                              ; DW_AT_decl_file
	.byte	66                              ; DW_AT_decl_line
	.short	288                             ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	15                              ; Abbrev [15] 0x860:0x2d DW_TAG_structure_type
	.long	1128                            ; DW_AT_name
	.byte	16                              ; DW_AT_byte_size
	.byte	15                              ; DW_AT_decl_file
	.byte	57                              ; DW_AT_decl_line
	.byte	16                              ; Abbrev [16] 0x868:0xc DW_TAG_member
	.long	1159                            ; DW_AT_name
	.long	2189                            ; DW_AT_type
	.byte	15                              ; DW_AT_decl_file
	.byte	59                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x874:0xc DW_TAG_member
	.long	1176                            ; DW_AT_name
	.long	72                              ; DW_AT_type
	.byte	15                              ; DW_AT_decl_file
	.byte	60                              ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x880:0xc DW_TAG_member
	.long	1182                            ; DW_AT_name
	.long	72                              ; DW_AT_type
	.byte	15                              ; DW_AT_decl_file
	.byte	61                              ; DW_AT_decl_line
	.byte	12                              ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	2                               ; Abbrev [2] 0x88d:0xb DW_TAG_typedef
	.long	109                             ; DW_AT_type
	.long	1165                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	23                              ; DW_AT_decl_line
	.byte	26                              ; Abbrev [26] 0x898:0x61 DW_TAG_structure_type
	.long	1199                            ; DW_AT_name
	.short	272                             ; DW_AT_byte_size
	.byte	15                              ; DW_AT_decl_file
	.byte	134                             ; DW_AT_decl_line
	.byte	16                              ; Abbrev [16] 0x8a1:0xc DW_TAG_member
	.long	1227                            ; DW_AT_name
	.long	2297                            ; DW_AT_type
	.byte	15                              ; DW_AT_decl_file
	.byte	136                             ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x8ad:0xc DW_TAG_member
	.long	1231                            ; DW_AT_name
	.long	2189                            ; DW_AT_type
	.byte	15                              ; DW_AT_decl_file
	.byte	137                             ; DW_AT_decl_line
	.byte	232                             ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x8b9:0xc DW_TAG_member
	.long	1236                            ; DW_AT_name
	.long	2189                            ; DW_AT_type
	.byte	15                              ; DW_AT_decl_file
	.byte	138                             ; DW_AT_decl_line
	.byte	240                             ; DW_AT_data_member_location
	.byte	16                              ; Abbrev [16] 0x8c5:0xc DW_TAG_member
	.long	1241                            ; DW_AT_name
	.long	2189                            ; DW_AT_type
	.byte	15                              ; DW_AT_decl_file
	.byte	139                             ; DW_AT_decl_line
	.byte	248                             ; DW_AT_data_member_location
	.byte	27                              ; Abbrev [27] 0x8d1:0xd DW_TAG_member
	.long	1246                            ; DW_AT_name
	.long	2189                            ; DW_AT_type
	.byte	15                              ; DW_AT_decl_file
	.byte	140                             ; DW_AT_decl_line
	.short	256                             ; DW_AT_data_member_location
	.byte	27                              ; Abbrev [27] 0x8de:0xd DW_TAG_member
	.long	1251                            ; DW_AT_name
	.long	72                              ; DW_AT_type
	.byte	15                              ; DW_AT_decl_file
	.byte	141                             ; DW_AT_decl_line
	.short	264                             ; DW_AT_data_member_location
	.byte	27                              ; Abbrev [27] 0x8eb:0xd DW_TAG_member
	.long	854                             ; DW_AT_name
	.long	72                              ; DW_AT_type
	.byte	15                              ; DW_AT_decl_file
	.byte	142                             ; DW_AT_decl_line
	.short	268                             ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	23                              ; Abbrev [23] 0x8f9:0xc DW_TAG_array_type
	.long	2189                            ; DW_AT_type
	.byte	24                              ; Abbrev [24] 0x8fe:0x6 DW_TAG_subrange_type
	.long	1882                            ; DW_AT_type
	.byte	29                              ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	28                              ; Abbrev [28] 0x905:0x34 DW_TAG_structure_type
	.long	1263                            ; DW_AT_name
	.short	528                             ; DW_AT_byte_size
	.byte	15                              ; DW_AT_decl_file
	.short	441                             ; DW_AT_decl_line
	.byte	18                              ; Abbrev [18] 0x90f:0xd DW_TAG_member
	.long	1289                            ; DW_AT_name
	.long	2361                            ; DW_AT_type
	.byte	15                              ; DW_AT_decl_file
	.short	443                             ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	29                              ; Abbrev [29] 0x91c:0xe DW_TAG_member
	.long	1323                            ; DW_AT_name
	.long	72                              ; DW_AT_type
	.byte	15                              ; DW_AT_decl_file
	.short	444                             ; DW_AT_decl_line
	.short	512                             ; DW_AT_data_member_location
	.byte	29                              ; Abbrev [29] 0x92a:0xe DW_TAG_member
	.long	1330                            ; DW_AT_name
	.long	72                              ; DW_AT_type
	.byte	15                              ; DW_AT_decl_file
	.short	445                             ; DW_AT_decl_line
	.short	516                             ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	23                              ; Abbrev [23] 0x939:0xc DW_TAG_array_type
	.long	2373                            ; DW_AT_type
	.byte	24                              ; Abbrev [24] 0x93e:0x6 DW_TAG_subrange_type
	.long	1882                            ; DW_AT_type
	.byte	32                              ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	2                               ; Abbrev [2] 0x945:0xb DW_TAG_typedef
	.long	2384                            ; DW_AT_type
	.long	1293                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	3                               ; Abbrev [3] 0x950:0x7 DW_TAG_base_type
	.long	1305                            ; DW_AT_name
	.byte	7                               ; DW_AT_encoding
	.byte	16                              ; DW_AT_byte_size
	.byte	2                               ; Abbrev [2] 0x957:0xb DW_TAG_typedef
	.long	2402                            ; DW_AT_type
	.long	1364                            ; DW_AT_name
	.byte	17                              ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	3                               ; Abbrev [3] 0x962:0x7 DW_TAG_base_type
	.long	1372                            ; DW_AT_name
	.byte	8                               ; DW_AT_encoding
	.byte	1                               ; DW_AT_byte_size
	.byte	14                              ; Abbrev [14] 0x969:0x5 DW_TAG_pointer_type
	.long	2414                            ; DW_AT_type
	.byte	30                              ; Abbrev [30] 0x96e:0xb DW_TAG_subroutine_type
	.long	98                              ; DW_AT_type
                                        ; DW_AT_prototyped
	.byte	21                              ; Abbrev [21] 0x973:0x5 DW_TAG_formal_parameter
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
	.long	432
	.long	0
LNames2:
	.long	306                             ; write_sprr_perm
	.long	1                               ; Num DIEs
	.long	588
	.long	0
LNames4:
	.long	322                             ; sprr_test
	.long	1                               ; Num DIEs
	.long	666
	.long	0
LNames0:
	.long	380                             ; can_exec
	.long	1                               ; Num DIEs
	.long	1184
	.long	0
LNames3:
	.long	277                             ; main
	.long	1                               ; Num DIEs
	.long	156
	.long	0
LNames6:
	.long	346                             ; read_sprr_perm
	.long	1                               ; Num DIEs
	.long	910
	.long	0
LNames8:
	.long	294                             ; sev_handler
	.long	1                               ; Num DIEs
	.long	510
	.long	0
LNames10:
	.long	361                             ; can_read
	.long	1                               ; Num DIEs
	.long	992
	.long	0
LNames1:
	.long	267                             ; read_sprr
	.long	1                               ; Num DIEs
	.long	116
	.long	0
LNames7:
	.long	332                             ; make_sprr_val
	.long	1                               ; Num DIEs
	.long	786
	.long	0
LNames9:
	.long	370                             ; can_write
	.long	1                               ; Num DIEs
	.long	1088
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
	.long	1511
	.short	22
	.byte	0
	.long	0
Ltypes13:
	.long	771                             ; uid_t
	.long	1                               ; Num DIEs
	.long	1815
	.short	22
	.byte	0
	.long	0
Ltypes7:
	.long	690                             ; __siginfo
	.long	1                               ; Num DIEs
	.long	1653
	.short	19
	.byte	0
	.long	0
Ltypes3:
	.long	464                             ; __darwin_time_t
	.long	1                               ; Num DIEs
	.long	1336
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
	.long	2144
	.short	19
	.byte	0
	.long	0
Ltypes41:
	.long	1013                            ; __darwin_sigaltstack
	.long	1                               ; Num DIEs
	.long	2031
	.short	19
	.byte	0
	.long	0
Ltypes9:
	.long	1293                            ; __uint128_t
	.long	1                               ; Num DIEs
	.long	2373
	.short	22
	.byte	0
	.long	0
Ltypes30:
	.long	754                             ; __int32_t
	.long	1                               ; Num DIEs
	.long	1804
	.short	22
	.byte	0
	.long	0
Ltypes8:
	.long	1364                            ; uint8_t
	.long	1                               ; Num DIEs
	.long	2391
	.short	22
	.byte	0
	.long	0
Ltypes21:
	.long	592                             ; clock_t
	.long	1                               ; Num DIEs
	.long	1500
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
	.long	1318
	.short	36
	.byte	0
	.long	0
Ltypes1:
	.long	457                             ; time_t
	.long	1                               ; Num DIEs
	.long	1325
	.short	22
	.byte	0
	.long	0
Ltypes37:
	.long	1263                            ; __darwin_arm_neon_state64
	.long	1                               ; Num DIEs
	.long	2309
	.short	19
	.byte	0
	.long	0
Ltypes18:
	.long	480                             ; long int
	.long	1                               ; Num DIEs
	.long	1347
	.short	36
	.byte	0
	.long	0
Ltypes33:
	.long	648                             ; __sigaction_u
	.long	1                               ; Num DIEs
	.long	1578
	.short	23
	.byte	0
	.long	0
Ltypes38:
	.long	964                             ; __darwin_ucontext
	.long	1                               ; Num DIEs
	.long	1937
	.short	19
	.byte	0
	.long	0
Ltypes35:
	.long	860                             ; __ARRAY_SIZE_TYPE__
	.long	1                               ; Num DIEs
	.long	1882
	.short	36
	.byte	0
	.long	0
Ltypes2:
	.long	1199                            ; __darwin_arm_thread_state64
	.long	1                               ; Num DIEs
	.long	2200
	.short	19
	.byte	0
	.long	0
Ltypes36:
	.long	1103                            ; __darwin_mcontext64
	.long	1                               ; Num DIEs
	.long	2097
	.short	19
	.byte	0
	.long	0
Ltypes11:
	.long	1048                            ; __darwin_size_t
	.long	1                               ; Num DIEs
	.long	2076
	.short	22
	.byte	0
	.long	0
Ltypes6:
	.long	393                             ; _Bool
	.long	1                               ; Num DIEs
	.long	1301
	.short	36
	.byte	0
	.long	0
Ltypes16:
	.long	901                             ; uint32_t
	.long	1                               ; Num DIEs
	.long	1894
	.short	22
	.byte	0
	.long	0
Ltypes26:
	.long	1165                            ; __uint64_t
	.long	1                               ; Num DIEs
	.long	2189
	.short	22
	.byte	0
	.long	0
Ltypes32:
	.long	638                             ; sigaction
	.long	1                               ; Num DIEs
	.long	1529
	.short	19
	.byte	0
	.long	0
Ltypes22:
	.long	495                             ; tm
	.long	1                               ; Num DIEs
	.long	1359
	.short	19
	.byte	0
	.long	0
Ltypes27:
	.long	819                             ; sigval
	.long	1                               ; Num DIEs
	.long	1837
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
	.long	1793
	.short	22
	.byte	0
	.long	0
Ltypes5:
	.long	389                             ; int
	.long	1                               ; Num DIEs
	.long	1294
	.short	36
	.byte	0
	.long	0
Ltypes0:
	.long	1305                            ; unsigned __int128
	.long	1                               ; Num DIEs
	.long	2384
	.short	36
	.byte	0
	.long	0
Ltypes24:
	.long	936                             ; siginfo_t
	.long	1                               ; Num DIEs
	.long	1910
	.short	22
	.byte	0
	.long	0
Ltypes10:
	.long	733                             ; pid_t
	.long	1                               ; Num DIEs
	.long	1782
	.short	22
	.byte	0
	.long	0
Ltypes31:
	.long	953                             ; ucontext_t
	.long	1                               ; Num DIEs
	.long	1926
	.short	22
	.byte	0
	.long	0
Ltypes14:
	.long	777                             ; __darwin_uid_t
	.long	1                               ; Num DIEs
	.long	1826
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
	.long	2402
	.short	36
	.byte	0
	.long	0
Ltypes15:
	.long	617                             ; long unsigned int
	.long	1                               ; Num DIEs
	.long	1522
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
