//WS - CfgVehicles.hpp

class CfgVehicles
{
    class B_G_Offroad_01_AT_F;
    class B_G_Offroad_01_armed_F;
    class B_Tura_Offroad_armor_AT_lxWS;
    class B_Tura_Offroad_armor_armed_lxWS;
    class B_Tura_Offroad_armor_lxWS;
    class I_Truck_02_MRL_F;
    class O_Truck_02_Ammo_F;
    class O_Truck_02_Fuel_F;
    class O_Truck_02_box_F;
    class O_Truck_02_cargo_lxWS;
    class O_Truck_02_flatbed_lxWS;
    class O_Truck_02_medical_F;
    class O_Truck_02_transport_F;
    class O_Tura_Truck_02_aa_lxWS;
    class O_Tura_ZU23_lxWS;

    #include "ws_ifv.hpp"
    #include "ws_ion.hpp"

    //Tan
    class a3a_tan_Offroad_armor : B_Tura_Offroad_armor_lxWS
    {
        textureList[] = {};
        hiddenSelectionsTextures[] = {"a3\soft_f\offroad_01\data\offroad_01_ext_base01_co.paa","a3\soft_f\offroad_01\data\offroad_01_ext_base01_co.paa","lxws\vehicles_f_lxws\offroad_01\data\offroad_01_adds_black_co.paa","lxws\vehicles_f_lxws\offroad_01\data\offroad_01_armor_sfia2_co.paa"};
    };
    class a3a_tan_Offroad_armor_at : B_Tura_Offroad_armor_AT_lxWS
    {
        textureList[] = {};
        hiddenSelectionsTextures[] = {"a3\soft_f\offroad_01\data\offroad_01_ext_base01_co.paa","a3\soft_f\offroad_01\data\offroad_01_ext_base01_co.paa","lxws\vehicles_f_lxws\offroad_01\data\offroad_01_adds_black_co.paa","lxws\vehicles_f_lxws\offroad_01\data\offroad_01_armor_sfia2_co.paa"};
    };
    class a3a_tan_Offroad_armor_armed : B_Tura_Offroad_armor_armed_lxWS
    {
        textureList[] = {};
        hiddenSelectionsTextures[] = {"a3\soft_f\offroad_01\data\offroad_01_ext_base01_co.paa","a3\soft_f\offroad_01\data\offroad_01_ext_base01_co.paa","lxws\vehicles_f_lxws\offroad_01\data\offroad_01_adds_black_co.paa","lxws\vehicles_f_lxws\offroad_01\data\offroad_01_armor_sfia2_co.paa"};
    };
    
    //Green
    class a3a_green_Offroad_armor : B_Tura_Offroad_armor_lxWS
    {
        textureList[] = {};
        hiddenSelectionsTextures[] = {"a3\soft_f_enoch\offroad_01\data\offroad_01_ext_grn_co.paa","a3\soft_f_enoch\offroad_01\data\offroad_01_ext_grn_co.paa","lxws\vehicles_f_lxws\offroad_01\data\offroad_01_adds_black_co.paa","lxws\vehicles_f_lxws\offroad_01\data\offroad_01_armor_rust_co.paa"};
    };
    class a3a_green_Offroad_armor_at : B_Tura_Offroad_armor_AT_lxWS
    {
        textureList[] = {};
        hiddenSelectionsTextures[] = {"a3\soft_f_enoch\offroad_01\data\offroad_01_ext_grn_co.paa","a3\soft_f_enoch\offroad_01\data\offroad_01_ext_grn_co.paa","lxws\vehicles_f_lxws\offroad_01\data\offroad_01_adds_black_co.paa","lxws\vehicles_f_lxws\offroad_01\data\offroad_01_armor_rust_co.paa"};
    };
    class a3a_green_Offroad_armor_armed : B_Tura_Offroad_armor_armed_lxWS
    {
        textureList[] = {};
        hiddenSelectionsTextures[] = {"a3\soft_f_enoch\offroad_01\data\offroad_01_ext_grn_co.paa","a3\soft_f_enoch\offroad_01\data\offroad_01_ext_grn_co.paa","lxws\vehicles_f_lxws\offroad_01\data\offroad_01_adds_black_co.paa","lxws\vehicles_f_lxws\offroad_01\data\offroad_01_armor_rust_co.paa"};
    };
    
