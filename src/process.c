#include <ultra64.h>
#include "process.h"

__inline struct Process *HuPrcAlloc(); // why did you manually use __inline

// FUNCTIONS

void HuPrcInit(void) {
    s32 i;
    struct Process *ptr;

    gProcessCount = 0;
    D_802AC35C = 0;
    D_802AC360 = 0;
    D_802AC340 = 0;
    D_802AC344 = 0;

    D_802AB200.id = 0x51;
    HuPrcClear(&D_802AB200);
    D_802ABAA0.id = 0x52;
    HuPrcClear(&D_802ABAA0);
    ptr = &D_80063370[0];

    for(i = 0; i < 0x50; i++, ptr++) {
        ptr->id = i;
        ptr->unk18 = (i >> 0x1F);
        ptr->unk1C = i;
        HuPrcClear(ptr);
    }

    HuPrcLink(&D_802ABAA0, &D_80063370[0]);

    ptr = &D_80063370[0];
    for(i = 0; i < 0x4F; i++) {
        HuPrcLink(ptr, ptr+1);
        ptr++;
    }

    HuPrcInitDebug();
}

void HuPrcEnd(void) {
    HuPrcTerminate(D_802AC344->id);
    longjmp(&D_802AC368, 1);
}

void HuPrcCall(void) {
    struct Process* process;

    D_802AC35C = 1;

    for (process = D_802AB200.next; process != NULL; process = process->next) {
        if (process->exec_mode == 2) {
            if (D_802AC35C < process->sleep_time) {
                process->sleep_time -= D_802AC35C;
            } else {
                process->sleep_time = 0;
                process->exec_mode = 1;
            }
        }
    }
    D_802AC344 = &D_802AB200;
    D_802AC348 = NULL;

    switch(setjmp(&D_802AC368)) {
        case 2: {
            s32 ret = HuPrcStackCheck(D_802AC344);
            if (ret == 0) {
                ret = -1;
            }
            longjmp(&D_802AC344->jmpBuf, ret);
            break;
        }
        case 0:
        case 1:
            break;
    }

    D_802AC348 = D_802AC344;
    D_802AC344 = D_802AC344->next;
    if (D_802AC344 == NULL) {
        return;
    }
    if (D_802AC344->exec_mode == 1) {
        longjmp(&D_802AC344->jmpBuf, 1);
    } else {
        longjmp(&D_802AC368, 1);
    }
}

s32 HuPrcStackCheck(struct Process *process) {
    u32 sp = process->jmpBuf.regs[JMPBUF_VALUE_SP] & 0x7FFFFFFF;
    u8 *sptop = ((u32)process->sptop & 0x7FFFFFFF);
    u32 spbtm = &sptop[process->stackSize];

    // sprintf calls
    func_80297D38(D_802A2E80, process->id);   // "id    : %d"
    func_80297D38(D_802A2E8C, process->pri);  // "pri   : %d"
    func_80297D38(D_802A2E98, process->func); // "func  : %08lx"
    func_80297D38(D_802A2EA8, sp);            // "sp    : %08lx"
    func_80297D38(D_802A2EB8, sptop);         // "sptop : %08lx"
    func_80297D38(D_802A2EC8, spbtm);         // "spbtm : %08lx"

    D_802AC34C = sptop;
    D_802AC350 = spbtm;
    D_802AC354 = sp;

    if ((spbtm < sp) || (((sp < (u32)sptop))))
        return -1;
    else
        return sp - (u32)sptop;
}

s32 HuPrcUserDataGet(void) {
    return D_802AC344->user_data;
}

s32 HuPrcYieldSave(void) {
    s32 temp_v0 = setjmp(&D_802AC344->jmpBuf);

    if (temp_v0 == 0) {
        longjmp(&D_802AC368, 2);
    }
    return temp_v0;
}

