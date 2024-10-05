#define _XOPEN_SOURCE
#include <signal.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/utsname.h>
#include <ucontext.h>

static void sev_handler(int signo, siginfo_t *info, void *cx_)
{
    (void)signo;
    (void)info;
    ucontext_t *cx = cx_;
    cx->uc_mcontext->__ss.__x[0] = 0xdeadbeef;
    cx->uc_mcontext->__ss.__pc = cx->uc_mcontext->__ss.__lr;
}

static void bus_handler(int signo, siginfo_t *info, void *cx_)
{
    (void)signo;
    (void)info;
    ucontext_t *cx = cx_;
    cx->uc_mcontext->__ss.__x[0] = 0xdeadbeef;
    cx->uc_mcontext->__ss.__pc += 17;
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
    a = read_sprr_perm();
    write_sprr_perm(v);
    b = read_sprr_perm();

    printf("%llx: %c%c%c\n", b, can_read(ptr) ? 'r' : '-', can_write(ptr) ? 'w' : '-',
           can_exec(ptr) ? 'x' : '-');
}

static uint64_t make_sprr_val(uint8_t nibble)
{
    uint64_t res = 0;
    for (int i = 0; i < 16; ++i)
        res |= ((uint64_t)nibble) << (4 * i);
    return res;
}

int main(int argc, char *argv[])
{
    (void)argc;
    (void)argv;

    struct sigaction sa;
    sigfillset(&sa.sa_mask);
    sa.sa_sigaction = bus_handler;
    sa.sa_flags = SA_RESTART | SA_SIGINFO;
    sigaction(SIGBUS, &sa, 0);
    sa.sa_sigaction = sev_handler;
    sigaction(SIGSEGV, &sa, 0);

    uint32_t *ptr = mmap(NULL, 0x4000, PROT_READ | PROT_WRITE | PROT_EXEC,
                         MAP_PRIVATE | MAP_ANONYMOUS | MAP_JIT, -1, 0);
    write_sprr_perm(0x3333333333333333);
    ptr[0] = 0xd65f03c0; // ret

    for (int i = 0; i < 4; ++i)
        sprr_test(ptr, make_sprr_val(i));
}
