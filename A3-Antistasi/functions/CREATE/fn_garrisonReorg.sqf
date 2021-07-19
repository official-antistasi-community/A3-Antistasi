#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
if (count _this <= 8) exitWith {_this};
private _SLcount = {_x in FactionGet(all,"SquadLeaders")} count _this;
private _medCount = {_x in FactionGet(all,"Medics")} count _this;
if ((_SLcount == 0) and (_medCount == 0)) exitWith {_this};
private _pool = +_this;
private _slClass = "";
if (_slCount > 0) then
	{
	_slClass = _this select (_this findIf {_x in FactionGet(all,"SquadLeaders")});
	_pool = _pool - [_slClass];
	};
private _medClass = "";
if (_medCount > 0) then
	{
	_medClass = _this select (_this findIf {_x in FactionGet(all,"Medics")});
	_pool = _pool - [_medClass];
	};
if (_pool isEqualTo []) exitWith {_this};
private _result = [];
while {!(_pool isEqualTo [])} do
	{
	_squad = [];
	_countX = 8;
	if (_slCount > 0) then
		{
		_squad pushBack _slClass;
		_slCount = _slCount - 1;
		_countX = _countX - 1;
		};
	if (_medCount > 0) then
		{
		_countX = _countX - 1;
		if (_countX > (count _pool)) then {_countX = count _pool};
		for "_i" from 1 to _countX do
			{
			_squad pushBack (_pool select 0);
			_pool deleteAt 0;
			};
		_squad pushBack _medClass;
		_medCount = _medCount - 1;
		}
	else
		{
		if (_countX > (count _pool)) then {_countX = count _pool};
		for "_i" from 1 to _countX do
			{
			_squad pushBack (_pool select 0);
			_pool deleteAt 0;
			};
		};
	_result append _squad;
	};
if (_slCount > 0) then
	{
	for "_i" from 1 to _slCount do
		{
		_result pushBack _slClass;
		};
	};
if (_medCount > 0) then
	{
	for "_i" from 1 to _slCount do
		{
		_result pushBack _medClass;
		};
	};
_result
