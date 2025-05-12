/*  Allocates a specific spawn position on marker of a specific type

Environment: Any. Has network timing risks which should be mitigated using addTimeForIdle

Arguments:
    <STRING> Marker name
    <STRING> Type of spawn place, "vehicle", "mortar", "heli" or "plane"
    <NUMBER> Index of spawn place to reserve

Return Value:
    <ARRAY<
        <POSAGL> Central position of spawn place
        <NUMBER> Direction of spawn place 
        <ARRAY> Data to pass to freeSpawnPositions to free this spawn place
    >>
    or false if already taken
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker", "_type", "_index"];

private _varName = format ["%1_%2", _marker, tolower _type];
private _varNameUsed = _varName + "_used";
private _used = spawner getVariable [_varNameUsed, []];
if (_used) exitWith {
    Info_1("Spawn position %1 of type %2 at %3 already taken", _index, _type, _marker);
    false;
};

_used set [_index, true];
spawner setVariable [_varNameUsed, _used, true];
private _return = spawner getVariable (_varName + "_places") select _index;
_return pushBack [_varNameUsed, _index];

Debug_2("Reserved place with varname %1 and index %2", _varName, _index);
_return;