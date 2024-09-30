#define COMPONENT logistics
#include "\x\A3A\addons\core\Includes\script_mod.hpp"

//get and format model path to class friendly name for lookup
#define modelOfClass(class) (((getText (configFile/"CfgVehicles"/class/"model")) splitString "\.") joinString "_")

#define TYPE_MORTAR 1
#define TYPE_MG 2
#define TYPE_AT 3
#define TYPE_AA 4

//Basic Variantes
#define BL_MORTAR {1}
#define BL_MG {2}
#define BL_AT {3}
#define BL_AA {4}

// Variants with 2 Blacklisted weapon types
#define BL_MORTAR_MG {1,2}
#define BL_MORTAR_AT {1,3}
#define BL_MORTAR_AA {1,4}
#define BL_MG_AT {2,3}
#define BL_MG_AA {2,4}
#define BL_AT_AA {3,4}

// Variants with 3 Blacklisted Weapon Types
#define BL_MORTAR_MG_AT {1,2,3}
#define BL_MORTAR_MG_AA {1,2,4}
#define BL_MORTAR_AT_AA {1,3,4}
#define BL_MG_AT_AA {2,3,4}

// Variants with 4 Blacklisted Weapon Types
#define BL_ALL {1,2,3,4}