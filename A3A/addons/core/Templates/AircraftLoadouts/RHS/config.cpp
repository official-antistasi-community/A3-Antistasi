#include "..\..\..\script_component.hpp"

class CfgPatches {
    class PATCHNAME(AirLoadout_RHS) {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"rhsgref_main_loadorder"};
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
            class RHS_A10 : baseCAS {
                loadout[] = {"rhs_mag_ANALQ131","rhs_mag_M151_7_USAF_LAU131","rhs_mag_agm65d_3","rhs_mag_M151_21_USAF_LAU131_3","rhs_mag_M151_7_USAF_LAU131","","rhs_mag_M151_7_USAF_LAU131","rhs_mag_M151_21_USAF_LAU131_3","rhs_mag_agm65d_3","rhs_mag_M151_7_USAF_LAU131","","rhsusf_ANALE40_CMFlare_Chaff_Magazine_x16"};
                mainGun[] = {"RHS_weap_gau8"};
                rocketLauncher[] = {"rhs_weap_FFARLauncher"};
                missileLauncher[] = {"rhs_weap_agm65d"};
            };
            class rhs_l159_cdf_b_CDF : baseCAS {
                loadout[] = {"rhs_mag_M151_7_USAF_LAU131","rhs_mag_agm65d","rhs_mag_agm65d","rhs_mag_zpl20_apit","rhs_mag_agm65d","rhs_mag_agm65d","rhs_mag_M151_7_USAF_LAU131","rhsusf_ANALE40_CMFlare_Chaff_Magazine_x2"};
                mainGun[] = {"RHS_weap_zpl20"};
                rocketLauncher[] = {"rhs_weap_FFARLauncher"};
                missileLauncher[] = {"rhs_weap_agm65d"};
            };
            class RHS_Su25SM_vvsc : baseCAS {
                loadout[] = {"rhs_mag_kh29D","rhs_mag_kh29D","rhs_mag_kh25MTP","rhs_mag_kh25MTP","rhs_mag_kh25MTP","rhs_mag_kh25MTP","rhs_mag_b8m1_s8kom","rhs_mag_b8m1_s8kom","rhs_mag_R60M","rhs_mag_R60M","rhs_ASO2_CMFlare_Chaff_Magazine_x4"};
                mainGun[] = {"rhs_weap_gsh302"};
                rocketLauncher[] = {"rhs_weap_s8"};
                missileLauncher[] = {"rhs_weap_kh29d_Launcher", "rhs_weap_kh25mtp_Launcher"};
            };
            class RHS_Su25SM_CAS_vvs : RHS_Su25SM_vvsc {};
            class rhsgref_cdf_b_su25 : RHS_Su25SM_vvsc {};
			
            class RHS_T50_vvs_generic_ext : baseCAS {
                loadout[] = {"rhs_mag_Kh38mte_int","rhs_mag_Kh38mte_int","rhs_mag_Kh38mte_int","rhs_mag_Kh38mte_int","","","rhs_mag_kab250","rhs_mag_kab250","rhs_mag_Kh38mte","rhs_mag_Kh38mte","rhs_mag_kab250","rhs_mag_kab250"};
				mainGun[] = {"rhs_weap_gsh301"};
                missileLauncher[] = {"rhs_weap_kh38mae_Launcher"};
			};
			
            class rhssaf_airforce_l_18 : baseCAS {
                loadout[] = {"rhs_mag_b8m1_bd3_umk2a_s8kom","rhs_mag_b8m1_bd3_umk2a_s8kom","rhs_mag_kh25MTP_apu68_mig29","rhs_mag_kh25MTP_apu68_mig29","rhs_mag_R73M_APU73","rhs_mag_R73M_APU73","","rhs_BVP3026_CMFlare_Chaff_Magazine_x2"};
                mainGun[] = {"rhs_weap_gsh301"};
                rocketLauncher[] = {"rhs_weap_s8", "rhs_weap_s8df"};
                missileLauncher[] = {"rhs_weap_kh25mtp_Launcher"};
            };
            class RHSGREF_A29B_HIDF : baseCAS {
                loadout[] = {"rhs_mag_AGM114L_2","rhs_mag_M151_19","rhs_mag_gbu12","rhs_mag_M151_19","rhs_mag_AGM114L_2","rhsusf_ANALE40_CMFlare_Chaff_Magazine_x2"};
                mainGun[] = {"rhs_weap_M3W_A29"};
                rocketLauncher[] = {"rhs_weap_FFARLauncher"};
                missileLauncher[] = {"rhs_weap_AGM114L_Launcher", "rhs_weap_gbu12"};
                gunnerLaser = "rhs_weap_laserDesignator_AI";
            };
        };
        class CAPPlane
        {
            class baseCAP;
            class rhsusf_f22 : baseCAP {
                loadout[] = {"rhs_mag_Sidewinder_int","rhs_mag_aim120d_int","rhs_mag_aim120d_2_F22_l","rhs_mag_aim120d_2_F22_r","rhs_mag_aim120d_int","rhs_mag_Sidewinder_int","rhsusf_ANALE52_CMFlare_Chaff_Magazine_x4"};
            };
            class rhs_l159_cdf_b_CDF_CAP : baseCAP {
                loadout[] = {"rhs_mag_aim9m","rhs_mag_aim120","rhs_mag_aim120","rhs_mag_zpl20_mixed","rhs_mag_aim120","rhs_mag_aim120","rhs_mag_aim9m","rhsusf_ANALE40_CMFlare_Chaff_Magazine_x2"};
            };
            class rhs_mig29sm_vvs : baseCAP {
                loadout[] = {"rhs_mag_R73M_APU73","rhs_mag_R73M_APU73","rhs_mag_R73M_APU73","rhs_mag_R73M_APU73","rhs_mag_R77_AKU170_MIG29","rhs_mag_R77_AKU170_MIG29","","rhs_BVP3026_CMFlare_Chaff_Magazine_x2"};
            };
            class rhs_mig29s_vvs : rhs_mig29sm_vvs {};
            class rhsgref_cdf_b_mig29s : rhs_mig29sm_vvs {};
			
            class RHS_T50_vvs_generic_ext : baseCAP {
                loadout[] = {"rhs_mag_R77M","rhs_mag_R77M","rhs_mag_R77M","rhs_mag_R77M","rhs_mag_R74M2_int","rhs_mag_R74M2_int","rhs_mag_R77M_AKU170","rhs_mag_R77M_AKU170","rhs_mag_R77M_AKU170","rhs_mag_R77M_AKU170","rhs_mag_R77M_AKU170","rhs_mag_R77M_AKU170"};
            };
            class RHS_T50_vvs_blueonblue : baseCAP {
                loadout[] = {"rhs_mag_R77M","rhs_mag_R77M","rhs_mag_R77M","rhs_mag_R77M","rhs_mag_R74M2_int","rhs_mag_R74M2_int"};
			};
            class RHS_T50_vvs_054 : RHS_T50_vvs_blueonblue {};
			
            class rhssaf_airforce_o_l_18_101 : baseCAP {
                loadout[] = {"rhs_mag_R27ER_APU470","rhs_mag_R27ER_APU470","rhs_mag_R73M_APU73","rhs_mag_R73M_APU73","rhs_mag_R73M_APU73","rhs_mag_R73M_APU73","rhs_BVP3026_CMFlare_Chaff_Magazine_x2"};
            };
        };
        class Helicopter
        {

        };
    };
};
