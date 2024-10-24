#include "..\..\..\script_component.hpp"

class CfgPatches {
    class PATCHNAME(AirLoadout_Aegis) {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3_Aegis_Weapons_F_Aegis"};
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
            class B_Plane_CAS_01_dynamicLoadout_F : baseCAS {
                loadout[] = {"PylonRack_7Rnd_Rocket_04_HE_F","PylonRack_7Rnd_Rocket_04_HE_F","PylonRack_7Rnd_Rocket_04_HE_F","PylonRack_3Rnd_LG_scalpel","PylonRack_3Rnd_LG_scalpel","PylonRack_3Rnd_LG_scalpel","PylonRack_3Rnd_LG_scalpel","PylonRack_7Rnd_Rocket_04_HE_F","PylonRack_7Rnd_Rocket_04_HE_F","PylonRack_7Rnd_Rocket_04_HE_F"};
                mainGun[] = {"Gatling_30mm_Plane_CAS_01_F"};
                rocketLauncher[] = {"Rocket_04_HE_Plane_CAS_01_F"};
                missileLauncher[] = {"Missile_AGM_02_Plane_CAS_01_F", "missiles_SCALPEL"};
            };
            class O_Plane_CAS_02_dynamicLoadout_F : baseCAS {
                loadout[] = {"PylonMissile_1Rnd_LG_scalpel","PylonRack_19Rnd_Rocket_Skyfire","PylonRack_20Rnd_Rocket_03_AP_F","PylonRack_4Rnd_LG_scalpel","PylonRack_4Rnd_LG_scalpel","PylonRack_4Rnd_LG_scalpel","PylonRack_4Rnd_LG_scalpel","PylonRack_20Rnd_Rocket_03_AP_F","PylonRack_19Rnd_Rocket_Skyfire","PylonMissile_1Rnd_LG_scalpel"};
                mainGun[] = {"Cannon_30mm_Plane_CAS_02_F"};
                rocketLauncher[] = {"Rocket_03_AP_Plane_CAS_02_F", "rockets_Skyfire"};
                missileLauncher[] = {"missiles_SCALPEL"};
            };
            class O_T_Plane_CAS_02_dynamicLoadout_ghex_F : O_Plane_CAS_02_dynamicLoadout_F{};
            class O_R_Plane_CAS_02_dynamicLoadout_F : O_Plane_CAS_02_dynamicLoadout_F{};

            class I_Plane_Fighter_03_dynamicLoadout_F : baseCAS {
                loadout[] = {"PylonRack_7Rnd_Rocket_04_AP_F","PylonRack_3Rnd_LG_scalpel","PylonRack_1Rnd_Missile_AGM_02_F","PylonWeapon_300Rnd_20mm_shells","PylonRack_1Rnd_Missile_AGM_02_F","PylonRack_3Rnd_LG_scalpel","PylonRack_7Rnd_Rocket_04_AP_F"};
                mainGun[] = {"Twin_Cannon_20mm"};
                rocketLauncher[] = {"Rocket_04_AP_Plane_CAS_01_F"};
                missileLauncher[] = {"Missile_AGM_02_Plane_CAS_01_F", "missiles_SCALPEL"};
            };
            class a3a_Plane_Fighter_03_grey_F : I_Plane_Fighter_03_dynamicLoadout_F{};

            class I_E_Plane_Fighter_04_F : baseCAS {
                loadout[] = {["magazine_Fighter04_Gun20mm_AA_x120_red","PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_BIM9X_x1","PylonRack_Missile_AGM_02_x1","PylonRack_Missile_AGM_02_x1","PylonMissile_Bomb_GBU12_x1","PylonMissile_Bomb_GBU12_x1"]};
                mainGun[] = {"weapon_Fighter_Gun20mm_AA"}
                rocketLauncher[] = {"weapon_GBU12Launcher"};
                missileLauncher[] = {"weapon_AGM_65Launcher", "weapon_BIM9xLauncher"};
            };
            class B_A_Plane_Fighter_05_F : baseCAS {
                loadout[] = {"PylonRack_Missile_BIM9X_x1","PylonRack_Missile_BIM9X_x1","PylonRack_Missile_AGM_02_x1","PylonRack_Missile_AGM_02_x1","PylonRack_Bomb_SDB_x4","PylonRack_Bomb_SDB_x4","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonRack_Bomb_SDB_x4","PylonRack_Bomb_SDB_x4","PylonWeapon_220Rnd_25mm_shells"};
                mainGun[] = {"gatling_25mm"};
                rocketLauncher[] = {"weapon_SDBLauncher"};
                missileLauncher[] = {"weapon_AGM_65Launcher", "weapon_BIM9xLauncher", "weapon_AMRAAMLauncher"};
            };

        };
        class CAPPlane
        {
            class baseCAP;
            class B_Plane_Fighter_01_F : baseCAP {
                loadout[] = {"PylonRack_Missile_BIM9X_x2","PylonRack_Missile_BIM9X_x2","PylonRack_Missile_BIM9X_x2","PylonRack_Missile_BIM9X_x2","PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1"};
            };
            class O_Plane_Fighter_02_F : baseCAP {
                loadout[] = {"PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R77_x1","PylonMissile_Missile_AA_R77_x1","PylonMissile_Missile_AA_R77_INT_x1","PylonMissile_Missile_AA_R77_INT_x1","PylonMissile_Missile_AA_R77_INT_x1"};
            };
            class O_T_Plane_Fighter_02_ghex_F : O_Plane_Fighter_02_F{};
            class O_R_Plane_Fighter_02_F : O_Plane_Fighter_02_F{};

            class I_Plane_Fighter_04_F : baseCAP {
                loadout[] = {"PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_BIM9X_x1","PylonRack_Missile_AMRAAM_C_x1","PylonRack_Missile_AMRAAM_C_x1","PylonRack_Missile_BIM9X_x2","PylonRack_Missile_BIM9X_x2"};
            };
            class I_E_Plane_Fighter_04_F : I_Plane_Fighter_04_F {};

            class I_Plane_Fighter_03_dynamicLoadout_F : baseCAP {
                loadout[] = {"PylonRack_1Rnd_AAA_missiles","PylonRack_1Rnd_Missile_AA_04_F","PylonRack_1Rnd_GAA_missiles","PylonWeapon_300Rnd_20mm_shells","PylonRack_1Rnd_GAA_missiles","PylonRack_1Rnd_Missile_AA_04_F","PylonRack_1Rnd_AAA_missiles"};
            };
            class a3a_Plane_Fighter_03_grey_F : I_Plane_Fighter_03_dynamicLoadout_F{};

            class B_Plane_Fighter_05_F : baseCAP {
                loadout[] = {"PylonRack_Missile_BIM9X_x1","PylonRack_Missile_BIM9X_x1","PylonRack_Missile_BIM9X_x2","PylonRack_Missile_BIM9X_x2","PylonRack_Missile_AMRAAM_D_x2","PylonRack_Missile_AMRAAM_D_x2","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonWeapon_220Rnd_25mm_shells"};
            };
            class B_A_Plane_Fighter_05_F : B_Plane_Fighter_05_F{};

        };
    };
};
