#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if (!isServer and hasInterface) exitWith {};

private ["_markerX","_positionX","_isRoad","_radiusX","_road","_veh","_groupX","_unit","_roadcon"];

_markerX = _this select 0;
_positionX = getMarkerPos _markerX;

_isRoad = false;
if (isOnRoad _positionX) then {_isRoad = true};

if (_isRoad) then
	{
	_radiusX = 1;
	_garrison = garrison getVariable [_markerX, []];
	_veh = objNull;

	if (isNil "_garrison") then
		{//this is for backward compatibility, remove after v12
		_garrison = FactionGet(reb,"groupAT");
		_garrison pushBack FactionGet(reb,"unitCrew");
		garrison setVariable [_markerX,_garrison,true];
		};
	while {true} do
		{
		_road = _positionX nearRoads _radiusX;
		if (count _road > 0) exitWith {};
		_radiusX = _radiusX + 5;
		};
	if (FactionGet(reb,"unitCrew") in _garrison) then
		{
		_roadcon = roadsConnectedto (_road select 0);
		_dirveh = [_road select 0, _roadcon select 0] call BIS_fnc_DirTo;
		_veh = ((FactionGet(reb,"vehiclesLightArmed")) # 0) createVehicle getPos (_road select 0);
		_veh setDir _dirveh + 90;
		_veh lock 3;
		[_veh, teamPlayer] call A3A_fnc_AIVEHinit;
		sleep 1;
		};
	_groupX = [_positionX, teamPlayer, _garrison,true,false] call A3A_fnc_spawnGroup;
	//_unit moveInGunner _veh;
	{[_x,_markerX] spawn A3A_fnc_FIAinitBases; if ((_x getVariable "unitType") == FactionGet(reb,"unitCrew")) then {_x moveInGunner _veh}} forEach units _groupX;
	}
else
	{
	_groupX = [_positionX, teamPlayer, FactionGet(reb,"groupSniper")] call A3A_fnc_spawnGroup;
	_groupX setBehaviour "STEALTH";
	_groupX setCombatMode "GREEN";
	{[_x,_markerX] spawn A3A_fnc_FIAinitBases;} forEach units _groupX;
	};
["locationSpawned", [_markerX, "RebelRoadblock", true]] call EFUNC(Events,triggerEvent);

waitUntil {sleep 1; ((spawner getVariable _markerX == 2)) or ({alive _x} count units _groupX == 0) or (not(_markerX in outpostsFIA))};

if ({alive _x} count units _groupX == 0) then
//if ({alive _x} count units _groupX == 0) then
	{
	outpostsFIA = outpostsFIA - [_markerX]; publicVariable "outpostsFIA";
	markersX = markersX - [_markerX]; publicVariable "markersX";
	sidesX setVariable [_markerX,nil,true];
	_nul = [5,-5,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
	deleteMarker _markerX;
	if (_isRoad) then
		{
		["TaskFailed", ["", localize "STR_A3A_fn_base_roadblockFight_lost"]] remoteExec ["BIS_fnc_showNotification", 0];
		}
	else
		{
		["TaskFailed", ["", localize "STR_A3A_fn_base_crfiaOP2_lostWatchpost"]] remoteExec ["BIS_fnc_showNotification", 0];
		};
	};

waitUntil {sleep 1; (spawner getVariable _markerX == 2) or (not(_markerX in outpostsFIA))};

if (_isRoad) then { if (!isNull _veh) then { deleteVehicle _veh } };
{ deleteVehicle _x } forEach units _groupX;
deleteGroup _groupX;
["locationSpawned", [_markerX, "RebelRoadblock", false]] call EFUNC(Events,triggerEvent);
