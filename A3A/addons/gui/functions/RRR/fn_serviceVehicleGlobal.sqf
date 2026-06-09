params ["_veh", "_mode", "_data"];

if (_mode isEqualTo "pylon") then {
    _data params ["_pylonIndex", "_turret", "_mag", ["_ammo", -1]];
    if (_ammo isEqualTo -1) then {
        _veh setPylonLoadout [_pylonIndex, "", true, _turret];
    } else {
        _veh setPylonLoadout [_pylonIndex, _mag, true, _turret];
        if (local _veh) then {
            _veh setAmmoOnPylon [_pylonIndex, _ammo];
        };
    };
} else {
    _data params ["_magName", "_turret", "_fullBoxes", "_partialSize"];
    if (_veh turretLocal _turret) then {
        _veh removeMagazinesTurret [_magName, _turret];
        _veh addMagazinesTurret [_magName, _turret, _fullBoxes];
        _veh addMagazineTurret [_magName, _turret, _partialSize];
    };
};

