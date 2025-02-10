//////////////////////////
//   Side Information   //
//////////////////////////

["name", "FIA"] call _fnc_saveToTemplate;
["spawnMarkerName", "FIA support corridor"] call _fnc_saveToTemplate;

["flag", "Flag_FIA_F"] call _fnc_saveToTemplate;
["flagTexture", "a3\data_f\flags\flag_fia_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_FIA"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate;
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate;

["vehiclesBasic", ["B_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["FIA_AZU_para", "FIA_BTR40", "US85_M1008", "US85_M998"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["FIA_AZU_DSKM", "FIA_AZU_T21", "CSLA_FIA_V3S_GT", "CSLA_FIA_V3S_AGS17", "FIA_BTR40_DSKM"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["CSLA_FIA_V3S_des", "CSLA_F813o", "US85_M923o"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["US85_M923a1_cargo"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["CSLA_FIA_V3Sa_des"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["CSLA_FIA_V3Sr_des"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["CSLA_FIA_V3Sf_des"]] call _fnc_saveToTemplate;
["vehiclesMedical", []] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["FIA_OT64C_VB", "CSLA_OT62", "CSLA_OT65A", "CSLA_OT62D"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["CSLA_BVP1"]] call _fnc_saveToTemplate;            
["vehiclesIFVs", []] call _fnc_saveToTemplate;
["vehiclesTanks", ["CUP_O_T55_SLA"]] call _fnc_saveToTemplate;
["vehiclesAA", ["CSLA_FIA_PLdvK59V3S"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["US85_zodiac"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["CUP_B_RHIB_USMC"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["CUP_I_L39_AAF"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["a3a_Plane_Fighter_03_grey_F"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["CUP_B_C47_USA"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["CUP_O_UH1H_SLA"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["CUP_O_UH1H_slick_SLA", "CSLA_Mi17"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["CUP_O_UH1H_gunship_SLA"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["CSLA_Mi24V"]] call _fnc_saveToTemplate;

["vehiclesArtillery", ["CSLA_FIA_RM51"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [["CSLA_FIA_RM51", ["CSLA_32rnd_130JRROv"]]]] call _fnc_saveToTemplate;

["uavsAttack", []] call _fnc_saveToTemplate;
["uavsPortable", []] call _fnc_saveToTemplate;

["vehiclesMilitiaLightArmed", ["FIA_AZU_DSKM"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["CSLA_FIA_V3S_des"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["FIA_AZU_para"]] call _fnc_saveToTemplate;
["vehiclesPolice", ["CSLA_CIV_Sarka1200PO"]] call _fnc_saveToTemplate;

["staticMGs", ["FIA_DShKM_h_Stat", "CSLA_UK59L_Stat", "CSLA_UK59L_Mount"]] call _fnc_saveToTemplate;
["staticAT", ["CSLA_BzK59A_Stat", "CSLA_T21_Stat"]] call _fnc_saveToTemplate;
["staticAA", ["CUP_O_ZU23_ChDKZ"]] call _fnc_saveToTemplate;

["staticMortars", ["CUP_B_M252_US"]] call _fnc_saveToTemplate;
["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["minefieldAT", ["US85_M87A1Mine_mag", "CSLA_PtMiBa3_mag"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["CSLA_PPMiSr2_mag", "US85_M14Mine_mag"]] call _fnc_saveToTemplate;

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
    ["CSLA_P27", "", "", "", ["CSLA_NbP27"], [], ""],
    ["US85_SMAW", "", "", "", ["US85_SMAW_HEAA", "US85_SMAW_HEDP"], [], ""]
]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["CSLA_PtMiBa3_mag"]];
_loadoutData set ["APMines", ["CSLA_PPMiSr2_mag"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiInfantryGrenades", ["CSLA_F1"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", []];
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
_loadoutData set ["slHat", ["US85_beanie"]];
_loadoutData set ["sniHats", ["AFMC_booniehatLizard"]];


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
_sfLoadoutData set ["uniforms", ["FIA_uniwld11"]];
_sfLoadoutData set ["vests", ["AFMC_grV_M16", "AFMC_grV_M24"]];
_sfLoadoutData set ["backpacks", ["FIA_bpPack", "CSLA_bpBx"]];
_sfLoadoutData set ["slBackpacks", ["CSLA_bpWpR129"]];
_sfLoadoutData set ["atBackpacks", ["CSLA_bpRPG7"]];
_sfLoadoutData set ["helmets", ["CSLA_helmet53mG", "CSLA_helmet53G_on"]];
_sfLoadoutData set ["slHat", ["AFMC_beretRd"]];
_sfLoadoutData set ["sniHats", ["AFMC_booniehatLizard"]];
_sfLoadoutData set ["NVGs", ["US85_ANPVS5_Goggles"]];
_sfLoadoutData set ["binoculars", ["US85_bino"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["slRifles", [
    ["US85_M16A1", "US85_M16tlm", "", "US85_ANPVS4_M16", ["US85_30Rnd_556x45"], [], ""],
    ["US85_M16A1", "US85_M16tlm", "", "US85_sc2000_M16", ["US85_30Rnd_556x45"], [], ""],
    ["CUP_arifle_Sa58s", "CUP_muzzle_Bizon", "", "", ["CUP_30Rnd_Sa58_M"], [], ""]
]];

_sfLoadoutData set ["rifles", [
    ["US85_M16A2", "US85_M16tlm", "", "", ["US85_30Rnd_556x45"], [], ""],
    ["US85_M21", "US85_M21tlm", "", "", ["US85_20Rnd_762M61"], [], ""]
]];
_sfLoadoutData set ["carbines", [
    ["US85_M16A2CAR", "US85_M16tlm", "", "", ["US85_30Rnd_556x45"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
    ["US85_M16A2GL", "", "", "US85_sc4x20_M16", ["US85_30Rnd_556x45"], ["US85_M406", "US85_M583A1", "1Rnd_Smoke_Grenade_shell"], ""],
    ["US85_M16A2GL", "", "", "", ["US85_30Rnd_556x45"], ["US85_M406", "US85_M583A1", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_sfLoadoutData set ["SMGs", [
    ["CSLA_rSa61", "CSLA_Sa61tlm", "", "", ["CSLA_Sa61_20rnd_7_65Pi27"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
    ["CSLA_LK57_50", "", "", "", ["CSLA_LK57_50rnd_7_62PZ43"], [], ""],
    ["CSLA_UK59L", "", "", "", ["CSLA_UK59_50rnd_7_62PZ59"], [], ""],
    ["US85_M60E3LB", "", "", "US85_ANPVS4_M60", ["US85_100Rnd_762x51"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
    ["US85_M21", "US85_M21tlm", "", "US85_scM21", ["US85_20Rnd_762x51", "US85_20Rnd_762M61"], [], ""],
    ["CSLA_Pu52", "", "", "CSLA_ZD4x8_Pu52", ["CSLA_Pu52_10rnd_7_62Sv52", "CSLA_Pu52_10rnd_7_62vz52"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [
    ["CUP_srifle_Mosin_Nagant", "", "", "CUP_optic_PEM", ["CUP_5Rnd_762x54_Mosin_M"], [], ""]
]];
_sfLoadoutData set ["lightATLaunchers", [
    ["US85_LAW72", "", "", "", ["US85_LAW72_Mag"], [], ""],
    ["CSLA_RPG75", "", "", "", ["CSLA_RPG75_Mag"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
    ["CSLA_Pi75lr", "", "", "", ["CSLA_Pi75_15Rnd_9Luger"], [], ""]
]];
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["FIA_uniwld2", "FIA_uniwld3", "FIA_uniwld4", "FIA_uniwld5", "FIA_uniwld6", "FIA_uniwld7", "FIA_uniwld9"]];
_militaryLoadoutData set ["vests", ["FIA_grY_MG", "FIA_grY_MPV", "FIA_gr85_Sa61", "FIA_gr85_Sa58", "FIA_gr60_Sa58"]];
_militaryLoadoutData set ["backpacks", ["FIA_bpPack", "CSLA_bp2xCan", "CSLA_bpBx", "CSLA_bp85Lrr", "CSLA_bp85RF10", "US85_bpSf"]];
_militaryLoadoutData set ["slBackpacks", ["US85_bpPRC77"]];
_militaryLoadoutData set ["atBackpacks", ["CSLA_bpRPG7"]];
_militaryLoadoutData set ["helmets", ["US85_helmetM1g", "AFMC_helmetM1c", "US85_helmetM1c", "AFMC_helmetMk6", "AFMC_helmetMk6para", "AFMC_helmetMk6r"]];
_militaryLoadoutData set ["binoculars", ["US85_bino"]];

_militaryLoadoutData set ["slRifles", [
    ["US85_FAL", "", "", "US85_scFAL", ["US85_20Rnd_762x51"], [], ""],
    ["US85_M16A2CAR", "", "", "", ["US85_20Rnd_556x45"], [], ""],
    ["CSLA_VG70", "", "", "", ["CSLA_Sa58_30rnd_7_62vz43"], ["CSLA_26_5vz70", "CSLA_26_5sigB1a", "CSLA_26_5sigCrD"], ""]
]];
_militaryLoadoutData set ["rifles", [
    ["US85_M16A1", "", "", "", ["US85_20Rnd_556x45"], [], ""],
    ["US85_M14", "", "", "", ["US85_20Rnd_762x51"], [], ""],
    ["US85_FAL", "", "", "", ["US85_20Rnd_762x51"], [], ""],
    ["CSLA_Sa58P", "", "", "", ["CSLA_Sa58_30rnd_7_62Sv43"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
    ["CUP_arifle_Colt727", "", "", "", ["US85_20Rnd_556x45"], [], ""],
    ["CUP_arifle_Colt727", "", "", "", ["US85_20Rnd_556x45"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
    ["CSLA_VG70", "", "", "", ["CSLA_Sa58_30rnd_7_62vz43"], ["CSLA_26_5vz70", "CSLA_26_5sigB1a", "CSLA_26_5sigCrD"], ""],
    ["US85_M16A2GL", "", "", "", ["US85_20Rnd_556x45"], ["US85_M406", "US85_M583A1", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_militaryLoadoutData set ["SMGs", [
    ["CSLA_Sa24", "", "", "", ["CSLA_Sa24_32rnd_7_62Pi52"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
    ["CSLA_LK52_25", "", "", "", ["CSLA_LK52_25rnd_7_62Sv52"], [], ""],
    ["CSLA_LK57_50", "", "", "", ["CSLA_LK57_50rnd_7_62Sv43"], [], ""],
    ["US85_M249", "", "", "", ["US85_200Rnd_556x45"], [], ""],
    ["CSLA_UK59L", "", "", "", ["CSLA_UK59_50rnd_7_62Sv59"], [], ""],
    ["US85_M60E3LB", "", "", "", ["US85_100Rnd_762x51"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
    ["CSLA_OP54", "", "", "CSLA_PD54", ["CSLA_OP54_5rnd_7_62Odst59"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
    ["CUP_srifle_Mosin_Nagant", "", "", "CUP_optic_PEM", ["CUP_5Rnd_762x54_Mosin_M"], [], ""]
]];
_militaryLoadoutData set ["lightATLaunchers", [
    ["CSLA_RPG75", "", "", "", ["CSLA_RPG75_Mag"], [], ""]
]];
_militaryLoadoutData set ["sidearms", [
    ["CSLA_Pi52", "", "", "", ["CSLA_Pi52_8rnd_7_62Pi52"], [], ""],
    ["CSLA_Pi75sr", "", "", "", ["CSLA_Pi75_15Rnd_9Luger"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["US85_uniCrew"]];
_policeLoadoutData set ["vests", ["CSLA_gr60emp"]];
_policeLoadoutData set ["helmets", ["CSLA_RadiovkaGy"]];

_policeLoadoutData set ["shotGuns", [
    ["CUP_sgun_CZ584", "", "", "", ["CUP_1Rnd_12Gauge_Pellets_No00_Buck"], [], ""]
]];
_policeLoadoutData set ["SMGs", [
    ["CSLA_Sa26", "", "", "", ["CSLA_Sa24_32rnd_7_62Pi52"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
    ["CSLA_Pi82", "", "", "", ["CSLA_Pi82_12rnd_9Pi82"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["CSLA_uniSrv"]];
_militiaLoadoutData set ["vests", ["CSLA_gr60Pu5257", "CSLA_gr60OP63", "CSLA_gr60harness"]];
_militiaLoadoutData set ["backpacks", ["CSLA_bp2xCan"]];
_militiaLoadoutData set ["slBackpacks", ["CSLA_bpWpR129"]];
_militiaLoadoutData set ["atBackpacks", ["CSLA_bpRPG7"]];
_militiaLoadoutData set ["helmets", ["CSLA_helmetPOP6"]];

_militiaLoadoutData set ["rifles", [
    ["CSLA_Pu52", "", "", "", ["CSLA_Pu52_10rnd_7_62Sv52"], [], ""],
    ["CSLA_Pu57", "", "", "", ["CSLA_Pu57_10rnd_7_62Sv43"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
    ["US85_M16A2CAR", "", "", "", ["US85_20Rnd_556x45"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
    ["US85_M16A2GL", "", "", "", ["US85_20Rnd_556x45"], ["US85_M406", "1Rnd_Smoke_Grenade_shell"], ""]
]];
_militiaLoadoutData set ["SMGs", [
    ["CSLA_Sa26", "", "", "", ["CSLA_Sa24_32rnd_7_62Pi52"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
    ["CSLA_LK52_25", "", "", "", ["CSLA_LK52_25rnd_7_62Sv52"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
    ["CSLA_OP54", "", "", "CSLA_PD54", ["CSLA_OP54_5rnd_7_62Odst59"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
    ["CSLA_HuntingRifle", "", "", "", ["CSLA_10Rnd_762hunt"], [], ""]
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
_crewLoadoutData set ["uniforms", ["CSLA_uniPoliceman"]];
_crewLoadoutData set ["vests", []];
_crewLoadoutData set ["helmets", ["CSLA_helmetT28DesG_on_mask", "CSLA_helmetT28G", "CSLA_helmetT28G_on", "CSLA_helmetT28DesG_mask"]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["CSLA_uniPlt"]];
_pilotLoadoutData set ["vests", ["AFMC_grVest"]];
_pilotLoadoutData set ["helmets", ["US85_helmetHGU55PC", "US85_helmetHGU55P", "US85_helmetPltAttackC", "US85_helmetPltC"]];


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