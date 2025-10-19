//SPE - config.cpp

#include "..\script_component.hpp"


class CfgPatches 
{
    class PATCHNAME(SPE)
    {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"WW2_SPE_Assets_c_Vehicles_Weapons_c"};
        skipWhenMissingDependencies = 1;
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "CfgAmmo.hpp"

class CfgWorlds {
    class CAWorld;
    class SPE_Normandy : CAWorld {
        class Names {
            class Vil_Saint_Lo {
                position[] = {11124,10652};
            };
            class Vil_Lengronne {
                position[] = {712,718};
            };
        };
    };
};
    
