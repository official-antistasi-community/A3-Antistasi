
params ["_victim", "_killer"];

[_victim] spawn A3A_fnc_postmortem;

_victim setVariable ["spawner",nil,true];

private _marker = _victim getVariable "markerX";
if (!isNil "_marker") then {
    _victim setVariable ["markerX", nil, true];         // used for anything? Was bugged
    private _unitType = _victim getVariable "unitType";
    [_marker, _unitType] remoteExecCall ["A3A_fnc_remUnitTypeFromGarrison", 2];
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
