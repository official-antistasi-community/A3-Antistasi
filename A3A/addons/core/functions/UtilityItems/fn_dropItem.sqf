/*
    Drop the carried object

    Environment: Player-local, scheduled (usually addAction)

    Arguments:
        <Object> Player carrying an item

    Return Value:
        <nil>
*/

params ["_player"];

// Possible to fire this off twice at high script load
private _dropID = _player getVariable "A3A_actionIDdrop";
if (isNil "_dropID") exitWith {};

// Go unscheduled to keep the state consistent
isNil {
    // Clear drop action
    _player removeAction _dropID;
    _player setVariable ["A3A_actionIDdrop", nil];

    // Clear GetInMan EH
    private _eventIDcarry = _player getVariable "A3A_eventIDcarry";
    _player removeEventHandler ["GetInMan", _eventIDcarry];
    _player setVariable ["A3A_eventIDcarry", nil];

    private _item = _player getVariable "A3A_objectCarried";

    _player setVelocity [0,0,0];
    detach _item;

    if (vehicle _player != _player) then {
        // GetInMan triggered case, semi-safe place nearby
        _item setVehiclePosition [getPosATL _player, [], 10, "NONE"];
    };

    private _isHQ = _item in [petros, fireX, mapX, vehicleBox, flagX, boxX];
    private _posHQ = markerPos "Synd_HQ"; 
    if (_isHQ and {_item distance2d _posHQ > 50}) then {
        // Drag object back into HQ area if moved out
        private _objdir = _posHQ vectorFromTo getPosATL _item;
        private _edgepos = _posHQ vectorAdd (_objdir vectorMultiply 49);
        _item setPosATL _edgePos;
    };

    // Some objects never lose (and even regain) their velocity when detached, becoming lethal
    // On a DS, object locality changes when detached, so we have to remoteexec
    [_item, [0,0,0]] remoteExecCall ["setVelocity", _item];

    // Without this, non-unit objects often hang in mid-air
    [_item, surfaceNormal position _item] remoteExecCall ["setVectorUp", _item];

    // Place on closest surface
    private _pos = getPosASL _item;
    private _intersects = lineIntersectsSurfaces [_pos, _pos vectorAdd [0,0,-100], _item];
    if (count _intersects > 0) then {
        _item setPosASL (_intersects select 0 select 0);
    };

    [_item, true] remoteExecCall ["enableSimulationGlobal", 2];

    if (_item isKindOf "StaticWeapon") then { _item lock false };

    _item spawn {
        sleep 1;
        if (isNull _this) exitWith {};
        // Restore original _item mass. This one can be slow.
        [_this, _this getVariable "A3A_originalMass"] remoteExecCall ["setMass", _this];
    };

    _player setVariable ["A3A_objectCarried", nil];
    _player setVariable ["A3A_carryingObject", nil];
};
