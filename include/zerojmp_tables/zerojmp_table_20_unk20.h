#ifndef _ZEROJMP_TABLE_DEFINES_UNK20_H_
#define _ZEROJMP_TABLE_DEFINES_UNK20_H_

// TABLE 20 (UNK20)
#define func_8026CE28_xx(area) func_8026CE28__ ## area ## __secure_call
#define func_8026CE28_x(area) func_8026CE28_xx(area)
#define func_8026CE28 func_8026CE28_x(ZEROJMP_AREA)

#define func_8026CCBC_xx(area) func_8026CCBC__ ## area ## __secure_call
#define func_8026CCBC_x(area) func_8026CCBC_xx(area)
#define func_8026CCBC func_8026CCBC_x(ZEROJMP_AREA)

#endif // _ZEROJMP_TABLE_DEFINES_UNK20_H_
