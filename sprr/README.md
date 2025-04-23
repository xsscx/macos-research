### M1 Apple Silicon SPRR Permission Configuration Register (EL0) SPRR_PERM_EL0 s3_6_c15_c1_5 Check & Other M1 Register Fuzzing Code

On May 6, 2021 a Post by Sven Peter about Apple Silicon Hardware Secrets: SPRR and Guarded Exception Levels (GXF) at URL https://blog.svenpeter.dev/posts/m1_sprr_gxf/ appeared in my Timeline. I had just been reviewing https://github.com/AsahiLinux/m1n1/blob/main/tools/apple_regs.json.

An interesting Read but no additional information was provided with respect to Fuzzing those 64 Register Bits, just performing a Bit Flip with the provided example SPRR JIT test code. My first thoughts were: What happens when the Program Counter (PC) and/or Link Register (LR) are lightly Fuzzed? Pitchfork / Clusterbomb.

Requirement: SIP OFF, Startup Security Off

Example: cx->uc_mcontext->```__ss.__pc += (i) ... for (int i = 0; i < 256; ++i)``` 

Expected Results (Source: https://blog.svenpeter.dev/posts/m1_sprr_gxf/)
--------------------------------------
```
register value	page permissions
00	---
01	r-x
10	r--
11	rw-
```

Actual Results: 
Expected and Undefined behavior which is the Subject of this Post, see all Results below.

Example PoC for SPRR Permission Configuration Register (EL0) SPRR_PERM_EL0 s3_6_c15_c1_5 rwx
==============================
```
Required: SIP OFF
```
PoC Commit https://github.com/xsscx/macos-research/commit/2aa7cef304994254e45004b248d815b04498b6f7
```diff sprr.c ss-cpsr.c
17c17
<     cx->uc_mcontext->__ss.__pc = cx->uc_mcontext->__ss.__lr;
---
>     cx->uc_mcontext->__ss.__pc = cx->uc_mcontext->__ss.__lr += 4;
26c26
<     cx->uc_mcontext->__ss.__pc += 4;
---
>     cx->uc_mcontext->__ss.__pc += 8;

2010000030000000: rwx
2010000030100000: rwx
2010000030200000: rwx
2010000030300000: rwx
```

### Code Profiling, Reporting and Build Info
 
 Comments, Build, Profiling Instructions added by dhoyt | @h02332 on May 23, 2021
 UBSAN Report with Xcode Profiling Instructions. Use the original code and modify as seen in PoC.

Compile
-------
- export SDKROOT=$(xcrun --sdk macosx --show-sdk-path)
- clang -g -O0 -fsanitize=undefined -fno-omit-frame-pointer  -o S3_6_c15_c1_5 S3_6_c15_c1_5.c
 
Run
------
./S3_6_c15_c1_5

or

time ./S3_6_c15_c1_5

Run 50-100x, watch Crash Reports accumulate, works better with shell script.
 
The instructions below are for those who many want to Instrument the Register Fuzzing and confirm Code Coverage when implementing multi Register Fuzzing and ++i loops to increment PC & LR. 

PROFILE BUILD 
---------
```
clang -fprofile-instr-generate -fcoverage-mapping -mllvm -runtime-counter-relocation -g -fsanitize=undefined -O0 -o a.out code.c
 ```
PROFILE 
--------
```
LLVM_PROFILE_FILE=default.profraw ./a.out
xcrun llvm-profdata merge -sparse default.profraw -o a.profdata
xcrun llvm-cov show ./a.out -instr-profile=a.profdata
```
REPORT
--------
```
xcrun llvm-cov show ./a.out -instr-profile=a.profdata --show-regions=0 -show-line-counts-or-regions -show-instantiation-summary
xcrun llvm-cov report ./a.out -instr-profile=a.profdata
sudo gcovr --gcov-executable "xcrun llvm-cov gcov" -r . --html --html-details -o out.html

RUN
	LLVM_PROFILE_FILE=default.profraw ./a.out
```
Fuzzing S3_6_c15_c1_5 Program Counter __ss.__pc =+ (i) .... for (int i = 0; i < 32; ++i)
==============================================================================
```
cx->uc_mcontext->__ss.__pc +=   + 1
2010000030000000: ---
2010000030100000: r-x
2010000030200000: r--
2010000030300000: rw-
cx->uc_mcontext->__ss.__pc +=   + 2
2010000030000000: ---
2010000030100000: r-x
2010000030200000: r--
2010000030300000: rw-
cx->uc_mcontext->__ss.__pc +=   + 3
2010000030000000: rw-
2010000030100000: rwx
2010000030200000: rw-
2010000030300000: rw-
cx->uc_mcontext->__ss.__pc +=   + 4
2010000030000000: ---
2010000030100000: r-x
2010000030200000: r--
2010000030300000: rw-
cx->uc_mcontext->__ss.__pc +=   + 5
2010000030000000: rw-
2010000030100000: rwx
2010000030200000: rw-
2010000030300000: rw-
cx->uc_mcontext->__ss.__pc +=   + 6
2010000030000000: rw-
2010000030100000: rwx
2010000030200000: rw-
2010000030300000: rw-
cx->uc_mcontext->__ss.__pc +=   + 7
2010000030000000: ---
2010000030100000: rwx
2010000030200000: rw-
2010000030300000: rw-
cx->uc_mcontext->__ss.__pc +=   + 8
2010000030000000: rw-
2010000030100000: rwx
2010000030200000: rw-
2010000030300000: rw-
cx->uc_mcontext->__ss.__pc +=   + 9
2010000030000000: ---
2010000030100000: r-x
2010000030200000: r--
2010000030300000: rw-
cx->uc_mcontext->__ss.__pc +=   + 10
2010000030000000: rw-
2010000030100000: rwx
2010000030200000: rw-
2010000030300000: rw-
cx->uc_mcontext->__ss.__pc +=   + 11
2010000030000000: ---
2010000030100000: rwx
2010000030200000: rw-
2010000030300000: rw-
cx->uc_mcontext->__ss.__pc +=   + 12
2010000030000000: rw-
2010000030100000: rwx
2010000030200000: rw-
2010000030300000: rw-
cx->uc_mcontext->__ss.__pc +=   + 13
2010000030000000: ---
2010000030100000: r-x
2010000030200000: r--
2010000030300000: rw-
cx->uc_mcontext->__ss.__pc +=   + 14
2010000030000000: ---
2010000030100000: rwx
2010000030200000: rw-
2010000030300000: rw-
cx->uc_mcontext->__ss.__pc +=   + 15
2010000030000000: ---
2010000030100000: rwx
2010000030200000: rw-
2010000030300000: rw-
cx->uc_mcontext->__ss.__pc +=   + 16
2010000030000000: rw-
2010000030100000: rwx
2010000030200000: rw-
2010000030300000: rw-
cx->uc_mcontext->__ss.__pc +=   + 17
2010000030000000: rw-
2010000030100000: rwx
2010000030200000: rw-
2010000030300000: rw-
cx->uc_mcontext->__ss.__pc +=   + 18
2010000030000000: ---
2010000030100000: r-x
2010000030200000: r--
2010000030300000: rw-
cx->uc_mcontext->__ss.__pc +=   + 19
2010000030000000: ?--
---HANG---
cx->uc_mcontext->__ss.__pc +=   + 20
2010000030000000: rw-
2010000030100000: rwx
2010000030200000: rw-
2010000030300000: rw-
cx->uc_mcontext->__ss.__pc +=   + 21
---HANG---
cx->uc_mcontext->__ss.__pc +=   + 22
2010000030000000: ---
2010000030100000: rwx
2010000030200000: rw-
2010000030300000: rw-
cx->uc_mcontext->__ss.__pc +=   + 23
---HANG---
cx->uc_mcontext->__ss.__pc +=   + 24
2010000030000000: -w-
2010000030100000: rwx
2010000030200000: rw-
2010000030300000: rw-
cx->uc_mcontext->__ss.__pc +=   + 25
---HANG---
cx->uc_mcontext->__ss.__pc +=   + 26
2010000030000000: ---
2010000030100000: r-x
2010000030200000: r--
2010000030300000: rw-
cx->uc_mcontext->__ss.__pc +=   + 27
2010000030000000: ---
2010000030100000: rwx
2010000030200000: rw-
2010000030300000: rw-
cx->uc_mcontext->__ss.__pc +=   + 28
2010000030000000: ---
2010000030100000: rwx
2010000030200000: rw-
2010000030300000: rw-
cx->uc_mcontext->__ss.__pc +=   + 29
---HANG---
cx->uc_mcontext->__ss.__pc +=   + 30
2010000030000000: ---
2010000030100000: rwx
2010000030200000: rw-
2010000030300000: rw-
cx->uc_mcontext->__ss.__pc +=   + 31
---HANG---
cx->uc_mcontext->__ss.__pc +=   + 32
2010000030000000: ---
2010000030100000: r-x
2010000030200000: r--
2010000030300000: rw-


cx->uc_mcontext->__ss.__pc +=   + 256
---HANG---
```

UNDEFINED BEHAVIOR SANITIZER OUTPUT - UBSAN
================================================
```
REPRO - SIP OFF, ALL M1 SECURITY OFF
LLVM_PROFILE_FILE=default.profraw ./a.out
...
code.c:25:9: runtime error: member access within misaligned address 0x00016d0471b8 for type 'ucontext_t' (aka 'struct __darwin_ucontext'), which requires 16 byte alignment
0x00016d0471b8: note: pointer points here
 00 00 00 00  00 00 00 00 00 00 00 00  50 71 04 6d 01 00 00 00  00 00 00 00 00 00 00 00  00 00 00 00
              ^ 
SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior code.c:25:9 in 
code.c:25:9: runtime error: load of misaligned address 0x00016d0471e8 for type 'struct __darwin_mcontext64 *', which requires 16 byte alignment
0x00016d0471e8: note: pointer points here
 00 00 00 00  f0 71 04 6d 01 00 00 00  00 00 ea 02 01 00 00 00  0f 00 00 92 00 00 00 00  00 00 ea 02
              ^ 
SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior code.c:25:9 in 
code.c:26:9: runtime error: member access within misaligned address 0x00016d0471b8 for type 'ucontext_t' (aka 'struct __darwin_ucontext'), which requires 16 byte alignment
0x00016d0471b8: note: pointer points here
 00 00 00 00  00 00 00 00 00 00 00 00  50 71 04 6d 01 00 00 00  00 00 00 00 00 00 00 00  00 00 00 00
              ^ 
SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior code.c:26:9 in 
code.c:26:9: runtime error: load of misaligned address 0x00016d0471e8 for type 'struct __darwin_mcontext64 *', which requires 16 byte alignment
0x00016d0471e8: note: pointer points here
 00 00 00 00  f0 71 04 6d 01 00 00 00  00 00 ea 02 01 00 00 00  0f 00 00 92 00 00 00 00  41 41 41 41
              ^ 
SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior code.c:26:9 in 
Thread 0 Crashed:: Dispatch queue: com.apple.main-thread
0   dyld                          	0x0000000102ea4000 0x102ea4000 + 0
1   code				                  	0x0000000102dbbcc4 sprr_test + 80 (code.c:92)
2   code        				          	0x0000000102dbb684 main + 172 (code.c:122)
3   libdyld.dylib                 	0x0000000186c89420 start + 4
Thread 0 crashed with ARM Thread State (64-bit):
    x0: 0x0000000041414141   x1: 0x0000000000000000   x2: 0x0000000000000007   x3: 0x0000000000041802
    x4: 0x00000000ffffffff   x5: 0x0000000000000000   x6: 0x0000000000000000   x7: 0x0000000000000000
    x8: 0x0000000102ea0000   x9: 0x0000000041414141  x10: 0x0000000000000000  x11: 0x00000001fe0525cb
   x12: 0x00000001fe0525cb  x13: 0x0000000000000033  x14: 0x0000000000000881  x15: 0x000000008000001f
   x16: 0x00000000000000c5  x17: 0x0000000102ec5f24  x18: 0x0000000000000000  x19: 0x2010000030000000
   x20: 0x0000000102ea0000  x21: 0x0000000000000000  x22: 0x0000000000000000  x23: 0x0000000000000000
   x24: 0x0000000000000000  x25: 0x0000000000000000  x26: 0x0000000000000000  x27: 0x0000000000000000
   x28: 0x000000016d047648   fp: 0x000000016d047590   lr: 0x0000000102dbbd98
    sp: 0x000000016d047590   pc: 0x0000000102ea4000 cpsr: 0x60000000
   far: 0x0000000102ea3ffc  esr: 0x02000000
Binary Images:
       0x102db8000 -        0x102dbbfff +smoke32-user (0) /Users/USER/*/smoke32-user
       0x102ea4000 -        0x102f23fff  dyld (851.27)  /usr/lib/dyld
       0x102fac000 -        0x102fd7fff +libclang_rt.ubsan_osx_dynamic.dylib (1205.0.22.9) ../clang/12.0.5/lib/darwin/libclang_rt.ubsan_osx_dynamic.dylib
```

Register Definitions
==========
Source URL https://github.com/AsahiLinux/m1n1/blob/main/tools/apple_regs.json
```
Hardware Implementation-Dependent Register 0	HID0_EL1	s3_0_c15_c0_0	64
Hardware Implementation-Dependent Register 0 (E-core)	EHID0_EL1	s3_0_c15_c0_1	64	
Hardware Implementation-Dependent Register 1	HID1_EL1	s3_0_c15_c1_0	64	
Hardware Implementation-Dependent Register 1 (E-core)	EHID1_EL1	s3_0_c15_c1_1	64	
Hardware Implementation-Dependent Register 2	HID2_EL1	s3_0_c15_c2_0	64	
Hardware Implementation-Dependent Register 2 (E-core)	EHID2_EL1	s3_0_c15_c2_1	64	
Hardware Implementation-Dependent Register 3	HID3_EL1	s3_0_c15_c3_0	64	
Hardware Implementation-Dependent Register 3 (E-core)	EHID3_EL1	s3_0_c15_c3_1	64	
Hardware Implementation-Dependent Register 4	HID4_EL1	s3_0_c15_c4_0	64	
Hardware Implementation-Dependent Register 4 (E-core)	EHID4_EL1	s3_0_c15_c4_1	64	
Hardware Implementation-Dependent Register 5	HID5_EL1	s3_0_c15_c5_0	64	
Hardware Implementation-Dependent Register 5 (E-core)	EHID5_EL1	s3_0_c15_c5_1	64	
Hardware Implementation-Dependent Register 6	HID6_EL1	s3_0_c15_c6_0	64	
Hardware Implementation-Dependent Register 7	HID7_EL1	s3_0_c15_c7_0	64	
Hardware Implementation-Dependent Register 7 (E-core)	EHID7_EL1	s3_0_c15_c7_1	64	
Hardware Implementation-Dependent Register 8	HID8_EL1	s3_0_c15_c8_0	64	
Hardware Implementation-Dependent Register 9	HID9_EL1	s3_0_c15_c9_0	64	
Hardware Implementation-Dependent Register 9 (E-core)	EHID9_EL1	s3_0_c15_c9_1	64	
Hardware Implementation-Dependent Register 10	HID10_EL1	s3_0_c15_c10_0	64	
Hardware Implementation-Dependent Register 10 (E-core)	EHID10_EL1	s3_0_c15_c10_1	64	
Hardware Implementation-Dependent Register 11	HID11_EL1	s3_0_c15_c11_0	64	
Hardware Implementation-Dependent Register 11 (E-core)	EHID11_EL1	s3_0_c15_c11_1	64	
Hardware Implementation-Dependent Register 13	HID13_EL1	s3_0_c15_c14_0	64	
Hardware Implementation-Dependent Register 14	HID14_EL1	s3_0_c15_c15_0	64	
Hardware Implementation-Dependent Register 16	HID16_EL1	s3_0_c15_c15_2	64	
Hardware Implementation-Dependent Register 17	HID17_EL1	s3_0_c15_c15_5	64	
Hardware Implementation-Dependent Register 18	HID18_EL1	s3_0_c15_c11_2	64	
Hardware Implementation-Dependent Register 20 (E-core)	EHID20_EL1	s3_0_c15_c1_2	64	
Hardware Implementation-Dependent Register 21	HID21_EL1	s3_0_c15_c1_3	64	
Performance Monitor Control Register 0	PMCR0_EL1	s3_1_c15_c0_0	64	
Performance Monitor Control Register 1	PMCR1_EL1	s3_1_c15_c1_0	64	
Performance Monitor Control Register 2	PMCR2_EL1	s3_1_c15_c2_0	64	
Performance Monitor Control Register 3	PMCR3_EL1	s3_1_c15_c3_0	64	
Performance Monitor Control Register 4	PMCR4_EL1	s3_1_c15_c4_0	64	
Performance Monitor Event Selection Register 0	PMESR0_EL1	s3_1_c15_c5_0	64	
Performance Monitor Event Selection Register 1	PMESR1_EL1	s3_1_c15_c6_0	64	
Performance Monitor Status Register	PMSR_EL1	s3_1_c15_c13_0	64	
Performance Monitor Counter 0	PMC0_EL1	s3_2_c15_c0_0	64	
Performance Monitor Counter 1	PMC1_EL1	s3_2_c15_c1_0	64	
Performance Monitor Counter 2	PMC2_EL1	s3_2_c15_c2_0	64	
Performance Monitor Counter 3	PMC3_EL1	s3_2_c15_c3_0	64	
Performance Monitor Counter 4	PMC4_EL1	s3_2_c15_c4_0	64	
Performance Monitor Counter 5	PMC5_EL1	s3_2_c15_c5_0	64	
Performance Monitor Counter 6	PMC6_EL1	s3_2_c15_c6_0	64	
Performance Monitor Counter 7	PMC7_EL1	s3_2_c15_c7_0	64	
Performance Monitor Counter 8	PMC8_EL1	s3_2_c15_c9_0	64	
Performance Monitor Counter 9	PMC9_EL1	s3_2_c15_c10_0	64	
Load-Store Unit Error Status	LSU_ERR_STS_EL1	s3_3_c15_c0_0	64	
Load-Store Unit Error Status (E-core)	E_LSU_ERR_STS_EL1	s3_3_c15_c2_0	64	
Load-Store Unit Error Control	LSU_ERR_CTL_EL1	s3_3_c15_c1_0	64	
L2 Cache Error Status	L2C_ERR_STS_EL1	s3_3_c15_c8_0	64	
L2 Cache Address	L2C_ERR_ADR_EL1	s3_3_c15_c9_0	64	
L2 Cache Error Information	L2C_ERR_INF_EL1	s3_3_c15_c10_0	64	
FED Error Status	FED_ERR_STS_EL1	s3_4_c15_c0_0	64	
FED Error Status (E-Core)	E_FED_ERR_STS_EL1	s3_4_c15_c0_2	64	
Pointer Authentication Control	APCTL_EL1	s3_4_c15_c0_4	64	
Pointer Authentication Kernel Key Low	KERNELKEYLO_EL1	s3_4_c15_c1_0	64	
Pointer Authentication Kernel Key High	KERNELKEYHI_EL1	s3_4_c15_c1_1	64	
Virtual Memory System Architecture Lock	VMSA_LOCK_EL1	s3_4_c15_c1_2	64	
+	AMX Control (EL1)	AMX_CTL_EL1	s3_4_c15_c1_4	64	
APRR EL0	APRR_EL0	s3_4_c15_c2_0	64	
APRR EL1	APRR_EL1	s3_4_c15_c2_1	64	
CTRR Lock	CTRR_LOCK_EL1	s3_4_c15_c2_2	64	
CTRR A Lower Address (EL1)	CTRR_A_LWR_EL1	s3_4_c15_c2_3	64	
CTRR A Upper Address (EL1)	CTRR_A_UPR_EL1	s3_4_c15_c2_4	64	
CTRR Control (EL1)	CTRR_CTL_EL1	s3_4_c15_c2_5	64	
APRR JIT Enable	APRR_JIT_ENABLE_EL2	s3_4_c15_c2_6	64	
APRR JIT Mask	APRR_JIT_MASK_EL2	s3_4_c15_c2_7	64	
AMX Control (EL12)	AMX_CTL_EL12	s3_4_c15_c4_6	64	
+	AMX Control (EL2)	AMX_CTL_EL2	s3_4_c15_c4_7	64	
SPRR Permission Configuration Register (EL20, useless)	SPRR_PERM_EL20_SILLY_THING	s3_4_c15_c5_1	64	
SPRR Permission Configuration Register (EL02)	SPRR_PERM_EL02	s3_4_c15_c5_2	64	
SPRR Kernel Permission Unlock Mask (EL12)	SPRR_KMASK0_EL12	s3_4_c15_c6_0	32	
SPRR Permission Unlock Mask 0 (EL2)	SPRR_UMASK0_EL2	s3_4_c15_c7_0	32	
SPRR Permission Unlock Mask 1 (EL2)	SPRR_UMASK1_EL2	s3_4_c15_c7_1	32	
SPRR Permission Unlock Mask 2 (EL2)	SPRR_UMASK2_EL2	s3_4_c15_c7_2	32	
SPRR Permission Unlock Mask 3 (EL2)	SPRR_UMASK3_EL2	s3_4_c15_c7_3	32	
SPRR Permission Unlock Mask 0 (EL12)	SPRR_UMASK0_EL12	s3_4_c15_c8_0	32	
SPRR Permission Unlock Mask 1 (EL12)	SPRR_UMASK1_EL12	s3_4_c15_c8_1	32	
SPRR Permission Unlock Mask 2 (EL12)	SPRR_UMASK2_EL12	s3_4_c15_c8_2	32	
SPRR Permission Unlock Mask 3 (EL12)	SPRR_UMASK3_EL12	s3_4_c15_c8_3	32	
Physical timer counter register	CNTPCT_ALIAS_EL0	s3_4_c15_c10_5	64	
Virtual timer counter register	CNTVCT_ALIAS_EL0	s3_4_c15_c10_6	64	
CTRR A Lower Address (EL2)	CTRR_A_LWR_EL2	s3_4_c15_c11_0	64	
CTRR A Upper Address (EL2)	CTRR_A_UPR_EL2	s3_4_c15_c11_1	64	
CTRR Control (EL2)	CTRR_CTL_EL2	s3_4_c15_c11_4	64	
CTRR Lock	CTRR_LOCK_EL2	s3_4_c15_c11_5	64	
IPI Request Register (Local)	IPI_RR_LOCAL_EL1	s3_5_c15_c0_0	64	
IPI Request Register (Global)	IPI_RR_GLOBAL_EL1	s3_5_c15_c0_1	64	
DPC Error Status	DPC_ERR_STS_EL1	s3_5_c15_c0_5	64	
+	IPI Status Register	IPI_SR_EL1	s3_5_c15_c1_1	64	
VM Timer Link Register	VM_TMR_LR_EL2	s3_5_c15_c1_2	64	
+	VM Timer FIQ Enable	VM_TMR_FIQ_ENA_EL2	s3_5_c15_c1_3	64	
IPI Control Register	IPI_CR_EL1	s3_5_c15_c3_1	64	
Apple Core Cluster Configuration	ACC_CFG_EL1	s3_5_c15_c4_0	64	
Cyclone Override	CYC_OVRD_EL1	s3_5_c15_c5_0	64	
Apple Core Cluster Override	ACC_OVRD_EL1	s3_5_c15_c6_0	64	
Apple Core Cluster E-Block Override	ACC_EBLK_OVRD_EL1	s3_5_c15_c6_1	64	
MMU Error Status	MMU_ERR_STS_EL1	s3_6_c15_c0_0	64	
Auxiliary Fault Status Register 1 (GL1)	AFSR1_GL1	s3_6_c15_c0_1	64	
Auxiliary Fault Status Register 1 (GL2)	AFSR1_GL2	s3_6_c15_c0_2	64	
Auxiliary Fault Status Register 1 (GL12)	AFSR1_GL12	s3_6_c15_c0_3	64	
+	SPRR Configuration Register (EL1)	SPRR_CONFIG_EL1	s3_6_c15_c1_0	64	
+	GXF Configuration Register (EL1)	GXF_CONFIG_EL1	s3_6_c15_c1_2	64	
SPRR Unknown (EL1)	SPRR_UNK1_EL1	s3_6_c15_c1_3	64	
GXF Configuration Register (EL2)	GXF_CONFIG_EL2	s3_6_c15_c1_4	64	
SPRR Permission Configuration Register (EL0)	SPRR_PERM_EL0	s3_6_c15_c1_5	64	
SPRR Permission Configuration Register (EL1)	SPRR_PERM_EL1	s3_6_c15_c1_6	64	
SPRR Permission Configuration Register (EL2)	SPRR_PERM_EL2	s3_6_c15_c1_7	64	
MMU Error Status (E-Core)	E_MMU_ERR_STS_EL1	s3_6_c15_c2_0	64	
Pointer Authentication Key A for Code Low (EL12)	APGAKeyLo_EL12	s3_6_c15_c2_1	64	
Pointer Authentication Key A for Code High (EL12)	APGAKeyHi_EL12	s3_6_c15_c2_2	64	
Pointer Authentication Kernel Key Low (EL12)	KERNELKEYLO_EL12	s3_6_c15_c2_3	64	
Pointer Authentication Kernel Key High (EL12)	KERNELKEYHI_EL12	s3_6_c15_c2_4	64	
Apple Floating-Point Control Register	AFPCR_EL0	s3_6_c15_c2_5	64	
Apple ID Register 2	AIDR2_EL1	s3_6_c15_c2_7	64	
SPRR Permission Unlock Mask 0 (EL1)	SPRR_UMASK0_EL1	s3_6_c15_c3_0	32	
SPRR Kernel Permission Unlock Mask 0 (EL1)	SPRR_KMASK0_EL1	s3_6_c15_c3_1	32	
SPRR Kernel Permission Unlock Mask 0 (EL2)	SPRR_KMASK0_EL2	s3_6_c15_c3_2	32	
SPRR Permission Unlock Mask 1 (EL1)	SPRR_UMASK1_EL1	s3_6_c15_c3_3	32	
SPRR Permission Unlock Mask 2 (EL1)	SPRR_UMASK2_EL1	s3_6_c15_c3_4	32	
SPRR Permission Unlock Mask 3 (EL1)	SPRR_UMASK3_EL1	s3_6_c15_c3_5	32	
SPRR Kernel Permission Unlock Mask 1 (EL12)	SPRR_KMASK1_EL1	s3_6_c15_c4_2	32	
SPRR Kernel Permission Unlock Mask 2 (EL12)	SPRR_KMASK2_EL1	s3_6_c15_c4_3	32	
SPRR Kernel Permission Unlock Mask 3 (EL12)	SPRR_KMASK3_EL1	s3_6_c15_c4_4	32	
SPRR Kernel Permission Unlock Mask 1 (EL12)	SPRR_KMASK1_EL2	s3_6_c15_c5_1	32	
SPRR Kernel Permission Unlock Mask 2 (EL12)	SPRR_KMASK2_EL2	s3_6_c15_c5_2	32	
SPRR Kernel Permission Unlock Mask 3 (EL12)	SPRR_KMASK3_EL2	s3_6_c15_c5_3	32	
SPRR Kernel Permission Unlock Mask 0 (EL12)	SPRR_KMASK0_EL12	s3_6_c15_c6_0	32	
SPRR Kernel Permission Unlock Mask 1 (EL12)	SPRR_KMASK1_EL12	s3_6_c15_c6_1	32	
SPRR Kernel Permission Unlock Mask 2 (EL12)	SPRR_KMASK2_EL12	s3_6_c15_c6_2	32	
SPRR Kernel Permission Unlock Mask 3 (EL12)	SPRR_KMASK3_EL12	s3_6_c15_c6_3	32	
Pointer Authentication Key A for Instruction Low (EL12)	APIAKeyLo_EL12	s3_6_c15_c7_0	64	
Pointer Authentication Key A for Instruction High (EL12)	APIAKeyHi_EL12	s3_6_c15_c7_1	64	
Pointer Authentication Key A for Instruction Low (EL12)	APIBKeyLo_EL12	s3_6_c15_c7_2	64	
Pointer Authentication Key A for Instruction High (EL12)	APIBKeyHi_EL12	s3_6_c15_c7_3	64	
Pointer Authentication Key A for Data Low (EL12)	APDAKeyLo_EL12	s3_6_c15_c7_4	64	
Pointer Authentication Key A for Data High (EL12)	APDAKeyHi_EL12	s3_6_c15_c7_5	64	
Pointer Authentication Key A for Data Low (EL12)	APDBKeyLo_EL12	s3_6_c15_c7_6	64	
Pointer Authentication Key A for Data High (EL12)	APDBKeyHi_EL12	s3_6_c15_c7_7	64	
+	GXF Status Register	GXF_STATUS_EL1	s3_6_c15_c8_0	64	
GXF genter Entry Vector Register (EL1)	GXF_ENTER_EL1	s3_6_c15_c8_1	64	
GXF Abort Vector Register (EL1)	GXF_ABORT_EL1	s3_6_c15_c8_2	64	
Vector Base Address Register (GL12)	VBAR_GL12	s3_6_c15_c9_2	64	
Saved Program Status Register (GL12)	SPSR_GL12	s3_6_c15_c9_3	64	
ASPSR (GL12)	ASPSR_GL12	s3_6_c15_c9_4	64	
Exception Syndrome Register (GL12)	ESR_GL12	s3_6_c15_c9_5	64	
Exception Link Register (GL12)	ELR_GL12	s3_6_c15_c9_6	64	
Stack Pointer Register (GL12)	SP_GL12	s3_6_c15_c10_0	64	
Software Thread ID Register (GL1)	TPIDR_GL1	s3_6_c15_c10_1	64	
Vector Base Address Register (GL1)	VBAR_GL1	s3_6_c15_c10_2	64	
Saved Program Status Register (GL1)	SPSR_GL1	s3_6_c15_c10_3	64	
ASPSR (GL1)	ASPSR_GL1	s3_6_c15_c10_4	64	
Exception Syndrome Register (GL1)	ESR_GL1	s3_6_c15_c10_5	64	
Exception Link Register (GL1)	ELR_GL1	s3_6_c15_c10_6	64	
Fault Address Register (GL1)	FAR_GL1	s3_6_c15_c10_7	64	
Software Thread ID Register (GL2)	TPIDR_GL2	s3_6_c15_c11_1	64	
Vector Base Address Register (GL2)	VBAR_GL2	s3_6_c15_c11_2	64	
Saved Program Status Register (GL2)	SPSR_GL2	s3_6_c15_c11_3	64	
ASPSR (GL2)	ASPSR_GL2	s3_6_c15_c11_4	64	
Exception Syndrome Register (GL2)	ESR_GL2	s3_6_c15_c11_5	64	
Exception Link Register (GL2)	ELR_GL2	s3_6_c15_c11_6	64	
Fault Address Register (GL2)	FAR_GL2	s3_6_c15_c11_7	64	
GXF genter Entry Vector Register (EL2)	GXF_ENTER_EL2	s3_6_c15_c12_0	64	
GXF Abort Vector Register (EL2)	GXF_ABORT_EL2	s3_6_c15_c12_1	64	
Pointer Authentication Control (EL2)	APCTL_EL2	s3_6_c15_c12_2	64	
Pointer Authentication Status (EL2, maybe)	APSTS_EL2_MAYBE	s3_6_c15_c12_3	64	
Pointer Authentication Status	APSTS_EL1	s3_6_c15_c12_4	64	
SPRR Configuration Register (EL2)	SPRR_CONFIG_EL2	s3_6_c15_c14_2	64	
SPRR Unknown (EL2)	SPRR_UNK1_EL2	s3_6_c15_c14_3	64	
Pointer Authentication VM Machine Key Low	APVMKEYLO_EL2	s3_6_c15_c14_4	64	
Pointer Authentication VM Machine Key High	APVMKEYHI_EL2	s3_6_c15_c14_5	64	
Auxiliary Control Register (EL12)	ACTLR_EL12	s3_6_c15_c14_6	64	
Pointer Authentication Status (EL12)	APSTS_EL12	s3_6_c15_c14_7	64	
Pointer Authentication Control (EL12)	APCTL_EL12	s3_6_c15_c15_0	64	
GXF Configuration Register (EL12)	GXF_CONFIG_EL12	s3_6_c15_c15_1	64	
GXF genter Entry Vector Register (EL12)	GXF_ENTER_EL12	s3_6_c15_c15_2	64	
GXF Abort Vector Register (EL12)	GXF_ABORT_EL12	s3_6_c15_c15_3	64	
SPRR Configuration Register (EL12)	SPRR_CONFIG_EL12	s3_6_c15_c15_4	64	
SPRR Unknown (EL2)	SPRR_UNK1_EL12	s3_6_c15_c15_5	64	
SPRR Permission Configuration Register (EL12)	SPRR_PERM_EL12	s3_6_c15_c15_7	64	
Uncore Performance Monitor Control Register 0	UPMCR0_EL1	s3_7_c15_c0_4	64	
Uncore Performance Monitor Event Selection Register 0	UPMESR0_EL1	s3_7_c15_c1_4	64	
Uncore Performance Monitor Event Core Mask 0	UPMECM0_EL1	s3_7_c15_c3_4	64	
Uncore Performance Monitor Event Core Mask 1	UPMECM1_EL1	s3_7_c15_c4_4	64	
Uncore Performance Monitor PMI Core Mask	UPMPCM_EL1	s3_7_c15_c5_4	64	
Uncore Performance Monitor Status Register	UPMSR_EL1	s3_7_c15_c6_4	64	
Uncore Performance Monitor Event Core Mask 2	UPMECM2_EL1	s3_7_c15_c8_5	64	
Uncore Performance Monitor Event Core Mask 3	UPMECM3_EL1	s3_7_c15_c9_5	64	
Uncore Performance Monitor Event Selection Register 1	UPMESR1_EL1	s3_7_c15_c11_5	64	
Uncore Performance Monitor Counter 0	UPMC0_EL1	s3_7_c15_c7_4	64	
Uncore Performance Monitor Counter 1	UPMC1_EL1	s3_7_c15_c8_4	64	
Uncore Performance Monitor Counter 2	UPMC2_EL1	s3_7_c15_c9_4	64	
Uncore Performance Monitor Counter 3	UPMC3_EL1	s3_7_c15_c10_4	64	
Uncore Performance Monitor Counter 4	UPMC4_EL1	s3_7_c15_c11_4	64	
Uncore Performance Monitor Counter 5	UPMC5_EL1	s3_7_c15_c12_4	64	
Uncore Performance Monitor Counter 6	UPMC6_EL1	s3_7_c15_c13_4	64	
Uncore Performance Monitor Counter 7	UPMC7_EL1	s3_7_c15_c14_4	64	
Uncore Performance Monitor Counter 8	UPMC8_EL1	s3_7_c15_c0_5	64	
Uncore Performance Monitor Counter 9	UPMC9_EL1	s3_7_c15_c1_5	64	
Uncore Performance Monitor Counter 10	UPMC10_EL1	s3_7_c15_c2_5	64	
Uncore Performance Monitor Counter 11	UPMC11_EL1	s3_7_c15_c3_5	64	
Uncore Performance Monitor Counter 12	UPMC12_EL1	s3_7_c15_c4_5	64	
Uncore Performance Monitor Counter 13	UPMC13_EL1	s3_7_c15_c5_5	64	
Uncore Performance Monitor Counter 14	UPMC14_EL1	s3_7_c15_c6_5	64	
Uncore Performance Monitor Counter 15	UPMC15_EL1	s3_7_c15_c7_5	64	
+	Hypervisor Auxiliary Control Register	HACR_EL2	s3_4_c1_c1_7	64	
```

Register S3_5_c15_c10_1 is from the M1RACLES Bug
