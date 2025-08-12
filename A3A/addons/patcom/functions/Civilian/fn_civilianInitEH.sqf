/*
    Author: [Unknown] [Hazey]
    Description:
        Add event handlers to called units. This will generally be Civilian units.

    Arguments:
        <Object> Unit event handlers will be added to.

    Return Value:
        N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
        [_civUnit] spawn A3A_fnc_civilianInitEH;

    License: MIT License
*/

private ["_unit"];
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_unit"];

_unit setSkill 0;
_unit disableAI "TARGET";
_unit disableAI "AUTOTARGET";

_unit addEventHandler["FiredNear", {
    params ["_unit"];
    [_unit, _thisEvent, _thisEventHandler] call A3A_fnc_civilianFiredNearEH;
}];

_unit addEventHandler ["HandleDamage", {
    private _unit = _this select 0;
    private _dam = _this select 2;
    private _injurer = _this select 3;
    private _proy = _this select 4;
    if(!isNil "_injurer" && {isPlayer _injurer}) then {
        _unit setVariable ["injuredByPlayer", _injurer, true];
        _unit setVariable ["lastInjuredByPlayer", time, true];
    };

    if (_proy == "") then {
        if (_dam > 0.95 and {!isPlayer _injurer}) then {_dam = 0.9};
    };

    _dam
}];

_unit addEventHandler ["Killed", {
    params ["_victim", "_killer"];

    if (time - (_victim getVariable ["lastInjuredByPlayer", 0]) < 120) then {
        _killer = _victim getVariable ["injuredByPlayer", _killer];
    };
    if (isNull _killer) then {
        _killer	= _victim;
    };

    if (_victim == _killer) then {
        _nul = [-1,-1,getPosATL _victim] remoteExec ["A3A_fnc_citySupportChange",2];
    } else {
        if (isPlayer _killer) then {
            if (_victim getVariable "unitType" == FactionGet(civ, "unitWorker")) then {_killer addRating 1000};
            [-10,_killer] call A3A_fnc_playerScoreAdd;
        };
        _multiplier = 1;
        if ((_victim getVariable "unitType") == FactionGet(civ, "unitPress")) then {_multiplier = 3};
        switch (true) do {
            //Must be group, in case they're undercover.
            case (side group _killer == teamPlayer): {
                ServerDebug("aggroEvent | Rebels killed a civilian");
                [Occupants, 10 * _multiplier, 60] remoteExec ["A3A_fnc_addAggression",2];
                [1,0,getPosATL _victim] remoteExec ["A3A_fnc_citySupportChange",2];
            };
            case (side group _killer == Occupants): {
                [Occupants, -5 * _multiplier, 60] remoteExec ["A3A_fnc_addAggression",2];
                [0,1,getPosATL _victim] remoteExec ["A3A_fnc_citySupportChange",2];
            };
            case (side group _killer == Invaders): {
                [-1,1,getPosATL _victim] remoteExec ["A3A_fnc_citySupportChange",2];
            };
        };
    };

    [_victim] remoteExec ["A3A_fnc_postmortem", 2];
}];

["civInit", [_unit]] call EFUNC(Events,triggerEvent);