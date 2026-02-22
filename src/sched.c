#define NO_ZEROJMP_MAPPING // this file does not appear to use any zerojmp mapping.
#include <ultra64.h>
#include "PR/sched.h"
#include "assert.h"

#define _FINALROM
#undef NDEBUG
s32 D_80019FA0 = 0;
s32 D_80019FA4 = 0;
s32 D_80019FA8 = 0;
s32 D_80019FAC = 0;
static OSTime D_8001C440;
static OSTime D_8001C448; // declared in same file
static OSTime D_8001C450;
static OSTime D_8001C458;
static OSTime D_8001C460; // declared in same file
static OSTime D_8001C468;
static OSTime D_8001C470;
static OSTime D_8001C478;
static OSTime D_8001C480;
static OSTime D_8001C488;
static OSTime D_8001C490;
static OSTime D_8001C498;
static OSTime D_8001C4A0;
static OSTime D_8001C4A8;

/*
 * private typedefs and defines
 */
#define VIDEO_MSG       666
#define RSP_DONE_MSG    667
#define RDP_DONE_MSG    668
#define PRE_NMI_MSG     669

/*
 * OSScTask state
 */
#define OS_SC_DP                0x0001  /* set if still needs dp        */
#define OS_SC_SP                0x0002  /* set if still needs sp        */
#define OS_SC_YIELD             0x0010  /* set if yield requested       */
#define OS_SC_YIELDED           0x0020  /* set if yield completed       */

/*
 * OSScTask->flags type identifier
 */
#define OS_SC_XBUS      (OS_SC_SP | OS_SC_DP)
#define OS_SC_DRAM      (OS_SC_SP | OS_SC_DP | OS_SC_DRAM_DLIST)
#define OS_SC_DP_XBUS   (OS_SC_SP)
#define OS_SC_DP_DRAM   (OS_SC_SP | OS_SC_DRAM_DLIST)
#define OS_SC_SP_XBUS   (OS_SC_DP)
#define OS_SC_SP_DRAM   (OS_SC_DP | OS_SC_DRAM_DLIST)

/*
 * # d*efine SC_LOGGING 1
 */

// FUNCTIONS

void func_80001698(OSTime* arg0, OSTime* arg1, OSTime* arg2, OSTime* arg3, OSTime* arg4);
void            osCreateScheduler(OSSched *s, void *stack, OSPri priority,
                                  u8 mode, u8 numFields);
void            osScAddClient(OSSched *s, OSScClient *c, OSMesgQueue *msgQ);
void            osScRemoveClient(OSSched *s, OSScClient *c);
OSMesgQueue     *osScGetCmdQ(OSSched *s);

void func_80000D44(void);
void func_80000E0C(void);

/*
 * private functions
 */
static void     __scMain(void *arg);
static void     __scHandleRetrace(OSSched *s);
static void     __scHandleRSP(OSSched *s);
static void     __scHandleRDP(OSSched *s);

static void     __scAppendList(OSSched *s, OSScTask *t);
OSScTask        *__scTaskReady(OSScTask *t);
static s32      __scTaskComplete(OSSched *s,OSScTask *t);
static void     __scExec(OSSched *sc, OSScTask *sp, OSScTask *dp);
static void	__scYield(OSSched *s);
static s32      __scSchedule(OSSched *sc, OSScTask **sp, OSScTask **dp,
                             s32 availRCP);




















void func_80000D44(void) {
    if (D_80019FAC == 3) {
        D_80019FAC = 4;
        D_80019FA8 = D_80019FA0;
        D_8001C478 = D_8001C440;
        D_8001C480 = D_8001C448;
        D_8001C488 = D_8001C450;
        D_8001C490 = D_8001C458;
        D_8001C498 = D_8001C460;
    }
}

void func_80000E0C(void) {
    D_8001C4A0 = D_8001C468;
    D_8001C4A8 = D_8001C470;
}

void func_80001698(OSTime* arg0, OSTime* arg1, OSTime* arg2, OSTime* arg3, OSTime* arg4) {
    if (D_80019FAC == 4) {
        *arg0 = D_8001C478;
        *arg1 = D_8001C480;
        *arg2 = D_8001C488;
        *arg3 = D_8001C490;
        *arg4 = D_8001C498;
        D_80019FA4 = D_80019FA0;
        D_80019FAC = 0;
    }
}

