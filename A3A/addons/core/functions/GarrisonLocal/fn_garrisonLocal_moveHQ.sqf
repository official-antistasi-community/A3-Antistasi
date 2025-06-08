// Garrison-local function to clear out old HQ
// Might be used while under attack, so account for that

params ["_marker", "_danger"];

private _garrison = A3A_activeGarrison get _marker;

// If anyone is in a vehicle (static weapon, later?), get them out
// Might have units occupying statics that aren't in this garrison, so we do this the daft way for now
{
    if (vehicle _x != _x) then {            // isKindOf "StaticWeapon"
        group _x leaveVehicle vehicle _x;
        moveOut _x;
    };
} forEach (_garrison get "troops");

sleep 0.1;

if (!_danger) then {
    { deleteVehicle _x } forEach (_garrison get "troops");
    { deleteGroup _x } forEach (_garrison get "groups");
} else {
    // If enemies near, just put units in group despawner & fight to the death?
    { _x setVariable ["markerX", false, true] } forEach (_garrison get "troops");
    { _x spawn A3A_fnc_groupDespawner } forEach (_garrison get "groups");
};

// Buildings should already be released on server side?

// Release statics & vehicles from marker
{
    if (!alive _x) then { continue };
    _x setVariable ["markerX", nil, true];
} forEach ((_garrison get "statics") + (_garrison get "vehicles"));

// Clear the units
_garrison set ["troops", []];
_garrison set ["groups", []];
_garrison set ["statics", []];
_garrison set ["vehicles", []];
_garrison set ["buildings", []];
