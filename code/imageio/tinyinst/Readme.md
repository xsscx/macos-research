# Source Code Modification for tinyinst

Updated 04 MAR 2024

## Summary of Issues

## Issues

- Complex Regex Parsing Failure: The attempt to utilize a comprehensive regex pattern for parsing a dyld map file led to failures, where the program was unable to correctly parse and populate the required data structures. 
  - This was evidenced by continuous errors and the inability to process lines expected to match the regex pattern.
- Data Structure Mismanagement: Problems with how certain data structures were utilized, leading to errors like unprocessed lines, empty module groups, and failure to handle exceptions correctly.
- Tool-Specific Limitations and Bugs: Encountered limitations and potential bugs within the used tools (e.g., compilers, debuggers, static analysis tools), which complicated the debugging process and error resolution.
- Code Refactoring Needs: Identified areas where code refactoring could enhance readability, maintainability, and reliability, particularly concerning complex logic and memory management routines.

### Issue 1
```
(std::smatch) m = {
  __matches_ = size=0 {}
  __unmatched_ = {
    std::__1::pair<std::__1::__wrap_iter<const char *>, std::__1::__wrap_iter<const char *> > = {
      first = (item = '\0')
      second = (item = '\0')
    }
    matched = false
  }
  __prefix_ = {
    std::__1::pair<std::__1::__wrap_iter<const char *>, std::__1::__wrap_iter<const char *> > = {
      first = (item = '/')
      second = (item = '/')
    }
    matched = false
  }
  __suffix_ = {
    std::__1::pair<std::__1::__wrap_iter<const char *>, std::__1::__wrap_iter<const char *> > = {
      first = (item = '\0')
      second = (item = '\0')
    }
    matched = false
  }
  __ready_ = true
  __position_start_ = (item = '/')
}
(bool) lib = true
(std::string) lib_name = "libswiftCoreMediaIO.dylib"
(const std::exception &) e = 0x00006000013f0080 {}
(uint64_t) start = 9148940288
(uint64_t) end = 9148956669
*** Some of the displayed variables have more members than the debugger will show by default. To show all of them, you can either use the --show-all-children option to frame variable or raise the limit by changing the target.max-children-count setting.
(lldb) fr se 0
frame #0: 0x0000000184000d48 libc++.1.dylib`std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::basic_string(std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>> const&) + 20
libc++.1.dylib`std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::basic_string:
->  0x184000d48 <+20>: ldrsb  w8, [x1, #0x17]
    0x184000d4c <+24>: tbnz   w8, #0x1f, 0x184000d64    ; <+48>
    0x184000d50 <+28>: ldr    q0, [x1]
    0x184000d54 <+32>: ldr    x8, [x1, #0x10]
```

### Issue 2
```
Entering find_dyld_map
Found dyld_shared_cache at: /System/Volumes/Preboot/Cryptexes/OS/System/Library/dyld/dyld_shared_cache_arm64e.map
Starting parsing of dyld map file: /System/Volumes/Preboot/Cryptexes/OS/System/Library/dyld/dyld_shared_cache_arm64e.map
libc++abi: terminating due to uncaught exception of type std::__1::regex_error: The parser did not consume the entire regular expression.
Process 47764 stopped
* thread #1, queue = 'com.apple.main-thread', stop reason = signal SIGABRT
    frame #0: 0x000000018409a0dc libsystem_kernel.dylib`__pthread_kill + 8
