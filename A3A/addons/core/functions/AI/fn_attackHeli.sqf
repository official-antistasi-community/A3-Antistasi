/*  Persistent AI script to make enemy attack helis behave better
    Prevents helis giving enemies an easy kill on the first pass, and hovering once they run out of targets
    Also gives the heli a custom loadout if it exists
Scope: Server or HC
Environment: Spawned

Arguments:
    <OBJECT> Vehicle (should be attack heli)
    <GROUP> Crew group of vehicle, should be occupant or invader
    <POSATL> Ground position to kill targets near

*/

// - SAD will still run out of steam with lockWP enabled.
// - everything is dumb
// so basically we still need a monitor function to recreate the waypoint?

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_vehicle", "_group", "_targPos"];
// Set script handle so abort routines can remove it later
_group setVariable ["A3A_AIScriptHandle", _thisScript];
[_vehicle, "HELICOPTER"] call A3A_fnc_setPlaneLoadout;

while {count waypoints _group > 0} do { deleteWaypoint [_group, 0] };
_group setBehaviourStrong "COMBAT";
private _noGunner = isNull gunner _vehicle;

private _wayPos = _targPos getPos [300 + random 100, random 360];
private _destroyWP = _group addWaypoint [_wayPos, 0];
_destroyWP setWaypointType "SAD";

private _approach = true;
private _timeout = time + 60 + (_vehicle distance2d _targPos) / 50;
while {true} do {
    sleep 10;
    if !(alive _vehicle and canFire _vehicle and canMove _vehicle) exitWith {};
    if !((_noGunner or gunner _vehicle call A3A_fnc_canFight) and driver _vehicle call A3A_fnc_canFight) exitWith {};

    if (_approach and { _vehicle distance2d _wayPos < 300}) then { _timeout = -1; _approach = false };
    if (currentWaypoint _group > 0 or time > _timeout ) then {
        _wayPos = _targPos getPos [50 + random 100, random 360];
        _destroyWP setWaypointPosition [_wayPos, 0];
        //Debug_1("Setting current waypoint for attack heli type %1", typeof vehicle leader _group);
        _group setCurrentWaypoint _destroyWP;
        _timeout = time + 300;
   };
};

ServerInfo("Attack heli aborted due to damage");
_group setVariable ["A3A_AIScriptHandle", nil];
[_vehicle] spawn A3A_fnc_VEHDespawner;
[_group] spawn A3A_fnc_enemyReturnToBase;
