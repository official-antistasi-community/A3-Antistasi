/*  Find minimum and maximum ranges for artillery type

Environment: Any

Arguments:
    <STRING> Classname of artillery vehicle
    <STRING> Classname of artillery magazine

Return array:
    <SCALAR> Minimum range in metres
    <SCALAR> Maximum range in metres

Examples:
    ["UK3CB_ADA_I_BM21", "rhs_mag_m21of_1"] call A3A_fnc_getArtilleryRanges;
    ["O_MBT_02_arty_F", "32Rnd_155mm_Mo_shells_O"] call A3A_fnc_getArtilleryRanges;
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_vehType", "_shellType"];

private _hmkey = _vehType + "_" + _shellType;
if (isNil "A3A_artyRangeHM") then { A3A_artyRangeHM = createHashMap };
if (_hmkey in A3A_artyRangeHM) exitWith { A3A_artyRangeHM get _hmkey };

private _turretCfg = call {
    private _allTurrets = configProperties [configFile >> "CfgVehicles" >> _vehType >> "Turrets"];
    private _idx = _allTurrets findIf { getNumber (_x >> "elevationMode") != 0 };       // no idea if this is a valid check
    if (_idx == -1) exitWith {
        Error_1("Artillery turret not found on %1", _vehType);
        configFile >> "CfgVehicles" >> _vehType >> "Turrets" >> "MainTurret";
    };
    _allTurrets # _idx;
};

// Try mags for pylon weapons, otherwise assume the turret weapon is valid
private _weapon = getText (configfile >> "CfgMagazines" >> _shellType >> "pylonWeapon");
if (_weapon == "") then { _weapon = getArray (_turretCfg >> "Weapons") # 0 };
private _weaponCfg = configFile >> "CfgWeapons" >> _weapon;

// Assume that there's no speed override on weapon, probably true for arty
private _initSpeed = getNumber (configFile >> "CfgMagazines" >> _shellType >> "initSpeed");

// Find min and max charges
private _minCharge = 1;
private _maxCharge = 0;
{
    private _modeCfg = if (_x == "this") then { _weaponCfg } else { _weaponCfg >> _x };
    private _charge = getNumber (_modeCfg >> "artilleryCharge");
    if (_charge == 0) then { continue };
    _minCharge = _charge min _minCharge;
    _maxCharge = _charge max _maxCharge;
} forEach getArray (_weaponCfg >> "modes");

if (_maxCharge == 0) then { Error_1("Artillery charge lookup failed for %1", _vehType); _minCharge = 1; _maxCharge = 1; };

// Now for the horror. There should be a saner way to do this but I couldn't find one.
private _baseElev = 45;
isNil {
    private _veh = createVehicleLocal [_vehType, [0,0,-1000], [], 0, "NONE"];
    _veh enableSimulation false;
    private _gunBeg = _veh selectionPosition getText (_turretCfg >> "gunBeg");
    private _gunEnd = _veh selectionPosition getText (_turretCfg >> "gunEnd");
    // Arma bug? should be translated to world space (slightly different for LIB_M2_60) but isn't.
    private _gunDir = _gunEnd vectorFromTo _gunBeg;
    _baseElev = asin (_gunDir#2) - getNumber (_turretCfg >> "initElev");
    deleteVehicle _veh;
};

// Artillery engine doesn't seem to consider minElev as a short-range option
private _maxElev = _baseElev + getNumber (_turretCfg >> "maxElev");
private _minElev = _baseElev + getNumber (_turretCfg >> "minElev");
private _longElev = [45, _minElev] select (_minElev > 45);

// Simple formula works because Arma doesn't calculate air resistance for artillery
private _maxRange = (_initSpeed * _maxCharge)^2 * sin (2*_longElev) / 9.807;
private _minRange = (_initSpeed * _minCharge)^2 * sin (2*_maxElev) / 9.807;

//private _reloadTime = getNumber (_weaponCfg >> "reloadTime");

private _result = [200 max (_minRange + 100), _maxRange - 100];          // make sure we can spread shots
A3A_artyRangeHM set [_hmkey, _result];
_result;
