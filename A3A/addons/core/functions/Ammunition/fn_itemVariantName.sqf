/*
    Returns a display name for an item's variant group.

    Uses the start of the name that all variants share, eg. "Laser Designator (Sand)" and
    "Laser Designator (Khaki)" become "Laser Designator". When the names have little in common,
    uses the most common name with its bracketed part removed.

Parameters:
    0. <STRING> Item classname, any member of the group

Returns:
    <STRING> Display name

Environment:
    Any. Results are cached.
*/

params ["_class"];

if (isNil "A3A_variantNameCache") then { A3A_variantNameCache = createHashMap };

private _members = [_class] call A3A_fnc_itemVariants;
private _rep = _members # 0;
private _name = A3A_variantNameCache get _rep;
if (!isNil "_name") exitWith { _name };

private _fnc_displayName = {
    private _cfgClass = _this;
    private _root = ["CfgWeapons", "CfgMagazines", "CfgVehicles", "CfgGlasses"] findIf { isClass (configFile >> _x >> _cfgClass) };
    if (_root == -1) exitWith { _cfgClass };
    getText (configFile >> (["CfgWeapons", "CfgMagazines", "CfgVehicles", "CfgGlasses"] # _root) >> _cfgClass >> "displayName");
};

// Hidden (scope 1) classes are often unfinished, so their names only count if there's nothing else
private _visible = _members select {
    private _cfgClass = _x;
    private _root = ["CfgWeapons", "CfgMagazines", "CfgVehicles", "CfgGlasses"] findIf { isClass (configFile >> _x >> _cfgClass) };
    _root == -1 or { getNumber (configFile >> (["CfgWeapons", "CfgMagazines", "CfgVehicles", "CfgGlasses"] # _root) >> _cfgClass >> "scope") >= 2 };
};
if (_visible isNotEqualTo []) then { _members = _visible };
private _names = _members apply { _x call _fnc_displayName };
_name = _names # 0;

if (count _members > 1) then {
    // Longest common prefix of all names
    private _prefix = toArray (_names # 0);
    {
        private _chars = toArray _x;
        private _len = 0;
        while { _len < count _prefix and _len < count _chars and { _prefix # _len == _chars # _len } } do { _len = _len + 1 };
        _prefix resize _len;
    } forEach _names;

    // Cut back to a word boundary only if some name continues the last word ("G36C (Grip" stays)
    private _fnc_isWordChar = { (_this >= 48 and _this <= 57) or (_this >= 65 and _this <= 90) or (_this >= 97 and _this <= 122) or _this > 127 };
    private _length = count _prefix;
    if (_length > 0 and { (_prefix # (_length - 1)) call _fnc_isWordChar } and {
        _names findIf { private _chars = toArray _x; count _chars > _length and { (_chars # _length) call _fnc_isWordChar } } != -1
    }) then {
        while { _prefix isNotEqualTo [] and { (_prefix # (count _prefix - 1)) call _fnc_isWordChar } } do { _prefix deleteAt (count _prefix - 1) };
    };
    // Strip trailing separators like " (" or " -"
    private _separators = toArray " ([{-_/,|:";
    while { _prefix isNotEqualTo [] and { (_prefix # (count _prefix - 1)) in _separators } } do { _prefix deleteAt (count _prefix - 1) };

    // Close brackets left open, eg. "Turban (Loose, Red)" + "Turban (Loose, Blue)" -> "Turban (Loose)"
    private _closing = [];
    {
        private _char = toString [_x];
        if (_char in ["(", "[", "{"]) then { _closing pushBack (["(", "[", "{"] find _char) };
        if (_char in [")", "]", "}"] and { _closing isNotEqualTo [] }) then { _closing deleteAt (count _closing - 1) };
    } forEach _prefix;
    private _suffix = "";
    { _suffix = [")", "]", "}"] # _x + _suffix } forEach _closing;

    // Use it if it keeps most of the name. Not for magazines: their names differ in the middle (the bullet)
    private _shortest = selectMin (_names apply { count _x });
    private _isMagazine = isClass (configFile >> "CfgMagazines" >> _rep);
    if (!_isMagazine and count _prefix >= 3 and { count _prefix >= 0.6 * _shortest }) exitWith { _name = toString _prefix + _suffix };

    // Otherwise the most common name, ignoring a trailing bracketed part. eg. "Assault Pack" for a group
    // of "Assault Pack (Khaki)", "Assault Pack (Black)" and reskins under other names.
    // Ties: the shortest original name (the plain version), then the representative's
    private _stems = createHashMap;
    private _shortestName = createHashMap;
    private _repStem = "";
    {
        private _chars = toArray _x;
        private _stem = _x;
        if (_chars isNotEqualTo [] and { toString [_chars # (count _chars - 1)] in [")", "]"] }) then {
            private _open = ["(", "["] select (toString [_chars # (count _chars - 1)] == "]");
            for "_i" from (count _chars - 2) to 1 step -1 do {
                if (toString [_chars # _i] == _open) exitWith { _stem = toString (_chars select [0, _i]) };
            };
            while { _stem != "" and { _stem select [count _stem - 1] == " " } } do { _stem = _stem select [0, count _stem - 1] };
            if (_stem == "") then { _stem = _x };
        };
        _stems set [_stem, (_stems getOrDefault [_stem, 0]) + 1];
        _shortestName set [_stem, (_shortestName getOrDefault [_stem, 1e6]) min count _x];
        if (_x == _names#0) then { _repStem = _stem };
    } forEach (_names arrayIntersect _names);           // each name once, mods often duplicate classes
    private _ranked = keys _stems apply { [-(_stems get _x), _shortestName get _x, [1, 0] select (_x == _repStem), _x] };
    _ranked sort true;
    _name = _ranked # 0 # 3;
};

A3A_variantNameCache set [_rep, _name];
_name;