libsystem_kernel.dylib`__pthread_kill:
->  0x18409a0dc <+8>:  b.lo   0x18409a0fc               ; <+40>
    0x18409a0e0 <+12>: pacibsp
    0x18409a0e4 <+16>: stp    x29, x30, [sp, #-0x10]!
    0x18409a0e8 <+20>: mov    x29, sp
(lldb) bt
* thread #1, queue = 'com.apple.main-thread', stop reason = signal SIGABRT
  * frame #0: 0x000000018409a0dc libsystem_kernel.dylib`__pthread_kill + 8
    frame #1: 0x00000001840d1cc0 libsystem_pthread.dylib`pthread_kill + 288
    frame #2: 0x0000000183fdda40 libsystem_c.dylib`abort + 180
    frame #3: 0x0000000184089070 libc++abi.dylib`abort_message + 132
    frame #4: 0x0000000184079110 libc++abi.dylib`demangling_terminate_handler() + 320
    frame #5: 0x0000000183d1f99c libobjc.A.dylib`_objc_terminate() + 160
    frame #6: 0x0000000184088434 libc++abi.dylib`std::__terminate(void (*)()) + 16
    frame #7: 0x000000018408b520 libc++abi.dylib`__cxxabiv1::failed_throw(__cxxabiv1::__cxa_exception*) + 88
    frame #8: 0x000000018408b464 libc++abi.dylib`__cxa_throw + 308
    frame #9: 0x000000010008b9e8 fuzzer`void std::__1::__throw_regex_error[abi:v160006]<(std::__1::regex_constants::error_type)17>() at regex:1016:5
    frame #10: 0x000000010008b628 fuzzer`void std::__1::basic_regex<char, std::__1::regex_traits<char>>::__init<char const*>(this=0x000000016fdfe5a0, __first="__TEXT 0x([A-F0-9]+) -> 0x([A-F0-9]+)|__SHARED_CACHE|__FONT_DATA|__CTF|__GLSLBUILTINS|__INFO_FILTER)\\s+0x[A-Fa-f0-9]+\\s+->\\s+0x[A-Fa-f0-9]+\\s*$)|(^mapping\\s+(EX|RW|RO)\\s+\\d+MB\\s+0x[A-Fa-f0-9]+\\s+->\\s+0x[A-Fa-f0-9]+$)", __last="") at regex:3194:9
    frame #11: 0x000000010008b514 fuzzer`std::__1::basic_regex<char, std::__1::regex_traits<char>>::basic_regex[abi:v160006](this=0x000000016fdfe5a0, __p="__TEXT 0x([A-F0-9]+) -> 0x([A-F0-9]+)|__SHARED_CACHE|__FONT_DATA|__CTF|__GLSLBUILTINS|__INFO_FILTER)\\s+0x[A-Fa-f0-9]+\\s+->\\s+0x[A-Fa-f0-9]+\\s*$)|(^mapping\\s+(EX|RW|RO)\\s+\\d+MB\\s+0x[A-Fa-f0-9]+\\s+->\\s+0x[A-Fa-f0-9]+$)", __f=optimize) at regex:2670:9
    frame #12: 0x000000010008a1c0 fuzzer`std::__1::basic_regex<char, std::__1::regex_traits<char>>::basic_regex[abi:v160006](this=0x000000016fdfe5a0, __p="__TEXT 0x([A-F0-9]+) -> 0x([A-F0-9]+)|__SHARED_CACHE|__FONT_DATA|__CTF|__GLSLBUILTINS|__INFO_FILTER)\\s+0x[A-Fa-f0-9]+\\s+->\\s+0x[A-Fa-f0-9]+\\s*$)|(^mapping\\s+(EX|RW|RO)\\s+\\d+MB\\s+0x[A-Fa-f0-9]+\\s+->\\s+0x[A-Fa-f0-9]+$)", __f=optimize) at regex:2669:9
    frame #13: 0x00000001000899ec fuzzer`parse_dyld_map_file(path="/System/Volumes/Preboot/Cryptexes/OS/System/Library/dyld/dyld_shared_cache_arm64e.map") at dyld_cache_map_parser.cpp:98:22
    frame #14: 0x00000001000c7ec4 fuzzer`TinyInst::Init(this=0x000000015b00cc00, argc=37, argv=0x000000016fdff288) at tinyinst.cpp:1230:7
    frame #15: 0x00000001000735c8 fuzzer`LiteCov::Init(this=0x000000015b00cc00, argc=37, argv=0x000000016fdff288) at litecov.cpp:37:13
    frame #16: 0x000000010005dfb4 fuzzer`TinyInstInstrumentation::Init(this=0x0000600002dc8140, argc=37, argv=0x000000016fdff288) at tinyinstinstrumentation.cpp:28:20
    frame #17: 0x0000000100018018 fuzzer`Fuzzer::CreateInstrumentation(this=0x000000015a704100, argc=37, argv=0x000000016fdff288, tc=0x0000600001fcc000) at fuzzer.cpp:991:20
    frame #18: 0x0000000100013b1c fuzzer`Fuzzer::CreateThreadContext(this=0x000000015a704100, argc=37, argv=0x000000016fdff288, thread_id=1) at fuzzer.cpp:941:25
    frame #19: 0x00000001000137c8 fuzzer`Fuzzer::Run(this=0x000000015a704100, argc=37, argv=0x000000016fdff288) at fuzzer.cpp:193:25
    frame #20: 0x000000010000451c fuzzer`main(argc=37, argv=0x000000016fdff288) at main.cpp:205:11
    frame #21: 0x0000000183d510e0 dyld`start + 2360
