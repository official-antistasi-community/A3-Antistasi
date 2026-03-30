#include "..\..\..\script_component.hpp"

class CfgPatches 
{
    class PATCHNAME(AirLoadout_EF) 
    {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3_Data_F_AoW_Loadorder","EF_Data"};
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
            class EF_QAV80_MJTF_Des : baseCAS {
                loadout[] = {"EF_PylonMissile_Missile_Sidearm_x1","EF_PylonMissile_Missile_Sidearm_x1","PylonRack_12Rnd_missiles","PylonRack_12Rnd_missiles","PylonRack_Missile_AGM_02_x2","PylonRack_Missile_AGM_02_x2","PylonMissile_Bomb_GBU12_x1","PylonMissile_Bomb_GBU12_x1"};
                mainGun[] = {"EF_gatling_25mm_QAV80"};
                rocketLauncher[] = {"missiles_DAR"};
                missileLauncher[] = {"weapon_AGM_65Launcher"};
            };
            class EF_QAV80_MJTF_Wdl : EF_QAV80_MJTF_Des {};
        };
        class CAPPlane
        {
            class baseCAP;
            class EF_QAV80_MJTF_Des : baseCAP {
                loadout[] = {"PylonRack_1Rnd_Missile_AA_04_F","PylonRack_1Rnd_Missile_AA_04_F","PylonRack_1Rnd_Missile_AA_04_F","PylonRack_1Rnd_Missile_AA_04_F","PylonRack_Missile_AMRAAM_D_x1","PylonRack_Missile_AMRAAM_D_x1","",""};
            };
            class EF_QAV80_MJTF_Wdl : EF_QAV80_MJTF_Des {};
            class B_Plane_Fighter_01_F;
            class a3a_wdl_camo_FA181_EF : B_Plane_Fighter_01_F {};
        };
        class Helicopter
        {
            class baseHelicopter;
            class B_Heli_Attack_01_dynamicLoadout_F;
            class EF_B_AH99J_NATO : baseHelicopter {
                loadout[] = { "PylonRack_12Rnd_missiles","PylonMissile_1Rnd_LG_scalpel","PylonRack_12Rnd_missiles","PylonRack_12Rnd_missiles","PylonMissile_1Rnd_LG_scalpel","PylonRack_12Rnd_missiles","EF_PylonMissile_Missile_Sidearm_x1","EF_PylonMissile_Titan_NLOS_2Rnd","EF_PylonMissile_Titan_NLOS_2Rnd","EF_PylonMissile_Missile_Sidearm_x1" };
            };
            class EF_B_AH99J_MJTF_Wdl : EF_B_AH99J_NATO {};
            class EF_B_AH99J_MJTF_Des : EF_B_AH99J_NATO {};
            class EF_B_Heli_Attack_01_dynamicLoadout_MJTF_Wdl : B_Heli_Attack_01_dynamicLoadout_F {};
        };
    };
};