// Server-side, unscheduled
// Sends specified garrison data to the new-UI function on the server

// Currently there are no updates except when the UI requests them. Simpler control flow, almost always fine

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker"];

Trace_1("Called with params %1", _this);

if !(_marker in A3A_garrison) exitWith {
    Error_1("Garrison %1 does not exist", _marker);
};

["garrisonDataSent", [_marker, A3A_garrison get _marker]] remoteExecCall ["A3A_GUI_fnc_hqDialog", theBoss];
