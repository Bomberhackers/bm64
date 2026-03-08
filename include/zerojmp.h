// defined before ultra64.h.

#ifndef _ZEROJMP_H_
#define _ZEROJMP_H_

#define ZEROJMP_SECCALL_TABLE_ID   0
#define ZEROJMP_OS_TABLE_ID        1
#define ZEROJMP_DMA_TABLE_ID       2
#define ZEROJMP_OVL_TABLE_ID       3
// ID 4 Unknown
#define ZEROJMP_LIBMALLOC_TABLE_ID 5
#define ZEROJMP_VI_TABLE_ID        6
#define ZEROJMP_AI_TABLE_ID        7
#define ZEROJMP_DP_TABLE_ID        8
#define ZEROJMP_PI_TABLE_ID        9
#define ZEROJMP_CONT_TABLE_ID      10
// ID 11 Unknown (possibly unused/unmapped)
// ID 12 Unknown
// ID 13 Unknown
// ID 14 Unknown
// ID 15 Unknown
// ID 16 Unknown
// ID 17 Unknown
#define ZEROJMP_SYS_TABLE_ID       18
#define ZEROJMP_AL_TABLE_ID        19
// ID 20 Unknown
// ID 21 Unknown
#define ZEROJMP_PFS_TABLE_ID       22
// ID 23 Unknown
// ID 24 Unknown
// ID 25 Unknown
// ID 26 Unknown
// ID 27 Unknown
// ID 28 Unknown
// ID 29 Unknown
// ID 30 Unknown
// ID 31 Unknown (possibly unused/unmapped)
// ID 32 Unknown
// ID 33 Unknown
// ID 34 Unknown
// ID 35 Unknown
// ID 36 Unknown
// ID 37 Unknown
// ID 38 Unknown
// ID 39 Unknown
// ID 40 Unknown
// ID 41 Unknown
// ID 42 Unknown
// ID 43 Unknown
// ID 44 Unknown
// ID 45 Unknown
// ID 46 Unknown
// ID 47 Unknown
// ID 48 Unknown
// ID 49 Unknown

// FUNCTION TABLES
extern unsigned long gZeroJmpFuncs[]; // (ID: 0) ZeroJmp
extern unsigned long gOSFuncs[]; // (ID: 1) OS functions
extern unsigned long gDMAFuncs[]; // (ID: 2) DMA
extern unsigned long gOVLFuncs[]; // (ID: 3) Overlay load/exec?
extern unsigned long D_8029F570[]; // (ID: 4) Unknown
extern unsigned long gLibmallocFuncs[]; // (ID: 5) libmalloc
extern unsigned long gVIFuncs[]; // (ID: 6) VI
extern unsigned long gAIFuncs[]; // (ID: 7) AI
extern unsigned long gDPFuncs[]; // (ID: 8) DP
extern unsigned long gPIFuncs[]; // (ID: 9) PI
extern unsigned long gContFuncs[]; // (ID: 10) CONT
extern unsigned long D_8029F5D0[]; // (ID: 11) Unknown
extern unsigned long D_802A0D50[]; // (ID: 12) Unknown
extern unsigned long D_802A1450[]; // (ID: 13) Unknown
extern unsigned long D_802A1610[]; // (ID: 14) Unknown
extern unsigned long D_802A0CF4[]; // (ID: 15) Unknown
extern unsigned long D_802A0E58[]; // (ID: 16) Unknown
// ID 17 Unknown (unused/unmapped)
extern unsigned long gSysFuncs[]; // (ID: 18) SYS (sort of treated like a misc)
extern unsigned long gAlFuncs[]; // (ID: 19) AL
extern unsigned long D_802A13D0[]; // (ID: 20) Unknown
extern unsigned long D_802A13E4[]; // (ID: 21) Unknown
extern unsigned long gPfsFuncs[]; // (ID: 22) PFS
extern unsigned long D_802A0050[]; // (ID: 23) Unknown
extern unsigned long D_8029FD40[]; // (ID: 24) Unknown
extern unsigned long D_802A0100[]; // (ID: 25) Unknown
extern unsigned long D_802A1B54[]; // (ID: 26) Unknown
extern unsigned long D_802A015C[]; // (ID: 27) Unknown
extern unsigned long D_802A1534[]; // (ID: 28) Unknown
extern unsigned long D_8029FE40[]; // (ID: 29) Unknown
extern unsigned long D_802A1C00[]; // (ID: 30) Unknown
// ID 31 Unknown (unused/unmapped)
extern unsigned long D_802A1A88[]; // (ID: 32) Unknown
extern unsigned long D_8029F820[]; // (ID: 33) Unknown
extern unsigned long D_8029F7C8[]; // (ID: 34) Unknown
extern unsigned long D_802A15AC[]; // (ID: 35) Unknown
extern unsigned long D_802A15DC[]; // (ID: 36) Unknown
extern unsigned long D_802A1A48[]; // (ID: 37) Unknown
extern unsigned long D_802A1CE4[]; // (ID: 38) Unknown
extern unsigned long D_802A14B8[]; // (ID: 39) Unknown
extern unsigned long D_802A1500[]; // (ID: 40) Unknown
extern unsigned long D_802A1D60[]; // (ID: 41) Unknown
extern unsigned long D_802A1AB4[]; // (ID: 42) Unknown
extern unsigned long D_802A1380[]; // (ID: 43) Unknown
extern unsigned long D_802A1D70[]; // (ID: 44) Unknown
extern unsigned long D_802A1184[]; // (ID: 45) Unknown
extern unsigned long D_802A1D00[]; // (ID: 46) Unknown
extern unsigned long D_802A1DBC[]; // (ID: 47) Unknown
extern unsigned long D_802A2C50[]; // (ID: 48) Unknown
extern unsigned long D_802A2CB0[]; // (ID: 49) Unknown

#endif // _ZEROJMP_H_
