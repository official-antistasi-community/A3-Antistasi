#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker"];

private _mrkD = format ["Dum%1",_marker];
private _mrkSide = sidesX getVariable [_marker,sideUnknown];
if (_mrkSide isEqualTo sideUnknown) exitWith {_mrkD setMarkerText "";}; // handle marker deletion case
private _faction = Faction(_mrkSide);

if (_marker in airportsX) then {
    _mrkD setMarkerTypeLocal (_faction get "flagMarkerType");
    _mrkD setMarkerColorLocal "Default";
} else {
    if (_marker in destroyedSites and _marker in citiesX) exitWith { _mrkD setMarkerColorLocal "ColorBlack" };
    if (_mrkSide == teamPlayer) exitWith { _mrkD setMarkerColorLocal colorTeamPlayer };
    _mrkD setMarkerColorLocal ([colorOccupants, colorInvaders] select (_mrkSide == Invaders));
};

private _mrkText = call {
    if (_marker in airportsX) exitWith { format ["%1 Airbase", _faction get "name"] };
    if (_marker in outposts) exitWith { format ["%1 Outpost", _faction get "name"] };
    if (_marker in resourcesX) exitWith { "Resources" };
    if (_marker in factories) exitWith { "Factory" };
    if (_marker in seaports) exitWith { "Sea Port" };
    ""; 		// city
};

if (_mrkSide == teamPlayer) then {
    private _numTroops = count (A3A_garrison get _marker get "troops");
    private _limit = [_marker] call A3A_fnc_getGarrisonLimit;
    if (_numTroops > 0) then { 
        _mrkText = format ["%1: %2%3", _mrkText, _numTroops, 
            if (_limit != -1) then {format ["/%1", _limit]} else {""}
        ];
    };
};
_mrkD setMarkerText _mrkText;
