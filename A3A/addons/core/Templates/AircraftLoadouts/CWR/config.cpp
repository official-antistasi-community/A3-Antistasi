#include "..\..\..\script_component.hpp"

class CfgPatches {
    class PATCHNAME(AirLoadout_CWR) {
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
            class cwr3_o_su17m4 : baseCAS {
                loadout[] = {"CUP_PylonPod_16Rnd_S5_plane_M","CUP_PylonPod_16Rnd_S5_plane_M","CUP_PylonPod_1Rnd_FAB250_plane_M","CUP_PylonPod_1Rnd_FAB250_plane_M","PylonMissile_Missile_AGM_KH25_x1","PylonMissile_Missile_AGM_KH25_x1","CUP_PylonPod_250Rnd_TE2_Green_Tracer_GSh23_23mm_APHE_M"};
                mainGun[] = {"cwr3_vacannon_nr30_veh"};
                rocketLauncher[] = {"CUP_Vmlauncher_S5_veh"};
                missileLauncher[] = {"weapon_AGM_KH25Launcher"};
            };

            class cwr3_o_mig27 : baseCAS {
                loadout[] = {"CUP_PylonPod_1Rnd_Kh29_M","CUP_PylonPod_1Rnd_Kh29_M","CUP_PylonPod_32Rnd_S5_plane_M","CUP_PylonPod_32Rnd_S5_plane_M","CUP_PylonPod_1Rnd_Kh29_M"};
                mainGun[] = {"cwr3_vacannon_gsh306"};
                rocketLauncher[] = {"CUP_Vmlauncher_S5_veh"};
                missileLauncher[] = {"CUP_Vmlauncher_Kh29L_veh"};
            };

             class cwr3_b_a10 : baseCAS {
                loadout[] = {"CUP_PylonPod_1Rnd_AGM65_Maverick_M","CUP_PylonPod_1Rnd_AGM65_Maverick_M","CUP_PylonPod_3Rnd_AGM65_Maverick_M","CUP_PylonPod_19Rnd_Rocket_FFAR_plane_M","CUP_PylonPod_19Rnd_Rocket_FFAR_plane_M","CUP_PylonPod_19Rnd_Rocket_FFAR_plane_M","CUP_PylonPod_19Rnd_Rocket_FFAR_plane_M","CUP_PylonPod_19Rnd_Rocket_FFAR_plane_M","CUP_PylonPod_3Rnd_AGM65_Maverick_M","CUP_PylonPod_1Rnd_AGM65_Maverick_M","CUP_PylonPod_1Rnd_AGM65_Maverick_M"};
                mainGun[] = {"CUP_Vacannon_GAU8_veh"};
                rocketLauncher[] = {"CUP_Vmlauncher_FFAR_veh"};
                missileLauncher[] = {"CUP_Vmlauncher_AGM65pod_veh"};
            };

             class cwr3_b_f4e : baseCAS {
                loadout[] = {"CUP_PylonPod_19Rnd_Rocket_FFAR_plane_M","CUP_PylonPod_19Rnd_Rocket_FFAR_plane_M","CUP_PylonPod_3Rnd_AGM65_Maverick_M","CUP_PylonPod_19Rnd_Rocket_FFAR_plane_M","CUP_PylonPod_3Rnd_AGM65_Maverick_M","CUP_PylonPod_19Rnd_Rocket_FFAR_plane_M","CUP_PylonPod_19Rnd_Rocket_FFAR_plane_M"};
                mainGun[] = {"cwr3_vacannon_m61a1"};
                rocketLauncher[] = {"CUP_Vmlauncher_FFAR_veh"};
                missileLauncher[] = {"CUP_Vmlauncher_AGM65pod_veh"};
            };

