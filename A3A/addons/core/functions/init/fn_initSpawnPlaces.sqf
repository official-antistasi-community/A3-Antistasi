#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
#define SPACING     1

params ["_marker", "_placementMarker"];

private _vehicleMarker = [];
private _heliMarker = [];
private _hangarMarker = [];
private _mortarMarker = [];
private _planeMarker = [];

//Calculating marker prefix
private _markerSplit = _marker splitString "_";
private _markerPrefix = switch (_markerSplit select 0) do
{
    case ("airport"): {_markerPrefix = "airp_";};
    case ("outpost"): {_markerPrefix = "outp_";};
    case ("resource"): {_markerPrefix = "reso_";};
    case ("factory"): {_markerPrefix = "fact_";};
    case ("seaport"): {_markerPrefix = "seap_";};
};
if (count _markerSplit > 1) then
{
    _markerPrefix = format ["%1%2_", _markerPrefix, _markerSplit select 1];
};

//Sort markers
private _markerPos = getMarkerPos _marker;
{
    private _first = (_x splitString "_") select 0;
    private _fullName = format ["%1%2", _markerPrefix, _x];
    if (_markerPos distance (getMarkerPos _fullName) > 500) then
    {
        Error_2("Placementmarker %1 is more than 500 meter away from its mainMarker %2. You may want to check that!", _fullName, _marker);
    };
    switch (_first) do
    {
        case ("vehicle"): {_vehicleMarker pushBack _fullName;};
        case ("helipad"): {_heliMarker pushBack _fullName;};
        case ("hangar"): {_hangarMarker pushBack _fullName;};
        case ("plane"): {_planeMarker pushBack _fullName;};
        case ("mortar"): {_mortarMarker pushBack _fullName;};
    };
    _fullName setMarkerAlpha 0;
} forEach _placementMarker;

if (count _vehicleMarker == 0) then
{
    // Not automatically wrong. Some locations may not have any vehicle places
    Info_1("InitSpawnPlaces: Could not find any vehicle places on %1!", _marker);
};

private _hangars = [];
private _helipads = [];
call {
    private _markerRadius = vectorMagnitude markerSize _marker;
    private _buildings = nearestObjects [getMarkerPos _marker, ["Land_Hangar_F", "Land_TentHangar_V1_F", "Land_Airport_01_hangar_F", "Land_Mil_hangar_EP1", "Land_Ss_hangar", "Land_Ss_hangard", "Land_vn_airport_01_hangar_f", "Land_vn_usaf_hangar_01", "Land_vn_usaf_hangar_02", "Land_vn_usaf_hangar_03"], _markerRadius, true];
    { _hangars pushBack _x } forEach (_buildings inAreaArray _marker);

    _buildings = nearestObjects [getMarkerPos _marker, "Land_vn_helipad_base", "Helipad_Base_F"], _markerRadius, true];
    { _helipads pushBack _x } forEach (_buildings inAreaArray _marker);

    private _heliCount = count _helipads;
    private _hangarCount = count _hangars;

    //Find additional helipads and hangars (maybe a unified system would be better??)
    {
        private _radius = vectorMagnitude markerSize _x;
        private _buildings = nearestObjects [getMarkerPos _x, ["Helipad_Base_F", "Land_vn_helipad_base"], _radius, true];
        { _helipads pushBackUnique _x } forEach (_buildings inAreaArray _x);
    } forEach _heliMarker;

    {
        private _radius = vectorMagnitude markerSize _x;
        private _buildings = nearestObjects [getMarkerPos _x, ["Land_Hangar_F", "Land_TentHangar_V1_F", "Land_Airport_01_hangar_F", "Land_Mil_hangar_EP1", "Land_Ss_hangar", "Land_Ss_hangard", "Land_vn_airport_01_hangar_f", "Land_vn_usaf_hangar_01", "Land_vn_usaf_hangar_02", "Land_vn_usaf_hangar_03"], _radius, true];
        { _hangars pushBackUnique _x } forEach (_buildings inAreaArray _x);
    } forEach _hangarMarker;
    //All additional hangar and helipads found

    if (_heliCount != count _helipads or _hangarCount != count _hangars) then {
        Debug_5("Marker %1 buildings diff: %2;%3 %4;%5", _marker, _heliCount, count _helipads, _hangarCount, count _hangars);
    };
};

