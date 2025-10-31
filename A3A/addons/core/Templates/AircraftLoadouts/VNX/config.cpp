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
            class vnx_b_air_ov10a_usmc_mr : baseCAS {
                loadout[] = {"vnx_gunpod_m60_v_500_mag","vnx_gunpod_m60_v_500_mag","vnx_gunpod_m60_v_500_mag","vnx_gunpod_m60_v_500_mag","vnx_rocket_ffar_lau59_m229_he_x7_01","vnx_rocket_ffar_lau59_m229_he_x7_01","vnx_rocket_ffar_lau10_mk32_atap_x4","vnx_rocket_ffar_lau10_mk32_atap_x4","vnx_gunpod_mk4_02_v_750_mag","vnx_rocket_ffar_ov10_lau10_mk63_he_01_x2","vnx_rocket_ffar_ov10_lau10_mk63_he_01_x2"};
                mainGun[] = {"vnx_gunpod_mk4_twin"};
                rocketLauncher[] = {"vnx_rocket_ffar_275in_launcher_m229","vnx_rocket_ffar_5in_atap_launcher","vnx_rocket_ffar_5in_hefrag_launcher"};
            };
        };
    };
};
