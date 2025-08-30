/*
Author: Barbolani, Bob-Murphy, Wurzel0701, Triada

Description:
    Handles the spawned state of locations, scheduling spawning,
    handling simulation state of garrisons, and marking for de-spawning
    (de-spawning handled in the spawning code).

Arguments: <nil>
Return Value: <nil>
Scope: Server
Environment: Scheduled
Public: No
Dependencies:
    Occupants, Invaders, teamPlayer, markersX, forcedSpawn, spawner,
    controlsX, airportsX, resourcesX, factories, outposts, seports,
    A3A_fnc_createAICities, A3A_fnc_createCIV, A3A_fnc_createAIcontrols,
    A3A_fnc_createAIAirbase, A3A_fnc_createAIresources, A3A_fnc_createAIOutposts,
    A3A_fnc_createFIAOutposts2, A3A_fnc_createSDKGarrisons

Example: [] spawn A3A_fnc_distance;
*/

/* -------------------------------------------------------------------------- */
/*                                   defines                                  */
/* -------------------------------------------------------------------------- */

#define ENABLED 0
#define DISABLED 1
#define DESPAWN 2

/* -------------------------------------------------------------------------- */
/*                                 procedures                                 */
/* -------------------------------------------------------------------------- */

private _processEnemyMarker = {
    switch (spawner getVariable _marker)
    do
    {
        case ENABLED:
        {
            // if somebody green is inside distanceSPWN
            // or somebody opfor is inside distanceSPWN2
            // PvP disabled: or somebody blufor is Player and is inside distanceSPWN2
            // or this marker is forced spawn than exit (marker still ENABLED)
            if (_rebels inAreaArray [_position, distanceSPWN, distanceSPWN] isNotEqualTo []
                || { _enemies inAreaArray [_position, distanceSPWN2, distanceSPWN2] isNotEqualTo []
                || { _marker in forcedSpawn } }) exitWith {};

            // DISABLE this marker
            spawner setVariable [_marker, DISABLED, true];
            ["pause", [_marker]] call A3A_fnc_garrisonOp;
        };

        case DISABLED:
        {
            // if somebody green is inside distanceSPWN
            // or somebody opfor is inside distanceSPWN2
            // or this marker is forced to spawn than ENABLE marker
            if (_rebels inAreaArray [_position, distanceSPWN, distanceSPWN] isNotEqualTo []
                || { _enemies inAreaArray [_position, distanceSPWN2, distanceSPWN2] isNotEqualTo []
                || { _marker in forcedSpawn } })
            then
            {
                // ENABLE this marker
                spawner setVariable [_marker, ENABLED, true];
                ["unpause", [_marker]] call A3A_fnc_garrisonOp;
            }
            else
            {
                // if somebody green is inside distanceSPWN1
                // or somebody opfor is inside distanceSPWN than exit (marker still DISABLED)
                if (_rebels inAreaArray [_position, distanceSPWN1, distanceSPWN1] isNotEqualTo []
                    || { _enemies inAreaArray [_position, distanceSPWN, distanceSPWN] isNotEqualTo [] })
                exitWith {};

                // DESPAWN this marker
                isNil { [_marker] call A3A_fnc_garrisonServer_despawn };
            };
        };

        case DESPAWN:
        {
            // if nobody green is inside distanceSPWN
            // and nobody opfor is inside distanceSPWN2
            // and marker is not forced to spawn than exit (marker still DESPAWN)
            if (_rebels inAreaArray [_position, distanceSPWN, distanceSPWN] isEqualTo []
                && { _enemies inAreaArray [_position, distanceSPWN2, distanceSPWN2] isEqualTo []
                && { !(_marker in forcedSpawn) } }) exitWith {};

            // ENABLE this marker
            isNil { [_marker] call A3A_fnc_garrisonServer_spawn };

            // Prevent other routines taking spawn places 
            if !(_marker in citiesX or _marker in controlsX) then {
                [_marker, 1] call A3A_fnc_addTimeForIdle;
            };
        };
    };
};


