#include "gba/gba.h"

extern u32 (*gSomeFuncPtr)(int code, ...);

extern void sub_020005C4();
extern u8 gUnknown_02001070[];
extern u8 gUnknown_02000D48[];
extern u8 gUnknown_02000D8C[];
extern u8 gUnknown_02000AB4[];
extern u8 gUnknown_02000AE0[];
extern u8 gUnknown_020010B4;

int AgbMain(void)
{
    u8 r7;
    u8 sp0[0x100];
    u8 *dest;
    u8 *src;
    u8 r4;
    u16 r4_;

    gSomeFuncPtr(0x2EA, 0x64);
    gSomeFuncPtr(0x210, 0x4E, 0);
    gSomeFuncPtr(0x27E, gUnknown_02001070, 0, 0x10);
    gSomeFuncPtr(0x27E, gUnknown_02000D48, 0x10, 0x10);
    sub_02000260();
    sub_02000980(gUnknown_02000D8C, 0x2D4);
    gSomeFuncPtr(0x2C3, sub_020005C4);
    r7 = gSomeFuncPtr(0x290, 0x101, 0x102, 0x1E03);
    gSomeFuncPtr(0x29A, r7 << 8);
    gSomeFuncPtr(0x291, r7, 0);
    gSomeFuncPtr(0x292, r7);
    gSomeFuncPtr(0x298, r7, 0x100);
    gSomeFuncPtr(0x299, r7, 0x508, gUnknown_02000AB4);
    sp0[0] = 0x81;
    sp0[1] = 0x75;
    src = gUnknown_02000D8C + 0x10;
    dest = sp0 + 2;
    while (*src != 0)
        *dest++ = *src++;
    *dest++ = 0x81;
    *dest++ = 0x76;
    *dest++ = 0;
    gSomeFuncPtr(0x299, r7, 0x510, sp0);
    r7 = gSomeFuncPtr(0x290, 0x101, 0x105, 0x1E10);
    gSomeFuncPtr(0x29A, r7 << 8);
    gSomeFuncPtr(0x291, r7, 0);
    gSomeFuncPtr(0x292, r7);
    gSomeFuncPtr(0x298, r7, 0x100);
    r4 = gSomeFuncPtr(0x290, 0x101, 0, 0x1E02);
    gSomeFuncPtr(0x29A, (r4 << 8) | 2);
    gSomeFuncPtr(0x291, r4, 0);
    gSomeFuncPtr(0x292, r4);
    gSomeFuncPtr(0x298, r4, 0x100);
    gSomeFuncPtr(0x299, r4, 0x402, gUnknown_02000AE0);
    gSomeFuncPtr(0x21A, 0x10, 0x23);
    gSomeFuncPtr(0x200, 0x10);
    r4_ = 0;
    gUnknown_020010B4 = r4_;
    do
    {
        gSomeFuncPtr(0x300, 1);
        gUnknown_020010B4 = sub_020008A4(r4_);
        sub_020009A0(r7);
        r4_ = gSomeFuncPtr(0x301);
    } while (gUnknown_020010B4 == 0);
    return 2;
}

