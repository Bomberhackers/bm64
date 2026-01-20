#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cstdint>

// new bm64decompress

// usage:
// bm64decompress <input_file> <output_file>

struct DecompEntry {
    bool is_compressed;
    uint32_t tbl_addr;
    uint32_t entry_ofs;
    uint32_t abs_ofs;
    uint32_t comp_sz;
    uint32_t uncomp_sz; // 0xFFFFFFFF if not known
};

#define OVERLAY_COUNT 109

struct DecompEntry gOverlayTable[OVERLAY_COUNT] = {
    { false, 0x00120000, 0x00000000, 0x00122008, 0x0000000E, 0xFFFFFFFF },
    { true,  0x00120000, 0x0000000E, 0x00122016, 0x00000B1E, 0x000019E0 },
    { true,  0x00120000, 0x00000B2C, 0x00122B34, 0x00000BAE, 0x00001AD0 },
    { true,  0x00120000, 0x000016DA, 0x001236E2, 0x00000B82, 0x00001A50 },
    { true,  0x00120000, 0x0000225C, 0x00124264, 0x00000B6E, 0x00001A40 },
    { false, 0x00140000, 0x00000000, 0x00142008, 0x00000014, 0xFFFFFFFF },
    { true,  0x00140000, 0x00000014, 0x0014201C, 0x00003A78, 0x00005CE0 },
    { true,  0x00140000, 0x00003A8C, 0x00145A94, 0x00003304, 0x00005500 },
    { true,  0x00140000, 0x00006D90, 0x00148D98, 0x000035F6, 0x00005800 },
    { true,  0x00140000, 0x0000A386, 0x0014C38E, 0x00001EDC, 0x000036C0 },
    { true,  0x00140000, 0x0000C262, 0x0014E26A, 0x00003F42, 0x000068D0 },
    { true,  0x00140000, 0x000101A4, 0x001521AC, 0x00002590, 0x000044F0 },
    { false, 0x00160000, 0x00000000, 0x00162008, 0x00000016, 0xFFFFFFFF },
    { true,  0x00160000, 0x00000016, 0x0016201E, 0x00001B44, 0x00002F80 },
    { true,  0x00160000, 0x00001B5A, 0x00163B62, 0x0000452A, 0x00007380 },
    { true,  0x00160000, 0x00006084, 0x0016808C, 0x000038C8, 0x000062E0 },
    { true,  0x00160000, 0x0000994C, 0x0016B954, 0x00003CCC, 0x00007290 },
    { true,  0x00160000, 0x0000D618, 0x0016F620, 0x00001F5E, 0x000037C0 },
    { true,  0x00160000, 0x0000F576, 0x0017157E, 0x00004566, 0x00007590 },
    { true,  0x00160000, 0x00013ADC, 0x00175AE4, 0x000025DA, 0x00003DF0 },
    { false, 0x00180000, 0x00000000, 0x00182008, 0x00000020, 0xFFFFFFFF },
    { true,  0x00180000, 0x00000020, 0x00182028, 0x000046AE, 0x00007980 },
    { true,  0x00180000, 0x000046CE, 0x001866D6, 0x0000428C, 0x000070D0 },
    { true,  0x00180000, 0x0000895A, 0x0018A962, 0x00001250, 0x00002670 },
    { true,  0x00180000, 0x00009BAA, 0x0018BBB2, 0x0000190A, 0x00002DD0 },
    { true,  0x00180000, 0x0000B4B4, 0x0018D4BC, 0x000014F0, 0x00002A60 },
    { true,  0x00180000, 0x0000C9A4, 0x0018E9AC, 0x00003ACE, 0x00006370 },
    { true,  0x00180000, 0x00010472, 0x0019247A, 0x000028C2, 0x00004950 },
    { true,  0x00180000, 0x00012D34, 0x00194D3C, 0x00001308, 0x000025A0 },
    { true,  0x00180000, 0x0001403C, 0x00196044, 0x00002A34, 0x00004AE0 },
    { true,  0x00180000, 0x00016A70, 0x00198A78, 0x00001F4C, 0x00003670 },
    { false, 0x001A0000, 0x00000000, 0x001A2008, 0x00000016, 0xFFFFFFFF },
    { true,  0x001A0000, 0x00000016, 0x001A201E, 0x00002896, 0x00004AD0 },
    { true,  0x001A0000, 0x000028AC, 0x001A48B4, 0x00002D2E, 0x00004A00 },
    { true,  0x001A0000, 0x000055DA, 0x001A75E2, 0x0000313E, 0x00005140 },
    { true,  0x001A0000, 0x00008718, 0x001AA720, 0x000022A6, 0x00004020 },
    { true,  0x001A0000, 0x0000A9BE, 0x001AC9C6, 0x00001BE4, 0x00003130 },
    { true,  0x001A0000, 0x0000C5A2, 0x001AE5AA, 0x0000272A, 0x000045B0 },
    { true,  0x001A0000, 0x0000ECCC, 0x001B0CD4, 0x00001E86, 0x000036E0 },
    { false, 0x001C0000, 0x00000000, 0x001C2008, 0x0000002E, 0xFFFFFFFF },
    { true,  0x001C0000, 0x0000002E, 0x001C2036, 0x000022CA, 0x00003CE0 },
    { true,  0x001C0000, 0x000022F8, 0x001C4300, 0x00001ECA, 0x00003760 },
    { true,  0x001C0000, 0x000041C2, 0x001C61CA, 0x000021DE, 0x00003C10 },
    { true,  0x001C0000, 0x000063A0, 0x001C83A8, 0x00002372, 0x00003F00 },
    { true,  0x001C0000, 0x00008712, 0x001CA71A, 0x00001B22, 0x00003210 },
    { true,  0x001C0000, 0x0000A234, 0x001CC23C, 0x000010C0, 0x00002360 },
    { true,  0x001C0000, 0x0000B2F4, 0x001CD2FC, 0x000010BE, 0x00002360 },
    { true,  0x001C0000, 0x0000C3B2, 0x001CE3BA, 0x000010BE, 0x00002360 },
    { true,  0x001C0000, 0x0000D470, 0x001CF478, 0x00001902, 0x00002F90 },
    { true,  0x001C0000, 0x0000ED72, 0x001D0D7A, 0x000011BC, 0x00002560 },
    { true,  0x001C0000, 0x0000FF2E, 0x001D1F36, 0x00001BBE, 0x000034C0 },
    { true,  0x001C0000, 0x00011AEC, 0x001D3AF4, 0x00001B2C, 0x000032B0 },
    { true,  0x001C0000, 0x00013618, 0x001D5620, 0x000021E8, 0x00003D50 },
    { true,  0x001C0000, 0x00015800, 0x001D7808, 0x000010BE, 0x00002360 },
    { true,  0x001C0000, 0x000168BE, 0x001D88C6, 0x00001FEE, 0x00003900 },
    { false, 0x001E0000, 0x00000000, 0x001E2008, 0x00000020, 0xFFFFFFFF },
    { true,  0x001E0000, 0x00000020, 0x001E2028, 0x0000356E, 0x00005720 },
    { true,  0x001E0000, 0x0000358E, 0x001E5596, 0x0000384E, 0x00005D00 },
    { true,  0x001E0000, 0x00006DDC, 0x001E8DE4, 0x0000258A, 0x00004090 },
    { true,  0x001E0000, 0x00009366, 0x001EB36E, 0x0000371C, 0x00005A70 },
    { true,  0x001E0000, 0x0000CA82, 0x001EEA8A, 0x00001DF8, 0x000034E0 },
    { true,  0x001E0000, 0x0000E87A, 0x001F0882, 0x00000AEC, 0x00001940 },
    { true,  0x001E0000, 0x0000F366, 0x001F136E, 0x0000181C, 0x00002E30 },
    { true,  0x001E0000, 0x00010B82, 0x001F2B8A, 0x0000176E, 0x00002DA0 },
    { true,  0x001E0000, 0x000122F0, 0x001F42F8, 0x00001AC6, 0x00003200 },
    { true,  0x001E0000, 0x00013DB6, 0x001F5DBE, 0x0000210C, 0x00003AE0 },
    { false, 0x00200000, 0x00000000, 0x00202008, 0x00000028, 0xFFFFFFFF },
    { true,  0x00200000, 0x00000028, 0x00202030, 0x0000298C, 0x000042F0 },
    { true,  0x00200000, 0x000029B4, 0x002049BC, 0x000018C8, 0x00002D30 },
    { true,  0x00200000, 0x0000427C, 0x00206284, 0x000027D8, 0x00003FB0 },
    { true,  0x00200000, 0x00006A54, 0x00208A5C, 0x000018C8, 0x00002D10 },
    { true,  0x00200000, 0x0000831C, 0x0020A324, 0x000027A4, 0x00003EE0 },
    { true,  0x00200000, 0x0000AAC0, 0x0020CAC8, 0x00004DF4, 0x00007B60 },
    { true,  0x00200000, 0x0000F8B4, 0x002118BC, 0x000048BE, 0x00006B80 },
    { true,  0x00200000, 0x00014172, 0x0021617A, 0x000043C4, 0x000066C0 },
    { true,  0x00200000, 0x00018536, 0x0021A53E, 0x0000453E, 0x000069B0 },
    { true,  0x00200000, 0x0001CA74, 0x0021EA7C, 0x000027F6, 0x000040A0 },
    { true,  0x00200000, 0x0001F26A, 0x00221272, 0x00002092, 0x000036A0 },
    { true,  0x00200000, 0x000212FC, 0x00223304, 0x00003CE0, 0x00005C30 },
    { true,  0x00200000, 0x00024FDC, 0x00226FE4, 0x00004812, 0x00007B50 },
    { false, 0x00240000, 0x00000000, 0x00242008, 0x00000014, 0xFFFFFFFF },
    { true,  0x00240000, 0x00000014, 0x0024201C, 0x00001B90, 0x000034C0 },
    { true,  0x00240000, 0x00001BA4, 0x00243BAC, 0x00000FAA, 0x00002170 },
    { true,  0x00240000, 0x00002B4E, 0x00244B56, 0x0000181C, 0x00002EA0 },
    { true,  0x00240000, 0x0000436A, 0x00246372, 0x00000EFA, 0x00002070 },
    { true,  0x00240000, 0x00005264, 0x0024726C, 0x00004B32, 0x00007BF0 },
    { true,  0x00240000, 0x00009D96, 0x0024BD9E, 0x00001A3E, 0x00002F80 },
    { false, 0x00260000, 0x00000000, 0x00262008, 0x00000008, 0xFFFFFFFF },
    { true,  0x00260000, 0x00000008, 0x00262010, 0x00005B20, 0x00009200 },
    { true,  0x00260000, 0x00005B28, 0x00267B30, 0x0000721C, 0x0000AC90 },
    { false, 0x00280000, 0x00000000, 0x00282008, 0x00000008, 0xFFFFFFFF },
    { true,  0x00280000, 0x00000008, 0x00282010, 0x00006D78, 0x0000A4A0 },
    { true,  0x00280000, 0x00006D80, 0x00288D88, 0x00007E7E, 0x0000D270 },
    { false, 0x002A0000, 0x00000000, 0x002A2008, 0x00000008, 0xFFFFFFFF },
    { true,  0x002A0000, 0x00000008, 0x002A2010, 0x00007496, 0x0000AF30 },
    { true,  0x002A0000, 0x0000749E, 0x002A94A6, 0x000098D0, 0x0000E320 },
    { false, 0x002C0000, 0x00000000, 0x002C2008, 0x00000004, 0xFFFFFFFF },
    { true,  0x002C0000, 0x00000004, 0x002C200C, 0x000010AA, 0x000022A0 },
    { false, 0x002E0000, 0x00000000, 0x002E2008, 0x00000020, 0xFFFFFFFF },
    { true,  0x002E0000, 0x00000020, 0x002E2028, 0x00001598, 0x00002800 },
    { true,  0x002E0000, 0x000015B8, 0x002E35C0, 0x00000E78, 0x00001DC0 },
    { true,  0x002E0000, 0x00002430, 0x002E4438, 0x00000EAA, 0x00001E40 },
    { true,  0x002E0000, 0x000032DA, 0x002E52E2, 0x00000EA6, 0x00001E30 },
    { true,  0x002E0000, 0x00004180, 0x002E6188, 0x00000EBC, 0x00001E50 },
    { true,  0x002E0000, 0x0000503C, 0x002E7044, 0x000015BA, 0x00002840 },
    { true,  0x002E0000, 0x000065F6, 0x002E85FE, 0x0000156A, 0x00002780 },
    { true,  0x002E0000, 0x00007B60, 0x002E9B68, 0x00001882, 0x00002C60 },
    { true,  0x002E0000, 0x000093E2, 0x002EB3EA, 0x00001D8E, 0x00003390 },
    { true,  0x002E0000, 0x0000B170, 0x002ED178, 0x00001F56, 0x000036F0 }
};

