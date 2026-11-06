params ["_typeUnit"];

private _titleStr = localize "STR_A3A_fn_reinf_reinfPlayer_title";

private _error = [_typeUnit] call A3A_fnc_canReinfPlayer;

if (_error isNotEqualTo "") exitWith {[_titleStr, _error] call A3A_fnc_customHint}; // this string is localized already and only local - not sent across network

private _unit = [group player, _typeUnit, position player, [], 0, "NONE"] call A3A_fnc_createUnit;

private _costs = ([_typeUnit] call A3A_fnc_rebelUnitPrice);
// Refunds pay at most this, see A3A_fnc_refundBase
_unit setVariable ["A3A_pricePaid", _costs, true];

// The commander and sub-commanders recruit on the faction funds, everyone else pays from their own pocket
if ([player] call A3A_fnc_isCommandStaff) then {
	[-1, -_costs] remoteExec ["A3A_fnc_resourcesFIA",2];
	// Dismissing the unit or saving the game pays it back into the faction funds, not to the player
	_unit setVariable ["A3A_factionFunded", true, true];

	// The commander hears about recruits of sub-commanders, under the names of the recruit dialog
	if (player != theBoss) then {
		private _roleName = _typeUnit;
		{
			if (A3A_faction_reb getOrDefault [_x, ""] isEqualTo _typeUnit) exitWith { _roleName = localize _y };
		} forEach createHashMapFromArray [
			["unitRifle", "STR_antistasi_dialogs_recruit_units_militiaman"],
			["unitMG", "STR_antistasi_dialogs_recruit_units_autorifleman"],
			["unitGL", "STR_antistasi_dialogs_recruit_units_grenadier"],
			["unitLAT", "STR_antistasi_dialogs_recruit_units_antitank"],
			["unitAT", "STR_antistasi_dialogs_hq_garrisons_atMissile"],
			["unitAA", "STR_antistasi_hq_garrisons_aaMissile"],
			["unitMedic", "STR_antistasi_dialogs_recruit_units_medic"],
			["unitSniper", "STR_antistasi_dialogs_recruit_units_marksman"],
			["unitEng", "STR_antistasi_dialogs_recruit_units_engineer"],
			["unitExp", "STR_antistasi_dialogs_recruit_units_bomb_specialist"]
		];
		[player, _roleName, _costs, 1] remoteExecCall ["A3A_fnc_subCommanderSpent", 2];
	};
} else {
	[-1, 0] remoteExec ["A3A_fnc_resourcesFIA",2];
	[- _costs] call A3A_fnc_resourcesPlayer;
};
[_titleStr, localize "STR_A3A_fn_reinf_reinfPlayer_recruited"] call A3A_fnc_customHint;

[_unit] spawn A3A_fnc_FIAinit;

_unit addEventHandler ["FiredMan", A3A_fnc_rebelFiredManEH];

_unit disableAI "AUTOCOMBAT";
sleep 1;
petros directSay "SentGenReinforcementsArrived";
