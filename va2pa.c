#include <stddef.h>
#include <stdint.h>

#define __asm_syscall(...) \
        __asm__ __volatile__ ("ecall\n\t" \
        : "+r"(a0) : __VA_ARGS__ : "memory"); \
	return a0; \

long va2pa(void *a)
{
  register long a7 __asm__("a7") = 257;
  register long a0 __asm__("a0") = (uintptr_t)a;
  __asm_syscall("r"(a7), "0"(a0))
}

