#define NO_ZEROJMP_MAPPING
#include <ultra64.h>

extern u32 D_80042000[];
extern u32 gZeroJmpFuncs[];
extern u32 gSecureCallArr[];

// todo, move to header
extern void load_from_rom_to_addr(void* arg0, s32 arg1, u32 arg2);

void set_zero_vaddr_tlb(void) {
    load_from_rom_to_addr((u32)&D_80042000, (u32)&zerojump_ROM_END - (u32)&zerojump_ROM_START, (u32)&zerojump_ROM_START);
    // weird if statements needed to consume registers to match.
    if (boot_code_TEXT_END == 0 || boot_code_TEXT_END == 0) {

    }
    if (boot_code_RODATA_START == 0 || boot_code_RODATA_START == 0) {
        
    }
    if (boot_code_TEXT_END == 0 || boot_code_TEXT_END == 0) {
        
    }
    osMapTLB(0, 0, NULL, (u32) (((u32) (&D_80042000)) - 0x80000000), -1, -1);
    gSecureCallArr[0] = &gZeroJmpFuncs; // map the secure call manually.
}
