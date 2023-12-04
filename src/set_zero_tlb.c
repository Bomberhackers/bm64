#include <ultra64.h>

void load_from_rom_to_addr(void*, u32, u32);
extern u8 D_1CCF0[];
extern u8 D_1CBC0[];

extern u32 boot_code_TEXT_END;
extern u32* set_zero_tlb_data__s;
extern u32 D_80042000[];

void set_zero_vaddr_tlb(void)
{
    load_from_rom_to_addr((u32) (&D_80042000), ((u32) (&D_1CCF0)) - ((u32) (&D_1CBC0)), (u32) (&D_1CBC0));
    /**
     * HORRIBLE and fake. Some kind of safety check is going on here, post func load.
     * The func above loads the rodata area between 0x1CBC0 and 0x1CCF0 in (US) ROM.
     * This area encompasses a data table and some ZeroJump error strings. These strings
     * cannot be used before the above function call since they are not loaded.
     * Without this fake area, the compiler (insists) on using v0/v1 for D_80042000.
     * Registers have to be consumed to force it to use t6. We think in this area was some
     * kind of series of safety checks (hence the unused strings) checking the data in this area.
     * How it was written exactly is still a mystery, but this is one particular permutation
     * that lines everything up just right.
     */
    if (boot_code_TEXT_END == 0 || boot_code_TEXT_END == 0) {
        // this is a single string requesting 6 arguments. we arent sure whats being passed yet.
        ("ZeroJump Error : unset segment [ %d ] call[%d,%d]\n"
         "fault system ..\n"
         "ZeroJump Error : unset function [ %d ] call[%d,%d]\n"
         "fault system ..\n",
         1, 1, 1, 1, 1, 1);
    }
    if (set_zero_tlb_data__s == 0 || set_zero_tlb_data__s == 0) {
        
    }
    if (boot_code_TEXT_END == 0 || boot_code_TEXT_END == 0) {
        
    }
    osMapTLB(0, 0, NULL, (u32) (((u32) (&D_80042000)) - 0x80000000), -1, -1);
    set_zero_tlb_data__s = &boot_code_TEXT_END;
}
