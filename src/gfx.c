#include <ultra64.h>
#include "PR/sched.h"
#include "PR/os_convert.h"
#include "gfx.h"

// secure functions declared in this file
#undef func_802276FC
#undef func_802276E0
#undef func_802276D4
#undef func_802276C8

typedef struct GfxWork {
    u8 pad[0x10000];
    Gfx dls[4][0xA00];
    Gfx main[0x600];
} GfxWork; // size:0x27000

#define G_CC_CUSTOM 0, 0, 0, TEXEL0, 0, 0, 0, PRIMITIVE

extern Gfx D_200000[];
extern u8 D_1000000[];

extern u8 D_80100000[2][320 * 240 * sizeof(u16)];
extern GfxWork gGfxWork[];

extern u8 D_8019A8D0[];
extern u8 D_801E56C0[];

extern s32 gFrontBufferID;
extern s32 gDrawBackdrop;
extern s32 gPauseRender;
extern s32 gDrawBackdropRedColor;
extern s32 gDrawBackdropGreenColor;
extern s32 gDrawBackdropBlueColor;
extern s32 gMotionBlur;
extern s32 gMotionBlurStrength;
extern s32 D_8029F600;
extern OSScTask D_8029F608[2];

extern Gfx D_8029F6D8[];
extern Gfx D_8029F718[];
extern Gfx D_8029F7A0[];

extern u8 D_802A4840[];

extern OSMesgQueue D_802A5330;
extern s32 D_802A5368;

// .bss
s32 gUsedBuffers[4];

extern Gfx *gBufferEnds[];
extern u32 gBackBufferID;
extern GfxWork* gGfxWorkPtr;
extern Gfx* gMasterDisplayList; // D_802A5390
extern s32 gScreenUlx;
extern s32 gScreenUly;
extern s32 gScreenLrx;
extern s32 gScreenLry;

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

/**
 * Get the ID of an available sub buffer. This seems to be in conflict with get_available_frame_buffer, which
 * seems to be doing a similar function, however this array is only ever used to mark which sub DLs should
 * receive an end DL instruction, but in practice, every sub DL that does get appended to the main DL
 * already gets one, rendering this pointless.
 */
s32 Gfx_GetAvailableBuffer(void) {
    s32 i;

    for(i = 0; i < 4; i++) {
        if (gUsedBuffers[i] == 0) {
            gUsedBuffers[i] = 1;
            return i;
        }
    }
    return 0;
}

/**
 * Set the ulx/uly/lrx/lry coords given an upper left coord and width/height.
 */
void Gfx_SetScreenCoords(s32 ulx, s32 uly, s32 width, s32 height) {
    gScreenUlx = ulx;
    gScreenUly = uly;
    gScreenLrx = (ulx + width) - 1;  //! @bug They subtract 1 on the lr coords, however they do so again unnecessarily later when drawing the rects, creating an off by 1 error.
    gScreenLry = (uly + height) - 1;
}

/**
 * Set whether the backdrop has been enabled to render a given color.
 */
void Gfx_SetBackdropEnabled(s32 enable) {
    gDrawBackdrop = enable;
}

/**
 * Set the color for the backdrop.
 */
void Gfx_SetBackdropColor(s32 r, s32 g, s32 b) {
    gDrawBackdropRedColor = r;
    gDrawBackdropGreenColor = g;
    gDrawBackdropBlueColor = b;
}

/**
 * Set whether motion blur is on.
 */
void Gfx_SetMotionBlurEnabled(s32 enable) {
    gMotionBlur = enable;
}

/**
 * Set the strength of the blur effect by controlling the 8-bit alpha used. 0 = no blur, 0xFF = opaque.
 */
void Gfx_SetMotionBlurStrength(s32 c) {
    gMotionBlurStrength = c;
}

/**
 * Set a frame buffer to be disabled (unused).
 */
void Gfx_SetBufferDisabled(s32 id) {
    gUsedBuffers[id] = 0;
}

/**
 * Get the buffer enabled status. Only seems to be used to append end DL instructions on used buffers, which
 * does not differ from the enabled buffer status in gFrameBuffers.
 */
