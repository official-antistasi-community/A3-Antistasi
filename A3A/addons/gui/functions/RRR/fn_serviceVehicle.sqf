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
        // Get current & max rounds for each class+turret
        // Don't worry about blacklisting here, handled in the UI
        private _originalMags = typeOf _veh call HR_GRG_fnc_getDefaultMags;
        private _magsCombinedHM = createHashMap;
        {
            _x params ["_mag", "_turret", "_bullets"];
            private _key = tolower _mag + str _turret;        // RHS lol
            private _val = _magsCombinedHM getOrDefault [_key, [_mag, _turret, 0, 0], true];
            _val set [3, (_val#3) + _bullets];
        } forEach _originalMags;

        {
            _x params ["_mag", "_turret", "_bullets"];
            private _key = tolower _mag + str _turret;
            if !(_key in _magsCombinedHM) then {continue};          // Ignore anything that isn't in original loadout (could be pylon, blacklist, whatever)
            private _val = _magsCombinedHM get _key;
            _val set [2, (_val#2) + _bullets];
        } forEach magazinesAllTurrets _veh;

        {
            _x params ["_name", "_roundsToBuy", "_orderPrice", "", "", "", ["_turretPath", [-1]]];
            
            private _key = tolower _name + str _turretPath;
            if !(_key in _magsCombinedHM) then { Error_3("Magazine type %1 turret %2 not found in %3", _name, _turretPath, typeOf _veh); continue };
            _magsCombinedHM get _key params ["_magName", "_turret", "_curRounds", "_maxRounds"];
            private _targetRounds = _roundsToBuy + _curRounds;
            if (_targetRounds > _maxRounds) then {
                // shouldn't happen unless multiple people use UI on the same vehicle concurrently
                ["Service Vehicle", format ["Attempted to overfill magazine %1, capped.", getText (configFile >> "CfgMagazines" >> _name >> "displayName")]] spawn A3A_fnc_customHint;
                _targetRounds = _maxRounds;
            };

            private _roundsPerMag = getNumber (configFile >> "CfgMagazines" >> _name >> "count");
            private _fullBoxes = floor (_targetRounds / _roundsPerMag);
            private _partialMagSize = _targetRounds % _roundsPerMag;
            if (_partialMagSize isEqualTo 0) then { // case to load gun with full magazine
                _fullBoxes = _fullBoxes - 1;
                _partialMagSize = _roundsPerMag;
            };
            [_veh, "rearm", [_name, _turretPath, _fullBoxes, _partialMagSize]] remoteExecCall ["A3A_GUI_fnc_serviceVehicleGlobal", 0];
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
            [_veh, "pylon", [_pylonIndex, _turretPath, _magName]] remoteExecCall ["A3A_GUI_fnc_serviceVehicleGlobal", 0];
            _changedPylons pushBack _pylonIndex;
            _removedWeapons pushBackUnique [(getText (configFile >> "CfgMagazines" >> _magName >> "pylonWeapon")), _turretPath];
        } forEach ((_purchaseList get "refund") + ((_purchaseList get "swap") apply {_x#0}));

        private _pylonInfo = getAllPylonsInfo _veh;
        private _magInfo = getPylonMagazines _veh;
        
        {
            _x params ["_magName", "_rounds", "_orderPrice", "_prettyName", "_isRefund", "_pylonIndex", "_turretPath"];
            private _currentCount = if ((_magInfo#(_pylonIndex - 1)) isEqualTo _magName) then {_veh ammoOnPylon _pylonIndex} else {0};
            [_veh, "pylon", [_pylonIndex, _turretPath, _magName, _currentCount + _rounds]] remoteExecCall ["A3A_GUI_fnc_serviceVehicleGlobal", 0];
            _changedPylons pushBack _pylonIndex;
        } forEach (((_purchaseList get "swap") apply {_x#1}) + (_purchaseList get "purchase"));

        {
            // array of turret paths
            private _newTurretPath = _x;
            private _pylonIndex = _forEachIndex + 1;
            if (_pylonIndex in _changedPylons) then { continue };
            private _oldTurretPath = _pylonInfo#_forEachIndex#2;
            if (_oldTurretPath isEqualTo _newTurretPath) then { continue };
            private _currentMag = _magInfo#_forEachIndex;
            _removedWeapons pushBackUnique [(getText (configFile >> "CfgMagazines" >> _currentMag>> "pylonWeapon")), _oldTurretPath];
            [_veh, "pylon", [_pylonIndex, _newTurretPath, _currentMag, _veh ammoOnPylon _pylonIndex]] remoteExecCall ["A3A_GUI_fnc_serviceVehicleGlobal", 0];
            _changedPylons pushBack _pylonIndex;
        } forEach (_purchaseList get "owner");

        if (_removedWeapons isEqualTo []) exitwith {};

        // removeWeaponTurret needs to run local to the turret. turretOwner can only be found from the server.
        // magazine / turret path information isnt updated until the earlier serviceVehicle remoteExecs go through
        // everything is awful
        // can just throw a dumb sleep in here. whatever.

        sleep 1;
        
        [_veh, _removedWeapons] remoteExec ["A3A_GUI_fnc_clearEmptyWeapons", 2];
    };
    case "repair":
    {

    };
    case "refuel":
    {

    };
};


