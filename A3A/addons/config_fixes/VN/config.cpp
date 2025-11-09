//VN - config.cpp

#include "..\script_component.hpp"


class CfgPatches 
{
    class PATCHNAME(VN)
    {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"loadorder_f_vietnam"};
        skipWhenMissingDependencies = 1;
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"

class CfgWorlds {
    class CAWorld;
    class cam_lao_nam : CAWorld {
        class Names {
            class hanoi {
                position[] = {12982,13371};
            };
            class danang {
                position[] = {19799,7002};
            };
            class haiphong {
                position[] = {14874,13162};
            };
            class marble {
                position[] = {20248,6260};
            };
        };
    };
    class vn_khe_sanh : CAWorld {
        class Names {
            class Khesanhvil {
                position[] = {10791,3883};
            };
        };
    };
};
    
