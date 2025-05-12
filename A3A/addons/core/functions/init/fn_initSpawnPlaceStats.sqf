/*
    Generate indexes & max & par values for each place type on major markers
    Data only used on server (initGarrisons & reinf)
*/

params ["_markers"];

A3A_spawnPlaceStats = createHashMap;
{
    private _marker = _x;
    private _markerStats = createHashMap;
    private _spawnPlaces = A3A_spawnPlacesHM get _marker;
    private _isAirport = _marker in airportsX;

    private _garrSize = [_marker] call A3A_fnc_garrisonSize;        // also store frontline?
    _markerStats set ["troops", [_garrSize, _garrSize]];

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
            case "vehicle": { [0, ceil (_maxPlaces / 2)] select _isAirport };
            case "heli": { ceil (_garrSize / 15) };
            case "plane": { 3 };
            case "boat": { 1 };
        };
        _markerStats set [_placeType, [_indexes, _maxPlaces, _parPlaces min _maxPlaces]];

    } forEach ["staticMG", "staticAA" "staticMortar", "vehicle", "heli", "plane", "boat"];

    A3A_spawnPlaceStats set [_x, _markerStats];

} forEach _markers;
