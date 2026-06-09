
#include "..\script_component.hpp"

class CfgPatches 
{
    class PATCHNAME(Tembelan) 
    {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3_Data_F_AoW_Loadorder","A3_Map_Tembelan"};
        skipWhenMissingDependencies = 1;
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};

class CfgWorlds {
    class Altis;
    class Tembelan : Altis {
        class Names {
            class DefaultKeyPoint29 {           // Tepi Pantai Resort
                position[] = {3020,3310,0};
            };
        };
    };
};
