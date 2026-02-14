#ifndef _ZEROJMP_TABLE_DEFINES_UNK5_H_
#define _ZEROJMP_TABLE_DEFINES_UNK5_H_

// TABLE 5 (UNK5)
#define func_802998EC_xx(area) func_802998EC__ ## area ## __secure_call
#define func_802998EC_x(area) func_802998EC_xx(area)
#define func_802998EC func_802998EC_x(ZEROJMP_AREA)

#define func_8029ADCC_xx(area) func_8029ADCC__ ## area ## __secure_call
#define func_8029ADCC_x(area) func_8029ADCC_xx(area)
#define func_8029ADCC func_8029ADCC_x(ZEROJMP_AREA)

#endif // _ZEROJMP_TABLE_DEFINES_UNK5_H_
