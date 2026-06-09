//EF - CfgVehicles.hpp

class CfgVehicles {
    class EF_O_Gyra_OPF;
    class EF_O_Gyra_HMG_OPF;
    class EF_O_Gyra_Armed_OPF;
    class EF_O_Gyra_Antiair_OPF;
    class EF_O_Gyra_Mortar_OPF;
    class B_Plane_Fighter_01_F;
    class B_Heli_Transport_03_unarmed_F;
    class B_Heli_Transport_03_F;
    class B_T_VTOL_01_infantry_F;

    class a3a_black_Gyra_EF : EF_O_Gyra_OPF {
        textureList[] = {"Black",1};
        hiddenSelectionsTextures[] = {"ef\ef_gyra_t\data\gyra_hull_1_black_co.paa","ef\ef_gyra_t\data\gyra_details_1_black_co.paa","ef\ef_gyra_t\data\gyra_int_1_black_co.paa","ef\ef_gyra_t\data\gyra_hmg_1_black_co.paa","ef\ef_gyra_t\data\gyra_rws_1_black_co.paa","ef\ef_gyra_t\data\gyra_turret_1_black_co.paa","ef\ef_gyra_t\data\gyra_mortar_1_black_co.paa","a3\armor_f\data\camonet_CSAT_HEX_Desert_CO.paa"};
    };
    class a3a_black_Gyra_HMG_EF : EF_O_Gyra_HMG_OPF {
        textureList[] = {"Black",1};
        hiddenSelectionsTextures[] = {"ef\ef_gyra_t\data\gyra_hull_1_black_co.paa","ef\ef_gyra_t\data\gyra_details_1_black_co.paa","ef\ef_gyra_t\data\gyra_int_1_black_co.paa","ef\ef_gyra_t\data\gyra_hmg_1_black_co.paa","ef\ef_gyra_t\data\gyra_rws_1_black_co.paa","ef\ef_gyra_t\data\gyra_turret_1_black_co.paa","ef\ef_gyra_t\data\gyra_mortar_1_black_co.paa","a3\armor_f\data\camonet_CSAT_HEX_Desert_CO.paa"};
    };
    class a3a_black_Gyra_Armed_EF : EF_O_Gyra_Armed_OPF {
        textureList[] = {"Black",1};
        hiddenSelectionsTextures[] = {"ef\ef_gyra_t\data\gyra_hull_1_black_co.paa","ef\ef_gyra_t\data\gyra_details_1_black_co.paa","ef\ef_gyra_t\data\gyra_int_1_black_co.paa","ef\ef_gyra_t\data\gyra_hmg_1_black_co.paa","ef\ef_gyra_t\data\gyra_rws_1_black_co.paa","ef\ef_gyra_t\data\gyra_turret_1_black_co.paa","ef\ef_gyra_t\data\gyra_mortar_1_black_co.paa","a3\armor_f\data\camonet_CSAT_HEX_Desert_CO.paa"};
    };
    class a3a_black_Gyra_Antiair_EF : EF_O_Gyra_Antiair_OPF {
        textureList[] = {"Black",1};
        hiddenSelectionsTextures[] = {"ef\ef_gyra_t\data\gyra_hull_1_black_co.paa","ef\ef_gyra_t\data\gyra_details_1_black_co.paa","ef\ef_gyra_t\data\gyra_int_1_black_co.paa","ef\ef_gyra_t\data\gyra_hmg_1_black_co.paa","ef\ef_gyra_t\data\gyra_rws_1_black_co.paa","ef\ef_gyra_t\data\gyra_turret_1_black_co.paa","ef\ef_gyra_t\data\gyra_mortar_1_black_co.paa","a3\armor_f\data\camonet_CSAT_HEX_Desert_CO.paa"};
    };
    class a3a_black_Gyra_Mortar_EF : EF_O_Gyra_Mortar_OPF {
        textureList[] = {"Black",1};
        hiddenSelectionsTextures[] = {"ef\ef_gyra_t\data\gyra_hull_1_black_co.paa","ef\ef_gyra_t\data\gyra_details_1_black_co.paa","ef\ef_gyra_t\data\gyra_int_1_black_co.paa","ef\ef_gyra_t\data\gyra_hmg_1_black_co.paa","ef\ef_gyra_t\data\gyra_rws_1_black_co.paa","ef\ef_gyra_t\data\gyra_turret_1_black_co.paa","ef\ef_gyra_t\data\gyra_mortar_1_black_co.paa","a3\armor_f\data\camonet_CSAT_HEX_Desert_CO.paa"};
    };
    class a3a_wdl_camo_FA181_EF : B_Plane_Fighter_01_F {
        textureList[] = {"MJTF Camo",1};
        hiddenSelectionsTextures[] = {"\ef\ef_fa181\Data\Fighter_01_ext_01_camo_CO.paa","\ef\ef_fa181\Data\Fighter_01_ext_02_camo_CO.paa","a3\air_f_jets\plane_fighter_01\data\fighter_01_glass_01_ca.paa","a3\air_f_jets\plane_fighter_01\data\fighter_01_cockpit_01_co.paa","a3\air_f_jets\plane_fighter_01\data\fighter_01_cockpit_02_co.paa","a3\air_f_jets\plane_fighter_01\data\fighter_01_cockpit_03_co.paa","a3\air_f_jets\plane_fighter_01\data\fighter_01_cockpit_05_co.paa"};
    };
    class a3a_grey_unarmed_ch67_EF : B_Heli_Transport_03_unarmed_F {
        textureList[] = {"Dark Grey",1};
        hiddenSelectionsTextures[] = {"\ef\ef_ch67\data\Heli_Transport_03_ext_01_MJTF_CO.paa","\ef\ef_ch67\data\Heli_Transport_03_ext_02_MJTF_CO.paa"};
    };
    class a3a_grey_armed_ch67_EF : B_Heli_Transport_03_F {
        textureList[] = {"Dark Grey",1};
        hiddenSelectionsTextures[] = {"\ef\ef_ch67\data\Heli_Transport_03_ext_01_MJTF_CO.paa","\ef\ef_ch67\data\Heli_Transport_03_ext_02_MJTF_CO.paa"};
    };
    class a3a_wdl_camo_unarmed_ch67_EF : B_Heli_Transport_03_unarmed_F {
        textureList[] = {"MJTF Camo",1};
        hiddenSelectionsTextures[] = {"\ef\ef_ch67\data\Heli_Transport_03_ext_01_MJTF_camo_CO.paa","\ef\ef_ch67\data\Heli_Transport_03_ext_02_MJTF_camo_CO.paa"};
    };
    class a3a_wdl_camo_armed_ch67_EF : B_Heli_Transport_03_F {
        textureList[] = {"MJTF Camo",1};
        hiddenSelectionsTextures[] = {"\ef\ef_ch67\data\Heli_Transport_03_ext_01_MJTF_camo_CO.paa","\ef\ef_ch67\data\Heli_Transport_03_ext_02_MJTF_camo_CO.paa"};
    };
    class a3a_wdl_camo_v44x_EF : B_T_VTOL_01_infantry_F {
        textureList[] = {"MJTF Camo",1};
        hiddenSelectionsTextures[] = {"\ef\ef_v44x\Data\VTOL_01_EXT_01_camo_CO.paa","\ef\ef_v44x\Data\VTOL_01_EXT_02_camo_CO.paa","\ef\ef_v44x\Data\VTOL_01_EXT_03_camo_CO.paa","\ef\ef_v44x\Data\VTOL_01_EXT_04_camo_CO.paa","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_signs_CA.paa"};
    };
};