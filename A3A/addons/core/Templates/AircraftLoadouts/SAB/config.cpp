#include "..\..\..\script_component.hpp"

class CfgPatches {
    class PATCHNAME(AirLoadout_SAB) {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"sab_flyinglegends"};
        skipWhenMissingDependencies = 1;
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};

class CfgWeapons {
    class GBU12BombLauncher;
    class sab_fl_bomb_bay_weapon : GBU12BombLauncher{

    };
    class sab_fl_bomb_weapon : GBU12BombLauncher {
        modes[] = {"burst","single"};

    };
};
class CfgAmmo {
    class Bo_GBU12_LGB;
    class sab_fl_bomb_base_ammo : Bo_GBU12_LGB {
        sideAirFriction = 0;
    };
};


class A3A {
    class Loadouts
    {
        class CASPlane
        {
            class baseCAS;

            //Flying legends

            //British
            class sab_fl_tempest : baseCAS          {
                loadout[] = {"sab_fl_rocket_4rnd_rp3_mag","sab_fl_bomb_raf_1rnd_500_mag","sab_fl_bomb_raf_1rnd_500_mag","sab_fl_rocket_4rnd_rp3_mag"};
                mainGun[] = {"sab_fl_4x_cannon_weapon","sab_fl_4x_lmg_weapon"};
                rocketLauncher[] = {"sab_fl_rocket_weapon"};

                bombRacks[] = {"sab_fl_bomb_weapon"};
                diveParams[] = {800, 300, 110, 55, 35, {22, 0}};
            };
            class sab_fl_dh98 : baseCAS             {
                loadout[] = {"sab_fl_rocket_4rnd_rp3_mag","sab_fl_rocket_4rnd_rp3_mag","sab_fl_bomb_raf_2rnd_1000_mag"};
                mainGun[] = {"sab_fl_4x_cannon_weapon","sab_fl_4x_lmg_weapon"};
                rocketLauncher[] = {"sab_fl_rocket_weapon"};

                bombRacks[] = {"sab_fl_bomb_bay_weapon"};
                diveParams[] = {800, 350, 110, 55, 25, {-22, 0}};
            };
            class sab_fl_hurricane_2 : baseCAS      {
                loadout[] = {"sab_fl_rocket_4rnd_rp3_mag","sab_fl_bomb_raf_1rnd_500_mag","sab_fl_bomb_raf_1rnd_500_mag","sab_fl_rocket_4rnd_rp3_mag"};                
                mainGun[] = {"sab_fl_4x_cannon_weapon"};
                rocketLauncher[] = {"sab_fl_rocket_weapon"};

                bombRacks[] = {"sab_fl_bomb_weapon"};
                diveParams[] = {800, 300, 110, 55, 35, {22, 0}};
            };
            class sab_fl_hurricane_trop : baseCAS   {
                loadout[] = {"sab_fl_rocket_4rnd_rp3_mag","sab_fl_pod_s40mm_ap_pylon_mag","sab_fl_pod_s40mm_ap_pylon_mag","sab_fl_rocket_4rnd_rp3_mag"};
                mainGun[] = {"sab_fl_pod_40mm_weapon","sab_fl_2x_lmg_weapon"};
                rocketLauncher[] = {"sab_fl_rocket_weapon"};
            };

            //American
                //USMC
            class sab_fl_f4f : baseCAS      {
                loadout[] = {"sab_fl_bomb_raf_1rnd_500_mag","sab_fl_bomb_raf_1rnd_500_mag"};
                mainGun[] = {"sab_fl_4x_hmg_weapon"};

                bombRacks[] = {"sab_fl_bomb_weapon"};
                diveParams[] = {800, 300, 110, 55, 35, {22, 0}};
            };
            class sab_fl_sbd : baseCAS      {
                loadout[] = {"sab_fl_bomb_allies_1rnd_divebomber_500_mag","sab_fl_rocket_4rnd_rp3_mag","sab_fl_rocket_4rnd_rp3_mag"};
                mainGun[] = {"sab_fl_2x_hmg_weapon"};
                rocketLauncher[] = {"sab_fl_rocket_weapon"};

