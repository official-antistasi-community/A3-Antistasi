/*
Description:
    Server-side function to take or release ownership of builder box

Environment: Server, unscheduled
Arguments: 
    1. <object> Builder box to take control of
    2. <object> Player unit to take control
    3. <bool> True to take, false to release
    4. <number> Money remaining, only used for release
*/
#include "..\..\script_component.hpp"

params ["_box", "_player", "_take", "_money"];

private _curOwner = _box getVariable "A3A_build_owner";

if (_take) then {
    if (!isNil "_curOwner" and { alive _curOwner }) exitWith {
        Debug("Builder box already has a valid owner");
    };

    // Publish ruin->building link for nearby buildings
    private _nearBuildings = destroyedBuildings inAreaArray [getPosATL _box, 100, 100];
    {
        private _ruin = _x getVariable ["ruins", objNull];
        if (isNull _ruin) then { _ruin = _x getVariable ["BIS_fnc_createRuin_ruin", objNull] };
        if (isNull _ruin) then { continue };
        _ruin setVariable ["building", _x, owner player];
    } forEach _nearBuildings;

    private _money = _box getVariable ["A3A_itemPrice", 0];
    _box setVariable ["A3A_itemPrice", 0, true];
    _box setVariable ["A3A_build_money", _money, true];
    _box setVariable ["A3A_build_owner", _player, true];

} else {
    if (isNil "_curOwner" or { _player != _curOwner }) exitWith {
        Error("Attempted to release builder box by player who wasn't controlling it");
    };
    if (_money <= 0) exitWith { deleteVehicle _box };                   // get rid of the box if it's empty

    _box setVariable ["A3A_itemPrice", _money, true];
    _box setVariable ["A3A_build_owner", nil, true];
};
