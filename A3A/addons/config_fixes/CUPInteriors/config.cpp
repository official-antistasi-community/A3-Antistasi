//CUP maps core - config.cpp

#include "..\script_component.hpp"

class CfgPatches 
{
    class PATCHNAME(CUPInteriors)
    {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"LSR_patch_contact_in_cup_c", PATCHNAME(CUPMapsCore)};      // some houses are defined in both, so make sure we overwrite
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        skipWhenMissingDependencies = 1;
        VERSION_CONFIG;
    };
};

class CfgVehicles {
    #include "houses.hpp"
};
