#include <ultra64.h>

extern void load_from_rom_to_addr(void* vAddr, s32 size, u32 devAddr);

extern s32 D_80019F90;
extern u8 gSectionSizes[];

void func_800007F0(s32 arg0, void* arg1);

void func_80000870(void) {
    func_80001A30(3, &D_80019F90);
    load_from_rom_to_addr(&gSectionSizes, 0x100, 0x30000);
}

void func_8000083C(s32 id, void *vAddr, s32 arg) {
    void (*volatile localarg)(int);
    // its also possible to match without fake code by omitting arg1 passed to func_800007F0. which would be UB
    func_800007F0(id, vAddr);
    (localarg = vAddr)(arg);
    if(!vAddr) {} // fake check to bump regalloc. see above note
}

void func_800007F0(s32 id, void* vAddr) {
    s32 size = (gSectionSizes[id] << 0xB);

    // if no size specified, use the max size.
    if (size == 0) {
        size = 0x80000;
    }

    // for an ID of 2, the call will look like:
    // load_from_rom_to_addr(0x80225800, 0x1000, 0x40000);
    load_from_rom_to_addr(vAddr, size, id << 0x11);
}
