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
#include "zerojmp_tables/zerojmp_table_3_ovl.h"
#include "zerojmp_tables/zerojmp_table_4_unk4.h"
#include "zerojmp_tables/zerojmp_table_5_unk5.h"
#include "zerojmp_tables/zerojmp_table_6_vi.h"
#include "zerojmp_tables/zerojmp_table_7_ai.h"
#include "zerojmp_tables/zerojmp_table_8_dp.h"
#include "zerojmp_tables/zerojmp_table_9_pi.h"
#include "zerojmp_tables/zerojmp_table_10_cont.h"
#include "zerojmp_tables/zerojmp_table_11_unk11.h"
#include "zerojmp_tables/zerojmp_table_12_unk12.h"
#include "zerojmp_tables/zerojmp_table_13_unk13.h"
#include "zerojmp_tables/zerojmp_table_14_unk14.h"
#include "zerojmp_tables/zerojmp_table_15_unk15.h"
#include "zerojmp_tables/zerojmp_table_16_unk16.h"
// 17 does not appear to be used
#include "zerojmp_tables/zerojmp_table_18_sys.h"
#include "zerojmp_tables/zerojmp_table_19_al.h"
#include "zerojmp_tables/zerojmp_table_20_unk20.h"
#include "zerojmp_tables/zerojmp_table_21_unk21.h"
#include "zerojmp_tables/zerojmp_table_22_pfs.h"
#include "zerojmp_tables/zerojmp_table_23_unk23.h"
#include "zerojmp_tables/zerojmp_table_24_unk24.h"
#include "zerojmp_tables/zerojmp_table_25_unk25.h"
#include "zerojmp_tables/zerojmp_table_26_unk26.h"
#include "zerojmp_tables/zerojmp_table_27_unk27.h"
#include "zerojmp_tables/zerojmp_table_28_unk28.h"
#include "zerojmp_tables/zerojmp_table_29_unk29.h"
#include "zerojmp_tables/zerojmp_table_30_unk30.h"
// 31 does not appear to be used
//#include "zerojmp_tables/zerojmp_table_32_unk32.h"
//#include "zerojmp_tables/zerojmp_table_33_unk33.h"
//#include "zerojmp_tables/zerojmp_table_34_unk34.h"
//#include "zerojmp_tables/zerojmp_table_35_unk35.h"
//#include "zerojmp_tables/zerojmp_table_36_unk36.h"
//#include "zerojmp_tables/zerojmp_table_37_unk37.h"
//#include "zerojmp_tables/zerojmp_table_38_unk38.h"
//#include "zerojmp_tables/zerojmp_table_39_unk39.h"
//#include "zerojmp_tables/zerojmp_table_40_unk40.h"
//#include "zerojmp_tables/zerojmp_table_41_unk41.h"
//#include "zerojmp_tables/zerojmp_table_42_unk42.h"
//#include "zerojmp_tables/zerojmp_table_43_unk43.h"
//#include "zerojmp_tables/zerojmp_table_44_unk44.h"
//#include "zerojmp_tables/zerojmp_table_45_unk45.h"
//#include "zerojmp_tables/zerojmp_table_46_unk46.h"
//#include "zerojmp_tables/zerojmp_table_47_unk47.h"
//#include "zerojmp_tables/zerojmp_table_48_unk48.h"
//#include "zerojmp_tables/zerojmp_table_49_unk49.h"

#endif

#endif // _ZEROJMP_FUNCS_MAIN_H_