// ---------------------------------------------------------------
// stuff copied from bm64romtool, altered to work for this program
// ---------------------------------------------------------------

#define N 1024   /* size of ring buffer */
#define F 66   /* upper limit for match_length */
#define THRESHOLD 2 /* encode string into position and length  if match_length is greater than this */
#define NIL  N /* index for root of binary search trees */

static uint8_t *rom_data;

uint8_t ROMGetU8(size_t ofs) {
    return rom_data[ofs];
}

uint32_t ROMGetU32(size_t ofs) {
    return (rom_data[ofs] << 24) | (rom_data[ofs + 1] << 16) | (rom_data[ofs + 2] << 8) | rom_data[ofs + 3];
}

// altered to guarantee pad outputs to 0x10 multiples.
void DecompressData(FILE *dst_file, uint32_t rom_ofs) {
    char window[1024];
    size_t window_ofs = 958;
    size_t len = ROMGetU32(rom_ofs);
    size_t dst_pos = 0;
    uint32_t flag = 0;
    rom_ofs += 4;
    memset(window, 0, N);
    while (dst_pos < len) {
        if (!(flag & 0x100)) {
            flag = 0xFF00 | ROMGetU8(rom_ofs);
            rom_ofs++;
        }
        if (flag & 0x1) {
            uint8_t value = ROMGetU8(rom_ofs);
            fwrite(&value, 1, 1, dst_file);
            window[window_ofs] = value;
            rom_ofs++;
            window_ofs = (window_ofs + 1) % 1024;
            dst_pos++;
        } else {
            uint8_t byte1 = ROMGetU8(rom_ofs);
            uint8_t byte2 = ROMGetU8(rom_ofs + 1);
            rom_ofs += 2;
            size_t ofs = ((byte2 & 0xC0) << 2) | byte1;
            size_t copy_len = (byte2 & 0x3F) + THRESHOLD + 1;
            for (size_t i = 0; i < copy_len; i++) {
                uint8_t value = window[ofs];
                window[window_ofs] = value;
                window_ofs = (window_ofs + 1) % N;
                fwrite(&value, 1, 1, dst_file);
                ofs = (ofs + 1) % N;
                dst_pos++;
            }
        }
        flag >>= 1;
    }
}

