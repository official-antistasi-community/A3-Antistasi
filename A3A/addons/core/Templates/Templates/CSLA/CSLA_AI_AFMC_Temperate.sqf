//////////////////////////
//   Side Information   //
//////////////////////////

["name", "AFMC"] call _fnc_saveToTemplate;
["spawnMarkerName", "AFMC support corridor"] call _fnc_saveToTemplate;

["flag", "Flag_AltisColonial_F"] call _fnc_saveToTemplate;
["flagTexture", "\A3\ui_f\data\map\markers\flags\AltisColonial_ca.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_AltisColonial"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate;
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate;

["vehiclesBasic", ["B_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["AFMC_M1008", "US85_M998"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["AFMC_M1008_M2", "AFMC_M1008_MK19", "US85_M1025_TOW", "AFMC_M923A1_GT"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["AFMC_M923o", "AFMC_M923c"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["AFMC_M923cargo", "AFMC_M1008c"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["AFMC_M923a"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["AFMC_M923r", "AFMC_M113A2_DTP"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["AFMC_M923f"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["AFMC_M113A2_AMB"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["AFMC_M113A1", "AFMC_M113A1_Mk19", "AFMC_M113A2ext", "US85_M113A1_TOW"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["AFMC_LAV25"]] call _fnc_saveToTemplate;            
["vehiclesIFVs", []] call _fnc_saveToTemplate;
["vehiclesTanks", ["CUP_B_Leopard_1A3GRN_GER"]] call _fnc_saveToTemplate;
["vehiclesAA", ["AFMC_M163"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["I_C_Boat_Transport_02_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["CUP_B_RHIB2Turret_USMC"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", ["AFMC_LAV25"]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["CUP_B_A10_DYN_USA"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["CUP_B_GR9_DYN_GB"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["CUP_B_C47_USA"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["AFMC_UH60"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["AFMC_UH60M240"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["US85_MH60FFAR"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["AFMC_AH1F"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["US85_M270_DES"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [["US85_M270_DES", ["CUP_12Rnd_MLRS_HE"]]]] call _fnc_saveToTemplate;

["uavsAttack", []] call _fnc_saveToTemplate;
["uavsPortable", []] call _fnc_saveToTemplate;

["vehiclesMilitiaLightArmed", ["AFMC_M1008_M2"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["AFMC_M1008"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["AFMC_M1008"]] call _fnc_saveToTemplate;
["vehiclesPolice", ["CSLA_CIV_Sarka1200PO"]] call _fnc_saveToTemplate;

["staticMGs", ["US85_M2h"]] call _fnc_saveToTemplate;
["staticAT", ["US85_TOW_Stat"]] call _fnc_saveToTemplate;
["staticAA", ["CUP_B_RBS70_ACR"]] call _fnc_saveToTemplate;

["staticMortars", ["CUP_B_M252_US"]] call _fnc_saveToTemplate;
["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["minefieldAT", ["US85_M87A1Mine_mag"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["US85_M14Mine_mag"]] call _fnc_saveToTemplate;

#include "CSLA_Vehicle_Attributes.sqf"

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

_loadoutData set ["missileATLaunchers", [
    ["US85_M47", "", "", "", ["US85_M1008_DES"], [], ""],
    ["US85_M47", "", "", "", ["US85_M1008_DES"], [], ""]
]];
_loadoutData set ["AALaunchers", [
    ["US85_FIM92", "", "", "", ["US85_FIM92_Mag"], [], ""]
]];
_loadoutData set ["ATLaunchers", [
    ["US85_SMAW", "", "", "", ["US85_SMAW_HEAA", "US85_SMAW_HEDP"], [], ""]
]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiInfantryGrenades", ["US85_M67"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["US85_ANPVS5_Goggles"]];
_loadoutData set ["binoculars", ["US85_bino"]];
_loadoutData set ["rangefinders", []];

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
_loadoutData set ["slHat", ["US85_M1008_DES"]];
_loadoutData set ["sniHats", ["US85_M1008_DES"]];


//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
private _slItems = ["Laserbatteries", "Laserbatteries", "Laserbatteries"];
private _eeItems = ["ToolKit"];
private _mmItems = [];
private _sfmmItems = [""];

if (A3A_hasACE) then {
	_slItems append ["ACE_DAGR"];
	_eeItems append ["ACE_Clacker", "ACE_DefusalKit"];
	_mmItems append ["ACE_RangeCard"];
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
_sfLoadoutData set ["uniforms", ["US85_M1008_DES"]];
_sfLoadoutData set ["vests", ["US85_grSF_M16", "US85_grSF_M24"]];
_sfLoadoutData set ["mgVests", ["US85_grSF_MG"]];
_sfLoadoutData set ["medVests", ["US85_grSF_M9"]];
_sfLoadoutData set ["glVests", ["US85_grSF_M16GL"]];
_sfLoadoutData set ["backpacks", ["US85_bpAlice", "B_AssaultPack_khk"]];
_sfLoadoutData set ["slBackpacks", ["US85_bpPRC77"]];
_sfLoadoutData set ["atBackpacks", ["US85_bpAlice"]];
_sfLoadoutData set ["helmets", ["US85_helmetSFLG", "US85_helmetSFLG_on", "US85_helmetSFL", "US85_beanie"]];
_sfLoadoutData set ["slHat", ["H_Watchcap_camo"]];
_sfLoadoutData set ["sniHats", ["US85_hat"]];
_sfLoadoutData set ["NVGs", ["US85_ANPVS5_Goggles"]];
_sfLoadoutData set ["binoculars", ["US85_bino"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["slRifles", [
    ["CUP_arifle_FNFAL5060", "CUP_muzzle_snds_socom762rc", "", "", ["CUP_20Rnd_762x51_FNFAL_M"], [], ""],
    ["US85_M16A2CARGL", "", "", "US85_ANPVS4_M16", ["US85_30Rnd_556x45"], ["US85_M406", "US85_M583A1", "1Rnd_Smoke_Grenade_shell"], ""],
    ["US85_M16A2CARGL", "", "", "US85_sc2000_M16", ["US85_30Rnd_556x45"], ["US85_M406", "US85_M583A1", "1Rnd_Smoke_Grenade_shell"], ""]
]];

_sfLoadoutData set ["rifles", [
    ["CUP_arifle_FNFAL5060", "CUP_muzzle_snds_SCAR_H", "", "", ["CUP_20Rnd_762x51_FNFAL_M"], [], ""],
    ["US85_M21", "US85_M21tlm", "", "", ["US85_20Rnd_762x51"], [], ""]
]];
_sfLoadoutData set ["carbines", [
    ["US85_M16A2CAR", "US85_M16tlm", "", "", ["US85_30Rnd_556x45"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["US85_M16A2GL", "", "", "US85_sc4x20_M16", ["US85_30Rnd_556x45"], ["US85_M406", "US85_M583A1", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_sfLoadoutData set ["SMGs", [
    ["US85_MPVSD", "", "", "", ["US85_MPV_30Rnd_9Luger"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
    ["US85_M60E3LB", "", "", "US85_ANPVS4_M60", ["US85_100Rnd_762x51"], [], ""],
    ["US85_M60E3LB", "", "", "", ["US85_100Rnd_762x51"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
    ["US85_M21", "US85_M21tlm", "", "US85_ANPVS4_M21", ["US85_20Rnd_762x51", "US85_20Rnd_762M61"], [], ""],
    ["US85_M21", "US85_M21tlm", "", "US85_scM21", ["US85_20Rnd_762x51", "US85_20Rnd_762M61"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [
    ["CUP_srifle_M24_blk", "muzzle_snds_B", "", "CUP_optic_LeupoldMk4", ["CUP_5Rnd_762x51_M24"], [], "bipod_01_F_blk"],
    ["CUP_srifle_M24_blk", "muzzle_snds_B", "", "CUP_optic_LeupoldMk4_20x40_LRT", ["CUP_5Rnd_762x51_M24"], [], "bipod_01_F_blk"]
]];
_sfLoadoutData set ["lightATLaunchers", [
    ["US85_LAW72", "", "", "", ["US85_LAW72_Mag"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
    ["US85_Mk23", "US85_Mk23tlm", "", "", ["US85_Mk23_12Rnd_045ACP"], [], ""]
]];
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["AFMC_uniWLD"]];
_militaryLoadoutData set ["vests", ["AFMC_grY_FAL", "US85_grY_M16"]];
_militaryLoadoutData set ["mgVests", ["AFMC_grY_MG"]];
_militaryLoadoutData set ["medVests", ["US85_grY_snp"]];
_militaryLoadoutData set ["backpacks", ["FIA_bpAlice", "US85_bpSf"]];
_militaryLoadoutData set ["slBackpacks", ["US85_bpPRC77"]];
_militaryLoadoutData set ["atBackpacks", ["US85_bpAliceSMAW"]];
_militaryLoadoutData set ["helmets", ["AFMC_helmetMk6", "AFMC_helmetMk6para", "AFMC_helmetMk6r"]];
_militaryLoadoutData set ["binoculars", ["US85_bino"]];

_militaryLoadoutData set ["slRifles", [
    ["US85_FALf", "", "", "US85_scFAL", ["US85_20Rnd_762x51"], [], ""],
    ["US85_FALf", "", "", "", ["US85_20Rnd_762x51"], [], ""],
    ["US85_FAL", "", "", "", ["US85_20Rnd_762x51"], [], ""]
]];
_militaryLoadoutData set ["rifles", [
    ["US85_FAL", "", "", "", ["US85_20Rnd_762x51"], [], ""],
    ["US85_M16A1", "", "", "", ["US85_30Rnd_556x45"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
    ["US85_M16A2CAR", "", "", "", ["US85_20Rnd_556x45"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
    ["US85_M16A2CARGL", "", "", "US85_sc2000_M16", ["US85_20Rnd_556x45"], ["US85_M406", "US85_M583A1", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_militaryLoadoutData set ["SMGs", [
    ["US85_MPVN1", "", "", "", ["US85_MPV_30Rnd_9Luger"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
    ["US85_M60E3LB", "", "", "", ["US85_100Rnd_762x51"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
    ["US85_M21", "", "", "US85_scM21", ["US85_20Rnd_762x51"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
    ["CSLA_HuntingRifle", "", "", "", ["CSLA_10Rnd_762hunt"], [], ""]
]];
_militaryLoadoutData set ["lightATLaunchers", [
    ["US85_LAW72", "", "", "", ["US85_LAW72_Mag"], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
    ["US85_1911", "", "", "", ["US85_1911_7Rnd_045ACP"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["FIA_uniWld8"]];
_policeLoadoutData set ["vests", ["US85_grY_snp"]];
_policeLoadoutData set ["helmets", ["AFMC_beretBe"]];

_policeLoadoutData set ["shotGuns", [
    ["CUP_sgun_CZ584", "", "", "", ["CUP_1Rnd_12Gauge_Pellets_No00_Buck"], [], ""]
]];
_policeLoadoutData set ["SMGs", [
    ["US85_MPVN", "", "", "", ["US85_MPV_30Rnd_9Luger"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
    ["US85_1911", "", "", "", ["US85_1911_7Rnd_045ACP"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["US85_uniKHK"]];
_militiaLoadoutData set ["vests", ["US85_grY_M16", "US85_grY_M24", "US85_grY_M9"]];
_militiaLoadoutData set ["backpacks", ["US85_bpAlice"]];
_militiaLoadoutData set ["slBackpacks", ["US85_bpPRC77"]];
_militiaLoadoutData set ["atBackpacks", ["US85_bpAlice"]];
_militiaLoadoutData set ["helmets", ["US85_helmetM1g"]];

_militiaLoadoutData set ["rifles", [
    ["US85_M16A1", "", "", "", ["US85_20Rnd_556x45"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
    ["US85_M16A2CAR", "", "", "", ["US85_20Rnd_556x45"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
    ["US85_M16A2GL", "", "", "", ["US85_20Rnd_556x45"], ["US85_M406", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_militiaLoadoutData set ["SMGs", [
    ["US85_MPVN", "", "", "", ["US85_MPV_30Rnd_9Luger"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
    ["US85_M249", "", "", "", ["US85_200Rnd_556x45"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
    ["US85_M14", "", "", "", ["US85_20Rnd_762x51"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
    ["CSLA_HuntingRifle", "", "", "", ["CSLA_10Rnd_762hunt"], [], ""]
]];
_militiaLoadoutData set ["lightATLaunchers", [
    ["US85_LAW72", "", "", "", ["US85_LAW72_Mag"], [], ""]
]];
_militiaLoadoutData set ["sidearms", [
    ["US85_1911", "", "", "", ["US85_1911_7Rnd_045ACP",7], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["US85_uniCrew"]];
_crewLoadoutData set ["vests", ["US85_grVest"]];
_crewLoadoutData set ["helmets", ["US85_helmetDH132G", "US85_helmetDH132", "US85_helmetDH132G_on"]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["AFMC_uniPlt"]];
_pilotLoadoutData set ["vests", []];
_pilotLoadoutData set ["helmets", ["US85_helmetPltAttackC", "US85_helmetPltAttack", "US85_helmetPlt", "US85_helmetPltC"]];


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


    [selectRandom ["SMGs", "shotGuns"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

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