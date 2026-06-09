// Spawned script to cause "civilian" AI to follow player, including into vehicles

params ["_unit", "_target"];

// Can be used to switch to following a different unit
private _AIScriptHandle = _unit getVariable "A3A_AIScriptHandle";
if (!isNil "_AIScriptHandle") then { terminate _AIScriptHandle };
_unit setVariable ["A3A_AIScriptHandle", _thisScript];

_unit enableAI "PATH";
doStop _unit;

private _state = "FOLLOW";          //states: "MOUNT", "RIDE", "DISMOUNT", "FOLLOW"
private _timeout = 0;
private _lastPos = getPosATL _unit;
private _curVehicle = objNull;              // assume we didn't start in vehicle...

while {alive _target} do {
    sleep 1;
    if (_target getVariable ["incapacitated", false]) then { continue };

    switch (_state) do {
        case "FOLLOW": {
            // If target boarded a vehicle with cargo spaces, attempt to board it
            if (vehicle _target emptyPositions "cargo" > 0) exitWith {
                _curVehicle = vehicle _target;
                _unit assignAsCargo _curVehicle;
                [_unit] orderGetIn true;
                _timeout = time + 20;
                _state = "MOUNT";
            };

            // Otherwise follow on foot
            private _formDist = [2, 5] select (vehicle _target != _target);
            private _formPos = _target getPos [_formDist, _target getDir _unit];
            if (_formPos distance2d _unit > 8 and _lastPos distance2d _unit < 0.05) then { _unit setPosATL _formPos };      // stuck fix
            _unit doMove _formPos;
            _lastPos = getPosATL _unit;
        };
        case "RIDE": {
            // If target left our vehicle, join them
            if (vehicle _target != _curVehicle) exitWith {
                _curVehicle = objNull;
                unassignVehicle _unit;
                _timeout = time + 5;
                _state = "DISMOUNT";
            };
        };
        case "MOUNT": {
            if (vehicle _unit == _curVehicle) exitWith {
                _state = "RIDE";
            };
            if (vehicle _target != _curVehicle or _curVehicle emptyPositions "cargo" == 0) exitWith {
                unassignVehicle _unit;
                _state = "FOLLOW";
            };
            if (time > _timeout) then {
                // force into vehicle if close (cargo should be free from above check)
                if (_curVehicle distance2d _unit < 10) exitWith { _unit moveInCargo _curVehicle };
                unassignVehicle _unit;
                _state = "FOLLOW";
            };
        };
        case "DISMOUNT": {
            if (vehicle _unit == _unit) exitWith {
                _state = "FOLLOW";
            };
            if (time > _timeout) exitWith {
                moveOut _unit;
                _state = "FOLLOW";
            };
        };
    };
};
