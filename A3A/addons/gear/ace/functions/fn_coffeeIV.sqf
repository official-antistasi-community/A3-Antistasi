#include "..\..\script_component.hpp"
params ["_medic", "_patient", "_bodyPart", "_classname", "_itemUser", "_usedItem"];

["ace_medical_treatment_medicationLocal", [_patient, _bodyPart, _classname], _patient] call CBA_fnc_targetEvent;
[_medic, _patient, _bodyPart, _classname, _itemUser, _usedItem] call ace_medical_treatment_fnc_ivBag;