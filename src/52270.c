#include <ultra64.h>
#include "PR/sched.h"

extern OSThread *D_802A8920;
extern s32 D_802A8924;
extern s32 D_802A8928;
extern s32 D_802A892C;
extern s32 D_802A8930;
extern s32 D_802A8934;
extern OSSched D_802A89B0;
extern s32 D_802AB1F0;
extern OSMesgQueue D_802A8938;
extern OSMesg D_802A8950;
extern OSMesgQueue D_802A8958;
extern OSMesg D_802A8970;
extern s32 D_802A8954;

struct UnkStruct802A5A60 {
    /* 0x00 */ u32 id;
    /* 0x04 */ u16 unk4; // flags?
    char pad6[0x2];
    /* 0x08 */ OSMesgQueue queue;
    /* 0x20 */ OSMesg mesg;
    char unk24[0x4];
    /* 0x28 */ OSThread unk28;
    char pad68[0x400];
};

struct UnkFuncStruct8023876C_Arg1 {
    char pad0[0x9];
    /* 0x09 */ u8 id;
};

extern struct UnkStruct802A5A60 D_802A5A60[];

// FUNCTIONS
void func_8023876C(OSThread *thread, struct UnkFuncStruct8023876C_Arg1 *arg1, s32 arg2);
s32 func_802386CC(u16 arg0);
s32 func_80238564(void (*entry)(void*), void *arg, s32 priOffset, void* sp);
s32 func_802384D4(u16 arg0);
void func_80238414(s32 arg0);
s32 func_802383A4(s32 arg0);
void func_80238368(void);
u32 func_802382C8(s32 arg0);
static void func_802382C0(void); // inline
void func_802381F8(void);
void func_80238100(void);
void func_80237F84(s32 arg0);
void func_80237F44(s32 arg0);
s32 func_80237F34(void);
void func_80237F0C(s32 arg0, s32 arg1);
void func_80237ED0(s32 arg0);
void func_80237EA0(s32 arg0);
s32 func_80237E18(s32 arg0, OSPri arg1);
void func_80237DF0(void);
s32 func_80237D7C(s32 arg0);
void func_80237D4C(u16 arg0);
s32 func_80237CAC(s32 arg0, u16 arg1);
void func_80237C84(void);
s32 func_80237C08(s32 arg0);
void* func_80237BA4(u16 arg0);
s32 func_80237B14(u16 arg0);
void func_80237AE4(OSScClient *c, OSMesgQueue *msgQ);
void func_80237ABC(OSScClient *arg0);
void func_80237A90(s32 arg0);
void func_80237A70(OSMesgQueue *mesgQueue, OSMesg *mesg);

// hack
struct StructPadHack_802AAC30 {
    u8 pad[0x8];
    OSMesg mesg;
};

volatile u8 D_802AAC30_unk[0x8];
struct StructPadHack_802AAC30 D_802AAC30;
OSScClient D_802AAC40;
OSThread D_802AAC48;

// init the system related to the array of elements for D_802A5A60
void func_8023876C(OSThread *thread, struct UnkFuncStruct8023876C_Arg1 *arg1, s32 arg2) {
    OSMesg *mesg = &D_802AAC30.mesg;
    struct UnkStruct802A5A60* ptr;
    s32 mode;
    s32 i;

    switch(func_80001A14()) {
        default:
            mode = 2;
            break;
        case 0:
            mode = 0x10;
            break;
        case 2:
            mode = 0x1E;
            break;
    }

    osCreateScheduler(&D_802A89B0, mesg, 0x7F, mode, 1);

    *mesg = osScGetCmdQ(&D_802A89B0);
    // @bug you passed an unaligned pointer!!! (to OSId in this case) shame on you, Hudson.
    osCreateThread(&D_802AAC48, &arg1->id, &func_80237F84, 0, &D_802AB1F0, 0x7D);
    osStartThread(&D_802AAC48);

    D_802A8920 = thread;
    D_802A8924 = arg1;
    D_802A8928 = arg2; // map the base priority of the threads?
    D_802A892C = 0;
    D_802A8930 = 0;
    D_802A8934 = 0;

    ptr = &D_802A5A60[0];
    for(i = 0; i < 8; i++) {
        ptr->id = (s32)arg1 + i;
        ptr->unk4 = 0;
        osCreateMesgQueue(&ptr->queue, &ptr->mesg, 1);
        ptr++;
    }
}

