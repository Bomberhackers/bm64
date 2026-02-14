#ifndef _ZEROJMP_TABLE_DEFINES_PI_H_
#define _ZEROJMP_TABLE_DEFINES_PI_H_

// TABLE 9 (PI)
#define osPiGetStatus_xx(area) osPiGetStatus__ ## area ## __secure_call
#define osPiGetStatus_x(area) osPiGetStatus_xx(area)
#define osPiGetStatus osPiGetStatus_x(ZEROJMP_AREA)

#define osPiGetDeviceType_xx(area) osPiGetDeviceType__ ## area ## __secure_call
#define osPiGetDeviceType_x(area) osPiGetDeviceType_xx(area)
#define osPiGetDeviceType osPiGetDeviceType_x(ZEROJMP_AREA)

#define osPiRawWriteIo_xx(area) osPiRawWriteIo__ ## area ## __secure_call
#define osPiRawWriteIo_x(area) osPiRawWriteIo_xx(area)
#define osPiRawWriteIo osPiRawWriteIo_x(ZEROJMP_AREA)

#define osPiRawReadIo_xx(area) osPiRawReadIo__ ## area ## __secure_call
#define osPiRawReadIo_x(area) osPiRawReadIo_xx(area)
#define osPiRawReadIo osPiRawReadIo_x(ZEROJMP_AREA)

#define osPiRawStartDma_xx(area) osPiRawStartDma__ ## area ## __secure_call
#define osPiRawStartDma_x(area) osPiRawStartDma_xx(area)
#define osPiRawStartDma osPiRawStartDma_x(ZEROJMP_AREA)

#define osPiWriteIo_xx(area) osPiWriteIo__ ## area ## __secure_call
#define osPiWriteIo_x(area) osPiWriteIo_xx(area)
#define osPiWriteIo osPiWriteIo_x(ZEROJMP_AREA)

#define osPiReadIo_xx(area) osPiReadIo__ ## area ## __secure_call
#define osPiReadIo_x(area) osPiReadIo_xx(area)
#define osPiReadIo osPiReadIo_x(ZEROJMP_AREA)

#define osPiStartDma_xx(area) osPiStartDma__ ## area ## __secure_call
#define osPiStartDma_x(area) osPiStartDma_xx(area)
#define osPiStartDma osPiStartDma_x(ZEROJMP_AREA)

#endif // _ZEROJMP_TABLE_DEFINES_PI_H_
