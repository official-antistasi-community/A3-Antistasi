/*  Simulates the call for support by a group by making the teamleader a bit more dumb for a time

    Execution on: HC or Server, group-local

    Scope: Internal

    Params:
        _group: GROUP : The group which should call support
        _target: OBJECT : The target object the group wants support against

    Returns:
        Nothing
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_group", "_target"];
private _groupLeader = leader _group;
private _side = side _group;

if(_side != Occupants and _side != Invaders) exitWith {
    Error_2("Non-enemy group %1 of side %2 managed to call callForSupport", _group, _side);
};

// Don't call support against units unless there's slightly more information than damage dealt
// Should rule out calls for mines/charges but still pick up snipers (maybe only after the second kill)
if (_target isKindOf "CAManBase" and { _group knowsAbout _target <= 1.5 }) exitWith {};

//If groupleader is down, dont call support
if !(_groupLeader call A3A_fnc_canFight) exitWith {};

if((_group getVariable ["A3A_canCallSupportAt", -1]) > time) exitWith {};

private _timeToCallSupport = (10 + random 5) / A3A_balancePlayerScale;
_group setVariable ["A3A_canCallSupportAt", time + 5*_timeToCallSupport];

ServerDebug_4("Leader of %1 (side %2) is starting to request support against %3 (type %4)", _group, _side, _target, typeof _target);

//Lower skill of group leader to simulate radio communication (!!!Barbolanis idea!!!)
// Maintain differential leader skills (see NATOinit)
private _oldSkill = skill _groupLeader;
private _oldCourage = _groupLeader skill "courage";
_groupLeader setSkill (_oldSkill - 0.2);

sleep _timeToCallSupport;

//Reset leader skill
_groupLeader setSkill _oldSkill;
_groupLeader setskill ["courage", _oldCourage];
_groupLeader setskill ["commanding", _oldCourage];

//If the group leader survived the call, proceed
if(_groupLeader call A3A_fnc_canFight) then
{
    // why here? Are we intercepting the radio traffic?
    private _revealed = [getPosATL _groupLeader, side _group] call A3A_fnc_calculateSupportCallReveal;
    //Starting the support
    ServerDebug_2("%1 managed to request support, reveal value is %2", _group, _revealed);
    [_side, _target, getPosATL _groupLeader, _group knowsAbout _target, _revealed] remoteExec ["A3A_fnc_requestSupport", 2];
}
else
{
    //Support call failed, reset cooldown
    ServerDebug_1("%1 failed to request support as the leader is dead or down", _group);
    _group setVariable ["A3A_canCallSupportAt", nil];
};
