params ["_marker", "_side"];

private _road = roadAt markerPos _marker;
private _center = getPosATL _road;
private _roadDir = (getRoadInfo _road # 6) getDir (getRoadInfo _road # 7);

private _isSPE = worldname find "SPE" == 0;
private _bunkerType = ["Land_BagBunker_01_Small_green_F", "Land_SPE_Sandbag_Nest"] select _isSPE;

// Bit lazy, create the things to get the vectors
private _buildings = [];
private _spawnPlaces = [];

_spawnPlaces pushBack ["vehicle", _center, _roadDir + 90];

private _bunker1 = _bunkerType createVehicle (_center getPos [7, _roadDir + 270]);
_bunker1 setDir _roadDir;
private _bunker2 = _bunkerType createVehicle (_center getPos [7, _roadDir + 90]);
_bunker2 setDir (_roadDir + 180);

{
    _buildings pushBack [typeof _x, getPosWorld _x, vectorDir _x, vectorUp _x];
    private _staticPos = if (_isSPE) then { _x modelToWorld [-0.200684,-0.91333,-0.421184] } else { getPosATL _x };
    _spawnPlaces pushBack ["staticMG", _staticPos, getDir _x, objNull];        // don't link to bunker. It's not permanent.
    deleteVehicle _x;
} forEach [_bunker1, _bunker2];

// Flag? hmm...

// so we need spawnPlaceStats too?
// but that would be identical for each roadblock at the moment? maybe type-based later

private _garrison = createHashMap;
_garrison set ["buildings", _buildings];
_garrison set ["spawnPlaces", _spawnPlaces];        // special case, we just put the spawn places in the garrison

// war tier dependence?
private _troopQuality = [0.95 + random 0.5 + tierWar/20, 2] select (_side == Invaders);
_garrison set ["troops", [6, _troopQuality]];

private _faction = [A3A_faction_occ, A3A_faction_inv] select (_side == Invaders);
if (random 15 <= tierWar + 3) then {
    private _type = selectRandom (_faction get "staticMGs");
    _garrison set ["statics", [[_type, selectRandom [1,2]]]];
    _garrison set ["vehicles", []];
} else {
    private _type = selectRandom (_faction get "vehiclesMilitiaLightArmed");
    _garrison set ["vehicles", [[_type, 0]]];
    _garrison set ["statics", []];
};

A3A_garrison set [_marker, _garrison];
