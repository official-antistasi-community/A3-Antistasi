/*
    Garrison-local function for adding a reinforcement patrol to a city

    Environment: Scheduled. Should only be called by garrisonOpLoop.

    Arguments:
    <STRING> Marker name.
    <NUMBER> Troop quality (decimal 0-4)

    Copyright 2025 John Jordan. All Rights Reserved.
    Used and distributed by the Antistasi Community project with permission.
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

Trace_1("Called with %1", _this);

params ["_marker", "_quality"];

private _garrison = A3A_activeGarrison get _marker;
private _side = _garrison get "side";
private _troops = _garrison get "troops";

// Select group type first
private _unitTypes = call {
    private _groupQuality = [floor _quality, ceil _quality] select (_quality%1 > random 1);
    private _groupType = ["groupsPoliceSmall", "groupsMilitiaSmall", "groupsSmall", "groupsSpecOpsSmall"] select _groupQuality;
    selectRandom (Faction(_side) get _groupType);
};


// If police station is thin and there are no enemies near then just add to that?
private _station = _garrison getOrDefault ["policeStation", objNull];
private _stationUsed = false;
if (alive _station) then {

    private _buildingGroup = _garrison getOrDefault ["buildingGroup", grpNull];
    if (combatBehaviour _buildingGroup == "COMBAT") exitWith {};
    private _stationCops = units _buildingGroup select { alive _x };
    if (random 3 < count _stationCops) exitWith {};
    if (units teamPlayer inAreaArray [getPosATL _station, 100, 100] isNotEqualTo []) exitWith {};

    private _freePositions = (_station buildingPos -1) select {
        private _buildingPos = _x;
        _stationCops findIf { _x distance _buildingPos < 1 } == -1;
    };
    if (count _freePositions < 2) exitWith {};
    private _unitPositions = [];
    _unitPositions pushBack (_freePositions deleteAt floor random count _freePositions);
    _unitPositions pushBack selectRandom _freePositions;

    if (isNull _buildingGroup) then { _buildingGroup = createGroup _side; _garrison set ["buildingGroup", _buildingGroup] };
    {
        private _type = _unitTypes select _forEachIndex;
        private _unit = [_buildingGroup, _type, _x, [], 0, "NONE"] call A3A_fnc_createUnit;
        _troops pushBack _unit;
        _unit setDir (_station getRelDir _x);
        [_unit, _marker] call A3A_fnc_NATOinit;
        _unit setUnitPos "UP";
        dostop _unit;
    } forEach _unitPositions;
    _stationUsed = true;
};
if (_stationUsed) exitWith {};


// For now just attempt to spawn somewhere that players aren't near with no LoS
// Expensive but probably acceptable...
private _closest = 0;
private _spawnPos = [];
private _nearPlayers = (allPlayers - entities "HeadlessClient_F") inAreaArray [markerPos _marker, 500, 500];

for "_i" from 1 to 5 do {
    private _testPos = [markerPos _marker, 0, 250, 2] call A3A_fnc_findPatrolPos;
    if (_nearPlayers isEqualTo []) exitWith { _spawnPos = _testPos };       // no players near, just take the first one

    // pick pos furthest from all players as fallback
    private _minDist = selectMin (_nearPlayers apply { _x distance2d _testPos });
    if (_minDist > _closest) then { _spawnPos = _testPos; _closest = _minDist };
    if (_minDist < 50) then { continue };

    // player within 500m has LOS?
    private _checkPos = ATLtoASL _testPos vectorAdd [0,0,1];
    if (-1 == _nearPlayers findIf { [_x, "VIEW"] checkVisibility [eyePos _x, _checkPos] > 0.2 }) exitWith { _spawnPos = _testPos };
};

private _group = [_spawnPos, _side, _unitTypes] call A3A_fnc_spawnGroup;
{ [_x, _marker] call A3A_fnc_NATOinit } forEach units _group;
_group deleteGroupWhenEmpty true;
(_garrison get "groups") pushBack _group;
_troops append units _group;

if ((random 10 < 2.5) and !("Sniper" in _unitTypes#0)) then {
    private _dog = [_group, "Fin_random_F", _spawnPos, [], 0, "FORM"] call A3A_fnc_createUnit;
    _troops pushBack _dog;
    [_dog] spawn A3A_fnc_guardDog;
};

// TODO: should probably store the city radius
[_group, "Patrol_Area", 0, 250, -1, false, markerPos _marker, false, false] call A3A_fnc_patrolLoop;


// Next, attempt to spawn in a building somewhere in the town
// hmm, could drop this and use findPatrolPos instead?
// but we need the spawn-in-building logic anyway... 

/*private _markerPos = markerPos _marker;
private _eblockers = units _side inAreaArray [_markerPos, 250, 250];
private _rblockers = units teamPlayer inAreaArray [_markerPos, 250, 250];
private _house = objNull;
for "_i" from 1 to 20 do {
    private _rpos = _markerPos getPos [200 * sqrt random 1, random 360];
    private _testHouse = nearestBuilding _rpos;         // should guarantee places?
    if (_eblockers inAreaArray [getPosATL _testHouse, 20, 20] isNotEqualTo []) then { continue };
    if (_rblockers inAreaArray [getPosATL _testHouse, 50, 50] isNotEqualTo []) then { continue };
    if (count (_testHouse buildingPos -1) >= 4) exitWith { _house = _testHouse };
};
if (!isNull _house) then {
    private _freePositions = _house buildingPos -1;
    if (_freePositions < 2) exitWith {};
    _unitPositions pushBack (_freePositions deleteAt floor random count _freePositions);
    _unitPositions pushBack selectRandom _freePositions;
};
*/