#ifndef _ZEROJMP_TABLE_DEFINES_VI_H_
#define _ZEROJMP_TABLE_DEFINES_VI_H_

// TABLE 6 (VI)
#define __osGetActiveQueue_xx(area) __osGetActiveQueue__ ## area ## __secure_call
#define __osGetActiveQueue_x(area) __osGetActiveQueue_xx(area)
#define __osGetActiveQueue __osGetActiveQueue_x(ZEROJMP_AREA)

#define osViGetCurrentMode_xx(area) osViGetCurrentMode__ ## area ## __secure_call
#define osViGetCurrentMode_x(area) osViGetCurrentMode_xx(area)
#define osViGetCurrentMode osViGetCurrentMode_x(ZEROJMP_AREA)

#define osViGetCurrentLine_xx(area) osViGetCurrentLine__ ## area ## __secure_call
#define osViGetCurrentLine_x(area) osViGetCurrentLine_xx(area)
#define osViGetCurrentLine osViGetCurrentLine_x(ZEROJMP_AREA)

#define osViGetCurrentField_xx(area) osViGetCurrentField__ ## area ## __secure_call
#define osViGetCurrentField_x(area) osViGetCurrentField_xx(area)
#define osViGetCurrentField osViGetCurrentField_x(ZEROJMP_AREA)

#define osViGetCurrentFramebuffer_xx(area) osViGetCurrentFramebuffer__ ## area ## __secure_call
#define osViGetCurrentFramebuffer_x(area) osViGetCurrentFramebuffer_xx(area)
#define osViGetCurrentFramebuffer osViGetCurrentFramebuffer_x(ZEROJMP_AREA)

#define osViGetNextFramebuffer_xx(area) osViGetNextFramebuffer__ ## area ## __secure_call
#define osViGetNextFramebuffer_x(area) osViGetNextFramebuffer_xx(area)
#define osViGetNextFramebuffer osViGetNextFramebuffer_x(ZEROJMP_AREA)

#define osViSetXScale_xx(area) osViSetXScale__ ## area ## __secure_call
#define osViSetXScale_x(area) osViSetXScale_xx(area)
#define osViSetXScale osViSetXScale_x(ZEROJMP_AREA)

#define osViSetYScale_xx(area) osViSetYScale__ ## area ## __secure_call
#define osViSetYScale_x(area) osViSetYScale_xx(area)
#define osViSetYScale osViSetYScale_x(ZEROJMP_AREA)

#define osViSetSpecialFeatures_xx(area) osViSetSpecialFeatures__ ## area ## __secure_call
#define osViSetSpecialFeatures_x(area) osViSetSpecialFeatures_xx(area)
#define osViSetSpecialFeatures osViSetSpecialFeatures_x(ZEROJMP_AREA)

#define osViSetMode_xx(area) osViSetMode__ ## area ## __secure_call
#define osViSetMode_x(area) osViSetMode_xx(area)
#define osViSetMode osViSetMode_x(ZEROJMP_AREA)

#define osViSetEvent_xx(area) osViSetEvent__ ## area ## __secure_call
#define osViSetEvent_x(area) osViSetEvent_xx(area)
#define osViSetEvent osViSetEvent_x(ZEROJMP_AREA)

#define osViSwapBuffer_xx(area) osViSwapBuffer__ ## area ## __secure_call
#define osViSwapBuffer_x(area) osViSwapBuffer_xx(area)
#define osViSwapBuffer osViSwapBuffer_x(ZEROJMP_AREA)

#define osViBlack_xx(area) osViBlack__ ## area ## __secure_call
#define osViBlack_x(area) osViBlack_xx(area)
#define osViBlack osViBlack_x(ZEROJMP_AREA)

#define osViFade_xx(area) osViFade__ ## area ## __secure_call
#define osViFade_x(area) osViFade_xx(area)
#define osViFade osViFade_x(ZEROJMP_AREA)

#endif // _ZEROJMP_TABLE_DEFINES_VI_H_
