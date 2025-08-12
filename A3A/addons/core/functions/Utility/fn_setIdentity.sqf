/*
Set face, voice, pitch and name of unit. Global effect and JIP-safe.

Scope: Any
Environment: Any
Public: No, should be called once for every unit by A3A_fnc_createUnit. 
    Quick successive calls to this function for the same unit may apply changes out of order.

Arguments:
    <OBJECT> _unit - unit to set identity for.
    <HASHMAP> _identity - identity parameters, see _identity parameter of A3A_fnc_createUnit.

Return value: <NIL>
*/

params ["_unit", "_identity"];

if (isNull _unit) exitWith {};
private _JIPID = "identity_" + netId _unit;
[_JIPID, _unit, _identity] remoteExec ["A3A_fnc_setIdentityLocal", 0, _JIPID];

// This won't be 100% reliable because it's only installed locally, but it'll avoid remoteExec spam on connection
_unit addEventHandler ["Deleted", {
    remoteExec ["", "identity_" + netId _unit];
}];
