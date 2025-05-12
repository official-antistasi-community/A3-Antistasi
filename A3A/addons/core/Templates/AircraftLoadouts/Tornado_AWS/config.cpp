#include "..\..\..\script_component.hpp"

class CfgPatches {
    class PATCHNAME(AirLoadout_Tornado_AWS) {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"Tornado_AWS"};
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
            class Tornado_AWS_camo_ger : baseCAS {
                loadout[] = {"Tornado_AWS_ECMpod_1rnd_M","FIR_IRIS_T_P_1rnd_M","Tornado_AWS_fuelsmall_1rnd_M","FIR_Litening_std_P_1rnd_M","FIR_Brimstone_DM_type1_P_3rnd_M","FIR_Brimstone_DM_type1_P_3rnd_M","FIR_GBU12_P_1rnd_M","FIR_Brimstone_DM_type2_P_3rnd_M","FIR_Brimstone_DM_type2_P_3rnd_M","Tornado_AWS_fuelsmall_1rnd_M","FIR_IRIS_T_P_1rnd_M","Tornado_AWS_AIRCMpod_1rnd_M","FIR_BK27_R_M","FIR_BK27_L_M"};
                mainGun[] = {"Tornado_AWS_CANNON_W"};
                missileLauncher[] = {"FIR_Brimstone"};
            };
        };
        class CAPPlane
        {
            class baseCAP;
            class Tornado_AWS_ecr_ger : baseCAP {
                loadout[] = {"Tornado_AWS_AIRCMpod_1rnd_M","FIR_AIM9L_P_1rnd_M","Tornado_AWS_fuelsmall_1rnd_M","","FIR_AGM88_P_1rnd_M","FIR_AGM88_P_1rnd_M","","","","Tornado_AWS_fuelsmall_1rnd_M","FIR_AIM9L_P_1rnd_M","Tornado_AWS_ECMpod_1rnd_M","",""};
            };
            class Tornado_AWS_GER : baseCAP {
                loadout[] = {"Tornado_AWS_AIRCMpod_1rnd_M","FIR_AIM9L_P_1rnd_M","Tornado_AWS_fuelsmall_1rnd_M","FIR_Litening_std_P_1rnd_M","FIR_Brimstone_type1_P_3rnd_M","FIR_Brimstone_type1_P_3rnd_M","FIR_GBU12_P_1rnd_M","FIR_Brimstone_type2_P_3rnd_M","FIR_Brimstone_type2_P_3rnd_M","Tornado_AWS_fuelsmall_1rnd_M","FIR_AIM9L_P_1rnd_M","Tornado_AWS_ECMpod_1rnd_M","FIR_BK27_R_M","FIR_BK27_L_M"};
            };
        };
    };
};
