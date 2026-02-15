#ifndef _ZEROJMP_TABLE_DEFINES_UNK46_H_
#define _ZEROJMP_TABLE_DEFINES_UNK46_H_

// TABLE 46 (UNK46)
#define func_8028E8A4_xx(area) func_8028E8A4__ ## area ## __secure_call
#define func_8028E8A4_x(area) func_8028E8A4_xx(area)
#define func_8028E8A4 func_8028E8A4_x(ZEROJMP_AREA)

#define func_8028E6CC_xx(area) func_8028E6CC__ ## area ## __secure_call
#define func_8028E6CC_x(area) func_8028E6CC_xx(area)
#define func_8028E6CC func_8028E6CC_x(ZEROJMP_AREA)

#endif // _ZEROJMP_TABLE_DEFINES_UNK46_H_
