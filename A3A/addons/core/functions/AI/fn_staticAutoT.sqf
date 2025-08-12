#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
private ["_LeaderX","_static","_groupX","_maxCargo"];
private _titleStr = localize "STR_A3A_fn_ai_staticautot_title";

if (count hcSelected player != 1) exitWith {[_titleStr, localize "STR_A3A_fn_ai_staticautot_mustselect"] call A3A_fnc_customHint;};

_groupX = (hcSelected player select 0);

_static = objNull;

{
if (vehicle _x isKindOf "staticWeapon") then {_static = vehicle _x;}
} forEach units _groupX;
if (isNull _static) exitWith {[_titleStr, localize "STR_A3A_fn_ai_staticautot_notmounted"] call A3A_fnc_customHint;};

if ((typeOf _static in FactionGet(reb,"staticMortars")) and (isMultiPlayer)) exitWith {[_titleStr, localize "STR_A3A_fn_ai_staticautot_notavailable"] call A3A_fnc_customHint;};
if (_groupX getVariable "staticAutoT") exitWith
	{
	_groupX setVariable ["staticAutoT",false,true];

	if (typeOf _static in FactionGet(reb,"staticMortars")) then {
		[_groupX] call A3A_fnc_artilleryAdd;
	};

	sleep 5;
	[_titleStr, format [localize "STR_A3A_fn_ai_staticautot_autotarget_off", groupID _groupX]] call A3A_fnc_customHint;
	};

[_titleStr, format [localize "STR_A3A_fn_ai_staticautot_autotarget_on", groupID _groupX]] call A3A_fnc_customHint;
_groupX setVariable ["staticAutoT",true,true];

if (typeOf _static in FactionGet(reb,"staticMortars")) exitWith {
	[_groupX] call A3A_fnc_artilleryAdd;
};

_LeaderX = leader _groupX;
_truckX = vehicle _LeaderX;
_boy = gunner _static;
while {(count (waypoints _groupX)) > 0} do
	{
  	deleteWaypoint ((waypoints _groupX) select 0);
 	};

while {true} do
	{
	if ((!alive _LeaderX) or (!alive _truckX) or (!alive _boy) or (!alive _static) or (!someAmmo _static) or (!canMove _truckX) or (not(_groupX getVariable "staticAutoT"))) exitWith {};
	_enemyX = assignedTarget _static;
	if (!isNull _enemyX) then
		{
		_dirRel = [_enemyX,_truckX] call BIS_fnc_dirTo;
		_dirCam = getDir _truckX;
		_dirMax = ((_dirRel + 45) % 360);
		_dirMin = ((_dirRel - 45) % 360);
		if ((_dirCam > _dirMax) or (_dirCam < _dirMin)) then
			{
			_mts = 5*(round (0.28*(speed _enemyX)));
			_exitpos = [getPos _enemyX, _mts, getDir _enemyX] call BIS_Fnc_relPos;
			_dirRel = [_exitPos,_truckX] call BIS_fnc_dirTo;
			_pos = [_exitPos,(40+(_exitPos distance _truckX)),_dirRel] call BIS_fnc_relPos;
			_truckX stop false;
			_truckX doMove _pos;
			}
		else
			{
			_truckX stop true;
			};
		};
	sleep 5;
	};
_truckX stop true;
