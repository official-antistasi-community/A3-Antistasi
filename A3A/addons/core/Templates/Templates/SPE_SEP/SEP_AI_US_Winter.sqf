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
["attributeMoreTrucks", true] call _fnc_saveToTemplate;         // Use more truck for transports
["attributeNoSAM", true] call _fnc_saveToTemplate;              // Don't use SAM supports

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "SPE_Mine_AmmoBox_US"] call _fnc_saveToTemplate;
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate;

["vehiclesBasic", ["SEP_I_US_WIN_G503_MB_Armoured"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["SEP_I_US_WIN_G503_MB_Armoured"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["SEP_I_US_WIN_M16_Halftrack", "SEP_I_US_WIN_M20_AUC","SEP_I_US_WIN_M20_AUC","SEP_I_US_WIN_M8_LAC","SEP_I_US_WIN_M8_LAC_ringMount","SEP_I_US_WIN_G503_MB_M1919_Armoured","SEP_I_US_WIN_G503_MB_M2_Armoured","SEP_I_US_WIN_G503_MB_M2","SEP_I_US_WIN_G503_MB_M2_Patrol","SEP_I_US_WIN_G503_MB_M1919_Patrol"]] call _fnc_saveToTemplate;
["vehiclesTrucks", ["SEP_I_US_WIN_CCKW_353","SEP_I_US_WIN_CCKW_353","SEP_I_US_WIN_CCKW_353_M2","SEP_I_US_WIN_M3_Halftrack", "SEP_I_US_WIN_M3_Halftrack_Open"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["SEP_I_US_WIN_CCKW_353_Open"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["SEP_I_US_WIN_M3_Halftrack_Ammo","SEP_I_US_WIN_CCKW_353_Ammo","SEP_I_US_WIN_CCKW_353_Ammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["SEP_I_US_WIN_M3_Halftrack_Repair","SEP_I_US_WIN_CCKW_353_Repair","SEP_I_US_WIN_CCKW_353_Repair"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["SEP_I_US_WIN_M3_Halftrack_Fuel","SEP_I_US_WIN_CCKW_353_Fuel","SEP_I_US_WIN_CCKW_353_Fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["SEP_I_US_WIN_M3_Halftrack_Ambulance","SEP_I_US_WIN_CCKW_353_Ambulance","SEP_I_US_WIN_CCKW_353_Ambulance"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", []] call _fnc_saveToTemplate;
["vehiclesAPCs", ["SEP_I_US_WIN_M3A1_Halftrack", "SEP_I_US_WIN_M20_AUC"]] call _fnc_saveToTemplate; //These got no protected  turret, sufficent troop capacity, cost reduced
["vehiclesIFVs", ["SEP_I_US_WIN_M4A1_75_erla", "SEP_I_US_WIN_M4A1_75","SEP_I_US_WIN_M4A0","SEP_I_US_WIN_M4A0_105","SEP_I_US_WIN_M4A3_105","SEP_I_US_WIN_M10"]] call _fnc_saveToTemplate;
["vehiclesLightTanks",["SEP_I_US_WIN_M18_Hellcat","SEP_I_US_WIN_M18_Hellcat","SEP_I_US_WIN_M10"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["SEP_I_US_WIN_M4A0_75","SEP_I_US_WIN_M4A3_75","SEP_I_US_WIN_M4A3_75", "SEP_I_US_WIN_M4A1_76","SEP_I_US_WIN_M4A3_76"]] call _fnc_saveToTemplate;
["vehiclesHeavyTanks", ["SEP_I_US_WIN_M4A1_T34_Calliope_Direct","SEP_I_US_WIN_M4A3_T34_Calliope_Direct"]] call _fnc_saveToTemplate;
["vehiclesAA", ["SEP_I_US_WIN_M16_Halftrack"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["I_C_Boat_Transport_02_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["I_C_Boat_Transport_02_F"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["SEP_I_US_WIN_P47D"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["SEP_I_US_WIN_P47D"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["SPEX_C47_Skytrain"]] call _fnc_saveToTemplate;

if (isClass (configFile >> "CfgPatches" >> "sab_flyinglegends")) then {
    private _CAS = ["SEP_I_US_WIN_P47D","sab_fl_p51b","sab_fl_p51d", "sab_fl_f4u"];

    if (isClass (configFile >> "CfgPatches" >> "sab_sw_tbf")) then {
        _CAS = _CAS + ["sab_sw_p40","sab_sw_p38","sab_sw_p61"];
    };
    ["vehiclesPlanesCAS", _CAS] call _fnc_saveToTemplate;
    ["vehiclesPlanesAA", ["SEP_I_US_WIN_P47D","sab_fl_p51b","sab_fl_p51d"]] call _fnc_saveToTemplate;
};

["vehiclesHelisLight", []] call _fnc_saveToTemplate;
["vehiclesHelisTransport", []] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", []] call _fnc_saveToTemplate;
["vehiclesHelisAttack", []] call _fnc_saveToTemplate;

["vehiclesArtillery", ["SEP_I_US_WIN_M4A1_T34_Calliope_Direct","SEP_I_US_WIN_M4A3_T34_Calliope_Direct","SEP_I_US_WIN_105mm_M3","SEP_I_US_WIN_105mm_M3","SEP_I_US_WIN_105mm_M3"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["SEP_I_US_WIN_M4A1_T34_Calliope_Direct", ["SPE_60Rnd_M8"]],
["SEP_I_US_WIN_M4A3_T34_Calliope_Direct", ["SPE_60Rnd_M8"]],
["SEP_I_US_WIN_105mm_M3", ["SPE_20x_Shell_M3_M1_HE_Artillery","SPE_8x_Shell_M3_M67_HEAT_Artillery"]]
]] call _fnc_saveToTemplate;

["uavsAttack", []] call _fnc_saveToTemplate;
["uavsPortable", []] call _fnc_saveToTemplate;

//Config special vehicles
["vehiclesMilitiaLightArmed", ["SEP_I_US_WIN_G503_MB_M1919", "SEP_I_US_WIN_G503_MB_M1919_Patrol"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["SEP_I_US_WIN_CCKW_353_Open"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["SEP_I_US_WIN_G503_MB_Open"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["SEP_I_US_WIN_G503_MB"]] call _fnc_saveToTemplate;

["staticMGs", ["SPE_M1919A6_Bipod"]] call _fnc_saveToTemplate;
["staticAT", ["SEP_I_US_WIN_57mm_M1"]] call _fnc_saveToTemplate;
["staticAA", ["SPE_FR_M45_Quadmount"]] call _fnc_saveToTemplate;
["staticMortars", ["SPE_M1_81"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "SPE_8Rnd_81mmHE_M1_M43A1"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "SPE_8rnd_81mm_M1_M57_SmokeShell"] call _fnc_saveToTemplate;

//Minefield definition
["minefieldAT", ["SPE_US_M1A1_ATMINE"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["SPE_US_M3_Pressure_MINE", "SPE_US_M3_MINE"]] call _fnc_saveToTemplate;

#include "SEP_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["LivonianHead_6", "SPE_Arnold", "SPE_boyartsev", "SPE_bykov", "SPE_Connors", "SPE_DAgostino", "SPE_Davidson", "SPE_Elliot", "SPE_Grishka", "SPE_Hauptmann", "SPE_Ivanych", "SPE_Jeppson", "SPE_Klimakov", "SPE_Krueger", "SPE_Kuzmin", "SPE_Neumann", "SPE_Oberst", "SPE_OBrien", "SPE_Seppmeyer", "SPE_Vasiliev", "SPE_Walter", "SPE_Wolf", "Sturrock", "WhiteHead_01", "WhiteHead_02", "WhiteHead_03", "WhiteHead_04", "WhiteHead_05", "WhiteHead_06", "WhiteHead_07", "WhiteHead_08", "WhiteHead_09", "WhiteHead_10", "WhiteHead_11", "WhiteHead_12", "WhiteHead_13", "WhiteHead_14", "WhiteHead_15", "WhiteHead_16", "WhiteHead_17", "WhiteHead_18", "WhiteHead_19", "WhiteHead_20", "WhiteHead_21"]] call _fnc_saveToTemplate;
["voices", ["Male01ENG", "Male02ENG", "Male03ENG", "Male04ENG", "Male05ENG", "Male06ENG", "Male07ENG", "Male08ENG", "Male09ENG", "Male10ENG", "Male11ENG", "Male12ENG"]] call _fnc_saveToTemplate;
"SPE_EnglishMen" call _fnc_saveNames;


//////////////////////////
//       Loadouts       //
//////////////////////////

private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["rifles", [
["SPE_M1_Garand", "SPE_ACC_M1_Bayo", "", "", ["SPE_8Rnd_762x63_M1", "SPE_8Rnd_762x63_M1", "SPE_8Rnd_762x63_t"], [], ""],
["SPE_M1_Garand", "SPE_ACC_M1_Bayo", "", "", ["SPE_8Rnd_762x63_M1", "SPE_8Rnd_762x63_M1", "SPE_8Rnd_762x63_t"], [], ""]
]];
_loadoutData set ["slRifles", [
["SPE_M1_Carbine", "", "", "", ["SPE_15Rnd_762x33", "SPE_15Rnd_762x33", "SPE_15Rnd_762x33_t"], [], ""],
["SPE_M1A1_Thompson", "", "", "", ["SPE_30Rnd_Thompson_45ACP", "SPE_30Rnd_Thompson_45ACP", "SPE_30Rnd_Thompson_45ACP_t"], [], ""],
["SPE_M3_GreaseGun", "", "", "", ["SPE_30Rnd_M3_GreaseGun_45ACP", "SPE_30Rnd_M3_GreaseGun_45ACP", "SPE_30Rnd_M3_GreaseGun_45ACP_t"], [], ""],
["SPE_M1_Garand", "", "", "", ["SPE_8Rnd_762x63_M1", "SPE_8Rnd_762x63_M1", "SPE_8Rnd_762x63_t"], [], ""]
]];
_loadoutData set ["shotGuns", [
["SPE_Model_37_Trenchgun", "SPE_ACC_M1917_Bayo", "", "", ["SPE_5Rnd_12x70_Slug", "SPE_5Rnd_12x70_Pellets", "SPE_5Rnd_12x70_Slug"], [], ""],
["SPE_Model_37_Trenchgun", "SPE_ACC_M1917_Bayo", "", "", ["SPE_5Rnd_12x70_Pellets", "SPE_5Rnd_12x70_Pellets", "SPE_5Rnd_12x70_Slug"], [], ""],
["SPE_Model_37_Riotgun", "", "", "", ["SPE_5Rnd_12x70_Slug", "SPE_5Rnd_12x70_Pellets", "SPE_5Rnd_12x70_Slug"], [], ""]
]];
_loadoutData set ["carbines", [
["SPE_M1_Carbine", "", "", "", ["SPE_15Rnd_762x33", "SPE_15Rnd_762x33", "SPE_15Rnd_762x33_t"], [], ""],
["SPE_M1A1_Carbine", "", "", "", ["SPE_15Rnd_762x33", "SPE_15Rnd_762x33", "SPE_15Rnd_762x33_t"], [], ""]
]];
_loadoutData set ["grenadeLaunchers", [
["SPE_M1_Garand_M7", "SPE_ACC_GL_M7", "", "", ["SPE_8Rnd_762x63_M1", "SPE_8Rnd_762x63_M1", "SPE_8Rnd_762x63_t"], ["SPE_1Rnd_G_M9A1", "SPE_1Rnd_G_Mk2", "SPE_1Rnd_G_M17A1", "SPE_1Rnd_G_M2_ANM8"], ""],
["SPE_M1_Garand_M7", "SPE_ACC_GL_M7", "", "", ["SPE_8Rnd_762x63_M1", "SPE_8Rnd_762x63_M1", "SPE_8Rnd_762x63_t"], ["SPE_1Rnd_G_Mk2", "SPE_1Rnd_G_M9A1", "SPE_1Rnd_G_M17A1", "SPE_1Rnd_G_M2_ANM8"], ""],
["SPE_M1_Carbine_M8", "SPE_ACC_GL_M8", "", "", ["SPE_15Rnd_762x33", "SPE_15Rnd_762x33", "SPE_15Rnd_762x33_t"], ["SPE_1Rnd_G_M9A1", "SPE_1Rnd_G_Mk2", "SPE_1Rnd_G_M17A1", "SPE_1Rnd_G_M2_ANM8"], ""],
["SPE_M1_Carbine_M8", "SPE_ACC_GL_M8", "", "", ["SPE_15Rnd_762x33", "SPE_15Rnd_762x33", "SPE_15Rnd_762x33_t"], ["SPE_1Rnd_G_Mk2", "SPE_1Rnd_G_M9A1", "SPE_1Rnd_G_M17A1", "SPE_1Rnd_G_M2_ANM8"], ""]
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
["SPE_M1903A4_Springfield", "", "", "", ["SPE_5Rnd_762x63", "SPE_5Rnd_762x63", "SPE_5Rnd_762x63_t"], [], ""]
]];
_loadoutData set ["sniperRifles", [
["SPE_M1903A4_Springfield", "", "", "", ["SPE_5Rnd_762x63_M1", "SPE_5Rnd_762x63_M1", "SPE_5Rnd_762x63_M2_AP"], [], ""]
]];

_loadoutData set ["lightATLaunchers", [
["SPE_M1_Carbine_M8", "SPE_ACC_GL_M8", "", "", ["SPE_15Rnd_762x33", "SPE_15Rnd_762x33", "SPE_15Rnd_762x33_t"], ["SPE_1Rnd_G_M9A1", "SPE_1Rnd_G_Mk2", "SPE_1Rnd_G_M17A1", "SPE_1Rnd_G_M2_ANM8"], ""]
]];
_loadoutData set ["ATLaunchers", ["SPE_M9_Bazooka","SPE_M9A1_Bazooka","SPE_M1A1_Bazooka","SPE_M1A1_Bazooka"]];
_loadoutData set ["sidearms", ["SPE_M1911"]];

_loadoutData set ["ATMines", ["SPE_US_M1A1_ATMINE_mag"]];
_loadoutData set ["APMines", ["SPE_US_M3_Pressure_MINE_mag", "SPE_US_M3_MINE_mag"]];
_loadoutData set ["lightExplosives", ["SPE_US_TNT_half_pound_mag"]];
_loadoutData set ["heavyExplosives", ["SPE_US_TNT_4pound_mag", "SPE_US_Bangalore_mag"]];

_loadoutData set ["antiTankGrenades", []];
_loadoutData set ["antiInfantryGrenades", ["SPE_US_Mk_2", "SPE_US_Mk_2_Yellow", "SPE_US_Mk_3", "SPE_US_AN_M14"]];
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

_loadoutData set ["uniforms", ["SEP_I_US_U_Coat_snow", "SEP_I_US_U_Coat_snow", "SEP_I_US_U_M43_snow", "SEP_I_US_U_M43_trop_snow"]];
_loadoutData set ["medUniforms", ["SEP_I_US_U_M43_snow"]];
_loadoutData set ["engUniforms", ["SEP_I_US_U_M43_trop_snow"]];
_loadoutData set ["slUniforms", ["SEP_I_US_U_Coat_snow"]];

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

_loadoutData set ["helmets", ["SEP_I_US_H_M1Helmet_WIN_os", "SEP_I_US_H_M1Helmet_WIN_ns", "SEP_I_US_H_M1Helmet_WIN", "SEP_I_US_H_M1Helmet_Cover_WIN_os", "SEP_I_US_H_M1Helmet_Cover_WIN_ns", "SEP_I_US_H_M1Helmet_Cover_WIN"]];
_loadoutData set ["medHelmets", ["H_SPE_US_Helmet_Med","H_SPE_US_Helmet_Med_ns","H_SPE_US_Helmet_Med_os"]];
_loadoutData set ["slHelmets", []];
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
_sfLoadoutData set ["uniforms", ["SEP_I_US_U_Coat_snow"]];
_sfLoadoutData set ["medUniforms", ["SEP_I_US_U_Coat_snow"]];
_sfLoadoutData set ["engUniforms", ["SEP_I_US_U_Coat_snow"]];
_sfLoadoutData set ["slUniforms", ["SEP_I_US_U_Coat_snow"]];

_sfLoadoutData set ["vests", ["V_SPE_US_Assault_Vest", "V_SPE_US_Assault_Vest_Light", "V_SPE_US_Assault_Vest_rifle"]];
_sfLoadoutData set ["glVests", ["V_SPE_US_Assault_Vest_Bag"]];
_sfLoadoutData set ["sniVests", ["V_SPE_US_Assault_Vest_Light"]];
_sfLoadoutData set ["medVests", ["V_SPE_US_Assault_Vest_alt"]];
_sfLoadoutData set ["engVests", ["V_SPE_US_Assault_Vest_eng"]];
_sfLoadoutData set ["mgVests", ["V_SPE_US_Assault_Vest_Bag"]];
_sfLoadoutData set ["slVests", ["V_SPE_US_Assault_Vest_alt", "V_SPE_US_Assault_Vest_rifle_M43"]];

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
_sfLoadoutData set ["grenadeLaunchers", [
["SPE_M1_Garand_M7", "SPE_ACC_GL_M7", "", "", ["SPE_8Rnd_762x63_M1", "SPE_8Rnd_762x63_M1", "SPE_8Rnd_762x63_t"], ["SPE_1Rnd_G_M9A1", "SPE_1Rnd_G_Mk2", "SPE_1Rnd_G_M17A1", "SPE_1Rnd_G_M2_ANM8"], ""],
["SPE_M1_Garand_M7", "SPE_ACC_GL_M7", "", "", ["SPE_8Rnd_762x63_M1", "SPE_8Rnd_762x63_M1", "SPE_8Rnd_762x63_t"], ["SPE_1Rnd_G_Mk2", "SPE_1Rnd_G_M9A1", "SPE_1Rnd_G_M17A1", "SPE_1Rnd_G_M2_ANM8"], ""]
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

_policeLoadoutData set ["uniforms", ["SEP_I_US_U_Coat_snow"]];
_policeLoadoutData set ["vests", ["V_SPE_milice_Vest_zwart_rifle", "V_SPE_milice_Vest_zwart_rifle_sidearm","V_SPE_milice_Vest_zwart_sidearm"]];
_policeLoadoutData set ["helmets", ["H_SPE_US_MP_Helmet_White", "H_SPE_US_MP_Helmet_White_ns", "H_SPE_US_MP_Helmet_White_os"]];
_policeLoadoutData set ["slHelmets", ["H_SPE_US_MP_Helmet_White"]];

_policeLoadoutData set ["SMGs", [
["SPE_M3_GreaseGun", "", "", "", ["SPE_30Rnd_M3_GreaseGun_45ACP"], [], ""]
]];
_policeLoadoutData set ["rifles", [
["SPE_M1903A3_Springfield", "", "", "", [], [], ""]
]];
_policeLoadoutData set ["shotGuns", [
["SPE_Model_37_Riotgun", "", "", "", ["SPE_5Rnd_12x70_Pellets", "SPE_5Rnd_12x70_Pellets", "SPE_5Rnd_12x70_Slug"], [], ""],
["SPE_Model_37_Riotgun", "", "", "", ["SPE_5Rnd_12x70_Pellets"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_militiaLoadoutData set ["uniforms", ["SEP_I_US_U_M43_snow", "SEP_I_US_U_M43_trop_snow"]];
_militiaLoadoutData set ["medUniforms", []];
_militiaLoadoutData set ["engUniforms", []];
_militiaLoadoutData set ["slUniforms", []];

_militiaLoadoutData set ["lightATLaunchers", [
["SPE_M1903A3_Springfield_M1_GL", "SPE_ACC_GL_M1", "", "", ["SPE_5Rnd_762x63_M1", "SPE_5Rnd_762x63_M1", "SPE_5Rnd_762x63_t"], ["SPE_1Rnd_G_M9A1"], ""]
]];
_militiaLoadoutData set ["ATLaunchers", []];
_militiaLoadoutData set ["sidearms", []];

_militiaLoadoutData set ["rifles", [
["SPE_M1903A3_Springfield", "SPE_ACC_M1905_Bayo", "", "", [], [], ""],
["SPE_M1903A3_Springfield", "SPE_ACC_M1905_Bayo", "", "", [], [], ""],
["SPE_M1903A3_Springfield", "", "", "", [], [], ""]
]];
_militiaLoadoutData set ["slRifles", [
["SPE_M3_GreaseGun", "", "", "", ["SPE_30Rnd_M3_GreaseGun_45ACP"], [], ""],
["SPE_M1_Carbine", "", "", "", ["SPE_15Rnd_762x33", "SPE_15Rnd_762x33", "SPE_15Rnd_762x33_t"], [], ""],
["SPE_M1903A3_Springfield", "", "", "", [], [], ""]
]];
_militiaLoadoutData set ["shotGuns", [
["SPE_Model_37_Riotgun", "", "", "", ["SPE_5Rnd_12x70_Pellets", "SPE_5Rnd_12x70_Pellets", "SPE_5Rnd_12x70_Slug"], [], ""],
["SPE_Model_37_Riotgun", "", "", "", ["SPE_5Rnd_12x70_Pellets", "SPE_5Rnd_12x70_Pellets"], [], ""],
["SPE_Model_37_Trenchgun", "SPE_ACC_M1917_Bayo", "", "", ["SPE_5Rnd_12x70_Pellets", "SPE_5Rnd_12x70_Pellets", "SPE_5Rnd_12x70_Slug"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
["SPE_M1_Carbine", "", "", "", ["SPE_15Rnd_762x33", "SPE_15Rnd_762x33", "SPE_15Rnd_762x33_t"], [], ""],
["SPE_M1903A3_Springfield", "", "", "", [], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["SPE_M1903A3_Springfield_M1_GL", "SPE_ACC_GL_M1", "", "", ["SPE_5Rnd_762x63_M1", "SPE_5Rnd_762x63_M1", "SPE_5Rnd_762x63_t"], ["SPE_1Rnd_G_Mk2", "SPE_1Rnd_G_M9A1", "SPE_1Rnd_G_M17A1", "SPE_1Rnd_G_M2_ANM8"], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["SPE_M1903A3_Springfield", "", "", "", [], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
["SPE_M1903A3_Springfield", "", "", "", [], [], ""]
]];
_militiaLoadoutData set ["SMGs", [
["SPE_M3_GreaseGun", "", "", "", ["SPE_30Rnd_M3_GreaseGun_45ACP"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["SPE_M1918A2_erla_BAR", "", "SPE_M1918A2_BAR_Handle", "", ["SPE_20Rnd_762x63_M1"], [], ""],
["SPE_M1918A0_BAR", "", "", "", ["SPE_20Rnd_762x63_M1"], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["H_SPE_US_Helmet_Tank_M1_Scrim", "H_SPE_US_Helmet_Tank_M1_OS", "H_SPE_US_Helmet_Tank_M1_NS", "U_SPE_US_Tank_Crew", "U_SPE_US_Tank_Crew2", "U_SPE_US_Tank_Crew3"]];
_crewLoadoutData set ["vests", ["V_SPE_US_Vest_45"]];
_crewLoadoutData set ["helmets", ["H_SPE_US_Helmet_Tank_polar", "H_SPE_US_Helmet_Tank_polar_tapes"]];
_crewLoadoutData set ["backpacks", []];
_crewLoadoutData set ["SMGs", [
    ["SPE_M3_GreaseGun", "", "", "", ["SPE_30Rnd_M3_GreaseGun_45ACP"], [], ""]
]];

private _pilotLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["U_SPE_US_Pilot", "U_SPE_US_Pilot_2"]];
_pilotLoadoutData set ["vests", ["V_SPE_US_LifeVest"]];
_pilotLoadoutData set ["helmets", ["H_SPE_US_Helmet_Pilot"]];
_pilotLoadoutData set ["backpacks", ["B_SPE_US_TypeA3"]];
_pilotLoadoutData set ["SMGs", []];

private _officerLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_officerLoadoutData set ["slUniforms", ["SEP_I_US_U_Coat_brn"]];
_officerLoadoutData set ["slVests", ["V_SPE_US_Vest_45_off", "V_SPE_US_Vest_45_high_off"]];
_officerLoadoutData set ["slHelmets", ["H_SPE_US_Pilot_Cap", "H_SPE_US_Pilot_Cap_Khaki"]];
_officerLoadoutData set ["backpacks", []];
_officerLoadoutData set ["slBackpacks", []];

_officerLoadoutData set ["slRifles", [
["SPE_M1_Carbine", "", "", "", ["SPE_15Rnd_762x33", "SPE_15Rnd_762x33", "SPE_15Rnd_762x33_t"], [], ""],
["SPE_M1A1_Thompson", "", "", "", ["SPE_30Rnd_Thompson_45ACP", "SPE_30Rnd_Thompson_45ACP", "SPE_30Rnd_Thompson_45ACP_t"], [], ""],
["SPE_M3_GreaseGun", "", "", "", ["SPE_30Rnd_M3_GreaseGun_45ACP", "SPE_30Rnd_M3_GreaseGun_45ACP", "SPE_30Rnd_M3_GreaseGun_45ACP_t"], [], ""]
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
    ["Flashlight"] call _fnc_addNVGs;

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
    ["Flashlight"] call _fnc_addNVGs;
};

private _medicTemplate = {
    [["medHelmets", "helmets"] call _fnc_fallback] call _fnc_setHelmet;
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
    ["Flashlight"] call _fnc_addNVGs;
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
    ["Flashlight"] call _fnc_addNVGs;
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
    ["Flashlight"] call _fnc_addNVGs;
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
    ["antiTankGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["Flashlight"] call _fnc_addNVGs;
};

private _atTemplate = {
    private _launcher = ["ATLaunchers", "lightATLaunchers"] call _fnc_fallback;
    if (_launcher == "lightATLaunchers") exitWith {call _latTemplate};
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
    ["Flashlight"] call _fnc_addNVGs;
};

private _aaTemplate = {
    call selectRandom [_atTemplate, _latTemplate, _riflemanTemplate];
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
    ["Flashlight"] call _fnc_addNVGs;
    ["binoculars"] call _fnc_addBinoculars;
};

private _sniperTemplate = {
    [["sniHelmets", "helmets"] call _fnc_fallback] call _fnc_setHelmet;
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
