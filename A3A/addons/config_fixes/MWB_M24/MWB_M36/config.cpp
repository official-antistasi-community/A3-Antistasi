//SPE - config.cpp

#include "..\..\script_component.hpp"


class CfgPatches 
{
    class PATCHNAME(MWB_M36)
    {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"MWB_M36Jackson"};
        skipWhenMissingDependencies = 1;
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};

    
class CfgVehicles {
    class MWB_M36B1;
    class MWB_M36B2;
    class a3a_MWB_M36B1_French : MWB_M36B1{};
    class a3a_MWB_M36B2_French : MWB_M36B2{};
};