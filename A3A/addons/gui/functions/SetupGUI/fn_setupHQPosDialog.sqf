/*
function: A3A_GUI_fnc_setupHQPosDialog
    Handles the initialization and tab switching on the setup dialog.
    This function should only be called from setupDialog onLoad and control activation EHs.

Author: John Jordan (jaj22)

Environment: Scheduled for onLoad mode / Unscheduled for everything else unless specified

Arguments:
    <STRING> Mode, e.g. "onLoad", "switchTab"
    <ARRAY<ANY>> Array of params for the mode when applicable. Params for specific modes are documented in the modes.

Modes:
    - onload called on creation to setup dialog
    - onUnload called on deletion to handle deletion of dialog
    - mouseUp called on mouseUp event from the dialog, handles pos not allowed

Return Value:
    Nothing

*/

#include "..\..\dialogues\ids.inc"
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_mode", "_params"];

Debug_1("HQ pos dialog called with mode %1", _mode);

private _display = findDisplay A3A_IDD_SETUPHQPOSDIALOG;
private _parent = displayParent _display;

switch (_mode) do
{
    case ("onLoad"):
    {
        // Draw hatched danger zones
        private _mainMarkers = (markersX - controlsX - ["Synd_HQ"]);
        private _mrkDangerZone = [];
        {
            _mrk = createMarkerLocal [format ["dangerzone%1", count _mrkDangerZone], markerPos _x];
            _mrk setMarkerShapeLocal "ELLIPSE";
            _mrk setMarkerSizeLocal [500,500];
            _mrk setMarkerTypeLocal "hd_warning";
            _mrk setMarkerColorLocal "ColorRed";
            _mrk setMarkerBrushLocal "DiagGrid";
            _mrkDangerZone pushBack _mrk;
        } forEach _mainMarkers;
        _display setVariable ["dangerZones", _mrkDangerZone];
    };

    case ("onUnload"):
    {
        private _mrkDangerZone = _display getVariable "dangerZones";
        { deleteMarkerLocal _x } forEach _mrkDangerZone;
    };

    case ("mouseUp"):
    {
        _params params ["_mapCtrl", "_button", "_xPos", "_yPos"];
        if (_button != 0) exitWith {};          // left mouse button only

        private _posClicked = _mapCtrl posScreenToWorld [_xPos, _yPos];
        private _posInvalid = true;
        private _titleStr = localize "STR_antistasi_dialogs_hqpos_feedback_title";

        private _nearMarker = [_display getVariable "dangerZones", _posClicked] call BIS_fnc_nearestPosition;
        if (markerPos _nearMarker distance2d _posClicked < 500) exitWith {
            [_titleStr, localize "STR_antistasi_dialogs_hqpos_feedback_nearenemy"] call A3A_fnc_customHint;
        };

        if (surfaceIsWater _posClicked) exitWith {
            [_titleStr, localize "STR_antistasi_dialogs_hqpos_feedback_inwater"] call A3A_fnc_customHint;
        };

        if (_posClicked findIf { (_x < 0) || (_x > worldSize) } != -1) exitWith {
            [_titleStr, localize "STR_antistasi_dialogs_hqpos_feedback_outsidemap"] call A3A_fnc_customHint;
        };

        "Synd_HQ" setMarkerPosLocal _posClicked;
        respawnTeamPlayer setMarkerPosLocal markerPos "Synd_HQ";
    };
};
