#include "..\..\script_component.hpp"

#define COMPONENT medical
#define COMPONENT_BEAUTIFIED Medical
#include "\z\a4es\addons\main\script_mod.hpp" //needs adaptation for Antistasi

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#include "\z\a4es\addons\main\script_macros.hpp" //needs adaptation for Antistasi

#define MEDICAL_HEADSHOT_MIN_DAMAGE 5.5
#define MEDICAL_HEADSHOT_SCALE_MAX_DAMAGE 34
#define MEDICAL_HEADSHOT_SCALE_MAX_CHANCE 0.85

#define MEDICAL_FATALSTATE_MAX_WOUNDS_COUNT 60