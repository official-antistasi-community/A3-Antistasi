params ["_group", "_supportTypes", "_target"];

/*  Simulates the call for support by a group by making the teamleader a bit more dumb for a time

    Execution on: HC or Server

    Scope: Internal

    Params:
        _group: GROUP : The group which should call support
        _supportTypes: ARRAY of STRINGs : The types of support the group calls for
        _target: OBJECT : The target object the group wants support against

    Returns:
        Nothing
*/

private _fileName = "callForSupport";
private _groupLeader = leader _group;

if(side _group == teamPlayer) exitWith
{
    [1, format ["Rebel group %1 managed to call callForSupport, not allowed for rebel groups", _group], _fileName] call A3A_fnc_log;
};

if((_group getVariable ["canCallSupportAt", -1]) > (dateToNumber date)) exitWith {};

//Block the group from calling support again
private _date = date;
_date set [4, (_date select 4) + 5];
private _dateNumber = dateToNumber _date;
_group setVariable ["canCallSupportAt", _dateNumber, true];

//If groupleader is down, dont call support
if !([_groupLeader] call A3A_fnc_canFight) exitWith {};

[
    3,
    format ["Leader of %1 (side %2) is starting to call for help against %3 with helps %4", _group, side _group, _target, _supportTypes],
    _fileName
] call A3A_fnc_log;

//Lower skill of group leader to simulate radio communication (!!!Barbolanis idea!!!)
private _oldSkill = skill _groupLeader;
_groupLeader setSkill (_oldSkill - 0.2);

//Wait for the call to happen
private _timeToCallSupport = 10 + random 5;
sleep _timeToCallSupport;

//Reset leader skill
_groupLeader setSkill _oldSkill;

//If the group leader survived the call, proceed
if([_groupLeader] call A3A_fnc_canFight) then
{
    private _revealed = [getPos _groupLeader, side _group] call A3A_fnc_calculateSupportCallReveal;
    //Starting the support
    [3, format ["%1 managed to call help against %2, reveal value is %3", _group, _target, _revealed], _fileName] call A3A_fnc_log;
    [_target, _group knowsAbout _target, _supportTypes, side _group, _revealed] remoteExec ["A3A_fnc_sendSupport", 2];
}
else
{
    //Support call failed, resetting cooldown
    [3, format ["%1 got no help as the leader is dead or down", _group], _fileName] call A3A_fnc_log;
    _group setVariable ["canCallSupportAt", -1, true];
};
