#ifndef _ZEROJMP_TABLE_DEFINES_CONT_H_
#define _ZEROJMP_TABLE_DEFINES_CONT_H_

// TABLE 10 (CONT)
#define osContInit_xx(area) osContInit__ ## area ## __secure_call
#define osContInit_x(area) osContInit_xx(area)
#define osContInit osContInit_x(ZEROJMP_AREA)

#define osContStartReadData_xx(area) osContStartReadData__ ## area ## __secure_call
#define osContStartReadData_x(area) osContStartReadData_xx(area)
#define osContStartReadData osContStartReadData_x(ZEROJMP_AREA)

#define osContGetReadData_xx(area) osContGetReadData__ ## area ## __secure_call
#define osContGetReadData_x(area) osContGetReadData_xx(area)
#define osContGetReadData osContGetReadData_x(ZEROJMP_AREA)

#define osContReset_xx(area) osContReset__ ## area ## __secure_call
#define osContReset_x(area) osContReset_xx(area)
#define osContReset osContReset_x(ZEROJMP_AREA)

#define osContStartQuery_xx(area) osContStartQuery__ ## area ## __secure_call
#define osContStartQuery_x(area) osContStartQuery_xx(area)
#define osContStartQuery osContStartQuery_x(ZEROJMP_AREA)

#define osContSetCh_xx(area) osContSetCh__ ## area ## __secure_call
#define osContSetCh_x(area) osContSetCh_xx(area)
#define osContSetCh osContSetCh_x(ZEROJMP_AREA)

#define osContGetQuery_xx(area) osContGetQuery__ ## area ## __secure_call
#define osContGetQuery_x(area) osContGetQuery_xx(area)
#define osContGetQuery osContGetQuery_x(ZEROJMP_AREA)

#endif // _ZEROJMP_TABLE_DEFINES_CONT_H_
