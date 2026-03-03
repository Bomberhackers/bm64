#include <ultra64.h>
#include "PR/sched.h"
#include "PR/os_convert.h"

// secure functions declared in this file
#undef func_802276FC
#undef func_802276E0
#undef func_802276D4
#undef func_802276C8

// 412F0.c

// D_8014C8D0
struct UnkStruct802A538C {
    u8 pad[0x1000][16];
    Gfx dls[4][0xA00];
    Gfx main[0x600];
}; // size:0x27000

#define G_CC_CUSTOM 0, 0, 0, TEXEL0, 0, 0, 0, PRIMITIVE

extern Gfx D_200000[];
extern u8 D_1000000[];

extern u8 D_80100000[][0x25800];
extern struct UnkStruct802A538C D_8014C8D0[];

extern u8 D_8019A8D0[];
extern u8 D_801E56C0[];

extern s32 D_8029F5E0;
extern s32 D_8029F5E4;
extern s32 D_8029F5E8;
extern s32 D_8029F5EC;
extern s32 D_8029F5F0;
extern s32 D_8029F5F4;
extern s32 D_8029F5F8;
extern s32 D_8029F5FC;
extern s32 D_8029F600;
extern OSScTask D_8029F608[2];

extern Gfx D_8029F6D8[];
extern Gfx D_8029F718[];
extern Gfx D_8029F7A0[];

extern u8 D_802A4840[];

extern OSMesgQueue D_802A5330;
extern s32 D_802A5368;

// .bss
s32 D_802A5370[4];

extern Gfx *D_802A5380[];
extern u32 D_802A5388;
extern struct UnkStruct802A538C* D_802A538C;
extern Gfx* gMasterDisplayList; // D_802A5390
extern s32 D_802A53BC;
extern s32 D_802A53C0;
extern s32 D_802A53C4;
extern s32 D_802A53C8;

extern OSMesgQueue D_802A5348;
extern OSMesg D_802A5360;
extern OSMesg D_802A5364;
extern s32 D_802A5374;
extern s32 D_802A5378;
extern s32 D_802A5394;
extern OSMesg D_802A5398;
extern OSMesgQueue D_802A53A0;
extern OSMesg D_802A53B8;
extern s32 D_802A53CC;
extern s32 D_802A5800;

// FUNCTIONS

s32 func_8022773C(void);
void func_80227708(s32 arg0, s32 arg1, s32 arg2, s32 arg3);
void func_802276FC(s32 arg0);
void func_802276E0(s32 arg0, s32 arg1, s32 arg2);
void func_802276D4(s32 arg0);
void func_802276C8(s32 arg0);
void func_802276B4(s32 arg0);
s32 func_8022769C(s32 arg0);
s32 func_80227678(s32 arg0);
Gfx *func_80227464(void);
void func_802272B0(Gfx** gfxP);
void func_80226E84(Gfx* gfx);
void *func_80226E4C(s32 arg0);
void func_80226E40(s32 arg0);
void func_80226D80(void);
void func_80226B18(void *arg);
void func_80226AF0(void);

s32 func_8022773C(void) {
    s32 i;

    for(i = 0; i < 4; i++) {
        if (D_802A5370[i] == 0) {
            D_802A5370[i] = 1;
            return i;
        }
    }
    return 0;
}

void func_80227708(s32 arg0, s32 arg1, s32 arg2, s32 arg3) {
    D_802A53BC = arg0;
    D_802A53C0 = arg1;
    D_802A53C4 = (arg0 + arg2) - 1;
    D_802A53C8 = (arg1 + arg3) - 1;
}

void func_802276FC(s32 arg0) {
    D_8029F5E4 = arg0;
}

void func_802276E0(s32 arg0, s32 arg1, s32 arg2) {
    D_8029F5EC = arg0;
    D_8029F5F0 = arg1;
    D_8029F5F4 = arg2;
}

void func_802276D4(s32 arg0) {
    D_8029F5F8 = arg0;
}

