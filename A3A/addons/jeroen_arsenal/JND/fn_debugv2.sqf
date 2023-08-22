#include "..\script_component.hpp"
//Author: Jeroen Not

if(isnil "CBA_fnc_waitUntilAndExecute")exitWith{};

fnc_debugv2_overwrite = {
	_display = findDisplay 49;

	_ctrl_debug = _display displayCtrl 13184;
	_pos_debug = ctrlposition _ctrl_debug;// [x, y, w, h]
	_pos_debug set [2, 1-safeZoneX- _pos_debug#0-0.03];
	_ctrl_debug ctrlSetPosition _pos_debug;
	_ctrl_debug ctrlCommit 0;


	_ctrl_expressionBackground = _display displayCtrl 11885;
	_pos_expressionBackground = ctrlposition _ctrl_expressionBackground;// [x, y, w, h]
	_pos_expressionBackground set [2,_pos_debug#2];
	_ctrl_expressionBackground ctrlSetPosition _pos_expressionBackground;
	_ctrl_expressionBackground ctrlCommit 0;

	_ctrl_expression = _display displayCtrl 12284;
	_pos_expression = ctrlposition _ctrl_expression;// [x, y, w, h]
	_pos_expression set [2,_pos_debug#2 - (_pos_expression#0 *2)];
	_ctrl_expression ctrlSetPosition _pos_expression;
	_ctrl_expression ctrlCommit 0;

	_ctrl_expressionText = _display displayCtrl 11892;
	_pos_expressionText = ctrlposition _ctrl_expressionText;// [x, y, w, h]
	_pos_expressionText set [2,_pos_expression#2];
	_ctrl_expressionText ctrlSetPosition _pos_expressionText;
	_ctrl_expressionText ctrlCommit 0;

	_ctrl_expressionOutputBackground = _display displayCtrl 13191;
	_pos_expressionOutputBackground = ctrlposition _ctrl_expressionOutputBackground;
	_pos_expressionOutputBackground set [2,_pos_expression#2];
	_ctrl_expressionOutputBackground ctrlSetPosition _pos_expressionOutputBackground;
	_ctrl_expressionOutputBackground ctrlCommit 0;

	_ctrl_expressionOutput = _display displayCtrl 13190;
	_ctrl_expressionOutput ctrlSetPosition _pos_expressionOutputBackground;
	_ctrl_expressionOutput ctrlCommit 0;

	_ctrl_title = _display displayCtrl 11884;
	_pos_title = ctrlposition _ctrl_title;
	_pos_title set [2,_pos_expressionBackground#2];
	_ctrl_title ctrlSetPosition _pos_title;
	_ctrl_title ctrlCommit 0;
	_ctrl_title ctrlsettext localize "STR_A3A_JND_title";

	_ctrl_links = _display displayCtrl 11891;
	_pos_links = ctrlposition _ctrl_links;
	_pos_links set [2,_pos_title#2];
	_ctrl_links ctrlSetPosition _pos_links;
	_ctrl_links ctrlCommit 0;

	//update text because we have change the size and it doesnt update automaticly
	_ctrl_expression ctrlsettext ctrltext _ctrl_expression;



	_ctrl_watchBackground = _display displayCtrl 11886;
	_pos_watchBackground = ctrlposition _ctrl_watchBackground;

	_ctrl_localButton = _display displayCtrl 13484;
	_pos_localButton = ctrlposition _ctrl_localButton; // [x, y, w, h]
	_button_hieght = _pos_localButton#3;

	_ctrl_nextButton = _display displayCtrl 90111;
	_pos_nextButton = ctrlposition _ctrl_nextButton;


	_spacingY =  (_pos_localButton#1 - _pos_nextButton#1)-_button_hieght ;
	_posXFINAL = _pos_watchBackground #0 + _pos_watchBackground #2  + _spacingY;
	_posYFINAL = _pos_expressionBackground #1 + _pos_expressionBackground #3 + _spacingY;

	_xSpaceButtons = (_pos_expressionBackground#0+_pos_expressionBackground#2-_posXFINAL);

	uiNameSpace setVariable ["jn_debugConsole_expression",_ctrl_expression];
	uiNameSpace setVariable ["jn_debugConsole_buttons",[]];

	_color= getarray(configfile >> "RscDisplayDebugPublic" >> "Controls" >> "DebugConsole" >> "controls" >> "ButtonExecuteLocal" >> "colorBackground");

	_button_length = 0.06;
	_button_lengthRun = _xSpaceButtons - (3*_button_length) - (3*_spacingY);


	private _array = [
			[
				"...",
				_spacingY,
				_button_lengthRun,
				{
					params ["_index"];
					_input = profilenamespace getVariable [format["jn_debugConsole_%1",_index],""];

					_length = count _input;
					_start = -1;
					while {_start = _input find "/*"; _start > -1} do {
						_end = _input find "*/";
						if(_end == -1)exitWith{};
						_input = (_input select [0,_start]) + (_input select [_end+2,_length]);

					};


					private _strings = [];
					private _start = -1;

					while {_start = _input find "//"; _start > -1} do
					{
						_input select [0, _start] call
						{
							private _badQuotes = _this call
							{
								private _qtsGood = [];
								private _qtsInfo = [];
								private _arr = toArray _this;

								{
									_qtsGood pushBack ((count _arr - count (_arr - [_x])) % 2 == 0);
									_qtsInfo pushBack [_this find toString [_x], _x];
								}
								forEach [34, 39];

								if (_qtsGood isEqualTo [true, true]) exitWith {0};

								_qtsInfo sort true;
								_qtsInfo select 0 select 1
							};

							if (_badQuotes > 0) exitWith
							{
								_last = _input select [_start] find toString [_badQuotes];

								if (_last < 0) exitWith
								{
									_strings = [_input];
									_input = "";
								};

								_last = _start + _last + 1;
								_strings pushBack (_input select [0, _last]);

								_input = _input select [_last];
							};

							_strings pushBack _this;
							_input = _input select [_start];

							private _end = _input find toString [10];

							if (_end < 0) exitWith {_input = ""};

							_input = _input select [_end + 1];
						};
					};

					_input = (_strings joinString "") + _input;
                    //logging of executed code for security
                    call {
                        if (A3A_logDebugConsole isEqualTo -1) exitWith {};
                        if (
                            (A3A_logDebugConsole isEqualTo 1) &&
                            {(getPlayerUID player) in (getArray (missionConfigFile/"enableDebugConsole"))}
                        ) exitWith {};
                        ServerInfo_3("Saved Debug line executed by %1[%2]"+endl+"=============="+endl+"%3"+endl+"==============",name player, clientOwner, _input);
                    };
					call compile _input;
				}
			],[
				localize "STR_A3A_JND_button_load",
				_spacingY,
				_button_length,
				{
					params ["_index"];
					_text = profilenamespace getVariable [format["jn_debugConsole_%1",_index],""];
					(UiNameSpace getVariable "jn_debugConsole_expression") ctrlsettext _text;
				}
			],[
				localize "STR_A3A_JND_button_save",
				_spacingY,
				_button_length,
				{
					params ["_index"];

					_text = ctrltext (UiNameSpace getVariable "jn_debugConsole_expression");
					_name = "no name";
					if(_text find "//" == 0)then{
						_enter = _text find (toString [10]);
						if(_enter >0)then{
							_name = _text select [2, _enter-2];
						};
					};
					diag_log ["Save",_text];

					uiNameSpace setVariable ["jn_debugConsole_index_saved",_index];
					uiNameSpace setVariable [format ["jn_debugConsole_%1",_index],profilenamespace getVariable (format ["jn_debugConsole_%1",_index])];
					uiNameSpace setVariable [format ["jn_debugConsole_%1_name",_index],profilenamespace getVariable (format ["jn_debugConsole_%1_name",_index])];

					profilenamespace setVariable [format ["jn_debugConsole_%1",_index],_text];
					profilenamespace setVariable [format ["jn_debugConsole_%1_name",_index],_name];

					((UiNameSpace getVariable "jn_debugConsole_buttons") # _index) ctrlSetText _name;
				}
			],[
				localize "STR_A3A_JND_button_del",
				_spacingY*10,
				_button_length,
				{
					params ["_index"];

					uiNameSpace setVariable ["jn_debugConsole_index_saved",_index];
					uiNameSpace setVariable [format ["jn_debugConsole_%1",_index],profilenamespace getVariable (format ["jn_debugConsole_%1",_index])];
					uiNameSpace setVariable [format ["jn_debugConsole_%1_name",_index],profilenamespace getVariable (format ["jn_debugConsole_%1_name",_index])];


					profilenamespace setVariable [format ["jn_debugConsole_%1",_index],nil];
					profilenamespace setVariable [format ["jn_debugConsole_%1_name",_index],nil];
					((UiNameSpace getVariable "jn_debugConsole_buttons") # _index) ctrlSetText "...";
				}
			]
	];

	_posX = 0;
	_posY = _posYFINAL;
	for "_index" from 0 to 9 do{
		_posX = _posXFINAL;

		_nameP = profilenamespace getVariable [format['jn_debugConsole_%1_name',_index],""];
		{
			_x params ["_name","_button_spacing","_button_width","_code"];

			_ctrl = _display ctrlCreate ["RscButtonMenu", -1,_ctrl_debug];
			_ctrl ctrlSetPosition [_posX,_posY,_button_width,_button_hieght];

			_ctrl ctrlCommit 0;

			if(_foreachIndex == 0)then{
				if(_nameP != "")then{_name = _nameP};
				_buttonArray = UiNameSpace getVariable ["jn_debugConsole_buttons",[]];
				_buttonArray pushBack _ctrl;
			};

			_ctrl ctrlSetText _name;
			_ctrl ctrlAddEventHandler ["ButtonClick", format["0 spawn { isNil {%1 call %2}};",_index,_code]];


			_posX = _posX + _button_width + _spacingY;
		}forEach _array;
		_posY = _posY + _spacingY + _button_hieght;
	};

	_posY = _posY +_spacingY + _spacingY;
	_ctrl = _display ctrlCreate ["RscButtonMenu", -1,_ctrl_debug];
	_ctrl ctrlSetPosition [_posXFINAL,_posY,(_posX-_posXFINAL- _spacingY*2)/2,_button_hieght];

	_ctrl ctrlCommit 0;
	_ctrl ctrlSetText "-- cursorObject config file --";
	_ctrl ctrlAddEventHandler ["ButtonClick", {
		0 spawn {
			profileNamespace setVariable ["bis_fnc_configviewer_selected", typeOf cursorObject];
			profileNamespace setVariable ["bis_fnc_configviewer_path", ["configfile","CfgVehicles",typeOf cursorObject]];
			[] call BIS_fnc_configViewer;
		};
	}];


	_ctrl = _display ctrlCreate ["RscButtonMenu", -1,_ctrl_debug];
	_ctrl ctrlSetPosition [_posXFINAL + (_posX-_posXFINAL- _spacingY*2)/2+_spacingY,_posY,(_posX-_posXFINAL- _spacingY*2)/2,_button_hieght];

	_ctrl ctrlCommit 0;
	_ctrl ctrlSetText localize "STR_A3A_JND_button_undo";
	_ctrl ctrlAddEventHandler ["ButtonClick", {

		_index = uiNameSpace getVariable ["jn_debugConsole_index_saved",-1];

		if(_index == -1)exitWith{};

		_text = uiNameSpace getVariable (format ["jn_debugConsole_%1",_index]);
		_name = uiNameSpace getVariable (format ["jn_debugConsole_%1_name",_index]);

		profilenamespace setVariable [format ["jn_debugConsole_%1",_index],_text];
		profilenamespace setVariable [format ["jn_debugConsole_%1_name",_index],_name];

		((UiNameSpace getVariable "jn_debugConsole_buttons") # _index) ctrlSetText _name;
	}];

    //logging of executed code for security
    {
        private _ctrl = _display displayCtrl (_x#0);
        _ctrl setVariable ["JN_Debug_buttonName", _x#1];
        _ctrl ctrlAddEventHandler ["ButtonClick", {
            if (A3A_logDebugConsole isEqualTo -1) exitWith {};
            if (
                (A3A_logDebugConsole isEqualTo 1) &&
                {(getPlayerUID player) in (getArray (missionConfigFile/"enableDebugConsole"))}
            ) exitWith {};
            params ["_ctrl"];
            private _btnName = _ctrl getVariable ["JN_Debug_buttonName", "[ERROR NONAME]"];
            private _code = ctrlText (findDisplay 49 displayCtrl 12284);
            ServerInfo_4("Debug line executed as %1 by %2[%3]"+endl+"=============="+endl+"%4"+endl+"==============",_btnName,name player, getPlayerUID player, _code);
        }];
    } forEach [
        [13285, "Global Exec"],
        [13286, "Server Exec"],
        [13484, "Local Exec"],
        [13284, "Performance test"]
    ];

};


if (hasInterface) then {
	[] spawn {

		waitUntil {!isNull findDisplay 46};

		(findDisplay 46) displayAddEventHandler ["KeyDown", {
			params ["_display", "_key", "_shift", "_ctrl", "_alt"];
			if(_key == 1)then{

				[
					{!isnull(findDisplay 49)},
					{
						call fnc_debugv2_overwrite;
					}
				] call CBA_fnc_waitUntilAndExecute;
			};
		}];

	};
};
