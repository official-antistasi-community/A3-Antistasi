/*
Maintainer: Caleb Serafin
    Contains the backing methods to the HQ spawn options dialogue.
    See the `// ADD NEW OPTIONS HERE //` tag for adding options.
    Cannot be called from server.
    Authenticated caller must be theBoss or an admin.

Arguments:
    <OBJECT> Player executing the change.
    <STRING> Spawn Option
    <STRING> Action
    <SCALAR> Amount to adjust by or set [DEFAULT: nil]
    <BOOL> False to use hints. True to hide hints [DEFAULT: False]

Scope: Server, Global Arguments, Global Effect
Environment: Any
Public: Yes

Example:
    [player,"maxUnits","increase"] remoteExecCall ["A3A_fnc_HQGameOptions",2];
    [player,"globalCivilianMax","decrease"] remoteExecCall ["A3A_fnc_HQGameOptions",2];
*/
params [
    ["_player",objNull,[objNull]],
    ["_option","",[""]],
    ["_action","",[""]],
    ["_amount",nil,[nil,0]],
    ["_noHints",false,[false]]
];
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if (!isServer) exitWith {
    Warning("A3A_fnc_HQGameOptions should be executed on the server.");
    _this remoteExecCall ["A3A_fnc_HQGameOptions",2];
};

private _optionLocalisationTable = [["maxUnits","distanceSPWN","globalCivilianMax"],[localize "STR_A3A_fn_dialogs_HQGameOptions_AILimit",localize "STR_A3A_fn_dialogs_HQGameOptions_spwnDistance",localize "STR_A3A_fn_dialogs_HQGameOptions_civLimit"]];
private _hintTitle = localize "STR_A3A_fn_dialogs_HQGameOptions_title";

// Increase/Decrease/Set
private _fnc_processAction = {
    params["_option","_action","_upperLimit","_lowerLimit","_adjustmentAmount"];
    private _inRange = 2;   // 2 for in-range, 0 for low, 1 for high.
    private _invalid = false;

    private _originalAmount = missionNamespace getVariable [_option,0];
    private _finalAmount = _originalAmount;
    switch (_action) do {
        case "decrease": { if (_originalAmount < _lowerLimit + _adjustmentAmount) then {_inRange = 0}; _adjustmentAmount = -_adjustmentAmount; };
        case "increase": { if (_originalAmount > _upperLimit - _adjustmentAmount) then {_inRange = 1}; };
        case "set": {
            if (_adjustmentAmount < _lowerLimit) then {_inRange = 0; };
            if (_upperLimit < _adjustmentAmount) then {_inRange = 1; };
            _adjustmentAmount = _adjustmentAmount - _originalAmount;
        };
        default {
            _invalid = true;
            Error("INVALID METHOD | "+ name _player + " ["+(getPlayerUID _player) + "] ["+ str owner _player +"] called invalid backing method "+str _this);
        };
    };
    if (_invalid) exitWith {};

    private _optionName = _optionLocalisationTable#1#(_optionLocalisationTable#0 find _option);
    private _hintText = "";
    if (_inRange == 2) then {
        _finalAmount = _originalAmount + _adjustmentAmount;
        missionNamespace setVariable [_option,_finalAmount,true];
        _hintText = " set to "+str _finalAmount;
        Info("SET | "+name _player+" ["+ getPlayerUID _player +"] ["+ str owner _player +"] changed "+_optionName+" from " + str _originalAmount +" to " + str _finalAmount);
    } else {
        _hintText = " " + ([localize "STR_A3A_fn_dialogs_HQGameOptions_lower", localize "STR_A3A_fn_dialogs_HQGameOptions_upper"] select _inRange) + str _originalAmount;
    };

    if (_noHints) exitWith {
        if (_inRange != 2) then {
            Warning(_hintText);
        }
     };

    private _graphic = "--------------------------------------------------";
    private _padding = _graphic;
    private _graphicLength = count _graphic;
    private _graphicSliderPos = round ((_graphicLength -1)*((_finalAmount-_lowerLimit) / (_upperLimit-_lowerLimit)));
    private _graphic = "[<t color='#705722'>"+ (_graphic select [0,_graphicSliderPos]) + "<t color='#f0d498'>@</t>" + (_graphic select [_graphicSliderPos+1,_graphicLength]) + "</t>]";
    private _lowerLimitText = str _lowerLimit;
    private _UpperLimitText = "  " + str _upperLimit;
    private _graphicLabel = _lowerLimitText + "<t color='#00000000' shadow='0'>" + (_padding select [0,_graphicLength -count _lowerLimitText -count _UpperLimitText])+ "</t>" + _UpperLimitText;

    [_hintTitle, _optionName+_hintText+"<br/>"+_graphic+"<br/>"+_graphicLabel] remoteExecCall ["A3A_fnc_customHint",_player];
};

private _fnc_valueOrDefault = {
    params [["_value", _this#1]];
    _value;
};


// ADD NEW OPTIONS HERE
switch (_option) do {
    //case "maxUnits": { [_option,_action,200,80,[_amount,10] call _fnc_valueOrDefault] call _fnc_processAction; };
    case "globalCivilianMax": { [_option,_action,150,0,[_amount,1] call _fnc_valueOrDefault] call _fnc_processAction; };
    case "distanceSPWN": {  // So close to generalising all of this away 😥, but then:
        [_option,_action,2000,600,[_amount,100] call _fnc_valueOrDefault] call _fnc_processAction;
        distanceSPWN1 = distanceSPWN * 1.3;
        distanceSPWN2 = distanceSPWN /2;
        publicVariable "distanceSPWN1";
        publicVariable "distanceSPWN2";
    };
    default {Error("INVALID METHOD | "+ name _player + " ["+(getPlayerUID _player) + "] ["+ str owner _player +"] called invalid backing method "+str _this);};
};

nil;