void func_802276C8(s32 arg0) {
    D_8029F5FC = arg0;
}

void func_802276B4(s32 arg0) {
    D_802A5370[arg0] = 0;
}

s32 func_8022769C(s32 arg0) {
    return D_802A5370[arg0];
}

s32 func_80227678(s32 arg0) {
    return &D_802A538C->dls[arg0][0];
}

Gfx *func_80227464(void) {
    D_802A5388 = D_8029F5E0;
    D_802A538C = &D_8014C8D0[D_802A5388];
    gMasterDisplayList = &D_802A538C->main;
    D_802A5368 = 0;

    gSPSegment(gMasterDisplayList++, 0x00, 0x00000000);
    gSPSegment(gMasterDisplayList++, 0x01, (void* ) (((u32)D_802A5388 * 0x25800) + 0x80000000 + (u8*)&D_80100000));
    gSPDisplayList(gMasterDisplayList++, D_8029F718);
    if (D_8029F5F8 != 0) {
        gDPSetColorDither(gMasterDisplayList++, G_CD_DISABLE);
    } else {
        gDPSetColorDither(gMasterDisplayList++, G_CD_MAGICSQ);
    }
    gSPDisplayList(gMasterDisplayList++, D_8029F6D8);
    gDPSetDepthImage(gMasterDisplayList++, D_200000);
    gDPPipeSync(gMasterDisplayList++);
    gDPSetScissor(gMasterDisplayList++, G_SC_NON_INTERLACE, 0, 0, 320, 240);
    func_802272B0(&gMasterDisplayList);
    gSPSetGeometryMode(gMasterDisplayList++, G_ZBUFFER | G_CULL_BACK | G_LIGHTING);
    gDPSetRenderMode(gMasterDisplayList++, G_RM_AA_ZB_TEX_EDGE, G_RM_AA_ZB_TEX_EDGE2);
    return gMasterDisplayList;
}

void func_802272B0(Gfx** gfxP) {
    Gfx *gfx = *gfxP;

    gSPDisplayList(gfx++, D_8029F7A0);
    gDPFillRectangle(gfx++, D_802A53BC, D_802A53C0, D_802A53C4 - 1, D_802A53C8 - 1);
    gDPPipeSync(gfx++);
    gDPSetColorImage(gfx++, G_IM_FMT_RGBA, G_IM_SIZ_16b, 320, D_1000000);
    if (D_8029F5E4 != 0) {
        gDPSetFillColor(gfx++, (GPACK_RGBA5551(D_8029F5EC, D_8029F5F0, D_8029F5F4, 1) << 0x10) | GPACK_RGBA5551(D_8029F5EC, D_8029F5F0, D_8029F5F4, 1));
        gDPFillRectangle(gfx++, D_802A53BC, D_802A53C0, D_802A53C4 - 1, D_802A53C8 - 1);
        gDPPipeSync(gfx++);
    }
    gDPSetCycleType(gfx++, G_CYC_1CYCLE);
    *gfxP = gfx;
}

void func_80226E84(Gfx* gfx) {
    s32 i;

    if (D_8029F5F8 != 0) {
        gSPTexture(gfx++, 0x8000, 0x8000, 0, G_TX_RENDERTILE, G_ON);
        gDPSetRenderMode(gfx++, G_RM_CLD_SURF, G_RM_CLD_SURF2);
        gDPSetPrimColor(gfx++, 0, 0, 0, 0, 0, D_8029F5FC);
        gDPSetCombineMode(gfx++, G_CC_CUSTOM, G_CC_CUSTOM);
        gDPSetTexturePersp(gfx++, G_TP_NONE);
        gDPSetTextureLUT(gfx++, G_TT_NONE);
        gDPSetAlphaCompare(gfx++, G_AC_NONE);

        for (i = 0; i < 240; i+=2) {
            gDPLoadTextureBlock(gfx++,
                (u32)OS_PHYSICAL_TO_K0((u8*)D_80100000 + ((D_802A5388 ^ 1) * 240 * 320 * sizeof(u16))) + i * 320 * (s32)sizeof(u16),
                G_IM_FMT_RGBA,
                G_IM_SIZ_16b,
                320,
                2,
                0,
                G_TX_NOMIRROR | G_TX_WRAP, G_TX_NOMIRROR | G_TX_WRAP, G_TX_NOMASK, G_TX_NOMASK, G_TX_NOLOD, G_TX_NOLOD);

            gSPTextureRectangle(gfx++, 0 << 2, i << 2, 320 << 2, (i + 2) << 2, 0, 0, 0, 1 << 10, 1 << 10);
        }
    }
    gDPFullSync(gfx++);
    gSPEndDisplayList(gfx++);
    D_802A5380[D_802A5388] = gfx;
    if (D_8029F5E8 != 0) {
        osSendMesg(&D_802A5330, D_8029F600, 0);
    }
    func_80237F44(&D_802A5348);
    D_8029F600++;
}