/***********************************************************************
 * Scheduler API
 **********************************************************************/
void osCreateScheduler(OSSched *sc, void *stack, OSPri priority,
                       u8 mode, u8 numFields)
{
    sc->curRSPTask      = 0;
    sc->curRDPTask      = 0;
    sc->clientList      = 0;
    sc->frameCount      = 0;
    sc->audioListHead   = 0;
    sc->gfxListHead     = 0;
    sc->audioListTail   = 0;
    sc->gfxListTail     = 0;
    sc->retraceMsg.type = OS_SC_RETRACE_MSG;  /* sent to apps */
    sc->prenmiMsg.type  = OS_SC_PRE_NMI_MSG;

    osCreateMesgQueue(&sc->interruptQ, sc->intBuf, OS_SC_MAX_MESGS);
    osCreateMesgQueue(&sc->cmdQ, sc->cmdMsgBuf, OS_SC_MAX_MESGS);

    /*
     * Set up video manager, listen for Video, RSP, and RDP interrupts
     */
    osCreateViManager(OS_PRIORITY_VIMGR);
    osViSetMode(&osViModeTable[mode]);
    osViBlack(TRUE);
    osSetEventMesg(OS_EVENT_SP, &sc->interruptQ, (OSMesg)RSP_DONE_MSG);
    osSetEventMesg(OS_EVENT_DP, &sc->interruptQ, (OSMesg)RDP_DONE_MSG);
    osSetEventMesg(OS_EVENT_PRENMI, &sc->interruptQ, (OSMesg)PRE_NMI_MSG);

    osViSetEvent(&sc->interruptQ, (OSMesg)VIDEO_MSG, numFields);

    #ifdef SC_LOGGING
    osCreateLog(l, logArray, sizeof(logArray));
    #endif

    osCreateThread(&sc->thread, 4, __scMain, (void *)sc, stack, priority);
    osStartThread(&sc->thread);
}

/*
 * Add a client to the scheduler.  Clients receive messages at retrace time
 */
void osScAddClient(OSSched *sc, OSScClient *c, OSMesgQueue *msgQ)
{
    OSIntMask mask;

    mask = osSetIntMask(OS_IM_NONE);

    c->msgQ = msgQ;
    c->next = sc->clientList;
    sc->clientList = c;

    osSetIntMask(mask);
}

void osScRemoveClient(OSSched *sc, OSScClient *c)
{
    OSScClient *client = sc->clientList;
    OSScClient *prev   = 0;
    OSIntMask  mask;

    mask = osSetIntMask(OS_IM_NONE);

    while (client != 0) {
        if (client == c) {
            if(prev)
                prev->next = c->next;
            else
                sc->clientList = c->next;
            break;
        }
        prev   = client;
        client = client->next;
    }

    osSetIntMask(mask);
}

OSMesgQueue *osScGetCmdQ(OSSched *sc)
{
    return &sc->cmdQ;
}

/***********************************************************************
 * Scheduler implementation
 **********************************************************************/
static void __scMain(void *arg)
{
    OSMesg msg;
    OSSched *sc = (OSSched *)arg;
    OSScClient *client;
    static int count = 0;

    while(1) {
        osRecvMesg(&sc->interruptQ, (OSMesg *)&msg, OS_MESG_BLOCK);

        #ifdef SC_LOGGING
        if (++count % 1024 == 0)
            osFlushLog(l);
        #endif



        switch ((int) msg) {
            case (VIDEO_MSG):
                if (D_80019FAC == 0) {
                    D_80019FAC = 1;
                    D_8001C460 = osGetTime();
                    D_80019FA0++;
                }
                __scHandleRetrace(sc);
                break;

            case (RSP_DONE_MSG): {
                u32 type = sc->curRSPTask->list.t.type;
                if (type == 1) {
                    D_8001C448 = osGetTime();
                } else if (type == 2) {
                    D_8001C470 = osGetTime();
                }
                func_80000E0C();
            }
            __scHandleRSP(sc);
            break;

            case (RDP_DONE_MSG): {
                if (D_80019FAC == 2) {
                    D_8001C458 = osGetTime();
                    D_80019FAC = 3;
                }
                func_80000D44();
            }
            __scHandleRDP(sc);
            break;

            case (PRE_NMI_MSG):
                /*
                 * notify audio and graphics threads to fade out
                 */
                for (client = sc->clientList;client != 0;client = client->next) {
                    osSendMesg(client->msgQ, (OSMesg) &sc->prenmiMsg,
                               OS_MESG_NOBLOCK);
                }
                break;
        }
    }
}

