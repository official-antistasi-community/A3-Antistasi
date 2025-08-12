#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
private ["_markerX","_nameDest","_nameENY"];

params ["_markerX", "_sideEny", "_sideX", ["_roadblockTemp", true]];

if ([_markerX] call BIS_fnc_taskExists) exitWith {};

_nameDest = [_markerX] call A3A_fnc_localizar;
_nameENY = if (_sideEny == teamPlayer) then
{
	FactionGet(reb,"name")
}
else
{
	if (_sideEny == Invaders) then {FactionGet(inv,"name")} else {FactionGet(occ,"name")};
};
if (_sideX == teamPlayer) then {_sideX = [teamPlayer,civilian]};

[_sideX,_markerX,[format [localize "STR_A3A_fn_mission_unatt_text",_nameDest,_nameENY],format [localize "STR_A3A_fn_mission_unatt_titel",_nameENY],_markerX],getMarkerPos _markerX,false,0,true,"Defend",true] call BIS_fnc_taskCreate;

if (_sideX isEqualType []) then {_sideX = teamPlayer};

// Terminate on despawn, capture or ten minutes since last injury
waitUntil {
	sleep 10;
	(sidesX getVariable [_markerX,sideUnknown] != _sideX) or
	(_roadblockTemp && {spawner getVariable _markerX == 2}) or
	((garrison getVariable [_markerX + "_lastAttack", 0]) + 600 < serverTime)
};

[_markerX] call BIS_fnc_deleteTask;