s32 HuPrcWaitCond(s32 arg0, s32 arg1, s32 arg2) {
    s32 var_v1;

    if (arg2 != 1) {
        return func_80297D90(arg0, arg1, 0);
    }

    for (var_v1 = func_80297D90(arg0, arg1, 0); var_v1 != 0; var_v1 = func_80297D90(arg0, arg1, 0)) {
        if (setjmp(&D_802AC344->jmpBuf) == 0) {
            longjmp(&D_802AC368, 1);
        }
    }
    return var_v1;
}

void HuPrcVSleep(void) {
    if (setjmp(&D_802AC344->jmpBuf) == 0) {
        longjmp(&D_802AC368, 1);
    }
}

void HuPrcSleep1(void) {
    HuPrcSleep(1);
}

s32 HuPrcSleep(s32 time) {
    s32 id = HuPrcSleepById(D_802AC344->id, time);

    if (setjmp(&D_802AC344->jmpBuf) == 0) {
        longjmp(&D_802AC368, 1);
    }
    return id;
}

s32 HuPrcGetPriById(s32 arg0) {
    struct Process *ptr = D_802ABA9C;

    while (ptr != NULL) {
        if (arg0 == ptr->id) {
            return ptr->pri;
        }
        ptr = ptr->next;
    }
    return -1;
}

u16 HuPrcPriGet(void) {
    return D_802AC344->pri;
}

s32 HuPrcKillRange(s32 minPri, s32 maxPri) {
    struct Process *ptr = D_802ABA9C;
    s32 idx = 0;

    while (ptr != NULL) {
        if ((ptr->pri >= minPri) && (maxPri >= ptr->pri)) {
            ptr = ptr->prev;
            HuPrcTerminate(ptr->next->id);
            idx += 1;
        }
        ptr = ptr->next;
    }

    return idx;
}

s32 HuPrcTerminate(s32 id) {
    struct Process *process = HuPrcFindById(id);

    // We tried to destroy a null process!
    if (process == NULL) {
        while(1)
            ;
    } else {
        // continue with process deletion.
        struct Process *prev = process->prev;

        process->exec_mode = 0;
        HuPrcUnlink(process);
        HuPrcLink(&D_802ABAA0, process);
        gProcessCount--; // process has been deleted. reduce proc count by 1.
        if (process == D_802AC344) {
            D_802AC344 = prev;
            longjmp(&D_802AC368, 1);
        }
        return process->id;
    }
}

s32 HuPrcSleepRange(s32 arg0, s32 arg1, u32 arg2) {
    struct Process *ptr = D_802ABA9C;
    s32 idx = 0;

    while (ptr != NULL) {
        if ((ptr->pri >= arg0) && (arg1 >= ptr->pri)) {
            ptr = ptr->prev;
            HuPrcSleepById(ptr->next->id, arg2);
            ptr = ptr->next;
            idx += 1;
        }
        ptr = ptr->next;
    }
    return idx;
}

s32 HuPrcSleepById(u16 id, s32 time) {
    struct Process *ptr = HuPrcFindById(id);

    if (ptr == NULL) {
        return -1;
    }
    if (time != 0) {
        ptr->exec_mode = 2;
        ptr->sleep_time = time;
    } else {
        ptr->exec_mode = 3;
    }
    return ptr->id;
}

s32 HuPrcWakeupRange(s32 arg0, s32 arg1) {
    struct Process *ptr = D_802ABA9C;
    s32 idx = 0;

    while (ptr != NULL) {
        if ((ptr->pri >= arg0) && (arg1 >= ptr->pri)) {
            ptr = ptr->prev;
            HuPrcWakeup(ptr->next->id);
            ptr = ptr->next;
            idx += 1;
        }
        ptr = ptr->next;
    }
    return idx;
}

s32 HuPrcWakeup(u16 arg0) {
    s32 pad;
    s32 sp18 = -1;
    struct Process *temp_v0 = HuPrcFindById(arg0);

    if (temp_v0 != NULL) {
        switch (temp_v0->exec_mode) {
            case 2:
                temp_v0->sleep_time = 0;
                temp_v0->exec_mode = 1;
                break;
            case 3:
                if (temp_v0->sleep_time != 0) {
                    temp_v0->exec_mode = 2;
                } else {
                    temp_v0->exec_mode = 1;
                }
                break;
        }
        sp18 = temp_v0->id;
    }
    return sp18;
}

