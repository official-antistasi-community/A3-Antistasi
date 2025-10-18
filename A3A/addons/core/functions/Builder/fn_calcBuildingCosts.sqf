params ["_marker"];
private _garrison = A3A_garrison get _marker;
private _buildings = _garrison getOrDefault ["buildings", []];
private _total = 0;
{
    private _type = _x#0;
    private _price = A3A_buildingPriceHM getOrDefault [_type, 0];
    _total = _total + _price;
} forEach _buildings;
_total;