/*
    Author: [Håkon]
    [Description]
        attempts to transfer loot from one container to another

    Arguments:
    0. <Object> container to transfere from
    1. <Object> container to transfere to

    Return Value:
    <Array> What items are left over and if whats left over is all unlocked

    Scope: Server,Server/HC,Clients,Any
    Environment: Scheduled/unscheduled/Any
    Public: [Yes/No]
    Dependencies:

    Example:
        [_crate] remoteExec ["A3A_fnc_lootFromContainer", _owner];
        [_weaponHolder, _crate] call A3A_fnc_lootFromContainer;

    License: MIT License
*/
params ["_target", "_override"];
scopeName "Main";
private _titleStr = localize "STR_A3A_fn_ltc_title";

private "_container";
if (isNil "_override") then {
    private _containers = (nearestObjects [_target, ["Car", "Motorcycle", "Tank", "Air"], 10]) select {alive _x};
    _container = _containers#0;
} else {
    _container = _override;
};

if (isNil "_container") exitWith {
    [_titleStr, localize "STR_A3A_fn_ltc_lfc_noveh"] call A3A_fnc_customHint;
    [_target, clientOwner, true] remoteExecCall ["A3A_fnc_canTransfer", 2];
};

//break undercover
player setCaptive false;

private "_unlocked";
if (LTCLootUnlocked) then {
    _unlocked = [];
} else {
    _unlocked = unlockedItems + unlockedWeapons + unlockedMagazines;
};

