#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params [["_mode","",[""]],["_target",objNull,[objNull]]];

private _titleStr = localize "STR_A3A_fn_orgp_memAdd_titel";

if (!(serverCommandAvailable "#logout") and (!isServer)) exitWith {[_titleStr, localize "STR_A3A_fn_orgp_memAdd_no_admin"] call A3A_fnc_customHint;};

if !(membershipEnabled) exitWith {[_titleStr, localize "STR_A3A_fn_orgp_memAdd_no_disabled"] call A3A_fnc_customHint;};

if (isNil "membersX") exitWith {[_titleStr, localize "STR_A3A_fn_orgp_memAdd_no_initialised"] call A3A_fnc_customHint;};

if (_target isEqualTo objNull) then {
	_target = cursortarget;
};
if (!isPlayer _target) exitWith {[_titleStr, localize "STR_A3A_fn_orgp_memAdd_no_pointing"] call A3A_fnc_customHint;};
_uid = getPlayerUID _target;
if ((_mode == "add") and ([_target] call A3A_fnc_isMember)) exitWith {[_titleStr, localize "STR_A3A_fn_orgp_memAdd_no_already"] call A3A_fnc_customHint;};
if ((_mode == "remove") and  !([_target] call A3A_fnc_isMember)) exitWith {[_titleStr, localize "STR_A3A_fn_orgp_memAdd_no_not"] call A3A_fnc_customHint;};

if (_mode == "add") then
	{
	membersX pushBackUnique _uid;
	ServerInfo_4("Admin %1 (ID: %2) has added %3 (ID: %4) to the server members list.", name player, getPlayerUID player, name _target, _uid);
	_target setVariable ["eligible", true, true];
	[_titleStr, format [localize "STR_A3A_fn_orgp_memAdd_added_other",name _target]] call A3A_fnc_customHint;
	[_titleStr, localize "STR_A3A_fn_orgp_memAdd_added_you"] remoteExec ["A3A_fnc_customHint", _target];
	}
else
	{
	membersX = membersX - [_uid];
	ServerInfo_4("Admin %1 (ID: %2) has removed %3 (ID: %4) from the server members list.", name player, getPlayerUID player, name _target, _uid);
	[_titleStr, format [localize "STR_A3A_fn_orgp_memAdd_removed_other",name _target]] call A3A_fnc_customHint;
	[_titleStr, localize "STR_A3A_fn_orgp_memAdd_removed_you"] remoteExec ["A3A_fnc_customHint", _target];
	};
publicVariable "membersX";
