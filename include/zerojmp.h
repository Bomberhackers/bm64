// defined before ultra64.h.

#ifndef _ZEROJMP_H_
#define _ZEROJMP_H_

#define ZEROJMP_SECCALL_TABLE_ID 0
#define ZEROJMP_OS_TABLE_ID      1
#define ZEROJMP_DMA_TABLE_ID     2
#define ZEROJMP_OVL_TABLE_ID     3
// ID 4 Unknown
// ID 5 Unknown
#define ZEROJMP_VI_TABLE_ID      6
#define ZEROJMP_AI_TABLE_ID      7
#define ZEROJMP_DP_TABLE_ID      8
#define ZEROJMP_PI_TABLE_ID      9
#define ZEROJMP_CONT_TABLE_ID    10
// ID 11 Unknown
// ID 12 Unknown
// ID 13 Unknown
// ID 14 Unknown
// ID 15 Unknown
// ID 16 Unknown
// ID 17 Unknown
#define ZEROJMP_SYS_TABLE_ID     18
#define ZEROJMP_AL_TABLE_ID      19
// ID 20 Unknown
// ID 21 Unknown
#define ZEROJMP_PFS_TABLE_ID     22
// ID 23 Unknown
// ID 24 Unknown
// ID 25 Unknown
// ID 26 Unknown
// ID 27 Unknown
// ID 28 Unknown
// ID 29 Unknown
// ID 30 Unknown
// ID 31 Unknown
// ID 32 Unknown
// ID 33 Unknown

// FUNCTION TABLES
extern unsigned long gZeroJmpFuncs[]; // (ID: 0) ZeroJmp ?
extern unsigned long gOSFuncs[]; // (ID: 1) OS functions
extern unsigned long gDMAFuncs[]; // (ID: 2) DMA
extern unsigned long gOVLFuncs[]; // (ID: 3) Overlay load/exec?
extern unsigned long D_8029F570[]; // (ID: 4) Unknown
extern unsigned long D_8029F590[]; // (ID: 5) Unknown
extern unsigned long gVIFuncs[]; // (ID: 6) VI
extern unsigned long gAIFuncs[]; // (ID: 7) AI
extern unsigned long gDPFuncs[]; // (ID: 8) DP
extern unsigned long gPIFuncs[]; // (ID: 9) PI
extern unsigned long gContFuncs[]; // (ID: 10) CONT
// ID 11 Unknown
// ID 12 Unknown
// ID 13 Unknown
// ID 14 Unknown
// ID 15 Unknown
// ID 16 Unknown
// ID 17 Unknown
extern unsigned long gSysFuncs[]; // (ID: 18) SYS (sort of treated like a misc)
extern unsigned long gAlFuncs[]; // (ID: 19) AL
// ID 20 Unknown
// ID 21 Unknown
extern unsigned long gPfsFuncs[]; // (ID: 22) PFS
// ID 23 Unknown
// ID 24 Unknown
extern unsigned long D_802A0100[];
// ID 26 Unknown
// ID 27 Unknown
// ID 28 Unknown
// ID 29 Unknown
// ID 30 Unknown
// ID 31 Unknown
// ID 32 Unknown
extern unsigned long D_8029F820[];

#endif // _ZEROJMP_H_
