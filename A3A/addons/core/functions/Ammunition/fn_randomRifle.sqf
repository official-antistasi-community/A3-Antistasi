/*
    Select random rebel weapon of preferred type using A3A_rebelGear

Parameters:
    0. <STRING> Preferred weapon type ("Rifles", "MachineGuns" etc).

Returns:
    <STRING> Weapon classname selected

Environment:
    Scheduled, any machine
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_weaponType"];

call A3A_fnc_fetchRebelGear;        // Send current version of rebelGear from server if we're out of date

private _pool = A3A_rebelGear get _weaponType;
if (_pool isEqualTo []) then {
    _pool = A3A_rebelGear get "Rifles";
    if (_pool isEqualTo []) then {
        _pool = A3A_rebelGear get "SMGs";
        if (_pool isEqualTo []) then {
            private _pistolPool = A3A_rebelGear get "Handguns";
            for "_i" from 1 to (count _pistolPool) step 2 do { 
                _pistolPool set [_i, 0.5]
            };
            _pool = (A3A_rebelGear get "Shotguns") + (A3A_rebelGear get "SniperRifles") + _pistolPool;
        };
    };
};
private _weapon = selectRandomWeighted _pool;
_weapon;
