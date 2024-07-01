#include "gba/gba.h"

enum
{
    EREADER_OUTPUT_TEXT = 0x299,
};

extern u32 (*gEReaderAPIEntry)(int code, ...);

static const char *gUnknown_02001060;
static u8 unusedFiller[0x8];
static u8 gUnknown_02001070[0x44];
static u8 gUnknown_020010B4;
static u8 unusedFiller2[0x18];

struct SomeHeader
{
    u8 unk0;
    u8 unk1;
    u16 unk2;
};

struct Struct10D0
{
    u8 unk0;
    u8 state;
    u8 unk2;
    u8 unk3;
    u8 unk4[2];
    u8 filler6[2];
    u8 unk8;
    u8 error;
    u8 unkA;
    u8 unkB;
    u8 fillerC[0x14-0xC];
    s32 bufferPos;
    s32 unk18[2];
    u8 filler20[0x28-0x20];
    struct SomeHeader *bufferA;
    u16 *bufferB;
    u16 *unk30[2];
    u8 filler38[8];
    u16 *unk40[4];
    u16 *unk50[4];
    void *unk60[2];
    u8 filler68[0x78-0x68];
    void *unk78[2];
    u8 filler80[0x90-0x80];
    u16 unk90[2][0x24];
};

static struct Struct10D0 gUnknown_020010D0;

static struct
{
    u32 unk0;
    u8 unk4;
    u8 unk5;
    u8 unk6;
    u8 filler7[1];
    u8 unk8[1];
    u8 filler9[0x10-0x9];
    u8 filler10;
    u8 filler11[3];
    u8 unk14;
    u8 unk15;
    u8 filler16[0x34-0x16];
    u32 state;
    u8 *unk38;
    s32 unk3C;
    u32 unk40;
    s32 unk44;
    u32 unk48;
    u32 unk4C;
} gUnknown_020011F0;

// simple black and white palette
__attribute__((aligned(4)))
u16 gBlackWhitePalette[16] = { 0, 0x7FFF };

u8 gUnknown_02000D68[] = { 5, 6, 6, 7, 8, 7 };
u8 gUnknown_02000D6E[] = { 0, 0, 0, 0, 4, 0 };

const char strMarioVsDonkeyKongCardEPlus[] = "Mario Vs. Donkey Kong Card-E+";
const char strMarioVsDonkeyKong[] = "Mario Vs. Donkey Kong";
const char unusedString[] = "MultiSio010918";

const char *gStringTable[] =
{
    "Is now available.\n\n"
    "Link e-Reader to Mario vs. Donkey Kong\n"
    "and select the e-Reader card Menu\n"
    "then select ADD LEVEL to begin.\n\n"
    "Press B Button to Cancel.\n",
    
    "Is now available.\n\n"
    "Link e-Reader to Mario vs. Donkey Kong\n"
    "and select the e-Reader card Menu\n"
    "then select ADD LEVEL to begin.\n\n"
    "Press B Button to Cancel.\n",
    
    "Is ready to send.\n\n"
    "Press the A Button on the GBA with\n"
    "Mario vs. Donkey Kong to begin\n"
    "sending the level.",
    
    "Sending...\n\n"
    "Please DO NOT TURN OFF\n"
    "Game Boy Advance Systems or Disconnect\n"
    "the Game Boy Advance Game Link cable.",
    
    "Level has been sent!\n\n"
    "Press A Button to Resend.\n"
    "Press B Button to Cancel.",
    
    "Sending...\n\n"
    "Please DO NOT TURN OFF\n"
    "Game Boy Advance Systems or Disconnect the\n"
    "Game Boy Advance Game Link cable.",
};

// Level data
#include LEVEL_DATA_INCLUDE

void sub_02000260(void);
void prepare_data_for_transfer(const void *arg0);
int sub_020004E0(u8 *arg0);
void process_transfer(void);
int sub_020008A4(u16 arg0);
void sub_02000980(void *arg0, u32 arg1);
void sub_020009A0(u8 arg0);

