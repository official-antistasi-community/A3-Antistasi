params ["_veh", "_list"];
private _magInfo = getAllPylonsInfo _veh;
{
    _x params ["_weapon", "_turretPath"];
    private _possibleMags = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines");
    private _foundMagIndex = _magInfo findIf {
        (_x#3) in _possibleMags && ((_x#2) isEqualTo _turretPath)
    };
    if (_foundMagIndex isNotEqualTo -1) then {continue};
    private _turretOwner = _veh turretOwner _turretPath;
    [_veh, _x] remoteExec ["removeWeaponTurret", _turretOwner];
} forEach _list;
