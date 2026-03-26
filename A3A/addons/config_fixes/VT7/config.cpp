
#include "..\script_component.hpp"

class CfgPatches 
{
    class PATCHNAME(VT7) 
    {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3_Data_F_AoW_Loadorder","vt7"};
        skipWhenMissingDependencies = 1;
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};

class CfgWorlds {
    class CAWorld;
    class vt7 : CAWorld {
        class Names {
            class uski {
                position[] = {2148.62,13239.2,0};
            };
        };
    };
};
