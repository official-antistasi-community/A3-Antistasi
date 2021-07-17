if !([player] call A3A_fnc_isMember) exitWith {[localize "STR_antistasi_garrisons_AI_Recruit", localize "STR_antistasi_garrisons_AI_Recruit_onlyMember"] call A3A_fnc_customHint;};

if (recruitCooldown > time) exitWith {[localize "STR_antistasi_garrisons_AI_Recruit", format [localize "STR_antistasi_garrisons_AI_Recruit_wait",round (recruitCooldown - time)]] call A3A_fnc_customHint;};

if (player != player getVariable ["owner",player]) exitWith {[localize "STR_antistasi_garrisons_AI_Recruit", localize "STR_antistasi_garrisons_AI_Recruit_ctrlAI"] call A3A_fnc_customHint;};

if ([player,300] call A3A_fnc_enemyNearCheck) exitWith {[localize "STR_antistasi_garrisons_AI_Recruit", localize "STR_antistasi_garrisons_AI_Recruit_enemy"] call A3A_fnc_customHint;};

if (player != leader group player) exitWith {[localize "STR_antistasi_garrisons_AI_Recruit", localize "STR_antistasi_garrisons_AI_Recruit_noLeader"] call A3A_fnc_customHint;};

private _hr = server getVariable "hr";

if (_hr < 1) exitWith {[localize "STR_antistasi_garrisons_AI_Recruit", localize "STR_antistasi_garrisons_AI_Recruit_noHR"] call A3A_fnc_customHint;};
private _arraytypeUnit = _this select 0;
private _typeUnit = _arraytypeUnit select 0;
private _costs = server getVariable _typeUnit;
private _resourcesFIA = 0;
if (!isMultiPlayer) then {_resourcesFIA = server getVariable "resourcesFIA"} else {_resourcesFIA = player getVariable "moneyX";};

if (_costs > _resourcesFIA) exitWith {[localize "STR_antistasi_garrisons_AI_Recruit", format [localize "STR_antistasi_garrisons_noMoney",_costs]] call A3A_fnc_customHint;};

if ((count units group player) + (count units stragglers) > 9) exitWith {[localize "STR_antistasi_garrisons_AI_Recruit", localize "STR_antistasi_garrisons_AI_Recruit_full"] call A3A_fnc_customHint;};

private _unit = [group player, _typeUnit, position player, [], 0, "NONE"] call A3A_fnc_createUnit;

if (!isMultiPlayer) then {
	_nul = [-1, - _costs] remoteExec ["A3A_fnc_resourcesFIA",2];
} else {
	_nul = [-1, 0] remoteExec ["A3A_fnc_resourcesFIA",2];
	[- _costs] call A3A_fnc_resourcesPlayer;
	[localize "STR_antistasi_garrisons_AI_Recruit", localize "STR_antistasi_garrisons_AI_Recruit_recruit"] call A3A_fnc_customHint;
};

[_unit] spawn A3A_fnc_FIAinit;
_unit disableAI "AUTOCOMBAT";
sleep 1;
petros directSay "SentGenReinforcementsArrived";
