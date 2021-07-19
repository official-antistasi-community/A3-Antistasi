#include "..\..\Includes\common.inc"
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

// Handle the old reinforcements

private ["_airportsX","_reinfPlaces","_airportX","_numberX","_numGarr","_numReal","_sideX","_potentials","_countX","_siteX","_positionX"];
_airportsX = airportsX select {(sidesX getVariable [_x,sideUnknown] != teamPlayer) and (spawner getVariable _x == 2)};
if (count _airportsX == 0) exitWith {};
_reinfPlaces = [];
{
	_airportX = _x;
	_numberX = 8;
	_numGarr = [_airportX] call A3A_fnc_garrisonSize;
	_numReal = count (garrison getVariable [_airportX, []]);
	_sideX = sidesX getVariable [_airportX,sideUnknown];
    private _groupData = FactionGetGroups(_sideX);

	//Self reinforce the airport if needed
	if (_numReal + 4 <= _numGarr) then
	{
        [
            selectRandom (_groupData get (if (_numReal + 8 <= _numGarr) then {_numberX = 0; "squads"} else {_numberX = 4; "medium"}))
            ,_sideX,_airportX,0
        ] remoteExec ["A3A_fnc_garrisonUpdate",2];
	};
	//Self reinforce done

	//Reinforce nearby sides
	if (_numberX >= 4) then
	{
		_potentials = (outposts + seaports - _reinfPlaces - (killZones getVariable [_airportX,[]])) select {sidesX getVariable [_x,sideUnknown] == _sideX};
		if (_potentials isEqualTo []) then
		{
			_potentials = (resourcesX + factories - _reinfPlaces - (killZones getVariable [_airportX,[]])) select {sidesX getVariable [_x,sideUnknown] == _sideX};
		};
		_positionX = getMarkerPos _airportX;
		_potentials = _potentials select {((getMarkerPos _x distance2D _positionX) < distanceForAirAttack) and !(_x in forcedSpawn)};
		if (count _potentials > 0) then
		{
			_countX = 0;
			_siteX = "";
			{
				_numGarr = [_x] call A3A_fnc_garrisonSize;
				_numReal = count (garrison getVariable [_x, []]);
				if (_numGarr - _numReal > _countX) then
				{
					_countX = _numGarr - _numReal;
					_siteX = _x;
				};
			} forEach _potentials;
			if (_siteX != "") then
			{
				if ({(getMarkerPos _x distance2d getMarkerPos _siteX < distanceSPWN) and (sidesX getVariable [_x,sideUnknown] != _sideX)} count airportsX == 0) then
				{
					if ({(_x distance2D _positionX < (2*distanceSPWN)) or (_x distance2D (getMarkerPos _siteX) < (2*distanceSPWN))} count allPlayers == 0) then
					{
                        _typeGroup = selectRandom (_groupData get (if (_numberX == 4) then {"medium"} else {"squads"}));
						[_typeGroup,_sideX,_siteX,2] remoteExec ["A3A_fnc_garrisonUpdate",2];

						//This line send a virtual convoy, execute [] execVM "Convoy\convoyDebug.sqf" as admin to see it
						//If it breaks, it doesn't change anything
						//If it works, it will not add any troups
						//[_siteX, "Reinforce", _sideX, [(_numberX == 4)]] remoteExec ["A3A_fnc_createAIAction", 2];
					}
					else
					{
						_reinfPlaces pushBack _siteX;
						[[_siteX,_airportX,_numberX,_sideX],"A3A_fnc_patrolReinf"] call A3A_fnc_scheduler;
					};
				};
			};
		};
	};
	if (count _reinfPlaces > 3) exitWith {};
} forEach _airportsX;

if ((count _reinfPlaces == 0) and (AAFpatrols <= 3)) then {[] spawn A3A_fnc_AAFroadPatrol};


// Reduce loot crate cooldown if garrison is complete
{
	call {
		private _lootCD = garrison getVariable [_x + "_lootCD", 0];
		if (_lootCD == 0) exitWith {};							// don't update unless changed
		private _realSize = count (garrison getVariable [_x, []]);
		if (_realSize < [_x] call A3A_fnc_garrisonSize) exitWith {};
		garrison setVariable [_x + "_lootCD", 0 max (_lootCD - 10), true];
	};
} forEach (airportsX + outposts + seaports);


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
