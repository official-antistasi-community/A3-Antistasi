/*
Creates random identity for the unit including face, voice and name. 
This identity may be passed to A3A_fnc_createUnit.

Arguments:
    <HASHMAP> _faction - unit faction.
    <STRING> _unitType - unit type.

Return value:
    <HASHMAP> random identity, containing the following keys with string values:
        - "face"
        - "speaker"
        - "firstName"
        - "lastName"

Scope: Any
Environment: Any
Public: Yes

Example:
    private _identity = [A3A_faction_reb, "Rifleman"] call A3A_fnc_createRandomIdentity;
*/

params ["_faction", "_unitType"];

private _typePrefix = switch (true) do {
    case ("militia_" in _unitType): { "mil" };
    case ("police" in _unitType): { "pol" };
    case ("SF" in _unitType): { "sf" };
    default { "" };
};

private _faceKey = _typePrefix + (if (_typePrefix == "") then { "faces" } else { "Faces" });
private _faces = _faction getOrDefault [_faceKey, _faction get "faces"];

private _identity = createHashMap;
_identity set ["face", selectRandom _faces];

private _voiceKey = _typePrefix + (if (_typePrefix == "") then { "voices" } else { "Voices" });
private _voices = _faction getOrDefault [_voiceKey, _faction get "voices"];
_identity set ["speaker", selectRandom _voices];

_identity set ["firstName", selectRandom (_faction get "firstNames")];
_identity set ["lastName", selectRandom (_faction get "lastNames")];
_identity;