/*
Author: Håkon
Description:
    Verifies a single loadout data in the format setUnitLoadout expects.

Arguments: <Struct> Loadout
0. <Struct> Primary weapon array
1. <Struct> Launcher weapon array
2. <Struct> Hangun weapon array
3. <Struct> Uniform array
4. <Struct> Vest array
5. <Struct> Backpack array
6. <String> Helmet
7. <String> Facewear (empty string)
8. <Struct> Binocular "weapon" array
9. <Array>  Linked items

Return Value:
0. <Bool> Loadout valid
1. <Array> Invalid reasons

Scope: Any
Environment: Any
Public: Yes
Dependencies:

Example: _loadout call A3A_fnc_TV_verifyLoadout;

License: MIT License
*/
params [
    "_primary"
    ,"_launcher"
    ,"_handgun"
    ,"_uniform"
    ,"_vest"
    ,"_backpack"
    ,"_helmet"
    ,"_faceWear"
    ,"_binocular"
    ,"_linkedItems"
];

//=====================|
// Validator functions |
//=====================|
// Only root validator push invalidReasons to the array to prevent overflow
// Formating and logging is handled by parent function

private _invalidReasons = [];
private _validClassCaseSensitive = {
    params ["_cfg", "_class"];
    if !(_class isEqualType "") exitWith {
        _invalidReasons pushBack ("Invalid data type: "+ str _class + " | Data type: "+ typeName _class + " | Expected: String");
        false;
    };
    if !(isClass (configFile/_cfg/_class) && configName (configFile/_cfg/_class) isEqualTo _class) exitWith {
        _invalidReasons pushBack ( if (isClass (configFile/_cfg/_class)) then {
            "Bad case on classname: "+_class+", expected: "+ configName (configFile/_cfg/_class)
        } else {
            "Invalid classname: "+_class
        });
        false;
    };
    true;
};

//Weapon validators
private _validMuzzle = { //valid class and muzzle compatible with weapon
    params ["_weapon", "_muzzle"];
    if (_muzzle isEqualTo "") exitWith {true};
    if !(["CfgWeapons",_muzzle] call _validClassCaseSensitive) exitWith {false};

    private _compatibleMuzzles = (configProperties [(configFile/"CfgWeapons"/_weapon/"WeaponSlotsInfo"/"MuzzleSlot"/"compatibleItems"), "true", true]) apply {configName _x};
    if !(_muzzle in _compatibleMuzzles) exitWith {
        _invalidReasons pushBack ("Muzzle: "+_muzzle+" is incompatible with "+_weapon+" | Comaptible muzzles: "+ str _compatibleMuzzles);
        false;
    };
    true;
};
private _validRail = { //valid class and rail compatible with weapon
    params ["_weapon", "_rail"];
    if (_rail isEqualTo "") exitWith {true};
    if !(["CfgWeapons",_rail] call _validClassCaseSensitive) exitWith {false};

    private _compatibleRails = (configProperties [(configFile/"CfgWeapons"/_weapon/"WeaponSlotsInfo"/"PointerSlot"/"compatibleItems"), "true", true]) apply {configName _x};
    if !(_rail in _compatibleRails) exitWith {
        _invalidReasons pushBack ("Rail: "+_rail+" is incompatible with "+_weapon+" | Comaptible rails: "+ str _compatibleRails);
        false;
    };
    true;
};
private _validOptic = { //valid class and optic compatible with weapon
    params ["_weapon", "_optic"];
    if (_optic isEqualTo "") exitWith {true};
    if !(["CfgWeapons",_optic] call _validClassCaseSensitive) exitWith {false};

    private _compatibleOptics = (configProperties [(configFile/"CfgWeapons"/_weapon/"WeaponSlotsInfo"/"CowsSlot"/"compatibleItems"), "true", true]) apply {configName _x};
    if !(_optic in _compatibleOptics) exitWith {
        _invalidReasons pushBack ("Optic: "+_optic+" is incompatible with "+_weapon+" | Comaptible optics: "+ str _compatibleOptics);
        false;
    };
    true;
};
private _validateWeaponMagazine = { //valid class and compatible with weapon and bullet count in range of mag max
    params ["_weapon", "_magazine"];
    if (_magazine isEqualTo []) exitWith {true};

    _magazine params ["_magClass", "_bulletCount"];
    if !(["CfgMagazines", _magClass] call _validClassCaseSensitive) exitWith {false};

    private _compatibleMagazines = getArray (configFile/"CfgWeapons"/_weapon/"Magazines");
    private _maxCount = getNumber (configFile/"CfgMagazines"/_magClass/"count");

    _magClass in _compatibleMagazines && { _bulletCount <= _maxCount };
};
private _validBipod = { //valid class and optic compatible with weapon
    params ["_weapon", "_bipod"];
    if (_bipod isEqualTo "") exitWith {true};
    if !(["CfgWeapons",_bipod] call _validClassCaseSensitive) exitWith {false};

    private _compatibleBipods = (configProperties [(configFile/"CfgWeapons"/_weapon/"WeaponSlotsInfo"/"UnderBarrel"/"compatibleItems"), "true", true]) apply {configName _x};
    if !(_bipod in _compatibleBipods) exitWith {
        _invalidReasons pushBack ("Optic: "+_bipod+" is incompatible with "+_weapon+" | Comaptible optics: "+ str _compatibleOptics);
        false;
    };
    true;
};
private _validateWeapon = { // weapon and all its attachments including magazines are valid
    params [["_baseWeapon",""], "_muzzle", "_rail", "_optic", "_priMag", "_secMag", "_bipod"];
    if (_baseWeapon isEqualTo "") exitWith {true};

    ["CfgWeapons",_baseWeapon] call _validClassCaseSensitive
    && { [_baseWeapon, _muzzle] call _validMuzzle }
    && { [_baseWeapon, _rail] call _validRail }
    && { [_baseWeapon, _optic] call _validOptic }
    && { [_baseWeapon, _priMag] call _validateWeaponMagazine }
    && { [_baseWeapon, _secMag] call _validateWeaponMagazine }
    && { [_baseWeapon, _bipod] call _validBipod };
};

