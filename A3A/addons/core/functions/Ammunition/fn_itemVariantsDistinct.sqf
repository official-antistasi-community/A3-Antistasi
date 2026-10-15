/*
    Returns the variants of an item that look different, sorted by name.

    Some modsets contain several classes that can't be told apart (eg. one per faction): same name
    and model (just the name for magazines), or same model and textures under a different name.
    Those are only listed once. Hidden (scope 1) classes are left out, they're often unfinished.
    The kept class can be chosen, eg. the one being worn.

Parameters:
    0. <STRING> Item classname, any member of the group
    1. <STRING> Optional: class to keep if it has visually identical duplicates. Default "".

Returns:
    <ARRAY<STRING>> Visually distinct variant classnames

Environment:
    Any. Results are cached.
*/

params ["_class", ["_keep", ""]];

private _members = [_class] call A3A_fnc_itemVariants;
if (count _members == 1) exitWith { _members };

// Per group: [members sorted by name, index of the member each one is a duplicate of, hidden flags]
if (isNil "A3A_variantDistinctCache") then { A3A_variantDistinctCache = createHashMap };
private _cached = A3A_variantDistinctCache get (_members#0);
if (isNil "_cached") then {
    private _info = _members apply {
        private _cfgClass = _x;
        private _root = ["CfgWeapons", "CfgMagazines", "CfgVehicles", "CfgGlasses"] findIf { isClass (configFile >> _x >> _cfgClass) };
        private _config = configFile >> (["CfgWeapons", "CfgMagazines", "CfgVehicles", "CfgGlasses"] select (_root max 0)) >> _cfgClass;
        private _name = getText (_config >> "displayName");
        private _model = [toLower getText (_config >> "model"), toLower getText (_config >> "ItemInfo" >> "uniformModel")];
        private _textures = getArray (_config >> "hiddenSelectionsTextures") apply { toLower _x };
        private _uniformClass = getText (_config >> "ItemInfo" >> "uniformClass");
        if (_uniformClass != "") then {
            private _soldier = configFile >> "CfgVehicles" >> _uniformClass;
            _model pushBack toLower getText (_soldier >> "model");
            _textures = getArray (_soldier >> "hiddenSelectionsTextures") apply { toLower _x };
        };
        // Magazine models are barely visible, so for them the name alone decides
        if (_root == 1) then { _model = [] };
        [toLower _name, _name, _cfgClass, hashValue [toLower _name, _model], [hashValue [_model, _textures], ""] select (_textures isEqualTo []), getNumber (_config >> "scope") < 2];
    };
    // Visible classes first, so a hidden duplicate never stands in for a visible one
    _info = _info apply { [[0, 1] select (_x#5)] + _x };
    _info sort true;
    _info = _info apply { _x select [1] };

    private _seen = createHashMap;          // name/model or model/textures key -> index of first member
    private _dupeOf = [];
    {
        _x params ["", "", "", "_nameKey", "_textureKey"];
        private _first = _seen getOrDefault [_nameKey, _seen getOrDefault [_textureKey, _forEachIndex]];
        if !(_nameKey in _seen) then { _seen set [_nameKey, _first] };
        if (_textureKey != "" and { !(_textureKey in _seen) }) then { _seen set [_textureKey, _first] };
        _dupeOf pushBack _first;
    } forEach _info;
    private _hidden = _info apply { _x#5 };
    // Show hidden classes only if the group has nothing else
    if (_hidden findIf { !_x } == -1) then { _hidden = _hidden apply { false } };
    _cached = [_info apply { _x#2 }, _dupeOf, _hidden];
    A3A_variantDistinctCache set [_members#0, _cached];
};

_cached params ["_sorted", "_dupeOf", "_hidden"];
private _keepIndex = if (_keep isEqualTo "") then { -1 } else { _sorted findIf { _x == _keep } };
private _keepGroup = if (_keepIndex == -1) then { -1 } else { _dupeOf # _keepIndex };

private _distinct = [];
{
    if (_dupeOf # _forEachIndex != _forEachIndex) then { continue };
    if (_hidden # _forEachIndex and _forEachIndex != _keepGroup) then { continue };
    _distinct pushBack ([_x, _sorted # _keepIndex] select (_forEachIndex == _keepGroup));
} forEach _sorted;
_distinct;
