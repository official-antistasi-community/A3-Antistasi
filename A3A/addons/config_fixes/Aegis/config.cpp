//Aegis - config.cpp

#include "..\script_component.hpp"


class CfgPatches 
{
    class PATCHNAME(Aegis) 
    {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3_Aegis_Weapons_F_Aegis_Rifles_AKM74", "A3_Aegis_Data_F_Aegis_Loadorder"};
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
        skipWhenMissingDependencies = 1;
    };
};

// Uncomment when needed
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
