#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
// convert killzones into [base, target] array
private _allKillzones = [];
{
	private _base = _x;
	private _kzlist = killZones getVariable [_base, []];
	{ _allKillzones pushBack [_base, _x] } forEach _kzlist;
} forEach (outposts + airportsX);

// Remove random killzones if the aggression-based accumulator hits >1
if (isNil "killZoneRemove") then {killZoneRemove = 0};
private _kzAggroMult = 0.2 + 0.4 * (aggressionOccupants + aggressionInvaders) / 100;
killZoneRemove = killZoneRemove + _kzAggroMult * (0.5 + 0.1 * count _allKillzones);
if (count _allKillzones == 0) then { killZoneRemove = 0 };

while {killZoneRemove >= 1} do
{
	// Remove a random killzone entry from the real killzones.
	// May attempt to remove the same killzone multiple times. This is safe.
	(selectRandom _allKillzones) params ["_base", "_target"];
	private _kzlist = killZones getVariable [_base, []];
	_kzlist deleteAt (_kzlist find _target);
	killZones setVariable [_base, _kzlist, true];
	killZoneRemove = killZoneRemove - 1;
};

// Do killzones do anything anymore?
// actually want two things:
// 1. Routes where ground vehicles got stuck
// 2. Dangerous locations
// Point 1 needs handling maybe
// Point 2 can be replaced with a recentDamage check for the moment

// Reinforce garrisons
[Occupants] call A3A_fnc_reinforceSide;
if (gameMode != 3) then { [Invaders] call A3A_fnc_reinforceSide };

// If there aren't too many road patrols around already, generate about 3 * playerScale per hour
if (AAFpatrols < round (3 * A3A_balancePlayerScale) and (random 2 < A3A_balancePlayerScale)) then {
	[] spawn A3A_fnc_AAFroadPatrol;
};

// Reduce loot crate & intel cooldowns if garrison is reasonably full
{
	private _cdtype = _x;
	{
		if (sidesX getVariable _x == teamPlayer) then { continue };		// shouldn't really be necessary
		private _garrison = A3A_garrison get _x;
		if !(_cdtype in _garrison) then { continue };

		private _realSize = _garrison get "troops" select 0;
		private _maxSize = A3A_garrisonSize get _x;
		if (_realSize / _maxSize < 0.7) then { continue };

		private _newVal = (_garrison get _cdtype) - 10;
		if (_newVal <= 0) then { _garrison deleteAt _cdtype; continue };
		_garrison set [_cdtype, _newVal];

	} forEach markersX;
} forEach ["lootCD", "intelCD"];