int AgbMain(void)
{
    u8 r7;
    u8 text[0x100];
    u8 *dest;
    u8 *src;
    u8 r4;
    u16 r4_;

    gEReaderAPIEntry(0x2EA, 0x64);
    gEReaderAPIEntry(0x210, 0x4E, 0);
    gEReaderAPIEntry(0x27E, gUnknown_02001070, 0, 0x10);
    gEReaderAPIEntry(0x27E, gBlackWhitePalette, 0x10, 0x10);
    sub_02000260();
    sub_02000980(gLevelData, sizeof(gLevelData));
    gEReaderAPIEntry(0x2C3, process_transfer);

    r7 = gEReaderAPIEntry(0x290, 0x101, 0x102, 0x1E03);
    gEReaderAPIEntry(0x29A, r7 << 8);
    gEReaderAPIEntry(0x291, r7, 0);
    gEReaderAPIEntry(0x292, r7);
    gEReaderAPIEntry(0x298, r7, 0x100);

    gEReaderAPIEntry(EREADER_OUTPUT_TEXT, r7, 0x508, strMarioVsDonkeyKongCardEPlus);
    // left corner bracket (u) character
    text[0] = 0x81;
    text[1] = 0x75;
    // copy level name
    src = gLevelData + 0x10;
    dest = text + 2;
    while (*src != 0)
        *dest++ = *src++;
    // right corner bracket (v) character
    *dest++ = 0x81;
    *dest++ = 0x76;
    *dest++ = 0;
    gEReaderAPIEntry(EREADER_OUTPUT_TEXT, r7, 0x510, text);

    r7 = gEReaderAPIEntry(0x290, 0x101, 0x105, 0x1E10);
    gEReaderAPIEntry(0x29A, r7 << 8);
    gEReaderAPIEntry(0x291, r7, 0);
    gEReaderAPIEntry(0x292, r7);
    gEReaderAPIEntry(0x298, r7, 0x100);

    r4 = gEReaderAPIEntry(0x290, 0x101, 0, 0x1E02);
    gEReaderAPIEntry(0x29A, (r4 << 8) | 2);
    gEReaderAPIEntry(0x291, r4, 0);
    gEReaderAPIEntry(0x292, r4);
    gEReaderAPIEntry(0x298, r4, 0x100);

    gEReaderAPIEntry(EREADER_OUTPUT_TEXT, r4, 0x402, strMarioVsDonkeyKong);

    gEReaderAPIEntry(0x21A, 0x10, 0x23);
    gEReaderAPIEntry(0x200, 0x10);
    r4_ = 0;
    gUnknown_020010B4 = 0;
    while (gUnknown_020010B4 == 0)
    {
        gEReaderAPIEntry(0x300, 1);
        gUnknown_020010B4 = sub_020008A4(r4_);
        sub_020009A0(r7);
        r4_ = gEReaderAPIEntry(0x301);
    } 
    return 2;  // return to menu
}

void sub_02000260(void)
{
    u16 r1;
    int i;
    
    // Disable timer and serial interrupts
    REG_IME = 0;
    REG_IE &= ~(INTR_FLAG_TIMER3 | INTR_FLAG_SERIAL);
    REG_IME = 1;

    REG_RCNT = 0;
    *(u32 *)&REG_SIOCNT = SIO_MULTI_MODE;  // enable multiplayer mode
    REG_SIOCNT |= SIO_115200_BPS | SIO_INTR_ENABLE;

    CpuFill32(0, &gUnknown_020010D0, sizeof(gUnknown_020010D0));
    gUnknown_020010D0.bufferPos = -1;
    gUnknown_020010D0.bufferA = &gUnknown_020010D0.unk60;
    gUnknown_020010D0.bufferB = &gUnknown_020010D0.unk78;
    for (i = 0; i < 2; i++)
    {
        gUnknown_020010D0.unk30[i] = &gUnknown_020010D0.unk90[i][0x00];
        gUnknown_020010D0.unk40[i] = &gUnknown_020010D0.unk90[i][0x0C];
        gUnknown_020010D0.unk50[i] = &gUnknown_020010D0.unk90[i][0x18];
    }

    // Re-enable timer and serial interrupts
    REG_IME = 0;
    REG_IE |= INTR_FLAG_SERIAL;
    REG_IME = 1;
}

struct SIOCNTBitfield
{
    u32 unk0:6;
    u32 error:1;
    u32 filler7:7;
    u32 unk1_6:1;
};

