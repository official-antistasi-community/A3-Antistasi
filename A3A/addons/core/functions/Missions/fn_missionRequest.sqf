#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if(!isServer) exitWith { Error("Server-only function miscalled") };

params ["_type", ["_requester", clientOwner], ["_silent", false]];

waitUntil {isNil "A3A_missionRequestInProgress"};
A3A_missionRequestInProgress = true;

if(isNil "_type") then {
	private _types = ["CON","DES","LOG","SUPP","RES","CONVOY"];
	_type = selectRandom (_types - A3A_activeTasks);
	_silent = true;
};
if (isNil "_type" or leader group petros != petros) exitWith { A3A_missionRequestInProgress = nil };
if (_type in A3A_activeTasks) exitWith {
	if (!_silent) then {[petros,"globalChat",localize "STR_A3A_fn_mission_request_existing"] remoteExec ["A3A_fnc_commsMP",_requester]};
	A3A_missionRequestInProgress = nil;
};

private _findIfNearAndHostile = {
	/*
	Input : single array of markers, do 'array + array' for multiple.
	Returns: array of markers within max mission distance and is not rebel.
	*/
	params ["_Markers"];
	_Markers = _Markers select {(getMarkerPos _x distance2D getMarkerPos respawnTeamPlayer < distanceMission) && (sidesX getVariable [_x,sideUnknown] != teamPlayer)};
	_Markers
};