s32 func_802386CC(u16 arg0) {
    struct UnkStruct802A5A60* ptr = &D_802A5A60[0];
    s32 i;

    for(i = 0; i < 8; i++) {
        if ((ptr->unk4 & (arg0)) == arg0) {
            return i;
        }
        ptr++;
    }
    return -1;
}

// add thread to the array of D_802A5A60
s32 func_80238564(void (*entry)(void*), void *arg, s32 priOffset, void* sp) {
    s32 id;
    struct UnkStruct802A5A60 *ptr;

    // we've made too many elements. return -1 because we were unable to add the thread.
    if ((D_802A892C + D_802A8930 + 1) > 8) {
        return -1;
    }

    id = func_802384D4(0);
    if (id == -1) {
        return -1;
    }

    D_802A8930 += 1;

    ptr = &D_802A5A60[id];
    ptr->unk4 |= 1; // set as used?

    // if no stack is provided, map the stack to the next element in the array.
    if (sp == NULL) {
        osCreateThread(&ptr->unk28, ptr->id, entry, arg, &ptr[1], D_802A8928 + priOffset);
    } else {
        osCreateThread(&ptr->unk28, ptr->id, entry, arg, sp, D_802A8928 + priOffset);
    }
    if (ptr->queue.validCount >= ptr->queue.msgCount) {
        osRecvMesg(&ptr->queue, 0, 0);
    }
    return ptr->id;
}

// gets an ID for a thread with the matching flags. Practically used to find an available thread.
s32 func_802384D4(u16 arg0) {
    struct UnkStruct802A5A60 *ptr = &D_802A5A60[0];
    s32 i;

    for(i = 0; i < 8; i++) {
        if ((ptr->unk4) == arg0) {
            return i;
        }
        ptr++;
    }
    return -1;
}

void func_80238414(s32 arg0) {
    s32 i;
    struct UnkStruct802A5A60* ptr;

    ptr = func_80237BA4(osGetThreadId(0));

    if (ptr == NULL) {
        // we've encountered a problem.
        func_802382C0();
    }

    for(i = 0; i < arg0; i++) {
        ptr->unk4 |= 4;
        osStopThread(&ptr->unk28);
        //! @bug: Did you mean to increment this? This ends up stopping the same thread multiple times.
        //ptr++;
    }
}

s32 func_802383A4(s32 arg0) {
    s32 temp_v0;
    struct UnkStruct802A5A60* var_v0;

    func_802382C8(arg0);

    var_v0 = func_80237BA4(arg0);

    osDestroyThread(&var_v0->unk28);
    return arg0;
}

void func_80238368(void) {
    //? this cant ever return -1. any failure case will hang inside this function.
    if (func_802382C8(osGetThreadId(0)) != -1) {
        osDestroyThread(0);
    }
}

u32 func_802382C8(s32 arg0) {
    struct UnkStruct802A5A60* ptr;

    if (D_802A892C == 0) {
        func_802382C0();
    }

    ptr = func_80237BA4(arg0);
    if (ptr == NULL) {
        func_802382C0();
    }

    ptr->unk4 = 0;
    D_802A892C -= 1;
    return ptr->id;
}

static void func_802382C0(void) {
    while(1)
        ;
}

void func_802381F8(void) {
    struct UnkStruct802A5A60* ptr;
    s32 pri;
    s32 i;
    s32 var_s0;
    s32 var_s1;

    pri = osGetThreadPri(0);
    osSetThreadPri(D_802A8920, 1);

    while(1) {
        var_s0 = 0;
        var_s1 = 0;
        ptr = &D_802A5A60[0];
        for(i = 0; i < 8; i++) {
            if ((ptr->unk4 & 0x100) && (ptr->unk4 & 2)) {
                var_s0 += 1;
                if (ptr->unk4 & 4) {
                    var_s1 += 1;
                }
            }
            ptr++;
        }

        if (var_s0 != var_s1) {
            var_s0 = 0;
            var_s1 = 0;
            osYieldThread();
            continue;
        } else {
            break;
        }
    }
    osSetThreadPri(D_802A8920, pri);
}

void func_80238100(void) {
    s32 i;
    s32 pri;
    struct UnkStruct802A5A60 *ptr;

    pri = osGetThreadPri(0);
    osSetThreadPri(D_802A8920, 0x64);
    D_802A892C += D_802A8930;
    D_802A8930 = 0;
    D_802A8934 = 0;

    ptr = &D_802A5A60[0];
    for(i = 0; i < 8; i++) {
        if (ptr->unk4 & 1) {
            if (!(ptr->unk4 & 2)) {
                ptr->unk4 |= 0x102;
                osStartThread(&ptr->unk28);
            } else if (ptr->unk4 & 4) {
                ptr->unk4 &= ~4;
                osStartThread(&ptr->unk28);
            }
        }
        ptr++;
    }

    osSetThreadPri(D_802A8920, pri);
}

