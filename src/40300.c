#include <ultra64.h>

extern s32 D_8029F5A0;
extern s32 D_80300000;
extern s32 D_802B36A4;

s32 func_80225B00(s32 arg0)
{
    s32 ret = D_8029F5A0;
    D_8029F5A0 += arg0;
    if ((D_8029F5A0 - (s32)&D_80300000) >= 0x100000)
    {
        return -1;
    }
    return ret;
}

UNUSED u8 *Libc_Strcat(u8 *str, u8 *str1)
{
    u8 *ret;

    ret = str;

    while (*str != 0)
    {
        str++;
    }

    while (*(str++) = *(str1++))
        ; 

    return ret;
}

s32 Libc_Strlen(u8 *str)
{
    s32 len = 0;
    u8 *sc = str;

    while (*sc != 0)
    {
        len++,
            sc++;
    }

    return len;
}

void *Libc_memmove(void *dest, void *src, size_t len)
{
    u8 *destp = dest;
    u8 *srcp = src;

    if ((len != 0) && (dest != src))
    {
        if ((srcp < destp) && (destp < srcp + len))
        {
            while (len--)
            {
                *(len + destp) = *(len + srcp);
            }
        }
        else
        {
            while (len--)
            {
                *destp++ = *srcp++;
            }
        }
    }

    return dest;
}

void *Libc_memcpy(u8 *dest, u8 *source, s32 c)
{
    u8 *d;
    u8 *s;

    d = dest;
    s = source;

    while (c--)
    {
        *(d++) = *(s)++;
    }

    return dest;
}

u8 *Libc_memset(u8 *arg0, u8 *arg1, s32 arg2)
{
    u8 *var_v0 = arg0;

    while (arg2--)
    {
        *(var_v0++) = arg1;
    }

    return arg0;
}

void func_80225CA8(void)
{
    D_802B36A4 = 0;
}
