//TFAR/CWR3 - config.cpp

#include "..\..\script_component.hpp"

class CfgPatches 
{
    class PATCHNAME(TFAR_CWR3)
    {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3_Data_F_AoW_Loadorder","tfar_backpacks","cwr3_soldiers_us","cwr3_soldiers_ru"};
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        skipWhenMissingDependencies = 1;
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"