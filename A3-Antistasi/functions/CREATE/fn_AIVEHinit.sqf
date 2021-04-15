/*
Author: Barbolani

Description:
    Installs various damage/smoke/kill/capture logic for vehicles
    Will set and modify the "originalSide" and "ownerSide" variables on the
    vehicle indicating side ownership
    If a rebel enters a vehicle, it will be switched to rebel side and added
    to vehDespawner

Arguments:
    1. <Object>: Vehicle object
    2. <Side>: Side ownership for vehicle

Return Value: <nil>
Scope: Server
Environment: Scheduled
Public: No

Dependencies:
    teamPlayer, A3A_fnc_smokeCoverAuto, A3A_fnc_customHint, Occupants,
    Invaders, posHQ, A3A_fnc_isMember, airportsX, distanceForAirAttack,
    A3A_fnc_airportCanAttack, sidesX, A3A_fnc_log, A3A_fnc_vehKilledOrCaptured,
    A3A_fnc_postmortem, A3A_fnc_addActionBreachVehicle, vehAPCs, vehTanks,
    vehAttack, vehNormal, vehBoats, vehAA, vehPlanes, vehTransportAir,
    A3A_hasRHS, staticATteamPlayer, staticAAteamPlayer, SDKMortar, A3A_hasIFA,
    vehSDKBike, vehNATOBike, vehCSATBike, A3A_fnc_logistics_addLoadAction,
    A3A_fnc_cleanserVeh

Example: [_veh, "west"] spawn A3A_fnc_AIVEHinit;
*/

/* -------------------------------------------------------------------------- */
/*                                   defines                                  */
/* -------------------------------------------------------------------------- */
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
#define SERVER 2
#define TITLE "General"
#define HINT_TEXT "Only Humans can pilot an air vehicle"

/* -------------------------------------------------------------------------- */
/*                                event handlers                              */
/* -------------------------------------------------------------------------- */

private _eh_carHandleDamage =
{
    params ["_vehicle", "_hitSelection", "_damage", "_source", "_projectile"];

    if (_hitSelection find "wheel" == -1) exitWith {};
    if (isPlayer (driver _vehicle)) exitWith {};
    if (_projectile != "" && { side _source == teamPlayer }) exitWith {};

    0
};

private _eh_carGetOut =
{
    params ["_vehicle", "_position", "_unit"];

    if (side _unit == teamPlayer) exitWith {};
    if !(_vehicle getVariable "within") exitWith {};

    _vehicle setVariable ["within", false];
    [_vehicle] spawn A3A_fnc_smokeCoverAuto;
};

private _eh_carGetIn =
{
    params ["_vehicle", "_position", "_unit"];

    if (side _unit == teamPlayer) exitWith {};

    _vehicle setVariable ["within", true];
};

private _eh_APCHandleDamage =
{
    params ["_vehicle", "_hitSelection", "_damage", "_source", "_projectile"];

    if !(canFire _vehicle)
    then
    {
        [_vehicle] spawn A3A_fnc_smokeCoverAuto;
        _vehicle removeEventHandler ["HandleDamage", _thisEventHandler];
    };

    if (_hitSelection find "wheel" == -1) exitWith {};
    if (_projectile != "") exitWith {};
    if (isPlayer (driver _vehicle)) exitWith {};

    0
};

private _eh_APCGetOut =
{
    params ["_vehicle", "_position", "_unit"];

    if (side _unit == teamPlayer) exitWith {};
    if !(_vehicle getVariable "within") exitWith {};

    _vehicle setVariable ["within", false];
    [_vehicle] spawn A3A_fnc_smokeCoverAuto;
};

private _eh_APCGetIn =
{
    params ["_vehicle", "_position", "_unit"];

    if (side _unit == teamPlayer) exitWith {};

    _vehicle setVariable ["within", true];
};

private _eh_tankHandleDamage =
{
    params ["_vehicle", "_hitSelection", "_damage", "_source", "_projectile"];

    if (canFire _vehicle) exitWith {};

    [_vehicle] spawn A3A_fnc_smokeCoverAuto;
    _vehicle removeEventHandler ["HandleDamage", _thisEventHandler];

    nil
};

