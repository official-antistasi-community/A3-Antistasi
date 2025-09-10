#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private _allMarker = allMapMarkers;
private _placeMarkers = createHashMap;

airportsX = [];
spawnPoints = [];
resourcesX = [];
factories = [];
outposts = [];
seaports = [];
seaMarkers = [];
seaSpawn = [];
seaAttackSpawn = [];
detectionAreas = [];
A3A_mapRoadblocks = [];
A3A_mapCamps = [];

fnc_sortPlacementMarker =
{
  params ["_split"];
  private ["_type", "_number", "_start", "_index", "_name"];

  //Calculating linked main marker
  _type = "";
  switch (_split select 0) do
  {
    case ("airp"): {_type = "airport";};
    case ("outp"): {_type = "outpost";};
    case ("reso"): {_type = "resource";};
    case ("fact"): {_type = "factory";};
    case ("seap"): {_type = "seaport";};
  };

  _number = parseNumber (_split select 1);
  _start = 1;
  if(_number != 0) then
  {
    //There is no outpost_0 or something
    _start = 2;
    _type = format ["%1_%2", _type, _number];
  };

  //Build name
  _name = _split select _start;
  for "_i" from (_start + 1) to ((count _split) - 1) do
  {
    _name = format ["%1_%2", _name, _split select _i];
  };

  //Setting connection
  (_placeMarkers getOrDefault [_type, [], true]) pushBack _name;
};

private ["_split", "_start"];
{
  _split = _x splitString "_";
  _start = _split select 0;
  switch (toLower _start) do
  {
    //Detect main marker
    case ("airport"): {airportsX pushBack _x;};
    case ("spawnpoint"): {spawnPoints pushBack _x;};
    case ("resource"): {resourcesX pushBack _x;};
    case ("factory"): {factories pushBack _x;};
    case ("outpost"): {outposts pushBack _x;};
    case ("seaport"): {seaports pushBack _x;};
    case ("control"): {if (isOnRoad markerPos _x) then {A3A_mapRoadblocks pushBack _x} else {A3A_mapCamps pushBack _x}};
    case ("seapatrol"): {seaMarkers pushBack _x;};
    case ("seaspawn"): {seaSpawn pushBack _x;};
    case ("seaattackspawn"): {seaAttackSpawn pushBack _x;};
    case ("detectplayer"): {detectionAreas pushBack _x;};

    //Following marker are handled elsewhere
    case ("respawn");
    case ("dummyupsmonmarker");
    case ("nato");
    case ("csat");
    case ("synd"): {};

    //Detect placement marker
    case ("airp");
    case ("reso");
    case ("fact");
    case ("outp");
    case ("seap"): {[_split] call fnc_sortPlacementMarker;};

    default
    {
        Error_1("Could not resolve marker %1", _x);
    };
  };
} forEach _allMarker;

//DebugArray("Marker setup done, placement marker are", _placementMarker);




private _majorMarkers = (airportsX + resourcesX + factories + outposts + seaports);

// Autogenerate stuff like helipad placements for markers that don't have any defined spawn places
A3A_spawnPlacesHM = createHashMap;
{
    [_x, _placeMarkers getOrDefault [_x, []]] call A3A_fnc_initSpawnPlaces;
} forEach _majorMarkers;


//TEMPORARY FIX TO DETECT SPAWN MARKERS
{
  _nearestMarker = [spawnPoints, getMarkerPos _x] call BIS_fnc_nearestPosition;
  server setVariable [format ["spawn_%1", _x], _nearestMarker, true];
} forEach airportsX;

