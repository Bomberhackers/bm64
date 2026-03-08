#define NO_ZEROJMP_MAPPING
#include <ultra64.h>
#include "ovl_setup.h"

extern void load_from_rom_to_addr(void* vAddr, s32 size, u32 devAddr);

extern u8 gSectionSizes[];

/*
 * Set overlay secure call table and load section sizes into vram.
 */
void OvlSetup_LoadSectionSizes(void) {
    set_secure_call_arr(ZEROJMP_OVL_TABLE_ID, &gOVLFuncs);
    load_from_rom_to_addr(&gSectionSizes, 0x100, 0x30000);
}

/*
 * Load the area for the decompressed overlay and execute it with the argument.
 */
void OvlSetup_LoadExecAddress(s32 id, void *vAddr, void *arg) {
    void (*volatile localarg)(void *);
    // its also possible to match without fake code by omitting arg1 passed to OvlSetup_LoadArea. which would be UB
    OvlSetup_LoadArea(id, vAddr);
    (localarg = vAddr)(arg);
    if(!vAddr) {} // fake check to bump regalloc. see above note
}

/*
 * This seems to copy or load an uncompressed "overlay" to a vaddr. However, the only one
 * it seems to consider is the main code. This could imply this supported more decompressed
 * overlays, but the rest are compressed.
 */
void OvlSetup_LoadArea(s32 id, void* vAddr) {
    s32 size = (gSectionSizes[id] << 0xB);

    // if no size specified, use the max size.
    if (size == 0) {
        size = 0x80000;
    }

    // for an ID of 2, the call will look like:
    // load_from_rom_to_addr(0x80225800, 0x1000, 0x40000);
    load_from_rom_to_addr(vAddr, size, id << 0x11);
}
