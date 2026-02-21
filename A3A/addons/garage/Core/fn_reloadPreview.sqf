/*
    Author: [Håkon]
    [Description]
        Reloads preview vehicle with its mounts, textures and animations

    Arguments:
    0. <nil>

    Return Value:
    <nil>

    Scope: Clients
    Environment: Any
    Public: [No]
    Dependencies:

    Example:

    License: APL-ND
*/
#include "defines.inc"
FIX_LINE_NUMBERS()
Trace("Reloading preview");
HR_GRG_SelectedVehicles params ["_catIndex", "_vehUID", "_class"];

//delete old vehicle
if (!isNull HR_GRG_previewVeh) then {
    {
        if !(_x isEqualTo HR_GRG_previewCam) then {detach _x; deleteVehicle _x};
    } forEach (attachedObjects HR_GRG_previewVeh);
    deleteVehicle HR_GRG_previewVeh;
};
if (!isClass (configFile >> "CfgVehicles" >> _class)) exitWith {};

//create new preview vehicle
HR_GRG_previewVeh = _class createVehicleLocal [0,0,100000];
HR_GRG_previewVeh enableSimulation false;

//get vehicle data
private _cat = HR_GRG_Vehicles#_catIndex;
private _veh = _cat get _vehUID;
Trace_1("ReloadPreview - Veh: %1", _veh);

//set state
Trace_1("Preview vehicle State: %1", _veh#4);
HR_GRG_previewVehState = _veh#4;
[HR_GRG_previewVeh, HR_GRG_previewVehState] call HR_GRG_fnc_setState;
HR_GRG_previewVeh allowDamage false;

//set customisation
private _customisation = _veh param [6, [false,false]];
([HR_GRG_previewVeh]+_customisation) call BIS_fnc_initVehicle;

//set up camera
HR_GRG_previewVeh setPosASL [0,0,100000];
HR_GRG_previewVeh setVectorUp [0,0,1];
[nil,0,0] call HR_GRG_fnc_updateCamPos;
