.include "macro.inc"

.set noat
.set noreorder
.set gp=64

.section .text, "ax"

.macro zerojmp_func_first func area_suffix numberArg
glabel \func\()__\area_suffix\()__secure_call
    jr $zero
    move $t0, \numberArg
endlabel \func\()__\area_suffix\()__secure_call
.endm

.macro zerojmp_func func area_suffix numberArg
glabel \func\()__\area_suffix\()__secure_call
    jr $zero
    addiu $t0, $zero, \numberArg
endlabel \func\()__\area_suffix\()__secure_call
.endm

// TODO: Include a zerojmp ID file and use those
zerojmp_func_first set_secure_call_arr, ZEROJMP_AREA, $zero
zerojmp_func func_800018F8, ZEROJMP_AREA, 0x100
zerojmp_func sprintf, ZEROJMP_AREA, 0x101
zerojmp_func osVirtualToPhysical, ZEROJMP_AREA, 0x102
zerojmp_func osInvalDCache, ZEROJMP_AREA, 0x103
zerojmp_func osInvalICache, ZEROJMP_AREA, 0x104
zerojmp_func osWritebackDCache, ZEROJMP_AREA, 0x105
zerojmp_func osWritebackDCacheAll, ZEROJMP_AREA, 0x106
zerojmp_func osSpTaskLoad, ZEROJMP_AREA, 0x107
zerojmp_func osSpTaskStartGo, ZEROJMP_AREA, 0x108
zerojmp_func osCreateMesgQueue, ZEROJMP_AREA, 0x109
zerojmp_func osSetEventMesg, ZEROJMP_AREA, 0x10A
zerojmp_func osRecvMesg, ZEROJMP_AREA, 0x10B
zerojmp_func osSendMesg, ZEROJMP_AREA, 0x10C
zerojmp_func osJamMesg, ZEROJMP_AREA, 0x10D
zerojmp_func osCreateThread, ZEROJMP_AREA, 0x10E
zerojmp_func osStartThread, ZEROJMP_AREA, 0x10F
zerojmp_func osStopThread, ZEROJMP_AREA, 0x110
zerojmp_func osYieldThread, ZEROJMP_AREA, 0x111
zerojmp_func osDestroyThread, ZEROJMP_AREA, 0x112
zerojmp_func osGetThreadPri, ZEROJMP_AREA, 0x113
zerojmp_func osSetThreadPri, ZEROJMP_AREA, 0x114
zerojmp_func osGetThreadId, ZEROJMP_AREA, 0x115
zerojmp_func osCreateScheduler, ZEROJMP_AREA, 0x116
zerojmp_func osScAddClient, ZEROJMP_AREA, 0x117
zerojmp_func osScRemoveClient, ZEROJMP_AREA, 0x118
zerojmp_func osScGetCmdQ, ZEROJMP_AREA, 0x119
zerojmp_func osCreatePiManager, ZEROJMP_AREA, 0x11A
zerojmp_func func_800018E8, ZEROJMP_AREA, 0x11B
zerojmp_func func_800018CC, ZEROJMP_AREA, 0x11C
zerojmp_func func_800018C4, ZEROJMP_AREA, 0x11D
zerojmp_func func_800018B8, ZEROJMP_AREA, 0x11E
zerojmp_func func_80001698, ZEROJMP_AREA, 0x11F
zerojmp_func osGetTime, ZEROJMP_AREA, 0x120
zerojmp_func osSetTime, ZEROJMP_AREA, 0x121
zerojmp_func osSetTimer, ZEROJMP_AREA, 0x122
zerojmp_func osStopTimer, ZEROJMP_AREA, 0x123
zerojmp_func osGetCount, ZEROJMP_AREA, 0x124
zerojmp_func osEepromProbe, ZEROJMP_AREA, 0x125
zerojmp_func osEepromRead, ZEROJMP_AREA, 0x126
zerojmp_func osEepromWrite, ZEROJMP_AREA, 0x127
zerojmp_func osEepromLongRead, ZEROJMP_AREA, 0x128
zerojmp_func osEepromLongWrite, ZEROJMP_AREA, 0x129
zerojmp_func osMotorInit, ZEROJMP_AREA, 0x12A
zerojmp_func osMotorStop, ZEROJMP_AREA, 0x12B
zerojmp_func osMotorStart, ZEROJMP_AREA, 0x12C
zerojmp_func osGetIntMask, ZEROJMP_AREA, 0x12D
zerojmp_func osSetIntMask, ZEROJMP_AREA, 0x12E
zerojmp_func func_80000768, ZEROJMP_AREA, 0x200
zerojmp_func func_800004D0, ZEROJMP_AREA, 0x201
zerojmp_func load_from_rom_to_addr, ZEROJMP_AREA, 0x202
zerojmp_func func_8000064C, ZEROJMP_AREA, 0x203
zerojmp_func func_8000059C, ZEROJMP_AREA, 0x204
zerojmp_func func_80000524, ZEROJMP_AREA, 0x205
zerojmp_func func_800007F0, ZEROJMP_AREA, 0x300
zerojmp_func func_8000083C, ZEROJMP_AREA, 0x301
zerojmp_func func_802266E8, ZEROJMP_AREA, 0x400
zerojmp_func func_80226604, ZEROJMP_AREA, 0x401
zerojmp_func func_80226368, ZEROJMP_AREA, 0x402
zerojmp_func func_8022616C, ZEROJMP_AREA, 0x403
zerojmp_func func_80225FB8, ZEROJMP_AREA, 0x404
zerojmp_func func_80225CCC, ZEROJMP_AREA, 0x405
zerojmp_func func_80225CC0, ZEROJMP_AREA, 0x406
zerojmp_func func_802266DC, ZEROJMP_AREA, 0x407
zerojmp_func func_802998EC, ZEROJMP_AREA, 0x500
zerojmp_func func_8029ADCC, ZEROJMP_AREA, 0x501
zerojmp_func __osGetActiveQueue, ZEROJMP_AREA, 0x600
zerojmp_func osViGetCurrentMode, ZEROJMP_AREA, 0x601
zerojmp_func osViGetCurrentLine, ZEROJMP_AREA, 0x602
zerojmp_func osViGetCurrentField, ZEROJMP_AREA, 0x603
zerojmp_func osViGetCurrentFramebuffer, ZEROJMP_AREA, 0x604
zerojmp_func osViGetNextFramebuffer, ZEROJMP_AREA, 0x605
zerojmp_func osViSetXScale, ZEROJMP_AREA, 0x606
zerojmp_func osViSetYScale, ZEROJMP_AREA, 0x607
zerojmp_func osViSetSpecialFeatures, ZEROJMP_AREA, 0x608
zerojmp_func osViSetMode, ZEROJMP_AREA, 0x609
zerojmp_func osViSetEvent, ZEROJMP_AREA, 0x60A
zerojmp_func osViSwapBuffer, ZEROJMP_AREA, 0x60B
zerojmp_func osViBlack, ZEROJMP_AREA, 0x60C
zerojmp_func osViFade, ZEROJMP_AREA, 0x60D
zerojmp_func osAiGetStatus, ZEROJMP_AREA, 0x700
zerojmp_func osAiGetLength, ZEROJMP_AREA, 0x701
zerojmp_func osAiSetFrequency, ZEROJMP_AREA, 0x702
zerojmp_func osAiSetNextBuffer, ZEROJMP_AREA, 0x703
zerojmp_func osDpGetStatus, ZEROJMP_AREA, 0x800
zerojmp_func osDpSetStatus, ZEROJMP_AREA, 0x801
zerojmp_func osDpGetCounters, ZEROJMP_AREA, 0x802
zerojmp_func osDpSetNextBuffer, ZEROJMP_AREA, 0x803
zerojmp_func osPiGetStatus, ZEROJMP_AREA, 0x900
zerojmp_func osPiGetDeviceType, ZEROJMP_AREA, 0x901
zerojmp_func osPiRawWriteIo, ZEROJMP_AREA, 0x902
zerojmp_func osPiRawReadIo, ZEROJMP_AREA, 0x903
zerojmp_func osPiRawStartDma, ZEROJMP_AREA, 0x904
zerojmp_func osPiWriteIo, ZEROJMP_AREA, 0x905
zerojmp_func osPiReadIo, ZEROJMP_AREA, 0x906
zerojmp_func osPiStartDma, ZEROJMP_AREA, 0x907
zerojmp_func osContInit, ZEROJMP_AREA, 0xA00
zerojmp_func osContStartReadData, ZEROJMP_AREA, 0xA01
zerojmp_func osContGetReadData, ZEROJMP_AREA, 0xA02
zerojmp_func osContReset, ZEROJMP_AREA, 0xA03
zerojmp_func osContStartQuery, ZEROJMP_AREA, 0xA04
zerojmp_func osContSetCh, ZEROJMP_AREA, 0xA05
zerojmp_func osContGetQuery, ZEROJMP_AREA, 0xA06
zerojmp_func func_8022691C, ZEROJMP_AREA, 0xB00
zerojmp_func func_802268F4, ZEROJMP_AREA, 0xB01
zerojmp_func func_80243BA8, ZEROJMP_AREA, 0xC00
zerojmp_func func_80243A50, ZEROJMP_AREA, 0xC01
zerojmp_func func_802438BC, ZEROJMP_AREA, 0xC02
zerojmp_func func_8026FF64, ZEROJMP_AREA, 0xD00
zerojmp_func func_8026F068, ZEROJMP_AREA, 0xD01
zerojmp_func func_8026E8B8, ZEROJMP_AREA, 0xD02
zerojmp_func func_8026ECE8, ZEROJMP_AREA, 0xD03
zerojmp_func func_8026D620, ZEROJMP_AREA, 0xD04
zerojmp_func func_8026DA2C, ZEROJMP_AREA, 0xD05
zerojmp_func func_8026DB88, ZEROJMP_AREA, 0xD06
zerojmp_func func_8026DA1C, ZEROJMP_AREA, 0xD07
zerojmp_func func_8026DCAC, ZEROJMP_AREA, 0xD08
zerojmp_func func_8026E338, ZEROJMP_AREA, 0xD09
zerojmp_func func_8026DC74, ZEROJMP_AREA, 0xD0A
zerojmp_func func_8026D7D8, ZEROJMP_AREA, 0xD0B
zerojmp_func func_8026FC08, ZEROJMP_AREA, 0xD0C
zerojmp_func func_8026F8B0, ZEROJMP_AREA, 0xD0D
zerojmp_func func_8026E6E4, ZEROJMP_AREA, 0xD0E
zerojmp_func func_8026DF74, ZEROJMP_AREA, 0xD0F
zerojmp_func func_8026E8C8, ZEROJMP_AREA, 0xD10
zerojmp_func func_8026E2B0, ZEROJMP_AREA, 0xD11
zerojmp_func func_8026D92C, ZEROJMP_AREA, 0xD12
zerojmp_func func_8026D6C0, ZEROJMP_AREA, 0xD13
zerojmp_func func_8026D5B4, ZEROJMP_AREA, 0xD14
zerojmp_func func_8026E938, ZEROJMP_AREA, 0xD15
zerojmp_func func_8026FF94, ZEROJMP_AREA, 0xD16
zerojmp_func func_8027FC78, ZEROJMP_AREA, 0xE00
zerojmp_func func_8027FB18, ZEROJMP_AREA, 0xE01
zerojmp_func func_8027F88C, ZEROJMP_AREA, 0xE02
zerojmp_func func_8027F84C, ZEROJMP_AREA, 0xE03
zerojmp_func func_8027F9E4, ZEROJMP_AREA, 0xE04
zerojmp_func func_8023AE6C, ZEROJMP_AREA, 0xF00
zerojmp_func func_80243800, ZEROJMP_AREA, 0xF01
zerojmp_func func_802437E0, ZEROJMP_AREA, 0xF02
zerojmp_func func_802437C0, ZEROJMP_AREA, 0xF03
zerojmp_func func_8023C374, ZEROJMP_AREA, 0xF04
zerojmp_func func_8023E8AC, ZEROJMP_AREA, 0xF05
zerojmp_func func_8023E1D8, ZEROJMP_AREA, 0xF06
zerojmp_func func_8023BBCC, ZEROJMP_AREA, 0xF07
zerojmp_func func_8024368C, ZEROJMP_AREA, 0xF08
zerojmp_func func_8023A870, ZEROJMP_AREA, 0xF09
zerojmp_func func_8023A84C, ZEROJMP_AREA, 0xF0A
zerojmp_func func_8023A840, ZEROJMP_AREA, 0xF0B
zerojmp_func func_8023DA04, ZEROJMP_AREA, 0xF0C
zerojmp_func func_80243718, ZEROJMP_AREA, 0xF0D
zerojmp_func func_8023A864, ZEROJMP_AREA, 0xF0E
zerojmp_func func_80243698, ZEROJMP_AREA, 0xF0F
zerojmp_func func_8023A858, ZEROJMP_AREA, 0xF10
zerojmp_func func_8023A834, ZEROJMP_AREA, 0xF11
zerojmp_func func_80243810, ZEROJMP_AREA, 0xF12
zerojmp_func func_8023AA78, ZEROJMP_AREA, 0xF13
zerojmp_func func_8023AA60, ZEROJMP_AREA, 0xF14
zerojmp_func func_8023AED0, ZEROJMP_AREA, 0xF15
zerojmp_func func_8023A734, ZEROJMP_AREA, 0xF16
zerojmp_func func_80245CDC, ZEROJMP_AREA, 0x1000
zerojmp_func func_802512C0, ZEROJMP_AREA, 0x1001
zerojmp_func func_8024557C, ZEROJMP_AREA, 0x1002
zerojmp_func func_802457D8, ZEROJMP_AREA, 0x1003
zerojmp_func func_802456FC, ZEROJMP_AREA, 0x1004
zerojmp_func func_802455A8, ZEROJMP_AREA, 0x1005
zerojmp_func func_80243DDC, ZEROJMP_AREA, 0x1006
zerojmp_func func_80250338, ZEROJMP_AREA, 0x1007
zerojmp_func func_802452E8, ZEROJMP_AREA, 0x1008
zerojmp_func func_80245F74, ZEROJMP_AREA, 0x1009
zerojmp_func func_8024A824, ZEROJMP_AREA, 0x100A
zerojmp_func func_802506B8, ZEROJMP_AREA, 0x100B
zerojmp_func func_802511C4, ZEROJMP_AREA, 0x100C
zerojmp_func func_80250E2C, ZEROJMP_AREA, 0x100D
zerojmp_func func_802450DC, ZEROJMP_AREA, 0x100E
zerojmp_func func_80250DC8, ZEROJMP_AREA, 0x100F
zerojmp_func func_80245DFC, ZEROJMP_AREA, 0x1010
zerojmp_func func_802511EC, ZEROJMP_AREA, 0x1011
zerojmp_func func_802443F4, ZEROJMP_AREA, 0x1012
zerojmp_func func_80245280, ZEROJMP_AREA, 0x1013
zerojmp_func func_80243F50, ZEROJMP_AREA, 0x1014
zerojmp_func func_802443A0, ZEROJMP_AREA, 0x1015
zerojmp_func func_80244308, ZEROJMP_AREA, 0x1016
zerojmp_func func_802442F8, ZEROJMP_AREA, 0x1017
zerojmp_func func_8024585C, ZEROJMP_AREA, 0x1018
zerojmp_func func_802442D0, ZEROJMP_AREA, 0x1019
zerojmp_func func_802442A8, ZEROJMP_AREA, 0x101A
zerojmp_func func_80243F2C, ZEROJMP_AREA, 0x101B
zerojmp_func func_802444B8, ZEROJMP_AREA, 0x101C
zerojmp_func func_8025068C, ZEROJMP_AREA, 0x101D
zerojmp_func func_80243DEC, ZEROJMP_AREA, 0x101E
zerojmp_func func_80243E60, ZEROJMP_AREA, 0x101F
zerojmp_func func_802510C8, ZEROJMP_AREA, 0x1020
zerojmp_func func_80243D7C, ZEROJMP_AREA, 0x1021
zerojmp_func func_80243D54, ZEROJMP_AREA, 0x1022
zerojmp_func func_80243D2C, ZEROJMP_AREA, 0x1023
zerojmp_func func_80243D20, ZEROJMP_AREA, 0x1024
zerojmp_func func_802441AC, ZEROJMP_AREA, 0x1025
zerojmp_func ID_17_UNDEFINED_FUNC_1, ZEROJMP_AREA, 0x1100
zerojmp_func ID_17_UNDEFINED_FUNC_2, ZEROJMP_AREA, 0x1101
zerojmp_func ID_17_UNDEFINED_FUNC_3, ZEROJMP_AREA, 0x1102
zerojmp_func __d_to_ll, ZEROJMP_AREA, 0x1200
zerojmp_func __ll_to_d, ZEROJMP_AREA, 0x1201
zerojmp_func __ull_to_f, ZEROJMP_AREA, 0x1202
zerojmp_func __f_to_ull, ZEROJMP_AREA, 0x1203
zerojmp_func __ull_to_d, ZEROJMP_AREA, 0x1204
zerojmp_func func_800018A8, ZEROJMP_AREA, 0x1205
zerojmp_func __osGetCurrFaultedThread, ZEROJMP_AREA, 0x1206
zerojmp_func func_80001A04, ZEROJMP_AREA, 0x1207
zerojmp_func func_80001A14, ZEROJMP_AREA, 0x1208
zerojmp_func alUnlink, ZEROJMP_AREA, 0x1300
zerojmp_func alLink, ZEROJMP_AREA, 0x1301
zerojmp_func alCopy, ZEROJMP_AREA, 0x1302
zerojmp_func alHeapInit, ZEROJMP_AREA, 0x1303
zerojmp_func alHeapDBAlloc, ZEROJMP_AREA, 0x1304
zerojmp_func alHeapCheck, ZEROJMP_AREA, 0x1305
zerojmp_func alBnkfNew, ZEROJMP_AREA, 0x1306
zerojmp_func alSeqFileNew, ZEROJMP_AREA, 0x1307
zerojmp_func alSynNew, ZEROJMP_AREA, 0x1308
zerojmp_func alSynDelete, ZEROJMP_AREA, 0x1309
zerojmp_func alSynAddPlayer, ZEROJMP_AREA, 0x130A
zerojmp_func alSynRemovePlayer, ZEROJMP_AREA, 0x130B
zerojmp_func alSynAllocVoice, ZEROJMP_AREA, 0x130C
zerojmp_func alSynFreeVoice, ZEROJMP_AREA, 0x130D
zerojmp_func alSynStartVoice, ZEROJMP_AREA, 0x130E
zerojmp_func alSynStartVoiceParams, ZEROJMP_AREA, 0x130F
zerojmp_func alSynStopVoice, ZEROJMP_AREA, 0x1310
zerojmp_func alSynSetVol, ZEROJMP_AREA, 0x1311
zerojmp_func alSynSetPitch, ZEROJMP_AREA, 0x1312
zerojmp_func alSynSetPan, ZEROJMP_AREA, 0x1313
zerojmp_func alSynSetFXMix, ZEROJMP_AREA, 0x1314
zerojmp_func alSynSetPriority, ZEROJMP_AREA, 0x1315
zerojmp_func alSynGetPriority, ZEROJMP_AREA, 0x1316
zerojmp_func alSynAllocFX, ZEROJMP_AREA, 0x1317
zerojmp_func alSynGetFXRef, ZEROJMP_AREA, 0x1318
zerojmp_func alSynFreeFX, ZEROJMP_AREA, 0x1319
zerojmp_func alSynSetFXParam, ZEROJMP_AREA, 0x131A
zerojmp_func alInit, ZEROJMP_AREA, 0x131B
zerojmp_func alClose, ZEROJMP_AREA, 0x131C
zerojmp_func alAudioFrame, ZEROJMP_AREA, 0x131D
zerojmp_func alEvtqNew, ZEROJMP_AREA, 0x131E
zerojmp_func alEvtqNextEvent, ZEROJMP_AREA, 0x131F
zerojmp_func alEvtqPostEvent, ZEROJMP_AREA, 0x1320
zerojmp_func alEvtqFlush, ZEROJMP_AREA, 0x1321
zerojmp_func alEvtqFlushType, ZEROJMP_AREA, 0x1322
zerojmp_func alSeqNew, ZEROJMP_AREA, 0x1323
zerojmp_func alSeqNextEvent, ZEROJMP_AREA, 0x1324
zerojmp_func alSeqGetTicks, ZEROJMP_AREA, 0x1325
zerojmp_func alSeqTicksToSec, ZEROJMP_AREA, 0x1326
zerojmp_func alSeqSecToTicks, ZEROJMP_AREA, 0x1327
zerojmp_func alSeqNewMarker, ZEROJMP_AREA, 0x1328
zerojmp_func alSeqSetLoc, ZEROJMP_AREA, 0x1329
zerojmp_func alSeqGetLoc, ZEROJMP_AREA, 0x132A
zerojmp_func alCSeqNew, ZEROJMP_AREA, 0x132B
zerojmp_func alCSeqNextEvent, ZEROJMP_AREA, 0x132C
zerojmp_func alCSeqGetTicks, ZEROJMP_AREA, 0x132D
zerojmp_func alCSeqTicksToSec, ZEROJMP_AREA, 0x132E
zerojmp_func alCSeqSecToTicks, ZEROJMP_AREA, 0x132F
zerojmp_func alCSeqNewMarker, ZEROJMP_AREA, 0x1330
zerojmp_func alCSeqSetLoc, ZEROJMP_AREA, 0x1331
zerojmp_func alCSeqGetLoc, ZEROJMP_AREA, 0x1332
zerojmp_func alCents2Ratio, ZEROJMP_AREA, 0x1333
zerojmp_func alSeqpNew, ZEROJMP_AREA, 0x1334
zerojmp_func alSeqpDelete, ZEROJMP_AREA, 0x1335
zerojmp_func alSeqpSetSeq, ZEROJMP_AREA, 0x1336
zerojmp_func alSeqpGetSeq, ZEROJMP_AREA, 0x1337
zerojmp_func alSeqpPlay, ZEROJMP_AREA, 0x1338
zerojmp_func alSeqpStop, ZEROJMP_AREA, 0x1339
zerojmp_func alSeqpGetState, ZEROJMP_AREA, 0x133A
zerojmp_func alSeqpSetBank, ZEROJMP_AREA, 0x133B
zerojmp_func alSeqpSetTempo, ZEROJMP_AREA, 0x133C
zerojmp_func alSeqpGetTempo, ZEROJMP_AREA, 0x133D
zerojmp_func alSeqpGetVol, ZEROJMP_AREA, 0x133E
zerojmp_func alSeqpSetVol, ZEROJMP_AREA, 0x133F
zerojmp_func alSeqpLoop, ZEROJMP_AREA, 0x1340
zerojmp_func alSeqpSetChlProgram, ZEROJMP_AREA, 0x1341
zerojmp_func alSeqpGetChlProgram, ZEROJMP_AREA, 0x1342
zerojmp_func alSeqpSetChlFXMix, ZEROJMP_AREA, 0x1343
zerojmp_func alSeqpGetChlFXMix, ZEROJMP_AREA, 0x1344
zerojmp_func alSeqpSetChlVol, ZEROJMP_AREA, 0x1345
zerojmp_func alSeqpGetChlVol, ZEROJMP_AREA, 0x1346
zerojmp_func alSeqpSetChlPan, ZEROJMP_AREA, 0x1347
zerojmp_func alSeqpGetChlPan, ZEROJMP_AREA, 0x1348
zerojmp_func alSeqpSetChlPriority, ZEROJMP_AREA, 0x1349
zerojmp_func alSeqpGetChlPriority, ZEROJMP_AREA, 0x134A
zerojmp_func alSeqpSendMidi, ZEROJMP_AREA, 0x134B
zerojmp_func func_8000B9A0, ZEROJMP_AREA, 0x134C
zerojmp_func func_8000BB10, ZEROJMP_AREA, 0x134D
zerojmp_func func_8000BB40, ZEROJMP_AREA, 0x134E
zerojmp_func func_8000BB80, ZEROJMP_AREA, 0x134F
zerojmp_func func_8000BB90, ZEROJMP_AREA, 0x1350
zerojmp_func func_8000BBC0, ZEROJMP_AREA, 0x1351
zerojmp_func func_8000BBF0, ZEROJMP_AREA, 0x1352
zerojmp_func func_8000BC00, ZEROJMP_AREA, 0x1353
zerojmp_func func_8000BC40, ZEROJMP_AREA, 0x1354
zerojmp_func alCSPGetTempo, ZEROJMP_AREA, 0x1355
zerojmp_func func_8000BCF0, ZEROJMP_AREA, 0x1356
zerojmp_func func_8000BD00, ZEROJMP_AREA, 0x1357
zerojmp_func func_8000BD40, ZEROJMP_AREA, 0x1358
zerojmp_func func_8000BDA0, ZEROJMP_AREA, 0x1359
zerojmp_func func_8000BE30, ZEROJMP_AREA, 0x135A
zerojmp_func func_8000BE90, ZEROJMP_AREA, 0x135B
zerojmp_func func_8000BEB0, ZEROJMP_AREA, 0x135C
zerojmp_func func_8000BF10, ZEROJMP_AREA, 0x135D
zerojmp_func func_8000BF30, ZEROJMP_AREA, 0x135E
zerojmp_func func_8000BF90, ZEROJMP_AREA, 0x135F
zerojmp_func func_8000BFB0, ZEROJMP_AREA, 0x1360
zerojmp_func func_8000C000, ZEROJMP_AREA, 0x1361
zerojmp_func func_8000C020, ZEROJMP_AREA, 0x1362
zerojmp_func alSndpNew, ZEROJMP_AREA, 0x1363
zerojmp_func alSndpDelete, ZEROJMP_AREA, 0x1364
zerojmp_func alSndpAllocate, ZEROJMP_AREA, 0x1365
zerojmp_func alSndpDeallocate, ZEROJMP_AREA, 0x1366
zerojmp_func alSndpSetSound, ZEROJMP_AREA, 0x1367
zerojmp_func alSndpGetSound, ZEROJMP_AREA, 0x1368
zerojmp_func alSndpPlay, ZEROJMP_AREA, 0x1369
zerojmp_func alSndpPlayAt, ZEROJMP_AREA, 0x136A
zerojmp_func alSndpStop, ZEROJMP_AREA, 0x136B
zerojmp_func alSndpSetVol, ZEROJMP_AREA, 0x136C
zerojmp_func alSndpSetPitch, ZEROJMP_AREA, 0x136D
zerojmp_func alSndpSetPan, ZEROJMP_AREA, 0x136E
zerojmp_func alSndpSetPriority, ZEROJMP_AREA, 0x136F
zerojmp_func alSndpSetFXMix, ZEROJMP_AREA, 0x1370
zerojmp_func alSndpGetState, ZEROJMP_AREA, 0x1371
zerojmp_func func_8026CE28, ZEROJMP_AREA, 0x1400
zerojmp_func func_8026CCBC, ZEROJMP_AREA, 0x1401
zerojmp_func func_8026D518, ZEROJMP_AREA, 0x1500
zerojmp_func func_8026D3AC, ZEROJMP_AREA, 0x1501
zerojmp_func func_8026D354, ZEROJMP_AREA, 0x1502
zerojmp_func func_8022946C, ZEROJMP_AREA, 0x1503
zerojmp_func func_8022A19C, ZEROJMP_AREA, 0x1504
zerojmp_func func_8022984C, ZEROJMP_AREA, 0x1505
zerojmp_func func_802297B8, ZEROJMP_AREA, 0x1506
zerojmp_func func_80229560, ZEROJMP_AREA, 0x1507
zerojmp_func func_80229F74, ZEROJMP_AREA, 0x1508
zerojmp_func func_80229E38, ZEROJMP_AREA, 0x1509
zerojmp_func func_8022A0D8, ZEROJMP_AREA, 0x150A
zerojmp_func func_80229D68, ZEROJMP_AREA, 0x150B
zerojmp_func func_80229D3C, ZEROJMP_AREA, 0x150C
zerojmp_func func_80229C90, ZEROJMP_AREA, 0x150D
zerojmp_func func_80229BF4, ZEROJMP_AREA, 0x150E
zerojmp_func func_8022979C, ZEROJMP_AREA, 0x150F
zerojmp_func func_8026D4B0, ZEROJMP_AREA, 0x1510
zerojmp_func func_8026D2A4, ZEROJMP_AREA, 0x1511
zerojmp_func func_802280F4, ZEROJMP_AREA, 0x1512
zerojmp_func func_80228008, ZEROJMP_AREA, 0x1513
zerojmp_func func_80227EE0, ZEROJMP_AREA, 0x1514
zerojmp_func func_80227FE8, ZEROJMP_AREA, 0x1515
zerojmp_func func_8026CFF4, ZEROJMP_AREA, 0x1516
zerojmp_func func_80229BB4, ZEROJMP_AREA, 0x1517
zerojmp_func osPfsInit, ZEROJMP_AREA, 0x1600
zerojmp_func osPfsReFormat, ZEROJMP_AREA, 0x1601
zerojmp_func osPfsChecker, ZEROJMP_AREA, 0x1602
zerojmp_func osPfsAllocateFile, ZEROJMP_AREA, 0x1603
zerojmp_func osPfsFindFile, ZEROJMP_AREA, 0x1604
zerojmp_func osPfsDeleteFile, ZEROJMP_AREA, 0x1605
zerojmp_func osPfsReadWriteFile, ZEROJMP_AREA, 0x1606
zerojmp_func osPfsFileState, ZEROJMP_AREA, 0x1607
zerojmp_func osPfsGetLabel, ZEROJMP_AREA, 0x1608
zerojmp_func osPfsSetLabel, ZEROJMP_AREA, 0x1609
zerojmp_func osPfsIsPlug, ZEROJMP_AREA, 0x160A
zerojmp_func osPfsFreeBlocks, ZEROJMP_AREA, 0x160B
zerojmp_func osPfsNumFiles, ZEROJMP_AREA, 0x160C
zerojmp_func func_8000FA20, ZEROJMP_AREA, 0x160D
zerojmp_func osPfsInitPak, ZEROJMP_AREA, 0x160E
zerojmp_func osPfsRepairId, ZEROJMP_AREA, 0x160F
zerojmp_func func_802350F8, ZEROJMP_AREA, 0x1700
zerojmp_func func_80234768, ZEROJMP_AREA, 0x1701
zerojmp_func func_80234F6C, ZEROJMP_AREA, 0x1702
zerojmp_func func_802348A4, ZEROJMP_AREA, 0x1703
zerojmp_func func_802346C8, ZEROJMP_AREA, 0x1704
zerojmp_func func_802348B4, ZEROJMP_AREA, 0x1705
zerojmp_func func_80234718, ZEROJMP_AREA, 0x1706
zerojmp_func func_80234900, ZEROJMP_AREA, 0x1707
zerojmp_func func_80234778, ZEROJMP_AREA, 0x1708
zerojmp_func func_80234858, ZEROJMP_AREA, 0x1709
zerojmp_func func_802375A4, ZEROJMP_AREA, 0x170A
zerojmp_func func_802358D0, ZEROJMP_AREA, 0x170B
zerojmp_func func_80236AEC, ZEROJMP_AREA, 0x170C
zerojmp_func func_80236ACC, ZEROJMP_AREA, 0x170D
zerojmp_func func_80235924, ZEROJMP_AREA, 0x170E
zerojmp_func func_8023640C, ZEROJMP_AREA, 0x170F
zerojmp_func func_802362D4, ZEROJMP_AREA, 0x1710
zerojmp_func func_802362B8, ZEROJMP_AREA, 0x1711
zerojmp_func func_802362A8, ZEROJMP_AREA, 0x1712
zerojmp_func func_80236218, ZEROJMP_AREA, 0x1713
zerojmp_func func_80236208, ZEROJMP_AREA, 0x1714
zerojmp_func func_802361FC, ZEROJMP_AREA, 0x1715
zerojmp_func func_802361F0, ZEROJMP_AREA, 0x1716
zerojmp_func func_802361E4, ZEROJMP_AREA, 0x1717
zerojmp_func func_80236180, ZEROJMP_AREA, 0x1718
zerojmp_func func_80236174, ZEROJMP_AREA, 0x1719
zerojmp_func func_802360D4, ZEROJMP_AREA, 0x171A
zerojmp_func func_80236048, ZEROJMP_AREA, 0x171B
zerojmp_func func_80235FE4, ZEROJMP_AREA, 0x171C
zerojmp_func func_80235FD8, ZEROJMP_AREA, 0x171D
zerojmp_func func_80236B7C, ZEROJMP_AREA, 0x171E
zerojmp_func func_80236B68, ZEROJMP_AREA, 0x171F
zerojmp_func func_80236B58, ZEROJMP_AREA, 0x1720
zerojmp_func func_80236B08, ZEROJMP_AREA, 0x1721
zerojmp_func func_80235114, ZEROJMP_AREA, 0x1722
zerojmp_func func_802351DC, ZEROJMP_AREA, 0x1723
zerojmp_func func_80235178, ZEROJMP_AREA, 0x1724
zerojmp_func func_80235208, ZEROJMP_AREA, 0x1725
zerojmp_func func_80237164, ZEROJMP_AREA, 0x1726
zerojmp_func func_80237264, ZEROJMP_AREA, 0x1727
zerojmp_func func_80237290, ZEROJMP_AREA, 0x1728
zerojmp_func func_802371C8, ZEROJMP_AREA, 0x1729
zerojmp_func func_80236084, ZEROJMP_AREA, 0x172A
zerojmp_func func_8022E3D4, ZEROJMP_AREA, 0x1800
zerojmp_func func_8022E330, ZEROJMP_AREA, 0x1801
zerojmp_func func_8022E364, ZEROJMP_AREA, 0x1802
zerojmp_func func_8022FF58, ZEROJMP_AREA, 0x1803
zerojmp_func func_8022FEAC, ZEROJMP_AREA, 0x1804
zerojmp_func func_80231D88, ZEROJMP_AREA, 0x1805
zerojmp_func func_8022DF68, ZEROJMP_AREA, 0x1806
zerojmp_func func_80232D18, ZEROJMP_AREA, 0x1807
zerojmp_func func_80232C74, ZEROJMP_AREA, 0x1808
zerojmp_func func_80232BD0, ZEROJMP_AREA, 0x1809
zerojmp_func func_8022E884, ZEROJMP_AREA, 0x180A
zerojmp_func func_80232A34, ZEROJMP_AREA, 0x180B
zerojmp_func func_80232AA8, ZEROJMP_AREA, 0x180C
zerojmp_func func_80232AC8, ZEROJMP_AREA, 0x180D
zerojmp_func func_80232B04, ZEROJMP_AREA, 0x180E
zerojmp_func func_80231D60, ZEROJMP_AREA, 0x180F
zerojmp_func func_8022FC0C, ZEROJMP_AREA, 0x1810
zerojmp_func func_80231408, ZEROJMP_AREA, 0x1811
zerojmp_func func_802313DC, ZEROJMP_AREA, 0x1812
zerojmp_func func_802313B0, ZEROJMP_AREA, 0x1813
zerojmp_func func_8022FC90, ZEROJMP_AREA, 0x1814
zerojmp_func func_80230CB4, ZEROJMP_AREA, 0x1815
zerojmp_func func_80231274, ZEROJMP_AREA, 0x1816
zerojmp_func func_80231244, ZEROJMP_AREA, 0x1817
zerojmp_func func_802311E8, ZEROJMP_AREA, 0x1818
zerojmp_func func_8023116C, ZEROJMP_AREA, 0x1819
zerojmp_func func_802310F4, ZEROJMP_AREA, 0x181A
zerojmp_func func_8023101C, ZEROJMP_AREA, 0x181B
zerojmp_func func_802310BC, ZEROJMP_AREA, 0x181C
zerojmp_func func_80231048, ZEROJMP_AREA, 0x181D
zerojmp_func func_80230E9C, ZEROJMP_AREA, 0x181E
zerojmp_func func_80230E6C, ZEROJMP_AREA, 0x181F
zerojmp_func func_80230AA0, ZEROJMP_AREA, 0x1820
zerojmp_func func_80230914, ZEROJMP_AREA, 0x1821
zerojmp_func func_802308B8, ZEROJMP_AREA, 0x1822
zerojmp_func func_8023085C, ZEROJMP_AREA, 0x1823
zerojmp_func func_80230800, ZEROJMP_AREA, 0x1824
zerojmp_func func_80230790, ZEROJMP_AREA, 0x1825
zerojmp_func func_80230720, ZEROJMP_AREA, 0x1826
zerojmp_func func_802306B0, ZEROJMP_AREA, 0x1827
zerojmp_func func_80230440, ZEROJMP_AREA, 0x1828
zerojmp_func func_802303C0, ZEROJMP_AREA, 0x1829
zerojmp_func func_80230340, ZEROJMP_AREA, 0x182A
zerojmp_func func_8022F808, ZEROJMP_AREA, 0x182B
zerojmp_func func_80232BA0, ZEROJMP_AREA, 0x182C
zerojmp_func func_8022FEA0, ZEROJMP_AREA, 0x182D
zerojmp_func func_8022FE94, ZEROJMP_AREA, 0x182E
zerojmp_func func_8022FA88, ZEROJMP_AREA, 0x182F
zerojmp_func func_8022FA10, ZEROJMP_AREA, 0x1830
zerojmp_func func_8022F998, ZEROJMP_AREA, 0x1831
zerojmp_func func_8022F77C, ZEROJMP_AREA, 0x1832
zerojmp_func func_80232DB4, ZEROJMP_AREA, 0x1833
zerojmp_func func_8022F550, ZEROJMP_AREA, 0x1834
zerojmp_func func_8022F4AC, ZEROJMP_AREA, 0x1835
zerojmp_func func_8022F698, ZEROJMP_AREA, 0x1836
zerojmp_func func_8022DDB4, ZEROJMP_AREA, 0x1837
zerojmp_func func_8022DE6C, ZEROJMP_AREA, 0x1838
zerojmp_func func_8022DE00, ZEROJMP_AREA, 0x1839
zerojmp_func func_8022DBBC, ZEROJMP_AREA, 0x183A
zerojmp_func func_80238B9C, ZEROJMP_AREA, 0x1900
zerojmp_func func_80238EA8, ZEROJMP_AREA, 0x1901
zerojmp_func func_80239430, ZEROJMP_AREA, 0x1902
zerojmp_func func_80238D98, ZEROJMP_AREA, 0x1903
zerojmp_func func_8023903C, ZEROJMP_AREA, 0x1904
zerojmp_func func_802391F0, ZEROJMP_AREA, 0x1905
zerojmp_func func_802391A4, ZEROJMP_AREA, 0x1906
zerojmp_func func_802390B4, ZEROJMP_AREA, 0x1907
zerojmp_func func_802390F0, ZEROJMP_AREA, 0x1908
zerojmp_func func_80239094, ZEROJMP_AREA, 0x1909
zerojmp_func func_80238FF4, ZEROJMP_AREA, 0x190A
zerojmp_func func_80238FDC, ZEROJMP_AREA, 0x190B
zerojmp_func func_80238C68, ZEROJMP_AREA, 0x190C
zerojmp_func func_80238F40, ZEROJMP_AREA, 0x190D
zerojmp_func func_80238DFC, ZEROJMP_AREA, 0x190E
zerojmp_func func_80238CF8, ZEROJMP_AREA, 0x190F
zerojmp_func func_80238BDC, ZEROJMP_AREA, 0x1910
zerojmp_func func_80287DC0, ZEROJMP_AREA, 0x1A00
zerojmp_func func_8028773C, ZEROJMP_AREA, 0x1A01
zerojmp_func func_802878E0, ZEROJMP_AREA, 0x1A02
zerojmp_func func_802878BC, ZEROJMP_AREA, 0x1A03
zerojmp_func func_8023A3AC, ZEROJMP_AREA, 0x1B00
zerojmp_func func_8023A0A0, ZEROJMP_AREA, 0x1B01
zerojmp_func func_8023A088, ZEROJMP_AREA, 0x1B02
zerojmp_func func_8023A070, ZEROJMP_AREA, 0x1B03
zerojmp_func func_8023A058, ZEROJMP_AREA, 0x1B04
zerojmp_func func_8023A038, ZEROJMP_AREA, 0x1B05
zerojmp_func func_80239FF8, ZEROJMP_AREA, 0x1B06
zerojmp_func func_802399AC, ZEROJMP_AREA, 0x1B07
zerojmp_func func_80239F70, ZEROJMP_AREA, 0x1B08
zerojmp_func func_80239EE8, ZEROJMP_AREA, 0x1B09
zerojmp_func func_80239CC8, ZEROJMP_AREA, 0x1B0A
zerojmp_func func_80239E88, ZEROJMP_AREA, 0x1B0B
zerojmp_func func_80239E28, ZEROJMP_AREA, 0x1B0C
zerojmp_func func_80239714, ZEROJMP_AREA, 0x1B0D
zerojmp_func func_802395A8, ZEROJMP_AREA, 0x1B0E
zerojmp_func func_80239D6C, ZEROJMP_AREA, 0x1B0F
zerojmp_func func_80239880, ZEROJMP_AREA, 0x1B10
zerojmp_func func_80239570, ZEROJMP_AREA, 0x1B11
zerojmp_func func_8027CDA4, ZEROJMP_AREA, 0x1C00
zerojmp_func func_8027CBD4, ZEROJMP_AREA, 0x1C01
zerojmp_func func_8027C88C, ZEROJMP_AREA, 0x1C02
zerojmp_func func_8027C788, ZEROJMP_AREA, 0x1C03
zerojmp_func func_8027C8A4, ZEROJMP_AREA, 0x1C04
zerojmp_func func_8027BF38, ZEROJMP_AREA, 0x1C05
zerojmp_func func_8027BEF0, ZEROJMP_AREA, 0x1C06
zerojmp_func func_8027BEC0, ZEROJMP_AREA, 0x1C07
zerojmp_func func_8027BE60, ZEROJMP_AREA, 0x1C08
zerojmp_func func_8027C900, ZEROJMP_AREA, 0x1C09
zerojmp_func func_8027BE28, ZEROJMP_AREA, 0x1C0A
zerojmp_func func_8027BD68, ZEROJMP_AREA, 0x1C0B
zerojmp_func func_8027C96C, ZEROJMP_AREA, 0x1C0C
zerojmp_func func_8027C5E0, ZEROJMP_AREA, 0x1C0D
zerojmp_func func_80234434, ZEROJMP_AREA, 0x1D00
zerojmp_func func_80234408, ZEROJMP_AREA, 0x1D01
zerojmp_func func_8025E63C, ZEROJMP_AREA, 0x1D02
zerojmp_func func_80234248, ZEROJMP_AREA, 0x1D03
zerojmp_func func_802342D4, ZEROJMP_AREA, 0x1D04
zerojmp_func func_80234460, ZEROJMP_AREA, 0x1D05
zerojmp_func func_80234480, ZEROJMP_AREA, 0x1D06
zerojmp_func func_802344A0, ZEROJMP_AREA, 0x1D07
zerojmp_func func_802344C0, ZEROJMP_AREA, 0x1D08
zerojmp_func func_802344E0, ZEROJMP_AREA, 0x1D09
zerojmp_func func_80234500, ZEROJMP_AREA, 0x1D0A
zerojmp_func func_80234528, ZEROJMP_AREA, 0x1D0B
zerojmp_func func_80234210, ZEROJMP_AREA, 0x1D0C
zerojmp_func func_802341F0, ZEROJMP_AREA, 0x1D0D
zerojmp_func func_80233E3C, ZEROJMP_AREA, 0x1D0E
zerojmp_func func_80233DEC, ZEROJMP_AREA, 0x1D0F
zerojmp_func func_80233D7C, ZEROJMP_AREA, 0x1D10
zerojmp_func func_80233C80, ZEROJMP_AREA, 0x1D11
zerojmp_func func_802339A0, ZEROJMP_AREA, 0x1D12
zerojmp_func func_80233A04, ZEROJMP_AREA, 0x1D13
zerojmp_func func_8028A0E4, ZEROJMP_AREA, 0x1E00
zerojmp_func func_8028A0B4, ZEROJMP_AREA, 0x1E01
zerojmp_func func_8028A3D0, ZEROJMP_AREA, 0x1E02
zerojmp_func func_8028A428, ZEROJMP_AREA, 0x1E03
zerojmp_func func_8028A36C, ZEROJMP_AREA, 0x1E04
zerojmp_func func_8028A484, ZEROJMP_AREA, 0x1E05
zerojmp_func func_8028A24C, ZEROJMP_AREA, 0x1E06
zerojmp_func func_8028A2B0, ZEROJMP_AREA, 0x1E07
zerojmp_func func_8028A1DC, ZEROJMP_AREA, 0x1E08
zerojmp_func func_8028A318, ZEROJMP_AREA, 0x1E09
zerojmp_func func_8028A060, ZEROJMP_AREA, 0x1E0A
zerojmp_func ID_31_UNDEFINED_FUNC_1, ZEROJMP_AREA, 0x1F00
zerojmp_func ID_31_UNDEFINED_FUNC_2, ZEROJMP_AREA, 0x1F01
zerojmp_func ID_31_UNDEFINED_FUNC_3, ZEROJMP_AREA, 0x1F02
zerojmp_func ID_31_UNDEFINED_FUNC_4, ZEROJMP_AREA, 0x1F03
zerojmp_func ID_31_UNDEFINED_FUNC_5, ZEROJMP_AREA, 0x1F04
zerojmp_func ID_31_UNDEFINED_FUNC_6, ZEROJMP_AREA, 0x1F05
zerojmp_func ID_31_UNDEFINED_FUNC_7, ZEROJMP_AREA, 0x1F06
zerojmp_func ID_31_UNDEFINED_FUNC_8, ZEROJMP_AREA, 0x1F07