                bombRacks[] = {"sab_fl_bomb_weapon"};
                diveParams[] = {800, 300, 110, 55, 35, {-8, 0}};
            };
            class sab_fl_f4u : baseCAS      {
                loadout[] = {"sab_fl_rocket_4rnd_rp3_mag","sab_fl_rocket_4rnd_rp3_mag","sab_fl_rocket_4rnd_rp3_mag","sab_fl_bomb_allies_1rnd_1000_mag","sab_fl_bomb_allies_1rnd_1000_mag","sab_fl_rocket_4rnd_rp3_mag","sab_fl_rocket_4rnd_rp3_mag","sab_fl_rocket_4rnd_rp3_mag"};
                mainGun[] = {"sab_fl_6x_hmg_weapon"};
                rocketLauncher[] = {"sab_fl_rocket_weapon"};

                bombRacks[] = {"sab_fl_bomb_weapon"};
                diveParams[] = {800, 300, 110, 55, 35, {20, 0}};
            };
                //USAF
            class sab_fl_p51b : baseCAS     {
                loadout[] = {"sab_fl_rocket_3rnd_m10_mag","sab_fl_bomb_allies_1rnd_500_mag","sab_fl_bomb_allies_1rnd_500_mag","sab_fl_rocket_3rnd_m10_mag"};
                mainGun[] = {"sab_fl_4x_hmg_weapon"};
                rocketLauncher[] = {"sab_fl_rocket_weapon"};

                bombRacks[] = {"sab_fl_bomb_weapon"};
                diveParams[] = {800, 300, 110, 55, 35, {20, 0}};
            };
            class sab_fl_p51d : baseCAS     {
                loadout[] = {"sab_fl_rocket_3rnd_m10_mag","sab_fl_bomb_allies_1rnd_1000_mag","sab_fl_bomb_allies_1rnd_1000_mag","sab_fl_rocket_3rnd_m10_mag"};
                mainGun[] = {"sab_fl_6x_hmg_weapon"};
                rocketLauncher[] = {"sab_fl_rocket_weapon"};

                bombRacks[] = {"sab_fl_bomb_weapon"};
                diveParams[] = {800, 300, 110, 55, 35, {20, 0}};
            };

            //German
            class sab_fl_ju88a : baseCAS             {
                loadout[] = {"sab_fl_bomb_axis_1rnd_500_mag","sab_fl_pod_bk37_he_pylon_mag","sab_fl_pod_bk37_ap_pylon_mag","sab_fl_bomb_axis_1rnd_500_mag",""};
                mainGun[] = {"sab_fl_pod_37mm_weapon"};

                bombRacks[] = {"sab_fl_bomb_weapon"};
                diveParams[] = {800, 500, 110, 55, 35, {62, 0}};
            };

            //Secret Weapons

            //American
                //USMC
            class sab_sw_tbf : baseCAS     {
                loadout[] = {"sab_fl_rocket_3rnd_m10_mag","sab_fl_rocket_3rnd_m10_mag","sab_fl_rocket_3rnd_m10_mag","sab_fl_bomb_allies_4rnd_flat_500_mag","sab_fl_rocket_3rnd_m10_mag","sab_fl_rocket_3rnd_m10_mag","sab_fl_rocket_3rnd_m10_mag"};
                mainGun[] = {"sab_fl_2x_hmg_weapon"};
                rocketLauncher[] = {"sab_fl_rocket_weapon"};

                bombRacks[] = {"sab_fl_bomb_bay_weapon"};
                diveParams[] = {800, 400, 110, 55, 35, {-4, 0}};
            };
                //USAF
            class sab_sw_p40 : baseCAS     {
                loadout[] = {"sab_fl_rocket_3rnd_m10_mag","sab_fl_bomb_allies_1rnd_500_mag","sab_fl_bomb_allies_1rnd_500_mag","sab_fl_rocket_3rnd_m10_mag"};
                mainGun[] = {"sab_fl_6x_hmg_weapon"};
                rocketLauncher[] = {"sab_fl_rocket_weapon"};

