#ifndef _ZEROJMP_FUNCS_MAIN_H_
#define _ZEROJMP_FUNCS_MAIN_H_

#include "zerojmp.h"

// TODO: Define these
#define ZEROJMP_LOADED_AREA_MAIN 0x0000

// if its not defined before including, assume we are calling zerojmp from the main area and NOT the overlay's ZeroJmp tables.
#ifndef AREA
#define AREA ZEROJMP_LOADED_AREA_MAIN
#endif

// TODO, lets generate all of these with a script or something
#define set_secure_call_arr_xx(area) set_secure_call_arr__ ## area ## __secure_call
#define set_secure_call_arr_x(area) set_secure_call_arr_xx(area)
#define set_secure_call_arr set_secure_call_arr_x(AREA)

#define osGetTime_xx(area) osGetTime__ ## area ## __secure_call
#define osGetTime_x(area) osGetTime_xx(area)
#define osGetTime osGetTime_x(AREA)

#define osWritebackDCache_xx(area) osWritebackDCache__ ## area ## __secure_call
#define osWritebackDCache_x(area) osWritebackDCache_xx(area)
#define osWritebackDCache osWritebackDCache_x(AREA)

#define osRecvMesg_xx(area) osRecvMesg__ ## area ## __secure_call
#define osRecvMesg_x(area) osRecvMesg_xx(area)
#define osRecvMesg osRecvMesg_x(AREA)

#define func_800018F8_xx(area) func_800018F8__ ## area ## __secure_call
#define func_800018F8_x(area) func_800018F8_xx(area)
#define func_800018F8 func_800018F8_x(AREA)

#endif // _ZEROJMP_FUNCS_MAIN_H_
