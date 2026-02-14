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

zerojmp_func_first set_secure_call_arr, AREA, $zero
zerojmp_func func_800018F8, AREA, 0x100
zerojmp_func sprintf, AREA, 0x101
zerojmp_func osVirtualToPhysical, AREA, 0x102
zerojmp_func osInvalDCache, AREA, 0x103
zerojmp_func osInvalICache, AREA, 0x104
zerojmp_func osWritebackDCache, AREA, 0x105
zerojmp_func osWritebackDCacheAll, AREA, 0x106
zerojmp_func osSpTaskLoad, AREA, 0x107
zerojmp_func osSpTaskStartGo, AREA, 0x108
zerojmp_func osCreateMesgQueue, AREA, 0x109
zerojmp_func osSetEventMesg, AREA, 0x10A
zerojmp_func osRecvMesg, AREA, 0x10B
zerojmp_func osSendMesg, AREA, 0x10C
zerojmp_func osJamMesg, AREA, 0x10D
zerojmp_func osCreateThread, AREA, 0x10E
zerojmp_func osStartThread, AREA, 0x10F
zerojmp_func osStopThread, AREA, 0x110
zerojmp_func osYieldThread, AREA, 0x111
zerojmp_func osDestroyThread, AREA, 0x112
zerojmp_func osGetThreadPri, AREA, 0x113
zerojmp_func osSetThreadPri, AREA, 0x114
zerojmp_func osGetThreadId, AREA, 0x115
zerojmp_func osCreateScheduler, AREA, 0x116
zerojmp_func osScAddClient, AREA, 0x117
zerojmp_func osScRemoveClient, AREA, 0x118
zerojmp_func osScGetCmdQ, AREA, 0x119
zerojmp_func osCreatePiManager, AREA, 0x11A
zerojmp_func func_800018E8, AREA, 0x11B
zerojmp_func func_800018CC, AREA, 0x11C
zerojmp_func func_800018C4, AREA, 0x11D
zerojmp_func func_800018B8, AREA, 0x11E
zerojmp_func func_80001698, AREA, 0x11F
zerojmp_func osGetTime, AREA, 0x120
zerojmp_func osSetTime, AREA, 0x121
zerojmp_func osSetTimer, AREA, 0x122
zerojmp_func osStopTimer, AREA, 0x123
zerojmp_func osGetCount, AREA, 0x124
zerojmp_func osEepromProbe, AREA, 0x125
zerojmp_func osEepromRead, AREA, 0x126
zerojmp_func osEepromWrite, AREA, 0x127
zerojmp_func osEepromLongRead, AREA, 0x128
zerojmp_func osEepromLongWrite, AREA, 0x129
zerojmp_func osMotorInit, AREA, 0x12A
zerojmp_func osMotorStop, AREA, 0x12B
zerojmp_func osMotorStart, AREA, 0x12C
zerojmp_func osGetIntMask, AREA, 0x12D
zerojmp_func osSetIntMask, AREA, 0x12E

nonmatching func_80297EB0, 0x8

glabel func_80297EB0
    /* B26B0 80297EB0 00000008 */  jr         $zero
    /* B26B4 80297EB4 24080200 */   addiu     $t0, $zero, 0x200
endlabel func_80297EB0

nonmatching func_80297EB8, 0x8

glabel func_80297EB8
    /* B26B8 80297EB8 00000008 */  jr         $zero
    /* B26BC 80297EBC 24080201 */   addiu     $t0, $zero, 0x201
endlabel func_80297EB8

nonmatching func_80297EC0, 0x8

glabel func_80297EC0
    /* B26C0 80297EC0 00000008 */  jr         $zero
    /* B26C4 80297EC4 24080202 */   addiu     $t0, $zero, 0x202
endlabel func_80297EC0

nonmatching func_80297EC8, 0x8

glabel func_80297EC8
    /* B26C8 80297EC8 00000008 */  jr         $zero
    /* B26CC 80297ECC 24080203 */   addiu     $t0, $zero, 0x203
endlabel func_80297EC8

nonmatching func_80297ED0, 0x8

glabel func_80297ED0
    /* B26D0 80297ED0 00000008 */  jr         $zero
    /* B26D4 80297ED4 24080204 */   addiu     $t0, $zero, 0x204
endlabel func_80297ED0

nonmatching func_80297ED8, 0x8

glabel func_80297ED8
    /* B26D8 80297ED8 00000008 */  jr         $zero
    /* B26DC 80297EDC 24080205 */   addiu     $t0, $zero, 0x205
endlabel func_80297ED8

nonmatching func_80297EE0, 0x8

glabel func_80297EE0
    /* B26E0 80297EE0 00000008 */  jr         $zero
    /* B26E4 80297EE4 24080300 */   addiu     $t0, $zero, 0x300
endlabel func_80297EE0

nonmatching func_80297EE8, 0x8

glabel func_80297EE8
    /* B26E8 80297EE8 00000008 */  jr         $zero
    /* B26EC 80297EEC 24080301 */   addiu     $t0, $zero, 0x301
endlabel func_80297EE8

nonmatching func_80297EF0, 0x8

glabel func_80297EF0
    /* B26F0 80297EF0 00000008 */  jr         $zero
    /* B26F4 80297EF4 24080400 */   addiu     $t0, $zero, 0x400
endlabel func_80297EF0

nonmatching func_80297EF8, 0x8

glabel func_80297EF8
    /* B26F8 80297EF8 00000008 */  jr         $zero
    /* B26FC 80297EFC 24080401 */   addiu     $t0, $zero, 0x401
endlabel func_80297EF8

nonmatching func_80297F00, 0x8

glabel func_80297F00
    /* B2700 80297F00 00000008 */  jr         $zero
    /* B2704 80297F04 24080402 */   addiu     $t0, $zero, 0x402
endlabel func_80297F00

nonmatching func_80297F08, 0x8

glabel func_80297F08
    /* B2708 80297F08 00000008 */  jr         $zero
    /* B270C 80297F0C 24080403 */   addiu     $t0, $zero, 0x403
endlabel func_80297F08

nonmatching func_80297F10, 0x8

glabel func_80297F10
    /* B2710 80297F10 00000008 */  jr         $zero
    /* B2714 80297F14 24080404 */   addiu     $t0, $zero, 0x404
endlabel func_80297F10

nonmatching func_80297F18, 0x8

glabel func_80297F18
    /* B2718 80297F18 00000008 */  jr         $zero
    /* B271C 80297F1C 24080405 */   addiu     $t0, $zero, 0x405
endlabel func_80297F18

nonmatching func_80297F20, 0x8

glabel func_80297F20
    /* B2720 80297F20 00000008 */  jr         $zero
    /* B2724 80297F24 24080406 */   addiu     $t0, $zero, 0x406
endlabel func_80297F20

nonmatching func_80297F28, 0x8

glabel func_80297F28
    /* B2728 80297F28 00000008 */  jr         $zero
    /* B272C 80297F2C 24080407 */   addiu     $t0, $zero, 0x407
endlabel func_80297F28

nonmatching func_80297F30, 0x8

glabel func_80297F30
    /* B2730 80297F30 00000008 */  jr         $zero
    /* B2734 80297F34 24080500 */   addiu     $t0, $zero, 0x500
endlabel func_80297F30

nonmatching func_80297F38, 0x8

glabel func_80297F38
    /* B2738 80297F38 00000008 */  jr         $zero
    /* B273C 80297F3C 24080501 */   addiu     $t0, $zero, 0x501
endlabel func_80297F38

nonmatching func_80297F40, 0x8

glabel func_80297F40
    /* B2740 80297F40 00000008 */  jr         $zero
    /* B2744 80297F44 24080600 */   addiu     $t0, $zero, 0x600
endlabel func_80297F40

nonmatching func_80297F48, 0x8

glabel func_80297F48
    /* B2748 80297F48 00000008 */  jr         $zero
    /* B274C 80297F4C 24080601 */   addiu     $t0, $zero, 0x601
endlabel func_80297F48

nonmatching func_80297F50, 0x8

glabel func_80297F50
    /* B2750 80297F50 00000008 */  jr         $zero
    /* B2754 80297F54 24080602 */   addiu     $t0, $zero, 0x602
endlabel func_80297F50

nonmatching func_80297F58, 0x8

glabel func_80297F58
    /* B2758 80297F58 00000008 */  jr         $zero
    /* B275C 80297F5C 24080603 */   addiu     $t0, $zero, 0x603
endlabel func_80297F58

nonmatching func_80297F60, 0x8

glabel func_80297F60
    /* B2760 80297F60 00000008 */  jr         $zero
    /* B2764 80297F64 24080604 */   addiu     $t0, $zero, 0x604
endlabel func_80297F60

nonmatching func_80297F68, 0x8

glabel func_80297F68
    /* B2768 80297F68 00000008 */  jr         $zero
    /* B276C 80297F6C 24080605 */   addiu     $t0, $zero, 0x605
endlabel func_80297F68

nonmatching func_80297F70, 0x8

glabel func_80297F70
    /* B2770 80297F70 00000008 */  jr         $zero
    /* B2774 80297F74 24080606 */   addiu     $t0, $zero, 0x606
endlabel func_80297F70

nonmatching func_80297F78, 0x8

glabel func_80297F78
    /* B2778 80297F78 00000008 */  jr         $zero
    /* B277C 80297F7C 24080607 */   addiu     $t0, $zero, 0x607
endlabel func_80297F78

nonmatching func_80297F80, 0x8

glabel func_80297F80
    /* B2780 80297F80 00000008 */  jr         $zero
    /* B2784 80297F84 24080608 */   addiu     $t0, $zero, 0x608
endlabel func_80297F80

nonmatching func_80297F88, 0x8

glabel func_80297F88
    /* B2788 80297F88 00000008 */  jr         $zero
    /* B278C 80297F8C 24080609 */   addiu     $t0, $zero, 0x609
endlabel func_80297F88

nonmatching func_80297F90, 0x8

glabel func_80297F90
    /* B2790 80297F90 00000008 */  jr         $zero
    /* B2794 80297F94 2408060A */   addiu     $t0, $zero, 0x60A
endlabel func_80297F90

nonmatching func_80297F98, 0x8

glabel func_80297F98
    /* B2798 80297F98 00000008 */  jr         $zero
    /* B279C 80297F9C 2408060B */   addiu     $t0, $zero, 0x60B
endlabel func_80297F98

nonmatching func_80297FA0, 0x8

glabel func_80297FA0
    /* B27A0 80297FA0 00000008 */  jr         $zero
    /* B27A4 80297FA4 2408060C */   addiu     $t0, $zero, 0x60C
endlabel func_80297FA0

nonmatching func_80297FA8, 0x8

glabel func_80297FA8
    /* B27A8 80297FA8 00000008 */  jr         $zero
    /* B27AC 80297FAC 2408060D */   addiu     $t0, $zero, 0x60D
endlabel func_80297FA8

nonmatching func_80297FB0, 0x8

glabel func_80297FB0
    /* B27B0 80297FB0 00000008 */  jr         $zero
    /* B27B4 80297FB4 24080700 */   addiu     $t0, $zero, 0x700
endlabel func_80297FB0

nonmatching func_80297FB8, 0x8

glabel func_80297FB8
    /* B27B8 80297FB8 00000008 */  jr         $zero
    /* B27BC 80297FBC 24080701 */   addiu     $t0, $zero, 0x701
endlabel func_80297FB8

nonmatching func_80297FC0, 0x8

glabel func_80297FC0
    /* B27C0 80297FC0 00000008 */  jr         $zero
    /* B27C4 80297FC4 24080702 */   addiu     $t0, $zero, 0x702
endlabel func_80297FC0

nonmatching func_80297FC8, 0x8

glabel func_80297FC8
    /* B27C8 80297FC8 00000008 */  jr         $zero
    /* B27CC 80297FCC 24080703 */   addiu     $t0, $zero, 0x703
endlabel func_80297FC8

nonmatching func_80297FD0, 0x8

glabel func_80297FD0
    /* B27D0 80297FD0 00000008 */  jr         $zero
    /* B27D4 80297FD4 24080800 */   addiu     $t0, $zero, 0x800
endlabel func_80297FD0

nonmatching func_80297FD8, 0x8

glabel func_80297FD8
    /* B27D8 80297FD8 00000008 */  jr         $zero
    /* B27DC 80297FDC 24080801 */   addiu     $t0, $zero, 0x801
endlabel func_80297FD8

nonmatching func_80297FE0, 0x8

glabel func_80297FE0
    /* B27E0 80297FE0 00000008 */  jr         $zero
    /* B27E4 80297FE4 24080802 */   addiu     $t0, $zero, 0x802
endlabel func_80297FE0

nonmatching func_80297FE8, 0x8

glabel func_80297FE8
    /* B27E8 80297FE8 00000008 */  jr         $zero
    /* B27EC 80297FEC 24080803 */   addiu     $t0, $zero, 0x803
endlabel func_80297FE8

nonmatching func_80297FF0, 0x8

glabel func_80297FF0
    /* B27F0 80297FF0 00000008 */  jr         $zero
    /* B27F4 80297FF4 24080900 */   addiu     $t0, $zero, 0x900
endlabel func_80297FF0

nonmatching func_80297FF8, 0x8

glabel func_80297FF8
    /* B27F8 80297FF8 00000008 */  jr         $zero
    /* B27FC 80297FFC 24080901 */   addiu     $t0, $zero, 0x901
endlabel func_80297FF8

nonmatching func_80298000, 0x8

glabel func_80298000
    /* B2800 80298000 00000008 */  jr         $zero
    /* B2804 80298004 24080902 */   addiu     $t0, $zero, 0x902
endlabel func_80298000

nonmatching func_80298008, 0x8

glabel func_80298008
    /* B2808 80298008 00000008 */  jr         $zero
    /* B280C 8029800C 24080903 */   addiu     $t0, $zero, 0x903
endlabel func_80298008

nonmatching func_80298010, 0x8

glabel func_80298010
    /* B2810 80298010 00000008 */  jr         $zero
    /* B2814 80298014 24080904 */   addiu     $t0, $zero, 0x904
endlabel func_80298010

nonmatching func_80298018, 0x8

glabel func_80298018
    /* B2818 80298018 00000008 */  jr         $zero
    /* B281C 8029801C 24080905 */   addiu     $t0, $zero, 0x905
endlabel func_80298018

nonmatching func_80298020, 0x8

glabel func_80298020
    /* B2820 80298020 00000008 */  jr         $zero
    /* B2824 80298024 24080906 */   addiu     $t0, $zero, 0x906
endlabel func_80298020

nonmatching func_80298028, 0x8

glabel func_80298028
    /* B2828 80298028 00000008 */  jr         $zero
    /* B282C 8029802C 24080907 */   addiu     $t0, $zero, 0x907
endlabel func_80298028

nonmatching func_80298030, 0x8

glabel func_80298030
    /* B2830 80298030 00000008 */  jr         $zero
    /* B2834 80298034 24080A00 */   addiu     $t0, $zero, 0xA00
endlabel func_80298030

nonmatching func_80298038, 0x8

glabel func_80298038
    /* B2838 80298038 00000008 */  jr         $zero
    /* B283C 8029803C 24080A01 */   addiu     $t0, $zero, 0xA01
endlabel func_80298038

nonmatching func_80298040, 0x8

glabel func_80298040
    /* B2840 80298040 00000008 */  jr         $zero
    /* B2844 80298044 24080A02 */   addiu     $t0, $zero, 0xA02
endlabel func_80298040

nonmatching func_80298048, 0x8

glabel func_80298048
    /* B2848 80298048 00000008 */  jr         $zero
    /* B284C 8029804C 24080A03 */   addiu     $t0, $zero, 0xA03
endlabel func_80298048

nonmatching func_80298050, 0x8

glabel func_80298050
    /* B2850 80298050 00000008 */  jr         $zero
    /* B2854 80298054 24080A04 */   addiu     $t0, $zero, 0xA04
endlabel func_80298050

nonmatching func_80298058, 0x8

