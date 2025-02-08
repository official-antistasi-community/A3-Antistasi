/*  Handles cleaning up objects added to postmortem list
Maintainer: John Jordan

Environment: Server, scheduled
Arguments: none
Return Value: none
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private _fnc_delete = {
    if (_this isKindOf "CAManBase" and !isNull objectParent _this) then {
        // Otherwise vehicle seats may remain blocked
        [objectParent _this, _this] remoteExec ["deleteVehicleCrew", _this];
    } else {
        deleteVehicle _this;
    };
};

while {true} do
{
    sleep 60;

    private _players = allPlayers - (entities "HeadlessClient_F");		// could filter with AFK...
    private _lastIndex = count A3A_gcQueue - 1;
    private _bumpTime = time + A3A_gcCleanTime / 3;
    private _bumpList = [];
    private _curIndex = -1;
    while { _curIndex < _lastIndex } do
    {
        _curIndex = _curIndex + 1;
        private _object = A3A_gcQueue # _curIndex;
        if (isNull _object) then { continue };		// already deleted elsewhere
        if (_object getVariable ["stopPostmortem", false]) then { continue };		// removed from GC

        // If we're at the limit, delete regardless of time or proximity
        if (_lastIndex - _curIndex + count _bumpList >= A3A_gcMaxObjects) then { _object call _fnc_delete; continue };

        // If this object has a higher expiry time then we're done
        if (time < _object getVariable ["A3A_gcTime", 0]) exitWith {};

        // If there are no players nearby then delete
        if (_players inAreaArray [getPosATL _object, 100, 100] isEqualTo []) then { _object call _fnc_delete; continue };

        // If the object has been bumped too many times, delete it
        private _bumps = _object getVariable ["A3A_gcBumps", 0];
        if (_bumps >= A3A_gcMaxBumps) then { _object call _fnc_delete; continue };

        // Otherwise re-add it to the queue
        _object setVariable ["A3A_gcBumps", _bumps+1];
        _object setVariable ["A3A_gcTime", _bumpTime];
        _bumpList pushBack _object;
    };

    Debug_3("Queue size %1, processed %2 items, bumped %3", _lastIndex+1, _curIndex, count _bumpList);

    // Clear out the processed entries
    A3A_gcQueue deleteRange [0, _curIndex];
    if (_bumpList isEqualTo []) then { continue };		// nothing more to do if no objects got bumped

    // Insert bump list into correct position
    private _bumpIndex = -1;
    _lastIndex = count A3A_gcQueue - 1;
    while { _bumpIndex < _lastIndex } do
    {
        _bumpIndex = _bumpIndex + 1;
        if ((A3A_gcQueue # _bumpIndex) getVariable ["A3A_gcTime", 0] < _bumpTime) exitWith {};
    };
    A3A_gcQueue insert [_bumpIndex, _bumpList];
};
