/*
    [Description]
        Return number of non-source vehicles locked by a player

    Arguments:
    0. <String> Player UID to check

    Return Value:
    <Int> Number of locked non-source vehicles

    Scope: Server
    Environment: Any
    Public: [No]
    Dependencies:

    Example: _numLocked = [_playerUID] call HR_GRG_fnc_getLockCount;

    License: APL-ND
*/

params ["_playerUID"];

private _lockCount = 0;
private _allSources = flatten HR_GRG_Sources;
{
    {
        if (_y#2 != _playerUID) then { continue };            // not locked by this player;
        if (_x in _allSources) then { continue };             // don't count sources
        _lockCount = _lockCount + 1;
    } forEach _x;                            // vehicles within category, hashmap
} forEach HR_GRG_Vehicles;                   // categories array

_lockCount;
