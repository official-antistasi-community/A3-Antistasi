//stubbhult - config.cpp

#include "..\script_component.hpp"


class CfgPatches 
{
    class PATCHNAME(stubbhult) 
    {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3_Data_F_AoW_Loadorder","stubbhult"};
        skipWhenMissingDependencies = 1;
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};
class CfgWorlds {
    class CAWorld;
    class stubbhult : CAWorld {
        class Names {
            // These are marked as "Name". Fix to "NameVillage".
            class sodra_bokeberg {
                position[] = {6477.68,1786.03};
                radiusA = 200;                      // I think these are supposed to be outer/inner radius but Antistasi uses them as X/Y. Probably a bug.
                radiusB = 200;
                type = "NameVillage";               // NameCity also works, I don't think Antistasi cares
            };
            class mjalahult {
                position[] = {3648.89,1503.48,};
                radiusA = 200;
                radiusB = 200;
                type = "NameVillage";
        };
            class hallaboke {
                position[] = {3272.56,4237.83};
                radiusA = 200;
                radiusB = 200;
                type = "NameVillage";
    };
            class lojenas {
                position[] = {5634.71,2285.48};
                radiusA = 200;
                radiusB = 200;
                type = "NameVillage";
};
};
};