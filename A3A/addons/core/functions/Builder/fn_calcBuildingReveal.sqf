#define MAX_COST 2500

private _cost = ["Synd_HQ"] call A3A_fnc_calcBuildingCosts;
private _reveal = 500 + ((_cost min MAX_COST)/5);
A3A_HQDetectionRadius = _reveal;