
class Templates
{
    // ***************************** Vanilla *****************************
    class Vanilla_Base
    {
        requiredAddons[] = {};
        logo = "a3\ui_f\data\logos\arma3_white_ca.paa";
        basepath = QPATHTOFOLDER(Templates\Templates\Vanilla); //the path to the template folder
        priority = 10;
        equipFlags[] = {"vanilla"};
    };

    class Vanilla_CSAT_Arid : Vanilla_Base
    {
        side = "Inv";
        flagTexture = "A3\Data_F\Flags\Flag_CSAT_CO.paa";
        name = "A3 CSAT Arid";
        file = "Vanilla_AI_CSAT_Arid";
        climate[] = {"arid", "arctic"};
        shortName = "CSAT";
        lore = $STR_A3A_templates_lore_CSAT;
    };
    class Vanilla_CSAT_Temperate : Vanilla_CSAT_Arid
    {
        name = "A3 CSAT Temperate";
        file = "Vanilla_AI_CSAT_Enoch";
        climate[] = {"temperate","tropical"};
    };
    class Vanilla_CSAT_Apex : Vanilla_CSAT_Arid
    {
        name = "A3 CSAT Apex";
        file = "Vanilla_AI_CSAT_Apex";
        climate[] = {"tropical"};
        forceDLC[] = {"expansion"};
        lore = $STR_A3A_templates_lore_CSATApex;
    };
    class Vanilla_CSAT_Enoch : Vanilla_CSAT_Arid
    {
        name = "A3 CSAT Enoch";
        file = "Vanilla_AI_CSAT_Enoch";
        climate[] = {"temperate"};
        forceDLC[] = {"enoch"};
        lore = $STR_A3A_templates_lore_CSATEnoch;
    };

    class Vanilla_NATO_Arid : Vanilla_Base
    {
        side = "Occ";
        flagTexture = "\A3\Data_F\Flags\Flag_NATO_CO.paa";
        name = "A3 NATO Arid";
        file = "Vanilla_AI_NATO_Arid";
        climate[] = {"arid"};
        shortName = "NATO";
        lore = $STR_A3A_templates_lore_NATO;
    };
    class Vanilla_NATO_Tropical : Vanilla_NATO_Arid
    {
        name = "A3 NATO Tropical";
        file = "Vanilla_AI_NATO_Tropical";
        climate[] = {"tropical"};
    };
    class Vanilla_NATO_Temperate : Vanilla_NATO_Arid
    {
        name = "A3 NATO Temperate";
        file = "Vanilla_AI_NATO_Temperate";
        climate[] = {"temperate", "arctic"};
    };
    class Vanilla_NATO_Apex : Vanilla_NATO_Arid
    {
        name = "A3 NATO Apex";
        file = "Vanilla_AI_NATO_Apex";
        climate[] = {"tropical"};
        forceDLC[] = {"expansion"};
    };
    class Vanilla_NATO_UK_Tropical : Vanilla_NATO_Apex
    {
        flagTexture = "\A3\Data_F\Flags\flag_uk_co.paa";
        name = "A3 NATO/UK Tropical";
        file = "Vanilla_AI_NATO_UK_Tropical";
        climate[] = {"tropical"};
        forceDLC[] = {"expansion"};
        priority = 5;
        lore = $STR_A3A_templates_lore_NATOUK;
    };
    class Vanilla_NATO_UK_Temperate : Vanilla_NATO_UK_Tropical
    {
        name = "A3 NATO/UK Temperate";
        climate[] = {"temperate", "arctic"};
    };
    class Vanilla_NATO_UK_Arid : Vanilla_NATO_UK_Tropical
    {
        name = "A3 NATO/UK Arid";
        file = "Vanilla_AI_NATO_UK_Arid";
        climate[] = {"arid"};
        forceDLC[] = {"expansion"};
    };

    class Vanilla_LDF : Vanilla_Base
    {
        side = "Occ";
        flagTexture = "a3\data_f_enoch\flags\flag_enoch_co.paa";
        name = "A3 LDF";
        file = "Vanilla_AI_LDF";
        maps[] = {"enoch","vt7"};
        climate[] = {"temperate"};
        forceDLC[] = {"enoch"};
        shortName = "LDF";
        lore = $STR_A3A_templates_lore_LDF;
    };

    class Vanilla_AAF : Vanilla_Base
    {
        side = "Occ";
        flagTexture = "a3\data_f\flags\flag_aaf_co.paa";
        name = "A3 AAF";
        file = "Vanilla_AI_AAF";
        maps[] = {"altis"};
        climate[] = {"arid"};
        shortName = "AAF";
        lore = $STR_A3A_templates_lore_AAF;
    };
    class Vanilla_ION : Vanilla_Base
    {
        side = "Inv";
        flagTexture = "\A3\Data_F\Flags\flag_ion_CO.paa";
        name = "A3 ION";
        file = "Vanilla_AI_PMC";
        climate[] = {};
        forceDLC[] = {"enoch","expansion"};
        priority = 5;
        shortName = "ION";
        lore = $STR_A3A_templates_lore_ION;
    };

    class Vanilla_FIA : Vanilla_Base
    {
        side = "Reb";
        flagTexture = "a3\data_f\flags\flag_fia_co.paa";
        name = "A3 FIA";
        file = "Vanilla_Reb_FIA";
        shortName = "FIA";
        lore = $STR_A3A_templates_lore_FIA;
    };

    class Vanilla_SDK : Vanilla_Base
    {
        side = "Reb";
        flagTexture = "\A3\Data_F_exp\Flags\Flag_Synd_CO.paa";
        name = "A3 SDK";
        file = "Vanilla_Reb_SDK";
        maps[] = {"Tanoa"};
        climate[] = {"tropical"};
        forceDLC[] = {"expansion"};
        shortName = "SDK";
        lore = $STR_A3A_templates_lore_SDK;
    };

    class Vanilla_LFF : Vanilla_Base
    {
        side = "Reb";
        flagTexture = "\A3\Data_F_Enoch\Flags\flag_looters_co.paa";
        name = "A3 LFF";
        file = "Vanilla_Reb_LFF";
        maps[] = {"enoch","vt7"};
        climate[] = {"temperate"};
        forceDLC[] = {"enoch"};
        shortName = "LFF";
        lore = $STR_A3A_templates_lore_LFF;
    };
    class Vanilla_Civ : Vanilla_Base
    {
        side = "Civ";
        flagTexture = "a3\data_f\flags\flag_aaf_co.paa";
        name = "A3 Civilians";
        file = "Vanilla_Civ";
        shortName = "Civilian";
        lore = $STR_A3A_templates_lore_CIV;
    };

    // ***************************** Western Sahara *****************************
    class WS_Base : Vanilla_Base
    {
        requiredAddons[] = {"Weapons_1_F_lxWS"};
        logo = "\lxWS\data_f_lxWS\Logos\arma3_lxws_logo_ca.paa";
        basepath = QPATHTOFOLDER(Templates\Templates\WS); //the path to the template folder
        priority = 5;
        forceDLC[] = {"ws"};
        climate[] = {"arid"};
    };
    class WS_ION : WS_Base
    {
        side = "Inv";
        flagTexture = "\A3\Data_F\Flags\flag_ion_CO.paa";
        name = "WS ION";
        file = "WS_AI_ION";
        shortName = "ION";
        lore = $STR_A3A_templates_lore_WS_AI_ION;
    };
    class WS_SIFA : WS_Base
    {
        side = "Inv";
        flagTexture = "\lxws\data_f_lxws\img\flags\flag_SFIA_CO.paa";
        name = "WS SFIA";
        file = "WS_AI_SFIA";
        shortName = "SFIA";
        lore = $STR_A3A_templates_lore_WS_AI_SIFA;
    };
    class WS_ADF : WS_Base
    {
        side = "Occ";
        flagTexture = "\lxws\data_f_lxws\img\flags\flag_Argana_CO.paa";
        name = "WS ADF";
        file = "WS_AI_ADF";
        shortName = "ADF";
        lore = $STR_A3A_templates_lore_WS_AI_ADF;
    };
    class WS_CSAT : WS_Base
    {
        side = "Inv";
        flagTexture = "A3\Data_F\Flags\Flag_CSAT_CO.paa";
        name = "WS CSAT North Africa";
        file = "WS_AI_CSAT_NAfrica";
        shortName = "CSAT";
        lore = $STR_A3A_templates_lore_CSAT;
    };
    class WS_TURA : WS_Base
    {
        side = "Reb";
        flagTexture = "a3\data_f\flags\flag_fia_co.paa";
        name = "WS Tura";
        file = "WS_Reb_TURA";
        shortName = "Tura";
        lore = $STR_A3A_templates_lore_WS_Reb_Tura;
    };
    class WS_Civ : WS_Base
    {
        side = "Civ";
        flagTexture = "\lxws\data_f_lxws\img\flags\flag_Argana_CO.paa";
        name = "Western Sahara";
        file = "WS_Civ";
        shortName = "Civilian";
        lore = $STR_A3A_templates_lore_WS_CIV;
    };
    class WS_NATO : WS_Base
    {
        side = "Occ";
        flagTexture = "\A3\Data_F\Flags\Flag_NATO_CO.paa";
        name = "WS NATO Desert";
        file = "WS_AI_NATO_Desert";
        shortName = "NATO";
        lore = $STR_A3A_templates_lore_NATO;     
    };
	
