#include "..\..\..\..\script_component.hpp"

class CfgPatches {
    class PATCHNAME(AirLoadout_PRACS) {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"PRACS_Core"};
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
            class PRACS_A4M : baseCAS {
                loadout[] = {"PRACS_AGM65_F_X2","PRACS_AGM65_F_X2","PRACS_70mm_FFAR_X19","PRACS_70mm_FFAR_X19","PRACS_Mk81_snake_X6"};
                mainGun[] = {"PRACS_DEFA_552_30mm"};
                rocketLauncher[] = {"PRACS_FFARLauncher"};
                missileLauncher[] = {"PRACS_AGM65F_launcher"};
            };
            class PRACS_F16CJR : baseCAS {
                loadout[] = {"PRACS_AIM9M_WT_X1","PRACS_AIM9M_WT_X1","","","PRACS_70mm_FFAR_X19","PRACS_70mm_FFAR_X19","PRACS_AGM65_TL_X2","PRACS_AGM65_TL_X2","","PRACS_F16_CFT_X1"};
                mainGun[] = {"PRACS_M61A2_20mm"};
                rocketLauncher[] = {"PRACS_FFARLauncher"};
                missileLauncher[] = {"PRACS_AGM65_launcher"};
            };
            class PRACS_MirageV : baseCAS {
                loadout[] = {"PRACS_AIM9M_X1","PRACS_AIM9M_X1","PRACS_70mm_FFAR_X19","PRACS_70mm_FFAR_X19","PRACS_AGM65_TL_X2","PRACS_AGM65_TL_X2","PRACS_M117_X1","PRACS_M117_X1","PRACS_M117_X3"};
                mainGun[] = {"PRACS_DEFA_552_30mm"};
                rocketLauncher[] = {"PRACS_FFARLauncher"};
                missileLauncher[] = {"PRACS_AGM65_launcher"};
            };
            class PRACS_Mohawk : baseCAS {
                loadout[] = {"PRACS_70mm_FFAR_Left_X38","PRACS_70mm_FFAR_Right_X38","PRACS_Hellfire_RDR_X2","PRACS_Hellfire_RDR_X2","PRACS_Mk83_X1","PRACS_Mk83_X1"};
                mainGun[] = {"PRACS_MR39B_20mm"};
                rocketLauncher[] = {"PRACS_FFARLauncher"};
                missileLauncher[] = {"PRACS_AGM114L_Launcher"};
            };
        };
        class CAPPlane
        {
            class baseCAP;
            class F16 : baseCAP {
                loadout[] = {"PRACS_AIM9M_WT_X1","PRACS_AIM9M_WT_X1","PRACS_AIM9M_WT_X1","PRACS_AIM9M_WT_X1","PRACS_AIM120_X1","PRACS_AIM120_X1","PRACS_AIM120_X1","PRACS_AIM120_X1","PRACS_F16_Bellytank_X1","PRACS_F16_CFT_X1"};
            };
            class MIRAGE3 : baseCAP {
                loadout[] = {"PRACS_AIM9M_X1","PRACS_AIM9M_X1","PRACS_AIM120_X1","PRACS_AIM120_X1",""};
            };
        };
    };
};

