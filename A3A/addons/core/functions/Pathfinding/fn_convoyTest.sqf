if(!canSuspend) exitWith
{
  [] spawn A3A_fnc_convoyDebug;
};

if(isDedicated) exitWith {};

if(isMultiplayer && {!isServer} && {!(call BIS_fnc_admin > 0)}) exitWith
{
    ["Convoy Test", "Only server admins can execute the convoy test!"] call A3A_fnc_customHint;//no localization needed
};

markedPos = [];

["Convoy Test", "Select the spot from which the convoy will start."] call A3A_fnc_customHint;//no localization needed

if (!visibleMap) then {openMap true};
onMapSingleClick "markedPos = _pos;";

waitUntil {sleep 1; (count markedPos > 0) or (!visibleMap)};
onMapSingleClick "";

if (!visibleMap) exitWith {};

private _startPos = markedPos;
markedPos = [];

private _startMarker = createMarkerLocal ["ConvoyStart", _startPos];
_startMarker setMarkerShapeLocal "ICON";
_startMarker setMarkerTypeLocal "hd_destroy";
_startMarker setMarkerColorLocal "ColorRed";
_startMarker setMarkerTextLocal "Convoy Start";

["Convoy Test", "Select the spot to which the convoy will go."] call A3A_fnc_customHint;//no localization needed

onMapSingleClick "markedPos = _pos;";

waitUntil {sleep 1; (count markedPos > 0) or (!visibleMap)};
onMapSingleClick "";

if (!visibleMap) exitWith {deleteMarker _startMarker};

private _endPos = markedPos;
markedPos = [];

private _path = [_startPos, _endPos] call A3A_fnc_findPath;
deleteMarker _startMarker;

if(_path isEqualTo []) exitWith
{
    ["Convoy Test", "Cannot find a path between the given points!"] call A3A_fnc_customHint;//no localization needed
};

[_path, 600] call A3A_fnc_drawPath;

private _vehicles = [["B_MRAP_01_F", ["B_W_Crew_F"], []], ["B_APC_Tracked_01_rcws_F", ["B_W_Crew_F","B_W_Crew_F","B_W_Crew_F"], []]];


[69420, _vehicles, _startPos, _endPos, [], "ATTACK", WEST] spawn A3A_fnc_createConvoy;
