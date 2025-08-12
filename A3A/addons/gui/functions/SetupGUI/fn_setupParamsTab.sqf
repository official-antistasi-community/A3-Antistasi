/*

*/

#include "..\..\dialogues\ids.inc"
#include "..\..\dialogues\defines.hpp"
#include "..\..\dialogues\textures.inc"
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params["_mode", "_params"];

Debug("Params dialog called with mode %1", _mode);

// Get display
private _display = findDisplay A3A_IDD_SETUPDIALOG;
private _paramsTable = _display displayCtrl A3A_IDC_SETUP_PARAMSTABLE;

switch (_mode) do
{
    case ("onLoad"):
    {
        private _allCtrls = [];
        private _rowCount = -1;
        {
            _rowCount = _rowCount + 1;

            private _textCtrl = _display ctrlCreate ["A3A_Text_Small", -1, _paramsTable];
            _textCtrl ctrlSetPosition [0, GRID_H*_rowCount*4, GRID_W*112, GRID_H*4];
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
            _valsCtrl ctrlSetPosition [GRID_W*116, GRID_H*_rowCount*4, GRID_W*32, GRID_H*4];
            _valsCtrl ctrlCommit 0;
            _valsCtrl setVariable ["config", _x];
            {
				private _index = _valsCtrl lbAdd (_texts#_forEachIndex);
				_valsCtrl lbSetValue [_index, _x];
            } forEach _vals;
            private _default = getNumber (_x/"default");
            _valsCtrl lbSetCurSel (_vals find _default);
            _allCtrls pushBack _valsCtrl;

        } forEach ("true" configClasses (A3A_SETUP_CONFIGFILE/"A3A"/"Params"));

        _paramsTable setVariable ["allCtrls", _allCtrls];
    };

	case ("update"): {};			// Don't hide anything here, nothing to do

    case ("fillParams"):
    {
        // Should be array of [varname, value] pairs
        // Written by setupLoadgameTab
		private _savedParams = _display getVariable ["savedParams", []];
        private _savedParamsHM = createHashMapFromArray _savedParams;
        //diag_log format ["Saved params %1", _savedParamsHM];

        {
            private _cfg = _x getVariable "config";
            private _vals = getArray (_cfg/"values");
            // clear old saved value if not in config options
            if (lbSize _x > count _vals) then { _x lbDelete (lbSize _x - 1) };

            //diag_log format ["Configname %1, default %2, vals %3", configName _cfg, getNumber (_cfg/"default"), _vals];

            private _saved = _savedParamsHM getOrDefault [configName _cfg, getNumber (_cfg/"default")];
            if (_saved isEqualType true) then { _saved = [0, 1] select _saved };            // bool -> number conversion

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
        private _params = (_paramsTable getVariable "allCtrls") apply {
            private _cfg = _x getVariable "config";
            private _val = _x lbValue lbCurSel _x;
            [configName _cfg, _val];
        };
        _params;
    };
};

