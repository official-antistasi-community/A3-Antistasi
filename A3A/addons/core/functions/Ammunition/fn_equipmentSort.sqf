#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
////////////////////////////////////
//      Backpacks Sorting        ///
////////////////////////////////////
{
	private _itemFaction = getText (configfile >> "CfgVehicles" >> _x >> "faction");
	switch (_itemFaction) do {
		case "Default": {allBackpacksEmpty pushBack _x};
		default {allBackpacksTool pushBack _x};
	};
} forEach allBackpacks;

allBackpacksEmpty deleteAt (allBackpacksEmpty find "B_AssaultPack_Kerry");

{
	switch (true) do {
		case ((getText (configfile >> "CfgVehicles" >> _x >> "assembleInfo" >> "assembleTo")) != ""): {
			if !((getArray (configfile >> "CfgVehicles" >> _x >> "assembleInfo" >> "base")) isEqualTo []) then {
				allBackpacksStatic pushBack _x;
			}
			else {
				allBackpacksDevice pushback _x;
			};
		};
		case ((getText (configfile >> "CfgVehicles" >> _x >> "assembleInfo" >> "assembleTo")) == ""): {
			if ((getText (configfile >> "CfgVehicles" >> _x >> "assembleInfo" >> "base")) == "") then {
				allBackpacksStatic pushBack _x;
			};
		};
	};
} forEach allBackpacksTool;

{
	private _faction = getText (configfile >> "CfgVehicles" >> _x >> "faction");
	private _side = getNumber (configfile >> "CfgFactionClasses" >> _faction >> "side");
	switch (_side) do {
		case 0: {invaderBackpackDevice pushBack _x};
		case 1: {occupantBackpackDevice pushBack _x};
		case 2: {rebelBackpackDevice pushBack _x};
		case 3: {civilianBackpackDevice pushBack _x};
	};
} forEach allBackpacksDevice;

////////////////////////////////////
//   ARMORED VESTS LIST          ///
////////////////////////////////////
//WHY is there no clean list?
//allArmoredVests = allVests select {getNumber (configfile >> "CfgWeapons" >> _x >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Chest" >> "armor") > 5};
allCivilianVests = allVests - allArmoredVests;

allCivilianVests deleteAt (allCivilianVests find "V_RebreatherB");
allCivilianVests deleteAt (allCivilianVests find "V_RebreatherIR");
allCivilianVests deleteAt (allCivilianVests find "V_RebreatherIA");
allCivilianVests deleteAt (allCivilianVests find "vn_b_vest_seal_01");

////////////////////////////////////
//   ARMORED HELMETS LIST        ///
////////////////////////////////////
//WHY is there no clean list?
//allArmoredHeadgear = allHeadgear select {getNumber (configfile >> "CfgWeapons" >> _x >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Head" >> "armor") > 0};
allCosmeticHeadgear = allHeadgear - allArmoredHeadgear;

private _costmeticHeadgearBlacklist = [
	"H_Cap_Black_IDAP_F",
	"H_Cap_Orange_IDAP_F",
	"H_Cap_White_IDAP_F"
];

if ((isClass (configFile >> "CfgPatches" >> "IFA3_Core")) or (isClass (configFile >> "CfgPatches" >> "ww2_spe_assets_c_characters_germans_c"))) then {
	_costmeticHeadgearBlacklist append [
		//SPE
		"H_SPE_Milice_beret_1",
		"H_SPE_Milice_beret_2"
	];
	{
		private _hatClass = _x; 
		{
			if (_x in _hatClass) then {
				_costmeticHeadgearBlacklist pushBackUnique _hatClass;
			};
		} forEach ["_DAK_", "_GER_", "_US_", "_NKVD_", "_SOV_", "_UK_", "_CW_", "_CAN_", "_PL_HSAT_"]; //HSAT has no armour for some reason
		
	} forEach allCosmeticHeadgear;
	//Doing IFA and SPE at the same time because of the keyword overlap between the two
};

