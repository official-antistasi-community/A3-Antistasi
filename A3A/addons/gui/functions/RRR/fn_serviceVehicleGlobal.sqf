params ["_veh", "_mode", "_data"];
_data params ["_pylonIndex", "_turret", "_mag", "_ammo"];

if (_mode isEqualTo "pylon") then {
    _veh setPylonLoadout [_pylonIndex, _mag, true, _turret];
    if (local _veh) then {
        _veh setAmmoOnPylon [_pylonIndex, _ammo];
    };
} else {
    if (_veh turretLocal _turret) then {
        // variables are misnamed here
        _veh removeMagazinesTurret [_pylonIndex, _turret];
        _veh addMagazinesTurret [_pylonIndex, _turret, _mag];
        _veh addMagazineTurret [_pylonIndex, _turret, _mag];
    };
};

