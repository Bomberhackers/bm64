#ifndef _ZEROJMP_TABLE_DEFINES_AI_H_
#define _ZEROJMP_TABLE_DEFINES_AI_H_

// TABLE 7 (AI)
#define osAiGetStatus_xx(area) osAiGetStatus__ ## area ## __secure_call
#define osAiGetStatus_x(area) osAiGetStatus_xx(area)
#define osAiGetStatus osAiGetStatus_x(ZEROJMP_AREA)

#define osAiGetLength_xx(area) osAiGetLength__ ## area ## __secure_call
#define osAiGetLength_x(area) osAiGetLength_xx(area)
#define osAiGetLength osAiGetLength_x(ZEROJMP_AREA)

#define osAiSetFrequency_xx(area) osAiSetFrequency__ ## area ## __secure_call
#define osAiSetFrequency_x(area) osAiSetFrequency_xx(area)
#define osAiSetFrequency osAiSetFrequency_x(ZEROJMP_AREA)

#define osAiSetNextBuffer_xx(area) osAiSetNextBuffer__ ## area ## __secure_call
#define osAiSetNextBuffer_x(area) osAiSetNextBuffer_xx(area)
#define osAiSetNextBuffer osAiSetNextBuffer_x(ZEROJMP_AREA)

#endif // _ZEROJMP_TABLE_DEFINES_AI_H_
