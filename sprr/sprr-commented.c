#define _XOPEN_SOURCE
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

/* Recover from Protected Page Access, setup Signal Handler, set x0 to a 0xdeadbeef (0x41414141) and increment program counter (pc), Return to ptr[0] = 0xd65f03c0. TODO, Fuzz the pc - done */
static void sev_handler(int signo, siginfo_t *info, void *cx_)
{
    printf("Now in sev_handler\n");
    (void)signo;
    (void)info;
    printf("Now in sev_handler at ucontext_t *cx = cx_;\n");
    ucontext_t *cx = cx_;
    printf("Now in sev_handler at cx->uc_mcontext->__ss.__x[0] = 0xdeadbeef;\n");
    cx->uc_mcontext->__ss.__x[0] = 0xdeadbeef;
    printf("Now in sev_handler at cx->uc_mcontext->__ss.__pc = cx->uc_mcontext->__ss.__lr;\n");
    cx->uc_mcontext->__ss.__pc = cx->uc_mcontext->__ss.__lr;
}

/* Recovering from Non-Executable Page Access, set x0 to 0xdeadbeef (0x41414141), set pc +4, jmp to link register (__ss.__lr) to Return */
static void bus_handler(int signo, siginfo_t *info, void *cx_)
{
    printf("Now in bus_handler\n");
    (void)signo;
    (void)info;
    printf("Now in bus_handler at ucontext_t *cx = cx_;\n");
    ucontext_t *cx = cx_;
// magic pattern like 0x41414141 or 0xdeadbeef*/
    printf("Now in bus_handler at cx->uc_mcontext->__ss.__x[0] = 0xdeadbeef;\n");
    cx->uc_mcontext->__ss.__x[0] = 0xdeadbeef;
    printf("Now in bus_handler at cx->uc_mcontext->__ss.__pc += 4;\n");
// Increase the Program Counter (pc) +4 on ARM - This is a jmp
    cx->uc_mcontext->__ss.__pc += 4;
}

static void write_sprr_perm(uint64_t v)
{
    printf("Jumped to write_sprr_perm... Step 1...\n");
    clock_t start = clock();
    printf("Start __volatile__ write_sprr_perm\n");
// Write the magic pattern
    __asm__ __volatile__("msr S3_6_c15_c1_5, %0\n"
                         "isb sy\n" ::"r"(v)
                         :);
    printf("End __volatile__ write_sprr_perm\n");
    clock_t stop = clock();
        double elapsed = (double)(stop - start) * 1000.0 / CLOCKS_PER_SEC;
        printf("End write_sprr_perm\n");
        printf("Finished write_sprr_perm ... Time elapsed for write_sprr_perm in ms: %f\n\n", elapsed);
}

static uint64_t read_sprr_perm(void)
{
    printf("Jumped to read_sprr_perm... Step 4...\n");
    clock_t start = clock();
    printf("Hitting read_sprr_perm at uint64_t v;\n");
    uint64_t v;
    printf("Start __volatile__ read_sprr_perm\n");
    __asm__ __volatile__("isb sy\n"
                         "mrs %0, S3_6_c15_c1_5\n"
                         : "=r"(v)::"memory");
    printf("End __volatile__ read_sprr_perm\n");
    printf("End read_sprr_perm\n");
    clock_t stop = clock();
        double elapsed = (double)(stop - start) * 1000.0 / CLOCKS_PER_SEC;
    printf("Finished read_sprr_perm ... Time elapsed for read_sprr_perm in ms: %f\n\n", elapsed);
    return v;
}

static bool can_read(void *ptr)
{
    printf("Jumped to can_read... Step 5...\n");
    clock_t start = clock();
    printf("Hitting can_read at uint64_t v = 0\n");
    uint64_t v = 0;
    printf("Start __volatile__ can_read\n");
/* Check the Read on magic pattern and Return */
    __asm__ __volatile__("ldr x0, [%0]\n"
                         "mov %0, x0\n"
                         : "=r"(v)
                         : "r"(ptr)
                         : "memory", "x0");
    printf("End __volatile__ can_read\n");
    clock_t stop = clock();
        double elapsed = (double)(stop - start) * 1000.0 / CLOCKS_PER_SEC;
    printf("Hitting 0xdeadbeef in can_read\n");
    printf("Finished... Time elapsed for can_read in ms: %f\n\n", elapsed);
    if (v == 0xdeadbeef)
        return false;
    return true;
}

static bool can_write(void *ptr)
{
    printf("Jumped to can_write... Step 6...\n");
    clock_t start = clock();
    printf("Hitting can_write at uint64_t v = 0\n");
    uint64_t v = 0;
    printf("Start __volatile__ can_write\n");
/* Can we Write the magic pattern */
    __asm__ __volatile__("str x0, [%0]\n"
                         "mov %0, x0\n"
                         : "=r"(v)
                         : "r"(ptr + 8)
                         : "memory", "x0");
    printf("End __volatile__ can_write\n");
    printf("Hitting 0xdeadbeef in can_write\n");
    clock_t stop = clock();
        double elapsed = (double)(stop - start) * 1000.0 / CLOCKS_PER_SEC;
        printf("Finished... Time elapsed for can_write in ms: %f\n\n", elapsed);
    if (v == 0xdeadbeef)
        return false;
    return true;
}

