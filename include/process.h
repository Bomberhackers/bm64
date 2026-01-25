#ifndef __BM64_PROCESS_H__
#define __BM64_PROCESS_H__

typedef struct jump_buf
{
    u32 regs[28];
} jmp_buf; // size: 0x70

// Process?
typedef struct Process {
    /* 0x000 */ u16 id;
    /* 0x002 */ u16 pri;
    /* 0x004 */ u32 unk4;
    /* 0x008 */ u32 unk8;
    /* 0x00C */ u32 func;
    /* 0x010 */ u32 unk10;
    /* 0x014 */ u32 unk14;
    /* 0x018 */ u32 unk18;
    /* 0x01C */ u32 unk1C;
    /* 0x020 */ u32 stackSize;
    /* 0x024 */ u8 *sptop;
    /* 0x028 */ u8 stack[0x800]; // stack
    /* 0x828 */ jmp_buf jmpBuf;
    /* 0x898 */ struct Process *prev;
    /* 0x89C */ struct Process *next;
} Process;

extern u8 D_802A2E80[];
extern u8 D_802A2E8C[];
extern u8 D_802A2E98[];
extern u8 D_802A2EA8[];
extern u8 D_802A2EB8[];
extern u8 D_802A2EC8[];

extern s32 setjmp(jmp_buf*);
extern s32 longjmp(jmp_buf*, s32);
extern void func_80297D38(char *str, ...); // zerojmp call to sprintf

extern struct Process D_80063370[];

extern s32 gProcessCount; // gHuPrcCount
extern s32 D_802AC360;

extern u8 D_802A0100[];
extern struct Process D_802AB200; // gHuProcRootTask
extern struct Process D_802ABAA0;
extern struct Process *D_802ABA9C;

extern struct Process *D_802AC33C;
extern struct Process *D_802AC340;
extern struct Process *D_802AC344; // current task
extern struct Process *D_802AC348; // previous task
extern s32 D_802AC34C;
extern u32 D_802AC350;
extern s32 D_802AC354;
extern u32 D_802AC35C;
extern jmp_buf D_802AC368;

void func_8023946C(void);
void func_80239430(void);
void HuPrcCall(void);
s32 func_80239208(struct Process *arg0);
s32 func_802391F0(void);
s32 func_802391A4(void);
s32 func_802390F0(s32 arg0, s32 arg1, s32 arg2);
void func_802390B4(void);
void func_80239094(void);
s32 func_8023903C(s32 arg0);
s32 func_80238FF4(s32 arg0);
u16 func_80238FDC(void);
s32 func_80238F40(s32 arg0, s32 arg1);
s32 HuPrcTerminate(s32 arg0);
s32 func_80238DFC(s32 arg0, s32 arg1, u32 arg2);
s32 func_80238D98(u16 arg0, s32 arg1);
s32 func_80238CF8(s32 arg0, s32 arg1);
s32 func_80238C68(u16 arg0);
struct Process *func_80238C08(u16 arg0);
s32 func_80238BDC(void);
void func_80238B9C(void *func, s32 arg1, void* arg2, s32 arg3, u16 pri);
s32 HuPrcCreate(void *func, s32 arg1, void* arg2, s32 arg3, u16 pri);
void func_80238994(struct Process* arg0);
void func_8023897C(struct Process* arg0);
struct Process *func_80238918(u16 arg0);
void func_802388E8(struct Process* arg0, struct Process* arg1);
void func_802388C0(void);

#endif // __BM64_PROCESS_H__
