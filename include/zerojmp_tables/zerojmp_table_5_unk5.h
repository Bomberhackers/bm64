#ifndef _ZEROJMP_TABLE_DEFINES_LIBMALLOC_H_
#define _ZEROJMP_TABLE_DEFINES_LIBMALLOC_H_

// TABLE 5 (libmalloc)

#define malloc_xx(area) malloc__ ## area ## __secure_call
#define malloc_x(area) malloc_xx(area)
#define malloc malloc_x(ZEROJMP_AREA)

#define free_xx(area) free__ ## area ## __secure_call
#define free_x(area) free_xx(area)
#define free free_x(ZEROJMP_AREA)

#endif // _ZEROJMP_TABLE_DEFINES_LIBMALLOC_H_
