/*
    Convert 3.11+ saved vehicles to garrison internal format
    Checks and replaces place indices if mismatched
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

{
    private _marker = _x;
    private _garrison = _y;
    Trace_2("Processing %1 data %2", _marker, _y get "vehicles2");

    if !("vehicles2" in _y) then { [_x, true] call A3A_fnc_buildEnemyGarrison; continue };		// failed conversion on occ/inv, just rebuild the vehicles

    private _placeStats = A3A_spawnPlaceStats get _marker;
    private _allVehicles = [];
    {
        // If there are saved spawn places then we know that the place indexes are valid
        if ("spawnPlaces" in _garrison or _x == "free") then { _allVehicles append _y; continue };

        // In theory a place type could disappear...
        private _placeType = _x;
        if !(_placeType in _placeStats) then { Error_2("Place type %1 not found in %2", _placeType, _marker); continue };

        private _places = +(A3A_spawnPlaceStats get _marker get _placeType select 0);
        {
            if (_x#1 in _places) then { _allVehicles pushBack _x; _places deleteAt (_places find _x#1); continue };
            if (_places isEqualTo []) exitWith { Error_2("No places of type %1 left in %2", _placeType, _marker) };

            // Saved place type mismatch, replace
            Info_3("Place mismatch for vehicle %1, place %2 in %3, moving", _x#0, _placeType, _marker);
            private _placeIndex = if (_placeType == "vehicle") then { _places deleteAt 0 }
                else { _places deleteAt floor random count _places };
            _x set [1, _placeIndex]; _allVehicles pushBack _x;

        } forEach _y;           // _y is the vehicle array for that place type. Guaranteed _x#1 number here

    } forEach (_garrison get "vehicles2");

    _garrison set ["vehicles", _allVehicles];
    // TODO: remove this after testing
    // _garrison deleteAt "vehicles2"
} forEach A3A_garrison;
