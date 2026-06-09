//SPE - config.cpp

#include "..\script_component.hpp"


class CfgPatches 
{
    class PATCHNAME(SPEX)
    {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"WW2_SPEX_Assets_c_Characters_Americans_c", "A3A_config_fixes_SPE"};
        skipWhenMissingDependencies = 1;
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};

// Uncomment when needed
//#include "CfgVehicles.hpp"
//#include "CfgWeapons.hpp"
//#include "CfgAmmo.hpp"
