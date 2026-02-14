#ifndef _ZEROJMP_TABLE_DEFINES_UNK12_H_
#define _ZEROJMP_TABLE_DEFINES_UNK12_H_

// TABLE 12 (UNK12)
#define func_80243BA8_xx(area) func_80243BA8__ ## area ## __secure_call
#define func_80243BA8_x(area) func_80243BA8_xx(area)
#define func_80243BA8 func_80243BA8_x(ZEROJMP_AREA)

#define func_80243A50_xx(area) func_80243A50__ ## area ## __secure_call
#define func_80243A50_x(area) func_80243A50_xx(area)
#define func_80243A50 func_80243A50_x(ZEROJMP_AREA)

#define func_802438BC_xx(area) func_802438BC__ ## area ## __secure_call
#define func_802438BC_x(area) func_802438BC_xx(area)
#define func_802438BC func_802438BC_x(ZEROJMP_AREA)

#endif // _ZEROJMP_TABLE_DEFINES_UNK12_H_
