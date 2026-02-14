#ifndef _ZEROJMP_TABLE_DEFINES_OS_H_
#define _ZEROJMP_TABLE_DEFINES_OS_H_

// TABLE 1 (OS)
#define func_80001698_xx(area) func_80001698__ ## area ## __secure_call
#define func_80001698_x(area) func_80001698_xx(area)
#define func_80001698 func_80001698_x(ZEROJMP_AREA)

#define osJamMesg_xx(area) osJamMesg__ ## area ## __secure_call
#define osJamMesg_x(area) osJamMesg_xx(area)
#define osJamMesg osJamMesg_x(ZEROJMP_AREA)

#define func_800018E8_xx(area) func_800018E8__ ## area ## __secure_call
#define func_800018E8_x(area) func_800018E8_xx(area)
#define func_800018E8 func_800018E8_x(ZEROJMP_AREA)

#define osStartThread_xx(area) osStartThread__ ## area ## __secure_call
#define osStartThread_x(area) osStartThread_xx(area)
#define osStartThread osStartThread_x(ZEROJMP_AREA)

#define osVirtualToPhysical_xx(area) osVirtualToPhysical__ ## area ## __secure_call
#define osVirtualToPhysical_x(area) osVirtualToPhysical_xx(area)
#define osVirtualToPhysical osVirtualToPhysical_x(ZEROJMP_AREA)

#define func_800018F8_xx(area) func_800018F8__ ## area ## __secure_call
#define func_800018F8_x(area) func_800018F8_xx(area)
#define func_800018F8 func_800018F8_x(ZEROJMP_AREA)

#define osMotorStart_xx(area) osMotorStart__ ## area ## __secure_call
#define osMotorStart_x(area) osMotorStart_xx(area)
#define osMotorStart osMotorStart_x(ZEROJMP_AREA)

#define osGetIntMask_xx(area) osGetIntMask__ ## area ## __secure_call
#define osGetIntMask_x(area) osGetIntMask_xx(area)
#define osGetIntMask osGetIntMask_x(ZEROJMP_AREA)

#define osWritebackDCache_xx(area) osWritebackDCache__ ## area ## __secure_call
#define osWritebackDCache_x(area) osWritebackDCache_xx(area)
#define osWritebackDCache osWritebackDCache_x(ZEROJMP_AREA)

#define osInvalDCache_xx(area) osInvalDCache__ ## area ## __secure_call
#define osInvalDCache_x(area) osInvalDCache_xx(area)
#define osInvalDCache osInvalDCache_x(ZEROJMP_AREA)

#define sprintf_xx(area) sprintf__ ## area ## __secure_call
#define sprintf_x(area) sprintf_xx(area)
#define sprintf sprintf_x(ZEROJMP_AREA)

#define osMotorInit_xx(area) osMotorInit__ ## area ## __secure_call
#define osMotorInit_x(area) osMotorInit_xx(area)
#define osMotorInit osMotorInit_x(ZEROJMP_AREA)

#define osRecvMesg_xx(area) osRecvMesg__ ## area ## __secure_call
#define osRecvMesg_x(area) osRecvMesg_xx(area)
#define osRecvMesg osRecvMesg_x(ZEROJMP_AREA)

#define osSetTimer_xx(area) osSetTimer__ ## area ## __secure_call
#define osSetTimer_x(area) osSetTimer_xx(area)
#define osSetTimer osSetTimer_x(ZEROJMP_AREA)

#define osMotorStop_xx(area) osMotorStop__ ## area ## __secure_call
#define osMotorStop_x(area) osMotorStop_xx(area)
#define osMotorStop osMotorStop_x(ZEROJMP_AREA)

#define osDestroyThread_xx(area) osDestroyThread__ ## area ## __secure_call
#define osDestroyThread_x(area) osDestroyThread_xx(area)
#define osDestroyThread osDestroyThread_x(ZEROJMP_AREA)

#define osSetIntMask_xx(area) osSetIntMask__ ## area ## __secure_call
#define osSetIntMask_x(area) osSetIntMask_xx(area)
#define osSetIntMask osSetIntMask_x(ZEROJMP_AREA)

#define osGetCount_xx(area) osGetCount__ ## area ## __secure_call
#define osGetCount_x(area) osGetCount_xx(area)
#define osGetCount osGetCount_x(ZEROJMP_AREA)

#define osScGetCmdQ_xx(area) osScGetCmdQ__ ## area ## __secure_call
#define osScGetCmdQ_x(area) osScGetCmdQ_xx(area)
#define osScGetCmdQ osScGetCmdQ_x(ZEROJMP_AREA)

#define func_800018CC_xx(area) func_800018CC__ ## area ## __secure_call
#define func_800018CC_x(area) func_800018CC_xx(area)
#define func_800018CC func_800018CC_x(ZEROJMP_AREA)

#define osEepromLongWrite_xx(area) osEepromLongWrite__ ## area ## __secure_call
#define osEepromLongWrite_x(area) osEepromLongWrite_xx(area)
#define osEepromLongWrite osEepromLongWrite_x(ZEROJMP_AREA)

#define osCreateMesgQueue_xx(area) osCreateMesgQueue__ ## area ## __secure_call
#define osCreateMesgQueue_x(area) osCreateMesgQueue_xx(area)
#define osCreateMesgQueue osCreateMesgQueue_x(ZEROJMP_AREA)

#define osScAddClient_xx(area) osScAddClient__ ## area ## __secure_call
#define osScAddClient_x(area) osScAddClient_xx(area)
#define osScAddClient osScAddClient_x(ZEROJMP_AREA)

