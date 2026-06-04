#include "..\SPEX\SPEX_REB_FFF.sqf"
///////////////////////////
//   Rebel Information   //
///////////////////////////

["name", "AK"] call _fnc_saveToTemplate;

["flag", "SPE_FlagCarrier_FFF"] call _fnc_saveToTemplate;
["flagTexture", "\x\A3A\addons\core\Pictures\Flags\ifa_ak.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "a3a_flag_AK"] call _fnc_saveToTemplate;

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

private _rebUniforms = [
    "SEP_I_AK_U_FieldUniform_Sumpf",
    "SEP_I_AK_U_FieldUniform_Sumpf",
    "SEP_I_AK_U_Casual_1",
    "SEP_I_AK_U_Casual_Rolled_1",
    "SEP_I_AK_U_Casual_2",
    "SEP_I_AK_U_Casual_Rolled_2",
    "SEP_I_AK_U_Casual_3",
    "SEP_I_AK_U_Casual_Rolled_3",
    "SEP_I_AK_U_Casual_4",
    "SEP_I_AK_U_Casual_Rolled_4",
    "SEP_I_AK_U_Casual_5",
    "SEP_I_AK_U_Casual_Rolled_5",
    "SEP_I_AK_U_Casual_6",
    "SEP_I_AK_U_Casual_Rolled_6",
    "SEP_I_AK_U_Casual_7",
    "SEP_I_AK_U_Casual_Rolled_7",
    "SEP_I_AK_U_Jacket_zwart",
    "SEP_I_AK_U_Jacket_zwart_alt",
    "SEP_I_AK_U_Jacket_zwart_swetr",
    "SEP_I_AK_U_Jacket_bruin",
    "SEP_I_AK_U_Jacket_bruin_swetr",
    "SEP_I_AK_U_Jacket_grijs",
    "SEP_I_AK_U_Jacket_grijs_swetr",
    "SEP_I_AK_U_Swetr_vest_1",
    "SEP_I_AK_U_Swetr_vest_2",
    "SEP_I_AK_U_Swetr_vest_3",
    "SEP_I_AK_U_Swetr_vest_4",
    "SEP_I_AK_U_Swetr_vest_5",
    "SEP_I_AK_U_Worker_Coverall_1",
    "SEP_I_AK_U_Worker_Coverall_Rolled_1",
    "SEP_I_AK_U_Worker_Coverall_2",
    "SEP_I_AK_U_Worker_Coverall_Rolled_2",
    "SEP_I_AK_U_Worker_1",
    "SEP_I_AK_U_Worker_Rolled_1",
    "SEP_I_AK_U_Worker_2",
    "SEP_I_AK_U_Worker_Rolled_2",
    "SEP_I_AK_U_Worker_3",
    "SEP_I_AK_U_Worker_Rolled_3",
    "SEP_I_AK_U_Worker_4",
    "SEP_I_AK_U_Worker_Rolled_4"
];          //Uniforms given to Normal Rebels

["uniforms", _rebUniforms] call _fnc_saveToTemplate;         //These Items get added to the Arsenal

["headgear", [
    "SEP_I_AK_H_Stahlhelm_Flg",
    "H_SPEX_PL_SIDECAP",
    "H_SPEX_PL_SIDECAP",
    "H_SPEX_PL_beret_Piech",
    "H_SPE_CIV_Fedora_Cap_1",
    "H_SPE_CIV_Fedora_Cap_2",
    "H_SPE_CIV_Fedora_Cap_3",
    "H_SPE_CIV_Fedora_Cap_4",
    "H_SPE_CIV_Fedora_Cap_5",
    "H_SPE_CIV_Fedora_Cap_6",
    "H_SPE_CIV_Worker_Cap_1",
    "H_SPE_CIV_Worker_Cap_2",
    "H_SPE_CIV_Worker_Cap_3",
    "H_SPE_CIV_Worker_Cap_1",
    "H_SPE_CIV_Worker_Cap_2",
    "H_SPE_CIV_Worker_Cap_3"
]] call _fnc_saveToTemplate;          //Headgear used by Rebell Ai until you have Armored Headgear.

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["LivonianHead_1","LivonianHead_10","LivonianHead_2","LivonianHead_3","LivonianHead_4","LivonianHead_6","LivonianHead_9","Sturrock","WhiteHead_01","WhiteHead_02","WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07","WhiteHead_08","WhiteHead_09","WhiteHead_10","WhiteHead_11","WhiteHead_13","WhiteHead_14","WhiteHead_15","WhiteHead_17","WhiteHead_18","WhiteHead_20","WhiteHead_21","WhiteHead_30"]] call _fnc_saveToTemplate;
["voices", ["Male01pol","Male02pol","Male03pol"]] call _fnc_saveToTemplate;
"EnochMen" call _fnc_saveNames;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["SPE_US_ItemWatch","SPE_GER_ItemWatch"]];
_loadoutData set ["compasses", ["SPE_US_ItemCompass","SPE_GER_ItemCompass"]];
_loadoutData set ["binoculars", ["SPE_Binocular_GER"]];

_loadoutData set ["uniforms", _rebUniforms];
_loadoutData set ["facewear", ["G_SPE_Cigar_Moza", "G_SPE_Cigarette_Grundstein", "G_SPE_Dienst_Brille", "G_SPE_Sunglasses_GER_Brown"]];

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

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["binoculars"] call _fnc_addBinoculars;
};

private _riflemanTemplate = {
    ["uniforms"] call _fnc_setUniform;
    ["facewear"] call _fnc_setFacewear;

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