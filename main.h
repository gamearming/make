

#ifdef _AMIGA
  #include <dos/dos.h>
  #include <proto/dos.h>
#endif

#ifdef WINDOWS32
  #include <windows.h>
  #include <io.h>
  #ifdef HAVE_STRINGS_H
    #include <strings.h>  /* for strcasecmp */
  #endif
  #include "pathstuff.h"
  #include "sub_proc.h"
  #include "w32err.h"
#endif
#ifdef __EMX__
  #include <sys/types.h>
  #include <sys/wait.h>
#endif
#ifdef HAVE_FCNTL_H
  #include <fcntl.h>
#endif

#if defined HAVE_WAITPID || defined HAVE_WAIT3
  #define HAVE_WAIT_NOHANG
#endif

#ifndef HAVE_UNISTD_H
  int chdir();
#endif
#ifndef STDC_HEADERS
  #ifndef sun                    /* Sun has an incorrect decl in a header.  */
    void exit(int) __attribute__((noreturn));
  #endif
  double atof();
#endif

#ifdef VMS
  #define DEFAULT_TMPDIR     "/sys$scratch/"
#else
  #ifdef P_tmpdir
    #define DEFAULT_TMPDIR    P_tmpdir
  #else
    #define DEFAULT_TMPDIR    "/tmp"
  #endif
#endif
#define DEFAULT_TMPFILE     "GmXXXXXX"