//Vanilla - config.cpp

#include "..\script_component.hpp"


class CfgPatches 
{
    class PATCHNAME(A3) 
    {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3_Data_F_AoW_Loadorder"};
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};

// Uncomment when needed
#include "CfgAmmo.hpp"
//#include "CfgMagazines.hpp"
#include "CfgVehicles.hpp"
//#include "CfgMarkers.hpp"
#include "CfgWeapons.hpp"
