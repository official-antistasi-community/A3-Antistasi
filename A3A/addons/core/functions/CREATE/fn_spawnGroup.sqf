#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_positionX","_sideX","_typesX",["_override",false],["_canBypass",false]];
//private ["_groupX","_countX","_countRanks","_LeaderX","_unitsX","_index","_positionX","_sideX","_typesX","_override","_canBypass"];
private ["_groupX","_countX","_countRanks","_LeaderX","_unitsX","_index"];

/*_positionX = _this select 0;
_sideX = _this select 1;
_typesX = _this select 2;
_override = if (count _this >3) then {_this select 3} else {false};
_canBypass = if (count _this > 4) then {_this select 4} else {false};*/

Debug_2("Side: %1 spawning group composition: %2", _sideX, _typesX);
_groupX = createGroup _sideX;
_ranks = ["LIEUTENANT","SERGEANT","CORPORAL"];
_countX = count _typesX;
if (_countX < 4) then
	{
	_ranks = _ranks - ["LIEUTENANT","SERGEANT"];
	}
else
	{
	if (_countX < 8) then {_ranks = _ranks - ["LIEUTENANT"]};
	};
_countRanks = (count _ranks - 1);
for "_i" from 0 to (_countX - 1) do
{
	_unit = [_groupX, (_typesX select _i), _positionX, [], 0, "NONE"] call A3A_fnc_createUnit;
	_unit allowDamage false;
	if (_i <= _countRanks) then { _unit setRank (_ranks select _i) };
	if ((_typesX select _i) in FactionGet(all,"SquadLeaders")) then {_groupX selectLeader _unit};
	sleep 0.25;
};
{_x allowDamage true} forEach units _groupX;
_groupX
