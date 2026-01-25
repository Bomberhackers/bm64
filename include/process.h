#ifndef __BM64_PROCESS_H__
#define __BM64_PROCESS_H__

typedef struct jump_buf
{
    u32 regs[28];
} jmp_buf; // size: 0x70

// Process structure
typedef struct Process {
    /* 0x000 */ u16 id;
    /* 0x002 */ u16 pri;
    /* 0x004 */ u32 exec_mode;       // exec_mode: 0=dead, 1=running, 2=sleeping(timed), 3=paused
    /* 0x008 */ u32 sleep_time;      // sleep_time
    /* 0x00C */ u32 func;
    /* 0x010 */ u32 user_data;       // user_data
    /* 0x014 */ u32 unk14;
    /* 0x018 */ u32 unk18;
    /* 0x01C */ u32 unk1C;
    /* 0x020 */ u32 stackSize;
    /* 0x024 */ u8 *sptop;
    /* 0x028 */ u8 stack[0x800];
    /* 0x828 */ jmp_buf jmpBuf;
    /* 0x898 */ struct Process *prev;
    /* 0x89C */ struct Process *next;
} Process;

// Debug format strings
extern u8 D_802A2E80[];  // "id    : %d"
extern u8 D_802A2E8C[];  // "pri   : %d"
extern u8 D_802A2E98[];  // "func  : %08lx"
extern u8 D_802A2EA8[];  // "sp    : %08lx"
extern u8 D_802A2EB8[];  // "sptop : %08lx"
extern u8 D_802A2EC8[];  // "spbtm : %08lx"

// External libc-like functions
extern s32 setjmp(jmp_buf*);
extern s32 longjmp(jmp_buf*, s32);
extern void func_80297D38(char *str, ...);  // sprintf
extern s32 func_80297D90(s32, s32, s32);    // condition check
extern void func_80297D30(s32, void*);      // debug init

// Process pool
extern struct Process D_80063370[];         // process_pool[0x50]

// Global state
extern s32 gProcessCount;                   // processcnt
extern s32 D_802AC360;
extern u8 D_802A0100[];

extern struct Process D_802AB200;           // process_active_head
extern struct Process D_802ABAA0;           // process_free_head
extern struct Process *D_802ABA9C;          // processtop

extern struct Process *D_802AC33C;          // process_free_list
extern struct Process *D_802AC340;          // process_search_prev
extern struct Process *D_802AC344;          // processcur (current process)
extern struct Process *D_802AC348;          // processprev (previous process)
extern s32 D_802AC34C;                      // stack_debug_top
extern u32 D_802AC350;                      // stack_debug_btm
extern s32 D_802AC354;                      // stack_debug_sp
extern u32 D_802AC35C;                      // process_time
extern jmp_buf D_802AC368;                  // process_jmp_buf

// Function declarations
void HuPrcInit(void);                                                       // func_8023946C
void HuPrcEnd(void);                                                        // func_80239430
void HuPrcCall(void);
s32 HuPrcStackCheck(struct Process *process);                               // func_80239208
s32 HuPrcUserDataGet(void);                                                 // func_802391F0
s32 HuPrcYieldSave(void);                                                   // func_802391A4
s32 HuPrcWaitCond(s32 arg0, s32 arg1, s32 arg2);                           // func_802390F0
void HuPrcVSleep(void);                                                     // func_802390B4
void HuPrcSleep1(void);                                                     // func_80239094
s32 HuPrcSleep(s32 arg0);                                                   // func_8023903C
s32 HuPrcGetPriById(s32 arg0);                                             // func_80238FF4
u16 HuPrcPriGet(void);                                                      // func_80238FDC
s32 HuPrcKillRange(s32 arg0, s32 arg1);                                    // func_80238F40
s32 HuPrcTerminate(s32 id);
s32 HuPrcSleepRange(s32 arg0, s32 arg1, u32 arg2);                         // func_80238DFC
s32 HuPrcSleepById(u16 arg0, s32 arg1);                                    // func_80238D98
s32 HuPrcWakeupRange(s32 arg0, s32 arg1);                                  // func_80238CF8
s32 HuPrcWakeup(u16 arg0);                                                  // func_80238C68
struct Process *HuPrcFindById(u16 arg0);                                    // func_80238C08
s32 HuPrcCurrentIdGet(void);                                                // func_80238BDC
void HuPrcCreateChecked(void *func, s32 arg1, void* arg2, s32 arg3, u16 pri); // func_80238B9C
s32 HuPrcCreate(void *func, s32 arg1, void* arg2, s32 arg3, u16 pri);
void HuPrcUnlink(struct Process* arg0);                                     // func_80238994
void HuPrcClear(struct Process* arg0);                                      // func_8023897C
struct Process *HuPrcFindInsertPos(u16 arg0);                              // func_80238918
void HuPrcLink(struct Process* arg0, struct Process* arg1);                // func_802388E8
void HuPrcInitDebug(void);                                                  // func_802388C0

#endif // __BM64_PROCESS_H__
