/*
    Author: [Håkon]
    [Description]
        Verify that it can load cargo in vehicle

    Arguments:
        0. <Object> Vehicle you want to load cargo inn
        1. <Object> Cargo you want to load

    Return Value:
        <Int>   Error code
        <Array> [Cargo, Vehicle, Nodes, isWeapon] can be passed directly to logistics_load as is

    Scope: Any
    Environment: Any
    Public: [No]
    Dependencies:

    Example: [_vehicle, _cargo] call A3A_Logistics_fnc_canLoad;

    Error codes:
        -1: Vehicle not alive or null
        -2: Cargo not alive or null
        -3: Cargo not loadable
        -4: Gunner in static weapon (cargo)
        -5: Weapon not allowed on vehicle
        -6: Unit no longer loadable (conscious)
        -7: Vehicle unable to load any cargo
        -8: Not enough space to load cargo onto vehicle
        -9: Units in cargo seats blocking loading
*/
#include "..\script_component.hpp"
params [ ["_vehicle", objNull, [objNull] ], ["_cargoObject", objNull, [objNull] ] ];
if !(alive _vehicle) exitWith {-1}; //vehicle destroyed
if !(alive _cargoObject) exitWith {-2}; //cargo destroyed

//check if vehicle can load cargo
private _vehConfig = [_vehicle] call A3A_Logistics_fnc_getNodeConfig;
if (isNull _vehConfig) exitWith {-7};

//get cargo node size
private _cargoConfig = [_cargoObject] call A3A_Logistics_fnc_getCargoConfig;
if (isNull _cargoConfig) exitWith {-3};
private _objNodeType = [_cargoObject] call A3A_Logistics_fnc_getCargoNodeType;
if (_objNodeType isEqualTo -1) exitWith {-3}; //invalid cargo

if !(
    ((gunner _cargoObject) isEqualTo _cargoObject)
    or ((gunner _cargoObject) isEqualTo objNull)
) exitWith {-4}; //gunner in static

//is weapon? and weapon allowed
private _weapon = 1 == getNumber (_cargoConfig/"isWeapon");
private _allowed = if (!_weapon) then {true} else {
    if (0 == getNumber (_vehConfig/"canLoadWeapon")) exitWith {false};

    // check weapon allow more
    private _weaponType = getNumber (_cargoConfig/"weaponType");
    private _weaponBlacklist = getArray (_vehConfig/"weaponBlackList");

    private _typeForbidden = if (_weaponType isNotEqualTo 0) then {
        ( _weaponType in _weaponBlacklist)
    } else {
        switch (true) do {
        // Mortar is kind of  "StaticMortar"
            case ( _cargoObject isKindOf "StaticMortar"): { //blacklist mortar and implicit mortar-on-boat check
                ( 1 in _weaponBlacklist || _vehicle isKindOf "Ship")
            };
            case (_cargoObject isKindOf "StaticMGWeapon" ||  _cargoObject isKindOf "StaticGrenadeLauncher"): {
                // Mg may be kind of "StaticMGWeapon" as well as AT-Launcher as well as Vanilla AA also place here "StaticGrenadeLauncher"
                ( 2 in _weaponBlacklist)
            };
            case ( _cargoObject isKindOf "StaticATWeapon"): { // AT may be kind of  "StaticATWeapon"
                ( 3 in _weaponBlacklist)
            };
            case ( _cargoObject isKindOf "StaticAAWeapon"): { // AA may be kind of "StaticAAWeapon"
                ( 4 in _weaponBlacklist)
            };
            default {false};
        };
    };
    if (_typeForbidden) exitwith {false};
    
    // explicit Mortar Boat check
    if (1 == getNumber(_vehConfig/"isBoat") && 1 == _weaponType) exitWith {false};

    // check if weapon is allowed on boat
    if (1 == getNumber(_vehConfig/"isBoat") && 1 == getNumber(_cargoConfig/"disallowOnBoat")) exitWith {false};
    // check if weapon is low and if the vehicle can then load it
    if (0 == getNumber(_vehConfig/"canLoadLowWeapons") && 1 == getNumber(_cargoConfig/"isLow")) exitWith {false};

    // could be obsolete once all logistic stuff is converted
    private _vehModel = getText (configFile/"CfgVehicles"/typeOf _vehicle/"model");
    private _blackList = getArray (_cargoConfig/"blackList");
    !(
        _vehModel in _blackList
        || typeOf _vehicle in _blackList
    )
};
if !(_allowed) exitWith {-5}; //weapon not allowed on vehicle

if ((_cargoObject isKindOf "CAManBase") and (
    ( [_cargoObject] call A3A_fnc_canFight )
    or !( isNull (_cargoObject getVariable ["helped",objNull]) )
    or !( isNull attachedTo _cargoObject )
)) exitWith {-6}; //conscious man

//get vehicle nodes
private _nodes = _vehicle getVariable [QGVAR(Nodes),nil];

//if nodes not initilized
if (isNil "_nodes") then {
    _nodes = [_vehicle] call A3A_Logistics_fnc_getVehicleNodes;
    _vehicle setVariable [QGVAR(Nodes), _nodes];
};

//Vehicle not able to carry cargo
if (_nodes isEqualTo []) exitWith {-7};

//enough free nodes to load cargo
private "_node";
{
    private _currentNodes = [];
    for "_i" from 0 to _objNodeType - 1 do {
        private _currentNode = _forEachIndex + _i;
        if (isNil {_nodes#_currentNode}) exitWith {};//zero divisor block
        if (((_nodes#_currentNode)#0) isEqualTo 1) then {_currentNodes pushBack _nodes#_currentNode};
    };
    if ((count _currentNodes) isEqualTo _objNodeType) exitWith {_node = _currentNodes};
} forEach _nodes;
if (isNil "_node") exitWith {-8};

//block loading if crew in node seats
private _fullCrew = fullCrew _vehicle;
private _seats = [];
if ((_node#0) isEqualType []) then {
    {_seats append (_x#2)} forEach _node;
} else {
    _seats append (_node#2);
};
if !(_fullCrew findIf {_x#2 in _seats} isEqualTo -1) exitWith {-9};

[_cargoObject, _vehicle, _node, _weapon]
