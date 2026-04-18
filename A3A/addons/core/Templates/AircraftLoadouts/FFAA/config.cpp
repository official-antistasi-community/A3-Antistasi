#include "..\..\..\script_component.hpp"

class CfgPatches {
    class PATCHNAME(AirLoadout_FFAA) {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ffaa_et_vamtac"};
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
            class ffaa_ea_ef18m : baseCAS {
                loadout[] = {"","PylonRack_Missile_AGM_02_x2","PylonRack_ffaa_22Rnd_tigre_sneb_68mm","","","","PylonRack_ffaa_22Rnd_tigre_sneb_68mm","PylonRack_Missile_AGM_02_x2",""};
                mainGun[] = {"weapon_Fighter_Gun20mm_AA"};
                rocketLauncher[] = {"ffaa_tigre_sneb"};
                missileLauncher[] = {"weapon_AGM_65Launcher"};
            };
            class ffaa_ar_harrier : baseCAS {
                loadout[] = {"","PylonRack_3Rnd_Missile_AGM_02_F","PylonRack_ffaa_22Rnd_tigre_sneb_68mm","PylonRack_ffaa_22Rnd_tigre_sneb_68mm","PylonRack_3Rnd_Missile_AGM_02_F",""};
                mainGun[] = {"ffaa_cannon_gau12"};
                rocketLauncher[] = {"ffaa_tigre_sneb"};
                missileLauncher[] = {"weapon_AGM_65Launcher"};
            };
        };
        class CAPPlane
        {
            class baseCAP;
            class ffaa_ea_ef18m : baseCAP {
                loadout[] = {"PylonMissile_1Rnd_Missile_AA_04_F","PylonRack_Missile_AMRAAM_C_x1","PylonRack_Missile_AMRAAM_C_x1","PylonMissile_Missile_AMRAAM_C_x1","","PylonMissile_Missile_AMRAAM_C_x1","PylonRack_Missile_AMRAAM_C_x1","PylonRack_Missile_AMRAAM_C_x1","PylonMissile_1Rnd_Missile_AA_04_F"};
            };
            class ffaa_ar_harrier : baseCAP {
                loadout[] = {"PylonRack_Missile_BIM9X_x2","CUP_PylonPod_2Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_2Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_2Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_2Rnd_AIM_9L_LAU_Sidewinder_M","PylonRack_Missile_BIM9X_x2"};
            };
        };
        class Helicopter
        {
        class ffaa_famet_tigre : baseHelicopter {
                loadout[] = {"PylonRack_ffaa_22Rnd_tigre_sneb_68mm","PylonRack_ffaa_4Rnd_tigre_spike","PylonRack_ffaa_4Rnd_tigre_spike","PylonRack_ffaa_22Rnd_tigre_sneb_68mm"};
            };
        };
    };
};
