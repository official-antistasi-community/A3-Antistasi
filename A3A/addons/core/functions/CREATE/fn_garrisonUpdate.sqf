#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!isServer) exitWith {};
private ["_typeX","_sideX","_markerX","_modeX","_garrison","_subType"];
//ModeX: -1 to remove 1 unbit (killed EHs etc). 1 add 1 single classname / object. 2 adds a hole array and admits classnames or objects
params ["_typeX", "_sideX", "_markerX", "_modeX"];
if (isNil "_typeX") exitWith {};
if (_typeX isEqualType []) then {
	if ((_typeX select 0) isEqualType objNull) then {
		_subType = [];
		{
		    _subType pushBack (_x getVariable "unitType");
		} forEach _typeX;
		_typeX = _subType;
	};
} else {
	if (_typeX isEqualType objNull) then {_typeX = _typeX getVariable "unitType"};
};

if !(_markerX isEqualType "") exitWith {
	Error_1("Failed to update Garrison at Position:%1", _this);
};

_exit = false;
{
    if (isNil _x) exitWith {_exit = true}
} forEach ["_typeX","_sideX","_markerX","_modeX"];
if (_exit) exitWith {
    Error_1("Failed to update Garrison with params:%1",_this);
};

waitUntil {!garrisonIsChanging};
garrisonIsChanging = true;
if ((_sideX == Occupants) and (!(sidesX getVariable [_markerX,sideUnknown] == Occupants))) exitWith {garrisonIsChanging = false};
if ((_sideX == Invaders) and (!(sidesX getVariable [_markerX,sideUnknown] == Invaders))) exitWith {garrisonIsChanging = false};
if ((_sideX == teamPlayer) and (!(sidesX getVariable [_markerX,sideUnknown] == teamPlayer))) exitWith {garrisonIsChanging = false};

_garrison = [];
_garrison = _garrison + (garrison getVariable [_markerX,[]]);
if (_modeX == -1) then
	{
	for "_i" from 0 to (count _garrison -1) do
		{
		if (_typeX == (_garrison select _i)) exitWith {_garrison deleteAt _i};
		};
	}
else
	{
	if (_modeX == 1) then {_garrison pushBack _typeX} else {_garrison append _typeX};
	};
if (isNil "_garrison") exitWith {garrisonIsChanging = false};
garrison setVariable [_markerX,_garrison,true];
if (_sideX == teamPlayer) then {[_markerX] call A3A_fnc_mrkUpdate};
garrisonIsChanging = false;

["updateGarrisonTab"] remoteExecCall ["A3A_GUI_fnc_hqDialog", theBoss];
