params ["_marker"];
private _garrison = A3A_garrison get _marker;
private _buildings = _garrison getOrDefault ["buildings", []];
private _total = 0;
{
    private _type = _x#0;
    private _index = A3A_buildableObjects findIf {_x#0 == _type};
    if (_index == -1) exitWith {};
    private _price = (A3A_buildableObjects#_index)#1;
    _total = _total + _price;
} forEach _buildings;
_total;