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
/*
#define A4SKYHAWKloadout ["PRACS_AGM65_F_X2","PRACS_AGM65_F_X2","PRACS_70mm_FFAR_X19","PRACS_70mm_FFAR_X19","PRACS_Mk81_snake_X6"]
#define F16CJRloadout ["PRACS_AIM9M_WT_X1","PRACS_AIM9M_WT_X1","","","PRACS_70mm_FFAR_X19","PRACS_70mm_FFAR_X19","PRACS_AGM65_TL_X2","PRACS_AGM65_TL_X2","","PRACS_F16_CFT_X1"]
#define F16loadout ["PRACS_AIM9M_WT_X1","PRACS_AIM9M_WT_X1","PRACS_AIM9M_WT_X1","PRACS_AIM9M_WT_X1","PRACS_AIM120_X1","PRACS_AIM120_X1","PRACS_AIM120_X1","PRACS_AIM120_X1","PRACS_F16_Bellytank_X1","PRACS_F16_CFT_X1"]
#define MIRAGE3loadout ["PRACS_AIM9M_X1","PRACS_AIM9M_X1","PRACS_AIM120_X1","PRACS_AIM120_X1",""]
#define MIRAGE5loadout ["PRACS_AIM9M_X1","PRACS_AIM9M_X1","PRACS_70mm_FFAR_X19","PRACS_70mm_FFAR_X19","PRACS_AGM65_TL_X2","PRACS_AGM65_TL_X2","PRACS_M117_X1","PRACS_M117_X1","PRACS_M117_X3"]
#define MOHAWKloadout ["PRACS_70mm_FFAR_Left_X38","PRACS_70mm_FFAR_Right_X38","PRACS_Hellfire_RDR_X2","PRACS_Hellfire_RDR_X2","PRACS_Mk83_X1","PRACS_Mk83_X1"]
#define A4SKYHAWKweapons ["PRACS_DEFA_552_30mm","CMFlareLauncher","PRACS_FFARLauncher","PRACS_Mk81_Snake_Launcher","PRACS_AGM65F_launcher"]
#define F16CJRweapons ["PRACS_M61A2_20mm","Laserdesignator_mounted","CMFlareLauncher","PRACS_AIM9M_Launcher","PRACS_AGM65_launcher","PRACS_DummyLauncher","PRACS_FFARLauncher"]
#define MIRAGE5weapons ["PRACS_DEFA_552_30mm","Laserdesignator_pilotCamera","CMFlareLauncher","PRACS_AIM9M_Launcher","PRACS_FFARLauncher","PRACS_AGM65_launcher","PRACS_M117_Launcher"]
#define MOHAWKweapons ["PRACS_MR39B_20mm","CMFlareLauncher","PRACS_FFARLauncher","PRACS_AGM114L_Launcher","PRACS_Mk83_Launcher"]
*/
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

