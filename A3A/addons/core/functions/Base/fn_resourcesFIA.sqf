#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params [["_hr",""],["_resourcesFIA",""],["_silent",false]]; // nil protection

if !(_hr isEqualType 0) exitWith {Error("The first parameter, the added HR, must be a number");};
if !(_resourcesFIA isEqualType 0) exitWith {Error("The second parameter, the added money, must be a number");};
if ((floor _resourcesFIA == 0) and (floor _hr == 0)) exitWith {};

// The read-modify-write runs unscheduled, so concurrent calls cannot read the same old value and overwrite each
// other. The old resourcesIsChanging flag was checked and set in two scheduled statements, which let two calls in.
// resourcesIsChanging stays declared, and false, for scripts that wait on it.
isNil {
	private _hrT = (server getVariable "hr") + _hr;
	private _resourcesFIAT = round ((server getVariable "resourcesFIA") + _resourcesFIA);

	if (_hrT < 0) then {
		// If we're using more HR than we have (eg. player respawn at 0 HR) then hurt nearby city support
		private _nearCity = citiesX select selectRandom (citiesX inAreaArrayIndexes [markerPos "Synd_HQ", distanceMission, distanceMission]);
		[_hrT, _nearCity] remoteExecCall ["A3A_fnc_citySupportChange", 2];
		_hrT = 0;
	};
	if (_resourcesFIAT < 0) then {_resourcesFIAT = 0};

	server setVariable ["hr",_hrT,true];
	server setVariable ["resourcesFIA",_resourcesFIAT,true];
};

if (_silent) exitWith {};

_textX = "";
_hrSim = "";
if (_hr > 0) then {_hrSim = "+"};
_resourcesFIASim = "";
if (_resourcesFIA > 0) then {_resourcesFIASim = "+"};

_faction = format ["<t size='0.6' color='#C1C0BB'>" + localize "STR_A3A_fn_base_resourcesFIA_resources" + "<br/><br/> ", FactionGet(reb,"name")];
_hr = if (floor _hr == 0) then {""} else {format ["<t size='0.5' color='#C1C0BB'>" + localize "STR_A3A_fn_base_resourcesFIA_hr" + "</t><br/>", _hrSim, _hr toFixed 0];};
_money = if (floor _resourcesFIA == 0) then {""} else {format ["<t size='0.5' color='#C1C0BB'>" + localize "STR_A3A_fn_base_resourcesFIA_money" + "</t>", _resourcesFIASim, _resourcesFIA toFixed 0];};
_textX = _faction + _hr + _money;

if (_textX != "") then
	{
	// The commander and the sub-commanders follow the faction resources, the report also refreshes their top bar
	private _staff = (allPlayers - entities "HeadlessClient_F") select {
		private _body = _x getVariable ["owner", _x];			// different, if remote-controlling
		_body != theBoss and {[_body] call A3A_fnc_isSubCommander}
	};
	if (!isNull theBoss) then { _staff pushBack theBoss };
	if (_staff isNotEqualTo []) then { [petros,"income",_textX] remoteExec ["A3A_fnc_commsMP",_staff] };
	//[] remoteExec ["A3A_fnc_statistics",[teamPlayer,civilian]];
	};
