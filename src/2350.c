#include <ultra64.h>

// TODO: Symbols

extern int D_80024818;

extern u8 D_80019FC0[];
extern u8 D_8001A07C[];
extern u8 D_8001A094[];
extern u8 D_8001A10C[];
extern u8 D_8001A128[];
extern u8 D_8001A0CC[];
extern u8 D_8001A0DC[];
extern u8 D_8001A0EC[];
extern u8 D_8001A14C[];
extern u8 D_8001A314[];

extern u8 D_80020668[];

struct SomeStruct {
    char padding0[0x2];
    u8 unk2;
    u8 unk3;
};

extern struct SomeStruct D_80024820;

extern u8 D_8001C4B8;

extern s32 D_80000300;
extern s8 D_8001C4B0;

extern void func_80001750(void *);

// some thread function
void func_80001750(void *unused) {
    u32 offset;
    u32 addr;

    D_80024818 = 2;
    set_zero_vaddr_tlb();
    func_80001A30(1, &D_80019FC0);
    func_80001A30(2, &D_8001A07C);
    func_80001A30(6, &D_8001A094);
    func_80001A30(0xA, &D_8001A10C);
    func_80001A30(0x12, &D_8001A128);
    func_80001A30(7, &D_8001A0CC);
    func_80001A30(8, &D_8001A0DC);
    func_80001A30(9, &D_8001A0EC);
    func_80001A30(0x13, &D_8001A14C);
    func_80001A30(0x16, &D_8001A314);
    func_80000870();
    offset = D_80024820.unk2 << 0xB;
    if (offset == 0) {
        offset = 0x80000;
    }
    addr = 0x80225800;
    load_from_rom_to_addr(offset + addr, D_80024820.unk3 << 0xB, offset + 0x40000);

    // thread loop
    while(1) {
        func_8000083C(D_80024818, addr, &D_80020668);
    }
}

void func_800018A8(s32 arg0, s32 arg1, s32 arg2) {

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

void func_80001914(void *unused) {
    func_80000794();
    osCreateThread(&D_80020668, 3, func_80001750, unused, &D_80024818, 0xA);
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
