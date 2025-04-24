/*  Persistent AI script for helis to follow a vehicle
    Attack helis transition to attackHeli script if an enemy is detected
    Does its own cleanup once the target vehicle has been deleted or destroyed

Scope: Server or HC
Environment: Spawned

Arguments:
    <OBJECT> Vehicle (should be heli)
    <OBJECT> Object to follow
    <NUMBER> Max speed of convoy
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_heli", "_convoyObj", "_maxSpeed"];

private _heliGroup = group _heli;
_heli setVariable ["A3A_heliTravelScript", _thisScript];

if((typeOf _heli) in FactionGet(all,"vehiclesHelisAttack") + FactionGet(all,"vehiclesHelisLightAttack")) then 
{
    _heliGroup addEventHandler ["EnemyDetected", {
	    params ["_group", "_newTarget"];
        private _heli = vehicle leader _group;

        _heli limitSpeed 300;           // -1 is backwards for helis
        [vehicle leader _group, _group, getPosATL _newTarget] spawn A3A_fnc_attackHeli;

        terminate (_heli getVariable "A3A_heliTravelScript");
        _group removeEventHandler  [_thisEvent, _thisEventHandler];
    }];
};


private _speedSet = false;
private _wp = _heliGroup addWaypoint [_convoyObj, 50];

while {canMove _heli && alive _convoyObj} do {

    _wp setWaypointPosition [_convoyObj, 50];
    _wp setWaypointType "MOVE";
    _heliGroup setCurrentWaypoint _wp;

    if(_heli distance2D _convoyObj < 100 && !_speedSet) then 
    {
        _heli limitSpeed _maxSpeed;
       _wp setWaypointBehaviour "AWARE";
       _speedSet = true;
    };

    sleep 3;
};

// Do our own cleanup, don't care about convoy state other than _convoyObj
[_heli] spawn A3A_fnc_VEHDespawner;
[_heliGroup] spawn A3A_fnc_enemyReturnToBase;
