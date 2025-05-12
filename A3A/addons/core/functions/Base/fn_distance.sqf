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

// the spawn units array will update ones at this count cycles
#define COUNT_CYCLES 5
#define ENABLED 0
#define DISABLED 1
#define DESPAWN 2

/* -------------------------------------------------------------------------- */
/*                                 procedures                                 */
/* -------------------------------------------------------------------------- */

private _processOccupantMarker = {

    switch (spawner getVariable _marker)
    do
    {
        case ENABLED:
        {
            // if somebody green is inside distanceSPWN
            // or somebody opfor is inside distanceSPWN2
            // PvP disabled: or somebody blufor is Player and is inside distanceSPWN2
            // or this marker is forced spawn than exit (marker still ENABLED)
            if (_teamplayer inAreaArray [_position, distanceSPWN, distanceSPWN] isNotEqualTo []
                || { _invaders inAreaArray [_position, distanceSPWN2, distanceSPWN2] isNotEqualTo []
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
            if (_teamplayer inAreaArray [_position, distanceSPWN, distanceSPWN] isNotEqualTo []
                || { _invaders inAreaArray [_position, distanceSPWN2, distanceSPWN2] isNotEqualTo []
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
                if (_teamplayer inAreaArray [_position, distanceSPWN1, distanceSPWN1] isNotEqualTo []
                    || { _invaders inAreaArray [_position, distanceSPWN, distanceSPWN] isNotEqualTo [] })
                exitWith {};

                // DESPAWN this marker
                spawner setVariable [_marker, DESPAWN, true];
                ["despawn", [_marker]] call A3A_fnc_garrisonOp;
            };
        };

        case DESPAWN:
        {
            // if nobody green is inside distanceSPWN
            // and nobody opfor is inside distanceSPWN2
            // and marker is not forced to spawn than exit (marker still DESPAWN)
            if (_teamplayer inAreaArray [_position, distanceSPWN, distanceSPWN] isEqualTo []
                && { _invaders inAreaArray [_position, distanceSPWN2, distanceSPWN2] isEqualTo []
                && { !(_marker in forcedSpawn) } }) exitWith {};

            // ENABLE this marker
            spawner setVariable [_marker, ENABLED, true];
            ["spawn", [_marker, A3A_garrison get _marker]] call A3A_fnc_garrisonOp;

            // Prevent other routines taking spawn places 
            if !(_marker in citiesX or _marker in controlsX) then {
                [_marker, 1] call A3A_fnc_addTimeForIdle;
            };
        };
    };
};

private _processFIAMarker = {

    private _enemies = _occupants + _invaders;
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
                // if enemy is inside distanceSPWN1
                // or player is inside distanceSPWN
                // then exit (marker still DISABLED)
                if (_enemies inAreaArray [_position, distanceSPWN1, distanceSPWN1] isNotEqualTo []
                    || { _players inAreaArray [_position, distanceSPWN, distanceSPWN] isNotEqualTo [] })
                exitWith {};

                // DESPAWN this marker
                spawner setVariable [_marker, DESPAWN, true];
                ["despawn", [_marker]] call A3A_fnc_garrisonOp;
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
            spawner setVariable [_marker, ENABLED, true];
            ["spawn", [_marker, A3A_garrison get _marker]] call A3A_fnc_garrisonOp;
        };
    };
};

private _processInvaderMarker = {

    switch (spawner getVariable _marker)
    do
    {
        case ENABLED:
        {
            // if somebody green is inside distanceSPWN
            // or somebody blufor is inside distanceSPWN2
            // or marker is forced spawn then exit (marker still ENABLED)
            if (_teamplayer inAreaArray [_position, distanceSPWN, distanceSPWN] isNotEqualTo []
                || { _occupants inAreaArray [_position, distanceSPWN2, distanceSPWN2] isNotEqualTo []
                || { _marker in forcedSpawn } }) exitWith {};

            // DISABLE this marker
            spawner setVariable [_marker, DISABLED, true];
            ["pause", [_marker]] call A3A_fnc_garrisonOp;
        };

        case DISABLED:
        {
            // if somebody green is inside distanceSPWN
            // or somebody bluefor is inside distanceSPWN2
            // or marker is forced spawn then ENABLED this marker
            if (_teamplayer inAreaArray [_position, distanceSPWN, distanceSPWN] isNotEqualTo []
                || { _occupants inAreaArray [_position, distanceSPWN2, distanceSPWN2] isNotEqualTo []
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
                // or somebody bluefor is inside distanceSPWN then exit (marker still DISABLED)
                if (_teamplayer inAreaArray [_position, distanceSPWN1, distanceSPWN1] isNotEqualTo []
                    || { _occupants inAreaArray [_position, distanceSPWN, distanceSPWN] isNotEqualTo [] })
                exitWith {};

                // DESPAWN this marker
                spawner setVariable [_marker, DESPAWN, true];
                ["despawn", [_marker]] call A3A_fnc_garrisonOp;
            };
        };

        case DESPAWN:
        {
            // if nobody is inside distanceSPWN
            // and nobody is inside distanceSPWN2
            // and marker is not forced to spawn then exit (marker still DESPAWN)
            if (_teamplayer inAreaArray [_position, distanceSPWN, distanceSPWN] isEqualTo []
                && { _occupants inAreaArray [_position, distanceSPWN2, distanceSPWN2] isEqualTo []
                && { !(_marker in forcedSpawn) } }) exitWith {};

            // ENABLE this marker
            spawner setVariable [_marker, ENABLED, true];
            ["spawn", [_marker, A3A_garrison get _marker]] call A3A_fnc_garrisonOp;

            // Prevent other routines taking spawn places 
            if !(_marker in citiesX or _marker in controlsX) then {
                [_marker, 1] call A3A_fnc_addTimeForIdle;
            };
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
            spawner setVariable [_spawnKey, DESPAWN, true];
        };

        case DESPAWN:
        {
            // if no player is inside distanceSPWN, leave despawned
            if (_players inAreaArray [_position, distanceSPWN, distanceSPWN] isEqualTo []) exitWith {};

            // ENABLED this marker
            spawner setVariable [_spawnKey, ENABLED, true];
            spawner setVariable [_timeKey, time + 30, false];

            if !(_marker in destroyedSites) then
            {
                [[_marker], "A3A_fnc_createAmbientCiv"] call A3A_fnc_scheduler;
                [[_marker], "A3A_fnc_createAmbientCivTraffic"] call A3A_fnc_scheduler;
            };
        };
    };
};


/* -------------------------------------------------------------------------- */
/*                                    start                                   */
/* -------------------------------------------------------------------------- */

if !(isServer) exitwith {};

waitUntil { sleep 0.1; if !(isnil "theBoss") exitWith { true }; false };

// Prepare spawner values for civ part of city spawning
{ spawner setVariable [_x + "_civ", 2] } forEach citiesX;

/* ------------------------------ endless cycle ----------------------------- */

private _time = 1 / count (markersX);
private _counter = 0;
private _teamplayer = [];
private _occupants = [];
private _invaders = [];
private _players = [];

private ["_markers", "_marker", "_position"];

while { true }
do
{
    _counter = _counter + 1;

    if (_counter > COUNT_CYCLES)
    then
    {
        _counter = 0;

        // Only count one spawner per vehicle. SimpleVM is much faster with split selects
        _occupants = units Occupants select { _x getVariable ["spawner", false] } select { _x == effectiveCommander vehicle _x };
        _invaders = units Invaders select { _x getVariable ["spawner", false] } select { _x == effectiveCommander vehicle _x };

        // No effective-commander optimization for players because it breaks on disconnection
        _teamplayer = units teamPlayer select { _x getVariable ["spawner", false] };
        // Exclude players in fast-moving fixed-wing aircraft
        _teamplayer = _teamplayer select {
            private _veh = vehicle _x;
            !(_veh isKindOf "Plane") or {isTouchingGround _veh or speed _veh < 80}
        };
        // Add in rebel-controlled UAVs
        _teamplayer append (allUnitsUAV select { side group _x == teamPlayer });

        // Players array is used to spawn civilians in cities and rebel garrisons, so ignore airborne units and translate remote-control
        _players = [];
        {
            private _rp = _x getVariable ["owner", _x];         // real player unit in remote-control case
            private _veh = vehicle _rp;
            if (!(_veh isKindOf "Air") or { speed _veh < 50 }) then { _players pushBack _rp };
        } forEach (allPlayers - entities "HeadlessClient_F");
    };

    {
        sleep _time;

        _marker = _x;
        _position = getmarkerPos (_marker);

        switch (sidesX getVariable [_marker, sideUnknown])
        do
        {
            case Occupants: _processOccupantMarker;
            case Invaders: _processInvaderMarker;
            case teamPlayer: _processFIAMarker;
        };

        if (_marker in citiesX) then { call _processCityCivMarker };

    } forEach markersX;
};
