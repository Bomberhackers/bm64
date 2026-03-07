#include <ultra64.h>
#include "gfx.h"

// TODO: There may be macros to disable specific zerojmp tables instead of having to undef these per file.
#undef func_80227C50
#undef func_80227BAC
#undef func_80227BE8
#undef func_80227870
#undef func_80227834

// framebuffer.c ?

typedef unsigned int uintptr_t;

// FrameBuffer
typedef struct FrameBuffer {
    /* 0x00 */ Vp unk_00;
    /* 0x10 */ u32 enabled;
    /* 0x14 */ u32 unk14;
    /* 0x18 */ Mtx unk_18;
    /* 0x58 */ u32 unk58;
    /* 0x5C */ f32 ulx;
    /* 0x60 */ f32 uly;
    /* 0x64 */ f32 lrx;
    /* 0x68 */ f32 lry;
} FrameBuffer; // size:0x6C

// might be the same as FrameBuffer
struct UnkFuncStruct80227E2C {
    u8 pad0[0x10];
    /* 0x00 */ u32 unk10;
    u8 pad14[0x44];
    /* 0x00 */ u32 unk58;
}; // unk size

// might be the above struct
struct UnkStruct802AC5C0 {
    u16 unk0;
    u16 unk2;
    u16 unk4;
    u16 unk6;
    u16 unk8;
    u16 unkA;
    u16 unkC;
    u16 unkE;
    char pad10[0x4C];
    f32 unk5C;
    f32 unk60;
    f32 unk64;
    f32 unk68;
};

struct UnkFuncStruct80227C9C {
    u8 pad0[0x14];
    u32 unk14;
    u8 pad18[0x40];
    u32 unk58;
};

extern s32 func_8029B908(s32, f32, f32, f32, f32, f32, f32, f32, f32, f32); /* extern */
extern s32 func_8029BB38(s32*, s32);                           /* extern */
extern s32 func_8029BE20(s32*, s32*, f32, f32, f32, f32, f32);   /* extern */

extern struct FrameBuffer gFrameBuffers[4]; // 800BD5B0

extern s32 D_8029F7E0;
extern s32 D_8029F7E4;
extern s32 D_8029F7E8;
extern s32 D_8029F7EC;
extern s32 D_8029F7F0;
extern s32 D_8029F7F4;
extern Lights2 D_8029F7F8;

extern s32 D_802A5368;
extern Mtx* gGfxWorkPtr;
extern Gfx* gMasterDisplayList; // D_802A5390
extern u16 D_802A53D0;
extern Mtx D_802A53D8;
extern s32  D_802A5418;

FrameBuffer *get_available_frame_buffer(void);
void func_80227E2C(struct UnkFuncStruct80227E2C* arg0);
void func_80227D50(struct UnkStruct802AC5C0* arg0, u32 arg1, u32 arg2, u32 arg3, u32 arg4);
void func_80227CD0(s32 arg0, f32 arg1, f32 arg2, f32 arg3, f32 arg4, f32 arg5, f32 arg6, f32 arg7, f32 arg8, f32 arg9);
void func_80227C9C(struct UnkFuncStruct80227C9C* arg0, s32 arg1);
void func_80227C50(f32 arg0, f32 arg1, f32 arg2, f32 arg3, f32 arg4);
void func_80227C18(void);
void func_80227BE8(u8 arg0, u8 arg1, u8 arg2);
void func_80227BAC(s8 arg0, s8 arg1, s8 arg2);
void func_8022787C(Gfx** mainGfx);
void func_80227870(void);
void func_80227834(s32 arg0, s32 arg1, s32 arg2, s32 arg3, s32 arg4);
void func_802277D0(void);

/**
 * Search available frame buffers, enable an available buffer, and return the pointer to it.
 */
FrameBuffer *get_available_frame_buffer(void) {
    s32 i;

    for (i = 0; i < 4; i++) {
        if (gFrameBuffers[i].enabled == 0) {
            gFrameBuffers[i].enabled = 1;
            return &gFrameBuffers[i];
        }
    }
    return -1;
}

// unused, or may be static inline.
void func_80227E2C(struct UnkFuncStruct80227E2C* arg0) {
    arg0->unk10 = 0;
    arg0->unk58 = 0;
}

void func_80227D50(struct UnkStruct802AC5C0* arg0, u32 arg1, u32 arg2, u32 arg3, u32 arg4) {
    arg0->unk0 = (s16) (arg3 * 2);
    arg0->unk2 = (s16) (arg4 * 2);
    arg0->unk4 = 0x1FF;
    arg0->unk6 = 0;
    arg0->unk8 = (s16) (((arg1 * 2) + arg3) * 2);
    arg0->unkA = (s16) (((arg2 * 2) + arg4) * 2);
    arg0->unkC = 0x1FF;
    arg0->unkE = 0;
    arg0->unk5C = (f32) arg1;
    arg0->unk60 = (f32) arg2;
    arg0->unk64 = (f32) ((arg1 + arg3) - 1);
    arg0->unk68 = (f32) ((arg2 + arg4) - 1);
}

