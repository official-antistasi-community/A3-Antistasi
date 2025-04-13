#define JAM_RADIUS 1000
#define JAM_STRENGTH 49

// Pre-generate antenna -> base mappings to save scanning
private _sideX = side group player;
private _bases = outposts + airportsx + seaports;
private _antennaBases = createHashMap;
{
    private _base = [_bases, _x] call BIS_fnc_nearestPosition;
    _antennaBases set [netId _x, _base];
} forEach (antennas + antennasDead);

private _fnc_setInterference = {
    params ["_recInterference", "_sendInterference"];
    player setVariable ["tf_receivingDistanceMultiplicator", _recInterference];
    player setVariable ["tf_sendingDistanceMultiplicator", _sendInterference];

    if(A3A_hasACRE) then 
    {
        if(_recInterference == 1 && _sendInterference == 1) exitWith
        {
            [{}] call acre_api_fnc_setCustomSignalFunc;
        };

        [{
            private _coreSignal = _this call acre_sys_signal_fnc_getSignalCore;
            _coreSignal params ["_Px", "_maxSignal"];
            private _sendInterference = player getVariable ["tf_sendingDistanceMultiplicator", 1];

            [_Px * _sendInterference, _maxSignal]

        }] call acre_api_fnc_setCustomSignalFunc;
    }
};

while {true} do
{
    sleep 10;

    private _jammers = antennas inAreaArray [getPosATL player, JAM_RADIUS, JAM_RADIUS];
    _jammers = _jammers select { sidesX getVariable (_antennaBases get netId _x) != _sideX };

    // Get rebel antennas count
    private _antReb = {(sidesX getVariable [
        ([markersX, getPos _x] call BIS_fnc_nearestPosition),sideUnknown] == teamPlayer) and 
        !(_x in antennasDead)
    } count antennas;

    // No live enemy antennas within range 
    if (_jammers isEqualTo []) then {
        [1 / (1 + 0.1 * _antreb), 1 + 0.1 * _antreb] call _fnc_setInterference;    
        continue;
    };

    private _jammer = [_jammers, player] call BIS_fnc_nearestPosition;
    private _dist = player distance _jammer;

    // Receiving interference >1 has effect, sending interference <1 has effect
    private _interference = (1 / (1 + 0.1 * _antreb)) + JAM_STRENGTH * (1 - _dist/JAM_RADIUS);
    [_interference, 1/_interference] call _fnc_setInterference;
};
