#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
private ["_thingX","_playerX","_id","_isStatic","_sites","_markerX","_positionX"];

_thingX = _this select 0;
_playerX = _this select 1;
_id = _this select 2;
_isStatic = (_thingX isKindOf "StaticWeapon");

if (!_isStatic && player != theBoss) exitWith {["Move HQ", "Only Player Commander is allowed to move HQ assets."] call A3A_fnc_customHint;};
if (!(isNull attachedTo _thingX)) exitWith {["Move HQ", "The asset you want to move is being moved by another player."] call A3A_fnc_customHint;};
if (vehicle _playerX != _playerX) exitWith {["Move HQ", "You cannot move HQ assets while in a vehicle."] call A3A_fnc_customHint;};

if (([_playerX] call A3A_fnc_countAttachedObjects) > 0) exitWith {["Move HQ", "You have other things attached, you cannot move this."] call A3A_fnc_customHint;};

_sites = markersX select {sidesX getVariable [_x,sideUnknown] == teamPlayer};
_markerX = [_sites,_playerX] call BIS_fnc_nearestPosition;
_positionX = getMarkerPos _markerX;
//if (_playerX distance2D _positionX > _size) exitWith {["Move HQ", "This asset needs to be closer to it relative zone center to be able to be moved."] call A3A_fnc_customHint;};

if (captive _playerX) then { _playerX setCaptive false };

_thingX setVariable ["objectBeingMoved", true];
if !(_isStatic) then { _thingX removeAction _id };
if (_isStatic) then { _thingX lock true };

if (isNil {_thingX getVariable "A3A_originalMass"}) then { _thingX setVariable ["A3A_originalMass", getMass _thingX] };
[_thingX, 1e-12] remoteExecCall ["setMass", 0]; 

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
		detach _thingX;
		// Some objects never lose (and even regain) their velocity when detached, becoming lethal
		[_thingX, [0,0,0]] remoteExec ["setVelocity", _thingX];
	};

	if (_dropObjectActionIndex != -1) then {
		_playerX removeAction _dropObjectActionIndex;
	};

	// Without this, non-unit objects often hang in mid-air
	[_thingX, surfaceNormal position _thingX] remoteExec ["setVectorUp", _thingX];

	// Place on closest surface
	private _pos = getPosASL _thingX;
	private _intersects = lineIntersectsSurfaces [_pos, _pos vectorAdd [0,0,-100], _thingX];
	if (count _intersects > 0) then {
		_thingX setPosASL (_intersects select 0 select 0);
	};

	if (_thingX isKindOf "StaticWeapon") then { 
		_thingX lock false;
		_thingX spawn {
			// wait until the thing has settled before adding/switching it
			sleep 2;
			["", _this] remoteExecCall ["A3A_fnc_addVehicleToGarrison", 2];
		};
	};

	_thingX setVariable ["objectBeingMoved", false];

	[_thingX, _thingX getVariable "A3A_originalMass"] remoteExecCall ["setMass", _thingX];
};

private _actionX = _playerX addAction ["Drop Here", {
	(_this select 3) params ["_thingX", "_fnc_placeObject"];

	[_thingX, player, (_this select 2)] call _fnc_placeObject;
}, [_thingX, _fnc_placeObject],6,true,true,"",""];

waitUntil {sleep 0.2;
	(_playerX != attachedTo _thingX)
	or (vehicle _playerX != _playerX)
	or !([_playerX] call A3A_fnc_canFight)
	or (!_isStatic and !(_thingX inArea _markerX))
	or (!isPlayer _playerX)
	or (_isStatic and {count crew _thingX > 0})
};

[_thingX, _playerX, _actionX] call _fnc_placeObject;
if !(_isStatic) then { _thingX addAction ["Move this asset", A3A_fnc_moveHQObject,nil,0,false,true,"","(_this == theBoss)"] };

if (vehicle _playerX != _playerX) exitWith {["Move HQ", "You cannot move HQ assets while in a vehicle."] call A3A_fnc_customHint;};

if (!_isStatic and !(_thingX inArea _markerX)) exitWith {["Move HQ", "This asset cannot be moved further away from HQ."] call A3A_fnc_customHint;};
