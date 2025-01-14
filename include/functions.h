#ifndef _FUNCTIONS_H_
#define _FUNCTIONS_H_

#include "ultra64.h"

// set_zero_tlb.c
void set_zero_vaddr_tlb(void);

// 2630.s
void func_80001A30(u32 *table, u32* func);

// 2990.s
s32 func_80001D90(s32*, s32*, s32);

//40300.c (hudson libc?)
s32 func_80225B00(s32 arg0);
u8 *Libc_Strcat(u8 *str, u8 *str1);
s32 Libc_Strlen(u8 *str);
size_t func_80225BB8(u32 arg0, u32 arg1, u8 *arg2);
void *Libc_memcpy(u8 *dest, u8 *source, s32 c);
void* Libc_memmove(void* dest, void* src, size_t len);
u8 *Libc_memset(u8 *arg0, u8 *arg1, s32 arg2);

#endif // _FUNCTIONS_H_
