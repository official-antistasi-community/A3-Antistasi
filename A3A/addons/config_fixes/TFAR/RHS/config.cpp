//TFAR/RHS - config.cpp

#include "..\..\script_component.hpp"

class CfgPatches 
{
    class PATCHNAME(TFAR_RHS)
    {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3_Data_F_AoW_Loadorder","tfar_backpacks","rhs_c_troops"};
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        skipWhenMissingDependencies = 1;
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"