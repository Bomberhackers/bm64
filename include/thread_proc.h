#ifndef _THREAD_PROC_H_
#define _THREAD_PROC_H_

#include "PR/sched.h"

#define UnkStruct802A5A60_FLAGS_INITIALIZED (1 << 0)  // 0x0001
#define UnkStruct802A5A60_FLAGS_STARTED     (1 << 1)  // 0x0002
#define UnkStruct802A5A60_FLAGS_STOPPED     (1 << 2)  // 0x0004
#define UnkStruct802A5A60_FLAGS_UNK3        (1 << 3)  // 0x0008
#define UnkStruct802A5A60_FLAGS_UNK4        (1 << 4)  // 0x0010
#define UnkStruct802A5A60_FLAGS_UNK5        (1 << 5)  // 0x0020
#define UnkStruct802A5A60_FLAGS_UNK6        (1 << 6)  // 0x0040
#define UnkStruct802A5A60_FLAGS_UNK7        (1 << 7)  // 0x0080

// these higher 8 bits are considered a different category of flags for some reason.
#define UnkStruct802A5A60_FLAGS_UNK8        (1 << 8)  // 0x0100
#define UnkStruct802A5A60_FLAGS_UNK9        (1 << 9)  // 0x0200
#define UnkStruct802A5A60_FLAGS_UNK10       (1 << 10) // 0x0400
#define UnkStruct802A5A60_FLAGS_UNK11       (1 << 11) // 0x0800
#define UnkStruct802A5A60_FLAGS_UNK12       (1 << 12) // 0x1000
#define UnkStruct802A5A60_FLAGS_UNK13       (1 << 13) // 0x2000
#define UnkStruct802A5A60_FLAGS_UNK14       (1 << 14) // 0x4000
#define UnkStruct802A5A60_FLAGS_UNK15       (1 << 15) // 0x8000

// ThreadProc(s)? Describes a "process" for a libultra thread. However, Hudson only ever seems to use it with a single thread function.
typedef struct ThreadProc {
    /* 0x00 */ u32 id;
    /* 0x04 */ u16 flags;
    /* 0x08 */ OSMesgQueue queue;
    /* 0x20 */ OSMesg mesg;
    s32 unused24; // unused
    /* 0x28 */ OSThread thread;
    // technically unused in normal contexts, but may be extra scratch space for the stack area when
    // this gets used as stack area in the event no stack pointer is specified.
    char extra[0x400];
} ThreadProc; // size:0x5D8

#define THREAD_PROC_MAX_COUNT 8

// FUNCTIONS
void ThreadProc_Init(OSThread *thread, s32 baseID, s32 basePri);
s32 ThreadProc_FindMatchingFlag(u16 flags);
s32 ThreadProc_Add(void (*entry)(void*), void *arg, s32 priOffset, void* sp);
s32 ThreadProc_FindMatchingFlags(u16 flags);
void ThreadProc_StopThreads(s32 count); // unused
s32 ThreadProc_KillThread(s32 id);
void ThreadProc_TryKillRunningThread(void); // unused
u32 ThreadProc_DeleteThread(s32 id);
void func_802381F8(void);
void ThreadProc_RunQueuedThreads(void);
void ThreadProc_RunQueues(void *unused);
void func_80237F44(OSMesg msg);
s32 ThreadProc_GetCurrentFrameCount(void);
s32 ThreadProc_SetThreadPriRelativeByID(s32 id, OSPri pri);
s32 ThreadProc_SetCurrThreadPriRelative(OSPri pri);
s32 ThreadProc_SetCurrThreadPriAbsolute(OSPri pri);
s32 ThreadProc_SetThreadPri(s32 id, OSPri pri);
s32 ThreadProc_GetCurrThreadPri(void);
s32 ThreadProc_GetThreadPri(s32 id);
s32 func_80237D4C(u16 arg0);
s32 func_80237CAC(s32 arg0, u16 arg1);
void func_80237C84(void);
s32 func_80237C08(s32 arg0);
struct ThreadProc* ThreadProc_FindByID(u16 id);
s32 ThreadProc_SearchByID(u16 arg0);
void func_80237AE4(OSScClient *c, OSMesgQueue *msgQ);
void func_80237ABC(OSScClient *arg0);
void func_80237A90(s32 arg0);
void func_80237A70(OSMesgQueue *mesgQueue, OSMesg *mesg);

#endif // _THREAD_PROC_H_
