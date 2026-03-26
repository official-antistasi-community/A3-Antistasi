params ["_typeUnit"];

if !([player] call A3A_fnc_isMember) exitWith {localize "STR_A3A_fn_reinf_reinfPlayer_no_member"};

if (recruitCooldown > time) exitWith {format [localize "STR_A3A_fn_reinf_reinfPlayer_no_wait",round (recruitCooldown - time)]};

if (player != player getVariable ["owner",player]) exitWith {localize "STR_A3A_fn_reinf_reinfPlayer_no_controlling"};

if ([getPosATL player] call A3A_fnc_enemyNearCheck) exitWith {localize "STR_A3A_fn_reinf_reinfPlayer_no_enemy"};

if (player != leader group player) exitWith {localize "STR_A3A_fn_reinf_reinfPlayer_no_lead"};

if ((count units group player) + (count units stragglers) > 9) exitWith {localize "STR_A3A_fn_reinf_reinfPlayer_no_full"};

private _hasWeapons = [_typeUnit] call A3A_fnc_hasWeapons;
if !(_hasWeapons) exitWith {localize "STR_A3A_fn_reinf_reinfPlayer_no_weapons"};

private _hr = server getVariable "hr";
if (_hr < 1) exitWith {localize "STR_A3A_fn_reinf_reinfPlayer_no_hr"};

private _costs = server getVariable _typeUnit;
private _resources = if (player == theBoss) then { server getVariable "resourcesFIA" } else { player getVariable "moneyX" };
if (_costs > _resources) exitWith {format [localize "STR_A3A_fn_reinf_reinfPlayer_no_money",_costs]};

"";