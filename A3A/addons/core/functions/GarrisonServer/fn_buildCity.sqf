/*
    Generate spawn place stats for cities
    If not already existing, also select cars and boats to place in city

    Environment: Server, init/load only

    Arguments:
    <STRING> Marker name of town (not spawn key).

    Copyright 2025 John Jordan. All Rights Reserved.
    Used and distributed by the Antistasi Community project with permission.
*/


params ["_marker"];

// If city vehicle data was loaded from save, just bail now
private _spawnKey = _marker + "_civ";
if (_spawnKey in A3A_garrison) then { continue };
private _garrison = createHashMap;
private _vehicles = [];

private _spawnPlaces = A3A_spawnPlacesHM get _spawnKey;
A3A_spawnPlaceStats get _spawnKey get "civCar" params ["_carPlaces", "", "_numParked"];
A3A_spawnPlaceStats get _spawnKey get "civBoat" params ["_boatPlaces", "", "_numBoats"];

for "_i" from 1 to _numParked do {
    private _type = selectRandomWeighted civVehiclesWeighted;
    private _placeNum = _carPlaces deleteAt floor random count _carPlaces;
    _vehicles pushBack [_type, _placeNum];
};

// Boat spawn places aren't deterministic so we use absolute format instead
for "_i" from 1 to _numBoats do {
    private _type = selectRandomWeighted civBoatsWeighted;
    private _placeNum = _boatPlaces deleteAt floor random count _boatPlaces;
    (_spawnPlaces # _placeNum) params ["", "_pos", "_dir"];
    _vehicles pushBack [_type, [_pos, _dir]];
};

_garrison set ["vehicles", _vehicles];
A3A_garrison set [_spawnKey, _garrison];
