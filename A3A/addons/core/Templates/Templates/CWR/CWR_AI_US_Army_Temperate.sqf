//////////////////////////
//   Side Information   //
//////////////////////////

["name", "US Army"] call _fnc_saveToTemplate;
["spawnMarkerName", "US support corridor"] call _fnc_saveToTemplate;

["flag", "Flag_US_F"] call _fnc_saveToTemplate;
["flagTexture", "a3\data_f\flags\flag_us_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_USA"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate;
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate;

["vehiclesBasic", ["B_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["cwr3_b_hmmwv", "cwr3_b_hmmwv", "cwr3_b_hmmwv_transport", "cwr3_b_hmmwv_transport", "cwr3_b_hmmwv_transport"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["cwr3_b_hmmwv_m2", "cwr3_b_hmmwv_m2", "cwr3_b_hmmwv_mk19", "cwr3_b_hmmwv_tow"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["cwr3_b_m939_open", "cwr3_b_m939"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["cwr3_b_m939_empty"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["cwr3_b_m939_reammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["cwr3_b_m939_repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["cwr3_b_m939_refuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["cwr3_b_hmmwv_mev", "cwr3_b_m939_mev"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["cwr3_b_m113a1", "cwr3_b_m113a1"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["cwr3_b_m2a2"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["cwr3_b_m2a2"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["cwr3_b_m60a3", "cwr3_b_m60a3_tts", "cwr3_b_m1", "cwr3_b_m1a1"]] call _fnc_saveToTemplate;
["vehiclesAA", ["cwr3_b_m163"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["B_Boat_Transport_01_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["cwr3_b_boat"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["cwr3_b_a10", "cwr3_b_f4e"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["cwr3_b_f16c", "cwr3_b_f4e"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["cwr3_b_c130"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["cwr3_b_mh6j"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["cwr3_b_uh1", "cwr3_b_uh1", "cwr3_b_uh1_armed", "cwr3_b_uh60_unarmed", "cwr3_b_uh60_unarmed", "cwr3_b_uh60_m240", "cwr3_b_uh60_m240", "cwr3_b_uh60_m2", "cwr3_b_uh60_m2", "cwr3_b_uh60"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["cwr3_b_kiowa_m2", "cwr3_b_kiowa_dyn", "cwr3_b_uh1_gunship", "cwr3_b_uh60_x4_esss", "cwr3_b_ah6j"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["cwr3_b_ah1f"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["cwr3_b_m119"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [["cwr3_b_m119", ["CUP_30Rnd_105mmHE_M119_M"]]]] call _fnc_saveToTemplate;

["uavsAttack", []] call _fnc_saveToTemplate;
["uavsPortable", []] call _fnc_saveToTemplate;

["vehiclesMilitiaLightArmed", ["cwr3_b_fia_m151_m2"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["cwr3_b_m939_open"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["cwr3_b_fia_m151"]] call _fnc_saveToTemplate;
["vehiclesPolice", ["B_GEN_Offroad_01_gen_F"]] call _fnc_saveToTemplate;

["staticMGs", ["CUP_B_M2StaticMG_US"]] call _fnc_saveToTemplate;
["staticAT", ["CUP_B_TOW2_TriPod_US"]] call _fnc_saveToTemplate;
["staticAA", ["CUP_B_CUP_Stinger_AA_pod_US"]] call _fnc_saveToTemplate;

["staticMortars", ["CUP_B_M252_US"]] call _fnc_saveToTemplate;
["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["minefieldAT", ["CUP_Mine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

#include "..\CUP\CUP_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["Barklem","GreekHead_A3_05","GreekHead_A3_06",
"GreekHead_A3_09","Sturrock","WhiteHead_02","WhiteHead_04",
"WhiteHead_05","WhiteHead_06","WhiteHead_09","WhiteHead_10",
"WhiteHead_11","WhiteHead_12","WhiteHead_13","WhiteHead_14",
"WhiteHead_15","WhiteHead_17","WhiteHead_18","WhiteHead_19",
"WhiteHead_20","WhiteHead_21"]] call _fnc_saveToTemplate;
["voices", ["Male01ENG","Male02ENG","Male03ENG","Male04ENG","Male06ENG","Male07ENG","Male08ENG","Male09ENG","Male10ENG","Male11ENG","Male12ENG"]] call _fnc_saveToTemplate;
"NATOMen" call _fnc_saveNames;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["slRifles", []];
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];

_loadoutData set ["lightATLaunchers", [
"cwr3_launch_m72a3"
]];
_loadoutData set ["missileATLaunchers", [
    ["CUP_launch_M47", "", "", "", ["CUP_Dragon_EP1_M"], [], ""],
    ["CUP_launch_M47", "", "", "", ["CUP_Dragon_EP1_M"], [], ""]
]];
_loadoutData set ["AALaunchers", [
    ["cwr3_launch_redeye", "", "", "", [""], [], ""]
]];
_loadoutData set ["ATLaunchers", [
    ["cwr3_launch_m67_rcl", "", "", "", ["cwr3_m67_rcl_heat_m", "cwr3_m67_rcl_heat_m"], [], ""]
]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiInfantryGrenades", ["CUP_HandGrenade_M67"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["cwr3_o_nvg_pnv57_tsh3"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["Rangefinder"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["slUniforms", []];
_loadoutData set ["mgVests", []];
_loadoutData set ["medVests", []];
_loadoutData set ["slVests", []];
_loadoutData set ["sniVests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["engVests", []];
_loadoutData set ["vests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["longRangeRadios", []];
_loadoutData set ["atBackpacks", []];
_loadoutData set ["slBackpacks", []];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", ["cwr3_b_headgear_cap_m81_woodland"]];
_loadoutData set ["sniHats", ["cwr3_i_headgear_boonie_woodland"]];


//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
private _slItems = ["Laserbatteries", "Laserbatteries", "Laserbatteries"];
private _eeItems = ["ToolKit", "MineDetector"];
private _mmItems = [];
private _sfmmItems = [""];

if (A3A_hasACE) then {
    _slItems append ["ACE_microDAGR", "ACE_DAGR"];
    _eeItems append ["ACE_Clacker", "ACE_DefusalKit"];
    _mmItems append ["ACE_RangeCard", "ACE_ATragMX", "ACE_Kestrel4500"];
};

_loadoutData set ["items_squadLeader_extras", _slItems];
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
_sfLoadoutData set ["items_marksman_extras", (_mmItems + _sfmmItems)];
_sfLoadoutData set ["items_sniper_extras", (_mmItems + _sfmmItems)];
_sfLoadoutData set ["uniforms", ["cwr3_b_uniform_m81_woodland_rangers"]];
_sfLoadoutData set ["vests", ["cwr3_b_vest_pasgt_alice_woodland_light"]];
_sfLoadoutData set ["mgVests", ["cwr3_b_vest_pasgt_alice_woodland_ar"]];
_sfLoadoutData set ["medVests", ["cwr3_b_vest_pasgt_alice_woodland_medic"]];
_sfLoadoutData set ["glVests", ["cwr3_b_vest_pasgt_alice_woodland_gl"]];
_sfLoadoutData set ["backpacks", ["cwr3_b_backpack_alice_base", "cwr3_b_backpack_alice"]];
_sfLoadoutData set ["slBackpacks", ["cwr3_b_backpack_radio"]];
_sfLoadoutData set ["atBackpacks", ["cwr3_b_backpack_alice"]];
_sfLoadoutData set ["helmets", ["cwr3_b_headgear_protec_full", "cwr3_b_headgear_protec_full_goggles", "cwr3_b_headgear_protec_half"]];
_sfLoadoutData set ["slHat", ["cwr3_b_headgear_protec_half_headset_goggles"]];
_sfLoadoutData set ["sniHats", ["cwr3_b_headgear_protec_half_plain"]];
_sfLoadoutData set ["binoculars", ["CUP_SOFLAM"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["slRifles", [
    ["cwr3_arifle_xms", "CUP_muzzle_snds_SCAR_L", "", "cwr3_optic_xms_dot", ["CUP_20Rnd_556x45_Stanag", "CUP_20Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
    ["cwr3_arifle_xms", "CUP_muzzle_snds_SCAR_L", "", "", ["CUP_20Rnd_556x45_Stanag", "CUP_20Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
    ["cwr3_arifle_xm177e2", "CUP_muzzle_snds_SCAR_L", "", "", ["CUP_20Rnd_556x45_Stanag", "CUP_20Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
    ["cwr3_arifle_m16a1_lsw", "", "", "", ["CUP_20Rnd_556x45_Stanag", "CUP_20Rnd_556x45_Stanag_Tracer_Yellow"], [], ""]
]];

_sfLoadoutData set ["rifles", [
    ["CUP_arifle_M16A2", "CUP_muzzle_snds_SCAR_L", "", "", ["CUP_20Rnd_556x45_Stanag", "CUP_20Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
    ["CUP_arifle_M16A1E1", "CUP_muzzle_snds_SCAR_L", "", "", ["CUP_20Rnd_556x45_Stanag", "CUP_20Rnd_556x45_Stanag_Tracer_Yellow"], [], ""]
]];
_sfLoadoutData set ["carbines", [
    ["CUP_arifle_Colt727", "CUP_muzzle_snds_SCAR_L", "", "", ["CUP_20Rnd_556x45_Stanag", "CUP_20Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
    ["CUP_arifle_Colt727", "CUP_muzzle_snds_SCAR_L", "", "", ["CUP_20Rnd_556x45_Stanag", "CUP_20Rnd_556x45_Stanag_Tracer_Yellow"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_M16A2_GL", "CUP_muzzle_snds_SCAR_L", "", "", ["CUP_20Rnd_556x45_Stanag", "CUP_20Rnd_556x45_Stanag_Tracer_Yellow"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_M16A1E1GL", "CUP_muzzle_snds_SCAR_L", "", "", ["CUP_20Rnd_556x45_Stanag", "CUP_20Rnd_556x45_Stanag_Tracer_Yellow"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""]
]];
_sfLoadoutData set ["SMGs", [
    ["CUP_smg_MP5SD6", "", "", "", ["CUP_30Rnd_Subsonic_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
    ["CUP_smg_MP5A5", "", "", "", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_9x19_MP5"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
    ["CUP_lmg_M249_E2", "", "", "", ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249", "CUP_200Rnd_TE1_Red_Tracer_556x45_M249_Pouch"], [], ""],
    ["cwr3_lmg_m60e3", "", "", "", ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M", "CUP_100Rnd_TE4_LRT4_Yellow_Tracer_762x51_Belt_M"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
    ["cwr3_arifle_xms", "CUP_muzzle_snds_SCAR_L", "", "cwr3_optic_xms_cross", ["CUP_20Rnd_556x45_Stanag", "CUP_20Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
    ["cwr3_arifle_xr47", "CUP_muzzle_snds_SCAR_L", "", "cwr3_optic_xms_cross", ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_M"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [
    ["CUP_srifle_M24_blk", "", "", "CUP_optic_LeupoldMk4", ["CUP_5Rnd_762x51_M24"], [], "bipod_01_F_blk"],
    ["CUP_srifle_M24_blk", "", "", "CUP_optic_LeupoldM3LR", ["CUP_5Rnd_762x51_M24"], [], "bipod_01_F_blk"]
]];
_sfLoadoutData set ["sidearms", [
    ["CUP_hgun_Colt1911", "", "", "", ["CUP_7Rnd_45ACP_1911"], [], ""]
]];
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["cwr3_b_uniform_m81_woodland", "cwr3_b_uniform_m81_woodland_early"]];
_militaryLoadoutData set ["slUniforms", ["cwr3_b_uniform_m81_woodland_gloves_early"]];
_militaryLoadoutData set ["vests", ["cwr3_b_vest_pasgt_alice_woodland"]];
_militaryLoadoutData set ["mgVests", ["cwr3_b_vest_pasgt_alice_woodland_ar"]];
_militaryLoadoutData set ["medVests", ["cwr3_b_vest_pasgt_alice_woodland_medic"]];
_militaryLoadoutData set ["slVests", ["cwr3_b_vest_pasgt_alice_woodland_officer"]];
_militaryLoadoutData set ["glVests", ["cwr3_b_vest_pasgt_alice_woodland_gl"]];
_militaryLoadoutData set ["engVests", ["cwr3_b_vest_pasgt_alice_woodland_etool"]];
_militaryLoadoutData set ["backpacks", ["cwr3_b_backpack_alice", "cwr3_b_backpack_alice"]];
_militaryLoadoutData set ["slBackpacks", ["cwr3_b_backpack_radio"]];
_militaryLoadoutData set ["atBackpacks", ["cwr3_b_backpack_alice"]];
_militaryLoadoutData set ["helmets", ["cwr3_b_headgear_pasgt_m81_woodland", "cwr3_b_headgear_pasgt_m81_woodland_camonet", "cwr3_b_headgear_pasgt_m81_woodland_net"]];
_militaryLoadoutData set ["binoculars", ["Binocular"]];

_militaryLoadoutData set ["slRifles", [
    ["CUP_arifle_M16A1E1", "", "", "", ["CUP_20Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_arifle_M16A2", "", "", "", ["CUP_20Rnd_556x45_Stanag", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""]
]];
_militaryLoadoutData set ["rifles", [
    ["CUP_arifle_M16A1E1", "", "", "", ["CUP_30Rnd_556x45_Stanag_Tracer_Green", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["CUP_srifle_M21", "", "", "", ["CUP_20Rnd_762x51_DMR", "CUP_20Rnd_762x51_DMR"], [], ""],
    ["CUP_arifle_M16A1", "", "", "", ["CUP_30Rnd_556x45_Stanag_Tracer_Green", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
    ["CUP_arifle_Colt727", "", "", "", ["CUP_30Rnd_556x45_Stanag_Tracer_Green", "CUP_30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
    ["cwr3_arifle_xms", "", "", "cwr3_optic_xms_dot", ["CUP_20Rnd_556x45_Stanag", "CUP_20Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
    ["cwr3_arifle_xms", "", "", "cwr3_optic_xms_dot", ["CUP_30Rnd_556x45_Stanag_Tracer_Green", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""],
    ["cwr3_arifle_xms", "", "", "", ["CUP_30Rnd_556x45_Stanag_Tracer_Green", "CUP_30Rnd_556x45_Stanag_Tracer_Red"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_M16A1E1GL", "", "", "", ["CUP_30Rnd_556x45_Stanag_Tracer_Green", "CUP_30Rnd_556x45_Stanag"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_M16A2_GL", "", "", "", ["CUP_30Rnd_556x45_Stanag_Tracer_Green", "CUP_30Rnd_556x45_Stanag_Tracer_Yellow"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""]
]];
_militaryLoadoutData set ["SMGs", [
    ["CUP_smg_MP5A5", "", "", "", ["CUP_30Rnd_Subsonic_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
    ["CUP_smg_MP5A5", "", "", "", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Yellow_Tracer_9x19_MP5"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
    ["CUP_lmg_M249_E1", "", "", "", ["CUP_200Rnd_TE1_Red_Tracer_556x45_M249"], [], ""],
    ["CUP_lmg_M249_E2", "", "", "", ["CUP_200Rnd_TE4_Yellow_Tracer_556x45_M249_Pouch"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
    ["CUP_srifle_M21", "", "", "CUP_optic_artel_m14", ["CUP_20Rnd_762x51_DMR"], [], ""],
    ["CUP_srifle_M21", "", "", "CUP_optic_artel_m14", ["CUP_20Rnd_TE1_Yellow_Tracer_762x51_DMR"], [], ""],
    ["CUP_srifle_M21", "", "", "", ["CUP_20Rnd_762x51_DMR"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
    ["CUP_srifle_M24_blk", "", "", "CUP_optic_LeupoldM3LR", ["CUP_5Rnd_762x51_M24"], [], ""],
    ["CUP_srifle_M24_blk", "", "", "CUP_optic_LeupoldMk4", ["CUP_5Rnd_762x51_M24"], [], ""],
    ["CUP_srifle_M24_blk", "", "", "CUP_optic_LeupoldMk4_20x40_LRT", ["CUP_5Rnd_762x51_M24"], [], ""]
]];
_militaryLoadoutData set ["lightATLaunchers", [
    ["cwr3_launch_m72a3", "", "", "", [""], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
    ["CUP_hgun_Colt1911", "", "", "", ["CUP_7Rnd_45ACP_1911"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["U_B_GEN_Soldier_F", "U_B_GEN_Commander_F"]];
_policeLoadoutData set ["vests", ["V_TacVest_blk_POLICE"]];
_policeLoadoutData set ["helmets", ["H_Cap_police"]];

_policeLoadoutData set ["shotGuns", [
    ["CUP_sgun_CZ584", "", "", "", ["CUP_1Rnd_12Gauge_Pellets_No00_Buck"], ["CUP_1Rnd_762x51_CZ584"], ""]
]];
_policeLoadoutData set ["SMGs", [
    ["CUP_smg_M3A1_blk", "", "", "", ["CUP_30Rnd_45ACP_M3A1_BLK_M"], [], ""],
    ["CUP_smg_M3A1_blk", "", "", "", ["CUP_30Rnd_45ACP_M3A1_BLK_M"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
    ["CUP_hgun_Colt1911", "", "", "", ["CUP_7Rnd_45ACP_1911"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["cwr3_b_uniform_og107"]];
_militiaLoadoutData set ["vests", ["cwr3_b_vest_alice"]];
_militiaLoadoutData set ["sniVests", ["cwr3_b_vest_alice_light"]];
_militiaLoadoutData set ["backpacks", ["cwr3_b_backpack_alice", "cwr3_i_bergen_backpack_od"]];
_militiaLoadoutData set ["slBackpacks", ["cwr3_b_backpack_radio"]];
_militiaLoadoutData set ["atBackpacks", ["cwr3_b_backpack_alice"]];
_militiaLoadoutData set ["helmets", ["cwr3_b_headgear_m1_olive"]];
_militiaLoadoutData set ["NVGs", []];

_militiaLoadoutData set ["rifles", [
    ["CUP_arifle_M16A1", "", "", "", ["CUP_30Rnd_556x45_Stanag"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
    ["CUP_arifle_Colt727", "", "", "", ["CUP_30Rnd_556x45_Stanag"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
    ["CUP_arifle_M16A1GL", "", "", "", ["CUP_30Rnd_556x45_Stanag"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""],
    ["CUP_arifle_M16A1GL_USA", "", "", "", ["CUP_30Rnd_556x45_Stanag"], ["CUP_1Rnd_HE_M203", "CUP_1Rnd_HEDP_M203", "CUP_1Rnd_Smoke_M203"], ""]
]];
_militiaLoadoutData set ["SMGs", [
    ["CUP_smg_M3A1_blk", "", "", "", ["CUP_30Rnd_45ACP_M3A1_BLK_M"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
    ["cwr3_lmg_m60e3", "", "", "", ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M"], [], ""],
    ["CUP_lmg_M249_E1", "", "", "", ["CUP_100Rnd_TE4_Green_Tracer_556x45_M249"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
    ["CUP_srifle_M21", "", "", "", ["CUP_20Rnd_762x51_DMR"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
    ["CUP_srifle_M24_wdl", "", "", "CUP_optic_LeupoldM3LR", ["CUP_5Rnd_762x51_M24"], [], ""]
]];
_militiaLoadoutData set ["lightATLaunchers", [
    ["cwr3_launch_m72a3", "", "", "", [""], [], ""]
]];
_militiaLoadoutData set ["sidearms", [
    ["CUP_hgun_Colt1911", "", "", "", ["CUP_7Rnd_45ACP_1911"], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["cwr3_b_uniform_tanksuit"]];
_crewLoadoutData set ["vests", ["cwr3_b_vest_pasgt_alice_od_crew"]];
_crewLoadoutData set ["helmets", ["cwr3_b_headgear_cvc_goggles"]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["cwr3_b_uniform_pilot"]];
_pilotLoadoutData set ["vests", ["cwr3_b_vest_pilot"]];
_pilotLoadoutData set ["helmets", ["cwr3_b_headgear_pilot"]];


/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////
//These define the loadouts for different unit types.
//For example, rifleman, grenadier, squad leader, etc.
//In 95% of situations, you *should not need to edit these*.
//Almost all factions can be set up just by modifying the loadout data above.
//However, these exist in case you really do want to do a lot of custom alterations.

private _squadLeaderTemplate = {
    ["slHat"] call _fnc_setHelmet;
    [["slVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["slUniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;
    [["slBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [["slRifles", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_squadLeader_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["antiTankGrenades", 1] call _fnc_addItem;
    ["signalsmokeGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["gpses"] call _fnc_addGPS;
    ["binoculars"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _riflemanTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    ["rifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_rifleman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["antiTankGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _medicTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["medVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["carbines"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

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
    ["NVGs"] call _fnc_addNVGs;
};

private _grenadierTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["glVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["grenadeLaunchers"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
    ["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

    [["glSidearms", "sidearms"] call _fnc_fallback] call _fnc_setHandgun;
    ["handgun", 3] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_grenadier_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 4] call _fnc_addItem;
    ["antiTankGrenades", 3] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _explosivesExpertTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["engVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["rifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;


    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_explosivesExpert_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["lightExplosives", 2] call _fnc_addItem;
    if (random 1 > 0.5) then {["heavyExplosives", 1] call _fnc_addItem;};
    if (random 1 > 0.5) then {["atMines", 1] call _fnc_addItem;};
    if (random 1 > 0.5) then {["apMines", 1] call _fnc_addItem;};

    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _engineerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["engVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["carbines"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_engineer_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    if (random 1 > 0.5) then {["lightExplosives", 1] call _fnc_addItem;};

    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _latTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["rifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["lightATLaunchers"] call _fnc_setLauncher;
    ["launcher", 1] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_lat_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["antiTankGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _atTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    ["rifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    [selectRandom ["missileATLaunchers", "ATLaunchers"]] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 2] call _fnc_addMagazines;
    ["launcher", 2] call _fnc_addAdditionalMuzzleMagazines;
    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_at_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["antiTankGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _aaTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    ["rifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["AALaunchers"] call _fnc_setLauncher;
    ["launcher", 2] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_aa_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _machineGunnerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["mgVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["machineGuns"] call _fnc_setPrimary;
    ["primary", 4] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_machineGunner_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _marksmanTemplate = {
    ["sniHats"] call _fnc_setHelmet;
    [["sniVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    ["marksmanRifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_marksman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["rangefinders"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _sniperTemplate = {
    ["sniHats"] call _fnc_setHelmet;
    [["sniVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["sniperRifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_sniper_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["rangefinders"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _policeTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    private _weapon = selectRandom ["SMGs", "shotGuns"];
    [_weapon] call _fnc_setPrimary;
    if (_weapon == "shotGuns") then {
        ["primary", 10] call _fnc_addMagazines;
    } else {
        ["primary", 3] call _fnc_addMagazines;
    };
    ["primary", 5] call _fnc_addAdditionalMuzzleMagazines;

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
};

private _crewTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [["SMGs", "carbines"] call _fnc_fallback] call _fnc_setPrimary;
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
    ["gpses"] call _fnc_addGPS;
    ["NVGs"] call _fnc_addNVGs;
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
};

private _traitorTemplate = {
    call _unarmedTemplate;
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
    ["SquadLeader", _policeTemplate],
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
["other", [["Official", _SquadLeaderTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;