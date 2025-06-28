// Choose suitable police station building & vehicle spawn in larger towns
// Used if A3A_garrison doesn't have a police station entry already: Usually new campaigns or compat loading
// A3A_garrison should exist with empty vehicles array already

// Need to run this shit even if it's an old game, and civ spawns might be different
// Already have empty spawnPlaceStats and empty vehicles (or full for saves) but not spawnPlaces

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()


private _mapInfo = missionConfigFile/"A3A"/"mapInfo"/toLower worldName;
if (!isClass _mapInfo) then {_mapInfo = configFile/"A3A"/"mapInfo"/toLower worldName};

private _policeStationTypes = getArray (_mapInfo/"policeStationTypes");
if (_policeStationTypes isEqualTo []) exitWith {
	Error("No police station types found in mapInfo for this map. No police stations will be generated");
};

private _policeSpawnStats =  createHashMapFromArray [ ["vehiclePolice", [[0], 1, 1]] ];


// Alternative: Do not save spawn places for police stations
// Regen here and delete the vehicles if it disappeared
// Fewer code paths, better?
{
	private _city = _x;
    private _garrison = A3A_garrison get _city;
    _garrison set ["spawnPlaces", []];                                      // not initialized elsewhere
    if (A3A_garrisonSize get _city < 10) then { continue };                 // don't generate for small towns

    private _stationPos = _garrison get "policeStation";
    if (isNil "_stationPos") then {
        private _buildings = nearestTerrainObjects [markerPos _city, ["House"], 100];
        _buildings = _buildings select { typeOf _x in _policeStationTypes } select { alive _x };        // isKindOf matching would pick up abandoned buildings
        if (_buildings isEqualTo []) then {
            Info_1("No suitable buildings for police station in %1", _city);
            continue;
        };
        _stationPos = getPosATL selectRandom _buildings;
        _garrison set ["policeStation", _stationPos];         // only need one entry? Hmm. LootCD & intelCD go elsewhere.

        if (sidesX getVariable _city == Occupants) then {
            private _carType = selectRandom (A3A_faction_occ get "vehiclesPolice");
            _garrison get "vehicles" pushBack [_carType, 0];
        };
    };
    // If we're loading from a save, police station might already be destroyed
    if (_stationPos isEqualType false) then { continue };

    private _station = nearestBuilding _stationPos;
    _station setVariable ["A3A_policeStation", _city];          // So we can detect destruction

    // Use closest city spawn place within 50m for police car
    private _places = A3A_spawnPlacesHM get (_city + "_civ") select { _x#0 == "civCar" };
    private _placePositions = _places apply { _x#1 };
    private _nearPlaces = _placePositions inAreaArrayIndexes [getPosATL _station, 50, 50] apply { _places # _x };
    if (_nearPlaces isEqualTo []) then { continue };            // rely on cleanup to get rid of excess vehicle

    private _distances = _nearPlaces apply { _x#1 distance2d _station };
    private _minPlace = _nearPlaces select (_distances find selectMin _distances);

    _minPlace set [0, "vehiclePolice"];                         // no longer civCar, so buildCity won't use it
    _garrison set ["spawnPlaces", [_minPlace]];                 // need this because it's post-initZones
    A3A_spawnPlaceStats set [_city, _policeSpawnStats];
    A3A_garrisonSize set [_city, (A3A_garrisonSize get _city) + 4];     // need more police to fill a station

} forEach citiesX;


// better way of placing vehicle outside building:

// in each cardinal direction, start from bbreal + 5m, then raycast inwards
// hmm, might not find roads necessarily
// better to 


/*
{
	private _city = _x;
    if (A3A_garrisonSize get _city < 10) then { continue };                 // don't generate for small towns

    private _garrison = A3A_garrison get _city;
    private _stationPos = 
    if ("policeStation" in _garrison) then {
        // Need to mark off civ spawn places if matching
        A3A_spawnPlaceStats set [_city, _policeSpawnStats];
        private _policePositions = (_garrison get "spawnPlaces") apply {_x#1};
        private _civPlaces = A3A_spawnPlacesHM get (_city + "_civ") select { _x#0 == "civCar" };
        {
            if (_policePositions inAreaArray [_x#0, 10, 10] isEqualTo []) then { continue };
            _x set [0, "vehiclePolice"];
        } forEach _civPlaces;
        continue;
    };

    private _buildings = nearestTerrainObjects [markerPos _city, ["House"], 100];
    _buildings = _buildings select { typeOf _x in _policeStationTypes } select { alive _x };        // isKindOf matching would pick up abandoned buildings
    if (_buildings isEqualTo []) then {
        Info_1("No suitable buildings for police station in %1", _city);
        continue;
    };
    private _station = selectRandom _buildings;		            // or do we try to do priority order?
    _garrison set ["policeStation", getPosATL _station];         // only need one entry? Hmm. LootCD & intelCD go elsewhere.

    _station setVariable ["A3A_policeStation", _city];          // So we can detect destruction

    // Use closest city spawn place within 50m for police car
    private _places = A3A_spawnPlacesHM get (_city + "_civ") select { _x#0 == "civCar" };
    private _placePositions = _places apply { _x#1 };
    private _nearPlaces = _placePositions inAreaArrayIndexes [getPosATL _station, 50, 50] apply { _places # _x };
    if (_nearPlaces isEqualTo []) then { continue };

    private _distances = _nearPlaces apply { _x#1 distance2d _station };
    private _minPlace = _nearPlaces select (_distances find selectMin _distances);

    _minPlace set [0, "vehiclePolice"];       // no longer civCar
    _garrison set ["spawnPlaces", [_minPlace]];                 // need this because it's post-initZones
    A3A_spawnPlaceStats set [_city, _policeSpawnStats];

    private _carType = selectRandom (A3A_faction_occ get "vehiclesPolice");
    _garrison set ["vehicles", [[_carType, 0]] ];

} forEach citiesX;
*/