    class EF_Base : Vanilla_Base
    {
        requiredAddons[] = {"EF_Data"};
        logo = "\ef\ef_data\logos\arma3_ef_logo_ca.paa";
        basepath = QPATHTOFOLDER(Templates\Templates\EF); //the path to the template folder
        priority = 5;
        forceDLC[] = {"ef"};
    };

    class EF_MJTF_Arid : EF_Base
    {
        side = "Occ";
        flagTexture = "\ef\ef_data\data\Flag_29thMEU_CO.paa";
        name = "EF MJTF Arid";
        file = "EF_AI_MJTF_Arid";
        shortName = "MJTF";
        lore = $STR_A3A_templates_lore_NATO;     
        climate[] = {"arid", "arctic"};
    };
    
    class EF_MJTF_Temperate : EF_MJTF_Arid
    {
        name = "EF MJTF Temperate";
        file = "EF_AI_MJTF_Temperate";  
        climate[] = {"temperate", "tropical"};
    };

    // ***************************** VN *****************************

    class VN_Base
    {
        requiredAddons[] = {"vn_weapons"};
        logo = "\vn\data_f_vietnam\logos\vn_sml_ca.paa";
        basepath = QPATHTOFOLDER(Templates\Templates\VN);
        priority = 20;
        equipFlags[] = {"lowTech","replaceCompass","replaceWatch"};
        forceDLC[] = {"vn"};
    };

    class VN_MACV : VN_Base
    {
        side = "Inv";
        flagTexture = "vn\objects_f_vietnam\flags\data\vn_flag_01_usa_co.paa";
        name = "VN MACV";
        file = "VN_AI_MACV";
        shortName = "MACV";
        lore = $STR_A3A_templates_lore_VN_AI_MACV;
    };

    class VN_PAVN : VN_Base
    {
        side = "Occ";
        flagTexture = "vn\objects_f_vietnam\flags\data\vn_flag_01_pavn_co.paa";
        name = "VN PAVN";
        file = "VN_AI_PAVN";
        shortName = "PAVN";
        lore = $STR_A3A_templates_lore_VN_AI_PAVN;
    };

    class VN_POF : VN_Base
    {
        side = "Reb";
        flagTexture = "vn\objects_f_vietnam\flags\data\vn_flag_01_lao_dmg_ca.paa";
        name = "VN POF";
        file = "VN_Reb_POF";
        shortName = "POF";
        lore = $STR_A3A_templates_lore_VN_Reb_POF;
    };

    class VN_Civ : VN_Base
    {
        side = "Civ";
        flagTexture = "\vn\objects_f_vietnam\flags\vn_flag_01_lao_co.paa";
        name = "Cam Lao Nam";
        file = "VN_Civ";
        shortName = "Civilian";
        lore = $STR_A3A_templates_lore_VN_Civ;
    };

    // ***************************** Aegis *****************************
    class Aegis_Base : Vanilla_Base
    {
        requiredAddons[] = {"A3_Aegis_Weapons_F_Aegis"};
        logo = "\A3_Aegis\Data_F_Aegis\Logos\arma3_aegis_logo_CA.paa";
        basepath = QPATHTOFOLDER(Templates\Templates\Aegis)
        priority = 25;
    };

    class Aegis_Iran : Aegis_Base
    {
        side = "Inv";
        flagTexture = "\A3_Aegis\Data_F_Aegis\Flags\flag_Iran_CO.paa";
        name = "Aegis Iran";
        file = "Aegis_AI_Iran";
        climate[] = {"arid", "arctic"};
    };
    class Aegis_China : Aegis_Iran
    {
        flagTexture = "\A3_Aegis\Data_F_Aegis\Flags\flag_China_CO.paa";
        name = "Aegis China";
        file = "Aegis_AI_China";
        climate[] = {"tropical"};
        forceDLC[] = {"expansion"};
    };
    class Aegis_Russia : Aegis_Iran
    {
        flagTexture = "a3_aegis\data_f_aegis\flags\flag_rus_co.paa";
        name = "Aegis Russia";
        file = "Aegis_AI_Russia";
        climate[] = {"temperate"};
        forceDLC[] = {"enoch"};
    };
    class Aegis_US_Arid : Aegis_Base
    {
        side = "Occ";
        flagTexture = "\A3_Aegis\data_f_aegis\Flags\flag_USA_51_CO.paa";
        name = "Aegis US Arid";
        file = "Aegis_AI_US_Arid";
        climate[] = {"arid"};
    };
    class Aegis_US_Tropical : Aegis_US_Arid
    {
        name = "Aegis US Tropical";
        file = "Aegis_AI_US_Tropical";
        climate[] = {"tropical"};
    };
    class Aegis_US_Temperate : Aegis_US_Arid
    {
        name = "Aegis US Temperate";
        file = "Aegis_AI_US_Temperate";
        climate[] = {"temperate", "arctic"};
    };
    class Aegis_BAF_Arid : Aegis_Base
    {
        side = "Occ";
        flagTexture = "\A3\Data_F\Flags\Flag_uk_CO.paa";
        name = "Aegis BAF Arid";
        file = "Aegis_AI_BAF_Arid";
        climate[] = {"arid"};
        forceDLC[] = {"enoch"};
    };
    class Aegis_BAF_Tropical : Aegis_BAF_Arid
    {
        name = "Aegis BAF Tropical";
        file = "Aegis_AI_BAF_Tropical";
        climate[] = {"tropical"};
        forceDLC[] = {"enoch"};
    };
    class Aegis_BAF_Temperate : Aegis_BAF_Arid
    {
        name = "Aegis BAF Temperate";
        file = "Aegis_AI_BAF_Temperate";
        climate[] = {"temperate", "arctic"};
        forceDLC[] = {"enoch"};
    };
    class Aegis_LDF : Aegis_Base
    {
        side = "Occ";
        flagTexture = "a3\data_f_enoch\flags\flag_enoch_co.paa";
        name = "Aegis LDF";
        file = "Aegis_AI_LDF";
        maps[] = {"enoch","vt7"};
        climate[] = {"temperate"};
        forceDLC[] = {"enoch"};
    };
    class Aegis_AAF : Aegis_Base
    {
        side = "Occ";
        flagTexture = "a3\data_f\flags\flag_aaf_co.paa";
        name = "Aegis AAF";
        file = "Aegis_AI_AAF";
        maps[] = {"altis"};
        climate[] = {"arid"};
    };

    class Aegis_FIA : Aegis_Base
    {
        side = "Reb";
        flagTexture = "a3\data_f\flags\flag_fia_co.paa";
        name = "Aegis FIA";
        file = "Aegis_Reb_FIA";
    };