                bombRacks[] = {"sab_fl_bomb_weapon"};
                diveParams[] = {800, 300, 110, 55, 35, {20, 0}};
            };
            class sab_sw_p38 : baseCAS     {
                loadout[] = {"sab_fl_rocket_3rnd_m10_mag","sab_fl_bomb_allies_1rnd_500_mag","sab_fl_rocket_3rnd_m10_mag"};
                mainGun[] = {"sab_fl_4x_hmg_weapon"};
                rocketLauncher[] = {"sab_fl_rocket_weapon"};

                bombRacks[] = {"sab_fl_bomb_weapon"};
                diveParams[] = {800, 300, 110, 55, 35, {25, 0}};
            };
            class sab_sw_p61 : baseCAS     {
                loadout[] = {"sab_fl_rocket_4rnd_rp3_mag","sab_fl_bomb_allies_1rnd_1000_mag","sab_fl_bomb_allies_1rnd_1000_mag","sab_fl_rocket_4rnd_rp3_mag"};
                mainGun[] = {"sab_fl_4x_cannon_weapon"};
                rocketLauncher[] = {"sab_fl_rocket_weapon"};

                bombRacks[] = {"sab_fl_bomb_weapon"};
                diveParams[] = {800, 300, 110, 55, 35, {25, 0}};
            };

            //German
            class sab_sw_ar234 : baseCAS             {
                loadout[] = {"sab_fl_pod_bk37_he_pylon_mag","sab_fl_bomb_axis_1rnd_2000_mag","sab_fl_pod_bk37_he_pylon_mag"};
                mainGun[] = {"sab_fl_pod_37mm_weapon"};

                bombRacks[] = {"sab_fl_bomb_weapon"};
                diveParams[] = {800, 500, 110, 55, 35, {72, 0}};
            };
            class sab_sw_bf110 : baseCAS             {
                loadout[] = {"sab_fl_rocket_1rnd_rp3_mag","sab_fl_bomb_axis_1rnd_500_mag","sab_fl_bomb_axis_1rnd_500_mag","sab_fl_rocket_1rnd_rp3_mag","sab_fl_rocket_4rnd_rp3_mag"};
                mainGun[] = {"sab_fl_pod_37mm_weapon","sab_fl_fw190_2x_cannon_weapon", "sab_fl_fw190_4x_lmg_weapon"};
                rocketLauncher[] = {"sab_fl_rocket_weapon"};

                bombRacks[] = {"sab_fl_bomb_weapon"};
                diveParams[] = {800, 350, 110, 55, 25, {25, 0}};
            };
            class sab_sw_ju87_3 : baseCAS     {
                loadout[] = {"sab_fl_rocket_4rnd_rp3_mag","sab_fl_pod_wb81_b_pylon_mag","sab_fl_bomb_axis_1rnd_divebomber_1000_mag","sab_fl_pod_wb81_b_pylon_mag","sab_fl_rocket_4rnd_rp3_mag"};
                mainGun[] = {"sab_fl_2x_cannon_weapon","sab_fl_pod_wb81_b_weapon"};
                rocketLauncher[] = {"sab_fl_rocket_weapon"};

                bombRacks[] = {"sab_fl_bomb_weapon"};
                diveParams[] = {800, 350, 110, 55, 25, {-20, 0}};
            };
            class sab_sw_ju87_2 : sab_sw_ju87_3     {
                loadout[] = {"sab_fl_rocket_4rnd_rp3_mag","sab_fl_pod_bk37_ap_pylon_mag","sab_fl_bomb_axis_1rnd_divebomber_1000_mag","sab_fl_pod_bk37_ap_pylon_mag","sab_fl_rocket_4rnd_rp3_mag"};
                mainGun[] = {"sab_fl_pod_37mm_weapon","sab_fl_2x_lmg_weapon"};
                diveParams[] = {800, 350, 110, 55, 25, {27, 0}};
            };
            class sab_sw_ju87 : sab_sw_ju87_3     {
                loadout[] = {"sab_fl_pod_wb81_b_pylon_mag","sab_fl_rocket_4rnd_rp3_mag","sab_fl_bomb_axis_1rnd_divebomber_1000_mag","sab_fl_rocket_4rnd_rp3_mag","sab_fl_pod_wb81_b_pylon_mag"};
                mainGun[] = {"sab_fl_pod_wb81_b_weapon","sab_fl_2x_lmg_weapon"};
            };
            
