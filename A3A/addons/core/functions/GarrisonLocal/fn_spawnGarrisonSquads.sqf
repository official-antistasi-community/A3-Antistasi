/*
    Spawn remaining troops in garrison as squads
    Worker function for spawnGarrison, runs on server and HCs
*/

params ["_activeGarrison", "_marker", "_side", "_storedTroops"];
private _faction = Faction(_side);
private _markerPos = markerPos _marker;

private _groups = _activeGarrison get "groups";
private _troops = _activeGarrison get "troops";

private _squads = [];

if (_side == teamPlayer) then
{
    // Convert stored troop types into squads with at least one medic & one squad leader in each
    private _medicType = _faction get "unitMedic";
    private _slType = _faction get "unitSL";
    private _squadCount = ceil (count _storedTroops / 8);
    private _medicCount = { _x == _medicType } count _storedTroops;
    private _slCount = { _x == _slType } count _storedTroops;

    private _remainder = _storedTroops - [_medicType, _slType];
    for "_i" from _squadCount to (_medicCount-1) do { _remainder pushBack _medicType };
    for "_i" from _squadCount to (_slCount-1) do { _remainder pushBack _slType };
    _remainder = _remainder call BIS_fnc_arrayShuffle;

    for "_i" from 1 to _squadCount do {
        private _squad = [];
        if (_slCount <= _i) then { _squad pushBack _slType };
        if (_medicCount <= _i) then { _squad pushBack _medicType };
        while { count _squad < 8 and count _remainder > 0 } do {
            _squad pushBack (_remainder deleteAt 0);
        };
        _squads pushBack _squad;
    };
}
else
{
    // Randomly select squads of appropriate quality
    _storedTroops params ["_troopCount", "_quality"];
    private _squadTypes = [[_faction get "groupPoliceSquad"], _faction get "groupsMilitiaSquads", _faction get "groupsSquads", _faction get "groupSpecOpsRandom"];
    private _numTotal = 0;
    private _numHigh = 0;
    private _highSquad = 0.5 >= _quality%1;
    while { _numTotal < _troopCount } do {
        private _squad = selectRandom (_squadTypes # ([floor _quality, ceil _quality] select _highSquad));
        _squads pushBack _squad;
        if (_numTotal + count _squad >= _troopCount) exitWith { _squad resize (_troopCount - _numTotal) };
        if (_highSquad) then { _numHigh = _numHigh + count _squad };
        _numTotal = _numTotal + count _squad;
        _highSquad = (_numHigh / _numTotal) >= _quality%1;
    };
};)
(
// Spawn the squads
private _fnc_initUnit = [A3A_fnc_NATOinit, A3A_fnc_FIAinitBases] select (_side == teamPlayer);
{
	private _curGroup = createGroup teamPlayer;
    {
        private _unit = [_curGroup, _unitType, _markerPos, [], 0, "NONE"] call A3A_fnc_createUnit;
        [_unit, _marker] call _fnc_initUnit;
        sleep 0.1;
    } forEach _x;
    _groups pushBack _curGroup;
    _troops append units _curGroup;

    // Add to Patcom
    if (_forEachIndex == 0) then {
        private _markerSize = [_marker] call A3A_fnc_sizeMarker;
        private _extraGroups = [_curGroup, _markerPos, _markerSize] call A3A_fnc_patrolGroupGarrison;
        _groups append _extraGroups;
    } else {
        [_curGroup, "Patrol_Defend", 0, 150, -1, true, _markerPos, false] call A3A_fnc_patrolLoop;
    };
} forEach _squads;
