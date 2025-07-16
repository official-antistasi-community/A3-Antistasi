/*
Maintainer: John Jordan
    Returns a weighted ground transport vehicle pool based on war level and side

Arguments:
    <SIDE> The side for which the vehicle pool should be generated (occupants or invaders)
    <INTEGER> 1-10 range, war-level based vehicle quality

Return value:
    <ARRAY> [vehType, weight, vehType2, weight2, ...]
*/
params ["_side", "_level"];
_level = (_level max 1 min 10) - 1;
private _faction = [A3A_faction_occ, A3A_faction_inv] select (_side == Invaders);

private _fnc_addArrayToWeights = {
    params ["_vehArray", "_baseWeight"];
    { _vehWeights append [_x, _baseWeight / count _vehArray] } forEach _vehArray;
};

private _vehWeights = [];

private _policeWeight =    [ 50, 20,  0,  0,  0,  0,  0,  0,  0,  0] select _level;
private _milCarWeight =    [ 50, 50, 30, 10,  5,  0,  0,  0,  0,  0] select _level;
private _milTruckWeight =  [100, 80, 60, 35, 15,  0,  0,  0,  0,  0] select _level;
private _carWeight =       [  0,  5, 10, 10, 10, 10,  5,  5,  5,  5] select _level;
private _armedCarWeight =  [ 20, 25, 30, 30, 30, 25, 20, 20, 15, 15] select _level;
private _truckWeight =     [  0,  5, 10, 20, 25, 25, 20, 15, 10,  5] select _level;
private _lapcWeight =      [ 30, 40, 50, 50, 45, 40, 35, 30, 25, 20] select _level;
private _apcWeight =       [  0, 10, 15, 20, 25, 30, 35, 40, 40, 40] select _level;
private _ifvWeight =       [  0,  0,  2,  4,  6,  8, 12, 16, 20, 25] select _level;

if (_faction getOrDefault ["attributeMoreTrucks", false]) then {
    _milTruckWeight =      [100, 80, 60, 35, 15,  0,  0,  0,  0,  0] select _level;
    _truckWeight =         [ 10, 20, 30, 45, 55, 60, 55, 50, 45, 40] select _level;
    _lapcWeight =          [ 10, 15, 20, 20, 20, 20, 20, 20, 20, 20] select _level;
    _apcWeight =           [  0,  4,  8, 12, 16, 20, 20, 20, 20, 20] select _level;
    _ifvWeight =           [  0,  0,  2,  4,  6,  8, 12, 16, 20, 25] select _level;
};

if (_faction get "vehiclesLightAPCs" isEqualTo []) then { _apcWeight = _apcWeight + _lapcWeight/2; _truckWeight = _truckWeight + _lapcWeight/2; };
if (_faction get "vehiclesIFVs" isEqualTo []) then { _apcWeight = _apcWeight + _ifvWeight };
if (_faction get "vehiclesAPCs" isEqualTo []) then {
    if (_faction get "vehiclesLightAPCs" isEqualTo []) exitWith { _ifvWeight = _ifvWeight + _apcWeight };
    _lapcWeight = _lapcWeight + _apcWeight;
};

// only occupants use militia vehicle types?
if (_side == Occupants) then
{
    [_faction get "vehiclesPolice", _policeWeight] call _fnc_addArrayToWeights;
    [_faction get "vehiclesMilitiaCars", _milCarWeight] call _fnc_addArrayToWeights;
    [_faction get "vehiclesMilitiaTrucks", _milTruckWeight] call _fnc_addArrayToWeights;
};
[_faction get "vehiclesLightUnarmed", _carWeight] call _fnc_addArrayToWeights;
[_faction get "vehiclesLightArmedTroop", _armedCarWeight] call _fnc_addArrayToWeights;
[_faction get "vehiclesTrucks", _truckWeight] call _fnc_addArrayToWeights;
[_faction get "vehiclesLightAPCs", _lapcWeight] call _fnc_addArrayToWeights;
[_faction get "vehiclesAPCs", _apcWeight] call _fnc_addArrayToWeights;
[_faction get "vehiclesIFVs", _ifvWeight] call _fnc_addArrayToWeights;

_vehWeights;