glabel func_80298058
    /* B2858 80298058 00000008 */  jr         $zero
    /* B285C 8029805C 24080A05 */   addiu     $t0, $zero, 0xA05
endlabel func_80298058

nonmatching func_80298060, 0x8

glabel func_80298060
    /* B2860 80298060 00000008 */  jr         $zero
    /* B2864 80298064 24080A06 */   addiu     $t0, $zero, 0xA06
endlabel func_80298060

nonmatching func_80298068, 0x8

glabel func_80298068
    /* B2868 80298068 00000008 */  jr         $zero
    /* B286C 8029806C 24080B00 */   addiu     $t0, $zero, 0xB00
endlabel func_80298068

nonmatching func_80298070, 0x8

glabel func_80298070
    /* B2870 80298070 00000008 */  jr         $zero
    /* B2874 80298074 24080B01 */   addiu     $t0, $zero, 0xB01
endlabel func_80298070

nonmatching func_80298078, 0x8

glabel func_80298078
    /* B2878 80298078 00000008 */  jr         $zero
    /* B287C 8029807C 24080C00 */   addiu     $t0, $zero, 0xC00
endlabel func_80298078

nonmatching func_80298080, 0x8

glabel func_80298080
    /* B2880 80298080 00000008 */  jr         $zero
    /* B2884 80298084 24080C01 */   addiu     $t0, $zero, 0xC01
endlabel func_80298080

nonmatching func_80298088, 0x8

glabel func_80298088
    /* B2888 80298088 00000008 */  jr         $zero
    /* B288C 8029808C 24080C02 */   addiu     $t0, $zero, 0xC02
endlabel func_80298088

nonmatching func_80298090, 0x8

glabel func_80298090
    /* B2890 80298090 00000008 */  jr         $zero
    /* B2894 80298094 24080D00 */   addiu     $t0, $zero, 0xD00
endlabel func_80298090

nonmatching func_80298098, 0x8

glabel func_80298098
    /* B2898 80298098 00000008 */  jr         $zero
    /* B289C 8029809C 24080D01 */   addiu     $t0, $zero, 0xD01
endlabel func_80298098

nonmatching func_802980A0, 0x8

glabel func_802980A0
    /* B28A0 802980A0 00000008 */  jr         $zero
    /* B28A4 802980A4 24080D02 */   addiu     $t0, $zero, 0xD02
endlabel func_802980A0

nonmatching func_802980A8, 0x8

glabel func_802980A8
    /* B28A8 802980A8 00000008 */  jr         $zero
    /* B28AC 802980AC 24080D03 */   addiu     $t0, $zero, 0xD03
endlabel func_802980A8

nonmatching func_802980B0, 0x8

glabel func_802980B0
    /* B28B0 802980B0 00000008 */  jr         $zero
    /* B28B4 802980B4 24080D04 */   addiu     $t0, $zero, 0xD04
endlabel func_802980B0

nonmatching func_802980B8, 0x8

glabel func_802980B8
    /* B28B8 802980B8 00000008 */  jr         $zero
    /* B28BC 802980BC 24080D05 */   addiu     $t0, $zero, 0xD05
endlabel func_802980B8

nonmatching func_802980C0, 0x8

glabel func_802980C0
    /* B28C0 802980C0 00000008 */  jr         $zero
    /* B28C4 802980C4 24080D06 */   addiu     $t0, $zero, 0xD06
endlabel func_802980C0

nonmatching func_802980C8, 0x8

glabel func_802980C8
    /* B28C8 802980C8 00000008 */  jr         $zero
    /* B28CC 802980CC 24080D07 */   addiu     $t0, $zero, 0xD07
endlabel func_802980C8

nonmatching func_802980D0, 0x8

glabel func_802980D0
    /* B28D0 802980D0 00000008 */  jr         $zero
    /* B28D4 802980D4 24080D08 */   addiu     $t0, $zero, 0xD08
endlabel func_802980D0

nonmatching func_802980D8, 0x8

glabel func_802980D8
    /* B28D8 802980D8 00000008 */  jr         $zero
    /* B28DC 802980DC 24080D09 */   addiu     $t0, $zero, 0xD09
endlabel func_802980D8

nonmatching func_802980E0, 0x8

glabel func_802980E0
    /* B28E0 802980E0 00000008 */  jr         $zero
    /* B28E4 802980E4 24080D0A */   addiu     $t0, $zero, 0xD0A
endlabel func_802980E0

nonmatching func_802980E8, 0x8

glabel func_802980E8
    /* B28E8 802980E8 00000008 */  jr         $zero
    /* B28EC 802980EC 24080D0B */   addiu     $t0, $zero, 0xD0B
endlabel func_802980E8

nonmatching func_802980F0, 0x8

glabel func_802980F0
    /* B28F0 802980F0 00000008 */  jr         $zero
    /* B28F4 802980F4 24080D0C */   addiu     $t0, $zero, 0xD0C
endlabel func_802980F0

nonmatching func_802980F8, 0x8

glabel func_802980F8
    /* B28F8 802980F8 00000008 */  jr         $zero
    /* B28FC 802980FC 24080D0D */   addiu     $t0, $zero, 0xD0D
endlabel func_802980F8

nonmatching func_80298100, 0x8

glabel func_80298100
    /* B2900 80298100 00000008 */  jr         $zero
    /* B2904 80298104 24080D0E */   addiu     $t0, $zero, 0xD0E
endlabel func_80298100

nonmatching func_80298108, 0x8

glabel func_80298108
    /* B2908 80298108 00000008 */  jr         $zero
    /* B290C 8029810C 24080D0F */   addiu     $t0, $zero, 0xD0F
endlabel func_80298108

nonmatching func_80298110, 0x8

glabel func_80298110
    /* B2910 80298110 00000008 */  jr         $zero
    /* B2914 80298114 24080D10 */   addiu     $t0, $zero, 0xD10
endlabel func_80298110

nonmatching func_80298118, 0x8

glabel func_80298118
    /* B2918 80298118 00000008 */  jr         $zero
    /* B291C 8029811C 24080D11 */   addiu     $t0, $zero, 0xD11
endlabel func_80298118

nonmatching func_80298120, 0x8

glabel func_80298120
    /* B2920 80298120 00000008 */  jr         $zero
    /* B2924 80298124 24080D12 */   addiu     $t0, $zero, 0xD12
endlabel func_80298120

nonmatching func_80298128, 0x8

glabel func_80298128
    /* B2928 80298128 00000008 */  jr         $zero
    /* B292C 8029812C 24080D13 */   addiu     $t0, $zero, 0xD13
endlabel func_80298128

nonmatching func_80298130, 0x8

glabel func_80298130
    /* B2930 80298130 00000008 */  jr         $zero
    /* B2934 80298134 24080D14 */   addiu     $t0, $zero, 0xD14
endlabel func_80298130

nonmatching func_80298138, 0x8

glabel func_80298138
    /* B2938 80298138 00000008 */  jr         $zero
    /* B293C 8029813C 24080D15 */   addiu     $t0, $zero, 0xD15
endlabel func_80298138

nonmatching func_80298140, 0x8

glabel func_80298140
    /* B2940 80298140 00000008 */  jr         $zero
    /* B2944 80298144 24080D16 */   addiu     $t0, $zero, 0xD16
endlabel func_80298140

nonmatching func_80298148, 0x8

glabel func_80298148
    /* B2948 80298148 00000008 */  jr         $zero
    /* B294C 8029814C 24080E00 */   addiu     $t0, $zero, 0xE00
endlabel func_80298148

nonmatching func_80298150, 0x8

glabel func_80298150
    /* B2950 80298150 00000008 */  jr         $zero
    /* B2954 80298154 24080E01 */   addiu     $t0, $zero, 0xE01
endlabel func_80298150

nonmatching func_80298158, 0x8

glabel func_80298158
    /* B2958 80298158 00000008 */  jr         $zero
    /* B295C 8029815C 24080E02 */   addiu     $t0, $zero, 0xE02
endlabel func_80298158

nonmatching func_80298160, 0x8

glabel func_80298160
    /* B2960 80298160 00000008 */  jr         $zero
    /* B2964 80298164 24080E03 */   addiu     $t0, $zero, 0xE03
endlabel func_80298160

nonmatching func_80298168, 0x8

glabel func_80298168
    /* B2968 80298168 00000008 */  jr         $zero
    /* B296C 8029816C 24080E04 */   addiu     $t0, $zero, 0xE04
endlabel func_80298168

nonmatching func_80298170, 0x8

glabel func_80298170
    /* B2970 80298170 00000008 */  jr         $zero
    /* B2974 80298174 24080F00 */   addiu     $t0, $zero, 0xF00
endlabel func_80298170

nonmatching func_80298178, 0x8

glabel func_80298178
    /* B2978 80298178 00000008 */  jr         $zero
    /* B297C 8029817C 24080F01 */   addiu     $t0, $zero, 0xF01
endlabel func_80298178

nonmatching func_80298180, 0x8

glabel func_80298180
    /* B2980 80298180 00000008 */  jr         $zero
    /* B2984 80298184 24080F02 */   addiu     $t0, $zero, 0xF02
endlabel func_80298180

nonmatching func_80298188, 0x8

glabel func_80298188
    /* B2988 80298188 00000008 */  jr         $zero
    /* B298C 8029818C 24080F03 */   addiu     $t0, $zero, 0xF03
endlabel func_80298188

nonmatching func_80298190, 0x8

glabel func_80298190
    /* B2990 80298190 00000008 */  jr         $zero
    /* B2994 80298194 24080F04 */   addiu     $t0, $zero, 0xF04
endlabel func_80298190

nonmatching func_80298198, 0x8

glabel func_80298198
    /* B2998 80298198 00000008 */  jr         $zero
    /* B299C 8029819C 24080F05 */   addiu     $t0, $zero, 0xF05
endlabel func_80298198

nonmatching func_802981A0, 0x8

glabel func_802981A0
    /* B29A0 802981A0 00000008 */  jr         $zero
    /* B29A4 802981A4 24080F06 */   addiu     $t0, $zero, 0xF06
endlabel func_802981A0

nonmatching func_802981A8, 0x8

glabel func_802981A8
    /* B29A8 802981A8 00000008 */  jr         $zero
    /* B29AC 802981AC 24080F07 */   addiu     $t0, $zero, 0xF07
endlabel func_802981A8

nonmatching func_802981B0, 0x8

glabel func_802981B0
    /* B29B0 802981B0 00000008 */  jr         $zero
    /* B29B4 802981B4 24080F08 */   addiu     $t0, $zero, 0xF08
endlabel func_802981B0

nonmatching func_802981B8, 0x8

glabel func_802981B8
    /* B29B8 802981B8 00000008 */  jr         $zero
    /* B29BC 802981BC 24080F09 */   addiu     $t0, $zero, 0xF09
endlabel func_802981B8

nonmatching func_802981C0, 0x8

glabel func_802981C0
    /* B29C0 802981C0 00000008 */  jr         $zero
    /* B29C4 802981C4 24080F0A */   addiu     $t0, $zero, 0xF0A
endlabel func_802981C0

nonmatching func_802981C8, 0x8

glabel func_802981C8
    /* B29C8 802981C8 00000008 */  jr         $zero
    /* B29CC 802981CC 24080F0B */   addiu     $t0, $zero, 0xF0B
endlabel func_802981C8

nonmatching func_802981D0, 0x8

glabel func_802981D0
    /* B29D0 802981D0 00000008 */  jr         $zero
    /* B29D4 802981D4 24080F0C */   addiu     $t0, $zero, 0xF0C
endlabel func_802981D0

nonmatching func_802981D8, 0x8

glabel func_802981D8
    /* B29D8 802981D8 00000008 */  jr         $zero
    /* B29DC 802981DC 24080F0D */   addiu     $t0, $zero, 0xF0D
endlabel func_802981D8

nonmatching func_802981E0, 0x8

glabel func_802981E0
    /* B29E0 802981E0 00000008 */  jr         $zero
    /* B29E4 802981E4 24080F0E */   addiu     $t0, $zero, 0xF0E
endlabel func_802981E0

nonmatching func_802981E8, 0x8

glabel func_802981E8
    /* B29E8 802981E8 00000008 */  jr         $zero
    /* B29EC 802981EC 24080F0F */   addiu     $t0, $zero, 0xF0F
endlabel func_802981E8

nonmatching func_802981F0, 0x8

glabel func_802981F0
    /* B29F0 802981F0 00000008 */  jr         $zero
    /* B29F4 802981F4 24080F10 */   addiu     $t0, $zero, 0xF10
endlabel func_802981F0

nonmatching func_802981F8, 0x8

glabel func_802981F8
    /* B29F8 802981F8 00000008 */  jr         $zero
    /* B29FC 802981FC 24080F11 */   addiu     $t0, $zero, 0xF11
endlabel func_802981F8

nonmatching func_80298200, 0x8

glabel func_80298200
    /* B2A00 80298200 00000008 */  jr         $zero
    /* B2A04 80298204 24080F12 */   addiu     $t0, $zero, 0xF12
endlabel func_80298200

nonmatching func_80298208, 0x8

glabel func_80298208
    /* B2A08 80298208 00000008 */  jr         $zero
    /* B2A0C 8029820C 24080F13 */   addiu     $t0, $zero, 0xF13
endlabel func_80298208

nonmatching func_80298210, 0x8

glabel func_80298210
    /* B2A10 80298210 00000008 */  jr         $zero
    /* B2A14 80298214 24080F14 */   addiu     $t0, $zero, 0xF14
endlabel func_80298210

nonmatching func_80298218, 0x8

glabel func_80298218
    /* B2A18 80298218 00000008 */  jr         $zero
    /* B2A1C 8029821C 24080F15 */   addiu     $t0, $zero, 0xF15
endlabel func_80298218

nonmatching func_80298220, 0x8

glabel func_80298220
    /* B2A20 80298220 00000008 */  jr         $zero
    /* B2A24 80298224 24080F16 */   addiu     $t0, $zero, 0xF16
endlabel func_80298220

nonmatching func_80298228, 0x8

glabel func_80298228
    /* B2A28 80298228 00000008 */  jr         $zero
    /* B2A2C 8029822C 24081000 */   addiu     $t0, $zero, 0x1000
endlabel func_80298228

nonmatching func_80298230, 0x8

glabel func_80298230
    /* B2A30 80298230 00000008 */  jr         $zero
    /* B2A34 80298234 24081001 */   addiu     $t0, $zero, 0x1001
endlabel func_80298230

nonmatching func_80298238, 0x8

glabel func_80298238
    /* B2A38 80298238 00000008 */  jr         $zero
    /* B2A3C 8029823C 24081002 */   addiu     $t0, $zero, 0x1002
endlabel func_80298238

nonmatching func_80298240, 0x8

glabel func_80298240
    /* B2A40 80298240 00000008 */  jr         $zero
    /* B2A44 80298244 24081003 */   addiu     $t0, $zero, 0x1003
endlabel func_80298240

nonmatching func_80298248, 0x8

glabel func_80298248
    /* B2A48 80298248 00000008 */  jr         $zero
    /* B2A4C 8029824C 24081004 */   addiu     $t0, $zero, 0x1004
endlabel func_80298248

nonmatching func_80298250, 0x8

glabel func_80298250
    /* B2A50 80298250 00000008 */  jr         $zero
    /* B2A54 80298254 24081005 */   addiu     $t0, $zero, 0x1005
endlabel func_80298250

nonmatching func_80298258, 0x8

glabel func_80298258
    /* B2A58 80298258 00000008 */  jr         $zero
    /* B2A5C 8029825C 24081006 */   addiu     $t0, $zero, 0x1006
endlabel func_80298258

nonmatching func_80298260, 0x8

glabel func_80298260
    /* B2A60 80298260 00000008 */  jr         $zero
    /* B2A64 80298264 24081007 */   addiu     $t0, $zero, 0x1007
endlabel func_80298260

nonmatching func_80298268, 0x8

glabel func_80298268
    /* B2A68 80298268 00000008 */  jr         $zero
    /* B2A6C 8029826C 24081008 */   addiu     $t0, $zero, 0x1008
