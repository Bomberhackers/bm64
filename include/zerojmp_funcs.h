#ifndef _ZEROJMP_FUNCS_MAIN_H_
#define _ZEROJMP_FUNCS_MAIN_H_

#include "zerojmp.h"
#include "zerojmp_table_ids.h"

// if its not defined before including, assume we are calling zerojmp from the main area and NOT the overlay's ZeroJmp tables.
// Overlays using ZeroJmp will define ZEROJMP_AREA before including ultra64.h.
#ifndef ZEROJMP_AREA
#define ZEROJMP_AREA ZEROJMP_LOADED_AREA_MAIN
#endif

// TODO, lets generate all of these with a script or something
#ifndef NO_ZEROJMP_MAPPING

#include "zerojmp_tables/zerojmp_table_0_zerojmp.h"
#include "zerojmp_tables/zerojmp_table_1_os.h"
#include "zerojmp_tables/zerojmp_table_2_dma.h"
// ...

#endif

#endif // _ZEROJMP_FUNCS_MAIN_H_
