#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params [["_hr",""],["_resourcesFIA",""]]; // nil protection

if !(_hr isEqualType 0) exitWith {Error("The first parameter, the added HR, must be a number");};
if !(_resourcesFIA isEqualType 0) exitWith {Error("The second parameter, the added money, must be a number");};
waitUntil {!resourcesIsChanging};
resourcesIsChanging = true;

if ((floor _resourcesFIA == 0) and (floor _hr == 0)) exitWith {resourcesIsChanging = false};
private _hrT = server getVariable "hr";
private _resourcesFIAT = server getVariable "resourcesFIA";

_hrT = _hrT + _hr;
_resourcesFIAT = round (_resourcesFIAT + _resourcesFIA);

if (_hrT < 0) then {_hrT = 0};
if (_resourcesFIAT < 0) then {_resourcesFIAT = 0};

server setVariable ["hr",_hrT,true];
server setVariable ["resourcesFIA",_resourcesFIAT,true];
resourcesIsChanging = false;

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
	[petros,"income",_textX] remoteExec ["A3A_fnc_commsMP",theBoss];
	//[] remoteExec ["A3A_fnc_statistics",[teamPlayer,civilian]];
	};
