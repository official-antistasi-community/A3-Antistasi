//TFAR/Aegis - config.cpp

#include "..\..\script_component.hpp"

class CfgPatches 
{
    class PATCHNAME(TFAR_Aegis)
    {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3_Data_F_AoW_Loadorder","tfar_backpacks","A3_Aegis_Supplies_F_Aegis_Bags"};
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        skipWhenMissingDependencies = 1;
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"