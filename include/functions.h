#ifndef _FUNCTIONS_H_
#define _FUNCTIONS_H_

#include "ultra64.h"

// set_zero_tlb.c
void set_zero_vaddr_tlb(void);

// 10D0.s
void load_from_rom_to_addr(void*, u32, u32);

#endif // _FUNCTIONS_H_
