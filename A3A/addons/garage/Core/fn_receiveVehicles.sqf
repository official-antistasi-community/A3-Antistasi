/*
Author: John Jordan
Description:
    Handles client receiving initial list of vehicles from server

Arguments:
0. <Array> Vehicles array
1. <Array> Sources array

Return Value: <nil>

Scope: Clients
Environment: unscheduled
Public: No
Dependencies:

License: APL-ND
*/
#include "defines.inc"
FIX_LINE_NUMBERS()

private _disp = findDisplay HR_GRG_IDD_Garage;
if (isNull _disp) exitWith {};          // might be possible with slow network?

params ["_vehicles", "_sources"];
HR_GRG_Vehicles = _vehicles;
HR_GRG_Sources = _sources;

call HR_GRG_fnc_updateVehicleCount;
private _index = HR_GRG_Cats findIf {ctrlShown _x};
private _ctrl = HR_GRG_Cats#_index;
[_ctrl, _index] call HR_GRG_fnc_reloadCategory;
