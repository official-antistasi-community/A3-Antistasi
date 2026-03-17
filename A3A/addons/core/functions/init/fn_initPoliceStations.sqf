/*
    Choose suitable police station building & vehicle spawn in larger towns

    Environment: Init only
    Arguments: None

    Copyright 2025 John Jordan. All Rights Reserved.
    Used and distributed by the Antistasi Community project with permission.
*/

// Need to run this shit even if it's a saved game, because police station options might improve
// spawnPlaceStats is initialized to 1-vehicle
// police station pos, spawnplaces and vehicles may exist in saves, should be coherent

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()


private _mapInfo = missionConfigFile/"A3A"/"mapInfo"/toLower worldName;
if (!isClass _mapInfo) then {_mapInfo = configFile/"A3A"/"mapInfo"/toLower worldName};

private _policeStationTypes = getArray (_mapInfo/"policeStationTypes");
if (_policeStationTypes isEqualTo []) exitWith {
	Error("No police station types found in mapInfo for this map. No police stations will be generated");
};

// Create police station data if there isn't one in the city
{
	private _city = _x;
    private _garrison = A3A_garrison get _city;
    if ("policeStation" in _garrison) then { continue };
    if (A3A_garrisonSize get _city < 10) then { continue };                 // don't generate for small towns

    private _buildings = nearestTerrainObjects [markerPos _city, ["House", "Building"], 100];       // CUP needs "Building"
    _buildings = _buildings select { typeOf _x in _policeStationTypes } select { alive _x };        // isKindOf matching would pick up abandoned buildings
    if (_buildings isEqualTo []) then {
        // Try again with slightly larger radius
        Trace_1("Expanding search radius in %1", _city);
        _buildings = nearestTerrainObjects [markerPos _city, ["House", "Building"], 150];
        _buildings = _buildings select { typeOf _x in _policeStationTypes } select { alive _x };
    };
    if (_buildings isEqualTo []) then {
        Info_1("No suitable buildings for police station in %1", _city);
        continue;
    };

    private _types = _buildings apply { typeOf _x };
    Trace_2("Police stations types in %1: %2", _city, _types arrayIntersect _types);

    _stationPos = getPosATL selectRandom _buildings;
    _garrison set ["policeStation", _stationPos];         // only need one entry? Hmm. LootCD & intelCD go elsewhere.

    // Use closest city spawn place within 50m for police car
    private _places = A3A_spawnPlacesHM get (_city + "_civ") select { _x#0 == "civCar" };
    private _placePositions = _places apply { _x#1 };
    private _nearPlaces = _placePositions inAreaArrayIndexes [_stationPos, 50, 50] apply { _places # _x };
    if (_nearPlaces isEqualTo []) then { _garrison set ["spawnPlaces", []]; continue };

    private _distances = _nearPlaces apply { _x#1 distance2d _stationPos };
    private _minPlace = _nearPlaces select (_distances find selectMin _distances);
    _garrison set ["spawnPlaces", [["vehiclePolice", _minPlace#1, _minPlace#2]] ];

    private _citySide = sidesX getVariable _city;
    if (_citySide != teamPlayer) then {
        private _carType = selectRandom (Faction(_citySide) get "vehiclesPolice");
        _garrison get "vehicles" pushBack [_carType, 0];
    };

} forEach citiesX;


// netId -> city marker name for destruction detection
A3A_policeStations = createHashMap;

// city marker -> [stationPos, carPos] mostly for client undercover
A3A_cityPoliceData = createHashMap;

// Then update the temporary accounting data
{
	private _city = _x;
    private _garrison = A3A_garrison get _city;

    // need to clear spawnPlaceStats & vehicles here if there isn't a car pos...
    private _spawnPlaces = _garrison getOrDefault ["spawnPlaces", []];
    private _carPlacePos = if (_spawnPlaces isEqualTo []) then {false} else {_spawnPlaces#0#1};
    if (_carPlacePos isEqualType false) then {
        A3A_spawnPlaceStats set [_city, createHashMap];
        _garrison set ["vehicles", []];                 // probably is already, but whatever
    };

    // If we're loading from a save, police station might already be destroyed
    private _stationPos = _garrison getOrDefault ["policeStation", false];
    if (_stationPos isEqualType []) then {
        A3A_garrisonSize set [_city, (A3A_garrisonSize get _city) + 4];             // need more police to fill a station
        A3A_policeStations set [netId nearestBuilding _stationPos, _city];          // So we can detect destruction
    };

    A3A_cityPoliceData set [_city, [_stationPos, _carPlacePos]];

} forEach citiesX;

publicVariable "A3A_cityPoliceData";
