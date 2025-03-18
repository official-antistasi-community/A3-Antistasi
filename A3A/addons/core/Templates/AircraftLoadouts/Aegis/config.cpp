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

            class B_Plane_CAS_01_dynamicLoadout_F;

            class O_Plane_CAS_02_dynamicLoadout_F;
            class O_T_Plane_CAS_02_dynamicLoadout_ghex_F : O_Plane_CAS_02_dynamicLoadout_F{};
            class O_R_Plane_CAS_02_dynamicLoadout_F : O_Plane_CAS_02_dynamicLoadout_F{};

            class I_Plane_Fighter_03_dynamicLoadout_F;

            class I_E_Plane_Fighter_04_F : baseCAS {
                loadout[] = {"magazine_Fighter04_Gun20mm_AA_x120_red","PylonRack_7Rnd_Rocket_04_HE_F","PylonRack_7Rnd_Rocket_04_HE_F","PylonRack_Missile_AGM_02_x2","PylonRack_Missile_AGM_02_x2"};
                mainGun[] = {"weapon_Fighter_Gun20mm_AA"};
                rocketLauncher[] = {"Rocket_04_HE_Plane_CAS_01_F"};
                missileLauncher[] = {"weapon_AGM_65Launcher"};
            };
            class B_A_Plane_Fighter_05_F : baseCAS {
                loadout[] = {"PylonRack_Missile_AGM_02_x1","PylonRack_Missile_AGM_02_x1","PylonRack_Missile_AGM_02_x1","PylonRack_Missile_AGM_02_x1","PylonRack_Missile_AGM_02_x1","PylonRack_Missile_AGM_02_x1","PylonRack_7Rnd_Rocket_04_HE_F","PylonRack_7Rnd_Rocket_04_HE_F","PylonRack_Missile_AGM_02_x1","PylonRack_Missile_AGM_02_x1","PylonWeapon_220Rnd_25mm_shells"};
                mainGun[] = {"gatling_25mm"};
                rocketLauncher[] = {"Rocket_04_HE_Plane_CAS_01_F"};
                missileLauncher[] = {"weapon_AGM_65Launcher"};
            };

        };
        class CAPPlane
        {
            class baseCAP;

            class B_Plane_Fighter_01_F;

            class O_Plane_Fighter_02_F;
            class O_T_Plane_Fighter_02_ghex_F : O_Plane_Fighter_02_F{};
            class O_R_Plane_Fighter_02_F : O_Plane_Fighter_02_F{};

            class I_Plane_Fighter_04_F;
            class I_E_Plane_Fighter_04_F : I_Plane_Fighter_04_F {};

            class B_Plane_Fighter_05_F : baseCAP {
                loadout[] = {"PylonRack_Missile_BIM9X_x1","PylonRack_Missile_BIM9X_x1","PylonRack_Missile_BIM9X_x2","PylonRack_Missile_BIM9X_x2","PylonRack_Missile_AMRAAM_D_x2","PylonRack_Missile_AMRAAM_D_x2","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonWeapon_220Rnd_25mm_shells"};
            };
            class B_A_Plane_Fighter_05_F : B_Plane_Fighter_05_F{};

        };
    };
};
