#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

private _airports = airportsX inAreaArray ["Synd_HQ", distanceMission, distanceMission]
    select { sidesX getVariable _x != teamPlayer } select { spawner getVariable _x != 0 };

if (_airports isEqualTo []) exitWith {false};

// Grind through the support vehicles
private _vehicles = [];
{
    private _marker = _x;
    {
        if !(_y#1 in ["vehiclesAA", "vehiclesArtillery", "vehiclesSAM"]) then {continue};
        _vehicles pushBack [_marker, _x];       // _x is vehID
    } forEach (A3A_garrison get _marker get "supportVehicles");

} forEach _airports;

if (_vehicles isEqualTo []) exitWith {false};

[1, selectRandom _vehicles];
