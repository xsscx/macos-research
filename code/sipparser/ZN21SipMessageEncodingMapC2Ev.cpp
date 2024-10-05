//
//  ZN21SipMessageEncodingMapC2Ev.cpp
//  sipparser based on Bug 2440 by Google Project 0
//
//  Created by Project Zero on 20.03.23.
//  Modified by David Hoyt @h02332 on 04.08.2023
//
// Build: clang++ -g -fsanitize=address,undefined -o a.out this.cpp
// Verified working on X86_64, Rosetta and arm64e
//
#define _XOPEN_SOURCE
#include <iostream>
#include <dlfcn.h>
#include <string>
#include <mach/mach.h>
#include <mach-o/dyld_images.h>
#include <mach-o/loader.h>
#include <mach-o/nlist.h>
#define MAG(string)  "\e[0;35m" string "\x1b[0m"
#define BLUE(string) "\x1b[34m" string "\x1b[0m"
#define RED(string) "\x1b[31m" string "\x1b[0m"
#define WHT(string)"\e[0;37m" string "\x1b[0m"
#define GRN(string)"\e[0;32m" string "\x1b[0m"
#define YEL(string)"\e[0;33m" string "\x1b[0m"
#define CYN(string)"\e[0;36m" string "\x1b[0m"
#define HWHT(string)"\e[0;97m" string "\x1b[0m"
#define NORMAL_COLOR(string)"\x1B[0m" string "\x1b[0m"
#include <signal.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/utsname.h>
#include <ucontext.h>
#include <stdlib.h>
#include <time.h>
#include <syslog.h>
#include <dirent.h>
#include <sys/types.h>
#include <unistd.h>
#include <limits.h>

// Setup SipMessageDecoder_decode
typedef uint64_t (*t_SipMessageDecoder_decode)(void *arg1, std::string &s, void *arg3, void *arg4);
t_SipMessageDecoder_decode SipMessageDecoder_decode;

// Setup SipMessageEncodingMap_constructor
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
//    printf(RED("------------------------------------------------------------------------------") "\n");
    printf(CYN("Original Code by: Google Project Zero - Bug 2440 | Modified for Fuzzing by David Hoyt @h02332 on August 4, 2023\n"));
//    printf(RED("------------------------------------------------------------------------------") "\n");
    printf(GRN("Starting initIPTelephony() lookup\n"));
    void *libip = LoadLibrary("/System/Library/PrivateFrameworks/IPTelephony.framework/Support/libIPTelephony.dylib");
  if(!libip) {
    printf("Error loading libIPTelephony.dylib\n");
    return 0;
  } else {
    printf("Loaded libIPTelephony.dylib at %p\n", libip);
  }
  
    void *symbol_address;
    clock_t start = clock();
    symbol_address = GetSymbolAddress(libip, "__ZN17SipMessageDecoder6decodeERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEPP10SipMessagePb");
//    printf("Symbol __ZN17SipMessageDecoder6decodeERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEPP10SipMessagePb at pointer %p\n", symbol_address);
    if(!symbol_address) {
      printf("Symbol lookup failed\n");
      return 0;
    }
    SipMessageDecoder_decode = (t_SipMessageDecoder_decode)symbol_address;
    printf("SipMessageDecoder_decode pointer at %p\n", (void*)SipMessageDecoder_decode);

    symbol_address = GetSymbolAddress(libip, "__ZN21SipMessageEncodingMapC2Ev");
    if(!symbol_address) {
      printf("Symbol lookup failed\n");
      return 0;
    }
    SipMessageEncodingMap_constructor = (t_SipMessageEncodingMap_constructor)symbol_address;
//    printf("SipMessageEncodingMap_constructor pointer at %p\n", (void*)SipMessageEncodingMap_constructor);

    // symbol_name represents the symbol you're trying to locate
    const char* symbol_name = "__ZN21SipMessageEncodingMapC2Ev";

    // Get the address of the symbol in the library
    void* symbol_add = GetSymbolAddress(libip, symbol_name);

    // Print the symbol name and its address
    printf("Symbol %s is located at address %p\n", symbol_name, symbol_add);
    clock_t stop = clock();
        double elapsed = (double)(stop - start) * 1000.0 / CLOCKS_PER_SEC;
    printf(GRN("LoadLibrary() finished... Total Elapsed Time in ms: %f\n\n"), elapsed);
    // printf("Done at %s", ctime(&now));
    // printf(CYN("ZN21SipMessageEncodingMapC2Ev check ended at " "%s") "",ctime(&now));
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
    printf("Starting 🔥🔥🔥🔥 with str...\n");
    printf("----------\n");
    std::cout << str;
    printf("----------\n");
    printf("End Fuzzed str...\n");

  return 1;
}

