// Always installed on server because they fire regardless of locality

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_veh"];

_veh addEventHandler ["Attached", {
    // Handler to take statics (& smaller vehicles?) out of garrison when attached

    params ["_attachedObj", "_parentObj", "_isReattach"];

    if (_isReattach) exitWith {};
    private _marker = _attachedObj getVariable ["markerX", ""];
    if (_marker != "") then { [_attachedObj] call A3A_fnc_garrisonServer_remVehicle };
}];

_veh addEventHandler ["Detached", {
    // Handler to put statics (& smaller vehicles?) into garrison when detached

    params ["_attachedObj", "_parentObj"];

    [_attachedObj] spawn {
        params ["_veh"];

        // Wait for the thing to settle
        waitUntil { sleep 1; vectorMagnitude velocity _veh < 0.01 };

        if (isNull _veh) exitWith {};                       // might have been deleted immediately after detaching
        if (getNumber (configOf _veh >> "hasDriver") != 0 and !(_veh inArea "Synd_HQ")) exitWith {};      // quadbikes shouldn't be auto-added
        if (!isNull attachedTo _veh) exitWith {};           // might be attached again
        isNil { ["", _veh] call A3A_fnc_garrisonServer_addVehicle };
    };
}];
