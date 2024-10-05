//**
(lldb) target create "./ZN20SipMultiStringHeaderD2Ev"
Current executable set to '/Users/xss/Documents/code/sipparser/ZN20SipMultiStringHeaderD2Ev' (x86_64).
(lldb) settings set -- target.run-args  "poc2"
(lldb) env DYLD_INSERT_LIBRARIES=/usr/lib/libgmalloc.dylib
(lldb) settings set -- target.run-args  "./poc2"
(lldb) r
Process 11130 launched: '/Users/xss/Documents/code/sipparser/ZN20SipMultiStringHeaderD2Ev' (x86_64)
GuardMalloc[ZN20SipMultiStringHeaderD2Ev-11130]: Allocations will be placed on 16 byte boundaries.
GuardMalloc[ZN20SipMultiStringHeaderD2Ev-11130]:  - Some buffer overruns may not be noticed.
GuardMalloc[ZN20SipMultiStringHeaderD2Ev-11130]:  - Applications using vector instructions (e.g., SSE) should work.
GuardMalloc[ZN20SipMultiStringHeaderD2Ev-11130]: version 064559.72.1
Loaded libIPTelephony.dylib at 0x7ff817276000
Running decoder
GuardMalloc[ZN20SipMultiStringHeaderD2Ev-11130]: attempted free of pointer 0x100010000 that was not claimed by any registered malloc zone
Process 11130 stopped
* thread #1, queue = 'com.apple.main-thread', stop reason = signal SIGABRT
    frame #0: 0x00007ff80282d202 libsystem_kernel.dylib`__pthread_kill + 10
libsystem_kernel.dylib`:
->  0x7ff80282d202 <+10>: jae    0x7ff80282d20c            ; <+20>
    0x7ff80282d204 <+12>: movq   %rax, %rdi
    0x7ff80282d207 <+15>: jmp    0x7ff802826ceb            ; cerror_nocancel
    0x7ff80282d20c <+20>: retq
Target 0: (ZN20SipMultiStringHeaderD2Ev) stopped.
(lldb) bt
* thread #1, queue = 'com.apple.main-thread', stop reason = signal SIGABRT
  * frame #0: 0x00007ff80282d202 libsystem_kernel.dylib`__pthread_kill + 10
    frame #1: 0x00007ff802864ee6 libsystem_pthread.dylib`pthread_kill + 263
    frame #2: 0x00007ff80278bb45 libsystem_c.dylib`abort + 123
    frame #3: 0x0000000100089346 libgmalloc.dylib`GMfree + 85
    frame #4: 0x00007ff817396e55 libIPTelephony.dylib`std::__1::__hash_table<std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> >, std::__1::hash<std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> > >, std::__1::equal_to<std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> > >, std::__1::allocator<std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> > > >::__deallocate_node(std::__1::__hash_node_base<std::__1::__hash_node<std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> >, void*>*>*) + 41
    frame #5: 0x00007ff817396e0e libIPTelephony.dylib`std::__1::__hash_table<std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> >, std::__1::hash<std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> > >, std::__1::equal_to<std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> > >, std::__1::allocator<std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> > > >::~__hash_table() + 18
    frame #6: 0x00007ff8173957b5 libIPTelephony.dylib`SipMessageEncodingMap::~SipMessageEncodingMap() + 69
    frame #7: 0x0000000100003644 ZN20SipMultiStringHeaderD2Ev`main(argc=2, argv=0x00007ff7bfeff5f0) at ZN20SipMultiStringHeaderD2Ev.cpp:175:3
    frame #8: 0x00007ff80250b41f dyld`start + 1903
(lldb) re re
General Purpose Registers:
       rax = 0x0000000000000000
       rbx = 0x00007ff845f3e700  dyld`_main_thread
       rcx = 0x00007ff7bfefed98
       rdx = 0x0000000000000000
       rdi = 0x0000000000000103
       rsi = 0x0000000000000006
       rbp = 0x00007ff7bfefedc0
       rsp = 0x00007ff7bfefed98
        r8 = 0x0000000000000001
        r9 = 0x0000000000000000
       r10 = 0x0000000000000000
       r11 = 0x0000000000000246
       r12 = 0x0000000000000103
       r13 = 0x00007ff7bfeff540
       r14 = 0x0000000000000006
       r15 = 0x0000000000000016
       rip = 0x00007ff80282d202  libsystem_kernel.dylib`__pthread_kill + 10
    rflags = 0x0000000000000246
        cs = 0x0000000000000007
        fs = 0x0000000000000000
        gs = 0x0000000000000000

