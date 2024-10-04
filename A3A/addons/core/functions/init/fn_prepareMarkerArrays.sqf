#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
private ["_allMarker", "_placementMarker", "_split", "_start", "_data"];

_allMarker = allMapMarkers;
_placementMarker = [];

airportsX = [];
spawnPoints = [];
resourcesX = [];
factories = [];
outposts = [];
seaports = [];
controlsX = [];
seaMarkers = [];
seaSpawn = [];
seaAttackSpawn = [];
detectionAreas = [];

generalPOI = [];

fnc_sortPlacementMarker =
{
  params ["_array", "_split"];
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

  //Seting connection
  _index = _array findIf {(_x select 0) == _type};
  if(_index == -1) then
  {
    _array pushBack [_type, [_name]];
  }
  else
  {
    ((_array select _index) select 1) pushBack _name;
  };
};

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
    case ("control"): {controlsX pushBack _x;};
    case ("poi"): {generalPOI pushBack _x;};
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
    case ("seap"): {[_placementMarker, _split] call fnc_sortPlacementMarker;};

    default
    {
        Error_1("Could not resolve marker %1", _x);
    };
  };
} forEach _allMarker;

//DebugArray("Marker setup done, placement marker are", _placementMarker);

{
    [_x select 0, _x select 1] call A3A_fnc_initSpawnPlaces;
} forEach _placementMarker;

// Autogenerate stuff like helipad placements for markers that don't have any defined spawn places
{
    private _spawnStr = format ["%1_vehicle_used", _x];
    if (isNil { spawner getVariable _spawnStr }) then {
        Debug_1("Generating additional spawn places for %1", _x);
        [_x, []] call A3A_fnc_initSpawnPlaces;
    };
} forEach (airportsX + resourcesX + factories + outposts + seaports);

//TEMPORARY FIX TO DETECT SPAWN MARKERS
{
  _nearestMarker = [spawnPoints, getMarkerPos _x] call BIS_fnc_nearestPosition;
  server setVariable [format ["spawn_%1", _x], _nearestMarker, true];
} forEach airportsX;