endlabel func_80298268

nonmatching func_80298270, 0x8

glabel func_80298270
    /* B2A70 80298270 00000008 */  jr         $zero
    /* B2A74 80298274 24081009 */   addiu     $t0, $zero, 0x1009
endlabel func_80298270

nonmatching func_80298278, 0x8

glabel func_80298278
    /* B2A78 80298278 00000008 */  jr         $zero
    /* B2A7C 8029827C 2408100A */   addiu     $t0, $zero, 0x100A
endlabel func_80298278

nonmatching func_80298280, 0x8

glabel func_80298280
    /* B2A80 80298280 00000008 */  jr         $zero
    /* B2A84 80298284 2408100B */   addiu     $t0, $zero, 0x100B
endlabel func_80298280

nonmatching func_80298288, 0x8

glabel func_80298288
    /* B2A88 80298288 00000008 */  jr         $zero
    /* B2A8C 8029828C 2408100C */   addiu     $t0, $zero, 0x100C
endlabel func_80298288

nonmatching func_80298290, 0x8

glabel func_80298290
    /* B2A90 80298290 00000008 */  jr         $zero
    /* B2A94 80298294 2408100D */   addiu     $t0, $zero, 0x100D
endlabel func_80298290

nonmatching func_80298298, 0x8

glabel func_80298298
    /* B2A98 80298298 00000008 */  jr         $zero
    /* B2A9C 8029829C 2408100E */   addiu     $t0, $zero, 0x100E
endlabel func_80298298

nonmatching func_802982A0, 0x8

glabel func_802982A0
    /* B2AA0 802982A0 00000008 */  jr         $zero
    /* B2AA4 802982A4 2408100F */   addiu     $t0, $zero, 0x100F
endlabel func_802982A0

nonmatching func_802982A8, 0x8

glabel func_802982A8
    /* B2AA8 802982A8 00000008 */  jr         $zero
    /* B2AAC 802982AC 24081010 */   addiu     $t0, $zero, 0x1010
endlabel func_802982A8

nonmatching func_802982B0, 0x8

glabel func_802982B0
    /* B2AB0 802982B0 00000008 */  jr         $zero
    /* B2AB4 802982B4 24081011 */   addiu     $t0, $zero, 0x1011
endlabel func_802982B0

nonmatching func_802982B8, 0x8

glabel func_802982B8
    /* B2AB8 802982B8 00000008 */  jr         $zero
    /* B2ABC 802982BC 24081012 */   addiu     $t0, $zero, 0x1012
endlabel func_802982B8

nonmatching func_802982C0, 0x8

glabel func_802982C0
    /* B2AC0 802982C0 00000008 */  jr         $zero
    /* B2AC4 802982C4 24081013 */   addiu     $t0, $zero, 0x1013
endlabel func_802982C0

nonmatching func_802982C8, 0x8

glabel func_802982C8
    /* B2AC8 802982C8 00000008 */  jr         $zero
    /* B2ACC 802982CC 24081014 */   addiu     $t0, $zero, 0x1014
endlabel func_802982C8

nonmatching func_802982D0, 0x8

glabel func_802982D0
    /* B2AD0 802982D0 00000008 */  jr         $zero
    /* B2AD4 802982D4 24081015 */   addiu     $t0, $zero, 0x1015
endlabel func_802982D0

nonmatching func_802982D8, 0x8

glabel func_802982D8
    /* B2AD8 802982D8 00000008 */  jr         $zero
    /* B2ADC 802982DC 24081016 */   addiu     $t0, $zero, 0x1016
endlabel func_802982D8

nonmatching func_802982E0, 0x8

glabel func_802982E0
    /* B2AE0 802982E0 00000008 */  jr         $zero
    /* B2AE4 802982E4 24081017 */   addiu     $t0, $zero, 0x1017
endlabel func_802982E0

nonmatching func_802982E8, 0x8

glabel func_802982E8
    /* B2AE8 802982E8 00000008 */  jr         $zero
    /* B2AEC 802982EC 24081018 */   addiu     $t0, $zero, 0x1018
endlabel func_802982E8

nonmatching func_802982F0, 0x8

glabel func_802982F0
    /* B2AF0 802982F0 00000008 */  jr         $zero
    /* B2AF4 802982F4 24081019 */   addiu     $t0, $zero, 0x1019
endlabel func_802982F0

nonmatching func_802982F8, 0x8

glabel func_802982F8
    /* B2AF8 802982F8 00000008 */  jr         $zero
    /* B2AFC 802982FC 2408101A */   addiu     $t0, $zero, 0x101A
endlabel func_802982F8

nonmatching func_80298300, 0x8

glabel func_80298300
    /* B2B00 80298300 00000008 */  jr         $zero
    /* B2B04 80298304 2408101B */   addiu     $t0, $zero, 0x101B
endlabel func_80298300

nonmatching func_80298308, 0x8

glabel func_80298308
    /* B2B08 80298308 00000008 */  jr         $zero
    /* B2B0C 8029830C 2408101C */   addiu     $t0, $zero, 0x101C
endlabel func_80298308

nonmatching func_80298310, 0x8

glabel func_80298310
    /* B2B10 80298310 00000008 */  jr         $zero
    /* B2B14 80298314 2408101D */   addiu     $t0, $zero, 0x101D
endlabel func_80298310

nonmatching func_80298318, 0x8

glabel func_80298318
    /* B2B18 80298318 00000008 */  jr         $zero
    /* B2B1C 8029831C 2408101E */   addiu     $t0, $zero, 0x101E
endlabel func_80298318

nonmatching func_80298320, 0x8

glabel func_80298320
    /* B2B20 80298320 00000008 */  jr         $zero
    /* B2B24 80298324 2408101F */   addiu     $t0, $zero, 0x101F
endlabel func_80298320

nonmatching func_80298328, 0x8

glabel func_80298328
    /* B2B28 80298328 00000008 */  jr         $zero
    /* B2B2C 8029832C 24081020 */   addiu     $t0, $zero, 0x1020
endlabel func_80298328

nonmatching func_80298330, 0x8

glabel func_80298330
    /* B2B30 80298330 00000008 */  jr         $zero
    /* B2B34 80298334 24081021 */   addiu     $t0, $zero, 0x1021
endlabel func_80298330

nonmatching func_80298338, 0x8

glabel func_80298338
    /* B2B38 80298338 00000008 */  jr         $zero
    /* B2B3C 8029833C 24081022 */   addiu     $t0, $zero, 0x1022
endlabel func_80298338

nonmatching func_80298340, 0x8

glabel func_80298340
    /* B2B40 80298340 00000008 */  jr         $zero
    /* B2B44 80298344 24081023 */   addiu     $t0, $zero, 0x1023
endlabel func_80298340

nonmatching func_80298348, 0x8

glabel func_80298348
    /* B2B48 80298348 00000008 */  jr         $zero
    /* B2B4C 8029834C 24081024 */   addiu     $t0, $zero, 0x1024
endlabel func_80298348

nonmatching func_80298350, 0x8

glabel func_80298350
    /* B2B50 80298350 00000008 */  jr         $zero
    /* B2B54 80298354 24081025 */   addiu     $t0, $zero, 0x1025
endlabel func_80298350

nonmatching func_80298358, 0x8

glabel func_80298358
    /* B2B58 80298358 00000008 */  jr         $zero
    /* B2B5C 8029835C 24081100 */   addiu     $t0, $zero, 0x1100
endlabel func_80298358

nonmatching func_80298360, 0x8

glabel func_80298360
    /* B2B60 80298360 00000008 */  jr         $zero
    /* B2B64 80298364 24081101 */   addiu     $t0, $zero, 0x1101
endlabel func_80298360

nonmatching func_80298368, 0x8

glabel func_80298368
    /* B2B68 80298368 00000008 */  jr         $zero
    /* B2B6C 8029836C 24081102 */   addiu     $t0, $zero, 0x1102
endlabel func_80298368

nonmatching func_80298370, 0x8

glabel func_80298370
    /* B2B70 80298370 00000008 */  jr         $zero
    /* B2B74 80298374 24081200 */   addiu     $t0, $zero, 0x1200
endlabel func_80298370

nonmatching func_80298378, 0x8

glabel func_80298378
    /* B2B78 80298378 00000008 */  jr         $zero
    /* B2B7C 8029837C 24081201 */   addiu     $t0, $zero, 0x1201
endlabel func_80298378

nonmatching func_80298380, 0x8

glabel func_80298380
    /* B2B80 80298380 00000008 */  jr         $zero
    /* B2B84 80298384 24081202 */   addiu     $t0, $zero, 0x1202
endlabel func_80298380

nonmatching func_80298388, 0x8

glabel func_80298388
    /* B2B88 80298388 00000008 */  jr         $zero
    /* B2B8C 8029838C 24081203 */   addiu     $t0, $zero, 0x1203
endlabel func_80298388

nonmatching func_80298390, 0x8

glabel func_80298390
    /* B2B90 80298390 00000008 */  jr         $zero
    /* B2B94 80298394 24081204 */   addiu     $t0, $zero, 0x1204
endlabel func_80298390

nonmatching func_80298398, 0x8

glabel func_80298398
    /* B2B98 80298398 00000008 */  jr         $zero
    /* B2B9C 8029839C 24081205 */   addiu     $t0, $zero, 0x1205
endlabel func_80298398

nonmatching func_802983A0, 0x8

glabel func_802983A0
    /* B2BA0 802983A0 00000008 */  jr         $zero
    /* B2BA4 802983A4 24081206 */   addiu     $t0, $zero, 0x1206
endlabel func_802983A0

nonmatching func_802983A8, 0x8

glabel func_802983A8
    /* B2BA8 802983A8 00000008 */  jr         $zero
    /* B2BAC 802983AC 24081207 */   addiu     $t0, $zero, 0x1207
endlabel func_802983A8

nonmatching func_802983B0, 0x8

glabel func_802983B0
    /* B2BB0 802983B0 00000008 */  jr         $zero
    /* B2BB4 802983B4 24081208 */   addiu     $t0, $zero, 0x1208
endlabel func_802983B0

nonmatching func_802983B8, 0x8

glabel func_802983B8
    /* B2BB8 802983B8 00000008 */  jr         $zero
    /* B2BBC 802983BC 24081300 */   addiu     $t0, $zero, 0x1300
endlabel func_802983B8

nonmatching func_802983C0, 0x8

glabel func_802983C0
    /* B2BC0 802983C0 00000008 */  jr         $zero
    /* B2BC4 802983C4 24081301 */   addiu     $t0, $zero, 0x1301
endlabel func_802983C0

nonmatching func_802983C8, 0x8

glabel func_802983C8
    /* B2BC8 802983C8 00000008 */  jr         $zero
    /* B2BCC 802983CC 24081302 */   addiu     $t0, $zero, 0x1302
endlabel func_802983C8

nonmatching func_802983D0, 0x8

glabel func_802983D0
    /* B2BD0 802983D0 00000008 */  jr         $zero
    /* B2BD4 802983D4 24081303 */   addiu     $t0, $zero, 0x1303
endlabel func_802983D0

nonmatching func_802983D8, 0x8

glabel func_802983D8
    /* B2BD8 802983D8 00000008 */  jr         $zero
    /* B2BDC 802983DC 24081304 */   addiu     $t0, $zero, 0x1304
endlabel func_802983D8

nonmatching func_802983E0, 0x8

glabel func_802983E0
    /* B2BE0 802983E0 00000008 */  jr         $zero
    /* B2BE4 802983E4 24081305 */   addiu     $t0, $zero, 0x1305
endlabel func_802983E0

nonmatching func_802983E8, 0x8

glabel func_802983E8
    /* B2BE8 802983E8 00000008 */  jr         $zero
    /* B2BEC 802983EC 24081306 */   addiu     $t0, $zero, 0x1306
endlabel func_802983E8

nonmatching func_802983F0, 0x8

glabel func_802983F0
    /* B2BF0 802983F0 00000008 */  jr         $zero
    /* B2BF4 802983F4 24081307 */   addiu     $t0, $zero, 0x1307
endlabel func_802983F0

nonmatching func_802983F8, 0x8

glabel func_802983F8
    /* B2BF8 802983F8 00000008 */  jr         $zero
    /* B2BFC 802983FC 24081308 */   addiu     $t0, $zero, 0x1308
endlabel func_802983F8

nonmatching func_80298400, 0x8

glabel func_80298400
    /* B2C00 80298400 00000008 */  jr         $zero
    /* B2C04 80298404 24081309 */   addiu     $t0, $zero, 0x1309
endlabel func_80298400

nonmatching func_80298408, 0x8

glabel func_80298408
    /* B2C08 80298408 00000008 */  jr         $zero
    /* B2C0C 8029840C 2408130A */   addiu     $t0, $zero, 0x130A
endlabel func_80298408

nonmatching func_80298410, 0x8

glabel func_80298410
    /* B2C10 80298410 00000008 */  jr         $zero
    /* B2C14 80298414 2408130B */   addiu     $t0, $zero, 0x130B
endlabel func_80298410

nonmatching func_80298418, 0x8

glabel func_80298418
    /* B2C18 80298418 00000008 */  jr         $zero
    /* B2C1C 8029841C 2408130C */   addiu     $t0, $zero, 0x130C
endlabel func_80298418

nonmatching func_80298420, 0x8

glabel func_80298420
    /* B2C20 80298420 00000008 */  jr         $zero
    /* B2C24 80298424 2408130D */   addiu     $t0, $zero, 0x130D
endlabel func_80298420

nonmatching func_80298428, 0x8

glabel func_80298428
    /* B2C28 80298428 00000008 */  jr         $zero
    /* B2C2C 8029842C 2408130E */   addiu     $t0, $zero, 0x130E
endlabel func_80298428

nonmatching func_80298430, 0x8

glabel func_80298430
    /* B2C30 80298430 00000008 */  jr         $zero
    /* B2C34 80298434 2408130F */   addiu     $t0, $zero, 0x130F
endlabel func_80298430

nonmatching func_80298438, 0x8

glabel func_80298438
    /* B2C38 80298438 00000008 */  jr         $zero
    /* B2C3C 8029843C 24081310 */   addiu     $t0, $zero, 0x1310
endlabel func_80298438

nonmatching func_80298440, 0x8

glabel func_80298440
    /* B2C40 80298440 00000008 */  jr         $zero
    /* B2C44 80298444 24081311 */   addiu     $t0, $zero, 0x1311
endlabel func_80298440

nonmatching func_80298448, 0x8

glabel func_80298448
    /* B2C48 80298448 00000008 */  jr         $zero
    /* B2C4C 8029844C 24081312 */   addiu     $t0, $zero, 0x1312
endlabel func_80298448

nonmatching func_80298450, 0x8

glabel func_80298450
    /* B2C50 80298450 00000008 */  jr         $zero
    /* B2C54 80298454 24081313 */   addiu     $t0, $zero, 0x1313
endlabel func_80298450

nonmatching func_80298458, 0x8

glabel func_80298458
    /* B2C58 80298458 00000008 */  jr         $zero
    /* B2C5C 8029845C 24081314 */   addiu     $t0, $zero, 0x1314
endlabel func_80298458

nonmatching func_80298460, 0x8

glabel func_80298460
    /* B2C60 80298460 00000008 */  jr         $zero
    /* B2C64 80298464 24081315 */   addiu     $t0, $zero, 0x1315
endlabel func_80298460

nonmatching func_80298468, 0x8

glabel func_80298468
    /* B2C68 80298468 00000008 */  jr         $zero
    /* B2C6C 8029846C 24081316 */   addiu     $t0, $zero, 0x1316
endlabel func_80298468

nonmatching func_80298470, 0x8

glabel func_80298470
    /* B2C70 80298470 00000008 */  jr         $zero
    /* B2C74 80298474 24081317 */   addiu     $t0, $zero, 0x1317
endlabel func_80298470

nonmatching func_80298478, 0x8

glabel func_80298478
    /* B2C78 80298478 00000008 */  jr         $zero
    /* B2C7C 8029847C 24081318 */   addiu     $t0, $zero, 0x1318
