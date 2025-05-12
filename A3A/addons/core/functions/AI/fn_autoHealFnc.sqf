private ["_units"];
private _titleStr = localize "STR_A3A_fn_ai_autoheal_title";

if (player != leader group player) exitWith {[_titleStr, localize "STR_A3A_fn_ai_autoheal_mustleader"] call A3A_fnc_customHint; autoHeal = false};

_units = units group player;

if ({alive _x} count _units == {isPlayer _x} count _units) exitWith {[_titleStr, localize "STR_A3A_fn_ai_autoheal_needsai"] call A3A_fnc_customHint; autoHeal = false};
