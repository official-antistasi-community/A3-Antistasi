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

private _isValidTarget = (isVehicleRadarOn _target);
if (!_isValidTarget) then { // early exit for AA tanks with their radars on
    private _radarEmitters = (8 allObjects 1) select {isVehicleRadarOn _x && {vehicleReportRemoteTargets _x && (side _x != _side)}};
    _isValidTarget = (_radarEmitters isNotEqualTo []);
};

if (!_isValidTarget) exitWith { 0 };

// CAS and TANK are _threat/80

private _threat = A3A_groundVehicleThreat getOrDefault [typeOf _target, 0];
_threat / 20; // 4:1:1 for SEAD, CAS, TANK. 2/3 chance to send SEAD overall against confirmed AA asset