static inline u32 someinline(void)
{
    u32 r3 = gUnknown_020010D0.unk3;
    u32 r2 = gUnknown_020010D0.unk2 << 8;
    u32 ret;

    if (gUnknown_020010D0.unk0 == 8)
        ret = 0x80 | r3 | r2;
    else
        ret = r3 | r2;
    return ret;
}

int sub_02000340(const void *data, void *arg1)
{
    u32 siocnt = *(u32 *)&REG_SIOCNT;
    u32 r2_;
    u32 r1;
    u32 r0;
    register u32 idMask asm("r1");

    switch (gUnknown_020010D0.state)
    {
    case 0:
        idMask = SIO_ID;
        if ((siocnt & idMask) == 0)  // Are we master?
        {
            u8 r2;
            u8 status = siocnt & 0x88;
            if (status != 8)
                break;
            r2 = siocnt & (SIO_MULTI_SI_MASK << SIO_MULTI_SI_SHIFT);
            if (r2 == 0 && gUnknown_020010D0.bufferPos == -1)
            {
                REG_IME = 0;
                REG_IE &= ~INTR_FLAG_SERIAL;
                REG_IE |= INTR_FLAG_TIMER3;
                REG_IME = 1;
                ((struct SIOCNTBitfield *)&REG_SIOCNT)->unk1_6 = 0;
                REG_IF = INTR_FLAG_TIMER3 | INTR_FLAG_SERIAL;
                REG_TM3CNT = 0xB1FC;
                gUnknown_020010D0.unk0 = status;
            }
        }
        gUnknown_020010D0.state = 1;
        // fall through
    case 1:
        if (gUnknown_020010D0.unk2 != 0)
        {
            if (gUnknown_020010D0.unkA < 8)
                gUnknown_020010D0.unkA++;
            else
                gUnknown_020010D0.state = 2;
        }
        // fall through
    case 2:
        sub_020004E0(arg1);
        prepare_data_for_transfer(data);
        break;
    }
    gUnknown_020010D0.unkB++;
    r2_ = someinline();
    if (gUnknown_020010D0.error)
        r2_ |= 0x1000;
    r1 = (gUnknown_020010D0.unkA >> 3) << 15;
    if (((siocnt << 0x1A) >> 0x1E) > 1)
        r0 = r2_ | 0x2000 | r1;
    else
        r0 = r2_ | r1;
    return r0;
}

void prepare_data_for_transfer(const void *data)
{
    u32 i;
    int sum = 0;

    gUnknown_020010D0.bufferA->unk0 = gUnknown_020010D0.unkB;
    gUnknown_020010D0.bufferA->unk1 = gUnknown_020010D0.unk2 ^ gUnknown_020010D0.unk3;
    gUnknown_020010D0.bufferA->unk2 = 0;
    CpuCopy32(data, gUnknown_020010D0.bufferA + 1, 16);
    for (i = 0; i < 10; i++)
        sum += ((u16 *)gUnknown_020010D0.bufferA)[i];
    gUnknown_020010D0.bufferA->unk2 = ~sum - 12;

    if (gUnknown_020010D0.unk0 != 0)
        REG_TM3CNT_H = 0;
    gUnknown_020010D0.bufferPos = -1;
    if (gUnknown_020010D0.unk0 != 0 && gUnknown_020010D0.unk8 != 0)
        REG_TM3CNT_H = TIMER_ENABLE | TIMER_INTR_ENABLE;
}

int sub_020004E0(u8 *arg0)
{
    int i;
    u32 j;
    volatile int unused = 0;
    u8 sp4[4];

    REG_IME = 0;
    for (i = 0; i < 4; i++)
    {
        void *r1 = gUnknown_020010D0.unk50[i];
        gUnknown_020010D0.unk50[i] = gUnknown_020010D0.unk40[i];
        gUnknown_020010D0.unk40[i] = r1;
    }
    *(u32 *)sp4 = *(u32 *)gUnknown_020010D0.unk4;
    *(u32 *)gUnknown_020010D0.unk4 = 0;
    REG_IME = 1;
    gUnknown_020010D0.unk3 = 0;
    for (i = 0; i < 2; i++)
    {
        int r3 = 0;

        for (j = 0; j < 10; j++)
            r3 += gUnknown_020010D0.unk50[i][j];
        if (sp4[i] != 0 && (s16)r3 == -13)
        {
            CpuCopy32(gUnknown_020010D0.unk50[i] + 2, arg0 + i * 16, 16);
            gUnknown_020010D0.unk3 |= 1 << i;
        }
        CpuFill32(0, gUnknown_020010D0.unk50[i] + 2, 16);
    }

    gUnknown_020010D0.unk2 |= gUnknown_020010D0.unk3;
    return gUnknown_020010D0.unk3;
}