void func_80227CD0(s32 arg0, f32 arg1, f32 arg2, f32 arg3, f32 arg4, f32 arg5, f32 arg6, f32 arg7, f32 arg8, f32 arg9) {
    func_8029B908(arg0 + 0x18, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
    func_8029BB38(&D_802A5418, arg0 + 0x18);
}

void func_80227C9C(struct UnkFuncStruct80227C9C* arg0, s32 arg1) {
    arg0->unk14 = arg1;
    arg0->unk58 = Gfx_GetSubDLPtr(arg1);
}

void func_80227C50(f32 arg0, f32 arg1, f32 arg2, f32 arg3, f32 arg4) {
    func_8029BE20(&D_802A53D8, &D_802A53D0, arg0, arg1, arg2, arg3, arg4);
}

void func_80227C18(void) {
    func_80227BE8(0x32, 0x32, 0x32);
    func_80227BAC(0, 0x72, 0x37);
}

void func_80227BE8(u8 arg0, u8 arg1, u8 arg2) {
    D_8029F7F8.l[0].l.colc[0] = arg0;
    D_8029F7F8.l[0].l.col[0] = arg0;
    D_8029F7F8.l[0].l.colc[1] = arg1;
    D_8029F7F8.l[0].l.col[1] = arg1;
    D_8029F7F8.l[0].l.colc[2] = arg2;
    D_8029F7F8.l[0].l.col[2] = arg2;
}

void func_80227BAC(s8 arg0, s8 arg1, s8 arg2) {
    D_8029F7F8.l[1].l.dir[0] = arg0;
    D_8029F7F8.l[1].l.dir[1] = arg1;
    D_8029F7F8.l[1].l.dir[2] = arg2;
    D_8029F7F8.l[0].l.dir[0] = D_8029F7F8.l[1].l.dir[0];
    D_8029F7F8.l[0].l.dir[1] = D_8029F7F8.l[1].l.dir[1];
    D_8029F7F8.l[0].l.dir[2] = D_8029F7F8.l[1].l.dir[2];
}

void func_8022787C(Gfx** mainGfx) {
    Gfx* gfx;
    s32 i;
    struct FrameBuffer *buffer;

    gfx = *mainGfx;

    gSPSetLights2(gfx++, D_8029F7F8);
    gSPPerspNormalize(gfx++, D_802A53D0);

    for (i = 0; i < 4; i++) {
        buffer = &gFrameBuffers[i];
        if ((buffer->enabled) && (buffer->unk58 != 0)) {
            hmemcpy((uintptr_t)gGfxWorkPtr + (D_802A5368 * sizeof(Mtx)), &D_802A53D8, sizeof(Mtx));
            gSPMatrix(gfx++, (uintptr_t)gGfxWorkPtr + (D_802A5368 * sizeof(Mtx)), G_MTX_NOPUSH | G_MTX_LOAD | G_MTX_PROJECTION);
            D_802A5368++;
            gSPViewport(gfx++, &buffer->unk_00);
            hmemcpy((uintptr_t)gGfxWorkPtr + (D_802A5368 * sizeof(Mtx)), &buffer->unk_18, sizeof(Mtx));
            gSPMatrix(gfx++, (uintptr_t)gGfxWorkPtr + (D_802A5368 * sizeof(Mtx)), G_MTX_NOPUSH | G_MTX_MUL | G_MTX_PROJECTION);
            D_802A5368++;
            gDPSetScissor(gfx++, G_SC_NON_INTERLACE, buffer->ulx, buffer->uly, buffer->lrx, buffer->lry);
            gSPDisplayList(gfx++, Gfx_GetSubDLPtr(buffer->unk14));
        }
    }
    *mainGfx = gfx;
    osWritebackDCache(buffer, 0x1C0);
}

void func_80227870(void) {
    D_8029F7E0 = 0;
}

void func_80227834(s32 arg0, s32 arg1, s32 arg2, s32 arg3, s32 arg4) {
    D_8029F7E0 = 1;
    D_8029F7E4 = arg0;
    D_8029F7E8 = arg1;
    D_8029F7EC = arg2;
    D_8029F7F0 = arg3;
    D_8029F7F4 = arg4;
}

void func_802277D0(void) {
    int i;
    set_secure_call_arr(0x21, &D_8029F820);

    for (i = 0; i < 4; i++) {
        gFrameBuffers[i].enabled = 0;
        gFrameBuffers[i].unk58 = 0;
    }
}
