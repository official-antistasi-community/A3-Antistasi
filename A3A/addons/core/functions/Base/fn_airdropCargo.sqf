params ["_plane", ["_dropObj", A3A_faction_occ get "ammobox"], ["_gear",[]], ["_spawnSmoke", true]];

// drop the fucking box
private _crate = createVehicle [_dropObj, _plane modelToWorld [0,-10,-10], [], 0, "CAN_COLLIDE"];
_crate setVelocity (velocity _plane vectorMultiply 0.5);
_crate allowDamage false;
_crate setMass 1000;            // twice normal, just to increase fall rate and land closer to target

// Add items. Might take a while, spawn to avoid fucking up the timings
[_crate, _gear] spawn A3A_fnc_setCargoItems;

[_crate, _spawnSmoke] spawn {
    params ["_crate","_spawnSmoke"];
    sleep 3;

    // parachute deploy
    private _parachute = createVehicle ["B_Parachute_02_F", getPosATL _crate, [], 0, "CAN_COLLIDE"];
    _crate attachTo [_parachute, [0, 0, 0]];

    waitUntil {sleep 1; getPosATL _crate#2 < 1};
    sleep 3;
    detach _parachute;
    deleteVehicle _parachute;
    if (_spawnSmoke) then {
        private _smoke = "SmokeShellYellow_Infinite" createVehicle getPosATL _crate;
        _crate setVariable ["A3A_smoke", _smoke];
    };
};

_crate;