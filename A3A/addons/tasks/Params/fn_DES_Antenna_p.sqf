#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

private _nearAntennas = A3A_antennas select {alive _x} inAreaArray ["Synd_HQ", distanceMission, distanceMission];
private _possible = [];
{
    private _nearbyMarker = A3A_antennaMap get netId _x;
    if (sidesX getVariable _nearbyMarker == teamPlayer) then {continue};
    _possible pushBack _x;
} forEach _nearAntennas;

if (_possible isEqualTo []) exitWith {false};
[1, [selectRandom _possible]];