/*
 * scHandleRetrace()
 */
static int dp_busy = 0;
static int dpCount = 0;

void __scHandleRetrace(OSSched *sc)
{
    OSScTask    *rspTask;
    OSScClient  *client;
    s32         state;
    OSScTask    *sp = 0;
    OSScTask    *dp = 0;

    sc->frameCount++;

    /*
     * Read the task command queue and schedule tasks
     */
    while (osRecvMesg(&sc->cmdQ, (OSMesg *)&rspTask, OS_MESG_NOBLOCK) != -1) {
        __scAppendList(sc, rspTask);
    }

    if (sc->doAudio && sc->curRSPTask) {
        /*
         * Preempt the running gfx task.  Note: if the RSP
         * component of the graphics task has finished, but the
         * RDP component is still running, we can start an audio
         * task which will freeze the RDP (and save the RDP cmd
         * FIFO) while the audio RSP code is running.
         */
        __scYield(sc);
    } else {
        state = ((sc->curRSPTask == 0) << 1) | (sc->curRDPTask == 0);
        if ( __scSchedule (sc, &sp, &dp, state) != state)
            __scExec(sc, sp, dp);
    }

    /*
     * notify audio and graphics threads to start building the command
     * lists for the next frame (client threads may choose not to
     * build the list in overrun case)
     */
    for (client = sc->clientList; client != 0; client = client->next) {
        osSendMesg(client->msgQ, (OSMesg) &sc->retraceMsg, OS_MESG_NOBLOCK);
    }
}

/*
 * __scHandleRSP is called when an RSP task signals that it has
 * finished or yielded (at the hosts request)
 */
void __scHandleRSP(OSSched *sc)
{
    OSScTask *t, *sp = 0, *dp = 0;
    s32 state;

    assert_sched(sc->curRSPTask);

    t = sc->curRSPTask;
    sc->curRSPTask = 0;

    #ifdef SC_LOGGING
    osLogEvent(l, 510, 3, t, t->state, t->flags);
    #endif

    if ((t->state & OS_SC_YIELD) && osSpTaskYielded(&t->list)) {
        t->state |= OS_SC_YIELDED;
        #ifndef _FINALROM
        t->totalTime += osGetTime() - t->startTime;
        #endif
        if ((t->flags & OS_SC_TYPE_MASK) == OS_SC_XBUS) {
            /* push the task back on the list */
            t->next = sc->gfxListHead;
            sc->gfxListHead = t;
            if (sc->gfxListTail == 0)
                sc->gfxListTail = t;
        }

        #ifdef SC_LOGGING
        osLogEvent(l, 521, 1, t);
        #endif

    } else {
        t->state &= ~OS_SC_NEEDS_RSP;
        __scTaskComplete(sc, t);
    }
    state = ((sc->curRSPTask == 0) << 1) | (sc->curRDPTask == 0);
    if ( (__scSchedule (sc, &sp, &dp, state)) != state)
        __scExec(sc, sp, dp);
}

/*
 * __scHandleRDP is called when an RDP task signals that it has finished
 */
void __scHandleRDP(OSSched *sc)
{
    OSScTask *t, *sp = 0, *dp = 0;
    s32 state;

    assert_sched(sc->curRDPTask);
    assert_sched(sc->curRDPTask->list.t.type == M_GFXTASK);

    t = sc->curRDPTask;
    sc->curRDPTask = 0;

    #ifdef SC_LOGGING
    osLogEvent(l, 515, 3, t, t->state, t->flags);
    #endif

    t->state &= ~OS_SC_NEEDS_RDP;

    __scTaskComplete(sc, t);

    state = ((sc->curRSPTask == 0) << 1) | (sc->curRDPTask == 0);
    if ( (__scSchedule (sc, &sp, &dp, state)) != state)
        __scExec(sc, sp, dp);
}