private _processFIAMarker = {
    switch (spawner getVariable _marker)
    do
    {
        case ENABLED:
        {
            // if somebody enemy is inside distanceSPWN
            // or somebody green is control unit and is inside distanceSPWN2
            // or marker is forced to spawn than exit (marker still ENABLED)
            if (_enemies inAreaArray [_position, distanceSPWN, distanceSPWN] isNotEqualTo []
                || { _players inAreaArray [_position, distanceSPWN2, distanceSPWN2] isNotEqualTo []
                || { _marker in forcedSpawn } }) exitWith {};

            // DISABLE marker
            spawner setVariable [_marker, DISABLED, true];
            ["pause", [_marker]] call A3A_fnc_garrisonOp;
        };

        case DISABLED:
        {
            // if somebody enemy is inside distanceSPWN
            // or somebody green is player and is inside distanceSPWN2
            // or marker is forced spawn than ENABLE marker
            if (_enemies inAreaArray [_position, distanceSPWN, distanceSPWN] isNotEqualTo []
                || { _players inAreaArray [_position, distanceSPWN2, distanceSPWN2] isNotEqualTo []
                || { _marker in forcedSpawn } })
            then
            {
                // ENABLE this marker
                spawner setVariable [_marker, ENABLED, true];
                ["unpause", [_marker]] call A3A_fnc_garrisonOp;
            }
            else
            {
                if (_marker == "Synd_HQ") exitWith {};      // Never despawn HQ

                // if enemy is inside distanceSPWN1
                // or player is inside distanceSPWN
                // then exit (marker still DISABLED)
                if (_enemies inAreaArray [_position, distanceSPWN1, distanceSPWN1] isNotEqualTo []
                    || { _players inAreaArray [_position, distanceSPWN, distanceSPWN] isNotEqualTo [] })
                exitWith {};

                // DESPAWN this marker
                isNil { [_marker] call A3A_fnc_garrisonServer_despawn };
            };
        };

        case DESPAWN:
        {
            // if no enemies inside distanceSPWN
            // and no players inside distanceSPWN2
            // and marker is not forced spawn then exit (marker still DESPAWN)
            if (_enemies inAreaArray [_position, distanceSPWN, distanceSPWN] isEqualTo []
                && { _players inAreaArray [_position, distanceSPWN2, distanceSPWN2] isEqualTo []
                && { !(_marker in forcedSpawn) } }) exitWith {};

            // ENABLE this marker
            isNil { [_marker] call A3A_fnc_garrisonServer_spawn };
        };
    };
};


private _processCityCivMarker = {

    // No garrison to disable, so use a despawn time threshold instead of inner/outer radii
    private _spawnKey = _marker + "_civ";
    private _timeKey = _spawnKey + "_time";

    switch (spawner getVariable _spawnKey)
    do
    {
        case ENABLED:
        {
            // if player is inside distanceSPWN, reset the timer
            if (_players inAreaArray [_position, distanceSPWN, distanceSPWN] isNotEqualTo []) exitWith 
            {
                spawner setVariable [_timeKey, time + 30, false];
            };
            if (spawner getVariable _timeKey > time) exitWith {};

            // DESPAWN marker
            isNil { [_spawnKey] call A3A_fnc_garrisonServer_despawn };
        };

        case DESPAWN:
        {
            // if no player is inside distanceSPWN, leave despawned
            if (_players inAreaArray [_position, distanceSPWN, distanceSPWN] isEqualTo []) exitWith {};

            // ENABLE this marker
            spawner setVariable [_timeKey, time + 30, false];
            isNil { [_spawnKey] call A3A_fnc_garrisonServer_spawn };

            if !(_marker in destroyedSites) then
            {
                [_marker] spawn A3A_tasks_fnc_selectCityTask;
                [[_marker], "A3A_fnc_createAmbientCiv"] call A3A_fnc_scheduler;
                [[_marker], "A3A_fnc_createAmbientCivTraffic"] call A3A_fnc_scheduler;
            };
        };
    };
};