endlabel func_80298478

nonmatching func_80298480, 0x8

glabel func_80298480
    /* B2C80 80298480 00000008 */  jr         $zero
    /* B2C84 80298484 24081319 */   addiu     $t0, $zero, 0x1319
endlabel func_80298480

nonmatching func_80298488, 0x8

glabel func_80298488
    /* B2C88 80298488 00000008 */  jr         $zero
    /* B2C8C 8029848C 2408131A */   addiu     $t0, $zero, 0x131A
endlabel func_80298488

nonmatching func_80298490, 0x8

glabel func_80298490
    /* B2C90 80298490 00000008 */  jr         $zero
    /* B2C94 80298494 2408131B */   addiu     $t0, $zero, 0x131B
endlabel func_80298490

nonmatching func_80298498, 0x8

glabel func_80298498
    /* B2C98 80298498 00000008 */  jr         $zero
    /* B2C9C 8029849C 2408131C */   addiu     $t0, $zero, 0x131C
endlabel func_80298498

nonmatching func_802984A0, 0x8

glabel func_802984A0
    /* B2CA0 802984A0 00000008 */  jr         $zero
    /* B2CA4 802984A4 2408131D */   addiu     $t0, $zero, 0x131D
endlabel func_802984A0

nonmatching func_802984A8, 0x8

glabel func_802984A8
    /* B2CA8 802984A8 00000008 */  jr         $zero
    /* B2CAC 802984AC 2408131E */   addiu     $t0, $zero, 0x131E
endlabel func_802984A8

nonmatching func_802984B0, 0x8

glabel func_802984B0
    /* B2CB0 802984B0 00000008 */  jr         $zero
    /* B2CB4 802984B4 2408131F */   addiu     $t0, $zero, 0x131F
endlabel func_802984B0

nonmatching func_802984B8, 0x8

glabel func_802984B8
    /* B2CB8 802984B8 00000008 */  jr         $zero
    /* B2CBC 802984BC 24081320 */   addiu     $t0, $zero, 0x1320
endlabel func_802984B8

nonmatching func_802984C0, 0x8

glabel func_802984C0
    /* B2CC0 802984C0 00000008 */  jr         $zero
    /* B2CC4 802984C4 24081321 */   addiu     $t0, $zero, 0x1321
endlabel func_802984C0

nonmatching func_802984C8, 0x8

glabel func_802984C8
    /* B2CC8 802984C8 00000008 */  jr         $zero
    /* B2CCC 802984CC 24081322 */   addiu     $t0, $zero, 0x1322
endlabel func_802984C8

nonmatching func_802984D0, 0x8

glabel func_802984D0
    /* B2CD0 802984D0 00000008 */  jr         $zero
    /* B2CD4 802984D4 24081323 */   addiu     $t0, $zero, 0x1323
endlabel func_802984D0

nonmatching func_802984D8, 0x8

glabel func_802984D8
    /* B2CD8 802984D8 00000008 */  jr         $zero
    /* B2CDC 802984DC 24081324 */   addiu     $t0, $zero, 0x1324
endlabel func_802984D8

nonmatching func_802984E0, 0x8

glabel func_802984E0
    /* B2CE0 802984E0 00000008 */  jr         $zero
    /* B2CE4 802984E4 24081325 */   addiu     $t0, $zero, 0x1325
endlabel func_802984E0

nonmatching func_802984E8, 0x8

glabel func_802984E8
    /* B2CE8 802984E8 00000008 */  jr         $zero
    /* B2CEC 802984EC 24081326 */   addiu     $t0, $zero, 0x1326
endlabel func_802984E8

nonmatching func_802984F0, 0x8

glabel func_802984F0
    /* B2CF0 802984F0 00000008 */  jr         $zero
    /* B2CF4 802984F4 24081327 */   addiu     $t0, $zero, 0x1327
endlabel func_802984F0

nonmatching func_802984F8, 0x8

glabel func_802984F8
    /* B2CF8 802984F8 00000008 */  jr         $zero
    /* B2CFC 802984FC 24081328 */   addiu     $t0, $zero, 0x1328
endlabel func_802984F8

nonmatching func_80298500, 0x8

glabel func_80298500
    /* B2D00 80298500 00000008 */  jr         $zero
    /* B2D04 80298504 24081329 */   addiu     $t0, $zero, 0x1329
endlabel func_80298500

nonmatching func_80298508, 0x8

glabel func_80298508
    /* B2D08 80298508 00000008 */  jr         $zero
    /* B2D0C 8029850C 2408132A */   addiu     $t0, $zero, 0x132A
endlabel func_80298508

nonmatching func_80298510, 0x8

glabel func_80298510
    /* B2D10 80298510 00000008 */  jr         $zero
    /* B2D14 80298514 2408132B */   addiu     $t0, $zero, 0x132B
endlabel func_80298510

nonmatching func_80298518, 0x8

glabel func_80298518
    /* B2D18 80298518 00000008 */  jr         $zero
    /* B2D1C 8029851C 2408132C */   addiu     $t0, $zero, 0x132C
endlabel func_80298518

nonmatching func_80298520, 0x8

glabel func_80298520
    /* B2D20 80298520 00000008 */  jr         $zero
    /* B2D24 80298524 2408132D */   addiu     $t0, $zero, 0x132D
endlabel func_80298520

nonmatching func_80298528, 0x8

glabel func_80298528
    /* B2D28 80298528 00000008 */  jr         $zero
    /* B2D2C 8029852C 2408132E */   addiu     $t0, $zero, 0x132E
endlabel func_80298528

nonmatching func_80298530, 0x8

glabel func_80298530
    /* B2D30 80298530 00000008 */  jr         $zero
    /* B2D34 80298534 2408132F */   addiu     $t0, $zero, 0x132F
endlabel func_80298530

nonmatching func_80298538, 0x8

glabel func_80298538
    /* B2D38 80298538 00000008 */  jr         $zero
    /* B2D3C 8029853C 24081330 */   addiu     $t0, $zero, 0x1330
endlabel func_80298538

nonmatching func_80298540, 0x8

glabel func_80298540
    /* B2D40 80298540 00000008 */  jr         $zero
    /* B2D44 80298544 24081331 */   addiu     $t0, $zero, 0x1331
endlabel func_80298540

nonmatching func_80298548, 0x8

glabel func_80298548
    /* B2D48 80298548 00000008 */  jr         $zero
    /* B2D4C 8029854C 24081332 */   addiu     $t0, $zero, 0x1332
endlabel func_80298548

nonmatching func_80298550, 0x8

glabel func_80298550
    /* B2D50 80298550 00000008 */  jr         $zero
    /* B2D54 80298554 24081333 */   addiu     $t0, $zero, 0x1333
endlabel func_80298550

nonmatching func_80298558, 0x8

glabel func_80298558
    /* B2D58 80298558 00000008 */  jr         $zero
    /* B2D5C 8029855C 24081334 */   addiu     $t0, $zero, 0x1334
endlabel func_80298558

nonmatching func_80298560, 0x8

glabel func_80298560
    /* B2D60 80298560 00000008 */  jr         $zero
    /* B2D64 80298564 24081335 */   addiu     $t0, $zero, 0x1335
endlabel func_80298560

nonmatching func_80298568, 0x8

glabel func_80298568
    /* B2D68 80298568 00000008 */  jr         $zero
    /* B2D6C 8029856C 24081336 */   addiu     $t0, $zero, 0x1336
endlabel func_80298568

nonmatching func_80298570, 0x8

glabel func_80298570
    /* B2D70 80298570 00000008 */  jr         $zero
    /* B2D74 80298574 24081337 */   addiu     $t0, $zero, 0x1337
endlabel func_80298570

nonmatching func_80298578, 0x8

glabel func_80298578
    /* B2D78 80298578 00000008 */  jr         $zero
    /* B2D7C 8029857C 24081338 */   addiu     $t0, $zero, 0x1338
endlabel func_80298578

nonmatching func_80298580, 0x8

glabel func_80298580
    /* B2D80 80298580 00000008 */  jr         $zero
    /* B2D84 80298584 24081339 */   addiu     $t0, $zero, 0x1339
endlabel func_80298580

nonmatching func_80298588, 0x8

glabel func_80298588
    /* B2D88 80298588 00000008 */  jr         $zero
    /* B2D8C 8029858C 2408133A */   addiu     $t0, $zero, 0x133A
endlabel func_80298588

nonmatching func_80298590, 0x8

glabel func_80298590
    /* B2D90 80298590 00000008 */  jr         $zero
    /* B2D94 80298594 2408133B */   addiu     $t0, $zero, 0x133B
endlabel func_80298590

nonmatching func_80298598, 0x8

glabel func_80298598
    /* B2D98 80298598 00000008 */  jr         $zero
    /* B2D9C 8029859C 2408133C */   addiu     $t0, $zero, 0x133C
endlabel func_80298598

nonmatching func_802985A0, 0x8

glabel func_802985A0
    /* B2DA0 802985A0 00000008 */  jr         $zero
    /* B2DA4 802985A4 2408133D */   addiu     $t0, $zero, 0x133D
endlabel func_802985A0

nonmatching func_802985A8, 0x8

glabel func_802985A8
    /* B2DA8 802985A8 00000008 */  jr         $zero
    /* B2DAC 802985AC 2408133E */   addiu     $t0, $zero, 0x133E
endlabel func_802985A8

nonmatching func_802985B0, 0x8

glabel func_802985B0
    /* B2DB0 802985B0 00000008 */  jr         $zero
    /* B2DB4 802985B4 2408133F */   addiu     $t0, $zero, 0x133F
endlabel func_802985B0

nonmatching func_802985B8, 0x8

glabel func_802985B8
    /* B2DB8 802985B8 00000008 */  jr         $zero
    /* B2DBC 802985BC 24081340 */   addiu     $t0, $zero, 0x1340
endlabel func_802985B8

nonmatching func_802985C0, 0x8

glabel func_802985C0
    /* B2DC0 802985C0 00000008 */  jr         $zero
    /* B2DC4 802985C4 24081341 */   addiu     $t0, $zero, 0x1341
endlabel func_802985C0

nonmatching func_802985C8, 0x8

glabel func_802985C8
    /* B2DC8 802985C8 00000008 */  jr         $zero
    /* B2DCC 802985CC 24081342 */   addiu     $t0, $zero, 0x1342
endlabel func_802985C8

nonmatching func_802985D0, 0x8

glabel func_802985D0
    /* B2DD0 802985D0 00000008 */  jr         $zero
    /* B2DD4 802985D4 24081343 */   addiu     $t0, $zero, 0x1343
endlabel func_802985D0

nonmatching func_802985D8, 0x8

glabel func_802985D8
    /* B2DD8 802985D8 00000008 */  jr         $zero
    /* B2DDC 802985DC 24081344 */   addiu     $t0, $zero, 0x1344
endlabel func_802985D8

nonmatching func_802985E0, 0x8

glabel func_802985E0
    /* B2DE0 802985E0 00000008 */  jr         $zero
    /* B2DE4 802985E4 24081345 */   addiu     $t0, $zero, 0x1345
endlabel func_802985E0

nonmatching func_802985E8, 0x8

glabel func_802985E8
    /* B2DE8 802985E8 00000008 */  jr         $zero
    /* B2DEC 802985EC 24081346 */   addiu     $t0, $zero, 0x1346
endlabel func_802985E8

nonmatching func_802985F0, 0x8

glabel func_802985F0
    /* B2DF0 802985F0 00000008 */  jr         $zero
    /* B2DF4 802985F4 24081347 */   addiu     $t0, $zero, 0x1347
endlabel func_802985F0

nonmatching func_802985F8, 0x8

glabel func_802985F8
    /* B2DF8 802985F8 00000008 */  jr         $zero
    /* B2DFC 802985FC 24081348 */   addiu     $t0, $zero, 0x1348
endlabel func_802985F8

nonmatching func_80298600, 0x8

glabel func_80298600
    /* B2E00 80298600 00000008 */  jr         $zero
    /* B2E04 80298604 24081349 */   addiu     $t0, $zero, 0x1349
endlabel func_80298600

nonmatching func_80298608, 0x8

glabel func_80298608
    /* B2E08 80298608 00000008 */  jr         $zero
    /* B2E0C 8029860C 2408134A */   addiu     $t0, $zero, 0x134A
endlabel func_80298608

nonmatching func_80298610, 0x8

glabel func_80298610
    /* B2E10 80298610 00000008 */  jr         $zero
    /* B2E14 80298614 2408134B */   addiu     $t0, $zero, 0x134B
endlabel func_80298610

nonmatching func_80298618, 0x8

glabel func_80298618
    /* B2E18 80298618 00000008 */  jr         $zero
    /* B2E1C 8029861C 2408134C */   addiu     $t0, $zero, 0x134C
endlabel func_80298618

nonmatching func_80298620, 0x8

glabel func_80298620
    /* B2E20 80298620 00000008 */  jr         $zero
    /* B2E24 80298624 2408134D */   addiu     $t0, $zero, 0x134D
endlabel func_80298620

nonmatching func_80298628, 0x8

glabel func_80298628
    /* B2E28 80298628 00000008 */  jr         $zero
    /* B2E2C 8029862C 2408134E */   addiu     $t0, $zero, 0x134E
endlabel func_80298628

nonmatching func_80298630, 0x8

glabel func_80298630
    /* B2E30 80298630 00000008 */  jr         $zero
    /* B2E34 80298634 2408134F */   addiu     $t0, $zero, 0x134F
endlabel func_80298630

nonmatching func_80298638, 0x8

glabel func_80298638
    /* B2E38 80298638 00000008 */  jr         $zero
    /* B2E3C 8029863C 24081350 */   addiu     $t0, $zero, 0x1350
endlabel func_80298638

nonmatching func_80298640, 0x8

glabel func_80298640
    /* B2E40 80298640 00000008 */  jr         $zero
    /* B2E44 80298644 24081351 */   addiu     $t0, $zero, 0x1351
endlabel func_80298640

nonmatching func_80298648, 0x8

glabel func_80298648
    /* B2E48 80298648 00000008 */  jr         $zero
    /* B2E4C 8029864C 24081352 */   addiu     $t0, $zero, 0x1352
endlabel func_80298648

nonmatching func_80298650, 0x8

glabel func_80298650
    /* B2E50 80298650 00000008 */  jr         $zero
    /* B2E54 80298654 24081353 */   addiu     $t0, $zero, 0x1353
endlabel func_80298650

nonmatching func_80298658, 0x8

glabel func_80298658
    /* B2E58 80298658 00000008 */  jr         $zero
    /* B2E5C 8029865C 24081354 */   addiu     $t0, $zero, 0x1354
endlabel func_80298658

nonmatching func_80298660, 0x8

glabel func_80298660
    /* B2E60 80298660 00000008 */  jr         $zero
    /* B2E64 80298664 24081355 */   addiu     $t0, $zero, 0x1355
endlabel func_80298660

nonmatching func_80298668, 0x8

glabel func_80298668
    /* B2E68 80298668 00000008 */  jr         $zero
    /* B2E6C 8029866C 24081356 */   addiu     $t0, $zero, 0x1356
endlabel func_80298668

nonmatching func_80298670, 0x8

glabel func_80298670
    /* B2E70 80298670 00000008 */  jr         $zero
    /* B2E74 80298674 24081357 */   addiu     $t0, $zero, 0x1357
endlabel func_80298670

nonmatching func_80298678, 0x8

glabel func_80298678
    /* B2E78 80298678 00000008 */  jr         $zero
    /* B2E7C 8029867C 24081358 */   addiu     $t0, $zero, 0x1358
endlabel func_80298678

nonmatching func_80298680, 0x8

glabel func_80298680
    /* B2E80 80298680 00000008 */  jr         $zero
    /* B2E84 80298684 24081359 */   addiu     $t0, $zero, 0x1359
endlabel func_80298680

nonmatching func_80298688, 0x8

glabel func_80298688
    /* B2E88 80298688 00000008 */  jr         $zero
    /* B2E8C 8029868C 2408135A */   addiu     $t0, $zero, 0x135A
