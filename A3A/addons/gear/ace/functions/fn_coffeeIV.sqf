#include "..\..\script_component.hpp"
params ["_medic", "_patient", "_bodyPart", "_classname", "_a", "_usedItem"];

[_medic, _patient, _bodyPart, _classname] call ace_medical_treatment_fnc_ivBag;
[_medic, _patient, _bodyPart, _classname, _a, _usedItem] call ace_medical_treatment_fnc_medication;
