/*
    Author: [Håkon]
    [Description]
        adds load (or unload) action to object, if it isnt already on it

    Arguments:
    0. <Object> Object to add action to
    1. <String> Which action to add ("load"/"unload")
    2. <String> JIP key
    3. <Bool> Whether loading should break undercover

    Return Value:
    <nil>

    Scope: Clients
    Environment: Any
    Public: [No]
    Dependencies:

    Example: [_object , _action] remoteExec ["A3A_Logistics_fnc_addAction", 0, _object];
*/
params [["_object", objNull, [objNull]], "_action", ["_jipKey", "", [""]], ["_breakUC",false]];
if (isNull _object) exitWith {
    remoteExec ["", _jipKey]; //clear custom JIP
};

private _actionNames = (actionIDs _object) apply {(_object actionParams _x)#0};
private _loadText = format [localize "STR_A3A_logi_addact_load", getText (configFile >> "CfgVehicles" >> typeOf _object >> "displayName")];

switch (_action) do {
    case "load":{
        if (_loadText in _actionNames) exitWith {};
        private _loadActionID = _object addAction
        [
            _loadText,
            {
                params ["_target","_caller","_actionID","_breakUC"];
                [_target] remoteExecCall ["A3A_Logistics_fnc_tryLoad",2];
                if (_breakUC) then {_caller setCaptive false};
            },
            _breakUC,
            -5,
            true,
            true,
            "",
            "(
                ((attachedTo _target) isEqualTo objNull)
                and ((vehicle _this) isEqualTo _this)
                and (alive _target)
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
        private _text = localize "STR_A3A_logi_addact_unload";
        if (_text in _actionNames) exitWith {};
        private _unloadActionID = _object addAction
        [
            _text,
            {
                params ["_target"];
                [_target] remoteExec ["A3A_Logistics_fnc_unload",2];
            },
            nil,
            -5,
            true,
            true,
            "",
            "(
                !((_target getVariable ['Cargo', []]) isEqualTo [])
                and !(_target getVariable ['LoadingCargo', false])
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
