///////////////////////////
//   Rebel Information   //
///////////////////////////

["name", "POF"] call _fnc_saveToTemplate;

["flag", "vn_flag_lao_dmg"] call _fnc_saveToTemplate;
["flagTexture", "vn\objects_f_vietnam\flags\data\vn_flag_01_lao_dmg_ca.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "vn_flag_lao"] call _fnc_saveToTemplate;

//////////////////////////
//  Mission/HQ Objects  //
//////////////////////////

// All of bellow are optional overrides.
["firstAidKits", ["vn_b_item_firstaidkit", "vn_o_item_firstaidkit"]] call _fnc_saveToTemplate;  // Relies on autodetection. However, item is tested for for help and reviving.
["mediKits", ["vn_b_item_medikit_01", "vn_o_item_medikit_01"]] call _fnc_saveToTemplate;  // Relies on autodetection. However, item is tested for for help and reviving.
["toolKits", ["vn_b_item_toolkit"]] call _fnc_saveToTemplate;  // Relies on autodetection.
["itemMaps", ["vn_b_item_map"]] call _fnc_saveToTemplate;  // Relies on autodetection.

["diveGear", ["vn_b_uniform_seal_09_01", "vn_b_acc_seal_01", "vn_b_vest_seal_01"]] call _fnc_saveToTemplate;
["flyGear", ["vn_b_uniform_heli_01_01","vn_i_pack_parachute_01"]] call _fnc_saveToTemplate;

["surrenderCrate", "vn_o_ammobox_04"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["vehiclesBasic", ["vn_c_bicycle_01", "vn_b_wheeled_m274_02_03"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["vn_i_wheeled_m151_02", "vn_b_wheeled_m274_01_02"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["vn_o_car_04_mg_01", "vn_b_wheeled_m274_mg_01_02"]] call _fnc_saveToTemplate;
["vehiclesTruck", ["vn_i_wheeled_m54_01"]] call _fnc_saveToTemplate;
["vehiclesAT", ["vn_b_wheeled_m151_mg_05", "vn_b_wheeled_m274_mg_02_02"]] call _fnc_saveToTemplate;
["vehiclesAA", ["vn_b_wheeled_m54_mg_02"]] call _fnc_saveToTemplate;

["vehiclesBoat", ["vn_o_boat_02_01"]] call _fnc_saveToTemplate;

["vehiclesPlane", ["vn_o_air_mig19_gun"]] call _fnc_saveToTemplate;

["vehiclesCivCar", ["vn_c_car_02_01", "vn_c_car_01_01","vn_c_car_03_01","vn_c_wheeled_m151_02","vn_c_wheeled_m151_01","vn_c_car_04_01"]] call _fnc_saveToTemplate;
["vehiclesCivTruck", ["vn_b_wheeled_m54_01_airport"]] call _fnc_saveToTemplate;
["vehiclesCivHeli", ["vn_b_air_uh1d_04_09"]] call _fnc_saveToTemplate;
["vehiclesCivBoat", ["vn_c_boat_08_01"]] call _fnc_saveToTemplate;

["staticMGs", ["vn_i_static_m60_high","vn_i_static_m1919a4_high","vn_o_kr_static_m1910_high_01","vn_i_static_m2_high", "vn_b_army_static_m2_scoped_high"]] call _fnc_saveToTemplate;
["staticAT", ["vn_o_vc_static_type56rr","vn_i_static_m101_01"]] call _fnc_saveToTemplate;
["staticAA", ["vn_i_static_m45","vn_o_kr_static_zgu1_01"]] call _fnc_saveToTemplate;
["staticMortars", ["vn_i_static_mortar_m2","vn_i_static_mortar_m29"]] call _fnc_saveToTemplate;
["staticMortarMagHE", "vn_mortar_m2_mag_he_x8"] call _fnc_saveToTemplate;
["staticMortarMagSmoke", "vn_mortar_m2_mag_wp_x8"] call _fnc_saveToTemplate;
["staticMortarMagFlare", "vn_mortar_m2_mag_lume_x8"] call _fnc_saveToTemplate;

["mineAT", "vn_mine_m15_mag"] call _fnc_saveToTemplate;
["mineAPERS", "vn_mine_m14_mag"] call _fnc_saveToTemplate;

["breachingExplosivesAPC", [["vn_mine_m112_remote_mag", 1]]] call _fnc_saveToTemplate;
["breachingExplosivesTank", [["vn_mine_satchel_remote_02_mag", 1], ["vn_mine_m112_remote_mag", 2]]] call _fnc_saveToTemplate;

["vehicleFuelTank", ["Land_vn_usaf_fueltank_75_01", 1000]] call _fnc_saveToTemplate;
//["vehicleFuelDrum", ["Land_vn_b_prop_fueldrum_01", 150]] call _fnc_saveToTemplate;
//["vehicleAmmoStation", ["Land_vn_wf_vehicle_service_point_east", 5000]] call _fnc_saveToTemplate;
//["vehicleHealthStation", ["Land_vn_tent_mash_01_01", 75]] call _fnc_saveToTemplate;

#include "VN_Reb_Vehicle_Attributes.sqf"

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

private _initialRebelEquipment = [
"vn_p38s", "vn_welrod",
"vn_m38",
"vn_m_mk2_knife_01", "vn_m_axe_01", "vn_b_type56", "vn_b_sks", "vn_b_m38", "vn_b_camo_m9130", "vn_b_camo_m40a1", "vn_b_camo_m14",
"vn_m127",
"vn_m10_mag", "vn_welrod_mag", "vn_m38_t_mag", "vn_m38_mag", "vn_t67_grenade_mag", "vn_rdg2_mag", "vn_molotov_grenade_mag", "vn_m127_mag", "vn_mine_punji_03_mag",
"vn_c_pack_01",
"vn_o_vest_05", "vn_b_vest_usarmy_01",
"vn_m19_binocs_grey", "vn_mx991", "vn_mx991_red"
];

_initialRebelEquipment append ["Chemlight_blue","Chemlight_green","Chemlight_red","Chemlight_yellow"];
["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;

private _rebUniforms = [
    "vn_o_uniform_vc_01_01",
    "vn_o_uniform_vc_01_02",
    "vn_o_uniform_vc_02_07",
    "vn_o_uniform_vc_03_02",
    "vn_o_uniform_vc_04_02",
    "vn_o_uniform_vc_05_01",
    "vn_o_uniform_vc_02_05",
    "vn_o_uniform_vc_04_03",
    "vn_o_uniform_vc_03_03"
];

["uniforms", _rebUniforms] call _fnc_saveToTemplate;

["headgear", [
    "vn_c_conehat_02",
    "vn_c_conehat_01",
    "vn_b_headband_05",
    "vn_b_headband_04",
    "vn_b_headband_01",
    "vn_o_boonie_vc_01_01",
    "vn_o_boonie_vc_01_02"
]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["AsianHead_A3_01", "AsianHead_A3_02", "AsianHead_A3_03", "AsianHead_A3_04", "AsianHead_A3_05", "AsianHead_A3_06", "AsianHead_A3_07"]] call _fnc_saveToTemplate;
["voices", ["vie"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["binoculars", ["Binocular"]];

_loadoutData set ["uniforms", _rebUniforms];

_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

////////////////////////
//  Rebel Unit Types  //
///////////////////////.

private _squadLeaderTemplate = {
    ["uniforms"] call _fnc_setUniform;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["binoculars"] call _fnc_addBinoculars;
};

private _riflemanTemplate = {
    ["uniforms"] call _fnc_setUniform;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

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
