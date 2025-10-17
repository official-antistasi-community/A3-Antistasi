/*
    Handles the little box that pops up when you're asked to copy a user's ID

Environment: Scheduled

Arguments:
    <STRING> Mode, e.g. "onLoad"
    <ARRAY<ANY>> Array of params for the mode when applicable. None used here.

Return Value:
    Nothing

*/

#include "..\..\dialogues\ids.inc"
#include "..\..\dialogues\defines.hpp"
#include "..\..\dialogues\textures.inc"
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_mode", "_params"];

Debug_1("Admin UID Copy dialog called with mode %1", _mode);

private _display = findDisplay A3A_IDD_ADMINCOPY;
private _editBox = _display displayCtrl A3A_IDC_ADMINCOPY_UIDTEXT;

switch (_mode) do
{
    case ("onLoad"):
    {
        _playerUID = player getVariable ["lastViewedUID", "No Player Selected"];
        _editBox ctrlSetText _playerUID;
    };
};
