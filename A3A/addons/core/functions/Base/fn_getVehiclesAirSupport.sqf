/*
Maintainer: John Jordan
    Returns a weighted air support vehicle pool based on war level and side
    Includes both classnames (attack helis) and support types (just "CAS" atm)

Arguments:
    <SIDE> The side for which the vehicle pool should be generated (occupants or invaders)
    <INTEGER> 1-10 range, war-level based vehicle quality

Return value:
    <ARRAY> [vehType, weight, vehType2, weight2, ...]
*/
params ["_side", "_level", ["_heliOnly", false]];
_level = (_level max 1 min 10) - 1;
private _faction = [A3A_faction_occ, A3A_faction_inv] select (_side == Invaders);

private _fnc_addArrayToWeights = {
    params ["_vehArray", "_baseWeight"];
    { _vehWeights append [_x, _baseWeight / count _vehArray] } forEach _vehArray;
};

private _vehWeights = [];

private _lightAHWeight =   [70, 65, 60, 55, 50, 45, 40, 35, 30, 25] select _level;
private _AHWeight =        [ 5, 10, 15, 20, 25, 30, 35, 40, 45, 50] select _level;
private _casWeight =       [ 2,  4,  6,  8, 10, 12, 14, 16, 18, 20] select _level;

// eventually add dive bombers?

if (_faction get "vehiclesHelisLightAttack" isEqualTo []) then { _AHWeight = _AHWeight + _lightAHWeight };
if (_faction get "vehiclesHelisAttack" isEqualTo []) then { _casWeight = _casWeight + _AHWeight };
if (_faction get "vehiclesPlanesCAS" isEqualTo []) then { _AHWeight = _AHWeight + _casWeight };


[_faction get "vehiclesHelisAttack", _AHWeight] call _fnc_addArrayToWeights;
[_faction get "vehiclesHelisLightAttack", _lightAHWeight] call _fnc_addArrayToWeights;
if (_heliOnly) exitWith { _vehWeights };

if (_faction get "vehiclesPlanesCAS" isNotEqualTo []) then { _vehWeights append ["CAS", _casWeight] };
_vehWeights;
