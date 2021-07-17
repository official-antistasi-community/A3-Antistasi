/*
    Author: [Håkon]
    [Description]
        Handles buying of loot crates

    Arguments:
    0. <Object> Unit that is trying to buy a new crate

    Return Value:
    <nil>

    Scope: Clients
    Environment: Any
    Public: [No]
    Dependencies:

    Example: [player] call A3A_fnc_spawnCrate;

    License: MIT License
*/
params ["_unit"];
private _time = _unit getVariable ["BuyCrateCooldown",time];
if (_time > time) exitWith {[localize "STR_antistasi_customHint_loot", format [localize "STR_antistasi_customHint_loot_wait", ceil (_time - time)]] call A3A_fnc_customHint};
_money = _unit getVariable ["moneyX", 0];
if (_money < 10) exitWith {[localize "STR_antistasi_customHint_loot", localize "STR_antistasi_customHint_loot_no_afford"] call A3A_fnc_customHint};
_unit setVariable ["BuyCrateCooldown",time + 5];
[-10] call A3A_fnc_resourcesPlayer;
[localize "STR_antistasi_customHint_loot", localize "STR_antistasi_customHint_loot_bought"] call A3A_fnc_customHint;

//spawn crate
private _createType = NATOSurrenderCrate;
_position = (getPos _unit) findEmptyPosition [1,10,_createType];
if (_position isEqualTo []) then {_position = getPos _unit};
private _crate = _createType createVehicle _position;
_crate allowDamage false;
clearMagazineCargoGlobal _crate;
clearWeaponCargoGlobal _crate;
clearItemCargoGlobal _crate;
clearBackpackCargoGlobal _crate;
[_crate] call A3A_fnc_logistics_addLoadAction;
