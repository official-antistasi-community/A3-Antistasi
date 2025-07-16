#include "..\..\..\script_component.hpp"

class CfgPatches 
{
    class PATCHNAME(AirLoadout_RF) 
    {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"RF_Vehicles"};
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
        class Helicopter
        {
            class baseHelicopter;
            class a3a_Heli_light_03_dynamicLoadout_rf : baseHelicopter {
                loadout[] = {"PylonRack_19Rnd_missiles_gray_RF","PylonWeapon_1000Rnd_20x102mm_shells_gray_RF","PylonRack_19Rnd_missiles_gray_RF","PylonWeapon_1000Rnd_20x102mm_shells_gray_RF"};
            };
            class a3a_Heli_EC_02_rf : baseHelicopter {
                loadout[] = {"PylonRack_19Rnd_missiles_olive_RF","PylonRack_4Rnd_LG_scalpel","PylonRack_4Rnd_LG_scalpel","PylonRack_19Rnd_missiles_olive_RF"};
            };
            class a3a_AAF_Heli_light_03_dynamicLoadout_rf : a3a_Heli_light_03_dynamicLoadout_rf {};
            class a3a_LDF_Heli_light_03_dynamicLoadout_rf : a3a_Heli_light_03_dynamicLoadout_rf {};
            class a3a_black_Heli_light_03_dynamicLoadout_rf : a3a_Heli_light_03_dynamicLoadout_rf {};
            class a3a_tan_Heli_light_03_dynamicLoadout_rf : a3a_Heli_light_03_dynamicLoadout_rf {};
            class a3a_green_Heli_light_03_dynamicLoadout_rf : a3a_Heli_light_03_dynamicLoadout_rf {};
            class a3a_LDF_Heli_EC_02_rf : a3a_Heli_EC_02_rf {};
            class a3a_AAF_Heli_EC_02_rf : a3a_Heli_EC_02_rf {};
            class a3a_black_Heli_EC_02_rf : a3a_Heli_EC_02_rf {};
            class a3a_sfia_Heli_EC_02_rf : a3a_Heli_EC_02_rf {};

            class a3a_navy_Heli_EC_03_rf : baseHelicopter {
                loadout[] = { "PylonWeapon_860Rnd_127x99mm_shells_black_RF","PylonRack_4Rnd_LG_scalpel" };
            };
            class a3a_navy_Heli_light_03_dynamicLoadout_rf : a3a_Heli_light_03_dynamicLoadout_rf {
                loadout[] = { "PylonRack_19Rnd_missiles_gray_RF","PylonRack_4Rnd_LG_scalpel","PylonRack_19Rnd_missiles_gray_RF","PylonWeapon_860Rnd_127x99mm_shells_black_RF" };
            };
            class a3a_navy_Heli_EC_02_rf : a3a_Heli_EC_02_rf {
                loadout[] = { "PylonRack_4Rnd_LG_scalpel","PylonRack_19Rnd_missiles_gray_RF","PylonRack_19Rnd_missiles_gray_RF","PylonRack_4Rnd_LG_scalpel" };
            };
        };
    };
};