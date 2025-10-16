#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if (!visibleMap) then {openMap true}; 

positionTel = [];
onMapSingleClick "positionTel = _pos;";

["", player] remoteExecCall ["A3A_fnc_showSiteInfo", 2];        // show the initial info

while {visibleMap} do
{
	sleep 0.1;
	if (positionTel isEqualTo []) then { continue };

	private _positionTel = positionTel;
	private _siteX = [markersX + outpostsFIA, _positionTel] call BIS_Fnc_nearestPosition;
    [_siteX, player] remoteExecCall ["A3A_fnc_showSiteInfo", 2];
    positionTel = [];
};

onMapSingleClick "";
