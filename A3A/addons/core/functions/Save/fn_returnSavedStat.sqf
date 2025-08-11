#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_varname", ["_getFromProfile",false]];
A3A_saveTarget params ["_serverID", "_campaignID", "_map", ["_jsonData", false]];
_jsonStat = "EMPTY JSON ENTRY";
if (!(_jsonData isEqualTo false) && !_getFromProfile) then {
	if (_jsonData isEqualType false) then {
		_jsonData = ["json",true] call A3A_fnc_returnSavedStat;
	};
	if (_jsonData isEqualType "") then {
		_jsonData = fromJSON _jsonData;
		A3A_saveTarget set [3,_jsonData];
	};
	if (_varName == "json") exitWith {_jsonStat = A3A_saveTarget#3};
	_jsonStat = _jsonData getOrDefault [_varName,"EMPTY JSON ENTRY"];
};
if (_jsonStat isNotEqualTo "EMPTY JSON ENTRY") exitWith {_jsonStat};
// Simple version for new missionProfileNamespace saves
if (_serverID isEqualType false) exitWith {
	missionProfileNamespace getVariable format ["%1%2", _varName, _campaignID];
};

private _saveExt = if (_map == "Tanoa") then {
	format["%1%2%3",_serverID,_campaignID,"WotP"];
} else {
	format["%1%2%3%4",_serverID,_campaignID,"Antistasi",_map];
};

private _varValue = profileNamespace getVariable (_varname + _saveExt);
if (isNil "_varValue") then {
	_spanishVarName = [_varName] call A3A_fnc_translateVariable;
	_varValue = profileNamespace getVariable (_spanishVarName + _saveExt);
};
if (isNil "_varValue") exitWith {};
_varValue;