void process_transfer(void)
{
    u16 sioMulti[4];
    int i;
    volatile u16 *pSIOCNT;

    *(u64 *)sioMulti = *(u64 *)&REG_SIOMULTI0;  // Well, I guess that's one way to copy it!

    gUnknown_020010D0.error = ((struct SIOCNTBitfield *)&REG_SIOCNT)->error;

    // this is weird, but I had to do this t make it match
#define REG_SIOMLT_SEND_ pSIOCNT[1]
    pSIOCNT = &REG_SIOCNT;

    if (gUnknown_020010D0.bufferPos == -1)
    {
        void *temp;
        u16 r0 = 0xFEFE;

        REG_SIOMLT_SEND_ = r0;
        temp = gUnknown_020010D0.bufferB;
        gUnknown_020010D0.bufferB = gUnknown_020010D0.bufferA;
        gUnknown_020010D0.bufferA = temp;
    }
    else if (gUnknown_020010D0.bufferPos >= 0)
    {
        REG_SIOMLT_SEND_ = gUnknown_020010D0.bufferB[gUnknown_020010D0.bufferPos];
    }
    if (gUnknown_020010D0.bufferPos < 11)
        gUnknown_020010D0.bufferPos++;
    for (i = 0; i < 2; i++)
    {
        if (sioMulti[i] == 0xFEFE && gUnknown_020010D0.unk18[i] > 9)
            gUnknown_020010D0.unk18[i] = -1;
        else
        {
            gUnknown_020010D0.unk30[i][gUnknown_020010D0.unk18[i]] = sioMulti[i];
            if (gUnknown_020010D0.unk18[i] == 9)
            {
                void *r1 = gUnknown_020010D0.unk40[i];
                gUnknown_020010D0.unk40[i] = gUnknown_020010D0.unk30[i];
                gUnknown_020010D0.unk30[i] = r1;
                gUnknown_020010D0.unk4[i] = 1;
            }
        }
        if (gUnknown_020010D0.unk18[i] < 11)
            gUnknown_020010D0.unk18[i]++;
    }
    if (gUnknown_020010D0.unk0 == 8)
    {
        // Start transfer
        REG_TM3CNT_H = 0;
        REG_SIOCNT |= SIO_START;
        REG_TM3CNT_H = TIMER_ENABLE | TIMER_INTR_ENABLE;
    }

#undef REG_SIOMLT_SEND_
}

void sub_020006D8(void)
{
    if (gUnknown_020010D0.unk0 != 0)
        gUnknown_020010D0.unk8 = 1;
}

void sub_020006F0(void)
{
    REG_IME = 0;
    REG_IE &= ~(INTR_FLAG_TIMER3 | INTR_FLAG_SERIAL);
    REG_IME = 1;

    REG_SIOCNT = SIO_115200_BPS | SIO_MULTI_MODE;
    REG_TM3CNT = 0xB1FC;
    REG_IF = INTR_FLAG_TIMER3 | INTR_FLAG_SERIAL;
    gUnknown_020010D0.unk8 = 0;
}

void sub_02000740(void)
{
    gUnknown_020010D0.state = 0;
}