    class Aegis_SDK : Aegis_Base
    {
        side = "Reb";
        flagTexture = "\A3\Data_F_exp\Flags\Flag_Synd_CO.paa";
        name = "Aegis SDK";
        file = "Aegis_Reb_SDK";
        maps[] = {"Tanoa"};
        climate[] = {"tropical"};
        forceDLC[] = {"expansion"};
    };

    class Aegis_Civ : Aegis_Base
    {
        side = "Civ";
        flagTexture = "a3\data_f\flags\flag_aaf_co.paa";
        name = "Aegis";
        file = "Aegis_Civ";
    };

    // ***************************** RHS *****************************

    class RHS_Base
    {
        requiredAddons[] = {"rhsgref_main"};
        basepath = QPATHTOFOLDER(Templates\Templates\RHS);
        logo = "\rhsusf\addons\rhsusf_main\data\rhs_logo_ca.paa";
        priority = 30;
    };

    class RHS_AFRF_Arid : RHS_Base
    {
        side = "Inv";
        flagTexture = "rhsafrf\addons\rhs_main\data\flag_rus_co.paa";
        logo = "\rhsafrf\addons\rhs_main\data\rhs_logo_ca.paa";
        name = "RHS AFRF Arid";
        file = "RHS_AI_AFRF_Arid";
        climate[] = {"arid"};
        shortName = "AFRF";
        lore = $STR_A3A_templates_lore_AFRF;
    };
    class RHS_AFRF_Temperate : RHS_AFRF_Arid
    {
        name = "RHS AFRF Temperate";
        file = "RHS_AI_AFRF_Temperate";
        climate[] = {"temperate","tropical","arctic"};
    };

    class RHS_VDV_Temperate : RHS_Base
    {
        side = "Inv"; 
        flagTexture = "rhsafrf\addons\rhs_main\data\Flag_vdv_CO.paa"; 
        name = "RHS VDV Temperate"; 
        file = "RHS_AI_VDV_Temperate"; 
        climate[] = {"temperate","tropical","arctic"};
        logo = "\rhsafrf\addons\rhs_main\data\rhs_logo_ca.paa";
        shortName = "VDV";
        lore = $STR_A3A_templates_lore_VDV;
    };

    class RHS_VDV_Arid : RHS_VDV_Temperate
    {
        name = "RHS VDV Arid"; 
        file = "RHS_AI_VDV_Arid"; 
        climate[] = {"arid"};
    };

    class RHS_CHDKZ : RHS_Base
    {
        side = "Inv";
        flagTexture = "rhsgref\addons\rhsgref_main\data\flag_chdkz_co.paa";
        name = "RHS ChDKZ";
        file = "RHS_AI_ChDKZ";
        maps[] = {"chernarus_summer","chernarus_winter","chernarus"};
        logo = "\rhsgref\addons\rhsgref_main\data\rhs_logo_ca.paa";
        shortName = "ChDKZ";
        lore = $STR_A3A_templates_lore_RHS_AI_ChDKZ;
    };
    class RHS_HIDF : RHS_Base
    {
        side = "Occ";
        flagTexture = "\A3\Data_F_Exp\Flags\flag_GEN_CO.paa";
        name = "RHS HIDF";
        file = "RHS_AI_HIDF";
        maps[] = {"Tanoa"};
        climate[] = {"tropical"};
        logo = "\rhsgref\addons\rhsgref_main\data\rhs_logo_ca.paa";
        shortName = "HIDF";
        lore = $STR_A3A_templates_lore_3CB_AI_HIDF;
    };
    
    class RHS_TLA : RHS_Base
    {
        side = "Inv";
        flagTexture = "\rhsafrf\addons\rhs_main\data\Flag_trn_CO.paa";
        name = "RHS TLA";
        file = "RHS_AI_TLA";
        maps[] = {"Tanoa"};
        climate[] = {"tropical"};
        logo = "\rhsgref\addons\rhsgref_main\data\rhs_logo_ca.paa";
        shortName = "TLA";
        lore = $STR_A3A_templates_lore_TLA;
    };
    
    class RHS_CDF : RHS_Base
    {
        side = "Occ";
        flagTexture = "\rhsgref\addons\rhsgref_main\data\Flags\flag_cdf_co.paa";
        name = "RHS CDF";
        file = "RHS_AI_CDF";
        maps[] = {"chernarus_summer","chernarus_winter","chernarus"};
        shortName = "CDF";
        lore = $STR_A3A_templates_lore_CDF;
    };

    class RHS_USAF_Army_Arid : RHS_Base
    {
        side = "Occ";
        flagTexture = "a3\data_f\flags\flag_us_co.paa";
        name = "RHS US Army Arid";
        file = "RHS_AI_USAF_Army_Arid";
        climate[] = {"arid"};
        shortName = "US Army";
        lore = $STR_A3A_templates_lore_USAF;
    };
    class RHS_USAF_Army_Temperate : RHS_USAF_Army_Arid
    {
        name = "RHS US Army Temperate";
        file = "RHS_AI_USAF_Army_Temperate";
        climate[] = {"temperate","tropical","arctic"};
    };
    class RHS_USAF_Marines_Arid : RHS_USAF_Army_Arid
    {
        name = "RHS USMC Arid";
        file = "RHS_AI_USAF_Marines_Arid";
        shortName = "US Marines";
        lore = $STR_A3A_templates_lore_USMC;
    };
    class RHS_USAF_Marines_Temperate : RHS_USAF_Army_Temperate
    {
        name = "RHS USMC Temperate";
        file = "RHS_AI_USAF_Marines_Temperate";
    };

    class RHS_NAPA : RHS_Base
    {
        side = "Reb";
        flagTexture = "\rhsgref\addons\rhsgref_main\data\Flags\flag_NAPA_co.paa";
        name = "RHS NAPA";
        file = "RHS_Reb_NAPA";
        shortName = "NAPA";
        lore = $STR_A3A_templates_lore_NAPA;
    };

    class RHS_Civ : RHS_Base
    {
        side = "Civ";
        flagTexture = "a3\data_f\flags\flag_fia_co.paa";
        name = "RHS";
        file = "RHS_Civ";
        shortName = "Civilian";
        lore = $STR_A3A_templates_lore_CIV;
    };

    class RHS_SAF_Base
    {
        requiredAddons[] = {"rhssaf_main"};
        basepath = QPATHTOFOLDER(Templates\Templates\RHS);
        logo = "\rhssaf\addons\rhssaf_main\data\rhs_logo_ca.paa";
        priority = 30;
    };
    class RHS_SAF : RHS_SAF_Base
    {
        side = "Inv";
        flagTexture = "rhssaf\addons\rhssaf_main\data\flags\flag_serbia_co.paa";
        name = "RHS SAF";
        file = "RHS_AI_SAF";
        shortName = "SAF";
        lore = $STR_A3A_templates_lore_RHS_AI_SAF;
    };
	

    //************* SFP ********************************************************
    class SFP_Base
    {
        requiredAddons[] = {"Swedish_Forces_Pack","CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs", "CUP_AirVehicles_Core"};
        basepath = QPATHTOFOLDER(Templates\Templates\SFP);
        logo = "\sfp_config\data\logos\sfp_logo_ca.paa";
	    flagTexture = "\sfp_config\data\flag_sweden_co.paa";
        priority = 70;
        shortName = "SDF";
    };
    class SFP_SAF00 : SFP_Base
    {
	    side = "Occ";
        name = "SFP Early SDF";
        file = "SFP_AI_SWE_early";
        climate[] = {"temperate","tropical","arid"};
        lore = $STR_A3A_templates_lore_SFP_SAF00;
    };
    class SFP_SAF00_Arctic : SFP_Base
    {
	    side = "Occ";
        name = "SFP Early SDF ARCTIC";
        file = "SFP_AI_SWE_early_snow";
        climate[] = {"arctic"};
        lore = $STR_A3A_templates_lore_SFP_SAF00;
    };
    class SFP_SAF15 : SFP_Base
    {
	    side = "Occ";
        name = "SFP Modern SDF";
        file = "SFP_AI_SWE";
        climate[] = {"temperate","tropical","arid"};
        lore = $STR_A3A_templates_lore_SFP_SAF15;
    };
    class SFP_SAF15_Arctic : SFP_Base
    {
	    side = "Occ";
        name = "SFP Modern SDF ARCTIC";
        file = "SFP_AI_SWE_snow";
        climate[] = {"arctic"};
        lore = $STR_A3A_templates_lore_SFP_SAF15;
    };
    //************* 3CB Factions ***************************************************

