private ["_units"];

if (player != leader group player) exitWith {[localize "STR_antistasi_customHint_Autoheal", localize "STR_antistasi_customHint_autoheal_only_leader"] call A3A_fnc_customHint; autoHeal = false};

_units = units group player;

if ({alive _x} count _units == {isPlayer _x} count _units) exitWith {[localize "STR_antistasi_customHint_Autoheal", localize "STR_antistasi_customHint_autoheal_requires"] call A3A_fnc_customHint; autoHeal = false};
