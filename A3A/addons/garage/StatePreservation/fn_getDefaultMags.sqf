/*
    Author: [John Jordan]
    Description:
        Returns cached array of default non-pylon magazines for a vehicle

    Arguments:
    0. <String> Vehicle classname

    Return Value:
    <Array>
        <Struct> [
            <String> Magazine classname
            <Array> Turret path ([-1] for driver)
            <Number> Number of bullets in magazine
        ]
    ]

    Scope: Any
    Environment: Any
    Public: Yes
    Dependencies: HR_GRG_defaultMags, created by initServer at postInit

    Example: [typeof cursorObject] call HR_GRG_fnc_getDefaultMags;

    License: APL-ND
*/

params ["_vehClass"];

if (_vehClass in HR_GRG_defaultMags) exitWith { HR_GRG_defaultMags get _vehClass };

private _driverMags = getArray (configFile >> "CfgVehicles" >> _vehClass >> "magazines");
private _output = _driverMags apply { [_x, [-1]] };

private _turrets = _vehClass call BIS_fnc_allTurrets;         // need to use config because setVehicleAmmo deletes mags
{
    private _path = _x;
    private _mags = getArray ([_vehClass, _path] call BIS_fnc_turretConfig >> "magazines");
    _output append (_mags apply { [_x, _path] });
} forEach _turrets;

{
    _x pushBack getNumber (configFile >> "CfgMagazines" >> _x#0 >> "count");
} forEach _output;

HR_GRG_defaultMags set [_vehClass, _output];
_output;
