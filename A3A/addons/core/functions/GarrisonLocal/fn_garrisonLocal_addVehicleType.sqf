// Spawn single vehicle of specified type in enemy garrison
// Not used for buildings

params ["_marker", "_class", "_slotNum"];

private _garrison = A3A_activeGarrison get _marker;

private _spawnPlace = (A3A_spawnPlacesHM get _marker) # _slotNum;
_spawnPlace params ["_placeType", "_pos", "_dir", "_building"];         // uh, building should be pre-checked?

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

_garrison get "vehicles" pushBack _vehicle;
_vehicle setVariable ["markerX", _marker, true];
[_vehicle, _garrison get "side"] call A3A_fnc_AIVEHinit;

// Set reb crew var in case it's transferred later
if (_vehicle isKindOf "Land" and _vehicle emptyPositions "gunner" > 0) then { _vehicle setVariable ["A3A_rebCrewed", true] };
if ("static" in _placeType or _placeType == "vehicleRB") then {
    _vehicle setVariable ["A3A_crewed", true];
    [_marker] call A3A_fnc_garrisonLocal_updateStatics;
};
