private ["_unit","_enemiesX"];
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
_unit = _this select 0;

//dress unit
_unit setUnitLoadout (configFile >> "EmptyLoadout");
_unit forceAddUniform selectRandom (A3A_faction_civ get "uniforms");
_unit addHeadgear selectRandom (A3A_faction_civ get "headgear");

_unit setSkill 0;
_unit disableAI "TARGET";
_unit disableAI "AUTOTARGET";
//Stops civilians from shouting out commands.
[_unit, "NoVoice"] remoteExec ["setSpeaker", 0, _unit];

_unit addEventHandler
[
	"HandleDamage",
	{
		private _unit = _this select 0;
		_dam = _this select 2;
		_proy = _this select 4;
		_injurer = _this select 3;
		if(!isNil "_injurer" && isPlayer _injurer) then
		{
			_unit setVariable ["injuredByPlayer", _injurer, true];
			_unit setVariable ["lastInjuredByPlayer", time, true];
		};
		if (_proy == "") then
		{
			if ((_dam > 0.95) and (!isPlayer _injurer)) then {_dam = 0.9};
		};
		_dam
	}
];
_EHkilledIdx = _unit addEventHandler
[
	"killed",
	{
		_victim = _this select 0;
		_killer = _this select 1;
		if (time - (_victim getVariable ["lastInjuredByPlayer", 0]) < 120) then
		{
			_killer = _victim getVariable ["injuredByPlayer", _killer];
		};
		if (isNull _killer) then
		{
			_killer	= _victim;
		};
		if (_victim == _killer) then
		{
			_nul = [-1,-1,getPos _victim] remoteExec ["A3A_fnc_citySupportChange",2];
		}
		else
		{
			if (isPlayer _killer) then
			{
				if (_victim getVariable "unitType" == "C_man_w_worker_F") then {_killer addRating 1000};
				[-10,_killer] call A3A_fnc_playerScoreAdd;
			};
			_multiplier = 1;
			if ((_victim getVariable "unitType") == "C_journalist_F") then {_multiplier = 3};
			//Must be group, in case they're undercover.
			if (side group _killer == teamPlayer) then
			{
                Debug("aggroEvent | Rebels killed a civilian");
				[Occupants, 10 * _multiplier, 60] remoteExec ["A3A_fnc_addAggression",2];
				[1,0,getPos _victim] remoteExec ["A3A_fnc_citySupportChange",2];
			}
			else
			{
				if (side group _killer == Occupants) then
				{
					[Occupants, -5 * _multiplier, 60] remoteExec ["A3A_fnc_addAggression",2];
					[0,1,getPos _victim] remoteExec ["A3A_fnc_citySupportChange",2];
				}
				else
				{
					if (side group _killer == Invaders) then
					{
						[-1,1,getPos _victim] remoteExec ["A3A_fnc_citySupportChange",2];
					};
				};
			};
		};
	}
];
