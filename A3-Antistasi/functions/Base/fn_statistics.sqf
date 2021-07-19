#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
if (!hasInterface) exitWith {};
private ["_textX","_display","_setText"];
//sleep 3;
disableSerialization;
//waitUntil {!isNull (uiNameSpace getVariable "H8erHUD")};
if (isNull (uiNameSpace getVariable "H8erHUD")) exitWith {};
_display = uiNameSpace getVariable "H8erHUD";
if (isNil "_display") exitWith {};
waitUntil {sleep 0.5;!(isNil "theBoss")};
_setText = _display displayCtrl 1001;
_setText ctrlSetBackgroundColor [0,0,0,0];

private _player = player getVariable ["owner",player];		// different, if remote-controlling
private _ucovertxt = ["Off", "<t color='#1DA81D'>On</t>"] select ((captive _player) and !(_player getVariable ["incapacitated",false]));

if (!isMultiplayer) then
	{
	_textX = format ["<t size='0.67' shadow='2'>" + "HR: %1 | %9 Money: %2 € | Airstrikes: %5 | %7 Aggr: %3 | %8 Aggr: %4 | War Level: %6 | Undercover Mode: %10", server getVariable "hr", server getVariable "resourcesFIA",[aggressionLevelOccupants] call A3A_fnc_getAggroLevelString,[aggressionLevelInvaders] call A3A_fnc_getAggroLevelString,floor bombRuns,tierWar,FactionGet(occ,"name"),FactionGet(inv,"name"),FactionGet(reb,"name"),_ucovertxt];
	}
else
	{
	if (_player != theBoss) then
		{
		private _nameC = if !(isNull theBoss) then {name theBoss} else {"None"};
		_textX = format ["<t size='0.67' shadow='2'>" + "Commander: %3 | Rank: %2 | HR: %1 | Your Money: %4 € | %8 Aggr: %5 | %9 Aggr: %6 | War Level: %7 | Undercover Mode: %10", server getVariable "hr", rank _player, _nameC, _player getVariable "moneyX",[aggressionLevelOccupants] call A3A_fnc_getAggroLevelString,[aggressionLevelInvaders] call A3A_fnc_getAggroLevelString,tierWar,FactionGet(occ,"name"),FactionGet(inv,"name"),_ucovertxt];
		}
	else
		{
		if ([_player] call A3A_fnc_isMember) then
			{
			_textX = format ["<t size='0.67' shadow='2'>" + "Rank: %5 | HR: %1 | Your Money: %6 € | %11 Money: %2 € | Airstrikes: %7 | %9 Aggr: %3 | %10 Aggr: %4 | War Level: %8 | Undercover Mode: %12", server getVariable "hr", server getVariable "resourcesFIA", [aggressionLevelOccupants] call A3A_fnc_getAggroLevelString,[aggressionLevelInvaders] call A3A_fnc_getAggroLevelString,rank _player, _player getVariable "moneyX",floor bombRuns,tierWar,FactionGet(occ,"name"),FactionGet(inv,"name"),FactionGet(reb,"name"),_ucovertxt];
			}
		else
			{
			_textX = format ["<t size='0.67' shadow='2'>" + "Rank: %1 | Your Money: %2 € | %3 Money: %4 € | %5 Aggr: %6 | %7 Aggr: %8 | War Level: %9 | Undercover Mode: %10",rank _player,_player getVariable "moneyX",FactionGet(reb,"name"),server getVariable "resourcesFIA", FactionGet(occ,"name"), [aggressionLevelOccupants] call A3A_fnc_getAggroLevelString, FactionGet(inv,"name"),[aggressionLevelInvaders] call A3A_fnc_getAggroLevelString,tierWar,_ucovertxt];
			};
		};
	};

//if (captive player) then {_textX = format ["%1 ON",_textX]} else {_textX = format ["%1 OFF",_textX]};
_setText ctrlSetStructuredText (parseText format ["%1", _textX]);
_setText ctrlCommit 0;
