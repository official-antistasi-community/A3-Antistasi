// Select random road in an elliptical area between two markers
// Skips bridges, dead ends and most junctions

// _exclude is an array of positions that the road shouldn't be within _excludeRad of

//TODO: Improve with navgrid segments prefiltered for dead ends

params ["_mrk1", "_mrk2", ["_exclude", []], ["_excludeRad", 700]];

private _pos1 = markerPos _mrk1;
private _pos2 = markerPos _mrk2;
private _radius = 0.5 * (_pos1 distance2d _pos2);
private _midpoint = (_pos1 vectorAdd _pos2) vectorMultiply 0.5;
private _roads = _midpoint nearRoads _radius;
_roads = _roads inAreaArray [_midpoint, _radius/3, _radius, _pos1 getDir _pos2];

// Prefilter the exclusion list
private _nearExclude = _exclude inAreaArray [_midpoint, _excludeRad+_radius/3, _excludeRad+_radius, _pos1 getDir _pos2];

private _finalRoad = objNull;
while {_roads isNotEqualTo []} do
{
    private _road = _roads deleteAt floor random count _roads;                                  // should be safe since 2.18
    if (_nearExclude inAreaArray [getPosATL _road, _excludeRad, _excludeRad] isNotEqualTo []) then { continue };

    // skip bridges, dead ends and most junctions
    if (getRoadInfo _road # 8 or count roadsConnectedTo [_road, true] != 2 or count (_road nearRoads 10) > 1) then { continue };

	if (true) exitWith {_finalRoad = _road};
};
_finalRoad;