    class 3CBF_Base
    {
        requiredAddons[] = {"UK3CB_Factions_Vehicles_SUV"};
        basepath = QPATHTOFOLDER(Templates\Templates\3CB);
        logo = QPATHTOFOLDER(Templates\Templates\3CB\logo_small_3cb_ca.paa);            // unknown, may need rethink
        priority = 40;
    };
    
    class 3CBF_CSAT_Base : 3CBF_Base
    {
        basepath = QPATHTOFOLDER(Templates\Templates\3CB\3CB_CSAT);
    };
    
    class 3CB_CSAT_BRU : 3CBF_CSAT_Base {
        side = "Inv";
        //Belarusian CSAT - proper camo for: temperate, arctic - suitable for: tropical and arid
        climate[] = {"temperate","tropical","arctic","arid"};
        maps[] = {"enoch","vt7"};
        flagTexture = "uk3cb_factions\addons\uk3cb_factions_cst\flag\csat_w_regiment_flag_co.paa";
        name = "3CB CSAT BEAR";
        file = "3CB_AI_CSAT_Bru";
    };
    
    class 3CB_CSAT_CHI : 3CBF_CSAT_Base {
        side = "Inv";
        //Chinese CSAT - proper camo for: tropical - Suitable for: temperate
        climate[] = {"temperate","tropical"};
        maps[] = {"tanoa"};
        flagTexture = "uk3cb_factions\addons\uk3cb_factions_cst\flag\csat_g_regiment_flag_co.paa";
        name = "3CB CSAT VIPER";
        file = "3CB_AI_CSAT_Chi";
    };
    
    class 3CB_CSAT_FRE : 3CBF_CSAT_Base {
        side = "Inv";
        //African CSAT - proper camo for: arid - ok for: temperate
        climate[] = {"arid"};
        maps[] = {"malden"};
        flagTexture = "uk3cb_factions\addons\uk3cb_factions_cst\flag\csat_a_regiment_flag_co.paa";
        name = "3CB CSAT SCIMITAR";
        file = "3CB_AI_CSAT_Fre";
    };
    
    class 3CB_CSAT_PER : 3CBF_CSAT_Base {
        side = "Inv";
        //Iranian CSAT - proper camo for: arid, temperate - suitable for: arctic - ok for: tropical
        climate[] = {"temperate","tropical","arctic","arid"};
        maps[] = {"altis"};
        flagTexture = "uk3cb_factions\addons\uk3cb_factions_cst\flag\csat_b_regiment_flag_co.paa";
        name = "3CB CSAT GRYPHON";
        file = "3CB_AI_CSAT_Per";
    };

    class 3CBF_ADA : 3CBF_Base
    {
        side = "Inv";
        flagTexture = "uk3cb_factions\addons\uk3cb_factions_adc\flag\adc_flag_co.paa";
        name = "3CB ADA";
        file = "3CB_AI_ADA";
        climate[] = {"arid"};
        shortName = "ADA";
        lore = $STR_A3A_templates_lore_3CB_AI_ADA;
    };

    class 3CBF_ANA : 3CBF_Base
    {
        side = "Occ";
        flagTexture = "uk3cb_factions\addons\uk3cb_factions_ana\flag\afg_13_flag_co.paa";
        name = "3CB ANA";
        file = "3CB_AI_ANA";
        climate[] = {"arid"};
        shortName = "ANA";
        lore = $STR_A3A_templates_lore_3CB_AI_ANA;
    };

    class 3CBF_CW_SOV : 3CBF_Base
    {
        side = "Inv";
        flagTexture = "uk3cb_factions\addons\uk3cb_factions_cw_sov\flag\cw_sov_army_flag_co.paa";
        name = "3CB Cold War USSR";
        file = "3CB_AI_CW_Sov";
        climate[] = {"temperate","tropical","arctic"};
        shortName = "CW SOV";
        lore = $STR_A3A_templates_lore_3CB_AI_CW_Sov;
    };

    class 3CBF_CW_US : 3CBF_Base
    {
        side = "Occ";
        flagTexture = "a3\data_f\flags\flag_us_co.paa";
        name = "3CB Cold War US";
        file = "3CB_AI_CW_US";
        climate[] = {"temperate","tropical","arctic"};
        shortName = "CW US";
        lore = $STR_A3A_templates_lore_3CB_AI_CW_US;
    };

    class 3CBF_HIDF : 3CBF_Base
    {
        side = "Occ";
        flagTexture = "a3\data_f_exp\flags\flag_tanoa_co.paa";
        name = "3CB HIDF";
        file = "3CB_AI_HIDF";
        maps[] = {"tanoa"};
        climate[] = {"temperate","tropical","arctic"};
        shortName = "HIDF";
        lore = $STR_A3A_templates_lore_3CB_AI_HIDF;
    };

    class 3CBF_MDF : 3CBF_Base
    {
        side = "Occ";
        flagTexture = "uk3cb_factions\addons\uk3cb_factions_mdf\flag\mal_flag_co.paa";
        name = "3CB MDF";
        file = "3CB_AI_MDF";
        maps[] = {"malden"};
        climate[] = {"arid"};
        shortName = "MDF";
        lore = $STR_A3A_templates_lore_3CB_AI_MDF;
    };

    class 3CBF_TKA_East : 3CBF_Base
    {
        side = "Inv";
        flagTexture = "UK3CB_Factions\addons\UK3CB_Factions_TKA\Flag\tka_flag_co.paa";
        name = "3CB TKA East";
        file = "3CB_AI_TKA_East";
        maps[] = {"takistan","tem_anizay","kunduz"};
        climate[] = {"arid"};
        shortName = "TKA East";
        lore = $STR_A3A_templates_lore_3CB_AI_TKA_East;
    };
    class 3CBF_TKA_West : 3CBF_TKA_East
    {
        side = "Occ";
        name = "3CB TKA West";
        file = "3CB_AI_TKA_West";
        shortName = "TKA West";
        lore = $STR_A3A_templates_lore_3CB_AI_TKA_West;
    };
    class 3CBF_TKA_Mix : 3CBF_TKA_East
    {
        side = "Occ";
        name = "3CB TKA Mix";
        file = "3CB_AI_TKA_Mix";
        priority = 39;               // not default anywhere
        shortName = "TKA Mix";
        lore = $STR_A3A_templates_lore_3CB_AI_TKA_Mix;
    };

    class 3CBF_AAF : 3CBF_Base
    {
        side = "Occ";
        flagTexture = "a3\data_f\flags\flag_aaf_co.paa";
        name = "3CB AAF";
        file = "3CB_AI_AAF";
        maps[] = {"altis"};
        climate[] = {"arid"};
        shortName = "AAF";
        lore = $STR_A3A_templates_lore_3CB_AAF;
    };
    class 3CBF_AAF_arid : 3CBF_Base
    {
        side = "Occ";
        flagTexture = "a3\data_f\flags\flag_aaf_co.paa";
        name = "3CB AAF Brown";
        file = "3CB_AI_AAF_arid";
        maps[] = {"altis"};
        climate[] = {"arid"};
        shortName = "AAF";
        lore = $STR_A3A_templates_lore_3CB_AAF;
    };

    class 3CBF_LDF : 3CBF_Base
    {
        side = "Occ";
        flagTexture = "a3\data_f_enoch\flags\flag_enoch_co.paa";
        name = "3CB LDF";
        file = "3CB_AI_LDF";
        maps[] = {"enoch","vt7"};
        climate[] = {"temperate"};
        shortName = "LDF";
        lore = $STR_A3A_templates_lore_3CB_AI_LDF;
    };

