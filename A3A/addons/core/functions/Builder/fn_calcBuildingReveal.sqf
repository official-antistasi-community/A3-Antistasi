private _cost = ["Synd_HQ"] call A3A_fnc_calcBuildingCosts;
private _reveal = 500 + (_cost/5);
A3A_HQDetectionRadius = _reveal;