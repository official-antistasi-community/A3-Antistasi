/*
 A lot of this was copied from the setup dialog
*/

#include "..\..\dialogues\ids.inc"
#include "..\..\dialogues\defines.hpp"
#include "..\..\dialogues\textures.inc"
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private _thisFunc = (uiNamespace getVariable "A3A_GUI_fnc_optionsDialog");

params["_mode", "_params"];

// Get display
private _display = findDisplay A3A_IDD_CLIENTOPTIONS;
private _paramsTable = _display displayCtrl A3A_IDC_OPTIONS_TABLE;

switch (_mode) do
{
    case ("loadSettings"): { // On game start, load saved settings and start routines
        private _tableParams = ("true" configClasses (A3A_SETUP_CONFIGFILE/"A3A"/"ClientOptions")) apply {[configName _x, getNumber (_x/"default")]};
        private _toSet = [];
        {
            _x params ["_cfg","_value"];
            private _searchText =  format ["A3A_clientOptions_%1", _cfg];
            private _profileVar = profileNamespace getVariable [_searchText, _value];
            _toSet pushBack [_cfg, _profileVar];
        } forEach _tableParams;
        {
            _x params ["_cfg","_value"];
            private _action = getText (A3A_SETUP_CONFIGFILE/"A3A"/"clientOptions"/_cfg/"stateChange");
            if (_action isEqualTo "") then {continue};
            _value spawn (compile _action);
        } forEach _toSet;
    };			
    case ("requestOpen"):
	{
		if !(isNull findDisplay 46) then {
            findDisplay 46 createDisplay "A3A_ClientOptions";
        } else {
            findDisplay 0 createDisplay "A3A_ClientOptions";
        };
	};
    case ("onLoad"):
    {
        private _allCtrls = [];
        private _rowCount = -1;
        {
            _rowCount = _rowCount + 1;

            private _textCtrl = _display ctrlCreate ["A3A_Text_Small", -1, _paramsTable];
            _textCtrl ctrlSetPosition [0, GRID_H*_rowCount*4, GRID_W*56, GRID_H*4];
            _textCtrl ctrlCommit 0;                 // needed?
            _textCtrl ctrlSetText getText (_x/"title");

            private _tooltip = getText (_x/"tooltip");
            if (_tooltip isNotEqualTo "") then {
                _textCtrl ctrlSetTooltip _tooltip;
            };

            private _texts = getArray (_x/"texts");
            private _vals = getArray (_x/"values");
            if (_texts isEqualTo [""]) then { continue };       // spacer

            private _valsCtrl = _display ctrlCreate ["A3A_ComboBox_Small", _rowCount + A3A_IDC_SETUP_PARAMSROWS, _paramsTable];
            _valsCtrl ctrlSetPosition [GRID_W*65, GRID_H*_rowCount*4, GRID_W*32, GRID_H*4];
            _valsCtrl ctrlCommit 0;
            _valsCtrl setVariable ["config", _x];
            {
				private _index = _valsCtrl lbAdd (_texts#_forEachIndex);
				_valsCtrl lbSetValue [_index, _x];
            } forEach _vals;
            private _default = getNumber (_x/"default");
            _valsCtrl lbSetCurSel (_vals find _default);
            _allCtrls pushBack _valsCtrl;

        } forEach ("true" configClasses (A3A_SETUP_CONFIGFILE/"A3A"/"ClientOptions"));
        _paramsTable setVariable ["allCtrls", _allCtrls];

        ["fillParams"] call _thisFunc;        
    };

	case ("update"): {};			// Don't hide anything here, nothing to do

    case ("fillParams"):
    {
        // Should be array of [varname, value] pairs
        // Written by setupLoadgameTab
		private _savedParams = ["getParams",["player"]] call _thisFunc;
        private _savedParamsHM = createHashMapFromArray _savedParams;

        {
            private _cfg = _x getVariable "config";
            private _vals = getArray (_cfg/"values");
            // clear old saved value if not in config options
            if (lbSize _x > count _vals) then { _x lbDelete (lbSize _x - 1) };

            private _saved = _savedParamsHM getOrDefault [configName _cfg, getNumber (_cfg/"default")];

            if !(_saved in _vals) then {
                // add saved value if not in config options 
                private _index = _x lbAdd str _saved;
                _x lbSetValue [_index, _saved];
                _x lbSetCurSel _index;
            } else {
                _x lbSetCurSel (_vals find _saved);
            };

        } forEach (_paramsTable getVariable "allCtrls");
    };

    case ("getParams"):
    {
        _params params [["_source", "player"]];
        private _params = (_paramsTable getVariable "allCtrls") apply {
            private _cfg = _x getVariable "config";
            private _val = if (_source == "player") then {
                _searchText =  format ["A3A_clientOptions_%1", configName _cfg];
                profileNamespace getVariable [_searchText, getNumber (_cfg/"default")];
            } else {
                _x lbValue lbCurSel _x;
            };
            [configName _cfg, _val];
        };
        if (_source == "player") then {_display setVariable ["savedPlayerParams", _params]};
        _params;
    };
    case ("handleSaveButton"):
	{
        // get param diff and action it if needed
        private _playerParams = _display getVariable "savedPlayerParams";
        private _tableParams = ["getParams",["table"]] call _thisFunc;
        _mismatches = [];
        {
            _x params ["_cfg", "_value"];
            private _tableIndex = _tableParams findIf {_x#0 isEqualTo _cfg};
            if (_tableIndex isEqualTo -1) then {Error_2("Player params not found in table. Cfg %1 Value %2", _cfg, _value); continue};
            private _tableEntry = _tableParams#_tableIndex;
            if ((_tableEntry#1) != _value) then {_mismatches pushBack _tableEntry};
        } forEach _playerParams;
        if (count _mismatches > 0) then {
            {
                _x params ["_cfg","_value"];
                private _searchText =  format ["A3A_clientOptions_%1", _cfg];
                profileNamespace setVariable [_searchText, _value];
            } forEach _tableParams;
            saveprofilenamespace;
            // These are now the values that were changed
            {
                _x params ["_cfg","_value"];
                private _action = getText (A3A_SETUP_CONFIGFILE/"A3A"/"clientOptions"/_cfg/"stateChange");
                if (_action isEqualTo "") then {continue};
                _value spawn (compile _action);
                Info_2("Client setting updated: Name %1 new value %2", _cfg, _value);
            } forEach _mismatches;
        };
        _display closeDisplay 0;
	};
	case ("handleCloseButton"):
	{
		// close dialog
		_display closeDisplay 0;
	};
	case ("onUnload"):
	{
        
	};
};