endlabel func_80298688

nonmatching func_80298690, 0x8

glabel func_80298690
    /* B2E90 80298690 00000008 */  jr         $zero
    /* B2E94 80298694 2408135B */   addiu     $t0, $zero, 0x135B
endlabel func_80298690

nonmatching func_80298698, 0x8

glabel func_80298698
    /* B2E98 80298698 00000008 */  jr         $zero
    /* B2E9C 8029869C 2408135C */   addiu     $t0, $zero, 0x135C
endlabel func_80298698

nonmatching func_802986A0, 0x8

glabel func_802986A0
    /* B2EA0 802986A0 00000008 */  jr         $zero
    /* B2EA4 802986A4 2408135D */   addiu     $t0, $zero, 0x135D
endlabel func_802986A0

nonmatching func_802986A8, 0x8

glabel func_802986A8
    /* B2EA8 802986A8 00000008 */  jr         $zero
    /* B2EAC 802986AC 2408135E */   addiu     $t0, $zero, 0x135E
endlabel func_802986A8

nonmatching func_802986B0, 0x8

glabel func_802986B0
    /* B2EB0 802986B0 00000008 */  jr         $zero
    /* B2EB4 802986B4 2408135F */   addiu     $t0, $zero, 0x135F
endlabel func_802986B0

nonmatching func_802986B8, 0x8

glabel func_802986B8
    /* B2EB8 802986B8 00000008 */  jr         $zero
    /* B2EBC 802986BC 24081360 */   addiu     $t0, $zero, 0x1360
endlabel func_802986B8

nonmatching func_802986C0, 0x8

glabel func_802986C0
    /* B2EC0 802986C0 00000008 */  jr         $zero
    /* B2EC4 802986C4 24081361 */   addiu     $t0, $zero, 0x1361
endlabel func_802986C0

nonmatching func_802986C8, 0x8

glabel func_802986C8
    /* B2EC8 802986C8 00000008 */  jr         $zero
    /* B2ECC 802986CC 24081362 */   addiu     $t0, $zero, 0x1362
endlabel func_802986C8

nonmatching func_802986D0, 0x8

glabel func_802986D0
    /* B2ED0 802986D0 00000008 */  jr         $zero
    /* B2ED4 802986D4 24081363 */   addiu     $t0, $zero, 0x1363
endlabel func_802986D0

nonmatching func_802986D8, 0x8

glabel func_802986D8
    /* B2ED8 802986D8 00000008 */  jr         $zero
    /* B2EDC 802986DC 24081364 */   addiu     $t0, $zero, 0x1364
endlabel func_802986D8

nonmatching func_802986E0, 0x8

glabel func_802986E0
    /* B2EE0 802986E0 00000008 */  jr         $zero
    /* B2EE4 802986E4 24081365 */   addiu     $t0, $zero, 0x1365
endlabel func_802986E0

nonmatching func_802986E8, 0x8

glabel func_802986E8
    /* B2EE8 802986E8 00000008 */  jr         $zero
    /* B2EEC 802986EC 24081366 */   addiu     $t0, $zero, 0x1366
endlabel func_802986E8

nonmatching func_802986F0, 0x8

glabel func_802986F0
    /* B2EF0 802986F0 00000008 */  jr         $zero
    /* B2EF4 802986F4 24081367 */   addiu     $t0, $zero, 0x1367
endlabel func_802986F0

nonmatching func_802986F8, 0x8

glabel func_802986F8
    /* B2EF8 802986F8 00000008 */  jr         $zero
    /* B2EFC 802986FC 24081368 */   addiu     $t0, $zero, 0x1368
endlabel func_802986F8

nonmatching func_80298700, 0x8

glabel func_80298700
    /* B2F00 80298700 00000008 */  jr         $zero
    /* B2F04 80298704 24081369 */   addiu     $t0, $zero, 0x1369
endlabel func_80298700

nonmatching func_80298708, 0x8

glabel func_80298708
    /* B2F08 80298708 00000008 */  jr         $zero
    /* B2F0C 8029870C 2408136A */   addiu     $t0, $zero, 0x136A
endlabel func_80298708

nonmatching func_80298710, 0x8

glabel func_80298710
    /* B2F10 80298710 00000008 */  jr         $zero
    /* B2F14 80298714 2408136B */   addiu     $t0, $zero, 0x136B
endlabel func_80298710

nonmatching func_80298718, 0x8

glabel func_80298718
    /* B2F18 80298718 00000008 */  jr         $zero
    /* B2F1C 8029871C 2408136C */   addiu     $t0, $zero, 0x136C
endlabel func_80298718

nonmatching func_80298720, 0x8

glabel func_80298720
    /* B2F20 80298720 00000008 */  jr         $zero
    /* B2F24 80298724 2408136D */   addiu     $t0, $zero, 0x136D
endlabel func_80298720

nonmatching func_80298728, 0x8

glabel func_80298728
    /* B2F28 80298728 00000008 */  jr         $zero
    /* B2F2C 8029872C 2408136E */   addiu     $t0, $zero, 0x136E
endlabel func_80298728

nonmatching func_80298730, 0x8

glabel func_80298730
    /* B2F30 80298730 00000008 */  jr         $zero
    /* B2F34 80298734 2408136F */   addiu     $t0, $zero, 0x136F
endlabel func_80298730

nonmatching func_80298738, 0x8

glabel func_80298738
    /* B2F38 80298738 00000008 */  jr         $zero
    /* B2F3C 8029873C 24081370 */   addiu     $t0, $zero, 0x1370
endlabel func_80298738

nonmatching func_80298740, 0x8

glabel func_80298740
    /* B2F40 80298740 00000008 */  jr         $zero
    /* B2F44 80298744 24081371 */   addiu     $t0, $zero, 0x1371
endlabel func_80298740

nonmatching func_80298748, 0x8

glabel func_80298748
    /* B2F48 80298748 00000008 */  jr         $zero
    /* B2F4C 8029874C 24081400 */   addiu     $t0, $zero, 0x1400
endlabel func_80298748

nonmatching func_80298750, 0x8

glabel func_80298750
    /* B2F50 80298750 00000008 */  jr         $zero
    /* B2F54 80298754 24081401 */   addiu     $t0, $zero, 0x1401
endlabel func_80298750

nonmatching func_80298758, 0x8

glabel func_80298758
    /* B2F58 80298758 00000008 */  jr         $zero
    /* B2F5C 8029875C 24081500 */   addiu     $t0, $zero, 0x1500
endlabel func_80298758

nonmatching func_80298760, 0x8

glabel func_80298760
    /* B2F60 80298760 00000008 */  jr         $zero
    /* B2F64 80298764 24081501 */   addiu     $t0, $zero, 0x1501
endlabel func_80298760

nonmatching func_80298768, 0x8

glabel func_80298768
    /* B2F68 80298768 00000008 */  jr         $zero
    /* B2F6C 8029876C 24081502 */   addiu     $t0, $zero, 0x1502
endlabel func_80298768

nonmatching func_80298770, 0x8

glabel func_80298770
    /* B2F70 80298770 00000008 */  jr         $zero
    /* B2F74 80298774 24081503 */   addiu     $t0, $zero, 0x1503
endlabel func_80298770

nonmatching func_80298778, 0x8

glabel func_80298778
    /* B2F78 80298778 00000008 */  jr         $zero
    /* B2F7C 8029877C 24081504 */   addiu     $t0, $zero, 0x1504
endlabel func_80298778

nonmatching func_80298780, 0x8

glabel func_80298780
    /* B2F80 80298780 00000008 */  jr         $zero
    /* B2F84 80298784 24081505 */   addiu     $t0, $zero, 0x1505
endlabel func_80298780

nonmatching func_80298788, 0x8

glabel func_80298788
    /* B2F88 80298788 00000008 */  jr         $zero
    /* B2F8C 8029878C 24081506 */   addiu     $t0, $zero, 0x1506
endlabel func_80298788

nonmatching func_80298790, 0x8

glabel func_80298790
    /* B2F90 80298790 00000008 */  jr         $zero
    /* B2F94 80298794 24081507 */   addiu     $t0, $zero, 0x1507
endlabel func_80298790

nonmatching func_80298798, 0x8

glabel func_80298798
    /* B2F98 80298798 00000008 */  jr         $zero
    /* B2F9C 8029879C 24081508 */   addiu     $t0, $zero, 0x1508
endlabel func_80298798

nonmatching func_802987A0, 0x8

glabel func_802987A0
    /* B2FA0 802987A0 00000008 */  jr         $zero
    /* B2FA4 802987A4 24081509 */   addiu     $t0, $zero, 0x1509
endlabel func_802987A0

nonmatching func_802987A8, 0x8

glabel func_802987A8
    /* B2FA8 802987A8 00000008 */  jr         $zero
    /* B2FAC 802987AC 2408150A */   addiu     $t0, $zero, 0x150A
endlabel func_802987A8

nonmatching func_802987B0, 0x8

glabel func_802987B0
    /* B2FB0 802987B0 00000008 */  jr         $zero
    /* B2FB4 802987B4 2408150B */   addiu     $t0, $zero, 0x150B
endlabel func_802987B0

nonmatching func_802987B8, 0x8

glabel func_802987B8
    /* B2FB8 802987B8 00000008 */  jr         $zero
    /* B2FBC 802987BC 2408150C */   addiu     $t0, $zero, 0x150C
endlabel func_802987B8

nonmatching func_802987C0, 0x8

glabel func_802987C0
    /* B2FC0 802987C0 00000008 */  jr         $zero
    /* B2FC4 802987C4 2408150D */   addiu     $t0, $zero, 0x150D
endlabel func_802987C0

nonmatching func_802987C8, 0x8

glabel func_802987C8
    /* B2FC8 802987C8 00000008 */  jr         $zero
    /* B2FCC 802987CC 2408150E */   addiu     $t0, $zero, 0x150E
endlabel func_802987C8

nonmatching func_802987D0, 0x8

glabel func_802987D0
    /* B2FD0 802987D0 00000008 */  jr         $zero
    /* B2FD4 802987D4 2408150F */   addiu     $t0, $zero, 0x150F
endlabel func_802987D0

nonmatching func_802987D8, 0x8

glabel func_802987D8
    /* B2FD8 802987D8 00000008 */  jr         $zero
    /* B2FDC 802987DC 24081510 */   addiu     $t0, $zero, 0x1510
endlabel func_802987D8

nonmatching func_802987E0, 0x8

glabel func_802987E0
    /* B2FE0 802987E0 00000008 */  jr         $zero
    /* B2FE4 802987E4 24081511 */   addiu     $t0, $zero, 0x1511
endlabel func_802987E0

nonmatching func_802987E8, 0x8

glabel func_802987E8
    /* B2FE8 802987E8 00000008 */  jr         $zero
    /* B2FEC 802987EC 24081512 */   addiu     $t0, $zero, 0x1512
endlabel func_802987E8

nonmatching func_802987F0, 0x8

glabel func_802987F0
    /* B2FF0 802987F0 00000008 */  jr         $zero
    /* B2FF4 802987F4 24081513 */   addiu     $t0, $zero, 0x1513
endlabel func_802987F0

nonmatching func_802987F8, 0x8

glabel func_802987F8
    /* B2FF8 802987F8 00000008 */  jr         $zero
    /* B2FFC 802987FC 24081514 */   addiu     $t0, $zero, 0x1514
endlabel func_802987F8

nonmatching func_80298800, 0x8

glabel func_80298800
    /* B3000 80298800 00000008 */  jr         $zero
    /* B3004 80298804 24081515 */   addiu     $t0, $zero, 0x1515
endlabel func_80298800

nonmatching func_80298808, 0x8

glabel func_80298808
    /* B3008 80298808 00000008 */  jr         $zero
    /* B300C 8029880C 24081516 */   addiu     $t0, $zero, 0x1516
endlabel func_80298808

nonmatching func_80298810, 0x8

glabel func_80298810
    /* B3010 80298810 00000008 */  jr         $zero
    /* B3014 80298814 24081517 */   addiu     $t0, $zero, 0x1517
endlabel func_80298810

nonmatching func_80298818, 0x8

glabel func_80298818
    /* B3018 80298818 00000008 */  jr         $zero
    /* B301C 8029881C 24081600 */   addiu     $t0, $zero, 0x1600
endlabel func_80298818

nonmatching func_80298820, 0x8

glabel func_80298820
    /* B3020 80298820 00000008 */  jr         $zero
    /* B3024 80298824 24081601 */   addiu     $t0, $zero, 0x1601
endlabel func_80298820

nonmatching func_80298828, 0x8

glabel func_80298828
    /* B3028 80298828 00000008 */  jr         $zero
    /* B302C 8029882C 24081602 */   addiu     $t0, $zero, 0x1602
endlabel func_80298828

nonmatching func_80298830, 0x8

glabel func_80298830
    /* B3030 80298830 00000008 */  jr         $zero
    /* B3034 80298834 24081603 */   addiu     $t0, $zero, 0x1603
endlabel func_80298830

nonmatching func_80298838, 0x8

glabel func_80298838
    /* B3038 80298838 00000008 */  jr         $zero
    /* B303C 8029883C 24081604 */   addiu     $t0, $zero, 0x1604
endlabel func_80298838

nonmatching func_80298840, 0x8

glabel func_80298840
    /* B3040 80298840 00000008 */  jr         $zero
    /* B3044 80298844 24081605 */   addiu     $t0, $zero, 0x1605
endlabel func_80298840

nonmatching func_80298848, 0x8

glabel func_80298848
    /* B3048 80298848 00000008 */  jr         $zero
    /* B304C 8029884C 24081606 */   addiu     $t0, $zero, 0x1606
endlabel func_80298848

nonmatching func_80298850, 0x8

glabel func_80298850
    /* B3050 80298850 00000008 */  jr         $zero
    /* B3054 80298854 24081607 */   addiu     $t0, $zero, 0x1607
endlabel func_80298850

nonmatching func_80298858, 0x8

glabel func_80298858
    /* B3058 80298858 00000008 */  jr         $zero
    /* B305C 8029885C 24081608 */   addiu     $t0, $zero, 0x1608
endlabel func_80298858

nonmatching func_80298860, 0x8

glabel func_80298860
    /* B3060 80298860 00000008 */  jr         $zero
    /* B3064 80298864 24081609 */   addiu     $t0, $zero, 0x1609
endlabel func_80298860

nonmatching func_80298868, 0x8

glabel func_80298868
    /* B3068 80298868 00000008 */  jr         $zero
    /* B306C 8029886C 2408160A */   addiu     $t0, $zero, 0x160A
endlabel func_80298868

nonmatching func_80298870, 0x8

glabel func_80298870
    /* B3070 80298870 00000008 */  jr         $zero
    /* B3074 80298874 2408160B */   addiu     $t0, $zero, 0x160B
endlabel func_80298870

nonmatching func_80298878, 0x8

glabel func_80298878
    /* B3078 80298878 00000008 */  jr         $zero
    /* B307C 8029887C 2408160C */   addiu     $t0, $zero, 0x160C
endlabel func_80298878

nonmatching func_80298880, 0x8

glabel func_80298880
    /* B3080 80298880 00000008 */  jr         $zero
    /* B3084 80298884 2408160D */   addiu     $t0, $zero, 0x160D
endlabel func_80298880

nonmatching func_80298888, 0x8

glabel func_80298888
    /* B3088 80298888 00000008 */  jr         $zero
    /* B308C 8029888C 2408160E */   addiu     $t0, $zero, 0x160E
endlabel func_80298888

nonmatching func_80298890, 0x8

glabel func_80298890
    /* B3090 80298890 00000008 */  jr         $zero
    /* B3094 80298894 2408160F */   addiu     $t0, $zero, 0x160F
endlabel func_80298890

nonmatching func_80298898, 0x8

glabel func_80298898
    /* B3098 80298898 00000008 */  jr         $zero
    /* B309C 8029889C 24081700 */   addiu     $t0, $zero, 0x1700
endlabel func_80298898

nonmatching func_802988A0, 0x8

