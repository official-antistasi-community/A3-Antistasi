// Note: distanceForLandAttack+1500 is same distance as findLandSupportMarkers uses, so setting higher won't matter

params ["_mrkDest", "_possibleBases", ["_maxDistance", distanceForLandAttack+1500]];

private _side = sidesX getVariable [_mrkDest, teamPlayer];
if (_side == teamPlayer) then { _side = Occupants };            // Might be called with rebel town as input
private _suppMarkers = [_mrkDest, false] call A3A_fnc_findLandSupportMarkers;
private _bases = [];
{
    _x params ["_base", "_dist"];
    if (_dist < 1500 or _dist > _maxDistance) then {continue};
    if (sidesX getVariable _base != _side) then {continue};

    // Base validity checks
    if (spawner getVariable _base == 0) then {continue};
    if (dateToNumber date < server getVariable _base) then {continue}; 				// garrison not busy
    if (A3A_garrison get _base get "troops" select 0 < 16) then {continue};	            // sufficient garrison
    if ({_x == _mrkDest} count (killZones getVariable [_base,[]]) >= 3) then {continue};

    _bases pushBack _base;

} forEach _suppMarkers;

if (count _bases == 0) exitWith {""};
selectRandom _bases;
