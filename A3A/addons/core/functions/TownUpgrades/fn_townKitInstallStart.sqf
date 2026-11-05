/*
Maintainer: Shoter
    Client side of installing a town upgrade from its kit crate. Pre-checks, then the garage placement ghost for the prop.
    Placement is rejected beyond A3A_townUpgradeRadius from the bound town's centre, when the town is no longer rebel-held,
    or when the upgrade got installed meanwhile. On placement the server is asked to build the prop and consume the crate.
    Started by the "installStart" mode of A3A_fnc_townKitHandlers, from the install action of the shared kit layer.

Arguments:
    <OBJECT> The kit crate

Return Value:
    <nil>

Scope: Clients
Environment: Scheduled
Public: No
Dependencies: HR_GRG_fnc_confirmPlacement, A3A_fnc_townUpgradeInstall

Example:
    [_crate] spawn A3A_fnc_townKitInstallStart;
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params [["_crate", objNull, [objNull]]];
private _titleStr = localize "STR_A3A_fn_townUpgrades_title";

if (isNull _crate or {!isNull attachedTo _crate}) exitWith {};
(_crate getVariable ["A3A_upgradeKit", ["", "", ""]]) params ["_kind", "_id", "_city"];
if (_kind != "town" or {!(_id in A3A_townUpgradeHM)}) exitWith { Error_1("Kit crate %1 carries no valid kit data", _crate) };

if (!isNil "HR_GRG_placing" && {HR_GRG_placing}) exitWith { [_titleStr, localize "STR_A3A_fn_reinf_addFIAVeh_no_placing"] call A3A_fnc_customHint };
if (player != player getVariable ["owner", player]) exitWith { [_titleStr, localize "STR_A3A_fn_reinf_addFIAVeh_no_control"] call A3A_fnc_customHint };
if (sidesX getVariable [_city, sideUnknown] != teamPlayer or {_city in destroyedSites}) exitWith { [_titleStr, format [localize "STR_A3A_fn_townUpgrades_townNotRebel", _city]] call A3A_fnc_customHint };
private _name = localize format ["STR_A3A_fn_townUpgrades_name_%1", _id];
if ([_city, _id] call A3A_fnc_townUpgradeHas) exitWith { [_titleStr, format [localize "STR_A3A_fn_townUpgrades_alreadyInstalled", _city, _name]] call A3A_fnc_customHint };
if ([getPosATL _crate] call A3A_fnc_enemyNearCheck) exitWith { [_titleStr, localize "STR_A3A_fn_townUpgrades_enemyNear"] call A3A_fnc_customHint };

private _propClass = (A3A_townUpgradeHM get _id) # 0;
if (_propClass == "") exitWith { Error_1("Town upgrade %1 has no prop class", _id) };

// Runs every frame the ghost moves, keep it cheap
private _fnc_check = {
    params ["_ghost", "_crate", "_id", "_city"];
    if (getPosATL _ghost distance2D markerPos _city > A3A_townUpgradeRadius) exitWith { [true, format [localize "STR_A3A_fn_townUpgrades_tooFar", _city, A3A_townUpgradeRadius]] };
    if (sidesX getVariable [_city, sideUnknown] != teamPlayer or {_city in destroyedSites}) exitWith { [true, format [localize "STR_A3A_fn_townUpgrades_townNotRebel", _city]] };
    if ([_city, _id] call A3A_fnc_townUpgradeHas) exitWith { [true, format [localize "STR_A3A_fn_townUpgrades_alreadyInstalled", _city, localize format ["STR_A3A_fn_townUpgrades_name_%1", _id]]] };
    [false];
};

private _fnc_placed = {
    params ["_prop", "_crate", "_id", "_city"];
    if (isNull _prop) exitWith {};          // placement cancelled
    // The server owns every tracked object: recreate it there
    private _posWorld = getPosWorld _prop;
    private _vecDir = vectorDir _prop;
    private _vecUp = vectorUp _prop;
    deleteVehicle _prop;
    [_crate, _posWorld, _vecDir, _vecUp, player] remoteExecCall ["A3A_fnc_townUpgradeInstall", 2];
};

private _extraMessage = format [localize "STR_A3A_fn_townUpgrades_placing", _name, _city, A3A_townUpgradeRadius];
[_propClass, _fnc_placed, _fnc_check, [_crate, _id, _city], nil, nil, nil, _extraMessage] call HR_GRG_fnc_confirmPlacement;