            class cwr3_b_frs1 : baseCAS {
                loadout[] = {"CUP_PylonPod_19Rnd_CRV7_HE_plane_M","CUP_PylonPod_2Rnd_Mk82_M","PylonRack_3Rnd_Missile_AGM_02_F","PylonRack_3Rnd_Missile_AGM_02_F","CUP_PylonPod_2Rnd_Mk82_M","CUP_PylonPod_19Rnd_CRV7_HE_plane_M"};
                mainGun[] = {"CUP_Vacannon_GAU12_veh"};
                rocketLauncher[] = {"CUP_Vmlauncher_CRV7_veh"};
                missileLauncher[] = {"Missile_AGM_02_Plane_CAS_01_F"};
            };
        };
        class CAPPlane
        {
            class baseCAP;
            class cwr3_b_f16c : baseCAP {
                loadout[] = {"","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M",""};
            };

            class cwr3_b_f4e : baseCAP {
                loadout[] = {"","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M",""};
            };

            class cwr3_o_mig23 : baseCAP {
                loadout[] = {"PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R77_x1"};
            };

            class cwr3_b_frs1 : baseCAP {
                loadout[] = {"CUP_PylonPod_2Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_2Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_2Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_2Rnd_AIM_9L_LAU_Sidewinder_M"};
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

            class cwr3_b_ah64 : baseHelicopter {
                loadout[] = {"CUP_PylonPod_19Rnd_Rocket_FFAR_M","CUP_PylonPod_4Rnd_AGM114K_Hellfire_II_M","CUP_PylonPod_4Rnd_AGM114K_Hellfire_II_M","CUP_PylonPod_19Rnd_Rocket_FFAR_M","","CUP_PylonPod_1Rnd_AIM_9L_Sidewinder_M"};
            };

            class cwr3_b_kiowa_dyn : baseHelicopter {
                loadout[] = {"CUP_PylonPod_2Rnd_AGM114K_Hellfire_II_M","CUP_PylonPod_1200Rnd_TE1_Red_Tracer_GAU19L_M"};
            };

            class cwr3_b_uh1_gunship : baseHelicopter {
                loadout[] = {"CUP_PylonPod_CMFlare_Chaff","CUP_PylonPod_CMFlare_Chaff","CUP_PylonPod_19Rnd_Rocket_FFAR_M","CUP_PylonPod_19Rnd_Rocket_FFAR_M","CUP_PylonPod_1200Rnd_TE1_Red_Tracer_GAU19A_M","CUP_PylonPod_1200Rnd_TE1_Red_Tracer_GAU19A_M"};
            };

            class cwr3_b_uh60_x4_esss : baseHelicopter {
                loadout[] = {"CUP_PylonPod_19Rnd_Rocket_FFAR_M","CUP_PylonPod_1200Rnd_TE1_Red_Tracer_30x113mm_M789_HEDP_M","CUP_PylonPod_1200Rnd_TE1_Red_Tracer_30x113mm_M789_HEDP_M","CUP_PylonPod_19Rnd_Rocket_FFAR_M"};
            };

            class cwr3_o_mi24p : baseHelicopter {
                loadout[] = {"CUP_PylonPod_2Rnd_AT2_M","CUP_PylonPod_32Rnd_S5_M","CUP_PylonPod_32Rnd_S5_M","CUP_PylonPod_32Rnd_S5_M","CUP_PylonPod_32Rnd_S5_M","CUP_PylonPod_2Rnd_AT2_M"};
            };

            class cwr3_o_mi8_mtv3 : baseHelicopter {
                loadout[] = {"CUP_PylonPod_32Rnd_S5_M","CUP_PylonPod_250Rnd_TE2_Green_Tracer_GSh23_23mm_APHE_M","CUP_PylonPod_2Rnd_Igla_M","CUP_PylonPod_32Rnd_S5_M"};
            };

            class cwr3_o_mi24v : baseHelicopter {
                loadout[] = {"CUP_PylonPod_2Rnd_AT6_M","CUP_PylonPod_20Rnd_S8N_CCIP_M","CUP_PylonPod_250Rnd_TE2_Green_Tracer_GSh23_23mm_APHE_M","CUP_PylonPod_2Rnd_Igla_M","CUP_PylonPod_20Rnd_S8N_CCIP_M","CUP_PylonPod_2Rnd_AT6_M"};
            };
        };
    };
};
