/*
Description:
    Server-side function to complete or cancel a construction

Environment: Server, unscheduled
Arguments:
    1. <object> Plank object to complete construction for
    2. <bool> True if completed, false if cancelled
*/

params ["_target", ["_finished", true]];

// Remove from list. Let it clear out nulls
A3A_unbuiltObjects deleteAt (A3A_unbuiltObjects find _target);
publicVariable "A3A_unbuiltObjects";
if (isNull _target) exitWith {};            // Possible if two engineers attempted to construct the same object, or a zeus delete
deleteVehicle _target;

// Cancel case
private _price = _target getVariable ["A3A_build_price", 10];
if (!_finished) exitWith {
    if (_price > 0) then { [0, _price] spawn A3A_fnc_resourcesFIA };
};

// Repair case, just call the repair function
private _repairObj = _target getVariable "A3A_build_repairObj";
if (!isNil "_repairObj") exitWith {
    _repairObj call A3A_fnc_repairRuinedBuilding;
};

// Construction case, spawn the building
private _building = createVehicle [_target getVariable "A3A_build_class", [0,0,0], [], 0, "CAN_COLLIDE"];
_building setPosWorld (_target getVariable "A3A_build_pos");
_building setVectorDirAndUp (_target getVariable "A3A_build_dir");
_building setVariable ["A3A_building", true, true];            // Used to identify removable buildings

A3A_buildingsToSave pushBack _building;
if (_building distance2D "Synd_HQ" < 100) then {A3A_HQDetectionRadius = A3A_HQDetectionRadius + (_price/5)};

// Add to garrison data if it's within one
private _marker = [getPosATL _building] call A3A_fnc_getMarkerForPos;
if (sidesX getVariable _marker == teamPlayer) then { [_marker, _building] call A3A_fnc_garrisonServer_addVehicle }
    else { A3A_buildingsToSave pushBack _building };

// Allowing flagpole construction is probably not a good idea due to how markerChange handles flags atm
if (_className isEqualTo (A3A_faction_reb get "flag")) then {
    _building setFlagTexture (A3A_faction_reb get "flagTexture");
};
