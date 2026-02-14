#ifndef _ZEROJMP_FUNCS_MAIN_H_
#define _ZEROJMP_FUNCS_MAIN_H_

#include "zerojmp.h"

// -------------------------------------------------------------------
// This file actually defines the functions, per zerojump table.
// MAIN: 0x0000
// -------------------------------------------------------------------

// TODO: Define these
#define ZEROJMP_LOADED_AREA_MAIN 0x0000

// if its not defined before including, assume we are calling zerojmp from the main area and NOT the overlay's ZeroJmp tables.
#ifndef AREA
#define AREA ZEROJMP_LOADED_AREA_MAIN
#endif

#define set_secure_call_arr_xx(area) set_secure_call_arr__ ## area ## __secure_call
#define set_secure_call_arr_x(area) set_secure_call_arr_xx(area)
#define set_secure_call_arr set_secure_call_arr_x(AREA)

void set_secure_call_arr(u32 tableID, u32 (*funcTable)[]);

#endif // _ZEROJMP_FUNCS_MAIN_H_
