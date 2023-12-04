#ifndef _SECTIONS_H_
#define _SECTIONS_H_

#include "ultra64.h"

// zerojump area
extern u8 zerojump_ROM_START[];
extern u8 zerojump_ROM_END[];

extern u32 boot_code_TEXT_END;
extern u32 boot_code_RODATA_START;

#endif // _SECTIONS_H_
