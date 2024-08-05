///////////////////////////
//   Rebel Information   //
///////////////////////////

["name", "FFF"] call _fnc_saveToTemplate;

["flag", "SPE_FlagCarrier_FFF"] call _fnc_saveToTemplate;
["flagTexture", "\WW2\SPE_Core_t\Data_t\Flags\flag_FFF_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_FIA"] call _fnc_saveToTemplate;

//////////////////////////
//  Mission/HQ Objects  //
//////////////////////////

// All of bellow are optional overrides.
["firstAidKits", ["SPE_US_FirstAidKit", "SPE_GER_FirstAidKit"]] call _fnc_saveToTemplate;  // Relies on autodetection. However, item is tested for for help and reviving.
["mediKits", ["SPE_US_Medkit", "SPE_GER_Medkit"]] call _fnc_saveToTemplate;  // Relies on autodetection. However, item is tested for for help and reviving.
["toolKits", ["SPE_ToolKit"]] call _fnc_saveToTemplate;  // Relies on autodetection.

["diveGear", [""]] call _fnc_saveToTemplate;
["flyGear", [""]] call _fnc_saveToTemplate;

["surrenderCrate", "SPE_Mine_AmmoBox_US"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["vehiclesBasic", ["SPE_FFI_OpelBlitz_Open"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["LIB_Kfz1_sernyt","LIB_Kfz1_Hood_sernyt"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["SPE_US_M3_Halftrack","LIB_Kfz1_MG42_sernyt"]] call _fnc_saveToTemplate;
["vehiclesTruck", ["SPE_US_M3_Halftrack_Unarmed"]] call _fnc_saveToTemplate;
["vehiclesAT", []] call _fnc_saveToTemplate;
["vehiclesAA", ["SPE_OpelBlitz_Flak38"]] call _fnc_saveToTemplate;

["vehiclesBoat", ["I_G_Boat_Transport_01_F"]] call _fnc_saveToTemplate;
["vehiclesRepair", ["SPE_OpelBlitz_Repair"]] call _fnc_saveToTemplate;
["vehiclesPlane", ["SPE_FW190F8"]] call _fnc_saveToTemplate;
["vehiclesHeli", []] call _fnc_saveToTemplate;

["vehiclesCivCar", ["LIB_GazM1","LIB_GazM1_dirty"]] call _fnc_saveToTemplate;
["vehiclesCivTruck", ["SPE_FFI_OpelBlitz"]] call _fnc_saveToTemplate;
["vehiclesCivHeli", []] call _fnc_saveToTemplate;
["vehiclesCivBoat", ["B_Boat_Transport_01_F"]] call _fnc_saveToTemplate;
["vehiclesCivPlane", []] call _fnc_saveToTemplate;

["staticMGs", ["SPE_MG34_Lafette_Deployed"]] call _fnc_saveToTemplate;
["staticAT", ["SPE_FR_57mm_M1"]] call _fnc_saveToTemplate;
["staticAA", ["SPE_FR_M45_Quadmount"]] call _fnc_saveToTemplate;

["staticMortars", ["SPE_MLE_27_31"]] call _fnc_saveToTemplate;
["staticMortarMagHE", "SPE_8Rnd_81mm_FA_Mle_1932_HE"] call _fnc_saveToTemplate;
["staticMortarMagSmoke", "SPE_8Rnd_81mm_FA_Mle_1932_Smoke"] call _fnc_saveToTemplate;

["mineAT", "SPE_US_M1A1_ATMINE_mag"] call _fnc_saveToTemplate;
["mineAPERS", "SPE_US_M3_Pressure_MINE_mag"] call _fnc_saveToTemplate;

["breachingExplosivesAPC", [["SPE_Ladung_Small_MINE_mag", 1], ["SPE_Ladung_Big_MINE_mag", 1], ["SPE_US_TNT_half_pound_mag", 2], ["SPE_US_TNT_4pound_mag", 1]]] call _fnc_saveToTemplate;
["breachingExplosivesTank", [["SPE_Ladung_Small_MINE_mag", 3], ["SPE_Ladung_Big_MINE_mag", 1], ["SPE_US_TNT_4pound_mag", 1], ["SPE_US_TNT_half_pound_mag", 8]]] call _fnc_saveToTemplate;

["vehicleFuelDrum", ["SPE_Fuel_Barrel_US_01", 150]] call _fnc_saveToTemplate;
["vehicleFuelTank", ["", 1000]] call _fnc_saveToTemplate;
["vehicleAmmoStation", ["", 5000]] call _fnc_saveToTemplate;
["vehicleHealthStation", ["", 75]] call _fnc_saveToTemplate;
["vehicleRepairStation", ["", 5000]] call _fnc_saveToTemplate;

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

private _initialRebelEquipment = [
    "SPE_Fusil_Mle_208_12", "SPE_Fusil_Mle_208_12_Sawedoff", "SPE_K98",
    "SPE_2Rnd_12x65_Pellets", "SPE_2Rnd_12x65_Slug", "SPE_5Rnd_792x57",
    "SPE_P08", "SPE_8Rnd_9x19_P08",
    ["SPE_PzFaust_30m", 50], ["SPE_1Rnd_PzFaust_30m", 50],
    ["SPE_Ladung_Small_MINE_mag", 10], ["SPE_US_TNT_half_pound_mag", 10], ["SPE_US_TNT_4pound_mag", 3], ["SPE_Ladung_Big_MINE_mag", 3],
    "SPE_Shg24_Frag", "SPE_NB39", "SPE_US_Mk_1",
    "V_SPE_US_Vest_M1919", "V_SPE_DAK_VestKar98",
    "B_SPE_FFI_Gasbag", "B_SPE_GER_MedicBackpack_Empty",
    "SPE_Binocular_US"
];

if (A3A_hasTFAR) then {_initialRebelEquipment append ["tf_microdagr", "tf_anprc154"]};
if (A3A_hasTFAR && startWithLongRangeRadio) then {
    _initialRebelEquipment pushBack "B_SPE_GER_Radio";
    _initialRebelEquipment pushBack "tf_anprc155_coyote";
};
if (A3A_hasTFARBeta) then {_initialRebelEquipment append ["TFAR_microdagr", "TFAR_anprc154"]};
if (A3A_hasTFARBeta && startWithLongRangeRadio) then {
    _initialRebelEquipment pushBack "TFAR_anprc155";
    _initialRebelEquipment pushBack "TFAR_anprc155_coyote";
};

["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;

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
    "H_SPE_CIV_Worker_Cap_3"
]] call _fnc_saveToTemplate;          //Headgear used by Rebell Ai until you have Armored Headgear.

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["LivonianHead_6","SPE_Arnold","SPE_Connors","SPE_Davidson","SPE_Elliot","SPE_Oberst","SPE_Seppmeyer","SPE_Walter","WhiteHead_01","WhiteHead_02","WhiteHead_05","WhiteHead_06","WhiteHead_07","WhiteHead_08","WhiteHead_12","WhiteHead_15","WhiteHead_18"]] call _fnc_saveToTemplate;
["voices", ["Male01FRE","Male02FRE","Male03FRE"]] call _fnc_saveToTemplate;

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