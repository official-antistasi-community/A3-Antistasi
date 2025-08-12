#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
private ["_morty0","_mortarX","_pos","_typeX","_b0","_b1","_morty1"];

_groupX = _this select 0;
_morty0 = units _groupX select 0;
_morty1 = units _groupX select 1;
_typeX = _this select 1;
(getArray (configFile/"CfgVehicles"/_typeX/"assembleInfo"/"dissasembleTo")) params ["_b0", "_b1"];
_morty0 setVariable ["typeOfSoldier", if (_typeX in FactionGet(reb,"staticMGs")) then { "StaticGunner" } else { "StaticMortar" }];
while {(alive _morty0) and (alive _morty1)} do
	{
	waitUntil {sleep 1; {((unitReady _x) and (alive _x))} count units _groupX == count units _groupX};
	_pos = getPosATL _morty0 findEmptyPosition [1,30,_typeX];
	if (_pos isEqualTo []) then { sleep 10; continue };
	_mortarX = _typeX createVehicle _pos;
	removeBackpackGlobal _morty0;
	removeBackpackGlobal _morty1;

// Removed as workaround for probable Arma AI bug with Podnos mortar + long distance (~200m) moves
// After a long move, non-gunner will attempt to move into the second mortar seat unless this is removed
//	_groupX addVehicle _mortarX;

	_morty1 assignAsGunner _mortarX;
	[_morty1] orderGetIn true;
	[_morty1] allowGetIn true;
	[_mortarX, side _groupX] call A3A_fnc_AIVEHinit;

	waitUntil {sleep 1; ({!(alive _x)} count units _groupX != 0) or !(unitReady _morty0)};

	if (({(alive _x)} count units _groupX == count units _groupX) and !(unitReady _morty0)) then
		{
		if (!isNil "_b0") then {
			_morty0 addBackpackGlobal _b0;
			_morty1 addBackpackGlobal _b1;
		};
		unassignVehicle _morty1;
		moveOut _morty1;
		deleteVehicle _mortarX;
		};
	};
