#define NO_ZEROJMP_MAPPING
#include <ultra64.h>

// TODO: Symbols

extern int D_80024818;

extern u8 D_80020668[];

extern u8 gSectionSizes[];

extern u8 D_8001C4B8;

extern s32 D_80000300;
extern s8 D_8001C4B0;

extern void func_80001750(void *);

// some thread function
void func_80001750(void *unused) {
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

    func_80000870();
    offset = gSectionSizes[2] << 0xB;
    if (offset == 0) {
        offset = 0x80000;
    }
    addr = 0x80225800;
    load_from_rom_to_addr(offset + addr, gSectionSizes[3] << 0xB, offset + 0x40000);

    // thread loop
    while(1) {
        func_8000083C(D_80024818, addr, &D_80020668);
    }
}

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

// init thread
void func_80001914(void *arg) {
    func_80000794();
    osCreateThread(&D_80020668, 3, func_80001750, arg, &D_80024818, 0xA);
    osStartThread(&D_80020668);
    osSetThreadPri(0, 0);

    while(1) ;
}

void n64main(void) {
    osUnmapTLBAll();
    osInitialize();
    osCreateThread(&D_8001C4B8, 1, func_80001914, 0, &D_80020668, 0xA);
    osStartThread(&D_8001C4B8);
}

void func_80001A04(s8 arg0) {
    D_8001C4B0 = arg0;
}

s32 func_80001A14(void) {
    return D_80000300;
}
