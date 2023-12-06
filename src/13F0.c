#include <ultra64.h>

extern void load_from_rom_to_addr(void* arg0, s32 arg1, u32 arg2);

extern s32 D_80019F90;
extern u8 D_80024820[];

void func_800007F0(s32 arg0, void* arg1);

void func_80000870(void) {
    func_80001A30(3, &D_80019F90);
    load_from_rom_to_addr(&D_80024820, 0x100, 0x30000);
}

void func_8000083C(s32 arg0, void *arg1, s32 arg2) {
    void (*volatile localarg)(int);
    // its also possible to match without fake code by omitting arg1 passed to func_800007F0. which would be UB
    func_800007F0(arg0, arg1);
    (localarg = arg1)(arg2);
    if(!arg1) {} // fake check to bump regalloc. see above note
}

void func_800007F0(s32 arg0, void* arg1) {
    s32 temp_t6 = (D_80024820[arg0] << 0xB);

    if (temp_t6 == 0) {
        temp_t6 = 0x80000;
    }
    load_from_rom_to_addr(arg1, temp_t6, arg0 << 0x11);
}