// ---------------------------------------------------------------

#define ALIGN16(x)  ((((x) + 15) >> 4) << 4)

void process_overlay_entry(FILE *dst_file, int id) {
    if (gOverlayTable[id].is_compressed) {
        // if its compressed, append it normally.
        DecompressData(dst_file, gOverlayTable[id].abs_ofs);
    } else {
        // if its not compressed, copy it to the file and add 0x00s, until it aligns to a 0x10 amount.
        int unalign_size = gOverlayTable[id].comp_sz;
        int align_size = ALIGN16(unalign_size);
        int backup_size = align_size;
        uint8_t *out_buf = (uint8_t *)malloc(align_size);
        for(int i = 0; i < unalign_size; i++, align_size--) {
            out_buf[i] = rom_data[gOverlayTable[id].abs_ofs + i];
            //printf("0x%02X ", out_buf[i]);
        }
        // align the rest of the array.
        for(int i = 0; i < align_size; i++) {
            out_buf[unalign_size + i] = 0x00;
            //printf("0x%02X ", out_buf[unalign_size + i]);
        }
        //printf("\n%d\n", backup_size);
        //printf("Debug: 0x%02X 0x%02X\n", out_buf[0], out_buf[1]);
        fwrite(out_buf, 1, backup_size, dst_file);
        free(out_buf);
    }
}