private _eh_vehAttackHandleDamage =
{
    params ["_vehicle", "_hitSelection", "_damage", "_source", "_projectile"];

    if (_hitSelection find "wheel" == -1) exitWith {};
    if (isPlayer (driver _vehicle)) exitWith {};
    if (_projectile != "" && { side _source == teamPlayer }) exitWith {};

    0
};

private _eh_planeGetIn =
{
    params ["_vehicle", "_position", "_unit"];

    if (_position != "driver") exitWith {};
    if (isPlayer _unit) exitWith {};
    if !(_unit getVariable ["spawner", false]) exitWith {};
    if (side (group _unit) != teamPlayer) exitWith {};

    moveOut _unit;
    [TITLE, HINT_TEXT] spawn A3A_fnc_customHint;
};

private _eh_heliGetOut =
{
    params ["_vehicle", "_position", "_unit"];

    if !(isTouchingGround _vehicle) exitWith {};
    if !(isEngineOn _vehicle) exitWith {};
    if (side _unit == teamPlayer) exitWith {};
    if !(_vehicle getVariable "within") exitWith {};

    _vehicle setVariable ["within", false];
    [_vehicle] spawn A3A_fnc_smokeCoverAuto;
};

private _eh_heliGetIn =
{
    params ["_vehicle", "_position", "_unit"];

    if (side _unit == teamPlayer) exitWith {};

    _vehicle setVariable ["within", true];
};

