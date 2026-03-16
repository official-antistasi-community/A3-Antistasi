params ["_veh", "_search", ["_giveCargo", true]];

private _isObj = (_veh isEqualType objNull);

private _typeVeh = if (_isObj) then {typeof _veh} else {_veh};
private _vehCfg = (configFile >> "CfgVehicles" >> _typeVeh);
private _cargo = -1;
private _searchVar = format ["A3A_%1Cargo", _search];
if (_isObj) then {
    _cargo = _veh getVariable [_searchVar, -1];
};
if (_cargo isNotEqualTo -1) exitWith {_cargo};

private _isSource = switch (_search) do {
    case "rearm";
    case "pylon": {
        if (getNumber (_vehCfg/"transportAmmo") > 0) exitWith {true};
        if (getNumber (_vehCfg/"ace_rearm_defaultSupply") > 0) exitWith {true};
        false
    };
    case "repair": {
        if (getNumber (_vehCfg/"transportFuel") > 0) exitWith {true};
        if (getNumber (_vehCfg/"ace_refuel_fuelCargo") > 0) exitWith {true};
        false
    };
    case "refuel": {
        if (getNumber (_vehCfg/"transportRepair") > 0) exitWith {true};
        if (getNumber (_vehCfg/"ace_repair_canRepair") > 0) exitWith {true};
        false;
    };
};
if (!_isSource) exitWith {-1};
private _cargoToGive = A3A_resourceVehValues get _search getOrDefault [_typeVeh, 5000];
if (_giveCargo) then {_veh setVariable [_searchVar, _cargoToGive, true]};
_cargoToGive;