glabel func_802988A0
    /* B30A0 802988A0 00000008 */  jr         $zero
    /* B30A4 802988A4 24081701 */   addiu     $t0, $zero, 0x1701
endlabel func_802988A0

nonmatching func_802988A8, 0x8

glabel func_802988A8
    /* B30A8 802988A8 00000008 */  jr         $zero
    /* B30AC 802988AC 24081702 */   addiu     $t0, $zero, 0x1702
endlabel func_802988A8

nonmatching func_802988B0, 0x8

glabel func_802988B0
    /* B30B0 802988B0 00000008 */  jr         $zero
    /* B30B4 802988B4 24081703 */   addiu     $t0, $zero, 0x1703
endlabel func_802988B0

nonmatching func_802988B8, 0x8

glabel func_802988B8
    /* B30B8 802988B8 00000008 */  jr         $zero
    /* B30BC 802988BC 24081704 */   addiu     $t0, $zero, 0x1704
endlabel func_802988B8

nonmatching func_802988C0, 0x8

glabel func_802988C0
    /* B30C0 802988C0 00000008 */  jr         $zero
    /* B30C4 802988C4 24081705 */   addiu     $t0, $zero, 0x1705
endlabel func_802988C0

nonmatching func_802988C8, 0x8

glabel func_802988C8
    /* B30C8 802988C8 00000008 */  jr         $zero
    /* B30CC 802988CC 24081706 */   addiu     $t0, $zero, 0x1706
endlabel func_802988C8

nonmatching func_802988D0, 0x8

glabel func_802988D0
    /* B30D0 802988D0 00000008 */  jr         $zero
    /* B30D4 802988D4 24081707 */   addiu     $t0, $zero, 0x1707
endlabel func_802988D0

nonmatching func_802988D8, 0x8

glabel func_802988D8
    /* B30D8 802988D8 00000008 */  jr         $zero
    /* B30DC 802988DC 24081708 */   addiu     $t0, $zero, 0x1708
endlabel func_802988D8

nonmatching func_802988E0, 0x8

glabel func_802988E0
    /* B30E0 802988E0 00000008 */  jr         $zero
    /* B30E4 802988E4 24081709 */   addiu     $t0, $zero, 0x1709
endlabel func_802988E0

nonmatching func_802988E8, 0x8

glabel func_802988E8
    /* B30E8 802988E8 00000008 */  jr         $zero
    /* B30EC 802988EC 2408170A */   addiu     $t0, $zero, 0x170A
endlabel func_802988E8

nonmatching func_802988F0, 0x8

glabel func_802988F0
    /* B30F0 802988F0 00000008 */  jr         $zero
    /* B30F4 802988F4 2408170B */   addiu     $t0, $zero, 0x170B
endlabel func_802988F0

nonmatching func_802988F8, 0x8

glabel func_802988F8
    /* B30F8 802988F8 00000008 */  jr         $zero
    /* B30FC 802988FC 2408170C */   addiu     $t0, $zero, 0x170C
endlabel func_802988F8

nonmatching func_80298900, 0x8

glabel func_80298900
    /* B3100 80298900 00000008 */  jr         $zero
    /* B3104 80298904 2408170D */   addiu     $t0, $zero, 0x170D
endlabel func_80298900

nonmatching func_80298908, 0x8

glabel func_80298908
    /* B3108 80298908 00000008 */  jr         $zero
    /* B310C 8029890C 2408170E */   addiu     $t0, $zero, 0x170E
endlabel func_80298908

nonmatching func_80298910, 0x8

glabel func_80298910
    /* B3110 80298910 00000008 */  jr         $zero
    /* B3114 80298914 2408170F */   addiu     $t0, $zero, 0x170F
endlabel func_80298910

nonmatching func_80298918, 0x8

glabel func_80298918
    /* B3118 80298918 00000008 */  jr         $zero
    /* B311C 8029891C 24081710 */   addiu     $t0, $zero, 0x1710
endlabel func_80298918

nonmatching func_80298920, 0x8

glabel func_80298920
    /* B3120 80298920 00000008 */  jr         $zero
    /* B3124 80298924 24081711 */   addiu     $t0, $zero, 0x1711
endlabel func_80298920

nonmatching func_80298928, 0x8

glabel func_80298928
    /* B3128 80298928 00000008 */  jr         $zero
    /* B312C 8029892C 24081712 */   addiu     $t0, $zero, 0x1712
endlabel func_80298928

nonmatching func_80298930, 0x8

glabel func_80298930
    /* B3130 80298930 00000008 */  jr         $zero
    /* B3134 80298934 24081713 */   addiu     $t0, $zero, 0x1713
endlabel func_80298930

nonmatching func_80298938, 0x8

glabel func_80298938
    /* B3138 80298938 00000008 */  jr         $zero
    /* B313C 8029893C 24081714 */   addiu     $t0, $zero, 0x1714
endlabel func_80298938

nonmatching func_80298940, 0x8

glabel func_80298940
    /* B3140 80298940 00000008 */  jr         $zero
    /* B3144 80298944 24081715 */   addiu     $t0, $zero, 0x1715
endlabel func_80298940

nonmatching func_80298948, 0x8

glabel func_80298948
    /* B3148 80298948 00000008 */  jr         $zero
    /* B314C 8029894C 24081716 */   addiu     $t0, $zero, 0x1716
endlabel func_80298948

nonmatching func_80298950, 0x8

glabel func_80298950
    /* B3150 80298950 00000008 */  jr         $zero
    /* B3154 80298954 24081717 */   addiu     $t0, $zero, 0x1717
endlabel func_80298950

nonmatching func_80298958, 0x8

glabel func_80298958
    /* B3158 80298958 00000008 */  jr         $zero
    /* B315C 8029895C 24081718 */   addiu     $t0, $zero, 0x1718
endlabel func_80298958

nonmatching func_80298960, 0x8

glabel func_80298960
    /* B3160 80298960 00000008 */  jr         $zero
    /* B3164 80298964 24081719 */   addiu     $t0, $zero, 0x1719
endlabel func_80298960

nonmatching func_80298968, 0x8

glabel func_80298968
    /* B3168 80298968 00000008 */  jr         $zero
    /* B316C 8029896C 2408171A */   addiu     $t0, $zero, 0x171A
endlabel func_80298968

nonmatching func_80298970, 0x8

glabel func_80298970
    /* B3170 80298970 00000008 */  jr         $zero
    /* B3174 80298974 2408171B */   addiu     $t0, $zero, 0x171B
endlabel func_80298970

nonmatching func_80298978, 0x8

glabel func_80298978
    /* B3178 80298978 00000008 */  jr         $zero
    /* B317C 8029897C 2408171C */   addiu     $t0, $zero, 0x171C
endlabel func_80298978

nonmatching func_80298980, 0x8

glabel func_80298980
    /* B3180 80298980 00000008 */  jr         $zero
    /* B3184 80298984 2408171D */   addiu     $t0, $zero, 0x171D
endlabel func_80298980

nonmatching func_80298988, 0x8

glabel func_80298988
    /* B3188 80298988 00000008 */  jr         $zero
    /* B318C 8029898C 2408171E */   addiu     $t0, $zero, 0x171E
endlabel func_80298988

nonmatching func_80298990, 0x8

glabel func_80298990
    /* B3190 80298990 00000008 */  jr         $zero
    /* B3194 80298994 2408171F */   addiu     $t0, $zero, 0x171F
endlabel func_80298990

nonmatching func_80298998, 0x8

glabel func_80298998
    /* B3198 80298998 00000008 */  jr         $zero
    /* B319C 8029899C 24081720 */   addiu     $t0, $zero, 0x1720
endlabel func_80298998

nonmatching func_802989A0, 0x8

glabel func_802989A0
    /* B31A0 802989A0 00000008 */  jr         $zero
    /* B31A4 802989A4 24081721 */   addiu     $t0, $zero, 0x1721
endlabel func_802989A0

nonmatching func_802989A8, 0x8

glabel func_802989A8
    /* B31A8 802989A8 00000008 */  jr         $zero
    /* B31AC 802989AC 24081722 */   addiu     $t0, $zero, 0x1722
endlabel func_802989A8

nonmatching func_802989B0, 0x8

glabel func_802989B0
    /* B31B0 802989B0 00000008 */  jr         $zero
    /* B31B4 802989B4 24081723 */   addiu     $t0, $zero, 0x1723
endlabel func_802989B0

nonmatching func_802989B8, 0x8

glabel func_802989B8
    /* B31B8 802989B8 00000008 */  jr         $zero
    /* B31BC 802989BC 24081724 */   addiu     $t0, $zero, 0x1724
endlabel func_802989B8

nonmatching func_802989C0, 0x8

glabel func_802989C0
    /* B31C0 802989C0 00000008 */  jr         $zero
    /* B31C4 802989C4 24081725 */   addiu     $t0, $zero, 0x1725
endlabel func_802989C0

nonmatching func_802989C8, 0x8

glabel func_802989C8
    /* B31C8 802989C8 00000008 */  jr         $zero
    /* B31CC 802989CC 24081726 */   addiu     $t0, $zero, 0x1726
endlabel func_802989C8

nonmatching func_802989D0, 0x8

glabel func_802989D0
    /* B31D0 802989D0 00000008 */  jr         $zero
    /* B31D4 802989D4 24081727 */   addiu     $t0, $zero, 0x1727
endlabel func_802989D0

nonmatching func_802989D8, 0x8

glabel func_802989D8
    /* B31D8 802989D8 00000008 */  jr         $zero
    /* B31DC 802989DC 24081728 */   addiu     $t0, $zero, 0x1728
endlabel func_802989D8

nonmatching func_802989E0, 0x8

glabel func_802989E0
    /* B31E0 802989E0 00000008 */  jr         $zero
    /* B31E4 802989E4 24081729 */   addiu     $t0, $zero, 0x1729
endlabel func_802989E0

nonmatching func_802989E8, 0x8

glabel func_802989E8
    /* B31E8 802989E8 00000008 */  jr         $zero
    /* B31EC 802989EC 2408172A */   addiu     $t0, $zero, 0x172A
endlabel func_802989E8

nonmatching func_802989F0, 0x8

glabel func_802989F0
    /* B31F0 802989F0 00000008 */  jr         $zero
    /* B31F4 802989F4 24081800 */   addiu     $t0, $zero, 0x1800
endlabel func_802989F0

nonmatching func_802989F8, 0x8

glabel func_802989F8
    /* B31F8 802989F8 00000008 */  jr         $zero
    /* B31FC 802989FC 24081801 */   addiu     $t0, $zero, 0x1801
endlabel func_802989F8

nonmatching func_80298A00, 0x8

glabel func_80298A00
    /* B3200 80298A00 00000008 */  jr         $zero
    /* B3204 80298A04 24081802 */   addiu     $t0, $zero, 0x1802
endlabel func_80298A00

nonmatching func_80298A08, 0x8

glabel func_80298A08
    /* B3208 80298A08 00000008 */  jr         $zero
    /* B320C 80298A0C 24081803 */   addiu     $t0, $zero, 0x1803
endlabel func_80298A08

nonmatching func_80298A10, 0x8

glabel func_80298A10
    /* B3210 80298A10 00000008 */  jr         $zero
    /* B3214 80298A14 24081804 */   addiu     $t0, $zero, 0x1804
endlabel func_80298A10

nonmatching func_80298A18, 0x8

glabel func_80298A18
    /* B3218 80298A18 00000008 */  jr         $zero
    /* B321C 80298A1C 24081805 */   addiu     $t0, $zero, 0x1805
endlabel func_80298A18

nonmatching func_80298A20, 0x8

glabel func_80298A20
    /* B3220 80298A20 00000008 */  jr         $zero
    /* B3224 80298A24 24081806 */   addiu     $t0, $zero, 0x1806
endlabel func_80298A20

nonmatching func_80298A28, 0x8

glabel func_80298A28
    /* B3228 80298A28 00000008 */  jr         $zero
    /* B322C 80298A2C 24081807 */   addiu     $t0, $zero, 0x1807
endlabel func_80298A28

nonmatching func_80298A30, 0x8

glabel func_80298A30
    /* B3230 80298A30 00000008 */  jr         $zero
    /* B3234 80298A34 24081808 */   addiu     $t0, $zero, 0x1808
endlabel func_80298A30

nonmatching func_80298A38, 0x8

glabel func_80298A38
    /* B3238 80298A38 00000008 */  jr         $zero
    /* B323C 80298A3C 24081809 */   addiu     $t0, $zero, 0x1809
endlabel func_80298A38

nonmatching func_80298A40, 0x8

glabel func_80298A40
    /* B3240 80298A40 00000008 */  jr         $zero
    /* B3244 80298A44 2408180A */   addiu     $t0, $zero, 0x180A
endlabel func_80298A40

nonmatching func_80298A48, 0x8

glabel func_80298A48
    /* B3248 80298A48 00000008 */  jr         $zero
    /* B324C 80298A4C 2408180B */   addiu     $t0, $zero, 0x180B
endlabel func_80298A48

nonmatching func_80298A50, 0x8

glabel func_80298A50
    /* B3250 80298A50 00000008 */  jr         $zero
    /* B3254 80298A54 2408180C */   addiu     $t0, $zero, 0x180C
endlabel func_80298A50

nonmatching func_80298A58, 0x8

glabel func_80298A58
    /* B3258 80298A58 00000008 */  jr         $zero
    /* B325C 80298A5C 2408180D */   addiu     $t0, $zero, 0x180D
endlabel func_80298A58

nonmatching func_80298A60, 0x8

glabel func_80298A60
    /* B3260 80298A60 00000008 */  jr         $zero
    /* B3264 80298A64 2408180E */   addiu     $t0, $zero, 0x180E
endlabel func_80298A60

nonmatching func_80298A68, 0x8

glabel func_80298A68
    /* B3268 80298A68 00000008 */  jr         $zero
    /* B326C 80298A6C 2408180F */   addiu     $t0, $zero, 0x180F
endlabel func_80298A68

nonmatching func_80298A70, 0x8

glabel func_80298A70
    /* B3270 80298A70 00000008 */  jr         $zero
    /* B3274 80298A74 24081810 */   addiu     $t0, $zero, 0x1810
endlabel func_80298A70

nonmatching func_80298A78, 0x8

glabel func_80298A78
    /* B3278 80298A78 00000008 */  jr         $zero
    /* B327C 80298A7C 24081811 */   addiu     $t0, $zero, 0x1811
endlabel func_80298A78

nonmatching func_80298A80, 0x8

glabel func_80298A80
    /* B3280 80298A80 00000008 */  jr         $zero
    /* B3284 80298A84 24081812 */   addiu     $t0, $zero, 0x1812
endlabel func_80298A80

nonmatching func_80298A88, 0x8

glabel func_80298A88
    /* B3288 80298A88 00000008 */  jr         $zero
    /* B328C 80298A8C 24081813 */   addiu     $t0, $zero, 0x1813
endlabel func_80298A88

nonmatching func_80298A90, 0x8

glabel func_80298A90
    /* B3290 80298A90 00000008 */  jr         $zero
    /* B3294 80298A94 24081814 */   addiu     $t0, $zero, 0x1814
endlabel func_80298A90

nonmatching func_80298A98, 0x8

glabel func_80298A98
    /* B3298 80298A98 00000008 */  jr         $zero
    /* B329C 80298A9C 24081815 */   addiu     $t0, $zero, 0x1815
endlabel func_80298A98

nonmatching func_80298AA0, 0x8

glabel func_80298AA0
    /* B32A0 80298AA0 00000008 */  jr         $zero
    /* B32A4 80298AA4 24081816 */   addiu     $t0, $zero, 0x1816
endlabel func_80298AA0

nonmatching func_80298AA8, 0x8

glabel func_80298AA8
    /* B32A8 80298AA8 00000008 */  jr         $zero
    /* B32AC 80298AAC 24081817 */   addiu     $t0, $zero, 0x1817
endlabel func_80298AA8

nonmatching func_80298AB0, 0x8

