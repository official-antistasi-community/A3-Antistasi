#include "..\SPEX\SPEX_REB_FFF.sqf"
///////////////////////////
//   Rebel Information   //
///////////////////////////

["name", "AK"] call _fnc_saveToTemplate;

["flag", "SPE_FlagCarrier_FFF"] call _fnc_saveToTemplate;
["flagTexture", "\WW2\SPE_Core_t\Data_t\Flags\flag_FFF_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_FIA"] call _fnc_saveToTemplate;

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

private _rebUniforms = [
    "U_SPE_FFI_Casual_1_trop",
    "U_SPE_FFI_Casual_2",
    "U_SPE_FFI_Casual_2_trop",
    "U_SPE_FFI_Casual_4_trop",
    "U_SPE_FFI_Casual_5",
    "U_SPE_FFI_Casual_5_trop",
    "U_SPE_FFI_Casual_7_trop",
    "U_SPE_FFI_Jacket_bruin",
    "U_SPE_FFI_Jacket_bruin_swetr",
    "U_SPE_FFI_Jacket_grijs",
    "U_SPE_FFI_Jacket_grijs_swetr",
    "U_SPE_FFI_Jacket_zwart_Alt",
    "U_SPE_FFI_Worker_2_trop",
    "U_SPE_FFI_Worker_3_trop",
    "U_SPE_FFI_Worker_4"
];          //Uniforms given to Normal Rebels

["uniforms", _rebUniforms] call _fnc_saveToTemplate;         //These Items get added to the Arsenal

["headgear", [
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

["faces", ["LivonianHead_6","SPE_Arnold","SPE_Connors","SPE_Davidson","SPE_Elliot","SPE_Oberst","SPE_Seppmeyer","SPE_Walter","WhiteHead_01","WhiteHead_02","WhiteHead_05","WhiteHead_06","WhiteHead_07","WhiteHead_08","WhiteHead_12","WhiteHead_15","WhiteHead_18"]] call _fnc_saveToTemplate;
["voices", ["spe_male01fre", "spe_male02fre"]] call _fnc_saveToTemplate;
"SPE_FrenchMen" call _fnc_saveNames;

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