            //Russian
            class sab_sw_il2 : baseCAS     {
                loadout[] = {"sab_fl_rocket_4rnd_rp3_mag","sab_fl_bomb_allies_1rnd_500_mag","sab_fl_rocket_4rnd_rp3_mag","sab_fl_rocket_4rnd_rp3_mag","sab_fl_rocket_4rnd_rp3_mag","sab_fl_rocket_4rnd_rp3_mag","sab_fl_bomb_allies_1rnd_500_mag","sab_fl_rocket_4rnd_rp3_mag"};
                mainGun[] = {"sab_fl_2x_cannon_weapon","sab_fl_2x_lmg_weapon"};
                rocketLauncher[] = {"sab_fl_rocket_weapon"};

                bombRacks[] = {"sab_fl_bomb_weapon"};
                diveParams[] = {800, 350, 110, 55, 25, {25, 0}};
            };
            class sab_sw_il2_2 : sab_sw_il2     {
                loadout[] = {"sab_fl_rocket_4rnd_rp3_mag","sab_fl_pod_ns37_ap_pylon_mag","sab_fl_rocket_4rnd_rp3_mag","sab_fl_rocket_4rnd_rp3_mag","sab_fl_rocket_4rnd_rp3_mag","sab_fl_rocket_4rnd_rp3_mag","sab_fl_pod_ns37_ap_pylon_mag","sab_fl_rocket_4rnd_rp3_mag"};
                mainGun[] = {"sab_fl_pod_ns37_weapon","sab_fl_2x_lmg_weapon"};
                bombRacks[] = {};
                diveParams[] = {};
            };
        };
        class CAPPlane
        {
            class baseCAP;
            
            //Flying legends

            //British
            class sab_fl_hurricane : baseCAP        {};
            class sab_fl_spitfire_mk1 : baseCAP     {};
            class sab_fl_spitfire_mk5 : baseCAP     {};
            class sab_fl_spitfire_mkxiv : baseCAP   {};
            class sab_fl_tempest : baseCAP          {
                loadout[] = {"","","",""};
            };

            //American
                //USMC
            class sab_fl_f4f : baseCAP      {
                loadout[] = {"",""};
            };
            class sab_fl_f4u : baseCAP      {
                loadout[] = {"","","","","","","",""};
            };
                //USAF
            class sab_fl_p51b : baseCAP     {
                loadout[] = {"","","",""};
            };
            class sab_fl_p51d : baseCAP     {
                loadout[] = {"","","",""};
            };


            //German
            class sab_fl_he162 : baseCAP        {};
            class sab_fl_bf109c : baseCAP        {};
            class sab_fl_bf109e : baseCAP          {
                loadout[] = {"","",""};
            };
            class sab_fl_bf109f : baseCAP          {
                loadout[] = {"","",""};
            };
            class sab_fl_bf109g : baseCAP          {
                loadout[] = {"","",""};
            };
            class sab_fl_bf109k : baseCAP          {
                loadout[] = {"","",""};
            };
            class sab_fl_fw190a : baseCAP          {
                loadout[] = {"","",""};
            };
            class sab_fl_fw190d : baseCAP          {
                loadout[] = {"","",""};
            };
            //Secret Weapons

            //American
            class sab_sw_p40 : baseCAP          {
                loadout[] = {"","",""};
            };
            class sab_sw_p38 : baseCAP          {
                loadout[] = {"","","",""};
            };

            //German
            class sab_sw_me262 : baseCAP            {
                loadout[] = {""};
            }
        };
    };
};
