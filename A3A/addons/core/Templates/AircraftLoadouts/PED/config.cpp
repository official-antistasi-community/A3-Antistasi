#include "..\..\..\script_component.hpp"

class CfgPatches {
    class PATCHNAME(AirLoadout_CUP) {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs", "CUP_AirVehicles_Core"};
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
            class ASZ_AV8B : baseCAS {
                loadout[] = {"PylonMissile_1Rnd_Missile_AA_04_F","CUP_PylonPod_19Rnd_CRV7_HE_plane_M","PylonRack_3Rnd_Missile_AGM_02_F","PylonRack_3Rnd_Missile_AGM_02_F","CUP_PylonPod_19Rnd_CRV7_HE_plane_M","PylonMissile_1Rnd_Missile_AA_04_F"};
                mainGun[] = {"Cannon_30mm_Plane_CAS_02_F"};
                rocketLauncher[] = {"CUP_Vmlauncher_CRV7_veh"};
                missileLauncher[] = {"Missile_AGM_02_Plane_CAS_01_F"};
            };
        };
        class CAPPlane
        {
            class baseCAP;
            class ASZ_AV8B : baseCAP {
                loadout[] = {"PylonMissile_1Rnd_Missile_AA_04_F","PylonRack_1Rnd_GAA_missiles","CUP_PylonPod_2Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_2Rnd_AIM_120_AMRAAM_M","PylonRack_1Rnd_GAA_missiles","PylonMissile_1Rnd_Missile_AA_04_F"};
            };
            class ASZ_EFA : baseCAP {
                loadout[] = {"PylonRack_Missile_BIM9X_x2","PylonRack_Missile_AMRAAM_D_x2","PylonRack_1Rnd_AAA_missiles","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonRack_1Rnd_AAA_missiles","PylonRack_Missile_AMRAAM_D_x2","PylonRack_Missile_BIM9X_x2"};
            };
        };
        class Helicopter
        {

        };
    };
};
