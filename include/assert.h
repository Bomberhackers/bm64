#ifndef __ASSERT_H__
#define __ASSERT_H__

#ifdef NDEBUG
#undef assert
#define assert(EX) ((void)0)
#define assert_sched(EX) ((void)0)
#else
extern void __assert(const char *, const char *, int);
#define assert(EX)  ((EX)?((void)0):__assert(#EX, __FILE__, __LINE__))
// dumb workaround. This should probably be compiled via some Makefile lib, because it wants to use src/sched.c otherwise.
// TODO: Dont do this.
#define assert_sched(EX)  ((EX)?((void)0):__assert(#EX, "sched.c", __LINE__))

#endif /* NDEBUG */

#endif /* !__ASSERT_H__ */