glabel func_80298AB0
    /* B32B0 80298AB0 00000008 */  jr         $zero
    /* B32B4 80298AB4 24081818 */   addiu     $t0, $zero, 0x1818
endlabel func_80298AB0

nonmatching func_80298AB8, 0x8

glabel func_80298AB8
    /* B32B8 80298AB8 00000008 */  jr         $zero
    /* B32BC 80298ABC 24081819 */   addiu     $t0, $zero, 0x1819
endlabel func_80298AB8

nonmatching func_80298AC0, 0x8

glabel func_80298AC0
    /* B32C0 80298AC0 00000008 */  jr         $zero
    /* B32C4 80298AC4 2408181A */   addiu     $t0, $zero, 0x181A
endlabel func_80298AC0

nonmatching func_80298AC8, 0x8

glabel func_80298AC8
    /* B32C8 80298AC8 00000008 */  jr         $zero
    /* B32CC 80298ACC 2408181B */   addiu     $t0, $zero, 0x181B
endlabel func_80298AC8

nonmatching func_80298AD0, 0x8

glabel func_80298AD0
    /* B32D0 80298AD0 00000008 */  jr         $zero
    /* B32D4 80298AD4 2408181C */   addiu     $t0, $zero, 0x181C
endlabel func_80298AD0

nonmatching func_80298AD8, 0x8

glabel func_80298AD8
    /* B32D8 80298AD8 00000008 */  jr         $zero
    /* B32DC 80298ADC 2408181D */   addiu     $t0, $zero, 0x181D
endlabel func_80298AD8

nonmatching func_80298AE0, 0x8

glabel func_80298AE0
    /* B32E0 80298AE0 00000008 */  jr         $zero
    /* B32E4 80298AE4 2408181E */   addiu     $t0, $zero, 0x181E
endlabel func_80298AE0

nonmatching func_80298AE8, 0x8

glabel func_80298AE8
    /* B32E8 80298AE8 00000008 */  jr         $zero
    /* B32EC 80298AEC 2408181F */   addiu     $t0, $zero, 0x181F
endlabel func_80298AE8

nonmatching func_80298AF0, 0x8

glabel func_80298AF0
    /* B32F0 80298AF0 00000008 */  jr         $zero
    /* B32F4 80298AF4 24081820 */   addiu     $t0, $zero, 0x1820
endlabel func_80298AF0

nonmatching func_80298AF8, 0x8

glabel func_80298AF8
    /* B32F8 80298AF8 00000008 */  jr         $zero
    /* B32FC 80298AFC 24081821 */   addiu     $t0, $zero, 0x1821
endlabel func_80298AF8

nonmatching func_80298B00, 0x8

glabel func_80298B00
    /* B3300 80298B00 00000008 */  jr         $zero
    /* B3304 80298B04 24081822 */   addiu     $t0, $zero, 0x1822
endlabel func_80298B00

nonmatching func_80298B08, 0x8

glabel func_80298B08
    /* B3308 80298B08 00000008 */  jr         $zero
    /* B330C 80298B0C 24081823 */   addiu     $t0, $zero, 0x1823
endlabel func_80298B08

nonmatching func_80298B10, 0x8

glabel func_80298B10
    /* B3310 80298B10 00000008 */  jr         $zero
    /* B3314 80298B14 24081824 */   addiu     $t0, $zero, 0x1824
endlabel func_80298B10

nonmatching func_80298B18, 0x8

glabel func_80298B18
    /* B3318 80298B18 00000008 */  jr         $zero
    /* B331C 80298B1C 24081825 */   addiu     $t0, $zero, 0x1825
endlabel func_80298B18

nonmatching func_80298B20, 0x8

glabel func_80298B20
    /* B3320 80298B20 00000008 */  jr         $zero
    /* B3324 80298B24 24081826 */   addiu     $t0, $zero, 0x1826
endlabel func_80298B20

nonmatching func_80298B28, 0x8

glabel func_80298B28
    /* B3328 80298B28 00000008 */  jr         $zero
    /* B332C 80298B2C 24081827 */   addiu     $t0, $zero, 0x1827
endlabel func_80298B28

nonmatching func_80298B30, 0x8

glabel func_80298B30
    /* B3330 80298B30 00000008 */  jr         $zero
    /* B3334 80298B34 24081828 */   addiu     $t0, $zero, 0x1828
endlabel func_80298B30

nonmatching func_80298B38, 0x8

glabel func_80298B38
    /* B3338 80298B38 00000008 */  jr         $zero
    /* B333C 80298B3C 24081829 */   addiu     $t0, $zero, 0x1829
endlabel func_80298B38

nonmatching func_80298B40, 0x8

glabel func_80298B40
    /* B3340 80298B40 00000008 */  jr         $zero
    /* B3344 80298B44 2408182A */   addiu     $t0, $zero, 0x182A
endlabel func_80298B40

nonmatching func_80298B48, 0x8

glabel func_80298B48
    /* B3348 80298B48 00000008 */  jr         $zero
    /* B334C 80298B4C 2408182B */   addiu     $t0, $zero, 0x182B
endlabel func_80298B48

nonmatching func_80298B50, 0x8

glabel func_80298B50
    /* B3350 80298B50 00000008 */  jr         $zero
    /* B3354 80298B54 2408182C */   addiu     $t0, $zero, 0x182C
endlabel func_80298B50

nonmatching func_80298B58, 0x8

glabel func_80298B58
    /* B3358 80298B58 00000008 */  jr         $zero
    /* B335C 80298B5C 2408182D */   addiu     $t0, $zero, 0x182D
endlabel func_80298B58

nonmatching func_80298B60, 0x8

glabel func_80298B60
    /* B3360 80298B60 00000008 */  jr         $zero
    /* B3364 80298B64 2408182E */   addiu     $t0, $zero, 0x182E
endlabel func_80298B60

nonmatching func_80298B68, 0x8

glabel func_80298B68
    /* B3368 80298B68 00000008 */  jr         $zero
    /* B336C 80298B6C 2408182F */   addiu     $t0, $zero, 0x182F
endlabel func_80298B68

nonmatching func_80298B70, 0x8

glabel func_80298B70
    /* B3370 80298B70 00000008 */  jr         $zero
    /* B3374 80298B74 24081830 */   addiu     $t0, $zero, 0x1830
endlabel func_80298B70

nonmatching func_80298B78, 0x8

glabel func_80298B78
    /* B3378 80298B78 00000008 */  jr         $zero
    /* B337C 80298B7C 24081831 */   addiu     $t0, $zero, 0x1831
endlabel func_80298B78

nonmatching func_80298B80, 0x8

glabel func_80298B80
    /* B3380 80298B80 00000008 */  jr         $zero
    /* B3384 80298B84 24081832 */   addiu     $t0, $zero, 0x1832
endlabel func_80298B80

nonmatching func_80298B88, 0x8

glabel func_80298B88
    /* B3388 80298B88 00000008 */  jr         $zero
    /* B338C 80298B8C 24081833 */   addiu     $t0, $zero, 0x1833
endlabel func_80298B88

nonmatching func_80298B90, 0x8

glabel func_80298B90
    /* B3390 80298B90 00000008 */  jr         $zero
    /* B3394 80298B94 24081834 */   addiu     $t0, $zero, 0x1834
endlabel func_80298B90

nonmatching func_80298B98, 0x8

glabel func_80298B98
    /* B3398 80298B98 00000008 */  jr         $zero
    /* B339C 80298B9C 24081835 */   addiu     $t0, $zero, 0x1835
endlabel func_80298B98

nonmatching func_80298BA0, 0x8

glabel func_80298BA0
    /* B33A0 80298BA0 00000008 */  jr         $zero
    /* B33A4 80298BA4 24081836 */   addiu     $t0, $zero, 0x1836
endlabel func_80298BA0

nonmatching func_80298BA8, 0x8

glabel func_80298BA8
    /* B33A8 80298BA8 00000008 */  jr         $zero
    /* B33AC 80298BAC 24081837 */   addiu     $t0, $zero, 0x1837
endlabel func_80298BA8

nonmatching func_80298BB0, 0x8

glabel func_80298BB0
    /* B33B0 80298BB0 00000008 */  jr         $zero
    /* B33B4 80298BB4 24081838 */   addiu     $t0, $zero, 0x1838
endlabel func_80298BB0

nonmatching func_80298BB8, 0x8

glabel func_80298BB8
    /* B33B8 80298BB8 00000008 */  jr         $zero
    /* B33BC 80298BBC 24081839 */   addiu     $t0, $zero, 0x1839
endlabel func_80298BB8

nonmatching func_80298BC0, 0x8

glabel func_80298BC0
    /* B33C0 80298BC0 00000008 */  jr         $zero
    /* B33C4 80298BC4 2408183A */   addiu     $t0, $zero, 0x183A
endlabel func_80298BC0

nonmatching func_80298BC8, 0x8

glabel func_80298BC8
    /* B33C8 80298BC8 00000008 */  jr         $zero
    /* B33CC 80298BCC 24081900 */   addiu     $t0, $zero, 0x1900
endlabel func_80298BC8

nonmatching func_80298BD0, 0x8

glabel func_80298BD0
    /* B33D0 80298BD0 00000008 */  jr         $zero
    /* B33D4 80298BD4 24081901 */   addiu     $t0, $zero, 0x1901
endlabel func_80298BD0

nonmatching func_80298BD8, 0x8

glabel func_80298BD8
    /* B33D8 80298BD8 00000008 */  jr         $zero
    /* B33DC 80298BDC 24081902 */   addiu     $t0, $zero, 0x1902
endlabel func_80298BD8

nonmatching func_80298BE0, 0x8

glabel func_80298BE0
    /* B33E0 80298BE0 00000008 */  jr         $zero
    /* B33E4 80298BE4 24081903 */   addiu     $t0, $zero, 0x1903
endlabel func_80298BE0

nonmatching func_80298BE8, 0x8

glabel func_80298BE8
    /* B33E8 80298BE8 00000008 */  jr         $zero
    /* B33EC 80298BEC 24081904 */   addiu     $t0, $zero, 0x1904
endlabel func_80298BE8

nonmatching func_80298BF0, 0x8

glabel func_80298BF0
    /* B33F0 80298BF0 00000008 */  jr         $zero
    /* B33F4 80298BF4 24081905 */   addiu     $t0, $zero, 0x1905
endlabel func_80298BF0

nonmatching func_80298BF8, 0x8

glabel func_80298BF8
    /* B33F8 80298BF8 00000008 */  jr         $zero
    /* B33FC 80298BFC 24081906 */   addiu     $t0, $zero, 0x1906
endlabel func_80298BF8

nonmatching func_80298C00, 0x8

glabel func_80298C00
    /* B3400 80298C00 00000008 */  jr         $zero
    /* B3404 80298C04 24081907 */   addiu     $t0, $zero, 0x1907
endlabel func_80298C00

nonmatching func_80298C08, 0x8

glabel func_80298C08
    /* B3408 80298C08 00000008 */  jr         $zero
    /* B340C 80298C0C 24081908 */   addiu     $t0, $zero, 0x1908
endlabel func_80298C08

nonmatching func_80298C10, 0x8

glabel func_80298C10
    /* B3410 80298C10 00000008 */  jr         $zero
    /* B3414 80298C14 24081909 */   addiu     $t0, $zero, 0x1909
endlabel func_80298C10

nonmatching func_80298C18, 0x8

glabel func_80298C18
    /* B3418 80298C18 00000008 */  jr         $zero
    /* B341C 80298C1C 2408190A */   addiu     $t0, $zero, 0x190A
endlabel func_80298C18

nonmatching func_80298C20, 0x8

glabel func_80298C20
    /* B3420 80298C20 00000008 */  jr         $zero
    /* B3424 80298C24 2408190B */   addiu     $t0, $zero, 0x190B
endlabel func_80298C20

nonmatching func_80298C28, 0x8

glabel func_80298C28
    /* B3428 80298C28 00000008 */  jr         $zero
    /* B342C 80298C2C 2408190C */   addiu     $t0, $zero, 0x190C
endlabel func_80298C28

nonmatching func_80298C30, 0x8

glabel func_80298C30
    /* B3430 80298C30 00000008 */  jr         $zero
    /* B3434 80298C34 2408190D */   addiu     $t0, $zero, 0x190D
endlabel func_80298C30

nonmatching func_80298C38, 0x8

glabel func_80298C38
    /* B3438 80298C38 00000008 */  jr         $zero
    /* B343C 80298C3C 2408190E */   addiu     $t0, $zero, 0x190E
endlabel func_80298C38

nonmatching func_80298C40, 0x8

glabel func_80298C40
    /* B3440 80298C40 00000008 */  jr         $zero
    /* B3444 80298C44 2408190F */   addiu     $t0, $zero, 0x190F
endlabel func_80298C40

nonmatching func_80298C48, 0x8

glabel func_80298C48
    /* B3448 80298C48 00000008 */  jr         $zero
    /* B344C 80298C4C 24081910 */   addiu     $t0, $zero, 0x1910
endlabel func_80298C48

nonmatching func_80298C50, 0x8

glabel func_80298C50
    /* B3450 80298C50 00000008 */  jr         $zero
    /* B3454 80298C54 24081A00 */   addiu     $t0, $zero, 0x1A00
endlabel func_80298C50

nonmatching func_80298C58, 0x8

glabel func_80298C58
    /* B3458 80298C58 00000008 */  jr         $zero
    /* B345C 80298C5C 24081A01 */   addiu     $t0, $zero, 0x1A01
endlabel func_80298C58

nonmatching func_80298C60, 0x8

glabel func_80298C60
    /* B3460 80298C60 00000008 */  jr         $zero
    /* B3464 80298C64 24081A02 */   addiu     $t0, $zero, 0x1A02
endlabel func_80298C60

nonmatching func_80298C68, 0x8

glabel func_80298C68
    /* B3468 80298C68 00000008 */  jr         $zero
    /* B346C 80298C6C 24081A03 */   addiu     $t0, $zero, 0x1A03
endlabel func_80298C68

nonmatching func_80298C70, 0x8

glabel func_80298C70
    /* B3470 80298C70 00000008 */  jr         $zero
    /* B3474 80298C74 24081B00 */   addiu     $t0, $zero, 0x1B00
endlabel func_80298C70

nonmatching func_80298C78, 0x8

glabel func_80298C78
    /* B3478 80298C78 00000008 */  jr         $zero
    /* B347C 80298C7C 24081B01 */   addiu     $t0, $zero, 0x1B01
endlabel func_80298C78

nonmatching func_80298C80, 0x8

glabel func_80298C80
    /* B3480 80298C80 00000008 */  jr         $zero
    /* B3484 80298C84 24081B02 */   addiu     $t0, $zero, 0x1B02
endlabel func_80298C80

nonmatching func_80298C88, 0x8

glabel func_80298C88
    /* B3488 80298C88 00000008 */  jr         $zero
    /* B348C 80298C8C 24081B03 */   addiu     $t0, $zero, 0x1B03
endlabel func_80298C88

nonmatching func_80298C90, 0x8

glabel func_80298C90
    /* B3490 80298C90 00000008 */  jr         $zero
    /* B3494 80298C94 24081B04 */   addiu     $t0, $zero, 0x1B04
endlabel func_80298C90

nonmatching func_80298C98, 0x8

glabel func_80298C98
    /* B3498 80298C98 00000008 */  jr         $zero
    /* B349C 80298C9C 24081B05 */   addiu     $t0, $zero, 0x1B05
endlabel func_80298C98

nonmatching func_80298CA0, 0x8

glabel func_80298CA0
    /* B34A0 80298CA0 00000008 */  jr         $zero
    /* B34A4 80298CA4 24081B06 */   addiu     $t0, $zero, 0x1B06
endlabel func_80298CA0

nonmatching func_80298CA8, 0x8

glabel func_80298CA8
    /* B34A8 80298CA8 00000008 */  jr         $zero
    /* B34AC 80298CAC 24081B07 */   addiu     $t0, $zero, 0x1B07
endlabel func_80298CA8

nonmatching func_80298CB0, 0x8

