#ifndef _ZEROJMP_TABLE_DEFINES_DMA_H_
#define _ZEROJMP_TABLE_DEFINES_DMA_H_

// TABLE 2 (DMA)
#define func_80000768_xx(area) func_80000768__ ## area ## __secure_call
#define func_80000768_x(area) func_80000768_xx(area)
#define func_80000768 func_80000768_x(ZEROJMP_AREA)

#define func_800004D0_xx(area) func_800004D0__ ## area ## __secure_call
#define func_800004D0_x(area) func_800004D0_xx(area)
#define func_800004D0 func_800004D0_x(ZEROJMP_AREA)

#define load_from_rom_to_addr_xx(area) load_from_rom_to_addr__ ## area ## __secure_call
#define load_from_rom_to_addr_x(area) load_from_rom_to_addr_xx(area)
#define load_from_rom_to_addr load_from_rom_to_addr_x(ZEROJMP_AREA)

#define func_8000064C_xx(area) func_8000064C__ ## area ## __secure_call
#define func_8000064C_x(area) func_8000064C_xx(area)
#define func_8000064C func_8000064C_x(ZEROJMP_AREA)

#define func_8000059C_xx(area) func_8000059C__ ## area ## __secure_call
#define func_8000059C_x(area) func_8000059C_xx(area)
#define func_8000059C func_8000059C_x(ZEROJMP_AREA)

#define func_80000524_xx(area) func_80000524__ ## area ## __secure_call
#define func_80000524_x(area) func_80000524_xx(area)
#define func_80000524 func_80000524_x(ZEROJMP_AREA)

#endif // _ZEROJMP_TABLE_DEFINES_DMA_H_