//container validator
_validContainerMag = { //magazines within a container is valid
    params ["_class", "_magCount", "_bulletCount"];
    private _maxCount = getNumber (configFile/"CfgMagazines"/_class/"count");
    ["CfgMagazines",_class] call _validClassCaseSensitive
    && _bulletCount <= _maxCount //we ignore mag quantity as that would be a much more complex calc for little to no gain as loadout items vary with modsett not just template
};
_validateContainerContents = { //container and its contents are valid
    private _valid = true;
    {
        if (count _x > 2) then {
            if !(_x call _validContainerMag) then {_valid = false};
        } else {
            if !(["CfgWeapons",_x#0] call _validClassCaseSensitive) then {_valid = false};
        }
    } forEach _this;
    _valid;
};

//==================|
// Validate loadout |
//==================|

//verify weapon formats
private _validPrimary = _primary call _validateWeapon;
private _validLauncher = _launcher call _validateWeapon;
private _validHandgun = _handgun call _validateWeapon;
private _validBinocular = _binocular call _validateWeapon;

//validate containers
private _validUniform = ["CfgWeapons", _uniform#0] call _validClassCaseSensitive && (_uniform#1) call _validateContainerContents;
private _validVest = ["CfgWeapons", _vest#0] call _validClassCaseSensitive && (_vest#1) call _validateContainerContents;
private _validBackpack = ["CfgVehicles", _backpack#0] call _validClassCaseSensitive && (_backpack#1) call _validateContainerContents;

//validate linked items
private _validLinkedItems = true;
{
    if (_x isEqualTo "") then {continue};

    if !(["CfgWeapons",_x] call _validClassCaseSensitive) then {
        _validLinkedItems = false;
    };
} forEach _linkedItems;

//this is unused, but lets check its empty as intended
private _validFaceWear = _faceWear isEqualTo "";

//================|
// Return results |
//================|

//return format: [<Bool> Loadout valid, <Array<String>> Invalid reasons]
[
    _validPrimary && _validLauncher && _validHandgun && _validBinocular
    && _validUniform && _validVest && _validBackpack
    && _validFaceWear && _validLinkedItems

    , _invalidReasons
];
