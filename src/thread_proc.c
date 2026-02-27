#include <ultra64.h>
#include "thread_proc.h"
#include "main.h"
#include "prevent_bss_reordering.h"

// thread_proc.c

extern s32 D_802AB1F0;

struct ThreadProc gThreadProcs[THREAD_PROC_MAX_COUNT];

struct UnkHackStruct802A8970 {
    /* 0x00 */ OSMesg mesg;
    u8 unk[0x38];
};

struct UnkHackStruct802AAC30 {
    u8 unk[0x8];
    /* 0x09 */ OSMesg mesg;
};

// this whole area is probably the bss area, but i cant get the later area to work ATM.
OSThread *gGameThreadPtr;
s32 gGameThreadBaseID;
s32 gGameThreadBasePri;
s32 gNumRunningThreads;
s32 gNumQueuedThreads;
s32 D_802A8934; // unknown, not used
OSMesgQueue D_802A8938;
OSMesg D_802A8950;
s32 gThreadFrameCount; // gThreadFrameCount
OSMesgQueue D_802A8958;
struct UnkHackStruct802A8970 D_802A8970;
OSSched D_802A89B0;
extern struct UnkHackStruct802AAC30 D_802AAC30;
extern OSScClient D_802AAC40;
extern OSThread gThreadProcManagerThread;
extern u8 gThreadProcManagerThreadStack[];

static void hang(void); // inline

/*
 * Init the system related to the array of elements for gThreadProcs.
 */
void ThreadProc_Init(OSThread *thread, s32 baseID, s32 basePri) {
    OSMesg *mesg = &D_802AAC30.mesg;
    struct ThreadProc* ptr;
    s32 mode;
    s32 i;

    switch(Main_GetTvType()) {
        default:
            mode = OS_VI_NTSC_LAN1;
            break;
        case 0:
            mode = OS_VI_PAL_LAN1;
            break;
        case 2:
            mode = OS_VI_MPAL_LAN1;
            break;
    }

    osCreateScheduler(&D_802A89B0, mesg, 0x7F, mode, 1);

    *mesg = osScGetCmdQ(&D_802A89B0);

    // the thread proc manager will use the 9th ID in the list, so add 9.
    osCreateThread(&gThreadProcManagerThread, baseID + 9, &ThreadProc_RunQueues, 0, &gThreadProcManagerThreadStack[0x3F8], 0x7D);
    osStartThread(&gThreadProcManagerThread);

    gGameThreadPtr = thread;
    gGameThreadBaseID = baseID;
    gGameThreadBasePri = basePri;
    gNumRunningThreads = 0;
    gNumQueuedThreads = 0;
    D_802A8934 = 0;

    // iterate over the thread procs and set the ID of each thread element of the array.
    ptr = &gThreadProcs[0];
    for(i = 0; i < THREAD_PROC_MAX_COUNT; i++) {
        ptr->id = baseID + i;
        ptr->flags = 0;
        osCreateMesgQueue(&ptr->queue, &ptr->mesg, 1);
        ptr++;
    }
}

/*
 * (unused) Find the first thread proc with the specified matching flag.
 */
s32 ThreadProc_FindMatchingFlag(u16 flags) {
    struct ThreadProc* ptr = &gThreadProcs[0];
    s32 i;

    for(i = 0; i < THREAD_PROC_MAX_COUNT; i++) {
        if ((ptr->flags & (flags)) == flags) {
            return i;
        }
        ptr++;
    }
    return -1;
}

/*
 * Add a thread to the thread proc array of gThreadProcs.
 */
s32 ThreadProc_Add(void (*entry)(void*), void *arg, s32 priOffset, void* sp) {
    s32 id;
    struct ThreadProc *ptr;

    // we've made too many elements. return -1 because we were unable to add the thread.
    if ((gNumRunningThreads + gNumQueuedThreads + 1) > THREAD_PROC_MAX_COUNT) {
        return -1;
    }

    // get an available ID to use for the element.
    id = ThreadProc_FindMatchingFlags(0);
    if (id == -1) {
        return -1;
    }

    gNumQueuedThreads++;

    ptr = &gThreadProcs[id];
    ptr->flags |= UnkStruct802A5A60_FLAGS_INITIALIZED;

    // if no stack is provided, map the stack to the next element in the array.
    if (sp == NULL) {
        osCreateThread(&ptr->thread, ptr->id, entry, arg, &ptr[1], gGameThreadBasePri + priOffset);
    } else {
        osCreateThread(&ptr->thread, ptr->id, entry, arg, sp, gGameThreadBasePri + priOffset);
    }
    if (ptr->queue.validCount >= ptr->queue.msgCount) {
        osRecvMesg(&ptr->queue, 0, 0);
    }
    return ptr->id;
}

