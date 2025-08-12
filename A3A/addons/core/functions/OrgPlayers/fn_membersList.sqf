private _titleStr = localize "STR_A3A_fn_orgp_memList_titel";

if !(membershipEnabled) exitWith {[_titleStr, localize "STR_A3A_fn_orgp_memList_no_disabled"] call A3A_fnc_customHint;};
private ["_countX"];
_textX = localize "STR_A3A_fn_orgp_memList_members";
_countN = 0;

{
_playerX = _x getVariable ["owner",objNull];
if (!isNull _playerX) then
	{
	//_uid = getPlayerUID _playerX;
	if ([_playerX] call A3A_fnc_isMember) then {_textX = format ["%1%2<br/>",_textX,name _playerX]} else {_countN = _countN + 1};
	};
} forEach (call A3A_fnc_playableUnits);

_textX = format [localize "STR_A3A_fn_orgp_memList_members_count",_textX,_countN];

[_titleStr, _textX] call A3A_fnc_customHint;