private _eh_mortarFired =
{
    _this spawn
    {
        params ["_vehicle", "_weapon", "_muzzle"];

        private _data = _vehicle getVariable ["detection", [position _vehicle, 0]];
        private _position = position _vehicle;
        private _chance = _data select 1;

        if (_position distance (_data # 0) < 300)
        then { _chance = _chance + 2; }
        else { _chance = 0; };

        if (random 100 >= _chance) exitWith {};

        {
            if (side _x == Occupants || { side _x == Invaders })
            then { _x reveal [_vehicle, 4]; }
        } forEach allUnits;

        if (_vehicle distance posHQ < 300)
        then
        {
            if (["DEF_HQ"] call BIS_fnc_taskExists) exitWith {};

            private _leader = leader (gunner _vehicle);

            if !(isPlayer _leader)
            exitWith { [[],"A3A_fnc_attackHQ"] remoteExec ["A3A_fnc_scheduler", SERVER]; };

            if !([_leader] call A3A_fnc_isMember) exitWith {};

            [[], "A3A_fnc_attackHQ"] remoteExec ["A3A_fnc_scheduler", SERVER];
        }
        else
        {
            private _bases = airportsX select {
                (getMarkerPos _x) distance _vehicle < distanceForAirAttack
                && { [_x, true] call A3A_fnc_airportCanAttack
                && { sidesX getVariable [_x, sideUnknown] != teamPlayer }}};

            if (count _bases <= 0) exitWith {};

            private _base = [_bases, _position] call BIS_fnc_nearestPosition;
            private _side = sidesX getVariable [_base, sideUnknown];

            [[getPosASL _vehicle, _side, "Normal", false], "A3A_fnc_patrolCA"]
                remoteExec ["A3A_fnc_scheduler", SERVER];
        };

        _vehicle setVariable ["detection", [_position, _chance]];
    };
};

private _eh_civHandleDamage1 =
{
    params ["_vehicle", "_hitSelection", "_damage", "_source", "_projectile"];

    if (_hitSelection find "wheel" == -1) exitWith {};
    if (_projectile != "") exitWith {};
    if (isPlayer (driver _vehicle)) exitWith {};

    0
};

private _eh_civHandleDamage2 =
{
    params ["_vehicle", "_hitSelection", "_damage", "_source", "_projectile"];

    if (side _source != teamPlayer) exitWith {};

    _vehicle removeEventHandler ["HandleDamage", _thisEventHandler];
    private _driver = driver _vehicle;

    if (side (group _driver) != civilian) exitWith {};

    _driver leaveVehicle _vehicle;
};

private _eh_vehicleGetIn =
{
    params ["_vehicle", "_position", "_unit"];

    // only rebels can flip vehicles atm
    if (side (group _unit) != teamPlayer) exitWith {};

    _vehicle removeEventHandler ["GetIn", _thisEventHandler];

    private _oldside = _vehicle getVariable ["ownerSide", teamPlayer];

    if (_oldside == teamPlayer) exitWith {};

    Debug_2("%1 switching side from %2 to rebels", typeof _vehicle, _oldside);
    [_vehicle, teamPlayer, true] spawn A3A_fnc_vehKilledOrCaptured;
};

private _eh_vehicleGetOut =
{
    params ["_vehicle", "_position", "_unit"];

    if !(_unit isEqualType objNull)
    exitWith
    {
        Error_3("GetOut handler weird input: %1, %2, %3", _vehicle, _position, _unit);
    };

    if (side (group _unit) != teamPlayer) exitWith {};

    // despawner always launched locally
    _vehicle setVariable ["despawnBlockTime", time + 3600];
};

private _eh_vehicleDammaged =
{
    params ["_vehicle", "_selection", "_damage", "_hitPartIndex", "_hitPoint", "_shooter"];

    if (_damage < 1) exitWith {};
    if (_selection != "") exitWith {};

    _vehicle removeEventHandler ["Dammaged", _thisEventHandler];

    private _shooterSide = side (group _shooter);

    [3, format ["%1 destroyed by %2", typeof _vehicle, _shooterSide],
        "fn_AIVEHinit"] call A3A_fnc_log;

    [_vehicle, _shooterSide, false] call A3A_fnc_vehKilledOrCaptured;
    [_vehicle] spawn A3A_fnc_postmortem;
};

private _eh_airVehicleGetIn =
{
    params ["_veh", "_role", "_unit"];

    if (side (group _unit) != teamPlayer) exitWith {};
    if !(isPlayer _unit) exitWith {};

    [_veh] spawn A3A_fnc_airspaceControl;
};

private _eh_airIncomingMissile =
{
    params ["_target", "_ammo", "_vehicle", "_instigator"];

    private _group = group driver _target;
    private _supportTypes = [_group, _vehicle] call A3A_fnc_chooseSupport;
    _supportTypes = _supportTypes - ["QRF"];
    private _reveal = [getPos _vehicle, side _group] call A3A_fnc_calculateSupportCallReveal;
    [_vehicle, 4, _supportTypes, side _group, _reveal] remoteExec ["A3A_fnc_sendSupport", 2];
};

/* -------------------------------------------------------------------------- */
/*                                    start                                   */
/* -------------------------------------------------------------------------- */

private _filename = "fn_AIVEHinit";

params ["_vehicle", "_side"];

if (isNil "_vehicle") exitWith {};

// vehicle already initialized, just swap side and exit
if !(isNil { _vehicle getVariable "ownerSide" })
exitWith { [_vehicle, _side] call A3A_fnc_vehKilledOrCaptured; };

_vehicle setVariable ["originalSide", _side, true];
_vehicle setVariable ["ownerSide", _side, true];

// probably just shouldn't be called for these
if (_vehicle isKindOf "FlagCarrier") exitWith {};
if (_vehicle isKindOf "Building") exitWith {};
if (_vehicle isKindOf "ReammoBox_F") exitWith {};

// this might need moving into a different function later
// might need an exception on this for vehicle weapon mags?
if (_side == teamPlayer)
then
{
    clearMagazineCargoGlobal _vehicle;
    clearWeaponCargoGlobal _vehicle;
    clearItemCargoGlobal _vehicle;
    clearBackpackCargoGlobal _vehicle;
};

private _type = typeOf _vehicle;

switch (true)
do
{
    case (_type in vehAPCs):
    {
        _vehicle spawn A3A_fnc_addActionBreachVehicle;
        _vehicle addEventHandler ["HandleDamage", _eh_APCHandleDamage];
        _vehicle setVariable ["within", true];
        _vehicle addEventHandler ["GetOut", _eh_APCGetOut];
        _vehicle addEventHandler ["GetIn", _eh_APCGetIn];
    };

    case (_type in vehTanks):
    {
        _vehicle spawn A3A_fnc_addActionBreachVehicle;
        _vehicle addEventHandler ["HandleDamage", _eh_tankHandleDamage];
    };

    case (_type in vehAttack):
    {
        _vehicle spawn A3A_fnc_addActionBreachVehicle;
        _vehicle addEventHandler ["HandleDamage", _eh_vehAttackHandleDamage];
    };

    case (_type in vehNormal || { _type in vehBoats || { _type in vehAA }}):
    {
        _vehicle spawn A3A_fnc_addActionBreachVehicle;

        if !(_vehicle isKindOf "Car") exitWith {};

        _vehicle addEventHandler ["HandleDamage", _eh_carHandleDamage];

        if ((allTurrets _vehicle) findIf
            { "SmokeLauncher" in (_vehicle weaponsTurret _x) } == -1)
        exitWith {};

        _vehicle setVariable ["within", true];
        _vehicle addEventHandler ["GetOut", _eh_carGetOut];
        _vehicle addEventHandler ["GetIn", _eh_carGetIn];
    };

    case (_type in vehPlanes):
    {
        _vehicle addEventHandler ["GetIn", _eh_planeGetIn];

        if !(_vehicle isKindOf "Helicopter") exitWith {};
        if !(_type in vehTransportAir) exitWith {};

        _vehicle setVariable ["within", true];
        _vehicle addEventHandler ["GetOut", _eh_heliGetOut];
        _vehicle addEventHandler ["GetIn", _eh_heliGetIn];
    };

    case (_vehicle isKindOf "StaticWeapon"):
    {
        [_vehicle] call A3A_fnc_logistics_addLoadAction;

        _vehicle setCenterOfMass
            [(getCenterOfMass _vehicle) vectorAdd [0, 0, -3], 0];

        if (!(_vehicle in staticsToSave)
            && { side (gunner _vehicle) != teamPlayer
            && { A3A_hasRHS
            && { _type in [staticATteamPlayer, staticAAteamPlayer] }}})
        then
        {
            [_vehicle, "moveS"] remoteExec
                ["A3A_fnc_flagaction", [teamPlayer, civilian], _vehicle];
        };

        if (_type != SDKMortar) exitWith {};

        _vehicle addEventHandler ["Fired", _eh_mortarFired];
    };
};

/* -------------------------------------------------------------------------- */

if (_side == civilian)
then
{
    _vehicle addEventHandler ["HandleDamage", _eh_civHandleDamage1];
    _vehicle addEventHandler ["HandleDamage", _eh_civHandleDamage2];
};

/* -------------------------------------------------------------------------- */

// Vehicle stealing handler
// When a rebel first enters a vehicle, fire capture function
if (_side != teamPlayer)
then { _vehicle addEventHandler ["GetIn", _eh_vehicleGetIn]; };

/* -------------------------------------------------------------------------- */

if (_veh isKindOf "Air")
then
{
    //Start airspace control script if rebel player enters
    _veh addEventHandler ["GetIn", _eh_airVehicleGetIn];
    _veh addEventHandler ["IncomingMissile", _eh_airIncomingMissile]
};

/* -------------------------------------------------------------------------- */

// Handler to prevent vehDespawner deleting vehicles
// for an hour after rebels exit them
_vehicle addEventHandler ["GetOut", _eh_vehicleGetOut];

// Because Killed and MPKilled are both retarded, we use Dammaged
_vehicle addEventHandler ["Dammaged", _eh_vehicleDammaged];

/* -------------------------------------------------------------------------- */

//add JNL loading to quadbikes
if (!A3A_hasIFA
    && { (typeOf _vehicle) in [vehSDKBike, vehNATOBike, vehCSATBike] })
then { [_vehicle] call A3A_fnc_logistics_addLoadAction; };

/* -------------------------------------------------------------------------- */

// deletes vehicle if it exploded on spawn...
[_vehicle] spawn A3A_fnc_cleanserVeh;
