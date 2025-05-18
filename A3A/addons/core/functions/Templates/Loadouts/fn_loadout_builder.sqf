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

            //if it dosnt have any valid mags return nothing
            if (_defaultMagData isEqualTo []) then {
                continueWith [
                    [],
                    []
                ];
            };

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

// Better than selectRandom: Uses each entry from the input array once in random order until it's empty
private _fnc_selectShuffle = {
	params ["_key"];
	private _data = _loadoutDataForTemplate getOrDefault [_key, []];
	if (_data isEqualTo []) exitWith {""};
	private _buffer = _shuffleBuffers getOrDefault [_key, [], true];
	if (_buffer isEqualTo []) then { _buffer append _data };
	_buffer deleteAt floor random count _buffer;
};

/////////////////////////////////////////////////////////////////
//  Core Loadout functions - used to add items to the loadout  //
/////////////////////////////////////////////////////////////////

//Adds a helmet to the loadout, selected at random from the category in loadout data.
private _fnc_setHelmet = {
	private _helmet = call _fnc_selectShuffle;		// passes on the input parameters (_key)
	if (_helmet isEqualTo "") exitWith {};
	[_finalLoadout, _helmet] call A3A_fnc_loadout_setHelmet;
};

private _fnc_setFacewear = {
	private _facewear = call _fnc_selectShuffle;
	if (_facewear isEqualTo "") exitWith {};
	[_finalLoadout, _facewear] call A3A_fnc_loadout_setFacewear;
};

//Adds a vest to the loadout, selected at random from the category in loadout data.
private _fnc_setVest = {
	private _vest = call _fnc_selectShuffle;
	if (_vest isEqualTo "") exitWith {};
	[_finalLoadout, _vest] call A3A_fnc_loadout_setVest
};

//Adds a uniform to the loadout, selected at random from the category in loadout data.
private _fnc_setUniform = {
	private _uniform = call _fnc_selectShuffle;
	if (_uniform isEqualTo "") exitWith {};
	[_finalLoadout, _uniform] call A3A_fnc_loadout_setUniform
};

//Adds a backpack to the loadout, selected at random from the category in loadout data.
private _fnc_setBackpack = {
	private _backpack = call _fnc_selectShuffle;
	if (_backPack isEqualTo "") exitWith {};
	[_finalLoadout, _backpack] call A3A_fnc_loadout_setBackpack
};

// Magazines that can be added to the loadout for the primary weapon.
private _primaryPrimaryMags = [];
private _primarySecondaryMags = [];
//Adds a primary weapon to the loadout, selected at random from the category in loadout data.
private _fnc_setPrimary = {
	private _weapon = call _fnc_selectShuffle;
	if (_weapon isEqualTo "") exitWith {};
	private _weaponData = _weapon call _fnc_parseWeaponFormat;
	_primaryPrimaryMags = _weaponData # 1;
	_primarySecondaryMags = _weaponData # 2;
	[_finalLoadout, "PRIMARY", _weaponData # 0] call A3A_fnc_loadout_setWeapon;
};

// Magazines that can be added to the loadout for the launcher.
private _launcherPrimaryMags = [];
private _launcherSecondaryMags = [];
//Adds a launcher to the loadout, selected at random from the category in loadout data.
private _fnc_setLauncher = {
	private _weapon = call _fnc_selectShuffle;
	if (_weapon isEqualTo "") exitWith {};
	private _weaponData = _weapon call _fnc_parseWeaponFormat;
	_launcherPrimaryMags = _weaponData # 1;
	_launcherSecondaryMags = _weaponData # 2;
	[_finalLoadout, "LAUNCHER", _weaponData # 0] call A3A_fnc_loadout_setWeapon;
};

// Magazines that can be added to the loadout for the handgun weapon.
private _handgunPrimaryMags = [];
private _handgunSecondaryMags = [];
//Adds a handgun to the loadout, selected at random from the category in loadout data.
private _fnc_setHandgun = {
	private _weapon = call _fnc_selectShuffle;
	if (_weapon isEqualTo "") exitWith {};
	private _weaponData = _weapon call _fnc_parseWeaponFormat;
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

	private _item = _key call _fnc_selectShuffle;
	if (_item isEqualTo "") exitWith {};

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
	private _map = call _fnc_selectShuffle;
	if (_map isEqualTo "") exitWith {};
	_equipment pushBack ["MAP", _map];
};

//Adds a watch to the unit, select at random from the given category of loadout data.
private _fnc_addWatch = {
	private _watch = call _fnc_selectShuffle;
	if (_watch isEqualTo "") exitWith {};
	_equipment pushBack ["WATCH", _watch];
};

//Adds a compass to the unit, select at random from the given category of loadout data.
private _fnc_addCompass = {
	private _compass = call _fnc_selectShuffle;
	if (_compass isEqualTo "") exitWith {};
	_equipment pushBack ["COMPASS", _compass];
};

//Adds a radio to the unit, select at random from the given category of loadout data.
private _fnc_addRadio = {
	private _radio = call _fnc_selectShuffle;
	if (_radio isEqualTo "") exitWith {};
	_equipment pushBack ["RADIO", _radio];
};

//Adds a gps to the unit, select at random from the given category of loadout data.
private _fnc_addGPS = {
	private _gps = call _fnc_selectShuffle;
	if (_gps isEqualTo "") exitWith {};
	_equipment pushBack ["GPS", _gps];
};

//Adds a gps to the unit, select at random from the given category of loadout data.
private _fnc_addBinoculars = {
	private _binos = call _fnc_selectShuffle;
	if (_binos isEqualTo "") exitWith {};
	_equipment pushBack ["BINOCULARS", _binos];
};

//Adds a NVGs to the unit, select at random from the given category of loadout data.
private _fnc_addNVGs = {
	private _nvgs = call _fnc_selectShuffle;
	if (_nvgs isEqualTo "") exitWith {};
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
