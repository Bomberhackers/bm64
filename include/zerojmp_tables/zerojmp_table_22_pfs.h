#ifndef _ZEROJMP_TABLE_DEFINES_PFS_H_
#define _ZEROJMP_TABLE_DEFINES_PFS_H_

// TABLE 22 (PFS)
#define osPfsInit_xx(area) osPfsInit__ ## area ## __secure_call
#define osPfsInit_x(area) osPfsInit_xx(area)
#define osPfsInit osPfsInit_x(ZEROJMP_AREA)

#define osPfsReFormat_xx(area) osPfsReFormat__ ## area ## __secure_call
#define osPfsReFormat_x(area) osPfsReFormat_xx(area)
#define osPfsReFormat osPfsReFormat_x(ZEROJMP_AREA)

#define osPfsChecker_xx(area) osPfsChecker__ ## area ## __secure_call
#define osPfsChecker_x(area) osPfsChecker_xx(area)
#define osPfsChecker osPfsChecker_x(ZEROJMP_AREA)

#define osPfsAllocateFile_xx(area) osPfsAllocateFile__ ## area ## __secure_call
#define osPfsAllocateFile_x(area) osPfsAllocateFile_xx(area)
#define osPfsAllocateFile osPfsAllocateFile_x(ZEROJMP_AREA)

#define osPfsFindFile_xx(area) osPfsFindFile__ ## area ## __secure_call
#define osPfsFindFile_x(area) osPfsFindFile_xx(area)
#define osPfsFindFile osPfsFindFile_x(ZEROJMP_AREA)

#define osPfsDeleteFile_xx(area) osPfsDeleteFile__ ## area ## __secure_call
#define osPfsDeleteFile_x(area) osPfsDeleteFile_xx(area)
#define osPfsDeleteFile osPfsDeleteFile_x(ZEROJMP_AREA)

#define osPfsReadWriteFile_xx(area) osPfsReadWriteFile__ ## area ## __secure_call
#define osPfsReadWriteFile_x(area) osPfsReadWriteFile_xx(area)
#define osPfsReadWriteFile osPfsReadWriteFile_x(ZEROJMP_AREA)

#define osPfsFileState_xx(area) osPfsFileState__ ## area ## __secure_call
#define osPfsFileState_x(area) osPfsFileState_xx(area)
#define osPfsFileState osPfsFileState_x(ZEROJMP_AREA)

#define osPfsGetLabel_xx(area) osPfsGetLabel__ ## area ## __secure_call
#define osPfsGetLabel_x(area) osPfsGetLabel_xx(area)
#define osPfsGetLabel osPfsGetLabel_x(ZEROJMP_AREA)

#define osPfsSetLabel_xx(area) osPfsSetLabel__ ## area ## __secure_call
#define osPfsSetLabel_x(area) osPfsSetLabel_xx(area)
#define osPfsSetLabel osPfsSetLabel_x(ZEROJMP_AREA)

#define osPfsIsPlug_xx(area) osPfsIsPlug__ ## area ## __secure_call
#define osPfsIsPlug_x(area) osPfsIsPlug_xx(area)
#define osPfsIsPlug osPfsIsPlug_x(ZEROJMP_AREA)

#define osPfsFreeBlocks_xx(area) osPfsFreeBlocks__ ## area ## __secure_call
#define osPfsFreeBlocks_x(area) osPfsFreeBlocks_xx(area)
#define osPfsFreeBlocks osPfsFreeBlocks_x(ZEROJMP_AREA)

#define osPfsNumFiles_xx(area) osPfsNumFiles__ ## area ## __secure_call
#define osPfsNumFiles_x(area) osPfsNumFiles_xx(area)
#define osPfsNumFiles osPfsNumFiles_x(ZEROJMP_AREA)

#define func_8000FA20_xx(area) func_8000FA20__ ## area ## __secure_call
#define func_8000FA20_x(area) func_8000FA20_xx(area)
#define func_8000FA20 func_8000FA20_x(ZEROJMP_AREA)

#define osPfsInitPak_xx(area) osPfsInitPak__ ## area ## __secure_call
#define osPfsInitPak_x(area) osPfsInitPak_xx(area)
#define osPfsInitPak osPfsInitPak_x(ZEROJMP_AREA)

#define osPfsRepairId_xx(area) osPfsRepairId__ ## area ## __secure_call
#define osPfsRepairId_x(area) osPfsRepairId_xx(area)
#define osPfsRepairId osPfsRepairId_x(ZEROJMP_AREA)

#endif // _ZEROJMP_TABLE_DEFINES_PFS_H_
