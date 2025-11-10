#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Implemented by: Bob Murphy
 * Handles ace treatmentStarted event
 */

params ["_medic", "_patient", "", "_classname"];

// Don't show messages for self actions
if (_medic isEqualTo _patient) exitWith {};

private _type = GVAR(treatmentMessageTypes) get _classname;
if (isNil "_type") exitWith {};

[QGVAR(showTreatmentMessage), [_patient, _type, [_medic] call ace_common_fnc_getName], [_patient]] call CBA_fnc_targetEvent;