    //LDF-Camo
    class a3a_ldf_Offroad_armor : B_Tura_Offroad_armor_lxWS
    {
        textureList[] = {};
        crew = "I_E_Soldier_F";
        faction = "IND_E_F";
        side = 2;
        hiddenSelectionsTextures[] = {"a3\soft_f_enoch\offroad_01\data\offroad_01_ext_eaf_co.paa","a3\soft_f_enoch\offroad_01\data\offroad_01_ext_eaf_co.paa","lxws\vehicles_f_lxws\offroad_01\data\offroad_01_adds_black_co.paa","lxws\vehicles_f_lxws\offroad_01\data\offroad_01_armor_rust_co.paa"};
    };
    class a3a_ldf_Offroad_armor_at : B_Tura_Offroad_armor_AT_lxWS
    {
        textureList[] = {};
        crew = "I_E_Soldier_F";
        faction = "IND_E_F";
        side = 2;
        hiddenSelectionsTextures[] = {"a3\soft_f_enoch\offroad_01\data\offroad_01_ext_eaf_co.paa","a3\soft_f_enoch\offroad_01\data\offroad_01_ext_eaf_co.paa","lxws\vehicles_f_lxws\offroad_01\data\offroad_01_adds_black_co.paa","lxws\vehicles_f_lxws\offroad_01\data\offroad_01_armor_rust_co.paa"};
    };
    class a3a_ldf_Offroad_armor_armed : B_Tura_Offroad_armor_armed_lxWS
    {
        textureList[] = {};
        crew = "I_E_Soldier_F";
        faction = "IND_E_F";
        side = 2;
        hiddenSelectionsTextures[] = {"a3\soft_f_enoch\offroad_01\data\offroad_01_ext_eaf_co.paa","a3\soft_f_enoch\offroad_01\data\offroad_01_ext_eaf_co.paa","lxws\vehicles_f_lxws\offroad_01\data\offroad_01_adds_black_co.paa","lxws\vehicles_f_lxws\offroad_01\data\offroad_01_armor_rust_co.paa"};
    };
    
    //SIFA-Camo
    class a3a_SIFA_Truck_02_medical_F : O_Truck_02_medical_F
    {
        side = 0;
        crew = "O_SFIA_soldier_lxWS";
        faction = "OPF_SFIA_lxWS";
        hiddenSelectionsTextures[] = {"lxws\vehicles_f_lxws\data\truck_02\truck_02_kab_sfia_co.paa","lxws\vehicles_f_lxws\data\truck_02\truck_02_kuz_africa_brown_co.paa","a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"};
    };
    
    //Tan-Camo
    class a3a_O_Truck_02_zu23_F : O_Tura_Truck_02_aa_lxWS
    {
        side = 0;
        crew = "O_soldier_F";
        faction = "OPF_F";
        hiddenSelectionsTextures[] = {"a3\soft_f_beta\truck_02\data\truck_02_kab_opfor_co.paa","lxws\vehicles_f_lxws\truck_02\data\truck_02_cargo_opfor_co.paa","a3\soft_f_beta\truck_02\data\truck_02_int_co.paa","a3\soft_f_beta\truck_02\data\truck_02_chassis_opfor_co.paa","lxws\vehicles_f_lxws\zu23\data\zu23_base_green_co.paa","lxws\vehicles_f_lxws\zu23\data\zu23_green_co.paa","lxws\vehicles_f_lxws\zu23\data\zu23_addon_1_hex_co.paa","lxws\vehicles_f_lxws\zu23\data\zu23_addon_2_green_co.paa","lxws\vehicles_f_lxws\truck_02\data\addons_black_co.paa"};
    };
    
    //Brown-Camo
    class a3a_O_T_Truck_02_zu23_F : O_Tura_Truck_02_aa_lxWS
    {
        side = 0;
        crew = "O_T_Soldier_F";
        faction = "OPF_T_F";
        hiddenSelectionsTextures[] = {"a3\soft_f_exp\truck_02\data\truck_02_kab_ghex_co.paa","lxws\vehicles_f_lxws\truck_02\data\truck_02_cargo_olive_co.paa","a3\soft_f_beta\truck_02\data\truck_02_int_co.paa","a3\soft_f_enoch\truck_02\data\truck_02_chassis_eaf_co.paa","lxws\vehicles_f_lxws\zu23\data\zu23_base_green_co.paa","lxws\vehicles_f_lxws\zu23\data\zu23_green_co.paa","lxws\vehicles_f_lxws\zu23\data\zu23_addon_1_hex_co.paa","lxws\vehicles_f_lxws\zu23\data\zu23_addon_2_green_co.paa","lxws\vehicles_f_lxws\truck_02\data\addons_black_co.paa"};
    };
    
    //Green-Camo
    class a3a_I_E_Truck_02_zu23_F : O_Tura_Truck_02_aa_lxWS
    {
        side = 2;
        crew = "I_E_Soldier_F";
        faction = "IND_E_F";
        hiddenSelectionsTextures[] = {"a3\soft_f_enoch\truck_02\data\truck_02_kab_eaf_co.paa","lxws\vehicles_f_lxws\truck_02\data\truck_02_cargo_eaf_co.paa","a3\soft_f_beta\truck_02\data\truck_02_int_co.paa","a3\soft_f_enoch\truck_02\data\truck_02_chassis_eaf_co.paa","lxws\vehicles_f_lxws\zu23\data\zu23_base_green_co.paa","lxws\vehicles_f_lxws\zu23\data\zu23_green_co.paa","lxws\vehicles_f_lxws\zu23\data\zu23_addon_1_green_co.paa","lxws\vehicles_f_lxws\zu23\data\zu23_addon_2_green_co.paa","lxws\vehicles_f_lxws\truck_02\data\addons_black_co.paa"};
    };
};