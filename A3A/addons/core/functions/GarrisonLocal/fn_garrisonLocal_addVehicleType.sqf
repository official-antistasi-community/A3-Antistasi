// Spawn single vehicle of specified type in enemy garrison

params ["_marker", "_class", "_slotType", "_slotNum"];

private _garrison = A3A_activeGarrison get _marker;

private _spawnPlace = (A3A_spawnPlacesHM get _marker) # _slotNum;
_spawnPlace params ["_placeType", "_pos", "_dir", "_building"];

// TODO: block conditions for vehicles? Anything nearby that's not markerX?
/*private _blockers = _pos nearEntities ["StaticWeapon", 2];
if (_blockers isNotEqualTo []) then {
    Error_3("Spawn of %1 in %2 blocked by %3", _class, _marker, typeof (_blockers#0));
    continue;
};*/

private _vehicle = objNull;
isNil {
    _vehicle = createVehicle [_class, _pos, [], 0, "CAN_COLLIDE"];
    _vehicle setDir _dir;
};
//if (_side != teamPlayer and _placeType in ["vehicleAA", "boat"]) then { _fullCrew = true };

_garrison get _slotType pushBack _vehicle;          // should be broad vehicles/statics/buildings?
_vehicle setVariable ["markerX", _marker, true];
[_vehicle, _garrison get "side"] call A3A_fnc_AIVEHinit;

// could fire updateStatics
