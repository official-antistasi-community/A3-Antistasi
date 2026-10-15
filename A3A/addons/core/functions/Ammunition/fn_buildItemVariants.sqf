/*
    Groups functionally identical equipment into "variant groups".

    Two items are variants of each other when their configs only differ in cosmetic properties
    (models, textures, names, icons, sounds, colours...). Nothing is hardcoded per item, so new
    modsets are handled automatically. The arsenal stores and counts a group under one
    representative class, and any member can be taken from it.

    Rules per item type:
        All: full config comparison minus cosmetic properties. Only regular gear categories are
            grouped; misc items often get their function from scripts keyed by classname.
        Weapons: also the engine-resolved magazine and attachment compatibility, and for CBA
            disposable launchers the ammo of the loaded version.
        Attachments: also the calibers of the weapons they fit, and the same product by name
            (colour variants often have a model file per colour, so models can't tell).
        Clothing, glasses, NVGs: also the model, so only recolours of the same item are variants.
        Uniforms: also the armour of the uniform's soldier class.
        Switchable states (eg. RHS folding stocks, CUP 2D/3D sights): weapons or attachments pointing
            at each other through the same property, in the same slot/type, are merged too.
        Magazines: same capacity, mostly the same compatible weapons (75%), similar muzzle velocity
            (within 6%) and same ammo, where ammo ignores tracer and visual effects (smoke/chemlight colours etc).

    Magazine groups also get an unlock cascade: other groups with the same ammo, no larger
    capacity and at least one compatible weapon in common. Unlocking a group unlocks those too.

Parameters:
    0. <BOOL> Optional: Log diagnostic info about the generated groups. Default false.

Publishes:
    A3A_variantRep        <HASHMAP> lowercase classname -> representative classname. Only grouped items.
    A3A_variantMembers    <HASHMAP> representative -> array of member classnames, representative first.
Sets (server only):
    A3A_magUnlockCascade  <HASHMAP> representative magazine -> array of representative magazines.

Environment:
    Server, scheduled.
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params [["_debug", false]];

Info("Building item variant groups");
private _startTime = diag_tickTime;

// Runs _code on every element of _array in unscheduled slices.
// Longer slices during server init, when there are no players to keep responsive.
private _sliceTime = [0.02, 0.2] select (isNil "serverInitDone");
private _fnc_chunked = {
    params ["_array", "_code"];
    private _index = 0;
    private _count = count _array;
    while {_index < _count} do {
        isNil {
            private _endTime = diag_tickTime + _sliceTime;
            while {_index < _count and diag_tickTime < _endTime} do {
                (_array select _index) call _code;
                _index = _index + 1;
            };
        };
    };
};

//////////////////////////////////////
//    Cosmetic property filtering   //
//////////////////////////////////////

// Exact (lowercase) names of properties and classes that don't affect function
private _skipNames = createHashMapFromArray ([
    "model", "uniformmodel", "modelspecial", "modelspecialisproxy", "scope", "scopearsenal", "scopecurator",
    "_generalmacro", "dlc", "baseweapon", "library", "linkeditems", "gunparticles", "armory", "selectionfireanim",
    "muzzlepos", "muzzleend", "handanim", "reloadaction", "weaponpoolavailable", "namesound", "cursor", "cursoraim",
    "cursorsize", "shotpos", "shotend", "htmin", "htmax", "afmax", "mfmax", "mfact", "tbody", "cartridge",
    "cartridgepos", "cartridgevel", "linkproxy", "uniformclass", "identitytypes", "textsingular", "textplural",
    "nvgonly", "maxt", "weaponinfotype", "rmbhint", "onhovertext", "value",
    // which faces/sides can be shown with it, and reload animation timing (not reload time)
    "modelsides", "allowedfacewear", "magazinereloadswitchphase",
    // compared using engine-resolved lists instead
    "magazines", "magazinewell", "compatibleitems",
    // AI usage of fire modes. AI-only modes are skipped entirely
    "minrange", "minrangeprobab", "midrange", "midrangeprobab", "maxrange", "maxrangeprobab", "airateoffire",
    "airateoffiredistance", "aidispersioncoefx", "aidispersioncoefy", "aiburstterminable", "burstrangemax",
    "requiredoptictype", "showtoplayer",
    // casing sounds
    "bullet1", "bullet2", "bullet3", "bullet4", "bullet5", "bullet6", "bullet7", "bullet8", "bullet9", "bullet10",
    "bullet11", "bullet12"
] apply { [_x, true] });

// Backpacks are CfgVehicles classes, so they also carry irrelevant vehicle/editor properties
private _skipNamesBackpack = createHashMapFromArray ([
    "faction", "side", "vehicleclass", "crew", "typicalcargo", "transportitems", "transportmagazines",
    "transportweapons", "transportbackpacks", "mapsize"
] apply { [_x, true] });
private _skipNamesExtra = createHashMap;        // set per item type, see second stage

// Substrings of (lowercase) property and class names that don't affect function
private _skipParts = ["sound", "displayname", "description", "hiddenselection", "hiddenunderwater", "picture", "icon",
    "editor", "author", "color", "colour", "tracer", "effect", "ace_arsenal"];

private _assetExtensions = [".paa", ".p3d", ".rvmat", ".jpg", ".png", ".ogg", ".wss", ".wav", ".rtm", ".bisurf"];

private _fnc_isAIOnlyMode = { isNumber (_this >> "showToPlayer") and { getNumber (_this >> "showToPlayer") == 0 } };

private _fnc_isSkipped = {
    private _name = _this;
    _name in _skipNames or { _name in _skipNamesExtra } or { _skipParts findIf { _x in _name } != -1 };
};

// Signature part for one config entry, "" if it should be ignored. Subclass signatures are cached
// by path: inherited subclasses resolve to the class that defines them, so they're shared.
// Text values naming another weapon class (eg. RHS "switch to folded/gripped version" links,
// which point at the same-coloured counterpart) are compared as a placeholder.
private _sigCache = createHashMap;
private _fnc_entrySig = {
    params ["_entry", "_name", "_owner"];
    if (isClass _entry) exitWith {
        if (_entry call _fnc_isAIOnlyMode) exitWith { "" };
        private _path = str _entry;
        private _subSig = _sigCache get _path;
        if (isNil "_subSig") then {
            _subSig = [_entry] call _fnc_configSig;
            _sigCache set [_path, _subSig];
        };
        if (_subSig isEqualTo _emptySig) exitWith { "" };       // nothing functional, eg. a slot class with only icon settings
        _name + ":" + _subSig;
    };
    private _value = call {
        if (isText _entry) exitWith {
            private _text = getText _entry;
            if (_text != "" and { isClass (_cfgWeapons >> _text) }) exitWith { "<weapon>" };
            // Textures, models, sounds etc. are cosmetic, except the optic overlay
            private _lower = toLower _text;
            if (_name != "modeloptics" and { _assetExtensions findIf { _x in _lower } != -1 }) exitWith { nil };
            _text;
        };
        if (isNumber _entry) exitWith { getNumber _entry };
        if (isArray _entry) exitWith {
            if (_name == "modes") exitWith { getArray _entry select { !((_owner >> _x) call _fnc_isAIOnlyMode) } };
            getArray _entry;
        };
        "<none>";
    };
    if (isNil "_value") exitWith { "" };
    _name + "=" + str _value;
};

// Signature of a whole config class, recursive
private _emptySig = hashValue [];
private _fnc_configSig = {
    params ["_config"];
    private _parts = [];
    {
        private _name = toLower configName _x;
        if (_name call _fnc_isSkipped) then { continue };
        private _part = [_x, _name, _config] call _fnc_entrySig;
        if (_part != "") then { _parts pushBack _part };
    } forEach configProperties [_config, "true", true];
    _parts sort true;
    hashValue _parts;
};

// Signatures of several configs, comparable with each other only. Everything defined at or above
// the deepest class they all inherit from is shared, so only entries (re)defined below it are compared.
private _fnc_relativeSigs = {
    params ["_configs"];
    private _chains = _configs apply { configHierarchy _x };
    private _shared = 0;
    private _minLength = selectMin (_chains apply { count _x });
    while { _shared < _minLength and { private _class = _chains#0#_shared; _chains findIf { !(_x#_shared isEqualTo _class) } == -1 } } do {
        _shared = _shared + 1;
    };
    private _names = createHashMap;
    {
        private _chain = _x;
        for "_i" from _shared to (count _chain - 1) do {
            { _names set [toLower configName _x, true] } forEach configProperties [_chain#_i, "true", false];
        };
    } forEach _chains;
    private _nameList = keys _names select { !(_x call _fnc_isSkipped) };
    _nameList sort true;
    _configs apply {
        private _config = _x;
        hashValue ((_nameList apply { [_config >> _x, _x, _config] call _fnc_entrySig }) select { _x != "" });
    };
};

//////////////////////////////////////
//     Item universe & weapons      //
//////////////////////////////////////

private _cfgWeapons = configFile >> "CfgWeapons";
private _cfgMagazines = configFile >> "CfgMagazines";

// Same config scan as A3A_fnc_configSort, but without the modset filter and including scope 1 (gear
// worn by units but hidden from the editor): those still reach the arsenal through loot and old
// saves, and have to be stored under the right class too.
private _weaponClasses = "getNumber (_x >> 'scope') >= 1 and { getNumber (_x >> 'type') != 65536 and { getText (_x >> 'picture') != '' } }" configClasses _cfgWeapons;
private _baseWeapons = createHashMap;
{
    private _config = _x;
    private _base = getText (_config >> "baseWeapon");
    if !(isClass (_cfgWeapons >> _base)) then {
        while { count (_config >> "linkedItems") != 0 } do { _config = inheritsFrom _config };
        _base = configName _config;
    };
    _baseWeapons set [_base, nil];
} forEach _weaponClasses;

private _allItems = keys _baseWeapons;
_allItems append (("getNumber (_x >> 'scope') >= 1 and { getNumber (_x >> 'type') > 0 and { getText (_x >> 'picture') != '' } }" configClasses _cfgMagazines) apply { configName _x });
_allItems append (("getNumber (_x >> 'scope') >= 1 and { getText (_x >> 'vehicleClass') == 'Backpacks' }" configClasses (configFile >> "CfgVehicles")) apply { configName _x });
_allItems append (("getNumber (_x >> 'scope') >= 1 and { getText (_x >> 'picture') != '' }" configClasses (configFile >> "CfgGlasses")) apply { configName _x });

// Binoculars and designators are categorised as items, but have magazines like weapons
private _fnc_isWeapon = {
    params ["_categories"];
    "Weapons" in _categories or { _categories#0 in ["Binoculars", "LaserDesignators"] };
};
private _allWeapons = [];
[_allItems, {
    if ([_this call A3A_fnc_equipmentClassToCategories] call _fnc_isWeapon) then { _allWeapons pushBack _this };
}] call _fnc_chunked;
if (_debug) then { diag_log format ["A3A_VARTIME|universe|%1|items %2|weapons %3", diag_tickTime - _startTime, count _allItems, count _allWeapons] };

// Engine-resolved compatibility: map lowercase class -> sorted array of compatible list IDs
// Identical lists (eg. from the same rails or magazine wells) share an ID.
private _listIDs = createHashMap;
private _magCompat = createHashMap;
private _attachCompat = createHashMap;

private _listWeights = createHashMap;           // list ID -> number of weapons/muzzles with that list

// Returns the hash of the list
private _fnc_addCompatList = {
    params ["_list", "_compatHM"];
    _list = _list apply { toLower _x };
    _list sort true;
    private _hash = hashValue _list;
    if (_list isNotEqualTo [] and !(_hash in _listIDs)) then {
        private _id = count _listIDs;
        _listIDs set [_hash, _id];
        { _compatHM getOrDefaultCall [_x, {[]}, true] pushBackUnique _id } forEach _list;
    };
    private _id = _listIDs get _hash;
    if (!isNil "_id") then { _listWeights set [_id, (_listWeights getOrDefault [_id, 0]) + 1] };
    _hash;
};

// Basic ballistics of ammo, used to tell calibers apart
private _ballisticsCache = createHashMap;
private _fnc_ballistics = {
    params ["_ammo"];
    private _hash = _ballisticsCache get _ammo;
    if (isNil "_hash") then {
        private _config = configFile >> "CfgAmmo" >> _ammo;
        _hash = hashValue [getText (_config >> "simulation"), getNumber (_config >> "hit"), getNumber (_config >> "indirectHit"),
            getNumber (_config >> "indirectHitRange"), getNumber (_config >> "caliber"), getNumber (_config >> "typicalSpeed"), getNumber (_config >> "airFriction")];
        _ballisticsCache set [_ammo, _hash];
    };
    _hash;
};

// Attachments are compared by the calibers of the weapons they fit, not the exact weapons:
// weapons often list just one colour of an attachment, but a 5.56 and a 7.62 suppressor still differ
private _listCalibers = createHashMap;          // attachment list ID -> calibers (ammo ballistics) of weapons with that list
private _weaponCompatKeys = createHashMap;      // weapon -> [magazine list hash per muzzle, attachment list hash per slot]
[_allWeapons, {
    private _weapon = _this;
    private _config = _cfgWeapons >> _weapon;
    private _magHashes = getArray (_config >> "muzzles") apply {
        private _muzzle = if (_x == "this") then { _weapon } else { configName (_config >> _x) };
        [compatibleMagazines [_weapon, _muzzle], _magCompat] call _fnc_addCompatList;
    };
    // Main muzzle only, an underbarrel launcher doesn't change what fits on the rails
    private _mainMuzzle = getArray (_config >> "muzzles") param [0, "this"];
    _mainMuzzle = if (_mainMuzzle == "this") then { _weapon } else { configName (_config >> _mainMuzzle) };
    private _calibers = createHashMap;
    { _calibers set [[getText (_cfgMagazines >> _x >> "ammo")] call _fnc_ballistics, true] } forEach compatibleMagazines [_weapon, _mainMuzzle];
    private _attachHashes = ["MuzzleSlot", "CowsSlot", "PointerSlot", "UnderBarrelSlot"] apply {
        private _hash = [compatibleItems [_weapon, _x], _attachCompat] call _fnc_addCompatList;
        private _id = _listIDs get _hash;
        if (!isNil "_id") then { _listCalibers getOrDefaultCall [_id, {createHashMap}, true] merge _calibers };
        _hash;
    };
    _weaponCompatKeys set [_weapon, [_magHashes, _attachHashes]];
}] call _fnc_chunked;

private _fnc_attachmentCalibers = {
    params ["_class"];
    private _calibers = createHashMap;
    { _calibers merge (_listCalibers getOrDefault [_x, createHashMap]) } forEach (_attachCompat getOrDefault [toLower _class, []]);
    private _list = keys _calibers;
    _list sort true;
    hashValue _list;
};

// Throwables and placeables are compatible with "everything" in their weapon, not per muzzle
{
    private _weapon = _x;
    private _mags = [];
    { _mags append compatibleMagazines [_weapon, configName _x] } forEach ("true" configClasses (_cfgWeapons >> _weapon));
    [_mags, _magCompat] call _fnc_addCompatList;
} forEach ["Throw", "Put"];

if (_debug) then { diag_log format ["A3A_VARTIME|compat|%1", diag_tickTime - _startTime] };

private _fnc_compatKey = {
    params ["_class", "_compatHM"];
    private _ids = +(_compatHM getOrDefault [toLower _class, []]);
    _ids sort true;
    _ids;
};

//////////////////////////////////////
//        Item signatures           //
//////////////////////////////////////

// Armour of the soldier class behind a uniform
private _fnc_uniformSig = {
    params ["_config"];
    private _soldier = configFile >> "CfgVehicles" >> getText (_config >> "ItemInfo" >> "uniformClass");
    private _hitpoints = ("true" configClasses (_soldier >> "HitPoints")) apply {
        [toLower configName _x, getNumber (_x >> "armor"), getNumber (_x >> "passThrough"), getNumber (_x >> "explosionShielding")]
    };
    _hitpoints sort true;
    hashValue [getNumber (_soldier >> "armor"), getNumber (_soldier >> "armorStructural"),
        getNumber (_soldier >> "explosionShielding"), getNumber (_soldier >> "camouflage"), _hitpoints];
};

// Only these item categories are grouped. Misc items (medical, food, radios, terminals...) often get
// their function from scripts keyed by classname, so identical configs don't mean identical items.
private _groupedCategories = createHashMapFromArray ([
    "Rifles", "SMGs", "Shotguns", "MachineGuns", "SniperRifles", "Handguns", "GrenadeLaunchers", "RocketLaunchers", "MissileLaunchers",
    "Binoculars", "LaserDesignators", "Optics", "MuzzleAttachments", "PointerAttachments", "Bipods",
    "Uniforms", "Vests", "Headgear", "Backpacks", "Glasses", "NVGs",
    "MagBullet", "MagShotgun", "MagShell", "MagRocket", "MagMissile", "MagSmokeShell", "MagFlare", "MagLaser",
    "Grenades", "Mine", "MineBounding", "MineDirectional"
] apply { [_x, true] });

// Worn items are mostly cosmetic, so only colour/camo versions of the same model are variants
private _fnc_modelKey = {
    private _model = toLower _this;
    if (_model select [0, 1] == "\") then { _model = _model select [1] };
    if (count _model > 4 and { _model select [count _model - 4] == ".p3d" }) then { _model = _model select [0, count _model - 4] };
    _model;
};

// Ammo identity, ignoring tracers and visual effects. Ammo with the same basic ballistics is
// compared in full, which also tells which magazines of different sizes share ammo.
private _ammoFamilies = createHashMap;          // basic ballistics hash -> ammo classes
{
    private _categories = _x call A3A_fnc_equipmentClassToCategories;
    if !(_categories#0 in _groupedCategories and "Magazines" in _categories) then { continue };
    private _ammo = getText (_cfgMagazines >> _x >> "ammo");
    _ammoFamilies getOrDefaultCall [[_ammo] call _fnc_ballistics, {[]}, true] pushBackUnique _ammo;
} forEach _allItems;

private _ammoIDs = createHashMap;               // ammo class -> ID
[keys _ammoFamilies, {
    private _family = _this;
    private _ammos = _ammoFamilies get _family;
    if (count _ammos == 1) exitWith { _ammoIDs set [_ammos#0, _family] };
    private _sigs = [_ammos apply { configFile >> "CfgAmmo" >> _x }] call _fnc_relativeSigs;
    { _ammoIDs set [_x, _family + (_sigs#_forEachIndex)] } forEach _ammos;
}] call _fnc_chunked;

// Two stage grouping: a cheap bucket key first, then a full signature for items sharing a bucket
private _bucketHM = createHashMap;
private _magInfo = createHashMap;           // magazine class -> [count, ammo sig, compat key]

[_allItems, {
    private _class = _this;
    private _categories = _class call A3A_fnc_equipmentClassToCategories;
    if !(_categories#0 in _groupedCategories) exitWith {};
    private _key = call {
        if ("Magazines" in _categories) exitWith {
            private _config = _cfgMagazines >> _class;
            private _capacity = getNumber (_config >> "count");
            private _ammoID = _ammoIDs get getText (_config >> "ammo");
            private _compat = [_class, _magCompat] call _fnc_compatKey;
            _magInfo set [_class, [_capacity, _ammoID, _compat]];
            // Muzzle velocity and compatible weapons are compared in the second stage, with some tolerance
            ["mag", _capacity, _ammoID];
        };
        if ("Backpacks" in _categories) exitWith {
            private _config = configFile >> "CfgVehicles" >> _class;
            if (getText (_config >> "assembleInfo" >> "assembleTo") != "") exitWith { nil };      // static weapon & UAV bags
            ["bag", getNumber (_config >> "maximumLoad"), getNumber (_config >> "mass"), getText (_config >> "model") call _fnc_modelKey];
        };
        if ("Glasses" in _categories) exitWith {
            private _config = configFile >> "CfgGlasses" >> _class;
            ["glasses", getNumber (_config >> "mass"), getText (_config >> "model") call _fnc_modelKey];
        };
        private _config = _cfgWeapons >> _class;
        if ([_categories] call _fnc_isWeapon) exitWith {
            // CBA disposable launchers only take a placeholder magazine; the real one is on the loaded version
            private _disposableAmmo = "";
            if (!isNil "cba_disposable_normalLaunchers" and { cba_disposable_normalLaunchers isEqualType createHashMap }) then {
                private _loaded = cba_disposable_normalLaunchers get _class;
                if (!isNil "_loaded") then { _disposableAmmo = [getText (_cfgMagazines >> (_loaded#1) >> "ammo")] call _fnc_ballistics };
            };
            // No category: Antistasi derives rifle/MG/sniper from the crosshair type, which is cosmetic
            ["weapon", getNumber (_config >> "type"), _weaponCompatKeys get _class, getNumber (_config >> "WeaponSlotsInfo" >> "mass"), _disposableAmmo];
        };
        if (_categories#0 in ["Optics", "MuzzleAttachments", "PointerAttachments", "Bipods"]) exitWith {
            ["attachment", _categories#0, getNumber (_config >> "ItemInfo" >> "mass"), [_class] call _fnc_attachmentCalibers];
        };
        private _model = switch (_categories#0) do {
            case "Uniforms": { getText (configFile >> "CfgVehicles" >> getText (_config >> "ItemInfo" >> "uniformClass") >> "model") };
            case "NVGs": { getText (_config >> "model") };
            default { getText (_config >> "ItemInfo" >> "uniformModel") };
        };
        ["item", _categories#0, getNumber (_config >> "ItemInfo" >> "mass"), _model call _fnc_modelKey];
    };
    if (isNil "_key") exitWith {};
    _bucketHM getOrDefaultCall [hashValue _key, {[]}, true] pushBack _class;
}] call _fnc_chunked;

if (_debug) then { diag_log format ["A3A_VARTIME|stage1|%1|ammo families %2|buckets %3", diag_tickTime - _startTime, count _ammoFamilies, count _bucketHM] };

// Attachments: mods often configure different products identically (eg. C-More, ROS and BVO red dots), and
// colour variants usually have a model file per colour, so model files can't tell them apart either.
// Functionally identical attachments are kept together if their names say they're the same product:
// same apart from a bracketed suffix like "(Tan)", or one extends the other ("MRDS", "MRDS Coyote").
private _fnc_nameStem = {
    private _name = toLower _this;
    for "_i" from 1 to 3 do {
        private _chars = toArray _name;
        if (_chars isEqualTo [] or { !(toString [_chars select (count _chars - 1)] in [")", "]"]) }) exitWith {};
        private _open = ["(", "["] select (toString [_chars select (count _chars - 1)] == "]");
        private _cut = -1;
        for "_j" from (count _chars - 2) to 1 step -1 do { if (toString [_chars # _j] == _open) exitWith { _cut = _j } };
        if (_cut < 1) exitWith {};
        _name = (toString (_chars select [0, _cut])) trim [" ", 2];
    };
    _name;
};
private _fnc_sameProduct = {
    params ["_a", "_b"];
    _a == _b or { _b find (_a + " ") == 0 } or { _a find (_b + " ") == 0 };
};
private _fnc_sameLookGroups = {
    params ["_members"];
    private _info = _members apply {
        private _config = _cfgWeapons >> _x;
        [getText (_config >> "displayName") call _fnc_nameStem, toLower getText (_config >> "model")]
    };
    private _family = [];
    for "_i" from 0 to (count _members - 1) do { _family pushBack _i };
    for "_i" from 0 to (count _members - 1) do {
        for "_j" from (_i + 1) to (count _members - 1) do {
            (_info # _i) params ["_nameI", "_modelI"];
            (_info # _j) params ["_nameJ", "_modelJ"];
            if (_modelI != _modelJ and { !([_nameI, _nameJ] call _fnc_sameProduct) }) then { continue };
            private _from = _family # _j;
            private _to = _family # _i;
            if (_from == _to) then { continue };
            _family = _family apply { [_x, _to] select (_x == _from) };
        };
    };
    private _byFamily = createHashMap;
    { _byFamily getOrDefaultCall [_family # _forEachIndex, {[]}, true] pushBack _x } forEach _members;
    values _byFamily;
};

// Second stage: split buckets by full config signature
private _groups = [];
private _candidates = [];
private _splitBuckets = [];         // debug only
// Magazines with the same capacity and ammo: split by muzzle velocity, then by compatible weapons.
// Mods often give tracer colours slightly different speeds (eg. 880 vs 920), so speeds within 6% of the
// next slower one stay together, but subsonic doesn't. Weapons often list specific magazines, so the
// compatible weapons only need to overlap mostly (75% of weapons taking either take both).
private _fnc_compatSimilar = {
    params ["_a", "_b"];
    if (_a isEqualTo _b) exitWith { true };
    private _shared = 0;
    private _total = 0;
    { private _weight = _listWeights getOrDefault [_x, 1]; _total = _total + _weight; if (_x in _b) then { _shared = _shared + _weight } } forEach _a;
    { if !(_x in _a) then { _total = _total + (_listWeights getOrDefault [_x, 1]) } } forEach _b;
    _total > 0 and { _shared / _total >= 0.75 };
};
private _fnc_splitByCompat = {
    params ["_members"];
    private _family = [];
    for "_i" from 0 to (count _members - 1) do { _family pushBack _i };
    private _compats = _members apply { (_magInfo get _x) # 2 };
    for "_i" from 0 to (count _members - 1) do {
        for "_j" from (_i + 1) to (count _members - 1) do {
            if (_family # _i == _family # _j) then { continue };
            if !([_compats # _i, _compats # _j] call _fnc_compatSimilar) then { continue };
            private _from = _family # _j;
            private _to = _family # _i;
            _family = _family apply { [_x, _to] select (_x == _from) };
        };
    };
    private _byFamily = createHashMap;
    { _byFamily getOrDefaultCall [_family # _forEachIndex, {[]}, true] pushBack _x } forEach _members;
    { if (count _y > 1) then { _groups pushBack _y } } forEach _byFamily;
};
{
    if (count _y < 2) then { continue };
    if !(_y#0 in _magInfo) then { _candidates pushBack _y; continue };
    private _bySpeed = _y apply { [getNumber (_cfgMagazines >> _x >> "initSpeed"), _x] };
    _bySpeed sort true;
    private _group = [];
    private _lastSpeed = -1;
    {
        _x params ["_speed", "_class"];
        if (_group isNotEqualTo [] and { _speed > _lastSpeed * 1.06 }) then {
            if (count _group > 1) then { [_group] call _fnc_splitByCompat };
            _group = [];
        };
        _group pushBack _class;
        _lastSpeed = _speed;
    } forEach _bySpeed;
    if (count _group > 1) then { [_group] call _fnc_splitByCompat };
} forEach _bucketHM;

[_candidates, {
    private _members = _this;
    private _root = switch (true) do {
        case (isClass (_cfgWeapons >> _members#0)): { _cfgWeapons };
        case (isClass (configFile >> "CfgGlasses" >> _members#0)): { configFile >> "CfgGlasses" };
        default { configFile >> "CfgVehicles" };
    };
    private _skipNamesExtra = [createHashMap, _skipNamesBackpack] select (_root isEqualTo (configFile >> "CfgVehicles"));
    private _configs = _members apply { _root >> _x };
    private _sigs = [_configs] call _fnc_relativeSigs;
    {
        if (getNumber (_x >> "ItemInfo" >> "type") == 801) then { _sigs set [_forEachIndex, (_sigs#_forEachIndex) + ([_x] call _fnc_uniformSig)] };
    } forEach _configs;

    private _sigHM = createHashMap;
    { _sigHM getOrDefaultCall [_sigs#_forEachIndex, {[]}, true] pushBack _x } forEach _members;
    private _isAttachment = ((_members#0) call A3A_fnc_equipmentClassToCategories) # 0 in ["Optics", "MuzzleAttachments", "PointerAttachments", "Bipods"];      // see _fnc_sameLookGroups
    {
        if (count _y < 2) then { continue };
        if (!_isAttachment) then { _groups pushBack _y; continue };
        { if (count _x > 1) then { _groups pushBack _x } } forEach ([_y] call _fnc_sameLookGroups);
    } forEach _sigHM;
    if (_debug and count _sigHM > 1) then { _splitBuckets pushBack (values _sigHM apply { _x#0 }) };
}] call _fnc_chunked;

if (_debug) then { diag_log format ["A3A_VARTIME|stage2|%1|candidate buckets %2", diag_tickTime - _startTime, count _candidates] };

// Weapons that point at each other through the same property (eg. RHS folded/unfolded stock via
// rhs_fold, or foregrip on/off) are one weapon in two states the player can switch between in game.
// They're merged when they fit the same slot and take the same magazines.
// Same for attachments of the same type (eg. CUP 2D/3D/PIP sight versions via MRT switching).
private _stateLinks = [];
private _attachmentCategories = ["Optics", "MuzzleAttachments", "PointerAttachments", "Bipods"];
private _attachments = _allItems select { (_x call A3A_fnc_equipmentClassToCategories) # 0 in _attachmentCategories };
[_attachments, {
    private _item = _this;
    private _config = _cfgWeapons >> _item;
    private _category = (_item call A3A_fnc_equipmentClassToCategories) # 0;
    {
        private _property = configName _x;
        private _otherConfig = _cfgWeapons >> getText _x;
        if (!isClass _otherConfig or { _otherConfig isEqualTo _config }) then { continue };
        if (getText (_otherConfig >> _property) != _item) then { continue };        // case-insensitive
        if ((configName _otherConfig call A3A_fnc_equipmentClassToCategories) # 0 != _category) then { continue };
        _stateLinks pushBack [_item, configName _otherConfig];
    } forEach configProperties [_config, "isText _x", true];
}] call _fnc_chunked;
[_allWeapons, {
    private _weapon = _this;
    private _config = _cfgWeapons >> _weapon;
    private _compat = _weaponCompatKeys get _weapon;
    {
        private _property = configName _x;
        if (toLower _property == "baseweapon") then { continue };
        private _otherConfig = _cfgWeapons >> getText _x;
        if (!isClass _otherConfig or { _otherConfig isEqualTo _config }) then { continue };
        if (getText (_otherConfig >> _property) != _weapon) then { continue };        // case-insensitive
        if (getNumber (_otherConfig >> "type") != getNumber (_config >> "type")) then { continue };
        private _otherCompat = _weaponCompatKeys get configName _otherConfig;
        if (isNil "_otherCompat" or { !((_otherCompat#0) isEqualTo (_compat#0)) }) then { continue };
        _stateLinks pushBack [_weapon, configName _otherConfig];
    } forEach configProperties [_config, "isText _x", true];
}] call _fnc_chunked;

private _groupOf = createHashMap;           // lowercase class -> index in _groups
{ private _index = _forEachIndex; { _groupOf set [toLower _x, _index] } forEach _x } forEach _groups;
{
    private _indexes = _x apply {
        private _index = _groupOf get toLower _x;
        if (isNil "_index") then { _index = count _groups; _groups pushBack [_x]; _groupOf set [toLower _x, _index] };
        _index;
    };
    _indexes params ["_keep", "_merge"];
    if (_keep == _merge) then { continue };
    { _groupOf set [toLower _x, _keep] } forEach (_groups#_merge);
    (_groups#_keep) append (_groups#_merge);
    _groups set [_merge, []];
} forEach _stateLinks;
_groups = _groups select { count _x > 1 };
if (_debug) then { diag_log format ["A3A_VARTIME|state links|%1|links %2", diag_tickTime - _startTime, count _stateLinks] };

//////////////////////////////////////
//    Representatives & publishing  //
//////////////////////////////////////

// Prefer normal (scope 2) items, then the class the others inherit from, then the shortest classname, then alphabetical
private _fnc_selectRep = {
    params ["_members"];
    private _root = switch (true) do {
        case (isClass (_cfgWeapons >> _members#0)): { _cfgWeapons };
        case (isClass (_cfgMagazines >> _members#0)): { _cfgMagazines };
        case (isClass (configFile >> "CfgGlasses" >> _members#0)): { configFile >> "CfgGlasses" };
        default { configFile >> "CfgVehicles" };
    };
    private _children = createHashMapFromArray (_members apply { [toLower _x, 0] });
    {
        private _parents = configHierarchy (_root >> _x);
        _parents deleteAt (count _parents - 1);
        {
            private _parent = toLower configName _x;
            if (_parent in _children) then { _children set [_parent, (_children get _parent) + 1] };
        } forEach _parents;
    } forEach _members;
    private _scored = _members apply { [[1, 0] select (getNumber (_root >> _x >> "scope") == 2), -(_children get toLower _x), count _x, toLower _x, _x] };
    _scored sort true;
    _scored apply { _x#4 };
};

private _variantRep = createHashMap;
private _variantMembers = createHashMap;
[_groups, {
    private _members = [_this] call _fnc_selectRep;
    private _rep = _members#0;
    _variantMembers set [_rep, _members];
    { _variantRep set [toLower _x, _rep] } forEach _members;
}] call _fnc_chunked;

// Magazine unlock cascade: same ammo, capacity no larger, at least one compatible weapon in common
private _magCascade = createHashMap;
private _magsByAmmo = createHashMap;
{
    private _rep = _variantRep getOrDefault [toLower _x, _x];
    if (_rep != _x) then { continue };              // one entry per group
    _magsByAmmo getOrDefaultCall [_y#1, {[]}, true] pushBack [_x, _y#0, _y#2];
} forEach _magInfo;

{
    if (count _y < 2) then { continue };
    private _family = _y;
    {
        _x params ["_mag", "_capacity", "_compat"];
        if (_compat isEqualTo []) then { continue };
        private _lesser = [];
        {
            _x params ["_mag2", "_capacity2", "_compat2"];
            if (_mag2 == _mag or _capacity2 > _capacity) then { continue };
            if (_compat2 findIf { _x in _compat } == -1) then { continue };
            _lesser pushBack _mag2;
        } forEach _family;
        if (_lesser isNotEqualTo []) then { _magCascade set [_mag, _lesser] };
    } forEach _family;
} forEach _magsByAmmo;

A3A_variantRep = _variantRep;
A3A_variantMembers = _variantMembers;
A3A_magUnlockCascade = _magCascade;
publicVariable "A3A_variantRep";
publicVariable "A3A_variantMembers";

private _groupedCount = 0;
{ _groupedCount = _groupedCount + count _y } forEach _variantMembers;
Info_4("Built %1 variant groups containing %2 of %3 items in %4 seconds", count _variantMembers, _groupedCount, count _allItems, diag_tickTime - _startTime);

if (_debug) then {
    private _fnc_name = {
        private _class = _this;
        private _index = ["CfgWeapons", "CfgMagazines", "CfgVehicles", "CfgGlasses"] findIf { isClass (configFile >> _x >> _class) };
        if (_index == -1) exitWith { _class };
        getText (configFile >> ["CfgWeapons", "CfgMagazines", "CfgVehicles", "CfgGlasses"] # _index >> _class >> "displayName");
    };
    {
        diag_log format ["A3A_VARIANTS|%1|%2", _x, _y apply { _x call _fnc_name }];
    } forEach _variantMembers;
    { diag_log format ["A3A_CASCADE|%1|%2", _x, _y] } forEach _magCascade;

    // Per category stats
    private _stats = createHashMap;
    {
        private _cat = (_x call A3A_fnc_equipmentClassToCategories) # 0;
        private _entry = _stats getOrDefaultCall [_cat, {[0, 0, 0]}, true];
        _entry set [0, (_entry#0) + 1];
        private _rep = _variantRep get toLower _x;
        if (!isNil "_rep") then {
            _entry set [1, (_entry#1) + 1];
            if (_rep == _x) then { _entry set [2, (_entry#2) + 1] };
        };
    } forEach _allItems;
    { diag_log format ["A3A_VARSTATS|%1|items %2|grouped %3|groups %4", _x, _y#0, _y#1, _y#2] } forEach _stats;

    // Why near-identical items were split: differing properties per category
    private _fnc_configMap = {
        params ["_config", "_path", "_out"];
        {
            private _name = toLower configName _x;
            if (_name in _skipNames) then { continue };
            if (_skipParts findIf { _x in _name } != -1) then { continue };
            private _subPath = _path + "/" + _name;
            if (isClass _x) then {
                if (_x call _fnc_isAIOnlyMode) then { continue };
                [_x, _subPath, _out] call _fnc_configMap;
                continue;
            };
            _out set [_subPath, if (isText _x) then { getText _x } else { if (isNumber _x) then { getNumber _x } else { getArray _x } }];
        } forEach configProperties [_config, "true", true];
    };
    private _diffs = createHashMap;
    {
        private _maps = _x apply {
            private _class = _x;
            private _root = ["CfgWeapons", "CfgVehicles", "CfgGlasses"] select ([isClass (_cfgWeapons >> _class), isClass (configFile >> "CfgVehicles" >> _class), true] find true);
            private _map = createHashMap;
            [configFile >> _root >> _class, "", _map] call _fnc_configMap;
            _map;
        };
        private _cat = ((_x#0) call A3A_fnc_equipmentClassToCategories) # 0;
        private _allKeys = createHashMap;
        { _allKeys merge _x } forEach _maps;
        private _diffKeys = keys _allKeys select {
            private _key = _x;
            private _v0 = (_maps#0) getOrDefault [_key, "<none>"];
            _maps findIf { !((_x getOrDefault [_key, "<none>"]) isEqualTo _v0) } != -1
        };
        if (_diffKeys isEqualTo []) then { _diffKeys = ["<uniform armour or weapon reference>"] };
        { private _k = _cat + "|" + _x; _diffs set [_k, (_diffs getOrDefault [_k, 0]) + 1] } forEach _diffKeys;
        if (count _diffKeys <= 2) then { diag_log format ["A3A_VARSPLIT|%1|%2|%3", _cat, _x, _diffKeys] };
    } forEach _splitBuckets;
    private _sorted = [];
    { _sorted pushBack [_y, _x] } forEach _diffs;
    _sorted sort false;
    { diag_log format ["A3A_VARDIFF|%1|%2", _x#0, _x#1] } forEach (_sorted select [0, 150]);
};