void sub_0200074C(int unused)
{
    int r5;
    int r6;
    int r4;

    gUnknown_020011F0.unk4 = gUnknown_02000D68[gUnknown_020011F0.state];
    if (gUnknown_020011F0.state == 3)
    {
        r5 = 12;
        r6 = gUnknown_020011F0.unk15;
        r4 = r5 * r6;
        if (r4 >= gUnknown_020011F0.unk3C)
        {
            r6 = gUnknown_020011F0.unk40;
            r5 = 0;
            gUnknown_020011F0.unk4 = 4;
            gUnknown_020011F0.state = 4;
            gEReaderAPIEntry(0x105, 3);
        }
        else if (r4 + 12 >= gUnknown_020011F0.unk3C)
        {
            r5 = gUnknown_020011F0.unk3C - r4;
            gUnknown_020011F0.unk4 = 4;
            gUnknown_020011F0.state = 4;
            gEReaderAPIEntry(0x105, 3);
        }
        if (r5 > 0)
            CpuCopy16(gUnknown_020011F0.unk38 + r4, gUnknown_020011F0.unk8, r5);
        gUnknown_020011F0.unk5 = r6;
        gUnknown_020011F0.unk6 = r5;
    }
}

int sub_020007E0(int unused)
{
    u32 r2 = gUnknown_020011F0.unk14;

    switch (gUnknown_020011F0.state)
    {
    default:
    case 0:
        if (r2 == 1)
            gUnknown_020011F0.state = r2;
        else if (r2 == 2)
            gUnknown_020011F0.state = r2;
        break;
    case 1:
        if (r2 == 2)
        {
            gUnknown_020011F0.state = r2;
            gEReaderAPIEntry(0x105, 11);
        }
        break;
    case 2:
        gUnknown_020011F0.unk48++;
        if (r2 == 3)
        {
            gUnknown_020011F0.state = r2;
            gEReaderAPIEntry(0x105, 2);
        }
        else if (r2 == 1)
            gUnknown_020011F0.state = r2;
        break;
    case 3:
        gUnknown_020011F0.unk4C = 1;
        if (r2 == 4)
        {
            gUnknown_020011F0.state = r2;
            gEReaderAPIEntry(0x105, 3);
        }
        else if (r2 != 3)
            gUnknown_020011F0.state = 5;
        break;
    case 4:
        break;
    case 5:
        if (r2 == 4)
        {
            gUnknown_020011F0.state = r2;
            gEReaderAPIEntry(0x105, 3);
        }
        else if (r2 == 3)
            gUnknown_020011F0.state = r2;
        break;
    }
    return 0;
}

int sub_020008A4(u16 arg0)
{
    if ((arg0 & 2) && (gUnknown_020011F0.state < 2 || gUnknown_020011F0.state == 4))
    {
        gEReaderAPIEntry(0x105, 6);
        return 1;
    }
    if ((arg0 & 1) && gUnknown_020011F0.state == 4)
    {
        gUnknown_020011F0.state = 0;
        gEReaderAPIEntry(0x105, 5);
    }
    sub_0200074C(arg0);
    gUnknown_020011F0.unk0 = sub_02000340(&gUnknown_020011F0.unk4, &gUnknown_020011F0.unk14);
    if (gUnknown_020011F0.unk0 & 0x3000)
    {
        gUnknown_020011F0.unk44 = 60;
        gUnknown_020011F0.state = gUnknown_02000D6E[gUnknown_020011F0.state];
        return 0;
    }
    if (gUnknown_020011F0.unk0 != 0)
    {
        if ((gUnknown_020011F0.unk0 & 0xF) == ((gUnknown_020011F0.unk0 >> 8) & 0xF))
        {
            sub_020007E0(arg0);
            gUnknown_020011F0.unk44 = 0;
            return 0;
        }
        if (gUnknown_020011F0.unk44 < 60)
            gUnknown_020011F0.unk44++;
        else
            gUnknown_020011F0.state = gUnknown_02000D6E[gUnknown_020011F0.state];
    }
    return 0;
}

void sub_02000980(void *arg0, u32 arg1)
{
    gUnknown_020011F0.state = 0;
    gUnknown_020011F0.unk38 = arg0;
    gUnknown_020011F0.unk3C = arg1;
    gUnknown_020011F0.unk40 = arg1 / 12;
}

void sub_020009A0(u8 arg0)
{
    const char *r5 = gStringTable[gUnknown_020011F0.state];
    
    if (gUnknown_02001060 != r5)
    {
        gUnknown_02001060 = r5;
        gEReaderAPIEntry(0x292, arg0);
        gEReaderAPIEntry(EREADER_OUTPUT_TEXT, arg0, 0x500, r5);
    }
}

void CpuSet(const void *src, void *dest, u32 control)
{
    asm("svc #11");
}
