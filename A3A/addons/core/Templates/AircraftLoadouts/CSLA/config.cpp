#include "..\..\..\script_component.hpp"

class CfgPatches {
    class PATCHNAME(AirLoadout_CSLA) {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"CSLA_UI", "CUP_AirVehicles_Core"};
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
            class CUP_B_A10_DYN_USA : baseCAS {
                loadout[] = {"CUP_PylonPod_2Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_19Rnd_Rocket_FFAR_plane_M","CUP_PylonPod_3Rnd_AGM65_Maverick_M","CUP_PylonPod_19Rnd_Rocket_FFAR_plane_M","CUP_PylonPod_1Rnd_Mk82_M","CUP_PylonPod_ANAAQ_28","CUP_PylonPod_1Rnd_Mk82_M","CUP_PylonPod_19Rnd_Rocket_FFAR_plane_M","CUP_PylonPod_3Rnd_AGM65_Maverick_M","CUP_PylonPod_19Rnd_Rocket_FFAR_plane_M","CUP_PylonPod_ALQ_131"};
                mainGun[] = {"CUP_Vacannon_GAU8_veh"};
                rocketLauncher[] = {"CUP_Vmlauncher_FFAR_veh"};
                missileLauncher[] = {"CUP_Vmlauncher_AGM65pod_veh"};
            };
            
            class CUP_B_L39_CZ_GREY : baseCAS {
                loadout[] = {"CUP_PylonPod_20Rnd_S8_plane_M","PylonRack_1Rnd_Missile_AGM_01_F","PylonRack_1Rnd_Missile_AGM_01_F","CUP_PylonPod_20Rnd_S8_plane_M"};
                mainGun[] = {"CUP_Vacannon_GSh23L_L39"};
                rocketLauncher[] = {"CUP_Vmlauncher_S8_veh"};
                missileLauncher[] = {"Missile_AGM_01_Plane_CAS_02_F"};
            };
            class CUP_B_L39_CZ : CUP_B_L39_CZ_GREY {};
            class CUP_O_L39_TK : CUP_B_L39_CZ_GREY {};
            class CUP_O_Su25_Dyn_RU : baseCAS {
                loadout[] = {"","CUP_PylonPod_32Rnd_S5_plane_M","CUP_PylonPod_32Rnd_S5_plane_M","CUP_PylonPod_1Rnd_Kh29_M","CUP_PylonPod_1Rnd_Kh29_M","CUP_PylonPod_1Rnd_Kh29_M","CUP_PylonPod_1Rnd_Kh29_M","CUP_PylonPod_32Rnd_S5_plane_M","CUP_PylonPod_32Rnd_S5_plane_M",""};
                mainGun[] = {"CUP_Vacannon_GSh302K_veh"};
                rocketLauncher[] = {"CUP_Vmlauncher_S5_veh"};
                missileLauncher[] = {"CUP_Vmlauncher_Kh29L_veh"};
            };
        };
        class CAPPlane
        {
            class baseCAP;
            class CUP_B_AV8B_DYN_USMC : baseCAP {
                loadout[] = {"CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_2Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_2Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M"};
            };
            class a3a_Plane_Fighter_03_grey_F : baseCAP {
                loadout[] = {"PylonRack_1Rnd_Missile_AA_04_F","PylonRack_1Rnd_GAA_missiles","PylonRack_1Rnd_GAA_missiles","PylonWeapon_300Rnd_20mm_shells","PylonRack_1Rnd_GAA_missiles","PylonRack_1Rnd_GAA_missiles","PylonRack_1Rnd_Missile_AA_04_F"};
            };
            class CUP_B_L39_CZ_GREY : baseCAP {
                loadout[] = {"PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R77_x1","PylonMissile_Missile_AA_R77_x1","PylonMissile_Missile_AA_R73_x1"};
            };
            class CUP_B_L39_CZ : CUP_B_L39_CZ_GREY {};
            class CUP_O_L39_TK : CUP_B_L39_CZ_GREY {};
        };
        class Helicopter
        {

        };
    };
};
