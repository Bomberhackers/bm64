#include <ultra64.h>
#include "process.h"
#include "thread_proc.h"
#include "gfx.h"

u8* hmemset(u8* arg0, u8* arg1, s32 arg2);
void func_80225CA8();                         /* extern */
void func_80226860();                         /* extern */
void func_80227708(s32, s32, s32, s32);       /* extern */
void func_802277D0();                         /* extern */
void func_8022787C(void **);                  /* extern */
void func_80227D50(s32, s32, s32, s32, s32);  /* extern */
void func_802290CC();                         /* extern */
void func_8022A858();                         /* extern */
s32 func_80232E60();                          /* extern */
s32 func_802341C8();                          /* extern */
s32 func_80237890();                          /* extern */
s32 func_8023A104();                          /* extern */
s32 func_8023A208();                          /* extern */
s32 func_8023A22C();                          /* extern */
s32 func_8023A318();                          /* extern */
s32 func_8023A3E0();                          /* extern */
s32 func_8025E16C();                          /* extern */
s32 func_8025E1D4(void **);                   /* extern */
s32 g_initRandom(u32);                       /* extern */
s32 func_80265C04();                          /* extern */
s32 func_8026C208();                          /* extern */
s32 func_8026C77C();                          /* extern */
s32 func_802817D0();                          /* extern */
s32 func_80292B54();                          /* extern */
s32 func_80294E54();                          /* extern */
s32 func_80297D20();                          /* extern */
s32 malloc(s32);                       /* extern */
extern u8 D_80063000[];
extern u8 D_800BEA60[];
extern s32 D_802A1230;
extern s32 D_802A1234;
extern s32 D_802A123C;
extern u8 D_802A5300[];
extern s32 D_802AC5C0;
extern u8 D_802B36D0[];
extern s32 func_802334CC;
extern s32 func_80236F54;

void func_80225840(s32 arg0)
{
    s32 temp_s0; 
    Gfx *mainGfx;
    s32 id;
    s32 frameTimer = 8;
    s32 temp_v0;

    func_80297D20();
    hmemset(&D_802A5300, 0, D_802B36D0 - D_802A5300);
    hmemset(&D_80063000, 0, D_800BEA60 - D_80063000);
    func_80225CA8();
    set_secure_call_arr(4, &D_8029F570);
    set_secure_call_arr(ZEROJMP_LIBMALLOC_TABLE_ID, &gLibmallocFuncs);
    func_802341C8();
    ThreadProc_Init(arg0, 0xA, 0xA); // <--------- this will call osCreateScheduler
    osViSetSpecialFeatures(OS_VI_GAMMA_OFF);
    osViSetSpecialFeatures(OS_VI_GAMMA_DITHER_ON);
    osViSetSpecialFeatures(OS_VI_DITHER_FILTER_ON);
    osViSetSpecialFeatures(OS_VI_DIVOT_ON);
    HuPrcInit();
    func_8023A318();
    func_8023A22C();
#undef func_80294E54
    func_80294E54();
    D_802A1230 = 0;
    D_802A1234 = 0;
    D_802A123C = 0;
    func_80226860();
    func_8022A858();
    func_80232E60();
    func_802817D0();
    func_80292B54();
    func_802277D0();
    Gfx_CreateRenderThread();
    func_8025E16C();
    id = Gfx_GetAvailableBuffer();
    func_8026C77C();
    g_initRandom(osGetTime());
#undef malloc
    temp_s0 = malloc(0x1000); // mistake. This is secure mapped via the earlier set_secure_call_arr(5) call. Hudson called the unsecure function.
    func_80237890();
    HuPrcCreate(&func_80236F54, 0, temp_s0, 0x1000, 0x401);
    HuPrcCreate(&func_802334CC, 0, 0, 0, 0x402);
    func_8023A208();
    func_8023A3E0();
    func_80265C04();

    while (TRUE) {
        func_8023A104();           // receive message from the cont mesg queue and run osContGetReadData
        mainGfx = Gfx_InitGfx();   // init gfx
        ThreadProc_RunQueuedThreads();           // get thread pri/start some kind of thread.
        func_802381F8();           // yield to that thread.
        HuPrcCall();               // run Hudson processes.
        func_8022787C(&mainGfx);   // process frame buffers (4 in the array).
        func_802290CC();           // something related to 3D model animations. stubbing this makes bomberman invisible and all objects "stop" animating.

        temp_v0 = Gfx_GetSubDLPtr(id);      // get ptr to main DL buffer to push to display list
        gSPDisplayList(mainGfx++, temp_v0); // put it on the list.

        func_8025E1D4(&mainGfx); // soft reset video effect
        func_8026C208();         // does something with audio
        func_8023A208();         // run osContStartReadData
        Gfx_EndRender(mainGfx);  // do wait/queue/mesg thing?

        // if frame timer is already at 0, ignore the bottom part.
        if (frameTimer == 0) {
            continue;
        }

        // decrement it. If the decrement resulted in a 0, run the below code, this will result in the below code running once.
        if (--frameTimer != 0) {
            continue;
        }

        // on the 8th frame, run these once. Otherwise, the loop is the above.
        func_80227D50(D_802AC5C0, 8, 6, 304, 228);
        Gfx_SetScreenCoords(8, 6, 304, 228);
        osViBlack(0);
    }
}