glabel func_80298CB0
    /* B34B0 80298CB0 00000008 */  jr         $zero
    /* B34B4 80298CB4 24081B08 */   addiu     $t0, $zero, 0x1B08
endlabel func_80298CB0

nonmatching func_80298CB8, 0x8

glabel func_80298CB8
    /* B34B8 80298CB8 00000008 */  jr         $zero
    /* B34BC 80298CBC 24081B09 */   addiu     $t0, $zero, 0x1B09
endlabel func_80298CB8

nonmatching func_80298CC0, 0x8

glabel func_80298CC0
    /* B34C0 80298CC0 00000008 */  jr         $zero
    /* B34C4 80298CC4 24081B0A */   addiu     $t0, $zero, 0x1B0A
endlabel func_80298CC0

nonmatching func_80298CC8, 0x8

glabel func_80298CC8
    /* B34C8 80298CC8 00000008 */  jr         $zero
    /* B34CC 80298CCC 24081B0B */   addiu     $t0, $zero, 0x1B0B
endlabel func_80298CC8

nonmatching func_80298CD0, 0x8

glabel func_80298CD0
    /* B34D0 80298CD0 00000008 */  jr         $zero
    /* B34D4 80298CD4 24081B0C */   addiu     $t0, $zero, 0x1B0C
endlabel func_80298CD0

nonmatching func_80298CD8, 0x8

glabel func_80298CD8
    /* B34D8 80298CD8 00000008 */  jr         $zero
    /* B34DC 80298CDC 24081B0D */   addiu     $t0, $zero, 0x1B0D
endlabel func_80298CD8

nonmatching func_80298CE0, 0x8

glabel func_80298CE0
    /* B34E0 80298CE0 00000008 */  jr         $zero
    /* B34E4 80298CE4 24081B0E */   addiu     $t0, $zero, 0x1B0E
endlabel func_80298CE0

nonmatching func_80298CE8, 0x8

glabel func_80298CE8
    /* B34E8 80298CE8 00000008 */  jr         $zero
    /* B34EC 80298CEC 24081B0F */   addiu     $t0, $zero, 0x1B0F
endlabel func_80298CE8

nonmatching func_80298CF0, 0x8

glabel func_80298CF0
    /* B34F0 80298CF0 00000008 */  jr         $zero
    /* B34F4 80298CF4 24081B10 */   addiu     $t0, $zero, 0x1B10
endlabel func_80298CF0

nonmatching func_80298CF8, 0x8

glabel func_80298CF8
    /* B34F8 80298CF8 00000008 */  jr         $zero
    /* B34FC 80298CFC 24081B11 */   addiu     $t0, $zero, 0x1B11
endlabel func_80298CF8

nonmatching func_80298D00, 0x8

glabel func_80298D00
    /* B3500 80298D00 00000008 */  jr         $zero
    /* B3504 80298D04 24081C00 */   addiu     $t0, $zero, 0x1C00
endlabel func_80298D00

nonmatching func_80298D08, 0x8

glabel func_80298D08
    /* B3508 80298D08 00000008 */  jr         $zero
    /* B350C 80298D0C 24081C01 */   addiu     $t0, $zero, 0x1C01
endlabel func_80298D08

nonmatching func_80298D10, 0x8

glabel func_80298D10
    /* B3510 80298D10 00000008 */  jr         $zero
    /* B3514 80298D14 24081C02 */   addiu     $t0, $zero, 0x1C02
endlabel func_80298D10

nonmatching func_80298D18, 0x8

glabel func_80298D18
    /* B3518 80298D18 00000008 */  jr         $zero
    /* B351C 80298D1C 24081C03 */   addiu     $t0, $zero, 0x1C03
endlabel func_80298D18

nonmatching func_80298D20, 0x8

glabel func_80298D20
    /* B3520 80298D20 00000008 */  jr         $zero
    /* B3524 80298D24 24081C04 */   addiu     $t0, $zero, 0x1C04
endlabel func_80298D20

nonmatching func_80298D28, 0x8

glabel func_80298D28
    /* B3528 80298D28 00000008 */  jr         $zero
    /* B352C 80298D2C 24081C05 */   addiu     $t0, $zero, 0x1C05
endlabel func_80298D28

nonmatching func_80298D30, 0x8

glabel func_80298D30
    /* B3530 80298D30 00000008 */  jr         $zero
    /* B3534 80298D34 24081C06 */   addiu     $t0, $zero, 0x1C06
endlabel func_80298D30

nonmatching func_80298D38, 0x8

glabel func_80298D38
    /* B3538 80298D38 00000008 */  jr         $zero
    /* B353C 80298D3C 24081C07 */   addiu     $t0, $zero, 0x1C07
endlabel func_80298D38

nonmatching func_80298D40, 0x8

glabel func_80298D40
    /* B3540 80298D40 00000008 */  jr         $zero
    /* B3544 80298D44 24081C08 */   addiu     $t0, $zero, 0x1C08
endlabel func_80298D40

nonmatching func_80298D48, 0x8

glabel func_80298D48
    /* B3548 80298D48 00000008 */  jr         $zero
    /* B354C 80298D4C 24081C09 */   addiu     $t0, $zero, 0x1C09
endlabel func_80298D48

nonmatching func_80298D50, 0x8

glabel func_80298D50
    /* B3550 80298D50 00000008 */  jr         $zero
    /* B3554 80298D54 24081C0A */   addiu     $t0, $zero, 0x1C0A
endlabel func_80298D50

nonmatching func_80298D58, 0x8

glabel func_80298D58
    /* B3558 80298D58 00000008 */  jr         $zero
    /* B355C 80298D5C 24081C0B */   addiu     $t0, $zero, 0x1C0B
endlabel func_80298D58

nonmatching func_80298D60, 0x8

glabel func_80298D60
    /* B3560 80298D60 00000008 */  jr         $zero
    /* B3564 80298D64 24081C0C */   addiu     $t0, $zero, 0x1C0C
endlabel func_80298D60

nonmatching func_80298D68, 0x8

glabel func_80298D68
    /* B3568 80298D68 00000008 */  jr         $zero
    /* B356C 80298D6C 24081C0D */   addiu     $t0, $zero, 0x1C0D
endlabel func_80298D68

nonmatching func_80298D70, 0x8

glabel func_80298D70
    /* B3570 80298D70 00000008 */  jr         $zero
    /* B3574 80298D74 24081D00 */   addiu     $t0, $zero, 0x1D00
endlabel func_80298D70

nonmatching func_80298D78, 0x8

glabel func_80298D78
    /* B3578 80298D78 00000008 */  jr         $zero
    /* B357C 80298D7C 24081D01 */   addiu     $t0, $zero, 0x1D01
endlabel func_80298D78

nonmatching func_80298D80, 0x8

glabel func_80298D80
    /* B3580 80298D80 00000008 */  jr         $zero
    /* B3584 80298D84 24081D02 */   addiu     $t0, $zero, 0x1D02
endlabel func_80298D80

nonmatching func_80298D88, 0x8

glabel func_80298D88
    /* B3588 80298D88 00000008 */  jr         $zero
    /* B358C 80298D8C 24081D03 */   addiu     $t0, $zero, 0x1D03
endlabel func_80298D88

nonmatching func_80298D90, 0x8

glabel func_80298D90
    /* B3590 80298D90 00000008 */  jr         $zero
    /* B3594 80298D94 24081D04 */   addiu     $t0, $zero, 0x1D04
endlabel func_80298D90

nonmatching func_80298D98, 0x8

glabel func_80298D98
    /* B3598 80298D98 00000008 */  jr         $zero
    /* B359C 80298D9C 24081D05 */   addiu     $t0, $zero, 0x1D05
endlabel func_80298D98

nonmatching func_80298DA0, 0x8

glabel func_80298DA0
    /* B35A0 80298DA0 00000008 */  jr         $zero
    /* B35A4 80298DA4 24081D06 */   addiu     $t0, $zero, 0x1D06
endlabel func_80298DA0

nonmatching func_80298DA8, 0x8

glabel func_80298DA8
    /* B35A8 80298DA8 00000008 */  jr         $zero
    /* B35AC 80298DAC 24081D07 */   addiu     $t0, $zero, 0x1D07
endlabel func_80298DA8

nonmatching func_80298DB0, 0x8

glabel func_80298DB0
    /* B35B0 80298DB0 00000008 */  jr         $zero
    /* B35B4 80298DB4 24081D08 */   addiu     $t0, $zero, 0x1D08
endlabel func_80298DB0

nonmatching func_80298DB8, 0x8

glabel func_80298DB8
    /* B35B8 80298DB8 00000008 */  jr         $zero
    /* B35BC 80298DBC 24081D09 */   addiu     $t0, $zero, 0x1D09
endlabel func_80298DB8

nonmatching func_80298DC0, 0x8

glabel func_80298DC0
    /* B35C0 80298DC0 00000008 */  jr         $zero
    /* B35C4 80298DC4 24081D0A */   addiu     $t0, $zero, 0x1D0A
endlabel func_80298DC0

nonmatching func_80298DC8, 0x8

glabel func_80298DC8
    /* B35C8 80298DC8 00000008 */  jr         $zero
    /* B35CC 80298DCC 24081D0B */   addiu     $t0, $zero, 0x1D0B
endlabel func_80298DC8

nonmatching func_80298DD0, 0x8

glabel func_80298DD0
    /* B35D0 80298DD0 00000008 */  jr         $zero
    /* B35D4 80298DD4 24081D0C */   addiu     $t0, $zero, 0x1D0C
endlabel func_80298DD0

nonmatching func_80298DD8, 0x8

glabel func_80298DD8
    /* B35D8 80298DD8 00000008 */  jr         $zero
    /* B35DC 80298DDC 24081D0D */   addiu     $t0, $zero, 0x1D0D
endlabel func_80298DD8

nonmatching func_80298DE0, 0x8

glabel func_80298DE0
    /* B35E0 80298DE0 00000008 */  jr         $zero
    /* B35E4 80298DE4 24081D0E */   addiu     $t0, $zero, 0x1D0E
endlabel func_80298DE0

nonmatching func_80298DE8, 0x8

glabel func_80298DE8
    /* B35E8 80298DE8 00000008 */  jr         $zero
    /* B35EC 80298DEC 24081D0F */   addiu     $t0, $zero, 0x1D0F
endlabel func_80298DE8

nonmatching func_80298DF0, 0x8

glabel func_80298DF0
    /* B35F0 80298DF0 00000008 */  jr         $zero
    /* B35F4 80298DF4 24081D10 */   addiu     $t0, $zero, 0x1D10
endlabel func_80298DF0

nonmatching func_80298DF8, 0x8

glabel func_80298DF8
    /* B35F8 80298DF8 00000008 */  jr         $zero
    /* B35FC 80298DFC 24081D11 */   addiu     $t0, $zero, 0x1D11
endlabel func_80298DF8

nonmatching func_80298E00, 0x8

glabel func_80298E00
    /* B3600 80298E00 00000008 */  jr         $zero
    /* B3604 80298E04 24081D12 */   addiu     $t0, $zero, 0x1D12
endlabel func_80298E00

nonmatching func_80298E08, 0x8

glabel func_80298E08
    /* B3608 80298E08 00000008 */  jr         $zero
    /* B360C 80298E0C 24081D13 */   addiu     $t0, $zero, 0x1D13
endlabel func_80298E08

nonmatching func_80298E10, 0x8

glabel func_80298E10
    /* B3610 80298E10 00000008 */  jr         $zero
    /* B3614 80298E14 24081E00 */   addiu     $t0, $zero, 0x1E00
endlabel func_80298E10

nonmatching func_80298E18, 0x8

glabel func_80298E18
    /* B3618 80298E18 00000008 */  jr         $zero
    /* B361C 80298E1C 24081E01 */   addiu     $t0, $zero, 0x1E01
endlabel func_80298E18

nonmatching func_80298E20, 0x8

glabel func_80298E20
    /* B3620 80298E20 00000008 */  jr         $zero
    /* B3624 80298E24 24081E02 */   addiu     $t0, $zero, 0x1E02
endlabel func_80298E20

nonmatching func_80298E28, 0x8

glabel func_80298E28
    /* B3628 80298E28 00000008 */  jr         $zero
    /* B362C 80298E2C 24081E03 */   addiu     $t0, $zero, 0x1E03
endlabel func_80298E28

nonmatching func_80298E30, 0x8

glabel func_80298E30
    /* B3630 80298E30 00000008 */  jr         $zero
    /* B3634 80298E34 24081E04 */   addiu     $t0, $zero, 0x1E04
endlabel func_80298E30

nonmatching func_80298E38, 0x8

glabel func_80298E38
    /* B3638 80298E38 00000008 */  jr         $zero
    /* B363C 80298E3C 24081E05 */   addiu     $t0, $zero, 0x1E05
endlabel func_80298E38

nonmatching func_80298E40, 0x8

glabel func_80298E40
    /* B3640 80298E40 00000008 */  jr         $zero
    /* B3644 80298E44 24081E06 */   addiu     $t0, $zero, 0x1E06
endlabel func_80298E40

nonmatching func_80298E48, 0x8

glabel func_80298E48
    /* B3648 80298E48 00000008 */  jr         $zero
    /* B364C 80298E4C 24081E07 */   addiu     $t0, $zero, 0x1E07
endlabel func_80298E48

nonmatching func_80298E50, 0x8

glabel func_80298E50
    /* B3650 80298E50 00000008 */  jr         $zero
    /* B3654 80298E54 24081E08 */   addiu     $t0, $zero, 0x1E08
endlabel func_80298E50

nonmatching func_80298E58, 0x8

glabel func_80298E58
    /* B3658 80298E58 00000008 */  jr         $zero
    /* B365C 80298E5C 24081E09 */   addiu     $t0, $zero, 0x1E09
endlabel func_80298E58

nonmatching func_80298E60, 0x8

glabel func_80298E60
    /* B3660 80298E60 00000008 */  jr         $zero
    /* B3664 80298E64 24081E0A */   addiu     $t0, $zero, 0x1E0A
endlabel func_80298E60

nonmatching func_80298E68, 0x8

glabel func_80298E68
    /* B3668 80298E68 00000008 */  jr         $zero
    /* B366C 80298E6C 24081F00 */   addiu     $t0, $zero, 0x1F00
endlabel func_80298E68

nonmatching func_80298E70, 0x8

glabel func_80298E70
    /* B3670 80298E70 00000008 */  jr         $zero
    /* B3674 80298E74 24081F01 */   addiu     $t0, $zero, 0x1F01
endlabel func_80298E70

nonmatching func_80298E78, 0x8

glabel func_80298E78
    /* B3678 80298E78 00000008 */  jr         $zero
    /* B367C 80298E7C 24081F02 */   addiu     $t0, $zero, 0x1F02
endlabel func_80298E78

nonmatching func_80298E80, 0x8

glabel func_80298E80
    /* B3680 80298E80 00000008 */  jr         $zero
    /* B3684 80298E84 24081F03 */   addiu     $t0, $zero, 0x1F03
endlabel func_80298E80

nonmatching func_80298E88, 0x8

glabel func_80298E88
    /* B3688 80298E88 00000008 */  jr         $zero
    /* B368C 80298E8C 24081F04 */   addiu     $t0, $zero, 0x1F04
endlabel func_80298E88

nonmatching func_80298E90, 0x8

glabel func_80298E90
    /* B3690 80298E90 00000008 */  jr         $zero
    /* B3694 80298E94 24081F05 */   addiu     $t0, $zero, 0x1F05
endlabel func_80298E90

nonmatching func_80298E98, 0x8

glabel func_80298E98
    /* B3698 80298E98 00000008 */  jr         $zero
    /* B369C 80298E9C 24081F06 */   addiu     $t0, $zero, 0x1F06
endlabel func_80298E98

nonmatching func_80298EA0, 0x8

glabel func_80298EA0
    /* B36A0 80298EA0 00000008 */  jr         $zero
    /* B36A4 80298EA4 24081F07 */   addiu     $t0, $zero, 0x1F07
endlabel func_80298EA0

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
