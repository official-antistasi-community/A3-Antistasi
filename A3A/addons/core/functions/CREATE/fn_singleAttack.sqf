
/*  Sends a combined attack force to capture the given marker

    Environment: Server or HC, scheduled

    Params:
        _mrkDest: MARKER : The target position where the attack will be send to
        _side: SIDE : The side to send the attack
        _vehCount: NUMBER : Number of vehicles to use in the attack
        _reveal: NUMBER : Amount of info to reveal to rebels, 0 low, 1 high

    Returns:
        Nothing
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_mrkDest", "_side", "_vehCount", "_reveal"];
private _targPos = markerPos _mrkDest;

ServerInfo_1("Starting attack with parameters %1", _this);

private _airbase = [_side, markerPos _mrkDest] call A3A_fnc_availableBasesAir;

//params ["_side", "_airbase", "_target", "_resPool", "_vehCount", "_delay", "_modifiers", "_attackType", "_reveal"];
private _data = [_side, _airbase, _mrkDest, "defence", _vehCount, 0, [], "CounterAttack", _reveal] call A3A_fnc_createAttackForceMixed;
_data params ["", "_vehicles", "_crewGroups", "_cargoGroups"];

// Prepare despawn conditions
private _endTime = time + 2700;
private _victory = false;
private _soldiers = [];
{ _soldiers append units _x } forEach _cargoGroups;

while {true} do
{
    private _markerSide = sidesX getVariable _mrkDest;
    if(_markerSide == _side) exitWith {
        ServerInfo_1("Small attack to %1 captured the marker, starting despawn routines", _mrkDest);
        _victory = true;
    };

    private _curSoldiers = { !fleeing _x and _x call A3A_fnc_canFight } count _soldiers;
    if (_curSoldiers < count _soldiers * 0.25) exitWith {
        ServerInfo_1("Small attack to %1 has been defeated, starting despawn routines", _mrkDest);
    };
    if(_endTime < time) exitWith {
        ServerInfo_1("Small attack to %1 timed out, starting despawn routines", _mrkDest);
    };

    // Attempt to flip marker
    ["zoneCheck", [_mrkDest]] remoteExecCall ["A3A_fnc_garrisonOp", 2];       // could be three different machines...
    sleep 30;
};

{ [_x] spawn A3A_fnc_VEHDespawner } forEach _vehicles;
{ [_x] spawn A3A_fnc_enemyReturnToBase } forEach _crewGroups;
{
    [_x, [nil, _mrkDest] select _victory] spawn A3A_fnc_enemyReturnToBase;
    sleep 10;
} forEach _cargoGroups;
