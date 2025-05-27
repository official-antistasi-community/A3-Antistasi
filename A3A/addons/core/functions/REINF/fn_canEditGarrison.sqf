// Client-side function to detect whether specified garrison is allowed to be edited
// Used by both old and new UI
// Generates error hints directly, returns bool

params ["_marker"];

private _titleStr = localize "STR_A3A_fn_reinf_garrDia_title";

if (sidesX getVariable [_marker, sideUnknown] != teamPlayer) exitWith {
	[_titleStr, format [localize "STR_A3A_fn_reinf_garrDia_zone_belong",FactionGet(reb,"name")]] call A3A_fnc_customHint;
    false;
};

if ([markerPos _marker] call A3A_fnc_enemyNearCheck) exitWith {
	[_titleStr, localize "STR_A3A_fn_reinf_garrDia_no_enemy"] call A3A_fnc_customHint;
    false;
};

if (_marker in forcedSpawn) exitWith {
	[_titleStr, localize "STR_A3A_fn_reinf_garrDia_no_att"] call A3A_fnc_customHint;
    false;
};

true;
