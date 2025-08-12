#include "..\..\..\script_component.hpp"

class CfgPatches {
    class PATCHNAME(AirLoadout_VN) {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"vn_weapons"};
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
            class vn_b_air_f4c_at : baseCAS {
                loadout[] = {"vn_missile_f4_out_agm45_mag_x1","vn_missile_f4_out_agm45_mag_x1","vn_rocket_ffar_f4_lau3_m229_he_x57","vn_rocket_ffar_f4_lau3_m229_he_x57","vn_bomb_f4_out_750_blu1b_fb_mag_x3","vn_missile_f4_lau7_aim9e_mag_x2","vn_missile_f4_lau7_aim9e_mag_x2","vn_missile_aim7e2_mag_x1","vn_missile_aim7e2_mag_x1","vn_missile_aim7e2_mag_x1","vn_missile_aim7e2_mag_x1"};
                rocketLauncher[] = {"vn_rocket_ffar_275in_launcher_m229"};
                missileLauncher[] = {"vn_missile_agm45_launcher"};
            };
            
            class vn_b_air_f100d_at : baseCAS {
                loadout[] = {"vn_rocket_ffar_f4_lau59_m229_he_x21","vn_rocket_ffar_f4_lau59_m229_he_x21","vn_fuel_f100_335_camo_01_mag","vn_fuel_f100_335_camo_01_mag","vn_missile_agm45_03_mag_x1","vn_missile_agm45_03_mag_x1"};
                mainGun[] = {"vn_m39a1_v_quad"};
                rocketLauncher[] = {"vn_rocket_ffar_275in_launcher_m229"};
                missileLauncher[] = {"vn_missile_agm45_launcher"};
            };
            
            class vn_o_air_mig19_at : baseCAS {
                loadout[] = {"vn_rocket_s5_heat_x16","vn_rocket_s5_heat_x16","vn_missile_kh66_mag_01_x1","vn_missile_kh66_mag_01_x1"};
                mainGun[] = {"vn_nr30_v_01"};
                rocketLauncher[] = {"vn_rocket_s5_heat_launcher"};
                missileLauncher[] = {"vn_missile_kh66_launcher"};
            };
            
            class vn_o_air_mig21_cas : baseCAS {
                loadout[] = {"vn_missile_mig21_kh66_mag_x1","vn_missile_mig21_kh66_mag_x1","vn_gunpod_gsh23l_v_200_mag"};
                mainGun[] = {"vn_gunpod_gsh23l"};
                missileLauncher[] = {"vn_missile_kh66_launcher"};
            };
        };
        class CAPPlane
        {
            class baseCAP;
            class vn_b_air_f4c_cap : baseCAP {
                loadout[] = {"vn_fuel_f4_370_mag","vn_fuel_f4_370_mag","","","vn_fuel_f4_600_mag","vn_missile_f4_lau7_aim9e_mag_x2","vn_missile_f4_lau7_aim9e_mag_x2","vn_missile_aim7e2_mag_x1","vn_missile_aim7e2_mag_x1","vn_missile_aim7e2_mag_x1","vn_missile_aim7e2_mag_x1"};
            };
            class vn_b_air_f100d_cap : baseCAP {
                loadout[] = {"vn_rocket_ffar_f4_lau59_m229_he_x21","vn_rocket_ffar_f4_lau59_m229_he_x21","vn_fuel_f100_335_mag","vn_fuel_f100_335_mag","vn_missile_aim9e_mag_x1","vn_missile_aim9e_mag_x1"};
            };
            class vn_o_air_mig19_cap : baseCAP {
                loadout[] = {"vn_missile_mig19_01_aa2_mag_x1","vn_missile_mig19_01_aa2_mag_x1","vn_missile_mig19_01_aa2_mag_x1","vn_missile_mig19_01_aa2_mag_x1"};
            };
            class vn_o_air_mig21_cap : baseCAP {
                loadout[] = {"vn_missile_mig21_aa2_mag_x1","vn_missile_mig21_aa2_mag_x1","vn_gunpod_gsh23l_v_200_mag"};
            };
        };
        class Helicopter
        {

        };
    };
};
