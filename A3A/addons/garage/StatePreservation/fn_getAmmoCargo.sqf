/*
    Author: Tiny
    Description:
        Returns Ammo cargo data for a vehicle

    Arguments:
    0. <Object> Vehicle

    Return Value:
    <Array>
        <Int> Vanilla ammo cargo OR Antistasi ammo cargo
        <Int> ACE ammo cargo
    ] Ammo cargo data

    Scope: Any
    Environment: Any
    Public: Yes
    Dependencies:

    Example: [_veh] call HR_GRG_fnc_getAmmoCargo;

    License: APL-ND
*/
params [["_veh", objNull, [objNull]]];

// This one was new anyway, so returning an empty array or nil is fully backwards compatible
if (getNumber (configOf _veh/"ace_rearm_defaultSupply") <= 0 and getNumber (configOf _veh/"transportAmmo") <= 0) exitWith {[]};

private _baseAmmoCargo = if (HR_GRG_useNewRearmSys) then {
    [_veh, "rearm"] call HR_GRG_getResourceCargo;
} else {
    getAmmoCargo _veh;
};
private _currentACEAmmoCargo = if (A3A_hasAce) then { [_veh] call ace_rearm_fnc_getSupplyCount } else { -1 };

[_baseAmmoCargo,_currentACEAmmoCargo];