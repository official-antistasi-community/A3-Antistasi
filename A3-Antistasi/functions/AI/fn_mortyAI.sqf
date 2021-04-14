/*
Author: Barbolani, Triada
Description:
    checking static vehicle type,
    equip group leader and static operator with backpacks,
    and deploy static weapon when leader is ready (not moving to waypoint)
    if the operator is dead, then leader is going in static, fold _mortar
    when group moving to waypoint

Arguments:
    <OBJECT> artillery group
    <STRING> static vehicle type

Return Value:
    <BOOL> The return value

Scope: Server
Environment: Scheduled
Public: No
Dependencies:
    MortStaticSDKB,
    supportStaticsSDKB3,
    SDKMGStatic,
    MGStaticSDKB,
    supportStaticsSDKB2,
    A3A_fnc_AIVEHinit

Example: [_group, SDKMortar] spawn A3A_fnc_mortyAI;
*/

/* -------------------------------------------------------------------------- */
/*                                   defines                                  */
/* -------------------------------------------------------------------------- */

#define DESTROYED_DAMAGE 1
#define NOT_GET_IN_DAMAGE 0.89999995

/* -------------------------------------------------------------------------- */
/*                                    init                                    */
/* -------------------------------------------------------------------------- */

params ["_group", "_type"];

private _units = units _group;

_units params [["_leader", objNull], ["_operator", objNull]];

private _leaderBackpack = MortStaticSDKB;
private _operatorBackpack = supportStaticsSDKB3;

/* --------------------------- check if MG static --------------------------- */

if (_type == SDKMGStatic)
then
{
    _leaderBackpack = MGStaticSDKB;
    _operatorBackpack = supportStaticsSDKB2;

    _leader setVariable ["typeOfSoldier", "StaticGunner"];
}
else
{
    _leader setVariable ["typeOfSoldier", "StaticMortar"];
};

/* -------------------------------------------------------------------------- */
/*                              local procedures                              */
/* -------------------------------------------------------------------------- */

private _deployMortar =
{
    if !(isNull _mortar) exitWith {};

    params ["_unit"];

    _pos = (getPos _unit) findEmptyPosition [1, 30, _type];

    if (_pos isEqualTo [])
    exitWith
    {
        _continue = true;
        // TODO hint something to HC commander
        sleep 30;
    };

    removeBackpackGlobal _leader;
    removeBackpackGlobal _operator;
    _mortar = _type createVehicle _pos;

    [_mortar, side _group] call A3A_fnc_AIVEHinit;
};

private _getInMortar =
{
    // if mortar is destroyed
    if (damage _mortar >= DESTROYED_DAMAGE)
    exitWith { _exitCycle = true; };

    // if mortar is not fully broken then wait sombody to repare
    if (damage _mortar >= NOT_GET_IN_DAMAGE)
    exitWith { _continue = true; sleep 10; };

    params ["_unit"];

    if (vehicle _unit == _mortar) exitWith {};

    _unit assignAsGunner _mortar;
    [_unit] orderGetIn true;
    [_unit] allowGetIn true;
};

private _foldMortar =
{
    if (isNull _mortar) exitWith { _exitCycle = true; };

    _leader addBackpackGlobal _leaderBackpack;
    _operator addBackpackGlobal _operatorBackpack;
    unassignVehicle _operator;
    moveOut _operator;
    deleteVehicle _mortar;
};

private _normalProcedure =
{
    waitUntil
    {
        _units = units _group;

        // if no units in the _group or _group is deleted
        if (_units isEqualTo [])
        exitWith { _continue = true; _exitCycle = true; true };

        // if leader or operator is dead
        if (_units findIf { !(alive _x) } != -1)
        exitWith { _continue = true; true };

        // all are alive and ready
        if (_units findIf { !(alive _x) || { !(unitReady _x) } } == -1)
        exitWith { true };

        sleep 1;

        false
    };

    if (_continue) exitWith {};

    // TODO force leader to stay near the mortar or to sit in the mortar

    [_operator] call _deployMortar;

    if (_continue) exitWith {};

    [_operator] call _getInMortar;

    if (_continue) exitWith {};

    waitUntil
    {
        _units = units _group;

        // if no units in the _group or _group is deleted
        if (_units isEqualTo [])
        exitWith { _continue = true; _exitCycle = true; true };

        // if somebody is not alive
        if (_units findIf { !(alive _x) } != -1)
        exitWith { _continue = true; true };

        // leader is not ready (on the way to waypoint)
        if !(unitReady _leader)
        exitWith { true };

        sleep 1;

        false
    };

    if (_continue) exitWith {};

    call _foldMortar;
};


private _waitProcedure =
{
    params ["_unit"];

    waitUntil
    {
        sleep 1;

        // if leader is not alive or mortar is destroyed
        if (!(alive _unit) || { damage _mortar >= DESTROYED_DAMAGE })
        exitWith { _continue = true; _exitCycle = true; true };

        // if leader is enter mortar
        if (vehicle _unit == _mortar) exitWith { true };

        false
    };

    if (_continue) exitWith {};

    waitUntil
    {
        sleep 1;

        // if leader is not alive or mortar is destroyed
        if (!(alive _unit) || { damage _mortar >= DESTROYED_DAMAGE })
        exitWith { _exitCycle = true; true };

        // if leader is exit mortar for some reason
        if (vehicle _unit != _mortar) exitWith { sleep 30; true };

        false
    };
};

private _lastOneProcedure =
{
    params ["_unit"];

    if !(alive _unit) exitWith { _exitCycle = true; };

    [_unit] call _deployMortar;

    if (_continue) exitWith {};

    [_unit] call _getInMortar;

    if (_continue) exitWith {};

    [_unit] call _waitProcedure;
};

/* -------------------------------------------------------------------------- */
/*                                 main cycle                                 */
/* -------------------------------------------------------------------------- */

private _pos = [];
private _mortar = objNull;

private _exitCycle = false;
private _continue = false;

while { !(_exitCycle) }
do
{
    _continue = false;

    switch (true)
    do
    {
        case !(alive _leader): { [_operator] call _lastOneProcedure; };
        case !(alive _operator): { [_leader] call _lastOneProcedure; };
        default { call _normalProcedure; };
    };

    sleep 0.1;
};
