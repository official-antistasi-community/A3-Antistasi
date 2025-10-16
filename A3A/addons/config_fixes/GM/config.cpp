
#include "..\script_component.hpp"

class CfgPatches
{
    class PATCHNAME(GM)
    {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"gm_structures_euro_80", "gm_structures_euro_80_winter"};          // WARNING: Needs updating if other changes are added
        skipWhenMissingDependencies = 1;
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};

class CfgVehicles {
    #include "houses.hpp"
};
