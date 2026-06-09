#include "..\..\..\script_component.hpp"

class CfgPatches {
    class PATCHNAME(AirLoadout_VNX) {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"vnx_dong_giang"};
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
            class vnx_b_air_ov10a_mr : baseCAS {
                loadout[] = {"vnx_gunpod_m60_v_500_mag","vnx_gunpod_m60_v_500_mag","vnx_gunpod_m60_v_500_mag","vnx_gunpod_m60_v_500_mag","vnx_rocket_ffar_lau59_m229_he_x7_01","vnx_rocket_ffar_lau59_m229_he_x7_01","vnx_rocket_ffar_lau10_mk32_atap_x4","vnx_rocket_ffar_lau10_mk32_atap_x4","vnx_gunpod_mk4_02_v_750_mag","vnx_rocket_ffar_ov10_lau10_mk63_he_01_x2","vnx_rocket_ffar_ov10_lau10_mk63_he_01_x2"};
                mainGun[] = {"vnx_gunpod_mk4_twin"};
                rocketLauncher[] = {"vnx_rocket_ffar_275in_launcher_m229","vnx_rocket_ffar_5in_atap_launcher","vnx_rocket_ffar_5in_hefrag_launcher"};
            };
            class vnx_b_air_ov10a_usmc_mr : vnx_b_air_ov10a_mr {};
            class vnx_b_air_ov10a_aus_covey : vnx_b_air_ov10a_mr {};
            class vnx_b_air_a4e_usmc_cas : baseCAS {
                loadout[] = {"vnx_gunpod_mk12_100_mag","vnx_gunpod_mk12_100_mag","vnx_rocket_ffar_lau3_m151_he_x19_02","vnx_rocket_ffar_lau3_m151_he_x19_02","vnx_missile_agm12c_mag_01_x1","vnx_missile_agm12c_mag_01_x1","vnx_rocket_ffar_a4_lau3_m151_he_x57_02"};
                mainGun[] = {"vnx_gunpod_mk12"};
                rocketLauncher[] = {"vnx_rocket_ffar_275in_launcher_m151"};
                missileLauncher[] = {"vnx_missile_agm12c_launcher"};
            };
            class vnx_b_air_a4e_ran_cas : vnx_b_air_a4e_usmc_cas {};
            class vnx_b_air_a4e_rnzaf_cas : vnx_b_air_a4e_usmc_cas {};
        };
        class CAPPlane
        {
            class baseCAP;
            class vnx_b_air_a4e_ran_cap : baseCAP {
                loadout[] = {"vnx_gunpod_mk12_100_mag","vnx_gunpod_mk12_100_mag","vnx_missile_lau7_aim9b_03_mag_x1","vnx_missile_lau7_aim9b_03_mag_x1","vnx_missile_lau7_aim9b_03_mag_x1","vnx_missile_lau7_aim9b_03_mag_x1","vnx_fuel_a4_300_02_mag"};
            };
            class vnx_b_air_a4e_rnzaf_cap : vnx_b_air_a4e_ran_cap {};
        };
    };
};