/* -------------------------------------------------------------------------- */
/*                                    start                                   */
/* -------------------------------------------------------------------------- */

// Prepare spawner values for civ part of city spawning
{ spawner setVariable [_x + "_civ", 2] } forEach citiesX;

// Pre-spawn rebel HQ
isNil { ["Synd_HQ"] call A3A_fnc_garrisonServer_spawn };

// Wait until there's a rebel spawner before doing anything, mostly to prevent HQ being hidden on startup
waitUntil { sleep 0.1; units teamPlayer findIf { _x getVariable ["spawner", false] } > -1 };

// Special loop for quick re-enabling HQ
/*0 spawn {
    while {true} do {
        sleep 0.1;
        if (spawner getVariable "Synd_HQ" != 1) then { continue };

        private _realPlayers = (allPlayers - entities "HeadlessClient_F") apply { _x getVariable ["owner", _x] };
        if (_realPlayers inAreaArray [markerPos "Synd_HQ", 200, 200] isNotEqualTo []) then {
            spawner setVariable ["Synd_HQ", ENABLED, true];
            ["unpause", ["Synd_HQ"]] call A3A_fnc_garrisonOp;
        };
    };
};*/

/* ------------------------------ endless cycle ----------------------------- */

private _counter = 0;
private _hcs = [];
private _rebels = [];
private _occupants = [];
private _invaders = [];
private _players = [];
private _rebEnemies = [];

private ["_markers", "_marker", "_position"];

while { true }
do
{
    // Update enemies less often, not so obvious when it fucks up
    if (_counter <= 0) then {
        // Only count one spawner per vehicle. SimpleVM is much faster with split selects
        _occupants = units Occupants select { _x getVariable ["spawner", false] } select { _x == effectiveCommander vehicle _x };
        _invaders = units Invaders select { _x getVariable ["spawner", false] } select { _x == effectiveCommander vehicle _x };
        _rebEnemies = _invaders + _occupants;
        _hcs = entities "HeadlessClient_F";
        _counter = 5;
    };
    _counter = _counter - 1;

    // No effective-commander optimization for players because it breaks on disconnection
    // 0.05ms for 20 players, 20 HC, 20 garrison
    _rebels = units teamPlayer select { _x getVariable ["spawner", false] };
    // Exclude players in fast-moving fixed-wing aircraft
    _rebels = _rebels - (_rebels select { vehicle _x isKindOf "Plane" } select { speed vehicle _x > 80 and !isTouchingGround vehicle _x });
    // Add in rebel-controlled UAVs
    _rebels append (allUnitsUAV select { side group _x == teamPlayer });

    // Players array is used to spawn civilians in cities and rebel garrisons, so ignore airborne units and translate remote-control
    // 0.02ms for 20 players.
    private _realPlayers = (allPlayers - _hcs) apply { _x getVariable ["owner", _x] };
    private _airPlayers = _realPlayers select { vehicle _x isKindOf "Air" } select { speed vehicle _x > 50 };
    _players = _realPlayers - _airPlayers;

    private _markers = markersX + controlsX + outpostsFIA;
    {
        sleep (1 / count _markers);     // there are hundreds, so 1/frame basically?

        private _marker = _x;
        private _position = markerPos (_marker);
        private _side = sidesX getVariable _marker;

        if (_side == teamPlayer) then {
            private _enemies = _rebEnemies;
            call _processFIAMarker;
        } else {
            private _enemies = [_occupants, _invaders] select (_side == Occupants);
            call _processEnemyMarker;
        };

        if (_marker in citiesX) then { call _processCityCivMarker };

    } forEach _markers;
};
