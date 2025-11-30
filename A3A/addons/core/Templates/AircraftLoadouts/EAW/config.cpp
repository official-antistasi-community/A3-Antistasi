#include "..\..\..\script_component.hpp"

class CfgPatches {
    class PATCHNAME(AirLoadout_EAW) {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"EAW_Air", "EAW_Nomonhan_c", "EAW_Turrets2", "EAW_Village_1"};
        skipWhenMissingDependencies = 1;
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};

class CfgAmmo {
    class Bo_GBU12_LGB;
    class EAW_A4N_30Bomb : Bo_GBU12_LGB {
        sideAirFriction = 0;
    };
};

class CfgWeapons {
    class EAW_bomb_weapon;
    class EAW_HawkIII_Bomb_Pod2 : EAW_bomb_weapon {
        modes[] = {"burst","single"};
    };
};

class A3A {
    class Loadouts
    {
        class CASPlane
        {
            class baseCAS;

            //jp
            class EAW_Ki43_II : baseCAS{
                loadout[] = {"EAW_HawkIII_500Bomb_Mag_P","EAW_HawkIII_500Bomb_Mag_P"};
                mainGun[] = {"EAW_Ki43_II_MG"};
                bombRacks[] = {"EAW_HawkIII_Bomb_Pod2"};
                diveParams[] = {800, 350, 80, 55, 15, {40, 3}};
            };

            //ch
            class EAW_HawkIII : baseCAS{
                loadout[] = {"EAW_RS82_Rockets_Mag_P","EAW_RS82_Rockets_Mag_P","EAW_RS82_Rockets_Mag_P","EAW_RS82_Rockets_Mag_P","EAW_HawkIII_500Bomb_Mag_P"};
                mainGun[] = {"EAW_A4N_MG"};
                rocketLauncher[] = {"EAW_I16_RS82_Pod1"};
                bombRacks[] = {"EAW_HawkIII_Bomb_Pod2","EAW_HawkIII_Bomb_Pod1"};
                diveParams[] = {800, 250, 60, 55, 15, {40, 1}};
            };
            class EAW_AVG_P40 : baseCAS{
                loadout[] = {"EAW_HawkIII_500Bomb_Mag_P"};
                mainGun[] = {"EAW_P40_50Cal_MG", "EAW_P40_30Cal_MG"};
                bombRacks[] = {"EAW_HawkIII_Bomb_Pod2"};
                diveParams[] = {800, 350, 110, 55, 15, {16, 1}};
            };

        };
        class CAPPlane
        {
            class baseCAP;

            //jp
            class EAW_Ki27_AI : baseCAP {};
            class EAW_Ki43_II_AI : baseCAP {
                loadout[] = {"",""};
            };
            class EAW_A4N_AI : baseCAP {
                loadout[] = {"",""};
            };

            //ch
            class EAW_HawkIII_AI : baseCAP {
                loadout[] = {"","","","",""};
            };
            class EAW_i16_AI : baseCAP {
                loadout[] = {"","","","","",""};
            };
            class EAW_AVG_P40_AI : baseCAP {
                loadout[] = {""};
            };
        };
    };
};
