params ["_veh", "_mode", "_data"];

switch (_mode) do {
    case ("rearm"): {
        _data params ["_name", "_turretPath", "_fullBoxes", "_partialMagSize"];
        _veh removeMagazinesTurret [_name, _turretPath];
        _veh addMagazinesTurret [_name, _turretPath, _fullBoxes];
        _veh addMagazineTurret [_name, _turretPath, _partialMagSize];
    };
    case ("pylon"): {
        _data params ["_pylonIndex", "_turretPath", "_magName", ["_rounds", -1]];
        if (_rounds isEqualTo -1) then {
            _veh setPylonLoadout [_pylonIndex, "", true, _turretPath];
        } else {
            _veh setPylonLoadout [_pylonIndex, _magName, true, _turretPath];
            _veh setAmmoOnPylon [_pylonIndex, _rounds];
        };
    };
};