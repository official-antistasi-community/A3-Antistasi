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
            class CUP_B_L39_CZ : baseCAS {
                loadout[] = {"CUP_PylonPod_20Rnd_S8_plane_M","PylonRack_1Rnd_Missile_AGM_01_F","PylonRack_1Rnd_Missile_AGM_01_F","CUP_PylonPod_20Rnd_S8_plane_M"};
                mainGun[] = {"CUP_Vacannon_GSh23L_L39"};
                rocketLauncher[] = {"CUP_Vmlauncher_S8_veh"};
                missileLauncher[] = {"Missile_AGM_01_Plane_CAS_02_F"};
            };
            
            class CUP_B_Su25_Dyn_CDF : baseCAS {
                loadout[] = {"CUP_PylonPod_1Rnd_R73_Vympel","PylonRack_20Rnd_Rocket_03_HE_F","PylonRack_20Rnd_Rocket_03_AP_F","CUP_PylonPod_1Rnd_Kh29_M","CUP_PylonPod_1Rnd_Kh29_M","CUP_PylonPod_1Rnd_Kh29_M","CUP_PylonPod_1Rnd_Kh29_M","PylonRack_20Rnd_Rocket_03_AP_F","PylonRack_20Rnd_Rocket_03_HE_F","CUP_PylonPod_1Rnd_R73_Vympel"};
                mainGun[] = {"CUP_Vacannon_GSh302K_veh"};
                rocketLauncher[] = {"Rocket_03_HE_Plane_CAS_02_F", "Rocket_03_AP_Plane_CAS_02_F"};
                missileLauncher[] = {"CUP_Vmlauncher_Kh29L_veh"};
            };
            class CUP_O_Su25_Dyn_RU : CUP_B_Su25_Dyn_CDF {};
            class CUP_O_Su25_Dyn_SLA : CUP_B_Su25_Dyn_CDF {};
            class CUP_O_Su25_Dyn_TKA : CUP_B_Su25_Dyn_CDF {};
            
            class CUP_B_A10_DYN_USA : baseCAS {
                loadout[] = {"CUP_PylonPod_19Rnd_CRV7_HE_plane_M","CUP_PylonPod_19Rnd_Rocket_FFAR_plane_M","CUP_PylonPod_1Rnd_AGM65_Maverick_M","CUP_PylonPod_1Rnd_AGM65_Maverick_M","CUP_PylonPod_1Rnd_AGM65_Maverick_M","CUP_PylonPod_ALQ_131","CUP_PylonPod_1Rnd_AGM65_Maverick_M","CUP_PylonPod_1Rnd_AGM65_Maverick_M","CUP_PylonPod_1Rnd_AGM65_Maverick_M","CUP_PylonPod_19Rnd_Rocket_FFAR_plane_M","CUP_PylonPod_19Rnd_CRV7_HE_plane_M"};
                mainGun[] = {"CUP_Vacannon_GAU8_veh"};
                rocketLauncher[] = {"CUP_Vmlauncher_FFAR_veh", "CUP_Vmlauncher_CRV7_veh"};
                missileLauncher[] = {"CUP_Vmlauncher_AGM65pod_veh"};
            };
            
            class CUP_B_GR9_DYN_GB : baseCAS {
                loadout[] = {"CUP_PylonPod_19Rnd_CRV7_FAT_plane_M","CUP_PylonPod_1Rnd_AGM65_Maverick_M","CUP_PylonPod_19Rnd_CRV7_HE_plane_M","CUP_PylonPod_1Rnd_AGM65_Maverick_M","PylonWeapon_300Rnd_20mm_shells","CUP_PylonPod_1Rnd_AGM65_Maverick_M","CUP_PylonPod_19Rnd_CRV7_HE_plane_M","CUP_PylonPod_1Rnd_AGM65_Maverick_M","CUP_PylonPod_19Rnd_CRV7_FAT_plane_M"};
                mainGun[] = {"Twin_Cannon_20mm"};
                rocketLauncher[] = {"CUP_Vmlauncher_CRV7_veh"};
                missileLauncher[] = {"CUP_Vmlauncher_AGM65pod_veh"};
            };
            
            class CUP_B_AV8B_DYN_USMC : baseCAS {
                loadout[] = {"CUP_PylonPod_19Rnd_CRV7_FAT_plane_M","CUP_PylonPod_1Rnd_AGM65_Maverick_M","CUP_PylonPod_1Rnd_AGM65_Maverick_M","CUP_PylonPod_1Rnd_AGM65_Maverick_M","CUP_PylonPod_1Rnd_AGM65_Maverick_M","CUP_PylonPod_19Rnd_CRV7_FAT_plane_M"};
                mainGun[] = {"CUP_Vacannon_GAU12_veh"};
                rocketLauncher[] = {"CUP_Vmlauncher_CRV7_veh"};
                missileLauncher[] = {"CUP_Vmlauncher_AGM65pod_veh"};
            };
        };
        class CAPPlane
        {
            class baseCAP;
            class CUP_B_L39_CZ : baseCAP {
                loadout[] = {"PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R73_x1"};
            };
            class CUP_O_L39_TK : CUP_B_L39_CZ{};
            
            class CUP_B_GR9_DYN_GB : baseCAP {
                loadout[] = {"CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_ALQ_131","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M"};
            };
            class CUP_B_SU34_CDF : baseCAP {
                loadout[] = {"CUP_PylonPod_1Rnd_R73_Vympel","CUP_PylonPod_1Rnd_R73_Vympel","CUP_PylonPod_1Rnd_R73_Vympel","CUP_PylonPod_1Rnd_R73_Vympel","CUP_PylonPod_1Rnd_R73_Vympel","CUP_PylonPod_1Rnd_R73_Vympel","CUP_PylonPod_1Rnd_R73_Vympel","CUP_PylonPod_1Rnd_R73_Vympel","CUP_PylonPod_1Rnd_R73_Vympel","CUP_PylonPod_1Rnd_R73_Vympel","CUP_PylonPod_1Rnd_R73_Vympel","CUP_PylonPod_1Rnd_R73_Vympel"};
            };
            class CUP_O_SU34_RU : CUP_B_SU34_CDF {};
            class CUP_O_SU34_SLA : CUP_B_SU34_CDF {};
            
            class CUP_B_F35B_USMC : baseCAP {
                loadout[] = {"CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_INT_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_INT_M","CUP_PylonWeapon_220Rnd_TE1_Red_Tracer_GAU22_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_INT_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_INT_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M"};
            };
            class CUP_B_AV8B_DYN_USMC : baseCAP {
                loadout[] = {"CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M"};
            };
            class CUP_I_JAS39_RACS : baseCAP {
                loadout[] = {"CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_2Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_2Rnd_AIM_120_AMRAAM_M"};
            };
        };
        class Helicopter
        {

        };
    };
};
