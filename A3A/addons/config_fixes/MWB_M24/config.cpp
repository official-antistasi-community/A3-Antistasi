//SPE - config.cpp

#include "..\script_component.hpp"


class CfgPatches 
{
    class PATCHNAME(MWB_M24)
    {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"MWB_M24Chaffee"};
        skipWhenMissingDependencies = 1;
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};

    
class CfgVehicles {
    class MWB_M24Chaffee;
    class a3a_MWB_M24Chaffee_US : MWB_M24Chaffee {};
    class a3a_MWB_M24Chaffee_French : a3a_MWB_M24Chaffee_US {};
    class a3a_MWB_M24Chaffee_ARVN : a3a_MWB_M24Chaffee_US {};
    class a3a_MWB_M24Chaffee_ROK : a3a_MWB_M24Chaffee_US {};
};