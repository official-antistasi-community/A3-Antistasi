/*
    Spawn remaining troops in garrison as squads
    Worker function for spawnGarrison, runs on server and HCs
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_activeGarrison", "_marker", "_side", "_storedTroops", "_init"];

private _totalTroops = if (_side == teamPlayer) then { count _storedTroops } else { _storedTroops # 0 };
if (_totalTroops == 0) exitWith {};

private _faction = Faction(_side);
private _markerPos = markerPos _marker;
private _type = _activeGarrison get "type";
private _groups = _activeGarrison get "groups";
private _troops = _activeGarrison get "troops";
private _markerRad = vectorMagnitude markerSize _marker;
private _squadRad = markerSize _marker # 0 min markerSize _marker # 1;


// Calculate size of building squad, if any
private _garrSize = floor (2 * sqrt (A3A_garrisonSize get _marker) min (_totalTroops / 2));
private _buildingPlaces = [_marker, _markerRad, _garrSize] call A3A_fnc_patrolGetBuildingPlaces;
Debug_3("Found %1 building places out of %2 for %3 troops", count _buildingPlaces, _garrSize, _totalTroops);

// Add sniper places in radio towers
private _sniperCount = if (_side != teamPlayer) then {
    private _buildings = nearestObjects [_markerPos, keys A3A_sniperBuildings, _markerRad] inAreaArray _marker;
    {
        private _relPos = A3A_sniperBuildings get typeof _x;
        _buildingPlaces pushBack [_x modelToWorld _relPos, random 360];
    } forEach _buildings;

    reverse _buildingPlaces;        // use these first
    count _buildings;
};
_garrSize = _garrSize min count _buildingPlaces;        // might have found fewer places


private _squads = [];
if (_side == teamPlayer) then
{
    // Convert stored troop types into squads with at least one medic & one squad leader in each
    private _medicType = _faction get "unitMedic";
    private _slType = _faction get "unitSL";
    private _squadCount = ceil ((count _storedTroops - _garrSize) / 6);
    private _medicCount = { _x == _medicType } count _storedTroops;
    private _slCount = { _x == _slType } count _storedTroops;

    private _remainder = _storedTroops - [_medicType, _slType];
    for "_i" from _squadCount to (_medicCount-1) do { _remainder pushBack _medicType };
    for "_i" from _squadCount to (_slCount-1) do { _remainder pushBack _slType };

    for "_i" from 1 to _squadCount do {
        private _squad = [];
        if (_slCount >= _i) then { _squad pushBack _slType };
        if (_medicCount >= _i) then { _squad pushBack _medicType };

        while { count _squad < 6 and count _remainder > _garrSize } do {
            _squad pushBack (_remainder deleteAt floor random count _remainder);
        };
        _squads pushBack _squad;
    };
    _squads pushBack _remainder;        // just use the rest for the buildings
    reverse _squads;
}
else
{
    // Randomly select squads of appropriate quality
    _storedTroops params ["_troopCount", "_quality"];
    private _squadTypes = [[_faction get "groupPoliceSquad"], _faction get "groupsMilitiaSquads", _faction get "groupsSquads", _faction get "groupSpecOpsRandom"];
    private _numTotal = 0;
    private _numHigh = 0;
    private _highSquad = 0.5 < _quality%1;
    private _garrSquad = [];
    while { _numTotal < _troopCount } do {

        private _squad = selectRandom (_squadTypes # ([floor _quality, ceil _quality] select _highSquad));
        _squad = _squad select [0, _troopCount - _numTotal];                // clip to troop count
        if (count _garrSquad < _garrSize) then {
            _squad = _squad select [0, _garrSize - count _garrSquad];       // clip to garrison size
            _garrSquad append _squad;
        } else {
            _squads pushBack _squad;
        };

        // Quality rebalancing
        if (_highSquad) then { _numHigh = _numHigh + count _squad };
        _numTotal = _numTotal + count _squad;
        _highSquad = (_numHigh / _numTotal) < _quality%1;
    };
    _squads pushBack _garrSquad;
    reverse _squads;

    // Replace garrison squad with snipers for high positions
    for "_i" from 1 to (_sniperCount min count _garrSquad) do {
        _garrSquad set [_i, _faction get "unitMarksman"];
    };
};
Debug_1("Squads: %1", _squads);


// Spawn the squads
private _fnc_initUnit = [A3A_fnc_NATOinit, A3A_fnc_FIAinitBases] select (_side == teamPlayer);
{
	private _curGroup = createGroup _side;
    {
        private _unit = [_curGroup, _x, _markerPos, [], 0, "NONE"] call A3A_fnc_createUnit;
        [_unit, _marker] call _fnc_initUnit;
        sleep 0.1;
    } forEach _x;
    _curGroup deleteGroupWhenEmpty true;
    _groups pushBack _curGroup;
    _troops append units _curGroup;

    if (_init and _garrSize > 0 and _forEachIndex == 0) then {
        Debug_2("Placing squad in buildings: %1, %2", _x, _buildingPlaces);
        [_curGroup, _buildingPlaces] call A3A_fnc_patrolGroupGarrison;
    } else {
        Debug_1("Placing squad in marker: %1", _x);
        private _spawnPos = [_markerPos, 0, _squadRad, 3.5] call A3A_fnc_findPatrolPos;
        { _x setVehiclePosition [_spawnPos, [], 3, "NONE"] } forEach units _curGroup;
        [_curGroup, "Patrol_Defend", 0, _squadRad, -1, true, _markerPos, false] call A3A_fnc_patrolLoop;

        // Add UAV if it's a specops roaming group
        if (_type == "camp" and _faction get "uavsPortable" isNotEqualTo []) then
        {
    		private _typeVeh = selectRandom (_faction get "uavsPortable");
			private _uav = createVehicle [_typeVeh, getPosATL leader _curGroup, [], 0, "FLY"];
			[_side, _uav] call A3A_fnc_createVehicleCrew;
			(_garrison get "vehicles") pushBack _uav;
            _troops append crew _uav;
            crew _uav joinSilent _curGroup;             // deletes the previous group
        };
    };
} forEach _squads;
