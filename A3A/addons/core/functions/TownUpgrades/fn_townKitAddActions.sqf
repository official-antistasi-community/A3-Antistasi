/*
Maintainer: Shoter
    Adds the local player actions to a town upgrade kit crate: carry, install at the bound town, return at HQ.
    Also sets the label drawn while the player looks at the crate (kit name, then the bound town).
    Called by the server through remoteExec with a JIP id when the crate is created, so late joiners get it too.
    The crate is not a utility item, so the carry action is added here instead of A3A_fnc_initObjectRemote.

Arguments:
    <OBJECT> The crate

Return Value:
    <nil>

Scope: Clients
Environment: Any
Public: No
Dependencies:

Example:
    [_crate] remoteExec ["A3A_fnc_townKitAddActions", 0, _jipKey];
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if (!hasInterface) exitWith {};
params [["_crate", objNull, [objNull]]];
if (isNull _crate) exitWith {};

(_crate getVariable ["A3A_townKit", ["", ""]]) params ["_id", "_city"];
if (_id == "") exitWith { Error_1("Town kit crate %1 carries no kit data", _crate) };
private _name = localize format ["STR_A3A_fn_townUpgrades_name_%1", _id];

// Carry, same as utility items
_crate addAction [
    localize "STR_A3A_fn_UtilItem_initObjRem_addact_carry",
    A3A_fnc_carryItem,
    _crate, 1.5, true, true, "",
    "!(call A3A_fnc_isCarrying) and (vehicle _this == _this) and (isNull attachedTo _originalTarget)", 8
];

// Install at the bound town. Shown when the crate is on the ground near the town centre, the placer checks the exact radius.
_crate addAction [
    format [localize "STR_A3A_fn_townUpgrades_action_install", _name],
    { [_this # 0] spawn A3A_fnc_townKitInstallStart },
    nil, 1.6, true, true, "",
    "(isNull attachedTo _originalTarget) and {_originalTarget distance2D markerPos ((_originalTarget getVariable ['A3A_townKit', ['', '']]) # 1) < A3A_townUpgradeRadius + 150}", 8
];

// Return at HQ for a refund, commander only
_crate addAction [
    localize "STR_A3A_fn_townUpgrades_action_return",
    { [_this # 0, player] remoteExecCall ["A3A_fnc_townKitReturn", 2] },
    nil, 1.4, true, true, "",
    "(_this == theBoss) and (isNull attachedTo _originalTarget) and (_originalTarget inArea 'Synd_HQ')", 8
];

// Label drawn while looking at the crate. Local variable, every client sets its own through this JIP call.
_crate setVariable ["A3A_townKitLabel", [_name, format [localize "STR_A3A_fn_townUpgrades_kitLabelTo", _city]]];

// One Draw3D handler per client draws the label of the kit crate under the crosshair
if (isNil "A3A_townKitLabelEH") then {
    A3A_townKitLabelEH = addMissionEventHandler ["Draw3D", {
        private _crate = cursorObject;
        private _label = _crate getVariable "A3A_townKitLabel";
        if (isNil "_label" or {player distance _crate > 15}) exitWith {};
        private _pos = _crate modelToWorldVisual [0, 0, ((boundingBoxReal _crate) # 1 # 2) + 0.3];
        // World gap grows with camera distance so the two lines keep the same spacing on screen
        private _gap = 0.035 * ((positionCameraToWorld [0, 0, 0]) distance _pos);
        drawIcon3D ["", [1, 1, 1, 1], _pos vectorAdd [0, 0, _gap], 0, 0, 0, _label # 0, 2, 0.04, "RobotoCondensedBold", "center"];
        drawIcon3D ["", [1, 1, 1, 1], _pos, 0, 0, 0, _label # 1, 2, 0.04, "RobotoCondensed", "center"];
    }];
};
