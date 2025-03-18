params ["_markerX"];

private _positionX = getMarkerPos _markerX;
private _size = [_markerX] call A3A_fnc_sizeMarker;

private _buildings = _positionX nearObjects ["house",_size];

{
    private _hitpoints = getAllHitPointsDamage _x;
    if (_hitpoints isEqualTo []) then { continue };
    if (random 100 < 30) then { continue };
    private _building = _x;
    {
        _building setHit [_x, 1];
    } forEach (_hitpoints # 1 select { _x find "dam" == 0 });
} forEach _buildings;

[_markerX,false] spawn A3A_fnc_blackout;