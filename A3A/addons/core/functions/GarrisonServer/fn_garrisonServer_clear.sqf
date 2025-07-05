// Used for intentional rebels troop clears, moving HQ
// Destruction of rebel & enemy minor sites (set delete to true)
// _delete parameter is ignored if it's not a minor site

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

Trace_1("Called with params %1", _this);


params ["_marker", "_delete", ["_feedback", false], ["_hqMove", false]];

private _titleStr = localize "STR_A3A_garrison_header";

private _garrison = A3A_garrison get _marker;
if (isNil "_garrison") exitWith {
    Error_1("Garrison %1 no longer exists", _marker);
    if (!_feedback) exitWith {};
    [_titleStr, "Garrison no longer exists"] remoteExecCall ["A3A_fnc_customHint", theBoss];
};

if (sidesX getVariable _marker != teamPlayer) exitWith
{
    // If it's an enemy garrison then this shouldn't have been called from UI
    if (_feedback) exitWith {
        [_titleStr, format [localize "STR_A3A_fn_reinf_garrDia_zone_belong",FactionGet(reb,"name")]] remoteExecCall ["A3A_fnc_customHint", theBoss];
    };
    // Delete should always be true here

    _garrison set ["troops", []];           // rebel format, which is correct because we're flipping the side in deleteMinorSite
    _garrison set ["vehicles", []];

    if (_marker in A3A_garrisonMachine) then {
        ["clear", [_marker, false, false]] call A3A_fnc_garrisonOp;
        [_marker] call A3A_garrisonServer_despawn;      // could just send the garrison op, but function should be ok too
    };

    [_marker] call A3A_fnc_deleteMinorSite;          // adds to A3A_markersToDelete, removes from controlsX
};


// Ignore the delete flag if it's not a minor site, so we can be lazy on calling
if (_garrison get "type" != "rebpost") then { _delete = false };

// Calculate the refund for rebels
private _costs = 0;
private _hr = 0;
{
    _hr = _hr + 1;
    _costs = _costs + 0.5 * (server getVariable [_x,0]);
} forEach (_garrison get "troops");

_garrison set ["troops", []];

if (_delete) then {
    // Also refund statics & vehicles if we're deleting the site 
    {
        _costs = _costs + 0.5 * (_x call A3A_fnc_vehiclePrice);
    } forEach (_garrison get "vehicles");

    _garrison set ["buildings", []];
    _garrison set ["vehicles", []];
};

if (_hqMove) then {
    // HQ is going elsewhere so need to disconnect everything
    A3A_buildingsToSave append (_garrison get "spawnedBuildings");
    _garrison set ["spawnedBuildings", []];
    _garrison set ["buildings", []];
    _garrison set ["vehicles", []];
};

private _safe = !(_marker call A3A_fnc_enemyNearCheck);
if (_safe) then {
    [_hr, _costs] spawn A3A_fnc_resourcesFIA;        // TODO: should turn this thing into unscheduled
};

if (_marker in A3A_garrisonMachine) then {
    ["clear", [_marker, false, _safe]] call A3A_fnc_garrisonOp;
    if (_delete) then { [_marker] call A3A_garrisonServer_despawn };
};

if (_delete) then {
    [_marker] call A3A_fnc_deleteRebelControl;          // adds to A3A_markersToDelete, removes from outpostsFIA
};

if (_feedback and _safe and (_costs > 0 or _hr > 0)) then {
    private _resultStr = format ["Garrison removed<br/><br/>Recovered Money: %1 €<br/>Recovered HR: %2", _costs, _hr];
    ["Garrison", _resultStr] remoteExecCall ["A3A_fnc_customHint", theBoss];
};
