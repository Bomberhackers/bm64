#ifndef _MAIN_H_
#define _MAIN_H_

void Main_ThreadSetupGame(void *arg);
void __assert(const char* exp, const char* filename, int line);
s32 func_800018B8(f32 arg0);
void func_800018C4(s32 arg0);
void func_800018CC(s32 arg0, s32 arg1, ...);
void func_800018E8(s32 arg0, s32 arg1, s32 arg2);
void func_800018F8(s32 arg0, s32 arg1, ...);
void Main_InitThread(void *arg);
void n64main(void);
void Main_SetPanOverride(s8 c);
s32 Main_GetTvType(void);

#endif // _MAIN_H_