private _mainContainer = _target;
_transferCargo = {
    params ["_target", "_container"];
    private _gear = [[[],[]],[],[[],[]],[]];
    //----------------------------//
    // get Cargo
    //----------------------------//
    {
        _baseWeapon = (_x#0) call BIS_fnc_baseWeapon;
        (_gear#0#0) pushBack _baseWeapon;
        (_gear#0#1) pushBack 1;

        _attachments = _x select {(_x isEqualType "") and !(_x isEqualTo "")};
        _attachments deleteAt (_attachments find (_x#0));

        {
            (_gear#2#0) pushBack _x;
            (_gear#2#1) pushBack 1;
        } forEach _attachments;

        _mags = _x select {(_x isEqualType []) and !(_x isEqualTo [])};
        (_gear#1) append _mags;
    }forEach (weaponsItemsCargo _target);
    clearWeaponCargoGlobal _target;

    (_gear#1) append (magazinesAmmoCargo _target);
    clearMagazineCargoGlobal _target;

    private _items = getItemCargo _target;
    if !(_items isEqualTo []) then {
        (_gear#2#0) append (_items#0);
        (_gear#2#1) append (_items#1);
    };
    clearItemCargoGlobal _target;

    (_gear#3) append (getBackpackCargo _target);
    clearBackpackCargoGlobal _target;

    _gear params ["_weaponsArray", "_magsArray", "_itemsArray", "_backpacksArray"];

    //----------------------------//
    // cleanup arrays
    //----------------------------//
    private _newArray = [];
    {
        _x params ["_magType", "_ammoCount"];
        _index = _newArray findif {(_x#0) isEqualTo _magType};
        if (_index isEqualTo -1) then {
            _newArray pushBack [_magType, _ammoCount];
        } else {
            _count = _newArray#_index#1;
            _newArray set [_index, [_magType, _count+_ammoCount]];
        };
    } forEach _magsArray;
    _magsArray = _newArray;

    //----------------------------//
    // try to add to container
    //----------------------------//
    _leftover = [[],[],[],[]];



    _weaponsArray params ["_weaponTypes", "_weaponCounts"];
    for "_i" from 0 to (count _weaponTypes)-1 do {
        private _type = _weaponTypes#_i;
        private _count = _weaponCounts#_i;

        if ((_container canAdd [_type, _count]) and !(_type in _unlocked)) then {
            _container addWeaponCargoGlobal [_type, _count];
        } else {
            (_leftover#0) pushBack [_type, _count];
        };
    };

    for "_i" from 0 to (count _magsArray)-1 do {
        (_magsArray#_i) params ["_type", "_ammo"];
        private _max = getNumber (configFile >> "CfgMagazines" >> _type >> "count");
        private _count = floor (_ammo/_max);
        private _remainder = _ammo%_max;

        if (_container canAdd [_type, _count] and !(_type in _unlocked)) then {
            _container addMagazineAmmoCargo [_type, _count, _max];
            if !(_remainder isEqualTo 0) then {
                _container addMagazineAmmoCargo [_type, 1, _remainder];
            };
        } else {
            (_leftover#1) pushBack [_type, _count, _max, _remainder];
        };
    };

    _itemsArray params ["_itemsTypes", "_itemsCounts"];
    for "_i" from 0 to (count _itemsTypes)-1 do {
        private _type = _itemsTypes#_i;
        private _count = _itemsCounts#_i;

        if ((_container canAdd [_type, _count]) and !(_type in _unlocked)) then {
            _container addItemCargoGlobal [_type, _count];
        } else {
            (_leftover#2) pushBack [_type, _count];
        };
    };

    _backpacksArray params ["_backpackTypes", "_backpackCounts"];
    for "_i" from 0 to (count _backpackTypes)-1 do {
        private _type = (_backpackTypes#_i) call BIS_fnc_basicBackpack;
        private _count = _backpackCounts#_i;

        if ((_container canAdd [_type, _count]) and !(_type in _unlocked)) then {
            _container addBackpackCargoGlobal [_type, _count];
        } else {
            (_leftover#3) pushBack [_type, _count];
        };
    };

    //----------------------------//
    // deal with leftovers
    //----------------------------//

    private _allUnlocked = true;
    if (!(_leftover isEqualTo [[],[],[],[]]) and (isNil "_override")) then {
        _leftover params ["_weaponsArray", "_magsArray", "_itemsArray", "_backpacksArray"];

        {
            _x params ["_type", "_count"];
            if !(_type in _unlocked) then {_allUnlocked = false};
            _mainContainer addWeaponCargoGlobal [_type, _count];
        } forEach _weaponsArray;

        {
            _x params ["_type", "_count", "_max", "_remainder"];
            if !(_type in _unlocked) then {_allUnlocked = false};
            _mainContainer addMagazineAmmoCargo [_type, _count, _max];
            if !(_remainder isEqualTo 0) then {
                _mainContainer addMagazineAmmoCargo [_type, 1, _remainder];
            };
        } forEach _magsArray;

        {
            _x params ["_type", "_count"];
            if !(_type in _unlocked) then {_allUnlocked = false};
            _mainContainer addItemCargoGlobal [_type, _count];
        } forEach _itemsArray;

        {
            _x params ["_type", "_count"];
            if !(_type in _unlocked) then {_allUnlocked = false};
            _mainContainer addBackpackCargoGlobal [_type, _count];
        } forEach _backpacksArray;

    };
    [_leftover, _allUnlocked];
};

private _subContainers = everyContainer _target;
for "_i" from 0 to (count _subContainers)-1 do {
    private _subContainer = _subContainers#_i;
    [(_subContainer#1), _container] call _transferCargo;
};
private _return = [_target, _container] call _transferCargo;
_return params ["_leftover", "_allUnlocked"];

//----------------------------//
// Feedback
//----------------------------//

if (isNil "_override") then {
    if ((_leftover isEqualTo [[],[],[],[]]) or _allUnlocked) then {
        [_titleStr, format [localize "STR_A3A_fn_ltc_lfc_transfered", getText (configFile >> "CfgVehicles" >> typeOf _container >> "displayname")]] call A3A_fnc_customHint;
    } else {
        [_titleStr, format [localize "STR_A3A_fn_ltc_lfc_no_full", getText (configFile >> "CfgVehicles" >> typeOf _container >> "displayname")]] call A3A_fnc_customHint;
    };
    [_target, clientOwner, true] remoteExecCall ["A3A_fnc_canTransfer", 2];
};

_return;