/* Can we Execute */
static bool can_exec(void *ptr)
{
    printf("Jumped to can_exec... Step 7...\n");
    clock_t start = clock();
    printf("Hitting can_exec at uint64_t (*fun_ptr)(uint64_t) = ptr\n");
    uint64_t (*fun_ptr)(uint64_t) = ptr;
    printf("Hitting uint64_t res = fun_ptr(0)\n");
    uint64_t res = fun_ptr(0);
    printf("Executed uint64_t res = fun_ptr(0)\n");
    clock_t stop = clock();
        double elapsed = (double)(stop - start) * 1000.0 / CLOCKS_PER_SEC;
    printf("Hitting 0xdeadbeef in can_exec\n");
    printf("Finished... Time elapsed in can_exec in ms: %f\n\n", elapsed);
    if (res == 0xdeadbeef)
        return false;
    return true;
}

static void sprr_test(void *ptr, uint64_t v)
{
    printf("Jumped to sprr_test.. Step 3...\n");
    clock_t start = clock();
    printf("Now at sprr_test before uint64_t a, b\n");
    uint64_t a, b;
    printf("Completed at sprr_test after uint64_t a, b\n");
    printf("Now at sprr_test before a = read_sprr_perm()\n\n");
    a = read_sprr_perm();
    printf("Completed at sprr_test following a = read_sprr_perm()\n\n");
    write_sprr_perm(v);
    printf("Completed at sprr_test following write_sprr_perm(v)\n\n");
    printf("Now at sprr_test before b = read_sprr_perm()\n\n");
    b = read_sprr_perm();
    printf("Finished at sprr_test after b = read_sprr_perm()\n\n");
/* Print Results */
    printf("Register Value:%llx: %c%c%c\n", b, can_read(ptr) ? 'r' : '-', can_write(ptr) ? 'w' : '-',
           can_exec(ptr) ? 'x' : '-');
    clock_t stop = clock();
        double elapsed = (double)(stop - start) * 1000.0 / CLOCKS_PER_SEC;
        printf("Finished.... Time elapsed for sprr_test in ms: %f\n\n", elapsed);
}

static uint64_t make_sprr_val(uint8_t nibble)
{
    printf("Jumped to make_sprr_val.. Step 2...\n");
    clock_t start = clock();
    printf("Hitting make_sprr_val at uint64_t res = 0\n");
    uint64_t res = 0;
    printf("Hitting make_sprr_val at int i = 0; i < 16; ++i \n");
    for (int i = 0; i < 16; ++i)
/* Nibble 4 * i bytes at a time.. this is where undefined behavior creeps in ...  needs to be 16-byte aligned at all the time to not be undefined by C spec */
        res |= ((uint64_t)nibble) << (4 * i);
    printf("End of make_sprr_val\n");
    clock_t stop = clock();
        double elapsed = (double)(stop - start) * 1000.0 / CLOCKS_PER_SEC;
        printf("Finished... Time elapsed for make_sprr_val in ms: %f\n\n", elapsed);
    return res;
}

uint64_t read_sprr(void)
{
//    This is now a void() and returns nothing to see here.. thank you .. drive thru..
    printf("Jumped to read_sprr\n");
    clock_t start = clock();

    uint64_t v;
    
    printf("Start __volatile__ read_sprr\n");
    __asm__ __volatile__("isb sy\n"
                         "mrs %0, S3_6_c15_c1_5\n"
                         : "=r"(v)::"memory");
    printf("Finished in __volatile__ read_sprr\n");
    clock_t stop = clock();
        double elapsed = (double)(stop - start) * 1000.0 / CLOCKS_PER_SEC;
        printf("Finished... Time elapsed in read_sprr for ms: %f\n\n", elapsed);
    return v;
}

