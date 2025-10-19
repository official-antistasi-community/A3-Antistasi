/*
	Updates enemy vehicle reserve pool, city support and aggro for vehicle destruction or capture
	Also handles the ownerSide update and enabling despawner on rebel capture

	Garrison updates handled in GetIn for captured (if mobile) and EntityKilled for killed

	Environment: Server, unscheduled now?

	Params:
	1. Object: Vehicle object
	2. Side: Side of unit that captured or destroyed the vehicle
	3. Bool (default false): True if captured, else destroyed
	4. Object (default objNull): Killer vehicle. Used for passthrough to reaction functions
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_veh", "_sideEnemy", ["_captured", false], ["_killer", objNull]];

private _type = typeof _veh;
private _side = _veh getVariable ["ownerSide", teamPlayer];			// default because Zeus

if (_captured && (_side == _sideEnemy or !alive _veh)) exitWith {};

private _act = if (_captured) then {"captured"} else {"destroyed"};
ServerDebug_4("%1 of %2 %3 by %4", _type, _side, _act, _sideEnemy);

// Kick units out of vehicles when destroyed & touching ground
if (!_captured and count crew _veh > 0) then {
	_veh spawn {
		private _timeout = time + 30;			// sometimes destroyed vehicles return isTouchingGround false
		waitUntil { sleep 2; time > _timeout or isTouchingGround _this };
		while {count crew _this > 0} do {
			moveOut (crew _this # 0);
			sleep 0.5;
		};
	};
};

private _vehCost = A3A_vehicleResourceCosts getOrDefault [_type, 0];
if ((_side == Occupants or _side == Invaders) and _vehCost > 0) then
{
	if (_veh getVariable ["A3A_resPool", "legacy"] == "legacy") then {
		// Vehicle not pre-resourced, deplete both pools
		[-_vehCost, _side, "legacy"] remoteExecCall ["A3A_fnc_addEnemyResources", 2];
	};

	// Hmm. Shouldn't be added for a capture?
	[_side, getPosATL _veh, 2*_vehCost/3, _killer] remoteExec ["A3A_fnc_addRecentDamage", 2];		// other third applied in HandleDamage

	if (_sideEnemy != teamPlayer) exitWith {};

    [_side, round (_vehCost / 50), 45] remoteExec ["A3A_fnc_addAggression", 2];
};

if (_side == civilian) then
{
	if (_sideEnemy != teamPlayer) exitWith {};

	// Punish players slightly for stealing cars. Code used to be in vehDespawner.
	private _city = _veh getVariable "markerX";			// TODO: Check whether the timing works for this
	if (isNil "_city") exitWith {};
	if ("_civ" in _city) then { _city = _city select [0, count _city - 4] };		// strip the _civ tag

	[-1, _city] remoteExecCall ["A3A_fnc_citySupportChange", 2];

	if (sidesX getVariable _city == teamPlayer or random 1 < 0.5) exitWith {};
	{
		private _thief = _x;
		if ((captive _thief) and (isPlayer _thief)) then {
			[_thief, false] remoteExec ["setCaptive", _thief];
		};
		{
			if ((side _x == Occupants) and (_x distance _pos < distanceSPWN2)) then {_x reveal _thief};
		} forEach allUnits;
	} forEach crew _veh;

};

if (_captured) then
{
	if (_sideEnemy == teamPlayer) then {
		// Remove from vehicle despawner. Should work if called on the server, because HCs can only spawn enemy vehicles and clients can only spawn friendlies
		private _despawnerHandle = _veh getVariable "A3A_despawnerHandle";
		if (!isNil "_despawnerHandle") then { terminate _despawnerHandle; _veh setVariable ["A3A_despawnerHandle", nil]; };
	};
	// Do the actual side-switch
	_veh setVariable ["ownerSide", _sideEnemy, true];

};
