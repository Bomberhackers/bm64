#ifndef _ZEROJMP_TABLE_DEFINES_UNK26_H_
#define _ZEROJMP_TABLE_DEFINES_UNK26_H_

// TABLE 26 (UNK26)
#define func_80287DC0_xx(area) func_80287DC0__ ## area ## __secure_call
#define func_80287DC0_x(area) func_80287DC0_xx(area)
#define func_80287DC0 func_80287DC0_x(ZEROJMP_AREA)

#define func_8028773C_xx(area) func_8028773C__ ## area ## __secure_call
#define func_8028773C_x(area) func_8028773C_xx(area)
#define func_8028773C func_8028773C_x(ZEROJMP_AREA)

#define func_802878E0_xx(area) func_802878E0__ ## area ## __secure_call
#define func_802878E0_x(area) func_802878E0_xx(area)
#define func_802878E0 func_802878E0_x(ZEROJMP_AREA)

#define func_802878BC_xx(area) func_802878BC__ ## area ## __secure_call
#define func_802878BC_x(area) func_802878BC_xx(area)
#define func_802878BC func_802878BC_x(ZEROJMP_AREA)

#endif // _ZEROJMP_TABLE_DEFINES_UNK26_H_
