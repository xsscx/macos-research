#define _XOPEN_SOURCE
#include <signal.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/utsname.h>
#include <ucontext.h>

static void segv_handler(int signo, siginfo_t *info, void *cx_) {
    (void)signo; // Explicitly ignore parameter
    (void)info; // Explicitly ignore parameter
    ucontext_t *cx = (ucontext_t *)cx_;
    // Modify general purpose register 0 (x0) to a test value
    cx->uc_mcontext->__ss.__x[0] = 0xdeadbeef;
    // Adjust PC based on LR, incrementing by 4 to skip an instruction
    cx->uc_mcontext->__ss.__pc = cx->uc_mcontext->__ss.__lr += 4;
}

static void bus_handler(int signo, siginfo_t *info, void *cx_) {
    (void)signo;
    (void)info;
    ucontext_t *cx = (ucontext_t *)cx_;
    cx->uc_mcontext->__ss.__x[0] = 0xdeadbeef;
    // Increment PC by 4 to potentially recover from the bus error
    cx->uc_mcontext->__ss.__pc += 4;
}

static void write_sprr_perm(uint64_t v)
{
    __asm__ __volatile__("msr S3_6_c15_c1_5, %0\n"
                         "isb sy\n" ::"r"(v)
                         :);
}

static uint64_t read_sprr_perm(void)
{
    uint64_t v;
    __asm__ __volatile__("isb sy\n"
                         "mrs %0, S3_6_c15_c1_5\n"
                         : "=r"(v)::"memory");
    return v;
}

static bool can_read(void *ptr)
{
    uint64_t v = 0;

    __asm__ __volatile__("ldr x0, [%0]\n"
                         "mov %0, x0\n"
                         : "=r"(v)
                         : "r"(ptr)
                         : "memory", "x0");

    if (v == 0xdeadbeef)
        return false;
    return true;
}

static bool can_write(void *ptr)
{
    uint64_t v = 0;

    __asm__ __volatile__("str x0, [%0]\n"
                         "mov %0, x0\n"
                         : "=r"(v)
                         : "r"(ptr + 8)
                         : "memory", "x0");

    if (v == 0xdeadbeef)
        return false;
    return true;
}

static bool can_exec(void *ptr)
{
    uint64_t (*fun_ptr)(uint64_t) = ptr;
    uint64_t res = fun_ptr(0);
    if (res == 0xdeadbeef)
        return false;
    return true;
}

static void sprr_test(void *ptr, uint64_t v)
{
    uint64_t a, b;

    // Read the SPRR register value before writing
    a = read_sprr_perm();
    
    // Print the before permissions
    printf("Before: %llx, Permissions: %c%c%c\n", a,
           can_read(ptr) ? 'r' : '-',
           can_write(ptr) ? 'w' : '-',
           can_exec(ptr) ? 'x' : '-');

    // Write the new value to the SPRR register
    write_sprr_perm(v);

    // Read the SPRR register value after writing
    b = read_sprr_perm();

    // Print the after permissions
    printf("After:  %llx, Permissions: %c%c%c\n", b,
           can_read(ptr) ? 'r' : '-',
           can_write(ptr) ? 'w' : '-',
           can_exec(ptr) ? 'x' : '-');
}

static uint64_t repeat_4bit_value(uint8_t value)
{
    if (value > 0xF) {
        fprintf(stderr, "Value out of 4-bit range.\n");
        return 0; // Or handle this error appropriately
    }
    
    uint64_t repeated_value = value & 0xF; // Ensure only 4 bits are used
    for (int i = 1; i < 16; ++i) {
        repeated_value |= ((uint64_t)value & 0xF) << (4 * i);
    }
    
    return repeated_value;
}


int main(int argc, char *argv[]) {
    (void)argc; // Explicitly ignore parameter
    (void)argv; // Explicitly ignore parameter

    struct sigaction sa;
    memset(&sa, 0, sizeof(sa)); // Initialize struct to zero
    sigfillset(&sa.sa_mask);
    sa.sa_sigaction = bus_handler;
    sa.sa_flags = SA_RESTART | SA_SIGINFO;
    if (sigaction(SIGBUS, &sa, NULL) == -1) {
        perror("sigaction for SIGBUS failed");
        return EXIT_FAILURE;
    }
    
    sa.sa_sigaction = segv_handler; // Use consistent naming for handlers
    if (sigaction(SIGSEGV, &sa, NULL) == -1) {
        perror("sigaction for SIGSEGV failed");
        return EXIT_FAILURE;
    }
    
    uint32_t *ptr = mmap(NULL, 0x4000, PROT_READ | PROT_WRITE | PROT_EXEC,
                         MAP_PRIVATE | MAP_ANONYMOUS | MAP_JIT, -1, 0);
    if (ptr == MAP_FAILED) {
        perror("mmap failed");
        return EXIT_FAILURE;
    }
    
    write_sprr_perm(0x3333333333333333);
    ptr[0] = 0xd65f03c0; // ret
    
    for (int i = 0; i < 4; ++i)
        sprr_test(ptr, repeat_4bit_value(i));
    
    // Freeing the mapped memory (added clean-up)
    munmap(ptr, 0x4000);
    
    return EXIT_SUCCESS;
}
