#ifndef _ZEROJMP_TABLE_DEFINES_UNK41_H_
#define _ZEROJMP_TABLE_DEFINES_UNK41_H_

// TABLE 41 (UNK41)
#define func_8029217C_xx(area) func_8029217C__ ## area ## __secure_call
#define func_8029217C_x(area) func_8029217C_xx(area)
#define func_8029217C func_8029217C_x(ZEROJMP_AREA)

#define func_80291944_xx(area) func_80291944__ ## area ## __secure_call
#define func_80291944_x(area) func_80291944_xx(area)
#define func_80291944 func_80291944_x(ZEROJMP_AREA)

#define func_802909FC_xx(area) func_802909FC__ ## area ## __secure_call
#define func_802909FC_x(area) func_802909FC_xx(area)
#define func_802909FC func_802909FC_x(ZEROJMP_AREA)

#endif // _ZEROJMP_TABLE_DEFINES_UNK41_H_
