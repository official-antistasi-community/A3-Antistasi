#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
private _groupData = FactionGet(reb,"groups");
#define GROUP(VAR) (_groupData get VAR)
private ["_unit","_skill"];
_unit = _this select 0;
if (debug) then {
    Debug_1("Unit: %1", _unit);
};
if ((isNil "_unit") || (isNull _unit)) exitWith {
    Error_1("Problem with NATO Param: %1", _this);
	};
_markerX = "";
if (count _this > 1) then
	{
	_markerX = _this select 1;
	_unit setVariable ["markerX",_markerX,true];
	if ((spawner getVariable _markerX != 0) and (vehicle _unit != _unit)) then
		{
		if (!isMultiplayer) then
			{
			_unit enableSimulation false
			}
		else
			{
			[_unit,false] remoteExec ["enableSimulationGlobal",2]
			}
		};
	};
[_unit] call A3A_fnc_initRevive;

_unit allowFleeing 0;
_typeX = _unit getVariable "unitType";
_skill = (0.6 / skillMult + 0.015 * skillFIA);
_unit setSkill _skill;

if (_typeX isEqualTo GROUP("SL")) then {
	_unit setskill ["courage",_skill + 0.2];
	_unit setskill ["commanding",_skill + 0.2];
};
if (_typeX isEqualTo GROUP("Sniper")) then {
	_unit setskill ["aimingAccuracy",_skill + 0.2];
	_unit setskill ["aimingShake",_skill + 0.2];
};

[_unit, 2] call A3A_fnc_equipRebel;			// 2 = garrison unit
_unit selectWeapon (primaryWeapon _unit);


_EHkilledIdx = _unit addEventHandler ["killed", {
	_victim = _this select 0;
	_killer = _this select 1;
	[_victim] remoteExec ["A3A_fnc_postmortem",2];
	if (isPlayer _killer) then
		{
		if (!isMultiPlayer) then
			{
			_nul = [0,20] remoteExec ["A3A_fnc_resourcesFIA",2];
			_killer addRating 1000;
			};
		};
    [side _killer, -1, 30] remoteExec ["A3A_fnc_addAggression", 2];
	if (side _killer == Occupants) then
	{
		[0,-0.25,getPos _victim] remoteExec ["A3A_fnc_citySupportChange",2];
	};
	_markerX = _victim getVariable "markerX";
	if (!isNil "_markerX") then
		{
		if (sidesX getVariable [_markerX,sideUnknown] == teamPlayer) then
			{
			[_victim getVariable "unitType",teamPlayer,_markerX,-1] remoteExec ["A3A_fnc_garrisonUpdate",2];
			_victim setVariable [_markerX,nil,true];
			};
		};
	}];

_revealX = false;
if (vehicle _unit != _unit) then
	{
	if (_unit == gunner (vehicle _unit)) then
		{
			_revealX = true;
			if (debug) then {
                Debug_1("Unit: %1 is mounted gunner.", _unit);
			};
		};
	}
else
	{
	if ((secondaryWeapon _unit) in allMissileLaunchers) then {
			_revealX = true;
			if (debug) then {
                Debug_2("Unit: %1 has launcher: %2.", _unit, (secondaryWeapon _unit));
			};
		};
	};

if (_revealX) then
	{
	{
	_unit reveal [_x,1.5];
	} forEach allUnits select {(vehicle _x isKindOf "Air") and (_x distance _unit <= distanceSPWN)};
	};
