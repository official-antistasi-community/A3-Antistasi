//////////////////////////
//   Side Information   //
//////////////////////////

["name", "CW"] call _fnc_saveToTemplate;
["spawnMarkerName", "CW support corridor"] call _fnc_saveToTemplate;

["flag", "Flag_US_F"] call _fnc_saveToTemplate;
["flagTexture", "\A3\Data_F\Flags\flag_uk_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_UK"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["attributeLowAir", true] call _fnc_saveToTemplate;             // Use fewer air units in general
["attributeMoreTrucks", true] call _fnc_saveToTemplate;         // Use more truck for transports
["attributeNoSAM", true] call _fnc_saveToTemplate;              // Don't use SAM supports

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "SPE_Mine_AmmoBox_US"] call _fnc_saveToTemplate;
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate;

["vehiclesBasic", ["SPEX_CW_G503_MB_Open"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["SPEX_CW_G503_MB", "SPEX_CW_G503_MB_Open", "SPEX_CW_Bedford_MWD_Open"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["SPEX_CW_Humber_MkII", "SPEX_CW_Humber_LRC", "SPEX_CW_Humber_LRC"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["SPEX_CW_Bedford_MWD","SPEX_CW_Bedford_MWD","SPEX_CW_Bedford_MWD_Open","SPEX_CW_Bedford_MWD_Open","SPEX_CW_M5_Halftrack_Unarmed", "SPEX_CW_M5_Halftrack_Unarmed_Open"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["SPEX_CW_Bedford_MWD_Open"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["SPEX_CW_M5_Halftrack_Ammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["SPEX_CW_M5_Halftrack_Repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["SPEX_CW_M5_Halftrack_Fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["SPEX_CW_M5_Halftrack_Ambulance"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", []] call _fnc_saveToTemplate;
["vehiclesAPCs", ["SPEX_CW_M5_Halftrack"]] call _fnc_saveToTemplate; //These got no protected  turret, sufficent troop capacity, cost reduced
["vehiclesIFVs", ["SPEX_CW_M10"]] call _fnc_saveToTemplate;
["vehiclesLightTanks",["SPEX_CW_Cromwell_Mk5","SPEX_CW_Humber_MkIV","SPEX_CW_Humber_MkIV_PLM", "SPEX_CW_M8_LAC", "SPEX_CW_M8_LAC_ringMount"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["SPEX_CW_Cromwell_Mk5","SPEX_CW_Cromwell_Mk5","SPEX_CW_Sherman_II_late","SPEX_CW_Sherman_I"]] call _fnc_saveToTemplate;
["vehiclesHeavyTanks", ["SPEX_CW_Sherman_Ic_Hybrid","SPEX_CW_Sherman_Ic"]] call _fnc_saveToTemplate;
["vehiclesAA", ["SPE_US_M16_Halftrack"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["I_C_Boat_Transport_02_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["I_C_Boat_Transport_02_F"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["SPE_P47"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["SPE_P47"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["SPEX_CW_C47_Dakota"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", []] call _fnc_saveToTemplate;
["vehiclesHelisTransport", []] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", []] call _fnc_saveToTemplate;
["vehiclesHelisAttack", []] call _fnc_saveToTemplate;

["vehiclesArtillery", ["SPE_105mm_M3"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["SPE_105mm_M3", ["SPE_20x_Shell_M3_M1_HE_Artillery","SPE_8x_Shell_M3_M67_HEAT_Artillery"]]
]] call _fnc_saveToTemplate;

["uavsAttack", []] call _fnc_saveToTemplate;
["uavsPortable", []] call _fnc_saveToTemplate;

//Config special vehicles
["vehiclesMilitiaLightArmed", ["SPEX_PL_Humber_LRC", "SPEX_PL_Humber_LRC", "SPEX_PL_CCKW_353_M2"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["SPEX_PL_Bedford_MWD_Open", "SPEX_PL_Bedford_MWD"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["SPEX_PL_Bedford_MWD_Open"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["SPE_US_G503_MB"]] call _fnc_saveToTemplate;

["staticMGs", ["SPE_M1919A6_Bipod"]] call _fnc_saveToTemplate;
["staticAT", ["SPEX_CW_QF_6_Pounder"]] call _fnc_saveToTemplate;
["staticAA", ["SPE_FR_M45_Quadmount"]] call _fnc_saveToTemplate;
["staticMortars", ["SPE_M1_81"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "SPE_8Rnd_81mmHE_M1_M43A1"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "SPE_8rnd_81mm_M1_M57_SmokeShell"] call _fnc_saveToTemplate;

//Minefield definition
["minefieldAT", ["SPE_US_M1A1_ATMINE"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["SPE_US_M3_Pressure_MINE", "SPE_US_M3_MINE"]] call _fnc_saveToTemplate;

#include "SPE_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["LivonianHead_6", "SPE_Arnold", "SPE_boyartsev", "SPE_bykov", "SPE_Connors", "SPE_DAgostino", "SPE_Davidson", "SPE_Elliot", "SPE_Grishka", "SPE_Hauptmann", "SPE_Ivanych", "SPE_Jeppson", "SPE_Klimakov", "SPE_Krueger", "SPE_Kuzmin", "SPE_Neumann", "SPE_Oberst", "SPE_OBrien", "SPE_Seppmeyer", "SPE_Vasiliev", "SPE_Walter", "SPE_Wolf", "Sturrock", "WhiteHead_01", "WhiteHead_02", "WhiteHead_03", "WhiteHead_04", "WhiteHead_05", "WhiteHead_06", "WhiteHead_07", "WhiteHead_08", "WhiteHead_09", "WhiteHead_10", "WhiteHead_11", "WhiteHead_12", "WhiteHead_13", "WhiteHead_14", "WhiteHead_15", "WhiteHead_16", "WhiteHead_17", "WhiteHead_18", "WhiteHead_19", "WhiteHead_20", "WhiteHead_21"]] call _fnc_saveToTemplate;
["voices", ["Male01ENGB", "Male02ENGB", "Male03ENGB", "Male04ENGB", "Male05ENGB"]] call _fnc_saveToTemplate;
"SPE_EnglishMen" call _fnc_saveNames;


//////////////////////////
//       Loadouts       //
//////////////////////////

private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["rifles", []];
_loadoutData set ["slRifles", []];
_loadoutData set ["shotGuns", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", [
    ["SPEX_No1_Mk3_Enfield", "", "", "", ["SPEX_10Rnd_770x56"], [], ""],
    ["SPEX_No1_Mk3_mid_Enfield", "", "", "", ["SPEX_10Rnd_770x56"], [], ""],
    ["SPEX_No1_Mk3_late_Enfield", "", "", "", ["SPEX_10Rnd_770x56"], [], ""],
    ["SPEX_No1_Mk3_Enfield_GL", "SPEX_ACC_2HalfInch_GL_CUP", "SPEX_ACC_Enfield_No1_Wires", "", ["SPEX_10Rnd_770x56"], ["SPEX_1Rnd_G_No36_MKI"], ""],
    ["SPEX_No1_Mk3_mid_Enfield_GL", "SPEX_ACC_2HalfInch_GL_CUP", "SPEX_ACC_Enfield_No1_Wires", "", ["SPEX_10Rnd_770x56"], ["SPEX_1Rnd_G_No36_MKI"], ""],
    ["SPEX_No1_Mk3_late_Enfield_GL", "SPEX_ACC_2HalfInch_GL_CUP", "SPEX_ACC_Enfield_No1_Wires", "", ["SPEX_10Rnd_770x56"], ["SPEX_1Rnd_G_No36_MKI"], ""],
    ["SPEX_No1_Mk3_Enfield_GL", "SPEX_ACC_2HalfInch_GL_CUP", "SPEX_ACC_Enfield_No1_Wires", "", ["SPEX_10Rnd_770x56"], ["SPEX_1Rnd_G_No36_MKI", "SPEX_1Rnd_G_No68", "SPEX_1Rnd_G_No36_MKI"], ""],
    ["SPEX_No1_Mk3_mid_Enfield_GL", "SPEX_ACC_2HalfInch_GL_CUP", "SPEX_ACC_Enfield_No1_Wires", "", ["SPEX_10Rnd_770x56"], ["SPEX_1Rnd_G_No36_MKI", "SPEX_1Rnd_G_No68", "SPEX_1Rnd_G_No36_MKI"], ""],
    ["SPEX_No1_Mk3_late_Enfield_GL", "SPEX_ACC_2HalfInch_GL_CUP", "SPEX_ACC_Enfield_No1_Wires", "", ["SPEX_10Rnd_770x56"], ["SPEX_1Rnd_G_No36_MKI", "SPEX_1Rnd_G_No68", "SPEX_1Rnd_G_No36_MKI"], ""]
]];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];

_loadoutData set ["lightATLaunchers", [
    ["SPEX_No1_Mk3_Enfield_GL", "SPEX_ACC_2HalfInch_GL_CUP", "SPEX_ACC_Enfield_No1_Wires", "", ["SPEX_10Rnd_770x56"], ["SPEX_1Rnd_G_No68"], ""],
    ["SPEX_No1_Mk3_mid_Enfield_GL", "SPEX_ACC_2HalfInch_GL_CUP", "SPEX_ACC_Enfield_No1_Wires", "", ["SPEX_10Rnd_770x56"], ["SPEX_1Rnd_G_No68"], ""],
    ["SPEX_No1_Mk3_late_Enfield_GL", "SPEX_ACC_2HalfInch_GL_CUP", "SPEX_ACC_Enfield_No1_Wires", "", ["SPEX_10Rnd_770x56"], ["SPEX_1Rnd_G_No68"], ""],
    ["SPEX_No1_Mk3_Enfield_GL", "SPEX_ACC_2HalfInch_GL_CUP", "SPEX_ACC_Enfield_No1_Wires", "", ["SPEX_10Rnd_770x56"], ["SPEX_1Rnd_G_No68", "SPEX_1Rnd_G_No68", "SPEX_1Rnd_G_No36_MKI"], ""],
    ["SPEX_No1_Mk3_mid_Enfield_GL", "SPEX_ACC_2HalfInch_GL_CUP", "SPEX_ACC_Enfield_No1_Wires", "", ["SPEX_10Rnd_770x56"], ["SPEX_1Rnd_G_No68", "SPEX_1Rnd_G_No68", "SPEX_1Rnd_G_No36_MKI"], ""],
    ["SPEX_No1_Mk3_late_Enfield_GL", "SPEX_ACC_2HalfInch_GL_CUP", "SPEX_ACC_Enfield_No1_Wires", "", ["SPEX_10Rnd_770x56"], ["SPEX_1Rnd_G_No68", "SPEX_1Rnd_G_No68", "SPEX_1Rnd_G_No36_MKI"], ""]
]];
_loadoutData set ["ATLaunchers", ["SPEX_PIAT"]];
_loadoutData set ["sidearms", ["SPE_M1911", "SPEX_Enfield_No2_late", "SPEX_Enfield_No2"]];

_loadoutData set ["ATMines", ["SPE_US_M1A1_ATMINE_mag"]];
_loadoutData set ["APMines", ["SPE_US_M3_Pressure_MINE_mag", "SPE_US_M3_MINE_mag"]];
_loadoutData set ["lightExplosives", ["SPE_US_TNT_half_pound_mag"]];
_loadoutData set ["heavyExplosives", ["SPE_US_TNT_4pound_mag", "SPE_US_Bangalore_mag"]];

_loadoutData set ["antiTankGrenades", []];
_loadoutData set ["antiInfantryGrenades", ["SPE_US_Mk_2", "SPE_US_Mk_2_Yellow", "SPE_US_AN_M14"]];
_loadoutData set ["smokeGrenades", ["SPE_US_M18"]];
_loadoutData set ["signalsmokeGrenades", ["SPE_US_M18_Green", "SPE_US_M18_Red", "SPE_US_M18_Violet", "SPE_US_M18_Yellow"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["SPE_US_ItemWatch"]];
_loadoutData set ["compasses", ["SPE_US_ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["binoculars", ["SPE_Binocular_US"]];
_loadoutData set ["Flashlight", ["SPE_US_FL_TL122"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["medUniforms", []];
_loadoutData set ["engUniforms", []];
_loadoutData set ["slUniforms", []];

_loadoutData set ["vests", ["V_SPEX_cw_vest_p37_N97_no1_p39_bandoleer","V_SPEX_CW_Vest_P37_N97_Rifle", "V_SPEX_CW_Vest_P37_N97_Rifle_p39", "V_SPEX_CW_Vest_P37_N97_Rifle_P41"]];
_loadoutData set ["glVests", []];
_loadoutData set ["sniVests", ["V_SPEX_CW_Vest_P37_N97_Rifle"]];
_loadoutData set ["medVests", ["V_SPEX_cw_vest_p37_n97_medical", "V_SPEX_cw_vest_p37_n97_medical_p41"]];
_loadoutData set ["engVests", ["V_SPEX_CW_Vest_P37_N61_golok"]];
_loadoutData set ["mgVests", ["V_SPEX_cw_vest_p37_N97_P41"]];
_loadoutData set ["slVests", ["V_SPEX_cw_vest_p37_N97_sten", "V_SPEX_CW_Vest_P37_N97_rac_offz"]];

_loadoutData set ["backpacks", []];
_loadoutData set ["atBackpacks", ["B_SPEX_CW_Sack_PIAT_gas_assault"]];
_loadoutData set ["slBackpacks", []];
_loadoutData set ["glBackpacks", []];
_loadoutData set ["engBackpacks", ["B_SPEX_CW_Sack_P37_N97_gas_assault_shovel_roll_engineer"]];

_loadoutData set ["helmets", []];
_loadoutData set ["medHelmets", []];
_loadoutData set ["slHelmets", ["H_SPEX_CW_beret_gs"]];
_loadoutData set ["sniHelmets", []];

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
_sfLoadoutData set ["uniforms", ["U_SPEX_CW_Denis_kd_scarf", "U_SPEX_CW_Denis_kd", "U_SPEX_CW_Denis_puttee","U_SPEX_CW_Denis_puttee_scarf"]];
_sfLoadoutData set ["medUniforms", ["U_SPEX_CW_Denis_kd_officer", "U_SPEX_CW_Denis_puttee_officer"]];
_sfLoadoutData set ["engUniforms", ["U_SPEX_CW_Denis_kd_officer", "U_SPEX_CW_Denis_puttee_officer"]];
_sfLoadoutData set ["slUniforms", ["U_SPEX_CW_Denis_kd_officer", "U_SPEX_CW_Denis_puttee_officer"]];

_sfLoadoutData set ["helmets", ["H_SPEX_CW_beret_PARA","H_SPEX_CW_beret_cdo","H_SPEX_CW_HSAT_mk1_scrim", "H_SPEX_CW_HSAT_mk3_scrim", "H_SPEX_CW_HSAT_mk2_scrim_op", "H_SPEX_CW_HSAT_mk2_net_op", "H_SPEX_CW_HSAT_mk2_op", "H_SPEX_CW_HSAT_mk1_op"]];
_sfLoadoutData set ["medHelmets", []];
_sfLoadoutData set ["slHelmets", ["H_SPEX_CW_beret_PARA","H_SPEX_CW_beret_cdo"]];
_sfLoadoutData set ["sniHelmets", ["H_SPEX_CW_beret_cdo"]];

_sfLoadoutData set ["slRifles", [
["SPEX_No4_Mk1_Enfield", "SPEX_ACC_No4_Mk2_Bayo", "", "", ["SPEX_10Rnd_770x56_AP_MKI","SPEX_10Rnd_770x56_MkVIII"], [], ""],
["SPE_Sten_Mk2_Suppressed", "", "", "", ["SPE_32Rnd_9x19_Sten"], [], ""],
["SPEX_Sten_Mk6_Suppressed", "", "", "", ["SPE_32Rnd_9x19_Sten"], [], ""],
["SPEX_Sten_Mk6_Suppressed", "", "", "", ["SPE_32Rnd_9x19_Sten"], [], ""],
["SPEX_M1928_Thompson", "", "", "", ["SPEX_50Rnd_Thompson_45ACP_t","SPEX_50Rnd_Thompson_45ACP","SPE_30Rnd_Thompson_45ACP"], [], ""]
]];
_sfLoadoutData set ["rifles", [
["SPEX_No4_Mk1_Enfield", "SPEX_ACC_No4_Mk2_Bayo", "", "", ["SPEX_10Rnd_770x56_MkVIII"], [], ""],
["SPEX_No4_Mk1_Enfield_dunkel", "SPEX_ACC_No4_Mk2_Bayo", "", "", ["SPEX_10Rnd_770x56_AP_MKI"], [], ""],
["SPEX_M1928A1_Thompson", "", "", "", ["SPE_20Rnd_Thompson_45ACP","SPE_20Rnd_Thompson_45ACP_t"], [], ""],
["SPEX_M1928_Thompson", "", "", "", ["SPE_20Rnd_Thompson_45ACP","SPE_20Rnd_Thompson_45ACP_t"], [], ""]
]];
_sfLoadoutData set ["carbines", [
["SPE_Sten_Mk2_Suppressed", "", "", "", ["SPE_32Rnd_9x19_Sten"], [], ""],
["SPEX_Sten_Mk6_Suppressed", "", "", "", ["SPE_32Rnd_9x19_Sten"], [], ""],
["SPEX_No4_Mk1_Enfield", "SPEX_ACC_No4_Mk2_Bayo", "", "", ["SPEX_10Rnd_770x56_MkVIII"], [], ""],
["SPEX_No4_Mk1_Enfield_dunkel", "SPEX_ACC_No4_Mk2_Bayo", "", "", ["SPEX_10Rnd_770x56_AP_MKI"], [], ""],
["SPEX_M1928A1_Thompson", "", "", "", ["SPE_20Rnd_Thompson_45ACP","SPE_20Rnd_Thompson_45ACP_t"], [], ""],
["SPEX_M1928_Thompson", "", "", "", ["SPE_20Rnd_Thompson_45ACP","SPE_20Rnd_Thompson_45ACP_t"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["SPEX_No1_Mk3_late_Enfield_GL", "SPEX_ACC_2HalfInch_GL_CUP", "SPEX_ACC_Enfield_No1_Wires", "", ["SPEX_10Rnd_770x56"], ["SPEX_1Rnd_G_No68", "SPEX_1Rnd_G_No36_MKI"], ""],
["SPEX_No1_Mk3_late_Enfield_GL", "SPEX_ACC_2HalfInch_GL_CUP", "SPEX_ACC_Enfield_No1_Wires", "", ["SPEX_10Rnd_770x56"], ["SPEX_1Rnd_G_No36_MKI", "SPEX_1Rnd_G_No68"], ""]
]];
_sfLoadoutData set ["SMGs", [
["SPE_Sten_Mk2_Suppressed", "", "", "", ["SPE_32Rnd_9x19_Sten"], [], ""],
["SPEX_Sten_Mk6_Suppressed", "", "", "", ["SPE_32Rnd_9x19_Sten"], [], ""],
["SPEX_M1928_Thompson", "", "", "", ["SPE_30Rnd_Thompson_45ACP_t","SPE_30Rnd_Thompson_45ACP"], [], ""],
["SPEX_M1928A1_Thompson", "", "", "", ["SPE_30Rnd_Thompson_45ACP_t","SPE_30Rnd_Thompson_45ACP"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
["SPEX_M1928_Thompson", "", "", "", ["SPEX_50Rnd_Thompson_45ACP_t","SPEX_50Rnd_Thompson_45ACP","SPE_30Rnd_Thompson_45ACP"], [], ""],
["SPEX_LMG_303_Mk1", "", "", "", ["SPE_30Rnd_770x56_AP_MKI","SPE_30Rnd_770x56_MKVIII","SPE_30Rnd_770x56"], [], ""],
["SPEX_LMG_303_Mk1", "", "", "", ["SPE_30Rnd_770x56_AP_MKI","SPE_30Rnd_770x56_MKVIII","SPE_30Rnd_770x56"], [], ""],
["SPE_LMG_303_Mk2", "", "", "", ["SPE_30Rnd_770x56_AP_MKI","SPE_30Rnd_770x56_MKVIII","SPE_30Rnd_770x56"], [], ""],
["SPE_MG34", "", "", "", ["SPE_50Rnd_792x57_SMK","SPE_50Rnd_792x57_sS","SPE_50Rnd_792x57"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
["SPEX_No4_Mk1_Enfield_Scoped", "", "", "", ["SPEX_10Rnd_770x56_MkVIII"], [], ""],
["SPEX_No4_Mk1_Enfield_Scoped_dunkel", "", "", "", ["SPEX_10Rnd_770x56_AP_MKI"], [], ""],
["SPEX_No4_Mk1_Enfield_Scoped", "", "", "", ["SPEX_10Rnd_770x56_MkVIII"], [], ""],
["SPEX_No4_Mk1_Enfield_Scoped_dunkel", "", "", "", ["SPEX_10Rnd_770x56_AP_MKI"], [], ""],
["SPE_LMG_303_Mk2", "", "", "", ["SPE_30Rnd_770x56_MKVIII"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [
["SPEX_No4_Mk1_Enfield_Scoped", "", "", "", ["SPEX_10Rnd_770x56_AP_MKI"], [], ""],
["SPEX_No4_Mk1_Enfield_Scoped_dunkel", "", "", "", ["SPEX_10Rnd_770x56_MkVIII"], [], ""],
["SPEX_No4_Mk1_Enfield_Scoped", "", "", "", ["SPEX_10Rnd_770x56_MkVIII"], [], ""],
["SPEX_No4_Mk1_Enfield_Scoped_dunkel", "", "", "", ["SPEX_10Rnd_770x56_AP_MKI"], [], ""],
["SPE_LMG_303_Mk2", "", "", "", ["SPE_30Rnd_770x56_MKVIII"], [], ""]
]];

_sfLoadoutData set ["ATLaunchers", ["SPEX_PIAT", "SPE_M1A1_Bazooka"]];
_sfLoadoutData set ["sidearms", ["SPE_M1911", "SPE_M1911", "SPE_P08", "SPEX_Enfield_No2"]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_militaryLoadoutData set ["uniforms", ["U_SPEX_CW_BD_LCPL","U_SPEX_CW_BD_CPL","U_SPEX_CW_BD", "U_SPEX_CW_BD_roll", "U_SPEX_CW_BD_roll", "U_SPEX_CW_BD_open"]];
_militaryLoadoutData set ["medUniforms", ["U_SPEX_CW_BD_medic", "U_SPEX_CW_BD_medic", "U_SPEX_CW_BD_medic_sb"]];
_militaryLoadoutData set ["engUniforms", ["U_SPEX_CW_BD_SGT","U_SPEX_CW_BD_SGT","U_SPEX_CW_BD_CPL"]];
_militaryLoadoutData set ["slUniforms", ["U_SPEX_CW_BD_1LT", "U_SPEX_CW_BD_1LT", "U_SPEX_CW_BD_CPT"]];

_militaryLoadoutData set ["helmets", ["H_SPEX_CW_Helmet_mk3_ifak_op_tilt","H_SPEX_CW_Helmet_mk3_scrim_op","H_SPEX_CW_Helmet_mk3_net_op","H_SPEX_CW_Helmet_mk3_op","H_SPEX_CW_Helmet_mk3", "H_SPEX_CW_Helmet_mk2_net_op_tilt", "H_SPEX_CW_Helmet_mk2_net", "H_SPEX_CW_Helmet_mk2_hessian", "H_SPEX_CW_Helmet_mk2_hessian_op", "H_SPEX_CW_Helmet_mk2_ifak_op", "H_SPEX_CW_Helmet_mk2"]];
_militaryLoadoutData set ["sniHelmets", ["H_SPEX_CW_Helmet_mk2_scrim_op", "H_SPEX_CW_Helmet_mk2_ifak_op_tilt"]];

_militaryLoadoutData set ["lmgMag", ["SPE_30Rnd_770x56"]];
_militaryLoadoutData set ["rifles", [
["SPEX_No1_Mk3_late_Enfield", "SPEX_ACC_P1907_Bayo", "", "", ["SPEX_10Rnd_770x56"], [], ""],
["SPEX_No4_Mk1_Enfield", "SPEX_ACC_No4_Mk2_Bayo", "", "", ["SPEX_10Rnd_770x56"], [], ""],
["SPEX_No4_Mk1_Enfield_dunkel", "SPEX_ACC_No4_Mk2_Bayo", "", "", ["SPEX_10Rnd_770x56"], [], ""],
["SPEX_No4_Mk1_Enfield", "SPEX_ACC_No4_Mk2_Bayo", "", "", ["SPEX_10Rnd_770x56"], [], ""],
["SPEX_No4_Mk1_Enfield_dunkel", "SPEX_ACC_No4_Mk2_Bayo", "", "", ["SPEX_10Rnd_770x56"], [], ""]
]];
_militaryLoadoutData set ["slRifles", [
["SPEX_Sten_Mk5", "SPEX_ACC_No4_Mk2_Bayo", "", "", ["SPE_32Rnd_9x19_Sten"], [], ""],
["SPEX_Sten_Mk5", "SPEX_ACC_No4_Mk2_Bayo", "", "", ["SPE_32Rnd_9x19_Sten"], [], ""],
["SPEX_M1928A1_Thompson", "", "", "", ["SPE_20Rnd_Thompson_45ACP","SPE_20Rnd_Thompson_45ACP_t"], [], ""],
["SPEX_M1928A1_Thompson", "", "", "", ["SPE_20Rnd_Thompson_45ACP","SPE_20Rnd_Thompson_45ACP_t"], [], ""],
["SPEX_M1928_Thompson", "", "", "", ["SPE_20Rnd_Thompson_45ACP","SPE_20Rnd_Thompson_45ACP_t"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["SPE_Sten_Mk2", "", "", "", ["SPE_32Rnd_9x19_Sten"], [], ""],
["SPE_Sten_Mk2", "", "", "", ["SPE_32Rnd_9x19_Sten"], [], ""],
["SPEX_Sten_Mk5", "", "", "", ["SPE_32Rnd_9x19_Sten"], [], ""],
["SPEX_Sten_Mk5", "", "", "", ["SPE_32Rnd_9x19_Sten"], [], ""],
["SPEX_No1_Mk3_late_Enfield", "SPEX_ACC_P1907_Bayo", "", "", ["SPEX_10Rnd_770x56"], [], ""],
["SPEX_No1_Mk3_late_Enfield", "SPEX_ACC_P1907_Bayo", "", "", ["SPEX_10Rnd_770x56"], [], ""],
["SPEX_No4_Mk1_Enfield", "SPEX_ACC_No4_Mk2_Bayo", "", "", ["SPEX_10Rnd_770x56"], ["SPE_30Rnd_770x56"], ""],
["SPEX_No4_Mk1_Enfield_dunkel", "SPEX_ACC_No4_Mk2_Bayo", "", "", ["SPEX_10Rnd_770x56"], ["SPE_30Rnd_770x56"], ""]
]];
_militaryLoadoutData set ["SMGs", [
["SPE_Sten_Mk2", "", "", "", ["SPE_32Rnd_9x19_Sten"], [], ""],
["SPEX_Sten_Mk5", "", "", "", ["SPE_32Rnd_9x19_Sten"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["SPEX_LMG_303_Mk1", "", "", "", ["SPE_30Rnd_770x56"], [], ""],
["SPEX_LMG_303_Mk1", "", "", "", ["SPE_30Rnd_770x56"], [], ""],
["SPEX_LMG_303_Mk1", "", "", "", ["SPE_30Rnd_770x56"], [], ""],
["SPE_LMG_303_Mk2", "", "", "", ["SPE_30Rnd_770x56"], [], ""],
["SPE_LMG_303_Mk2", "", "", "", ["SPE_30Rnd_770x56"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["SPEX_No4_Mk1_Enfield_Scoped", "", "", "", [], [], ""],
["SPEX_No4_Mk1_Enfield_Scoped_dunkel", "", "", "", [], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
["SPEX_No4_Mk1_Enfield_Scoped", "", "", "", [], [], ""],
["SPEX_No4_Mk1_Enfield_Scoped_dunkel", "", "", "", [], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["U_SPEX_CW_RAF_BD"]];
_policeLoadoutData set ["vests", ["V_SPEX_CW_Vest_P37_N103_rac"]];
_policeLoadoutData set ["helmets", ["H_SPEX_CW_SIDECAP_RAF_EM"]];
_policeLoadoutData set ["slHelmets", ["H_SPEX_CW_RAF_visor_EM"]];

_policeLoadoutData set ["SMGs", [
["SPE_Sten_Mk2", "", "", "", ["SPE_32Rnd_9x19_Sten"], [], ""]
]];
_policeLoadoutData set ["rifles", [
["SPE_No3_Mk1_Enfield", "SPE_ACC_M1917_Bayo", "", "", [], [], ""],
["SPE_No3_Mk1_Enfield", "SPE_ACC_M1917_Bayo", "", "", [], [], ""],
["SPE_No3_Mk1_Enfield", "", "", "", [], [], ""],
["SPE_No3_Mk1_Enfield", "", "", "", [], [], ""],
["SPEX_M1928_Thompson", "", "", "", ["SPE_20Rnd_Thompson_45ACP","SPE_20Rnd_Thompson_45ACP_t"], [], ""]
]];
_policeLoadoutData set ["shotGuns", [
["SPE_Model_37_Riotgun", "", "", "", ["SPE_5Rnd_12x70_Slug", "SPE_5Rnd_12x70_Pellets"], [], ""],
["SPE_Model_37_Riotgun", "", "", "", ["SPE_5Rnd_12x70_Pellets"], [], ""]
]];
_policeLoadoutData set ["sidearms", ["SPEX_Enfield_No2_late", "SPEX_Enfield_No2"]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_militiaLoadoutData set ["uniforms", ["U_SPEX_AUS_KD_long_anklet","U_SPEX_AUS_KD_long_anklet_roll","U_SPEX_AUS_KD_long_roll","U_SPEX_AUS_KD_long_trop","U_SPEX_AUS_KD_long_trop_roll"]];
_militiaLoadoutData set ["medUniforms", ["U_SPEX_AUS_KD_long_medic"]];
_militiaLoadoutData set ["engUniforms", []];
_militiaLoadoutData set ["slUniforms", []];

_militiaLoadoutData set ["medVests", ["V_SPEX_cw_vest_p37_n97_medical", "V_SPEX_cw_vest_p37_n97_medical_p41"]];
_militiaLoadoutData set ["medBackpack", ["B_SPEX_CW_Sack_P37_N97_gas_assault_roll_1_sb"]];

_militiaLoadoutData set ["helmets", ["H_SPEX_CW_hat_felt","H_SPEX_CW_hat_felt_cl","H_SPEX_CW_hat_felt_slouch","H_SPEX_CW_hat_felt_slouch_cl", "H_SPEX_CW_SIDECAP", "H_SPEX_CW_SIDECAP"]];
_militiaLoadoutData set ["medHelmets", []];
_militiaLoadoutData set ["sniHelmets", ["H_SPEX_CW_hat_felt_slouch","H_SPEX_CW_hat_felt_slouch_cl"]];

_militiaLoadoutData set ["sidearms", ["SPEX_Enfield_No2", "SPEX_Enfield_No2_late"]];

_militiaLoadoutData set ["rifles", [
["SPEX_No1_Mk3_Enfield", "SPEX_ACC_P1907_Bayo", "", "", [], [], ""],
["SPE_No3_Mk1_Enfield", "SPE_ACC_M1917_Bayo", "", "", [], [], ""]
]];
_militiaLoadoutData set ["slRifles", [
["SPEX_Owen_Gun", "", "", "", ["SPE_32Rnd_9x19_Owen"], [], ""],
["SPEX_Owen_Gun_Camo", "", "", "", ["SPE_32Rnd_9x19_Owen"], [], ""],
["SPE_Sten_Mk2", "", "", "", ["SPE_32Rnd_9x19_Sten"], [], ""],
["SPEX_No1_Mk3_Enfield", "SPEX_ACC_P1907_Bayo", "", "", [], [], ""],
["SPE_No3_Mk1_Enfield", "SPE_ACC_M1917_Bayo", "", "", [], [], ""]
]];
_militiaLoadoutData set ["shotGuns", [
["SPE_Model_37_Riotgun", "", "", "", ["SPE_5Rnd_12x70_Slug"], [], ""],
["SPE_Model_37_Riotgun", "", "", "", ["SPE_5Rnd_12x70_Pellets"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
["SPE_Model_37_Trenchgun_M1917_Bayonet", "SPE_ACC_M1917_Bayo", "", "", ["SPE_5Rnd_12x70_Slug", "SPE_5Rnd_12x70_Pellets"], [], ""],
["SPEX_Owen_Gun", "", "", "", ["SPE_32Rnd_9x19_Owen"], [], ""],
["SPEX_No1_Mk3_Enfield", "SPEX_ACC_P1907_Bayo", "", "", [], [], ""],
["SPE_No3_Mk1_Enfield", "", "", "", [], [], ""],
["SPE_No3_Mk1_Enfield", "", "", "", [], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["SPEX_No1_Mk3_Enfield", "SPEX_ACC_P1907_Bayo", "", "", [], [], ""],
["SPE_No3_Mk1_Enfield", "", "", "", [], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
["SPE_No3_Mk1_Enfield", "", "", "", [], [], ""]
]];
_militiaLoadoutData set ["SMGs", [
["SPEX_Owen_Gun", "", "", "", ["SPE_32Rnd_9x19_Owen"], [], ""],
["SPEX_Owen_Gun", "", "", "", ["SPE_32Rnd_9x19_Owen"], [], ""],
["SPEX_Owen_Gun_Camo", "", "", "", ["SPE_32Rnd_9x19_Owen"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["SPEX_LMG_303_Mk1", "", "", "", ["SPE_30Rnd_770x56"], [], ""],
["SPE_M1918A0_BAR", "", "", "", ["SPE_20Rnd_762x63_M1", "SPE_20Rnd_762x63"], [], ""]
]];
_policeLoadoutData set ["sidearms", ["SPEX_Enfield_No2_late", "SPEX_Enfield_No2"]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["U_SPEX_CW_BD_open"]];
_crewLoadoutData set ["vests", ["V_SPEX_CW_Vest_P37_N61_rac"]];
_crewLoadoutData set ["helmets", ["H_SPEX_CW_beret_pz_no38_goggle","H_SPEX_CW_beret_pz_no38","H_SPEX_CW_beret_pz_goggle","H_SPEX_CW_beret_pz","H_SPEX_CW_Helmet_RAC_no38", "H_SPEX_CW_Helmet_RAC"]];

private _pilotLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["U_SPEX_CW_RAF_BD", "U_SPEX_CW_RAF_BD_glove"]];
_pilotLoadoutData set ["vests", ["V_SPEX_CW_RAF_Schwimm"]];
_pilotLoadoutData set ["helmets", ["H_SPEX_CW_SIDECAP_RAF_EM", "H_SPEX_CW_RAF_visor", "H_SPEX_CW_RAF_visor_EM", "H_SPEX_CW_SIDECAP_RAF_OFFZ"]];
_pilotLoadoutData set ["backpacks", ["B_SPEX_CW_RAF_Paradrop"]];



private _officerLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_officerLoadoutData set ["slUniforms", ["U_SPEX_CW_BD_Jerkin_Officer"]];
_officerLoadoutData set ["slVests", ["V_SPEX_CW_Vest_P37_N103_rac_offz"]];
_officerLoadoutData set ["slHelmets", ["H_SPEX_CW_beret_PARA"]];
_officerLoadoutData set ["backpacks", []];
_officerLoadoutData set ["slBackpacks", []];

_officerLoadoutData set ["slRifles", [
    "SPE_Sten_Mk2", "SPEX_Sten_Mk5", "SPEX_Sten_Mk5", "SPEX_M1928_Thompson", "SPEX_M1928A1_Thompson"
]];
_officerLoadoutData set ["sidearms", ["SPE_M1911", "SPEX_Enfield_No2"]];

/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////
//These define the loadouts for different unit types.
//For example, rifleman, grenadier, squad leader, etc.
//In 95% of situations, you *should not need to edit these*.
//Almost all factions can be set up just by modifying the loadout data above.
//However, these exist in case you really do want to do a lot of custom alterations.

private _squadLeaderTemplate = {
    ["slHelmets"] call _fnc_setHelmet;
    [["slVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["slUniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;

    [["slBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    ["slRifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 4] call _fnc_addMagazines;

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
    ["primary", 5] call _fnc_addMagazines;
    ["primary", 1] call _fnc_addAdditionalMuzzleMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_rifleman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;
    ["lmgMag", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["Flashlight"] call _fnc_addNVGs;
};

private _medicTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["medVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["medUniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;
    [["medBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;
    [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
    ["primary", 4] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 3] call _fnc_addMagazines;

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
    ["glBackpacks"] call _fnc_setBackpack;

    ["grenadeLaunchers"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
    ["primary", 5] call _fnc_addAdditionalMuzzleMagazines;

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
    [["engUniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;
    [["engBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
    ["primary", 4] call _fnc_addMagazines;


    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 4] call _fnc_addMagazines;

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

private _engineerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["engVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["engUniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;
    [["engBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
    ["primary", 4] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 4] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_engineer_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    if (random 1 > 0.5) then {["lightExplosives", 3] call _fnc_addItem;};

    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["Flashlight"] call _fnc_addNVGs;
};

private _latTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["glVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["atBackpacks"] call _fnc_setBackpack;

    ["lightATLaunchers"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
    ["primary", 8] call _fnc_addAdditionalMuzzleMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_lat_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["Flashlight"] call _fnc_addNVGs;
};

private _atTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["atBackpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["ATLaunchers"] call _fnc_setLauncher;
    ["launcher", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_at_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["Flashlight"] call _fnc_addNVGs;
};

private _aaTemplate = {
    call selectRandom [_atTemplate, _latTemplate];
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
    ["sniHelmets"] call _fnc_setHelmet;
    [["sniVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["marksmanRifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

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
    ["Flashlight"] call _fnc_addNVGs;
    ["binoculars"] call _fnc_addBinoculars;
};

private _sniperTemplate = {
    ["sniHelmets"] call _fnc_setHelmet;
    [["sniVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["sniperRifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

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

    [selectRandom ["rifles", "shotGuns"]] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 3] call _fnc_addMagazines;

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

    ["SMGs"] call _fnc_setPrimary;
    ["primary", 2] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 4] call _fnc_addMagazines;

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
    ["primary", 2] call _fnc_addMagazines;
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
