//IslaDuala3 - config.cpp

#include "..\script_component.hpp"


class CfgPatches 
{
    class PATCHNAME(Napf) 
    {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3_Data_F_AoW_Loadorder","Napf"};
        skipWhenMissingDependencies = 1;
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};
class CfgWorlds {
    class CAWorld;
    class Napf : CAWorld {
        class Names {
            // These are marked as "Name". Fix to "NameVillage".
            class vil_Bunig {
                name = "Bunig";
                position[] = {12578.2,14238.8};
                radiusA = 200;                      // I think these are supposed to be outer/inner radius but Antistasi uses them as X/Y. Probably a bug.
                radiusB = 200;
                type = "NameVillage";               // NameCity also works, I don't think Antistasi cares
            };
            class vil_Magden {
                name = "Magden";
                position[] = {10742.6,17071.8};
                radiusA = 100;
                radiusB = 100;
                type = "NameVillage";
            };
            class vil_Malters {
                name = "Malters";
                position[] = {13595.8,13989.5};
                radiusA = 100;
                radiusB = 100;
                type = "NameVillage";
            };
            class vil_Seltishafen {
                name = "Seltishafen";
                position[] = {5466.87,15935};
                radiusA = 150;
                radiusB = 150;
                type = "NameVillage";
            };
            class vil_Abach {
                name = "Abach";
                position[] = {6491.27,15964.4};
                radiusA = 100;
                radiusB = 100;
                type = "NameVillage";
            };
            class vil_Wasen {
                name = "Wasen";
                position[] = {7385.5,15887};
                radiusA = 150;
                radiusB = 150;
                type = "NameVillage";
            };
            class vil_Worb {
                name = "Worb";
                position[] = {2523,7656};
                radiusA = 150;
                radiusB = 100;
                type = "NameVillage";
            };
            class vil_Horw {
                name = "Horw";
                position[] = {17231,13916};
                radiusA = 100;
                radiusB = 100;
                type = "NameVillage";
            };
            class vil_Brienz {
                name = "Brienz";
                position[] = {14420.4,2956.29};
                radiusA = 100;
                radiusB = 100;
                type = "NameVillage";
            };
            class vil_Sissach {
                name = "Sissach";
                position[] = {11224.5,8632.69};
                radiusA = 100;
                radiusB = 100;
                type = "NameVillage";
            };
            class vil_Luzern {
                name = "Luzern";
                position[] = {14503.1,14136.4};
                radiusA = 200;
                radiusB = 200;
                type = "NameCity";
            };
            class vil_Muttenz {
                name = "Muttenz";
                position[] = {6259.56,10349.7};
                radiusA = 100;
                radiusB = 100;
                type = "NameVillage";
            };
            class Hof_Hungerschwand {
                name = "Hof Hungerschwand";
                position[] = {9009.93,3397.32};
                radiusA = 100;
                radiusB = 100;
                type = "NameVillage";
            };
            class vil_Liestal {
                name = "Liestal";
                position[] = {12746.8,9583.47};
                radiusA = 150;
                radiusB = 150;
                type = "NameVillage";
            };
        };
    };
    class NapfWinter : CAWorld {
        class Names {
            // These are marked as "Name". Fix to "NameVillage".
            class vil_Bunig {
                name = "Bunig";
                position[] = {12578.2,14238.8};
                radiusA = 200;                      // I think these are supposed to be outer/inner radius but Antistasi uses them as X/Y. Probably a bug.
                radiusB = 200;
                type = "NameVillage";               // NameCity also works, I don't think Antistasi cares
            };
            class vil_Magden {
                name = "Magden";
                position[] = {10742.6,17071.8};
                radiusA = 100;
                radiusB = 100;
                type = "NameVillage";
            };
            class vil_Malters {
                name = "Malters";
                position[] = {13595.8,13989.5};
                radiusA = 100;
                radiusB = 100;
                type = "NameVillage";
            };
            class vil_Seltishafen {
                name = "Seltishafen";
                position[] = {5466.87,15935};
                radiusA = 150;
                radiusB = 150;
                type = "NameVillage";
            };
            class vil_Abach {
                name = "Abach";
                position[] = {6491.27,15964.4};
                radiusA = 100;
                radiusB = 100;
                type = "NameVillage";
            };
            class vil_Wasen {
                name = "Wasen";
                position[] = {7385.5,15887};
                radiusA = 150;
                radiusB = 150;
                type = "NameVillage";
            };
            class vil_Worb {
                name = "Worb";
                position[] = {2523,7656};
                radiusA = 150;
                radiusB = 100;
                type = "NameVillage";
            };
            class vil_Horw {
                name = "Horw";
                position[] = {17231,13916};
                radiusA = 100;
                radiusB = 100;
                type = "NameVillage";
            };
            class vil_Brienz {
                name = "Brienz";
                position[] = {14420.4,2956.29};
                radiusA = 100;
                radiusB = 100;
                type = "NameVillage";
            };
            class vil_Sissach {
                name = "Sissach";
                position[] = {11224.5,8632.69};
                radiusA = 100;
                radiusB = 100;
                type = "NameVillage";
            };
            class vil_Luzern {
                name = "Luzern";
                position[] = {14503.1,14136.4};
                radiusA = 200;
                radiusB = 200;
                type = "NameCity";
            };
            class vil_Muttenz {
                name = "Muttenz";
                position[] = {6259.56,10349.7};
                radiusA = 100;
                radiusB = 100;
                type = "NameVillage";
            };
            class Hof_Hungerschwand {
                name = "Hof Hungerschwand";
                position[] = {9009.93,3397.32};
                radiusA = 100;
                radiusB = 100;
                type = "NameVillage";
            };
            class vil_Liestal {
                name = "Liestal";
                position[] = {12746.8,9583.47};
                radiusA = 150;
                radiusB = 150;
                type = "NameVillage";
            };
        };
    };

};