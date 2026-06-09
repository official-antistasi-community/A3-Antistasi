/*
 * Author: PabstMirror (striped of any ace dependancy by Håkon)
 * Finds turret owner of a pylon.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Pylon Index (starting at 0) <NUMBER>
 *
 * Return Value:
 * * Turret index (either [] or [0]) <ARRAY>
 *
 * Scope: Any
 * Environment: Any
 * Example:
 * [cursorObject, 0] call HR_GRG_fnc_getPylonTurret;
 *
 * Public: No
 */

params ["_vehicle", "_pylonIndex"];

// This is trivial with getAllPylonsInfo
private _pylonInfo = getAllPylonsInfo _vehicle;
if (_pylonIndex >= count _pylonInfo) exitWith { [] };       // shouldn't happen but whatever
private _turret = _pylonInfo#_pylonIndex#2;
[_turret, []] select (_turret isEqualTo [-1]);           // translate to dumbass pylon command driver turret format
