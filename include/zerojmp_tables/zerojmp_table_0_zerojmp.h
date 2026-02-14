#ifndef _ZEROJMP_TABLE_DEFINES_ZEROJMP_H_
#define _ZEROJMP_TABLE_DEFINES_ZEROJMP_H_

// TABLE 0 (ZEROJMP)
#define set_secure_call_arr_xx(area) set_secure_call_arr__ ## area ## __secure_call
#define set_secure_call_arr_x(area) set_secure_call_arr_xx(area)
#define set_secure_call_arr set_secure_call_arr_x(ZEROJMP_AREA)

#endif // _ZEROJMP_TABLE_DEFINES_ZEROJMP_H_
