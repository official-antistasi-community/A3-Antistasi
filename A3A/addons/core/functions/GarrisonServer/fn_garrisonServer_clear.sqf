// Only used for rebels, user interaction
// should only be used after checking distance validity

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker", ["_feedback", false], ["_hqMove", false]];

Trace_1("Called with params %1", _this);

private _garrison = A3A_garrison get _marker;

private _titleStr = localize "STR_A3A_garrison_header";

if (isNil "_garrison") exitWith {
    Error_1("Garrison %1 no longer exists", _marker);
    if (!_feedback) exitWith {};
    [_titleStr, "Garrison no longer exists"] remoteExecCall ["A3A_fnc_customHint", theBoss];
};

if (sidesX getVariable [_marker, sideUnknown] != teamPlayer) exitWith {
	if (!_feedback) exitWith {};
    [_titleStr, format [localize "STR_A3A_fn_reinf_garrDia_zone_belong",FactionGet(reb,"name")]] remoteExecCall ["A3A_fnc_customHint", theBoss];
};


private _costs = 0;
private _hr = 0;
{
    _hr = _hr + 1;
    _costs = _costs + 0.5 * (server getVariable [_x,0]);
} forEach (_garrison get "troops");

_garrison set ["troops", []];

private _isPost = _marker in outpostsFIA;
if (_isPost) then {
    // Also refund statics & vehicles if it's a roadblock/watchpost
    // because we're clearing it out entirely
    {
        _costs = _costs + 0.5 * (_x call A3A_fnc_vehiclePrice);
    } forEach (_garrison get "vehicles");

    _garrison set ["buildings", []];
    _garrison set ["vehicles", []];

    [_marker] call A3A_fnc_deleteRebelControl;          // adds to A3A_markersToDelete, removes from outpostsFIA
};

if (_hqMove) then {
    A3A_buildingsToSave append (_garrison get "spawnedBuildings");
    _garrison set ["spawnedBuildings", []];
    _garrison set ["buildings", []];
    _garrison set ["vehicles", []];
};

private _danger = _marker call A3A_fnc_enemyNearCheck;
if (!danger) then {
    [_hr, _costs] spawn A3A_fnc_resourcesFIA;        // TODO: should turn this thing into unscheduled
};

if (_marker in A3A_garrisonMachine) then {
    if (_isPost) exitWith { [_marker] call A3A_fnc_garrisonServer_despawn };
    if (_hqMove) exitWith { ["moveHQ", [_marker, _danger]] call A3A_fnc_garrisonOp };
    ["clear", [_marker]] call A3A_fnc_garrisonOp;
};

if (_feedback and !_danger) then {
    private _resultStr = format ["Garrison removed<br/><br/>Recovered Money: %1 €<br/>Recovered HR: %2", _costs, _hr];
    ["Garrison", _resultStr] remoteExecCall ["A3A_fnc_customHint", theBoss];
};

Trace("Completed");
