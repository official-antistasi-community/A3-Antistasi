params ["_typeUnit"];

private _titleStr = localize "STR_A3A_fn_reinf_reinfPlayer_title";

private _error = [_typeUnit] call A3A_fnc_canReinfPlayer;

if (_error isNotEqualTo "") exitWith {[_titleStr, _error] call A3A_fnc_customHint}; // this string is localized already and only local - not sent across network

private _unit = [group player, _typeUnit, position player, [], 0, "NONE"] call A3A_fnc_createUnit;

private _costs = server getVariable _typeUnit;

if (player == theBoss) then {
	[-1, -_costs] remoteExec ["A3A_fnc_resourcesFIA",2];
} else {
	[-1, 0] remoteExec ["A3A_fnc_resourcesFIA",2];
	[- _costs] call A3A_fnc_resourcesPlayer;
};
[_titleStr, localize "STR_A3A_fn_reinf_reinfPlayer_recruited"] call A3A_fnc_customHint;

[_unit] spawn A3A_fnc_FIAinit;
_unit disableAI "AUTOCOMBAT";
sleep 1;
petros directSay "SentGenReinforcementsArrived";
