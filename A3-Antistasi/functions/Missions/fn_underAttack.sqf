private ["_markerX","_nameDest","_nameENY"];

params ["_markerX", "_sideEny", "_sideX", ["_roadblockTemp", true]];

if ([_markerX] call BIS_fnc_taskExists) exitWith {};

_nameDest = [_markerX] call A3A_fnc_localizar;
_nameENY = if (_sideEny == teamPlayer) then
{
	nameTeamPlayer
}
else
{
	if (_sideEny == Invaders) then {nameInvaders} else {nameOccupants};
};
if (_sideX == teamPlayer) then {_sideX = [teamPlayer,civilian]};

[_sideX,_markerX,[format [localize "STR_antistasi_mission_underAttack_text",_nameDest,_nameENY],format [localize "STR_antistasi_mission_underAttack",_nameENY],_markerX],getMarkerPos _markerX,false,0,true,"Defend",true] call BIS_fnc_taskCreate;

if (_sideX isEqualType []) then {_sideX = teamPlayer};

// Terminate on despawn, capture or ten minutes since last injury
waitUntil {
	sleep 10;
	(sidesX getVariable [_markerX,sideUnknown] != _sideX) or
	(_roadblockTemp && {spawner getVariable _markerX == 2}) or
	((garrison getVariable [_markerX + "_lastAttack", 0]) + 600 < serverTime)
};

[_markerX] call BIS_fnc_deleteTask;