private _vehicleSpawns = [];
{
    private _vehMarker = _x;
    private _size = getMarkerSize _x;
    private _width = (_size select 0) * 2;
    private _height = (_size select 1) * 2;
    if(_width < (4 + 2 * SPACING)) then {
        Error_2("InitSpawnPlaces: Marker %1 is not wide enough for vehicles, required are %2 meters!", _x , (4 + 2 * SPACING));
        continue;
    };
    if(_height < 10) then {
        Error_1("InitSpawnPlaces: Marker %1 is not long enough for vehicles, required are 10 meters!", _x);
        continue;
    };

    //Cleaning area
    private _radius = vectorMagnitude _size;
    private _nearObjects = nearestTerrainObjects [markerPos _vehMarker, ["Tree","Bush", "Hide", "Rock", "Fence"], _radius, true]);
    { _x hideObjectGlobal true } foreach (_nearObjects inAreaArray _vehMarker);

    //Create the places
    private _vehicleCount = floor ((_width - SPACING) / (4 + SPACING));
    private _realLength = _vehicleCount * 4;
    private _realSpace = (_width - _realLength) / (_vehicleCount + 1);
    private _markerDir = markerDir _vehMarker;
    for "_i" from 1 to _vehicleCount do
    {
        private _dis = (_realSpace + 2 + ((_i - 1) * (4 + _realSpace))) - (_width / 2);
        private _pos = [getMarkerPos _vehMarker, _dis, (_markerDir + 90)] call BIS_fnc_relPos;
        _pos set [2, ((_pos select 2) + 0.1) max 0.1];
        _vehicleSpawns pushBack [_pos, _markerDir];
    };
} forEach _vehicleMarker;

private _heliSpawns = [];
{
    private _pos = getPosATL _x;
    _pos set [2, 0.4];
    {
        _x hideObjectGlobal true;
    } foreach (nearestTerrainObjects [_pos, ["Tree","Bush", "Hide", "Rock"], 5, true]);
    _heliSpawns pushBack [_pos, direction _x];
} forEach _helipads;

_planeSpawns = [];
{
    private _pos = getPosATL _x;
    _pos set [2, ((_pos select 2) + 0.1) max 0.1];
    private _dir = direction _x;
    if(_x isKindOf "Land_Hangar_F" || {_x isKindOf "Land_Airport_01_hangar_F" || {_x isKindOf "Land_Mil_hangar_EP1" || {_x isKindOf "Land_Ss_hangar" || {_x isKindOf "Land_Ss_hangard" || {_x isKindOf "Land_vn_airport_01_hangar_f" || {_x isKindOf "Land_vn_usaf_hangar_01" || {_x isKindOf "Land_vn_usaf_hangar_02" || {_x isKindOf "Land_vn_usaf_hangar_03"}}}}}}}}) then
    {
        //This hangar is facing the wrong way...
        _dir = _dir + 180;
    };
    _planeSpawns pushBack [_pos, _dir];
} forEach _hangars;

{
    _planeSpawns pushBack [markerPos _x, markerDir _x];
} forEach _planeMarker;

_mortarSpawns = [];
{
    private _pos = getMarkerPos _x;
    _pos set [2, ((_pos select 2) + 0.1) max 0.1];
    _mortarSpawns pushBack [_pos, 0];
} forEach _mortarMarker;

//Debug_2("%1 set to %2", _marker, [_vehicleSpawns, _heliSpawns, _planeSpawns, _mortarSpawns]);

// Final spawn place format is [placetype, pos, dir, (building)]
private _spawnPlaces = [];

// Vehicle slot special cases
if (_markerSplit#0 == "airport") then {
    private _aaPlace = _vehicleSpawns deleteAt 0;
    _spawnPlaces pushBack ["vehicleAA", _aaPlace#0, _aaPlace#1];
};
if (_vehicleSpawns isNotEqualTo []) then {
    private _truckPlace = _vehicleSpawns deleteAt 0;
    _spawnPlaces pushBack ["vehicleTruck", _truckPlace#0, _truckPlace#1];
};

{
    private _placeType = _x#1;
    { _spawnPlaces pushBack [_placeType, _x#0, _x#1] } forEach (_x#0);
} forEach [[_vehicleSpawns, "vehicle"], [_heliSpawns, "heli"], [_planeSpawns, "plane"], [_mortarSpawns, "staticMortar"]];

A3A_spawnPlacesHM set [_marker, _spawnPlaces];

/*
//Create the spawn places and initial used-slot arrays
{
    if (_x#0 isEqualTo []) then { continue };
    private _varName = format ["%1_%2", _marker, _x#1];
    spawner setVariable [_varName + "_places", _x#0, true];
    spawner setVariable [_varName + "_used", (_x#0) apply {false}, true];
} forEach [[_vehicleSpawns, "vehicle"], [_heliSpawns, "heli"], [_planeSpawns, "plane"], [_mortarSpawns, "mortar"]];
*/