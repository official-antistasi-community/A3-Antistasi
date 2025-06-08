// Always installed on server because they fire there anyway
// Not used for statics anymore. Capture accounting on attached instead?

// Could add SeatSwitched handler and then actually check for driver occupancy. Arguable

params ["_veh"];

_veh addEventHandler ["GetIn", {
    // Handler for vehicle stealing and removal from garrisons

    params ["_veh", "_role", "_unit"];
    if (side group _unit != teamPlayer) exitWith {};		// only rebels can capture vehicles or remove them from garrisons

    if (_veh getVariable ["ownerSide", teamPlayer] != teamPlayer) then {
        [_veh, teamPlayer, true] call A3A_fnc_vehKilledOrCaptured;
    };

    // Condition should work because garrison units aren't supposed to get in non-garrison vehicles
    //if (!(_veh isKindOf "StaticWeapon") and {_veh getVariable ["markerX", ""] != _unit getVariable ["markerX", ""]}) then {
    if (_veh getVariable ["markerX", ""] != _unit getVariable ["markerX", ""]) then {
        [_veh] call A3A_fnc_garrisonServer_remVehicle;
    };
}];

_veh addEventHandler ["GetOut", {
    // Handler for adding mobile vehicles to garrisons

    params ["_veh", "_role", "_unit"];
    if (side group _unit != teamPlayer) exitWith {};		// Only care about rebels

    // If empty, add to garrison
    if (crew _veh isEqualTo []) then {
        ["", _veh] call A3A_fnc_garrisonServer_addVehicle;
    };
}];
