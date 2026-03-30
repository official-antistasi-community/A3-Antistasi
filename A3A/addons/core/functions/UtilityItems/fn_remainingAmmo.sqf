/*
Author: Tiny, adapted from Killerswin2
    find the remaining ammo cargo and returns a precentage 
Arguments:
0.  <object>    Object to find the remaining ammo cargo


Return Value:
    <number>    remaining ammo points

Scope: Clients
Environment: Unscheduled
Public: yes
Dependencies:

Example:
    [_veh] call A3A_fnc_remainingAmmo
*/

params [["_vehicle", objNull, [objNull]]];

private _vehCfg = configFile/"CfgVehicles"/typeOf _vehicle;

if(A3A_hasACE) then {
    private _vehicleMaxAmmo = getNumber (_vehCfg >> "ace_rearm_defaultSupply");
    if(_vehicleMaxAmmo == 0) exitwith {0};
    private _currentAmmoCargo = [_vehicle] call ace_rearm_fnc_getSupplyCount;
    (_currentAmmoCargo / _vehicleMaxAmmo);
} else {
    getAmmoCargo _vehicle;
};