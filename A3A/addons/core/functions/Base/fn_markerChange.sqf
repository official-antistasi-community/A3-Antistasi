if (!isServer) exitWith {};
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_winner", "_markerX"];

private _positionX = getMarkerPos _markerX;
private _loser = sidesX getVariable [_markerX,sideUnknown];
private _other = ([teamPlayer,Occupants,Invaders] - [_winner,_loser]) select 0;

if ((_winner == teamPlayer) and (_markerX in airportsX) and (tierWar < 3)) exitWith {};
if (_winner == _loser) exitWith {};
if (_markerX in markersChanging) exitWith {};
markersChanging pushBackUnique _markerX;

Info_3("Changing side of %1 from %2 to %3", _markerX, _loser, _winner);

// Find the flag object
private _size = [_markerX] call A3A_fnc_sizeMarker;
private _flagX = objNull;
if ((!(_markerX in citiesX)) and (spawner getVariable _markerX != 2)) then
{
	private _flags = nearestObjects [_positionX, ["FlagCarrierCore"], _size];
	if (count _flags == 0) exitWith { Error_1("No flag found in %1", _markerX) };
	_flagX = _flags select 0;
};


garrison setVariable [_markerX,[],true];
sidesX setVariable [_markerX,_winner,true];

[_markerX] call A3A_fnc_mrkUpdate;

// clear roadblocks related to this marker
{[_markerX,_x] spawn A3A_fnc_deleteControls} forEach controlsX;

// Sort out war tier if necessary
if (teamPlayer in [_loser, _winner]) then { [] call A3A_fnc_tierCheck };


// Static/vehicle transfer and flag updates
if (_winner == teamPlayer) then
{
	// Old garrison surrender
	private _oldGarrison = units _loser select { _x getVariable ["markerX", ""] == _markerX };
	{ [_x] remoteExec ["A3A_fnc_surrenderAction", _x] } forEach _oldGarrison;

	// Spawn (empty) rebel garrison. Temporary while rebel & enemy are separate systems
	isNil {
		spawner setVariable [_markerX, 2, true];
		private _machineID = call A3A_fnc_chooseMachineForGarrison;
		A3A_garrisonMachine set [_markerX, _machineID];
		["spawn", [_markerX, A3A_garrison get _markerX]] remoteExecCall ["A3A_fnc_garrisonOp", _machineID];
	};

	//Convert all of the static weapons to teamPlayer, essentially. Add them to the live garrison.
	private _statics = nearestObjects [_positionX, ["StaticWeapon"], _size * 1.5, true] inAreaArray _markerX;
	{ [_x, teamPlayer, true] call A3A_fnc_vehKilledOrCaptured } forEach _statics;
	[_markerX, _statics] call A3A_fnc_addVehiclesToGarrison;
	_garrisonStatics append _staticWeapons;

	if (!isNull _flagX) then
	{
		[_flagX,"SDKFlag"] remoteExec ["A3A_fnc_flagaction",0,_flagX];
		[_flagX,FactionGet(reb,"flagTexture")] remoteExec ["setFlagTexture",_flagX];
		sleep 2;			// why?
		if (_markerX in seaports) then {[_flagX,"seaport"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_flagX]};
	};
}
else
{
	if (_loser == teamPlayer) then {
		A3A_garrisonMachine get _markerX;		// always spawned?
		["disband", [_markerX, A3A_garrison get _markerX]] remoteExecCall ["A3A_fnc_garrisonOp", _machineID];

		// probably temporary?
		private _garrison = A3A_garrison get _markerX;
		_garrison set ["statics", []];
		_garrison set ["vehicles", []];
		_garrison set ["buildings", []];
	};

	// Any reason to do this? The statics are arguably still rebel
	//	{
	//		[_x, _winner, true] call A3A_fnc_vehKilledOrCaptured;
	//	} forEach _staticWeapons;

	if (!isNull _flagX) then
	{
		if (_loser == teamPlayer) then
		{
			[_flagX,"remove"] remoteExec ["A3A_fnc_flagaction",0,_flagX];
			sleep 2;
			[_flagX,"take"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_flagX];
		};

		private _flagTexture = Faction(_winner) get "flagTexture";
		[_flagX, _flagTexture] remoteExec ["setFlagTexture", _flagX];
	};
};

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
	["TaskSucceeded", ["", "Airbase Taken"]] remoteExec ["BIS_fnc_showNotification",_winner];
	["TaskFailed", ["", "Airbase Lost"]] remoteExec ["BIS_fnc_showNotification",_loser];
	["TaskUpdated",["",format ["%1 lost an Airbase",_loserName]]] remoteExec ["BIS_fnc_showNotification",_other];
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
	["TaskSucceeded", ["", "Outpost Taken"]] remoteExec ["BIS_fnc_showNotification",_winner];
	["TaskFailed", ["", "Outpost Lost"]] remoteExec ["BIS_fnc_showNotification",_loser];
	["TaskUpdated",["",format ["%1 lost an Outpost",_loserName]]] remoteExec ["BIS_fnc_showNotification",_other];
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
	["TaskSucceeded", ["", "Seaport Taken"]] remoteExec ["BIS_fnc_showNotification",_winner];
	["TaskFailed", ["", "Seaport Lost"]] remoteExec ["BIS_fnc_showNotification",_loser];
	["TaskUpdated",["",format ["%1 lost a Seaport",_loserName]]] remoteExec ["BIS_fnc_showNotification",_other];
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
	["TaskSucceeded", ["", "Factory Taken"]] remoteExec ["BIS_fnc_showNotification",_winner];
	["TaskFailed", ["", "Factory Lost"]] remoteExec ["BIS_fnc_showNotification",_loser];
	["TaskUpdated",["",format ["%1 lost a Factory",_loserName]]] remoteExec ["BIS_fnc_showNotification",_other];
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
	["TaskSucceeded", ["", "Resource Taken"]] remoteExec ["BIS_fnc_showNotification",_winner];
	["TaskFailed", ["", "Resource Lost"]] remoteExec ["BIS_fnc_showNotification",_loser];
	["TaskUpdated",["",format ["%1 lost a Resource",_loserName]]] remoteExec ["BIS_fnc_showNotification",_other];
};

if (teamPlayer in [_winner, _loser]) then {
    [Occupants, _prestigeOccupants#0, _prestigeOccupants#1, true] spawn A3A_fnc_addAggression;
    [Invaders, _prestigeInvaders#0, _prestigeInvaders#1, true] spawn A3A_fnc_addAggression;
};

markersChanging = markersChanging - [_markerX];
["markerChange", [_markerX, _winner]] call EFUNC(Events,triggerEvent);

Info_1("Finished marker change at %1", _markerX);
