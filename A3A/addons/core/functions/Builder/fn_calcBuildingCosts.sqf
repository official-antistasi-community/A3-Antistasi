params ["_marker"];
if (isNil "A3A_buildingPriceHM") then {call A3A_fnc_initBuildableObjects}; // needs these vars on server
private _garrison = A3A_garrison get _marker;
private _buildings = _garrison getOrDefault ["buildings", []];
private _total = 0;
{
    private _type = _x#0;
    private _price = A3A_buildingPriceHM getOrDefault [_type, 0];
    if (_price isEqualTo 0) exitWith {};
    _total = _total + _price;
} forEach _buildings;
_total;