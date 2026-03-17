/*
    Generate spawn place stats for cities

    Environment: Server, post-params init/load only

    Copyright 2025 John Jordan. All Rights Reserved.
    Used and distributed by the Antistasi Community project with permission.
*/

{
    private _marker = _x;
    private _spawnKey = _marker + "_civ";
    private _numCiv = 15 * sqrt (A3A_cityPop get _marker);

    private _spawnPlaces = A3A_spawnPlacesHM get _spawnKey;
    private _carPlaces = [];
    private _boatPlaces = [];
    {
        if (_x#0 == "civCar") then { _carPlaces pushBack _forEachIndex; continue };
        if (_x#0 == "civBoat") then { _boatPlaces pushBack _forEachIndex };
    } forEach _spawnPlaces;

    private _numParked = _numCiv * (1/50) * civTraffic;
    _numParked = (ceil _numParked) min count _carPlaces;

    private _numBoats = (_numCiv / 50) min count _boatPlaces;

    private _markerStats = createHashMap;
    _markerStats set ["civCar", [_carPlaces, count _carPlaces, _numParked]];
    _markerStats set ["civBoat", [_boatPlaces, count _boatPlaces, _numBoats]];

    A3A_spawnPlaceStats set [_spawnKey, _markerStats];

} forEach citiesX;
