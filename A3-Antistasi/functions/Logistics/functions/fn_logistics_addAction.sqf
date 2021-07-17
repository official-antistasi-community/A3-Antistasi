/*
    Author: [Håkon]
    [Description]
        adds load (or unload) action to object, if it isnt already on it

    Arguments:
    0. <Object> Object to add action to
    1. <String> Which action to add ("load"/"unload")

    Return Value:
    <nil>

    Scope: Clients
    Environment: Any
    Public: [No]
    Dependencies:

    Example: [_object , _action] remoteExec ["A3A_fnc_logistics_addAction", 0, _object];
*/
params [["_object", objNull, [objNull]], "_action"];
if (isNull _object) exitWith {};
private _actionNames = (actionIDs _object) apply {(_object actionParams _x)#0};
private _loadText = format [localize "STR_antistasi_logistics_loadIntoVeh", getText (configFile >> "CfgVehicles" >> typeOf _object >> "displayName")];

switch (_action) do {
    case "load":{
        if (_loadText in _actionNames) exitWith {};
        private _loadActionID = _object addAction
        [
            _loadText,
            {
                params ["_target"];
                [_target] remoteExecCall ["A3A_fnc_logistics_tryLoad",2];
            },
            nil,
            1.5,
            true,
            true,
            "",
            "(
                ((attachedTo _originalTarget) isEqualTo objNull)
                and ((vehicle _this) isEqualTo _this)
                and (alive _originalTarget)
                and {
                    !(_originalTarget isKindOf 'CAManBase')
                    or {
                        (_originalTarget getVariable ['incapacitated',false])
                        and (_target isEqualTo _originalTarget)
                    }
                }
                and _originalTarget isNotEqualTo _this
            )",
            5
        ];
        _object setUserActionText [
            _loadActionID,
            _loadText,
            "<t size='2'><img image='\A3\ui_f\data\IGUI\Cfg\Actions\arrow_up_gs.paa'/></t>"
        ];
    };
    case "unload": {
        private _text = localize "STR_antistasi_logistics_loadCargo";
        if (_text in _actionNames) exitWith {};
        private _unloadActionID = _object addAction
        [
            _text,
            {
                params ["_target"];
                [_target] remoteExec ["A3A_fnc_logistics_unload",2];
            },
            nil,
            1.5,
            true,
            true,
            "",
            "(
                !((_originalTarget getVariable ['Cargo', []]) isEqualTo [])
                and !(_originalTarget getVariable ['LoadingCargo', false])
                and ((vehicle _this) isEqualTo _this)
            )",
            5
        ];
        _object setUserActionText [
            _unloadActionID,
            _text,
            "<t size='2'><img image='\A3\ui_f\data\IGUI\Cfg\Actions\arrow_down_gs.paa'/></t>"
        ];
    };
};
