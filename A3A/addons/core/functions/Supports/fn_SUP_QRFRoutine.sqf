
/*  Spawns and maintains an air or land QRF

Environment: Server or HC, must be spawned

Arguments:
    <STRING> Unique support name (mostly for logging)
    <SIDE> Side to send support from
    <STRING> Resource pool of support, "attack" or "defence"
    <SCALAR> Delay time in seconds
    <POS2D> Target position for airstrike
    <STRING> Marker name of source airport
    <BOOL> Whether the QRF is air (true) or land (false)
    <INTEGER> Total vehicle count of QRF
    <INTEGER> Support (non-transport) vehicle count of QRF
    <SCALAR> Estimated resources already spent on support 
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_supportName", "_side", "_resPool", "_sleepTime", "_targPos", "_base", "_isAir", "_vehCount", "_attackCount", "_estResources"];

sleep _sleepTime;

// Now spawn the actual QRF
ServerDebug_3("%1 attempting to create force with %2 transport and %3 attack vehicles", _supportName, _vehCount-_attackCount, _attackCount);
private _data = if (_isAir) then {
    [_side, _base, _targPos, _resPool, _vehCount, _attackCount] call A3A_fnc_createAttackForceAir;
} else {
    [_side, _base, _targPos, _resPool, _vehCount, _attackCount] call A3A_fnc_createAttackForceLand;
};
_data params ["_resources", "_vehicles", "_crewGroups", "_cargoGroups"];
ServerInfo_1("Spawn performed: Vehicles %1", _vehicles apply { typeOf _x });

// Update the resource usage for the final value
[_estResources - _resources, _side, _resPool] remoteExec ["A3A_fnc_addEnemyResources", 2];

// Find nearest garrison marker and use that as attempted capture/garrison target if close
private _nearMrk = call {
    private _potentials = outposts + airportsX + resourcesX + factories + seaports;
    private _nearMrk = [_potentials, _targPos] call BIS_fnc_nearestPosition;       // might be nil
    [nil, _nearMrk] select (markerPos _nearMrk distance2d _targPos < 500);
};

private _timeOut = time + 1800;
private _searchTime = time;
private _travelling = true;
private _soldiers = [];
{ _soldiers append units _x } forEach _cargoGroups;

while {true} do
{
    private _curSoldiers = { !fleeing _x and _x call A3A_fnc_canFight } count _soldiers;
    if (_curSoldiers <= count _soldiers * 0.25) exitWith {
        ServerInfo_1("QRF %1 has been defeated, starting retreat", _supportName);
    };
    if (time > _timeOut) exitWith {
        // Still need this in case a QRF knows about enemies but isn't dealing with them
        ServerInfo_1("QRF %1 has timed out, starting retreat", _supportName);
    };

    if (_travelling and {-1 != _cargoGroups findif { leader _x distance2d _targPos < 300 }}) then {
        _travelling = false;
        _searchTime = time + 600;           // give it 10 minutes to find a target
        ServerDebug_1("%1 is approaching its objective", _supportName);
    };

    if (!_travelling and {time > _searchTime}) then {
        // objNull distance2d [anything] is 1e10
        if (-1 == _cargoGroups findIf { (leader _x findNearestEnemy _targPos) distance2d _targPos < 500 }) then {
            ServerInfo_1("%1 has no nearby targets, returning", _supportName);
            break;
        };
    };

    // Attempt to flip marker in case it was left empty
    if (!isNil "_nearMrk") then {
        ["zoneCheck", [_nearMrk, true]] remoteExecCall ["A3A_fnc_garrisonOp", 2];      // bounce through server
    };
    sleep 30;
};


{ [_x] spawn A3A_fnc_VEHDespawner } forEach _vehicles;
{ [_x] spawn A3A_fnc_enemyReturnToBase } forEach _crewGroups;
{
    if (isNil "_nearMrk") then { [_x] spawn A3A_fnc_enemyReturnToBase; continue };
    [_x, _nearMrk] spawn A3A_fnc_enemyReturnToBase;
    sleep 10;
} forEach _cargoGroups;
