/*
    Author: [654wak654, Håkon]
    [Description]
        Toggles whitch turret controls the pylon associated with the button

        modified from ace pylons by: 654wak654

    Arguments:
    0. <Control> Turret button
    1. <Bool>    Switch Turret
    2. <Array>   Turret path, for if not switching (used to set icon)

    Return Value:
    <nil>

    Scope: Clients
    Environment: Any
    Public: [No]
    Dependencies:

    Example: [_button, false, _turret] call HR_GRG_fnc_PylonsTurretToggle;

    License: GNU General Public License
*/
#include "defines.inc"
FIX_LINE_NUMBERS()
params ["_ctrl", "_switch", "_turret"];

if (_switch && !(HR_GRG_Turrets isEqualTo [])) then {
    _turret = [[0], []] select ((_ctrl getVariable "HR_GRG_turret") isEqualTo [0]);

    {
        _x params ["", "_mirroredIndex", "_button"];
        if (_ctrl == _button) exitWith {
            if (_mirroredIndex == -1) then {
                private _indexOf = _forEachIndex;
                {
                    _x params ["", "_mirroredIndex", "_button"];
                    if (_mirroredIndex == _indexOf && {!ctrlEnabled _button}) exitWith {
                        [_button, false, _turret] call HR_GRG_fnc_PylonsTurretToggle;
                    };
                } forEach HR_GRG_PylonData;
            };
        };
    } forEach HR_GRG_PylonData;
    HR_GRG_UpdatePylons = true;
};
_ctrl setVariable ["HR_GRG_turret", _turret];

if (_turret isEqualTo [0]) then {
    Trace_1("Turret switched to Gunner, Ctrl: %1",_ctrl);
    _ctrl ctrlSetText GunnerIcon;
    _ctrl ctrlSetTooltip localize "STR_HR_GRG_Pylons_Gunner";
} else {
    Trace_1("Turret switched to Driver, Ctrl: %1",_ctrl);
    _ctrl ctrlSetText DriverIcon;
    _ctrl ctrlSetTooltip localize "STR_HR_GRG_Pylons_Driver";
};