s32 Gfx_GetBufferEnabledStatus(s32 id) {
    return gUsedBuffers[id];
}

/**
 * Return the pointer to the sub DL given an ID.
 */
s32 Gfx_GetSubDLPtr(s32 id) {
    return &gGfxWorkPtr->dls[id][0];
}

/**
 * Init the new graphics pointer and set initial segments and render modes. Return the ptr to the main DL.
 */
Gfx *Gfx_InitGfx(void) {
    gBackBufferID = gFrontBufferID; // we are now using the back buffer to start a new frame rendering.
    gGfxWorkPtr = &gGfxWork[gBackBufferID];
    gMasterDisplayList = &gGfxWorkPtr->main;
    D_802A5368 = 0;

    gSPSegment(gMasterDisplayList++, 0x00, 0x00000000);
    gSPSegment(gMasterDisplayList++, 0x01, (void* ) ((u8*)&D_80100000[gBackBufferID] + 0x80000000));
    gSPDisplayList(gMasterDisplayList++, D_8029F718);
    if (gMotionBlur != 0) {
        gDPSetColorDither(gMasterDisplayList++, G_CD_DISABLE);
    } else {
        gDPSetColorDither(gMasterDisplayList++, G_CD_MAGICSQ);
    }
    gSPDisplayList(gMasterDisplayList++, D_8029F6D8);
    gDPSetDepthImage(gMasterDisplayList++, D_200000);
    gDPPipeSync(gMasterDisplayList++);
    gDPSetScissor(gMasterDisplayList++, G_SC_NON_INTERLACE, 0, 0, 320, 240);
    Gfx_DrawBackdrop(&gMasterDisplayList);
    gSPSetGeometryMode(gMasterDisplayList++, G_ZBUFFER | G_CULL_BACK | G_LIGHTING);
    gDPSetRenderMode(gMasterDisplayList++, G_RM_AA_ZB_TEX_EDGE, G_RM_AA_ZB_TEX_EDGE2);
    return gMasterDisplayList;
}

/**
 * Draw the backdrop color if its enabled and set.
 */
void Gfx_DrawBackdrop(Gfx** gfxP) {
    Gfx *gfx = *gfxP;

    gSPDisplayList(gfx++, D_8029F7A0);
    gDPFillRectangle(gfx++, gScreenUlx, gScreenUly, gScreenLrx - 1, gScreenLry - 1);
    gDPPipeSync(gfx++);
    gDPSetColorImage(gfx++, G_IM_FMT_RGBA, G_IM_SIZ_16b, 320, D_1000000);
    if (gDrawBackdrop != 0) {
        gDPSetFillColor(gfx++, (GPACK_RGBA5551(gDrawBackdropRedColor, gDrawBackdropGreenColor, gDrawBackdropBlueColor, 1) << 0x10) | GPACK_RGBA5551(gDrawBackdropRedColor, gDrawBackdropGreenColor, gDrawBackdropBlueColor, 1));
        gDPFillRectangle(gfx++, gScreenUlx, gScreenUly, gScreenLrx - 1, gScreenLry - 1);
        gDPPipeSync(gfx++);
    }
    gDPSetCycleType(gfx++, G_CYC_1CYCLE);
    *gfxP = gfx;
}

/**
 * The frame is done by now. Perform the last effect on the current buffer and send it off for rendering.
 */
