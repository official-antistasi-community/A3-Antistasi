#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

#define BARRAGEINTERVAL 10

params ["_units","_typeAmmunition","_shortName","_strikeType","_rounds","_startPos","_detail"];
private _mainFuncParams = _this;
private _ang = 0;

_roundPlural = if (round _rounds == 1) then {localize "STR_A3A_fn_ai_artySupport_singleRound"} else {localize "STR_A3A_fn_ai_artySupport_multiRound"};
_textX = format [localize "STR_A3A_fn_ai_artySupport_fireMission", mapGridPosition _startPos, round _rounds, _roundPlural];
[theBoss,"sideChat",_textX] remoteExec ["A3A_fnc_commsMP",[teamPlayer,civilian]];

private _eta = (_units#0) getArtilleryETA [_startPos, ((getArtilleryAmmo [_units#0])#0)];
_textX = if (_rounds == 1) then {
	format [localize "STR_A3A_fn_ai_artySupport_yesSingle",round _eta];
} else {
	format [localize "STR_A3A_fn_ai_artySupport_yesBarrage",round _eta]
};
[petros,"sideChat",_textX] remoteExec ["A3A_fnc_commsMP",[teamPlayer,civilian]];
private _strikeTime = time + _eta;
[_mainFuncParams, _strikeTime] remoteExec ["A3A_fnc_artySupportMarkers",2];

_startPos = [_startPos,random 10,random 360] call BIS_fnc_relPos; // close by target position, they're not 100% accurate

private _intervalHM = createHashMapFromArray [
		["point",0],
		["barrage",0],
		["suppress",8],
		["cont", _detail]
	];
private _interval = _intervalHM get _strikeType;
private _roundsPerUnit = floor (_rounds / (count _units));
private _ang = if (_strikeType == "barrage") then {_startPos getDir _detail} else {0};
{
	[_x, _roundsPerUnit, _typeAmmunition, _strikeType, _startPos, _interval, _ang, _detail] spawn {
		params ["_piece", "_rounds", "_ammo", "_strikeType", "_startPos", "_interval", "_ang", "_radius"];

		private _eh = _piece addEventHandler ["Fired", { _this#0 setVariable ["A3A_artyFired", true] }];

		private _pos = [_startPos,random 10,random 360] call BIS_fnc_relPos; // close by target position, they're not 100% accurate;
		for "_r" from 1 to _rounds do
		{
			Trace_1("Firing round %1", _r);
			_piece setVariable ["A3A_artyFired", nil];
			_piece commandArtilleryFire [_pos,_ammo,1];
			if (_strikeType == "barrage") then
			{
				_pos = [_pos,BARRAGEINTERVAL,_ang + 5 - (random 10)] call BIS_fnc_relPos;
			};
			if (_strikeType == "suppress") then 
			{
				_pos = [_startPos, _radius * sqrt random 1, random 360] call BIS_fnc_relPos;
			};

			private _timeout = time + 20;
			sleep _interval;
			waitUntil { sleep 0.1; !(_piece isNil "A3A_artyFired") or time > _timeout };
			if (_piece isNil "A3A_artyFired") exitWith {
				private _weaponState = weaponState [_piece, [0]];
				Error_2("Arty failed to fire round #%1; order %2; state %3", _r, _this, _weaponState);
			};
			waitUntil {
				sleep 0.1;
				weaponState [_piece, [0]] params ["", "", "", "", "", "_reloadPhase", "_magPhase"];
				_reloadPhase max _magPhase == 0;
			};
		};
		_piece removeEventHandler ["Fired", _eh];
		_piece setVariable ["A3A_artyInUse", nil, true];
	};
} forEach _units; // all mortar gunners	 JJ: Lies, this is mortar vehicles