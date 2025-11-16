
// Should only be called for types that exist in A3A_markerPrefixHM, airport/outpost/resource/factory/seaport

params ["_marker"];

private _markerSplit = _marker splitString "_";
private _markerPrefix = A3A_markerPrefixHM get (_markerSplit select 0);
if (count _markerSplit == 1) exitWith { _markerPrefix };
format ["%1%2_", _markerPrefix, _markerSplit select 1];