    class 3CBF_KRG : 3CBF_Base
    {
        side = "Occ";
        flagTexture = "uk3cb_factions\addons\uk3cb_factions_krg\flag\krg_flag_co.paa";
        name = "3CB KRG";
        file = "3CB_AI_KRG";
        climate[] = {"arid"};
        shortName = "KRG";
        lore = $STR_A3A_templates_lore_3CB_AI_KRG;
    };
    class 3CBF_ION_Arid : 3CBF_Base
    {
        side = "Inv";
        flagTexture = "uk3cb_factions\addons\uk3cb_factions_ion\flag\ion_flag_co.paa";
        name = "3CB ION Arid";
        file = "3CB_AI_ION_Arid";
        climate[] = {"arid"};
        shortName = "ION";
        lore = $STR_A3A_templates_lore_ION;
    };
        class 3CBF_ION_Temperate : 3CBF_ION_Arid
    {
        name = "3CB ION Temperate";
        file = "3CB_AI_ION_Temperate";
        climate[] = {"temperate","tropical"};
    };
        class 3CBF_ION_Arctic : 3CBF_ION_Arid
    {
        name = "3CB ION Arctic";
        file = "3CB_AI_ION_Arctic";
        climate[] = {"arctic"};
    };
    class 3CBF_CCM : 3CBF_Base
    {
        side = "Reb";
        flagTexture = "\UK3CB_Factions\addons\UK3CB_Factions_CCM\Flag\ccm_i_flag_co.paa";
        name = "3CB CCM";
        file = "3CB_Reb_CNM";
        shortName = "CCM";
        lore = $STR_A3A_templates_lore_3CB_Reb_CCM;
    };
    class 3CB_Reb_ION : 3CBF_Base
    {
        side = "Reb";
        flagTexture = "uk3cb_factions\addons\uk3cb_factions_ion\flag\ion_flag_co.paa";
        name = "3CB ION";
        file = "3CB_Reb_ION";
        shortName = "ION";
        lore = $STR_A3A_templates_lore_3CB_Reb_ION;
    };
    class 3CBF_TKM : 3CBF_Base
    {
        side = "Reb";
        flagTexture = "uk3cb_factions\addons\uk3cb_factions_tkm\flag\tkm_b_flag_co.paa";
        name = "3CB TKM";
        file = "3CB_Reb_TKM";
        maps[] = {"takistan","tem_anizay","kunduz"};
        shortName = "TKM";
        lore = $STR_A3A_templates_lore_TKM;
    };
    class 3CB_Reb_FIA : 3CBF_Base
    {
        side = "Reb";
        flagTexture = "a3\data_f\flags\flag_fia_co.paa";
        name = "3CB FIA";
        file = "3CB_Reb_FIA";
        shortName = "FIA";
        lore = $STR_A3A_templates_lore_FIA;
    };
    class 3CB_Reb_LSM : 3CBF_Base
    {
        side = "Reb";
        flagTexture = "\UK3CB_Factions\addons\UK3CB_Factions_LSM\Flag\LSM_flag_co.paa";
        name = "3CB LSM";
        file = "3CB_Reb_LSM";
        maps[] = {"enoch"};
        shortName = "LSM";
        lore = $STR_A3A_templates_lore_3CB_Reb_LSM;
    };
    class 3CBF_CHC : 3CBF_Base
    {
        side = "Civ";
        flagTexture = "a3\data_f\flags\flag_fia_co.paa";
        name = "3CB Cherno";
        file = "3CB_Civ_CHC";
        shortName = "Civilian";
        lore = $STR_A3A_templates_lore_CHC;
    };

    class 3CBF_TKC : 3CBF_Base
    {
        side = "Civ";
        flagTexture = "a3\data_f\flags\flag_fia_co.paa";
        name = "3CB Takistan";
        file = "3CB_Civ_TKC";
        maps[] = {"takistan","tem_anizay","kunduz"};
        shortName = "Civilian";
        lore = $STR_A3A_templates_lore_TKC;
    };

    // ***************************** 3CB BAF *****************************

    class 3CBBAF_Base
    {
        requiredAddons[] = {"UK3CB_BAF_Weapons","UK3CB_BAF_Vehicles","UK3CB_BAF_Units_Common","UK3CB_BAF_Equipment","rhsgref_main"};
        //requiredAddons[] = {"UK3CB_BAF_Units_Common"};              // has weapons/equipment/vehicles dependencies
        basepath = QPATHTOFOLDER(Templates\Templates\3CB);
        logo = "\UK3CB_BAF_Weapons\addons\UK3CB_BAF_Weapons_Ammo\data\ui\logo_small_3cb_ca.paa";
        priority = 50;
    };

    class 3CBBAF_Arid : 3CBBAF_Base
    {
        side = "Occ";
        flagTexture = "\A3\Data_F\Flags\flag_uk_co.paa";
        name = "3CB BAF Arid";
        file = "3CB_AI_BAF_Arid";
        climate[] = {"arid"};
        shortName = "BAF";
        lore = $STR_A3A_templates_lore_BAF;
    };
    class 3CBBAF_Arctic : 3CBBAF_Arid
    {
        name = "3CB BAF Arctic";
        file = "3CB_AI_BAF_Arctic";
        climate[] = {"arctic"};
    };
    class 3CBBAF_Temperate : 3CBBAF_Arid
    {
        name = "3CB BAF Temperate";
        file = "3CB_AI_BAF_Temperate";
        climate[] = {"temperate"};
    };
    class 3CBBAF_Tropical : 3CBBAF_Arid
    {
        name = "3CB BAF Tropical";
        file = "3CB_AI_BAF_Tropical";
        climate[] = {"tropical"};
    };

    // ***************************** CUP *****************************

    class CUP_Base
    {
        requiredAddons[] = {"CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs", "CUP_AirVehicles_Core"};        // units, weapons, vehicles
        //requiredAddons[] = {"CUP_AirVehicles_Core"};        // vehicles requires units & weapons
        basepath = QPATHTOFOLDER(Templates\Templates\CUP);
        logo = "\CUP\Creatures\People\CUP_Creatures_People_Core\ui\logo_cup_ca_small.paa";
        priority = 60;
    };

    class CUP_ACR_Arid : CUP_Base
    {
        side = "Occ";
        flagTexture = "cup\baseconfigs\cup_baseconfigs\data\flags\flag_cz_co.paa";
        name = "CUP ACR Arid";
        file = "CUP_AI_ACR_Arid";
        climate[] = {"arid"};
        shortName = "ACR";
        lore = $STR_A3A_templates_lore_ACR;
    };
    class CUP_ACR_Temperate : CUP_ACR_Arid
    {
        name = "CUP ACR Temperate";
        file = "CUP_AI_ACR_Temperate";
        climate[] = {"temperate","tropical","arctic"};
    };

    class CUP_AFRF_Arid : CUP_Base
    {
        side = "Inv";
        flagTexture = "\CUP\BaseConfigs\CUP_BaseConfigs\data\Flags\flag_rus_co.paa";
        name = "CUP AFRF Arid";
        file = "CUP_AI_AFRF_Arid";
        climate[] = {"arid"};
        shortName = "AFRF";
        lore = $STR_A3A_templates_lore_AFRF;
    };
    class CUP_AFRF_Temperate : CUP_AFRF_Arid
    {
        name = "CUP AFRF Temperate";
        file = "CUP_AI_AFRF_Temperate";
        climate[] = {"temperate","tropical"};
    };
    class CUP_AFRF_Arctic : CUP_AFRF_Arid
    {
        name = "CUP AFRF Arctic";
        file = "CUP_AI_AFRF_Arctic";
        climate[] = {"arctic"};
    };
    class CUP_AFRF_Desert : CUP_AFRF_Arid
    {
        name = "CUP AFRF Desert";
        file = "CUP_AI_AFRF_Desert";
        climate[] = {"arid"};
    };

