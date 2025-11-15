#include "..\..\..\script_component.hpp"

class CfgPatches {
    class PATCHNAME(AirLoadout_CWRBAF) {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"cwr3_core"};
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
            class cwr3_b_frs1 : baseCAS {
                loadout[] = {"CUP_PylonPod_19Rnd_CRV7_HE_plane_M","CUP_PylonPod_19Rnd_CRV7_HE_plane_M","PylonRack_3Rnd_Missile_AGM_02_F","PylonRack_3Rnd_Missile_AGM_02_F","CUP_PylonPod_19Rnd_CRV7_HE_plane_M","CUP_PylonPod_19Rnd_CRV7_HE_plane_M"};
                mainGun[] = {"CUP_Vacannon_GAU12_veh"};
                rocketLauncher[] = {"CUP_Vmlauncher_CRV7_veh"};
                missileLauncher[] = {"Missile_AGM_02_Plane_CAS_01_F"};
            };

            class cwr3_b_uk_f4m : baseCAS {
                loadout[] = {"CUP_PylonPod_19Rnd_CRV7_FAT_plane_M","PylonRack_Missile_AGM_02_x2","CUP_PylonPod_3Rnd_AGM65_Maverick_M","","CUP_PylonPod_3Rnd_AGM65_Maverick_M","PylonRack_Missile_AGM_02_x2","CUP_PylonPod_19Rnd_CRV7_FAT_plane_M"};
                mainGun[] = {"cwr3_vacannon_m61a1"};
                rocketLauncher[] = {"CUP_Vmlauncher_CRV7_veh"};
                missileLauncher[] = {"weapon_AGM_65Launcher","CUP_Vmlauncher_AGM65pod_veh"};
            };
        };
        class CAPPlane
        {
            class baseCAP;
            class cwr3_b_frs1 : baseCAP {
                loadout[] = {"CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_2Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_2Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M"};
            };
            class cwr3_b_uk_f4m : baseCAP {
                loadout[] = {"CUP_PylonPod_2Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_2Rnd_AIM_9L_LAU_Sidewinder_M"};
            };
        };
        class Helicopter
        {
             class baseHelicopter;
             class cwr3_b_uk_lynx_ah7_cas : baseHelicopter {
                loadout[] = {"CUP_PylonPod_1200Rnd_TE1_Red_Tracer_M621_20mm_HE_M","CUP_PylonPod_19Rnd_CRV7_HE_M"};
            };

            class cwr3_b_uk_lynx_ah7_tow : baseHelicopter {
                loadout[] = {"CUP_PylonPod_19Rnd_CRV7_KEP_M","CUP_PylonPod_2Rnd_AGM114K_Hellfire_II_M"};
            };
        };
    };
};