int main(int argc, const char * argv[]) {
  if(!initIPTelephony()) return 0;
 
  if(argc < 2) {
    printf("Usage: %s <input file>\n", argv[0]);
    return 0;
  }
          char cwd[PATH_MAX];
        getcwd(cwd, sizeof(cwd));
    printf("Starting check ZN21SipMessageEncodingMapC2Ev as: %s in Current working dir: %s\n", argv[0], cwd);
    printf("Writing to Logfile ZN21SipMessageEncodingMapC2Ev for check as: %s in Current working dir: %s\n", argv[0], cwd);
    printf("Writing to Syslogd at LOG_NOTICE for ZN21SipMessageEncodingMapC2Ev check as: %s in Current working dir: %s\n", argv[0], cwd);
    FILE *f;
    f = fopen("ZN21SipMessageEncodingMapC2Ev.log", "a+"); // a+ (create + append) option will allow appending which is useful in a log file
    if (f == NULL) { /* Something is wrong   */}
    fprintf(f, "Starting ZN21SipMessageEncodingMapC2Ev check\n");
//    printf(RED("------------------------------------------------------------------------------") "\n");
    printf(HWHT("\nSystem Software & Hardware:\n"));
    system("uname -a\n");
    system("sysctl machdep.cpu.brand_string\n");
    system("clang -v\n");
    system("xcodebuild -version\n");
//    printf(RED("---------------------------") "\n");
    setlogmask (LOG_UPTO (LOG_NOTICE));
    openlog ("Starting ZN21SipMessageEncodingMapC2Ev check", LOG_CONS | LOG_PID | LOG_NDELAY, LOG_LOCAL1);
    syslog (LOG_NOTICE, "Starting ZN21SipMessageEncodingMapC2Ev check as: %s", argv[0]);
    closelog ();
//    printf(RED("---------------------------") "\n");
    // variables to store the date and time components
    int hours, minutes, seconds, day, month, year;
 
    // `time_t` is an arithmetic time type
    time_t now;
 
    // Obtain current time
    // `time()` returns the current time of the system as a `time_t` value
    time(&now);

    // localtime converts a `time_t` value to calendar time and
    // returns a pointer to a `tm` structure with its members
    // filled with the corresponding values
    struct tm *local = localtime(&now);
 
    hours = local->tm_hour;         // get hours since midnight (0-23)
    minutes = local->tm_min;        // get minutes passed after the hour (0-59)
    seconds = local->tm_sec;        // get seconds passed after a minute (0-59)
 
    day = local->tm_mday;            // get day of month (1 to 31)
    month = local->tm_mon + 1;      // get month of year (0 to 11)
    year = local->tm_year + 1900;   // get year since 1900
 
    // print the current date
    // printf("Run Date (D/M/Y) = %02d/%02d/%d\n", day, month, year);
    
    // print local time
/*
    if (hours < 12) {    // before midday
        printf("MS Timer Start at %02d:%02d:%02d am\n", hours, minutes, seconds);
    }
    else {    // after midday
        printf("MS Timer Start at %02d:%02d:%02d pm\n", hours - 12, minutes, seconds);
    }
*/
//    printf(RED("---------------------------") "\n");
//    printf(RED("---------------------------") "\n");
    
       // Convert to local time format and print to stdout
       // printf("Today is %s\n", ctime(&now));
//    printf(RED("------------------------------------------------------------------------------") "\n");
    printf(GRN("\nTimestamp: " "%s\n") "",ctime(&now));
//    printf(RED("------------------------------------------------------------------------------") "\n");

    if (hours < 12) { // before midday
        printf("Run Time: %02d:%02d:%02d am\n", hours == 0 ? 12 : hours, minutes, seconds);
    } else { // after midday
        printf("Run Time: %02d:%02d:%02d pm\n", hours == 12 ? 12 : hours - 12, minutes, seconds);
    }

    // Print the current date
    printf("Run Date (D/M/Y): %02d/%02d/%d\n", day, month, year);

  std::string str;
  
  if(!ReadFileToString(argv[1], str)) return 0;
  
  printf("Running decoder\n");

  char sipMessageEncodingMap[2000];
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
