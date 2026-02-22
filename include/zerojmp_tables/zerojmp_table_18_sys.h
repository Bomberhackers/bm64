#ifndef _ZEROJMP_TABLE_DEFINES_SYS_H_
#define _ZEROJMP_TABLE_DEFINES_SYS_H_

// TABLE 18 (SYS)
#define __d_to_ll_xx(area) __d_to_ll__ ## area ## __secure_call
#define __d_to_ll_x(area) __d_to_ll_xx(area)
#define __d_to_ll __d_to_ll_x(ZEROJMP_AREA)

#define __ll_to_d_xx(area) __ll_to_d__ ## area ## __secure_call
#define __ll_to_d_x(area) __ll_to_d_xx(area)
#define __ll_to_d __ll_to_d_x(ZEROJMP_AREA)

#define __ull_to_f_xx(area) __ull_to_f__ ## area ## __secure_call
#define __ull_to_f_x(area) __ull_to_f_xx(area)
#define __ull_to_f __ull_to_f_x(ZEROJMP_AREA)

#define __f_to_ull_xx(area) __f_to_ull__ ## area ## __secure_call
#define __f_to_ull_x(area) __f_to_ull_xx(area)
#define __f_to_ull __f_to_ull_x(ZEROJMP_AREA)

#define __ull_to_d_xx(area) __ull_to_d__ ## area ## __secure_call
#define __ull_to_d_x(area) __ull_to_d_xx(area)
#define __ull_to_d __ull_to_d_x(ZEROJMP_AREA)

#define func_800018A8_xx(area) func_800018A8__ ## area ## __secure_call
#define func_800018A8_x(area) func_800018A8_xx(area)
#define func_800018A8 func_800018A8_x(ZEROJMP_AREA)

#define __osGetCurrFaultedThread_xx(area) __osGetCurrFaultedThread__ ## area ## __secure_call
#define __osGetCurrFaultedThread_x(area) __osGetCurrFaultedThread_xx(area)
#define __osGetCurrFaultedThread __osGetCurrFaultedThread_x(ZEROJMP_AREA)

#define func_80001A04_xx(area) func_80001A04__ ## area ## __secure_call
#define func_80001A04_x(area) func_80001A04_xx(area)
#define func_80001A04 func_80001A04_x(ZEROJMP_AREA)

#define Main_GetTvType_xx(area) Main_GetTvType__ ## area ## __secure_call
#define Main_GetTvType_x(area) Main_GetTvType_xx(area)
#define Main_GetTvType Main_GetTvType_x(ZEROJMP_AREA)

#endif // _ZEROJMP_TABLE_DEFINES_SYS_H_
