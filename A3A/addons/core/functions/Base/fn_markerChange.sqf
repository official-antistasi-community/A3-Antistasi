// Now unscheduled
// Scripted usage has no side-effects (aggro, counterattack) and fills the garrison if switched to enemy

if (!isServer) exitWith {};
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_winner", "_markerX", "_scripted"];

if (spawner getVariable _markerX != 2 and _scripted) exitWith {
	["Marker change", "Site side cannot be changed unless despawned"] remoteExecCall ["A3A_fnc_customHint", remoteExecutedOwner];
};

private _positionX = getMarkerPos _markerX;
private _loser = sidesX getVariable [_markerX,sideUnknown];
private _other = ([teamPlayer,Occupants,Invaders] - [_winner,_loser]) select 0;

if ((_winner == teamPlayer) and (_markerX in airportsX) and (tierWar < 3)) exitWith {};
if (_winner == _loser) exitWith {};

Info_3("Changing side of %1 from %2 to %3", _markerX, _loser, _winner);

sidesX setVariable [_markerX,_winner,true];

// Do the garrison update
[_markerX, _winner] call A3A_fnc_garrisonServer_changeSide;

// Sort out war tier if necessary
if (teamPlayer in [_loser, _winner]) then { [] call A3A_fnc_tierCheck };

// Update the visible marker
[_markerX] call A3A_fnc_mrkUpdate;

if !(_markerX in airportsX) then
{
	// clear killzones from nearest friendly airfield to enable reinforcements
	private _friendlyAirports = airportsX select { _winner == sidesX getVariable [_x, sideUnknown] };
	if (count _friendlyAirports > 0) then
	{
		private _nearAirport = [_friendlyAirports, _markerX] call BIS_fnc_nearestPosition;
		private _kzlist = killZones getVariable [_nearAirport, []];
		_kzlist = _kzlist - [_markerX];
		killZones setVariable [_nearAirport, _kzlist, true];
	};
};

Debug_1("Side changed for %1", _markerX);

// Change-only usage
if (_scripted) exitWith {
	if (_winner != teamPlayer) then { [_markerX] call A3A_fnc_buildEnemyGarrison };
};

// Generate counterattack
if (_winner == teamPlayer) then
{
	// Cap to 0.6 max to reward captures without previous support calls
	private _resources = [_loser, teamPlayer, _markerX, 0.6] call A3A_fnc_maxDefenceSpend;

	// Don't send anything if it'd be too small
	private _minAttack = (1 + random 0.5) * A3A_balanceResourceRate;
	if (_resources < _minAttack) exitWith {
		Debug_2("Available resources (%1) below minimum attack (%2), sending no counterattack", _resources, _minAttack);
	};

	private _vehCount = round (random 0.5 + _resources / A3A_balanceVehicleCost);
	private _reveal = [markerPos _markerX] call A3A_fnc_calculateSupportCallReveal;
	_reveal = [_loser, markerPos _markerX, _reveal] call A3A_fnc_useRadioKey;

	[[_markerX, _loser, _vehCount, _reveal], "A3A_fnc_singleAttack"] call A3A_fnc_scheduler;

	// just estimates here. 
	A3A_supportStrikes pushBack [_loser, "TROOPS", markerPos _markerX, time + 2700, 2700, _resources];
    A3A_supportSpends pushBack [_loser, markerPos _markerX, markerPos _markerX, _resources, time];
};


private _loserName = Faction(_loser) get "name";
private _prestigeOccupants = [0, 0];
private _prestigeInvaders = [0, 0];


