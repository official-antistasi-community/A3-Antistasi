// Set up spawn place stats for reinforcements
// If not already existing, select cars and boats to place in city
// Will avoid placing anything near police spawns

params ["_marker"];

private _spawnKey = _marker + "_civ";
private _numCiv = server getVariable _marker select 0;
_numCiv = 15 * sqrt _numCiv;

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


// If city vehicle data was loaded from save, just bail now
if (_spawnKey in A3A_garrison) then { continue };           
private _garrison = createHashMap;
private _vehicles = [];

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
    _vehicles pushBack [_type, _pos, _dir];
};

_garrison set ["vehicles", _vehicles];
A3A_garrison set [_spawnKey, _garrison];
