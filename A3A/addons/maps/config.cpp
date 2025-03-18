#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3A_core"};
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};

class A3A {
    #include "mapInfo.hpp"
    #include "NavGrid.hpp"
};


#define A3A_BriefingName QUOTE(Antistasi Community - VERSION)
#define A3A_Mission(MAPNAME) class Antistasi_##MAPNAME { briefingName = A3A_BriefingName; directory = x\A3A\addons\maps\Antistasi_##MAPNAME##.##MAPNAME; };

class CfgMissions
{
    class MPMissions
    { // mission folder names need to be `Antistasi_{Map name}.{Map name}`
        A3A_Mission(Altis)
        A3A_Mission(cam_lao_nam)
        A3A_Mission(chernarus)
        A3A_Mission(chernarus_summer)
        A3A_Mission(chernarus_winter)
        A3A_Mission(cup_chernarus_A3)
        A3A_Mission(Enoch)
        A3A_Mission(gm_weferlingen_summer)
        A3A_Mission(gm_weferlingen_winter)
        A3A_Mission(isladuala3)
        A3A_Mission(Kunduz)
        A3A_Mission(Malden)
        A3A_Mission(pulau)
        A3A_Mission(sara)
        A3A_Mission(SPE_Mortain)
        A3A_Mission(SPE_Normandy)
        A3A_Mission(takistan)
        A3A_Mission(Tanoa)
        A3A_Mission(Tembelan)
        A3A_Mission(tem_anizay)
        A3A_Mission(tem_kujari)
        A3A_Mission(UMB_Colombia)
        A3A_Mission(vn_khe_sanh)
        A3A_Mission(vt7)
#if __A3_DEBUG__
        A3A_Mission(Stratis)
#endif
    };
};