void *func_80226E4C(s32 arg0) {
    return D_80100000[D_802A5388 ^ arg0];
}

void func_80226E40(s32 arg0) {
    D_8029F5E8 = arg0;
}

void func_80226D80(void) {
    s32 i;

    set_secure_call_arr(0x22, &D_8029F7C8);

    for(i = 0; i < 4; i++) {
        D_802A5370[i] = 0;
    }

    D_802A5800 = 0;
    osCreateMesgQueue(&D_802A5330, &D_802A5360, 1);
    osCreateMesgQueue(&D_802A5348, &D_802A5364, 1);
    osCreateMesgQueue(&D_802A53A0, &D_802A53B8, 1);
    D_802A53CC = ThreadProc_Add(&func_80226B18, 0, 0, 0);
    ThreadProc_SetThreadPri(D_802A53CC, 0x7C);
}

void func_80226B18(void *arg0) {
    s32 pad;
    s32 sp80;
    OSMesgQueue sp68;
    OSMesg sp64;
    u32 bufferIDbackup;
    s32 sp5C;
    OSScTask *scTask;
    OSMesg sp54;

    func_80237D4C(0);
    osCreateMesgQueue(&sp68, &sp64, 1);
    func_80237AE4(&sp80, &sp68);
    D_8029F5E0 = 0;

    while(1) {
        if (D_802A5330.validCount >= D_802A5330.msgCount) {
            osRecvMesg(&D_802A5330, &sp54, 1);
        }
        osRecvMesg(&D_802A5330, &D_802A5398, 1);

        bufferIDbackup = D_8029F5E0;

        D_8029F5E0 ^= 1;
        D_802A5800 = 0;

        scTask = &D_8029F608[bufferIDbackup];
        scTask->framebuffer = (u8*)D_80100000 + bufferIDbackup * 240 * 320 * sizeof(u16);
        scTask->list.t.ucode_boot = rspbootTextStart;
        scTask->list.t.ucode_boot_size = (u32)rspbootTextEnd - (u32)rspbootTextStart;
        scTask->list.t.ucode = rspbootTextEnd;
        scTask->list.t.ucode_data = D_802A4840;
        scTask->list.t.dram_stack = D_8019A8D0;
        scTask->list.t.output_buff = D_801E56C0;
        scTask->list.t.output_buff_size = (((u32) D_801E56C0) & 0xFFFFFFFFFFFFFFFF) + 0x10000;
        scTask->list.t.data_ptr = &D_8014C8D0[bufferIDbackup].main;
        scTask->list.t.data_size = (D_802A5380[bufferIDbackup] - D_8014C8D0[bufferIDbackup].main) * sizeof(Gfx);
        scTask->msgQ = &D_802A53A0;
        scTask->msg = &D_802A53B8;
        osWritebackDCache(D_802A538C, 0x10000);
        func_80237A90(scTask);
        func_80237A70(&D_802A53A0, &sp5C);
        func_8022997C();
        D_802A5394 = D_802A5398;
    }
}

void func_80226AF0(void) {
    ThreadProc_KillThread(D_802A53CC);
}
