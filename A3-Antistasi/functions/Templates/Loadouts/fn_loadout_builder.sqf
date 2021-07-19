/*
    File: fn_loadout_build.sqf
    Author: Spoffy
    Date: 2020-11-27
    Last Update: 2020-11-27
    Public: No

    Description:
        No description added yet.

    Parameter(s):
        _template - Template to build [CODE]
		_data - Loadout data to insert [NAMESPACE]

    Returns:
        Function reached the end [BOOL]

    Example(s):
        [parameter] call vn_fnc_myFunction
*/
params ["_template", "_loadoutDataForTemplate"];

private _finalLoadout = [] call A3A_fnc_loadout_createBase;

////////////////////////////////////////////////////////////////////
//  Private functions - not to be called from the loadout builder //
////////////////////////////////////////////////////////////////////

private _fnc_magClassToEntry = {
	[_this, getNumber (configFile >> "CfgMagazines" >> _this >> "count")]
};

// Converts a weapon array that's valid in the builder to a weapon array valid in a loadout, extracting data in the process.
// Magazines can be:
// - A classname - Loads a full magazine into the weapon, uses only that magazine as an available mag.
// - A normal loadout entry - [classname, bullet count] - remains unchanged.
// - An array of classnames - Loads the first magazine into the weapon, and uses the whole array as a pool of available mags.
// - An array of arrays in format [[numberOfMags, magClass]]
//    - Loads the first magazine into the weapon, and uses the whole array as a pool of available mags.
//    - When giving magazines to the loadout, gives numberOfMags instead of only a single mag.
private _fnc_parseWeaponFormat = {
	params ["_class", ["_silencer",""], ["_pointer",""], ["_optic",""], ["_priMagInfo", []], ["_secMagInfo", []], ["_bipod",""]];

	private _magsToUse = [["pri", _priMagInfo], ["sec", _secMagInfo]] apply {
		_x params ["_muzzle", "_info"];

		// String - mag classname
		if (_info isEqualType "") then {
			private _magData = _info call _fnc_magClassToEntry;
			continueWith [
				_magData,
				[_info]
			]
		};

		// Normal loadout entry [classname, bullet count]
		if (_info isEqualType [] && {count _info == 2} && {_info select 1 isEqualType 0}) then {
			continueWith [
				_info,
				// Use only classname.
				[_info select 0]
			]
		};

		// Array of classnames, or array of arrays of type [numberOfMags, magClass]
		if (_info isEqualType [] && {count _info > 0}) then {
			private _className = if (_info select 0 isEqualType []) then {_info select 0 select 1} else {_info select 0};
			private _magData = _className call _fnc_magClassToEntry;
			continueWith [
				_magData,
				_info
			]
		};

		// Only for primary slot
		if (_muzzle == "pri") then {
			private _defaultMagData = [_class] call A3A_fnc_loadout_defaultWeaponMag;
			continueWith [
				_defaultMagData,
				[_defaultMagData select 0]
			]
		};

		[
			[],
			[]
		]
	};

	//String - Literal mag name

	[
		[_class, _silencer, _pointer, _optic, _magsToUse select 0 select 0, _magsToUse select 1 select 0, _bipod],
		// Available primary mags
		_magsToUse select 0 select 1,
		// Available secondary mags
		_magsToUse select 1 select 1
	]
};

/////////////////////////////////////////////////////////////////
//  Core Loadout functions - used to add items to the loadout  //
/////////////////////////////////////////////////////////////////

//Adds a helmet to the loadout, selected at random from the category in loadout data.
private _fnc_setHelmet = {
	params ["_key"];
	private _data = _loadoutDataForTemplate getOrDefault [_key, []];
	if (_data isEqualTo []) exitWith {};
	private _helmet = selectRandom _data;
	[_finalLoadout, _helmet] call A3A_fnc_loadout_setHelmet;
};

//Adds a vest to the loadout, selected at random from the category in loadout data.
private _fnc_setVest = {
	params ["_key"];
	private _data = _loadoutDataForTemplate getOrDefault [_key, []];
	if (_data isEqualTo []) exitWith {};
	private _vest = selectRandom _data;
	[_finalLoadout, _vest] call A3A_fnc_loadout_setVest
};

//Adds a uniform to the loadout, selected at random from the category in loadout data.
private _fnc_setUniform = {
	params ["_key"];
	private _data = _loadoutDataForTemplate getOrDefault [_key, []];
	if (_data isEqualTo []) exitWith {};
	private _uniform = selectRandom _data;
	[_finalLoadout, _uniform] call A3A_fnc_loadout_setUniform
};

//Adds a backpack to the loadout, selected at random from the category in loadout data.
private _fnc_setBackpack = {
	params ["_key"];
	private _data = _loadoutDataForTemplate getOrDefault [_key, []];
	if (_data isEqualTo []) exitWith {};
	private _backpack = selectRandom _data;
	[_finalLoadout, _backpack] call A3A_fnc_loadout_setBackpack
};

