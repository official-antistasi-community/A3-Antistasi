///////////////////////////
//   Rebel Information   //
///////////////////////////

["name", "VC"] call _fnc_saveToTemplate;

["flag", "uns_FlagCarrierVC"] call _fnc_saveToTemplate;
["flagTexture", "\uns_flags\flag_vc_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "Faction_UNS_VC"] call _fnc_saveToTemplate;

["vehiclesBasic", ["uns_m274"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["uns_Type55"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["uns_Type55_LMG"]] call _fnc_saveToTemplate;
["vehiclesTruck",["uns_nvatruck_open"]] call _fnc_saveToTemplate;
["vehiclesAT", ["uns_Type55_RR57"]] call _fnc_saveToTemplate;
["vehiclesAA", ["uns_nvatruck_zpu"]] call _fnc_saveToTemplate;

["vehiclesBoat", ["UNS_VC_Sampan_Transport"]] call _fnc_saveToTemplate;

["vehiclesPlane", ["uns_an2"]] call _fnc_saveToTemplate;

["vehiclesCivCar", ["uns_willys"]] call _fnc_saveToTemplate;
["vehiclesCivTruck", ["uns_zil157"]] call _fnc_saveToTemplate;
["vehiclesCivHeli", []] call _fnc_saveToTemplate;
["vehiclesCivBoat", ["UNS_skiff2_C"]] call _fnc_saveToTemplate;

["staticMGs", ["uns_pk_high_VC"]] call _fnc_saveToTemplate;
["staticAT", ["uns_Type36_57mm_VC"]] call _fnc_saveToTemplate;
["staticAA", ["uns_ZPU2_VC"]] call _fnc_saveToTemplate;
["staticMortars", ["uns_m1941_82mm_mortarVC"]] call _fnc_saveToTemplate;
["staticMortarMagHE", "uns_8Rnd_82mmHE_M1941"] call _fnc_saveToTemplate;
["staticMortarMagSmoke", "uns_8Rnd_82mmSMOKE_M1941"] call _fnc_saveToTemplate;
["staticMortarMagFlare", "uns_8Rnd_82mmILLUM_M1941"] call _fnc_saveToTemplate;

["mineAT", "uns_mine_AT_mag"] call _fnc_saveToTemplate;
["mineAPERS", "uns_mine_AP_mag"] call _fnc_saveToTemplate;

["breachingExplosivesAPC", [["uns_M118_mag_remote", 1],["PipeBomb", 1]]] call _fnc_saveToTemplate;
["breachingExplosivesTank", [["PipeBomb", 2],["uns_M118_mag_remote", 2],["uns_mine_TM_mag", 1]]] call _fnc_saveToTemplate;

#include "UNS_Reb_Vehicle_Attributes.sqf"

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

private _initialRebelEquipment = [
"uns_baikal", "uns_mosin", "uns_kar98k", "uns_mas36", "uns_type99", "uns_nagant_m1895", "uns_m127a1_flare", "uns_1Rnd_M127_mag",
["uns_rpg2", 10], ["uns_rpg2grenade", 30],
["IEDUrbanSmall_Remote_Mag", 10], ["IEDLandSmall_Remote_Mag", 10], ["IEDUrbanBig_Remote_Mag", 3], ["IEDLandBig_Remote_Mag", 3],
"uns_12gaugemag_2", "uns_mosinmag", "uns_kar98kmag", "uns_mas36mag", "uns_type99mag", "uns_nagant_m1895mag", "uns_f1gren", "uns_molotov_mag", "uns_rdg2",
"uns_men_NVA_65_AS3_Bag", "uns_simc_ARVN_ruck_1", "uns_simc_ARVN_ruck_2", "UNS_VC_R1",
"uns_vc_chestrig", "UNS_VC_A2",
"Binocular"];

if (A3A_hasTFAR) then {_initialRebelEquipment append ["tf_microdagr", "UNS_ItemRadio_PRC_90_TFAR"]};
if (A3A_hasTFAR && startWithLongRangeRadio) then {_initialRebelEquipment pushBack "UNS_USMC_RTO"};
if (A3A_hasTFARBeta) then {_initialRebelEquipment append ["TFAR_microdagr", "UNS_ItemRadio_PRC_90_TFAR"]};
if (A3A_hasTFARBeta && startWithLongRangeRadio) then {_initialRebelEquipment pushBack "UNS_USMC_RTO"};
["attributeTFARCodes", ["tf_west_radio_code"]] call _fnc_saveToTemplate;

_initialRebelEquipment append ["Chemlight_blue","Chemlight_green","Chemlight_red","Chemlight_yellow"];

["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;

private _rebUniforms = [
    "UNS_VC_U",
    "UNS_VC_S",
    "UNS_VC_K",
    "UNS_VC_B",
    "UNS_VC_G",
    "uns_U_Simc_vc_black_1",
    "uns_U_Simc_vc_black_1_trop",
    "uns_U_Simc_vc_black_2",
    "uns_U_Simc_vc_black_2_trop",
    "uns_U_Simc_vc_blau_1_trop",
    "uns_U_Simc_vc_blau_2",
    "uns_U_Simc_vc_blau_2_trop",
    "uns_U_Simc_vc_blau_1",
    "uns_U_Simc_vc_grun_1",
    "uns_U_Simc_vc_grun_1_trop",
    "uns_U_Simc_vc_grun_2",
    "uns_U_Simc_vc_grun_2_trop"
];

["uniforms", _rebUniforms] call _fnc_saveToTemplate;

["headgear", [
    "UNS_Boonie_VC",
    "UNS_Headband_VC",
    "UNS_Conehat_VC",
    "uns_vc_headband_blue",
    "UNS_Boonie2_VC",
    "UNS_Boonie3_VC",
    "UNS_Boonie4_VC",
    "uns_sas_booniehat_vc_tan",
    "uns_sas_booniehat_vc",
    "uns_H_Simc_nasi"
]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["voices", ["Male01CHI", "Male02CHI", "Male03CHI"]] call _fnc_saveToTemplate;
["faces", ["AsianHead_A3_01", "AsianHead_A3_01_cfaces_vccamo01", "AsianHead_A3_01_cfaces_vccamo02", "AsianHead_A3_02",
"AsianHead_A3_03", "AsianHead_A3_03_cfaces_vccamo01", "AsianHead_A3_03_cfaces_vccamo02",
"AsianHead_A3_04", "AsianHead_A3_04_cfaces_vccamo01", "AsianHead_A3_05", "AsianHead_A3_05_cfaces_vccamo02",
"AsianHead_A3_06", "AsianHead_A3_07", "AsianHead_A3_07_cfaces_vccamo01", "AsianHead_A3_07_cfaces_vccamo02"]] call _fnc_saveToTemplate;

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
