#include <ultra64.h>
#include "process.h"

u8* Libc_Memset(u8* arg0, u8* arg1, s32 arg2);
void func_80225CA8();                         /* extern */
void func_80226860();                         /* extern */
void func_80226D80();                         /* extern */
void func_80226E84(void *);                   /* extern */
void *func_80227464();                        /* extern */
s32 func_80227678(s32);                       /* extern */
void func_80227708(s32, s32, s32, s32);       /* extern */
s32 func_8022773C();                          /* extern */
void func_802277D0();                         /* extern */
void func_8022787C(void **);                  /* extern */
void func_80227D50(s32, s32, s32, s32, s32);  /* extern */
void func_802290CC();                         /* extern */
void func_8022A858();                         /* extern */
s32 func_80232E60();                          /* extern */
s32 func_802341C8();                          /* extern */
s32 func_80237890();                          /* extern */
s32 func_80238100();                          /* extern */
s32 func_802381F8();                          /* extern */
s32 func_8023876C(s32, s32, s32);             /* extern */
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
s32 func_802998EC(s32);                       /* extern */
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
    s32 sp3C;  
    s32 var_s1; 
    s32 temp_v0;

    var_s1 = 8;
    func_80297D20();
    Libc_Memset(&D_802A5300, 0, D_802B36D0 - D_802A5300);
    Libc_Memset(&D_80063000, 0, D_800BEA60 - D_80063000);
    func_80225CA8();
    set_secure_call_arr(4, &D_8029F570);
    set_secure_call_arr(5, &D_8029F590);
    func_802341C8();
    func_8023876C(arg0, 0xA, 0xA);
    osViSetSpecialFeatures(2);
    osViSetSpecialFeatures(4);
    osViSetSpecialFeatures(0x40);
    osViSetSpecialFeatures(0x10);
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
    func_80226D80();
    func_8025E16C();
    sp3C = func_8022773C();
    func_8026C77C();
    g_initRandom(osGetTime());
#undef func_802998EC
    temp_s0 = func_802998EC(0x1000); // mistake. This is secure mapped via the earlier set_secure_call_arr(5) call. Hudson called the unsecure function.
    func_80237890();
    HuPrcCreate(&func_80236F54, 0, temp_s0, 0x1000, 0x401);
    HuPrcCreate(&func_802334CC, 0, 0, 0, 0x402);
    func_8023A208();
    func_8023A3E0();
    func_80265C04();

    while (TRUE) {
        func_8023A104();
        mainGfx = func_80227464();
        func_80238100();
        func_802381F8();
        HuPrcCall();
        func_8022787C(&mainGfx);
        func_802290CC();

        temp_v0 = func_80227678(sp3C);
        gSPDisplayList(mainGfx++, temp_v0);

        func_8025E1D4(&mainGfx);
        func_8026C208();
        func_8023A208();
        func_80226E84(mainGfx);

        if (var_s1 == 0) {
            continue;
        }

        if (--var_s1 != 0) {
            continue;
        }

        func_80227D50(D_802AC5C0, 8, 6, 304, 228);
        func_80227708(8, 6, 304, 228);
        osViBlack(0);
    }
}
