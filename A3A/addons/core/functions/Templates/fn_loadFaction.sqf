/*
 * File: fn_loadFaction.sqf
 * Author: Spoffy
 * Description:
 *    Loads a faction definition file
 * Params:
 *    _filepaths - Single or array of faction definition filepath
 * Returns:
 *    Namespace containing faction information
 * Example Usage:
 */

#include "..\..\script_component.hpp"
params [
	["_filepaths",[],["",[]]]
];

if (_filepaths isEqualType "") then {_filepaths = [_filepaths]};
if (count _filepaths == 0) then {Error("No filepaths provided.")};

private _dataStore = createHashMap;

private _fnc_saveToTemplate = {
	params ["_name", "_data"];

	_dataStore set [_name, _data];
};

private _fnc_getFromTemplate = {
	params ["_name"];

	_dataStore get _name;
};

//Keep track of loadout namespaces so we can delete them when we're done.
private _loadoutNamespaces = [];
private _fnc_createLoadoutData = {
	private _namespace = createHashMap;
	_loadoutNamespaces pushBack _namespace;
	_namespace
};

private _fnc_copyLoadoutData = {
	params ["_sourceNamespace"];
    + _sourceNamespace //hashmaps deepcopy with +
};

private _allLoadouts = createHashMap;
_dataStore set ["loadouts", _allLoadouts];

private _fnc_saveUnitToTemplate = {
	params ["_typeName", "_loadouts", ["_traits", []]];
	private _unitDefinition = [_loadouts, _traits];
	_allLoadouts set [_typeName, _unitDefinition];
};

private _fnc_generateAndSaveUnitToTemplate = {
	params ["_name", "_template", "_loadoutData", ["_traits", []]];
	private _loadouts = [];
	for "_i" from 1 to 5 do {
		_loadouts pushBack ([_template, _loadoutData] call A3A_fnc_loadout_builder);
	};
	[_name, _loadouts, _traits] call _fnc_saveUnitToTemplate;
};

private _fnc_generateAndSaveUnitsToTemplate = {
	params ["_prefix", "_unitTemplates", "_loadoutData"];
	{
		_x params ["_name", "_template", ["_traits", []]];
		private _finalName = format ["%1_%2", _prefix, _name];
		[_finalName, _template, _loadoutData, _traits] call _fnc_generateAndSaveUnitToTemplate;
	} forEach _unitTemplates;
};

private _fnc_saveNames = {
    params ["_names"];
    private _nameConfig = configfile >> "CfgWorlds" >> "GenericNames" >> _names;
    private _firstNames = configProperties [_nameConfig >> "FirstNames"] apply { getText(_x) };
    ["firstNames", _firstNames] call _fnc_saveToTemplate;
    private _lastNames = configProperties [_nameConfig >> "LastNames"] apply { getText(_x) };
    ["lastNames", _lastNames] call _fnc_saveToTemplate;
};

{
	call compile preprocessFileLineNumbers _x;
} forEach _filepaths;


_dataStore