nonmatching func_80298EA8, 0x8

glabel func_80298EA8
    /* B36A8 80298EA8 00000008 */  jr         $zero
    /* B36AC 80298EAC 24082000 */   addiu     $t0, $zero, 0x2000
endlabel func_80298EA8

nonmatching func_80298EB0, 0x8

glabel func_80298EB0
    /* B36B0 80298EB0 00000008 */  jr         $zero
    /* B36B4 80298EB4 24082001 */   addiu     $t0, $zero, 0x2001
endlabel func_80298EB0

nonmatching func_80298EB8, 0x8

glabel func_80298EB8
    /* B36B8 80298EB8 00000008 */  jr         $zero
    /* B36BC 80298EBC 24082002 */   addiu     $t0, $zero, 0x2002
endlabel func_80298EB8

nonmatching func_80298EC0, 0x8

glabel func_80298EC0
    /* B36C0 80298EC0 00000008 */  jr         $zero
    /* B36C4 80298EC4 24082003 */   addiu     $t0, $zero, 0x2003
endlabel func_80298EC0

nonmatching func_80298EC8, 0x8

glabel func_80298EC8
    /* B36C8 80298EC8 00000008 */  jr         $zero
    /* B36CC 80298ECC 24082004 */   addiu     $t0, $zero, 0x2004
