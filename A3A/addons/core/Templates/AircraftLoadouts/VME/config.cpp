#include "..\..\..\script_component.hpp"

class CfgPatches {
    class PATCHNAME(AirLoadout_VME) {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"vme_pla_factions_c"};
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
            class VME_PLA_JH7 : baseCAS {
                loadout[] = {"","","VME_57mm_HE_x12","VME_57mm_HE_x12","PylonRack_KD88_Single","PylonRack_KD88_Single","PylonRack_KD88_Single","PylonRack_KD88_Single","","VME_TARGET_POD"};
                mainGun[] = {"PLA_GSH23_Cannon"};
                rocketLauncher[] = {"VME_57mm_RPOD"};
                missileLauncher[] = {"VME_KD88Launcher"};
            };
            class VME_PLA_J10B : baseCAS {
                loadout[] = {"VME_57mm_HE_x12","VME_57mm_HE_x12","VME_LT2_x1","VME_LT2_x1","VME_LT2_x1","VME_LT2_x1","VME_ARM_POD","VME_TARGET_POD","","",""};
                mainGun[] = {"PLA_GSH23_Cannon"};
                rocketLauncher[] = {"VME_57mm_RPOD"};
                missileLauncher[] = {"VME_LT2_Launcher"};
                gunnerLaser = "VME_LTP_pylon";
            };
            class VME_PLA_J11 : baseCAS {
                loadout[] = {"","","","","VME_57mm_HE_x12","VME_57mm_HE_x12","PylonRack_KD88_Single","PylonRack_KD88_Single","PylonRack_KD88_Single"};
                mainGun[] = {"VME_GSh301_Cannon"};
                rocketLauncher[] = {"VME_57mm_RPOD"};
                missileLauncher[] = {"VME_KD88Launcher"};
            };
            class VME_PLA_J16 : baseCAS {
                loadout[] = {"","","","","VME_57mm_HE_x12","VME_57mm_HE_x12","VME_57mm_HE_x12","VME_57mm_HE_x12","PylonRack_KD88_Single","PylonRack_KD88_Single","PylonRack_KD88_Single"};
                mainGun[] = {"VME_GSh301_Cannon"};
                rocketLauncher[] = {"VME_57mm_RPOD"};
                missileLauncher[] = {"VME_KD88Launcher"};
            };
        };
        class CAPPlane
        {
            class baseCAP;
            class VME_PLA_J10B : baseCAP {
                loadout[] = {"PylonRack_PL8_AA_Single","PylonRack_PL8_AA_Single","PylonRack_PL11_AA_Single","PylonRack_PL11_AA_Single","PylonRack_PL12_AA_Single","PylonRack_PL12_AA_Single","VME_ECM_POD","","","",""};
            };
            class VME_PLA_J11 : baseCAP {
                loadout[] = {"PylonRack_PL8_AA_Wingtip","PylonRack_PL8_AA_Wingtip","PylonRack_PL8_AA_Single","PylonRack_PL8_AA_Single","PylonRack_PL12_AA_Single","PylonRack_PL12_AA_Single","PylonRack_PL12_AA_Single","PylonRack_PL12_AA_Single","PylonRack_PL12_AA_Single"};
            };
            class VME_PLA_J16 : baseCAP {
                loadout[] = {"PylonRack_PL5_AA_Wingtip","PylonRack_PL5_AA_Wingtip","PylonRack_PL5_AA_Single","PylonRack_PL5_AA_Single","PylonRack_PL15_AA_Single","PylonRack_PL15_AA_Single","PylonRack_PL15_AA_Single","PylonRack_PL15_AA_Single","PylonRack_PL15_AA_Single","PylonRack_PL15_AA_Single","PylonRack_PL15_AA_Single"};
            };
            class VME_PLA_J20 : baseCAP {
                loadout[] = {"PylonRack_PL10_AA_Wingtip","PylonRack_PL10_AA_Wingtip","PylonRack_PL12_AA_Wingtip","PylonRack_PL12_AA_Wingtip","PylonRack_PL12_AA_Wingtip","PylonRack_PL12_AA_Wingtip"};
            };

        };
        class Helicopter
        {
            class baseHelicopter;
            class VME_PLA_Mi171 : baseHelicopter {
                loadout[] = { "QN201_20xMag","QN201_20xMag","PylonWeapon_300Rnd_20mm_shells","PylonWeapon_300Rnd_20mm_shells","QN201_20xMag","QN201_20xMag" };
            };
            class VME_WZ10_FOR : baseHelicopter {
                loadout[] = { "PylonRack_TY90_AA_Wingtip","PylonRack_TY90_AA_Wingtip","PylonRack_AKD10_Quad","PylonRack_AKD10_Quad","PylonRack_HJ10_Quad","PylonRack_HJ10_Quad" };
            };
            class VME_WZ10 : baseHelicopter {
                loadout[] = { "PylonRack_TY90_AA_Wingtip","PylonRack_TY90_AA_Wingtip","PylonRack_HJ9_Quad","PylonRack_HJ9_Quad","VME_57mm_HE_x19","VME_57mm_HE_x19" };
            };
            class VME_PLA_z19 : baseHelicopter {
                loadout[] = { "PylonRack_TY90_Quad","VME_57mm_HE_x19","PylonRack_AKD10_Quad","PylonRack_AKD10_Quad" };
            };
            class VME_PLA_z9_CAS : baseHelicopter {
                loadout[] = { "PylonWeapon_300Rnd_20mm_shells","VME_57mm_HE_x19" };
            };
        };
    };
};
