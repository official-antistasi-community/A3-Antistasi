//WS - config.cpp

#include "..\script_component.hpp"

#if __has_include("\lxws\data_f_lxws\config.bin")

class CfgPatches 
{
    class PATCHNAME(WS) 
    {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3_Data_F_AoW_Loadorder","Vehicles_F_lxWS"};
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};

// Uncomment when needed
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"

#endif      // __has_include("\lxws\data_f_lxws\config.bin")
