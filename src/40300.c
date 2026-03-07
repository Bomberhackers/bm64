#include <ultra64.h>

extern s32 D_8029F5A0;
extern s32 D_80300000;
extern s32 __malloc_initialized;

s32 sbrk(s32 arg0) {
    s32 ret = D_8029F5A0;
    D_8029F5A0 += arg0;
    if ((D_8029F5A0 - (s32)&D_80300000) >= 0x100000) {
        return -1;
    }
    return ret;
}

UNUSED u8 *hstrcat(u8 *str, u8 *str1) {
    u8 *ret = str;

    while (*str != 0) {
        str++;
    }

    while (*(str++) = *(str1++))
        ;

    return ret;
}

s32 hstrlen(u8 *str) {
    s32 len = 0;
    u8 *sc = str;

    while (*sc != 0) {
        len++;
        sc++;
    }

    return len;
}

void *hmemmove(void *dest, void *src, size_t len) {
    u8 *destp = dest;
    u8 *srcp = src;

    if ((len != 0) && (dest != src)) {
        if ((srcp < destp) && (destp < srcp + len)) {
            while (len--) {
                *(len + destp) = *(len + srcp);
            }
        }
        else {
            while (len--) {
                *destp++ = *srcp++;
            }
        }
    }

    return dest;
}

void *hmemcpy(u8 *dest, u8 *source, s32 c) {
    u8 *d = dest;
    u8 *s = source;

    while (c--) {
        *(d++) = *(s)++;
    }

    return dest;
}

u8 *hmemset(u8 *dst, u32 c, s32 size) {
    u8 *new_dst = dst;

    while (size--) {
        *(new_dst++) = c;
    }

    return dst;
}

void func_80225CA8(void) {
    __malloc_initialized = 0;
}