#define osSetThreadPri_xx(area) osSetThreadPri__ ## area ## __secure_call
#define osSetThreadPri_x(area) osSetThreadPri_xx(area)
#define osSetThreadPri osSetThreadPri_x(ZEROJMP_AREA)

#define osGetTime_xx(area) osGetTime__ ## area ## __secure_call
#define osGetTime_x(area) osGetTime_xx(area)
#define osGetTime osGetTime_x(ZEROJMP_AREA)

#define osSpTaskStartGo_xx(area) osSpTaskStartGo__ ## area ## __secure_call
#define osSpTaskStartGo_x(area) osSpTaskStartGo_xx(area)
#define osSpTaskStartGo osSpTaskStartGo_x(ZEROJMP_AREA)

#define osSetTime_xx(area) osSetTime__ ## area ## __secure_call
#define osSetTime_x(area) osSetTime_xx(area)
#define osSetTime osSetTime_x(ZEROJMP_AREA)

#define osCreatePiManager_xx(area) osCreatePiManager__ ## area ## __secure_call
#define osCreatePiManager_x(area) osCreatePiManager_xx(area)
#define osCreatePiManager osCreatePiManager_x(ZEROJMP_AREA)

#define osStopThread_xx(area) osStopThread__ ## area ## __secure_call
#define osStopThread_x(area) osStopThread_xx(area)
#define osStopThread osStopThread_x(ZEROJMP_AREA)

#define osSpTaskLoad_xx(area) osSpTaskLoad__ ## area ## __secure_call
#define osSpTaskLoad_x(area) osSpTaskLoad_xx(area)
#define osSpTaskLoad osSpTaskLoad_x(ZEROJMP_AREA)

#define osYieldThread_xx(area) osYieldThread__ ## area ## __secure_call
#define osYieldThread_x(area) osYieldThread_xx(area)
#define osYieldThread osYieldThread_x(ZEROJMP_AREA)

#define osEepromRead_xx(area) osEepromRead__ ## area ## __secure_call
#define osEepromRead_x(area) osEepromRead_xx(area)
#define osEepromRead osEepromRead_x(ZEROJMP_AREA)

#define osWritebackDCacheAll_xx(area) osWritebackDCacheAll__ ## area ## __secure_call
#define osWritebackDCacheAll_x(area) osWritebackDCacheAll_xx(area)
#define osWritebackDCacheAll osWritebackDCacheAll_x(ZEROJMP_AREA)

#define osSetEventMesg_xx(area) osSetEventMesg__ ## area ## __secure_call
#define osSetEventMesg_x(area) osSetEventMesg_xx(area)
#define osSetEventMesg osSetEventMesg_x(ZEROJMP_AREA)

#define osCreateScheduler_xx(area) osCreateScheduler__ ## area ## __secure_call
#define osCreateScheduler_x(area) osCreateScheduler_xx(area)
#define osCreateScheduler osCreateScheduler_x(ZEROJMP_AREA)

#define osStopTimer_xx(area) osStopTimer__ ## area ## __secure_call
#define osStopTimer_x(area) osStopTimer_xx(area)
#define osStopTimer osStopTimer_x(ZEROJMP_AREA)

#define osGetThreadPri_xx(area) osGetThreadPri__ ## area ## __secure_call
#define osGetThreadPri_x(area) osGetThreadPri_xx(area)
#define osGetThreadPri osGetThreadPri_x(ZEROJMP_AREA)

#define osEepromLongRead_xx(area) osEepromLongRead__ ## area ## __secure_call
#define osEepromLongRead_x(area) osEepromLongRead_xx(area)
#define osEepromLongRead osEepromLongRead_x(ZEROJMP_AREA)

#define osInvalICache_xx(area) osInvalICache__ ## area ## __secure_call
#define osInvalICache_x(area) osInvalICache_xx(area)
#define osInvalICache osInvalICache_x(ZEROJMP_AREA)

#define osEepromProbe_xx(area) osEepromProbe__ ## area ## __secure_call
#define osEepromProbe_x(area) osEepromProbe_xx(area)
#define osEepromProbe osEepromProbe_x(ZEROJMP_AREA)

#define osSendMesg_xx(area) osSendMesg__ ## area ## __secure_call
#define osSendMesg_x(area) osSendMesg_xx(area)
#define osSendMesg osSendMesg_x(ZEROJMP_AREA)

#define func_800018B8_xx(area) func_800018B8__ ## area ## __secure_call
#define func_800018B8_x(area) func_800018B8_xx(area)
#define func_800018B8 func_800018B8_x(ZEROJMP_AREA)

#define osScRemoveClient_xx(area) osScRemoveClient__ ## area ## __secure_call
#define osScRemoveClient_x(area) osScRemoveClient_xx(area)
#define osScRemoveClient osScRemoveClient_x(ZEROJMP_AREA)

#define osGetThreadId_xx(area) osGetThreadId__ ## area ## __secure_call
#define osGetThreadId_x(area) osGetThreadId_xx(area)
#define osGetThreadId osGetThreadId_x(ZEROJMP_AREA)

#define osCreateThread_xx(area) osCreateThread__ ## area ## __secure_call
#define osCreateThread_x(area) osCreateThread_xx(area)
#define osCreateThread osCreateThread_x(ZEROJMP_AREA)

#define osEepromWrite_xx(area) osEepromWrite__ ## area ## __secure_call
#define osEepromWrite_x(area) osEepromWrite_xx(area)
#define osEepromWrite osEepromWrite_x(ZEROJMP_AREA)

#define func_800018C4_xx(area) func_800018C4__ ## area ## __secure_call
#define func_800018C4_x(area) func_800018C4_xx(area)
#define func_800018C4 func_800018C4_x(ZEROJMP_AREA)

#endif // _ZEROJMP_TABLE_DEFINES_OS_H_
