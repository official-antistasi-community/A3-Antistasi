/*
Maintainer: Caleb Serafin, DoomMetal
    Handles controls on the Request Mission dialog.

Arguments:
    <STRING> Mode
    <ARRAY<ANY>> Array of params for the mode when applicable. Params for specific modes are documented in the modes.

Return Value:
    Nothing

Scope: Clients, Local Arguments, Local Effect
Environment: Scheduled for control changes / Unscheduled for update
Public: No
Dependencies:
    None

Example:
    ["missionButtonClicked", ["CON"]] call FUNC(requestMissionDialog);

License: APL-ND

*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params[["_mode",""], ["_params",[]]];

switch (_mode) do
{
    case ("missionButtonClicked"):
    {
        // Params: 1 : Mission type (AS, DES etc...)
        Trace("Request mission button clicked");

        // Check for member / commander
        if !(([player] call A3A_fnc_isMember) or (not(isPlayer theBoss))) exitWith
        {
            ["Mission Request", "Only Player Commander has access to this function."] call A3A_fnc_customHint; // TODO UI-update: Stringtable this
            closeDialog 2;
        };

        // Check param count
        if (count _params != 1) exitWith {Error("Invalid parameter count for missionButtonClicked. Got %1, expected 1", count _params)};
        private _missionType = _params select 0;

        // Check if mission type exists
        private _missionTypes = [
            "AS",
            "CONVOY",
            "DES",
            "CON",
            "LOG",
            "SUPP",
            "RES"
        ];

        if !(_missionType in _missionTypes) exitWith
        {
            Error_1("Mission type does not exist: %1", _missionType);
            closeDialog 2;
        };

        // Request mission
        [_missionType, clientOwner] remoteExec ["A3A_fnc_missionRequest", 2];

        closeDialog 1;

    };

    default
    {
        // Log error if attempting to call a mode that doesn't exist
        Error_1("Request Mission dialog mode does not exist: %1", _mode);
    };
};
