//CWRBAF - config.cpp

#include "..\script_component.hpp"

class CfgPatches 
{
    class PATCHNAME(CWRBAF) 
    {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3_Data_F_AoW_Loadorder","cwr3_air_weapons","cwr3_vehicle_f4_uk"};
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
        skipWhenMissingDependencies = 1;
    };
};

#include "CfgVehicles.hpp"