endlabel func_80298EC8

nonmatching func_80298ED0, 0x8

glabel func_80298ED0
    /* B36D0 80298ED0 00000008 */  jr         $zero
    /* B36D4 80298ED4 24082005 */   addiu     $t0, $zero, 0x2005
endlabel func_80298ED0

nonmatching func_80298ED8, 0x8

glabel func_80298ED8
    /* B36D8 80298ED8 00000008 */  jr         $zero
    /* B36DC 80298EDC 24082006 */   addiu     $t0, $zero, 0x2006
endlabel func_80298ED8

nonmatching func_80298EE0, 0x8

glabel func_80298EE0
    /* B36E0 80298EE0 00000008 */  jr         $zero
    /* B36E4 80298EE4 24082007 */   addiu     $t0, $zero, 0x2007
endlabel func_80298EE0

nonmatching func_80298EE8, 0x8

glabel func_80298EE8
    /* B36E8 80298EE8 00000008 */  jr         $zero
    /* B36EC 80298EEC 24082100 */   addiu     $t0, $zero, 0x2100
endlabel func_80298EE8

nonmatching func_80298EF0, 0x8

glabel func_80298EF0
    /* B36F0 80298EF0 00000008 */  jr         $zero
    /* B36F4 80298EF4 24082101 */   addiu     $t0, $zero, 0x2101
