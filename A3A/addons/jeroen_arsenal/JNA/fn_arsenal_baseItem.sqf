/*
    Returns the class an item is stored under in the arsenal.

    Strips TFAR/ACRE radio instances, preset weapon attachments and RHS sight states,
    then maps functional variants (colour/camo versions etc.) to their representative.

    Inputs:
        0: item     "name"

    Outputs
        arsenal classname, or "" for empty input
*/

params ["_item"];
if (!(_item isEqualType "") or { _item isEqualTo "" }) exitWith { "" };

//TFAR fix
private _radioName = getText (configfile >> "CfgWeapons" >> _item >> "tf_parent");
if (_radioName isNotEqualTo "") then { _item = _radioName };

//Weapon Stack fix
if (isClass (configFile >> "CfgWeapons" >> _item)) then {
    _item = _item call bis_fnc_baseWeapon;
};

//RHS Sight Stack fix
private _sightName = getText (configfile >> "CfgWeapons" >> _item >> "rhs_optic_base");
if (_sightName isNotEqualTo "") then { _item = _sightName };

//ACRE fix
_radioName = getText (configfile >> "CfgVehicles" >> _item >> "acre_baseClass");
if (_radioName isNotEqualTo "") then { _item = _radioName };

//Functional variants
_item call A3A_fnc_itemVariantRep;
