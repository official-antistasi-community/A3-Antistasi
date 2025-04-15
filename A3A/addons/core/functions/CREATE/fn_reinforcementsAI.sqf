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

// Handle the old reinforcements

private _fnc_pickSquadType = {
	params ["_count", "_faction"];
	if (_numTroops == 8) exitWith { selectRandom (_faction get "groupsSquads")};
	selectRandom (_faction get "groupsMedium");
};

{
	private _side = _x;
	if (gamemode == 3 and _side == Invaders) exitWith {};

	private _faction = Faction(_side);
	private _lowAir = _faction getOrDefault ["attributeLowAir", false];
	private _defRes = [A3A_resourcesDefenceOcc, A3A_resourcesDefenceInv] select (_side == Invaders);
	private _totalReinf = 4 * round (0.1 * _defRes / 40);
	Debug_3("%1 sending %2 total troops to reinforce due to %3 resources", _side, _totalReinf, _defRes);
	if (_totalReinf == 0) then {continue};

	private _sourceAirports = airportsX select {(sidesX getVariable [_x,sideUnknown] == _side) and (spawner getVariable _x == 2)};
	_sourceAirports pushBack (["NATO_carrier", "CSAT_carrier"] select (_side == Invaders));

	// build list of markers that need reinforcement
	private _reinfTargets = [];			// elements are [troopsNeeded, marker]
	private _enemyAirfieldPositions = airportsX select {sidesX getVariable _x != _side} apply { markerPos _x };
	{
		private _site = _x;
		if (sidesX getVariable _site != _side) then { continue };
		if (_site in forcedSpawn) then { continue };

		// Don't reinforce (by air?) if marker has enemy-controlled airfields within spawn distance
		if (_enemyAirfieldPositions inAreaArray [markerPos _x, 1000, 1000] isNotEqualTo []) then { continue };

		// Don't reinforce places with significant recent violence (use QRFs instead)
		if ([_side, markerPos _site, 300] call A3A_fnc_getRecentDamage > 50) then { continue };

		private _maxTroops = [_site] call A3A_fnc_garrisonSize;
		private _troopsNeeded = _maxTroops - count (garrison getVariable [_site, []]);
		if (_troopsNeeded <= 0) then { continue };
		_reinfTargets pushBack [_troopsNeeded/_maxTroops, _troopsNeeded, _site];
	} forEach (airportsX + outposts + seaports + resourcesX + factories);

	// prioritize bases with highest proportion of troops needed
	_reinfTargets sort false;

	while {_totalReinf > 0} do
	{
		if (_sourceAirports isEqualTo [] or _reinfTargets isEqualTo []) exitWith {};

		//Find a suitable site to reinforce
		private ["_source", "_targIndex"];
		if (_lowAir) then {
			// Bias towards the highest-weight target and then find a suitable source base. Might be self.
			_targIndex = floor (count _reinfTargets * (random 1)^2);
			_source = [_side, _reinfTargets#_targIndex#2] call A3A_fnc_availableBasesLand;
			if (isNil "_source") then {
				// No possible reinforcements for this location, remove it from the list
				_reinfTargets deleteAt _targIndex;
				continue;
			};
		} else {
			// Look for best target around a random airfield
			_source = selectRandom _sourceAirports;
			private _killZones = killzones getVariable [_source, []];
			_targIndex = _reinfTargets findIf {
				(markerPos (_x#2) distance2d markerPos _source < distanceForAirAttack)
				and !((_x#2) in _killZones)
			};
			if (_targIndex == -1) then {
				// Airport has nothing to do, remove it from the list
				_sourceAirports deleteAt (_sourceAirports find _source);
				continue;
			};
		};

		(_reinfTargets deleteAt _targIndex) params ["_weight", "_numNeeded", "_target"];
		private _numTroops = [4, 8] select (_numNeeded > 4 and _totalReinf >= 8 and random 1 > 0.3);
		_totalReinf = _totalReinf - _numTroops;

		Debug_3("Reinforcing garrison %1 from %2 with %3 troops", _target, _source, _numTroops);
		if (_source == _target) then {
			// Self-reinforce. Already know that we're not spawned, so this is fine
			[[_numTroops, _faction] call _fnc_pickSquadType, _side, _target, 0] remoteExec ["A3A_fnc_garrisonUpdate",2];
			continue;
		};
		if ([distanceSPWN1, 1, getMarkerPos _target, teamPlayer] call A3A_fnc_distanceUnits) then {
			// If rebels are near the target, send a real reinforcement
			[[_target, _source, _numTroops, _side], "A3A_fnc_patrolReinf"] call A3A_fnc_scheduler;
			sleep 10;		// Might re-use this marker shortly, avoid collisions
		} else {
			// Otherwise just add troops directly
			[[_numTroops, _faction] call _fnc_pickSquadType, _side, _target, 2] remoteExec ["A3A_fnc_garrisonUpdate", 2];
		};
	};
} forEach [Occupants, Invaders];


// If there aren't too many road patrols around already, generate about 3 * playerScale per hour
if (AAFpatrols < round (3 * A3A_balancePlayerScale) and (random 2 < A3A_balancePlayerScale)) then {
	[] spawn A3A_fnc_AAFroadPatrol;
};

// Reduce loot crate cooldown if garrison is reasonably full
{
	call {
		private _lootCD = garrison getVariable [_x + "_lootCD", 0];
		if (_lootCD == 0) exitWith {};							// don't update unless changed
		private _realSize = count (garrison getVariable [_x, []]);
		private _maxSize = [_x, true] call A3A_fnc_garrisonSize;			// use non-frontline size
		if (_realSize / _maxSize < 0.75) exitWith {};
		garrison setVariable [_x + "_lootCD", 0 max (_lootCD - 10), true];
	};
} forEach (airportsX + outposts + seaports);


/*
{
		//Setting the number of recruitable units per ticks per airport
    garrison setVariable [format ["%1_recruit", _x], 12, true];
} forEach airportsX;

{
    //Setting the number of recruitable units per ticks per outpost
		garrison setVariable [format ["%1_recruit", _x], 0, true];
} forEach outposts;

//New reinf system (still reactive, so a bit shitty)
{
	_side = _x;
  _reinfMarker = if(_x == Occupants) then {reinforceMarkerOccupants} else {reinforceMarkerInvader};
	_canReinf = if(_x == Occupants) then {canReinforceOccupants} else {canReinforceInvader};
    Debug_3("Side %1, needed %2, possible %3", _x, count _reinfMarker, count _canReinf);
	_reinfMarker sort true;
	{
		_target = (_x select 1);
		[_target, "Reinforce", _side, [_canReinf]] remoteExec ["A3A_fnc_createAIAction", 2];
		sleep 10;		// prevents convoys spawning on top of each other
		//TODO add a feedback if something was send or not
	} forEach _reinfMarker;
} forEach [Occupants, Invaders];
//hint "Reinforce AI done!";

//Replenish airports if possible
{
	[_x] call A3A_fnc_replenishGarrison;
} forEach airportsX;
*/
