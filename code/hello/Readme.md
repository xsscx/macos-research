### hello
This is a Placeholder

### Compile
```
clang -o hello hello.c -isysroot $(xcrun --show-sdk-path) -g -fsanitize=address -v  -Xclang -ast-dump -framework CoreFoundation
```

### Code
```
#include <stdio.h>

int main() {
    printf("Hello, World!\n");
    return 0;
}
```
### Crash
```
Process:               ld [74135]
Path:                  /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ld
Identifier:            ld
Version:               ???
Code Type:             ARM-64 (Native)
Parent Process:        clang [74133]
Responsible:           iTerm2 [692]
User ID:               501

Date/Time:             2024-03-02 17:03:11.9224 -0500
OS Version:            macOS 14.3.1 (23D60)
Report Version:        12

Time Awake Since Boot: 320000 seconds
Time Since Wake:       16614 seconds

System Integrity Protection: disabled

Crashed Thread:        0  Dispatch queue: com.apple.root.user-interactive-qos

Exception Type:        EXC_BAD_ACCESS (SIGSEGV)
Exception Codes:       KERN_INVALID_ADDRESS at 0x0000000000000000
Exception Codes:       0x0000000000000001, 0x0000000000000000

Termination Reason:    Namespace SIGNAL, Code 11 Segmentation fault: 11
Terminating Process:   exc handler [74135]

VM Region Info: 0 is not in any region.  Bytes before following region: 4362747904
      REGION TYPE                    START - END         [ VSIZE] PRT/MAX SHRMOD  REGION DETAIL
      UNUSED SPACE AT START
--->  
      __TEXT                      1040a4000-1041a0000    [ 1008K] r-x/r-x SM=COW  ...in/usr/bin/ld

Thread 0 Crashed::  Dispatch queue: com.apple.root.user-interactive-qos
0   ld                            	       0x1040d6fa8 ld::InputFiles::SliceParser::parse() const + 476
1   ld                            	       0x1040da404 ld::InputFiles::parseAllFiles(void (ld::AtomFile const*) block_pointer)::$_7::operator()(unsigned long, ld::FileInfo const&) const + 420
2   libdispatch.dylib             	       0x1803b4950 _dispatch_client_callout2 + 20
3   libdispatch.dylib             	       0x1803c91a4 _dispatch_apply_invoke_and_wait + 176
4   libdispatch.dylib             	       0x1803c8464 _dispatch_apply_with_attr_f + 1176
5   libdispatch.dylib             	       0x1803c8650 dispatch_apply + 96
6   ld                            	       0x1041581e0 ld::AtomFileConsolidator::parseFiles(bool) + 292
7   ld                            	       0x1040f6b08 main + 9252
8   dyld                          	       0x1801e50e0 start + 2360

Thread 1::  Dispatch queue: com.apple.root.user-interactive-qos
0   libsystem_kernel.dylib        	       0x180526408 close + 8
1   ld                            	       0x1040ba3b8 ld::File::mapReadOnlyAt(char const*, void*, ld::File::ReadOnlyMapping&, char*) + 224
2   ld                            	       0x1040da34c ld::InputFiles::parseAllFiles(void (ld::AtomFile const*) block_pointer)::$_7::operator()(unsigned long, ld::FileInfo const&) const + 236
3   libdispatch.dylib             	       0x1803b4950 _dispatch_client_callout2 + 20
4   libdispatch.dylib             	       0x1803c7ba0 _dispatch_apply_invoke + 176
5   libdispatch.dylib             	       0x1803b4910 _dispatch_client_callout + 20
6   libdispatch.dylib             	       0x1803c63cc _dispatch_root_queue_drain + 864
7   libdispatch.dylib             	       0x1803c6a04 _dispatch_worker_thread2 + 156
8   libsystem_pthread.dylib       	       0x1805620d8 _pthread_wqthread + 228
9   libsystem_pthread.dylib       	       0x180560e30 start_wqthread + 8

Thread 2::  Dispatch queue: com.apple.root.user-interactive-qos
0   libsystem_kernel.dylib        	       0x180526530 __mmap + 8
1   libsystem_kernel.dylib        	       0x1805264c0 mmap + 60
2   ld                            	       0x1040ba364 ld::File::mapReadOnlyAt(char const*, void*, ld::File::ReadOnlyMapping&, char*) + 140
3   ld                            	       0x1040da34c ld::InputFiles::parseAllFiles(void (ld::AtomFile const*) block_pointer)::$_7::operator()(unsigned long, ld::FileInfo const&) const + 236
4   libdispatch.dylib             	       0x1803b4950 _dispatch_client_callout2 + 20
5   libdispatch.dylib             	       0x1803c7ba0 _dispatch_apply_invoke + 176
6   libdispatch.dylib             	       0x1803b4910 _dispatch_client_callout + 20
7   libdispatch.dylib             	       0x1803c63cc _dispatch_root_queue_drain + 864
8   libdispatch.dylib             	       0x1803c6a04 _dispatch_worker_thread2 + 156
9   libsystem_pthread.dylib       	       0x1805620d8 _pthread_wqthread + 228
10  libsystem_pthread.dylib       	       0x180560e30 start_wqthread + 8


Thread 0 crashed with ARM Thread State (64-bit):
    x0: 0x0000000000000000   x1: 0x0000000000000000   x2: 0x0000000000000000   x3: 0x00006000006341c0
    x4: 0x0000000000000004   x5: 0x0000000000000280   x6: 0x0000000000000065   x7: 0x0000000000000000
    x8: 0x0000000000000000   x9: 0x0000000000000000  x10: 0x00000000000001a0  x11: 0x00000000836f900c
   x12: 0x00000000000007fb  x13: 0x00000000000007fd  x14: 0x00000000838f980e  x15: 0x000000000000000e
   x16: 0x00000000836f900c  x17: 0x00000000000f9800  x18: 0x0000000000000000  x19: 0x000000016bd59c60
   x20: 0x0000000000000000  x21: 0x0000000000000000  x22: 0x0000000000000005  x23: 0x000000016bd59ac0
   x24: 0x0000000000000000  x25: 0x00006000013381a0  x26: 0x0000000000000003  x27: 0x0000000000000000
   x28: 0x0000000000000000   fp: 0x000000016bd59c40   lr: 0x00000001040d6ee0
    sp: 0x000000016bd598a0   pc: 0x00000001040d6fa8 cpsr: 0x80001000
   far: 0x0000000000000000  esr: 0x92000006 (Data Abort) byte read Translation fault

Binary Images:
       0x10470c000 -        0x10474bfff libtapi.dylib (*) <494cd044-4f91-38bf-a14f-8e7a2ef376f2> /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libtapi.dylib
       0x10c13c000 -        0x10ec87fff libLTO.dylib (*) <c2f34db5-40d6-3a91-b684-dd78ba72399e> /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libLTO.dylib
       0x104660000 -        0x1046cbfff libswiftDemangle.dylib (*) <3c9116cf-ffa5-3a14-a6ee-6b8ed428ee27> /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libswiftDemangle.dylib
       0x1040a4000 -        0x10419ffff ld (*) <81ac9a77-d2b8-310b-bbbf-0a60080b7d9e> /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ld
       0x1803b1000 -        0x1803f7fff libdispatch.dylib (*) <5aa1649c-ef1d-39f7-a66c-4c5d2e53c474> /usr/lib/system/libdispatch.dylib
       0x1801df000 -        0x180273387 dyld (*) <50746901-db0e-39a0-b391-baaa6b82ad0f> /usr/lib/dyld
               0x0 - 0xffffffffffffffff ??? (*) <00000000-0000-0000-0000-000000000000> ???
       0x180524000 -        0x18055efff libsystem_kernel.dylib (*) <a7228b5d-53c7-3fe9-84e4-2a8c04dcf051> /usr/lib/system/libsystem_kernel.dylib
       0x18055f000 -        0x18056bff3 libsystem_pthread.dylib (*) <449bbad3-f7ef-371d-9a59-fd4ffa78289b> /usr/lib/system/libsystem_pthread.dylib

```
