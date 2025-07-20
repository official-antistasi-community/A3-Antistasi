/*
Maintainer: Tiny
    Figures out the details of an artillery shell, detecting type and certain attributes

Arguments:
    <STR> CfgMagazines entry

Return Value:
    <NUM> Intended magazine round count
    <STR> Basic shell name, one of "Explosive", "Smoke, "Illum", "Unknown". Not 100% accurate, used for internal categorization
    <STR> Config shell basic name, can be anything depending on mod
    <STR> Config shell long name, can be anything depending on mod
    <ARR> Shell details
    HE Shells:
        <NUM> Indirect hit range (meters)
        <NUM> Indirect hit power (relative)
    Smoke Shells
        <NUM> Lifetime for smoke dispensing on ground
    Flare Shells
        <NUM> Lifetime for flare burn on ground
        <NUM> Intensity for flare shells

Scope: Any, No Effect
Environment: Any
Public: Yes

Example:
    ["8Rnd_82mm_Mo_shells"] call A3A_fnc_detectShellType;
*/

params ["_cfgMagEntry"];

// Need actual ammo entry  

private _ammoCfg = getText (configFile >> "CfgMagazines" >> _cfgMagEntry >> "ammo");
private _cfgAmmoEntry = configName (configFile >> "CfgAmmo" >> _ammoCfg);




private _timeToLive = getNumber (_cfgAmmoEntry >> "timeToLive");
private _intensity = getNumber (_cfgAmmoEntry >> "intensity");

private _intensity = getNumber (_cfgAmmoEntry >> "intensity");
private _timeToLive = getNumber (_cfgAmmoEntry >> "timeToLive");
private _hitRange = getNumber (_cfgAmmoEntry >> "indirectHitRange");
private _hitPower = getNumber (_cfgAmmoEntry >> "indirectHit");
private _submunition = if (isText (_cfgAmmoEntry >> "submunitionAmmo")) then { // some rounds can have randomized submunitions
    getText (_cfgAmmoEntry >> "submunitionAmmo")
} else {
    (getArray (_cfgAmmoEntry >> "submunitionAmmo"))#0#0
};

_roundOverrides = createHashMapFromArray [ // Your own categorizations for rounds that mod authors cant fix properly
    //["Sh_82mm_AMOS_guided",["explosive", [details]]],
    []
];
private _hasMagOverride = (_cfgMagEntry in _roundOverrides);
private _hasAmmoOverride = (_cfgAmmoEntry in _roundOverrides);
private _roundDetails = [];
private _roundType = if (_hasMagOverride || hasAmmoOverride) then {
    private _overrideEntry = if (_hasMagOverride) then {
        _roundOverrides get _cfgMagEntry;
    } else {
        _roundOverrides get _cfgAmmoEntry;
    };
    _roundDetails = _overrideEntry#1;
    _overrideEntry#0;
} else {
    switch (true) do { // AUTODETECTION?
        case (_intensity > 0): { 
            _roundDetails = [_timeToLive, _intensity];
            "illum"
        };
        case ("smoke" in _submunition): {
            _roundDetails = [_intensity];
            "smoke"
        }; 
        case ((_hitPower > 0) && {_hitRange > 0}): {
            _roundDetails = [_hitRange, _hitPower];
            "explosive"
        };
        default { "Unknown" };
    };
};

private _roundCfgNameShort = getText (configFile >> "CfgMagazines" >> _cfgMagEntry >> "displayNameShort");
private _roundCfgNameLong = getText (configFile >> "CfgMagazines" >> _cfgMagEntry >> "displayName");
private _roundCount = getNumber (_configFile >> "CfgMagazines" >> _cfgMagEntry >> "count");

[_roundCount, _roundType, _roundCfgNameShort, roundCfgNameLong, _roundDetails];



params ["_cfgMagEntry"];

// Need actual ammo entry  

private _ammoCfg = getText (configFile >> "CfgMagazines" >> _cfgMagEntry >> "ammo");
private _cfgAmmoEntry = configName (configFile >> "CfgAmmo" >> _ammoCfg);
private _simType = getText (configFile >> "CfgAmmo" >> _ammoCfg >> "simulation")
private _roundCfgNameShort = getText (configFile >> "CfgMagazines" >> _cfgMagEntry >> "displayNameShort");
private _roundCfgNameLong = getText (configFile >> "CfgMagazines" >> _cfgMagEntry >> "displayName");
private _roundCount = getNumber (configFile >> "CfgMagazines" >> _cfgMagEntry >> "count");

switch (_simType)