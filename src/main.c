#define NO_ZEROJMP_MAPPING
#include <ultra64.h>
#include "main.h"
#include "ovl_setup.h"

// TODO: Symbols

extern u8 gSectionSizes[];
extern s32 osTvType;

// bss
s8 gPanOverride; // used for mono setting
OSThread gStartThread;
u8 gStartThreadStack[0x4000]; // stack area
OSThread gGameThread;
u8 gGameThreadStack[0x4000];
int D_80024818;

/*
 * Thread to setup and execute the main code game area.
 */
void Main_ThreadSetupGame(void *unused) {
    u32 offset;
    u32 addr;

    D_80024818 = 2;

    // setup ZeroJmp address and set secure call array tables.
    set_zero_vaddr_tlb();
    set_secure_call_arr(ZEROJMP_OS_TABLE_ID,   &gOSFuncs);
    set_secure_call_arr(ZEROJMP_DMA_TABLE_ID,  &gDMAFuncs);
    set_secure_call_arr(ZEROJMP_VI_TABLE_ID,   &gVIFuncs);
    set_secure_call_arr(ZEROJMP_CONT_TABLE_ID, &gContFuncs);
    set_secure_call_arr(ZEROJMP_SYS_TABLE_ID,  &gSysFuncs);
    set_secure_call_arr(ZEROJMP_AI_TABLE_ID,   &gAIFuncs);
    set_secure_call_arr(ZEROJMP_DP_TABLE_ID,   &gDPFuncs);
    set_secure_call_arr(ZEROJMP_PI_TABLE_ID,   &gPIFuncs);
    set_secure_call_arr(ZEROJMP_AL_TABLE_ID,   &gAlFuncs);
    set_secure_call_arr(ZEROJMP_PFS_TABLE_ID,  &gPfsFuncs);

    OvlSetup_LoadSectionSizes(); // load gSectionSizes into the array so it can be used.
    offset = gSectionSizes[2] << 0xB;
    if (offset == 0) {
        offset = 0x80000;
    }
    addr = 0x80225800; // this is hardcoded to be the first function in the main_code area. Load this area in.
    load_from_rom_to_addr(offset + addr, gSectionSizes[3] << 0xB, offset + 0x40000);

    // thread loop
    while(1) {
        // execute main_code area.
        OvlSetup_LoadExecAddress(D_80024818, addr, &gGameThread);
    }
}

// defined to allow the scheduler asserts to work correctly. This does not do anything.
void __assert(const char* exp, const char* filename, int line) {

}

s32 func_800018B8(f32 arg0) {
    return 0;
}

void func_800018C4(s32 arg0) {

}

void func_800018CC(s32 arg0, s32 arg1, ...) {

}

void func_800018E8(s32 arg0, s32 arg1, s32 arg2) {

}

void func_800018F8(s32 arg0, s32 arg1, ...) {

}

void Main_InitThread(void *arg) {
    func_80000794();
    osCreateThread(&gGameThread, 3, Main_ThreadSetupGame, arg, &gGameThreadStack[0x4000], 0xA);
    osStartThread(&gGameThread);
    osSetThreadPri(0, 0);

    // halt thread
    while(1)
        ;
}

/*
 * Main entry point.
 */
void n64main(void) {
    osUnmapTLBAll();
    osInitialize();
    osCreateThread(&gStartThread, 1, Main_InitThread, 0, &gStartThreadStack[0x4000], 0xA);
    osStartThread(&gStartThread);
}

/*
 * Set the pan value to be used for when mono is set ingame. This is used in synstartvoiceparam
 */
void Main_SetPanOverride(s8 c) {
    gPanOverride = c;
}

/*
 * Return the tv type being used (PAL (0), NTSC (1), or MPAL (2)).
 */
s32 Main_GetTvType(void) {
    return osTvType;
}
