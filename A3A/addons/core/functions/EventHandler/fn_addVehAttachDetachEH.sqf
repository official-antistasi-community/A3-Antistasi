// Always installed on server because they fire regardless of locality

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
        if (!isNull attachedTo _veh) exitWith {};           // might be attached again
        isNil { ["", _veh] call A3A_fnc_garrisonServer_addVehicle };
    };
}];
