/*
    Author: Tiny
    Description:
        Returns Ammo cargo data for a vehicle

    Arguments:
    0. <Object> Vehicle

    Return Value:
    <Array>
        <Int> Vanilla ammo cargo
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

private _baseAmmoCargo = getAmmoCargo _veh;
private _currentACEAmmoCargo = if (A3A_hasAce) then { [_veh] call ace_rearm_fnc_getSupplyCount } else { -1 };

[_baseAmmoCargo,_currentACEAmmoCargo];