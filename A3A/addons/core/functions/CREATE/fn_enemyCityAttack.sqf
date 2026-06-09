/*
Maintainer: John Jordan
    Sends a combined attack force to capture the given city

Scope: Server
Environment: Scheduled, should be spawned

Arguments:
    <STRING> Destination marker (enemy-owned city)
    <STRING> Origin marker (should be airbase)
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_city", "_mrkOrigin"];

Info_2("Creating enemy city attack against %1 from %2", _city, _mrkOrigin);

forcedSpawn pushBack _city; publicVariable "forcedSpawn";

private _cityPos = markerPos _city;
private _side = sidesX getVariable _mrkOrigin;
private _targside = sidesX getVariable _city;

// Notification only for enemy vs enemy
private _nameDest = [_city] call A3A_fnc_localizar;
private _text = format [localize "STR_A3A_fn_base_enemyCityAttack", Faction(_side) get "name", Faction(_targside) get "name", _nameDest];
["RadioIntercepted", [_text]] remoteExec ["BIS_fnc_showNotification", 0];

// Send in a UAV. Add half a vehicle if they're unavailable
// ["_type", "_side", "_caller", "_maxSpend", "_target", "_targPos", "_reveal", "_delay"];
private _uavSupp = ["UAV", _side, "attack", 500, objNull, _cityPos, 0, 0] call A3A_fnc_createSupport;

// Ok, vehicle count?
// Sanity check whether city is still enemy-side first?

// Spawn based on max or current garrison count? maybe max is better... 

/*private _garrisonCount = call {
    if (sidesX getVariable _city == teamPlayer) exitWith {0};       // bail out of this later
    A3A_garrison get _city get "troops" select 0;
};
*/
private _garrisonCount = A3A_garrisonSize get _city;
private _vehCount = round (1.5 + _garrisonCount / 4 + ([0, 0.5] select (_uavSupp == "")));

// Approx, just to prevent sending QRFs on top
A3A_supportStrikes pushBack [_side, "TROOPS", _cityPos, time + 1800, 1800, _vehCount * A3A_balanceVehicleCost];

// Send the land units and air transports. Returns once air sent
//params ["_side", "_airbase", "_target", "_resPool", "_vehCount", "_minDelay", "_modifiers", "_attackType", "_reveal"];
private _data = [_side, _mrkOrigin, _city, "attack", _vehCount, 0, ["lowair"]] call A3A_fnc_createAttackForceMixed;
_data params ["", "_vehicles", "_crewGroups", "_cargoGroups"];

// Adjust last waypoint of each vehicle to spread them out
private _cityPositions = groups _targSide select { leader _x getVariable ["markerX", ""] == _city }
    apply { getPosATL leader _x } inAreaArray [_cityPos, 250, 250];

// Add in police station position (or police station? hmm)
if (A3A_garrison get _city getOrDefault ["policeStation", false] isEqualType []) then {
    _cityPositions insert [0, [A3A_garrison get _city get "policeStation"]];
};
_cityPositions pushBack _cityPos;

private _posIndex = 0;
{
    private _lastWP = waypoints _x select -1;
    _lastWP setWaypointPosition [_cityPositions # _posIndex, 0];
    _posIndex = [0, _posIndex + 1] select (_posIndex + 1 < count _cityPositions);       // wraparound
} forEach _cargoGroups;


// Prepare despawn conditions
private _endTime = time + 1800;
private _victory = false;
private _soldiers = [];
{ _soldiers append units _x } forEach _cargoGroups;

private _enemySides = [Occupants, Invaders, teamPlayer] - [_side];

while {true} do
{
    if (sidesX getVariable _city == teamPlayer) exitWith {
        ServerInfo_1("City attack on %1 terminated because rebels captured city", _city);
    };

    // Make this one pretty easy
    private _nearUnits = allUnits inAreaArray [_cityPos, 200, 200] select { _x call A3A_fnc_canFight };
    private _friendCount = { side group _x == _side } count _nearUnits;
    private _enemyCount = { side group _x in _enemySides } count _nearUnits;
    if (_friendCount > 3*_enemyCount) exitWith {
        ServerInfo_1("City attack on %1 captured the marker, starting despawn routines", _city);
        _victory = true;
    };

    private _curSoldiers = { !fleeing _x and _x call A3A_fnc_canFight } count _soldiers;
    if (_curSoldiers < count _soldiers * 0.25) exitWith {
        ServerInfo_1("City attack on %1 has been defeated, starting despawn routines", _city);
    };
    if(_endTime < time) exitWith {
        ServerInfo_1("City attack on %1 timed out, starting despawn routines", _city);
    };

    sleep 10;
};

if (_victory) then {
    if (sidesX getVariable _city == teamPlayer) exitWith {};        // just in case
    isNil { 
        [_city, _side] call A3A_fnc_citySideChange;
        private _copCount = round ((A3A_garrisonSize get _city) * 0.75);
        A3A_garrison get _city set ["reinfCount", _copCount];           // bus in or convert police force. Avoid tendency towards retakes.
    };
};

{ [_x] spawn A3A_fnc_VEHDespawner } forEach _vehicles;
{ [_x] spawn A3A_fnc_enemyReturnToBase } forEach (_crewGroups + _cargoGroups);

sleep 60;

bigAttackInProgress = false; publicVariable "bigAttackInProgress";
forcedSpawn = forcedSpawn - [_city]; publicVariable "forcedSpawn";


// Need to block city battles happening when city is in forcedSpawn? hmm...
// Arguably handled? Kinda weird

// Block creating city attack when city battle in progress?
// Also arguably handled...
