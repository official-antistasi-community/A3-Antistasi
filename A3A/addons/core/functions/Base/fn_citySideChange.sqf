// Side change function for cities
// forceSupport is optional numerical cap value for support

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

Trace_1("Called with %1", _this);

params ["_city", "_rebel", ["_forceSupport", -1]];

private _cityData = A3A_cityData getVariable _city;

if (_rebel) then {
	["TaskSucceeded", ["", format [localize "STR_A3A_fn_init_resourceCheck_cityChange",_city,FactionGet(reb,"name")]]] remoteExec ["BIS_fnc_showNotification",teamPlayer];
	if (_forceSupport >= 0) then { _cityData set [1, _forceSupport max _cityData#1] };
	sidesX setVariable [_city, teamPlayer, true];
	[Occupants, 10, 60] spawn A3A_fnc_addAggression;
	[_cityData#2 max 0, 0] spawn A3A_fnc_resourcesFIA;
	[_city, teamPlayer] call A3A_fnc_garrisonServer_changeSide;
	//[_city] call A3A_fnc_deleteNearSites;
} else {
	["TaskFailed", ["", format [localize "STR_A3A_fn_init_resourceCheck_cityChange",_city,FactionGet(occ,"name")]]] remoteExec ["BIS_fnc_showNotification",teamPlayer];
	if (_forceSupport >= 0) then { _cityData set [1, _forceSupport min _cityData#1] };
	sidesX setVariable [_city, Occupants, true];
	[Occupants, -10, 45] spawn A3A_fnc_addAggression;
	[_city, Occupants] call A3A_fnc_garrisonServer_changeSide;
};

_cityData set [2, _cityData#2 min 0];					// clear accumulated HR if positive
A3A_cityData setVariable [_city, _cityData, true];		// publish. Some client-side stuff needs support data
[_city] call A3A_fnc_mrkUpdate;
