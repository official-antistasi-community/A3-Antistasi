#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_targPos", ["_side", Occupants], ["_flightAlt", 0], ["_spawnPos", []] , ["_planeType", ""]];

_sideHM = Faction(_side);

if (_planeClass isEqualTo "") then {
    // Use a transport plane if possible
    _planeType = selectRandom (_sideHM get "vehiclesPlanesTransport");
    if (isNil "_planeType") then { _planeType = selectRandom (_sideHM get "vehiclesHelisTransport") };
};
private _isHeli = _planeType isKindOf "Helicopter";
if (_flightAlt isEqualTo 0) then {_flightAlt = [500, 500] select _isHeli};         // too much drift above 500...

// real drop speed is ~4.3m/s but the wind isn't reliable, so this is a better worst-case
private _dropPos = _targPos vectorAdd (wind vectorMultiply -_flightAlt / 10);

if (_spawnPos isEqualTo []) then {
    private _airport = [Occupants, _dropPos] call A3A_fnc_availableBasesAir;
    private _spawnPos = if (isNil "_airport") then { 
        Error("No airport found for supply drop");
        _dropPos getPos [5000, random 360];
    } else {
        markerPos _airport;
    };
};
_spawnPos set [2, _flightAlt];

private _plane = createVehicle [_planeType, _spawnPos, [], 0, "FLY"];     // FLY forces 100m alt
private _targDir = _spawnPos getDir _dropPos;
_plane setDir _targDir;
_plane setPosATL _spawnPos;                                           // setPosATL kills velocity
_plane setVelocityModelSpace [0, [100, 50] select _isHeli, 0];
_plane flyInHeight _flightAlt;
[_plane, _side, "legacy"] call A3A_fnc_AIVEHInit;

private _group = [_side, _plane] call A3A_fnc_createVehicleCrew;
_group deleteGroupWhenEmpty true;
{
    [_x, nil, false, "legacy"] call A3A_fnc_NATOinit; 
    _x disableAI "TARGET";
    _x disableAI "AUTOTARGET";
    _x setBehaviour "CARELESS";
} forEach units _group;

private _entryPos = _dropPos getPos [-100, _targDir];
private _exitPos = _dropPos getPos [300, _targDir];
{ _x set [2, _flightAlt] } forEach [_entryPos, _exitPos];

{ deleteWaypoint _x } forEachReversed waypoints _group;

private _wp = _group addWaypoint [_entryPos, 0];
_wp setWaypointSpeed "NORMAL";          // Blackfish cannot turn at limited?
private _wp1 = _group addWaypoint [_exitPos, 0];
_wp1 setWaypointSpeed "NORMAL";
private _wp2 = _group addWaypoint [_spawnPos, 0];
_wp2 setWaypointSpeed "FULL";
_wp2 setWaypointStatements ["true", "if !(local this) exitWith {}; deleteVehicle (vehicle this); {deleteVehicle _x} forEach thisList"];

_plane;