    class CUP_BAF_Arid : CUP_Base
    {
        side = "Occ";
        flagTexture = "\A3\Data_F\Flags\flag_uk_co.paa";
        name = "CUP BAF Arid";
        file = "CUP_AI_BAF_Arid";
        climate[] = {"arid"};
        shortName = "BAF";
        lore = $STR_A3A_templates_lore_BAF;
    };
    class CUP_BAF_Temperate : CUP_BAF_Arid
    {
        name = "CUP BAF Temperate";
        file = "CUP_AI_BAF_Temperate";
        climate[] = {"temperate","tropical","arctic"};
    };

    class CUP_CDF_Arctic : CUP_Base
    {
        side = "Occ";
        flagTexture = "cup\baseconfigs\cup_baseconfigs\data\flags\flag_cdf_co.paa";
        name = "CUP CDF Arctic";
        file = "CUP_AI_CDF_Arctic";
        climate[] = {"arctic"};
        maps[] = {"chernarus_winter"};
        shortName = "CDF";
        lore = $STR_A3A_templates_lore_CDF;
    };
    class CUP_CDF_Temperate : CUP_CDF_Arctic
    {
        name = "CUP CDF Temperate";
        file = "CUP_AI_CDF_Temperate";
        climate[] = {"temperate"};
        maps[] = {"chernarus_summer","chernarus"};
    };

    class CUP_RACS_Arid : CUP_Base
    {
        side = "Occ";
        flagTexture = "\CUP\BaseConfigs\CUP_BaseConfigs\data\Flags\flag_racs_co.paa";
        name = "CUP RACS Arid";
        file = "CUP_AI_RACS_Arid";
        climate[] = {"arid"};
        maps[] = {"sara"};
        shortName = "RACS";
        lore = $STR_A3A_templates_lore_CUP_AI_RACS;
    };
    class CUP_RACS_Tropical : CUP_RACS_Arid
    {
        name = "CUP RACS Tropical";
        file = "CUP_AI_RACS_Tropical";
        climate[] = {"tropical"};
        maps[] = {"tanoa"};
    };

    class CUP_SLA : CUP_Base
    {
        side = "Inv";
        flagTexture = "\CUP\BaseConfigs\CUP_BaseConfigs\data\Flags\flag_sla_co.paa";
        name = "CUP SLA";
        file = "CUP_AI_SLA_Temperate";          // Sahrani is a bit weird
        climate[] = {"arid","temperate"};
        maps[] = {"sara"};
        shortName = "SLA";
        lore = $STR_A3A_templates_lore_CUP_AI_SLA;
    };

    class CUP_TKA : CUP_Base
    {
        side = "Occ";
        flagTexture = "\CUP\BaseConfigs\CUP_BaseConfigs\data\Flags\flag_tka_co.paa";
        name = "CUP TKA";
        file = "CUP_AI_TKA_Arid";
        climate[] = {"arid"};
        maps[] = {"takistan","kunduz"};
        shortName = "TKA";
        lore = $STR_A3A_templates_lore_CUP_AI_TKA;
    };

    class CUP_USAF_Arid : CUP_Base
    {
        side = "Inv";
        flagTexture = "a3\data_f\flags\flag_us_co.paa";
        name = "CUP US Army Arid";
        file = "CUP_AI_US_Army_Arid";
        climate[] = {"arid"};
        shortName = "US Army";
        lore = $STR_A3A_templates_lore_USAF;
    };
    class CUP_USAF_Temperate : CUP_USAF_Arid
    {
        name = "CUP US Army Temperate";
        file = "CUP_AI_US_Army_Temperate";
        climate[] = {"temperate","tropical","arctic"};
    };

    class CUP_USMC_Arid : CUP_Base
    {
        side = "Inv";
        flagTexture = "a3\data_f\flags\flag_us_co.paa";
        name = "CUP USMC Arid";
        file = "CUP_AI_US_Marine_Arid";
        climate[] = {"arid"};
        shortName = "US Marines";
        lore = $STR_A3A_templates_lore_USMC;
    };
    class CUP_USMC_Temperate : CUP_USMC_Arid
    {
        name = "CUP USMC Temperate";
        file = "CUP_AI_US_Marine_Temperate";
        climate[] = {"temperate","tropical","arctic"};
    };

    class CUP_ION_Arid : CUP_Base
    {
        side = "Occ";
        flagTexture = "\A3\Data_F\Flags\flag_ion_CO.paa";
        name = "CUP ION Arid";
        file = "CUP_AI_ION_Arid";
        climate[] = {"arid","temperate","tropical"};
        shortName = "ION";
        lore = $STR_A3A_templates_lore_ION;
    };
    class CUP_ION_Temperate : CUP_ION_Arid
    {
        name = "CUP ION Arctic";
        file = "CUP_AI_ION_Arctic";
        climate[] = {"arctic"};
    };

    class CUP_BW_Arid : CUP_Base
    {
        side = "Occ";
        flagTexture = "cup\baseconfigs\cup_baseconfigs\data\flags\flag_ger_co.paa";
        name = "CUP BW Arid";
        file = "CUP_AI_BW_Arid";
        climate[] = {"arid"};
        shortName = "BW";
        lore = $STR_A3A_templates_lore_CUP_AI_BW;
    };
        class CUP_BW_Temperate : CUP_BW_Arid
    {
        name = "CUP BW Temperate";
        file = "CUP_AI_BW_Temperate";
        climate[] = {"arctic","temperate","tropical"};
    };
        class CUP_HIL : CUP_Base
    {
        side = "Occ";
        flagTexture = "a3\data_f_exp\flags\flag_tanoa_co.paa";
        name = "CUP HIL";
        file = "CUP_AI_HIL";
        climate[] = {"temperate","tropical"};
        shortName = "HIL";
        lore = $STR_A3A_templates_lore_CUP_AI_HIL;
    };
    class CUP_TKM : CUP_Base
    {
        side = "Reb";
        flagTexture = "\CUP\BaseConfigs\CUP_BaseConfigs\data\Flags\flag_tka_co.paa";
        name = "CUP TKM";
        file = "CUP_Reb_TKM";
        shortName = "TKM";
        lore = $STR_A3A_templates_lore_TKM;
    };
    class CUP_Reb : CUP_Base
    {   // why is this just Reb?
        side = "Reb"; 
        flagTexture = "cup\baseconfigs\cup_baseconfigs\data\flags\flag_napa_co.paa";
        name = "CUP NAPA";
        file = "CUP_Reb_NAPA";
        shortName = "NAPA";
        lore = $STR_A3A_templates_lore_NAPA;
    };
    class CUP_TKC : CUP_Base
    {
        side = "Civ";
        flagTexture = "\CUP\BaseConfigs\CUP_BaseConfigs\data\Flags\flag_tka_co.paa";
        name = "CUP TKC";
        file = "CUP_Civ_TKC";
        shortName = "Civilian";
        lore = $STR_A3A_templates_lore_TKC;
    };
    class CUP_Civ : CUP_Base
    {
        side = "Civ";
        flagTexture = "\CUP\BaseConfigs\CUP_BaseConfigs\data\Flags\flag_chernarus_co.paa";
        name = "CUP CH";
        file = "CUP_Civ_CHC";
        shortName = "Civilian";
        lore = $STR_A3A_templates_lore_CHC;
    };

    //***************************** Unsung *****************************

    class UNS_Base
    {
        requiredAddons[] = {"uns_weap_w"};
        basepath = QPATHTOFOLDER(Templates\Templates\UNS);
        logo = "\uns_main\data\unsung_logo.paa";
        priority = 70;
        equipFlags[] = {"lowTech"};
    };

    class UNS_US : UNS_Base
    {
        side = "Inv";
        flagTexture = "a3\data_f\flags\flag_us_co.paa";
        name = "Unsung US";
        file = "UNS_AI_US";
        shortName = "US";
        lore = $STR_A3A_templates_lore_UNS_AI_US;
    };

    class UNS_PAVN : UNS_Base
    {
        side = "Occ";
        flagTexture = "\uns_flags\flag_pavn_co.paa";
        name = "Unsung PAVN";
        file = "UNS_AI_PAVN";
        shortName = "PAVN";
        lore = $STR_A3A_templates_lore_UNS_AI_PAVN;
    };

