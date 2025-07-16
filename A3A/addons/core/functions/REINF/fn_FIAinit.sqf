#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private ["_victim","_killer"];

private _unit = _this select 0;

[_unit] call A3A_fnc_initRevive;
_unit setVariable ["spawner",true,true];

_unit allowFleeing 0;
private _typeX = _unit getVariable "unitType";
private _skill = (0.1 + 0.1*A3A_rebelSkillMul + 0.015 * skillFIA);
_unit setSkill _skill;

if (_typeX isEqualTo FactionGet(reb,"unitSL")) then {
	_unit setskill ["courage",_skill + 0.2];
	_unit setskill ["commanding",_skill + 0.2];
};
if (_typeX isEqualTo FactionGet(reb,"unitSniper")) then {
	_unit setskill ["aimingAccuracy",_skill + 0.2];
	_unit setskill ["aimingShake",_skill + 0.2];
};

_unit setUnitTrait ["camouflageCoef",0.8];
_unit setUnitTrait ["audibleCoef",0.8];

// FIAinit is called for liberated refugees/hostages. Don't equip them.
if !(_typeX isEqualTo FactionGet(reb,"unitUnarmed")) then {
	[_unit, [0,1] select (leader _unit != player)] call A3A_fnc_equipRebel;
};
_unit selectWeapon (primaryWeapon _unit);


private _victim = objNull;
private _killer = objNull;

if (player == leader _unit) then {
	_unit setVariable ["owner", player, true];
	_unit addEventHandler ["killed", {
		_victim = _this select 0;
		[_victim] remoteExec ["A3A_fnc_postmortem", 2];
		_killer = _this select 1;
		if (side _killer == Occupants) then {
			_nul = [0.25,0,getPos _victim] remoteExec ["A3A_fnc_citySupportChange",2];
			[Occupants, -1, 30] remoteExec ["A3A_fnc_addAggression",2];
		} else {
			if (side _killer == Invaders) then {
				[Invaders, -1, 30] remoteExec ["A3A_fnc_addAggression",2]
			} else {
				if (isPlayer _killer) then {
					_killer addRating 1000;
				};
			};
		};
		_victim setVariable ["spawner",nil,true];
	}];
	if (captive player) then {[_unit] spawn A3A_fnc_undercoverAI};

	_unit setVariable ["rearming",false];
	if ((!haveRadio) and !(A3A_hasIFA)) then {
		while {alive _unit} do {
			sleep 10;
			if (([player] call A3A_fnc_hasRadio) && (_unit call A3A_fnc_hasARadio)) exitWith {_unit groupChat format ["This is %1, radiocheck OK",name _unit]}; //TODO: Obsolete?
			if (unitReady _unit) then {
				if ((alive _unit) and (_unit distance (getMarkerPos respawnTeamPlayer) > 50) and (_unit distance leader group _unit > 500) and ((vehicle _unit == _unit) or ((typeOf (vehicle _unit)) in arrayCivVeh))) then {
					["", format [localize "STR_A3A_fn_reinf_FIAinit_lost", name _unit]] call A3A_fnc_customHint;
					[_unit] join stragglers;
					if ((vehicle _unit isKindOf "StaticWeapon") or (isNull (driver (vehicle _unit)))) then {unassignVehicle _unit; [_unit] orderGetIn false};
					_unit doMove position player;
					private _timeX = time + 900;
					waitUntil {sleep 1;(!alive _unit) or (_unit distance player < 500) or (time > _timeX)};
					if ((_unit distance player >= 500) and (alive _unit)) then {_unit setPos (getMarkerPos respawnTeamPlayer)};
					[_unit] join group player;
				};
			};
		};
	};
} else {
	_unit addEventHandler ["killed", {
		_victim = _this select 0;
		_killer = _this select 1;
		[_victim] remoteExec ["A3A_fnc_postmortem",2];
		if ((isPlayer _killer) and (side _killer == teamPlayer)) then {
			if (!isMultiPlayer) then {
				_nul = [0,20] remoteExec ["A3A_fnc_resourcesFIA",2];
				_killer addRating 1000;
			};
		} else {
			if (side _killer == Occupants) then {
				_nul = [0.25,0,getPos _victim] remoteExec ["A3A_fnc_citySupportChange",2];
				[Occupants, -1, 30] remoteExec ["A3A_fnc_addAggression",2];
			} else {
				if (side _killer == Invaders) then {
					[Invaders, -1, 30] remoteExec ["A3A_fnc_addAggression",2]
				} else {
					if (isPlayer _killer) then {
						_killer addRating 1000;
					};
				};
			};
		};
		_victim setVariable ["spawner",nil,true];
	}];
};
