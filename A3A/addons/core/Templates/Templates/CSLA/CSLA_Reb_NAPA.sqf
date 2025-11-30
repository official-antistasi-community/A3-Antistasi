///////////////////////////
//   Rebel Information   //
///////////////////////////

["name", "NAPA"] call _fnc_saveToTemplate; 

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate;
["flagTexture", "cup\baseconfigs\cup_baseconfigs\data\flags\flag_napa_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "Faction_CUP_NAPA"] call _fnc_saveToTemplate;

["vehiclesBasic", ["I_Quadbike_01_F", "US85_TT650", "CSLA_CIV_JARA250"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["CUP_B_UAZ_Open_CDF"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["CUP_O_Datsun_PK"]] call _fnc_saveToTemplate;
["vehiclesTruck", ["CUP_V3S_Open_NAPA"]] call _fnc_saveToTemplate;
["vehiclesAT", ["CUP_B_UAZ_SPG9_CDF"]] call _fnc_saveToTemplate;
["vehiclesAA", ["CUP_I_Ural_ZU23_NAPA", "CUP_I_Hilux_zu23_NAPA"]] call _fnc_saveToTemplate;
["vehiclesBoat", ["I_G_Boat_Transport_01_F", "CUP_I_RHIB_RACS"]] call _fnc_saveToTemplate;

["vehiclesPlane", ["CSLA_CIV_An2_1"]] call _fnc_saveToTemplate;       // replace from civ varient s
["vehiclesCivPlane", ["CUP_I_CESSNA_T41_UNARMED_LDF", "CUP_C_C47_CIV"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["CUP_I_LR_Ambulance_RACS"]] call _fnc_saveToTemplate;


["vehiclesCivCar", ["CUP_C_Datsun_4seat","CSLA_CIV_AZU"]] call _fnc_saveToTemplate;
["vehiclesCivTruck", ["CUP_C_V3S_Covered_TKC"]] call _fnc_saveToTemplate;
["vehiclesCivHeli", ["CUP_C_412"]] call _fnc_saveToTemplate;
["vehiclesCivBoat", ["C_Rubberboat"]] call _fnc_saveToTemplate;

["staticMGs", ["CSLA_UK59L_Stat"]] call _fnc_saveToTemplate;
["staticAT", ["CSLA_BzK59A_Stat", "CSLA_T21_Stat"]] call _fnc_saveToTemplate;
["staticAA", ["CUP_I_ZU23_NAPA"]] call _fnc_saveToTemplate;

["staticMortars", ["CUP_I_2b14_82mm_NAPA"]] call _fnc_saveToTemplate;
["staticMortarMagHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["staticMortarMagSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
["staticMortarMagFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["mineAT", "CSLA_PtMiBa3_mag", "US85_M87A1Mine_mag"] call _fnc_saveToTemplate;
["mineAPERS", "CSLA_PPMiSr2_mag", "US85_M14Mine_mag"] call _fnc_saveToTemplate;

["breachingExplosivesAPC", [["SatchelCharge_Remote_Mag", 1], ["US85_SatchelCharge_Mag", 1], ["CSLA_IVZ", 1], ["DemoCharge_Remote_Mag", 1], ["CSLA_TNT0100g", 2]]] call _fnc_saveToTemplate;
["breachingExplosivesTank", [["SatchelCharge_Remote_Mag", 1], ["CSLA_IVZ", 1], ["CSLA_TNT0100g", 4], ["DemoCharge_Remote_Mag", 4], ["US85_SatchelCharge_Mag", 1]]] call _fnc_saveToTemplate;

#include "CSLA_Reb_Vehicle_Attributes.sqf"

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

private _initialRebelEquipment = [
    "CUP_sgun_slamfire", "CSLA_OP54",
    "CUP_1Rnd_12Gauge_Pellets_No00_Buck", "CUP_1Rnd_12Gauge_Pellets_No3_Buck", "CSLA_OP54_5rnd_7_62Odst59",
    "CSLA_Pi82", "CSLA_Pi82_12rnd_9Pi82",
    ["CUP_launch_RPG18", 50],
    ["IEDUrbanSmall_Remote_Mag", 10], ["IEDLandSmall_Remote_Mag", 10], ["IEDUrbanBig_Remote_Mag", 3], ["IEDLandBig_Remote_Mag", 3],
    "CSLA_URG86o", "SmokeShell",
    "CSLA_grUah61", "CSLA_gr60bnt", "CSLA_gr60Sa24base", "CSLA_gr60emp",
    "CSLA_bp60", "CSLA_bp85msn", "B_FieldPack_oli",
    "Binocular"
];

if (A3A_hasTFAR) then {_initialRebelEquipment append ["tf_microdagr", "tf_anprc154"]};
if (A3A_hasTFAR && startWithLongRangeRadio) then {
    _initialRebelEquipment pushBack "tf_anprc155";
    _initialRebelEquipment pushBack "tf_anprc155_coyote";
};
if (A3A_hasTFARBeta) then {_initialRebelEquipment append ["TFAR_microdagr", "TFAR_anprc154"]};
if (A3A_hasTFARBeta && startWithLongRangeRadio) then {_initialRebelEquipment append ["TFAR_anprc155", "TFAR_anprc155_coyote", "TFAR_anarc164", "a3a_TFAR_rt1523g_rhs", "a3a_TFAR_rt1523g_bwmod", "a3a_TFAR_rt1523g"]};

_initialRebelEquipment append ["Chemlight_blue","Chemlight_green","Chemlight_red","Chemlight_yellow"];

["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;

private _rebUniforms = [
    "FIA_uniwld1",
    "FIA_uniwld10",
    "FIA_uniwld2",
    "FIA_uniwld3",
    "FIA_uniwld4",
    "FIA_uniwld5",
    "FIA_uniwld6",
    "FIA_uniwld7",
    "FIA_uniwld9",
    "U_BG_Guerilla1_1",
    "U_IG_Guerilla2_1",
    "U_IG_Guerilla2_2",
    "U_IG_Guerilla2_3",
    "U_IG_Guerilla3_1",
    "U_IG_leader",
    "U_IG_Guerrilla_6_1",
    "U_I_G_resistanceLeader_F"
];          //Uniforms given to Player Rebels

private _rebUniformsAI = [
    "CUP_U_I_GUE_Anorak_01",
    "CUP_U_I_GUE_Anorak_03",
    "CUP_U_I_GUE_Anorak_02",
    "CUP_U_I_GUE_WorkU_01",
    "CUP_U_I_GUE_WorkU_02",
    "CUP_U_I_GUE_Flecktarn2",
    "CUP_U_I_GUE_Flecktarn3",
    "CUP_U_I_GUE_Flecktarn",
    "CUP_U_I_GUE_Flecktarn4",
    "CUP_U_I_GUE_Woodland1"
];          //Uniforms given to AI Rebels

["uniforms", _rebUniforms] call _fnc_saveToTemplate;         //These Items get added to the Arsenal

["headgear", [
    "CUP_H_C_Beanie_02",
    "CUP_H_C_Beret_03",
    "CUP_H_C_Beret_04",
    "CUP_H_C_Ushanka_01",
    "CUP_H_C_Ushanka_02",
    "CUP_H_C_Ushanka_03",
    "CUP_H_Ger_Boonie2_Flecktarn",
    "CUP_H_NAPA_Fedora",
    "H_Bandanna_camo"
    ]] call _fnc_saveToTemplate;          //Headgear used by Rebell Ai until you have Armored Headgear.

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["AfricanHead_01","AfricanHead_02","AfricanHead_03","Barklem","GreekHead_A3_05",
"GreekHead_A3_06","GreekHead_A3_07","GreekHead_A3_08","GreekHead_A3_09",
"Sturrock","WhiteHead_01","WhiteHead_02","WhiteHead_03","WhiteHead_04",
"WhiteHead_05","WhiteHead_06","WhiteHead_07","WhiteHead_08","WhiteHead_09",
"WhiteHead_10","WhiteHead_11","WhiteHead_12","WhiteHead_13","WhiteHead_14",
"WhiteHead_15","WhiteHead_16","WhiteHead_17","WhiteHead_19","WhiteHead_20",
"WhiteHead_21"]] call _fnc_saveToTemplate;
["voices", ["CUP_D_Male01_CZ_ACR","CUP_D_Male02_CZ_ACR","CUP_D_Male03_CZ_ACR","CUP_D_Male04_CZ_ACR","CUP_D_Male05_CZ_ACR"]] call _fnc_saveToTemplate;
"CUP_Names_CzechMen" call _fnc_saveNames;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["binoculars", ["Binocular"]];

_loadoutData set ["uniforms", _rebUniformsAI];
_loadoutData set ["facewear", ["None","CUP_G_Balaclava_blk","CUP_G_Balaclava_oli","CUP_G_Bandanna_aviator","CUP_G_Bandanna_beast",
"CUP_G_Bandanna_blk","CUP_G_Bandanna_khk","CUP_G_Bandanna_oli","CUP_G_Bandanna_shades","CUP_G_Shades_Black"
]];

_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

////////////////////////
//  Rebel Unit Types  //
///////////////////////.

private _squadLeaderTemplate = {
    ["uniforms"] call _fnc_setUniform;
    ["facewear"] call _fnc_setFacewear;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["binoculars"] call _fnc_addBinoculars;
};

private _riflemanTemplate = {
    ["uniforms"] call _fnc_setUniform;
    ["facewear"] call _fnc_setFacewear;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};

private _prefix = "militia";
private _unitTypes = [
    ["Petros", _squadLeaderTemplate],
    ["SquadLeader", _squadLeaderTemplate],
    ["Rifleman", _riflemanTemplate],
    ["staticCrew", _riflemanTemplate],
    ["Medic", _riflemanTemplate, [["medic", true]]],
    ["Engineer", _riflemanTemplate, [["engineer", true]]],
    ["ExplosivesExpert", _riflemanTemplate, [["explosiveSpecialist", true]]],
    ["Grenadier", _riflemanTemplate],
    ["LAT", _riflemanTemplate],
    ["AT", _riflemanTemplate],
    ["AA", _riflemanTemplate],
    ["MachineGunner", _riflemanTemplate],
    ["Marksman", _riflemanTemplate],
    ["Sniper", _riflemanTemplate],
    ["Unarmed", _riflemanTemplate]
];

[_prefix, _unitTypes, _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;