endlabel func_80298EF0

nonmatching func_80298EF8, 0x8

glabel func_80298EF8
    /* B36F8 80298EF8 00000008 */  jr         $zero
    /* B36FC 80298EFC 24082102 */   addiu     $t0, $zero, 0x2102
endlabel func_80298EF8

nonmatching func_80298F00, 0x8

glabel func_80298F00
    /* B3700 80298F00 00000008 */  jr         $zero
    /* B3704 80298F04 24082103 */   addiu     $t0, $zero, 0x2103
endlabel func_80298F00

nonmatching func_80298F08, 0x8

glabel func_80298F08
    /* B3708 80298F08 00000008 */  jr         $zero
    /* B370C 80298F0C 24082104 */   addiu     $t0, $zero, 0x2104
endlabel func_80298F08

nonmatching func_80298F10, 0x8

glabel func_80298F10
    /* B3710 80298F10 00000008 */  jr         $zero
    /* B3714 80298F14 24082200 */   addiu     $t0, $zero, 0x2200
endlabel func_80298F10

nonmatching func_80298F18, 0x8

glabel func_80298F18
    /* B3718 80298F18 00000008 */  jr         $zero
    /* B371C 80298F1C 24082201 */   addiu     $t0, $zero, 0x2201
endlabel func_80298F18

