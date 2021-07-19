private ["_morty","_helperX"];

{if (_x getVariable ["typeOfSoldier",""] == "StaticMortar") then {_morty = _x} else {_helperX = _x}} forEach _this;

private _groupX = group _morty;
private _faction = Faction(side _groupX);
while {true} do
	{
	_enemyX = _groupX call A3A_fnc_nearEnemy;
	if (isNull _enemyX) exitWith {};
	if (_enemyX distance _morty > 50) exitWith {};
	if ((!alive _morty) or (!alive _helperX)) exitWith {};
	sleep 30;
	};
if ((!alive _morty) or (!alive _helperX)) exitWith {};
private _typeVehX = selectRandom (_faction get "staticMortars"); //this should use the bacpack assembleInfo to get static class
private _pos = [];
while {true} do
	{
	_pos = position _morty findEmptyPosition [1,30,_typeVehX];
	if !(_pos isEqualTo []) exitWith {};
	if ((!alive _morty) or (!alive _helperX)) exitWith {};
	sleep 30;
	};

if ((!alive _morty) or (!alive _helperX)) exitWith {};
_morty setVariable ["maneuvering",true];
while {true} do
	{
	if (_morty distance _pos < 5) exitWith {};
	_morty doMove _pos;
	_helperX doMove _pos;
	if ((!alive _morty) or (!alive _helperX)) exitWith {};
	sleep 10;
	};

if ((!alive _helperX) and (alive _morty)) then
	{
	_morty setVariable ["maneuvering",false];
	_movable = _groupX getVariable ["movable",[]];
	_movable pushBack _morty;
	_groupX setVariable ["movable",_movable];
	_flankers = _groupX getVariable ["flankers",[]];
	_flankers pushBack _morty;
	_groupX setVariable ["flankers",_flankers];
	_morty call A3A_fnc_recallGroup;
	};
if ((alive _helperX) and !(alive _morty)) then
	{
	_movable = _groupX getVariable ["movable",[]];
	_movable pushBack _helperX;
	_groupX setVariable ["movable",_movable];
	_flankers = _groupX getVariable ["flankers",[]];
	_flankers pushBack _helperX;
	_groupX setVariable ["flankers",_flankers];
	_helperX call A3A_fnc_recallGroup;
	};

if ((!alive _morty) or (!alive _helperX)) exitWith {};

private _mortarX = _typeVehX createVehicle _pos;
removeBackpackGlobal _morty;
removeBackpackGlobal _helperX;
_groupX addVehicle _mortarX;
_morty assignAsGunner _mortarX;
[_morty] orderGetIn true;
[_morty] allowGetIn true;
[_mortarX, side _groupX] call A3A_fnc_AIVEHinit;
_movable = _groupX getVariable ["movable",[]];
_movable pushBack _helperX;
_groupX setVariable ["movable",_movable];
_flankers = _groupX getVariable ["flankers",[]];
_flankers pushBack _helperX;
_groupX setVariable ["flankers",_flankers];
_helperX call A3A_fnc_recallGroup;

waitUntil {sleep 1; (vehicle _morty == _mortarX) or !(alive _morty) or !(alive _mortarX)};

if !(alive _morty) exitWith {};

if !(alive _mortarX) exitWith {_morty call A3A_fnc_recallGroup};

_groupX setVariable ["mortarsX",_morty];

_morty addEventHandler ["Killed",
	{
	(group (_this select 0)) setVariable ["mortarsX",objNull];
	}];
