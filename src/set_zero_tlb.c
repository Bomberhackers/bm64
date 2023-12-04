#include <ultra64.h>

extern u32 D_80042000[];

void set_zero_vaddr_tlb(void) {
    load_from_rom_to_addr((u32) (&D_80042000), (u32)&zerojump_ROM_END - (u32)&zerojump_ROM_START, (u32)&zerojump_ROM_START);
    // weird if statements needed to consume registers to match.
    if (boot_code_TEXT_END == 0 || boot_code_TEXT_END == 0) {

    }
    if (boot_code_RODATA_START == 0 || boot_code_RODATA_START == 0) {
        
    }
    if (boot_code_TEXT_END == 0 || boot_code_TEXT_END == 0) {
        
    }
    osMapTLB(0, 0, NULL, (u32) (((u32) (&D_80042000)) - 0x80000000), -1, -1);
    boot_code_RODATA_START = &boot_code_TEXT_END; // this should probably be boot_code_DATA_START, but that wont match yet
}
