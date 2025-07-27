// Clear troops and potentially vehicles from garrison
// Used by rebel UI actions, HQ moves, side changes and minor site deletion

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

Trace_1("Called with %1", _this);

params ["_marker", "_troopsOnly", "_safe"];

private _garrison = A3A_activeGarrison get _marker;
private _troops = _garrison get "troops";
private _groups = _garrison get "groups";
private _isRebel = (_garrison get "side") == teamPlayer;

// If anyone is in a vehicle (static weapon, later?), get them out
// Might have units occupying statics that aren't in this garrison, so we do this the daft way for now
{
    // They're no longer garrison, so set their pool so they can be refunded
    if (!_isRebel) then { _x setVariable ["A3A_resPool", "defence", true] };
    _x setVariable ["markerX", nil, true];
    if (vehicle _x != _x) then {
        group _x leaveVehicle vehicle _x;
        moveOut _x;
    };
} forEach _troops;

sleep 0.1;

if (!_isRebel) then
{
    // If close to the marker & enemy, just surrender
/*    private _enemySide = [Occupants, Invaders] select (_garrison get "side" == Occupants);
    private _nearEnemies = (units teamPlayer + units _enemySide) inAreaArray [markerPos _marker, 100, 100];
    {
        if (_nearEnemies inAreaArray [getPosATL _x, 20, 20] isEqualTo []) then { continue };
        [_x] spawn A3A_fnc_surrenderAction;
    } forEach _troops;
    sleep 0.5;      // wait for surrender to be set
*/
    // Everyone else can try to run away
    { _x spawn A3A_fnc_enemyReturnToBase } forEach _groups;
} else {
    // Rebel garrisons might be cleared without enemies nearby, in that case we already refunded
    if (_safe) exitWith {
        { if (alive _x) then { deleteVehicle _x } } forEach _troops;
        { deleteGroup _x } forEach _groups;
    };

    // Otherwise retreat (maybe) and refund them if they're still alive after a while
    private _wasHQ = _marker == "Synd_HQ";
    { [_x, _wasHQ] spawn A3A_fnc_rebelReturnToBase } forEach _groups;
};

_garrison set ["troops", []];
_garrison set ["groups", []];

if (_troopsOnly) exitWith {};

// If we get here then the marker is being deleted or moved, so need to clear all references

// Release statics & vehicles from marker
// Should resource pool be changed? If not then the resources are lost, which is probably reasonable
{
    if (!alive _x) then { continue };
    _x setVariable ["markerX", nil, true];
    if (_isRebel) then {
        // In this case we already refunded the things
        if (_safe and _marker != "Synd_HQ") then { deleteVehicle _x };
    } else {
        _x spawn A3A_fnc_VEHdespawner
    };
} forEach (_garrison get "vehicles");

_garrison set ["vehicles", []];
