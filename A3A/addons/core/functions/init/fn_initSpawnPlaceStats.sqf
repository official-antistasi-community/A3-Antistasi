/*
    Generate indexes & max & par values for each place type on major markers
    Data only used on server (initGarrisons & reinf)
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_markers"];

A3A_spawnPlaceStats = createHashMap;
{
    private _marker = _x;
    private _markerStats = createHashMap;
    if (_marker in citiesX) then { A3A_spawnPlaceStats set [_x, _markerStats]; continue };

    private _spawnPlaces = A3A_spawnPlacesHM get _marker;
    private _isAirport = _marker in airportsX;
    private _garrSize = A3A_garrisonSize get _marker;
    {
        private _placeType = _x;
        private _indexes = [];
        { if (_x#0 == _placeType) then { _indexes pushBack _forEachIndex } } forEach _spawnPlaces; 
        if (count _indexes == 0) then { continue };         // don't create empty entries

        private _maxPlaces = count _indexes;
        private _parPlaces = switch (_placeType) do {
            case "staticMG": { floor (_garrSize / 8) };
            case "staticAA": { [1, 2] select _isAirport };
            case "staticMortar": { [1, 2] select _isAirport };
            case "vehicleAA": { [0, 1] select _isAirport };
            case "vehicleTruck": { 1 };
            case "vehicle": { [0, 6 min ceil (_maxPlaces / 2)] select _isAirport };
            case "heli": { ceil (_garrSize / 15) };
            case "plane": { 3 };
            case "runway": { 1 };
            case "boat": { 1 };
        };
        _markerStats set [_placeType, [_indexes, _maxPlaces, _parPlaces min _maxPlaces]];

    } forEach ["staticMG", "staticAA", "staticMortar", "vehicleAA", "vehicleTruck", "vehicle", "heli", "plane", "runway", "boat"];

    A3A_spawnPlaceStats set [_x, _markerStats];

} forEach _markers;
