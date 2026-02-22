/*  Get SEAD support selection weight against target

Arguments:
    <OBJECT> Target object
    <SIDE> Side to send support from
    <SCALAR> Max resource spend (not currently used)
    <ARRAY> Array of strings of available types for this faction

Return value:
    <SCALAR> Weight value, 0 for unavailable or useless
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_target", "_side", "_maxSpend", "_availTypes"];

private _isValidTarget = if (typeof _target in FactionGet(all,"vehiclesSAM")) then { // can be a standalone system operated remotely with a datalinked radar
    private _radarEmitters = (8 allObjects 1) select {isVehicleRadarOn _x && {vehicleReportRemoteTargets _x && (side _x != _side)}};
    (_radarEmitters isNotEqualTo []);
} else {
    if !(typeOf _target in (FactionGet(all,"vehiclesRadar") + FactionGet(all,"vehiclesAA") + FactionGet(all,"staticAA"))) exitWith {false};
    if !(isVehicleRadarOn _target) exitWith {false};
    true;
};

if (!_isValidTarget) exitWith { 0 };

private _threat = A3A_groundVehicleThreat getOrDefault [typeOf _target, 0];
_threat = 0.5 * (_threat + (_target getVariable ["A3A_killThreat", 0]));

0 max ((_threat - 50) / 25);

