
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

// Only care about immediate kills for accounting atm?
/*if (A3A_hasACE) then {
	if ((isNull _killer) || (_killer == _victim)) then {
		_killer = _victim getVariable ["ace_medical_lastDamageSource", _killer];
	};
} else {
    if (_victim getVariable ["incapacitated", false]) then {
        _killer = _victim getVariable ["A3A_downedBy", _killer];
    };
};*/

[_victim, group _victim, _killer] spawn A3A_fnc_rebelReactOnKill;

// This is fairly odd...
if (side _killer == Occupants) then {
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
