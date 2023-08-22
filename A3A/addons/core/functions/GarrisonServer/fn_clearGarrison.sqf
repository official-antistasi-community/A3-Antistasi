
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker", ["_feedback", false]];

private _garrison = A3A_garrison get _marker;
if (isNil "_garrison") exitWith {
    Error_1("Garrison %1 no longer exists", _marker);
    if (_feedback) then { ["Garrison", "Garrison no longer exists"] remoteExecCall ["A3A_fnc_customHint", theBoss] };
};

// only refund if rebel?
// only use this function if rebel? Enemies will never clear a garrison that they own.
// have a specific disband function so that units surrender or flee?
    // this one would also clear the local garrison of units

// refund statics and vehicles if garrison is in outpostsFIA and should therefore be disbanded?

// can't use despawn because statics might need keeping?

private _machineID = A3A_garrisonMachine get _marker;
["disband", [_marker]] remoteExecCall ["A3A_fnc_garrisonOp", _machineID];

private _costs = 0;
private _hr = 0;
{
    _hr = _hr + 1;
    _costs = _costs + (server getVariable [_x,0]);
} forEach (_garrison get "troops");

[_hr,_costs] spawn A3A_fnc_resourcesFIA;        // TODO: should turn this thing into unscheduled
_garrison set ["troops", []];

// TODO: need check in distance.sqf for whether marker still exists, as it could be killed mid-update
// or only kill markers synchronously with distance.sqf?
if (_marker in outpostsFIA) then {
    A3A_garrison set [_marker, nil];
    outpostsFIA = outpostsFIA - [_marker]; publicVariable "outpostsFIA";
    markersX = markersX - [_marker]; publicVariable "markersX";
    deleteMarker _marker;
    sidesX setVariable [_marker, nil, true];
};

if (_feedback) then {
    private _resultStr = format ["Garrison removed<br/><br/>Recovered Money: %1 €<br/>Recovered HR: %2", _costs, _hr];
    ["Garrison", _resultStr] remoteExecCall ["A3A_fnc_customHint", theBoss];
};