(lldb) dis -s $pc-32 -c 24 -m -F intel
libsystem_kernel.dylib`proc_rlimit_control:
    0x7ff80282d1e2 <+2>:  add    dword ptr [rax], eax
    0x7ff80282d1e4 <+4>:  add    cl, byte ptr [rcx - 0x77]
    0x7ff80282d1e7 <+7>:  retf   0x50f
    0x7ff80282d1ea <+10>: jae    0x7ff80282d1f4            ; <+20>
    0x7ff80282d1ec <+12>: mov    rdi, rax
    0x7ff80282d1ef <+15>: jmp    0x7ff802826ceb            ; cerror_nocancel
    0x7ff80282d1f4 <+20>: ret
    0x7ff80282d1f5 <+21>: nop
    0x7ff80282d1f6 <+22>: nop
    0x7ff80282d1f7 <+23>: nop

libsystem_kernel.dylib`:
    0x7ff80282d1f8 <+0>:  mov    eax, 0x2000148
    0x7ff80282d1fd <+5>:  mov    r10, rcx
    0x7ff80282d200 <+8>:  syscall
->  0x7ff80282d202 <+10>: jae    0x7ff80282d20c            ; <+20>
    0x7ff80282d204 <+12>: mov    rdi, rax
    0x7ff80282d207 <+15>: jmp    0x7ff802826ceb            ; cerror_nocancel
    0x7ff80282d20c <+20>: ret
    0x7ff80282d20d <+21>: nop
    0x7ff80282d20e <+22>: nop
    0x7ff80282d20f <+23>: nop

libsystem_kernel.dylib`setitimer:
    0x7ff80282d210 <+0>:  mov    eax, 0x2000053
    0x7ff80282d215 <+5>:  mov    r10, rcx
    0x7ff80282d218 <+8>:  syscall
    0x7ff80282d21a <+10>: jae    0x7ff80282d224            ; <+20>
(lldb) thread info -s
thread #1: tid = 0x81b0d, 0x00007ff80282d202 libsystem_kernel.dylib`__pthread_kill + 10, queue = 'com.apple.main-thread', stop reason = signal SIGABRT
**//

//
//  main.cpp
//  sipparser
//
//  Created by Project Zero on 20.03.23.
//

#include <iostream>
#include <dlfcn.h>
#include <string>
#include <mach/mach.h>
#include <mach-o/dyld_images.h>
#include <mach-o/loader.h>
#include <mach-o/nlist.h>

typedef uint64_t (*t_SipMessageDecoder_decode)(void *arg1, std::string &s, void *arg3, void *arg4);
t_SipMessageDecoder_decode SipMessageDecoder_decode;

typedef uint64_t (*t_SipMessageEncodingMap_constructor)(void *arg1);
t_SipMessageEncodingMap_constructor SipMessageEncodingMap_constructor;


// loads the library and gets its base address
void *LoadLibrary(const char *name) {
  dlopen(name, RTLD_LAZY);
  
  task_dyld_info_data_t task_dyld_info;
  mach_msg_type_number_t count = TASK_DYLD_INFO_COUNT;

  kern_return_t krt;
  krt = task_info(mach_task_self(), TASK_DYLD_INFO, (task_info_t)&task_dyld_info, &count);
  if (krt != KERN_SUCCESS) {
    printf("Unable to retrieve task_info, %d\n", krt);
    return NULL;
  }

  dyld_all_image_infos *all_image_infos = (dyld_all_image_infos *)task_dyld_info.all_image_info_addr;
  const dyld_image_info *all_image_info_array = all_image_infos->infoArray;
  
  for (uint32_t i = 0; i < all_image_infos->infoArrayCount; ++i) {
    if(strcmp(all_image_info_array[i].imageFilePath, name) == 0) {
      return (void*)all_image_info_array[i].imageLoadAddress;
    }
  }

  return NULL;
}

void *GetLoadCommand(mach_header_64 *mach_header,
                              void *load_commands_buffer,
                              uint32_t load_cmd_type,
                              const char *segname) {
  uint64_t load_cmd_addr = (uint64_t)load_commands_buffer;
  for (uint32_t i = 0; i < mach_header->ncmds; ++i) {
    load_command *load_cmd = (load_command *)load_cmd_addr;
    if (load_cmd->cmd == load_cmd_type) {
      if (load_cmd_type != LC_SEGMENT_64
          || !strcmp(((segment_command_64*)load_cmd)->segname, segname)) {
        return load_cmd;
      }
    }

    load_cmd_addr += load_cmd->cmdsize;
  }

  return NULL;
}