nonmatching func_80298F20, 0x8

glabel func_80298F20
    /* B3720 80298F20 00000008 */  jr         $zero
    /* B3724 80298F24 24082202 */   addiu     $t0, $zero, 0x2202
endlabel func_80298F20

nonmatching func_80298F28, 0x8

glabel func_80298F28
    /* B3728 80298F28 00000008 */  jr         $zero
    /* B372C 80298F2C 24082203 */   addiu     $t0, $zero, 0x2203
endlabel func_80298F28

nonmatching func_80298F30, 0x8

glabel func_80298F30
    /* B3730 80298F30 00000008 */  jr         $zero
    /* B3734 80298F34 24082300 */   addiu     $t0, $zero, 0x2300
endlabel func_80298F30

nonmatching func_80298F38, 0x8

glabel func_80298F38
    /* B3738 80298F38 00000008 */  jr         $zero
    /* B373C 80298F3C 24082301 */   addiu     $t0, $zero, 0x2301
endlabel func_80298F38

nonmatching func_80298F40, 0x8

glabel func_80298F40
    /* B3740 80298F40 00000008 */  jr         $zero
    /* B3744 80298F44 24082302 */   addiu     $t0, $zero, 0x2302
endlabel func_80298F40

nonmatching func_80298F48, 0x8

glabel func_80298F48
    /* B3748 80298F48 00000008 */  jr         $zero
    /* B374C 80298F4C 24082303 */   addiu     $t0, $zero, 0x2303
endlabel func_80298F48

nonmatching func_80298F50, 0x8

glabel func_80298F50
    /* B3750 80298F50 00000008 */  jr         $zero
    /* B3754 80298F54 24082400 */   addiu     $t0, $zero, 0x2400
endlabel func_80298F50

nonmatching func_80298F58, 0x8

glabel func_80298F58
    /* B3758 80298F58 00000008 */  jr         $zero
    /* B375C 80298F5C 24082401 */   addiu     $t0, $zero, 0x2401
endlabel func_80298F58

nonmatching func_80298F60, 0x8

glabel func_80298F60
    /* B3760 80298F60 00000008 */  jr         $zero
    /* B3764 80298F64 24082402 */   addiu     $t0, $zero, 0x2402
endlabel func_80298F60