/* MAIN FUNCTION */
int main(int argc, char *argv[])
{
    printf("Program name is: %s\n", argv[0]);
    printf(RED("------------------------------------------------------------------------------") "\n");
    printf(CYN("Original Code by: Sven Peter @svenpeter42 | Modified by David Hoyt @h02332\n"));
    printf(RED("------------------------------------------------------------------------------") "\n");
    char cwd[PATH_MAX];
    getcwd(cwd, sizeof(cwd));
    printf("Starting M1 SPRR Permission Configuration Register (EL0) S3_6_c15_c1_5 check as: %s in Current working dir: %s\n", argv[0], cwd);
    printf("Writing to Logfile %s.log for M1 SPRR Permission Configuration Register (EL0) S3_6_c15_c1_5 check as: %s in Current working dir: %s\n", argv[0], argv[0], cwd);
    printf("Writing to Syslogd at LOG_NOTICE for M1 SPRR Permission Configuration Register (EL0) S3_6_c15_c1_5 check as: %s in Current working dir: %s\n", argv[0], cwd);
    FILE *f;
    f = fopen("ptime.log", "a+"); //  a+ (create + append) option will allow appending which is useful in a log file
    if (f == NULL) { /* Something is wrong   */}
    fprintf(f, "Starting M1 SPRR Permission Configuration Register (EL0) S3_6_c15_c1_5 check\n");
    printf(RED("------------------------------------------------------------------------------") "\n");
    printf(HWHT("\nSystem Software & Hardware:\n"));
    system("uname -a\n");
    system("sysctl machdep.cpu.brand_string\n");
    printf(RED("---------------------------") "\n");
    setlogmask (LOG_UPTO (LOG_NOTICE));
    openlog ("Starting M1 SPRR Permission Configuration Register (EL0) S3_6_c15_c1_5 check", LOG_CONS | LOG_PID | LOG_NDELAY, LOG_LOCAL1);
    syslog (LOG_NOTICE, "Starting M1 SPRR Permission Configuration Register (EL0) S3_6_c15_c1_5 check as: %s", argv[0]);
    closelog ();
    printf(RED("---------------------------") "\n"); // variables to store the date and time components
    int hours, minutes, seconds, day, month, year;
    
    //  `time_t` is an arithmetic time type
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
    
    day = local->tm_mday;           //  get day of month (1 to 31)
    month = local->tm_mon + 1;      // get month of year (0 to 11)
    year = local->tm_year + 1900;   // get year since 1900
    
    // print the current date
    printf("Run Date (D/M/Y) = %02d/%02d/%d\n", day, month, year);
    
    // print local time
    
    if (hours < 12) {     // before midday
        printf("MS Timer Start at %02d:%02d:%02d am\n", hours, minutes, seconds);
    }
    else {     // after midday
        printf("MS Timer Start at %02d:%02d:%02d pm\n", hours - 12, minutes, seconds);
    }
    
    printf(RED("---------------------------") "\n");
    printf(RED("---------------------------") "\n");
    
    // Convert to local time format and print to stdout
    printf("Today is %s\n", ctime(&now));
    printf(RED("------------------------------------------------------------------------------") "\n");
    printf(GRN("\nTimestamp: " "%s\n") "",ctime(&now));
    printf(RED("------------------------------------------------------------------------------") "\n");
    clock_t start = clock();
    
    (void)argc;
    (void)argv;
    printf("Now hitting main() struct sigaction\n");
    struct sigaction sa;
    printf("Now hitting main() sigfillset(&sa.sa_mask)\n");
    sigfillset(&sa.sa_mask);
    printf("Now hitting main() sa.sa_sigaction = bus_handler\n");
    sa.sa_sigaction = bus_handler;
    printf("Now hitting main() sa.sa_flags = SA_RESTART | SA_SIGINFO\n");
    sa.sa_flags = SA_RESTART | SA_SIGINFO;
    printf("Now hitting main() sigaction SIGBUS, &sa, 0\n");
    sigaction(SIGBUS, &sa, 0);
    printf("Now hitting main() sa.sa_sigaction = sev_handler\n");
    sa.sa_sigaction = sev_handler;
    printf("Now hitting main() sigaction SIGSEGV, &sa\n");
    sigaction(SIGSEGV, &sa, 0);
    printf("Now hitting main() uint32_t *ptr = mmap(NULL, 0x4000, PROT_READ | PROT_WRITE | PROT_EXEC, MAP_PRIVATE | MAP_ANONYMOUS | MAP_JIT, -1, 0)\n\n");
    /* map a page with MAP_JIT and try to read, write or execute that memory for all four possible values in the system register */
    uint32_t *ptr = mmap(NULL, 0x4000, PROT_READ | PROT_WRITE | PROT_EXEC,
                         MAP_PRIVATE | MAP_ANONYMOUS | MAP_JIT, -1, 0);
    printf("Now hitting main() write_sprr_perm(0x3333333333333333)\n\n");
    /* Flip some bits - 64-bit */
    write_sprr_perm(0x3333333333333333);
    printf("Just executed main() write_sprr_perm(0x3333333333333333)\n\n");
    /* 
     Set memory to contain the RET instruction to attempt to execute. 
     There are multiple valid encodings of return (which is really a special form of branch). 
     These is the one clang seems to use: 
     kRet = 0xd65f03c0,
     kBrk0 = 0xd4200000,
     kBrk1 = 0xd4200020,
     kBrkF000 = 0xd43e0000,
     kHlt0 = 0xd4400000,
     */
    printf("Now in main() hitting ptr[0] 0xd65f03c0 RET\n\n");
    ptr[0] = 0xd65f03c0; // ret
    printf("Now in main() hitting for (int i = 0; i < 4; ++i)\n\n");
    for (int i = 0; i < 4; ++i)
        sprr_test(ptr, make_sprr_val(i));
    clock_t stop = clock();
    double elapsed = (double)(stop - start) * 1000.0 / CLOCKS_PER_SEC;
    printf(GRN("main () finished... Total Elapsed Time in ms: %f\n\n"), elapsed);
    printf("Done at %s", ctime(&now));
    printf(CYN("M1 SPRR Permission Configuration Register (EL0) S3_6_c15_c1_5 check ended at " "%s") "",ctime(&now));
    
}