void Gfx_EndRender(Gfx* gfx) {
    s32 i;

    // Certain events in game use a "motion blur"-ing for effects (example: boss intros). If
    // this is on, perform this blurring effect.
    if (gMotionBlur != 0) {
        gSPTexture(gfx++, 0x8000, 0x8000, 0, G_TX_RENDERTILE, G_ON);
        gDPSetRenderMode(gfx++, G_RM_CLD_SURF, G_RM_CLD_SURF2);
        gDPSetPrimColor(gfx++, 0, 0, 0, 0, 0, gMotionBlurStrength);
        gDPSetCombineMode(gfx++, G_CC_CUSTOM, G_CC_CUSTOM);
        gDPSetTexturePersp(gfx++, G_TP_NONE);
        gDPSetTextureLUT(gfx++, G_TT_NONE);
        gDPSetAlphaCompare(gfx++, G_AC_NONE);

        for (i = 0; i < 240; i+=2) {
            gDPLoadTextureBlock(gfx++,
                (u32)OS_PHYSICAL_TO_K0((u8*)D_80100000 + ((gBackBufferID ^ 1) * 240 * 320 * sizeof(u16))) + i * 320 * (s32)sizeof(u16),
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
    gBufferEnds[gBackBufferID] = gfx; // set the ptr to the end of the gfx area.

    // if rendering has paused, do not send it to the scheduler handler.
    if (gPauseRender != 0) {
        osSendMesg(&D_802A5330, D_8029F600, 0);
    }

    func_80237F44(&D_802A5348);
    D_8029F600++;
}

/**
 * Return a pointer to the active framebuffer specified by BufferGetMode.
 */
void *Gfx_GetFrameBufferPtr(enum BufferGetMode mode) {
    return D_80100000[gBackBufferID ^ mode];
}

/**
 * Sets whether rendering is paused or unpaused.
 */
void Gfx_SetPauseRender(s32 enable) {
    gPauseRender = enable;
}

/**
 * Setup and create the queues and call the renderer thread to be added to the thread proc system.
 */
void Gfx_CreateRenderThread(void) {
    s32 i;

    set_secure_call_arr(0x22, &D_8029F7C8);

    for(i = 0; i < 4; i++) {
        gUsedBuffers[i] = 0;
    }

    D_802A5800 = 0;
    osCreateMesgQueue(&D_802A5330, &D_802A5360, 1);
    osCreateMesgQueue(&D_802A5348, &D_802A5364, 1);
    osCreateMesgQueue(&D_802A53A0, &D_802A53B8, 1);
    D_802A53CC = ThreadProc_Add(&Gfx_Render, 0, 0, 0);
    ThreadProc_SetThreadPri(D_802A53CC, 0x7C);
}

/**
 * The thread for constructing the gfx task to send to the renderer.
 */
void Gfx_Render(void *unused) {
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
    gFrontBufferID = 0;

    while(1) {
        if (D_802A5330.validCount >= D_802A5330.msgCount) {
            osRecvMesg(&D_802A5330, &sp54, 1);
        }
        osRecvMesg(&D_802A5330, &D_802A5398, 1);

        // the current ID is considered the front. Get ready to use it to build the final task to send.
        bufferIDbackup = gFrontBufferID;

        // switch the ID for everything else.
        gFrontBufferID ^= 1;

        D_802A5800 = 0;

        scTask = &D_8029F608[bufferIDbackup];
        scTask->framebuffer = (u8*)&D_80100000[bufferIDbackup];
        scTask->list.t.ucode_boot = rspbootTextStart;
        scTask->list.t.ucode_boot_size = (u32)rspbootTextEnd - (u32)rspbootTextStart;
        scTask->list.t.ucode = rspbootTextEnd;
        scTask->list.t.ucode_data = D_802A4840;
        scTask->list.t.dram_stack = D_8019A8D0;
        scTask->list.t.output_buff = D_801E56C0;
        scTask->list.t.output_buff_size = (((u32) D_801E56C0) & 0xFFFFFFFFFFFFFFFF) + 0x10000;
        scTask->list.t.data_ptr = &gGfxWork[bufferIDbackup].main;
        scTask->list.t.data_size = (gBufferEnds[bufferIDbackup] - gGfxWork[bufferIDbackup].main) * sizeof(Gfx);
        scTask->msgQ = &D_802A53A0;
        scTask->msg = &D_802A53B8;
        osWritebackDCache(gGfxWorkPtr, 0x10000);
        func_80237A90(scTask);
        func_80237A70(&D_802A53A0, &sp5C);
        func_8022997C();
        D_802A5394 = D_802A5398;
    }
}

/**
 * Stop the gfx renderer.
 */
void Gfx_KillRenderer(void) {
    ThreadProc_KillThread(D_802A53CC);
}
