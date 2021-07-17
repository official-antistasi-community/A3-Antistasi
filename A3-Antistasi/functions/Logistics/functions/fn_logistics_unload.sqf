/*
    Author: [Håkon]
    [Description]
        unloads last loaded cargo of the vehicle

    Arguments:
    0. <Object> Vehicle to unload cargo from
    1. <Bool>   optional: unload cargo instantly (Default: False)

    Return Value:
    <Nil>

    Scope: Any
    Environment: Scheduled
    Public: [No]
    Dependencies: <Array< <String>model,<Array>blacklisted vehicle models >> A3A_logistics_weapons

    Example: [_target] remoteExec ["A3A_fnc_logistics_unload",2];
*/
params ["_vehicle", ["_instant", false, [true]]];
#include "..\..\..\Includes\common.inc"
FIX_LINE_NUMBERS()

private _loaded = _vehicle getVariable ["Cargo", []];
private _lastLoaded = false;
if ((count _loaded) isEqualTo 1) then {_lastLoaded = true};
(_loaded#0) params ["_cargo", "_node"];

if !(
    ((gunner _cargo) isEqualTo _cargo)
    or ((gunner _cargo) isEqualTo objNull)
) exitWith {[localize"STR_antistasi_logistics_head", localize"STR_antistasi_logistics_staticMounted_unload"] remoteExec ["A3A_fnc_customHint", remoteExecutedOwner]};

if (_vehicle getVariable ["LoadingCargo", false]) exitWith {[localize"STR_antistasi_logistics_head", localize"STR_antistasi_logistics_alreadyUploaded"] remoteExec ["A3A_fnc_customHint", remoteExecutedOwner]};
_vehicle setVariable ["LoadingCargo",true,true];

//update list of nodes on vehicle
_updateList = {
    params ["_vehicle", "_node"];
    private _list = _vehicle getVariable ["logisticsCargoNodes",[]];
    private _index = _list find _node;
    if (_index < 0) exitWith {Error_3("Bad _updateList call | Vehicle: %1 | Vehicle Nodes: %2 | Node: %3", _vehicle, _list, _node)};
    _node set [0,1];
    _list set [_index, _node];
    _vehicle setVariable ["logisticsCargoNodes", _list];
};

//find node point and seats
private _nodeOffset = [0,0,0];
private _seats = [];

if ((_node#0) isEqualType []) then {
    //type 2 cargo
    //offset
    private _lastNode = (count _node) -1;
    private _offsetOne = (_node#0#1);
    private _offsetTwo = (_node#_lastNode#1);
    private _diff = _offsetOne vectorDiff _offsetTwo;
    _nodeOffset = _offsetTwo vectorAdd [0,(_diff#1)/2,0];

    //seats
    {
        _seats append (_x#2);
    } forEach _node;

    //update cargo list
    for "_i" from 0 to _lastNode do {
        [_vehicle, _node#_i] call _updateList;
    };
} else {
    //type 1 cargo
    //offset
    _nodeOffset = (_node#1);
    //seats
    _seats append (_node#2);
    //update list
    [_vehicle , _node] call _updateList;
};

//detach cargo
private _keepUnloading = false;
if !(_cargo isEqualTo objNull) then {//cargo not deleted
    //check if its a weapon
    private _model = getText (configFile >> "CfgVehicles" >> typeOf _cargo >> "model");
    private _weapon = false;
    {
        if ((_x#0) isEqualTo _model) exitWith {_weapon = true};
    } forEach A3A_logistics_weapons;

    if (_weapon) then {
        [_vehicle, _cargo] remoteExecCall ["A3A_fnc_logistics_removeWeaponAction",0];
        player setCaptive false; //break undercover for unloading weapon
    };
    _cargo setVariable ["AttachmentOffset", nil, true];

    private _location = ([_cargo] call A3A_fnc_logistics_getCargoOffsetAndDir)#0;
    private _location = _location vectorAdd _nodeOffset;

    private _bbv = (boundingBoxReal _vehicle select 0 select 1) + ((boundingCenter _vehicle) select 1);
    private _bbc = (boundingBoxReal _cargo select 0 select 1) + ((boundingCenter _cargo) select 1);
    private _yEnd = _bbv + _bbc - 0.1;

    if (_instant) then {
        _location set [1, _yEnd-0.1];
        _cargo attachto [_vehicle,_location];
    } else {
        while {(_location#1) > _yEnd} do {
            uiSleep 0.1;
            _location = _location vectorAdd [0,-0.1,0];
            _cargo attachto [_vehicle,_location];
        };
    };
    detach _cargo;

    [_cargo] call A3A_fnc_logistics_toggleAceActions;
    [_vehicle, _cargo, true, _instant] call A3A_fnc_logistics_addOrRemoveObjectMass;
    _cargo lockDriver false;
} else {_keepUnloading = true};

//unlock seats
[_cargo, false] remoteExec ["A3A_fnc_logistics_toggleLock", 0, _cargo];
[_vehicle, false, _seats] remoteExec ["A3A_fnc_logistics_toggleLock", 0, _vehicle];

//update list
_loaded deleteAt 0;
_vehicle setVariable ["Cargo", _loaded, true];
[_vehicle] call A3A_fnc_logistics_refreshVehicleLoad; //refresh list in case theres more on the list but no actuall cargo loaded

_vehicle setVariable ["LoadingCargo",nil,true];
if (_keepUnloading and !_lastLoaded) then {[_vehicle] spawn A3A_fnc_logistics_unload};//if you tried to unload a null obj unload next on list
nil