/*
 * Gets an ID for a thread with the matching flags. Practically used to find an available thread.
 */
s32 ThreadProc_FindMatchingFlags(u16 flags) {
    struct ThreadProc *ptr = &gThreadProcs[0];
    s32 i;

    for(i = 0; i < THREAD_PROC_MAX_COUNT; i++) {
        if ((ptr->flags) == flags) {
            return i;
        }
        ptr++;
    }
    return -1;
}

/*
 * (unused) Presumedly is supposed to stop all created threads, but is coded incorrectly and will only stop the first one.
 */
void ThreadProc_StopThreads(s32 count) {
    s32 i;
    struct ThreadProc* ptr;

    ptr = ThreadProc_FindByID(osGetThreadId(0));

    if (ptr == NULL) {
        // we've encountered a problem.
        hang();
    }

    for(i = 0; i < count; i++) {
        ptr->flags |= UnkStruct802A5A60_FLAGS_STOPPED;
        osStopThread(&ptr->thread);
        //! @bug: Did you mean to increment this? This ends up stopping the same thread multiple times.
        //ptr++;
    }
}

/*
 * Kill the thread by ID. This will mark the thread as deleted and destroy it.
 */
s32 ThreadProc_KillThread(s32 id) {
    struct ThreadProc* ptr;

    ThreadProc_DeleteThread(id);

    ptr = ThreadProc_FindByID(id);

    osDestroyThread(&ptr->thread);
    return id;
}

/*
 * (unused) Tries to terminate the currently running thread.
 */
void ThreadProc_TryKillRunningThread(void) {
    //? this cant ever return -1. any failure case will hang inside this function.
    if (ThreadProc_DeleteThread(osGetThreadId(0)) != -1) {
        osDestroyThread(0);
    }
}

/*
 * Mark a thread for deletion by clearing the flags.
 */
u32 ThreadProc_DeleteThread(s32 id) {
    struct ThreadProc* ptr;

    // we cannot terminate any more threads. hang.
    if (gNumRunningThreads == 0) {
        hang();
    }

    ptr = ThreadProc_FindByID(id);

    // unable to locate the thread. hang.
    if (ptr == NULL) {
        hang();
    }

    // clear the flags to mark that the thread has stopped.
    ptr->flags = 0;
    gNumRunningThreads--;
    return ptr->id;
}

static void hang(void) {
    while(1)
        ;
}

void func_802381F8(void) {
    struct ThreadProc* ptr;
    s32 pri;
    s32 i;
    s32 var_s0;
    s32 numStopped;

    pri = osGetThreadPri(0);
    osSetThreadPri(gGameThreadPtr, 1);

    while(1) {
        var_s0 = 0;
        numStopped = 0;
        ptr = &gThreadProcs[0];
        for(i = 0; i < 8; i++) {
            if ((ptr->flags & UnkStruct802A5A60_FLAGS_UNK8) && (ptr->flags & UnkStruct802A5A60_FLAGS_STARTED)) {
                var_s0 += 1;
                if (ptr->flags & UnkStruct802A5A60_FLAGS_STOPPED) {
                    numStopped += 1;
                }
            }
            ptr++;
        }

        if (var_s0 != numStopped) {
            var_s0 = 0;
            numStopped = 0;
            osYieldThread();
            continue;
        } else {
            break;
        }
    }
    osSetThreadPri(gGameThreadPtr, pri);
}

/*
 * For the threads created and are currently queued to run, start those threads.
 */
void ThreadProc_RunQueuedThreads(void) {
    s32 i;
    s32 pri;
    struct ThreadProc *ptr;

    pri = osGetThreadPri(0);
    osSetThreadPri(gGameThreadPtr, 100);
    gNumRunningThreads += gNumQueuedThreads;
    gNumQueuedThreads = 0;
    D_802A8934 = 0;

    ptr = &gThreadProcs[0];
    for(i = 0; i < THREAD_PROC_MAX_COUNT; i++) {
        // is the thread been initialized/queued?
        if (ptr->flags & UnkStruct802A5A60_FLAGS_INITIALIZED) {
            // if it is not been started yet, start it and mark it as running.
            if ((ptr->flags & UnkStruct802A5A60_FLAGS_STARTED) == 0) {
                ptr->flags |= (UnkStruct802A5A60_FLAGS_UNK8 | UnkStruct802A5A60_FLAGS_STARTED);
                osStartThread(&ptr->thread);
            } else if (ptr->flags & UnkStruct802A5A60_FLAGS_STOPPED) {
                ptr->flags &= ~UnkStruct802A5A60_FLAGS_STOPPED;
                osStartThread(&ptr->thread);
            }
        }
        ptr++;
    }

    osSetThreadPri(gGameThreadPtr, pri);
}

/*
 * Run the current queues for the thread manager.
 */
