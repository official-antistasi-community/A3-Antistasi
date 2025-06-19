// Despawn any garrison
// Also used for removing rebel roadblocks/watchposts

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

Trace_1("Called with %1", _this);

params ["_marker", ["_toDelete", false]];

private _garrison = A3A_activeGarrison get _marker;
private _side = _garrison get "side";
A3A_activeGarrison deleteAt _marker;

// Timing arguable...
//["locationSpawned", [_marker, "RebelOutpost", false]] call EFUNC(Events,triggerEvent);

// Pretty dumb recovery logic
{
    if (_x getVariable ["incapacitated", false] and random 1 < 0.5) then { _x setDamage 1 } else { deleteVehicle _x };
} forEach (_garrison get "troops" select { alive _x });
{ deleteGroup _x } forEach (_garrison get "groups");

{ deleteVehicle _x } forEach (_garrison get "civs");
{ deleteGroup _x } forEach (_garrison get "civGroups");

{
    // Dump all attached logistics objects around the vehicle
    // garrisonable ones will join & despawn through the detached handler
    private _vehPos = getPosATL _x;
    {
        private _cargo = _x#0;      // format is [object, node]
        isNil {
            detach _cargo;
            private _rpos = _vehPos getPos [10, random 360];
            _cargo setVehiclePosition [_rpos, [], 0, "NONE"];
        };
    } forEach (_x getVariable ["Cargo", []]);           // Antistasi logistics cargo
    deleteVehicle _x;
} forEach (_garrison get "vehicles");        // state stored on server side first

if !(_marker == "Synd_HQ") then {
    { deleteVehicle _x } forEach (_garrison get "buildings");
};

{ deleteVehicle _x } forEach (_garrison getOrDefault ["mines", []]);

if ("flag" in _garrison) then { deleteVehicle (_garrison get "flag") };

// If box was stolen then flag that to server. Else delete it
// Event handlers still required in case of steal & save
if ("ammoBox" in _garrison) then {
    // Handle the cases where it wasn't looted directly
    private _ammoBox = _garrison get "ammoBox";
    if (!alive _ammoBox or (_garrison get "side" == teamPlayer) or !(_ammoBox inArea _marker)) exitWith {
        [_marker, "crate"] remoteExecCall ["A3A_fnc_garrisonServer_looted", 2];
        continue;
    };
    deleteVehicle _ammoBox;
};

// Minor sites (both enemy and rebel?) should be deleted when despawned, if cleared
// Two-stage though? Want to immediately announce destruction (from zoneCheck?)
// Move marker name to deadMinorSites on server?
// clean up cyclically in distance.sqf? No, marker might still need to exist. So trigger cleanup here

if (_toDelete) exitWith { _marker remoteExecCall ["A3A_fnc_garrisonServer_delete", 2] };
