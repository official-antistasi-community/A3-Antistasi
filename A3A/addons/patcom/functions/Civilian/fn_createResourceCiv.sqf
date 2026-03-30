/*
    Author: [Hazey]
    Description:
        Adds civilians to resource points to be used as workers.

    Arguments:
        <String> Marker location where you want the civilians to be spawned at.
        <Number> Max amount of civilians you want to be spawned in. Default: 4

    Return Value:
        <Array> Array of spawnedCivilians for deletion or manipulation purposes.

    Scope: Any
    Environment: Any
    Public: No

    Example: 
        _spawnedCivilians = [_markerX, 4] call A3A_fnc_createResourceCiv;

    License: MIT License
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_markerX", ["_maxResourceCivilians", 4]];

private _daystate = [] call A3A_fnc_getDayState;

if (_markerX in destroyedSites) exitWith {
    ServerDebug("_markerX in destroyedSites and civilian workers have not spawned.");
    nil;
};

if !(_daystate == "DAY") exitWith {
    ServerDebug("Civilian Workers are outside of working hours and have not spawned.");
    nil;
};

private _civs = [];
private _groupX = createGroup civilian;
private _positionX = getMarkerPos (_markerX);

for "_i" from 1 to _maxResourceCivilians do {
    private _spawnPosition = [_positionX, 10, 50, 2, 0, -1, 0] call A3A_fnc_getSafePos;
    if (_spawnPosition isEqualTo [0,0]) then {
        ServerDebug("Resource Civilian could not be spawned because no valid spawn position was found.");
        continue;
    };
    private _civUnit = [_groupX, FactionGet(civ, "unitWorker"), _spawnPosition, [],0, "NONE"] call A3A_fnc_createUnit;
    _civUnit setVariable ["markerX", _markerX, true];
    _civs pushBack _civUnit;

    // Add event handlers to civilian units.
    [_civUnit] spawn A3A_fnc_civilianInitEH;

    sleep 0.1;
    _civUnit addEventHandler ["Killed",
        {
            if (({alive _x} count (units group (_this select 0))) == 0) then {
                private _markerX = (_this select 0) getVariable "markerX";
                private _nameX = [_markerX] call A3A_fnc_localizar;
                destroyedSites pushBackUnique _markerX;
                publicVariable "destroyedSites";
                ["TaskFailed", ["", format ["%1 Destroyed", _nameX]]] remoteExec ["BIS_fnc_showNotification",[teamPlayer, civilian]];
            };
        }
    ];
};

[_groupX] call A3A_fnc_patrolLoop;
private _spawnedCivilians = [_groupX, _civs];
_spawnedCivilians
