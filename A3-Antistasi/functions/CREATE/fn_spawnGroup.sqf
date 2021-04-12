params ["_positionX","_sideX","_typesX",["_override",false],["_canBypass",false]];
//private ["_groupX","_countX","_countRanks","_LeaderX","_unitsX","_index","_positionX","_sideX","_typesX","_override","_canBypass"];
private ["_groupX","_countX","_countRanks","_LeaderX","_unitsX","_index"];

/*_positionX = _this select 0;
_sideX = _this select 1;
_typesX = _this select 2;
_override = if (count _this >3) then {_this select 3} else {false};
_canBypass = if (count _this > 4) then {_this select 4} else {false};*/

_allUnits = {(local _x) and (alive _x)} count allUnits;
_allUnitsSide = 0;
_maxUnitsSide = maxUnits;

if (gameMode <3) then
	{
	_allUnitsSide = {(local _x) and (alive _x) and (side group _x == _sideX)} count allUnits;
	_maxUnitsSide = round (maxUnits * 0.7);
	};
if (_canBypass) then
	{
	if ((_allUnits + 1 <= maxUnits) or (_allUnitsSide + 1 <= _maxUnitsSide)) then {_canBypass = false};
	};
if (_canBypass) exitWith {grpNull};
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
	if ((_i == 0) or (((_allUnits + 1) < maxUnits) and ((_allUnitsSide + 1) < _maxUnitsSide)) or _override) then
		{
		_unit = [_groupX, (_typesX select _i), _positionX, [], 0, "NONE"] call A3A_fnc_createUnit;
		_unit allowDamage false;
		_allUnits = _allUnits + 1;
		_allUnitsSide = _allUnitsSide + 1;
		if (_i <= _countRanks) then
			{
			_unit setRank (_ranks select _i);
			};
		if ((_typesX select _i) in squadLeaders) then {_groupX selectLeader _unit};
		sleep 0.25;
		};
	};
//_unitsX = units _groupX;
//_index = _unitsX findIf {(typeOf _x in squadLeaders)};
//if (_index == -1) then {_groupX selectLeader (_unitsX select 0)} else {_groupX selectLeader (_unitsX select _index)};
{_x allowDamage true} forEach units _groupX;
_groupX
