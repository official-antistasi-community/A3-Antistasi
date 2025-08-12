#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
private ["_markerX","_threat","_positionX","_analyzed","_sideX"];

_threat = 0;

//if (("launch_I_Titan_short_F" in unlockedWeapons) or ("launch_NLAW_F" in unlockedWeapons)) then {_threat = 3};

_markerX = _this select 0;
_sideX = _this select 1;
if (_markerX isEqualType []) then {_positionX = _markerX} else {_positionX = getMarkerPos _markerX};
_threat = _threat + 2 * ({(isOnRoad getMarkerPos _x) and (getMarkerPos _x distance _positionX < distanceSPWN)} count outpostsFIA);

{
if (getMarkerPos _x distance _positionX < distanceSPWN) then
	{
	_analyzed = _x;
	_garrison = garrison getVariable [_analyzed,[]];
	_threat = _threat + (floor((count _garrison)/8));
	//_size = [_analyzed] call A3A_fnc_sizeMarker;
	_staticsX = staticsToSave select {_x inArea _analyzed};
	if (count _staticsX > 0) then
		{
		_threat = _threat + ({typeOf _x in FactionGet(reb,"staticMortars")} count _staticsX) + (2*({typeOf _x in FactionGet(reb,"staticAT")} count _staticsX))
		};
	};
} forEach ((markersX - citiesX - controlsX - outpostsFIA) select {sidesX getVariable [_x,sideUnknown] != _sideX});

_threat
