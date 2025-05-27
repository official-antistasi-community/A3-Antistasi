
params ["_victim", "_killer"];

[_victim] remoteExec ["A3A_fnc_postmortem", 2];

_victim setVariable ["spawner",nil,true];

/* Did this in EntityKilled instead...
private _marker = _victim getVariable "markerX";
if (!isNil "_marker") then {
    _victim setVariable ["markerX", nil, true];         // used for anything? Was bugged
    private _unitType = _victim getVariable "unitType";
    [_marker, _unit] remoteExecCall ["A3A_fnc_garrisonServer_remUnit", 2];
};
*/

private _marker = _victim getVariable ["markerX", ""];
if (_marker != "") then {
    A3A_garrisonOps pushBack ["zoneCheck", [_marker]];          // should always be local for marker units
};

if (side _killer == Occupants) then {
    [0.25, 0, getPosATL _victim] remoteExec ["A3A_fnc_citySupportChange", 2];
    [Occupants, -1, 30] remoteExec ["A3A_fnc_addAggression", 2];
} else {
    if (side _killer == Invaders) then {
        [Invaders, -1, 30] remoteExec ["A3A_fnc_addAggression", 2]
    } else {
        if (isPlayer _killer) then {
            // TODO: throw some public warning message here?
            //_killer addRating 1000;
        };
    };
};
