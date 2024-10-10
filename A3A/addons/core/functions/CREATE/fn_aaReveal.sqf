#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_veh"];
private _oldPos = getPos _veh;
while {(alive _veh) and !(isNull _veh)} do {
    sleep 10; // vehicles heading over 720kmh have a chance of not being caught by AA, which is a fair sacrifice for performance
    private _newPos = getPos _veh;
    private _posDifference = _oldPos distance2D _newPos;
    _oldPos = _newPos;
    private _side = side _veh;
    if (_posDifference < 5) then {continue};
    if (_side == civilian) then {continue};
    // we actually reveal to all nearby units now
    private _enemySides = [Occupants,Invaders,teamPlayer] - [_side]; // this is horrible but its the best way I think we can avoid pulling all the units for performance
    private _enemySide1 = _enemySides select 0;
    private _enemySide2 = _enemySides select 1; 
    private _nearbyUnitsEnemySides = (units _enemySide1 + units _enemySide2) inAreaArray [_oldPos, 2000, 2000];
    private _aaUnits = _nearbyUnitsEnemySides select {("AA" in (_x getVariable "unitType")) || !(isNull objectParent _x)};
    {
        [_x,_veh] remoteExec ["A3A_fnc_localReveal",_x]; // this is also horrible,
    } forEach _aaUnits;

};
_veh setVariable ["aaRevealHandle",scriptNull];
Debug_1("Vehicle %1 was destroyed or deleted aborting air reveal routine",_veh)