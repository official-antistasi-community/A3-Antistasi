//Mehland - config.cpp

#include "..\script_component.hpp"


class CfgPatches 
{
    class PATCHNAME(mehland) 
    {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3_Data_F_AoW_Loadorder","mehland"};
        skipWhenMissingDependencies = 1;
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};


class CfgWorlds {
    class CAWorld;
    class mehland : CAWorld {
        class Names {
            class Kanalen_By_NameCity {
                position[] = {4195,17864};
                radiusA = 200;
                radiusB = 200;
            };
            class Bergssen_NameCity {
                position[] = {6527,7384};
                radiusA = 200;
                radiusB = 200;
            };
            class Dalsbygd_NameCity {
                position[] = {7216,4263};
                radiusA = 300;
                radiusB = 200;
            };
            class Dalsvingen_NameCity {
                position[] = {2940,4263};
                radiusA = 200;
                radiusB = 150;
            };
            class Hgtoppsvingen_NameCity {
                position[] = {4647,2125};
                radiusA = 200;
                radiusB = 150;
            };
            class Innlaget_NameCity {
                position[] = {6117,1415};
                radiusA = 200;
                radiusB = 150;
            };
            class Tmmerholt_NameCity {
                position[] = {17599,1456};
                radiusA = 200;
                radiusB = 150;
            };
            class Bergsbygd_NameCity {
                position[] = {6264,6369};
                radiusA = 200;
                radiusB = 150;
            };
        };
    };
};
