/*
 * File: fn_GSConvoy.sqf
 * Function: 
 * Author: <author>
 * Function description
 * Implements the convoy mission that the gunshop spawns
 * Public: No
 */



#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_totalCost", "_gunshopList"]

if (!isServer and hasInterface) exitWith {};


// only do the city convoys on flip?
private _markers = (airportsX + resourcesX + factories + seaports + outposts - blackListDest);
// Pre-filter the possible source bases to make this less n-squared
private _possibleBases = (airportsX + seaports) select { (getMarkerPos _x) distance (getMarkerPos respawnTeamPlayer) < distanceMission + 3000 };
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
    // TODO: handle this
	//if (!_silent) then {
	//	[petros,"globalChat",localize "STR_A3A_fn_mission_request_noConvoy"] remoteExec ["A3A_fnc_commsMP",_requester];
	//	[petros,"hint",localize "STR_A3A_fn_mission_request_noConvoyHint", _titleStr] remoteExec ["A3A_fnc_commsMP",_requester];
	//};
} else {
	private _args = selectRandom _convoyPairs;
	_args append ["GunShop","legacy",-1, _totalCost, _gunshopList];
	[_args,"A3A_fnc_convoy"] remoteExec ["A3A_fnc_scheduler",2];
};




