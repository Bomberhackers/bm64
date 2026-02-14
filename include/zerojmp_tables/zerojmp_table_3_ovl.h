#ifndef _ZEROJMP_TABLE_DEFINES_OVL_H_
#define _ZEROJMP_TABLE_DEFINES_OVL_H_

// TABLE 3 (OVL)
#define func_800007F0_xx(area) func_800007F0__ ## area ## __secure_call
#define func_800007F0_x(area) func_800007F0_xx(area)
#define func_800007F0 func_800007F0_x(ZEROJMP_AREA)

#define func_8000083C_xx(area) func_8000083C__ ## area ## __secure_call
#define func_8000083C_x(area) func_8000083C_xx(area)
#define func_8000083C func_8000083C_x(ZEROJMP_AREA)

#endif // _ZEROJMP_TABLE_DEFINES_OVL_H_
