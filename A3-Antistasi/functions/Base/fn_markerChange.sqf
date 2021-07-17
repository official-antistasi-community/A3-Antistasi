if (!isServer) exitWith {};
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()

private ["_winner","_markerX","_looser","_positionX","_other","_flagX","_flagsX","_dist","_textX","_sides"];
_winner = _this select 0;
_markerX = _this select 1;

Debug_2("Changing side of %1 to %2", _markerX, _winner);
if ((_winner == teamPlayer) and (_markerX in airportsX) and (tierWar < 3)) exitWith {};
if ((_winner == teamPlayer) and (sidesX getVariable [_markerX,sideUnknown] == teamPlayer)) exitWith {};
if ((_winner == Occupants) and (sidesX getVariable [_markerX,sideUnknown] == Occupants)) exitWith {};
if ((_winner == Invaders) and (sidesX getVariable [_markerX,sideUnknown] == Invaders)) exitWith {};
if (_markerX in markersChanging) exitWith {};
markersChanging pushBackUnique _markerX;
_positionX = getMarkerPos _markerX;
_looser = sidesX getVariable [_markerX,sideUnknown];
_sides = [teamPlayer,Occupants,Invaders];
_other = "";
_textX = "";
_prestigeOccupants = [0, 0];
_prestigeInvaders = [0, 0];
_flagX = objNull;
_size = [_markerX] call A3A_fnc_sizeMarker;

if ((!(_markerX in citiesX)) and (spawner getVariable _markerX != 2)) then
	{
	_flagsX = nearestObjects [_positionX, ["FlagCarrierCore"], _size];
	_flagX = _flagsX select 0;
	};
if (isNil "_flagX") then {_flagX = objNull};
//[_flagX,"remove"] remoteExec ["A3A_fnc_flagaction",0,_flagX];

if (_looser == teamPlayer) then
	{
	_textX = format ["%1 ",nameTeamPlayer];
	[] call A3A_fnc_tierCheck;
	}
else
	{
	if (_looser == Occupants) then
		{
		_textX = format ["%1 ",nameOccupants];
		}
	else
		{
		_textX = format ["%1 ",nameInvaders];
		};
	};
garrison setVariable [_markerX,[],true];
sidesX setVariable [_markerX,_winner,true];

Debug_1("Side changed for %1", _markerX);

//New garrison update ==========================================================
garrison setVariable [format ["%1_garrison", _markerX], [], true];
garrison setVariable [format ["%1_other", _markerX], [], true];
garrison setVariable [format ["%1_requested", _markerX], [], true];
//This system is not yet implemented
//garrison setVariable [format ["%1_available", _markerX], [], true];
//New system end ===============================================================

if (_winner == teamPlayer) then
{
	_super = if (_markerX in airportsX) then {true} else {false};
    if(_positionX distance2D posHQ > distanceMission) then
    {
        [_markerX, _looser, _super] spawn
        {
            params ["_marker", "_loser", "_super"];
            waitUntil
            {
                sleep 10;
                spawner getVariable _marker == 2
            };
            if(sidesX getVariable [_marker, sideUnknown] == _loser) exitWith {};
            [[_marker, _loser, _super], "A3A_fnc_singleAttack"] call A3A_fnc_scheduler;
        };
    }
    else
    {
        [_markerX, _looser, _super] spawn
        {
            params ["_marker", "_loser", "_super"];
            sleep (random ((15 - tierWar) * 60));
            if(sidesX getVariable [_marker, sideUnknown] == _loser) exitWith {};
            [[_marker, _loser, _super], "A3A_fnc_singleAttack"] call A3A_fnc_scheduler;
        };
    };
}
else
{
	_soldiers = [];
	{_soldiers pushBack (_x getVariable "unitType")} forEach (allUnits select {(_x distance _positionX < (_size*3)) and (_x getVariable ["spawner",false]) and (side group _x == _winner) and (vehicle _x == _x) and (alive _x)});
	[_soldiers,_winner,_markerX,0] remoteExec ["A3A_fnc_garrisonUpdate",2];

	//New system =================================================================
	private _type = "Other";
	switch (true) do
	{
	    case (_markerX in airportsX): {_type = "Airport"};
			case (_markerX in outposts): {_type = "Outpost"};
			case (_markerX in citiesX): {_type = "City"};
	};
	private _preference = garrison getVariable (format ["%1_preference", _type]);
	private _request = [];
	for "_i" from 0 to ((count _preference) - 1) do
	{
		_request pushBack ([_preference select _i, _winner] call A3A_fnc_createGarrisonLine);
	};
	garrison setVariable [format ["%1_requested", _markerX], _request, true];
	//End ========================================================================
};

[_markerX, [_looser, _winner]] call A3A_fnc_updateReinfState;
Debug_1("Garrison set for %1", _markerX);

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

