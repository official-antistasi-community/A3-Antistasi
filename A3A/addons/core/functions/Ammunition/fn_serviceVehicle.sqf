#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

/*
OK so for this function the original intent was to have each operation take a certain amount of time and deduct points
There's an unresolved question about how we would process the no-surplus because people can stop the animation at any time
My assumption would be that we never refund more than what the truck already had, and if theres a deficit at the end we refund it. 
Not...perfect, but probably the least abusable system
Unfortunately we are currently in crunch time and I dont have time for unresolved questions
The framework for time-based stuff is here, the shopping list is split into swaps / purchases / refunds, just not implemented
*/

params ["_veh", ["_mode", ""], ["_supplyVeh", objNull], ["_purchaseList", []], ["_totalCost", 0]];
// acts as instant fix button without params
if (_purchaseList isEqualTo []) exitWith {
    if (_mode in ["", "repair"]) then {_veh setDamage 0};
    if (_mode in ["", "refuel"]) then {_veh setFuel 1};
    if (_mode in ["", "rearm", "pylon"]) then {_veh setVehicleAmmoDef 1};
};

if !(canSuspend) exitWith {Error("serviceVehicle called in unscheduled")};

if (isNull _supplyVeh) then {
    _supplyData = [_mode, getPosATL player, 25] call A3A_fnc_lookForSupplyVehicle;
};
private _searchVar = _mode;
if (_searchVar isEqualTo "pylon") then {_searchVar = "rearm"};
private _cargoVar = format ["A3A_%1Cargo", _searchVar];

/*
// AXED
// each action takes a certain amount of time, then happens, then reduces resources
private _fnc_actionTimer = {
    params ["_time", "_animation"];
    A3A_actionTimer_cancelled = false;
    sleep _time;
    A3A_actionTimer_cancelled = false;
};
*/

private _currentStock = _supplyVeh getVariable [_cargoVar, 0];
private _newStock = _currentStock - _totalCost;
if (_newStock < 0) exitWith {
    private _magName = getText (configFile >> "CfgMagazines" >> _name >> "displayName");
    ["Service Vehicle", format ["The supply vehicle does not have the %1 points needed for this request, the vehicle has %2 points", _orderPrice, _totalCost]] spawn A3A_fnc_customHint;
};

_supplyVeh setVariable [_cargoVar, _newStock, true];

switch (_mode) do {
    case "rearm":
    {
        private _mags = magazinesAllTurrets cursorObject select {!("pylon" in toLower (_x#0))} apply { [[_x#0, _x#2]] }; //[magName, ammo]
        private _magsCombined = []; 
        {
            private _mag = _x#0#0;
            private _currentMagIndex = _magsCombined findIf {(_x#0) isEqualTo _mag};
            private _magExists =  (_currentMagIndex > -1);
            private _currentMagInfo = if (_magExists) then {_magsCombined#_currentMagIndex} else {[_mag, 0, 0]};
            
            _magsCombined deleteAt _currentMagIndex;
            _magsCombined insert [_currentMagIndex, [[_mag, _currentMagInfo#1 + (_x#0#1), _currentMagInfo#2 + 1]]];

        } forEach _mags;
        {
            

            _x params ["_name", "_roundsToBuy", "_orderPrice", "", "", "", ["_turretPath", [-1]]];
            
            // icky part
            // Ok so we need to figure out how many full mags are needed and how many bullets are in the last partial mag
            // this is complicated by the fact that any number of these mags could be partial mags
            // fuck it, figure out how many rounds the vic should have, remove all magazines, add full mags, add partial mag
            private _magData = _magsCombined select (_magsCombined findif {_x#0 isEqualTo _name}); // really is just _forEachIndex
            _magData params ["_magName", "_totalAmmo", "_magCount"];
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
            [_veh, "rearm", [_name, _turretPath, _fullBoxes, _partialMagSize]] remoteExec ["A3A_fnc_serviceVehicleLocal", _veh];
        } forEach _purchaseList;
    };
    case "pylon":
    {
        /*
        {
            if !([_orderPrice, _magName] call _fnc_checkForSupplies) exitWith {};
            private _actionTime = call {3}; // placeholder
            private _animation = "";
            private _handle = [_actionTime, _animation] spawn _fnc_actionTimer;
            waitUntil {sleep 0.1; scriptDone _handle};
            if (A3A_actionTimer_cancelled) exitWith {};
            // need stuff to signal time taken and animation of some sort here. not needed for now tho;
            sleep _actionTime;
            // check again that the truck has ammo
            if !([_orderPrice, _magName] call _fnc_checkForSupplies) exitWith {};
            // deduct money
            private _currentStock = _veh getVariable [_cargoVar, 0];
            diag_log _currentStock;
            private _newStock = if (_isRefund) then {
                _currentStock + (0.8 * _orderPrice)
            } else {
                _currentStock - _orderPrice
            };
            diag_log _newStock;
            _veh setVariable [_cargoVar, _newStock, true];
            _veh setPylonLoadout [_pylonIndex, _magName, true, _turretPath];
            _veh setAmmoOnPylon [_pylonIndex, _rounds];
        } forEach _purchaseList;
        */

        private _changedPylons = []; 
        private _removedWeapons = [];
        {
            _x params ["_magName", "_rounds", "_orderPrice", "_prettyName", "_isRefund", "_pylonIndex", "_turretPath"];
            [_veh, "pylon", [_pylonIndex, _magName, _turretPath]] remoteExecCall ["A3A_fnc_serviceVehicleLocal", _veh];
            _changedPylons pushBack _pylonIndex;
            _removedWeapons pushBackUnique (getText (configFile >> "CfgMagazines" >> _magName >> "pylonWeapon"));
        } forEach ((_purchaseList get "refund") + ((_purchaseList get "swap") apply {_x#0}));

        private _magInfo = getPylonMagazines _veh;

        if (_removedWeapons isNotEqualTo []) then { // only runs for pylon removal
            {
                private _possibleMags = getArray (configFile >> "CfgWeapons" >> _x >> "magazines");
                private _foundMagIndex = _magInfo findIf {_x in _possibleMags};
                if (_foundMagIndex isEqualTo -1) then {_veh removeWeaponGlobal _x};
            } forEach _removedWeapons;
        };

        {
            _x params ["_magName", "_rounds", "_orderPrice", "_prettyName", "_isRefund", "_pylonIndex", "_turretPath"];
            private _currentCount = if ((_magInfo#(_pylonIndex - 1)) isEqualTo _magName) then {_veh ammoOnPylon _pylonIndex} else {0};
            [_veh, "pylon", [_pylonIndex, _magName, _turretPath, _currentCount + _rounds]] remoteExecCall ["A3A_fnc_serviceVehicleLocal", _veh];
            _changedPylons pushBack _pylonIndex;
        } forEach (((_purchaseList get "swap") apply {_x#1}) + (_purchaseList get "purchase"));

        {
            // array of turret paths
            private _pylonIndex = _forEachIndex + 1;
            if (_pylonIndex in _changedPylons) then {continue};
            [_veh, "pylon", [_pylonIndex, _magInfo#_forEachIndex, _x, _veh ammoOnPylon _pylonIndex]] remoteExecCall ["A3A_fnc_serviceVehicleLocal", _veh];
        } forEach (_purchaseList get "owner");
    };
    case "repair":
    {

    };
    case "refuel":
    {

    };
};


