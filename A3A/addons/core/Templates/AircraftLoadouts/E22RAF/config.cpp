#include "..\..\..\script_component.hpp"

class CfgPatches {
    class PATCHNAME(AirLoadout_E22RAF) {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"Data_F_RAF"};
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
            class O_Plane_CAS_02_dynamicLoadout_F;
            class E22_O_RAF_D_Plane_CAS_02_dynamicLoadout_F : O_Plane_CAS_02_dynamicLoadout_F {};
            class E22_O_RAF_A_Plane_CAS_02_dynamicLoadout_F : O_Plane_CAS_02_dynamicLoadout_F {};
            class E22_O_RAF_Plane_CAS_02_dynamicLoadout_F : O_Plane_CAS_02_dynamicLoadout_F {};
            class min_rf_su_34 : baseCAS {
                loadout[] = {"PylonMissile_Missile_AA_R73_x1", "PylonRack_20Rnd_Rocket_03_HE_F", "PylonRack_20Rnd_Rocket_03_HE_F", "PylonRack_3Rnd_LG_scalpel", "PylonRack_3Rnd_LG_scalpel", "PylonMissile_Bomb_KAB250_x1", "PylonMissile_Bomb_KAB250_x1", "PylonRack_3Rnd_LG_scalpel", "PylonRack_3Rnd_LG_scalpel", "PylonRack_20Rnd_Rocket_03_HE_F", "PylonRack_20Rnd_Rocket_03_HE_F", "PylonMissile_Missile_AA_R73_x1"};
                mainGun[] = {"weapon_Fighter_Gun_30mm"};
                rocketLauncher[] = {"Rocket_03_HE_Plane_CAS_02_F"};
                missileLauncher[] = {"missiles_SCALPEL"};
            };
        };
        class CAPPlane
        {
            class baseCAP;
            class O_Plane_Fighter_02_F;
            class E22_O_RAF_D_Plane_Fighter_02_F : O_Plane_Fighter_02_F {};
            class E22_O_RAF_A_Plane_Fighter_02_F : O_Plane_Fighter_02_F {};
            class E22_O_RAF_Plane_Fighter_02_F : O_Plane_Fighter_02_F {};
            class min_rf_su_34 : baseCAP {
                loadout[] = {"PylonMissile_Missile_AA_R73_x1", "PylonMissile_Missile_AA_R77_x1", "PylonMissile_Missile_AA_R77_x1", "PylonMissile_Missile_AA_R77_x1", "PylonMissile_Missile_AA_R73_x1", "PylonMissile_Missile_AA_R73_x1", "PylonMissile_Missile_AA_R73_x1", "PylonMissile_Missile_AA_R73_x1", "PylonMissile_Missile_AA_R77_x1", "PylonMissile_Missile_AA_R77_x1", "PylonMissile_Missile_AA_R77_x1", "PylonMissile_Missile_AA_R73_x1"};
            };
        };
        class Helicopter
        {
            class baseHelicopter;
        };
    };
};

