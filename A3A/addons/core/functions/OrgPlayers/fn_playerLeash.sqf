/*
Maintainer: Caleb Serafin
    If the current player is not a member, it will loop every 60 seconds to check the distance from the player to HQ or any member.
    If there is a member online, it will warn the player and begin a 61 second countdown
    See playerLeashRefresh for teleportation compatibility.

Return Value:
    <ANY> Undefined

Scope: Clients, Global Effect
Environment: Scheduled
Public: No (Only spawned once in initClient)
Dependencies:
    <SCALAR> memberDistance
    <ARRAY> A3A_FFPun_Jailed
    <ARRAY> markersX

Example:
    [] spawn A3A_fnc_playerLeash;

    // Following snippet is used to debug as non-member after the game has initialised:
    memberDistance = 1000;
    membershipEnabled = true;
    membersX deleteAt (membersX find getPlayerUID player);
    A3A_DEV_playerLeash_debug = true;
    [] spawn A3A_fnc_playerLeash;
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

#define INITIAL_COUNT_TIME 61
A3A_playerLeash_refresh = false;
private _countDown = INITIAL_COUNT_TIME;
private _debugMode = !isNil "A3A_DEV_playerLeash_debug";

// -1 is used to represent unlimited distance.
if (memberDistance <= 0 || !membershipEnabled) exitWith {};

// Membership is rechecked in the case that a temporary membership is granted.
while {!([player] call A3A_fnc_isMember) || _debugMode} do {
    private _nearestLeashCentre = getPosATL player;  // Only 2D pos is evaluated. Default to player position when no members or ff punishment is the exemption.
    private _veh = vehicle player;
    private _withinLeash = switch (true) do {
        case (!isNil "A3A_FFPun_Jailed" && {(getPlayerUID player) in A3A_FFPun_Jailed}): { true };
        case (player == theBoss): { true };             // covered in playerLeashCheckPosition, but shortcut
        case (_veh isKindOf "Plane" and {!isTouchingGround _veh or speed _veh > 100}): { true };          // no air spawning check, distance.sqf + margin
        // Add leash exemptions here.
        default { [getPosATL player,_nearestLeashCentre] call A3A_fnc_playerLeashCheckPosition };
    };

    if (_withinLeash) then {
        // Reset timer.
        _countDown = INITIAL_COUNT_TIME;
        // Calculates the time of the next check based on radius and velocity in any direction.
        private _distanceToEdge =  (memberDistance - (player distance2D _nearestLeashCentre));
        // 100km/h is an offroads' top speed on average terrain.
        private _velocity = (speed player max 100) / 3.6;  // Convert Km/h to m/s
        private _nextLeashCheck = 0.75 * _distanceToEdge / _velocity;  // Distance is checked at 75% to accommodate deviation from expected velocity and position.
        _nextLeashCheck = _nextLeashCheck max 1;  // Time inaccuracy less than 1 sec is unnecessary.

        private _nextLeashCheckTime = _nextLeashCheck + serverTime;
        while {_nextLeashCheckTime > serverTime} do {
            if (A3A_playerLeash_refresh) exitWith {A3A_playerLeash_refresh = false;};
            if (_debugMode) then { systemChat ("Leash check every " + (_nextLeashCheck toFixed 0) + " s; Next in " + ((_nextLeashCheckTime - serverTime) toFixed 0) + " s") };
            uiSleep ((_nextLeashCheckTime - serverTime) min 5);  // Prevent overshooting the next main check. 5 sec is the usual wait time to debug or check A3A_playerLeash_refresh.
        };
    } else {
        // Decrement timer.
        _countDown = _countDown - 1;
        // Show player a countdown warning.
        private _retreatDistance = (player distance2D _nearestLeashCentre) - memberDistance;
        private _compassDirections = ["N","NE","E","SE","S","SW","W","NW"];
        private _retreatDirection = _compassDirections # ((player getDir _nearestLeashCentre) / 360 * count _compassDirections);

        [localize "STR_A3A_fn_orgp_plaLeash_comrade", format [localize "STR_A3A_fn_orgp_plaLeash_retreat", ceil _retreatDistance, _retreatDirection, _countDown, ceil (memberDistance/1e3)]] call A3A_fnc_customHint;
        uiSleep 1;
        if (_countDown <= 0) then {
            // Get nearest location name for logging.
            private _nearestName = [citiesX, player] call BIS_fnc_nearestPosition; // markersX
            Info_4("%1 [%2] force teleported to HQ. Was near %3, outside leash by %4 m.", name player, getPlayerUID player, _nearestName, _retreatDistance toFixed 0);

            // Teleport the vehicle as well to avoid it becoming stranded and unobtainable by the player.
            private _possibleVehicle = vehicle player;
            if (_possibleVehicle != player && (driver _possibleVehicle) == player) then {
                [_possibleVehicle] call A3A_fnc_teleportVehicleToBase;
            };
            player setPos (getMarkerPos respawnTeamPlayer);
        };
    };
};
