#ifndef _ZEROJMP_TABLE_DEFINES_UNK38_H_
#define _ZEROJMP_TABLE_DEFINES_UNK38_H_

// TABLE 38 (UNK38)
#define func_8028A81C_xx(area) func_8028A81C__ ## area ## __secure_call
#define func_8028A81C_x(area) func_8028A81C_xx(area)
#define func_8028A81C func_8028A81C_x(ZEROJMP_AREA)

#define func_8028A7CC_xx(area) func_8028A7CC__ ## area ## __secure_call
#define func_8028A7CC_x(area) func_8028A7CC_xx(area)
#define func_8028A7CC func_8028A7CC_x(ZEROJMP_AREA)

#define func_8028A4E0_xx(area) func_8028A4E0__ ## area ## __secure_call
#define func_8028A4E0_x(area) func_8028A4E0_xx(area)
#define func_8028A4E0 func_8028A4E0_x(ZEROJMP_AREA)

#define func_8028A584_xx(area) func_8028A584__ ## area ## __secure_call
#define func_8028A584_x(area) func_8028A584_xx(area)
#define func_8028A584 func_8028A584_x(ZEROJMP_AREA)

#endif // _ZEROJMP_TABLE_DEFINES_UNK38_H_
