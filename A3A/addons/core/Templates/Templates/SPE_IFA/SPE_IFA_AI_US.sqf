//////////////////////////
//   Side Information   //
//////////////////////////

["name", "US"] call _fnc_saveToTemplate;
["spawnMarkerName", "US support corridor"] call _fnc_saveToTemplate;

["flag", "Flag_US_F"] call _fnc_saveToTemplate;
["flagTexture", "a3\data_f\flags\flag_us_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "SPE_Faction_US"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["attributeLowAir", true] call _fnc_saveToTemplate;             // Use fewer air units in general
["attributeNoSAM", true] call _fnc_saveToTemplate;              // Don't use SAM supports

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "SPE_Mine_AmmoBox_US"] call _fnc_saveToTemplate;
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate;

["vehiclesBasic", ["SPE_US_G503_MB_Armoured"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["SPE_US_G503_MB_Armoured"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["SPE_US_M16_Halftrack", "SPE_M20_AUC","SPE_M20_AUC","SPE_M8_LAC","SPE_M8_LAC_ringMount"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["SPE_CCKW_353","SPE_CCKW_353_Open","SPE_CCKW_353","SPE_CCKW_353_Open","SPE_CCKW_353_M2","SPE_US_M3_Halftrack_Unarmed","SPE_US_G503_MB_M2_Armoured"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["SPE_CCKW_353_Open"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["SPE_US_M3_Halftrack_Ammo","SPE_CCKW_353_Ammo","SPE_CCKW_353_Ammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["SPE_US_M3_Halftrack_Repair","SPE_CCKW_353_Repair","SPE_CCKW_353_Repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["SPE_US_M3_Halftrack_Fuel","SPE_CCKW_353_Fuel","SPE_CCKW_353_Fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["SPE_US_M3_Halftrack_Ambulance","SPE_CCKW_353_Ambulance","SPE_CCKW_353_Ambulance"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["SPE_US_M3_Halftrack","SPE_M20_AUC"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["SPE_M4A0_105","SPE_M4A3_105"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["SPE_M4A0_75_Early", "SPE_M4A0_75","SPE_M4A0_composite","SPE_M4A0_105","SPE_M4A3_105"]] call _fnc_saveToTemplate;
["vehiclesLightTanks",["SPE_M8_LAC_ringMount","SPE_M8_LAC_ringMount","SPE_M8_LAC_ringMount","SPE_M18_Hellcat","SPE_M18_Hellcat","SPE_M10"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["SPE_M4A1_75_erla","SPE_M4A1_76", "SPE_M4A1_75","SPE_M4A3_75","SPE_M4A3_76"]] call _fnc_saveToTemplate;
["vehiclesAA", ["SPE_US_M16_Halftrack"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["B_Boat_Transport_01_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["B_Boat_Transport_01_F"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["SPE_P47"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["SPE_P47"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["LIB_C47_Skytrain"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", []] call _fnc_saveToTemplate;
["vehiclesHelisTransport", []] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", []] call _fnc_saveToTemplate;
["vehiclesHelisAttack", []] call _fnc_saveToTemplate;

["vehiclesArtillery", ["SPE_M4A1_T34_Calliope","SPE_M4A3_T34_Calliope","SPE_105mm_M3","SPE_105mm_M3","SPE_105mm_M3"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["SPE_M4A1_T34_Calliope", ["SPE_60Rnd_M8"]],
["SPE_M4A3_T34_Calliope", ["SPE_60Rnd_M8"]],
["SPE_105mm_M3", ["SPE_20x_Shell_M3_M1_HE_Artillery","SPE_8x_Shell_M3_M67_HEAT_Artillery"]]
]] call _fnc_saveToTemplate;

["uavsAttack", []] call _fnc_saveToTemplate;
["uavsPortable", []] call _fnc_saveToTemplate;

//Config special vehicles
["vehiclesMilitiaLightArmed", ["SPE_US_G503_MB_M1919_Armoured","SPE_US_G503_MB_M1919_PATROL","SPE_US_G503_MB_M2","SPE_US_G503_MB_M1919"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["SPE_CCKW_353_Open"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["SPE_US_G503_MB_Open"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["SPE_US_G503_MB"]] call _fnc_saveToTemplate;

["staticMGs", ["SPE_M1919A6_Bipod"]] call _fnc_saveToTemplate;
["staticAT", ["SPE_57mm_M1"]] call _fnc_saveToTemplate;
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
["voices", ["Male01ENG", "Male02ENG", "Male03ENG", "Male04ENG", "Male05ENG", "Male06ENG", "Male07ENG", "Male08ENG", "Male09ENG", "Male10ENG", "Male11ENG", "Male12ENG"]] call _fnc_saveToTemplate;
["milFaces", ["AfricanHead_01", "AfricanHead_02", "AfricanHead_03", "TanoanHead_A3_01", "TanoanHead_A3_02",
"TanoanHead_A3_03", "TanoanHead_A3_04", "TanoanHead_A3_05", "TanoanHead_A3_06", "TanoanHead_A3_07",
"TanoanHead_A3_08", "TanoanHead_A3_09", "WhiteHead_02"]] call _fnc_saveToTemplate; //12 to 1 so Mostly Colored Faces.
["milVoices", ["Male01FRE", "Male02FRE", "Male03FRE"]] call _fnc_saveToTemplate;
["polFaces", ["LivonianHead_6","SPE_Arnold","SPE_Connors","SPE_Davidson","SPE_Elliot","SPE_Oberst","SPE_Seppmeyer","SPE_Walter","WhiteHead_01","WhiteHead_02","WhiteHead_05","WhiteHead_06","WhiteHead_07","WhiteHead_08","WhiteHead_12","WhiteHead_15","WhiteHead_18"]] call _fnc_saveToTemplate;
["polVoices", ["spe_male01fre", "spe_male02fre"]] call _fnc_saveToTemplate;
"SPE_EnglishMen" call _fnc_saveNames;


//////////////////////////
//       Loadouts       //
//////////////////////////

private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["rifles", [
["SPE_M1_Garand", "SPE_ACC_M1_Bayo", "", "", ["SPE_8Rnd_762x63_M1", "SPE_8Rnd_762x63_M1", "SPE_8Rnd_762x63_t"], [], ""],
["SPE_M1_Garand", "SPE_ACC_M1_Bayo", "", "", ["SPE_8Rnd_762x63_M1", "SPE_8Rnd_762x63_M1", "SPE_8Rnd_762x63_t"], [], ""],
["SPE_M1_Garand", "SPE_ACC_M1_Bayo", "", "", ["SPE_8Rnd_762x63_M1", "SPE_8Rnd_762x63_M1", "SPE_8Rnd_762x63_t"], [], ""],
["SPE_M1_Garand", "SPE_ACC_M1905_Bayo", "", "", ["SPE_8Rnd_762x63_M1", "SPE_8Rnd_762x63_M1", "SPE_8Rnd_762x63_t"], [], ""],
["SPE_M1903A3_Springfield", "SPE_ACC_M1905_Bayo", "", "", ["SPE_5Rnd_762x63_M1", "SPE_5Rnd_762x63_M1", "SPE_5Rnd_762x63_t"], [], ""],
["SPE_M1903A3_Springfield", "SPE_ACC_M1905_Bayo", "", "", ["SPE_5Rnd_762x63_M1", "SPE_5Rnd_762x63_M1", "SPE_5Rnd_762x63_t"], [], ""]
]];
_loadoutData set ["slRifles", [
["SPE_M1_Carbine", "", "", "", ["SPE_15Rnd_762x33", "SPE_15Rnd_762x33", "SPE_15Rnd_762x33_t"], [], ""],
["SPE_M1A1_Thompson", "", "", "", ["SPE_30Rnd_Thompson_45ACP", "SPE_30Rnd_Thompson_45ACP", "SPE_30Rnd_Thompson_45ACP_t"], [], ""],
["SPE_M3_GreaseGun", "", "", "", ["SPE_30Rnd_M3_GreaseGun_45ACP", "SPE_30Rnd_M3_GreaseGun_45ACP", "SPE_30Rnd_M3_GreaseGun_45ACP_t"], [], ""],
["SPE_M1_Garand", "SPE_ACC_M1_Bayo", "", "", ["SPE_8Rnd_762x63_M1", "SPE_8Rnd_762x63_M1", "SPE_8Rnd_762x63_t"], [], ""]
]];
_loadoutData set ["shotGuns", [
["SPE_Model_37_Trenchgun", "SPE_ACC_M1917_Bayo", "", "", ["SPE_5Rnd_12x70_Pellets", "SPE_5Rnd_12x70_Pellets", "SPE_5Rnd_12x70_Slug"], [], ""],
["SPE_Model_37_Trenchgun", "SPE_ACC_M1917_Bayo", "", "", ["SPE_5Rnd_12x70_Pellets", "SPE_5Rnd_12x70_Pellets", "SPE_5Rnd_12x70_Slug"], [], ""],
["SPE_Model_37_Riotgun", "", "", "", ["SPE_5Rnd_12x70_Pellets", "SPE_5Rnd_12x70_Pellets", "SPE_5Rnd_12x70_Slug"], [], ""]
]];
_loadoutData set ["carbines", [
["SPE_M1_Carbine", "", "", "", ["SPE_15Rnd_762x33", "SPE_15Rnd_762x33", "SPE_15Rnd_762x33_t"], [], ""],
["SPE_M1A1_Carbine", "", "", "", ["SPE_15Rnd_762x33", "SPE_15Rnd_762x33", "SPE_15Rnd_762x33_t"], [], ""],
["SPE_M1_Carbine", "", "", "", ["SPE_15Rnd_762x33", "SPE_15Rnd_762x33", "SPE_15Rnd_762x33_t"], [], ""],
["SPE_M1A1_Carbine", "", "", "", ["SPE_15Rnd_762x33", "SPE_15Rnd_762x33", "SPE_15Rnd_762x33_t"], [], ""]
]];
_loadoutData set ["grenadeLaunchers", [
["SPE_M1_Garand_M7", "SPE_ACC_GL_M7", "", "", ["SPE_8Rnd_762x63_M1", "SPE_8Rnd_762x63_M1", "SPE_8Rnd_762x63_t"], ["SPE_1Rnd_G_M9A1", "SPE_1Rnd_G_Mk2", "SPE_1Rnd_G_M17A1", "SPE_1Rnd_G_M2_ANM8"], ""],
["SPE_M1_Garand_M7", "SPE_ACC_GL_M7", "", "", ["SPE_8Rnd_762x63_M1", "SPE_8Rnd_762x63_M1", "SPE_8Rnd_762x63_t"], ["SPE_1Rnd_G_M9A1", "SPE_1Rnd_G_Mk2", "SPE_1Rnd_G_M17A1", "SPE_1Rnd_G_M2_ANM8"], ""],
["SPE_M1903A3_Springfield_M1_GL", "SPE_ACC_GL_M1", "", "", ["SPE_5Rnd_762x63_M1", "SPE_5Rnd_762x63_M1", "SPE_5Rnd_762x63_t"], ["SPE_1Rnd_G_M9A1", "SPE_1Rnd_G_Mk2", "SPE_1Rnd_G_M17A1", "SPE_1Rnd_G_M2_ANM8"], ""],
["SPE_M1_Carbine_M8", "SPE_ACC_GL_M8", "", "", ["SPE_15Rnd_762x33", "SPE_15Rnd_762x33", "SPE_15Rnd_762x33_t"], ["SPE_1Rnd_G_M9A1", "SPE_1Rnd_G_Mk2", "SPE_1Rnd_G_M17A1", "SPE_1Rnd_G_M2_ANM8"], ""]
]];
_loadoutData set ["SMGs", [
["SPE_M1A1_Thompson", "", "", "", ["SPE_30Rnd_Thompson_45ACP", "SPE_30Rnd_Thompson_45ACP", "SPE_30Rnd_Thompson_45ACP_t"], [], ""],
["SPE_M3_GreaseGun", "", "", "", ["SPE_30Rnd_M3_GreaseGun_45ACP", "SPE_30Rnd_M3_GreaseGun_45ACP", "SPE_30Rnd_M3_GreaseGun_45ACP_t"], [], ""],
["SPE_M3_GreaseGun", "", "", "", ["SPE_30Rnd_M3_GreaseGun_45ACP", "SPE_30Rnd_M3_GreaseGun_45ACP", "SPE_30Rnd_M3_GreaseGun_45ACP_t"], [], ""]
]];
_loadoutData set ["machineGuns", [
["SPE_M1919A4", "", "", "", ["SPE_50Rnd_762x63", "SPE_50Rnd_762x63_M1", "SPE_50Rnd_762x63_M2_AP"], [], ""],
["SPE_M1919A6", "", "", "", ["SPE_50Rnd_762x63", "SPE_50Rnd_762x63_M1", "SPE_50Rnd_762x63_M2_AP"], [], ""],
["SPE_M1918A2_BAR", "", "SPE_M1918A2_BAR_Handle", "", ["SPE_20Rnd_762x63_M1", "SPE_20Rnd_762x63_M1", "SPE_20Rnd_762x63"], [], ""],
["SPE_M1918A2_BAR", "", "SPE_M1918A2_BAR_Handle", "", ["SPE_20Rnd_762x63_M1", "SPE_20Rnd_762x63_M1", "SPE_20Rnd_762x63"], [], ""]
]];
_loadoutData set ["marksmanRifles", [
["SPE_M1903A4_Springfield", "", "", "", ["SPE_5Rnd_762x63", "SPE_5Rnd_762x63", "SPE_5Rnd_762x63_t"], [], ""],
["SPE_M1903A4_Springfield", "", "", "", ["SPE_5Rnd_762x63", "SPE_5Rnd_762x63", "SPE_5Rnd_762x63_t"], [], ""]
]];
_loadoutData set ["sniperRifles", [
["SPE_M1903A4_Springfield", "", "", "", ["SPE_5Rnd_762x63_M1", "SPE_5Rnd_762x63_M1", "SPE_5Rnd_762x63_M2_AP"], [], ""],
["SPE_M1903A4_Springfield", "", "", "", ["SPE_5Rnd_762x63_M1", "SPE_5Rnd_762x63_M1", "SPE_5Rnd_762x63_M2_AP"], [], ""]
]];

_loadoutData set ["lightATLaunchers", ["SPE_M1A1_Bazooka"]];
_loadoutData set ["ATLaunchers", ["SPE_M9_Bazooka","SPE_M9A1_Bazooka"]];
_loadoutData set ["sidearms", ["SPE_M1911"]];

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
_loadoutData set ["NVGs", ["SPE_US_FL_TL122"]];

_loadoutData set ["uniforms", ["U_SPE_US_Private", "U_SPE_US_Private_1st", "U_SPE_US_Private_late"]];
_loadoutData set ["medUniforms", ["U_SPE_US_Med"]];
_loadoutData set ["engUniforms", ["U_SPE_US_Technician"]];
_loadoutData set ["slUniorms", ["U_SPE_US_CC_1LT", "U_SPE_US_Sergeant"]];

_loadoutData set ["vests", ["V_SPE_US_Vest_Carbine", "V_SPE_US_Vest_Garand", "V_SPE_US_Vest_Garand_M43"]];
_loadoutData set ["glVests", ["V_SPE_US_Vest_Grenadier"]];
_loadoutData set ["sniVests", ["V_SPE_US_Vest_Garand_M43"]];
_loadoutData set ["medVests", ["V_SPE_US_Vest_Medic"]];
_loadoutData set ["engVests", ["V_SPE_US_Vest_Carbine_eng"]];
_loadoutData set ["mgVests", ["V_SPE_US_Vest_Bar"]];
_loadoutData set ["slVests", ["V_SPE_US_Vest_45_off", "V_SPE_US_Vest_Carbine_nco_Radio", "V_SPE_US_Vest_Thompson_nco"]];

_loadoutData set ["backpacks", ["B_SPE_US_Backpack_Bandoleer_Rifleman", "B_SPE_US_Backpack_BAR"]];
_loadoutData set ["atBackpacks", ["B_SPE_US_Backpack_RocketBag"]];
_loadoutData set ["slBackpacks", ["B_SPE_US_Radio_packboard"]];
_loadoutData set ["glBackpacks", ["B_SPE_US_Backpack_Bandoleer_Grenadier_1903"]];
_loadoutData set ["engBackpacks", ["B_SPE_US_Backpack_eng"]];

_loadoutData set ["helmets", ["H_SPE_US_Helmet", "H_SPE_US_Helmet_Net", "H_SPE_US_Helmet_Net_ns", "H_SPE_US_Helmet_Net_os", "H_SPE_US_Helmet_ns", "H_SPE_US_Helmet_os"]];
_loadoutData set ["medHelmets", ["H_SPE_US_Helmet_Med"]];
_loadoutData set ["slHelmets", ["H_SPE_US_Helmet_Cap", "H_SPE_US_Helmet_First_lieutenant", "H_SPE_US_Helmet_Net_os"]];

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
_sfLoadoutData set ["uniforms", ["U_SPE_US_Rangers_Uniform", "U_SPE_US_Rangers_Private_1st"]];
_sfLoadoutData set ["medUniforms", ["U_SPE_US_Rangers_Med"]];
_sfLoadoutData set ["engUniforms", ["U_SPE_US_Rangers_Technician"]];
_sfLoadoutData set ["slUniorms", ["U_SPE_US_Rangers_Sergeant", "U_SPE_US_Rangers_Corp"]];

_sfLoadoutData set ["helmets", ["H_SPE_US_Rangers_Helmet", "H_SPE_US_Rangers_Helmet_ns", "H_SPE_US_Rangers_Helmet_os", "H_SPE_US_Helmet_Net_os", "H_SPE_US_Helmet_ns", "H_SPE_US_Helmet_os"]];
_sfLoadoutData set ["medHelmets", ["H_SPE_US_Helmet_Med"]];
_sfLoadoutData set ["slHelmets", ["H_SPE_US_Rangers_Helmet_First_lieutenant", "H_SPE_US_Rangers_Helmet_Second_lieutenant", "H_SPE_US_Rangers_Helmet_Cap", "H_SPE_US_Rangers_Helmet_NCO"]];

_sfLoadoutData set ["slRifles", [
["SPE_M1A1_Thompson", "", "", "", ["SPE_30Rnd_Thompson_45ACP", "SPE_30Rnd_Thompson_45ACP", "SPE_30Rnd_Thompson_45ACP_t"], [], ""],
["SPE_M3_GreaseGun", "SPE_ACC_M3_Suppressor_45acp", "", "", ["SPE_30Rnd_M3_GreaseGun_45ACP", "SPE_30Rnd_M3_GreaseGun_45ACP", "SPE_30Rnd_M3_GreaseGun_45ACP_t"], [], ""],
["SPE_M1918A2_BAR", "", "SPE_M1918A2_BAR_Handle", "", ["SPE_20Rnd_762x63_M2_AP"], [], ""]
]];
_sfLoadoutData set ["rifles", [
["SPE_M1_Garand", "SPE_ACC_M1_Bayo", "", "", ["SPE_8Rnd_762x63_M1", "SPE_8Rnd_762x63_M1", "SPE_8Rnd_762x63_t"], [], ""],
["SPE_M1_Garand", "SPE_ACC_M1905_Bayo", "", "", ["SPE_8Rnd_762x63_M1", "SPE_8Rnd_762x63_M1", "SPE_8Rnd_762x63_t"], [], ""],
["SPE_M1A1_Thompson", "", "", "", ["SPE_30Rnd_Thompson_45ACP", "SPE_30Rnd_Thompson_45ACP", "SPE_30Rnd_Thompson_45ACP_t"], [], ""],
["SPE_M1918A2_BAR", "", "SPE_M1918A2_BAR_Handle", "", ["SPE_20Rnd_762x63_M2_AP"], [], ""]
]];
_sfLoadoutData set ["SMGs", [
["SPE_M1A1_Thompson", "", "", "", ["SPE_30Rnd_Thompson_45ACP", "SPE_30Rnd_Thompson_45ACP", "SPE_30Rnd_Thompson_45ACP_t"], [], ""],
["SPE_M3_GreaseGun", "SPE_ACC_M3_Suppressor_45acp", "", "", ["SPE_30Rnd_M3_GreaseGun_45ACP", "SPE_30Rnd_M3_GreaseGun_45ACP", "SPE_30Rnd_M3_GreaseGun_45ACP_t"], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["U_SPE_milice_3"]];
_policeLoadoutData set ["vests", ["V_SPE_milice_Vest_zwart_rifle", "V_SPE_milice_Vest_zwart_rifle_sidearm","V_SPE_milice_Vest_zwart_sidearm"]];
_policeLoadoutData set ["helmets", ["H_SPE_Milice_Adrian", "H_SPE_Milice_Adrian_ns"]];
_policeLoadoutData set ["slHelmets", ["H_SPE_Milice_beret_1", "H_SPE_Milice_beret_2"]];

_policeLoadoutData set ["SMGs", [
["SPE_Sten_Mk2", "", "", "", ["SPE_32Rnd_9x19_Sten"], [], ""]
]];
_policeLoadoutData set ["rifles", [
["SPE_MAS_36", "", "", "", ["SPE_5Rnd_75x54"], [], ""]
]];
_policeLoadoutData set ["shotGuns", [
["SPE_Model_37_Riotgun", "", "", "", ["SPE_5Rnd_12x70_Pellets", "SPE_5Rnd_12x70_Pellets", "SPE_5Rnd_12x70_Slug"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_militiaLoadoutData set ["uniforms", ["U_SPE_FR_HBT_Uniform", "U_SPE_FR_HBT_Uniform_Trop"]];
_militiaLoadoutData set ["medUniforms", []];
_militiaLoadoutData set ["engUniforms", []];
_militiaLoadoutData set ["slUniorms", []];

_militiaLoadoutData set ["helmets", ["H_SPE_FR_Adrian", "H_SPE_FR_Adrian_ns"]];
_militiaLoadoutData set ["medHelmets", ["H_SPE_FR_Adrian_Medic", "H_SPE_FR_Adrian_Medic_ns"]];
_militiaLoadoutData set ["slHelmets", ["H_SPE_FR_Adrian_net","H_SPE_FR_Adrian_net_ns"]];

_militiaLoadoutData set ["rifles", [
["SPE_No3_Mk1_Enfield", "SPE_ACC_M1917_Bayo", "", "", ["SPE_5Rnd_770x56", "SPE_5Rnd_770x56"], [], ""],
["SPE_No3_Mk1_Enfield", "SPE_ACC_M1917_Bayo", "", "", ["SPE_5Rnd_770x56", "SPE_5Rnd_770x56"], [], ""],
["SPE_No3_Mk1_Enfield", "", "", "", ["SPE_5Rnd_770x56", "SPE_5Rnd_770x56", "SPE_5Rnd_770x56_AP_MKI"], [], ""]
]];
_militiaLoadoutData set ["slRifles", [
["SPE_M1_Carbine", "", "", "", ["SPE_15Rnd_762x33", "SPE_15Rnd_762x33", "SPE_15Rnd_762x33_t"], [], ""],
["SPE_M3_GreaseGun", "", "", "", ["SPE_30Rnd_M3_GreaseGun_45ACP", "SPE_30Rnd_M3_GreaseGun_45ACP", "SPE_30Rnd_M3_GreaseGun_45ACP_t"], [], ""]
]];
_militiaLoadoutData set ["shotGuns", [
["SPE_Model_37_Riotgun", "", "", "", ["SPE_5Rnd_12x70_Pellets", "SPE_5Rnd_12x70_Pellets", "SPE_5Rnd_12x70_Slug"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
["SPE_M1_Carbine", "", "", "", ["SPE_15Rnd_762x33", "SPE_15Rnd_762x33", "SPE_15Rnd_762x33_t"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["SPE_M1903A3_Springfield_M1_GL", "SPE_ACC_GL_M1", "", "", ["SPE_5Rnd_762x63_M1", "SPE_5Rnd_762x63_M1", "SPE_5Rnd_762x63_t"], ["SPE_1Rnd_G_M9A1", "SPE_1Rnd_G_Mk2", "SPE_1Rnd_G_M17A1", "SPE_1Rnd_G_M2_ANM8"], ""],
["SPE_M1_Carbine_M8", "SPE_ACC_GL_M8", "", "", ["SPE_15Rnd_762x33", "SPE_15Rnd_762x33", "SPE_15Rnd_762x33_t"], ["SPE_1Rnd_G_M9A1", "SPE_1Rnd_G_Mk2", "SPE_1Rnd_G_M17A1", "SPE_1Rnd_G_M2_ANM8"], ""]
]];
_militiaLoadoutData set ["SMGs", [
["SPE_Sten_Mk2", "", "", "", ["SPE_32Rnd_9x19_Sten"], [], ""],
["SPE_M3_GreaseGun", "", "", "", ["SPE_30Rnd_M3_GreaseGun_45ACP", "SPE_30Rnd_M3_GreaseGun_45ACP", "SPE_30Rnd_M3_GreaseGun_45ACP_t"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["SPE_LMG_303_Mk2", "", "", "", ["SPE_30Rnd_770x56"], [], ""],
["SPE_LMG_303_Mk2", "", "", "", ["SPE_30Rnd_770x56"], [], ""],
["SPE_M1918A2_erla_BAR", "", "SPE_M1918A2_BAR_Handle", "", ["SPE_20Rnd_762x63_M1"], [], ""],
["SPE_M1918A0_BAR", "", "", "", ["SPE_20Rnd_762x63_M1"], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["U_SPE_US_Tank_Crew", "U_SPE_US_Tank_Crew2", "U_SPE_US_Tank_Crew3"]];
_crewLoadoutData set ["vests", ["V_SPE_US_Vest_45"]];
_crewLoadoutData set ["helmets", ["H_SPE_US_Helmet_Tank_polar", "H_SPE_US_Helmet_Tank_polar_tapes"]];

private _pilotLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["U_SPE_US_Pilot", "U_SPE_US_Pilot_2"]];
_pilotLoadoutData set ["vests", ["V_SPE_US_LifeVest"]];
_pilotLoadoutData set ["helmets", ["H_SPE_US_Helmet_Pilot"]];
_pilotLoadoutData set ["backpacks", ["B_SPE_US_TypeA3"]];

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
    [["slUniorms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;

    [["slBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["shotGuns", "slRifles", "slRifles"]] call _fnc_setPrimary;
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

    ["binoculars"] call _fnc_addBinoculars;
};

private _riflemanTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["rifles"] call _fnc_setPrimary;
    ["primary", 8] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_rifleman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _medicTemplate = {
    ["medHelmets"] call _fnc_setHelmet;
    [["medVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["medUniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;
    [["medBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;
    [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
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
};

private _grenadierTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["glVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["glBackpacks"] call _fnc_setBackpack;

    ["grenadeLaunchers"] call _fnc_setPrimary;
    ["primary", 8] call _fnc_addMagazines;
    ["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_grenadier_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 4] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _explosivesExpertTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["engVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["engUniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;
    [["engBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["shotGuns", "rifles", "carbines", "SMGs"]] call _fnc_setPrimary;
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
};

private _engineerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["engVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["engUniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;
    [["engBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["shotGuns", "shotGuns", "carbines", "SMGs"]] call _fnc_setPrimary;
    ["primary", 8] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

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
};

private _latTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["atBackpacks"] call _fnc_setBackpack;

    ["rifles"] call _fnc_setPrimary;
    ["primary", 8] call _fnc_addMagazines;

    ["lightATLaunchers"] call _fnc_setLauncher;
    ["launcher", 1] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_lat_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _atTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["atBackpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 8] call _fnc_addMagazines;

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
};

private _aaTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["atBackpacks"] call _fnc_setBackpack;

    ["rifles"] call _fnc_setPrimary;
    ["primary", 8] call _fnc_addMagazines;

    ["lightATLaunchers"] call _fnc_setLauncher;
    ["launcher", 1] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_aa_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
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
};

private _marksmanTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["sniVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

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
    ["helmets"] call _fnc_setHelmet;
    [["sniVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

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

    [selectRandom ["rifles", "shotGuns"]] call _fnc_setPrimary;
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
["other", [["Official", _SquadLeaderTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