nonmatching func_80298F68, 0x8

glabel func_80298F68
    /* B3768 80298F68 00000008 */  jr         $zero
    /* B376C 80298F6C 24082403 */   addiu     $t0, $zero, 0x2403
endlabel func_80298F68

nonmatching func_80298F70, 0x8

glabel func_80298F70
    /* B3770 80298F70 00000008 */  jr         $zero
    /* B3774 80298F74 24082404 */   addiu     $t0, $zero, 0x2404
endlabel func_80298F70

nonmatching func_80298F78, 0x8

glabel func_80298F78
    /* B3778 80298F78 00000008 */  jr         $zero
    /* B377C 80298F7C 24082405 */   addiu     $t0, $zero, 0x2405
endlabel func_80298F78

nonmatching func_80298F80, 0x8

glabel func_80298F80
    /* B3780 80298F80 00000008 */  jr         $zero
    /* B3784 80298F84 24082406 */   addiu     $t0, $zero, 0x2406
endlabel func_80298F80

nonmatching func_80298F88, 0x8

glabel func_80298F88
    /* B3788 80298F88 00000008 */  jr         $zero
    /* B378C 80298F8C 24082407 */   addiu     $t0, $zero, 0x2407
endlabel func_80298F88

nonmatching func_80298F90, 0x8

glabel func_80298F90
    /* B3790 80298F90 00000008 */  jr         $zero
    /* B3794 80298F94 24082408 */   addiu     $t0, $zero, 0x2408
endlabel func_80298F90

nonmatching func_80298F98, 0x8

glabel func_80298F98
    /* B3798 80298F98 00000008 */  jr         $zero
    /* B379C 80298F9C 24082409 */   addiu     $t0, $zero, 0x2409
endlabel func_80298F98

nonmatching func_80298FA0, 0x8

glabel func_80298FA0
    /* B37A0 80298FA0 00000008 */  jr         $zero
    /* B37A4 80298FA4 2408240A */   addiu     $t0, $zero, 0x240A
endlabel func_80298FA0

nonmatching func_80298FA8, 0x8

glabel func_80298FA8
    /* B37A8 80298FA8 00000008 */  jr         $zero
    /* B37AC 80298FAC 24082500 */   addiu     $t0, $zero, 0x2500
endlabel func_80298FA8

nonmatching func_80298FB0, 0x8

glabel func_80298FB0
    /* B37B0 80298FB0 00000008 */  jr         $zero
    /* B37B4 80298FB4 24082501 */   addiu     $t0, $zero, 0x2501
endlabel func_80298FB0

nonmatching func_80298FB8, 0x8

glabel func_80298FB8
    /* B37B8 80298FB8 00000008 */  jr         $zero
    /* B37BC 80298FBC 24082502 */   addiu     $t0, $zero, 0x2502
endlabel func_80298FB8

nonmatching func_80298FC0, 0x8

glabel func_80298FC0
    /* B37C0 80298FC0 00000008 */  jr         $zero
    /* B37C4 80298FC4 24082503 */   addiu     $t0, $zero, 0x2503
endlabel func_80298FC0

nonmatching func_80298FC8, 0x8

glabel func_80298FC8
    /* B37C8 80298FC8 00000008 */  jr         $zero
    /* B37CC 80298FCC 24082504 */   addiu     $t0, $zero, 0x2504
endlabel func_80298FC8

nonmatching func_80298FD0, 0x8

glabel func_80298FD0
    /* B37D0 80298FD0 00000008 */  jr         $zero
    /* B37D4 80298FD4 24082505 */   addiu     $t0, $zero, 0x2505
endlabel func_80298FD0

nonmatching func_80298FD8, 0x8

glabel func_80298FD8
    /* B37D8 80298FD8 00000008 */  jr         $zero
    /* B37DC 80298FDC 24082506 */   addiu     $t0, $zero, 0x2506
endlabel func_80298FD8

nonmatching func_80298FE0, 0x8

glabel func_80298FE0
    /* B37E0 80298FE0 00000008 */  jr         $zero
    /* B37E4 80298FE4 24082507 */   addiu     $t0, $zero, 0x2507
endlabel func_80298FE0

nonmatching func_80298FE8, 0x8

glabel func_80298FE8
    /* B37E8 80298FE8 00000008 */  jr         $zero
    /* B37EC 80298FEC 24082508 */   addiu     $t0, $zero, 0x2508
endlabel func_80298FE8

nonmatching func_80298FF0, 0x8

glabel func_80298FF0
    /* B37F0 80298FF0 00000008 */  jr         $zero
    /* B37F4 80298FF4 24082509 */   addiu     $t0, $zero, 0x2509
endlabel func_80298FF0

nonmatching func_80298FF8, 0x8

glabel func_80298FF8
    /* B37F8 80298FF8 00000008 */  jr         $zero
    /* B37FC 80298FFC 2408250A */   addiu     $t0, $zero, 0x250A
endlabel func_80298FF8

nonmatching func_80299000, 0x8

glabel func_80299000
    /* B3800 80299000 00000008 */  jr         $zero
    /* B3804 80299004 2408250B */   addiu     $t0, $zero, 0x250B
endlabel func_80299000

nonmatching func_80299008, 0x8

glabel func_80299008
    /* B3808 80299008 00000008 */  jr         $zero
    /* B380C 8029900C 2408250C */   addiu     $t0, $zero, 0x250C
endlabel func_80299008

nonmatching func_80299010, 0x8

glabel func_80299010
    /* B3810 80299010 00000008 */  jr         $zero
    /* B3814 80299014 2408250D */   addiu     $t0, $zero, 0x250D
endlabel func_80299010

nonmatching func_80299018, 0x8

glabel func_80299018
    /* B3818 80299018 00000008 */  jr         $zero
    /* B381C 8029901C 24082600 */   addiu     $t0, $zero, 0x2600
endlabel func_80299018

nonmatching func_80299020, 0x8

glabel func_80299020
    /* B3820 80299020 00000008 */  jr         $zero
    /* B3824 80299024 24082601 */   addiu     $t0, $zero, 0x2601
endlabel func_80299020

nonmatching func_80299028, 0x8

glabel func_80299028
    /* B3828 80299028 00000008 */  jr         $zero
    /* B382C 8029902C 24082602 */   addiu     $t0, $zero, 0x2602
endlabel func_80299028

nonmatching func_80299030, 0x8

glabel func_80299030
    /* B3830 80299030 00000008 */  jr         $zero
    /* B3834 80299034 24082603 */   addiu     $t0, $zero, 0x2603
endlabel func_80299030

nonmatching func_80299038, 0x8

glabel func_80299038
    /* B3838 80299038 00000008 */  jr         $zero
    /* B383C 8029903C 24082700 */   addiu     $t0, $zero, 0x2700
endlabel func_80299038

nonmatching func_80299040, 0x8

glabel func_80299040
    /* B3840 80299040 00000008 */  jr         $zero
    /* B3844 80299044 24082701 */   addiu     $t0, $zero, 0x2701
endlabel func_80299040

nonmatching func_80299048, 0x8

glabel func_80299048
    /* B3848 80299048 00000008 */  jr         $zero
    /* B384C 8029904C 24082702 */   addiu     $t0, $zero, 0x2702
endlabel func_80299048

nonmatching func_80299050, 0x8

glabel func_80299050
    /* B3850 80299050 00000008 */  jr         $zero
    /* B3854 80299054 24082703 */   addiu     $t0, $zero, 0x2703
endlabel func_80299050

nonmatching func_80299058, 0x8

glabel func_80299058
    /* B3858 80299058 00000008 */  jr         $zero
    /* B385C 8029905C 24082704 */   addiu     $t0, $zero, 0x2704
endlabel func_80299058

nonmatching func_80299060, 0x8

glabel func_80299060
    /* B3860 80299060 00000008 */  jr         $zero
    /* B3864 80299064 24082705 */   addiu     $t0, $zero, 0x2705
endlabel func_80299060

nonmatching func_80299068, 0x8

glabel func_80299068
    /* B3868 80299068 00000008 */  jr         $zero
    /* B386C 8029906C 24082706 */   addiu     $t0, $zero, 0x2706
endlabel func_80299068

nonmatching func_80299070, 0x8

glabel func_80299070
    /* B3870 80299070 00000008 */  jr         $zero
    /* B3874 80299074 24082707 */   addiu     $t0, $zero, 0x2707
endlabel func_80299070

nonmatching func_80299078, 0x8

glabel func_80299078
    /* B3878 80299078 00000008 */  jr         $zero
    /* B387C 8029907C 24082708 */   addiu     $t0, $zero, 0x2708
endlabel func_80299078

nonmatching func_80299080, 0x8

glabel func_80299080
    /* B3880 80299080 00000008 */  jr         $zero
    /* B3884 80299084 24082709 */   addiu     $t0, $zero, 0x2709
endlabel func_80299080

nonmatching func_80299088, 0x8

glabel func_80299088
    /* B3888 80299088 00000008 */  jr         $zero
    /* B388C 8029908C 2408270A */   addiu     $t0, $zero, 0x270A
endlabel func_80299088

nonmatching func_80299090, 0x8

glabel func_80299090
    /* B3890 80299090 00000008 */  jr         $zero
    /* B3894 80299094 24082800 */   addiu     $t0, $zero, 0x2800
endlabel func_80299090

nonmatching func_80299098, 0x8

glabel func_80299098
    /* B3898 80299098 00000008 */  jr         $zero
    /* B389C 8029909C 24082801 */   addiu     $t0, $zero, 0x2801
endlabel func_80299098

nonmatching func_802990A0, 0x8

glabel func_802990A0
    /* B38A0 802990A0 00000008 */  jr         $zero
    /* B38A4 802990A4 24082802 */   addiu     $t0, $zero, 0x2802
endlabel func_802990A0

nonmatching func_802990A8, 0x8

glabel func_802990A8
    /* B38A8 802990A8 00000008 */  jr         $zero
    /* B38AC 802990AC 24082803 */   addiu     $t0, $zero, 0x2803
endlabel func_802990A8

nonmatching func_802990B0, 0x8

glabel func_802990B0
    /* B38B0 802990B0 00000008 */  jr         $zero
    /* B38B4 802990B4 24082804 */   addiu     $t0, $zero, 0x2804
endlabel func_802990B0

nonmatching func_802990B8, 0x8

glabel func_802990B8
    /* B38B8 802990B8 00000008 */  jr         $zero
    /* B38BC 802990BC 24082805 */   addiu     $t0, $zero, 0x2805
endlabel func_802990B8