    class UNS_VC : UNS_Base
    {
        side = "Reb";
        flagTexture = "\uns_flags\flag_vc_co.paa";
        name = "Unsung VC";
        file = "UNS_Reb_VC";
        shortName = "VC";
        lore = $STR_A3A_templates_lore_UNS_Reb_VC;
    };

    class UNS_Civ : UNS_Base
    {
        side = "Civ";
        flagTexture = "a3\data_f\flags\flag_fia_co.paa";
        name = "Unsung civs";
        file = "UNS_Civ";
        shortName = "Civilian";
        lore = $STR_A3A_templates_lore_VN_Civ;
    };

    // ***************************** Global Mobilization *****************************

    class GM_Base
    {
        requiredAddons[] = {"gm_weapons_items","CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs", "CUP_AirVehicles_Core"};
        basepath = QPATHTOFOLDER(Templates\Templates\GM);
        logo = "\gm\gm_core\data\logos\gm_logo_ca.paa";
        priority = 80;
        equipFlags[] = {"specialGM"};
        forceDLC[] = {"gm"};
    };

    class GM_NVA : GM_Base
    {
        side = "Inv";
        flagTexture = "\gm\gm_core\data\flags\gm_flag_gc_co";
        name = "GM NVA Temperate";
        file = "GM_AI_NVA";
        climate[] = {"temperate","tropical"};
        shortName = "NVA";
        lore = $STR_A3A_templates_lore_GM_AI_NVA;
    };

    class GM_NVA_Arctic : GM_Base
    {
        side = "Inv";
        flagTexture = "\gm\gm_core\data\flags\gm_flag_gc_co";
        name = "GM NVA Arctic";
        file = "GM_AI_NVA_arctic";
        climate[] = {"arctic"};
        shortName = "NVA";
        lore = $STR_A3A_templates_lore_GM_AI_NVA;
    };

    class GM_NVA_Desert : GM_Base
    {
        side = "Inv";
        flagTexture = "\gm\gm_core\data\flags\gm_flag_gc_co";
        name = "GM NVA Desert";
        file = "GM_AI_NVA_desert";
        climate[] = {"arid"};
        shortName = "NVA";
        lore = $STR_A3A_templates_lore_GM_AI_NVA;
    };

    class GM_BW : GM_Base
    {
        side = "Occ";
        flagTexture = "\gm\gm_core\data\flags\gm_flag_ge_co";
        name = "GM BW Temperate";
        file = "GM_AI_BW";
        climate[] = {"temperate","tropical"};
        shortName = "BW";
        lore = $STR_A3A_templates_lore_GM_AI_BW;
    };

    class GM_BW_Arctic : GM_Base
    {
        side = "Occ";
        flagTexture = "\gm\gm_core\data\flags\gm_flag_ge_co";
        name = "GM BW Arctic";
        file = "GM_AI_BW_arctic";
        climate[] = {"arctic"};
        shortName = "BW";
        lore = $STR_A3A_templates_lore_GM_AI_BW;
    };

    class GM_BW_Desert : GM_Base
    {
        side = "Occ";
        flagTexture = "\gm\gm_core\data\flags\gm_flag_ge_co";
        name = "GM BW Desert";
        file = "GM_AI_BW_desert";
        climate[] = {"arid"};
        shortName = "BW";
        lore = $STR_A3A_templates_lore_GM_AI_BW;
    };

    class GM_Reb : GM_Base
    {
        side = "Reb";
        flagTexture = "a3\data_f\flags\flag_fia_co.paa";
        name = "GM FIA";
        file = "GM_Reb";
        shortName = "FIA";
        lore = $STR_A3A_templates_lore_GM_Reb;
    };

    class GM_Civ : GM_Base
    {
        side = "Civ";
        flagTexture = "a3\data_f\flags\flag_fia_co.paa";
        name = "GM civs";
        file = "GM_Civ";
        shortName = "Civilian";
        lore = $STR_A3A_templates_lore_GM_Civ;
    };

    // ***************************** BWA3 *****************************

    class BWA3_Base
    {
        requiredAddons[] = {"bwa3_common"};
        basepath = QPATHTOFOLDER(Templates\Templates\BWA3);
        logo = QPATHTOFOLDER(Templates\Templates\BWA3\bwa3_logo.paa);
        priority = 65;
    };

    class BWA3_BW_Arid : BWA3_Base
    {
        side = "Occ";
        flagTexture = "bwa3_common\data\bwa3_flag_germany_co.paa";
        name = "BWA3 BW Arid";
        file = "BWA3_AI_BW_Arid";
        climate[] = {"arid"};
        shortName = "BW";
        lore = $STR_A3A_templates_lore_BWA3_AI_BW;
    };
    class BWA3_BW_Temperate : BWA3_BW_Arid
    {
        name = "BWA3 BW Temperate";
        file = "BWA3_AI_BW_Temperate";
        climate[] = {"temperate","tropical","arctic"};
    };
    
    // ***************************** Spe *****************************
/*    //Commented out as no vehiclesPlanesTransport exist and the templates don't work without them
    class SPE_Base
    {
        requiredAddons[] = {"ww2_spe_assets_c_characters_germans_c"};
        basepath = QPATHTOFOLDER(Templates\Templates\SPE);
        logo = QPATHTOFOLDER(Templates\Templates\SPE\spe_logo.paa);
        priority = 80;
        equipFlags[] = {"lowTech"};
        forceDLC[] = {"spe"};
    };

    class SPE_US : SPE_Base
    {
        side = "Inv";
        flagTexture = QPATHTOFOLDER(Templates\Templates\SPE\flag_us.paa);
        name = "SPE US";
        file = "SPE_AI_US";
    };

    class SPE_WEH : SPE_Base
    {
        side = "Occ";
        flagTexture = QPATHTOFOLDER(Templates\Templates\SPE\flag_ger.paa);
        name = "SPE WEH";
        file = "SPE_AI_WEH";
    };

    class SPE_Reb : SPE_Base
    {
        side = "Reb";
        flagTexture = "\WW2\SPE_Core_t\Data_t\Flags\flag_FFF_co.paa";
        name = "SPE FFF";
        file = "SPE_Reb_FFF";
    };

    class SPE_CIV : SPE_Base
    {
        side = "Civ";
        flagTexture = QPATHTOFOLDER(Templates\Templates\SPE\flag_fr.paa);
        name = "SPE Civs";
        file = "SPE_CIV";
    };
*/
    // ***************************** IFA *****************************
    class IFA_Base
    {
        requiredAddons[] = {"IFA3_Core"};
        basepath = QPATHTOFOLDER(Templates\Templates\IFA);
        logo = ""; //Can't figure out how to path to the logo at the base of the IFA AiO mod??
        priority = 60;
        equipFlags[] = {"lowTech"};
        //climate[] = {"temperate","tropical"};
        forceDLC[] = {};
    };
    class IFA_WEH : IFA_Base
    {
        side = "Inv";
        flagTexture = "\x\A3A\addons\core\Pictures\Flags\ifa_weh.paa";
        name = "IFA WEHRMACHT";
        priority = 65;
        file = "IFA_AI_WEH";
        shortName = "WEH";
        lore = $STR_A3A_templates_lore_SPE_IFA_AI_WEH;
    };
    class IFA_SOV : IFA_Base
    {
        side = "Inv";
        flagTexture = "\x\A3A\addons\core\Pictures\Flags\ifa_sov.paa";
        name = "IFA SOVIET ARMY";
        file = "IFA_AI_SOV";
        shortName = "SOV";
        lore = $STR_A3A_templates_lore_IFA_AI_SOV;
    };
    class IFA_ALLIES : IFA_Base
    {
        side = "Occ";
        flagTexture = "\x\A3A\addons\core\Pictures\Flags\ifa_allies.paa";
        name = "IFA ALLIES";
        priority = 65;
        file = "IFA_AI_ALLIES";
        shortName = "ALLIES";
        lore = $STR_A3A_templates_lore_IFA_AI_ALLIES;
    };
    class IFA_US : IFA_Base
    {
        side = "Occ";
        flagTexture = "a3\data_f\flags\flag_us_co.paa";
        name = "IFA US ARMY";
        file = "IFA_AI_US";
        shortName = "US";
        lore = $STR_A3A_templates_lore_SPE_IFA_AI_US;
    };
    class IFA_UK : IFA_Base
    {
        side = "Occ";
        flagTexture = "\A3\Data_F\Flags\flag_uk_co.paa";
        name = "IFA UK ARMY";
        file = "IFA_AI_UK";
        shortName = "UK";
        lore = $STR_A3A_templates_lore_IFA_AI_UK;
    };
    class IFA_FFI : IFA_Base
    {
        side = "Reb";
        flagTexture = "\x\A3A\addons\core\Pictures\Flags\ifa_ffi.paa";
        name = "IFA French Resistance";
        priority = 65;
        file = "IFA_REB_FFI";
        maps[] = {};
        climate[] = {};
        shortName = "FFI";
        lore = $STR_A3A_templates_IFA_Reb_FFI;
    };
    class IFA_AK : IFA_Base
    {
        side = "Reb";
        flagTexture = "\x\A3A\addons\core\Pictures\Flags\ifa_ak.paa";
        name = "IFA Polish Resistance";
        file = "IFA_REB_AK";
        maps[] = {"Staszow"};
        climate[] = {};
        shortName = "AK";
        lore = $STR_A3A_templates_IFA_REB_AK;
    };
    class IFA_CIV_FR : IFA_Base
    {
        side = "Civ";
        flagTexture = "\x\A3A\addons\core\Pictures\Flags\ifa_fr.paa";
        name = "IFA French";
        priority = 65;
        file = "IFA_CIV_FR";
        climate[] = {};
        shortName = "CIV";
        lore = $STR_A3A_templates_IFA_CIV_FR;
    };
    class IFA_CIV_PL : IFA_Base
    {
        side = "Civ";
        flagTexture = "\x\A3A\addons\core\Pictures\Flags\ifa_pl.paa";
        name = "IFA Polish";
        file = "IFA_CIV_PL";
        maps[] = {"Staszow"};
        climate[] = {};
        shortName = "CIV";
        lore = $STR_A3A_templates_IFA_CIV_PL;
    };
    // ***************************** SPE with IFA *****************************

