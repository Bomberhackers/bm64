#ifndef _FUNCTIONS_H_
#define _FUNCTIONS_H_

#include "ultra64.h"

// set_zero_tlb.c
void set_zero_vaddr_tlb(void);

// 2630.s
void func_80001A30(u32 *table, u32* func);

// 2990.s
s32 func_80001D90(s32*, s32*, s32);

#endif // _FUNCTIONS_H_
