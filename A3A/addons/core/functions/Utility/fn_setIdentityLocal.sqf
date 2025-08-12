/*
Sets specified identity of unit locally. Clears JIP if unit no longer present

Scope: Any
Environment: Any
Public: No, should only be called by setIdentity

Arguments:
    <STRING> JIP ID of operation
    <HASHMAP> _identity - identity parameters, see _identity parameter of A3A_fnc_createUnit.
*/

params ["_JIPID", "_unit", "_identity"];

// isRemoteExecutedJIP is not trustworthy from HC->client, so just do it anyway
if (isNull _unit) exitWith { remoteExec ["", _JIPID] };

private _face = _identity get "face";
if !(isNil "_face") then { _unit setFace _face };

private _speaker = _identity get "speaker";
if !(isNil "_speaker") then { _unit setSpeaker _speaker };

private _pitch = _identity get "pitch";
if !(isNil "_pitch") then { _unit setPitch _pitch };

private _firstName = _identity getOrDefault ["firstName", ""];
private _lastName = _identity getOrDefault ["lastName", ""];
if (_firstName != "" || _lastName != "") then {
    private _fullName = [_firstName, _lastName] select { _x != "" } joinString " ";
    _unit setName [_fullName, _firstName, _lastName];
    if (isServer and {!isNil "ace_common_fnc_setName"}) then {
        // Updates the name displayed in ACE Medical, dogtags, name tags and other ACE features
        // Runs global setVariable so only needs executing once
        _unit call ace_common_fnc_setName;
    };
};

