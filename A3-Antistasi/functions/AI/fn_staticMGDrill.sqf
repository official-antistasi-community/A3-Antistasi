#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
private ["_gunner","_helperX"];
private _isMortar = false;
{if (_x getVariable ["typeOfSoldier",""] == "StaticGunner") then {_gunner = _x} else {_helperX = _x}} forEach _this;
{if (_x getVariable ["typeOfSoldier",""] == "StaticMortar") then {_gunner = _x;_isMortar = true} else {_helperX = _x}} forEach _this;
private _groupX = group _gunner;
private _mounted = false;
private _veh = objNull;
private _sideX = side _groupX;
private _faction = Faction(_sideX);
private _typeVehX = 	if !(_isMortar) then
						{
                            _faction get "staticMGs";
						}
					else
						{
                            _faction get "staticMortars";
						};
private _backpckG = backPack _gunner;
private _backpckA = backpack _helperX;
while {(alive _gunner)} do
	{
	if (!(alive _helperX) and !(_mounted)) exitWith {};
	if (!(isNull _veh) and !(alive _veh)) exitWith {};
	_objectivesX = _groupX getVariable ["objectivesX",[]];
	_enemyX = objNull;
	if (!(_objectivesX isEqualTo []) and (((_objectivesX select 0) select 4) distance _gunner > 150))  then
		{
		if !(_isMortar) then
			{
			{
			_eny = _x select 4;
			if !(_eny isKindOf "Tank") then
				{
				if  (([objNull, "VIEW"] checkVisibility [eyePos _eny, eyePos _gunner]) > 0) then
					{
					_enemyX = _eny;
					};
				};
			if !(isNull _enemyX) exitWith {};
			} forEach _objectivesX;
			}
		else
			{
			_enemyX = ((_objectivesX select 0) select 4);
			};
		};
	if !(isNull _enemyX) then
		{
		if !(_mounted) then
			{
			if !(_gunner getVariable ["maneuvering",false]) then
				{
				if (([_gunner] call A3A_fnc_canFight) and ([_helperX] call A3A_fnc_canFight)) then
					{
					_gunner setVariable ["maneuvering",true];
					_gunner playMoveNow selectRandom medicAnims;
					_gunner setVariable ["timeToBuild",time + 30];
					_gunner addEventHandler ["AnimDone",
						{
						private _gunner = _this select 0;
						if ((time > _gunner getVariable ["timeToBuild",0]) or !([_gunner] call A3A_fnc_canFight)) then
							{
							_gunner removeEventHandler ["AnimDone",_thisEventHandler];
							_gunner setVariable ["maneuvering",false];
							}
						else
							{
							_gunner playMoveNow selectRandom medicAnims;
							};
						}];
					waitUntil {sleep 0.5; !(_gunner getVariable ["maneuvering",false])};
					_gunner setVariable ["timeToBuild",nil];
					if ([_gunner] call A3A_fnc_canFight) then
						{
						private _veh = _typeVehX createVehicle [0,0,1000];
						_veh setPos position (_gunner);
						removeBackpackGlobal _gunner;
						removeBackpackGlobal _helperX;
						_groupX addVehicle _veh;
						_gunner assignAsGunner _veh;
						[_gunner] orderGetIn true;
						[_gunner] allowGetIn true;
						_gunner moveInGunner _veh;
						[_veh, side _groupX] call A3A_fnc_AIVEHinit;
						_mounted = true;
						if (_isMortar) then {_groupX setVariable ["mortarsX",_gunner]};
						sleep 60;
						};
					};
				};
			}
		else
			{
			if (_gunner getVariable ["maneuvering",false]) then
				{
				if (([_gunner] call A3A_fnc_canFight) and ([_helperX] call A3A_fnc_canFight)) then
					{
					[_gunner] orderGetIn false;
					[_gunner] allowGetIn false;
					waitUntil {sleep 1; (vehicle _gunner == _gunner) or !(alive _gunner)};
					if (alive _gunner) then
						{
						_mounted = false;
						_gunner addBackpackGlobal _backpckG;
						_helperX addBackpackGlobal _backpckA;
						deleteVehicle _veh;
						_gunner call A3A_fnc_recallGroup;
						if (_isMortar) then {_groupX setVariable ["mortarsX",objNull]};
						};
					};
				};
			};
		}
	else
		{
		if (_mounted) then
			{
			if (([_gunner] call A3A_fnc_canFight) and ([_helperX] call A3A_fnc_canFight)) then
				{
				[_gunner] orderGetIn false;
				[_gunner] allowGetIn false;
				_veh = vehicle _gunner;
				moveOut _gunner;
				_mounted = false;
				_gunner addBackpackGlobal _backpckG;
				_helperX addBackpackGlobal _backpckA;
				deleteVehicle _veh;
				_gunner call A3A_fnc_recallGroup;
				if (_isMortar) then {_groupX setVariable ["mortarsX",objNull]};
				};
			};
		};

	sleep 15;
	};
if (alive _gunner) then
	{
	[_gunner] orderGetIn false;
	[_gunner] allowGetIn false;
	moveOut _gunner;
	_gunner setVariable ["maneuvering",false];
	_flankers = _groupX getVariable ["flankers",[]];
	_flankers pushBack _gunner;
	_groupX setVariable ["flankers",_flankers];
	_gunner call A3A_fnc_recallGroup;
	};
if (alive _helperX) then
	{
	_helperX setVariable ["maneuvering",false];
	_flankers = _groupX getVariable ["flankers",[]];
	_flankers pushBack _helperX;
	_groupX setVariable ["flankers",_flankers];
	_helperX call A3A_fnc_recallGroup;
	};
