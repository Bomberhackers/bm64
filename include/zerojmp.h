// defined before ultra64.h.

#ifndef _ZEROJMP_H_
#define _ZEROJMP_H_

#define ZEROJMP_OS_TABLE_ID   1
#define ZEROJMP_DMA_TABLE_ID  2
#define ZEROJMP_OVL_TABLE_ID  3
#define ZEROJMP_VI_TABLE_ID   6
#define ZEROJMP_AI_TABLE_ID   7
#define ZEROJMP_DP_TABLE_ID   8
#define ZEROJMP_PI_TABLE_ID   9
#define ZEROJMP_CONT_TABLE_ID 10
#define ZEROJMP_SYS_TABLE_ID  18
#define ZEROJMP_AL_TABLE_ID   19
#define ZEROJMP_PFS_TABLE_ID  22

// FUNCTION TABLES
extern unsigned long gZeroJmpFuncs[]; // (ID: 0) ZeroJmp ?
extern unsigned long gOSFuncs[]; // (ID: 1) OS functions
extern unsigned long gDMAFuncs[]; // (ID: 2) DMA
extern unsigned long gOVLFuncs[]; // (ID: 3) Overlay load/exec?
extern unsigned long gVIFuncs[]; // (ID: 6) VI
extern unsigned long gAIFuncs[]; // (ID: 7) AI
extern unsigned long gDPFuncs[]; // (ID: 8) DP
extern unsigned long gPIFuncs[]; // (ID: 9) PI
extern unsigned long gContFuncs[]; // (ID: 10) CONT
extern unsigned long gSysFuncs[]; // (ID: 18) SYS (sort of treated like a misc)
extern unsigned long gAlFuncs[]; // (ID: 19) AL
extern unsigned long gPfsFuncs[]; // (ID: 22) PFS

#endif // _ZEROJMP_H_
