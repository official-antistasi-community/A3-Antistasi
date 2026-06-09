#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!hasInterface) exitWith {};
#ifdef UseDoomGUI
    if (true) exitWith { ERROR("Disabled due to UseDoomGUI Switch.") };
#endif
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
if (_player getVariable ["isAFK", false]) then { _ucovertxt = _ucovertxt + " | <t color='#A81D1D'>AFK</t>" };

if (_player != theBoss) then
	{
	private _nameC = if !(isNull theBoss) then {name theBoss} else {"None"};
	_textX = format ["<t size='0.67' shadow='2'>" + localize "STR_A3A_fn_base_statistics_notComm", (server getVariable "hr") toFixed 0, rank _player, _nameC, (_player getVariable "moneyX") toFixed 0,[aggressionLevelOccupants] call A3A_fnc_getAggroLevelString,[aggressionLevelInvaders] call A3A_fnc_getAggroLevelString,tierWar,FactionGet(occ,"name"),FactionGet(inv,"name"),_ucovertxt];
	}
else
	{
	_textX = format ["<t size='0.67' shadow='2'>" + localize "STR_A3A_fn_base_statistics_isComm", (server getVariable "hr") toFixed 0, (server getVariable "resourcesFIA") toFixed 0, [aggressionLevelOccupants] call A3A_fnc_getAggroLevelString,[aggressionLevelInvaders] call A3A_fnc_getAggroLevelString,rank _player, (_player getVariable "moneyX") toFixed 0,floor bombRuns,tierWar,FactionGet(occ,"name"),FactionGet(inv,"name"),FactionGet(reb,"name"),_ucovertxt];
	};

//if (captive player) then {_textX = format ["%1 ON",_textX]} else {_textX = format ["%1 OFF",_textX]};
_setText ctrlSetStructuredText (parseText format ["%1", _textX]);
_setText ctrlCommit 0;
