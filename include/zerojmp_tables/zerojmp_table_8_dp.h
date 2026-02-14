#ifndef _ZEROJMP_TABLE_DEFINES_DP_H_
#define _ZEROJMP_TABLE_DEFINES_DP_H_

// TABLE 8 (DP)
#define osDpGetStatus_xx(area) osDpGetStatus__ ## area ## __secure_call
#define osDpGetStatus_x(area) osDpGetStatus_xx(area)
#define osDpGetStatus osDpGetStatus_x(ZEROJMP_AREA)

#define osDpSetStatus_xx(area) osDpSetStatus__ ## area ## __secure_call
#define osDpSetStatus_x(area) osDpSetStatus_xx(area)
#define osDpSetStatus osDpSetStatus_x(ZEROJMP_AREA)

#define osDpGetCounters_xx(area) osDpGetCounters__ ## area ## __secure_call
#define osDpGetCounters_x(area) osDpGetCounters_xx(area)
#define osDpGetCounters osDpGetCounters_x(ZEROJMP_AREA)

#define osDpSetNextBuffer_xx(area) osDpSetNextBuffer__ ## area ## __secure_call
#define osDpSetNextBuffer_x(area) osDpSetNextBuffer_xx(area)
#define osDpSetNextBuffer osDpSetNextBuffer_x(ZEROJMP_AREA)

#endif // _ZEROJMP_TABLE_DEFINES_DP_H_
