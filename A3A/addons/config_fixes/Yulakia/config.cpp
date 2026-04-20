//Yulakia - config.cpp

#include "..\script_component.hpp"


class CfgPatches 
{
    class PATCHNAME(Yulakia) 
    {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3_Data_F_AoW_Loadorder","Yulakia"};
        skipWhenMissingDependencies = 1;
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};
class CfgWorlds {
    class CAWorld;
    class Yulakia : CAWorld {
        class Names {
        // Bad City Center
            class orlanov {
                name = "Orlanov";
                position[] = {8963.13,11791.0};
                radiusA = 200;                      // I think these are supposed to be outer/inner radius but Antistasi uses them as X/Y. Probably a bug.
                radiusB = 200;
                type = "NameVillage";               // NameCity also works, I don't think Antistasi cares
            };
            class stanta {
                name = "Stanta";
                position[] = {4576.82,9623.6};
                radiusA = 200;
                radiusB = 200;
                type = "NameVillage";
            };
            class komunovo {
                name = "Komunovograd";
                position[] = {6881.47,9863.47};
                radiusA = 200;
                radiusB = 200;
                type = "NameVillage";
            };
            class ozarion {
                name = "Ozarion";
                position[] = {733.753,7410.89};
                radiusA = 200;
                radiusB = 200;
                type = "NameVillage";
            };
            class devina {
                name = "Devina";
                position[] = {6534.62,6780.76};
                radiusA = 200;
                radiusB = 200;
                type = "NameVillage";
            };
            class bobrowka {
                name = "Bobrowka";
                position[] = {8392.05,4714.34};
                radiusA = 200;
                radiusB = 200;
                type = "NameVillage";
            };
            class tambova {
                name = "Tambova";
                position[] = {7549.27,1516.05};
                radiusA = 200;
                radiusB = 200;
                type = "NameVillage";
            };
            class komatin {
                name = "Komatin";
                position[] = {10435.8,5879.98};
                radiusA = 200;
                radiusB = 200;
                type = "NameVillage";
            };
            class zacharov {
                name = "Zacharov";
                position[] = {8263.62,6162.28};
                radiusA = 200;
                radiusB = 200;
                type = "NameVillage";
            };
        };
    };
};