if (isClass (configFile >> "CfgPatches" >> "rhsgref_main")) then {
	_costmeticHeadgearBlacklist append [
		"rhs_fieldcap_helm",
		"rhs_fieldcap_helm_ml",
		"rhs_fieldcap_helm_digi"
	];
};

{allCosmeticHeadgear deleteAt (allCosmeticHeadgear find _x)} forEach _costmeticHeadgearBlacklist;


//////////////////
//   Glasses   ///
//////////////////
allCosmeticGlasses append allGlasses;

allCosmeticGlasses deleteAt (allCosmeticGlasses find "None");
allCosmeticGlasses deleteAt (allCosmeticGlasses find "G_Goggles_VR");
allCosmeticGlasses deleteAt (allCosmeticGlasses find "G_I_Diving");
allCosmeticGlasses deleteAt (allCosmeticGlasses find "G_O_Diving");
allCosmeticGlasses deleteAt (allCosmeticGlasses find "G_B_Diving");
allCosmeticGlasses deleteAt (allCosmeticGlasses find "LIB_Glasses");
allCosmeticGlasses deleteAt (allCosmeticGlasses find "vn_b_acc_seal_01");
allCosmeticGlasses deleteAt (allCosmeticGlasses find "UK3CB_G_Balaclava2_MEE");
allCosmeticGlasses deleteAt (allCosmeticGlasses find "UK3CB_G_Balaclava_Neck_Shemag_MEE");

////////////////
//   Radios   //
////////////////
If (A3A_hasTFAR || A3A_hasTFARBeta) then {
	private _allRadioItems = allRadios;
	private _encryptRebel = A3A_faction_reb getOrDefault ["attributeTFARCodes", ["tf_guer_radio_code", "tf_independent_radio_code"]];
    // tf_independent_radio_code may not exist. More investigation needed.
	allRadios = _allRadioItems select { getText (configFile >> "CfgWeapons" >> _x >> "tf_encryptionCode") in _encryptRebel };
	if (count allRadios == 0) then {
		Error("No TFAR radios with matching encryption codes found. Recommendation is to remove TFAR from the mod-set, and use the vanilla radio channel system.");
	};

	private _backpacksToDelete = [];
	{
		private _encrypt = getText (configFile >> "CfgVehicles" >> _x >> "tf_encryptionCode");
		if (_encrypt != "") then { _backpacksToDelete pushBack _x };
		if (_encrypt in _encryptRebel) then { allBackpacksRadio pushBack _x };
	} forEach allBackpacksEmpty;
	allBackpacksEmpty = allBackpacksEmpty - _backpacksToDelete;
};

/////////////////
// UAVTerminal //
/////////////////
private _encryptRebel = if (teamPlayer == west) then { 1 } else { 2 };
allUAVTerminals = allUAVTerminals select {
    private _encrypt = getNumber  (configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "side");
    (_encrypt isEqualTo "") or (_encrypt isEqualTo _encryptRebel);
};

//Remove Prop Food
allMagBullet = allMagBullet select { getText (configFile >> "CfgMagazines" >> _x >> "ammo") isNotEqualTo "FakeAmmo"; };

//Remove False NVGs
allNVGs = allNVGs select { getarray (configFile >> "CfgWeapons" >> _x >> "visionMode") isnotequalto ["Normal","Normal"]};

private _removableDefaultItems = [
	[allFirstAidKits,"FirstAidKit","firstAidKits"],
	[allMedikits,"Medikit","mediKits"],
	[AllToolkits,"ToolKit","toolKits"],
	[allMaps,"ItemMap","itemMaps"]
];
{
	_x params ["_itemCategoryArray","_vanillaItem","_templateVariable"];
	private _allowedItems = A3A_faction_reb get _templateVariable;
	if !(_vanillaItem in _allowedItems) then {
		_itemCategoryArray deleteAt (_itemCategoryArray find _vanillaItem);
	};
} forEach _removableDefaultItems;