void *GetSymbolAddress(void *base_address, const char *symbol_name) {
  mach_header_64 *mach_header = (mach_header_64 *)base_address;

  void *load_commands_buffer = (void *)((uint64_t)base_address + sizeof(mach_header_64));

  symtab_command *symtab_cmd = (symtab_command *)GetLoadCommand(mach_header, load_commands_buffer, LC_SYMTAB, NULL);

  segment_command_64 *linkedit_cmd = (segment_command_64 *)GetLoadCommand(mach_header, load_commands_buffer, LC_SEGMENT_64, "__LINKEDIT");

  segment_command_64 *text_cmd = (segment_command_64 *)GetLoadCommand(mach_header, load_commands_buffer, LC_SEGMENT_64, "__TEXT");

  uint64_t file_vm_slide = (uint64_t)base_address - text_cmd->vmaddr;

  char *strtab = (char *)linkedit_cmd->vmaddr + file_vm_slide
                         + symtab_cmd->stroff - linkedit_cmd->fileoff;

  char *symtab = (char *)(linkedit_cmd->vmaddr + file_vm_slide
                         + symtab_cmd->symoff - linkedit_cmd->fileoff);

  void *symbol_address = NULL;

  size_t curr_symbol_address = (size_t)symtab;
  for (int i = 0; i < symtab_cmd->nsyms; ++i) {
    nlist_64 curr_symbol = *(nlist_64*)curr_symbol_address;
    if ((curr_symbol.n_type & N_TYPE) == N_SECT) {
      char *curr_sym_name = NULL;
      std::string curr_sym_name_string;
      curr_sym_name = strtab + curr_symbol.n_un.n_strx;

      //printf("%s\n", curr_sym_name);
      if (!strcmp(curr_sym_name, symbol_name)) {
        symbol_address = (void*)((uint64_t)base_address - text_cmd->vmaddr + curr_symbol.n_value);
        break;
      }
    }

    curr_symbol_address += sizeof(nlist_64);
  }
  
  return symbol_address;
}

int initIPTelephony() {
  void *libip = LoadLibrary("/System/Library/PrivateFrameworks/IPTelephony.framework/Support/libIPTelephony.dylib");
  if(!libip) {
    printf("Error loading libIPTelephony.dylib\n");
    return 0;
  } else {
    printf("Loaded libIPTelephony.dylib at %p\n", libip);
  }
  
  void *symbol_address;

  symbol_address = GetSymbolAddress(libip, "__ZN17SipMessageDecoder6decodeERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEPP10SipMessagePb");
  if(!symbol_address) {
    printf("Symbol lookup failed\n");
    return 0;
  }
  SipMessageDecoder_decode = (t_SipMessageDecoder_decode)symbol_address;

  symbol_address = GetSymbolAddress(libip, "__ZN20SipMultiStringHeaderD0Ev");
  if(!symbol_address) {
    printf("Symbol lookup failed\n");
    return 0;
  }
  SipMessageEncodingMap_constructor = (t_SipMessageEncodingMap_constructor)symbol_address;
  
  return 1;
}

int ReadFileToString(const char *filename, std::string &str) {
  FILE *fp = fopen(filename, "rb");
  if(!fp) {
    printf("Error opening %s\n", filename);
    return 0;
  }
  fseek(fp, 0, SEEK_END);
  size_t size = ftell(fp);
  fseek(fp, 0, SEEK_SET);
  
  char *buf = (char *)malloc(size);
  fread(buf, 1, size, fp);
  fclose(fp);
  
  str.assign(buf, size);
  
  free(buf);

  return 1;
}

int main(int argc, const char * argv[]) {
  if(!initIPTelephony()) return 0;

  if(argc < 2) {
    printf("Usage: %s <input file>\n", argv[0]);
    return 0;
  }
  
  std::string str;
  
  if(!ReadFileToString(argv[1], str)) return 0;
  
  printf("Running decoder\n");

  char sipMessageEncodingMap[1000];
  SipMessageEncodingMap_constructor(sipMessageEncodingMap);
  
  char arg1[80];
  memset(arg1, 0, sizeof(arg1));
#ifdef ARM64
  memset(arg1 + 44, 0xAA, 4);
#else
  memset(arg1 + 40, 0xAA, 8);
#endif
  *(uint64_t*)(arg1 + 56) = (uint64_t)sipMessageEncodingMap;

  void *arg3 = NULL;
  char arg4 = 0;
  
  SipMessageDecoder_decode(arg1, str, &arg3, &arg4);

  printf("Done\n");
  
  return 0;
}
