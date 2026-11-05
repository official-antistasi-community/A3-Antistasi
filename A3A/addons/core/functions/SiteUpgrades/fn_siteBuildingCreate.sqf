/*
Maintainer: Shoter
    Creates the building of a site upgrade level (3, 5 or 7) and registers it. Replaces an older building of the same level.
    The building takes no damage and does not carry the level: the stored level decides, the building only shows it.
    Deleting it (Zeus, cleanup) only forgets the object, its position stays in A3A_siteBuildingData and the next load rebuilds it.

Arguments:
    <STRING> Site marker
    <SCALAR> Level 3, 5 or 7
    <ARRAY> Position (getPosWorld format)
    <ARRAY> vectorDir [DEFAULT = [0,1,0]]
    <ARRAY> vectorUp [DEFAULT = [0,0,1]]

Return Value:
    <OBJECT> The building, objNull on failure

Scope: Server
Environment: Unscheduled
Public: No
Dependencies:
    A3A_siteUpgradeBuildings, A3A_siteBuildings, A3A_siteBuildingData

Example:
    [_marker, 3, getPosWorld _ghost, vectorDir _ghost, vectorUp _ghost] call A3A_fnc_siteBuildingCreate;
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if !(isServer) exitWith { Error("Attempted to call server function as non-server"); objNull };
params [["_marker", "", [""]], ["_level", 0, [0]], ["_posWorld", [], [[]]], ["_vecDir", [0,1,0], [[]]], ["_vecUp", [0,0,1], [[]]]];

private _type = [_marker] call A3A_fnc_siteType;
private _key = format ["%1|%2", _marker, _level];
private _class = A3A_siteUpgradeBuildings getOrDefault [format ["%1|%2", _type, _level], ""];
if (_class == "") exitWith { Error_2("No site building for %1 level %2", _marker, _level); objNull };
if (count _posWorld != 3) exitWith { Error_2("Bad site building position for %1: %2", _key, _posWorld); objNull };

private _old = A3A_siteBuildings getOrDefault [_key, objNull];
A3A_siteBuildings deleteAt _key;
if (!isNull _old) then { deleteVehicle _old };

private _building = createVehicle [_class, [0,0,0], [], 0, "CAN_COLLIDE"];
_building setPosWorld _posWorld;
_building setVectorDirAndUp [_vecDir, _vecUp];
_building allowDamage false;
_building setVariable ["A3A_siteBuilding", [_marker, _level], true];

A3A_siteBuildings set [_key, _building];
A3A_siteBuildingData set [_key, [_posWorld, _vecDir, _vecUp]];

// Forget a deleted object, unless it was already replaced. The data stays, so the level keeps its building on the next load
_building addEventHandler ["Deleted", {
    params ["_building"];
    (_building getVariable ["A3A_siteBuilding", ["", 0]]) params ["_marker", "_level"];
    private _key = format ["%1|%2", _marker, _level];
    if (A3A_siteBuildings getOrDefault [_key, objNull] isEqualTo _building) then { A3A_siteBuildings deleteAt _key };
}];

Info_3("Site building %1 created for %2 at %3", _class, _key, _posWorld);
_building;
