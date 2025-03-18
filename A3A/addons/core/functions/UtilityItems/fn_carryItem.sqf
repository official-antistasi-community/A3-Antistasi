/*
Author: Killerswin2,
    trys to carry an object to a place
Arguments:
    0.<Object>  object that will be carried
    1.<Object>  player that calls or holds object
Return Value:
    <nil>

Scope: Clients
Environment: Scheduled unfortunately (addAction)
Public: yes
Dependencies: 

Example:
    [cursorObject] call A3A_fnc_carryItem; 

*/

params ["_item", "_player"];         // standard addAction

// Redo the checks, because this function might be delayed by script load
if ((!isNull attachedTo _item) or (call A3A_fnc_isCarrying) or (!isNull objectParent _player)) exitWith {};
if (_item isKindOf "StaticWeapon" and count crew _item != 0) exitWith {};

// Go unscheduled to keep the state consistent
isNil {
    if (_item isKindOf "StaticWeapon") then { _item lock true };

    // Prevent killing players with item
    if (isNil {_item getVariable "A3A_originalMass"}) then { _item setVariable ["A3A_originalMass", getMass _item] };
    [_item, 1e-12] remoteExecCall ["setMass", 0]; 
    [_item, false] remoteExecCall ["enableSimulationGlobal", 2];

    private _bbReal = boundingBoxReal _item;
    private _spacing = 1.3 - _bbReal#0#1;
    private _height = (1 - _bbReal#1#2) max (0.1 - _bbReal#0#2);
    _item attachTo [_player, [0, _spacing, _height]];

    // We need to prevent the player from carrying an object into a vehicle to prevent damage to vehicle
    private _eventIDcarry = _player addEventHandler ["GetInMan", {
        params ["_unit", "_role", "_vehicle", "_turret"];
        _unit call A3A_fnc_dropItem;
    }];

    _player setVariable ["A3A_eventIDcarry", _eventIDcarry];
    _player setVariable ["A3A_objectCarried", _item];
    _player setVariable ["A3A_carryingObject", true];

    private _dropID = _player addAction [
        localize "STR_A3A_fn_UtilItem_dropOb_addact_drop",
        { (_this#1) call A3A_fnc_dropItem }, _item, 4, true, true, "", "true"
    ];
    _player setVariable ["A3A_actionIDdrop", _dropID];

    [_player, _item] spawn {
        params ["_player", "_item"];
        private _isHQ = _item in [petros, fireX, mapX, vehicleBox, flagX, boxX];
        waitUntil {
            _player allowSprint false;
            !alive _item or !alive _player
            or (lifestate _player isEqualTo "INCAPACITATED")            // drop when ACE-unconscious
            or !(_player getVariable ["A3A_carryingObject", false])
    //        or !(vehicle _player == _player)
            or !(_player == attachedTo _item)
            or (_isHQ and _player distance2d markerPos "Synd_HQ" > 50)
        };
        if (_player getVariable ["A3A_carryingObject", false]) then { _player call A3A_fnc_dropItem };
        _player allowSprint true;
    };
};

nil;