private _titleStr = localize "STR_A3A_fn_mission_request_title";
private _possibleMarkers = [];
switch (_type) do {
	case "AS": {
		//find apropriate sites
		_possibleMarkers = [airportsX + citiesX] call _findIfNearAndHostile;
		_possibleMarkers = _possibleMarkers select {spawner getVariable _x != 0};
		//add controlsX not on roads and on the 'frontier'
		private _controlsX = [controlsX] call _findIfNearAndHostile;
		private _nearbyFriendlyMarkers = markersX select {
			(getMarkerPos _x inArea [getMarkerPos respawnTeamPlayer, distanceMission+distanceSPWN, distanceMission+distanceSPWN, 0, false])
			and (sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer)
		};
		_nearbyFriendlyMarkers deleteAt (_nearbyFriendlyMarkers find "Synd_HQ");
		{
			private _pos = getmarkerPos _x;
			if !(isOnRoad _pos) then {
				if (_nearbyFriendlyMarkers findIf {getMarkerPos _x distance _pos < distanceSPWN} != -1) then {_possibleMarkers pushBack _x};
			};
		}forEach _controlsX;

		if (count _possibleMarkers == 0) then {
			if (!_silent) then {
				[petros,"globalChat",localize "STR_A3A_fn_mission_request_noAS"] remoteExec ["A3A_fnc_commsMP",_requester];
				[petros,"hint",localize "STR_A3A_fn_mission_request_noASHint", _titleStr] remoteExec ["A3A_fnc_commsMP",_requester];
			};
		} else {
			private _site = selectRandom _possibleMarkers;
			if (_site in airportsX) then {[[_site],"A3A_fnc_AS_Official"] remoteExec ["A3A_fnc_scheduler",2]}
			else {if (_site in citiesX) then {[[_site],"A3A_fnc_AS_Traitor"] remoteExec ["A3A_fnc_scheduler",2]}
			else {[[_site],"A3A_fnc_AS_SpecOP"] remoteExec ["A3A_fnc_scheduler",2]}};
		};
	};

	case "CON": {
		//find apropriate sites
		_possibleMarkers = [outposts + resourcesX + (controlsX select {isOnRoad (getMarkerPos _x)})] call _findIfNearAndHostile;

		if (count _possibleMarkers == 0) then {
			if (!_silent) then {
				[petros,"globalChat",localize "STR_A3A_fn_mission_request_noConquest"] remoteExec ["A3A_fnc_commsMP",_requester];
				[petros,"hint",localize "STR_A3A_fn_mission_request_noConquestHint", _titleStr] remoteExec ["A3A_fnc_commsMP",_requester];
			};
		} else {
			private _site = selectRandom _possibleMarkers;
			[[_site],"A3A_fnc_CON_Outpost"] remoteExec ["A3A_fnc_scheduler",2];
		};
	};

	case "DES": {
		//find apropriate sites
		_possibleMarkers = [airportsX] call _findIfNearAndHostile;
		_possibleMarkers = _possibleMarkers select {spawner getVariable _x != 0};
		//append occupants antennas to list
		{
			private _nearbyMarker = [markersX, getPos _x] call BIS_fnc_nearestPosition;
			if (
				(sidesX getVariable [_nearbyMarker,sideUnknown] == Occupants)
				&& (getPos _x distance getMarkerPos respawnTeamPlayer < distanceMission)
				) then {_possibleMarkers pushBack _x};
		}forEach antennas;

		if (count _possibleMarkers == 0) then {
			if (!_silent) then {
				[petros,"globalChat",localize "STR_A3A_fn_mission_request_noDestroy"] remoteExec ["A3A_fnc_commsMP",_requester];
				[petros,"hint",localize "STR_A3A_fn_mission_request_noDestroyHint", _titleStr] remoteExec ["A3A_fnc_commsMP",_requester];
			};
		} else {
			private _site = selectRandom _possibleMarkers;
			if (_site in airportsX) then {if (random 10 < 6) then {[[_site],"A3A_fnc_DES_Vehicle"] remoteExec ["A3A_fnc_scheduler",2]} else {[[_site],"A3A_fnc_DES_Heli"] remoteExec ["A3A_fnc_scheduler",2]}};
			if (_site in antennas) then {[[_site],"A3A_fnc_DES_antenna"] remoteExec ["A3A_fnc_scheduler",2]}
		};
	};

	case "LOG": {
		//Add unspawned outposts for ammo trucks, and seaports for salvage
		_possibleMarkers = [seaports + outposts] call _findIfNearAndHostile;
		_possibleMarkers = _possibleMarkers select {(_x in seaports) or (spawner getVariable _x != 0)};

		//append banks in hostile cities
		if (random 100 < 20) then {
			{
				private _nearbyMarker = [markersX, getPos _x] call BIS_fnc_nearestPosition;
				if (
					(sidesX getVariable [_nearbyMarker,sideUnknown] != teamPlayer)
					&& (getPos _x distance getMarkerPos respawnTeamPlayer < distanceMission)
					) then {_possibleMarkers pushBack _x};
			}forEach banks;
		};

		if (count _possibleMarkers == 0) then {
			if (!_silent) then {
				[petros,"globalChat",localize "STR_A3A_fn_mission_request_noLogi"] remoteExec ["A3A_fnc_commsMP",_requester];
				[petros,"hint",localize "STR_A3A_fn_mission_request_noLogiHint", _titleStr] remoteExec ["A3A_fnc_commsMP",_requester];
			};
		} else {
			private _site = selectRandom _possibleMarkers;
			if (_site in outposts) then {[[_site],"A3A_fnc_LOG_Steal"] remoteExec ["A3A_fnc_scheduler",2]};
			if (_site in banks) then {[[_site],"A3A_fnc_LOG_Bank"] remoteExec ["A3A_fnc_scheduler",2]};
			if (_site in Seaports) then {[[_site],"A3A_fnc_LOG_Salvage"] remoteExec ["A3A_fnc_scheduler",2]};
		};
	};

	case "SUPP": {
		_possibleMarkers = [];
		private _weightedMarkers = [];
		{
			private _dist = getMarkerPos _x distance2D getMarkerPos respawnTeamPlayer;
			private _supportReb = (server getVariable _x) select 3;
			if (_dist < distanceMission && _supportReb < 90) then {
				private _weight = (100 - _supportReb) * ((distanceMission - _dist) ^ 2);
				_possibleMarkers pushBack _x;
				_weightedMarkers append [_x, _weight];
			};
		}forEach (citiesX - destroyedSites);

		if (count _possibleMarkers == 0) then {
			if (!_silent) then {
				[petros,"globalChat",localize "STR_A3A_fn_mission_request_noSupport"] remoteExec ["A3A_fnc_commsMP",_requester];
				[petros,"hint",localize "STR_A3A_fn_mission_request_noSupportHint", _titleSTR] remoteExec ["A3A_fnc_commsMP",_requester];
			};
		} else {
            Debug_1("City weights: %1", _weightedMarkers);
			private _site = selectRandomWeighted _weightedMarkers;
			[[_site],"A3A_fnc_LOG_Supplies"] remoteExec ["A3A_fnc_scheduler",2];
		};
	};

	case "RES": {
		_possibleMarkers = [citiesX] call _findIfNearAndHostile;
		_possibleMarkers = _possibleMarkers select {spawner getVariable _x != 0}; // so refugee missions don't get spawned on top of people -- might need to tweak if there arent enough unspawned sites
		{
			private _spawner = spawner getVariable _x;
			if (_spawner != 0) then {_possibleMarkers pushBack _x};
		} forEach ([airportsX + outposts] call _findIfNearAndHostile);

		if (count _possibleMarkers == 0) then {
			if (!_silent) then {
				[petros,"globalChat",localize "STR_A3A_fn_mission_request_noRescue"] remoteExec ["A3A_fnc_commsMP",_requester];
				[petros,"hint",localize "STR_A3A_fn_mission_request_noRescueHint", _titleStr] remoteExec ["A3A_fnc_commsMP",_requester];
			};
		} else {
			private _site = selectRandom _possibleMarkers;
			if (_site in citiesX) then {[[_site],"A3A_fnc_RES_Refugees"] remoteExec ["A3A_fnc_scheduler",2]} else {[[_site],"A3A_fnc_RES_Prisoners"] remoteExec ["A3A_fnc_scheduler",2]};
		};
	};

	case "CONVOY": {
		if (bigAttackInProgress) exitWith {
			if (!_silent) then {
				[petros,"globalChat",localize "STR_A3A_fn_mission_request_noConvoyAttack"] remoteExec ["A3A_fnc_commsMP",_requester];
				[petros,"hint",localize "STR_A3A_fn_mission_request_noConvoyAttackHint", _titleStr] remoteExec ["A3A_fnc_commsMP",_requester];
			};
		};
		// only do the city convoys on flip?
		private _markers = (airportsX + resourcesX + factories + seaports + outposts - blackListDest);
		// Pre-filter the possible source bases to make this less n-squared
		private _possibleBases = (airportsX + outposts) select { (getMarkerPos _x) distance (getMarkerPos respawnTeamPlayer) < distanceMission + 3000 };
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
			if (!_silent) then {
				[petros,"globalChat",localize "STR_A3A_fn_mission_request_noConvoy"] remoteExec ["A3A_fnc_commsMP",_requester];
				[petros,"hint",localize "STR_A3A_fn_mission_request_noConvoyHint", _titleStr] remoteExec ["A3A_fnc_commsMP",_requester];
			};
		} else {
			private _convoyPair = selectRandom _convoyPairs;
			[_convoyPair,"A3A_fnc_convoy"] remoteExec ["A3A_fnc_scheduler",2];
		};
	};

	default {
        Error_1("%1 is not an accepted task type.", _type);
	};
};

if (count _possibleMarkers > 0) then {
	if (!_silent) then {[petros,"globalChat",localize "STR_A3A_fn_mission_request_addMission"] remoteExec ["A3A_fnc_commsMP",_requester]};
	sleep 3;			// delay lockout until the mission is registered
};
A3A_missionRequestInProgress = nil;
