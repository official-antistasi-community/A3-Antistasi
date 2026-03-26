/*
    Function to convert 3.10 saved vehicle format to new format with additional place information

*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private _allTypes = ["runway", "staticMG", "staticAA", "staticMortar", "vehicleAA", "vehicleArty", "vehicleSAM", "vehicleTruck", "vehicle", "heli", "plane", "boat"];

// Build _validVehicles from occ+inv
private _validVehicles = +(A3A_validVehicles get Occupants);
private _validInv = A3A_validVehicles get Invaders;
{ _y append (_validInv get _x) } forEach _validVehicles;
_validVehicles get "vehicleRB" append FactionGet(reb,"vehiclesLightArmed");         // because rebel roadblocks use vehicleRB

{
    private _marker = _x;
    private _garrison = _y;
    private _vehicles = _garrison get "vehicles";
    private _vehicles2 = createHashMap;
    _garrison set ["vehicles2", _vehicles2];

    // Convert free vehicles to new array format with all position info at _x#1
    private _freeVehicles = _vehicles select { _x#1 isEqualType [] };
    {
        // Temporary fix for boats being mangled in 3.10.3
        while {_x#1 isEqualType [] and {_x#1#0 isEqualType []}} do {
            _x set [2, _x#1#1]; _x set [1, _x#1#0];
        };
        _x set [1, [_x#1, _x#2]];				                // pos/dir (dir may be number or vector)
        if (count _x >= 4) then { _x#1 pushBack _x#3 };         // add in up vector, if it exists
        if (count _x == 5) then { _x set [2, _x#4]; _x resize 3 } else { _x resize 2 };		// move state & cap
    } forEach _freeVehicles;
    _vehicles2 set ["free", _freeVehicles];

    // If it's a city then just put everything else into civCar and we're done here
    if ("_civ" in _marker) then {
        _vehicles2 set ["civCar", _vehicles select { _x#1 isEqualType 0 }];
        continue;
    };

    // If the site has saved spawn places then we have all the info required
    if ("spawnPlaces" in _garrison) then {
        private _places = _garrison get "spawnPlaces";
        {
            private _cat = _places#(_x#1)#0;                 //_catTranslate getOrDefault [_cat, _cat];
            _vehicles2 getOrDefault [_cat, [], true] pushBack _x;
        } forEach (_vehicles select { _x#1 isEqualType 0 });
        continue;
    };

    private _vehPlaced = _vehicles select { _x#1 isEqualType 0 };
    if (_vehPlaced isEqualTo []) then { continue };         // HQ, camps etc

    // Should be guaranteed to exist barring changed markers
    private _spawnPlaceStats = A3A_spawnPlaceStats getOrDefault [_marker, createHashMap];
    private _placeTypes = _allTypes select { _x in _spawnPlaceStats };

    // special case for transport planes
    if ("runway" in _placeTypes) then {
        private _transportPlanes = A3A_faction_all get "vehiclesPlanesTransport";
        private _transportIndex = _vehPlaced findIf { _x#0 in _transportPlanes };
        if (_transportIndex == -1) exitWith {};
        _vehicles2 set ["runway", [_vehPlaced deleteAt _transportIndex]];
        _placeTypes = _placeTypes - ["runway"];          // otherwise we'll add a normal plane below
    };

    // Find suitable place for everything else
    {
        private _placeType = _x;
        private _validTypes = _validVehicles get _x;
        {
            private _index = _vehPlaced findIf { _x#0 in _validTypes };
            if (_index == -1) exitWith {};                              // no vehicles left, move to next place type
            private _vehEntry = _vehPlaced deleteAt _index;
            _vehEntry set [1, -1];                                      // let convertVehiclesToInternal sort out the place number
            _vehicles2 getOrDefault [_placeType, [], true] pushBack _vehEntry;
        } forEach (_spawnPlaceStats get _placeType select 0);           // make sure we don't exceed place count (eg. for vehicleTruck)
    } forEach _placeTypes;                                              // Type ordering matters because we want to select for vehicleAA & vehicleTruck before vehicle

    // Then report & discard whatever we have left
    if (count _vehPlaced > 0) then { Info_2("Couldn't find places at %1 for %2", _marker, _vehPlaced) };

    // If it's enemy and >1 then just rebuild garrison (later)
    if (count _vehPlaced > 1 and sidesX getVariable _marker != teamPlayer) then { _garrison deleteAt "vehicles2" };

} forEach A3A_garrison;

Trace("Convert310Vehicles complete");
