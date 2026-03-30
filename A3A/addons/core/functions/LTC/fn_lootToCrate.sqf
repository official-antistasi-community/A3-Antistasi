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

private _titleStr = localize "STR_A3A_fn_ltc_title";

[_titleStr, localize "STR_A3A_fn_ltc_ltc_looting"] call A3A_fnc_customHint;

//break undercover
player setCaptive false;

 //block postmortem on surrender crates
_container setVariable ["stopPostmortem", true, true];

private "_unlocked";
if (LTCLootUnlocked) then {
    _unlocked = [];
} else {
    _unlocked = (unlockedHeadgear + unlockedVests + unlockedNVGs + unlockedOptics + unlockedItems + unlockedWeapons + unlockedBackpacks + unlockedMagazines);
    _unlocked = _unlocked createHashMapFromArray [];
};


//----------------------------//
//Loot Bodies
//----------------------------//
_lootBodies = {
    params ["_unit", "_container"];

    private _gear = [[],[],[],[]];//weapons, mags, items, backpacks
    //build list of all gear

    _weapons = weapons _unit;
    {(_gear#0) pushBack (_x call BIS_fnc_baseWeapon)} forEach _weapons;

    _attachments = primaryWeaponItems _unit + secondaryWeaponItems _unit + handgunItems _unit - [""];
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
        (_gear#3) pushBack ((backpack _unit) call A3A_fnc_basicBackpack);
        removeBackpackGlobal _unit;
    };

    //to ensure proper cleanup
    private _uniform = uniform _unit;
    _unit setUnitLoadout (configFile >> "EmptyLoadout");
    _unit forceAddUniform _uniform;

    //try to add items to container
    {
        if ((_container canAdd _x) and !(_x in _unlocked)) then {
            _container addWeaponCargoGlobal [_x,1];
        } else {(_leftovers#0) pushBack [_x, 1]};
    } forEach (_gear#0);

    {
        _x params ["_magType", "_ammoCount"];
        if ((_container canAdd _magType) and !(_magType in _unlocked)) then {
            _container addMagazineAmmoCargo [_magType, 1, _ammoCount];
        } else {(_leftovers#1) pushBack [_magType, 1, _ammoCount, 0]};                 // format compatible with lootFromContainer output        
    } forEach (_gear#1);

    {
        if ((_container canAdd _x) and !(_x in _unlocked)) then {
            _container addItemCargoGlobal [_x,1];
        } else {(_leftovers#2) pushBack [_x,1]};
    } forEach (_gear#2);

    {
        if ((_container canAdd _x) and !(_x in _unlocked)) then {
            _container addBackpackCargoGlobal [_x,1];
        } else {(_leftovers#3) pushBack [_x,1]};
    } forEach (_gear#3);
};


private _leftovers = [[],[],[],[]];

private _units = nearestObjects [getposATL _container, ["Man"], LootToCrateRadius];
_units = _units select {!alive _x};
{[_x, _container, _leftovers] call _lootBodies} forEach _units;


//----------------------------//
//pickup weapons on the ground
//----------------------------//

private _weaponHolders = nearestObjects [getposATL _container, ["WeaponHolder","WeaponHolderSimulated"], LootToCrateRadius];

{
    private _return = [_x, _container] call A3A_fnc_lootFromContainer;
    deleteVehicle _x;

    // Merge leftovers
    {
        (_leftovers#_forEachIndex) append _x;
    } forEach (_return#0);

} forEach _weaponHolders;


//--------------------------------------------//
//create weapon holder under box for leftovers
//--------------------------------------------//

private _allUnlocked = true;
if !(_leftovers isEqualTo [[],[],[],[]]) then {

    private _pos = (getPosATL _container) getPos [1, random 360];
    private _newContainer = "GroundWeaponHolder" createVehicle _pos;

    _leftovers params ["_weaponsArray", "_magsArray", "_itemsArray", "_backpacksArray"];

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

    _newContainer setPosATL _pos;
    [_newContainer, _allUnlocked] remoteExec ["A3A_fnc_postmortem", 2];        // If all unlocked, priority clean up
};

if (_allUnlocked) then {
    [_titleStr, localize "STR_A3A_fn_ltc_ltc_transfered"] call A3A_fnc_customHint;
} else {
    [_titleStr, localize "STR_A3A_fn_ltc_ltc_notrans"] call A3A_fnc_customHint;
};

[_container, clientOwner, true] remoteExecCall ["A3A_fnc_canLoot", 2];
