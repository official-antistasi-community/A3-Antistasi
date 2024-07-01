/*
Maintainer: Caleb Serafin, DoomMetal
    Event Handler for drawing High Command group markers to the maps

Arguments:
    None

Return Value:
    None

Scope: Internal
Environment: Unscheduled
Public: No
Dependencies:
    Map must be open

Example:
    _commanderMap ctrlAddEventHandler ["Draw","_this call A3A_GUI_fnc_mapDrawHcGroupsEH"];

License: APL-ND

*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_map"];

// Update HC group data
private _oldHcGroupData = _map getVariable "hcGroupData";
private _hcGroupData = [];
{
    private _groupData = [_x] call FUNC(getGroupInfo);
    _hcGroupData pushBack _groupData;
} forEach hcallGroups player; // TODO UI-update: Replace with commander?
_map setVariable ["hcGroupData", _hcGroupData];

// TODO UI-update: Move to FUNC(commanderTab)
// Update commander tab when data changes
/* if !(_oldHcGroupData isEqualTo _hcGroupData) then {
["update"] call FUNC(commanderTab);
}; */

{
    _x params [
        "_group",
        "_groupID",
        "_groupLeader",
        "_units",
        "_aliveUnits",
        "_ableToCombat",
        "_task",
        "_combatMode",
        "_hasOperativeMedic",
        "_hasAt",
        "_hasAa",
        "_hasMortar",
        "_mortarDeployed",
        "_hasStatic",
        "_staticDeployed",
        "_groupVehicle",
        "_groupIcon",
        "_groupIconColor"
    ];

    private _position = getPos leader _group;

    // Shorten group name if it's over 16 characters
    if (count _groupID > 16) then
    {
        _groupID = (_groupId select [0, 15]) + "...";
    };

    // Draw group type icon
    _map drawIcon [
        "\A3\ui_f\data\Map\Markers\NATO\" + _groupIcon, // icon type
        _groupIconColor, // colour
        _position, // position
        32, // width
        32, // height
        0, // angle
        "", // text, no text for this
        0 // shadow (outline if 2)
    ];

    // Draw size indicator
    private _size = 0;
    switch (true) do
    {
        case (_aliveUnits < 4): {_size = 0};
        case (_aliveUnits >= 4 && _aliveUnits < 8): {_size = 1};
        case (_aliveUnits >= 12 && _aliveUnits < 25): {_size = 2};
        case (_aliveUnits >= 25 && _aliveUnits < 60): {_size = 3};
        case (_aliveUnits >= 60 && _aliveUnits < 240): {_size = 4};
    };
    private _sizeIcon = "\A3\ui_f\data\Map\Markers\NATO\group_" + str _size;
    _map drawIcon [
        _sizeIcon, // icon type
        [0,0,0,1], // colour
        _position, // position
        38, // width
        38, // height
        0, // angle
        "", // text, no text for this
        0 // shadow (outline if 2)
    ];


    // Draw group name text
    _map drawIcon [
        "#(rgb,1,1,1)color(0,0,0,0)", // transparent
        _groupIconColor, // colour
        _position, // position
        32, // width
        32, // height
        0, // angle
        _groupID, // text
        2 // shadow (outline if 2)
    ];
} forEach _hcGroupData;
