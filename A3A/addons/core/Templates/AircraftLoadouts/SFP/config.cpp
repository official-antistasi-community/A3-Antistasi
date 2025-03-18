#include "..\..\..\script_component.hpp"

class CfgPatches {
    class PATCHNAME(AirLoadout_SFP) {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"Swedish_Forces_Pack","CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs", "CUP_AirVehicles_Core"};
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
            class sfp_jas39 : baseCAS {
                loadout[] = {"sfp_1x_rb98","sfp_1x_rb98","PylonRack_3Rnd_LG_scalpel","PylonRack_3Rnd_LG_scalpel","sfp_6rnd_arak135_AP","sfp_6rnd_arak135_AP","CUP_PylonPod_3Rnd_AGM65_Maverick_M"};
                mainGun[] = {"sfp_mauser_bk27_27mm"};
                rocketLauncher[] = {"sfp_arak135_launcher"};
                missileLauncher[] = {"CUP_Vmlauncher_AGM65pod_veh","missiles_SCALPEL"};
            };
            class sfp_jas39_bk90 : sfp_jas39 {
                loadout[] = {"sfp_1x_rb98","sfp_1x_rb98","CUP_PylonPod_3Rnd_AGM65_Maverick_M","CUP_PylonPod_3Rnd_AGM65_Maverick_M","sfp_6rnd_arak135_AP","sfp_6rnd_arak135_AP","sfp_1rnd_bk90"};
                missileLauncher[] = {"sfp_bk90_launcher","CUP_Vmlauncher_AGM65pod_veh","missiles_SCALPEL"};
                code = "params ['_plane']; _plane setVehicleRadar 1;";
            };
            class sfp_jas39_rb15 : sfp_jas39 {
                loadout[] = {"sfp_1x_rb98","sfp_1x_rb98","sfp_6rnd_arak135_AP","sfp_6rnd_arak135_AP","sfp_6rnd_arak135_AP","sfp_6rnd_arak135_AP","CUP_PylonPod_3Rnd_AGM65_Maverick_M"};
                missileLauncher[] = {"CUP_Vmlauncher_AGM65pod_veh"};
            };
        };
        class CAPPlane
        {
            class baseCAP;
            class sfp_jas39 : baseCAP {
                loadout[] = {"sfp_1x_rb98","sfp_1x_rb98","CUP_PylonPod_2Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_2Rnd_AIM_9L_LAU_Sidewinder_M","sfp_2x_rb100","sfp_2x_rb100","CUP_PylonPod_2Rnd_AGM114L_Hellfire_II_Plane_M"};
            };
            class sfp_jas39_cap : sfp_jas39 {};
        };
        class Helicopter
        {

        };
    };
};
