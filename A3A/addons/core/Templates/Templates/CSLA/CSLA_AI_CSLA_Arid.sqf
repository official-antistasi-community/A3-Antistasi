//////////////////////////
//   Side Information   //
//////////////////////////

["name", "CSLA"] call _fnc_saveToTemplate;
["spawnMarkerName", "CSLA support corridor"] call _fnc_saveToTemplate;

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate;
["flagTexture", "\A3\ui_f\data\map\markers\flags\CzechRepublic_ca.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_CzechRepublic"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate;
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate;

["vehiclesBasic", ["B_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["CSLA_AZU_para_des", "CSLA_AZU_R2_des", "CSLA_AZU_des"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["CUP_O_UAZ_MG_SLA", "CUP_O_UAZ_AGS30_SLA"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["CSLA_V3S_des", "CSLA_F813_des"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["CSLA_F813o"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["CSLA_V3Sa_des"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["CSLA_V3Sr_des"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["CSLA_V3Sf_des"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["CSLA_OZV90_Des"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["CSLA_OT62_Des", "CSLA_OT62D_Des", "CSLA_OT64C_des", "CSLA_OT65A_des"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["CSLA_BVP1_Des", "CSLA_BPzV_Des"]] call _fnc_saveToTemplate;            
["vehiclesIFVs", []] call _fnc_saveToTemplate;
["vehiclesTanks", ["CUP_O_T55_SLA", "CUP_O_T72_SLA"]] call _fnc_saveToTemplate;
["vehiclesAA", ["CSLA_PLdvK59V3S_des", "CUP_O_ZSU23_Afghan_SLA"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["CSLA_lodka"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["CUP_B_RHIB_HIL"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["CUP_O_Su25_Dyn_RU"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["I_Plane_Fighter_03_dynamicLoadout_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["CUP_O_C47_SLA"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["CSLA_Mi17_DES"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["CSLA_Mi17mg_DES", "CSLA_Mi17_DES"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["CSLA_Mi17pylons_DES"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["CSLA_Mi24V_DES"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["CSLA_ShKH77_des"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [["CSLA_ShKH77_des", ["CSLA_54Rnd_152EOF"]]]] call _fnc_saveToTemplate;

["uavsAttack", []] call _fnc_saveToTemplate;
["uavsPortable", []] call _fnc_saveToTemplate;

["vehiclesMilitiaLightArmed", ["CUP_O_UAZ_MG_SLA"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["CSLA_V3S_des"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["CSLA_AZU_para_des"]] call _fnc_saveToTemplate;
["vehiclesPolice", ["CSLA_CIV_Sarka1200PO"]] call _fnc_saveToTemplate;

["staticMGs", ["CSLA_UK59L_Stat", "CSLA_DShKM_h_Stat"]] call _fnc_saveToTemplate;
["staticAT", ["CSLA_9K113_Stat", "CSLA_T21_Stat", "CSLA_BzK59A_Stat"]] call _fnc_saveToTemplate;
["staticAA", ["CSLA_PLdvK59_Stat"]] call _fnc_saveToTemplate;

["staticMortars", ["CUP_O_2b14_82mm_RU"]] call _fnc_saveToTemplate;
["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["minefieldAT", ["CSLA_PtMiBa3_mag"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["CSLA_PPMiSr2_mag"]] call _fnc_saveToTemplate;

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

_loadoutData set ["AALaunchers", [
    ["CSLA_9K32", "", "", "", ["CSLA_9M32M"], [], ""]
]];
_loadoutData set ["ATLaunchers", [
    ["CSLA_RPG7", "", "", "CSLA_PGO7", ["CSLA_PG7M110V", "CUP_OG7_M"], [], ""],
    ["CSLA_P27", "", "", "", ["CSLA_NbP27"], [], ""],
    ["CSLA_RPG7", "", "", "", ["CUP_PG7VM_M", "CUP_OG7_M"], [], ""]
]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiInfantryGrenades", ["CSLA_RG4u", "CSLA_RG4o", "CSLA_F1"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", []];
_loadoutData set ["NVGs", ["CSLA_nokto"]];
_loadoutData set ["binoculars", ["CSLA_bino"]];
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
_loadoutData set ["slHat", ["CSLA_capDes"]];
_loadoutData set ["sniHats", ["CSLA_hat85Des"]];


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
_sfLoadoutData set ["uniforms", ["FIA_uniDES"]];
_sfLoadoutData set ["vests", ["CSLA_gr85lrrBase", "CSLA_gr85lrrBino"]];
_sfLoadoutData set ["mgVests", ["CSLA_gr85ptMg"]];
_sfLoadoutData set ["medVests", ["CSLA_gr85lrrUTON"]];
_sfLoadoutData set ["backpacks", ["CSLA_bp85", "CSLA_bp85msn", "CSLA_bp85Lrr"]];
_sfLoadoutData set ["slBackpacks", ["CSLA_bp85RF10", "CSLA_bpWpR129", "CSLA_bpWpRF10"]];
_sfLoadoutData set ["atBackpacks", ["CSLA_bpRPG7"]];
_sfLoadoutData set ["helmets", ["CSLA_helmet53G", "CSLA_helmet53"]];
_sfLoadoutData set ["slHat", ["CSLA_beretR"]];
_sfLoadoutData set ["sniHats", ["FIA_hat85Des"]];
_sfLoadoutData set ["NVGs", ["CSLA_nokto"]];
_sfLoadoutData set ["binoculars", ["CSLA_bino"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["slRifles", [
    ["CUP_arifle_Sa58V", "CUP_muzzle_Bizon", "", "", ["CUP_30Rnd_Sa58_M"], [], ""],
    ["CSLA_Sa24", "", "", "", ["CSLA_Sa24_32rnd_7_62Pi52"], [], ""]
]];

_sfLoadoutData set ["rifles", [
    ["CUP_arifle_Sa58P_wood", "CUP_muzzle_Bizon", "", "", ["CUP_30Rnd_Sa58_M"], [], ""]
]];
_sfLoadoutData set ["carbines", [
    ["CSLA_Sa58V", "", "", "", ["CSLA_Sa58_30rnd_7_62vz43"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["CSLA_VG70", "", "", "", ["CSLA_Sa58_30rnd_7_62vz43"], ["CSLA_26_5vz70", "CSLA_26_5sigB1a", "CSLA_26_5sigCrD"], ""]
]];
_sfLoadoutData set ["SMGs", [
    ["CSLA_Sa26", "", "", "", ["CSLA_Sa24_32rnd_7_62Pi52"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
    ["CSLA_UK59L", "", "", "CSLA_UK59_ZD4x8", ["CSLA_UK59_50rnd_7_62PZ59"], [], ""],
    ["CSLA_UK59L", "", "", "", ["CSLA_UK59_50rnd_7_62PZ59"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
    ["CUP_srifle_SVD", "CUP_muzzle_snds_KZRZP_SVD", "", "CUP_optic_PSO_1", ["CSLA_OP63_10rnd_7_62Odst59"], [], ""],
    ["CUP_srifle_SVD", "CUP_muzzle_snds_KZRZP_SVD", "", "CUP_optic_PSO_1_AK", ["CSLA_OP63_10rnd_7_62Odst59"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [
    ["CUP_srifle_SVD", "CUP_muzzle_snds_KZRZP_SVD", "", "CUP_optic_PSO_1", ["CSLA_OP63_10rnd_7_62Odst59"], [], ""]
]];
_sfLoadoutData set ["lightATLaunchers", [
    ["CSLA_RPG75", "", "", "", ["CSLA_RPG75_Mag"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
    ["CSLA_Pi82", "", "", "", ["CSLA_Pi82_12rnd_9Pi82"], [], ""]
]];
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["CSLA_uniDES"]];
_militaryLoadoutData set ["vests", ["CSLA_gr60rfl", "FIA_gr60_Sa58"]];
_militaryLoadoutData set ["mgVests", ["CSLA_gr60UK59"]];
_militaryLoadoutData set ["medVests", ["CSLA_gr60medic"]];
_militaryLoadoutData set ["slVests", ["CSLA_gr60ofc1"]];
_militaryLoadoutData set ["glVests", ["CSLA_gr60tankPi82"]];
_militaryLoadoutData set ["backpacks", ["FIA_bpPack", "CSLA_bp60"]];
_militaryLoadoutData set ["slBackpacks", ["CSLA_bpWpRF10"]];
_militaryLoadoutData set ["atBackpacks", ["CSLA_bpRPG7"]];
_militaryLoadoutData set ["helmets", ["CSLA_helmet53Des", "CSLA_helmet53Des","FIA_helmet53Des"]];
_militaryLoadoutData set ["binoculars", ["CSLA_bino"]];

_militaryLoadoutData set ["slRifles", [
    ["CSLA_Sa58V", "", "", "", ["CSLA_Sa58_30rnd_7_62vz43"], [], "CSLA_Sa58bpd"],
    ["CSLA_Sa58V", "", "", "", ["CSLA_Sa58_30rnd_7_62Sv43"], [], ""]
]];
_militaryLoadoutData set ["rifles", [
    ["CSLA_Sa58P", "", "", "CSLA_ZD4x8", ["CSLA_Sa58_30rnd_7_62vz43"], [], ""],
    ["CSLA_Sa58P", "", "", "", ["CSLA_Sa58_30rnd_7_62Sv43"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
    ["CSLA_Sa58V", "", "", "", ["CSLA_Sa58_30rnd_7_62vz43"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
    ["CSLA_VG70", "", "", "", ["CSLA_Sa58_30rnd_7_62vz43"], ["CSLA_26_5vz70", "CSLA_26_5sigB1a", "CSLA_26_5sigCrD"], ""]
]];
_militaryLoadoutData set ["SMGs", [
    ["CSLA_rSa61", "", "", "", ["CSLA_Sa61_20rnd_7_65Pi27"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
    ["CSLA_UK59L", "", "", "CSLA_UK59_ZD4x8", ["CSLA_UK59_50rnd_7_62vz59"], [], ""],
    ["CSLA_UK59L", "", "", "", ["CSLA_UK59_50rnd_7_62TzSv59"], [], ""],
    ["CSLA_LK57_50", "", "", "", ["CSLA_LK57_50rnd_7_62PZ43"], [], ""],
    ["CSLA_UK59L", "", "", "", ["CSLA_UK59_50rnd_7_62Tz59"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
    ["CSLA_OP63", "", "", "CSLA_PSO1_OP63", ["CSLA_OP63_10rnd_7_62Odst59"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
    ["CSLA_OP63", "", "", "CSLA_PSO1_OP63", ["CSLA_OP63_10rnd_7_62PZ59"], [], ""]
]];
_militaryLoadoutData set ["lightATLaunchers", [
    ["CSLA_RPG75", "", "", "", ["CSLA_RPG75_Mag"], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
    ["CSLA_Pi82", "", "", "", ["CSLA_Pi82_12rnd_9Pi82"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["CSLA_uniPoliceman"]];
_policeLoadoutData set ["vests", ["CSLA_grUah61"]];
_policeLoadoutData set ["helmets", ["CSLA_policeCap"]];

_policeLoadoutData set ["SMGs", [
    ["CSLA_Sa24", "", "", "", ["CSLA_Sa24_32rnd_7_62Pi52"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
    ["CSLA_Pi82", "", "", "", ["CSLA_Pi82_12rnd_9Pi82"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["FIA_uniwld11"]];
_militiaLoadoutData set ["vests", ["CSLA_gr85ptBase", "FIA_gr60_Sa58", "CSLA_gr60rfl"]];
_militiaLoadoutData set ["backpacks", ["CSLA_bp61"]];
_militiaLoadoutData set ["slBackpacks", ["CSLA_bpWpR129"]];
_militiaLoadoutData set ["atBackpacks", ["CSLA_bpRPG7"]];
_militiaLoadoutData set ["helmets", ["CSLA_helmet53m", "CSLA_helmet53mG"]];

_militiaLoadoutData set ["rifles", [
    ["CSLA_OP54", "", "", "", ["CSLA_OP54_5rnd_7_62Odst59"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
    ["CSLA_Sa58V", "", "", "", ["CSLA_Sa58_30rnd_7_62vz43"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
    ["CSLA_VG70", "", "", "", ["CSLA_Sa58_30rnd_7_62vz43"], ["CSLA_26_5vz70", "CSLA_26_5sigZl1a"], ""]
]];
_militiaLoadoutData set ["SMGs", [
    ["CSLA_Sa24", "", "", "", ["CSLA_Sa24_32rnd_7_62Pi52"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
    ["CSLA_LK52_25", "", "", "", ["CSLA_LK52_25rnd_7_62Sv52"], [], ""],
    ["CSLA_LK52_25", "", "", "", ["CSLA_LK52_25rnd_7_62vz52"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
    ["CSLA_OP54", "", "", "CSLA_PD54", ["CSLA_OP54_5rnd_7_62TzOdst59"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
    ["CUP_srifle_SVD", "", "CUP_SVD_camo_g_half", "CUP_optic_PSO_3", ["CUP_10Rnd_762x54_SVD_M"], [], ""]
]];
_militiaLoadoutData set ["lightATLaunchers", [
    ["CSLA_RPG75", "", "", "", ["CSLA_RPG75_Mag"], [], ""]
]];
_militiaLoadoutData set ["sidearms", [
    ["CSLA_Pi82", "", "", "", ["CSLA_Pi82_12rnd_9Pi82",7], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["CSLA_uniDES"]];
_crewLoadoutData set ["vests", ["CSLA_gr60tankPi82"]];
_crewLoadoutData set ["helmets", ["CSLA_helmetT28", "CSLA_helmetT28G", "CSLA_helmetT28G_on"]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["CSLA_uniPlt"]];
_pilotLoadoutData set ["vests", []];
_pilotLoadoutData set ["helmets", ["CSLA_helmetZSh5Ho", "CSLA_helmetZSh5Hc", "CSLA_helmetZSh5c", "CSLA_helmetZSh5o"]];


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