#include "..\..\..\..\script_component.hpp"

class CfgPatches {
    class PATCHNAME(AirLoadout_PRACS_SLA) {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"PRACS_SLA_Core"};
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
            class PRACS_SLA_MiG27 : baseCAS {
                loadout[] = {"PRACS_KH29MP_X1","PRACS_KH29MP_X1","rhs_mag_ub32_s5k1","rhs_mag_ub32_s5k1","PRACS_FAB_500_M62_X1","PRACS_FAB_500_M62_X1"};
                mainGun[] = {"PRACS_Gsh_6_30"};
                rocketLauncher[] = {"rhs_weap_s5k1"};
                missileLauncher[] = {"PRACS_KH29_MP_launcher"};
            };
            class PRACS_SLA_SU22 : baseCAS {
                loadout[] = {"PRACS_AA11_X1","PRACS_AA11_X1","PRACS_Kh25_mtp_X1","PRACS_Kh25_mtp_X1","PRACS_Kh25_mtp_X1","PRACS_Kh25_mtp_X1","rhs_mag_ub32_s5ko","rhs_mag_ub32_s5ko","PRACS_FAB_250_M62_X1","PRACS_FAB_250_M62_X1","PRACS_FAB_250_M62_X1","PRACS_FAB_250_M62_X1","PRACS_FAB_250_M62_X1","PRACS_FAB_250_M62_X1"};
                mainGun[] = {"PRACS_NR30_30mm"};
                rocketLauncher[] = {"rhs_weap_s5ko"};
                missileLauncher[] = {"PRACS_Kh25_mtp_launcher"};
            };
            class PRACS_SLA_SU25 : baseCAS {
                loadout[] = {"PRACS_AA8_X1","PRACS_AA8_X1","rhs_mag_ub32_s5ko","rhs_mag_ub32_s5ko","rhs_mag_ub32_s5ko","rhs_mag_ub32_s5ko","PRACS_Kh25_mtp_X1","PRACS_Kh25_mtp_X1","PRACS_Kh25_mtp_X1","PRACS_Kh25_mtp_X1"};
                mainGun[] = {"PRACS_GSH_30_2_30mm"};
                rocketLauncher[] = {"rhs_weap_s5ko"};
                missileLauncher[] = {"PRACS_Kh25_mtp_launcher"};
            };
        };
        class CAPPlane
        {
            class baseCAP;
            class PRACS_SLA_MiG21 : baseCAP {
                loadout[] = {"PRACS_AA8_X2_L","PRACS_AA8_X2_R","PRACS_AA10R_X1","PRACS_AA10R_X1"};
            };
            class PRACS_SLA_MiG23 : baseCAP {
                loadout[] = {"PRACS_AA8_X2_L","PRACS_AA8_X2_R","PRACS_R24R_X1","PRACS_R24R_X1"};
            };
            class PRACS_SLA_MIG28 : baseCAP {
                loadout[] = {"PRACS_AA2_X1_WT","PRACS_AA2_X1_WT","PRACS_AA2_X1","PRACS_AA2_X1","PRACS_R77_X1","PRACS_R77_X1"};
            };
            class PRACS_SLA_MiG29 : baseCAP {
                loadout[] = {"PRACS_R77_M29_X1","PRACS_R77_M29_X1","PRACS_AA11_M29_X1","PRACS_AA11_M29_X1","PRACS_AA11_M29_X1","PRACS_AA11_M29_X1","","rhs_BVP3026_CMFlare_Chaff_Magazine_x2"};
            };
        };
    };
};
