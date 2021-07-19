#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
_resourcesFIA = server getVariable "resourcesFIA";

if (_resourcesFIA < 5000) exitWith {["Rebuild Assets", "You do not have enough money to rebuild any Asset. You need 5.000 €"] call A3A_fnc_customHint;};

_destroyedSites = destroyedSites - citiesX;

if (!visibleMap) then {openMap true};
positionTel = [];
["Rebuild Assets", "Click on the zone you want to rebuild."] call A3A_fnc_customHint;

onMapSingleClick "positionTel = _pos;";

waitUntil {sleep 1; (count positionTel > 0) or (not visiblemap)};
onMapSingleClick "";

if (!visibleMap) exitWith {};

_positionTel = positionTel;

_siteX = [markersX,_positionTel] call BIS_fnc_nearestPosition;

if (getMarkerPos _siteX distance _positionTel > 50) exitWith {["Rebuild Assets", "You must click near a map marker"] call A3A_fnc_customHint;};

if ((not(_siteX in _destroyedSites)) and (!(_siteX in outposts))) exitWith {["Rebuild Assets", "You cannot rebuild that"] call A3A_fnc_customHint;};

_leave = false;
_antennaDead = objNull;
_textX = "That Outpost does not have a destroyed Radio Tower";
if (_siteX in outposts) then
	{
	_antennasDead = antennasDead select {_x inArea _siteX};
	if (count _antennasDead > 0) then
		{
		if (sidesX getVariable [_siteX, sideUnknown] != teamPlayer) then
			{
			_leave = true;
			_textX = format ["You cannot rebuild a Radio Tower in an Outpost which does not belong to %1",FactionGet(reb,"name")];
			}
		else
			{
			_antennaDead = _antennasDead select 0;
			};
		}
	else
		{
		_leave = true
		};
	};

if (_leave) exitWith {["Rebuild Assets", format ["%1",_textX]] call A3A_fnc_customHint;};

if (isNull _antennaDead) then
	{
	_nameX = [_siteX] call A3A_fnc_localizar;

	["Rebuild Assets", format ["%1 Rebuilt"]] call A3A_fnc_customHint;

	[0,10,_positionTel] remoteExec ["A3A_fnc_citySupportChange",2];
    [Occupants, 10, 30] remoteExec ["A3A_fnc_addAggression",2];
    [Invaders, 10, 30] remoteExec ["A3A_fnc_addAggression",2];
	destroyedSites = destroyedSites - [_siteX];
	publicVariable "destroyedSites";
	}
else
	{
	["Rebuild Assets", "Radio Tower rebuilt"] call A3A_fnc_customHint;
	[_antennaDead] remoteExec ["A3A_fnc_rebuildRadioTower", 2];
	};
[0,-5000] remoteExec ["A3A_fnc_resourcesFIA",2];
