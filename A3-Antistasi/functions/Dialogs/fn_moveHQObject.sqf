#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
private ["_thingX","_playerX","_id","_isStatic","_sites","_markerX","_size","_positionX"];

_thingX = _this select 0;
_playerX = _this select 1;
_id = _this select 2;
_isStatic = (_thingX isKindOf "StaticWeapon");

if (!_isStatic && player != theBoss) exitWith {[localize "STR_antistasi_journal_entry_header_commander_5", localize "STR_antistasi_customHint_only_comander"] call A3A_fnc_customHint;};
if (!(isNull attachedTo _thingX)) exitWith {[localize "STR_antistasi_journal_entry_header_commander_5", localize "STR_antistasi_customHint_moveHQ_being"] call A3A_fnc_customHint;};
if (vehicle _playerX != _playerX) exitWith {[localize "STR_antistasi_journal_entry_header_commander_5", localize "STR_antistasi_customHint_moveHQ_veh"] call A3A_fnc_customHint;};

if (([_playerX] call A3A_fnc_countAttachedObjects) > 0) exitWith {[localize "STR_antistasi_journal_entry_header_commander_5", localize "STR_antistasi_customHint_moveHQ_other"] call A3A_fnc_customHint;};
_sites = markersX select {sidesX getVariable [_x,sideUnknown] == teamPlayer};
_markerX = [_sites,_playerX] call BIS_fnc_nearestPosition;
_size = [_markerX] call A3A_fnc_sizeMarker;
_positionX = getMarkerPos _markerX;
if (_playerX distance2D _positionX > _size) exitWith {[localize "STR_antistasi_journal_entry_header_commander_5", localize "STR_antistasi_customHint_moveHQ_center_need"] call A3A_fnc_customHint;};

if (captive _playerX) then { _playerX setCaptive false };

_thingX setVariable ["objectBeingMoved", true];
if !(_isStatic) then { _thingX removeAction _id };

private _spacing = 2 max (1 - (boundingBoxReal _thingX select 0 select 1));
private _height = 0.1 - (boundingBoxReal _thingX select 0 select 2);
_thingX attachTo [_playerX, [0, _spacing, _height]];

private _fnc_placeObject = {
	params [["_thingX", objNull], ["_playerX", objNull], ["_dropObjectActionIndex", -1]];

	if (isNull _thingX) exitWith {Error("trying to place invalid HQ object")};
	if (isNull _playerX) exitWith {Error("trying to place HQ object with invalid player")};

	if (!(_thingX getVariable ["objectBeingMoved", false])) exitWith {};

	if (_playerX == attachedTo _thingX) then {
		_playerX setVelocity [0,0,0];
		_thingX setVelocity [0,0,0];
		detach _thingX;
	};

	if (_dropObjectActionIndex != -1) then {
		_playerX removeAction _dropObjectActionIndex;
	};

	// Can't find a case where this is ever true, but we'll make sure
	if (local _thingX) then {
		if (isNull group _thingX) then { [_thingX, 2] remoteExec ["setOwner", 2] }
		else { [group _thingX, 2] remoteExec ["setGroupOwner", 2] };
	};

	// Some objects never lose (and even regain) their velocity when detached, becoming lethal
	// On a DS, object locality changes when detached, so we have to remoteexec
	[_thingX, [0,0,0]] remoteExec ["setVelocity", _thingX];

	// Without this, non-unit objects often hang in mid-air
	[_thingX, surfaceNormal position _thingX] remoteExec ["setVectorUp", _thingX];

	// Place on closest surface
	private _pos = getPosASL _thingX;
	private _intersects = lineIntersectsSurfaces [_pos, _pos vectorAdd [0,0,-100], _thingX];
	if (count _intersects > 0) then {
		_thingX setPosASL (_intersects select 0 select 0);
	};

	// _thingX setPosATL [getPosATL _thingX select 0,getPosATL _thingX select 1,0.1];

	_thingX setVariable ["objectBeingMoved", false];
};

private _actionX = _playerX addAction [localize "STR_antistasi_logistics_drop", {
	(_this select 3) params ["_thingX", "_fnc_placeObject"];

	[_thingX, player, (_this select 2)] call _fnc_placeObject;
}, [_thingX, _fnc_placeObject],4,true,true,"",""];

waitUntil {sleep 1;
	(_playerX != attachedTo _thingX)
	or (vehicle _playerX != _playerX)
	or (_playerX distance2D _positionX > (_size-3))
	or !([_playerX] call A3A_fnc_canFight)
	or (!isPlayer _playerX)
	or (_isStatic and {count crew _thingX > 0})
};

[_thingX, _playerX, _actionX] call _fnc_placeObject;
if !(_isStatic) then { _thingX addAction [localize "STR_antistasi_logistics_move", A3A_fnc_moveHQObject,nil,0,false,true,"","(_this == theBoss)"] };

if (vehicle _playerX != _playerX) exitWith {[localize "STR_antistasi_journal_entry_header_commander_5", localize "STR_antistasi_customHint_moveHQ_veh"] call A3A_fnc_customHint;};

if  (_playerX distance2D _positionX > _size) exitWith {[localize "STR_antistasi_journal_entry_header_commander_5", localize "STR_antistasi_customHint_moveHQ_center"] call A3A_fnc_customHint;};
