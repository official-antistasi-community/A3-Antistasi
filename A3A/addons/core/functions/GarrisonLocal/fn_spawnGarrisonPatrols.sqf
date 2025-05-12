/*
    Spawn two-man patrols in garrison
    Worker function for spawnGarrison, runs on server and HCs
*/

params ["_activeGarrison", "_marker", "_side", "_storedTroops"];
if (_side == teamPlayer) exitWith {};           // no patrols for rebels
private _faction = Faction(_side);
private _markerPos = markerPos _marker;
_storedTroops params ["_troopCount", "_quality"];

private _groups = _activeGarrison get "groups";
private _troops = _activeGarrison get "troops";

private _numPatrols = call {
    // No patrols for rebel garrisons
    if (_side == teamPlayer) exitWith { 0 };

    // No patrols if there are enemy markers within marker area (TODO: should be distance-based instead?)
    if (markersX findIf {(markerPos _x inArea _marker) && {sidesX getVariable _x != _side}}) != -1) exitWith { 0 };

    private _maxTroops = [_marker] call A3A_fnc_garrisonSize;
    private _patrolProp = call {
        // City: 3/4 at max, 1/2 at min? Maybe with police station dependency
        if (_marker in citiesX) exitWith { linearConversion [0, _maxTroops, _troopCount, 0.5, 0.75, true] };
        // Normal garrison: None at half, 1/4 at max?
        linearConversion [_maxTroops/2, _maxTroops, _troopCount, 0, 0.25, true];
    };
    round ((_troopCount) * _patrolProp * 0.5);
};

// Use high-quality patrols proportionally to troop quality
private _patrolGroupTypes = ["groupsPoliceSmall", "groupsMilitiaSmall", "groupsSmall", "groupsSpecOpsSmall"];
private _lowGroupTypes = _faction get (_patrolGroupTypes # (floor _quality));
private _highGroupTypes = _faction get (_patrolGroupTypes # (ceil _quality));
private _highPatrols = round (_numPatrols * (_quality%1));

private _markerSize = [_marker] call A3A_fnc_sizeMarker;

for "_i" from 1 to _numPatrols do
{
    private _spawnPosition = [_markerPos, 25, _markerSize/2, 2, 0, -1, 0] call A3A_fnc_getSafePos;
    if (_spawnPosition isEqualTo [0,0]) exitWith {
        ServerDebug("Unable to find spawn position for patrol unit.");
    };

    private _typeGroup = selectRandom ([_lowGroupTypes, _highGroupTypes] select (_i <= _highPatrols));
    private _group = [_spawnPosition, _side, _typeGroup] call A3A_fnc_spawnGroup;
    {[_x, _marker] call A3A_fnc_NATOinit; _soldiers pushBack _x} forEach units _group;
    _groups pushBack _group;

    if ((random 10 < 2.5) and !("Sniper" in _typeGroup#0)) then {
        private _dog = [_group, "Fin_random_F", _spawnPosition, [], 0, "FORM"] call A3A_fnc_createUnit;
        _troops pushBack _dog;
        [_dog] spawn A3A_fnc_guardDog;
        sleep 0.1;
    };

    [_group, "Patrol_Area", 25, 150, 300, false, [], false] call A3A_fnc_patrolLoop; 
};

_storedTroops set [0, (_troopCount) - 2*_numPatrols);
