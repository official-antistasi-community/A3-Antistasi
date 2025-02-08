private _titleStr = localize "STR_A3A_fn_reinf_reinfPlayer_title";

if !([player] call A3A_fnc_isMember) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_reinfPlayer_no_member"] call A3A_fnc_customHint;};

if (recruitCooldown > time) exitWith {[_titleStr, format [localize "STR_A3A_fn_reinf_reinfPlayer_no_wait",round (recruitCooldown - time)]] call A3A_fnc_customHint;};

if (player != player getVariable ["owner",player]) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_reinfPlayer_no_controlling"] call A3A_fnc_customHint;};

if ([getPosATL player] call A3A_fnc_enemyNearCheck) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_reinfPlayer_no_enemy"] call A3A_fnc_customHint;};

if (player != leader group player) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_reinfPlayer_no_lead"] call A3A_fnc_customHint;};

if ((count units group player) + (count units stragglers) > 9) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_reinfPlayer_no_full"] call A3A_fnc_customHint;};

call A3A_fnc_fetchRebelGear;		// Fetch rebel gear from the server if we're out of date

private _weaponHM = createHashMapFromArray [
	[A3A_faction_reb get "unitSniper", "SniperRifles"],
	[A3A_faction_reb get "unitLAT", "RocketLaunchers"],
	[A3A_faction_reb get "unitMG", "MachineGuns"],
	[A3A_faction_reb get "unitGL", "GrenadeLaunchers"],
	[A3A_faction_reb get "unitAA", "MissileLaunchersAA"],
	[A3A_faction_reb get "unitAT", "MissileLaunchersAT"]];

private _typeUnit = _this select 0;
if (A3A_rebelGear getOrDefault [_weaponHM getOrDefault [_typeUnit, ""], false] isEqualTo []) exitWith {
	[_titleStr, localize "STR_A3A_fn_reinf_reinfPlayer_no_weapons"] call A3A_fnc_customHint;
};

private _hr = server getVariable "hr";
if (_hr < 1) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_reinfPlayer_no_hr"] call A3A_fnc_customHint;};
private _costs = server getVariable _typeUnit;

private _resources = if (player == theBoss) then { server getVariable "resourcesFIA" } else { player getVariable "moneyX" };
if (_costs > _resources) exitWith {[_titleStr, format [localize "STR_A3A_fn_reinf_reinfPlayer_no_money",_costs]] call A3A_fnc_customHint;};

private _unit = [group player, _typeUnit, position player, [], 0, "NONE"] call A3A_fnc_createUnit;

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
