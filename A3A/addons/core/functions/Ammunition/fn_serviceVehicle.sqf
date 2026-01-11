#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_veh", ["_mode", ""], ["_supplyVeh", objNull], ["_purchaseList", []]];

// acts as instant fix button without params
if (_purchaseList == []) exitWith {
    if (_mode in ["", "repair"]) then {_veh setDamage 0};
    if (_mode in ["", "refuel"]) then {_veh setFuel 1};
    if (_mode in ["", "rearm", "pylon"]) then {_veh setVehicleAmmoDef 1};
};

if !(canSuspend) exitWith {Error("serviceVehicle called in unscheduled")};

if (isNull _supplyVeh) then {
    _supplyData = [_mode, getPosATL player, 25] call A3A_fnc_lookForSupplyVehicle;
};
private _searchVar = _vehType;
if (_searchVar isEqualTo "pylon") then {_searchVar = "rearm"};
private _cargoVar = format ["A3A_%1Cargo", _searchVar];

// each action takes a certain amount of time, then happens, then reduces resources
private _fnc_actionTimer = {
    params ["_time", "_animation"];
    A3A_actionTimer_cancelled = false;
    sleep _time;
    A3A_actionTimer_cancelled = false;
};

private _fnc_checkForSupplies = {
    params ["_orderPrice", "_name"];
    private _currentStock = _veh getVariable [_cargoVar, 0];
    if (_currentStock < _orderPrice) exitWith {
        private _magName = getText (configFile >> "CfgMagazines" >> _name >> "displayName");
        ["Service Vehicle", format ["The supply vehicle does not have the %1 points needed to rearm %2, the vehicle has %3 points", _orderPrice, _magName, _currentStock]] spawn A3A_fnc_customHint;
        false
    };
    true
};

switch (_mode) do {
    case "rearm":
    {
        {
            private _mags = magazinesAllTurrets _veh select {!("pylon" in toLower (_x#0))} apply { [[_x#0, _x#1, _x#2]] }; //[magName, ammo]
            private _magsCombined = [];

            {
                private _currentMag = _x#0;
                private _index = _magsCombined findif {_x#0 isEqualTo _currentMag};
                private _currentEntry = if (_index isEqualTo -1) then {[_currentMag, 0, 0, [0]]} else {_magsCombined select _index};
                private _ammo = _currentEntry#1;
                private _magCount = _currentEntry#2;
                _magsCombined set [_x#0, _ammo + (_x#2), _magCount + 1, _x#1];
            } forEach _mags;

            _x params ["_name", "_roundsToBuy", "_orderPrice", ["_turretPath", [0]]];
            // check at the start of the action that there's ammo to rearm, can easily quit otherwise. should not be possible w/e exploiting 2 players
            if !([_orderPrice, _name] call _fnc_checkForSupplies) exitWith {};

            private _actionTime = call {3}; // placeholder
            
            private _handle = [_actionTime, _animation] spawn _fnc_actionTimer;
            waitUntil {sleep 0.1; scriptDone _handle};
            if (A3A_actionTimer_cancelled) exitWith {};
            // need stuff to signal time taken and animation of some sort here. not needed for now tho;
            sleep _actionTime;
            // check again that the truck has ammo
            if !([_orderPrice, _name] call _fnc_checkForSupplies) exitWith {};
            // deduct money
            private _currentStock = _veh getVariable [_cargoVar, 0];
            private _newStock = _currentStock - _orderPrice;
            _veh setVariable [_cargoVar, _newStock, true];
            // icky part
            // Ok so we need to figure out how many full mags are needed and how many bullets are in the last partial mag
            // this is complicated by the fact that any number of these mags could be partial mags
            // fuck it, figure out how many rounds the vic should have, remove all magazines, add full mags, add partial mag
            private _magData = _magsCombined select (_magsCombined findif {_x#0 isEqualTo _name}); // really is just _forEachIndex
            _magData params ["_magName", "_totalAmmo", "_magCount", "_turretPath"];
            private _roundsPerMag = getNumber (configFile >> "CfgMagazines" >> _name >> "count");
            private _maxTotalRounds = _magCount * _roundsPerMag;
            private _targetRounds = _roundsToBuy + _totalAmmo;
            if (_targetRounds > _maxTotalRounds) then {["Service Vehicle", format ["Rearming this vehicle with %1 rounds of %2 would over-fill it. Continuing with next order.", _roundsToBuy, getText (configFile >> "CfgMagazines" >> _name >> "displayName")]] spawn A3A_fnc_customHint; continue};
            private _fullBoxes = floor (_targetRounds / _roundsPerMag);
            private _partialMagSize = _targetRounds % _roundsPerMag;
            if (_partialMagSize isEqualTo 0) then { // case to load gun with full magazine
                _fullBoxes = _fullBoxes - 1;
                _partialMagSize = _roundsPerMag;
            };
            _veh removeMagazinesTurret [_name, _turretPath];
            _veh addMagazinesTurret [_name, _turretPath, _fullBoxes];
            _veh addMagazineTurret [_name, _turretPath, _partialMagSize];
        } forEach _purchaseList;
    };
    case "pylon":
    {
        {
            _x params ["_magName", "_rounds", "_orderPrice", "_pylonIndex", "_turretPath"];
            if !([_orderPrice, _magName] call _fnc_checkForSupplies) exitWith {};

            private _actionTime = call {3}; // placeholder
            
            private _handle = [_actionTime, _animation] spawn _fnc_actionTimer;
            waitUntil {sleep 0.1; scriptDone _handle};
            if (A3A_actionTimer_cancelled) exitWith {};
            // need stuff to signal time taken and animation of some sort here. not needed for now tho;
            sleep _actionTime;
            // check again that the truck has ammo
            if !([_orderPrice, _name] call _fnc_checkForSupplies) exitWith {};
            // deduct money
            private _currentStock = _veh getVariable [_cargoVar, 0];
            private _newStock = _currentStock - _orderPrice;
            _veh setVariable [_cargoVar, _newStock, true];

            _veh setPylonLoadout [_pylonIndex, _magName, true, _turretPath];
            _veh setAmmoOnPylon [_pylonIndex, _rounds];

        } forEach _purchaseList;
    };
    case "repair":
    {

    };
    case "refuel":
    {

    };
};


