/*
Author: Killerswin2
    Function that adds addActions for buyable items locally

Arguments:
    0.<Object> Object that we try to add actions to
    1.<String> Custom JIP key to prevent overwriting

Return Value:
    <nil>

Scope: Clients
Environment: Unscheduled
Public: No
Dependencies:

Example:
    [_object, _jipKey] remoteExec [A3A_fnc_initObjectRemote, _jipKey];
*/
#include "..\..\script_component.hpp"

params [["_object", objNull, [objNull]],["_jipKey", "", [""]]];

// If object no longer exists, clear the JIP entry
if (isNull _object) exitwith {remoteExec ["", _jipKey]};

// Wait until client init is complete so that all the subsystems (inc utilityItemHM) are ready
if (isNil "initClientDone") then {
    waitUntil {sleep 1; !isNil "initClientDone"};
};

private _flags = (A3A_utilityItemHM get typeof _object) # 4;

if ("move" in _flags) then {
    _object addAction [
        localize "STR_A3A_fn_UtilItem_initObjRem_addact_carry",
        A3A_fnc_carryItem,
        _object, 1.5, true, true, "",
        "!(call A3A_fnc_isCarrying) and (vehicle _this == _this)
            and (isNull attachedTo _originalTarget)", 8
    ];
};

if ("rotate" in _flags) then {
    _object addAction [
        localize "STR_A3A_fn_UtilItem_initObjRem_addact_rotate",
        { [_this#3] call A3A_fnc_rotateItem },
        _object, 1.5, true, true, "",
        "!(_originalTarget getVariable ['A3A_rotatingObject',false])
            and (isNull attachedTo _originalTarget)", 8
    ];
};

// loot crate object
if ("loot" in _flags && lootToCrateRadius > 0) then {
    [_object] call A3A_fnc_initLootToCrate;
};

// building placer box
if ("build" in _flags) then {
    _object addAction [
        localize "STR_A3A_fn_UtilItem_initObjRem_addact_build",
        { [_this#0, 75, _this#0] spawn A3A_fnc_buildingPlacerStart },
        nil, 1.5, true, true, "",
        "(isNull attachedTo _originalTarget)", 4
    ];
};

// building placer box with huge crap
if ("hugebuild" in _flags) then {
    if(A3A_hasACE) then 
    {
        [_object, 4] call ace_cargo_fnc_setSize;
    };
    // TODO: find a good way to calculate a new mass for these objects.
};

// packable object
if ("pack" in _flags) then {
    _object addAction [
        localize "STR_A3A_fn_UtilItem_initObjRem_addact_pack",
        { _this#0 call A3A_Logistics_fnc_packObject },
        nil, 1.5, true, true, "",
        "(isNull attachedTo _originalTarget)", 10
    ];
};

// unpackable object
if ("unpack" in _flags) then {
    _object addAction [
        localize "STR_A3A_fn_UtilItem_initObjRem_addact_unpack",
        { _this#0 call A3A_Logistics_fnc_unpackObject },
        nil, 1.5, true, true, "",
        "(isNull attachedTo _originalTarget)", 10
    ];
};

// specific to the tent
if (typeOf _object == "Land_MedicalTent_01_MTP_closed_F") then {
    _object addAction [
        localize "STR_A3A_fn_UtilItem_initObjRem_addact_open",
        { _this#0 animateSource ["Door_Hide", 1, true] },
        nil, 1.5, true, true, "",
        "true", 10
    ];
};
