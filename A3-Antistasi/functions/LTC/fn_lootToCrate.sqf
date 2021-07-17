/*
    Author: [Håkon]
    [Description]
        Attempts to transfer loot from nearby bodies and ground to the specified container, what is unable to be transfered
        will be left on the ground next to its origin.

    Arguments:
    0. <Object> The container to try to transfere loot to

    Return Value:
    <nil>

    Scope: Any
    Environment: unscheduled
    Public: [No]
    Dependencies:

    Example: [_crate] remoteExec ["A3A_fnc_lootToCrate", _owner];

    License: MIT License
*/
params ["_container"];
scopeName "Main";

[localize "STR_antistasi_customHint_loot", localize "STR_antistasi_customHint_looting"] call A3A_fnc_customHint;

//break undercover
player setCaptive false;

private "_unlocked";
if (LTCLootUnlocked) then {
    _unlocked = [];
} else {
    _unlocked = (unlockedHeadgear + unlockedVests + unlockedNVGs + unlockedOptics + unlockedItems + unlockedWeapons + unlockedBackpacks + unlockedMagazines);
};

_targets = nearestObjects [getposATL _container, ["Man"], 10];
_weaponHolders = nearestObjects [getposATL _container, ["WeaponHolder","WeaponHolderSimulated"], 10];

_container setVariable ["stopPostmortem", true, true]; //block postmortem on surrender crates

//----------------------------//
//Loot Bodies
//----------------------------//
_lootBodies = {
    params ["_unit", "_container"];

    private _gear = [[],[],[],[]];//weapons, mags, items, backpacks
    //build list of all gear
    _weapons = [handgunWeapon _unit];
    _attachments = handgunItems _unit;

    _weapons = _weapons select {!(_x isEqualTo "")};
    {(_gear#0) pushBack (_x call BIS_fnc_baseWeapon)} forEach _weapons;
    _attachments = _attachments select {!(_x isEqualTo "")};
    (_gear#2) append _attachments;

    (_gear#2) append assignedItems _unit;
    removeAllAssignedItems _unit;

    _mags = [];
    {
        _x params ["_type", "_count"];
        _mags pushBack [_type, _count];
    } forEach (magazinesAmmoFull _unit);
    (_gear#1) append _mags;
    clearMagazineCargoGlobal _unit;

    (_gear#2) append (items _unit);
    clearItemCargoGlobal _unit;

    if !(vest _unit isEqualTo "") then {
        (_gear#2) pushBack (vest _unit);
        removeVest _unit;
    };

    if !(headgear _unit isEqualTo "") then {
        (_gear#2) pushBack (headgear _unit);
        removeHeadgear _unit;
    };

    if !(goggles _unit isEqualTo "") then {
        (_gear#2) pushBack (goggles _unit);
        removeGoggles _unit;
    };

    if !(backpack _unit isEqualTo "") then {
        (_gear#3) pushBack ((backpack _unit) call BIS_fnc_basicBackpack);
        removeBackpackGlobal _unit;
    };

    //to ensure proper cleanup
    private _uniform = uniform _unit;
    _unit setUnitLoadout (configFile >> "EmptyLoadout");
    _unit forceAddUniform _uniform;

    //try to add items to container
    _remaining = [[],[],[],[]];
    {
        if ((_container canAdd _x) and !(_x in _unlocked)) then {
            _container addWeaponCargoGlobal [_x,1];
        } else {(_remaining#0) pushBack _x};
    } forEach (_gear#0);

    {
        _x params ["_magType", "_ammoCount"];
        if ((_container canAdd _magType) and !(_magType in _unlocked)) then {
            _container addMagazineAmmoCargo [_magType, 1, _ammoCount];
        } else {(_remaining#1) pushBack _x};
    } forEach (_gear#1);

    {
        if ((_container canAdd _x) and !(_x in _unlocked)) then {
            _container addItemCargoGlobal [_x,1];
        } else {(_remaining#2) pushBack _x};
    } forEach (_gear#2);

    {
        if ((_container canAdd _x) and !(_x in _unlocked)) then {
            _container addBackpackCargoGlobal [_x,1];
        } else {(_remaining#3) pushBack _x};
    } forEach (_gear#3);

    //Deal with leftovers
    if (_remaining isEqualTo [[],[],[],[]]) exitWith {};
    _pos = getPos _unit;
    _container = "GroundWeaponHolder" createVehicle _pos;
    {
        _container addWeaponCargoGlobal [_x, 1];
    } forEach (_remaining#0);

    {
        _container addMagazineAmmoCargo [(_x#0), 1, (_x#1)];
    } forEach (_remaining#1);

    {
        _container addItemCargoGlobal [_x, 1];
    } forEach (_remaining#2);

    {
        _container addBackpackCargoGlobal [_x, 1];
    } forEach (_remaining#3);
    _container setPos _pos;
};

_targets = _targets select {!alive _x};
{[_x, _container] call _lootBodies} forEach _targets;

//----------------------------//
//pickup weapons on the ground
//----------------------------//

_allUnlockedArray = [];
{
    _pos = getPosATL _x;
    _return = [_x, _container] call A3A_fnc_lootFromContainer;
    _return params ["_remainder", "_allUnlocked"];
    _allUnlockedArray pushBack _allUnlocked;

    if !(_remainder isEqualTo [[],[],[],[]]) then {

        _newContainer = "GroundWeaponHolder" createVehicle _pos;

        _remainder params ["_weaponsArray", "_magsArray", "_itemsArray", "_backpacksArray"];

        {
            _x params ["_type", "_count"];
            if !(_type in _unlocked) then {_allUnlocked = false};
            _newContainer addWeaponCargoGlobal [_type, _count];
        } forEach _weaponsArray;

        {
            _x params ["_type", "_count", "_max", "_remainder"];
            if !(_type in _unlocked) then {_allUnlocked = false};
            _newContainer addMagazineAmmoCargo [_type, _count, _max];
            if !(_remainder isEqualTo 0) then {
                _newContainer addMagazineAmmoCargo [_type, 1, _remainder];
            };
        } forEach _magsArray;

        {
            _x params ["_type", "_count"];
            if !(_type in _unlocked) then {_allUnlocked = false};
            _newContainer addItemCargoGlobal [_type, _count];
        } forEach _itemsArray;

        {
            _x params ["_type", "_count"];
            if !(_type in _unlocked) then {_allUnlocked = false};
            _newContainer addBackpackCargoGlobal [_type, _count];
        } forEach _backpacksArray;

        _allUnlockedArray pushBack _allUnlocked;
        _newContainer setPosATL _pos;
    };
} forEach _weaponHolders;

if ((_allUnlockedArray findIf {!_x} isEqualTo -1)) then {
    [localize "STR_antistasi_customHint_loot", localize "STR_antistasi_customHint_loot_nearby"] call A3A_fnc_customHint;
} else {
    [localize "STR_antistasi_customHint_loot", localize "STR_antistasi_customHint_loot_unable"] call A3A_fnc_customHint;
};

[_container, clientOwner, true] remoteExecCall ["A3A_fnc_canLoot", 2];