nonmatching func_802990C0, 0x8

glabel func_802990C0
    /* B38C0 802990C0 00000008 */  jr         $zero
    /* B38C4 802990C4 24082900 */   addiu     $t0, $zero, 0x2900
endlabel func_802990C0

nonmatching func_802990C8, 0x8

glabel func_802990C8
    /* B38C8 802990C8 00000008 */  jr         $zero
    /* B38CC 802990CC 24082901 */   addiu     $t0, $zero, 0x2901
endlabel func_802990C8

nonmatching func_802990D0, 0x8

glabel func_802990D0
    /* B38D0 802990D0 00000008 */  jr         $zero
    /* B38D4 802990D4 24082902 */   addiu     $t0, $zero, 0x2902
endlabel func_802990D0

nonmatching func_802990D8, 0x8

glabel func_802990D8
    /* B38D8 802990D8 00000008 */  jr         $zero
    /* B38DC 802990DC 24082A00 */   addiu     $t0, $zero, 0x2A00
endlabel func_802990D8

nonmatching func_802990E0, 0x8

glabel func_802990E0
    /* B38E0 802990E0 00000008 */  jr         $zero
    /* B38E4 802990E4 24082A01 */   addiu     $t0, $zero, 0x2A01
endlabel func_802990E0

nonmatching func_802990E8, 0x8

glabel func_802990E8
    /* B38E8 802990E8 00000008 */  jr         $zero
    /* B38EC 802990EC 24082A02 */   addiu     $t0, $zero, 0x2A02
endlabel func_802990E8

nonmatching func_802990F0, 0x8

glabel func_802990F0
    /* B38F0 802990F0 00000008 */  jr         $zero
    /* B38F4 802990F4 24082A03 */   addiu     $t0, $zero, 0x2A03
endlabel func_802990F0

nonmatching func_802990F8, 0x8

glabel func_802990F8
    /* B38F8 802990F8 00000008 */  jr         $zero
    /* B38FC 802990FC 24082A04 */   addiu     $t0, $zero, 0x2A04
endlabel func_802990F8

nonmatching func_80299100, 0x8

glabel func_80299100
    /* B3900 80299100 00000008 */  jr         $zero
    /* B3904 80299104 24082A05 */   addiu     $t0, $zero, 0x2A05
endlabel func_80299100

nonmatching func_80299108, 0x8

glabel func_80299108
    /* B3908 80299108 00000008 */  jr         $zero
    /* B390C 8029910C 24082A06 */   addiu     $t0, $zero, 0x2A06
endlabel func_80299108

nonmatching func_80299110, 0x8

glabel func_80299110
    /* B3910 80299110 00000008 */  jr         $zero
    /* B3914 80299114 24082A07 */   addiu     $t0, $zero, 0x2A07
endlabel func_80299110

nonmatching func_80299118, 0x8

glabel func_80299118
    /* B3918 80299118 00000008 */  jr         $zero
    /* B391C 8029911C 24082A08 */   addiu     $t0, $zero, 0x2A08
endlabel func_80299118

nonmatching func_80299120, 0x8

glabel func_80299120
    /* B3920 80299120 00000008 */  jr         $zero
    /* B3924 80299124 24082A09 */   addiu     $t0, $zero, 0x2A09
endlabel func_80299120

nonmatching func_80299128, 0x8

glabel func_80299128
    /* B3928 80299128 00000008 */  jr         $zero
    /* B392C 8029912C 24082A0A */   addiu     $t0, $zero, 0x2A0A
endlabel func_80299128

nonmatching func_80299130, 0x8

glabel func_80299130
    /* B3930 80299130 00000008 */  jr         $zero
    /* B3934 80299134 24082A0B */   addiu     $t0, $zero, 0x2A0B
endlabel func_80299130

nonmatching func_80299138, 0x8

glabel func_80299138
    /* B3938 80299138 00000008 */  jr         $zero
    /* B393C 8029913C 24082A0C */   addiu     $t0, $zero, 0x2A0C
endlabel func_80299138

nonmatching func_80299140, 0x8

glabel func_80299140
    /* B3940 80299140 00000008 */  jr         $zero
    /* B3944 80299144 24082A0D */   addiu     $t0, $zero, 0x2A0D
endlabel func_80299140

nonmatching func_80299148, 0x8

glabel func_80299148
    /* B3948 80299148 00000008 */  jr         $zero
    /* B394C 8029914C 24082A0E */   addiu     $t0, $zero, 0x2A0E
endlabel func_80299148

nonmatching func_80299150, 0x8

glabel func_80299150
    /* B3950 80299150 00000008 */  jr         $zero
    /* B3954 80299154 24082B00 */   addiu     $t0, $zero, 0x2B00
endlabel func_80299150

nonmatching func_80299158, 0x8

glabel func_80299158
    /* B3958 80299158 00000008 */  jr         $zero
    /* B395C 8029915C 24082B01 */   addiu     $t0, $zero, 0x2B01
endlabel func_80299158

nonmatching func_80299160, 0x8

glabel func_80299160
    /* B3960 80299160 00000008 */  jr         $zero
    /* B3964 80299164 24082B02 */   addiu     $t0, $zero, 0x2B02
endlabel func_80299160

nonmatching func_80299168, 0x8

glabel func_80299168
    /* B3968 80299168 00000008 */  jr         $zero
    /* B396C 8029916C 24082B03 */   addiu     $t0, $zero, 0x2B03
endlabel func_80299168

nonmatching func_80299170, 0x8

glabel func_80299170
    /* B3970 80299170 00000008 */  jr         $zero
    /* B3974 80299174 24082B04 */   addiu     $t0, $zero, 0x2B04
endlabel func_80299170

nonmatching func_80299178, 0x8

glabel func_80299178
    /* B3978 80299178 00000008 */  jr         $zero
    /* B397C 8029917C 24082B05 */   addiu     $t0, $zero, 0x2B05
endlabel func_80299178

nonmatching func_80299180, 0x8

glabel func_80299180
    /* B3980 80299180 00000008 */  jr         $zero
    /* B3984 80299184 24082B06 */   addiu     $t0, $zero, 0x2B06
endlabel func_80299180

nonmatching func_80299188, 0x8

glabel func_80299188
    /* B3988 80299188 00000008 */  jr         $zero
    /* B398C 8029918C 24082B07 */   addiu     $t0, $zero, 0x2B07
endlabel func_80299188

nonmatching func_80299190, 0x8

glabel func_80299190
    /* B3990 80299190 00000008 */  jr         $zero
    /* B3994 80299194 24082B08 */   addiu     $t0, $zero, 0x2B08
endlabel func_80299190

nonmatching func_80299198, 0x8

glabel func_80299198
    /* B3998 80299198 00000008 */  jr         $zero
    /* B399C 8029919C 24082B09 */   addiu     $t0, $zero, 0x2B09
endlabel func_80299198

nonmatching func_802991A0, 0x8

glabel func_802991A0
    /* B39A0 802991A0 00000008 */  jr         $zero
    /* B39A4 802991A4 24082B0A */   addiu     $t0, $zero, 0x2B0A
endlabel func_802991A0

nonmatching func_802991A8, 0x8

glabel func_802991A8
    /* B39A8 802991A8 00000008 */  jr         $zero
    /* B39AC 802991AC 24082B0B */   addiu     $t0, $zero, 0x2B0B
endlabel func_802991A8

nonmatching func_802991B0, 0x8

glabel func_802991B0
    /* B39B0 802991B0 00000008 */  jr         $zero
    /* B39B4 802991B4 24082B0C */   addiu     $t0, $zero, 0x2B0C
endlabel func_802991B0

nonmatching func_802991B8, 0x8

glabel func_802991B8
    /* B39B8 802991B8 00000008 */  jr         $zero
    /* B39BC 802991BC 24082B0D */   addiu     $t0, $zero, 0x2B0D
endlabel func_802991B8

nonmatching func_802991C0, 0x8

glabel func_802991C0
    /* B39C0 802991C0 00000008 */  jr         $zero
    /* B39C4 802991C4 24082B0E */   addiu     $t0, $zero, 0x2B0E
endlabel func_802991C0

nonmatching func_802991C8, 0x8

glabel func_802991C8
    /* B39C8 802991C8 00000008 */  jr         $zero
    /* B39CC 802991CC 24082C00 */   addiu     $t0, $zero, 0x2C00
endlabel func_802991C8

nonmatching func_802991D0, 0x8

glabel func_802991D0
    /* B39D0 802991D0 00000008 */  jr         $zero
    /* B39D4 802991D4 24082C01 */   addiu     $t0, $zero, 0x2C01
endlabel func_802991D0

nonmatching func_802991D8, 0x8

glabel func_802991D8
    /* B39D8 802991D8 00000008 */  jr         $zero
    /* B39DC 802991DC 24082C02 */   addiu     $t0, $zero, 0x2C02
endlabel func_802991D8

nonmatching func_802991E0, 0x8

glabel func_802991E0
    /* B39E0 802991E0 00000008 */  jr         $zero
    /* B39E4 802991E4 24082C03 */   addiu     $t0, $zero, 0x2C03
endlabel func_802991E0

nonmatching func_802991E8, 0x8

glabel func_802991E8
    /* B39E8 802991E8 00000008 */  jr         $zero
    /* B39EC 802991EC 24082C04 */   addiu     $t0, $zero, 0x2C04
endlabel func_802991E8

nonmatching func_802991F0, 0x8

glabel func_802991F0
    /* B39F0 802991F0 00000008 */  jr         $zero
    /* B39F4 802991F4 24082C05 */   addiu     $t0, $zero, 0x2C05
endlabel func_802991F0

nonmatching func_802991F8, 0x8

glabel func_802991F8
    /* B39F8 802991F8 00000008 */  jr         $zero
    /* B39FC 802991FC 24082D00 */   addiu     $t0, $zero, 0x2D00
endlabel func_802991F8

nonmatching func_80299200, 0x8

glabel func_80299200
    /* B3A00 80299200 00000008 */  jr         $zero
    /* B3A04 80299204 24082D01 */   addiu     $t0, $zero, 0x2D01
endlabel func_80299200

nonmatching func_80299208, 0x8

glabel func_80299208
    /* B3A08 80299208 00000008 */  jr         $zero
    /* B3A0C 8029920C 24082D02 */   addiu     $t0, $zero, 0x2D02
endlabel func_80299208

nonmatching func_80299210, 0x8

glabel func_80299210
    /* B3A10 80299210 00000008 */  jr         $zero
    /* B3A14 80299214 24082D03 */   addiu     $t0, $zero, 0x2D03
