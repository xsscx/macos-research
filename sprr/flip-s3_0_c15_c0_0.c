#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>


uint64_t read_sprr(void)
{
    uint64_t v;
    __asm__ __volatile__("isb sy\n"
                         "mrs %0, s3_0_c15_c0_0\n"
                         : "=r"(v)::"memory");
    return v;
}


int main(int argc, char *argv[])
{
    for (int i = 0; i < 64; ++i) {
/*        write_sprr(1ULL<<i); */
        printf("bit %02d: %016llx\n", i, read_sprr());
    }
}
