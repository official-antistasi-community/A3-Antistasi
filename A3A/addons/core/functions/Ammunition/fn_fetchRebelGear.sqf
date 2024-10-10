/*
    Ensures A3A_rebelGear, A3A_rebelLoadouts and related caches are locally valid and updated for equipping rebel AIs

Parameters:
    None, returns nothing

Environment:
    Scheduled, executed locally
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

// Send current version of rebelGear from server if we're out of date
private _updateGear = isNil "A3A_rebelGear" or { A3A_rebelGear get "Version" != A3A_rebelGearVersion };
private _updateLoadouts = isNil "A3A_rebelLoadouts" or { A3A_rebelLoadouts get "Version" != A3A_rebelLoadoutsVersion };
if !(_updateGear or _updateLoadouts) exitWith {};

if (_updateGear) then {
    Info("Fetching new version of rebelGear data...");
    [clientOwner, "A3A_rebelGear"] remoteExecCall ["publicVariableClient", 2];
};
if (_updateLoadouts) then {
    Info("Fetching new version of rebelLoadouts data...");
    [clientOwner, "A3A_rebelLoadouts"] remoteExecCall ["publicVariableClient", 2];
};
waitUntil { sleep 0.5;
    !isNil "A3A_rebelGear" and { A3A_rebelGear get "Version" == A3A_rebelGearVersion }
    and !isNil "A3A_rebelLoadouts" and { A3A_rebelLoadouts get "Version" == A3A_rebelLoadoutsVersion };
};
Info("New version of rebelGear data received");

// Create/clear local accessory-compatibility caches
if (_updateGear) then {
    A3A_rebelOpticsCache = createHashMap;
    A3A_rebelFlashlightsCache = createHashMap;
};
