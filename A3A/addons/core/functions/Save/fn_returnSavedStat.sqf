#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_varname", ["_getFromProfile",false]];
A3A_saveTarget params ["_serverID", "_campaignID", "_map"];
if (A3A_useJSONSave && !_getFromProfile) exitWith {
	A3A_jsonSaveDataHM get _varName;
};
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