/*
 * __scTaskReady checks to see if the graphics task is able to run
 * based on the current state of the RCP.
 */
OSScTask *__scTaskReady(OSScTask *t)
{
    int rv = 0;
    void *a;
    void *b;

    if (t) {
        /*
         * If there is a pending swap bail out til later (next
         * retrace).
         */
        if ((a=osViGetCurrentFramebuffer()) != (b=osViGetNextFramebuffer())) {
            #ifdef SC_LOGGING
            osLogEvent(l, 513, 2, a, b);
            #endif
            return 0;
        }

        return t;
    }

    return 0;
}

/*
 * __scTaskComplete checks to see if the task is complete (all RCP
 * operations have been performed) and sends the done message to the
 * client if it is.
 */
s32 __scTaskComplete(OSSched *sc, OSScTask *t)
{
    int rv;
    static int firsttime = 1;

    if ((t->state & OS_SC_RCP_MASK) == 0) { /* none of the needs bits set */

        assert_sched (t->msgQ);

        #ifndef _FINALROM
        t->totalTime += osGetTime() - t->startTime;
        #endif

        rv = osSendMesg(t->msgQ, t->msg, OS_MESG_BLOCK);

        if (t->list.t.type == M_GFXTASK) {
            if ((t->flags & OS_SC_SWAPBUFFER) && (t->flags & OS_SC_LAST_TASK)){
                if (firsttime) {
                    osViBlack(FALSE);
                    firsttime = 0;
                }
                osViSwapBuffer(t->framebuffer);
            }
        }
        return 1;
    }

    return 0;
}



/*
 * Place task on either the audio or graphics queue
 */
void __scAppendList(OSSched *sc, OSScTask *t)
{
    long type = t->list.t.type;

    assert_sched ( (type == M_AUDTASK) || (type == M_GFXTASK));

    if (type == M_AUDTASK) {
        if (sc->audioListTail)
            sc->audioListTail->next = t;
        else
            sc->audioListHead = t;

        sc->audioListTail = t;
        sc->doAudio = 1;
        #ifdef SC_LOGGING
        osLogEvent(l, 506, 1, t);
        #endif
    } else {
        if (sc->gfxListTail)
            sc->gfxListTail->next = t;
        else
            sc->gfxListHead = t;

        sc->gfxListTail = t;
        #ifdef SC_LOGGING
        osLogEvent(l, 507, 1, t);
        #endif
    }

    t->next = NULL;
    t->state = t->flags & OS_SC_RCP_MASK;
}





/*
 *
 */
void __scExec(OSSched *sc, OSScTask *sp, OSScTask *dp)
{
    int rv;

    assert_sched(sc->curRSPTask == 0);

    if (sp) {
        if (sp->list.t.type == M_AUDTASK) {
            osWritebackDCacheAll();  /* flush the cache */
        }

        sp->state &= ~(OS_SC_YIELD | OS_SC_YIELDED);

        osSpTaskLoad(&sp->list);
        if (sp->list.t.type == 1) {
            if (D_80019FAC == 1) {
                D_8001C440 = osGetTime(); D_8001C450 = osGetTime();
                D_80019FAC = 2;
            }
        } else if (sp->list.t.type == 2) {
            D_8001C468 = osGetTime();
        }
        osSpTaskStartGo(&sp->list);
        sc->curRSPTask = sp;
        if (sp == dp)
            sc->curRDPTask = dp;
    }
    if (dp && (dp != sp)) {
        assert_sched(dp->list.t.output_buff);

        rv = osDpSetNextBuffer(dp->list.t.output_buff,
                               *dp->list.t.output_buff_size);

        dp_busy = 1;
        dpCount = 0;








        assert_sched(rv == 0);

        sc->curRDPTask = dp;
    }
}

