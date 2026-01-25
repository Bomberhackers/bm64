#include <ultra64.h>
#include "process.h"

__inline struct Process *func_802389D4(); // why did you manually use __inline

// FUNCTIONS

void func_8023946C(void) {
    s32 i;
    struct Process *ptr;

    gProcessCount = 0;
    D_802AC35C = 0;
    D_802AC360 = 0;
    D_802AC340 = 0;
    D_802AC344 = 0;

    D_802AB200.id = 0x51;
    func_8023897C(&D_802AB200);
    D_802ABAA0.id = 0x52;
    func_8023897C(&D_802ABAA0);
    ptr = &D_80063370[0];

    for(i = 0; i < 0x50; i++, ptr++) {
        ptr->id = i;
        ptr->unk18 = (i >> 0x1F);
        ptr->unk1C = i;
        func_8023897C(ptr);
    }

    func_802388E8(&D_802ABAA0, &D_80063370[0]);

    ptr = &D_80063370[0];
    for(i = 0; i < 0x4F; i++) {
        func_802388E8(ptr, ptr+1);
        ptr++;
    }

    func_802388C0();
}

void func_80239430(void) {
    HuPrcTerminate(D_802AC344->id);
    longjmp(&D_802AC368, 1);
}

void HuPrcCall(void) {
    struct Process* process;

    D_802AC35C = 1;

    for (process = D_802AB200.next; process != NULL; process = process->next) {
        if (process->unk4 == 2) {
            if (D_802AC35C < process->unk8) {
                process->unk8 -= D_802AC35C;
            } else {
                process->unk8 = 0;
                process->unk4 = 1;
            }
        }
    }
    D_802AC344 = &D_802AB200;
    D_802AC348 = NULL;

    switch(setjmp(&D_802AC368)) {
        case 2: {
            s32 ret = func_80239208(D_802AC344);
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
    if (D_802AC344->unk4 == 1) {
        longjmp(&D_802AC344->jmpBuf, 1);
    } else {
        longjmp(&D_802AC368, 1);
    }
}

s32 func_80239208(struct Process *process) {
    u32 sp = process->jmpBuf.regs[2] & 0x7FFFFFFF;
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

s32 func_802391F0(void) {
    return D_802AC344->unk10;
}

s32 func_802391A4(void) {
    s32 temp_v0 = setjmp(&D_802AC344->jmpBuf);

    if (temp_v0 == 0) {
        longjmp(&D_802AC368, 2);
    }
    return temp_v0;
}

s32 func_802390F0(s32 arg0, s32 arg1, s32 arg2) {
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

void func_802390B4(void) {
    if (setjmp(&D_802AC344->jmpBuf) == 0) {
        longjmp(&D_802AC368, 1);
    }
}

void func_80239094(void) {
    func_8023903C(1);
}

s32 func_8023903C(s32 arg0) {
    s32 sp1C = func_80238D98(D_802AC344->id, arg0);

    if (setjmp(&D_802AC344->jmpBuf) == 0) {
        longjmp(&D_802AC368, 1);
    }
    return sp1C;
}

s32 func_80238FF4(s32 arg0) {
    struct Process *ptr = D_802ABA9C;

    while (ptr != NULL) {
        if (arg0 == ptr->id) {
            return ptr->pri;
        }
        ptr = ptr->next;
    }
    return -1;
}

u16 func_80238FDC(void) {
    return D_802AC344->pri;
}

s32 func_80238F40(s32 arg0, s32 arg1) {
    struct Process *ptr = D_802ABA9C;
    s32 idx = 0;

    while (ptr != NULL) {
        if ((ptr->pri >= arg0) && (arg1 >= ptr->pri)) {
            ptr = ptr->prev;
            HuPrcTerminate(ptr->next->id);
            idx += 1;
        }
        ptr = ptr->next;
    }

    return idx;
}

s32 HuPrcTerminate(s32 id) {
    struct Process *process = func_80238C08(id);

    // We tried to destroy a null process!
    if (process == NULL) {
        while(1)
            ;
    } else {
        // continue with process deletion.
        struct Process *prev = process->prev;

        process->unk4 = 0;
        func_80238994(process);
        func_802388E8(&D_802ABAA0, process);
        gProcessCount--; // process has been deleted. reduce proc count by 1.
        if (process == D_802AC344) {
            D_802AC344 = prev;
            longjmp(&D_802AC368, 1);
        }
        return process->id;
    }
}

s32 func_80238DFC(s32 arg0, s32 arg1, u32 arg2) {
    struct Process *ptr = D_802ABA9C;
    s32 idx = 0;

    while (ptr != NULL) {
        if ((ptr->pri >= arg0) && (arg1 >= ptr->pri)) {
            ptr = ptr->prev;
            func_80238D98(ptr->next->id, arg2);
            ptr = ptr->next;
            idx += 1;
        }
        ptr = ptr->next;
    }
    return idx;
}

s32 func_80238D98(u16 arg0, s32 arg1) {
    struct Process *ptr = func_80238C08(arg0);

    if (ptr == NULL) {
        return -1;
    }
    if (arg1 != 0) {
        ptr->unk4 = 2;
        ptr->unk8 = arg1;
    } else {
        ptr->unk4 = 3;
    }
    return ptr->id;
}

s32 func_80238CF8(s32 arg0, s32 arg1) {
    struct Process *ptr = D_802ABA9C;
    s32 idx = 0;

    while (ptr != NULL) {
        if ((ptr->pri >= arg0) && (arg1 >= ptr->pri)) {
            ptr = ptr->prev;
            func_80238C68(ptr->next->id);
            ptr = ptr->next;
            idx += 1;
        }
        ptr = ptr->next;
    }
    return idx;
}

s32 func_80238C68(u16 arg0) {
    s32 pad;
    s32 sp18 = -1;
    struct Process *temp_v0 = func_80238C08(arg0);

    if (temp_v0 != NULL) {
        switch (temp_v0->unk4) {
            case 2:
                temp_v0->unk8 = 0;
                temp_v0->unk4 = 1;
                break;
            case 3:
                if (temp_v0->unk8 != 0) {
                    temp_v0->unk4 = 2;
                } else {
                    temp_v0->unk4 = 1;
                }
                break;
        }
        sp18 = temp_v0->id;
    }
    return sp18;
}

struct Process *func_80238C08(u16 arg0) {
    struct Process *ptr = D_802AB200.next;

    D_802AC340 = &D_802AB200;
    while (ptr != NULL) {
        if (ptr->id == arg0) {
            return ptr;
        }
        D_802AC340 = ptr;
        ptr = ptr->next;
    }
    return NULL;
}

s32 func_80238BDC(void) {
    if (D_802AC344 == NULL) {
        return -1;
    }
    return D_802AC344->id;
}

void func_80238B9C(void *func, s32 arg1, void* arg2, s32 arg3, u16 pri) {
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

    process = func_802389D4();

    // no available pointers to create a process. stop.
    if (process == NULL) {
        return -1;
    }

    // invalid stack settings detected. Return an error.
    if ((stack != NULL) && (stackSize == 0)) {
        return -1;
    }

    func_8023897C(process);
    process->pri = pri;
    process->func = func;
    process->unk10 = arg1;
    process->unk4 = 1;

    // set stack ptr and size if they are set.
    if (stack != NULL) {
        process->sptop = stack;
        process->stackSize = stackSize;
    } else {
        process->sptop = process->stack;
        process->stackSize = 0x800;
    }

    temp_v0 = func_80238918(process->pri);
    if (temp_v0 == NULL) {
        var_a0 = D_802AC340;
    } else {
        var_a0 = temp_v0->prev;
    }

    func_802388E8(var_a0, process);

    // initialize and clear the jmp_buf area.
    for(i = 0; i < 28; i++) {
        process->jmpBuf.regs[i] = 0;
    }

    process->jmpBuf.regs[3] = process->func;
    process->jmpBuf.regs[2] = (process->sptop + process->stackSize);
    gProcessCount++;
    return process->id;
}

struct Process *func_802389D4() {
    struct Process *sp1C = D_802AC33C;

    if (sp1C == NULL) {
        return NULL;
    } else {
        func_80238994(sp1C);
        return sp1C;
    }
}

void func_80238994(struct Process* arg0) {
    struct Process* next = arg0->next;

    if (next != NULL) {
        next->prev = arg0->prev;
        arg0->prev->next = arg0->next;
        return;
    }
    arg0->prev->next = NULL;
}

void func_8023897C(struct Process* arg0) {
    arg0->pri = 0;
    arg0->unk4 = 0;
    arg0->unk8 = 0;
    arg0->prev = NULL;
    arg0->next = NULL;
}

struct Process *func_80238918(u16 arg0) {
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

void func_802388E8(struct Process* arg0, struct Process* arg1) {
    struct Process* temp_v0;

    arg1->prev = arg0;
    arg1->next = arg0->next;
    arg0->next = arg1;
    temp_v0 = arg1->next;
    if (temp_v0 != NULL) {
        temp_v0->prev = arg1;
    }
}

void func_802388C0(void) {
    func_80297D30(0x19, &D_802A0100);
}
