#include <ultra64.h>

// compiled with -O3. huh?

extern void* D_8001C3C0;
extern OSMesgQueue D_8001C3E0;
extern s32 D_8001C3F8;
extern OSIoMesg D_8001C400;
extern OSMesgQueue D_8001C418;
extern s32 D_8001C430;

void func_80000794(void) {
    D_8001C3F8 = 0;
    osCreatePiManager(0x96, &D_8001C3E0, &D_8001C3C0, 8);
    func_80001D90(&D_8001C418, &D_8001C430, 1);
}

void func_80000768(void) {
    osRecvMesg(&D_8001C418, NULL, 0);
}

void load_from_rom_to_addr(void* vAddr, s32 size, u32 devAddr) {
    if (D_8001C3F8 != 0) {
        do {
            osYieldThread();
        } while (D_8001C3F8 != 0);
    }
    D_8001C3F8 = 1;
    osWritebackDCache(vAddr, size);
    osInvalDCache(vAddr, size);
    osInvalICache(vAddr, size);
    osPiStartDma(&D_8001C400, 0, 0, devAddr, vAddr, (u32) size, &D_8001C418);
    osRecvMesg(&D_8001C418, NULL, 1);
    D_8001C3F8 = 0;
}

void func_8000064C(void* arg0, u32 arg1, u32 arg2) {
    osPiStartDma(&D_8001C400, 0, 0, arg2, arg0, arg1, &D_8001C418);
}

void func_8000059C(s32 arg0, u32 arg1, void* arg2) {
    if (D_8001C3F8 != 0) {
        do {
            osYieldThread();
        } while (D_8001C3F8 != 0);
    }
    D_8001C3F8 = 1;
    osWritebackDCache(arg2, arg0);
    osPiStartDma(&D_8001C400, 0, 1, (u32) arg0, arg2, arg1, &D_8001C418);
    osRecvMesg(&D_8001C418, NULL, 1);
    D_8001C3F8 = 0;
}

void func_80000570(void) {
    osRecvMesg(&D_8001C418, NULL, 1);
}

void func_80000524(u32 arg0, u32 arg1, void* arg2) {
    osPiStartDma(&D_8001C400, 0, 1, arg0, arg2, arg1, &D_8001C418);
}

void func_800004D0(void* arg0, u32 arg1, u32 arg2, s32 arg3) {
    osPiStartDma(&D_8001C400, 0, arg3, arg2, arg0, arg1, &D_8001C418);
}