// Magazines that can be added to the loadout for the primary weapon.
private _primaryPrimaryMags = [];
private _primarySecondaryMags = [];
//Adds a primary weapon to the loadout, selected at random from the category in loadout data.
private _fnc_setPrimary = {
	params ["_key"];
	private _data = _loadoutDataForTemplate getOrDefault [_key, []];
	if (_data isEqualTo []) exitWith {};
	private _weaponData = (selectRandom _data) call _fnc_parseWeaponFormat;
	_primaryPrimaryMags = _weaponData # 1;
	_primarySecondaryMags = _weaponData # 2;
	[_finalLoadout, "PRIMARY", _weaponData # 0] call A3A_fnc_loadout_setWeapon;
};

// Magazines that can be added to the loadout for the launcher.
private _launcherPrimaryMags = [];
private _launcherSecondaryMags = [];
//Adds a launcher to the loadout, selected at random from the category in loadout data.
private _fnc_setLauncher = {
	params ["_key"];
	private _data = _loadoutDataForTemplate getOrDefault [_key, []];
	if (_data isEqualTo []) exitWith {};
	private _weaponData = (selectRandom _data) call _fnc_parseWeaponFormat;
	_launcherPrimaryMags = _weaponData # 1;
	_launcherSecondaryMags = _weaponData # 2;
	[_finalLoadout, "LAUNCHER", _weaponData # 0] call A3A_fnc_loadout_setWeapon;
};

// Magazines that can be added to the loadout for the handgun weapon.
private _handgunPrimaryMags = [];
private _handgunSecondaryMags = [];
//Adds a handgun to the loadout, selected at random from the category in loadout data.
private _fnc_setHandgun = {
	params ["_key"];
	private _data = _loadoutDataForTemplate getOrDefault [_key, []];
	if (_data isEqualTo []) exitWith {};
	private _weaponData = (selectRandom _data) call _fnc_parseWeaponFormat;
	_handgunPrimaryMags = _weaponData # 1;
	_handgunSecondaryMags = _weaponData # 2;
	[_finalLoadout, "HANDGUN", _weaponData # 0] call A3A_fnc_loadout_setWeapon;
};

//We resolve the magazine requests later, in case the loadout templates have weapons added after magazines.
private _magazineCountForSlots = createHashMap;
//Adds magazines to the loadout for the weapon in the specified slot.
private _fnc_addMagazines = {
	params ["_weaponSlot", "_quantity"];
	private _currentCount = _magazineCountForSlots getOrDefault [toLower _weaponSlot, 0];
	_magazineCountForSlots set [_weaponSlot, _currentCount + _quantity];
};

//We resolve the magazine requests later, in case the loadout templates have weapons added after magazines.
private _secondaryMagazineCountForSlots = createHashMap;
//Adds magazines to the loadout for the secondary muzzle of the weapon in given slot (E.g Underslung grenades)
private _fnc_addAdditionalMuzzleMagazines = {
	params ["_weaponSlot", "_quantity"];
	private _currentCount = _secondaryMagazineCountForSlots getOrDefault [toLower _weaponSlot, 0];
	_secondaryMagazineCountForSlots set [_weaponSlot, _currentCount + _quantity];
};

//We resolve these along with the rest of the items later, so we do it all in one call.
//Much more efficient to insert them all at once.
private _itemSets = [];
//Adds all of the items in the array available in the given category of loadout data.
//Items in that set can either be classes "myItem" or an array in unit loadout format ["myItem", 5] (adds 5 myItems)
private _fnc_addItemSet = {
	params ["_key"];
	private _data = _loadoutDataForTemplate getOrDefault [_key, []];
	if (_data isEqualTo []) exitWith {};
	_itemSets pushBack _data;
};

//Adds a random item from the given category of loadout data.
//Item can be a string class "myItem" or an array in unit loadout format ["myItem", 5]
private _fnc_addItem = {
	params ["_key", ["_amount", 1]];
	private _data = _loadoutDataForTemplate getOrDefault [_key, []];

	if (_data isEqualTo []) exitWith {};

	private _item =	selectRandom _data;
	if (_item isEqualType []) then {
		_item set [1, _amount];
		_itemSets pushBack [_item];
	} else {
		private _items = [];
		for "_i" from 1 to _amount do {
			_items pushBack _item;
		};
		_itemSets pushBack _items;
	};
};

private _equipment = [];
//Adds a map to the unit, select at random from the given category of loadout data.
private _fnc_addMap = {
	params ["_key"];
	private _data = _loadoutDataForTemplate getOrDefault [_key, []];
	if (_data isEqualTo []) exitWith {};
	private _map = selectRandom _data;
	_equipment pushBack ["MAP", _map];
};

//Adds a watch to the unit, select at random from the given category of loadout data.
private _fnc_addWatch = {
	params ["_key"];
	private _data = _loadoutDataForTemplate getOrDefault [_key, []];
	if (_data isEqualTo []) exitWith {};
	private _watch = selectRandom _data;
	_equipment pushBack ["WATCH", _watch];
};

//Adds a compass to the unit, select at random from the given category of loadout data.
private _fnc_addCompass = {
	params ["_key"];
	private _data = _loadoutDataForTemplate getOrDefault [_key, []];
	if (_data isEqualTo []) exitWith {};
	private _compass = selectRandom _data;
	_equipment pushBack ["COMPASS", _compass];
};

//Adds a radio to the unit, select at random from the given category of loadout data.
private _fnc_addRadio = {
	params ["_key"];
	private _data = _loadoutDataForTemplate getOrDefault [_key, []];
	if (_data isEqualTo []) exitWith {};
	private _radio = selectRandom _data;
	_equipment pushBack ["RADIO", _radio];
};

//Adds a gps to the unit, select at random from the given category of loadout data.
private _fnc_addGPS = {
	params ["_key"];
	private _data = _loadoutDataForTemplate getOrDefault [_key, []];
	if (_data isEqualTo []) exitWith {};
	private _gps = selectRandom _data;
	_equipment pushBack ["GPS", _gps];
};

//Adds a gps to the unit, select at random from the given category of loadout data.
private _fnc_addBinoculars = {
	params ["_key"];
	private _data = _loadoutDataForTemplate getOrDefault [_key, []];
	if (_data isEqualTo []) exitWith {};
	private _binoculars = selectRandom _data;
	_equipment pushBack ["BINOCULARS", _binoculars];
};

//Adds a NVGs to the unit, select at random from the given category of loadout data.
private _fnc_addNVGs = {
	params ["_key"];
	private _data = _loadoutDataForTemplate getOrDefault [_key, []];
	if (_data isEqualTo []) exitWith {};
	private _nvgs = selectRandom _data;
	_equipment pushBack ["NVG", _nvgs];
};

////////////////////////////////////////////////////////
//  Utility functions to help when building loadouts  //
////////////////////////////////////////////////////////

//Picks the first non-empty array.
private _fnc_fallBack = {
	private _firstValidIndex = _this findIf {!(_loadoutDataForTemplate getOrDefault [_x, []] isEqualTo [])};
	if (_firstValidIndex < 0) exitWith {_this select 0};
	_this select _firstValidIndex
};

/////////////////////////////
//  Building the loadouts  //
/////////////////////////////

//Call the template, which uses the above functions to build the loadout.

call _template;

//Now the loadout has been populated with most gear except items.
//To finish up, we need to add all the items at once (for efficiency reasons), and also equipment.

[_finalLoadout, _equipment] call A3A_fnc_loadout_addEquipment;

//Now we need to add all the items.
//Firstly - we need to resolve all the magazines we need, and add them to an item batch.
private _magazineItems = [];

private _slotMagInfo = createHashMapFromArray [
	["primary", [_finalLoadout select 0, _primaryPrimaryMags, _primarySecondaryMags]],
	["launcher", [_finalLoadout select 1, _launcherPrimaryMags, _launcherSecondaryMags]],
	["handgun", [_finalLoadout select 2, _handgunPrimaryMags, _handgunSecondaryMags]]
];

{
	private _weaponSlot = _x;
	(_slotMagInfo get toLower _weaponSlot) params ["_weaponData", "_primaryMags", "_secondaryMags"];

	if (_weaponData isEqualTo []) then { continue };

	private _primaryMagQuantity = _magazineCountForSlots getOrDefault [_weaponSlot, 0];
	private _secondaryMagQuantity = _secondaryMagazineCountForSlots getOrDefault [_weaponSlot, 0];

	// Loop through every primary mag type, check how many times it would be added given _primaryMagQuantity, then add that many mags.
	{
		_x params ["_magTypes", "_magQuantity"];
		{
			private _magEntry = _x;
			private _magType = if (_magEntry isEqualType []) then {_magEntry select 1} else {_magEntry};
			private _magCount = if (_magEntry isEqualType []) then {_magEntry select 0} else {1};
			// If we loop through the _primaryMags array _primaryMagQuantity times, this is how many times this entry would be used.
			// This is an optimisation to reduce number of iterations.
			private _entryVisitedCount = ceil ((_magQuantity - _forEachIndex) / count _magTypes);
			_magazineItems pushBack [_magType, _magCount * _entryVisitedCount, getNumber (configFile >> "CfgMagazines" >> _magType >> "count")];
		} forEach _magTypes;
	} forEach [[_primaryMags, _primaryMagQuantity], [_secondaryMags, _secondaryMagQuantity]];
} forEach ["primary", "launcher", "handgun"];

//Now magazines are resolved, we can add all the items.
//Item batches are added in order, with least important last.
//We know magazines are most important - so add them first.
//Afterwards, we add things in the order defined in the loadout - ie, the order they were added to itemSets
private _itemBatches = [_magazineItems] + _itemSets;

[_finalLoadout, _itemBatches] call A3A_fnc_loadout_addItems;

_finalLoadout
