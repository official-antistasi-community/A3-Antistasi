#define JAM_RADIUS 1000
#define JAM_STRENGTH 49

private _sideX = side group player;

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

    private _liveAntennas = A3A_antennas select { alive _x };
    private _jammers = _liveAntennas inAreaArray [getPosATL player, JAM_RADIUS, JAM_RADIUS];
    _jammers = _jammers select { sidesX getVariable (A3A_antennaMap get netId _x) != _sideX };

    // Get rebel antennas count
    private _antReb = _liveAntennas select { sidesX getVariable (A3A_antennaMap get netId _x) == _sideX };
    
    // Multiply antenna count by coefficient
    private _sendMult = 1 + 0.1 * count _antreb;

    // No live enemy antennas within range 
    if (_jammers isEqualTo []) then {
        [1 / _sendMult, _sendMult] call _fnc_setInterference;    
        continue;
    };

    private _jammer = [_jammers, player] call BIS_fnc_nearestPosition;
    private _dist = player distance _jammer;

    // Receiving interference >1 has effect, sending interference <1 has effect
    private _interference = 1 / _sendMult + JAM_STRENGTH * (1 - _dist/JAM_RADIUS);
    [_interference, 1/_interference] call _fnc_setInterference;
};
