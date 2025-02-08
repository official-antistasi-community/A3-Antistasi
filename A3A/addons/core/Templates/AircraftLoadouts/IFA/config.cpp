#include "..\..\..\script_component.hpp"

class CfgPatches {
    class PATCHNAME(AirLoadout_IFA) {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"IFA3_Core"};
        skipWhenMissingDependencies = 1;
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};

class A3A {
    class Loadouts
    {
        class CASPlane
        {
            class baseCAS;
            class LIB_Ju87 : baseCAS {
                loadout[] = {"LIB_1Rnd_SC50","LIB_1Rnd_SC50","LIB_1Rnd_SC500","LIB_1Rnd_SC50","LIB_1Rnd_SC50"};
                mainGun[] = {"LIB_2xMG151_JU87"};
                rocketLauncher[] = {"LIB_2xMG151_JU87"};
                bombRacks[] = {"LIB_SC500_Bomb_Mount","LIB_SC50_Bomb_Mount"};
                diveParams[] = {1200, 300, 110, 55, 15, {15, -2}};
            };
            class LIB_Pe2 : baseCAS {
                loadout[] = {"LIB_1Rnd_FAB250","LIB_1Rnd_FAB250","LIB_1Rnd_FAB250","LIB_1Rnd_FAB250"};
                mainGun[] = {"LIB_UBK_PE2", "LIB_ShKAS_PE2"};
                rocketLauncher[] = {"LIB_UBK_PE2"};
                bombRacks[] = {"LIB_FAB250_Bomb_Mount"};
                diveParams[] = {1200, 300, 110, 55, 15, {12, 0}};
            };
            class LIB_FW190F8_2 : baseCAS {
                loadout[] = {"LIB_1Rnd_SC50","LIB_1Rnd_SC50","LIB_1Rnd_SC500","LIB_1Rnd_SC50","LIB_1Rnd_SC50", "LIB_2000Rnd_MG131_FW190","LIB_500Rnd_MG151_FW190"};
                mainGun[] = {"LIB_2xMG131_FW190","LIB_2xMG151_FW190"};
                rocketLauncher[] = {"LIB_2xMG151_FW190"};
                bombRacks[] = {"LIB_SC500_Bomb_Mount","LIB_SC50_Bomb_Mount"};
                diveParams[] = {1200, 300, 110, 55, 15, {15, -2}};
            };
            class LIB_P47 : baseCAS {
                loadout[] = {"LIB_1Rnd_US_500lb","LIB_1Rnd_US_500lb","LIB_1Rnd_US_500lb", "LIB_6Rnd_M8_P47", "LIB_6Rnd_M8_P47", "LIB_4000Rnd_M2_P47"};
                mainGun[] = {"LIB_8xM2_P47"};
                rocketLauncher[] = {"LIB_M8_Launcher_P47"};
                bombRacks[] = {"LIB_US_500lb_Bomb_Mount"};
                diveParams[] = {1200, 350, 110, 55, 15, {20, 0}};
            };
            class LIB_P39 : baseCAS {
                loadout[] = {"LIB_1Rnd_US_500lb","LIB_30Rnd_M4_P39","LIB_1000Rnd_M2_P39"};
                mainGun[] = {"LIB_4xM2_P39"};
                rocketLauncher[] = {"LIB_M4_P39"};
                bombRacks[] = {"LIB_US_500lb_Bomb_Mount"};
                diveParams[] = {1200, 350, 110, 55, 15, {20, 0}};
            };
            class LIB_RAF_P39 : LIB_P39 {
                loadout[] = {"LIB_1Rnd_US_500lb","LIB_30Rnd_M4_P39","LIB_1000Rnd_M2_P39"};
                bombRacks[] = {"LIB_US_500lb_Bomb_Mount"};
                diveParams[] = {1200, 350, 110, 55, 15, {20, 0}};
            };
            class LIB_US_P39 : LIB_RAF_P39 {};
        };
        class CAPPlane
        {
            class baseCAP;
            class LIB_P39 : baseCAP{
                loadout[] = {""};
            };
            class LIB_RA_P39_2 : LIB_P39{};
            class LIB_RA_P39_3 : LIB_P39{};
            class LIB_RAF_P39 : LIB_P39{};
            class LIB_US_P39 : LIB_P39{};
            class LIB_US_P39_2 : LIB_P39{};
            class LIB_P47 : baseCAP{
                loadout[] = {"","",""};
            };
            class LIB_FW190F8 : baseCAP{
                loadout[] = {"","","","",""};
            };
            class LIB_FW190F8_2 : LIB_FW190F8{};
            class LIB_FW190F8_3 : LIB_FW190F8{};
            class LIB_FW190F8_4 : LIB_FW190F8{};
            class LIB_FW190F8_5 : LIB_FW190F8{};
        };
    };
};
