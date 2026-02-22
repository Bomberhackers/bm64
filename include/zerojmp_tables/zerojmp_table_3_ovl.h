#ifndef _ZEROJMP_TABLE_DEFINES_OVL_H_
#define _ZEROJMP_TABLE_DEFINES_OVL_H_

// TABLE 3 (OVL)
#define OvlSetup_LoadArea_xx(area) OvlSetup_LoadArea__ ## area ## __secure_call
#define OvlSetup_LoadArea_x(area) OvlSetup_LoadArea_xx(area)
#define OvlSetup_LoadArea OvlSetup_LoadArea_x(ZEROJMP_AREA)

#define OvlSetup_LoadExecAddress_xx(area) OvlSetup_LoadExecAddress__ ## area ## __secure_call
#define OvlSetup_LoadExecAddress_x(area) OvlSetup_LoadExecAddress_xx(area)
#define OvlSetup_LoadExecAddress OvlSetup_LoadExecAddress_x(ZEROJMP_AREA)

#endif // _ZEROJMP_TABLE_DEFINES_OVL_H_
