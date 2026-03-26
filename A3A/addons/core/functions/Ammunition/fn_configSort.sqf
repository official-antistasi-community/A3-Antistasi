params [["_fnc_filter", {true}]];


////////////////////////////////////
//  ITEM/WEAPON CLASSIFICATION   ///
////////////////////////////////////
//Ignore type 65536, we don't want Vehicle Weapons.
private _allWeaponConfigs = "
    getNumber (_x >> 'scope') == 2
    && { getNumber (_x >> 'type') != 65536
    &&  getText (_x >> 'picture') != '' }
" configClasses (configFile >> "CfgWeapons");

private _fnc_baseWeapon = {
    //--- Get manual base weapon
    private _base = gettext (_this >> "baseWeapon");
    if (isclass (configfile >> "cfgweapons" >> _base)) exitwith {_base};

    //--- Get first parent without any attachments
    private _config = _this;
    while { count (_config >> "linkedItems") != 0 } do { _config = inheritsFrom _config };
    configName _config;
};

// Filter down to unique base weapons
private _allBaseWeapons = _allWeaponConfigs apply { _x call _fnc_baseWeapon };
private _baseWeaponHM = _allBaseWeapons createHashMapFromArray [];
_allWeaponConfigs = keys _baseWeaponHM apply { configFile >> "CfgWeapons" >> _x };

//Ignore anything with type 0. They're generally vehicle magazines.
//Type 16 is generally throwables, type 256 or above normal magazines.
private _allMagazineConfigs = "
    getNumber (_x >> 'scope') == 2
    && { getNumber (_x >> 'type') > 0
    && { getText (_x >> 'picture') != '' }}
" configClasses (configFile >> "CfgMagazines");

private _allBackpackConfigs = "
    getNumber ( _x >> 'scope' ) isEqualTo 2
    && { getText ( _x >> 'vehicleClass' ) isEqualTo 'Backpacks' }
" configClasses ( configFile >> "CfgVehicles" );

private _allGlassesConfigs = "
    getNumber ( _x >> 'scope' ) isEqualTo 2
" configClasses ( configFile >> "CfgGlasses" );

private _allConfigs = _allWeaponConfigs + _allMagazineConfigs + _allBackpackConfigs + _allGlassesConfigs;

//////////////////////////////
//    Sorting Function     ///
//////////////////////////////
private ["_cfg", "_nameX", "_item", "_itemMod", "_itemType", "_categories"];           // pretty daft optimization, not likely to make much difference

while {_allConfigs isNotEqualTo []} do {
    isNil {
        private _endTime = diag_tickTime + 0.02;
        while {_allConfigs isNotEqualTo [] and diag_tickTime < _endTime} do {
 
            _cfg = _allConfigs deleteAt (count _allConfigs - 1);
            _nameX = configName _cfg;

            // If in disabledMods, remove. Don't need itemType for this so we do it first
            _itemMod = _cfg call A3A_fnc_getModOfConfigClass;
            if (_itemMod in A3A_disabledMods) then { continue };

            // Filter items by current factions/modset
            _itemType = _nameX call A3A_fnc_itemType;
            if !([_cfg, _itemMod, _itemType] call _fnc_filter) then { continue };

            _categories = [_nameX, _itemType] call A3A_fnc_equipmentClassToCategories;
            {
                //We're not returning a default value with getVariable, becuase it *must* be instantiated before now. If it isn't, we *need* it to error.
                // allweapons, allrifles are pushedback here!!!!
                (missionNamespace getVariable ("all" + _x)) pushBack _nameX;         // uniqueness should be guaranteed by base weapon filtering
            } forEach _categories;
        };
    };
};

/*
// Without the unscheduled optimization, for reference
{
    _nameX = configName _x;

    // If in disabledMods, remove. Don't need itemType for this so we do it first
    _itemMod = _x call A3A_fnc_getModOfConfigClass;
    if (_itemMod in A3A_disabledMods) then { continue };

    // Filter items by current factions/modset
    _itemType = _nameX call A3A_fnc_itemType;
    if !([_x, _itemMod, _itemType] call _fnc_filter) then { continue };

    _categories = [_nameX, _itemType] call A3A_fnc_equipmentClassToCategories;
    {
        //We're not returning a default value with getVariable, becuase it *must* be instantiated before now. If it isn't, we *need* it to error.
        // allweapons, allrifles are pushedback here!!!!
        (missionNamespace getVariable ("all" + _x)) pushBack _nameX;         // uniqueness should be guaranteed by base weapon filtering
    } forEach _categories;

} forEach _allConfigs;
*/
