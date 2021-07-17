if (!(serverCommandAvailable "#logout") and (!isServer)) exitWith {[localize "STR_antistasi_customHint_membership", localize "STR_antistasi_customHint_only_admin"] call A3A_fnc_customHint;};

if !(membershipEnabled) exitWith {[localize "STR_antistasi_customHint_membership", localize "STR_antistasi_customHint_membership_off"] call A3A_fnc_customHint;};

if (isNil "membersX") exitWith {[localize "STR_antistasi_customHint_membership", localize "STR_antistasi_customHint_membership_noInit"] call A3A_fnc_customHint;};

_target = cursortarget;

if (!isPlayer _target) exitWith {[localize "STR_antistasi_customHint_membership", localize "STR_antistasi_customHint_membership_noLook"] call A3A_fnc_customHint;};
_uid = getPlayerUID _target;
if ((_this select 0 == "add") and ([_target] call A3A_fnc_isMember)) exitWith {[localize "STR_antistasi_customHint_membership", localize "STR_antistasi_customHint_membership_already"] call A3A_fnc_customHint;};
if ((_this select 0 == "remove") and  !([_target] call A3A_fnc_isMember)) exitWith {[localize "STR_antistasi_customHint_membership", localize "STR_antistasi_customHint_membership_not_member"] call A3A_fnc_customHint;};

if (_this select 0 == "add") then
	{
	membersX pushBackUnique _uid;
	[localize "STR_antistasi_customHint_membership", format [localize "STR_antistasi_customHint_membership_added",name _target]] call A3A_fnc_customHint;
	[localize "STR_antistasi_customHint_membership", localize "STR_antistasi_customHint_membership_add"] remoteExec ["A3A_fnc_customHint", _target];
	}
else
	{
	membersX = membersX - [_uid];
	[localize "STR_antistasi_customHint_membership", format [localize "STR_antistasi_customHint_membership_removed",name _target]] call A3A_fnc_customHint;
	[localize "STR_antistasi_customHint_membership", localize "STR_antistasi_customHint_membership_remove"] remoteExec ["A3A_fnc_customHint", _target];
	};
publicVariable "membersX";