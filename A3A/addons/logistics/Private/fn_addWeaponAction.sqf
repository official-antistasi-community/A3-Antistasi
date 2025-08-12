/*
    Author: [Håkon]
    [Description]
        adds "get in" action and nececary EH's for mounted weapon

    Arguments:
    0. <Object> Weapon that's being attached
    1. <Object> Vehicle weapon is being attached to

    Return Value:
    <nil>

    Scope: Clients
    Environment: Any
    Public: [No]
    Dependencies:

    Example: [_cargo, _vehicle] remoteExec ["A3A_Logistics_fnc_addWeaponAction", 0, _cargo];
*/
params [["_cargo", objNull, [objNull]], ["_vehicle", objNull, [objNull]], ["_jipKey", "", [""]]];

if (isNull _cargo || isNull _vehicle) exitWith {
    remoteExec ["", _jipKey]; //clear custom JIP
};

//action to get into static
private _name = getText (configFile >> "CfgVehicles" >> typeOf _cargo >> "displayName");
private _text = format [localize "STR_A3A_logi_addweaponaction_getin", _name];

private _actionID = _vehicle addAction [
    _text,
    {
        params ["_vehicle", "_caller", "_id", "_static"];
        if !(attachedTo _static isEqualTo _vehicle) exitWith {[_vehicle, _id] remoteExecCall ["removeAction", 0]};// incase of code break in unloading static
        if (!alive gunner _static) then {
            _caller moveInGunner _static;
        } else {[localize "STR_A3A_logi_title", localize "STR_A3A_logi_addweaponaction_alreadyin"] call A3A_fnc_customHint};
    },
    _cargo,
    5.5,
    true,
    true,
    "",
    "(
        ((attachedTo _this) isEqualTo objNull)
        and (_this isEqualTo (vehicle _this))
        and ((gunner _target) isEqualTo objNull)
    )",
    5
];
_vehicle setUserActionText [
    _actionID,
    _text,
    "<t size='2'><img image='\A3\ui_f\data\IGUI\Cfg\Actions\getingunner_ca.paa'/></t>"
];
_cargo setVariable ["getInAction", _actionID];

//EH that removes action if static is destroyed
private _KilledEH = _cargo addEventHandler ["Killed", {
    params ["_cargo"];
    private _vehicle = attachedTo _cargo;
    [_vehicle, _cargo] remoteExecCall ["A3A_Logistics_fnc_removeWeaponAction",0]
}];
_cargo setVariable ["KilledEH", _KilledEH];
_cargo enableWeaponDisassembly false;

//moves player to apropriate spot when exiting static
private _GetOutEH = _cargo addEventHandler ["GetOut", {
    params ["_cargo", "", "_unit"];
    private _vehicle = attachedTo _cargo;
    if (isNull _vehicle) exitWith { _cargo removeEventHandler ["GetOut", _thisEventHandler] };

    private _bb = 3 boundingBoxReal _vehicle;
    private _mPos = [(_bb#0#0) - 0.3, (_vehicle worldToModel getPos _cargo)#1, _bb#0#2];
    private _newPos = _vehicle modelToWorld _mPos;
    _unit setPos _newPos;
}];
_cargo setVariable ["GetOutEH", _GetOutEH];

//break undercover of units getting in
private _undercoverBreak = _vehicle addEventHandler ["GetIn", {
    _this spawn {sleep 0.1; (_this#2) setCaptive false};
}];
_vehicle setVariable ["undercoverBreak", _undercoverBreak];

//init unneccesary but nice features
[_cargo] call A3A_Logistics_fnc_initMountedWeapon;
