// Choose suitable police station building & vehicle spawn in larger towns
// Used if A3A_garrison doesn't have an entry already: Usually new campaigns or compat loading

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()


private _mapInfo = missionConfigFile/"A3A"/"mapInfo"/toLower worldName;
if (!isClass _mapInfo) then {_mapInfo = configFile/"A3A"/"mapInfo"/toLower worldName};

private _policeStationTypes = getArray (_mapInfo/"policeStationTypes");
if (_policeStationTypes isEqualTo []) exitWith {
	Error("No police station types found in mapInfo for this map. No police stations will be generated");
};

{
	private _city = _x;
    if (A3A_garrisonSize get _city < 10) then { continue };                 // don't generate for small towns

    private _garrison = A3A_garrison get _city;
    if ("policeStation" in _garrison) then { continue };                    // already generated

	private _buildings = nearestTerrainObjects [markerPos _city, ["House"], 100];
	_buildings = _buildings select { typeOf _x in _policeStationTypes } select { alive _x };        // isKindOf matching would pick up abandoned buildings
	if (_buildings isEqualTo []) then {
		Info_1("No suitable buildings for police station in %1", _city);
		continue;
	};
	private _station = selectRandom _buildings;		            // or do we try to do priority order?
    _garrison set ["policeStation", getPosATL _station];         // only need one entry? Hmm. LootCD & intelCD go elsewhere.

    _station setVariable ["A3A_policeStation", _city];          // So we can detect destruction

    // Use closest city spawn place within 50m for police car
    private _places = A3A_spawnPlacesHM get (_city + "_civ") select { _x#0 == "vehicle" };
    private _placePositions = _places apply { _x#1 };
    private _nearPlaces = _placePositions inAreaArrayIndexes [getPosATL _station, 50, 50] apply { _places # _x };

    if (_nearPlaces isEqualTo []) then {
        _garrison set ["spawnPlaces", []];
        _garrison set ["vehicles", []];
        continue;
    };

    private _minDist = 1e6;
    private _minPlace = [];
    {
        private _dist = _x#1 distance2d _station;
        if (_dist < _minDist) then { _minDist = _dist; _minPlace = _x };
    } forEach _nearPlaces;

    private _carType = selectRandom (A3A_faction_occ get "vehiclesPolice");
    _garrison set ["spawnPlaces", [_minPlace]];
    _garrison set ["vehicles", [[_carType, 0]] ];

} forEach citiesX;
