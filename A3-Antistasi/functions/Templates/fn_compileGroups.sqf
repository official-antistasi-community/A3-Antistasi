/*
Author: Håkon
Description:
    Adds the group definitions hashmap to the faction data hashmap under "groups"

    note this is only the name of the data for unit creation, not the actuall unit data.
    as all factions group data is generated with this file some groups do not have coresponding loadout data.

Arguments:
0. <Hashmap> Faction data hashmap
1. <String>  Faction prefix

Return Value: nil

Scope: Server,Server/HC,Clients,Any
Environment: Scheduled/unscheduled/Any
Public: Yes/No
Dependencies:

Example:

License: MIT License
*/
params ["_faction", "_prefix"];

//Defines
#define unit(SECTION, TYPE) ("loadouts_"+_prefix+"_"+ #SECTION +"_"+ TYPE)
#define double(X) [X, X]
#define SaveGroupData _faction set ["groups", _groups]; nil;

//===========================|
// Define group compositions |
//===========================|
private _groups = createHashmap;

//---------------|
// AI Group data |
//---------------|
if (_prefix in ["occ", "inv"]) exitWith {

//singular units
_groups set ["grunt", unit(military, "Rifleman")];
_groups set ["bodyGuard", unit(military, "Rifleman")];
_groups set ["marksman", unit(military, "Marksman")];
_groups set ["staticCrew", unit(military, "Rifleman")];

_groups set ["official", unit(other, "Official")];
_groups set ["traitor", unit(other, "Traitor")];
_groups set ["crew", unit(other, "Crew")];
_groups set ["unarmed", unit(other, "Unarmed")];
_groups set ["pilot", unit(other, "Pilot")];

_groups set ["militia_Rifleman", unit(militia, "Rifleman")];
_groups set ["militia_Marksman", unit(militia, "Marksman")];

_groups set ["police_Officer", unit(police, "SquadLeader")];
_groups set ["police_Grunt", unit(police, "Standard")];

//military
_groups set ["sentry", [unit(military, "Grenadier"), unit(military, "Rifleman")]];
_groups set ["sniper", [unit(military, "Sniper"), unit(military, "Rifleman")]];
_groups set ["pilots", double( _groups get "pilot" )];
_groups set ["small", [_groups get "sentry", _groups get "sniper"]];
_groups set ["AA", [unit(military, "SquadLeader"), unit(military, "AA"), unit(military, "AA"), unit(military, "Rifleman")]];
_groups set ["AT", [unit(military, "SquadLeader"), unit(military, "AT"), unit(military, "AT"), unit(military, "Rifleman")]];
_groups set ["medium", [
    [unit(military, "SquadLeader"), unit(military, "MachineGunner"), unit(military, "Grenadier"), unit(military, "LAT")]
    , _groups get "AA", _groups get "AT"
]];

//old randomised behaviour maintained because... reasons
private _squads = [];
for "_i" from 1 to 5 do {
    _squads pushBack [
        unit(military, "SquadLeader"),
        selectRandomWeighted [unit(military, "LAT"), 2, unit(military, "MachineGunner"), 1],
        selectRandomWeighted [unit(military, "Rifleman"), 2, unit(military, "Grenadier"), 1],
        selectRandomWeighted [unit(military, "MachineGunner"), 2, unit(military, "Marksman"), 1],
        selectRandomWeighted [unit(military, "Rifleman"), 4, unit(military, "AT"), 1],
        selectRandomWeighted [unit(military, "AA"), 1, unit(military, "Engineer"), 4],
        unit(military, "Rifleman"),
        unit(military, "Medic")
    ];
};
_groups set ["squads", _squads];
_groups set ["squad", _squads#0];

//specops
_groups set ["specOps", [
    unit(SF, "SquadLeader")
    , unit(SF, "Rifleman")
    , unit(SF, "MachineGunner")
    , unit(SF, "ExplosivesExpert")
    , unit(SF, "LAT")
    , unit(SF, "Medic")
]];

//militia
_groups set ["militia_Small", [
    [unit(militia, "Grenadier"), unit(militia, "Rifleman")]
    , [unit(militia, "Marksman"), unit(militia, "Rifleman")]
    , [unit(militia, "Marksman"), unit(militia, "Grenadier")]
]];

private _militiaMid = [];
for "_i" from 1 to 6 do {
    _militiaMid pushBack [
        unit(militia, "SquadLeader"),
        unit(militia, "Grenadier"),
        unit(militia, "MachineGunner"),
        selectRandom [
            unit(militia, "LAT"),
            unit(militia, "Marksman"),
            unit(militia, "Engineer")
        ]
    ];
};
_groups set ["militia_Medium", _militiaMid];

private _militiaSquads = [];
for "_i" from 1 to 5 do {
    _militiaSquads pushBack [
        unit(militia, "SquadLeader"),
        unit(militia, "MachineGunner"),
        unit(militia, "Grenadier"),
        unit(militia, "Rifleman"),
        selectRandom [unit(militia, "Rifleman"), unit(militia, "Marksman")],
        selectRandomWeighted [unit(militia, "Rifleman"), 2, unit(militia, "Marksman"), 1],
        selectRandom [unit(militia, "Rifleman"), unit(militia, "ExplosivesExpert")],
        unit(militia, "LAT"),
        unit(militia, "Medic")
    ];
};
_groups set ["militia_Squads", _militiaSquads];
_groups set ["militia_Squad", _militiaSquads#0];

//police
_groups set ["police", [_groups get "police_Officer", _groups get "police_Grunt"]];

SaveGroupData
};

//------------------|
// Rebel Group data |
//------------------|

//singular units
_groups set ["Petros", unit(militia, "Petros")];
_groups set ["staticCrew", unit(militia, "staticCrew")];
_groups set ["Unarmed", unit(militia, "Unarmed")];
_groups set ["Sniper", unit(militia, "Sniper")];
_groups set ["LAT", unit(militia, "LAT")];
_groups set ["Medic", unit(militia, "Medic")];
_groups set ["MG", unit(militia, "MachineGunner")];
_groups set ["Exp", unit(militia, "ExplosivesExpert")];
_groups set ["GL", unit(militia, "Grenadier")];
_groups set ["Mil", unit(militia, "Rifleman")];
_groups set ["SL", unit(militia, "SquadLeader")];
_groups set ["Eng", unit(militia, "Engineer")];

//groups
_groups set ["medium", [_groups get "SL", _groups get "GL", _groups get "MG", _groups get "Mil"]];
_groups set ["AT", [_groups get "SL", _groups get "MG", _groups get "LAT", _groups get "LAT", _groups get "LAT"]];
_groups set ["squad", [
    _groups get "SL"
    , _groups get "GL"
    , _groups get "Mil"
    , _groups get "MG"
    , _groups get "Mil"
    , _groups get "LAT"
    , _groups get "Mil"
    , _groups get "Medic"
]];
_groups set ["squadEng", [
    _groups get "SL"
    , _groups get "GL"
    , _groups get "Mil"
    , _groups get "MG"
    , _groups get "Exp"
    , _groups get "LAT"
    , _groups get "Eng"
    , _groups get "Medic"
]];
_groups set ["squadSupp", [
    _groups get "SL"
    , _groups get "GL"
    , _groups get "Mil"
    , _groups get "MG"
    , _groups get "LAT"
    , _groups get "Medic"
    , _groups get "staticCrew"
    , _groups get "staticCrew"
]];
_groups set ["groupsSnipers", double( _groups get "Sniper" )];
_groups set ["groupsSentry", [ _groups get "GL", _groups get "Mil"]];

//Tiers (for costs)
_groups set ["Tier1", [
    _groups get "Mil"
    , _groups get "staticCrew"
    , _groups get "MG"
    , _groups get "GL"
    , _groups get "LAT"
]];
_groups set ["Tier2", [
    _groups get "Medic"
    , _groups get "Exp"
    , _groups get "Eng"
]];
_groups set ["Tier3", [
    _groups get "SL"
    , _groups get "Sniper"
]];
_groups set ["soldiers",
    (_groups get "Tier1")
    + (_groups get "Tier2")
    + (_groups get "Tier3")
];

SaveGroupData
