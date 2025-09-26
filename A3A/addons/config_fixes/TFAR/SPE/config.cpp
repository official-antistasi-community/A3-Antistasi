//TFAR/SPE - config.cpp

#include "..\..\script_component.hpp"

class CfgPatches 
{
    class PATCHNAME(TFAR_SPE)
    {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3_Data_F_AoW_Loadorder","tfar_backpacks","WW2_SPE_Assets_c_Characters_Frenchs_U1_c_FR_Milice_Gear"};
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        skipWhenMissingDependencies = 1;
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"