_nul = [_markerX] call A3A_fnc_mrkUpdate;
_sides = _sides - [_winner,_looser];
_other = _sides select 0;

if (_markerX in airportsX) then
{
	if (_winner == teamPlayer) then
	{
		[0,10,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
        Debug("aggroEvent | Rebels took an airport");
		if (_looser == Occupants) then
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
		if (_looser == teamPlayer) then
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
	["TaskSucceeded", ["", localize "STR_antistasi_notification_air_taken"]] remoteExec ["BIS_fnc_showNotification",_winner];
	["TaskFailed", ["", localize "STR_antistasi_notification_air_lost"]] remoteExec ["BIS_fnc_showNotification",_looser];
	["TaskUpdated",["",format [localize "STR_antistasi_notification_air_lostOther",_textX]]] remoteExec ["BIS_fnc_showNotification",_other];
	killZones setVariable [_markerX,[],true];
};
if (_markerX in outposts) then
{
	if (_winner != teamPlayer) then
	{
		server setVariable [_markerX,dateToNumber date,true];
		if (_looser == teamPlayer) then
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
		if (_looser == Occupants) then
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
	["TaskSucceeded", ["", localize "STR_antistasi_notification_Outpost_taken"]] remoteExec ["BIS_fnc_showNotification",_winner];
	["TaskFailed", ["", localize "STR_antistasi_notification_Outpost_lost"]] remoteExec ["BIS_fnc_showNotification",_looser];
	["TaskUpdated",["",format [localize "STR_antistasi_notification_Outpost_lostOther",_textX]]] remoteExec ["BIS_fnc_showNotification",_other];
	killZones setVariable [_markerX,[],true];
	};
if (_markerX in seaports) then
{
	if (_winner == teamPlayer) then
	{
        Debug("aggroEvent | Rebels took a seaport");
		if (_looser == Occupants) then
        {
            _prestigeOccupants = [20, 120];
        }
        else
        {
            _prestigeInvaders = [20, 120];
        };
	};
	["TaskSucceeded", ["", localize "STR_antistasi_notification_Seaport_taken"]] remoteExec ["BIS_fnc_showNotification",_winner];
	["TaskFailed", ["", localize "STR_antistasi_notification_Seaport_lost"]] remoteExec ["BIS_fnc_showNotification",_looser];
	["TaskUpdated",["",format [localize "STR_antistasi_notification_Seaport_lostOther",_textX]]] remoteExec ["BIS_fnc_showNotification",_other];
	};
if (_markerX in factories) then
{
    if (_winner == teamPlayer) then
	{
        Debug("aggroEvent | Rebels took a factory");
		if (_looser == Occupants) then
        {
            _prestigeOccupants = [20, 120];
        }
        else
        {
            _prestigeInvaders = [20, 120];
        };
	};
	["TaskSucceeded", ["", localize "STR_antistasi_notification_Factory_taken"]] remoteExec ["BIS_fnc_showNotification",_winner];
	["TaskFailed", ["", localize "STR_antistasi_notification_Factory_lost"]] remoteExec ["BIS_fnc_showNotification",_looser];
	["TaskUpdated",["",format [localize "STR_antistasi_notification_Factory_lostOther",_textX]]] remoteExec ["BIS_fnc_showNotification",_other];
};
if (_markerX in resourcesX) then
{
    if (_winner == teamPlayer) then
	{
        Debug("aggroEvent | Rebels took a resource");
		if (_looser == Occupants) then
        {
            _prestigeOccupants = [20, 120];
        }
        else
        {
            _prestigeInvaders = [20, 120];
        };
	};
	["TaskSucceeded", ["", localize "STR_antistasi_notification_Resource_taken"]] remoteExec ["BIS_fnc_showNotification",_winner];
	["TaskFailed", ["", localize "STR_antistasi_notification_Resource_lost"]] remoteExec ["BIS_fnc_showNotification",_looser];
	["TaskUpdated",["",format [localize "STR_antistasi_notification_Resource_lostOther",_textX]]] remoteExec ["BIS_fnc_showNotification",_other];
};

Debug_1("Notification and points done for marker change at %1", _markerX);

{_nul = [_markerX,_x] spawn A3A_fnc_deleteControls} forEach controlsX;
if (_winner == teamPlayer) then
{
	[] call A3A_fnc_tierCheck;

	//Convert all of the static weapons to teamPlayer, essentially. Make them mannable by AI.
	//Make the size larger, as rarely does the marker cover the whole outpost.
	private _staticWeapons = nearestObjects [_positionX, ["StaticWeapon"], _size * 1.5, true];
	{
		[_x, teamPlayer, true] call A3A_fnc_vehKilledOrCaptured;
		if !(_x in staticsToSave) then {
			staticsToSave pushBack _x;
		};
	} forEach _staticWeapons;
	publicVariable "staticsToSave";

	if (!isNull _flagX) then
	{
		//[_flagX,"remove"] remoteExec ["A3A_fnc_flagaction",0,_flagX];
		//_flagX setVariable ["isGettingCaptured", nil, true];
		[_flagX,"SDKFlag"] remoteExec ["A3A_fnc_flagaction",0,_flagX];
		[_flagX,SDKFlagTexture] remoteExec ["setFlagTexture",_flagX];
		sleep 2;
		//[_flagX,"unit"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_flagX];
		//[_flagX,"vehicle"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_flagX];
		//[_flagX,"garage"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_flagX];
		if (_markerX in seaports) then {[_flagX,"seaport"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_flagX]};
	};
    ([Occupants] + _prestigeOccupants) spawn A3A_fnc_addAggression;
    ([Invaders] + _prestigeInvaders) spawn A3A_fnc_addAggression;
	waitUntil {sleep 1; ((spawner getVariable _markerX == 2)) or ({((side group _x) in [_looser,_other]) and (_x getVariable ["spawner",false]) and ([_x,_markerX] call A3A_fnc_canConquer)} count allUnits > 3*({(side _x == teamPlayer) and ([_x,_markerX] call A3A_fnc_canConquer)} count allUnits))};
	if (spawner getVariable _markerX != 2) then
	{
		sleep 10;
		[_markerX,teamPlayer] remoteExec ["A3A_fnc_zoneCheck",2];
	};
}
else
	{
	//Remove static weapons near the marker from the saved statics array
	private _staticWeapons = nearestObjects [_positionX, ["StaticWeapon"], _size * 1.5, true];
	staticsToSave = staticsToSave - _staticWeapons;
	publicVariable "staticsToSave";
	{
		[_x, _winner, true] call A3A_fnc_vehKilledOrCaptured;
	} forEach _staticWeapons;

	if (!isNull _flagX) then
	{
		//_flagX setVariable ["isGettingCaptured", nil, true];
		if (_looser == teamPlayer) then
		{
			[_flagX,"remove"] remoteExec ["A3A_fnc_flagaction",0,_flagX];
			sleep 2;
			[_flagX,"take"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_flagX];
		};
		if (_winner == Occupants) then
		{
			[_flagX,NATOFlagTexture] remoteExec ["setFlagTexture",_flagX];
		}
		else
		{
			[_flagX,CSATFlagTexture] remoteExec ["setFlagTexture",_flagX];
		};
	};
	if (_looser == teamPlayer) then
		{
        ([Occupants] + _prestigeOccupants) spawn A3A_fnc_addAggression;
        ([Invaders] + _prestigeInvaders) spawn A3A_fnc_addAggression;
		if ((random 10 < ((tierWar + difficultyCoef)/4)) and !("DEF_HQ" in A3A_activeTasks) and (isPlayer theBoss)) then {[[],"A3A_fnc_attackHQ"] remoteExec ["A3A_fnc_scheduler",2]};
		};
	};
if ((_winner != teamPlayer) and (_looser != teamPlayer)) then
	{
	if (_markerX in outposts) then
		{
		_closeX = (seaports + resourcesX + factories) select {((getMarkerPos _x) distance _positionX < distanceSPWN) and (sidesX getVariable [_x,sideUnknown] != teamPlayer)};
		if (_looser == Occupants) then  {_closeX = _closeX select {sidesX getVariable [_x,sideUnknown] == Occupants}} else {_closeX = _closeX select {sidesX getVariable [_x,sideUnknown] == Invaders}};
		{[_winner,_x] spawn A3A_fnc_markerChange; sleep 5} forEach _closeX;
		}
	else
		{
		if (_markerX in airportsX) then
			{
			_closeX = (seaports + outposts) select {((getMarkerPos _x) distance _positionX < distanceSPWN) and (sidesX getVariable [_x,sideUnknown] != teamPlayer)};
			_closeX append ((factories + resourcesX) select {(sidesX getVariable [_x,sideUnknown] != teamPlayer) and (sidesX getVariable [_x,sideUnknown] != _winner) and ([airportsX,_x] call BIS_fnc_nearestPosition == _markerX)});
			if (_looser == Occupants) then  {_closeX = _closeX select {sidesX getVariable [_x,sideUnknown] == Occupants}} else {_closeX = _closeX select {sidesX getVariable [_x,sideUnknown] == Invaders}};
			{[_winner,_x] spawn A3A_fnc_markerChange; sleep 5} forEach _closeX;
			};
		};
	};
markersChanging = markersChanging - [_markerX];

Debug_1("Finished marker change at %1", _markerX);
