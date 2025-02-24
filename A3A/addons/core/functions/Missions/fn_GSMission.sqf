/*
 * File: fn_GSMission.sqf
 * Function: 
 * Author: <author>
 * Function description
 * Implements the convoy mission that the gunshop spawns
 * Public: No
 */



#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_totalCost", "_gunshopList"];

if (!isServer and hasInterface) exitWith {};


// spawn a petros look alike


// does




private _possibleMarkers = [];

// only do the city convoys on flip?
private _markers = (airportsX + resourcesX + factories + seaports + outposts - blackListDest);
// Pre-filter the possible source bases to make this less n-squared
private _possibleBases = (airportsX + seaports + outposts) select { (getMarkerPos _x) distance (getMarkerPos respawnTeamPlayer) < distanceMission + 8000 };
private _convoyPairs = [];
{
	private _site = _x;
	if ((getMarkerPos _site) distance (getMarkerPos respawnTeamPlayer) > distanceMission) then {continue};
	if (sidesX getVariable [_site, teamPlayer] == teamPlayer) then {continue};
	private _base = [_site, _possibleBases] call A3A_fnc_findBasesForConvoy;
	if (_base != "") then {
		_possibleMarkers pushBack _site;
		_convoyPairs pushBack [_site, _base];
	};
} forEach _markers;
if (count _possibleMarkers == 0) then
{
	[petros,"globalChat",localize "STR_A3A_fn_mission_request_noConvoy"] remoteExec ["A3A_fnc_commsMP",theBoss];
	[petros,"hint",localize "STR_A3A_fn_mission_request_noConvoyHint", _titleStr] remoteExec ["A3A_fnc_commsMP",theBoss];
} else {
	private _args = selectRandom _convoyPairs;
	_args append ["GunShop","legacy",-1, _totalCost, _gunshopList];
	[_args,"A3A_fnc_convoy"] remoteExec ["A3A_fnc_scheduler",2];
};

ServerInfo_1("_possibleMarkers %1",_possibleMarkers);