void func_80237F84(s32 arg0) {
    int loop;
    u8 unused[4];
    s16* sp4C;
    s16* sp48;

    sp48 = NULL;
    osCreateMesgQueue(&D_802A8938, &D_802A8950, 1);
    osCreateMesgQueue(&D_802A8958, &D_802A8970, 0x10);
    osScAddClient(&D_802A89B0, &D_802AAC40, &D_802A8938);
    D_802A8954 = 0;

    loop = 1; // somehow, this avoids a thread nop loop.
    while (loop) {
        if (D_802A8938.validCount >= D_802A8938.msgCount) {
            osRecvMesg(&D_802A8938, &sp48, 1);
        }
        osRecvMesg(&D_802A8938, &sp48, 1);

        switch (*sp48) {
            case 4:
                break;
            case 1:
                D_802A8954 += 1;
                if (osRecvMesg(&D_802A8958, &sp4C, 0) != -1) {
                    do {
                        osSendMesg(sp4C, 0, 0);
                    } while (osRecvMesg(&D_802A8958, &sp4C, 0) != -1);
                }
                break;
        }
    }
}

void func_80237F44(s32 arg0) {
    osSendMesg(&D_802A8958, arg0, 0);
    osRecvMesg(arg0, 0, 1);
}

s32 func_80237F34(void) {
    return D_802A8954;
}

void func_80237F0C(s32 arg0, s32 arg1) {
    func_80237E18(arg0, D_802A8928 + arg1);
}

void func_80237ED0(s32 arg0) {
    s32 pad;
    s32 newVal = D_802A8928 + arg0;
    func_80237E18(osGetThreadId(0), newVal);
}

void func_80237EA0(s32 arg0) {
    func_80237E18(osGetThreadId(0), arg0);
}

s32 func_80237E18(s32 arg0, OSPri arg1) {
    struct UnkStruct802A5A60* var_v0 = func_80237BA4(arg0);

    if (var_v0 == NULL) {
        return -1;
    }
    osSetThreadPri(&var_v0->unk28, arg1);
    return arg0;
}

void func_80237DF0(void) {
    func_80237D7C(osGetThreadId(0));
}

s32 func_80237D7C(s32 arg0) {
    struct UnkStruct802A5A60* ptr = func_80237BA4(arg0);

    if (ptr == NULL) {
        return -1;
    }
    return osGetThreadPri(&ptr->unk28);
}

void func_80237D4C(u16 arg0) {
    func_80237CAC(osGetThreadId(0), arg0);
}

s32 func_80237CAC(s32 arg0, u16 arg1) {
    struct UnkStruct802A5A60* ptr;

    arg1 &= 0xFF00;
    ptr = func_80237BA4(arg0);
    if (ptr == NULL) {
        return -1;
    }
    ptr->unk4 &= 0xFF;
    ptr->unk4 |= arg1;
    return arg0;
}

void func_80237C84(void) {
    func_80237C08(osGetThreadId(0));
}

s32 func_80237C08(s32 arg0) {
    struct UnkStruct802A5A60* ptr = func_80237BA4(arg0);

    if (ptr == NULL) {
        return -1;
    }
    return ptr->unk4 & 0xFF00;
}

void* func_80237BA4(u16 arg0) {
    s32 ret = func_80237B14(arg0);
    if (ret == -1) {
        return NULL;
    }
    return &D_802A5A60[ret];
}

s32 func_80237B14(u16 arg0) {
    s32 i;
    struct UnkStruct802A5A60* ptr = &D_802A5A60[0];

    for (i = 0; i < 8; i++) {
        if (ptr->id == arg0) {
            return i;
        }
        ptr++;
    }
    return -1;
}

void func_80237AE4(OSScClient *c, OSMesgQueue *msgQ) {
    osScAddClient(&D_802A89B0, c, msgQ);
}

void func_80237ABC(OSScClient *arg0) {
    osScRemoveClient(&D_802A89B0, arg0);
}

void func_80237A90(s32 arg0) {
    osSendMesg(D_802AAC30.mesg, arg0, 1);
}

void func_80237A70(OSMesgQueue *mesgQueue, OSMesg *mesg) {
    osRecvMesg(mesgQueue, mesg, 1);
}
