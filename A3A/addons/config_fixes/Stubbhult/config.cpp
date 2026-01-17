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
                position[] = {6507,1777};
                radiusA = 200;                      // I think these are supposed to be outer/inner radius but Antistasi uses them as X/Y. Probably a bug.
                radiusB = 200;
                type = "NameVillage";               // NameCity also works, I don't think Antistasi cares
            };
            class mjalahult {
                position[] = {3616,1474};     // Also bad position
                radiusA = 200;
                radiusB = 200;
                type = "NameVillage";
            };
            class hallaboke {
                position[] = {3211,4300};
                radiusA = 200;
                radiusB = 200;
                type = "NameVillage";
            };
            class lojenas {
                position[] = {5688,2295};
                radiusA = 200;
                radiusB = 200;
                type = "NameVillage";
            };

            // These have bad positions
            class norra_bokeberg {
                position[] = {7679,2499};
            };
            class vallshult {
                position[] = {4772,921};
            };
            class sofieslatt {
                position[] = {1409,9545};
            };
            class eldshult {
                position[] = {8785,11793};
            };
            class hjalmshult {
                position[] = {10808,3610};
            };
            class gullanabba {
                position[] = {6922,6891};
            };
        };
    };
};
