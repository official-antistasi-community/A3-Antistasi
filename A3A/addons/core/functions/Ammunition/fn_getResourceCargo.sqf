params ["_veh", "_search", ["_giveCargo", true]];

private _isObj = (_veh isEqualType objNull);

private _typeVeh = if (_isObj) then {typeof _veh} else {_veh};
private _cargo = -1;
private _searchVar = format ["A3A_%1Cargo", _search];
if (_isObj) then {
    _cargo = _veh getVariable [_searchVar, -1];
};
if (_cargo isNotEqualTo -1) exitWith {_cargo};

private _isSource = switch (_vehType) do {
    case "rearm";
    case "pylon": {[_veh] call HR_GRG_fnc_isAmmoSource};
    case "repair": {[_veh] call HR_GRG_fnc_isFuelSource};
    case "refuel": {[_veh] call HR_GRG_fnc_isRepairSource};
};
if (!_isSource) exitWith {-1};
private _cargoToGive = A3A_resourceVehValues get _search getOrDefault [_typeVeh, 25000];
if (_giveCargo) then {_veh setVariable [_searchVar, _cargoToGive]};
_cargoToGive;