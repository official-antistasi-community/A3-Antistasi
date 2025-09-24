#include "..\..\..\script_component.hpp"

class CfgPatches {
    class PATCHNAME(AirLoadout_UNS) {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"uns_weap_w"};
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
            class uns_A1J_CAS : baseCAS {
                loadout[] = {"uns_pylonRack_1Rnd_Rocket_HVAR_AT","uns_pylonRack_1Rnd_Rocket_HVAR_AT","uns_pylonRack_1Rnd_Rocket_HVAR_AT","uns_pylonRack_1Rnd_Rocket_HVAR_AT","uns_pylonRack_1Rnd_Rocket_HVAR_AT","uns_pylonRack_1Rnd_Rocket_HVAR_AT","uns_pylonRack_1Rnd_Rocket_HVAR_AT","uns_pylonRack_1Rnd_Rocket_HVAR_AT","uns_pylonRack_19Rnd_Rocket_FFAR_HEAT","uns_pylonRack_19Rnd_Rocket_FFAR_HEAT","uns_pylonRack_19Rnd_Rocket_FFAR_HEAT","uns_pylonRack_19Rnd_Rocket_FFAR_HEAT","uns_pylonRack_19Rnd_Rocket_FFAR_HEAT","uns_pylonRack_19Rnd_Rocket_FFAR_HEAT","uns_pylonRack_1Rnd_fuel_A1"};
                mainGun[] = {"uns_Uns_M2_4x20mm"};
                rocketLauncher[] = {"Uns_FFAR_HEAT_Launcher_dl", "Uns_HVARLauncher_dl"};
            };
            
            class uns_A7_CAS : baseCAS {
                loadout[] = {"uns_pylonRack_19Rnd_Rocket_FFAR_WP","uns_pylonRack_19Rnd_Rocket_FFAR_WP","uns_pylonRack_1Rnd_AGM12","uns_pylonRack_1Rnd_AGM12","uns_pylonRack_19Rnd_Rocket_FFAR_HEAT","uns_pylonRack_19Rnd_Rocket_FFAR_HEAT","uns_pylonRack_1Rnd_AIM9E","uns_pylonRack_1Rnd_AIM9E"};
                mainGun[] = {"uns_M61A1"};
                rocketLauncher[] = {"Uns_FFAR_WP_Launcher_dl", "Uns_FFAR_HEAT_Launcher_dl"};
                missileLauncher[] = {"uns_AGM12_Launcher_dl"};
            };
            
            class uns_A6_Intruder_CAS : baseCAS {
                loadout[] = {"uns_pylonRack_12Rnd_Rocket_Zuni_AT","uns_pylonRack_12Rnd_Rocket_Zuni_AT","uns_pylonRack_1Rnd_AGM12","uns_pylonRack_1Rnd_AGM12","uns_pylonRack_1Rnd_AGM12"};
                rocketLauncher[] = {"Uns_ZuniLauncher_dl", "Uns_HVARLauncher_dl"};
                missileLauncher[] = {"uns_AGM12_Launcher_dl"};
            };
            
            class uns_F4J_CAS : baseCAS {
                loadout[] = {"uns_pylonRack_1Rnd_AGM12","uns_pylonRack_1Rnd_AGM12","uns_pylonRack_f4_38Rnd_Rocket_FFAR_HEAT","uns_pylonRack_f4_38Rnd_Rocket_FFAR_HEAT","uns_pylonRack_1Rnd_AIM9E","uns_pylonRack_1Rnd_AIM9E","uns_pylonRack_1Rnd_AIM9E","uns_pylonRack_1Rnd_AIM9E","uns_pylonRack_1Rnd_AIM7","uns_pylonRack_1Rnd_AIM7","uns_pylonRack_1Rnd_AIM7","uns_pylonRack_1Rnd_AIM7","uns_pylonRack_1Rnd_AGM12"};
                rocketLauncher[] = {"Uns_FFAR_HEAT_Launcher_dl"};
                missileLauncher[] = {"uns_AGM12_Launcher_dl"};
            };
            
            class uns_Mig21_CAS : baseCAS {
                loadout[] = {"","","uns_pylonRack_32Rnd_Rocket_57_HE","uns_pylonRack_32Rnd_Rocket_57_HE","uns_pylonRack_1Rnd_Bomb_kab500","uns_pylonRack_1Rnd_Bomb_kab500","uns_pylonRack_96Rnd_Rocket_57_HE"};
                mainGun[] = {"uns_NR30"};
                rocketLauncher[] = {"uns_57mmLauncher_dl"};
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
