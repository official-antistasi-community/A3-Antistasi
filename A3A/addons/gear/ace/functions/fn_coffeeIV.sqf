#include "..\..\script_component.hpp"
params ["_medic", "_patient", "_bodyPart", "_classname"];

[_medic, _patient, _bodyPart, _classname] call ace_medical_treatment_fnc_ivBag;
[QGVAR(medicationLocal), [_patient, _bodyPart, _classname], _patient] call CBA_fnc_targetEvent;