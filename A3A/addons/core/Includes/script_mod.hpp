#define MAINPREFIX x
#define MODFOLDER A3A
#ifndef PREFIX
    #define PREFIX A3A
#endif

#include "common.inc"

#include "script_version.hpp"
#define VERSION MAJOR.MINOR.PATCHLVL
#define VERSION_AR MAJOR,MINOR,PATCHLVL

#define VERSION_FULL MAJOR.MINOR.PATCHLVL.BUILD
#define VERSION_AR_FULL MAJOR,MINOR,PATCHLVL,BUILD

// probably should move to script_version.hpp?
#define MINIMUM_MISSION_VERSION_AR 2,6,1

#define REQUIRED_VERSION 2.12

#ifdef COMPONENT_BEAUTIFIED
    #define COMPONENT_NAME QUOTE(PREFIX - COMPONENT_BEAUTIFIED)
#else
    #define COMPONENT_NAME QUOTE(PREFIX - COMPONENT)
#endif

#ifndef AUTHOR
    #define AUTHOR "Antistasi Dev Team"
#endif
#ifndef AUTHORS
// sepperate authors with a comma
    #define AUTHORS "Antistasi Dev Team, Barbolani"
#endif

#include "script_macros.hpp"

#define PATHTOFOLDER_SYS(var1,var2,var3) \MAINPREFIX\##var1\SUBPREFIX\##var2\##var3
#define PATHTOFOLDER(var1) PATHTOFOLDER_SYS(MODFOLDER,COMPONENT,var1)
#define QPATHTOFOLDER(var1) QUOTE(PATHTOFOLDER(var1))

#define EPATHTOFOLDER(var1,var2) PATHTOFOLDER_SYS(MODFOLDER,var1,var2)
#define EQPATHTOFOLDER(var1,var2) QUOTE(EPATHTOFOLDER(var1,var2))
