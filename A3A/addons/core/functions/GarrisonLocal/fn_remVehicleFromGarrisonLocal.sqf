params ["_marker", "_vehicle"];

// Will happen if the vehicle was deleted immediately after. Probably not an issue.
if (isNull _vehicle) exitWith {};

private _garrison = A3A_activeGarrison get _marker;

private _arrayType = call {
    if (_vehicle isKindOf "StaticWeapon") exitWith {"statics"};
    if (fullCrew [_vehicle, "", true] isNotEqualTo []) exitWith {"vehicles"};
    "buildings";
};
private _array = _garrison get _arrayType;
_array deleteAt (_array find _vehicle);