void ThreadProc_RunQueues(void *unused) {
    int loop;
    u8 pad[4];
    OSMesg sendMsg;
    OSMesg recvMsg;

    recvMsg = NULL;
    osCreateMesgQueue(&D_802A8938, &D_802A8950, 1);
    osCreateMesgQueue(&D_802A8958, &D_802A8970.mesg, 0x10);
    osScAddClient(&D_802A89B0, &D_802AAC40, &D_802A8938);
    gThreadFrameCount = 0;

    loop = 1; // somehow, this avoids a thread nop loop.
    while (loop) {
        if (D_802A8938.validCount >= D_802A8938.msgCount) {
            osRecvMesg(&D_802A8938, &recvMsg, 1);
        }
        osRecvMesg(&D_802A8938, &recvMsg, 1);

        switch (*(s16*)recvMsg) {
            case 4:
                break;
            case 1:
                gThreadFrameCount++; //! @bug: It will never happen in normal gameplay, but this will overflow after about 2 years of running. Does not seem to cause any crashes though.
                if (osRecvMesg(&D_802A8958, &sendMsg, 0) != -1) {
                    do {
                        osSendMesg(sendMsg, 0, 0);
                    } while (osRecvMesg(&D_802A8958, &sendMsg, 0) != -1);
                }
                break;
        }
    }
}

void func_80237F44(OSMesg msg) {
    osSendMesg(&D_802A8958, msg, 0);
    osRecvMesg(msg, 0, 1);
}

/*
 * (unused) Return the current frame count.
 */
s32 ThreadProc_GetCurrentFrameCount(void) {
    return gThreadFrameCount;
}

/*
 * Set the relative priority of a specific thread by its ID.
 */
s32 ThreadProc_SetThreadPriRelativeByID(s32 id, OSPri pri) {
    return ThreadProc_SetThreadPri(id, gGameThreadBasePri + pri);
}

/*
 * Set the relative priority of the current thread.
 */
s32 ThreadProc_SetCurrThreadPriRelative(OSPri pri) {
    s32 pad;
    s32 newVal = gGameThreadBasePri + pri;
    return ThreadProc_SetThreadPri(osGetThreadId(0), newVal);
}

/*
 * Set the absolute priority of the current thread.
 */
s32 ThreadProc_SetCurrThreadPriAbsolute(OSPri pri) {
    return ThreadProc_SetThreadPri(osGetThreadId(0), pri);
}

/*
 * Set the priority of a thread by ID.
 */
s32 ThreadProc_SetThreadPri(s32 id, OSPri pri) {
    struct ThreadProc* ptr = ThreadProc_FindByID(id);

    if (ptr == NULL) {
        return -1;
    }
    osSetThreadPri(&ptr->thread, pri);
    return id;
}

/*
 * Return the priority of the currently running thread.
 */
s32 ThreadProc_GetCurrThreadPri(void) {
    return ThreadProc_GetThreadPri(osGetThreadId(0));
}

/*
 * Return the priority of a thread from a given ID.
 */
s32 ThreadProc_GetThreadPri(s32 id) {
    struct ThreadProc* ptr = ThreadProc_FindByID(id);

    if (ptr == NULL) {
        return -1;
    }
    return osGetThreadPri(&ptr->thread);
}

// assigns the upper flags to the current running thread.
s32 func_80237D4C(u16 flags) {
    return func_80237CAC(osGetThreadId(0), flags);
}

// sets the upper flags of a given thread ID.
s32 func_80237CAC(s32 id, u16 flags) {
    struct ThreadProc* ptr;

    flags &= 0xFF00;
    ptr = ThreadProc_FindByID(id);
    if (ptr == NULL) {
        return -1;
    }
    ptr->flags &= 0xFF;
    ptr->flags |= flags;
    return id;
}

void func_80237C84(void) {
    func_80237C08(osGetThreadId(0));
}

s32 func_80237C08(s32 id) {
    struct ThreadProc* ptr = ThreadProc_FindByID(id);

    if (ptr == NULL) {
        return -1;
    }
    return ptr->flags & 0xFF00;
}

/*
 * Locate and retrieve the pointer to a thread identified by the ID.
 */
struct ThreadProc* ThreadProc_FindByID(u16 id) {
    s32 ret = ThreadProc_SearchByID(id);
    if (ret == -1) {
        return NULL;
    }
    return &gThreadProcs[ret];
}

/*
 * Search the array of threads and retrieve it via matching the ID. (why not just return the pointer to it...?)
 */
s32 ThreadProc_SearchByID(u16 id) {
    s32 i;
    struct ThreadProc* ptr = &gThreadProcs[0];

    for (i = 0; i < THREAD_PROC_MAX_COUNT; i++) {
        if (ptr->id == id) {
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
