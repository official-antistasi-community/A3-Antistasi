#include "..\..\script_component.hpp"
params ["_medic", "_patient", "_bodyPart", "_classname", "_itemUser", "_usedItem"];

[_medic, _patient, _bodyPart, _classname, _itemUser, _usedItem] call ace_medical_treatment_fnc_ivBag;
[_medic, _patient, _bodyPart, _classname, _itemUser, _usedItem] call ace_medical_treatment_fnc_medication;
