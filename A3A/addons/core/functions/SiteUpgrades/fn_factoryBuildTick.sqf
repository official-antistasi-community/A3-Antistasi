/*
Maintainer: Shoter
    One income tick of factory production, called from A3A_fnc_resourcecheck.
    Each build at a working factory (rebel-held, not destroyed) loses one tick. A finished vehicle goes to
    A3A_factoryDeliveryQueue, then queued vehicles move into the faction garage while it has free slots.
    HR_GRG_fnc_addVehiclesByClass does not check the garage capacity itself, so the check is done here.
    Built vehicles get no recorded price: refunds and sales treat them like any vehicle without one.

Arguments:
    None

Return Value:
    <ARRAY<STRING>> Classes delivered to the garage this tick

Scope: Server
Environment: Any
Public: No
Dependencies: A3A_fnc_siteLevel, A3A_fnc_siteName, HR_GRG_fnc_addVehiclesByClass, HR_GRG_VehCap, HR_GRG_Vehicles

Example:
    [] call A3A_fnc_factoryBuildTick;
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if !(isServer) exitWith { Error("Attempted to call server function as non-server"); [] };

private _titleStr = localize "STR_A3A_fn_siteUpgrades_title";
private _fnc_name = { getText (configFile >> "CfgVehicles" >> _this >> "displayName") };

private _changed = false;
{
    private _marker = _x;
    private _build = A3A_factoryBuilds get _marker;
    _build params ["_class", "_ticksLeft", "_ticksTotal"];
    // A destroyed factory waits, a lost one has its build discarded by A3A_fnc_siteLevelDrop
    if ([_marker] call A3A_fnc_siteLevel < 1) then { continue };
    _changed = true;
    _ticksLeft = _ticksLeft - 1;
    if (_ticksLeft > 0) then { _build set [1, _ticksLeft]; continue };
    A3A_factoryDeliveryQueue pushBack _class;
    A3A_factoryBuilds deleteAt _marker;
    [_titleStr, format [localize "STR_A3A_fn_siteUpgrades_buildFinished", [_marker] call A3A_fnc_siteName, _class call _fnc_name]] remoteExecCall ["A3A_fnc_customHint", [teamPlayer, civilian]];
} forEach keys A3A_factoryBuilds;
if (_changed) then { publicVariable "A3A_factoryBuilds" };

// Deliver while the garage has room
private _delivered = [];
private _stored = 0;
if (!isNil "HR_GRG_Vehicles") then { { _stored = _stored + count _x } forEach HR_GRG_Vehicles };
private _free = (call HR_GRG_VehCap) - _stored;
while { _free >= 1 and {A3A_factoryDeliveryQueue isNotEqualTo []} } do {
    private _class = A3A_factoryDeliveryQueue deleteAt 0;
    [[_class], ""] call HR_GRG_fnc_addVehiclesByClass;
    _delivered pushBack _class;
    _free = _free - 1;
    [_titleStr, format [localize "STR_A3A_fn_siteUpgrades_buildDelivered", _class call _fnc_name]] remoteExecCall ["A3A_fnc_customHint", [teamPlayer, civilian]];
};
if (A3A_factoryDeliveryQueue isNotEqualTo [] and {_delivered isEqualTo []}) then {
    [_titleStr, format [localize "STR_A3A_fn_siteUpgrades_buildWaiting", count A3A_factoryDeliveryQueue]] remoteExecCall ["A3A_fnc_customHint", [teamPlayer, civilian]];
};
_delivered;
