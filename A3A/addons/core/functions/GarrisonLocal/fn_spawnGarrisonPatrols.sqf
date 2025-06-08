/*
    Spawn two-man patrols in garrison
    Worker function for spawnGarrison, runs on server and HCs
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_activeGarrison", "_marker", "_side", "_storedTroops"];
if (_side == teamPlayer) exitWith {};           // no patrols for rebels
private _faction = Faction(_side);
private _markerPos = markerPos _marker;
private _type = _activeGarrison get "type";
_storedTroops params ["_troopCount", "_quality"];

private _groups = _activeGarrison get "groups";
private _troops = _activeGarrison get "troops";

private _numPatrols = call {
    // No patrols if there are enemy markers nearby (TODO: should be size-dependent? cities not included?)
    private _indexes = markersX inAreaArrayIndexes [markerPos _marker, 300, 300] select { sidesX getVariable markersX#_x != _side };
    if (_indexes isNotEqualTo []) exitWith { 0 };

    private _maxTroops = A3A_garrisonSize getOrDefault [_marker, 0];
    private _patrolProp = call {
        // City: 3/4 at max, 1/2 at min? Maybe with police station dependency
        if (_type == "city") exitWith { 1 };     //linearConversion [0, _maxTroops, _troopCount, 0.5, 0.75, true] };
        // Normal garrison: None at half, 1/4 at max?
        linearConversion [_maxTroops/2, _maxTroops, _troopCount, 0, 0.25, true];
    };
    round ((_troopCount) * _patrolProp * 0.5);
};
Debug_2("Generating %1 patrols for %2", _numPatrols, _marker);

// Use high-quality patrols proportionally to troop quality
private _patrolGroupTypes = ["groupsPoliceSmall", "groupsMilitiaSmall", "groupsSmall", "groupsSpecOpsSmall"];
private _lowGroupTypes = _faction get (_patrolGroupTypes # (floor _quality));
private _highGroupTypes = _faction get (_patrolGroupTypes # (ceil _quality));
private _highPatrols = round (_numPatrols * (_quality%1));

private _minRad = 0;
private _maxRad = markerSize _marker # 0 min markerSize _marker # 1;
if (_type != "city") then { _minRad = _maxRad; _maxRad = _maxRad + 200 };

for "_i" from 1 to _numPatrols do
{
    private _spawnPos = [_markerPos, _minRad, _maxRad, 3.5] call A3A_fnc_findPatrolPos;

    private _typeGroup = selectRandom ([_lowGroupTypes, _highGroupTypes] select (_i <= _highPatrols));
    private _group = [_spawnPos, _side, _typeGroup] call A3A_fnc_spawnGroup;
    { [_x, _marker] call A3A_fnc_NATOinit } forEach units _group;
    _group deleteGroupWhenEmpty true;
    _groups pushBack _group;
    _troops append units _group;

    if ((random 10 < 2.5) and !("Sniper" in _typeGroup#0)) then {
        private _dog = [_group, "Fin_random_F", _spawnPos, [], 0, "FORM"] call A3A_fnc_createUnit;
        _troops pushBack _dog;
        [_dog] spawn A3A_fnc_guardDog;
        sleep 0.1;
    };

    [_group, "Patrol_Area", _minRad, _maxRad, _maxRad, false, _markerPos, false] call A3A_fnc_patrolLoop;
};

_storedTroops set [0, (_troopCount) - 2*_numPatrols];
