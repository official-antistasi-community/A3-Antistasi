//CUP maps core - config.cpp

#include "..\script_component.hpp"

class CfgPatches 
{
    class PATCHNAME(CUPMapsCore)
    {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"CUP_Core"};
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
#include "CfgWorlds.hpp"
