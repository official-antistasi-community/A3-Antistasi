private ["_pool","_veh","_typeVehX"];

_veh = cursorObject;

if (isNull _veh) exitWith {[localize "STR_antistasi_customHint_unlock", localize "STR_antistasi_customHint_unlock_no_look"] call A3A_fnc_customHint;};

if (!alive _veh) exitWith {[localize "STR_antistasi_customHint_unlock", localize "STR_antistasi_customHint_unlock_destroy"] call A3A_fnc_customHint;};

if (_veh isKindOf "Man") exitWith {[localize "STR_antistasi_customHint_unlock", localize "STR_antistasi_customHint_unlock_busy"] call A3A_fnc_customHint;};
if (not(_veh isKindOf "AllVehicles")) exitWith {[localize "STR_antistasi_customHint_unlock", localize "STR_antistasi_customHint_unlock_no_used"] call A3A_fnc_customHint;};
_ownerX = _veh getVariable "ownerX";

if (isNil "_ownerX") exitWith {[localize "STR_antistasi_customHint_unlock", localize "STR_antistasi_customHint_unlock_already"] call A3A_fnc_customHint;};

if (_ownerX != getPlayerUID player) exitWith {[localize "STR_antistasi_customHint_unlock", localize "STR_antistasi_customHint_unlock_own"] call A3A_fnc_customHint;};

_veh setVariable ["ownerX",nil,true];

[localize "STR_antistasi_customHint_unlock", localize "STR_antistasi_customHint_unlocked"] call A3A_fnc_customHint;