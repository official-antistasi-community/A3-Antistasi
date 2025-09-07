/*  Autodetect HE, smoke and flare shells for mortar
    Doesn't work for weird arty (yet)

Environment: Any

Arguments:
    <STRING> Classname of mortar vehicle

Returns:
    <HASHMAP> keys ["HE", "Smoke", "Flare"], values magazine classes

Examples:
    ["B_Mortar_01_F"] call A3A_fnc_getMortarMags;
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_vehType"];

if (isNil "A3A_artyMagHM") then { A3A_artyMagHM = createHashMap };
if (_vehType in A3A_artyMagHM) exitWith { A3A_artyMagHM get _vehType };


private _turretCfg = call {
    private _allTurrets = configProperties [configFile >> "CfgVehicles" >> _vehType >> "Turrets"];
    private _idx = _allTurrets findIf { getNumber (_x >> "elevationMode") != 0 };       // no idea if this is a valid check
    if (_idx == -1) exitWith {
        Error_1("Artillery turret not found on %1", _vehType);
        configFile >> "CfgVehicles" >> _vehType >> "Turrets" >> "MainTurret";
    };
    _allTurrets # _idx;
};

// Can't do pylon weapons with this?
//private _weapon = getText (configfile >> "CfgMagazines" >> _shellType >> "pylonWeapon");

private _weapon = getArray (_turretCfg >> "Weapons") # 0;
private _weaponCfg = configFile >> "CfgWeapons" >> _weapon;

// Ok have the weapon now, so grind through the mags...
private _simTrans = createHashMapFromArray [["shotshell", "HE"], ["shotilluminating", "Flare"], ["shotsmoke", "Smoke"]];
private _output = createHashMap;

private _magazines = getArray (_weaponCfg >> "magazines");
{
    private _ammo = getText (configFile >> "CfgMagazines" >> _x >> "ammo");
    private _ammoCfg = configFile >> "CfgAmmo" >> _ammo;

	private _subAmmoType = getText (_ammoCfg >> "submunitionAmmo");
	if (isArray (_ammoCfg >> "submunitionAmmo")) then { _subAmmoType = getArray (_ammoCfg >> "submunitionAmmo") # 0 };
	if (_subAmmoType != "") then {
		_ammo = _subAmmoType;
		_ammoCfg = configFile >> "CfgAmmo" >> _ammo;
	};
		
	private _sim = tolower getText (_ammoCfg >> "simulation");
    if !(_sim in _simTrans) then { continue };
    private _type = _simTrans get _sim;
    if (_type in _output) then { continue };        // Use the first valid one

	_output set [_type, _x];

} forEach _magazines;

A3A_artyMagHM set [_vehType, _output];

_output;