endlabel func_80299210

nonmatching func_80299218, 0x8

glabel func_80299218
    /* B3A18 80299218 00000008 */  jr         $zero
    /* B3A1C 8029921C 24082D04 */   addiu     $t0, $zero, 0x2D04
endlabel func_80299218

nonmatching func_80299220, 0x8

glabel func_80299220
    /* B3A20 80299220 00000008 */  jr         $zero
    /* B3A24 80299224 24082D05 */   addiu     $t0, $zero, 0x2D05
endlabel func_80299220

nonmatching func_80299228, 0x8

glabel func_80299228
    /* B3A28 80299228 00000008 */  jr         $zero
    /* B3A2C 8029922C 24082D06 */   addiu     $t0, $zero, 0x2D06
endlabel func_80299228

nonmatching func_80299230, 0x8

glabel func_80299230
    /* B3A30 80299230 00000008 */  jr         $zero
    /* B3A34 80299234 24082E00 */   addiu     $t0, $zero, 0x2E00
endlabel func_80299230

nonmatching func_80299238, 0x8

glabel func_80299238
    /* B3A38 80299238 00000008 */  jr         $zero
    /* B3A3C 8029923C 24082E01 */   addiu     $t0, $zero, 0x2E01
endlabel func_80299238

nonmatching func_80299240, 0x8

glabel func_80299240
    /* B3A40 80299240 00000008 */  jr         $zero
    /* B3A44 80299244 24082F00 */   addiu     $t0, $zero, 0x2F00
endlabel func_80299240

nonmatching func_80299248, 0x8

glabel func_80299248
    /* B3A48 80299248 00000008 */  jr         $zero
    /* B3A4C 8029924C 24082F01 */   addiu     $t0, $zero, 0x2F01
endlabel func_80299248

nonmatching func_80299250, 0x8

glabel func_80299250
    /* B3A50 80299250 00000008 */  jr         $zero
    /* B3A54 80299254 24082F02 */   addiu     $t0, $zero, 0x2F02
endlabel func_80299250

nonmatching func_80299258, 0x8

glabel func_80299258
    /* B3A58 80299258 00000008 */  jr         $zero
    /* B3A5C 8029925C 24082F03 */   addiu     $t0, $zero, 0x2F03
endlabel func_80299258

nonmatching func_80299260, 0x8

glabel func_80299260
    /* B3A60 80299260 00000008 */  jr         $zero
    /* B3A64 80299264 24082F04 */   addiu     $t0, $zero, 0x2F04
endlabel func_80299260

nonmatching func_80299268, 0x8

glabel func_80299268
    /* B3A68 80299268 00000008 */  jr         $zero
    /* B3A6C 8029926C 24082F05 */   addiu     $t0, $zero, 0x2F05
endlabel func_80299268

nonmatching func_80299270, 0x8

glabel func_80299270
    /* B3A70 80299270 00000008 */  jr         $zero
    /* B3A74 80299274 24082F06 */   addiu     $t0, $zero, 0x2F06
endlabel func_80299270

nonmatching func_80299278, 0x8

glabel func_80299278
    /* B3A78 80299278 00000008 */  jr         $zero
    /* B3A7C 8029927C 24082F07 */   addiu     $t0, $zero, 0x2F07
endlabel func_80299278

nonmatching func_80299280, 0x8

glabel func_80299280
    /* B3A80 80299280 00000008 */  jr         $zero
    /* B3A84 80299284 24082F08 */   addiu     $t0, $zero, 0x2F08
endlabel func_80299280

nonmatching func_80299288, 0x8

glabel func_80299288
    /* B3A88 80299288 00000008 */  jr         $zero
    /* B3A8C 8029928C 24082F09 */   addiu     $t0, $zero, 0x2F09
endlabel func_80299288

nonmatching func_80299290, 0x8

glabel func_80299290
    /* B3A90 80299290 00000008 */  jr         $zero
    /* B3A94 80299294 24082F0A */   addiu     $t0, $zero, 0x2F0A
endlabel func_80299290

nonmatching func_80299298, 0x8

glabel func_80299298
    /* B3A98 80299298 00000008 */  jr         $zero
    /* B3A9C 8029929C 24082F0B */   addiu     $t0, $zero, 0x2F0B
endlabel func_80299298

nonmatching func_802992A0, 0x8

glabel func_802992A0
    /* B3AA0 802992A0 00000008 */  jr         $zero
    /* B3AA4 802992A4 24082F0C */   addiu     $t0, $zero, 0x2F0C
endlabel func_802992A0

nonmatching func_802992A8, 0x8

glabel func_802992A8
    /* B3AA8 802992A8 00000008 */  jr         $zero
    /* B3AAC 802992AC 24082F0D */   addiu     $t0, $zero, 0x2F0D
endlabel func_802992A8

nonmatching func_802992B0, 0x8

glabel func_802992B0
    /* B3AB0 802992B0 00000008 */  jr         $zero
    /* B3AB4 802992B4 24082F0E */   addiu     $t0, $zero, 0x2F0E
endlabel func_802992B0

nonmatching func_802992B8, 0x8

glabel func_802992B8
    /* B3AB8 802992B8 00000008 */  jr         $zero
    /* B3ABC 802992BC 24082F0F */   addiu     $t0, $zero, 0x2F0F
endlabel func_802992B8

nonmatching func_802992C0, 0x8

glabel func_802992C0
    /* B3AC0 802992C0 00000008 */  jr         $zero
    /* B3AC4 802992C4 24082F10 */   addiu     $t0, $zero, 0x2F10
endlabel func_802992C0

nonmatching func_802992C8, 0x8

glabel func_802992C8
    /* B3AC8 802992C8 00000008 */  jr         $zero
    /* B3ACC 802992CC 24083000 */   addiu     $t0, $zero, 0x3000
endlabel func_802992C8

nonmatching func_802992D0, 0x8

glabel func_802992D0
    /* B3AD0 802992D0 00000008 */  jr         $zero
    /* B3AD4 802992D4 24083001 */   addiu     $t0, $zero, 0x3001
endlabel func_802992D0

nonmatching func_802992D8, 0x8

glabel func_802992D8
    /* B3AD8 802992D8 00000008 */  jr         $zero
    /* B3ADC 802992DC 24083002 */   addiu     $t0, $zero, 0x3002
endlabel func_802992D8

nonmatching func_802992E0, 0x8

glabel func_802992E0
    /* B3AE0 802992E0 00000008 */  jr         $zero
    /* B3AE4 802992E4 24083003 */   addiu     $t0, $zero, 0x3003
endlabel func_802992E0

nonmatching func_802992E8, 0x8

glabel func_802992E8
    /* B3AE8 802992E8 00000008 */  jr         $zero
    /* B3AEC 802992EC 24083100 */   addiu     $t0, $zero, 0x3100
endlabel func_802992E8

nonmatching func_802992F0, 0x8

glabel func_802992F0
    /* B3AF0 802992F0 00000008 */  jr         $zero
    /* B3AF4 802992F4 24083101 */   addiu     $t0, $zero, 0x3101
endlabel func_802992F0

nonmatching func_802992F8, 0x8

glabel func_802992F8
    /* B3AF8 802992F8 00000008 */  jr         $zero
    /* B3AFC 802992FC 24083102 */   addiu     $t0, $zero, 0x3102
endlabel func_802992F8

nonmatching func_80299300, 0x8

glabel func_80299300
    /* B3B00 80299300 00000008 */  jr         $zero
    /* B3B04 80299304 24083103 */   addiu     $t0, $zero, 0x3103
endlabel func_80299300

nonmatching func_80299308, 0x8

glabel func_80299308
    /* B3B08 80299308 00000008 */  jr         $zero
    /* B3B0C 8029930C 24083104 */   addiu     $t0, $zero, 0x3104
endlabel func_80299308

nonmatching func_80299310, 0x8

glabel func_80299310
    /* B3B10 80299310 00000008 */  jr         $zero
    /* B3B14 80299314 24083105 */   addiu     $t0, $zero, 0x3105
endlabel func_80299310

nonmatching func_80299318, 0x8

glabel func_80299318
    /* B3B18 80299318 00000008 */  jr         $zero
    /* B3B1C 8029931C 24083106 */   addiu     $t0, $zero, 0x3106
endlabel func_80299318

nonmatching func_80299320, 0x8

glabel func_80299320
    /* B3B20 80299320 00000008 */  jr         $zero
    /* B3B24 80299324 24083107 */   addiu     $t0, $zero, 0x3107
endlabel func_80299320

nonmatching func_80299328, 0x8

glabel func_80299328
    /* B3B28 80299328 00000008 */  jr         $zero
    /* B3B2C 8029932C 24083108 */   addiu     $t0, $zero, 0x3108
endlabel func_80299328

nonmatching func_80299330, 0x8

glabel func_80299330
    /* B3B30 80299330 00000008 */  jr         $zero
    /* B3B34 80299334 24083109 */   addiu     $t0, $zero, 0x3109
endlabel func_80299330

nonmatching func_80299338, 0x8

glabel func_80299338
    /* B3B38 80299338 00000008 */  jr         $zero
    /* B3B3C 8029933C 2408310A */   addiu     $t0, $zero, 0x310A
endlabel func_80299338

nonmatching func_80299340, 0x8

glabel func_80299340
    /* B3B40 80299340 00000008 */  jr         $zero
    /* B3B44 80299344 2408310B */   addiu     $t0, $zero, 0x310B
endlabel func_80299340

nonmatching func_80299348, 0x8

glabel func_80299348
    /* B3B48 80299348 00000008 */  jr         $zero
    /* B3B4C 8029934C 2408310C */   addiu     $t0, $zero, 0x310C
endlabel func_80299348

nonmatching func_80299350, 0x8

glabel func_80299350
    /* B3B50 80299350 00000008 */  jr         $zero
    /* B3B54 80299354 2408310D */   addiu     $t0, $zero, 0x310D
endlabel func_80299350

nonmatching func_80299358, 0x8

glabel func_80299358
    /* B3B58 80299358 00000008 */  jr         $zero
    /* B3B5C 8029935C 2408310E */   addiu     $t0, $zero, 0x310E
endlabel func_80299358

nonmatching func_80299360, 0x8

glabel func_80299360
    /* B3B60 80299360 00000008 */  jr         $zero
    /* B3B64 80299364 2408310F */   addiu     $t0, $zero, 0x310F
endlabel func_80299360
    /* B3B68 80299368 00000000 */  nop
    /* B3B6C 8029936C 00000000 */  nop