(lldb) re re
General Purpose Registers:
        x0 = 0x0000000000000000
        x1 = 0x0000000000000000
        x2 = 0x0000000000000000
        x3 = 0x0000000000000000
        x4 = 0x000000018408d348  "terminating due to %s exception of type %s: %s"
        x5 = 0x000000016fdfe090
        x6 = 0x000000000000002e
        x7 = 0x0000000000000900
        x8 = 0xf7992e13950e0731
        x9 = 0xf7992e124f945b71
       x10 = 0x0000000000000200
       x11 = 0x0000000000000039
       x12 = 0x0000000000000000
       x13 = 0x00000000ffffff85
       x14 = 0x00000000000007fb
       x15 = 0x0000000080a3d7fb
       x16 = 0x0000000000000148
       x17 = 0x00000001e3a2b2f8
       x18 = 0x0000000000000000
       x19 = 0x0000000000000006
       x20 = 0x00000001da9a5c40  dyld`_main_thread
       x21 = 0x0000000000000103
       x22 = 0x00000001da9a5d20  dyld`_main_thread + 224
       x23 = 0x000000016fdff0d0
       x24 = 0x000000016fdff110
       x25 = 0x0000000183dd062b  "/usr/lib/dyld"
       x26 = 0x0000000000000000
       x27 = 0x0000000000000000
       x28 = 0x0000000000000000
        fp = 0x000000016fdfe000
        lr = 0x00000001840d1cc0  libsystem_pthread.dylib`pthread_kill + 288
        sp = 0x000000016fdfdfe0
        pc = 0x000000018409a0dc  libsystem_kernel.dylib`__pthread_kill + 8
      cpsr = 0x40001000

(lldb) dis -f
libsystem_kernel.dylib`__pthread_kill:
    0x18409a0d4 <+0>:  mov    x16, #0x148               ; =328
    0x18409a0d8 <+4>:  svc    #0x80
->  0x18409a0dc <+8>:  b.lo   0x18409a0fc               ; <+40>
    0x18409a0e0 <+12>: pacibsp
    0x18409a0e4 <+16>: stp    x29, x30, [sp, #-0x10]!
    0x18409a0e8 <+20>: mov    x29, sp
    0x18409a0ec <+24>: bl     0x184092230               ; cerror_nocancel
    0x18409a0f0 <+28>: mov    sp, x29
    0x18409a0f4 <+32>: ldp    x29, x30, [sp], #0x10
    0x18409a0f8 <+36>: retab
    0x18409a0fc <+40>: ret
(lldb) fr se 9
frame #9: 0x000000010008b9e8 fuzzer`void std::__1::__throw_regex_error[abi:v160006]<(std::__1::regex_constants::error_type)17>() at regex:1016:5
   1013	void __throw_regex_error()
   1014	{
   1015	#ifndef _LIBCPP_NO_EXCEPTIONS
-> 1016	    throw regex_error(_Ev);
   1017	#else
   1018	    _VSTD::abort();
   1019	#endif
```