if (_markerX in airportsX) then
{
	if (_winner == teamPlayer) then
	{
		[0,10,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
        Debug("aggroEvent | Rebels took an airport");
		if (_loser == Occupants) then
		{
			_prestigeOccupants = [50, 150];
			_prestigeInvaders = [-25, 90];
		}
		else
		{
			_prestigeOccupants = [-25, 90];
			_prestigeInvaders = [50, 150];
		};
		[] spawn A3A_fnc_checkCampaignEnd; // If an airport is taken by rebels, check for victory
	}
	else
	{
		server setVariable [_markerX,dateToNumber date,true];
		[_markerX,60] call A3A_fnc_addTimeForIdle;
		if (_winner == Occupants) then
		{
			[10,0,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
		}
		else
		{
			[-10,-10,_positionX] remoteExec ["A3A_fnc_citySupportChange",2]
		};
		if (_loser == teamPlayer) then
		{
            Debug("aggroEvent | Rebels lost an airport");
            if(_winner == Occupants) then
            {
                _prestigeOccupants = [-40, 90];
                _prestigeInvaders = [-20, 90];
            }
            else
            {
                _prestigeOccupants = [-20, 90];
                _prestigeInvaders = [-40, 90];
            };
		};
	};
	["TaskSucceeded", ["", localize "STR_A3A_fn_base_markerChange_yesAirbase"]] remoteExec ["BIS_fnc_showNotification",_winner];
	["TaskFailed", ["", localize "STR_A3A_fn_base_markerChange_noAirbase"]] remoteExec ["BIS_fnc_showNotification",_loser];
	["TaskUpdated",["",format [localize "STR_A3A_fn_base_markerChange_otherAirbase",_textX]]] remoteExec ["BIS_fnc_showNotification",_other];
	killZones setVariable [_markerX,[],true];
};
if (_markerX in outposts) then
{
	if (_winner != teamPlayer) then
	{
		server setVariable [_markerX,dateToNumber date,true];
		[_markerX,30] call A3A_fnc_addTimeForIdle;
		if (_loser == teamPlayer) then
		{
            Debug("aggroEvent | Rebels lost an outpost");
			if (_winner == Occupants) then
            {
                _prestigeOccupants = [-10, 90];
            }
            else
            {
                _prestigeInvaders = [-10, 90];
            };
		};
	}
	else
	{
        Debug("aggroEvent | Rebels took an outpost");
		if (_loser == Occupants) then
        {
            _prestigeOccupants = [30, 150];
            _prestigeInvaders = [-15, 90];
        }
        else
        {
            _prestigeOccupants = [-15, 90];
            _prestigeInvaders = [30, 150];
        };
	};
	["TaskSucceeded", ["", localize "STR_A3A_fn_base_markerChange_yesOutpost"]] remoteExec ["BIS_fnc_showNotification",_winner];
	["TaskFailed", ["", localize "STR_A3A_fn_base_markerChange_noOutpost"]] remoteExec ["BIS_fnc_showNotification",_loser];
	["TaskUpdated",["",format [localize "STR_A3A_fn_base_markerChange_otherOutpost",_textX]]] remoteExec ["BIS_fnc_showNotification",_other];
	killZones setVariable [_markerX,[],true];
	};
if (_markerX in seaports) then
{
	if (_winner == teamPlayer) then
	{
        Debug("aggroEvent | Rebels took a seaport");
		if (_loser == Occupants) then
        {
            _prestigeOccupants = [20, 120];
        }
        else
        {
            _prestigeInvaders = [20, 120];
        };
	};
	["TaskSucceeded", ["", localize "STR_A3A_fn_base_markerChange_yesSeaport"]] remoteExec ["BIS_fnc_showNotification",_winner];
	["TaskFailed", ["", localize "STR_A3A_fn_base_markerChange_noSeaport"]] remoteExec ["BIS_fnc_showNotification",_loser];
	["TaskUpdated",["",format [localize "STR_A3A_fn_base_markerChange_otherSeaport",_textX]]] remoteExec ["BIS_fnc_showNotification",_other];
	};
if (_markerX in factories) then
{
    if (_winner == teamPlayer) then
	{
        Debug("aggroEvent | Rebels took a factory");
		if (_loser == Occupants) then
        {
            _prestigeOccupants = [20, 120];
        }
        else
        {
            _prestigeInvaders = [20, 120];
        };
	};
	["TaskSucceeded", ["", localize "STR_A3A_fn_base_markerChange_yesFactory"]] remoteExec ["BIS_fnc_showNotification",_winner];
	["TaskFailed", ["", localize "STR_A3A_fn_base_markerChange_noFactory"]] remoteExec ["BIS_fnc_showNotification",_loser];
	["TaskUpdated",["",format [localize "STR_A3A_fn_base_markerChange_otherFactory",_textX]]] remoteExec ["BIS_fnc_showNotification",_other];
};
if (_markerX in resourcesX) then
{
    if (_winner == teamPlayer) then
	{
        Debug("aggroEvent | Rebels took a resource");
		if (_loser == Occupants) then
        {
            _prestigeOccupants = [20, 120];
        }
        else
        {
            _prestigeInvaders = [20, 120];
        };
	};
	["TaskSucceeded", ["", localize "STR_A3A_fn_base_markerChange_yesResource"]] remoteExec ["BIS_fnc_showNotification",_winner];
	["TaskFailed", ["", localize "STR_A3A_fn_base_markerChange_noResource"]] remoteExec ["BIS_fnc_showNotification",_loser];
	["TaskUpdated",["",format [localize "STR_A3A_fn_base_markerChange_otherResource",_textX]]] remoteExec ["BIS_fnc_showNotification",_other];
};

if (teamPlayer in [_winner, _loser]) then {
    [Occupants, _prestigeOccupants#0, _prestigeOccupants#1, true] spawn A3A_fnc_addAggression;
    [Invaders, _prestigeInvaders#0, _prestigeInvaders#1, true] spawn A3A_fnc_addAggression;
};

["markerChange", [_markerX, _winner]] call EFUNC(Events,triggerEvent);

Info_1("Finished marker change at %1", _markerX);
