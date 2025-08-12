/*  Handles the cleanup of dead units, vehicles and temporary objects

Environment: Server, scheduled or unscheduled
Arguments:
    <Object> Object to be cleaned up
    <Bool> True to add to the start of the queue (optional, default false)

Return Value: none
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_victim", ["_addToStart", false]];

if (!isServer) exitWith { ServerError("Function must be called on server") };
if (isNull _victim) exitWith {};

if (_victim isKindOf "CAManBase") then {
    private _group = group _victim;
    if (isNull _group or isGroupDeletedWhenEmpty _group) exitWith {};     // tested, global argument works
    [_group, true] remoteExecCall ["deleteGroupWhenEmpty", groupOwner _group];
} else {
    if !(_victim in staticsToSave) exitWith {};
    Debug_1("Removing %1 from statics list", _victim);
    staticsToSave = staticsToSave - [_victim];
    publicVariable "staticsToSave";
};

Debug_1("Adding %1 to postmortem garbage cleaning", _victim);

if (_addToStart) then {
    _victim setVariable ["A3A_gcTime", 0];
    A3A_gcQueue insert [0, [_victim]];
} else {
    _victim setVariable ["A3A_gcTime", time + A3A_gcCleanTime];
    A3A_gcQueue pushBack _victim;
};
