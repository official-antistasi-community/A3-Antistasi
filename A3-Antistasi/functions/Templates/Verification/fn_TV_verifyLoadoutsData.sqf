/*
Author: Håkon
Description:
    Verifies the loadout data of a faction

Arguments:
0. <HM> Faction data hashmap

Return Value: <HM> Failed Loadouts (key 'valid' contains the faction valid state)

Scope: Server,Server/HC,Clients,Any
Environment: Scheduled/unscheduled/Any
Public: Yes/No
Dependencies:

Example:

License: MIT License
*/
#include "..\..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
params ["_faction", "_templatePath"];
private _failedLoadouts = createHashMap;
private _loadoutsValid = true;

private _standardTraits = createHashMapFromArray [
    ["audibleCoef", 0],
    ["camouflageCoef", 0],
    ["loadCoef", 0],
    ["engineer", true],
    ["explosiveSpecialist", true],
    ["medic", true],
    ["UAVHacker", true]
];

{
    private _loadoutName = _x;
    _y params ["_loadouts", ["_traits", []]];

    //Validate loadouts
    {
        private _loadoutValid = _x call A3A_fnc_TV_verifyLoadout;
        if !(_loadoutValid#0) then {
            _failedLoadouts set [_loadoutName, _loadoutValid#1];
            _loadoutsValid = false
        };
    } forEach _loadouts;

    {
        _x params ["_trait", "_value", ["_custom", false]];
        //validate trait
        private _passed = if (_custom) then {//custom trait; must have a value of type bool
            _value isEqualType true
        } else { //standard traits; in the list of standard traits and correct value data type
            _trait in _standardTraits
            && {_value isEqualType (_standardTraits get _trait)}
        };

        //handle failed test
        if !(_passed) then {
            private _failText = if (_custom) then {"Invalid value for custom trait: "+_trait+" | Custom traits must have a value of type bool"} else {
                if (_trait in _standardTraits) then {
                    "Invalid value for trait: "+_trait+" | Value: "+_value+" | Expected type: "+typeName (_standardTraits get _trait)
                } else {
                    "Typo in trait: "+_trait+" | Standard traits must be on of " + ((keys _standardTraits) joinString ", ")
                };
            };
            if (_loadoutName in _failedLoadouts) then { (_failedLoadouts get _loadoutName) pushBack _failText } else { _failedLoadouts set [_loadoutName, [_failText]] };
            _loadoutsValid = false;
        };
    } forEach _traits;
} forEach (_faction get "loadouts");

if (count _failedLoadouts isNotEqualTo 0) then {
    private _failedText = _templatePath+" Loadout validation failed for loadouts:"+endl + ((_failedLoadouts apply {_x +": "+endl + (_y joinString endl) + endl}) joinString endl);
    Error(_failedText);//ToDo split this in to 1k messages, ending before a new loadout
};
_loadoutsValid
