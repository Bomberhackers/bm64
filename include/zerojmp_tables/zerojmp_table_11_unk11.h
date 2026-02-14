#ifndef _ZEROJMP_TABLE_DEFINES_UNK11_H_
#define _ZEROJMP_TABLE_DEFINES_UNK11_H_

// TABLE 11 (UNK11)
#define func_8022691C_xx(area) func_8022691C__ ## area ## __secure_call
#define func_8022691C_x(area) func_8022691C_xx(area)
#define func_8022691C func_8022691C_x(ZEROJMP_AREA)

#define func_802268F4_xx(area) func_802268F4__ ## area ## __secure_call
#define func_802268F4_x(area) func_802268F4_xx(area)
#define func_802268F4 func_802268F4_x(ZEROJMP_AREA)

#endif // _ZEROJMP_TABLE_DEFINES_UNK11_H_
