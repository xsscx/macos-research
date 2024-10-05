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

  symbol_address = GetSymbolAddress(libip, "__ZN17SipMessageDecoderD2Ev");
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
