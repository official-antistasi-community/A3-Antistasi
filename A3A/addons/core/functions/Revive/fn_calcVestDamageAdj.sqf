/*
    Calculate vest damage adjustment for low-armoured body hits

    Reads _unit and _hitpoint as local vars from caller
    Used with getDefaultOrCall so can't use exitWith
*/

#define NEWMIN 10       // new body armour baseline (original is 2)
#define UNCHANGED 16    // vest armor level where damage is unchanged
#define SCALEFACT ((NEWMIN-2) / UNCHANGED)

// vestpart hashmap version
//diag_log format ["calcVestDamageAdj called with unit %1, vest %2, part %3", _unit, vest _unit, _hitpoint];
if (vest _unit == "") then {2 / NEWMIN} else {
    private _configs = "_hitpoint == getText (_x >> 'hitpointName')" configClasses (configfile >> "CfgWeapons" >> vest _unit >> "ItemInfo" >> "HitpointsProtectionInfo");
    if (_configs isEqualTo []) exitWith {2 / NEWMIN};
	private _armour = getNumber (_configs#0 >> "Armor");
    if (_armour >= UNCHANGED) exitWith {1};
	(2 + _armour) / (NEWMIN + SCALEFACT*_armour);
};

// three cases then...
// 1. no vest => 2/NEWMIN adj
// 2. 18+ total => 1
// 3. oldarmor (2 + armor) / newarmor (NEWMIN + (UNCHANGED - NEWMIN) / (UNCHANGED - 2)


/*
// vest hashmap -> part hashmap version
if (vest _unit == "") exitWith { ["spine1","spine2","spine3"] createHashMapFromArray [0.2,0.2,0.2] };
private _output = createHashMap;
private _config = configfile >> "CfgWeapons" >> vest _unit >> "ItemInfo" >> "HitpointsProtectionInfo";
{	
    _x params ["_hitpoint", "_hitpart"];
    private _adj = call {
        if !(isClass (_config >> _hitpoint)) exitWith {0.2};
        private _armour = getNumber (_config >> _hitpoint >> "Armor");
        (2 + _armour) / (10 + _armour/2);
    };
    _output set [_hitpart, _adj];
} forEach [["Chest","spine1"], ["Diaphragm","spine2"], ["Abdomen","spine3"]];
_output;
*/