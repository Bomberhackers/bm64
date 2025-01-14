#include "ultra64.h"

void func_80225840(s32);                               /* extern */

void func_80225800(s32 arg0) {
    void (*sp1C)(s32);

    sp1C = func_80225840;
    sp1C(arg0);
}
