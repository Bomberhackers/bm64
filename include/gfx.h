#ifndef _GFX_H_
#define _GFX_H_

enum BufferGetMode {
    BUFFER_GET_FRONT,
    BUFFER_GET_BACK,
};

s32 Gfx_GetAvailableBuffer(void);
void Gfx_SetScreenCoords(s32 ulx, s32 uly, s32 width, s32 height);
void Gfx_SetBackdropEnabled(s32 enable);
void Gfx_SetBackdropColor(s32 r, s32 g, s32 b);
void Gfx_SetMotionBlurEnabled(s32 enable);
void Gfx_SetMotionBlurStrength(s32 c);
void Gfx_SetBufferDisabled(s32 id);
s32 Gfx_GetBufferEnabledStatus(s32 id);
s32 Gfx_GetSubDLPtr(s32 id);
Gfx *Gfx_InitGfx(void);
void Gfx_DrawBackdrop(Gfx** gfxP);
void Gfx_EndRender(Gfx* gfx);
void *Gfx_GetFrameBufferPtr(enum BufferGetMode mode);
void Gfx_SetPauseRender(s32 enable);
void Gfx_CreateRenderThread(void);
void Gfx_Render(void *unused);
void Gfx_KillRenderer(void);

#endif // _GFX_H_