int main(int argc, char *argv[]) {
    int sz; // size of input ROM
    if (argc != 3) {
        printf("usage: bm64decompress <input_file> <output_file>\n");
        return 1;
    }
    char *filepath = argv[1];
    char *filepath_out = argv[2];
    //printf("DEBUG file in: %s\n", filepath);
    //printf("DEBUG file out: %s\n", filepath_out);
    FILE *rom_in_f = fopen(filepath, "r");
    if (!rom_in_f) {
        printf("File not valid or not found!\n");
        return 1;
    }
    // get size of ROM
    fseek(rom_in_f, 0L, SEEK_END);
    sz = ftell(rom_in_f);
    fseek(rom_in_f, 0L, SEEK_SET);
    //printf("0x%08X\n", sz);
    rom_data = (uint8_t*)malloc(sz);
    // first copy all ROM bytes over to seek the cursor
    int read;
    read = fread(rom_data, 1, sz, rom_in_f);
    if (read != sz) {
        printf("Error reading file (0x%08X != 0x%08X)\n", read, sz);
        return 1;
    }
    //printf("ROM Contents: 0x%02, 0x%02, 0x%02, 0x%02 ...\n", rom_data[0], rom_data[1], rom_data[2], rom_data[3]);
    // now write rom_in to rom_out.
    FILE *rom_out_f = fopen(filepath_out, "wb");
    if (!rom_in_f) {
        printf("Output file not valid or not found!\n");
        return 1;
    }
    read = fwrite(rom_data, 1, sz, rom_out_f);
    // next, append each decompressed overlay entry to the end of the ROM to create the decompressed ROM.
    for(int i = 0; i < OVERLAY_COUNT; i++) {
        printf("Processing overlay %d...\n", i+1);
        process_overlay_entry(rom_out_f, i);
    }
    printf("File written!\n");
    return 0;
}
