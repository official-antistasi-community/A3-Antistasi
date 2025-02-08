//CUP - config.cpp

#include "..\script_component.hpp"

class CfgPatches 
{
    class PATCHNAME(CUP) 
    {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3_Data_F_AoW_Loadorder","CUP_Vehicles_LoadOrder"};
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        skipWhenMissingDependencies = 1;
        VERSION_CONFIG;
    };
};

// Uncomment when needed
//#include "CfgMagazines.hpp"
#include "CfgVehicles.hpp"
//#include "CfgWeapons.hpp"