static void __scYield(OSSched *sc)
{

    #ifdef SC_LOGGING
    osLogEvent(l, 503, 1, sc->curRSPTask );
    #endif

    if (sc->curRSPTask->list.t.type == M_GFXTASK) {

        /*	assert(sc->curRSPTask->state & OS_SC_YIELD);*/

        sc->curRSPTask->state |= OS_SC_YIELD;

        osSpTaskYield();
    } else {
        #ifdef SC_LOGGING
        osLogEvent(l, 508, 1, sc->curRSPTask);
        #endif
    }
}

/*
 * Schedules the tasks to be run on the RCP
 */
s32 __scSchedule(OSSched *sc, OSScTask **sp, OSScTask **dp, s32 availRCP)
{
    s32 avail = availRCP;
    OSScTask *gfx = sc->gfxListHead;
    OSScTask *audio = sc->audioListHead;

    #ifdef SC_LOGGING
    osLogEvent(l, 517, 3, *sp, *dp, availRCP);
    #endif

    if (sc->doAudio && (avail & OS_SC_SP)) {

        if (gfx && (gfx->flags & OS_SC_PARALLEL_TASK)) {
            *sp = gfx;
            avail &= ~OS_SC_SP;
        } else {
            *sp = audio;
            avail &= ~OS_SC_SP;
            sc->doAudio = 0;
            sc->audioListHead = sc->audioListHead->next;
            if (sc->audioListHead == NULL)
                sc->audioListTail = NULL;
        }
    } else {
        #ifdef SC_LOGGING
        osLogEvent(l, 520, 1, gfx);
        #endif
        if (__scTaskReady(gfx)) {

            #ifdef SC_LOGGING
            osLogEvent(l, 522, 3, gfx, gfx->state, gfx->flags);
            #endif
            switch (gfx->flags & OS_SC_TYPE_MASK) {
                case (OS_SC_XBUS):
                    if (gfx->state & OS_SC_YIELDED) {
                        #ifdef SC_LOGGING
                        osLogEvent(l, 518, 0);
                        #endif
                        /* can hit this if RDP finishes at yield req */
                        /* assert(gfx->state & OS_SC_DP); */

                        if (avail & OS_SC_SP) {   /* if SP is available */
                            #ifdef SC_LOGGING
                            osLogEvent(l, 519, 0);
                            #endif
                            *sp = gfx;
                            avail &= ~OS_SC_SP;

                            if (gfx->state & OS_SC_DP) {  /* if it needs DP */
                                *dp = gfx;
                                avail &= ~OS_SC_DP;

                                if (avail & OS_SC_DP == 0)
                                    assert_sched(sc->curRDPTask == gfx);

                            }

                            sc->gfxListHead = sc->gfxListHead->next;
                            if (sc->gfxListHead == NULL)
                                sc->gfxListTail = NULL;

                        }
                    } else {
                        if (avail == (OS_SC_SP | OS_SC_DP)) {
                            *sp = *dp = gfx;
                            avail &= ~(OS_SC_SP | OS_SC_DP);
                            sc->gfxListHead = sc->gfxListHead->next;
                            if (sc->gfxListHead == NULL)
                                sc->gfxListTail = NULL;
                        }
                    }

                    break;

                case (OS_SC_DRAM):
                case (OS_SC_DP_DRAM):
                case (OS_SC_DP_XBUS):
                    if (gfx->state & OS_SC_SP) {  /* if needs SP */
                        if (avail & OS_SC_SP) {   /* if SP is available */
                            *sp = gfx;
                            avail &= ~OS_SC_SP;
                        }
                    } else if (gfx->state & OS_SC_DP) {   /* if needs DP */
                        if (avail & OS_SC_DP) {        /* if DP available */
                            *dp = gfx;
                            avail &= ~OS_SC_DP;
                            sc->gfxListHead = sc->gfxListHead->next;
                            if (sc->gfxListHead == NULL)
                                sc->gfxListTail = NULL;
                        }
                    }
                    break;

                case (OS_SC_SP_DRAM):
                case (OS_SC_SP_XBUS):
                default:
                    break;
            }
        }
    }

    if (avail != availRCP)
        avail = __scSchedule(sc, sp, dp, avail);

    return avail;

}
