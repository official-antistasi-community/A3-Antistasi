/*
    Author: [Håkon]
    [Description]
        releases all claims on vehicles

    Arguments:
    0. <String> Player UID

    Return Value:
    <Bool> Success

    Scope: Any
    Environment: Any
    Public: [No]
    Dependencies:

    Example: [_UID] remoteExecCall ["HR_GRG_fnc_releaseAllVehicles",_recipients];

    License: APL-ND
*/
#include "defines.inc"
FIX_LINE_NUMBERS()
params [ ["_UID" ,"", [""]]];
if (_UID isEqualTo "") exitWith {false};
Trace_1("Releasing all vehicles with UID: %1",_UID);

//release all vehicles in all HR_GRG_categories
{
    {
        if ( (_y#3) isEqualTo _UID) then {_y set [3, ""] };
    } forEach _x;
} forEach HR_GRG_Vehicles;

//refresh category if client
if (!isNull player) then {
    {
        if (ctrlEnabled _x) then {
            [_x, _forEachIndex] call HR_GRG_fnc_reloadCategory;
        };
    } forEach HR_GRG_Cats;
};

true
