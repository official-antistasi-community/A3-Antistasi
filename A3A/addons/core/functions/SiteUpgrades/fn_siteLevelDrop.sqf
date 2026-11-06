/*
Maintainer: Shoter
    Lowers a site's upgrade level by one after the enemy took it from the rebels.
    Removes the building of the lost level when it had one (3, 5, 7), the buildings of lower levels stay.
    Kits in transit are left alone, their install refuses them and they can only be returned.
    Called from A3A_fnc_markerChange right after the side change.

Arguments:
    <STRING> Site marker

Return Value:
    <SCALAR> New stored level

Scope: Server
Environment: Unscheduled
Public: No
Dependencies: A3A_fnc_siteLevel, A3A_fnc_siteLevelSet, A3A_fnc_siteName

Example:
    [_marker] call A3A_fnc_siteLevelDrop;
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if !(isServer) exitWith { Error("Attempted to call server function as non-server"); 0 };
params [["_marker", "", [""]]];

private _level = [_marker, false] call A3A_fnc_siteLevel;
if (_level == 0) exitWith { 0 };

private _newLevel = _level - 1;
[_marker, _newLevel] call A3A_fnc_siteLevelSet;

// A factory lost mid-build loses the build. Finished vehicles waiting for the garage are kept
if (_marker in A3A_factoryBuilds) then {
    A3A_factoryBuilds deleteAt _marker;
    publicVariable "A3A_factoryBuilds";
};

if (_level in [3, 5, 7]) then {
    private _key = format ["%1|%2", _marker, _level];
    private _building = A3A_siteBuildings getOrDefault [_key, objNull];
    A3A_siteBuildings deleteAt _key;
    A3A_siteBuildingData deleteAt _key;
    if (!isNull _building) then { deleteVehicle _building };
};

[localize "STR_A3A_fn_siteUpgrades_title", format [localize "STR_A3A_fn_siteUpgrades_levelLost", [_marker] call A3A_fnc_siteName, _newLevel]] remoteExec ["A3A_fnc_customHint", teamPlayer];
Info_3("Site %1 lost a level: %2 -> %3", _marker, _level, _newLevel);
_newLevel;
