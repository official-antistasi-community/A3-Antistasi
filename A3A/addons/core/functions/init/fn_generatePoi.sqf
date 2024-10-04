if (!isServer) exitWith {};         // TODO: throw error

params ["_marker", "_rbPositions"];
private _markerPos = markerPos _marker;
private _nearRB = _rbPositions inAreaArray [_markerPos, 1500, 1500];                    // everything that could potentially be within 1km
if (_nearRB inAreaArray [_markerPos, 500, 500] isNotEqualTo []) exitWith {};            // no solution in this case
if (count (_nearRB inAreaArray [_markerPos, 1200, 1200]) >= 3) exitWith {};             // probably no solutions here either

private _roads = (_markerPos nearRoads 500) - (_markerPos nearRoads 400);               // surprisingly faster than loop-until-found

private _road = objNull;
while {_roads isNotEqualTo []} do
{
    _road = _roads deleteAt floor random count _roads;                                  // can return nil because random 1000 occasionally returns 1000
    if (isNil "_road") then {continue};                                                 // this is faster than selectRandom + find

    // skip bridges, dead ends and most junctions
    if (getRoadInfo _road # 8 or count roadsConnectedTo [_road, true] != 2 or count (_road nearRoads 10) > 1) then {continue};

    private _posroad = getPosATL _road;
    if (_nearRB inAreaArray [_posroad, 1000, 1000] isNotEqualTo []) then { continue };
 
    private _mrk = createmarkerLocal [format ["control_%1", 100 + count controlsX], _posroad];
    _mrk setMarkerSizeLocal [30,30];
    _mrk setMarkerShapeLocal "RECTANGLE";
    _mrk setMarkerBrushLocal "SOLID";
    _mrk setMarkerColorLocal colorTeamPlayer;
    if (not debug) then {_mrk setMarkerAlpha 0};
    _mrk setMarkerText _mrk;

    sidesX setVariable [_mrk, sidesX getVariable _marker, true];
    controlsX pushBack _mrk;
    markersX pushBack _mrk;
    spawner setVariable [_mrk,2,true];
    _rbPositions pushBack _posroad;
    break;
};
