#include "..\..\script_component.hpp"
params ["_medic", "_patient", "_bodyPart", "_classname", "_itemUser", "_usedItem"];

private _can = (_usedItem + "_Item") createVehicle [0,0,0];
_can enableSimulation false;
_can attachto[_patient,[-0.034,0.59,0.05],"RightHand",true];
_can setVectorDirAndUp [[0.536966,-0.00438141,-0.843605],[0.1,1,0]];


[objNull, _patient, [_usedItem, configFile >> "CfgWeapons" >> _usedItem, false]] call ace_field_rations_fnc_consumeItem;

_patient addItem _usedItem;

[_can] spawn {
	params ["_can"];
	sleep 10;
	detach _can;
	deleteVehicle _can;
};