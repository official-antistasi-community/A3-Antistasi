/*
    Author: [Håkon]
    [Description]
        Rebuilds category list from local garage pool data

    Arguments:
    0. <Control>    List control
    1. <Int>        Index of list to rebuild (same as control IDD last number)

    Return Value:
    <nil>

    Scope: Any
    Environment: Any
    Public: [No]
    Dependencies: [_ctrl, _index] call HR_GRG_fnc_reloadCategory;

    Example:

    License: APL-ND
*/
#include "defines.inc"
FIX_LINE_NUMBERS()
params ["_ctrl", "_catIndex"];
if (isNil "HR_GRG_Vehicles") exitWith {Trace("Reloading category canceled no garage data");};
Trace("Reloading category");

lbClear _ctrl;
private _selected = -1;
private _HR_GRG_SelectedVehicles = [-1,-1,""];
{
    _y params ["_displayName", "_class", "_lockedUID", "_checkedOut", "", ["_lockName", ""], "", ["_lockTime", []]];
    private _index = _ctrl lbAdd _displayName;
    _ctrl lbSetData [_index, str _x];
    _ctrl lbSetValue [_index, _x];
    _ctrl lbSetPicture [_index, cfgIcon(_class)];
    _ctrl lbSetPictureColor [_index, [1, 1, 1, 1]];
    _ctrl lbSetPictureColorSelected [_index, [0.85, 0.85, 0.55, 1]];

    private _tooltipText = "";
    if !( _checkedOut isEqualTo "" ) then {
        private _color = [1,0.1,0.1,1];
        if ( (HR_GRG_SelectedVehicles#1) isEqualTo _x ) then {
            _selected = _index;
            _color = [1,1,1,1];
        };
        _ctrl lbSetPictureRight [_index, CheckOutIcon];
        _ctrl lbSetPictureRightColor [_index, _color];
        _tooltipText = format ["%1 %2 %3", name (_checkedOut call BIS_fnc_getUnitByUID), ( localize "STR_HR_GRG_Feedback_checkedOutToolTip" ), parseText "\n"];
    };

    if !( _lockedUID isEqualTo "" ) then {
        private _color = if ( _lockedUID isEqualTo HR_GRG_PlayerUID ) then { [1,1,1,1] } else { [1,0.1,0.1,1] }; //white, red
        _ctrl lbSetPictureRight [_index, LockIcon];
        _ctrl lbSetPictureRightColor [_index, _color];
        _tooltipText = _tooltipText + ( localize "STR_HR_GRG_Feedback_LockedToolTip" )+" "+ _lockName;
        
        private _systemTime = systemTimeUTC;
        if(_lockTime isEqualTo []) then {_lockTime = _systemTime;};
        private _timeSpan = [_systemTime, _locktime] call A3A_fnc_systemTimeDurationToTimeSpan;
        _tooltipText = format [localize "STR_HR_GRG_Feedback_LockedToolTip_Ago", _tooltipText, 
            [_timeSpan, 0,0,false,2] call A3A_fnc_timeSpan_format
        ];
    };
    _ctrl lbSetTooltip [_index, _tooltipText];
    _ctrl lbSetPictureRightColorSelected [_index, [0.85,0.85,0.55,1]];

} forEach (HR_GRG_Vehicles#_catIndex);

//sort and find selected item to re-select it after the clear
lbSort _ctrl;
private _selected = -1;
for "_i" from 0 to (lbSize _ctrl) -1 do {
    if ( (HR_GRG_SelectedVehicles#1) isEqualTo (_ctrl lbValue _i) ) then {
        _selected = _i;
    };
};

_ctrl lbSetCurSel _selected;
