/*
Maintainer: Shoter
    Adds the local player actions to an upgrade kit crate: carry, install (the kind decides where), return at HQ.
    Also sets the label drawn while the player looks at the crate, both lines come from the kind's handler.
    Called by the server through remoteExec with a JIP id when the crate is created, so late joiners get it too.
    The crate is not a utility item, so the carry action is added here instead of A3A_fnc_initObjectRemote.

Arguments:
    <OBJECT> The crate

Return Value:
    <nil>

Scope: Clients
Environment: Any
Public: No
Dependencies: A3A_fnc_upgradeKitCall, A3A_fnc_upgradeKitAllowed, A3A_fnc_upgradeKitReturn

Example:
    [_crate] remoteExec ["A3A_fnc_upgradeKitAddActions", 0, _jipKey];
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if (!hasInterface) exitWith {};
params [["_crate", objNull, [objNull]]];
if (isNull _crate) exitWith {};

(_crate getVariable ["A3A_upgradeKit", []]) params [["_kind", ""], ["_id", ""], ["_target", ""]];
if (_kind == "") exitWith { Error_1("Upgrade kit crate %1 carries no kit data", _crate) };
private _name = [_kind, "name", [_id, _target]] call A3A_fnc_upgradeKitCall;
if (isNil "_name") exitWith {};          // unknown kind, logged

// Carry, same as utility items
_crate addAction [
    localize "STR_A3A_fn_UtilItem_initObjRem_addact_carry",
    A3A_fnc_carryItem,
    _crate, 1.5, true, true, "",
    "!(call A3A_fnc_isCarrying) and (vehicle _this == _this) and (isNull attachedTo _originalTarget)", 8
];

// Install, shown when the kind says the crate is close enough to its target. The kind does the exact checks.
_crate addAction [
    format [localize "STR_A3A_fn_upgradeKits_action_install", _name],
    {
        private _crate = _this # 0;
        [(_crate getVariable ["A3A_upgradeKit", [""]]) # 0, "installStart", [_crate]] call A3A_fnc_upgradeKitCall;
    },
    nil, 1.6, true, true, "",
    format ["(isNull attachedTo _originalTarget) and {['%1', 'canInstall', [_originalTarget]] call A3A_fnc_upgradeKitCall}", _kind], 8
];

// Return at HQ for a refund, members and the commander
_crate addAction [
    localize "STR_A3A_fn_upgradeKits_action_return",
    { [_this # 0, player] remoteExecCall ["A3A_fnc_upgradeKitReturn", 2] },
    nil, 1.4, true, true, "",
    "(isNull attachedTo _originalTarget) and {_originalTarget inArea 'Synd_HQ'} and {[_this] call A3A_fnc_upgradeKitAllowed}", 8
];

// Label drawn while looking at the crate. Local variable, every client sets its own through this JIP call.
_crate setVariable ["A3A_upgradeKitLabel", [_kind, "label", [_id, _target]] call A3A_fnc_upgradeKitCall];

// One Draw3D handler per client draws the label of the kit crate under the crosshair
if (isNil "A3A_upgradeKitLabelEH") then {
    A3A_upgradeKitLabelEH = addMissionEventHandler ["Draw3D", {
        private _crate = cursorObject;
        private _label = _crate getVariable "A3A_upgradeKitLabel";
        if (isNil "_label" or {player distance _crate > 15}) exitWith {};
        private _pos = _crate modelToWorldVisual [0, 0, ((boundingBoxReal _crate) # 1 # 2) + 0.3];
        // World gap grows with camera distance so the two lines keep the same spacing on screen
        private _gap = 0.035 * ((positionCameraToWorld [0, 0, 0]) distance _pos);
        drawIcon3D ["", [1, 1, 1, 1], _pos vectorAdd [0, 0, _gap], 0, 0, 0, _label # 0, 2, 0.04, "RobotoCondensedBold", "center"];
        drawIcon3D ["", [1, 1, 1, 1], _pos, 0, 0, 0, _label # 1, 2, 0.04, "RobotoCondensed", "center"];
    }];
};