    class SPE_IFA_Base
    {
        requiredAddons[] = {"ww2_spe_assets_c_characters_germans_c","IFA3_Core"};
        basepath = QPATHTOFOLDER(Templates\Templates\SPE_IFA);
        logo = QPATHTOFOLDER(Templates\Templates\SPE_IFA\spe_ifa_logo.paa);
        priority = 80;
        equipFlags[] = {"lowTech"};
        forceDLC[] = {"spe"};
    };

    class SPE_IFA_US : SPE_IFA_Base
    {
        side = "Inv";
        flagTexture = QPATHTOFOLDER(Templates\Templates\SPE_IFA\flag_us.paa);
        name = "SPE_IFA US";
        file = "SPE_IFA_AI_US";
        shortName = "US";
        lore = $STR_A3A_templates_lore_SPE_IFA_AI_US;
    };

    class SPE_IFA_WEH : SPE_IFA_Base
    {
        side = "Occ";
        flagTexture = QPATHTOFOLDER(Templates\Templates\SPE_IFA\flag_ger.paa);
        name = "SPE_IFA WEH";
        file = "SPE_IFA_AI_WEH";
        shortName = "WEH";
        lore = $STR_A3A_templates_lore_SPE_IFA_AI_WEH;
    };

    class SPE_IFA_Reb : SPE_IFA_Base
    {
        side = "Reb";
        flagTexture = "\WW2\SPE_Core_t\Data_t\Flags\flag_FFF_co.paa";
        name = "SPE_IFA FFF";
        file = "SPE_IFA_Reb_FFF";
        shortName = "FFF"; // Free French Forces
        lore = $STR_A3A_templates_lore_SPE_IFA_Reb_FFF;
    };

    class SPE_IFA_CIV : SPE_IFA_Base
    {
        side = "Civ";
        flagTexture = QPATHTOFOLDER(Templates\Templates\SPE_IFA\flag_fr.paa);
        name = "SPE_IFA Civs";
        file = "SPE_IFA_CIV";
        shortName = "Civilian";
        lore = $STR_A3A_templates_lore_SPE_IFA_CIV;
    };

    // ***************************** SPE with SPEX *****************************

    class SPEX_Base
    {
        requiredAddons[] = {"ww2_spe_assets_c_characters_germans_c","WW2_SPEX_Assets_c_Characters_Americans_c"};
        basepath = QPATHTOFOLDER(Templates\Templates\SPEX);
        logo = QPATHTOFOLDER(Templates\Templates\SPEX\spe_logo.paa);
        priority = 80;
        equipFlags[] = {"lowTech"};
        forceDLC[] = {"spe"};
    };

    class SPEX_US : SPEX_Base
    {
        side = "Inv";
        flagTexture = QPATHTOFOLDER(Templates\Templates\SPEX\flag_us.paa);
        name = "SPEX US";
        file = "SPEX_AI_US";
        shortName = "US";
        lore = $STR_A3A_templates_lore_SPE_IFA_AI_US;
    };

    class SPEX_WEH : SPEX_Base
    {
        side = "Occ";
        flagTexture = QPATHTOFOLDER(Templates\Templates\SPEX\flag_ger.paa);
        name = "SPEX WEH";
        file = "SPEX_AI_WEH";
        shortName = "WEH";
        lore = $STR_A3A_templates_lore_SPE_IFA_AI_WEH;
    };

    class SPEX_Reb : SPEX_Base
    {
        side = "Reb";
        flagTexture = "\WW2\SPE_Core_t\Data_t\Flags\flag_FFF_co.paa";
        name = "SPEX FFF";
        file = "SPEX_Reb_FFF";
        shortName = "FFF"; // Free French Forces
        lore = $STR_A3A_templates_lore_SPE_IFA_Reb_FFF;
    };

    class SPEX_CIV : SPEX_Base
    {
        side = "Civ";
        flagTexture = QPATHTOFOLDER(Templates\Templates\SPEX\flag_fr.paa);
        name = "SPEX Civs";
        file = "SPEX_CIV";
        shortName = "Civilian";
        lore = $STR_A3A_templates_lore_SPE_IFA_CIV;
    };

     // ***************************** CWR *****************************

    class CWR_Base
    {
        requiredAddons[] = {"cwr3_core"};       
        basepath = QPATHTOFOLDER(Templates\Templates\CWR);
        logo = "\CUP\Creatures\People\CUP_Creatures_People_Core\ui\logo_cup_ca_small.paa";
        priority = 70;
    };

     class CWR_US_Temprate : CWR_Base
    {
        side = "Occ";
        flagTexture = "a3\data_f\flags\flag_us_co.paa";
        name = "CWR US Temprate";
        file = "CWR_AI_US_Army_Temperate";
        climate[] = {"Temperate"};
        shortName = "US Army";
        lore = $STR_A3A_templates_lore_3CB_AI_CW_US;
    };
    
    class CWR_USSR_Temprate : CWR_Base
    {
        side = "Inv";
        flagTexture = "\cwr3\general\cwr3_core\data\flag_ussr_co.paa";
        name = "CWR USSR Temperate";
        file = "CWR_AI_USSR_Temperate";
        climate[] = {"Temperate"};
        shortName = "USSR";
        lore = $STR_A3A_templates_lore_3CB_AI_CW_Sov;
    };

    class CWR_FIA : CWR_Base
    {
        side = "Reb";
        flagTexture = "\cwr3\general\cwr3_core\data\flag_fia_co.paa";
        name = "CWR FIA";
        file = "CWR_Reb_FIA";
        shortName = "FIA";
        lore = $STR_A3A_templates_lore_FIA;
    };
};
