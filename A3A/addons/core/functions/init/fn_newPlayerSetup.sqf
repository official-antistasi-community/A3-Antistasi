// Sets up the vars that a new unit needs to work as a player.
// Mostly yoinked from initClient and onPlayerRespawn
// Basically includes everything that doesnt get carried over on respawn, so what we can run when a new unit is placed down

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

player addEventHandler ["GetInMan", {
    params ["_unit", "_role", "_veh", "_turret"];
    _exit = false;
    if !([player] call A3A_fnc_isMember) then {
        if (!isNil {_veh getVariable "A3A_locked"}) then {
            _owner = _veh getVariable "ownerX";
            if ({getPlayerUID _x == _owner} count (units group player) == 0) then {
                [localize "STR_A3A_fn_init_initclient_warning", localize "STR_A3A_fn_init_initclient_vehlocked"] call A3A_fnc_customHint;
                moveOut _unit;
                _exit = true;
            };
        };
    };
    if (!_exit) then {
        if ((typeOf _veh) in undercoverVehicles) then {
            if !(_veh getVariable ["A3A_reported", false]) then {
                [] spawn A3A_fnc_goUndercover;
            };
        };
        if (_veh isKindOf "Air") then {
            Debug_2("Installing airspace control for player %1, vehicle %2", _unit, typeof _veh);
            private _handle = [_unit, _veh] spawn A3A_fnc_airspaceControl;
            _unit setVariable ["airspaceControlHandle", _handle];
        };
    };
}];

player addEventHandler ["GetOutMan", {
    params ["_unit", "_role", "_veh", "_turret"];
    Debug_2("Terminating airspace control for player %1, vehicle %2", _unit, typeof _veh);
    private _handle = _unit getVariable ["airspaceControlHandle", scriptNull];
    if (!isNull _handle) then { terminate _handle };
}];

player addEventHandler ["Killed", {
    [-1, 0] remoteExecCall ["A3A_fnc_resourcesFIA", 2];
}];

// Prevent players getting shot by their own AIs. EH is respawn-persistent
player addEventHandler ["HandleRating", {0}];