if (!isServer) exitWith {};
#include "\A3\Ui_f\hpp\defineResinclDesign.inc"

private _updated = "";
private _item = objNull;
private _cateogry = objNull;
[boxX] call jn_fnc_arsenal_cargoToArsenal;

if (minWeaps < 0) exitWith {""};		// no unlocks

private _weapons = ((jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_PRIMARYWEAPON) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_HANDGUN) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_SECONDARYWEAPON)) select {_x select 1 != -1};
private _explosives = (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_CARGOPUT) select {_x select 1 != -1};
private _magazines = (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_CARGOTHROW) select {_x select 1 != -1};
private _backpacks = (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_BACKPACK) select {_x select 1 != -1};
private _items = ((jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_GOGGLES) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_MAP) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_GPS) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_RADIO) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_COMPASS) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_WATCH) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_ITEMACC) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_ITEMMUZZLE) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_ITEMBIPOD) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_BINOCULARS) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_CARGOMISC) + (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_UNIFORM)) select {_x select 1 != -1};
private _optics = (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_ITEMOPTIC) select {_x select 1 != -1};
private _nv = (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_NVGS) select {_x select 1 != -1};
private _helmets = (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_HEADGEAR) select {_x select 1 != -1};
private _vests = (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_VEST) select {_x select 1 != -1};

private _type = objNull;
private _magazine = [];
private _magConfig = objNull;
private _capacity = objNull;
private _bullets = objNull;
private _count = objNull;
{
	_type = _x select 0;
	_magConfig = configFile >> "CfgMagazines" >> _type;
	_capacity = 1 max getNumber (_magConfig >> "count");			// Avoid div-by-zero on broken/missing config

	// control unlocking missile launcher magazines
	// the capacity check is an optimisation to bypass the config check. ~18% perf gain on the loop.
	if (_capacity != 1 || allowGuidedLaunchers isEqualTo 1 ||
		{!(getText (_magConfig >> "ammo") isKindOf "MissileBase")}) then {
		_bullets = _x select 1;
		_count = floor (_bullets/_capacity);
		_magazine pushBack [_type,_count];
	};
} forEach _magazines;

private _allExceptNVs = _weapons + _explosives + _backpacks + _items + _optics + _helmets + _vests + _magazine;

private _categoriesToPublish = createHashMap;
{
	call {
		if (_x select 1 < minWeaps) exitWith {};
		private _item = _x select 0;

		private _categories = _item call A3A_fnc_equipmentClassToCategories;
		if ("MissileLaunchers" in _categories && {allowGuidedLaunchers == 0}) exitWith {};
		if ("Explosives" in _categories && {allowUnlockedExplosives == 0}) exitWith {};
		if ("Backpacks" in _categories && {_item in allBackpacksTool}) exitWith {};			// should be UAV & static backpacks
		if ("StaticWeaponParts" in _categories) exitWith {};

		[_item, true] call A3A_fnc_unlockEquipment;
		_categoriesToPublish insert [true, _categories, []];

		private _name = switch (true) do {
			case ("Magazines" in _categories): {getText (configFile >> "CfgMagazines" >> _item >> "displayName")};
			case ("Backpacks" in _categories): {getText (configFile >> "CfgVehicles" >> _item >> "displayName")};
			default {getText (configFile >> "CfgWeapons" >> _item >> "displayName")};
		};

		//Update the 'Updated' text with the name of the new item.
		_updated = format ["%1%2<br/>",_updated,_name];

		//Unlock ammo for guns, if appropriate.
		if (unlockedUnlimitedAmmo == 1 && ("Weapons" in _categories)) then {
			private _weaponMagazine = (getArray (configFile / "CfgWeapons" / _item / "magazines") select 0);
			if (!isNil "_weaponMagazine") then {
				if (not(_weaponMagazine in unlockedMagazines)) then {
					_updated = format ["%1%2<br/>",_updated,getText (configFile >> "CfgMagazines" >> _weaponMagazine >> "displayName")];
					private _categories = [_weaponMagazine, true] call A3A_fnc_unlockEquipment;
					_categoriesToPublish insert [true, _categories, []];
				};
			};
		};
	};
} forEach _allExceptNVs;

call A3A_fnc_checkRadiosUnlocked;
unlockedOptics = [unlockedOptics,[],{getNumber (configfile >> "CfgWeapons" >> _x >> "ItemInfo" >> "mass")},"DESCEND"] call BIS_fnc_sortBy;

//NVG Unlocking is special
//Unlock the non-thermal NVG with the highest count if the total is greater than minWeaps

private _totalNV = 0;
private _sortedNVs = [];
{
	private _amount = (_x select 1);
	private _thermal = getArray (configFile >> "CfgWeapons" >> (_x select 0) >> "thermalMode");	// only exists for ENVGs
	if (_amount > 0 && _thermal isEqualTo []) then {
		_totalNV = _totalNV + _amount;
		_sortedNVs pushBack [_amount, _x select 0];		// sort param in the first element
	};
} forEach _nv;

_sortedNVs sort true;		// sort by count, ascending

while {_totalNV >= minWeaps} do {
	private _nvToUnlock = (_sortedNVs deleteAt (count _sortedNVs - 1)) select 1;
	haveNV = true; publicVariable "haveNV";
	private _categories = [_nvToUnlock, true] call A3A_fnc_unlockEquipment;
	_categoriesToPublish insert [true, _categories, []];
	_updated = format ["%1%2<br/>",_updated,getText (configFile >> "CfgWeapons" >> _nvToUnlock >> "displayName")];
	_totalNV =_totalNV - minWeaps;		// arguably wrong but doesn't matter in practice
};

// Publish the unlocked categories (once each)
{ publicVariable ("unlocked" + _x) } forEach keys _categoriesToPublish;

_updated