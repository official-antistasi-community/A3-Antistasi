//////////////////////////
//   Side Information   //
//////////////////////////

["name", "WEH"] call _fnc_saveToTemplate;
["spawnMarkerName", "WEH support corridor"] call _fnc_saveToTemplate;

["flag", "Flag_FIA_F"] call _fnc_saveToTemplate;
["flagTexture", "\WW2\SPE_Core_t\Data_t\Flags\flag_GER_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "SPE_Faction_WEHRMACHT"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["attributeLowAir", true] call _fnc_saveToTemplate;             // Use fewer air units in general
["attributeMoreTrucks", true] call _fnc_saveToTemplate;         // Use more truck for transports
["attributeNoSAM", true] call _fnc_saveToTemplate;              // Don't use SAM supports

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "SPE_Weaponcrate_MP40_GER"] call _fnc_saveToTemplate;
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate;

["vehiclesBasic", ["SEP_B_GER_Sturm_WIN_R200_Hood"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["SEP_B_GER_Sturm_WIN_R200_Hood"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["SEP_B_GER_WIN_SdKfz_2501", "SEP_B_GER_WIN_SdKfz_2501", "SEP_B_GER_Sturm_WIN_R200_MG34", "SEP_B_GER_WIN_OpelBlitz_Flak38"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["SEP_B_GER_Sturm_WIN_OpelBlitz", "SEP_B_GER_Sturm_WIN_OpelBlitz_Open"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["SEP_B_GER_WIN_OpelBlitz_Open"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["SEP_B_GER_WIN_OpelBlitz_Ammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["SEP_B_GER_WIN_OpelBlitz_Repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["SEP_B_GER_WIN_OpelBlitz_Fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["SEP_B_GER_WIN_OpelBlitz_Ambulance"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", []] call _fnc_saveToTemplate;
["vehiclesAPCs", []] call _fnc_saveToTemplate;
["vehiclesIFVs", ["SEP_B_GER_WIN_StuG_III_G_SKB", "SEP_B_GER_WIN_StuG_III_G_Late", "SEP_B_GER_WIN_StuH_42"]] call _fnc_saveToTemplate;
["vehiclesLightTanks",["SEP_B_GER_WIN_PzKpfw_III_N", "SEP_B_GER_WIN_PzKpfw_III_L", "SEP_B_GER_WIN_PzKpfw_III_M", "SEP_B_GER_WIN_PzKpfw_III_J", "SEP_B_GER_WIN_StuG_III_G_Late", "SEP_B_GER_WIN_StuG_III_G_SKB", "SEP_B_GER_WIN_Nashorn"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["SEP_B_GER_WIN_PzKpfw_III_M", "SEP_B_GER_WIN_PzKpfw_III_M", "SEP_B_GER_WIN_PzKpfw_IV_G", "SEP_B_GER_WIN_PzKpfw_IV_G", "SEP_B_GER_WIN_PzKpfw_V_G"]] call _fnc_saveToTemplate;
["vehiclesHeavyTanks", ["SEP_B_GER_WIN_Jagdpanther_G1","SEP_B_GER_WIN_PzKpfw_VI_H1", "SEP_B_GER_WIN_PzKpfw_VI_H1", "SEP_B_GER_WIN_PzKpfw_V_G", "SEP_B_GER_WIN_PzKpfw_V_G", "SEP_B_GER_WIN_PzKpfw_V_G"]] call _fnc_saveToTemplate;
["vehiclesAA", ["SEP_B_GER_WIN_OpelBlitz_Flak38"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["I_C_Boat_Transport_02_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["I_C_Boat_Transport_02_F"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["SEP_B_GER_WIN_FW190F8"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["SEP_B_GER_WIN_FW190F8"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["SPEX_C47_Skytrain"]] call _fnc_saveToTemplate;


if (isClass (configFile >> "CfgPatches" >> "sab_flyinglegends")) then {

    ["vehiclesPlanesTransport", ["sab_fl_ju52"]] call _fnc_saveToTemplate;

    private _CAP = ["SEP_B_GER_WIN_FW190F8","sab_fl_bf109c","sab_fl_bf109e","sab_fl_bf109f","sab_fl_bf109g","sab_fl_bf109k","sab_fl_fw190a","sab_fl_fw190d","sab_fl_he162"];
    private _CAS = ["SEP_B_GER_WIN_FW190F8","sab_fl_ju88a"];

    if (isClass (configFile >> "CfgPatches" >> "sab_sw_tbf")) then {
        _CAP = _CAP + ["sab_sw_me262"];
        _CAS = _CAS + ["sab_sw_ar234","sab_sw_bf110","sab_sw_ju87_2","sab_sw_ju87_3","sab_sw_ju87"];
    };

    ["vehiclesPlanesCAS", _CAS] call _fnc_saveToTemplate;
    ["vehiclesPlanesAA", _CAP] call _fnc_saveToTemplate;
};

["vehiclesHelisLight", []] call _fnc_saveToTemplate;
["vehiclesHelisTransport", []] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", []] call _fnc_saveToTemplate;
["vehiclesHelisAttack", []] call _fnc_saveToTemplate;

["vehiclesArtillery", ["SEP_B_GER_WIN_leFH18"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["SPE_leFH18", ["SPE_8x_Shell_105L28_Gr39HlC_HEAT_Artillery","SPE_20x_Shell_105L28_Gr38_HE","SPE_20x_Shell_105L28_Gr38_NB"]]
]] call _fnc_saveToTemplate;

["uavsAttack", []] call _fnc_saveToTemplate;
["uavsPortable", []] call _fnc_saveToTemplate;

//Config special vehicles
["vehiclesMilitiaLightArmed", ["SEP_B_GER_WIN_R200_MG34"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["SEP_B_GER_WIN_OpelBlitz", "SEP_B_GER_WIN_OpelBlitz_Open"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["SEP_B_GER_WIN_R200_Hood"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["SPE_Milice_R200_Hood"]] call _fnc_saveToTemplate;

["staticMGs", ["SEP_B_GER_WIN_MG34_Lafette_Deployed", "SEP_B_GER_WIN_MG42_Lafette_Deployed"]] call _fnc_saveToTemplate;
["staticAT", ["SEP_B_GER_WIN_leFH18_AT", "SEP_B_GER_WIN_Pak40"]] call _fnc_saveToTemplate;
["staticAA", ["SEP_B_GER_WIN_FlaK_30", "SEP_B_GER_WIN_FlaK_38", "SEP_B_GER_WIN_FlaK_36_AA"]] call _fnc_saveToTemplate;
["staticMortars", ["SEP_B_GER_WIN_GrW278_1"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "SPE_8Rnd_81mm_FA_Mle_1932_HE"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "SPE_8Rnd_81mm_FA_Mle_1932_Smoke"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "SPE_8Rnd_81mm_FA_Mle_1932_Illu"] call _fnc_saveToTemplate;

//Minefield definition
["minefieldAT", ["SPE_US_M1A1_ATMINE"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["SPE_US_M3_Pressure_MINE", "SPE_US_M3_MINE"]] call _fnc_saveToTemplate;

#include "SEP_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["LivonianHead_6","SPE_boyartsev","SPE_bykov","SPE_Connors","SPE_DAgostino","SPE_Davidson","SPE_Elliot","SPE_Grishka","SPE_Hauptmann","SPE_Klimakov","SPE_Krueger","SPE_Kuzmin","SPE_Neumann","SPE_Oberst","SPE_OBrien","SPE_Vasiliev","SPE_Walter","SPE_Wolf","Sturrock","WhiteHead_01","WhiteHead_02","WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_08","WhiteHead_09","WhiteHead_11","WhiteHead_12","WhiteHead_13","WhiteHead_14","WhiteHead_15","WhiteHead_18","WhiteHead_19","WhiteHead_20","WhiteHead_21"]] call _fnc_saveToTemplate;
["voices", ["spe_male01ger", "spe_male02ger"]] call _fnc_saveToTemplate;

"SPE_GermanMen" call _fnc_saveNames;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["rifles", [
["SEP_WP_MP507", "", "", "", ["SPE_30Rnd_792x33", "SPE_30Rnd_792x33", "SPE_30rnd_792x33_t"], [], ""],
["SPE_G43", "", "", "", ["SPE_10Rnd_792x57", "SPE_10Rnd_792x57", "SPE_10Rnd_792x57_T"], [], ""],
["SPE_K98", "SPE_ACC_K98_Bayo", "", "", ["SPE_5Rnd_792x57", "SPE_5Rnd_792x57", "SPE_5Rnd_792x57_t"], [], ""],
["SPE_K98", "SPE_ACC_K98_Bayo", "", "", ["SPE_5Rnd_792x57", "SPE_5Rnd_792x57", "SPE_5Rnd_792x57_t"], [], ""],
["SEP_WP_Gewehr98", "", "", "", ["SPE_5Rnd_792x57", "SPE_5Rnd_792x57", "SPE_5Rnd_792x57_t"], [], ""],
["SEP_WP_Gewehr98", "", "", "", ["SPE_5Rnd_792x57", "SPE_5Rnd_792x57", "SPE_5Rnd_792x57_t"], [], ""]
]];
_loadoutData set ["slRifles", [
["SPE_STG44", "", "", "", ["SPE_30Rnd_792x33", "SPE_30Rnd_792x33", "SPE_30rnd_792x33_t"], [], ""],
["SPE_MP40", "", "", "", ["SPE_32Rnd_9x19", "SPE_32Rnd_9x19", "SPE_32rnd_9x19_t"], [], ""],
["SPE_G43", "", "", "", ["SPE_10Rnd_792x57", "SPE_10Rnd_792x57", "SPE_10Rnd_792x57_T"], [], ""],
["SPE_K98_Late", "SPE_ACC_K98_Bayo", "", "", ["SPE_5Rnd_792x57_SMK", "SPE_5Rnd_792x57_SMK", "SPE_5Rnd_792x57_t"], [], ""],
["SPE_K98_Late_GW", "SPE_ACC_GW_SB_Empty", "", "", ["SPE_5Rnd_792x57", "SPE_5Rnd_792x57", "SPE_5Rnd_792x57_t"], ["SPE_1Rnd_G_PZGR_40", "SPE_1Rnd_G_SPRGR_30", "SPE_1Rnd_G_FLGR", "SPE_1Rnd_G_NBGR_42"], ""]
]];
_loadoutData set ["grenadeLaunchers", [
["SPE_K98_GW", "SPE_ACC_GW_SB_Empty", "", "", ["SPE_5Rnd_792x57", "SPE_5Rnd_792x57", "SPE_5Rnd_792x57_t"], ["SPE_1Rnd_G_SPRGR_30", "SPE_1Rnd_G_SPRGR_30", "SPE_1Rnd_G_FLGR", "SPE_1Rnd_G_NBGR_42"], ""],
["SPE_K98_GW", "SPE_ACC_GW_SB_Empty", "", "", ["SPE_5Rnd_792x57", "SPE_5Rnd_792x57", "SPE_5Rnd_792x57_t"], ["SPE_1Rnd_G_PZGR_30", "SPE_1Rnd_G_SPRGR_30", "SPE_1Rnd_G_FLGR", "SPE_1Rnd_G_NBGR_42"], ""],
["SPE_K98_GW", "SPE_ACC_GW_SB_Empty", "", "", ["SPE_5Rnd_792x57", "SPE_5Rnd_792x57", "SPE_5Rnd_792x57_t"], ["SPE_1Rnd_G_PZGR_40", "SPE_1Rnd_G_SPRGR_30", "SPE_1Rnd_G_FLGR", "SPE_1Rnd_G_NBGR_42"], ""]
]];
_loadoutData set ["SMGs", [
["SEP_WP_MP507", "", "", "", ["SPE_30Rnd_792x33", "SPE_30Rnd_792x33", "SPE_30rnd_792x33_t"], [], ""],
["SPE_MP40", "", "", "", ["SPE_32Rnd_9x19", "SPE_32Rnd_9x19", "SPE_32rnd_9x19_t"], [], ""],
["SPE_MP40", "", "", "", ["SPE_32Rnd_9x19", "SPE_32Rnd_9x19", "SPE_32rnd_9x19_t"], [], ""],
["SPE_MP40", "", "", "", ["SPE_32Rnd_9x19", "SPE_32Rnd_9x19", "SPE_32rnd_9x19_t"], [], ""]
]];
_loadoutData set ["machineGuns", [
["SPE_MG42", "", "", "", ["SPE_50Rnd_792x57", "SPE_50Rnd_792x57", "SPE_50Rnd_792x57_SMK"], [], ""],
["SPE_MG42", "", "", "", ["SPE_50Rnd_792x57", "SPE_50Rnd_792x57", "SPE_50Rnd_792x57_SMK"], [], ""],
["SPE_MG34", "", "", "", ["SPE_50Rnd_792x57", "SPE_50Rnd_792x57", "SPE_50Rnd_792x57_SMK"], [], ""]
]];
_loadoutData set ["marksmanRifles", [
["SEP_WP_Gewehr98_Sniper", "", "", "", ["SPE_5Rnd_792x57", "SPE_5Rnd_792x57", "SPE_5Rnd_792x57_t"], [], ""],
["SPE_K98ZF39", "", "", "", ["SPE_5Rnd_792x57", "SPE_5Rnd_792x57", "SPE_5Rnd_792x57_t"], [], ""],
["SPE_K98ZF39", "", "", "", ["SPE_5Rnd_792x57", "SPE_5Rnd_792x57", "SPE_5Rnd_792x57_t"], [], ""]
]];
_loadoutData set ["sniperRifles", [
["SEP_WP_Gewehr98_Sniper", "", "", "", ["SPE_5Rnd_792x57", "SPE_5Rnd_792x57", "SPE_5Rnd_792x57_t"], [], ""],
["SPE_K98ZF39", "", "", "", ["SPE_5Rnd_792x57", "SPE_5Rnd_792x57", "SPE_5Rnd_792x57_SMK"], [], ""],
["SPE_K98ZF39", "", "", "", ["SPE_5Rnd_792x57", "SPE_5Rnd_792x57", "SPE_5Rnd_792x57_SMK"], [], ""]
]];

_loadoutData set ["lightATLaunchers", ["SPE_PzFaust_60m", "SPE_PzFaust_30m", "SPE_Faustpatrone"]];
_loadoutData set ["ATLaunchers", ["SPE_RPzB_43","SPE_RPzB_54"]];
_loadoutData set ["sidearms", ["SPE_P08"]];

_loadoutData set ["ATMines", ["SPE_TMI_42_MINE_mag"]];
_loadoutData set ["APMines", ["SPE_shumine_42_MINE_mag"]];
_loadoutData set ["lightExplosives", ["SPE_Ladung_Small_MINE_mag"]];
_loadoutData set ["heavyExplosives", ["SPE_Ladung_Big_MINE_mag"]];

_loadoutData set ["antiTankGrenades", ["SPE_Shg24x7"]];
_loadoutData set ["antiInfantryGrenades", ["SPE_Shg24","SPE_Shg24_Frag"]];
_loadoutData set ["smokeGrenades", ["SPE_NB39", "SPE_NBK39b"]];
_loadoutData set ["signalsmokeGrenades", ["SPE_Handrauchzeichen_Yellow", "SPE_Handrauchzeichen_Red", "SPE_Handrauchzeichen_Violet"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["SPE_GER_ItemWatch"]];
_loadoutData set ["compasses", ["SPE_GER_ItemCompass", "SPE_GER_ItemCompass_deg"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["binoculars", ["SPE_Binocular_GER"]];
_loadoutData set ["Flashlight", ["SPE_GER_FL_Signal_Flashlight"]];

_loadoutData set ["uniforms", ["SEP_B_GER_U_Parka_wht", "SEP_B_GER_U_Parka_wht", "SEP_B_GER_U_Parka_grau_mix", "SEP_B_GER_U_Parka_grau"]];
_loadoutData set ["sniUniforms", ["SEP_B_GER_U_Parka_wht"]];
_loadoutData set ["medUniforms", ["SEP_B_GER_U_Parka_wht"]];
_loadoutData set ["slUniforms", ["SEP_B_GER_U_Parka_grau_mix_uffz", "SEP_B_GER_U_Parka_wht"]];

_loadoutData set ["vests", ["V_SPE_GER_VestMP40", "V_SPE_GER_VestG43", "V_SPE_GER_VestKar98", "V_SPE_GER_VestG43"]];
_loadoutData set ["glVests", ["V_SPE_US_Vest_Grenadier"]];
_loadoutData set ["medVests", ["V_SPE_GER_SaniVest", "V_SPE_GER_SaniVest2"]];
_loadoutData set ["sniVests", ["V_SPE_GER_SniperBelt"]];
_loadoutData set ["engVests", ["V_SPE_GER_PioneerVest", "V_SPE_GER_VestMP40"]];
_loadoutData set ["mgVests", ["V_SPE_GER_VestMG"]];
_loadoutData set ["slVests", ["V_SPE_GER_VestSTG", "V_SPE_GER_FieldOfficer", "V_SPE_GER_FieldOfficer", "V_SPE_GER_VestUnterofficer"]];

_loadoutData set ["backpacks", ["B_SPE_GER_Tonister41_Frame_ST", "B_SPE_GER_Tonister41_Frame_Full_ST"]];
_loadoutData set ["medBackpacks", ["B_SPE_GER_MedicBackpack_Empty"]];
_loadoutData set ["slBackpacks", ["B_SPE_GER_Radio"]];
_loadoutData set ["engBackpacks", ["B_SPE_GER_SapperBackpack_empty"]];
_loadoutData set ["atBackpacks", ["B_SPE_GER_RPzB_Belt_bag", "B_SPE_GER_RPzB_Belt_bag_zelt"]];

_loadoutData set ["helmets", ["H_HeadBandage_stained_F", 
"SEP_B_GER_H_StahlhelmCover_maus", "SEP_B_GER_H_StahlhelmCover_maus_ns",
"SEP_B_GER_H_StahlhelmM40_WIN_1", "SEP_B_GER_H_StahlhelmM40_WIN_1_net", "SEP_B_GER_H_StahlhelmM40_WIN_1_utility","SEP_B_GER_H_StahlhelmM40_WIN_1_wire",
"SEP_B_GER_H_Stahlhelm_WIN_2", "SEP_B_GER_H_Stahlhelm_WIN_2_utility", "SEP_B_GER_H_Stahlhelm_WIN_1", "SEP_B_GER_H_Stahlhelm_WIN_1_utility"
]];
_loadoutData set ["sniHelmets", []];
_loadoutData set ["medHelmets", ["H_SPE_GER_Helmet_Medic"]];
_loadoutData set ["slHelmets", []];

_loadoutData set ["facewear", ["G_SPE_GER_GM30","G_SPE_Dust_Goggles","G_SPE_Dust_Goggles_2"]];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.

private _eeItems = ["SPE_ToolKit"];
private _mmItems = [];

if (A3A_hasACE) then {
    _eeItems append ["ACE_Clacker", "ACE_DefusalKit"];
    _mmItems append ["ACE_RangeCard"];
};

_loadoutData set ["items_squadLeader_extras", []];
_loadoutData set ["items_rifleman_extras", []];
_loadoutData set ["items_medic_extras", []];
_loadoutData set ["items_grenadier_extras", []];
_loadoutData set ["items_explosivesExpert_extras", _eeItems];
_loadoutData set ["items_engineer_extras", _eeItems];
_loadoutData set ["items_lat_extras", []];
_loadoutData set ["items_at_extras", []];
_loadoutData set ["items_aa_extras", []];
_loadoutData set ["items_machineGunner_extras", []];
_loadoutData set ["items_marksman_extras", _mmItems];
_loadoutData set ["items_sniper_extras", _mmItems];
_loadoutData set ["items_police_extras", []];
_loadoutData set ["items_crew_extras", []];
_loadoutData set ["items_unarmed_extras", []];

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_sfLoadoutData set ["uniforms", ["SEP_B_GER_U_Parka_wht", "SEP_B_GER_U_Parka_wht", "SEP_B_GER_ST_U_Parka_maus", "SEP_B_GER_ST_U_Parka_maus_mix"]];
_sfLoadoutData set ["medUniforms", []];
_sfLoadoutData set ["slUniforms", []];

_sfLoadoutData set ["rifles", [
["SPE_G43", "", "", "", ["SPE_10Rnd_792x57", "SPE_10Rnd_792x57", "SPE_10Rnd_792x57_T"], [], ""],
["SPE_G43", "", "", "", ["SPE_10Rnd_792x57", "SPE_10Rnd_792x57", "SPE_10Rnd_792x57_T"], [], ""],
["SPE_STG44", "", "", "", ["SPE_30Rnd_792x33", "SPE_30Rnd_792x33", "SPE_30rnd_792x33_t"], [], ""],
["SPE_K98_Late_GW", "SPE_ACC_GW_SB_Empty", "", "", ["SPE_5Rnd_792x57_SMK", "SPE_5Rnd_792x57_SMK", "SPE_5Rnd_792x57_t"], ["SPE_1Rnd_G_PZGR_40", "SPE_1Rnd_G_SPRGR_30", "SPE_1Rnd_G_FLGR", "SPE_1Rnd_G_NBGR_42"], ""]
]];
_sfLoadoutData set ["slRifles", [
["SPE_G43", "", "", "", ["SPE_10Rnd_792x57", "SPE_10Rnd_792x57", "SPE_10Rnd_792x57_T"], [], ""],
["SPE_STG44", "", "", "", ["SPE_30Rnd_792x33", "SPE_30Rnd_792x33", "SPE_30rnd_792x33_t"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["SPE_K98_Late_GW", "SPE_ACC_GW_SB_Empty", "", "", ["SPE_5Rnd_792x57_SMK", "SPE_5Rnd_792x57_SMK", "SPE_5Rnd_792x57_t"], ["SPE_1Rnd_G_PZGR_30", "SPE_1Rnd_G_SPRGR_30", "SPE_1Rnd_G_FLGR", "SPE_1Rnd_G_NBGR_42"], ""],
["SPE_K98_Late_GW", "SPE_ACC_GW_SB_Empty", "", "", ["SPE_5Rnd_792x57_SMK", "SPE_5Rnd_792x57_SMK", "SPE_5Rnd_792x57_t"], ["SPE_1Rnd_G_PZGR_40", "SPE_1Rnd_G_SPRGR_30", "SPE_1Rnd_G_FLGR", "SPE_1Rnd_G_NBGR_42"], ""]
]];
_sfLoadoutData set ["machineGuns", [
["SPE_MG42", "", "", "", ["SPE_50Rnd_792x57", "SPE_50Rnd_792x57", "SPE_50Rnd_792x57_SMK"], [], ""],
["SPE_MG34", "", "", "", ["SPE_50Rnd_792x57", "SPE_50Rnd_792x57", "SPE_50Rnd_792x57_SMK"], [], ""],
["SPE_FG42_E", "", "", "", ["SPE_20Rnd_792x57", "SPE_20Rnd_792x57", "SPE_20Rnd_792x57_t2"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
["SPE_K98ZF39", "", "", "", ["SPE_5Rnd_792x57_SMK"], [], ""],
["SPE_K98ZF39", "", "", "", ["SPE_5Rnd_792x57_SMK"], [], ""],
["SPE_FG42_E", "", "", "SPE_Optic_ZFG42", ["SPE_20Rnd_792x57", "SPE_20Rnd_792x57", "SPE_20Rnd_792x57_t2"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [
["SPE_K98ZF39", "", "", "", ["SPE_5Rnd_792x57_SMK"], [], ""],
["SPE_K98ZF39", "", "", "", ["SPE_5Rnd_792x57_SMK"], [], ""],
["SPE_FG42_E", "", "", "SPE_Optic_ZFG42", ["SPE_20Rnd_792x57", "SPE_20Rnd_792x57", "SPE_20Rnd_792x57_t2"], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_militaryLoadoutData set ["flamethrower", ["SPE_Flammenwerfer41"]];
_militaryLoadoutData set ["flamethrowerMask", ["G_SPE_GER_GM30"]];
_militaryLoadoutData set ["tankBackpack", ["B_SPE_GER_Flammenwerfer_41"]];
//See LoadoutData

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["SEP_B_GER_U_Mantel_M36_Gaiters"]];
_policeLoadoutData set ["vests", ["V_SPE_FFI_Vest_rifle", "V_SPE_FFI_Vest_rifle_frag","V_SPE_FFI_Vest_rifle_pouch"]];
_policeLoadoutData set ["helmets", ["SEP_B_GER_H_Stahlhelm_M35_gry"]];
_policeLoadoutData set ["slHelmets", ["SEP_B_GER_H_Stahlhelm_M35_gry"]];
_policeLoadoutData set ["slUniforms", []];

_policeLoadoutData set ["facewear", ["SEP_B_GER_F_Feld_Gorget"]];

_policeLoadoutData set ["rifles", [
["SEP_WP_MP507", "", "", "", ["SPE_30Rnd_792x33"], [], ""],
["SEP_WP_MAS38", "", "", "", [], [], ""],
["SEP_WP_Gewehr98", "", "", "", [], [], ""],
["SEP_WP_Gewehr98", "", "", "", [], [], ""],
["SEP_WP_Gewehr98", "", "", "", [], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;


_militiaLoadoutData set ["uniforms", ["SEP_B_GER_U_Mantel_M40_volk"]];
_militiaLoadoutData set ["medUniforms", ["SEP_B_GER_U_Mantel_M40_volk"]];
_militiaLoadoutData set ["slUniforms", ["SEP_B_GER_U_Mantel_M40_volk"]];
_militiaLoadoutData set ["sniUniforms", ["SEP_B_GER_U_Mantel_M40_volk"]];

_militiaLoadoutData set ["vests", ["V_SPE_Milice_Vest_rifle", "V_SPE_erla_VestKar98"]];
_militiaLoadoutData set ["medVests", ["V_SPE_erla_SaniVest2"]];
_militiaLoadoutData set ["glVests", ["V_SPE_Milice_Vest_rifle", "V_SPE_erla_VestKar98"]];
_militiaLoadoutData set ["sniVests", ["V_SPE_Milice_Vest_rifle", "V_SPE_erla_VestKar98"]];
_militiaLoadoutData set ["engVests", ["V_SPE_erla_PioneerVest"]];
_militiaLoadoutData set ["mgVests", ["V_SPE_erla_VestMG"]];
_militiaLoadoutData set ["slVests", ["V_SPE_erla_VestSTG"]];

_militiaLoadoutData set ["backpacks", []];
_militiaLoadoutData set ["medBackpacks", ["B_SPE_GER_MedicBackpack_Empty"]];
_militiaLoadoutData set ["slBackpacks", []];
_militiaLoadoutData set ["atBackpacks", []];
_militiaLoadoutData set ["engBackpacks", []];

_militiaLoadoutData set ["helmets", ["SEP_B_GER_H_FieldCap_Gry", "SEP_B_GER_H_FieldCap_Gry", "SEP_B_GER_H_FieldCap_Gry", "SEP_B_GER_H_FieldCap_Gry", "SEP_B_GER_H_FieldCap_Gry", "SEP_B_GER_H_FieldCap_Gry", "SEP_B_GER_H_FieldCap_Gry", "SEP_B_GER_H_FieldCap_Gry", "H_HeadBandage_clean_F", "H_HeadBandage_stained_F", "H_HeadBandage_bloody_F"]];
_militiaLoadoutData set ["medHelmets", ["H_SPE_GER_Helmet_Medic"]];
_militiaLoadoutData set ["slHelmets", ["SEP_B_GER_H_FieldCap_Gry"]];

_militiaLoadoutData set ["facewear", []];

_militiaLoadoutData set ["ATLaunchers", []];
_militiaLoadoutData set ["sidearms", []];

_militiaLoadoutData set ["rifles", [
["SEP_WP_Gewehr98", "SEP_WP_ACC_Gewehr98_Bayo", "", "", [], [], ""],
["SEP_WP_Gewehr98", "SEP_WP_ACC_Gewehr9805_Bayo", "", "", [], [], ""],
["SPE_K98", "", "", "", [], [], ""],
["SPE_K98_Late", "", "", "", [], [], ""]
]];
_militiaLoadoutData set ["shotGuns", [
["SPE_Fusil_Mle_208_12", "", "", "", ["SPE_2Rnd_12x65_Pellets"], [], ""],
["SPE_Fusil_Mle_208_12_Sawedoff", "", "", "", ["SPE_2Rnd_12x65_Pellets"], [], ""]
]];
_militiaLoadoutData set ["slRifles", [
["SEP_WP_MP507", "", "", "", ["SPE_30Rnd_792x33", "SPE_30Rnd_792x33", "SPE_30rnd_792x33_t"], [], ""],
["SEP_WP_Gewehr98", "SEP_WP_ACC_Gewehr9805_Bayo", "", "", [], [], ""],
["SPE_K98", "", "", "", [], [], ""],
["SPE_K98_Late", "", "", "", [], [], ""],
["SPE_MP40", "", "", "", ["SPE_32Rnd_9x19"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["SEP_WP_Gewehr98", "SEP_WP_ACC_Gewehr98_Bayo", "", "", [], [], ""],
["SEP_WP_Gewehr98", "", "", "", [], [], ""],
["SPE_K98", "", "", "", [], [], ""],
["SPE_K98_Late", "", "", "", [], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["SEP_WP_Gewehr98", "SEP_WP_ACC_Gewehr9805_Bayo", "", "", [], [], ""],
["SEP_WP_Gewehr98_Sniper", "", "", "", ["SPE_5Rnd_792x57_t"], [], ""],
["SEP_WP_Gewehr98_Sniper", "", "", "", ["SPE_5Rnd_792x57_t"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
["SEP_WP_Gewehr98_Sniper", "", "", "", ["SPE_5Rnd_792x57_t"], [], ""]
]];
_militiaLoadoutData set ["SMGs", [
["SEP_WP_MP507", "", "", "", ["SPE_30Rnd_792x33", "SPE_30Rnd_792x33", "SPE_30rnd_792x33_t"], [], ""],
["SEP_WP_MP507", "", "", "", ["SPE_30Rnd_792x33", "SPE_30Rnd_792x33", "SPE_30rnd_792x33_t"], [], ""],
["SEP_WP_Gewehr98", "SEP_WP_ACC_Gewehr9805_Bayo", "", "", [], [], ""],
["SPE_K98", "", "", "", [], [], ""],
["SPE_K98_Late", "", "", "", [], [], ""],
["SPE_Sten_Mk2", "", "", "", ["SPE_32Rnd_9x19_Sten"], [], ""],
["SPE_Sten_Mk2", "", "", "", ["SPE_32Rnd_9x19_Sten"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["SEP_WP_Gewehr98", "SEP_WP_ACC_Gewehr9805_Bayo", "", "", [], [], ""],
["SEP_WP_MP507", "", "", "", ["SPE_30Rnd_792x33", "SPE_30Rnd_792x33", "SPE_30rnd_792x33_t"], [], ""],
["SPE_MG42", "", "", "", ["SPE_50Rnd_792x57"], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["U_SPE_GER_Tank_crew_private"]];
_crewLoadoutData set ["vests", ["V_SPE_GER_TankPrivateBelt"]];
_crewLoadoutData set ["helmets", ["H_SPE_GER_TankPrivateCap3", "H_SPE_GER_TankPrivateCap", "H_SPE_GER_TankPrivateCap2"]];

private _pilotLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["U_SPE_GER_LW_pilot", "U_SPE_GER_LW_pilot_alt"]];
_pilotLoadoutData set ["vests", ["V_SPE_GER_PrivateBelt"]];
_pilotLoadoutData set ["helmets", ["H_SPE_GER_LW_PilotHelmet"]];
_pilotLoadoutData set ["backpacks", ["B_SPE_GER_LW_Paradrop"]];
_pilotLoadoutData set ["SMGs", []];

private _officerLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_officerLoadoutData set ["slUniforms", ["SEP_B_GER_ST_U_CoatOfficer"]];
_officerLoadoutData set ["slVests", ["V_SPE_GER_PistolBelt"]];
_officerLoadoutData set ["slHelmets", ["H_SPE_GER_OfficerCap"]];
_officerLoadoutData set ["backpacks", []];
_officerLoadoutData set ["slBackpacks", []];

_officerLoadoutData set ["slRifles", [
["SPE_MP40", "", "", "", ["SPE_32Rnd_9x19"], [], ""]
]];

/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////
//These define the loadouts for different unit types.
//For example, rifleman, grenadier, squad leader, etc.
//In 95% of situations, you *should not need to edit these*.
//Almost all factions can be set up just by modifying the loadout data above.
//However, these exist in case you really do want to do a lot of custom alterations.

private _squadLeaderTemplate = {
    [["slHelmets", "helmets"] call _fnc_fallback] call _fnc_setHelmet;
    [["slVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["slUniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;

    [["slBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    ["slRifles"] call _fnc_setPrimary;
    ["primary", 8] call _fnc_addMagazines;
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 4] call _fnc_addMagazines;
    ["handgun", 4] call _fnc_addAdditionalMuzzleMagazines;
    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_squadLeader_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["signalsmokeGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["Flashlight"] call _fnc_addNVGs;

    ["binoculars"] call _fnc_addBinoculars;
};

private _riflemanTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["rifles"] call _fnc_setPrimary;
    ["primary", 8] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_rifleman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["Flashlight"] call _fnc_addNVGs;
};

private _medicTemplate = {
    [["medHelmets", "helmets"] call _fnc_fallback] call _fnc_setHelmet;
    [["medVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["medUniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;
    [["medBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;
    [selectRandom ["rifles", "SMGs"]] call _fnc_setPrimary;
    ["primary", 8] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_medic"] call _fnc_addItemSet;
    ["items_medic_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["Flashlight"] call _fnc_addNVGs;
};

private _grenadierTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["glVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["grenadeLaunchers"] call _fnc_setPrimary;
    ["primary", 8] call _fnc_addMagazines;
    ["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 4] call _fnc_addMagazines;
    ["handgun", 2] call _fnc_addAdditionalMuzzleMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_grenadier_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 4] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["Flashlight"] call _fnc_addNVGs;
};

private _explosivesExpertTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["engVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["engBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandomWeighted ["rifles", 3, "SMGs", 1.5]] call _fnc_setPrimary;
    ["primary", 8] call _fnc_addMagazines;


    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_explosivesExpert_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["lightExplosives", 4] call _fnc_addItem;
    if (random 1 > 0.5) then {["heavyExplosives", 2] call _fnc_addItem;};
    if (random 1 > 0.5) then {["atMines", 2] call _fnc_addItem;};
    if (random 1 > 0.5) then {["apMines", 2] call _fnc_addItem;};

    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["Flashlight"] call _fnc_addNVGs;
};

//Very questionable, not sure how else to do this
VAR_WEHW_FlamerThrower = 0;

private _engineerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["engVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;



    if (VAR_WEHW_FlamerThrower == 5) then {
        ["flamethrowerMask"] call _fnc_setFacewear;
        ["tankBackpack"] call _fnc_setBackpack;
        
        ["flamethrower"] call _fnc_setPrimary;
        ["primary", 3] call _fnc_addMagazines;

        ["sidearms"] call _fnc_setHandgun;
        ["handgun", 5] call _fnc_addMagazines;
    } else {
        [["engBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

        ["SMGs"] call _fnc_setPrimary;
        ["primary", 8] call _fnc_addMagazines;

        ["sidearms"] call _fnc_setHandgun;
        ["handgun", 2] call _fnc_addMagazines;

        if (random 1 > 0.5) then {["lightExplosives", 3] call _fnc_addItem;};

        ["antiInfantryGrenades", 1] call _fnc_addItem;
        ["items_engineer_extras"] call _fnc_addItemSet;
    };
    VAR_WEHW_FlamerThrower = VAR_WEHW_FlamerThrower + 1;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["Flashlight"] call _fnc_addNVGs;
};


private _latTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["rifles"] call _fnc_setPrimary;
    ["primary", 8] call _fnc_addMagazines;

    ["lightATLaunchers"] call _fnc_setLauncher;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_lat_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiTankGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["Flashlight"] call _fnc_addNVGs;
};

private _atTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandomWeighted ["rifles", 4, "SMGs", 1]] call _fnc_setPrimary;
    ["primary", 8] call _fnc_addMagazines;

    [["ATLaunchers", "lightATLaunchers"] call _fnc_fallback] call _fnc_setLauncher;
    ["launcher", 2] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_at_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiTankGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["Flashlight"] call _fnc_addNVGs;
};

private _aaTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["rifles"] call _fnc_setPrimary;
    ["primary", 8] call _fnc_addMagazines;

    ["lightATLaunchers"] call _fnc_setLauncher;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_aa_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiTankGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["Flashlight"] call _fnc_addNVGs;
};

private _machineGunnerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["mgVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["machineGuns"] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_machineGunner_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["Flashlight"] call _fnc_addNVGs;
};

private _marksmanTemplate = {
    [["sniHelmets", "helmets"] call _fnc_fallback] call _fnc_setHelmet;
    [["sniVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["sniUniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;

    ["marksmanRifles"] call _fnc_setPrimary;
    ["primary", 8] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_marksman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["binoculars"] call _fnc_addBinoculars;
};

private _sniperTemplate = {
    [["sniHelmets", "helmets"] call _fnc_fallback] call _fnc_setHelmet;
    [["sniVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["sniUniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;

    ["sniperRifles"] call _fnc_setPrimary;
    ["primary", 8] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_sniper_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["binoculars"] call _fnc_addBinoculars;
};

private _policeTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["facewear"] call _fnc_setFacewear;

    ["rifles"] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_police_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["Flashlight"] call _fnc_addNVGs;
};
private _policeSLTemplate = {
    call _policeTemplate;
    ["slHelmets"] call _fnc_setHelmet;
    [selectRandom ["rifles", "SMGs"]] call _fnc_setPrimary;
};

private _crewTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["SMGs"] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_crew_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _unarmedTemplate = {
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_unarmed_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["Flashlight"] call _fnc_addNVGs;
};

private _traitorTemplate = {
    call _unarmedTemplate;
    ["shotGuns"] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;
};

////////////////////////////////////////////////////////////////////////////////////////
//  You shouldn't touch below this line unless you really really know what you're doing.
//  Things below here can and will break the gamemode if improperly changed.
////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////
//  Special Forces Units   //
/////////////////////////////
private _prefix = "SF";
private _unitTypes = [
    ["SquadLeader", _squadLeaderTemplate],
    ["Rifleman", _riflemanTemplate],
    ["Medic", _medicTemplate, [["medic", true]]],
    ["Engineer", _engineerTemplate, [["engineer", true]]],
    ["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]]],
    ["Grenadier", _grenadierTemplate],
    ["LAT", _latTemplate],
    ["AT", _atTemplate],
    ["AA", _aaTemplate],
    ["MachineGunner", _machineGunnerTemplate],
    ["Marksman", _marksmanTemplate],
    ["Sniper", _sniperTemplate]
];

[_prefix, _unitTypes, _sfLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

/*{
    params ["_name", "_loadoutTemplate"];
    private _loadouts = [_sfLoadoutData, _loadoutTemplate] call _fnc_buildLoadouts;
    private _finalName = _prefix + _name;
    [_finalName, _loadouts] call _fnc_saveToTemplate;
} forEach _unitTypes;
*/

///////////////////////
//  Military Units   //
///////////////////////
private _prefix = "military";
private _unitTypes = [
    ["SquadLeader", _squadLeaderTemplate],
    ["Rifleman", _riflemanTemplate],
    ["Medic", _medicTemplate, [["medic", true]]],
    ["Engineer", _engineerTemplate, [["engineer", true]]],
    ["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]]],
    ["Grenadier", _grenadierTemplate],
    ["LAT", _latTemplate],
    ["AT", _atTemplate],
    ["AA", _aaTemplate],
    ["MachineGunner", _machineGunnerTemplate],
    ["Marksman", _marksmanTemplate],
    ["Sniper", _sniperTemplate]
];

[_prefix, _unitTypes, _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Police Units    //
////////////////////////
private _prefix = "police";
private _unitTypes = [
    ["SquadLeader", _policeSLTemplate],
    ["Standard", _policeTemplate]
];

[_prefix, _unitTypes, _policeLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Militia Units    //
////////////////////////
private _prefix = "militia";
private _unitTypes = [
    ["SquadLeader", _squadLeaderTemplate],
    ["Rifleman", _riflemanTemplate],
    ["Medic", _medicTemplate, [["medic", true]]],
    ["Engineer", _engineerTemplate, [["engineer", true]]],
    ["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]]],
    ["Grenadier", _grenadierTemplate],
    ["LAT", _latTemplate],
    ["AT", _atTemplate],
    ["AA", _aaTemplate],
    ["MachineGunner", _machineGunnerTemplate],
    ["Marksman", _marksmanTemplate],
    ["Sniper", _sniperTemplate]
];

[_prefix, _unitTypes, _militiaLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

//////////////////////
//    Misc Units    //
//////////////////////

//The following lines are determining the loadout of vehicle crew
["other", [["Crew", _crewTemplate]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout of the pilots
["other", [["Pilot", _crewTemplate]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the unit used in the "kill the official" mission
["other", [["Official", _SquadLeaderTemplate]], _officerLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate]], _militiaLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
