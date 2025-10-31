/*
Maintainer: Tiny-DM
    Moves this player or target group to the destination.
    This function manages hints, deducts money, finds the cost, manages the black screen, and moves the player.
    No checks are ran to ensure the player is actually able to fast travel to the given destination.

Arguments:
    <GROUP or OBJECT> HC group or player to fast travel
    <STRING> Marker to travel to
    <OBJECT> Player who ordered the fast travel

Scope: Local
Environment: Scheduled
Public: No
Dependencies:

Example:
    [player,"Synd_HQ",player] spawn A3A_fnc_fastTravelMove; // Moves player back to HQ
    [_hcGroup,"airport",player] spawn A3A_fnc_fastTravelMove; // Moves given HC group to the first defined airport, regardless of side.

License: APL-ND
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_groupX", "_base", "_player"];
private _titleStr = localize "STR_A3A_fn_dialogs_ftradio_title";
private _isHC = (_groupX isEqualType grpNull);

private _ftUnit = [_player, leader _groupX] select _isHC;
[_ftUnit, [vehicle _ftUnit], markerPos _base] call FUNCMAIN(calculateFastTravelCost) params ["_travelCost","_travelTime"];
if !(_isHC) then {[-_travelCost] call A3A_fnc_resourcesPlayer};

if (!_isHC) then {
	openMap false;
	disableUserInput true;
	cutText [format [localize "STR_A3A_fn_dialogs_fastTravelRadio_begin", ([[_travelTime] call A3A_fnc_secondsToTimeSpan,0,0,false,2] call A3A_fnc_timeSpan_format)],"BLACK",1];
	while {_travelTime >= 1} do {
        sleep 1;
		_travelTime = _travelTime - 1;
		cutText [format [localize "STR_A3A_fn_dialogs_fastTravelRadio_begin", ([[_travelTime] call A3A_fnc_secondsToTimeSpan,0,0,false,2] call A3A_fnc_timeSpan_format)],"BLACK",0.001];
	};
} else {
	[_titleStr, format [localize "STR_A3A_fn_dialogs_ftradio_grp_moving", groupID _groupX]] call A3A_fnc_customHint;
	sleep _travelTime;
};

// Any reason to cancel at this point?
// "got into vehicle" would be one? But handled by the selection code...
//if (_checkForPlayer and ((_base != "SYND_HQ") and !(_base in airportsX)))
//exitWith {[_titleStr, format [localize "STR_A3A_fn_dialogs_ftradio_cancelled",groupID _groupX]] call A3A_fnc_customHint;};

// So, the rules:
// If it's an HC group, the group and all its vehicles (including occupied statics) will be teleported
// If you're a driver, your vehicle will be teleported
// If you're not in a vehicle, you will be teleported personally
// If you're group lead and have squad AI within 50m, those (and their vehicles, if driver) will be teleported

// Find vehicles & units to be fast-travelled
private _ftVehicles = [];
private _ftUnits = call {
	if (_isHC) exitWith { units _groupX };
	if (player != leader group player) exitWith { [player] };
	(units group player inAreaArray [getPosATL player, 50, 50] select { !isPlayer _x }) + [player];
};
if (_isHC) then { _ftVehicles pushBackUnique (assignedVehicles _groupX # 0) };
{
	private _veh = vehicle _x;
	if (_isHC and _veh isKindOf "StaticWeapon") then { _ftVehicles pushBackUnique _veh; continue };
	if (_x == _veh or _x != driver _veh) then { continue };
	if (_veh isKindOf "Land" and canMove _veh) then { _ftVehicles pushBackUnique _veh };
} forEach _ftUnits;
_ftUnits = _ftUnits select { _x == vehicle _x };


// Do the actual teleport. Vehicles before units, try to place everything in proximity.
private _destPos = markerPos _base getPos [10, random 360];
{
	private _radiusX = 10;
	while {true} do {
		private _roads = _destPos nearRoads _radiusX;
		if (count _roads > 0) exitWith { _destPos = getPosATL (_roads select 0) };
		_radiusX = _radiusX + 10;
		if (_radiusX > 100) exitWith {};
	};
	private _vehPos = _destPos findEmptyPosition [0,100,typeOf _x];
	_x setVehiclePosition [_vehPos, [], 5, "NONE"];
} forEach _ftVehicles;

{
	private _unitPos = _destPos findEmptyPosition [1,50,typeOf _x];
	_x setPosATL _unitPos;
	if (!isPlayer _x and !(_x getVariable ["incapacitated",false])) then {
		_x setVariable ["rearming",false];
		_x doWatch objNull;
		_x doFollow leader _x;
	};
} forEach _ftUnits;


if (!_isHC) then {
	disableUserInput false;
	cutText [localize "STR_A3A_fn_dialogs_fastTravelRadio_end","BLACK IN",1]
} else {
	[_titleStr, format [localize "STR_A3A_fn_dialogs_ftradio_grp_arrived", groupID _groupX]] call A3A_fnc_customHint;
};
[] call A3A_fnc_playerLeashRefresh;
