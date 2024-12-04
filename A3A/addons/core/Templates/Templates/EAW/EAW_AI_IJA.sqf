//////////////////////////
//   Side Information   //
//////////////////////////

["name", "IJA"] call _fnc_saveToTemplate;
["spawnMarkerName", "IJA Support Corridor"] call _fnc_saveToTemplate;

["flag", "Flag_FIA_F"] call _fnc_saveToTemplate;
["flagTexture", "\A3\Data_F\Flags\Flag_red_CO.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "Faction_OPFOR_EP1"] call _fnc_saveToTemplate;

["attributeLowAir", true] call _fnc_saveToTemplate;             // Use fewer air units in general
["attributeMoreTrucks", true] call _fnc_saveToTemplate;         // Use more truck for transports
["attributeNoSAM", true] call _fnc_saveToTemplate;              // Don't use SAM supports

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

// vehicles can be placed in more than one category if they fit between both. Cost will be derived by the higher category
["vehiclesBasic", ["EAW_T94_Truck"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["EAW_T94_Truck"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["EAW_Crossley"]] call _fnc_saveToTemplate;             // Should be armed, unarmoured to lightly armoured, with 0-4 passengers
["vehiclesTrucks", ["EAW_T94_Truck","EAW_T94_Truck_1941J","EAW_T94_Truck_1941"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["EAW_T94_Truck","EAW_T94_Truck_1941J","EAW_T94_Truck_1941"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["EAW_Dodge1936_Pickup_Military_Ammo_IJA"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["EAW_Dodge1936_Pickup_Military_Fuel_IJA"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["EAW_Dodge1936_Pickup_Military_Fuel_IJA"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["EAW_Dodge1936_Pickup_Military_Medical_IJA"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", []] call _fnc_saveToTemplate;             // armed, lightly armoured, with 6-8 passengers 
["vehiclesAPCs", []] call _fnc_saveToTemplate;                  // armed with enclosed turret, armoured, with 6-8 passengers
["vehiclesIFVs", ["LIB_UniversalCarrier"]] call _fnc_saveToTemplate;                  // capable of surviving multiple rockets, cannon armed, with 6-8 passengers
["vehiclesLightTanks", ["EAW_ChiHa", "EAW_Type89_1937"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["EAW_ChiHa", "EAW_ChiHa_Kai"]] call _fnc_saveToTemplate;
["vehiclesAA", ["LIB_Zis5v_61K"]] call _fnc_saveToTemplate;                    // ideally heavily armed with anti-ground capability and enclosed turret. Passengers will be ignored


["vehiclesTransportBoats", ["EAW_Daihatsu_LC_IJA"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["LIB_UK_LCI"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["EAW_G3M", "EAW_Ki43_II"]] call _fnc_saveToTemplate;             // Will be used with CAS script, must be defined in setPlaneLoadout. Needs fixed gun and either rockets or missiles
["vehiclesPlanesAA", ["EAW_Ki43_II"]] call _fnc_saveToTemplate;              // 
["vehiclesPlanesTransport", ["LIB_C47_RAF"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", []] call _fnc_saveToTemplate;            // ideally fragile & unarmed helis seating 4+
["vehiclesHelisTransport", []] call _fnc_saveToTemplate;
// Should be capable of dealing damage to ground targets without additional scripting
["vehiclesHelisLightAttack", []] call _fnc_saveToTemplate;      // Utility helis with fixed or door guns + rocket pods
["vehiclesHelisAttack", []] call _fnc_saveToTemplate;           // Proper attack helis: Apache, Hind etc

["vehiclesArtillery", ["EAW_IJA_Type91_Gun_Arty","EAW_Type38Kai_Arty"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["EAW_IJA_Type91_Gun_Arty", ["EAW_Type91_105mm_Arty_Magazine"]],
["EAW_Type38Kai_Arty", ["EAW_Type38Kai_Arty_Magazine"]],
["EAW_IJA_Type92_BG_Arty", ["EAW_Type92BG_70mm_Arty_Magazine"]]
]] call _fnc_saveToTemplate; //element format: [Vehicle class, [Magazines]]

["uavsAttack", []] call _fnc_saveToTemplate;
["uavsPortable", []] call _fnc_saveToTemplate;

//Config special vehicles
["vehiclesMilitiaLightArmed", ["EAW_Crossley"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["EAW_Dodge1936_Pickup_Military_IJA"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["EAW_Dodge1936_Pickup_Military_IJA"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["EAW_Dodge1936_Pickup_Military_ROC"]] call _fnc_saveToTemplate;

["staticMGs", ["EAW_Type24_MG"]] call _fnc_saveToTemplate;
["staticAT", ["EAW_Type1_47mm_J", "EAW_IJA_Type92_BG"]] call _fnc_saveToTemplate;
["staticAA", ["EAW_T98_20mm_AA", "EAW_T98_20mm_AA", "EAW_IJA_Type99_88_AA_1941"]] call _fnc_saveToTemplate;
["staticMortars", ["EAW_IJA_Type97_Mortar_1941J"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "EAW_Type97_81mm_HE"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", ""] call _fnc_saveToTemplate;
["mortarMagazineFlare", "EAW_Type97_81mm_Flare"] call _fnc_saveToTemplate;

//Minefield definition
//CFGVehicles variant of Mines are needed "ATMine", "APERSTripMine", "APERSMine"
["minefieldAT", []] call _fnc_saveToTemplate;
["minefieldAPERS", []] call _fnc_saveToTemplate;

#include "..\IFA\IFA_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////
//Faces and Voices given to AI Factions.
["voices", ["Male01CHI","Male02CHI","Male03CHI"]] call _fnc_saveToTemplate;
["faces", ["AsianHead_A3_01","AsianHead_A3_02","AsianHead_A3_03","AsianHead_A3_04","AsianHead_A3_05","AsianHead_A3_06","AsianHead_A3_07"]] call _fnc_saveToTemplate;
"ChineseMen" call _fnc_saveNames;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", ["EAW_Type89_Discharger"]];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];

_loadoutData set ["lightATLaunchers", []];
_loadoutData set ["ATLaunchers", ["LIB_M1A1_Bazooka"]];
_loadoutData set ["sidearms", ["EAW_Type14"]];
_loadoutData set ["slSidearms", ["EAW_Dao"]];

_loadoutData set ["ATMines", []];
_loadoutData set ["APMines", []];
_loadoutData set ["lightExplosives", []];
_loadoutData set ["heavyExplosives", []];

_loadoutData set ["antiTankGrenades", ["EAW_Type3_Grenade_Mag"]];
_loadoutData set ["antiInfantryGrenades", ["EAW_Type91_Mag", "EAW_Type91_Trans_Mag", "EAW_Type97_Mag"]];
_loadoutData set ["smokeGrenades", ["LIB_NB39"]];
_loadoutData set ["signalsmokeGrenades", []];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", []];
_loadoutData set ["NVGs", []];
_loadoutData set ["binoculars", ["LIB_Binocular_UK"]];
_loadoutData set ["rangefinders", ["LIB_Binocular_UK"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["vests", ["EAW_Type90_RifleKit", "EAW_RJ_RifleKit", "EAW_SNLF_RifleKit_1"]];
_loadoutData set ["MGVests", ["EAW_IJA_LMG_Kit", "EAW_Type11_Kit"]];
_loadoutData set ["SMGVests", ["EAW_IJA_SMG_Kit"]];
_loadoutData set ["MedVests", ["EAW_Type90_RifleKit_Medic"]];
_loadoutData set ["GrenVests", ["EAW_Type90_GrenadierKit"]];
_loadoutData set ["backpacks", []];
_loadoutData set ["longRangeRadios", []];
_loadoutData set ["helmets", []];
_loadoutData set ["slHelmets", ["EAW_IJA_Cap_Wool"]];
_loadoutData set ["sniHelmets", ["EAW_Type92_Camo1", "EAW_Type92_Camo2","EAW_Type92_Camo3", "EAW_Type92_Camo4"]];

_loadoutData set ["facewear", []];
_loadoutData set ["sniFacewear", ["EAW_CamoVest_1", "EAW_CamoVest_2", "EAW_CamoVest_3", "EAW_CamoVest_4", "EAW_CamoVest_5", "EAW_CamoVest_6"]];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
_loadoutData set ["items_squadLeader_extras", []];
_loadoutData set ["items_rifleman_extras", []];
_loadoutData set ["items_medic_extras", []];
_loadoutData set ["items_grenadier_extras", []];
_loadoutData set ["items_explosivesExpert_extras", ["ToolKit", "MineDetector"]];
_loadoutData set ["items_engineer_extras", ["ToolKit", "MineDetector"]];
_loadoutData set ["items_lat_extras", []];
_loadoutData set ["items_at_extras", []];
_loadoutData set ["items_aa_extras", []];
_loadoutData set ["items_machineGunner_extras", []];
_loadoutData set ["items_marksman_extras", []];
_loadoutData set ["items_sniper_extras", []];
_loadoutData set ["items_police_extras", []];
_loadoutData set ["items_crew_extras", []];
_loadoutData set ["items_unarmed_extras", []];

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_sfLoadoutData set ["uniforms", ["EAW_Type98_Uniform_Jyuban_Rolled", "EAW_Type98_Uniform_Jyuban"]];
_sfLoadoutData set ["vests", ["EAW_Jyuban_RifleKit", "EAW_Jyuban_RifleKit", "EAW_Jyuban_LMG_BearerKit"]];
_sfLoadoutData set ["MGVests", ["EAW_Jyuban_Type11Kit", "EAW_Jyuban_LMGKit"]];
_sfLoadoutData set ["SMGVests", ["EAW_IJA_SMG_Kit"]];
_sfLoadoutData set ["MedVests", ["EAW_Jyuban_MedicKit"]];
_sfLoadoutData set ["GrenVests", ["EAW_Jyuban_GrenadierKit"]];
_sfLoadoutData set ["backpacks", ["EAW_Jyuban_GrenadierBag", "EAW_IJA_LMG_AmmoBearer_Bag_Jyuban"]];
_sfLoadoutData set ["helmets", ["EAW_Type92_Camo1", "EAW_Type92_Camo2","EAW_Type92_Camo3", "EAW_Type92_Camo4"]];
_sfLoadoutData set ["facewear", ["EAW_CamoVest_2", "EAW_CamoVest_3", "EAW_CamoVest_4", "EAW_CamoVest_5", "EAW_CamoVest_6"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["slRifles", [
    "EAW_MP28",
    ["EAW_Type99_Long_Stock2", "EAW_Type30_Bayonet_Attach", "", "", [], [], ""],
    ["LIB_M1_Carbine", "", "", "", ["LIB_15Rnd_762x33", "LIB_15Rnd_762x33", "LIB_15Rnd_762x33_t"], [], ""],
    ["LIB_M1928_Thompson", "", "", "", ["LIB_50Rnd_45ACP", "LIB_30Rnd_45ACP", "LIB_30Rnd_45ACP", "LIB_30Rnd_45ACP_t"], [], ""]
]];
_sfLoadoutData set ["rifles", [
    ["EAW_Type99_Long_Stock2", "EAW_Type30_Bayonet_Attach", "", "", [], [], ""]
]];
_sfLoadoutData set ["carbines", [
    ["LIB_M1_Carbine", "", "", "", ["LIB_15Rnd_762x33", "LIB_15Rnd_762x33", "LIB_15Rnd_762x33_t"], [], ""],
    ["EAW_Type99_Short_Stock2", "EAW_Type30_Bayonet_Attach", "", "", [], [], ""],
    ["EAW_Type99_Long_Stock2", "EAW_Type30_Bayonet_Attach", "", "", [], [], ""]
]];
_sfLoadoutData set ["SMGs", [
    "EAW_MP28",
    "EAW_MP28",
    ["LIB_M1928_Thompson", "", "", "", ["LIB_50Rnd_45ACP", "LIB_30Rnd_45ACP", "LIB_30Rnd_45ACP", "LIB_30Rnd_45ACP_t"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
    ["EAW_Type99", "EAW_Type30_Bayonet_Attach", "", "", [], [], "EAW_Type99_Bipod"]
]];
_sfLoadoutData set ["marksmanRifles", [
    ["EAW_Type97_Sniper_Stock2", "EAW_Type30_Bayonet_Attach", "", "EAW_Type97_Sniper_Scope", [], [], ""]
]];
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["EAW_Type98_Uniform_Summer"]];
_militaryLoadoutData set ["backpacks", ["EAW_Japanese_Backpack_Type5_Hide", "EAW_Bedroll_Tan"]];
_militaryLoadoutData set ["helmets", ["EAW_Type92","EAW_Type92_Cover","EAW_Type92_Cover_Net"]];

_militaryLoadoutData set ["rifles", [
["EAW_Type99_Long", "EAW_Type30_Bayonet_Attach", "", "", [], [], ""],
["EAW_Type38_Base", "EAW_Type30_Bayonet_Attach", "", "", [], [], ""],
["EAW_Type38_NoCover", "EAW_Type30_Bayonet_Attach", "", "", [], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["EAW_Type99_Short", "EAW_Type30_Bayonet_Attach", "", "", [], [], ""],
["EAW_Type38_Carbine", "EAW_Type30_Bayonet_Attach", "", "", [], [], ""],
["EAW_Type38_Carbine_NoCover", "EAW_Type30_Bayonet_Attach", "", "", [], [], ""]
]];
_militaryLoadoutData set ["SMGs", [
["EAW_Type99_Short", "EAW_Type30_Bayonet_Attach", "", "", [], [], ""],
"EAW_MP28"
]];
_militaryLoadoutData set ["machineGuns", [
["EAW_Type99", "EAW_Type30_Bayonet_Attach", "", "", [], [], "EAW_Type99_Bipod"],
["EAW_Type96", "EAW_Type30_Bayonet_Attach", "", "", [], [], "EAW_Type99_Bipod"],
["EAW_Type11_Base", "", "", "", [], [], "EAW_Type11_Bipod"]
]];
_militaryLoadoutData set ["marksmanRifles", [
["EAW_Type97_Sniper", "EAW_Type30_Bayonet_Attach", "", "EAW_Type97_Sniper_Scope", [], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["EAW_RJ_Japanese_Uniform"]];
_policeLoadoutData set ["vests", ["EAW_IJA_SwordBelt"]];
_policeLoadoutData set ["helmets", ["EAW_RJ_Japanese_Cap"]];

_policeLoadoutData set ["carbines", [
["EAW_Type38_Carbine", "EAW_Type30_Bayonet_Attach", "", "", [], [], ""],
["EAW_Type38_Carbine_NoCover", "EAW_Type30_Bayonet_Attach", "", "", [], [], ""]
]];
_policeLoadoutData set ["sidearms", ["EAW_Type95"]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["EAW_Type90_Uniform_Transition_Summer"]];
_militiaLoadoutData set ["backpacks", ["EAW_Bedroll_Tan"]];
_militiaLoadoutData set ["helmets", ["EAW_IJA_Plum"]];

_militiaLoadoutData set ["ATLaunchers", []];

_militiaLoadoutData set ["rifles", [
["EAW_Type30_Rifle", "", "", "", [], [], ""],
["EAW_Type30_Rifle_Stock2", "EAW_Type30_Bayonet_Attach", "", "", [], [], ""]
]];
_militiaLoadoutData set ["carbines", [
["EAW_Type30_Rifle", "", "", "", [], [], ""],
["EAW_Type30_Rifle_Stock2", "EAW_Type30_Bayonet_Attach", "", "", [], [], ""]
]];
_militiaLoadoutData set ["SMGs", [
["EAW_Type30_Rifle", "", "", "", [], [], ""],
["EAW_Type30_Rifle_Stock2", "EAW_Type30_Bayonet_Attach", "", "", [], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["EAW_Type11_Base", "", "", "", [], [], "EAW_Type11_Bipod"]
]];
_militiaLoadoutData set ["marksmanRifles", [
["EAW_Type30_Rifle", "", "", "", [], [], ""],
["EAW_Type30_Rifle_Stock2", "EAW_Type30_Bayonet_Attach", "", "", [], [], ""]
]];
_militiaLoadoutData set ["sidearms", ["EAW_Type30"]];
_militiaLoadoutData set ["slSidearms", ["EAW_Type30"]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
/*
private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", []];
_crewLoadoutData set ["vests", []];
_crewLoadoutData set ["helmets", []];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", []];
_pilotLoadoutData set ["vests", []];
_pilotLoadoutData set ["helmets", []];
*/

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
    ["facewear"] call _fnc_setFacewear;
    ["SMGVests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["SMGs", "rifles"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

    ["slSidearms"] call _fnc_setHandgun;

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
    ["gpses"] call _fnc_addGPS;
    ["binoculars"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _riflemanTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["rifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_rifleman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _medicTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["facewear"] call _fnc_setFacewear;
    ["MedVests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;
	[selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
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
    ["facewear"] call _fnc_setFacewear;
    ["GrenVests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["rifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_grenadier_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    _grenade = selectRandom ["antiInfantryGrenades", "grenadeLaunchers"];
    if (_grenade isEqualTo "grenadeLaunchers") then {
        ["antiInfantryGrenades", 2] call _fnc_addItem;
        ["grenadeLaunchers"] call _fnc_setLauncher;
        ["launcher", 2] call _fnc_addMagazines;
    } else {
        ["antiInfantryGrenades", 4] call _fnc_addItem;
        ["antiTankGrenades", 2] call _fnc_addItem;
    };
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _explosivesExpertTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["facewear"] call _fnc_setFacewear;
    ["GrenVests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
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
    ["antiTankGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _engineerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["facewear"] call _fnc_setFacewear;
    ["GrenVests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_engineer_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    if (random 1 > 0.5) then {["lightExplosives", 1] call _fnc_addItem;};

    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["antiTankGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _latTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["facewear"] call _fnc_setFacewear;
    ["GrenVests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_lat_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiTankGrenades", 4] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _atTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    [selectRandom ["ATLaunchers", "grenadeLaunchers"]] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_at_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiTankGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _aaTemplate = {
    call selectRandom[_latTemplate, _atTemplate];
};

private _machineGunnerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["facewear"] call _fnc_setFacewear;
    ["MGVests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["machineGuns"] call _fnc_setPrimary;
    ["primary", 4] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_machineGunner_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _marksmanTemplate = {
    ["sniHelmets"] call _fnc_setHelmet;
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["marksmanRifles"] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_marksman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["rangefinders"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _sniperTemplate = {
    ["sniHelmets"] call _fnc_setHelmet;
    ["sniFacewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["marksmanRifles"] call _fnc_setPrimary;
    ["primary", 7] call _fnc_addMagazines;

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
    ["rangefinders"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _policeTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["carbines"] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_police_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _crewTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["facewear"] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["carbines"] call _fnc_setPrimary;
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
["other", [["Official", _policeTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate]], _militiaLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
