/*
Maintainer: Caleb Serafin
    Contains the backing methods to the HQ spawn options dialogue.
    See the `// ADD NEW OPTIONS HERE //` tag for adding options.
    Cannot be called from server.
    Authenticated caller must be theBoss or an admin.

Arguments:
    <STRING> Spawn Option
    <STRING> Action

Return Value:
    <ANY> nil.

Scope: Server, Global Arguments, Global Effect
Environment: Any
Public: Yes

Example:
    [player,"maxUnits","increase"] remoteExecCall ["A3A_fnc_HQGameOptions",2];
    [player,"civPerc","decrease"] remoteExecCall ["A3A_fnc_HQGameOptions",2];
*/
params [
    ["_player",objNull,[objNull]],
    ["_option","",[""]],
    ["_action","",[""]]
];
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()

////////////////////
// Authentication //
////////////////////
private _optionLocalisationTable = [["maxUnits","distanceSPWN","civPerc"],[localize "STR_antistasi_journal_entry_header_Options_2",localize "STR_a3_modules_modulepatrolarea_f_attributes_spawndistance0",localize "STR_antistasi_journal_entry_header_Options_5"]];
private _hintTitle = localize "STR_antistasi_customHint_spawnOptions";
private _authenticate = _option in ["maxUnits","distanceSPWN","civPerc"];

if (_authenticate && {!(_player == theBoss || admin owner _player > 0 || _player == player)}) exitWith {
    [_hintTitle, localize "STR_antistasi_customHint_only_admin_or_comander_to"+(_optionLocalisationTable#1#(_optionLocalisationTable#0 find _option))] remoteExecCall ["A3A_fnc_customHint",_player];
    Error("ACCESS VIOLATION | "+ name _player + " ["+(getPlayerUID _player) + "] ["+ str owner _player +"] attempted calling restricted backing method "+str _this);
    nil;
};
if (owner _player != remoteExecutedOwner) exitWith {
    private _allPlayers = allPlayers;
    private _index = _allPlayers findIf {owner _x == remoteExecutedOwner};
    private _realPlayer = objNull;
    if (_index != -1) then {
        _realPlayer = _allPlayers#_index;
    };
    Error("HACKING | "+ name _realPlayer + " ["+(getPlayerUID _realPlayer) + "] ["+ str remoteExecutedOwner +"] attempted impersonating "+ name _player + " ["+(getPlayerUID _player) + "] ["+ str owner _player +"] while calling "+str _this);
    nil;
};

///////////////////////
// Increase/Decrease //
///////////////////////
private _processAction = {
    params["_option","_action","_upperLimit","_lowerLimit","_adjustmentAmount"];
    private _inRange = 2;   // 2 for in-range, 0 for low, 1 for high.
    private _invalid = false;

    private _originalAmount = missionNamespace getVariable [_option,0];
    private _finalAmount = _originalAmount;
    switch (_action) do {
        case "decrease": { if (_originalAmount < _lowerLimit + _adjustmentAmount) then {_inRange = 0}; _adjustmentAmount = -_adjustmentAmount; };
        case "increase": { if (_originalAmount > _upperLimit - _adjustmentAmount) then {_inRange = 1}; };
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
        _hintText = " "+localize"STR_antistasi_limit_set"+" "+str _finalAmount;
        Info("SET | "+name _player+" ["+ getPlayerUID _player +"] ["+ str owner _player +"] changed "+_optionName+" from " + str _originalAmount +" to " + str _finalAmount);
    } else {
        _hintText = " "+localize"STR_antistasi_limit_already"+" "+(["lower","upper"] select _inRange)+" limit of "+str _originalAmount;
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

//////////////////////////
// ADD NEW OPTIONS HERE //
//////////////////////////
switch (_option) do {
    case "maxUnits": { [_option,_action,200,80,10] call _processAction; };
    case "civPerc": { [_option,_action,150,0,1] call _processAction; };
    case "distanceSPWN": {  // So close to generalising all of this away 😥, but then:
        [_option,_action,2000,600,100] call _processAction;
        distanceSPWN1 = distanceSPWN * 1.3;
        distanceSPWN2 = distanceSPWN /2;
        publicVariable "distanceSPWN1";
        publicVariable "distanceSPWN2";
    };
    default {Error("INVALID METHOD | "+ name _player + " ["+(getPlayerUID _player) + "] ["+ str owner _player +"] called invalid backing method "+str _this);};
};

nil;
