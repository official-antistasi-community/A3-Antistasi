// Select cars and boats to place in new city
// Will avoid placing anything near police spawns

params ["_marker"];

private _spawnKey = _marker + "_civ";
private _garrison = createHashMap;
private _vehicles = [];

private _numCiv = server getVariable _marker select 0;
_numCiv = 15 * sqrt _numCiv;

// build positions of police spawns for same city so we can block them from use
private _policeSpawns = A3A_garrison get _marker getOrDefault ["spawnPlaces", []] apply { _x#1 };

private _spawnPlaces = A3A_spawnPlacesHM get _spawnKey;
private _carPlaces = [];
private _boatPlaces = [];
{
    if (_policeSpawns inAreaArray [_x#1, 10, 10] isNotEqualTo []) then { continue };
    if (_x#0 == "vehicle") then { _carPlaces pushBack _forEachIndex; continue };
    _boatPlaces pushBack _forEachIndex;
} forEach _spawnPlaces;


private _numParked = _numCiv * (1/50) * civTraffic;
_numParked = (ceil _numParked) min count _carPlaces;

for "_i" from 1 to _numParked do {
    private _type = selectRandomWeighted civVehiclesWeighted;
    private _placeNum = _carPlaces deleteAt floor random count _carPlaces;
    _vehicles pushBack [_type, _placeNum];
};


private _numBoats = ceil (count _boatPlaces / 2);       // should be max 5 overall

for "_i" from 1 to _numBoats do {
    private _type = selectRandomWeighted civBoatsWeighted;
    private _placeNum = _boatPlaces deleteAt floor random count _boatPlaces;
    _vehicles pushBack [_type, _placeNum];
};


_garrison set ["vehicles", _vehicles];
A3A_garrison set [_spawnKey, _garrison];