struct Process *HuPrcFindById(u16 id) {
    struct Process *ptr = D_802AB200.next;

    D_802AC340 = &D_802AB200;
    while (ptr != NULL) {
        if (ptr->id == id) {
            return ptr;
        }
        D_802AC340 = ptr;
        ptr = ptr->next;
    }
    return NULL;
}

s32 HuPrcCurrentIdGet(void) {
    if (D_802AC344 == NULL) {
        return -1;
    }
    return D_802AC344->id;
}

void HuPrcCreateChecked(void *func, s32 arg1, void* arg2, s32 arg3, u16 pri) {
    if ((pri < 0x110) || (pri >= 0x3D0)) {
        while(1)
            ;
    }
    HuPrcCreate(func, arg1, arg2, arg3, pri);
}

s32 HuPrcCreate(void *func, s32 arg1, void* stack, s32 stackSize, u16 pri) {
    s32 var_a0;
    struct Process *process;
    s32 i;
    struct Process *temp_v0;

    // we are at the process limit. No further processes can be created.
    if (gProcessCount >= 0x50) {
        return -1;
    }

    process = HuPrcAlloc();

    // no available pointers to create a process. stop.
    if (process == NULL) {
        return -1;
    }

    // invalid stack settings detected. Return an error.
    if ((stack != NULL) && (stackSize == 0)) {
        return -1;
    }

    HuPrcClear(process);
    process->pri = pri;
    process->func = func;
    process->user_data = arg1;
    process->exec_mode = 1;

    // set stack ptr and size if they are set.
    if (stack != NULL) {
        process->sptop = stack;
        process->stackSize = stackSize;
    } else {
        process->sptop = process->stack;
        process->stackSize = 0x800;
    }

    temp_v0 = HuPrcFindInsertPos(process->pri);
    if (temp_v0 == NULL) {
        var_a0 = D_802AC340;
    } else {
        var_a0 = temp_v0->prev;
    }

    HuPrcLink(var_a0, process);

    // initialize and clear the jmpBuf area.
    for(i = 0; i < 28; i++) {
        process->jmpBuf.regs[i] = 0;
    }

    process->jmpBuf.regs[JMPBUF_VALUE_RA] = process->func;
    process->jmpBuf.regs[JMPBUF_VALUE_SP] = (process->sptop + process->stackSize);
    gProcessCount++;
    return process->id;
}

struct Process *HuPrcAlloc() {
    struct Process *sp1C = D_802AC33C;

    if (sp1C == NULL) {
        return NULL;
    } else {
        HuPrcUnlink(sp1C);
        return sp1C;
    }
}

void HuPrcUnlink(struct Process* arg0) {
    struct Process* next = arg0->next;

    if (next != NULL) {
        next->prev = arg0->prev;
        arg0->prev->next = arg0->next;
        return;
    }
    arg0->prev->next = NULL;
}

void HuPrcClear(struct Process* arg0) {
    arg0->pri = 0;
    arg0->exec_mode = 0;
    arg0->sleep_time = 0;
    arg0->prev = NULL;
    arg0->next = NULL;
}

struct Process *HuPrcFindInsertPos(u16 arg0) {
    struct Process *var_v1 = D_802AB200.next;

    D_802AC340 = &D_802AB200;
    while (var_v1 != NULL) {
        if (arg0 < var_v1->pri) {
            return var_v1;
        }
        D_802AC340 = var_v1;
        var_v1 = var_v1->next;
    }
    return NULL;
}

void HuPrcLink(struct Process* arg0, struct Process* arg1) {
    struct Process* temp_v0;

    arg1->prev = arg0;
    arg1->next = arg0->next;
    arg0->next = arg1;
    temp_v0 = arg1->next;
    if (temp_v0 != NULL) {
        temp_v0->prev = arg1;
    }
}

void HuPrcInitDebug(void) {
    func_80297D30(0x19, &D_802A0100);
}
